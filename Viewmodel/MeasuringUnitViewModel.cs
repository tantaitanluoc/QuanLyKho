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
    public class MeasuringUnitViewModel: BaseViewModel
    {
        private ObservableCollection<MeasuringUnit> _list;
        private MeasuringUnit _selectedItem;
        private string _displayName;
        public ObservableCollection<MeasuringUnit> List { get => _list; set { _list = value; OnPropertyChanged(); } }
        public MeasuringUnit SelectedItem { get => _selectedItem; set { 
                _selectedItem = value;
                OnPropertyChanged();
                if (SelectedItem != null)
                    DisplayName = SelectedItem.unit;
            } 
        }
        public string DisplayName { get => _displayName; set { _displayName = value; OnPropertyChanged(); } }

        public ICommand AddCMD { get; set; }
        public ICommand DeleteCMD { get; set; }

        public MeasuringUnitViewModel()
        {
            UpdateList();
            AddCMD = new RelayCommand<object>(p => {
                if (string.IsNullOrEmpty(DisplayName))
                    return false;
                if (DataProvider.Ins.db.MeasuringUnits.Any(e => e.unit == DisplayName))
                    return false;
                return true;
            }, p => {
                var mu = new MeasuringUnit() { unit = DisplayName };
                try
                {
                    DataProvider.Ins.db.MeasuringUnits.Add(mu);
                    var temp = new ObservableCollection<MeasuringUnit>(DataProvider.Ins.db.MeasuringUnits);
                    MessageBox.Show(""+DataProvider.Ins.db.ChangeTracker.HasChanges());
                    int err = DataProvider.Ins.db.SaveChanges();
                }
                catch (Exception e)
                {
                    
                 MessageBox.Show(e.Message);
                }
               // List.Add(mu);
                UpdateList();
            });
            DeleteCMD = new RelayCommand<object>(p => {
                return true;
                
            }, p => {
                var mu = DataProvider.Ins.db.MeasuringUnits.Where(e => e.id == SelectedItem.id).SingleOrDefault();
                try
                {
                    mu.unit = DisplayName;
                    MessageBox.Show(""+DataProvider.Ins.db.ChangeTracker.HasChanges());
                    int err = DataProvider.Ins.db.SaveChanges();
                }
                catch (Exception e)
                {
                    
                 MessageBox.Show(e.Message);
                }
               // List.Add(mu);
                UpdateList();
            });
        }
        private void UpdateList()
        {
            if(List != null)
                List.Clear();
            List = new ObservableCollection<MeasuringUnit>(DataProvider.Ins.db.MeasuringUnits);
        }
    }
}
