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
    /// Логика взаимодействия для AdminInfoUserControl.xaml
    /// </summary>
    public partial class AdminInfoUserControl : Page
    {
        public AdminInfoUserControl()
        {
            InitializeComponent();
            DataUserInfo.ItemsSource = FrameNavigate.DB.Users.OrderBy(u => u.Name).ToList();
        }
        private void BtnClose_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }
        private void BtnDelete_Click(object sender, RoutedEventArgs e)
        {
            int idUser = (DataUserInfo.SelectedItem as Users).UsersID;
            var result = MessageBox.Show("Хотите удалить пользователя?", "Системное сообщение", MessageBoxButton.YesNo, MessageBoxImage.Question);
            if (result == MessageBoxResult.Yes)
            {
                Users user = (from u in FrameNavigate.DB.Users where u.UsersID == idUser select u).SingleOrDefault();
                FrameNavigate.DB.Users.Remove(user);
                FrameNavigate.DB.SaveChanges();
                DataUserInfo.ItemsSource = FrameNavigate.DB.Users.OrderBy(x => x.Name).ToList();
            }
        }
    }
}
