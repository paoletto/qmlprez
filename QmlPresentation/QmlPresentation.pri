INCLUDEPATH += $$PWD

DEFINES += QMLPRESENTATION_COMPONENTS_PWD="\"$$PWD/.."\"

HEADERS += qmlpresentation.h

OTHER_FILES +=  $$PWD/QmlPresentationTools.js \
                $$PWD/Slide.qml \
                $$PWD/SlideCounter.qml \
                $$PWD/Presentation.qml \
                $$PWD/CodeSlide.qml \
                $$PWD/Clock.qml


#message($$PWD)
