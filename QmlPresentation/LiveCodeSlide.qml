/****************************************************************************
**
** Copyright (C) 2017 The Qt Company Ltd.
** Contact: http://www.qt.io/licensing/
**
** This file is part of the examples of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:BSD$
** You may use this file under the terms of the BSD license as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of The Qt Company Ltd nor the names of its
**     contributors may be used to endorse or promote products derived
**     from this software without specific prior written permission.
**
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
**
** $QT_END_LICENSE$
**
****************************************************************************/


import QtQuick 2.5
import QtQuick.Particles 2.0
import QmlPresentation 1.0

Slide {
    id: slide

    title: "Qt Quick - Live Coding"

    x: parent.width * 0.01
    width: parent.width * 0.98
    y: parent.height * 0.18
    height: parent.height * 0.73

    PaletteLoader {
        id: paletteLoader
        name: "Dark"
    }

    property alias paletteName: paletteLoader.name
    property alias palette: paletteLoader.palette

    Item {
        id: incubationItem
        visible: false
    }

    Rectangle {
        id: itemContainer
        height: parent.height
        width: parent.width * 0.497
        anchors.right: parent.right;
        antialiasing: true
        //radius: slide.height * 0.03; // No radius here. add it in the code if desired
        color: Qt.rgba(0.0, 0.0, 0.0, 0.2);

        property var itm : null

        function replaceItem(sourceCode)
        {
            var obj = Qt.createQmlObject(sourceCode, incubationItem);
            if (itemContainer.itm != null)
                itemContainer.itm.destroy()
            obj.parent = itemContainer
            itemContainer.itm = obj
        }
    }

    Rectangle {
        height: parent.height
        width: parent.width * 0.497
        anchors.left: parent.left
        antialiasing: true
        radius: slide.height * 0.03;
        color: Qt.rgba(0.0, 0.0, 0.0, 0.8);

        clip: true;

        TextEdit {
            id: editor
            anchors.fill: parent;
            anchors.margins: 10

            font.pixelSize: 16
            color: "white"
            font.family: "courier"
            font.bold: true

            text:
"import QtQuick 2.5

Rectangle {
    id: rec
    anchors.fill: parent
    radius: rec.height * 0.03;
    color: Qt.rgba(1.0, 0.0, 0.0, 0.6);
    Text {
        anchors.centerIn: parent
        text: 'Yellow'
    }
}
"
            onTextChanged: {
                itemContainer.replaceItem(editor.text)
            }

            onCursorRectangleChanged: {
                emitter.burst(10)

            }

            ParticleSystem {
                id: sys1
                running: slide.visible
            }

            ImageParticle {
                system: sys1
                source: "particle.png"
                color: "white"
                colorVariation: 0.2
                alpha: 0
            }

            Emitter {
                id: emitter
                system: sys1

                x: editor.cursorRectangle.x - editor.cursorRectangle.height / 2;
                y: editor.cursorRectangle.y
                width: editor.cursorRectangle.height
                height: editor.cursorRectangle.height
                enabled: false

                lifeSpan: 1000

                velocity: PointDirection { xVariation: 30; yVariation: 30; }
                acceleration: PointDirection {xVariation: 30; yVariation: 30; y: 100 }

                endSize: 0

                size: 4
                sizeVariation: 2
            }

            SyntaxHighlighter {
                id: syntaxHighlighter

                normalColor: palette.editorNormal
                commentColor: palette.editorComment
                numberColor: palette.editorNumber
                stringColor: palette.editorString
                operatorColor: palette.editorOperator
                keywordColor: palette.editorKeyword
                builtInColor: palette.editorBuiltIn
                markerColor: palette.editorMarker
                itemColor: palette.editorItem
                propertyColor: palette.editorProperty
            }

            Component.onCompleted: {
                syntaxHighlighter.setHighlighter(editor)
            }
        } // TextEdit
    } // Rectangle
} // Slide
