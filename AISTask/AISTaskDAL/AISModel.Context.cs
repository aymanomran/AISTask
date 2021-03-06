﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace AISTaskDAL
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class EvaluationTaskDBEntities : DbContext
    {
        public EvaluationTaskDBEntities()
            : base("name=EvaluationTaskDBEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Item> Item { get; set; }
        public virtual DbSet<ItemPackage> ItemPackage { get; set; }
        public virtual DbSet<LogTable> LogTable { get; set; }
        public virtual DbSet<Package> Package { get; set; }
        public virtual DbSet<Stor> Stor { get; set; }
        public virtual DbSet<sysdiagrams> sysdiagrams { get; set; }
        public virtual DbSet<UserT> UserT { get; set; }
        public virtual DbSet<AllItemsData> AllItemsData { get; set; }
        public virtual DbSet<AllLogs> AllLogs { get; set; }
        public virtual DbSet<AllPackages> AllPackages { get; set; }
        public virtual DbSet<AllStors> AllStors { get; set; }
    
        public virtual int AddNewItem(string iD, string itemName, Nullable<decimal> qty, Nullable<decimal> salePrice, Nullable<decimal> purchasePrice, Nullable<int> storID, Nullable<int> unitType)
        {
            var iDParameter = iD != null ?
                new ObjectParameter("ID", iD) :
                new ObjectParameter("ID", typeof(string));
    
            var itemNameParameter = itemName != null ?
                new ObjectParameter("ItemName", itemName) :
                new ObjectParameter("ItemName", typeof(string));
    
            var qtyParameter = qty.HasValue ?
                new ObjectParameter("Qty", qty) :
                new ObjectParameter("Qty", typeof(decimal));
    
            var salePriceParameter = salePrice.HasValue ?
                new ObjectParameter("SalePrice", salePrice) :
                new ObjectParameter("SalePrice", typeof(decimal));
    
            var purchasePriceParameter = purchasePrice.HasValue ?
                new ObjectParameter("PurchasePrice", purchasePrice) :
                new ObjectParameter("PurchasePrice", typeof(decimal));
    
            var storIDParameter = storID.HasValue ?
                new ObjectParameter("StorID", storID) :
                new ObjectParameter("StorID", typeof(int));
    
            var unitTypeParameter = unitType.HasValue ?
                new ObjectParameter("UnitType", unitType) :
                new ObjectParameter("UnitType", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("AddNewItem", iDParameter, itemNameParameter, qtyParameter, salePriceParameter, purchasePriceParameter, storIDParameter, unitTypeParameter);
        }
    
        public virtual ObjectResult<GetItemByID_Result> GetItemByID(string itemID)
        {
            var itemIDParameter = itemID != null ?
                new ObjectParameter("ItemID", itemID) :
                new ObjectParameter("ItemID", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<GetItemByID_Result>("GetItemByID", itemIDParameter);
        }
    
        public virtual ObjectResult<MasterInsertUpdateDelete_Result> MasterInsertUpdateDelete(string iD, string itemName, Nullable<decimal> qty, Nullable<decimal> salePrice, Nullable<decimal> purchasePrice, Nullable<int> storID, Nullable<int> unitType, string statementType, string oldID)
        {
            var iDParameter = iD != null ?
                new ObjectParameter("ID", iD) :
                new ObjectParameter("ID", typeof(string));
    
            var itemNameParameter = itemName != null ?
                new ObjectParameter("ItemName", itemName) :
                new ObjectParameter("ItemName", typeof(string));
    
            var qtyParameter = qty.HasValue ?
                new ObjectParameter("Qty", qty) :
                new ObjectParameter("Qty", typeof(decimal));
    
            var salePriceParameter = salePrice.HasValue ?
                new ObjectParameter("SalePrice", salePrice) :
                new ObjectParameter("SalePrice", typeof(decimal));
    
            var purchasePriceParameter = purchasePrice.HasValue ?
                new ObjectParameter("PurchasePrice", purchasePrice) :
                new ObjectParameter("PurchasePrice", typeof(decimal));
    
            var storIDParameter = storID.HasValue ?
                new ObjectParameter("StorID", storID) :
                new ObjectParameter("StorID", typeof(int));
    
            var unitTypeParameter = unitType.HasValue ?
                new ObjectParameter("UnitType", unitType) :
                new ObjectParameter("UnitType", typeof(int));
    
            var statementTypeParameter = statementType != null ?
                new ObjectParameter("StatementType", statementType) :
                new ObjectParameter("StatementType", typeof(string));
    
            var oldIDParameter = oldID != null ?
                new ObjectParameter("OldID", oldID) :
                new ObjectParameter("OldID", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<MasterInsertUpdateDelete_Result>("MasterInsertUpdateDelete", iDParameter, itemNameParameter, qtyParameter, salePriceParameter, purchasePriceParameter, storIDParameter, unitTypeParameter, statementTypeParameter, oldIDParameter);
        }
    
        public virtual int sp_alterdiagram(string diagramname, Nullable<int> owner_id, Nullable<int> version, byte[] definition)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            var versionParameter = version.HasValue ?
                new ObjectParameter("version", version) :
                new ObjectParameter("version", typeof(int));
    
            var definitionParameter = definition != null ?
                new ObjectParameter("definition", definition) :
                new ObjectParameter("definition", typeof(byte[]));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_alterdiagram", diagramnameParameter, owner_idParameter, versionParameter, definitionParameter);
        }
    
        public virtual int sp_creatediagram(string diagramname, Nullable<int> owner_id, Nullable<int> version, byte[] definition)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            var versionParameter = version.HasValue ?
                new ObjectParameter("version", version) :
                new ObjectParameter("version", typeof(int));
    
            var definitionParameter = definition != null ?
                new ObjectParameter("definition", definition) :
                new ObjectParameter("definition", typeof(byte[]));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_creatediagram", diagramnameParameter, owner_idParameter, versionParameter, definitionParameter);
        }
    
        public virtual int sp_dropdiagram(string diagramname, Nullable<int> owner_id)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_dropdiagram", diagramnameParameter, owner_idParameter);
        }
    
        public virtual ObjectResult<sp_helpdiagramdefinition_Result> sp_helpdiagramdefinition(string diagramname, Nullable<int> owner_id)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_helpdiagramdefinition_Result>("sp_helpdiagramdefinition", diagramnameParameter, owner_idParameter);
        }
    
        public virtual ObjectResult<sp_helpdiagrams_Result> sp_helpdiagrams(string diagramname, Nullable<int> owner_id)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_helpdiagrams_Result>("sp_helpdiagrams", diagramnameParameter, owner_idParameter);
        }
    
        public virtual int sp_renamediagram(string diagramname, Nullable<int> owner_id, string new_diagramname)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            var new_diagramnameParameter = new_diagramname != null ?
                new ObjectParameter("new_diagramname", new_diagramname) :
                new ObjectParameter("new_diagramname", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_renamediagram", diagramnameParameter, owner_idParameter, new_diagramnameParameter);
        }
    
        public virtual int sp_upgraddiagrams()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_upgraddiagrams");
        }
    
        public virtual ObjectResult<GetUserByID_Result> GetUserByID(Nullable<int> userID)
        {
            var userIDParameter = userID.HasValue ?
                new ObjectParameter("UserID", userID) :
                new ObjectParameter("UserID", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<GetUserByID_Result>("GetUserByID", userIDParameter);
        }
    
        public virtual int InsertIntoItemPackage(string itemID, Nullable<int> packageID)
        {
            var itemIDParameter = itemID != null ?
                new ObjectParameter("ItemID", itemID) :
                new ObjectParameter("ItemID", typeof(string));
    
            var packageIDParameter = packageID.HasValue ?
                new ObjectParameter("PackageID", packageID) :
                new ObjectParameter("PackageID", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("InsertIntoItemPackage", itemIDParameter, packageIDParameter);
        }
    }
}
