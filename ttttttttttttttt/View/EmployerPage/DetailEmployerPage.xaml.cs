using MaterialDesignThemes.Wpf.Internal;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
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

namespace ttttttttttttttt.View.EmployerPage
{
    /// <summary>
    /// Логика взаимодействия для DetailEmployerPage.xaml
    /// </summary>
    public partial class DetailEmployerPage : Page
    {
        public DetailEmployerPage()
        {
            InitializeComponent();
        }
        private async void BtnCheck_Click(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrEmpty(TbTitle.Text) ||
                string.IsNullOrEmpty(TbTime.Text) ||
                string.IsNullOrEmpty(TbKolvo.Text)

                 )

            {
                MessageBox.Show("Все поля должны быть заполнены!", "Системное сообщение", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            else
            {
                if (FrameNavigate.DB.Orders.Count(u => u.Name == TbTitle.Text) > 0)
                {
                    MessageBox.Show("Данный товар уже заказан", "Системное сообщение", MessageBoxButton.OK, MessageBoxImage.Error);
                }
                FrameNavigate.DB.Orders.Add(new Orders
                {

                    Name = TbTitle.Text,
                    Data = TbTime.Text,
                    Kolvo = TbKolvo.Text,
                    EmployeesID = 1,
                });
                await FrameNavigate.DB.SaveChangesAsync();
                MessageBox.Show("Ваш заказ успешно добавлен!", "Системное сообщение", MessageBoxButton.OK, MessageBoxImage.Information);
                FrameNavigate.FrameObject.Navigate(new DetailEmployerPage());
            }
        }
        private void BtnBack_Click(object sender, RoutedEventArgs e)
        {
            FrameNavigate.FrameObject.Navigate(new LoginEmploerPage());
        }


        private void BtnClose_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }
    }
}
