using AISBLL;
using AISTaskDAL.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
namespace AISTask.Controllers
{
    public class HomeController : Controller
    {
        ItemsOperation BLL = new ItemsOperation();

        // GET: Home
        public ActionResult Index()
        {
            ItemStorPackge ItemStorPackageViewModel=BLL._ItemStorePackage();
            return View(ItemStorPackageViewModel);
        }
    }
}