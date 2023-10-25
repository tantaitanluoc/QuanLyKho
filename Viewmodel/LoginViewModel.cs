using QuanLyKho.Model;
using QuanLyKho.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;

namespace QuanLyKho.ViewModel
{
    public class LoginViewModel: BaseViewModel
    {
        public bool Auth { get; set; }
        public ICommand LoginCMD { get; set; }
        public ICommand CloseCMD { get; set; }
        public ICommand PasswordChangedCMD { get; set; }
        private string _username;
        private string _password;
        public string Username { get => _username; set { _username = value; OnPropertyChanged(); } }
        public string Password { get => _password; set { _password = value; OnPropertyChanged(); } }

        public LoginViewModel()
        {
            Auth = false;
            Password = "";
            Username = "";
            LoginCMD = new RelayCommand<Window>(p => true, p => { Login(p); });
            CloseCMD = new RelayCommand<Window>(p => true, p => { p.Close(); });
            PasswordChangedCMD = new RelayCommand<PasswordBox>(p => true, p => { Password = p.Password; });
        }
        private string hash(string str)
        {
            return str;
        }
        private void Login(Window w)
        {
            Auth = Authenticate();
            if (Auth)
                w.Close();
            else
                MessageBox.Show("Sai tên đăng nhập hoặc mật khẩu!", "Lỗi", MessageBoxButton.OK, MessageBoxImage.Error);
        }
        private bool Authenticate()
        {
           string hasedPasswd = hash(Password);
           return DataProvider.Ins.db.Accounts.Where(u => u.userName == Username && u.password == hasedPasswd).Count() == 1;
        }
    }
}
