using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AISTaskDAL.ViewModel
{
    public class ItemStorPackge
    {
        public Item Product { set; get; }
        public List<AllStors> Stors { set; get; }
        public List<AllPackages> Packages { set; get;}
         
    }
}
