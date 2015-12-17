TEMPLATE = app

QT += qml quick widgets

SOURCES += main.cpp

RESOURCES += underseawolf.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

OTHER_FILES += \
    qml/IntervalGaugeStyle.qml \
    qml/UnderSeaWolfControls.qml

DISTFILES += \
    qml/images/SeaTurtle.jpg \
    qml/Gauges.qml \
    qml/sounds/breathe.wav \
    qml/sounds/hold.wav \
    qml/sounds/walk.wav \
    TODO \
    README \
    qml/sounds/10sec.wav \
    qml/sounds/30sec.wav

