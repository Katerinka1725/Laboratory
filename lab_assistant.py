# Form implementation generated from reading ui file 'lab_assistant.ui'
#
# Created by: PyQt6 UI code generator 6.8.1
#
# WARNING: Any manual changes made to this file will be lost when pyuic6 is
# run again.  Do not edit this file unless you know what you are doing.


from PyQt6 import QtCore, QtGui, QtWidgets


class Ui_MainWindow(object):
    def setupUi(self, MainWindow):
        MainWindow.setObjectName("MainWindow")
        MainWindow.resize(800, 600)
        MainWindow.setStyleSheet("background-color: rgb(198, 231, 255);")
        self.centralwidget = QtWidgets.QWidget(parent=MainWindow)
        self.centralwidget.setObjectName("centralwidget")
        self.label = QtWidgets.QLabel(parent=self.centralwidget)
        self.label.setGeometry(QtCore.QRect(300, 0, 261, 121))
        self.label.setObjectName("label")
        self.accept_sample_button = QtWidgets.QPushButton(parent=self.centralwidget)
        self.accept_sample_button.setGeometry(QtCore.QRect(320, 140, 201, 71))
        self.accept_sample_button.setStyleSheet("background-color: rgb(255, 255, 255);")
        self.accept_sample_button.setObjectName("accept_sample_button")
        self.generate_report_button = QtWidgets.QPushButton(parent=self.centralwidget)
        self.generate_report_button.setGeometry(QtCore.QRect(320, 250, 201, 71))
        self.generate_report_button.setStyleSheet("background-color: rgb(255, 255, 255);")
        self.generate_report_button.setObjectName("generate_report_button")
        self.pushButton_3 = QtWidgets.QPushButton(parent=self.centralwidget)
        self.pushButton_3.setGeometry(QtCore.QRect(320, 360, 201, 71))
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
        self.label.setText(_translate("MainWindow", "<html><head/><body><p><span style=\" font-size:14pt; font-weight:600; font-style:italic;\">Добро пожаловать!</span></p></body></html>"))
        self.accept_sample_button.setText(_translate("MainWindow", "Принять биоматериал"))
        self.generate_report_button.setText(_translate("MainWindow", "Сформировать отчет"))
        self.pushButton_3.setText(_translate("MainWindow", "Выйти"))


if __name__ == "__main__":
    import sys
    app = QtWidgets.QApplication(sys.argv)
    MainWindow = QtWidgets.QMainWindow()
    ui = Ui_MainWindow()
    ui.setupUi(MainWindow)
    MainWindow.show()
    sys.exit(app.exec())
