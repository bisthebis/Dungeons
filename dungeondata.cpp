#include "dungeondata.h"

DungeonData::DungeonData(QObject * parent) : QObject(parent), data(_width*_height, Nothing)
{

}
