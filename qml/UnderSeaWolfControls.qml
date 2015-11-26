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
    //width: parent.width
    property var gaugeModelElement
    property bool isCurrent: false
    property real minAngle: -45
    property real maxAngle:  45
    property color needleColor: "red"

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
    }
    Rectangle {
        id: textWrapper

        width: 60
        height: 20
        radius: 4
        x: (timer.x + timer.width) /2
        anchors.centerIn: timer.Center
        //color: apneaModel.get(index).myColor
//                    gradient: Gradient {
//                        GradientStop { position: 0.0; color: "#f8306a" }
//                        GradientStop { position: 1.0; color: "#fb5b40" }
//                    }

        Text {
            text: timer.gaugeModelElement.typeName
            color: timer.needleColor
            font.pixelSize: textWrapper.height - 4
    //        horizontalAlignment: Text.AlignHCenter
    //        verticalAlignment:   Text.AlignVCenter
            //anchors.centerIn: timer.Center

            //x: timer.x + timer.width/2
            //y: timer.horizontalCenter
            //rotation: 60 //(parent.minAngle + parent.maxAngle) / 2
        }

    }
    states:[
        State {
            name: "watchRun"
            when: isCurrent
            PropertyChanges {
                target: timer
                value: maximumValue
            }
        },
        State {
            name: "initial"
            when: !isCurrent
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
                duration: (maximumValue - timer.value) * 1000
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
