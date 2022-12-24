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

namespace ttttttttttttttt.View.AdministratorPage.AdminUserControls
{
    /// <summary>
    /// Логика взаимодействия для AdminInfoOrderControl.xaml
    /// </summary>
    public partial class AdminInfoOrderControl : Page
    {
        public AdminInfoOrderControl()
        {
            InitializeComponent();
            DataOrderInfo.ItemsSource = FrameNavigate.DB.Orders.OrderBy(w => w.Name).ToList();
        }
        private void BtnClose_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }
        private void BtnDelete_Click(object sender, RoutedEventArgs e)
        {
            int idOrder = (DataOrderInfo.SelectedItem as Orders).OrdersID;
            var result = MessageBox.Show("Хотите удалить заказ?", "Системное сообщение", MessageBoxButton.YesNo, MessageBoxImage.Question);
            if (result == MessageBoxResult.Yes)
            {
                Orders orders = (from b in FrameNavigate.DB.Orders where b.OrdersID == idOrder select b).SingleOrDefault();
                FrameNavigate.DB.Orders.Remove(orders);
                FrameNavigate.DB.SaveChanges();
                DataOrderInfo.ItemsSource = FrameNavigate.DB.Orders.OrderBy(w => w.Name).ToList();
            }
        }
    }
}
