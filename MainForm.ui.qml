import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.2

Item {
    width: 600
    height: 800

    property alias button1: button1
    property alias button2: button2

    RowLayout {
        id: rowLayout1
        anchors.centerIn: parent

        Button {
            id: button1
            text: qsTr("Start")
            enabled: true
            clip: true
            anchors.top: parent.top
            anchors.topMargin: 0
        }

        Button {
            id: button2
            text: qsTr("Reset")
        }
    }
}

