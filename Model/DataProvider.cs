using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyKho.Model
{
    public class DataProvider
    {
        private static DataProvider _ins;
        public static DataProvider Ins { get => _ins == null ? new DataProvider():_ins; set => _ins = value; }
        public QuanLyKhoEntities db { get; set; }
        public DataProvider()
        {
            db = new QuanLyKhoEntities();
        }
    }
}
