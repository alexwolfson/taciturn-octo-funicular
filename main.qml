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
                id: timer
                property real valueChange: 0
                value: 5
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
                states:[
                    State {
                        name: "watchRun"
                        //when: value != 0
                        PropertyChanges {
                            target: timer
                            value: 120
                        }
                    },
                    State {
                        name: "initial"; //when: value == 0
                        PropertyChanges {
                            target: timer
                            value: 0
                        }
                    }

                ]
                transitions:[
                    Transition {
                        from: "*"
                        to: "watchRun"
                        NumberAnimation{
                            target: timer
                            property: "value"
                            duration: (120 - timer.value) * 1000
                        }
                    },
                    Transition {
                        from: "*"
                        to: "initial"
                         NumberAnimation{
                            target: timer
                            property: "value"
                            duration: timer.value * 10
                        }
                    }

                ]

                //Behavior on value { NumberAnimation { duration: timer.valueChange * 1000 } }
                //style: IntervalGaugeStyle {}
            }

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
        button1.onClicked: {timer.state = "watchRun"}
        button2.onClicked: {timer.state = "initial"}
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

