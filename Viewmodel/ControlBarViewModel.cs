using QuanLyKho.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;

namespace QuanLyKho.Viewmodel
{
    public class ControlBarViewModel : BaseViewModel
    {
        public ICommand CloseWindowCMD { get; set; }
        public ICommand MinimizeWindowCMD { get; set; }
        public ICommand MaximizeWindowCMD { get; set; }
        public ICommand MouseMoveWindowCMD { get; set; }
        public ControlBarViewModel()
        {
            CloseWindowCMD = new RelayCommand<UserControl>(p => true, p => { 
                FrameworkElement fe = getWindow(p);
                if (fe != null)
                    (fe as Window).Close();
            });
            MinimizeWindowCMD = new RelayCommand<UserControl>(p => true, p => {
                FrameworkElement fe = getWindow(p);
                if (fe != null)
                {
                    var w = fe as Window;
                    if (w.WindowState != WindowState.Minimized)
                        w.WindowState = WindowState.Minimized;
                    else
                        w.WindowState = WindowState.Normal;

                }
            });
            MaximizeWindowCMD = new RelayCommand<UserControl>(p => true, p => {
                FrameworkElement fe = getWindow(p);
                if (fe != null)
                {
                    var w = fe as Window;
                    if (w.WindowState != WindowState.Maximized)
                        w.WindowState = WindowState.Maximized;
                    else
                        w.WindowState = WindowState.Normal;

                }
            });
            MouseMoveWindowCMD = new RelayCommand<UserControl>(p => true, p => {
                FrameworkElement fe = getWindow(p);
                if (fe != null)
                {
                    (fe as Window).DragMove();

                }
            });
        }
        private FrameworkElement getWindow(UserControl uc)
        {
            FrameworkElement fe = uc;
            while (fe.Parent != null)
                fe = fe.Parent as FrameworkElement;
            return fe;
        }
    }
}
