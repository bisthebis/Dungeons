#include "dungeondata.h"
#include <QFile>
#include <QUrl>
#include <QTextStream>
#include <QDebug>

DungeonData::DungeonData(QObject * parent) : QObject(parent)
{
    data = QVector<Type>(_width*_height, Nothing);
    connect(this, &DungeonData::widthChanged, this, &DungeonData::dataChanged);
    connect(this, &DungeonData::heightChanged, this, &DungeonData::dataChanged);

}

void DungeonData::createFromFile(const QString &url)
{
    QFile file(url);
    if (!file.open(QFile::ReadOnly | QFile::Text))
    {
        qDebug() << "Couldn't open file : " << file.errorString();
        return;
    }
    QTextStream in(&file);
    qint32 w, h;
    QVector<Type> newData;
    in >> w >> h;
    newData.reserve(w*h);
    for (int i = 0; i < w*h; ++i)
    {
        int type;
        in >> type;
        newData.push_back(Type(type));
    }
    _width = w;
    _height = h;
    data = std::move(newData);

    emit dataChanged();

}
