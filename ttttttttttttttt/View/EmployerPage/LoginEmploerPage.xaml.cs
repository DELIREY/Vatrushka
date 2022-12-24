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

namespace ttttttttttttttt.View.EmployerPage
{
    /// <summary>
    /// Логика взаимодействия для LoginEmploerPage.xaml
    /// </summary>
    public partial class LoginEmploerPage : Page
    {
        public LoginEmploerPage()
        {
            InitializeComponent();
        }
        private void BtnLogin_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                Employees userModel = FrameNavigate.DB.Employees.FirstOrDefault(u => u.Name == TbLogin.Text && u.Telephone == PsbPassword.Password);
                if (userModel == null)
                {
                    MessageBox.Show("Ошибка данных", "Системное сообщение", MessageBoxButton.OK, MessageBoxImage.Error);
                }
                else
                {
                    FrameNavigate.FrameObject.Navigate(new DetailEmployerPage());
                }

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString(), "Системная ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
        private void BtnClose_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }
    }
}
