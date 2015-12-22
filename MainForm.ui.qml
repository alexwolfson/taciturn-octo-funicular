import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.2

Item {
    id: item1
    width: root.width
    height: root.height

//    property alias button1: button1
//    property alias button2: button2
//    property alias walkControl: walkControl

    RowLayout {
        id: rowLayout1
        width: 276
        height: 65
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: 0
        anchors.verticalCenterOffset: 0

//        Button {
//            id: button1
//            height: 40
//            text: qsTr("Start")
//            anchors.top: walkControl.bottom
//            anchors.topMargin: -27
//            enabled: true
//            clip: true
//        }

//        Button {
//            id: walkControl
//            height: 40
//            text: qsTr("Finish Walk")
//            enabled: true
//        }
//        Button {
//            id: button2
//            height: 40
//            text: qsTr("Walk Back")
//        }
//    }
}
