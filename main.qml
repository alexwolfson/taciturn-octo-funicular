import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Dialogs 1.2
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import "./qml"
ApplicationWindow {
    visible: true
    width: 480
    height: 600
    title: qsTr("Under Sea Wolf")
    id: root
    menuBar: MenuBar {
        Menu {
            title: qsTr("File")
            MenuItem {
                text: qsTr("&Open")
                onTriggered: console.log("Open action triggered");
            }
            MenuItem {
                text: qsTr("Exit")
                onTriggered: Qt.quit();
            }
        }
    }

    Item {
        id: container
        width: root.width
        height: Math.min(root.width, root.height)
        anchors.centerIn: parent

        UnderSeaWolfControls {
            id:timerHold
            maximumValue: 10
            minAngle:     -60
            maxAngle:     60
            anchors.centerIn: parent
            needleColor: "blue"
        }
        UnderSeaWolfControls {
            id:timerWalk
            maximumValue: 12
            minAngle:     60
            maxAngle:     180
            anchors.centerIn: parent
            needleColor: "red"
        }
        UnderSeaWolfControls {
            id:timerBreath
            maximumValue: 6
            minAngle:     180
            maxAngle:     300
            needleColor:  "green"
            anchors.centerIn: parent
        }
    }
    MainForm {
        anchors.rightMargin: 0
        anchors.bottomMargin: 125
        anchors.leftMargin: 0
        anchors.topMargin: -154
//        function changeValue(newValue) {
//            timer.valueChange = Math.abs(newValue - timer.value)
//            timer.value = newValue
//        }
        anchors.fill: parent
        button1.onClicked: {timerHold.state = "watchRun"}
        button2.onClicked: {timerHold.state = "initial"}
//    }

    MessageDialog {
        id: messageDialog
        title: qsTr("May I have your attention, please?")

        function show(caption) {
            messageDialog.text = caption;
            messageDialog.open();
        }
    }
}

}
