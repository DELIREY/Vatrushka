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
using ttttttttttttttt.View.AdministratorPage.AdminUserControls;
using ttttttttttttttt.View.UserPage;

namespace ttttttttttttttt.View.AdministratorPage
{
    /// <summary>
    /// Логика взаимодействия для MainAdministratorPage.xaml
    /// </summary>
    public partial class MainAdministratorPage : Page
    {
        public MainAdministratorPage()
        {
            InitializeComponent();
        }
        private void MenuitemUser_Click(object sender, RoutedEventArgs e)
        {
            FrameNavigate.FrameObject.Navigate(new AdminInfoUserControl());

        }
        private void MenuEmployer_Click(object sender, RoutedEventArgs e)
        {
            FrameNavigate.FrameObject.Navigate(new AdminInfoEmployerControl());

        }
        private void MenuItemOrders_Click(object sender, RoutedEventArgs e)
        {
            FrameNavigate.FrameObject.Navigate(new AdminInfoOrderControl());

        }

    }

}
