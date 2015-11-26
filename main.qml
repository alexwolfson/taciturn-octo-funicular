import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Dialogs 1.2
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import "./qml"
ApplicationWindow {
    visible: true
    width: 600
    height: 800
    title: qsTr("Under Sea Wolf")
    id: root
    color: "black"
    Image {
        id: bkgImg
        source: "qml/images/SeaTurtle.png"
        fillMode: Image.PreserveAspectFit
        opacity: 0.4
    }
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
        height: root.height
        //height: Math.min(root.width, root.height)
        anchors.fill: parent
        ListModel {
            id: apneaModel
            //the following 3 properties will be used as indexes
            property int breathe: 0
            property int hold: 1
            property int walk: 2
            ListElement { time: 20; typeName: "breathe"; myColor: "red";   isCurrent: true }
            ListElement { time: 10; typeName: "hold";    myColor: "blue";  isCurrent: true }
            ListElement { time: 30; typeName: "walk";    myColor: "green"; isCurrent: false }
            ListElement { time: 20; typeName: "breathe"; myColor: "red";   isCurrent: false }
            ListElement { time: 15; typeName: "hold";    myColor: "blue";  isCurrent: false }
            ListElement { time: 5;  typeName: "walk";    myColor: "green"; isCurrent: false }
        }
        GridView {
            id: view
            anchors.fill: parent
            anchors.margins: 20
            anchors.bottomMargin: 80
            cellWidth: (parent.width - 2 * anchors.margins) /3 - 3
            cellHeight: 40
            clip: true
            model: apneaModel
            delegate: apneaDelegate

            Component {
                id: apneaDelegate

                Rectangle {
                    id: wrapper

                    width: view.cellWidth -2
                    height: view.cellHeight -2
                    color: apneaModel.get(index).myColor
    //                    gradient: Gradient {
    //                        GradientStop { position: 0.0; color: "#f8306a" }
    //                        GradientStop { position: 1.0; color: "#fb5b40" }
    //                    }

                    Text {
                        anchors.centerIn: parent
                        font.pixelSize: 16
                        text: index + ". " + typeName + " " + time + "sec."
                    }

                  }
           }
    }
//        ApneaList{
//        }
        UnderSeaWolfControls {
            id:timerHold
            maximumValue: 30
            minAngle:     -60
            maxAngle:     60
            anchors.centerIn: parent
            gaugeModelElement: apneaModel.get(apneaModel.hold)
            needleColor: gaugeModelElement.myColor
            isCurrent: gaugeModelElement.isCurrent
        }
        UnderSeaWolfControls {
            id:timerWalk
            maximumValue: 20
            minAngle:     60
            maxAngle:     180
            anchors.centerIn: parent
            gaugeModelElement: apneaModel.get(apneaModel.walk)
            needleColor: gaugeModelElement.myColor
            isCurrent: gaugeModelElement.isCurrent
        }
        UnderSeaWolfControls {
            id:timerBreathe
            maximumValue: 45
            minAngle:     180
            maxAngle:     300
            anchors.centerIn: parent
            gaugeModelElement: apneaModel.get(apneaModel.breathe)
            needleColor: gaugeModelElement.myColor
            isCurrent: gaugeModelElement.isCurrent
//            Text {
//                text: parent.gaugeModelElement.typeName
//                color: parent.needleColor
//                x: parent.x
//                y:parent.y
//                rotation: minAngle
//            }
        }
    }
    MainForm {
        anchors.rightMargin: 0
        anchors.bottomMargin: 125
        anchors.leftMargin: 0
        anchors.topMargin: -180
        anchors.fill: parent
        button1.onClicked: {timerHold.state = "watchRun"}
        button2.onClicked: {timerHold.state = "initial"}
    }
}
