import QtQuick 2.4
import QtQuick.Controls 1.3
import QtBluetooth 5.5

Item {
    width: 400
    height: 400

    ListView {
        id: listView1
        x: 45
        y: 46
        width: 110
        height: 160
        highlightRangeMode: ListView.NoHighlightRange
        delegate: Item {
            x: 5
            width: 80
            height: 40
            Row {
                id: row1
                Rectangle {
                    width: 40
                    height: 40
                    color: colorCode
                }

                Text {
                    text: name
                    font.bold: true
                    anchors.verticalCenter: parent.verticalCenter
                }
                spacing: 10
            }
        }
        model: ListModel {
            ListElement {
                name: "Grey"
                colorCode: "grey"
            }

            ListElement {
                name: "Red"
                colorCode: "red"
            }

            ListElement {
                name: "Blue"
                colorCode: "blue"
            }

            ListElement {
                name: "Green"
                colorCode: "green"
            }
        }
    }
}

