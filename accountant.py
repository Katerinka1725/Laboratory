# Form implementation generated from reading ui file 'accountant.ui'
#
# Created by: PyQt6 UI code generator 6.8.1
#
# WARNING: Any manual changes made to this file will be lost when pyuic6 is
# run again.  Do not edit this file unless you know what you are doing.


from PyQt6 import QtCore, QtGui, QtWidgets


class Ui_MainWindow(object):
    def setupUi(self, MainWindow):
        MainWindow.setObjectName("MainWindow")
        MainWindow.resize(800, 561)
        MainWindow.setStyleSheet("background-color: rgb(198, 231, 255);")
        self.centralwidget = QtWidgets.QWidget(parent=MainWindow)
        self.centralwidget.setObjectName("centralwidget")
        self.welcome_label = QtWidgets.QLabel(parent=self.centralwidget)
        self.welcome_label.setGeometry(QtCore.QRect(320, -20, 281, 91))
        self.welcome_label.setObjectName("welcome_label")
        self.view_reports_button = QtWidgets.QPushButton(parent=self.centralwidget)
        self.view_reports_button.setGeometry(QtCore.QRect(330, 130, 221, 71))
        self.view_reports_button.setStyleSheet("background-color: rgb(255, 255, 255);")
        self.view_reports_button.setObjectName("view_reports_button")
        self.create_invoice_button = QtWidgets.QPushButton(parent=self.centralwidget)
        self.create_invoice_button.setGeometry(QtCore.QRect(330, 250, 221, 71))
        self.create_invoice_button.setStyleSheet("background-color: rgb(255, 255, 255);")
        self.create_invoice_button.setObjectName("create_invoice_button")
        self.pushButton_3 = QtWidgets.QPushButton(parent=self.centralwidget)
        self.pushButton_3.setGeometry(QtCore.QRect(330, 370, 221, 71))
        self.pushButton_3.setStyleSheet("background-color: rgb(255, 255, 255);")
        self.pushButton_3.setObjectName("pushButton_3")
        MainWindow.setCentralWidget(self.centralwidget)
        self.menubar = QtWidgets.QMenuBar(parent=MainWindow)
        self.menubar.setGeometry(QtCore.QRect(0, 0, 800, 26))
        self.menubar.setObjectName("menubar")
        MainWindow.setMenuBar(self.menubar)
        self.statusbar = QtWidgets.QStatusBar(parent=MainWindow)
        self.statusbar.setObjectName("statusbar")
        MainWindow.setStatusBar(self.statusbar)

        self.retranslateUi(MainWindow)
        QtCore.QMetaObject.connectSlotsByName(MainWindow)

    def retranslateUi(self, MainWindow):
        _translate = QtCore.QCoreApplication.translate
        MainWindow.setWindowTitle(_translate("MainWindow", "MainWindow"))
        self.welcome_label.setText(_translate("MainWindow", "<html><head/><body><p align=\"justify\"><span style=\" font-size:16pt; font-weight:600; font-style:italic;\">Добро пожаловать!</span></p></body></html>"))
        self.view_reports_button.setText(_translate("MainWindow", "Посмотреть отчет"))
        self.create_invoice_button.setText(_translate("MainWindow", "Сформировать отчет"))
        self.pushButton_3.setText(_translate("MainWindow", "Выйти"))


if __name__ == "__main__":
    import sys
    app = QtWidgets.QApplication(sys.argv)
    MainWindow = QtWidgets.QMainWindow()
    ui = Ui_MainWindow()
    ui.setupUi(MainWindow)
    MainWindow.show()
    sys.exit(app.exec())
