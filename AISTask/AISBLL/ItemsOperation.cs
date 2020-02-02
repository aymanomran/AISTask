using AISTaskDAL;
using AISTaskDAL.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AISBLL
{
    public class ItemsOperation
    {
        EvaluationTaskDBEntities db = new EvaluationTaskDBEntities();
        public ResponseForm FormResponse(int code, string ArabicMessage, string EnglishMessage, object Body) {
           
            ResponseForm Result = new ResponseForm{ code = code, ArabicMessage = ArabicMessage,
                EnglishMessage = EnglishMessage, Body =Body};
            return Result;
        }


        //Retreive ITem Data By ID
        public ResponseForm GetItemByID(string ID)
        {
            ResponseForm Response;
            if (string.IsNullOrEmpty(ID))//ID Must Be Not Nul Or Empty
            {
                return FormResponse(400, "من فضلك ادخل كود الصنف", "Please Enter Item ID",
                       new GetItemByID_Result());

            }
            try
            {
                var _Item = db.GetItemByID(ID).FirstOrDefault();
                if (_Item == null)
                {
                  return  Response = FormResponse(404, "هذا الصنف غير موجود", "Not Exist",
                        new GetItemByID_Result());

                }
                else
                {
                   return FormResponse(200, "استعلام ناجح", "Successful Query",
                                           _Item);
                }

            }
            catch (Exception ex)
            {
            return  FormResponse(500, "حدث خطأ الرجاء المحاولة فى وقت لاحق", "Internal Server Error",
                                                          new GetItemByID_Result());
            }

        }

        // Validate Item Data
        public bool ValidateITemData(Item _item) {
            try
            {
                if (String.IsNullOrEmpty(_item.ID) || _item.ID.ToString().Length > 50
                    || String.IsNullOrEmpty(_item.Name) || _item.SalePrice<0 || _item.PurchasePrice < 0) {
                    return false;
                }
                return true;
            }
            catch (Exception ex) {
                return false;
            }
        }

        //Insert New Item
        public ResponseForm AddNewItem(Item NewItem,List<Package>PackageList=null)
        {
            ResponseForm Response;
            try
            {
                //Validate ITem Request Data
                if (ValidateITemData(NewItem)==false)
                {
                    return Response = FormResponse(400, "الرجاء مراجعة صحة البيانات المدخلة",
                        "Bad Request",
                       new Item());
                }
                //Check If The Item Is Already Exist
               if( GetItemByID(NewItem.ID).code != 404)
                {
                    return Response = FormResponse(400, "يوجد صنف لديه نفس الكود",
                       "This ID Is Alreay In Use",new Item());
                }

                //Add New Item Using Stored Preocedure
                db.MasterInsertUpdateDelete(NewItem.ID, NewItem.Name, NewItem.Qty, NewItem.SalePrice,
                    NewItem.PurchasePrice, NewItem.StorID,Convert.ToInt32(NewItem.UnitType), "Insert", "");
                
                //If The UnitTyp=True Then It Has A Package Type So Insert Item Packages Type 
                if (PackageList != null ) {
                    foreach (var row in PackageList) {
                        db.InsertIntoItemPackage(NewItem.ID, row.ID);
                    }
                }
                //Log
                LogInsidDataBase(1, "New Item Added ID=" + NewItem.ID, DateTime.Now);

            
                db.SaveChanges();//Save To Data Base
                
                
                return    Response = FormResponse(200, "تمت الاضافة بنجاح", "Added Successfully",new Item());
                
            }
            catch (Exception ex) {
                return Response = FormResponse(500, "حدث خطأ الرجاء المحاولة فى وقت لاحق", "Internal Server Error",new Item());
            }
        }

        //Update Item
        public ResponseForm UpdateITem(Item NewITem,string OldID,List<Package> ItemPackages)
        {
            try { 
            if (ValidateITemData(NewITem) == false)
            {
                return  FormResponse(400, "الرجاء مراجعة صحة البيانات المدخلة",
                  "Bad Request",
                 new Item());
            }
            //Check If The Item Is Already Exist
            if (GetItemByID(NewITem.ID).code == 200 && NewITem.ID!=OldID)
            {
                return  FormResponse(400, "يوجد صنف لديه نفس الكود",
                   "This ID Is Alreay In Use", new Item());
            }

            Item _item =(Item) GetItemByID(OldID).Body;

            _item.Name = NewITem.Name;
            _item.SalePrice = NewITem.SalePrice;
            _item.PurchasePrice = NewITem.PurchasePrice;
            _item.Qty = NewITem.Qty;
            _item.StorID = NewITem.StorID;
            _item.UnitType = _item.UnitType;
            if (_item.UnitType == true)
            {
                List<ItemPackage> ItemPackageList = db.ItemPackage.Where(o=>o.ItemID==OldID).ToList();
                if (ItemPackageList.Count > 0)
                    db.ItemPackage.RemoveRange(ItemPackageList);
                if (ItemPackages != null)
                {
                    foreach (var row in ItemPackages)
                    {
                        db.InsertIntoItemPackage(NewITem.ID, row.ID);
                    }
                }     

            }
                LogInsidDataBase(1, "Item Added ID=" + _item.ID, DateTime.Now);

             
                db.SaveChanges();

            return FormResponse(200, "تمت التعديل بنجاح", "updated Successfully", NewITem);
            }
            catch (Exception ex) {
                return FormResponse(500, "حدث خطأ الرجاء المحاولة فى وقت لاحق", "Internal Server Error", new Item());
            }

        }

        public void LogInsidDataBase(int UserID,string Description,DateTime date)
        {
            db.LogTable.Add(new LogTable()
            {
                UserID = UserID,
                Description = Description,
                Date = date,
            });
        }
        public ResponseForm DeleteItem(string ID)
        {
            try
            {

                //Check If The Item Is Already Exist
                if (GetItemByID(ID).code == 200 )
                {
                    //Delete
                    db.MasterInsertUpdateDelete(ID, "", 0, 0, 0, 0, 0, "Delete", "0");
                    //Log 
                    LogInsidDataBase(1, "Item Deleted ID=" + ID, DateTime.Now);
                    db.SaveChanges();
                    return FormResponse(200, "تم الحذف بنجاح", "Deleted Successfully",new Item());

                }
                else
                {
                    return FormResponse(404, "هذا الصنف غير موجود", "Not Exist",new Item() );

                }


            }

            catch (Exception ex) {
                return FormResponse(500, "حدث خطأ الرجاء المحاولة فى وقت لاحق", "Internal Server Error", new Item());

            }


        }

        public ItemStorPackge _ItemStorePackage()
        {
            return new ItemStorPackge() { Packages = db.AllPackages.ToList(), Stors = db.AllStors.ToList() }; 

        } 
    }
}
