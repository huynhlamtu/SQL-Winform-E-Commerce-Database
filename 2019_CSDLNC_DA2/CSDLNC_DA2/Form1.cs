using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace CSDLNC_DA2
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Button3_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void Button2_Click(object sender, EventArgs e)
        {
            ChonMuaHang form = new ChonMuaHang();
            form.Show();
        }

        private void Button1_Click(object sender, EventArgs e)
        {
            TheoDoiDonHang form = new TheoDoiDonHang();
            form.Show();
        }
    }
}
