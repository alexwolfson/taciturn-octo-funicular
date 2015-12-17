import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Dialogs 1.2
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import QtQuick.Window 2.2
import QtQuick.Layouts 1.2
import QtMultimedia 5.5
//import "MainForm.ui.qml"
import "./qml"
ApplicationWindow {
    visible: true
    width: Math.max(480, Screen.width)
    height: Math.max(640, Screen.height)
    title: qsTr("Under Sea Wolf")
    id: root
    color: "black"
    Image {
        id: bkgImg
        source: "qml/images/surface.png"
        fillMode: Image.PreserveAspectFit
        opacity: 0.4
        anchors.fill: parent
    }
    menuBar: MenuBar {
        Menu {
            title: qsTr("Config")
            MenuItem {
                text: qsTr("&Open")
                onTriggered: console.log("Open action triggered");
            }
            MenuItem {
                text: qsTr("Exit")
                onTriggered: Qt.quit();
            }
        }
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
//    Text {
//        z:150
//        text: "Click Me!";
//        font.pointSize: 24;
//        width: 150; height: 50;

//        Audio {
//            id: playMusic
//            source: "qrc:/qml/sounds/breathe.wav"
//        }
//        MouseArea {
//            id: playArea
//            anchors.fill: parent
//            onPressed:  { playMusic.play()}
//        }
//    }
    Item {
        id: container
        width: root.width
        height: root.height
        anchors.fill: parent
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        //anchors.top: tocContainer.bottom
        anchors.topMargin: 5
        anchors.horizontalCenter: parent.horizontalCenter;
        //height: Math.min(root.width, root.height)
        ListModel {
            id: apneaModel
            //the following 3 properties will be used as indexes
            property int breathe: 0
            property int hold: 1
            property int walk: 2
            ListElement { time: 240; typeName: "brth";    myColor: "red";   isCurrent: false }
            ListElement { time: 120; typeName: "hold";    myColor: "blue";  isCurrent: false }
            ListElement { time: 360; typeName: "walk";    myColor: "green"; isCurrent: false }

            ListElement { time: 14; typeName: "brth";    myColor: "red";   isCurrent: false }
            ListElement { time: 11; typeName: "hold";    myColor: "blue";  isCurrent: false }
            ListElement { time: 12; typeName: "walk";    myColor: "green"; isCurrent: false }

            ListElement { time: 10; typeName: "brth";    myColor: "red";   isCurrent: false }
            ListElement { time: 16; typeName: "hold";    myColor: "blue";  isCurrent: false }
            ListElement { time: 18; typeName: "walk";    myColor: "green"; isCurrent: false }

            ListElement { time: 14; typeName: "brth";    myColor: "red";   isCurrent: false }
            ListElement { time: 18; typeName: "hold";    myColor: "blue";  isCurrent: false }
            ListElement { time: 12; typeName: "walk";    myColor: "green"; isCurrent: false }

            ListElement { time: 10; typeName: "brth";    myColor: "red";   isCurrent: false }
            ListElement { time: 16; typeName: "hold";    myColor: "blue";  isCurrent: false }
            ListElement { time: 18; typeName: "walk";    myColor: "green"; isCurrent: false }

            ListElement { time: 14; typeName: "brth";    myColor: "red";   isCurrent: false }
            ListElement { time: 11; typeName: "hold";    myColor: "blue";  isCurrent: false }
            ListElement { time: 12; typeName: "walk";    myColor: "green"; isCurrent: false }

            ListElement { time: 10; typeName: "brth";    myColor: "red";   isCurrent: false }
            ListElement { time: 16; typeName: "hold";    myColor: "blue";  isCurrent: false }
            ListElement { time: 18; typeName: "walk";    myColor: "green"; isCurrent: false }

            ListElement { time: 14; typeName: "brth";    myColor: "red";   isCurrent: false }
            ListElement { time: 11; typeName: "hold";    myColor: "blue";  isCurrent: false }
            ListElement { time: 12; typeName: "walk";    myColor: "green"; isCurrent: false }
        }

            //        ApneaList{
            //        }

        UnderSeaWolfControls {
            id:timerBreathe
            gaugeName: "brth"
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
        RowLayout {
            id: viewHeader
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 5
            width: parent.width - 2
            height:40

            Rectangle { width: (viewHeader.width - 4 * radius )/3 - 30; height:  parent.height; radius: parent.spacing
                        color: "red"
                        border.color: "black"
                        border.width: 2
                        Text { anchors.centerIn: parent
                                   font.pointSize: 20; text: qsTr("<b>Breathe</b><i>(Sec)<i>"); color: "white"; style: Text.Raised; styleColor: "black"  }
            }
            Rectangle { width: (viewHeader.width - 4 * radius )/3 -30; height:  parent.height; radius: parent.spacing
                        color: "blue"
                        border.color: "black"
                        border.width: 2
                        Text { anchors.centerIn: parent
                                   font.pointSize: 20; text: qsTr("<b>Hold</b><i>(Sec)<i>"); color: "white"; style: Text.Raised; styleColor: "black"  }
            }
            Rectangle { width: (viewHeader.width - 4 * radius )/3 - 30; height:  parent.height; radius: parent.spacing
                        color: "green"
                        border.color: "black"
                        border.width: 2
                        Text { anchors.centerIn: parent
                                   font.pointSize: 20; text: qsTr("<b>Walk</b><i>(Sec)<i>"); color: "white"; style: Text.Raised; styleColor: "black"  }
            }
        }
        GridView {
            id: view
            anchors.rightMargin: -1
            anchors.bottomMargin: -1
            anchors.leftMargin: 1
            anchors.topMargin: 46
            anchors.top:viewHeader.bottom
            anchors.fill: parent

            cellWidth: (parent.width - 2 * anchors.margins) /12 - 3
            cellHeight: 40
            clip: true
            model: apneaModel
            delegate: apneaDelegate


            Component {
                id: apneaDelegate

                Rectangle {
                    property real myRadius: 5
                    id: wrapper
                    z: apneaModel.get(index).isCurrent? 100:10
                    width: apneaModel.get(index).isCurrent? 2* view.cellWidth : view.cellWidth -myRadius
                    height: apneaModel.get(index).isCurrent? 2* view.cellHeight + myRadius: view.cellHeight -myRadius
                    radius:apneaModel.get(index).isCurrent? 2 * myRadius: myRadius
                    color: apneaModel.get(index).myColor
                    border.color: apneaModel.get(index).isCurrent? "white": "black"
                    border.width: 2
                    //                    gradient: Gradient {
                    //                        GradientStop { position: 0.0; color: "#f8306a" }
                    //                        GradientStop { position: 1.0; color: "#fb5b40" }
                    //                    }

                    Text {
                        id:timeText
                        anchors.centerIn: parent
                        font.pixelSize: parent.height - 2
                        text: "<b>" + time + "</b>"; color: "white"; style: Text.Raised; styleColor: "black"
                        //text: index + ". " + typeName + " " + time + "sec."

                    }
                    Behavior on width {NumberAnimation{duration:500}}
                    Behavior on height {NumberAnimation{duration:500}}
                }
            }

        }
    }
    MainForm {
        y: 160
        height: 142
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.rightMargin: 0
        //anchors.top: view.bottom
        anchors.topMargin: 10
        anchors.leftMargin: 0
        button1.onClicked: {
            timerBreathe.modelIndex = 0
            timerBreathe.state = "stateRun";
            timerBreathe.isCurrent = true
            apneaModel.get(0).isCurrent = true
            walkControl.enabled = false
            button2.enabled = true
        }
        button2.onClicked: {
            timerBreathe.state = "initial"
            timerHold.state = "initial"
            timerWalk.state = "initial"
            //apneaModel.get(apneaModel.index).isCurrent = false
            //apneaModel.index = 0

            walkControl.enabled = true
            button2.enabled = false

        }
        walkControl.onClicked: {
            if (walkControl.text === qsTr("Finish Walk")){
                //enabled = false;
                timerWalk.state = "initial";
                timerWalk.maximumValue = timerWalk.value;
                walkControl.text = qsTr("Breath")
            }
       }
    }
}
