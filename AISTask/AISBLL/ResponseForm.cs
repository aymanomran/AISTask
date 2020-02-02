using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AISBLL
{
   public class ResponseForm
    {
        public int code { set; get; }
        public string ArabicMessage { set; get; }
        public string EnglishMessage { set; get; }
        public object Body { set; get; }
    }
}
