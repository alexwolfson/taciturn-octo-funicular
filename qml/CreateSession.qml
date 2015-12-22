import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Dialogs 1.2
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import QtQuick.Window 2.2
import QtQuick.Layouts 1.2
Item {
    width: root.width
    height: root.height
    visible:true
    anchors.fill: root
    //flags: Qt.Dialog
    //modality: Qt.ApplicationModal

    Item {
        property variant lapTemplate: {"breath": 60, "hold": 60, "walk": 60}
        property variant sessionTemplate: {"sessionName":"", "stopTime":120, cyclesNb:6, "lastRepeat": true, "laps":[]
    }
    GridLayout {
        //z:100
        id: mainLayout
        columns: 2
        rowSpacing: 5
        columnSpacing: 5
        anchors {
            top: parent.top;
            left: parent.left
            right: parent.right
        }

        Label { text: "sessionName" }
        TextField { id: sessionName; }
        Label { text: "numberOfCycles"}
        TextField { id: numberOfCycles}
        Label { text: "repeatLast"}
        Switch {checked:false}
        Label { text: "maxHoldTime"}
        Label { text: "holdIncrement"}
        Label { text: "minBtratheTime"}
        Label { text: "breathDecrement"}
    }
  }
}
