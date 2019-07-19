using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Movie_BAL
{
    class Factory
    {
        public static IBAL IObj;
        public static IBAL setDAL()
        {
            //ConfigurationManager.AppSettings["BAL_SQL"]
            IObj = new BAL();
            return IObj;
        }
    }
}
