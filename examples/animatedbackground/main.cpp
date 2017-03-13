#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QDebug>
#include "qmlpresentation.h"

int main(int argc, char *argv[])
{
    QGuiApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    registerQmlPresentation(engine);
    engine.load(QUrl(QStringLiteral("qrc:/SlideDeck.qml")));

    return app.exec();
}

