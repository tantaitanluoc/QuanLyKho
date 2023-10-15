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
        public MainViewModel()
        {
            OnLoadedCMD = new RelayCommand<object>(p => true, p => {
               LoginWindow loginWindow = new LoginWindow();
               loginWindow.ShowDialog();
            });
        }
    }
}
