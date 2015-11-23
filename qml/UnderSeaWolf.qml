import QtQuick 2.2
import QtQuick.Window 2.1
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4

// Dashboards are typically in a landscape orientation, so we need to ensure
// our height is never greater than our width.
Item {
    id: container
    width: root.width
    height: Math.min(root.width, root.height)
    anchors.centerIn: parent

    Row {
        id: gaugeRow
        spacing: container.width * 0.02
        anchors.centerIn: parent


        CircularGauge {
            id: speedometer
            value: 0
            anchors.verticalCenter: parent.verticalCenter
            maximumValue: 120
            // We set the width to the height, because the height will always be
            // the more limited factor. Also, all circular controls letterbox
            // their contents to ensure that they remain circular. However, we
            // don't want to extra space on the left and right of our gauges,
            // because they're laid out horizontally, and that would create
            // large horizontal gaps between gauges on wide screens.
            width: height
            height: container.height * 0.5

            style: IntervalGaugeStyle {}
        }

        CircularGauge {
            id: tachometer
            width: height
            height: container.height * 0.25 - gaugeRow.spacing
            value: valueSource.rpm
            maximumValue: 8
            anchors.verticalCenter: parent.verticalCenter

            style: IntervalGaugeStyle {}
        }


    }
}

