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
    /// Логика взаимодействия для AdminInfoEmployerControl.xaml
    /// </summary>
    public partial class AdminInfoEmployerControl : Page
    {
        public AdminInfoEmployerControl()
        {
            InitializeComponent();
            DataEmploerInfo.ItemsSource = FrameNavigate.DB.Employees.OrderBy(w => w.Name).ToList();
        }
        private void BtnClose_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }
        private void BtnDelete_Click(object sender, RoutedEventArgs e)
        {
            int idEmploer = (DataEmploerInfo.SelectedItem as Employees).EmployeesID;
            var result = MessageBox.Show("Хотите удалить сотрудника?", "Системное сообщение", MessageBoxButton.YesNo, MessageBoxImage.Question);
            if (result == MessageBoxResult.Yes)
            {
                Employees employees = (from w in FrameNavigate.DB.Employees where w.EmployeesID == idEmploer select w).SingleOrDefault();
                FrameNavigate.DB.Employees.Remove(employees);
                FrameNavigate.DB.SaveChanges();
                DataEmploerInfo.ItemsSource = FrameNavigate.DB.Employees.OrderBy(w => w.Name).ToList();
            }
        }
    }
}
