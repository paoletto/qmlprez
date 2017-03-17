INCLUDEPATH += $$PWD

DEFINES += QMLPRESENTATION_COMPONENTS_PWD="\"$$PWD/.."\"

HEADERS += qmlpresentation.h

OTHER_FILES +=  $$PWD/QmlPresentationTools.js \
                $$PWD/Slide.qml \
                $$PWD/SlideCounter.qml \
                $$PWD/Presentation.qml \
                $$PWD/LiveCodeSlide.qml \
                $$PWD/CodeSlide.qml \
                $$PWD/Clock.qml \
                $$PWD/particle.png


#message($$PWD)
