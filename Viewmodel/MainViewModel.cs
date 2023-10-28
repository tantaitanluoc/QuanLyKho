using QuanLyKho.Model;
using QuanLyKho.ViewModel;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;

namespace QuanLyKho.ViewModel
{
    public class MainViewModel: BaseViewModel
    {
        public ICommand OnLoadedCMD { get; set; }
        public ICommand UnitCMD { get; set; }
        public ICommand SupplierCMD { get; set; }
        public ICommand CustomerCMD { get; set; }
        public ICommand MaterialCMD { get; set; }
        public ICommand UserCMD { get; set; }
        public ICommand ImportCMD { get; set; }
        public ICommand ExportCMD { get; set; }

        private ObservableCollection<Inventory> inventories;
        public ObservableCollection<Inventory> Inventories { get => inventories; set { inventories = value; OnPropertyChanged(); } }


        public MainViewModel()
        {
            OnLoadedCMD = new RelayCommand<Window>(p => true, p => {
                if (p == null)
                    return;
                p.Hide();
                LoginWindow loginWindow = new LoginWindow();
                loginWindow.ShowDialog();

                var loginVM = loginWindow.DataContext as LoginViewModel;
                if (loginVM == null)
                    return;

                if (loginVM.Auth)
                {
                    p.Show();
                    InventoryLoad();
                }
                else
                    p.Close();
            });

            UnitCMD = new RelayCommand<object>(p => true, p => { MeasuringUnitWindow w = new MeasuringUnitWindow(); w.ShowDialog(); });
            SupplierCMD = new RelayCommand<object>(p => true, p => { SupplierWindow w = new SupplierWindow(); w.ShowDialog(); });
            CustomerCMD = new RelayCommand<object>(p => true, p => { CustomerWindow w = new CustomerWindow(); w.ShowDialog(); });
            MaterialCMD = new RelayCommand<object>(p => true, p => { MaterialWindow w = new MaterialWindow(); w.ShowDialog(); });
            UserCMD = new RelayCommand<object>(p => true, p => { UserWindow w = new UserWindow(); w.ShowDialog(); });
            ImportCMD = new RelayCommand<object>(p => true, p => { ImportWindow w = new ImportWindow(); w.ShowDialog(); });
            ExportCMD = new RelayCommand<object>(p => true, p => { ExportWindow w = new ExportWindow(); w.ShowDialog(); });

           
        }

        private void InventoryLoad()
        {
            Inventories = new ObservableCollection<Inventory>();
            var materialList = DataProvider.Ins.db.Materials;
            int accumulate = 1;
            foreach (var item in materialList)
            {
                var imlist = DataProvider.Ins.db.ImportInfoes.Where(e => e.materialId == item.id);
                var exlist = DataProvider.Ins.db.ExportInfoes.Where(e => e.materialId == item.id);

                int imsum = 0, exsum = 0;
                try
                {
                    imsum = (int)imlist.Sum(e => e.count);
                    exsum = (int)exlist.Sum(e => e.count);
                }
                catch
                {
                    // swear
                }

                Inventories.Add(new Inventory(accumulate, item, imsum - exsum));

                accumulate++;
            }
        }
    }
}
