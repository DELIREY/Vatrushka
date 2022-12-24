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
using ttttttttttttttt.View.AdministratorPage;
using ttttttttttttttt.View.EmployerPage;
using ttttttttttttttt.View.UserPage;

namespace ttttttttttttttt.View.LoginPage
{
    /// <summary>
    /// Логика взаимодействия для MainWindowLoginPage.xaml
    /// </summary>
    public partial class MainWindowLoginPage : Page
    {
        public MainWindowLoginPage()
        {
            InitializeComponent();
        }


        private void BtnLogin_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                Users userModel = FrameNavigate.DB.Users.FirstOrDefault(u =>
                u.Name == TbLogin.Text && u.Telephone == PsbPassword.Password);

                if (userModel == null)
                {
                    MessageBox.Show("Ошибка данных",
                        "Системное сообщение",
                        MessageBoxButton.OK,
                        MessageBoxImage.Error);
                }
                else
                {
                    switch (userModel.RoleID)
                    {
                        case 1:
                            FrameNavigate.FrameObject.Navigate(new MainAdministratorPage());
                            break;
                        case 2:
                            FrameNavigate.FrameObject.Navigate(new MainUserPage());
                            break;
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString(),
                    "Системная ошибка",
                    MessageBoxButton.OK,
                    MessageBoxImage.Error);
            }

        }

        private void BtnRegistration_Click(object sender, RoutedEventArgs e)
        {
            FrameNavigate.FrameObject.Navigate(new MainWindowRegistrationPage());
        }
        private void BtnEmployer_Click(object sender, RoutedEventArgs e)
        {
            FrameNavigate.FrameObject.Navigate(new LoginEmploerPage());
        }
    }
}
