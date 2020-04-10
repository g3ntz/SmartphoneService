using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace Smartphone_Service.Classes
{
    public class ChkAndRb
    {
        public CheckBox chk;
        public RadioButton repaired;
        public RadioButton exchanged;

        public ChkAndRb(CheckBox chk,RadioButton repaired,RadioButton exchanged)
        {
            this.chk = chk;
            this.repaired = repaired;
            this.exchanged = exchanged;
        }

        public bool IsRepair()
        {
            if(repaired.Checked)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}