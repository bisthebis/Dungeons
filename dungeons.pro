TEMPLATE = app

QT += qml quick
CONFIG += c++14

SOURCES += main.cpp \
    dungeondata.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    dungeondata.h

DISTFILES += \
    level1.txt
