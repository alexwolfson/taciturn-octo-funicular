import QtQuick 2.5

Item {
    ListView {
        id: listView

        anchors.fill: parent

        delegate: detailsDelegate
        model: apneaModel
    }

    ListModel {
        id: apneaModel
        ListElement { time: 20; type: "breathe";}
        ListElement { time: 10; type: "hold";  }
        ListElement { time: 30; type: "walk";  }
    }


    Component {
        id: detailsDelegate

        Item {
            id: wrapper

            width: listView.width
            height: 30

            Rectangle {
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top

                height: 30

                color: "#333"
                border.color: Qt.lighter(color, 1.2)
                Text {
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.leftMargin: 4

                    font.pixelSize: parent.height-4
                    color: '#fff'

                    text: type + " " + time + qsTr("sec")
                }
            }

//            MouseArea {
//                anchors.fill: parent
//                onClicked: parent.state = "expanded"
//            }


//            states: [
//                State {
//                    name: "expanded"

//                    PropertyChanges { target: wrapper; height: listView.height }
//                    PropertyChanges { target: image; width: listView.width; height: listView.width; anchors.rightMargin: 0; anchors.topMargin: 30 }
//                    PropertyChanges { target: factsView; opacity: 1 }
//                    PropertyChanges { target: closeButton; opacity: 1 }
//                    PropertyChanges { target: wrapper.ListView.view; contentY: wrapper.y; interactive: false }
//                }
//            ]

//            transitions: [
//                Transition {
//                    NumberAnimation {
//                        duration: 200;
//                        properties: "height,width,anchors.rightMargin,anchors.topMargin,opacity,contentY"
//                    }
//                }
//            ]
        }
    }
}

