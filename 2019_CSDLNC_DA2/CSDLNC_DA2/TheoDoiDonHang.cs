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
    public partial class TheoDoiDonHang : Form
    {
        SqlConnection sqlCon;
        public TheoDoiDonHang()
        {
            InitializeComponent();
        }

        public void HienThi()
        {
            string sql = "select * from MatHang";
            SqlCommand commandsql = new SqlCommand(sql, sqlCon); //thực thi
            SqlDataAdapter com = new SqlDataAdapter(commandsql);// vận chuyển dữ liệu
            DataTable table = new DataTable(); //tạo một bảng ảo trong hệ thống
            com.Fill(table); //đổ dữ liệu vào bảng ảo
            dataGridView1.DataSource = table; //đổ vào DataGridView1
        }

        private void TheoDoiDonHang_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'qLY_TRANGBANHANGDataSet2.TrangThaiDonHang' table. You can move, or remove it, as needed.
            this.trangThaiDonHangTableAdapter.Fill(this.qLY_TRANGBANHANGDataSet2.TrangThaiDonHang);
            sqlCon = new SqlConnection(@"Data Source=DESKTOP-ANBJ0CC\CHANEST;Initial Catalog=QLY_TRANGBANHANG;Integrated Security=True");
            sqlCon.Open();
            HienThi();
        }

        private void Button2_Click(object sender, EventArgs e)
        {
            ChonMuaHang form = new ChonMuaHang();
            form.Show();
        }

        private void Thoat_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
