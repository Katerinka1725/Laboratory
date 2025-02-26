import sys
from PyQt6.QtWidgets import QApplication, QMainWindow, QMessageBox, QLineEdit
from PyQt6.QtCore import QTimer
import mysql.connector
from captcha import generate_captcha  # Модуль для генерации CAPTCHA
from login import Ui_MainWindow as LoginUI
from accountant import Ui_MainWindow as AccountantUI
from admin import Ui_MainWindow as AdminUI
from lab_assistant import Ui_MainWindow as LabAssistantUI
import pymysql

def connect_to_database():
    try:
        print("Попытка подключения к базе данных...")
        conn = pymysql.connect(
            host="localhost",
            user="root",
            password="",
            database="db"
        )
        print("Подключение к базе данных успешно установлено.")
        return conn
    except pymysql.Error as err:
        print(f"Ошибка подключения к базе данных: {err}")
        return None


class LoginWindow(QMainWindow, LoginUI):
    def __init__(self):
        super().__init__()
        self.setupUi(self)  # Инициализация интерфейса
        self.pushButton_2.clicked.connect(self.authenticate)  # Кнопка "Войти"
        self.checkBox.stateChanged.connect(self.toggle_password_visibility)  # Чекбокс "Показать пароль"
        self.refresh_captcha_button.clicked.connect(self.generate_captcha)  # Кнопка "Обновить CAPTCHA"
        self.failed_attempts = 0
        self.generate_captcha()  # Генерация CAPTCHA при запуске

    def toggle_password_visibility(self):
        if self.checkBox.isChecked():
            self.password_input.setEchoMode(QLineEdit.EchoMode.Normal)
        else:
            self.password_input.setEchoMode(QLineEdit.EchoMode.Password)

    def generate_captcha(self):
        try:
            self.captcha_text = generate_captcha()  # Генерация CAPTCHA
            self.label.setText(self.captcha_text)  # Отображение CAPTCHA
        except Exception as e:
            print(f"Ошибка при генерации CAPTCHA: {e}")
            self.captcha_text = "ERROR"
            self.label.setText("Ошибка CAPTCHA")

    def authenticate(self):
        login = self.login_input.text()
        password = self.password_input.text()
        print(f"Попытка входа: Логин={login}, Пароль={password}")

        if self.failed_attempts > 0:
            captcha = self.captcha_input.text()
            if captcha != self.captcha_text:
                QMessageBox.critical(self, "Ошибка", "Неверная CAPTCHA")
                return

        conn = connect_to_database()
        if conn is None:
            QMessageBox.critical(self, "Ошибка", "Не удалось подключиться к базе данных.")
            return

        cursor = None  # Инициализация курсора
        try:
            cursor = conn.cursor()
            print("Курсор успешно создан.")

            # Проверка в таблицах
            cursor.execute("SELECT * FROM Accountants WHERE Login = %s", (login,))
            accountant = cursor.fetchone()
            print(f"Найден бухгалтер: {accountant}")

            cursor.execute("SELECT * FROM Admins WHERE Login = %s", (login,))
            admin = cursor.fetchone()
            print(f"Найден администратор: {admin}")

            cursor.execute("SELECT * FROM LabAssistants WHERE Login = %s", (login,))
            lab_assistant = cursor.fetchone()
            print(f"Найден лаборант: {lab_assistant}")

            # Проверка паролей
            if accountant and accountant[2] == password:
                self.open_accountant_window(accountant)
            elif admin and admin[2] == password:
                self.open_admin_window(admin)
            elif lab_assistant and lab_assistant[2] == password:
                self.open_lab_assistant_window(lab_assistant)
            else:
                self.failed_attempts += 1
                if self.failed_attempts >= 3:
                    self.generate_captcha()
                    QMessageBox.critical(self, "Ошибка", "Неверный логин или пароль. Введите CAPTCHA.")
                    self.pushButton_2.setEnabled(False)
                    QTimer.singleShot(10000, lambda: self.pushButton_2.setEnabled(True))
                else:
                    QMessageBox.critical(self, "Ошибка", "Неверный логин или пароль.")

        except mysql.connector.Error as err:
            print(f"Ошибка базы данных: {err}")
            QMessageBox.critical(self, "Ошибка", f"Ошибка базы данных: {err}")

        except Exception as e:
            print(f"Неожиданная ошибка: {e}")
            QMessageBox.critical(self, "Ошибка", "Произошла неожиданная ошибка.")

        finally:
            if cursor:
                cursor.close()
                print("Курсор закрыт.")
            if conn:
                conn.close()
                print("Соединение с базой данных закрыто.")

    def open_accountant_window(self, user):
        self.hide()
        self.accountant_window = AccountantWindow(user, self)
        self.accountant_window.show()

    def open_admin_window(self, user):
        self.hide()
        self.admin_window = AdminWindow(user, self)
        self.admin_window.show()

    def open_lab_assistant_window(self, user):
        self.hide()
        self.lab_assistant_window = LabAssistantWindow(user, self)
        self.lab_assistant_window.show()

    def logout(self):
        self.show()
        if hasattr(self, 'accountant_window'):
            self.accountant_window.close()
        if hasattr(self, 'admin_window'):
            self.admin_window.close()
        if hasattr(self, 'lab_assistant_window'):
            self.lab_assistant_window.close()


class AccountantWindow(QMainWindow, AccountantUI):
    def __init__(self, user, login_app):
        super().__init__()
        self.setupUi(self)  # Инициализация интерфейса
        self.login_app = login_app
        self.pushButton_3.clicked.connect(self.logout)  # Кнопка "Выйти"

    def logout(self):
        self.close()
        self.login_app.logout()


class AdminWindow(QMainWindow, AdminUI):
    def __init__(self, user, login_app):
        super().__init__()
        self.setupUi(self)  # Инициализация интерфейса
        self.login_app = login_app
        self.pushButton_4.clicked.connect(self.logout)  # Кнопка "Выйти"

    def logout(self):
        self.close()
        self.login_app.logout()


class LabAssistantWindow(QMainWindow, LabAssistantUI):
    def __init__(self, user, login_app):
        super().__init__()
        self.setupUi(self)  # Инициализация интерфейса
        self.login_app = login_app
        self.pushButton_3.clicked.connect(self.logout)  # Кнопка "Выйти"

    def logout(self):
        self.close()
        self.login_app.logout()


if __name__ == "__main__":
    app = QApplication(sys.argv)
    login_app = LoginWindow()
    login_app.show()
    sys.exit(app.exec())