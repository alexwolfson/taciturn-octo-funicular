import QtQuick 2.2
import QtQuick.Window 2.1
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
CircularGauge {
    id: timer
    property real valueChange: 0
    // property alias needleColor: gaugeStyle.needle
    value: 0
    anchors.verticalCenter: parent.verticalCenter
    maximumValue: 240
    property real minAngle: -45
    property real maxAngle:  45
    property color needleColor: "red"
    clip: true
//    property Text imageFile:{
//        id: image
//        text: qsTr("")
//    }

    style: CircularGaugeStyle {
        id: gaugeStyle
        minimumValueAngle: timer.minAngle
        maximumValueAngle: timer.maxAngle
        needle: Rectangle {
            id: gaugeNeedle
            property color needleColor: color
            y: outerRadius * 0.15
            implicitWidth: outerRadius * 0.03
            implicitHeight: outerRadius * 0.9
            antialiasing: true
            color: timer.needleColor
        }
//        foreground: Item {
//            Rectangle {
//                width: outerRadius * 0.2
//                height: width
//                radius: width / 2
//                color: "#e5e5e5"
//                anchors.centerIn: parent
//            }
//        }

//        Image {
//            id: name
//            source: timer.imageFile.text
//        }
    }
    // We set the width to the height, because the height will always be
    // the more limited factor. Also, all circular controls letterbox
    // their contents to ensure that they remain circular. However, we
    // don't want to extra space on the left and right of our gauges,
    // because they're laid out horizontally, and that would create
    // large horizontal gaps between gauges on wide screens.
    //width: height
    //height: container.height * 0.5
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
            // SpringAnimation { spring: 2; damping: 0.2; modulus: 360 }
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
