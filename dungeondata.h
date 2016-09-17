#ifndef DUNGEONDATA_H
#define DUNGEONDATA_H

#include <QObject>
#include <QVector>

/** @brief Class storing a dungeon, which is a 2D rectangular array .
 *
 *  @details Stores a dungeon (room) as a 2D array of "Type" enums.
 *  Best use is made with no mutations after initialization : computing should operate on separate data.
 *
 *
 */

class DungeonData : public QObject
{
    Q_OBJECT

    public:
        enum Type {OutOfBounds = 0, Nothing = 1, Wall = 2, Floor = 3};
        Q_ENUM(Type)
        Q_PROPERTY(int width READ width WRITE setWidth NOTIFY widthChanged)
        Q_PROPERTY(int height READ height WRITE setHeight NOTIFY heightChanged)

    public:
        explicit DungeonData(QObject * parent = nullptr);


    public slots:
        Type at(qint32 x, qint32 y) const {
            if (x < 0 || y < 0 || x >= _width || y >= _height) return OutOfBounds; else return data[x+y*_width];
        }
        void setTypeAt(Type t, qint32 x, qint32 y) {
            if (x < 0 || y < 0 || x >= _width || y >= _height)
                    return;

            data[x+y*_width] = t;
            emit dataChanged();
        }

        void setWidth(qint32 v) {_width = v; data = QVector<Type>(_width*_height, Nothing); emit widthChanged();}
        void setHeight(qint32 v) {_height = v; data = QVector<Type>(_width*_height, Nothing); emit widthChanged();}

        qint32 width() const {return _width;}
        qint32 height() const {return _height;}

        void createFromFile(const QString& url);

    signals:
        void widthChanged();
        void heightChanged();
        void dataChanged();

    private:
        QVector<Type> data;
        qint32 _width = 5;
        qint32 _height = 5;

};

#endif // DUNGEONDATA_H
