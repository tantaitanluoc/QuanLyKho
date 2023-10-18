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
        public MainViewModel()
        {
            OnLoadedCMD = new RelayCommand<object>(p => true, p => {
               //LoginWindow loginWindow = new LoginWindow();
               //loginWindow.ShowDialog();
            });

            UnitCMD = new RelayCommand<object>(p => true, p => { MeasuringUnitWindow w = new MeasuringUnitWindow(); w.ShowDialog(); });
            SupplierCMD = new RelayCommand<object>(p => true, p => { SupplierWindow w = new SupplierWindow(); w.ShowDialog(); });
            CustomerCMD = new RelayCommand<object>(p => true, p => { CustomerWindow w = new CustomerWindow(); w.ShowDialog(); });
        }
    }
}
