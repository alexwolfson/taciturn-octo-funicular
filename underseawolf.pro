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
    qml/images/SeaTurtle.png \
    qml/Gauges.qml \
    qml/sounds/breathe.wav

