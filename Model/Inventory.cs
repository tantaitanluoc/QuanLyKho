using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyKho.Model
{
    public class Inventory
    {
        public Material Material { get; set; }
        public int No { get; set; }
        public int Count { get; set; }

        public Inventory(int no, Material material, int count)
        {
            this.No = no;
            this.Material = material;
            this.Count = count;
        }
    }
}
