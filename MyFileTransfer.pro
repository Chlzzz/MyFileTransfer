QT += quick widgets network concurrent

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

HEADERS += \
    src/connectionmanager.h \
    src/fileapi.h \
    src/fileblock.h \
    src/filetransfer.h \
    src/filemanager.h \
    src/discoverconnection.h \
    src/framelesswindow.h \
    src/transfersocket.h \
    src/scanneritem.h

SOURCES += \
    src/connectionmanager.cpp \
    src/fileapi.cpp \
    src/fileblock.cpp \
    src/filetransfer.cpp \
    src/framelesswindow.cpp \
    src/main.cpp \
    src/filemanager.cpp \
    src/discoverconnection.cpp \
    src/transfersocket.cpp \
    src/scanneritem.cpp


RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target
