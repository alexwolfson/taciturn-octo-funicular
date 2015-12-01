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
        source: "qml/images/surface.png"
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
            ListElement { time: 10; typeName: "breathe"; myColor: "red";   isCurrent: false }
            ListElement { time: 16; typeName: "hold";    myColor: "blue";  isCurrent: false }
            ListElement { time: 18; typeName: "walk";    myColor: "green"; isCurrent: false }
            ListElement { time: 14; typeName: "breathe"; myColor: "red";   isCurrent: false }
            ListElement { time: 8;  typeName: "hold";    myColor: "blue";  isCurrent: false }
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
                    border.color: apneaModel.get(index).isCurrent? "white": "black"
    //                    gradient: Gradient {
    //                        GradientStop { position: 0.0; color: "#f8306a" }
    //                        GradientStop { position: 1.0; color: "#fb5b40" }
    //                    }

                    Text {
                        anchors.centerIn: parent
                        font.pixelSize: 20
                        text: index + ". " + typeName + " " + time + "sec."

                    }

                  }
           }
    }

//        ApneaList{
//        }

        UnderSeaWolfControls {
            id:timerBreathe
            gaugeName: "breathe"
            modelIndex: apneaModel.breathe
            minAngle:     185
            maxAngle:     295
            anchors.centerIn: parent
            gaugeModel: apneaModel
            nextGauge:timerHold
        }
        UnderSeaWolfControls {
            id:timerHold
            gaugeName:  "hold"
            modelIndex: apneaModel.hold
            minAngle:     -55
            maxAngle:     55
            anchors.centerIn: parent
            gaugeModel: apneaModel
            nextGauge: timerWalk
        }
        UnderSeaWolfControls {
            id:timerWalk
            gaugeName: "walk"
            modelIndex: apneaModel.walk
            minAngle:     65
            maxAngle:     175
            anchors.centerIn: parent
            gaugeModel: apneaModel
            nextGauge: timerBreathe
        }
    }
    MainForm {
        anchors.rightMargin: 0
        anchors.bottomMargin: 125
        anchors.leftMargin: 0
        anchors.topMargin: -180
        anchors.fill: parent
        button1.onClicked: {
            timerBreathe.modelIndex = 0
            timerBreathe.state = "stateRun";
            timerBreathe.isCurrent = true
        }
        button2.onClicked: {timerBreathe.state = "initial"}
    }
}
