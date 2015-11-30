import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Dialogs 1.2
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
Item {
    UnderSeaWolfControls {
        id:timerBreathe
        gaugeName: "breathe"
        minAngle:     185
        maxAngle:     295
        anchors.centerIn: parent
        gaugeModel: apneaModel
        gaugeModelElement: apneaModel.get(apneaModel.breathe)
    }
    UnderSeaWolfControls {
        id:timerHold
        gaugeName:  "hold"
        maximumValue: 30
        minAngle:     -55
        maxAngle:     55
        anchors.centerIn: parent
        gaugeModel: apneaModel
        gaugeModelElement: apneaModel.get(apneaModel.hold)
    }
    UnderSeaWolfControls {
        id:timerWalk
        gaugeName: "walk"
        maximumValue: 20
        minAngle:     65
        maxAngle:     175
        anchors.centerIn: parent
        gaugeModel: apneaModel
        gaugeModelElement: apneaModel.get(apneaModel.walk)
    }
}
