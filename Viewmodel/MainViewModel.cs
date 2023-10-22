using QuanLyKho.Model;
using QuanLyKho.ViewModel;
using System;
using System.Collections.Generic;
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

        public MainViewModel()
        {
            OnLoadedCMD = new RelayCommand<object>(p => true, p => {
               //LoginWindow loginWindow = new LoginWindow();
               //loginWindow.ShowDialog();
            });

            UnitCMD = new RelayCommand<object>(p => true, p => { MeasuringUnitWindow w = new MeasuringUnitWindow(); w.ShowDialog(); });
            SupplierCMD = new RelayCommand<object>(p => true, p => { SupplierWindow w = new SupplierWindow(); w.ShowDialog(); });
            CustomerCMD = new RelayCommand<object>(p => true, p => { CustomerWindow w = new CustomerWindow(); w.ShowDialog(); });
            MaterialCMD = new RelayCommand<object>(p => true, p => { MaterialWindow w = new MaterialWindow(); w.ShowDialog(); });
            UserCMD = new RelayCommand<object>(p => true, p => { UserWindow w = new UserWindow(); w.ShowDialog(); });
            ImportCMD = new RelayCommand<object>(p => true, p => { ImportWindow w = new ImportWindow(); w.ShowDialog(); });
            ExportCMD = new RelayCommand<object>(p => true, p => { ExportWindow w = new ExportWindow(); w.ShowDialog(); });

           
        }
    }
}
