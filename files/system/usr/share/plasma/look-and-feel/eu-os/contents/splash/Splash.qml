
/*
 *   Copyright 2014 Marco Martin <mart@kde.org>
 *
 *   This program is free software; you can redistribute it and/or modify
 *   it under the terms of the GNU General Public License version 2,
 *   or (at your option) any later version, as published by the Free
 *   Software Foundation
 *
 *   This program is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU General Public License for more details
 *
 *   You should have received a copy of the GNU General Public
 *   License along with this program; if not, write to the
 *   Free Software Foundation, Inc.,
 *   51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 */
import QtQuick
import QtQuick.Window
import org.kde.kirigami as Kirigami

Rectangle {
    id: root
    color: "#003399"
    property int stage

    onStageChanged: {
        if (stage == 1) {
            introAnimation.running = true;
        } else if (stage == 5) {
            introAnimation.target = busyIndicator;
            introAnimation.from = 1;
            introAnimation.to = 0;
            introAnimation.running = true;
        }
    }

    Image {
        id: logo

        opacity: 0
        // source: "images/svganima-size.svgz"
        source: "images/eu-os-rect.svg"
        // paused: false
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        sourceSize.width:  parent.width
        width: parent.width * 0.4
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: busyIndicator

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.margins: Kirigami.Units.gridUnit
        anchors.topMargin: Kirigami.Units.gridUnit  * 2
        anchors.top: logo.bottom
        source: "images/busywidget.svgz"
        sourceSize.height: Kirigami.Units.gridUnit * 2
        sourceSize.width: Kirigami.Units.gridUnit * 2
        RotationAnimator on rotation {
            id: rotationAnimator
            from: 0
            to: 360
            duration: 1500
            loops: Animation.Infinite
        }
    }

    OpacityAnimator {
        id: introAnimation
        running: false
        target: logo
        from: 0
        to: 1
        duration: 1000
        easing.type: Easing.InOutQuad
    }
}
