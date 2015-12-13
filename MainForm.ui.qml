import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.2

Item {
    width: root.width
    height: root.height

    property alias button1: button1
    property alias button2: button2

    RowLayout {
        id: rowLayout1
        anchors.verticalCenterOffset: 0
        anchors.centerIn: parent

        Button {
            id: button1
            text: qsTr("Start")
            anchors.top: parent.top
            anchors.topMargin: 0
            enabled: true
            clip: true
        }

        Button {
            id: button2
            text: qsTr("Reset")
        }
    }
}

