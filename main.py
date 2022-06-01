# This Python file uses the following encoding: utf-8
import os
from pathlib import Path
import sys
from youtube import get_text
from translate import get_tarjima
from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine
from PySide2.QtCore import QObject, Slot, Signal
class MainWindow(QObject):
    def __init__(self):
        QObject.__init__(self)
    #set name
    setName = Signal(str)

    # function set name to label
    @Slot(str)
    def get_Translator_text(self,url):
        try:
            self.setName.emit(get_tarjima(get_text(url)))
        except:
            self.setName.emit('Xato')


if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()
    # get connection
    main = MainWindow()
    engine.rootContext().setContextProperty("backend",main)
    engine.load(os.fspath(Path(__file__).resolve().parent / "main.qml"))
    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec_())
