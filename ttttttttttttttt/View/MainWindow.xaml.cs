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
using ttttttttttttttt.Core;
using ttttttttttttttt.Model;
using ttttttttttttttt.View.LoginPage;

namespace ttttttttttttttt
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();

            FrameNavigate.FrameObject = MainWindowFrame;
            FrameNavigate.DB = new VatrushkaDBEntities();
            MainWindowFrame.Navigate(new MainWindowLoginPage());

        }

        private void Window_MouseDown(object sender, RoutedEventArgs e)
        {
            DragMove();
        }
        private void BtnVatrushka(object sender, RoutedEventArgs e)
        {
            MainWindowFrame.Navigate(new MainWindowLoginPage());
        }
        private void BtnClose_Click(object sender, RoutedEventArgs e)
        {
            Application.Current.Shutdown();
        }



    }
}