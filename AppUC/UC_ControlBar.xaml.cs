﻿using QuanLyKho.Viewmodel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace QuanLyKho.AppUC
{
    /// <summary>
    /// Interaction logic for UC_ControlBar.xaml
    /// </summary>
    public partial class UC_ControlBar : UserControl
    {
        public ControlBarViewModel controlBarViewModel { get; set; }
        public UC_ControlBar()
        {
            InitializeComponent();
            this.DataContext = controlBarViewModel = new ControlBarViewModel();
        }
    }
}
