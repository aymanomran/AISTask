using AISTaskDAL;
using AISBLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Results;
using System.Web.Mvc;

namespace ServiceLayer.Controllers
{
    public class ItemController : ApiController
    {
        ItemsOperation BLL = new ItemsOperation();

        [System.Web.Http.HttpGet, System.Web.Http.HttpPost]
        [System.Web.Http.Route("api/GetItem/{ID}")]

        public ResponseForm Item(string ID)
        {
            ResponseForm Response = BLL.GetItemByID(ID);
            return Response;
        }
        [System.Web.Mvc.HttpPost]
        [System.Web.Http.Route("api/Inserttem")]
        public ResponseForm Item([FromBody]Item _item, [FromBody]List<Package> PackageList = null)
        {
            ResponseForm Response = BLL.AddNewItem(_item, PackageList);
            return Response;
        }

        [System.Web.Mvc.HttpPut]
        [System.Web.Http.Route("api/UpdateItem/{OldItemID}")]
        public ResponseForm Item([FromBody]Item NewItem, string OldItemID, [FromBody]List<Package> PackageList = null)
        {
            ResponseForm Response = BLL.UpdateITem(NewItem, OldItemID, PackageList);
            return Response;
        }
        [System.Web.Mvc.HttpDelete]
        [System.Web.Http.Route("api/DeleteItem/{ID}")]
        public ResponseForm Delete(string ID)
        {
            ResponseForm Response = BLL.DeleteItem(ID);
            return Response;
        }

    }
}
