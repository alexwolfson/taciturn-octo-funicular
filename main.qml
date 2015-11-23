import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Dialogs 1.2
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")
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

        Row {
            id: gaugeRow
            spacing: container.width * 0.02
            anchors.centerIn: parent
            CircularGauge {
                id: speedometer
                property int valueChange: 0
                value: 0
                anchors.verticalCenter: parent.verticalCenter
                maximumValue: 120
                // We set the width to the height, because the height will always be
                // the more limited factor. Also, all circular controls letterbox
                // their contents to ensure that they remain circular. However, we
                // don't want to extra space on the left and right of our gauges,
                // because they're laid out horizontally, and that would create
                // large horizontal gaps between gauges on wide screens.
                width: height
                height: container.height * 0.5
                Behavior on value { NumberAnimation { duration: speedometer.valueChange * 1000 } }

                //style: IntervalGaugeStyle {}
            }

        }
    }
    MainForm {
        anchors.rightMargin: 0
        anchors.bottomMargin: 125
        anchors.leftMargin: 0
        anchors.topMargin: -154
        function changeValue(newValue) {
            speedometer.valueChange = Math.abs(newValue - speedometer.value)
            speedometer.value = newValue
        }
        anchors.fill: parent
        button1.onClicked: changeValue(120)
        button2.onClicked: changeValue(0)
    }

    MessageDialog {
        id: messageDialog
        title: qsTr("May I have your attention, please?")

        function show(caption) {
            messageDialog.text = caption;
            messageDialog.open();
        }
    }
}

