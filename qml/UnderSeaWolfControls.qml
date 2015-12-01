import QtQuick 2.2
import QtQuick.Window 2.1
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
CircularGauge {
    id: gauge
    property real valueChange: 0
    //property int modelIndex:0
    // property alias needleColor: gaugeStyle.needle
    value: 0
    anchors.verticalCenter: parent.verticalCenter
    property string gaugeName: "unknownName"
    property ListModel gaugeModel
    property CircularGauge nextGauge

    property var gaugeModelElement: gaugeModel.get(modelIndex)
    property bool isCurrent: false
    property real minAngle: -45
    property real maxAngle:  45
    property color needleColor: gaugeModelElement.myColor
    property int currentModelElement: 0
    maximumValue: gaugeModelElement.time
    property int modelIndex: 0
    //onIsCurrentChanged: { gaugeModelElement.isCurrent = isCurrent}
    style: CircularGaugeStyle {
        id: gaugeStyle
        minimumValueAngle: gauge.minAngle
        maximumValueAngle: gauge.maxAngle
        needle: Rectangle {
            id: gaugeNeedle
            property color needleColor: color
            y: outerRadius * 0.15
            implicitWidth: outerRadius * 0.03
            implicitHeight: outerRadius * 0.9
            antialiasing: true
            color: gauge.needleColor
        }
    }
    // gauge type displayed in gauge sector
    Rectangle {
        id: textWrapper

        width: 60
        height: 20
        radius: 4
        x: (gauge.x + gauge.width) /2
        anchors.centerIn: gauge.Center
        //color: apneaModel.get(index).myColor
//                    gradient: Gradient {
//                        GradientStop { position: 0.0; color: "#f8306a" }
//                        GradientStop { position: 1.0; color: "#fb5b40" }
//                    }

        Text {
            text: gauge.gaugeModelElement.typeName
            color: gauge.needleColor
            font.pixelSize: textWrapper.height - 4
    //        horizontalAlignment: Text.AlignHCenter
    //        verticalAlignment:   Text.AlignVCenter
            //anchors.centerIn: gauge.Center

            //x: gauge.x + gauge.width/2
            //y: gauge.horizontalCenter
            //rotation: 60 //(parent.minAngle + parent.maxAngle) / 2
        }

    }
    states:[
        State {
            name: "stateRun"
            //when: isCurrent
            PropertyChanges {
                target: gauge
                value: maximumValue
                isCurrent: true
            }
        },
        State {
            name: "initial"
            //when: !isCurrent
            PropertyChanges {
                target: gauge
                value: 0
                isCurrent: false
            }
        }
    ]
    transitions:[
        Transition {
            from: "*"
            to: "stateRun"
            // SpringAnimation { spring: 2; damping: 0.2; modulus: 360 }
            NumberAnimation{
                target: gauge
                property: "value"
                duration: (maximumValue - gauge.value) * 1000
            }
            onRunningChanged: {
                // the step is over - go to the next step
                if ((!running) && (gaugeModelElement.typeName == gaugeName)) {
                    console.log("running=", running, "modelIndex=", modelIndex)
                    state = "initial";
                    gaugeModel.get(modelIndex).isCurrent = false
                    if (nextGauge.modelIndex < gaugeModel.count){
                        nextGauge.modelIndex = modelIndex + 1
                        gaugeModel.get(nextGauge.modelIndex).isCurrent = true
                        //seting up next gauge as current
                        nextGauge.state = "stateRun"
                    }
                }
            }
        },
        Transition {
            from: "*"
            to: "initial"
             NumberAnimation{
                target: gauge
                property: "value"
                duration: 1000
            }
        }
    ]
    //Behavior on value { NumberAnimation { duration: gauge.valueChange * 1000 } }
    //style: IntervalGaugeStyle {}
}
