namespace CSDLNC_DA2
{
    partial class TheoDoiDonHang
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.qLY_TRANGBANHANGDataSet2 = new CSDLNC_DA2.QLY_TRANGBANHANGDataSet2();
            this.trangThaiDonHangBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.trangThaiDonHangTableAdapter = new CSDLNC_DA2.QLY_TRANGBANHANGDataSet2TableAdapters.TrangThaiDonHangTableAdapter();
            this.maDonHangDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.trangThaiDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Thoat = new System.Windows.Forms.Button();
            this.button2 = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.qLY_TRANGBANHANGDataSet2)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.trangThaiDonHangBindingSource)).BeginInit();
            this.SuspendLayout();
            // 
            // dataGridView1
            // 
            this.dataGridView1.AutoGenerateColumns = false;
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.maDonHangDataGridViewTextBoxColumn,
            this.trangThaiDataGridViewTextBoxColumn});
            this.dataGridView1.DataSource = this.trangThaiDonHangBindingSource;
            this.dataGridView1.Location = new System.Drawing.Point(103, 158);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.Size = new System.Drawing.Size(589, 224);
            this.dataGridView1.TabIndex = 0;
            // 
            // qLY_TRANGBANHANGDataSet2
            // 
            this.qLY_TRANGBANHANGDataSet2.DataSetName = "QLY_TRANGBANHANGDataSet2";
            this.qLY_TRANGBANHANGDataSet2.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // trangThaiDonHangBindingSource
            // 
            this.trangThaiDonHangBindingSource.DataMember = "TrangThaiDonHang";
            this.trangThaiDonHangBindingSource.DataSource = this.qLY_TRANGBANHANGDataSet2;
            // 
            // trangThaiDonHangTableAdapter
            // 
            this.trangThaiDonHangTableAdapter.ClearBeforeFill = true;
            // 
            // maDonHangDataGridViewTextBoxColumn
            // 
            this.maDonHangDataGridViewTextBoxColumn.DataPropertyName = "MaDonHang";
            this.maDonHangDataGridViewTextBoxColumn.HeaderText = "MaDonHang";
            this.maDonHangDataGridViewTextBoxColumn.Name = "maDonHangDataGridViewTextBoxColumn";
            // 
            // trangThaiDataGridViewTextBoxColumn
            // 
            this.trangThaiDataGridViewTextBoxColumn.DataPropertyName = "TrangThai";
            this.trangThaiDataGridViewTextBoxColumn.HeaderText = "TrangThai";
            this.trangThaiDataGridViewTextBoxColumn.Name = "trangThaiDataGridViewTextBoxColumn";
            // 
            // Thoat
            // 
            this.Thoat.Location = new System.Drawing.Point(242, 65);
            this.Thoat.Name = "Thoat";
            this.Thoat.Size = new System.Drawing.Size(90, 23);
            this.Thoat.TabIndex = 1;
            this.Thoat.Text = "Thoát";
            this.Thoat.UseVisualStyleBackColor = true;
            this.Thoat.Click += new System.EventHandler(this.Thoat_Click);
            // 
            // button2
            // 
            this.button2.Location = new System.Drawing.Point(437, 65);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(109, 23);
            this.button2.TabIndex = 2;
            this.button2.Text = "Mua hàng mới";
            this.button2.UseVisualStyleBackColor = true;
            this.button2.Click += new System.EventHandler(this.Button2_Click);
            // 
            // TheoDoiDonHang
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(856, 450);
            this.Controls.Add(this.button2);
            this.Controls.Add(this.Thoat);
            this.Controls.Add(this.dataGridView1);
            this.Name = "TheoDoiDonHang";
            this.Text = "TheoDoiDonHang";
            this.Load += new System.EventHandler(this.TheoDoiDonHang_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.qLY_TRANGBANHANGDataSet2)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.trangThaiDonHangBindingSource)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.DataGridView dataGridView1;
        private QLY_TRANGBANHANGDataSet2 qLY_TRANGBANHANGDataSet2;
        private System.Windows.Forms.BindingSource trangThaiDonHangBindingSource;
        private QLY_TRANGBANHANGDataSet2TableAdapters.TrangThaiDonHangTableAdapter trangThaiDonHangTableAdapter;
        private System.Windows.Forms.DataGridViewTextBoxColumn maDonHangDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn trangThaiDataGridViewTextBoxColumn;
        private System.Windows.Forms.Button Thoat;
        private System.Windows.Forms.Button button2;
    }
}