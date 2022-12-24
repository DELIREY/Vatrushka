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

namespace ttttttttttttttt.View.LoginPage
{
    /// <summary>
    /// Логика взаимодействия для MainWindowRegistrationPage.xaml
    /// </summary>
    public partial class MainWindowRegistrationPage : Page
    {
        public MainWindowRegistrationPage()
        {
            InitializeComponent();
        }
        private void BtnClose_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }
        private async void BtnRegistration_Click(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrEmpty(Tb_Login.Text) ||
                string.IsNullOrEmpty(Reg_Txb.Text) ||
                string.IsNullOrEmpty(Tb_Email.Text))

            {
                MessageBox.Show("Все поля должны быть заполнены!", "Системное сообщение", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            else
            {
                if (FrameNavigate.DB.Users.Count(u => u.Name == Tb_Login.Text) > 0)
                {
                    MessageBox.Show("Данный пользователь уже зарегистрирован", "Системное сообщение", MessageBoxButton.OK, MessageBoxImage.Error);
                }
                FrameNavigate.DB.Users.Add(new Users
                {
                    Name = Tb_Login.Text,
                    Telephone = Reg_Txb.Text,
                    Email = Tb_Email.Text,
                    RoleID = 2,


                });
                await FrameNavigate.DB.SaveChangesAsync();
                MessageBox.Show("Учетная запись успешно создана!", "Системное сообщение", MessageBoxButton.OK, MessageBoxImage.Information);
                FrameNavigate.FrameObject.Navigate(new MainWindowLoginPage());
            }
        }
    }
}
