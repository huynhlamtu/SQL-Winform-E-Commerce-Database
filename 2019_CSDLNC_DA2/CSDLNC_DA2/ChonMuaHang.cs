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
    public partial class ChonMuaHang : Form
    {
        SqlConnection sqlCon;
        public ChonMuaHang()
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

        private void ChonMuaHang_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'iSaleManagementDataSet1.n_SalesOrderHeader' table. You can move, or remove it, as needed.
            this.matHangTableAdapter.Fill(this.qLY_TRANGBANHANGDataSet1.MatHang);
            sqlCon = new SqlConnection(@"Data Source=DESKTOP-ANBJ0CC\CHANEST;Initial Catalog=QLY_TRANGBANHANG;Integrated Security=True");
            sqlCon.Open();
            HienThi();
        }

        private void ChonMuaHang_FormClosing(object sender, FormClosingEventArgs e)
        {
            sqlCon.Close();
        }

        private void Button1_Click(object sender, EventArgs e)
        {
            //Đếm số hàng trong bảng PhieuDatHang TRƯỚC thi thực thi Proc thêm SalesOrderHeader
            //bằng function Count_PhieuDatHang_Row đã tạo sẵn trong My SQL
            SqlCommand cmd1 = new SqlCommand();
            cmd1.Connection = sqlCon;
            cmd1.CommandType = CommandType.Text;
            string col_numb_before;
            cmd1.CommandText = "select [dbo].[Count_PhieuDatHang_MaxKey]()";
            col_numb_before = cmd1.ExecuteScalar().ToString();
            int x;
            Int32.TryParse(col_numb_before, out x);

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = sqlCon;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "TaoPhieuDat";

            cmd.Parameters.AddWithValue("@MAKH", SqlDbType.Int).Value = "500001";
            cmd.Parameters.AddWithValue("@NguoiNhan", SqlDbType.TinyInt).Value = textBox7.Text.Trim();
            cmd.Parameters.AddWithValue("@SDT", SqlDbType.DateTime).Value = textBox6.Text.Trim();
            cmd.Parameters.AddWithValue("@DiaChi", SqlDbType.DateTime).Value = textBox5.Text.Trim();
            cmd.ExecuteNonQuery();

            //Đếm số hàng trong bảng PhieuDatHang SAU thi thực thi Proc thêm SalesOrderHeader
            //bằng function Count_PhieuDatHang_Row đã tạo sẵn trong My SQL
            SqlCommand cmd2 = new SqlCommand();
            cmd2.Connection = sqlCon;
            string Row_numb_after;
            cmd2.CommandType = CommandType.Text;
            cmd2.CommandText = "select [dbo].[Count_PhieuDatHang_MaxKey]()";
            Row_numb_after = cmd2.ExecuteScalar().ToString();
            int y;
            Int32.TryParse(Row_numb_after, out y);

            //Kiểm tra nếu số hàng trước và sau khi thực thi Proc có thay đổi 1 có nghĩa là đã thêm Đơn đặt hàng thành công
            if (y > x)
            {
                MessageBox.Show("Tạo Phiếu đặt hàng thành công!\nNhấn Ok và vui lòng đợi thêm Phiếu đặt hàng chi tiết cho sản phẩm đã mua", "Thông báo");

                cmd.Connection = sqlCon;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "MuaMH";

                cmd.Parameters.AddWithValue("@MaDon", SqlDbType.Int).Value = y; //y chính là mã đơn đặt hàng đã tạo thành công
                cmd.Parameters.AddWithValue("@MaMH", SqlDbType.TinyInt).Value = textBox2.Text.Trim();
                cmd.Parameters.AddWithValue("@MaNCC", SqlDbType.DateTime).Value = textBox3.Text.Trim();
                cmd.Parameters.AddWithValue("@SoLuong", SqlDbType.DateTime).Value = textBox4.Text.Trim();
                cmd.ExecuteNonQuery();
            }
            //Ngược lại báo đã nhập dữ liệu sai cú pháp
            else
                MessageBox.Show("Tạo Phiếu đặt hàng không thành công!!", "Thông báo");

            
        }

        private void Button2_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
