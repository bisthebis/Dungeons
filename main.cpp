#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "dungeondata.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    qmlRegisterType<DungeonData>("Dungeon", 0, 1, "DungeonData");
    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
