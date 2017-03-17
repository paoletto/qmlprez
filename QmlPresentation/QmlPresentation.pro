TEMPLATE = lib
CONFIG += qt plugin
QT += qml quick

DESTDIR = $$PWD/../bin/imports/
TARGET = qmlpresentationplugin

HEADERS += \
    QMLHighlighter.h \
    SyntaxHighlighter.h

SOURCES += plugin.cpp \
    QMLHighlighter.cpp \
    SyntaxHighlighter.cpp

OTHER_FILES +=  QmlPresentation.pri \
                Presentation.qml \
                Slide.qml \
                SlideCounter.qml \
                Clock.qml \
                CodeSlide.qml \
                LiveCodeSlide.qml \
                QmlPresentationTools.js \
                palettes/PaletteLoader.qml \
                palettes/BasePalette.qml \
                palettes/CutePalette.qml \
                palettes/DarkPalette.qml \
                palettes/LightPalette.qml \
                particle.png \
                qmlpresentation.h \
                qmldir

