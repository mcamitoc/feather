// SPDX-License-Identifier: BSD-3-Clause
// SPDX-FileCopyrightText: 2020-2023 The Monero Project

#include "ModelUtils.h"

#include <QDebug>
#include <QClipboard>
#include <QApplication>
#include <QFont>
#include <QFontDatabase>
#include <QFontInfo>

QString ModelUtils::displayAddress(const QString& address, int sections, const QString& sep) {
    QStringList list;
    if (sections < 1) sections = 1;
    for (int i = 0; i < sections; i += 1) {
        list << address.mid(i*5, 5);
    }
    list << "…"; // utf-8 Horizontal Ellipsis
    for (int i = sections; i > 0; i -= 1) {
        list << address.mid(address.length() - i * 5, 5);
    }
    return list.join(sep);
}

void ModelUtils::copyColumn(QModelIndex *index, int column) {
    QString string(index->model()->data(index->siblingAtColumn(column), Qt::UserRole).toString());
    QClipboard * clipboard = QApplication::clipboard();
    if (!clipboard) {
        qWarning() << "Unable to access clipboard";
        return;
    }
    clipboard->setText(string);
}

QFont ModelUtils::getMonospaceFont()
{
    if (QFontInfo(QApplication::font()).fixedPitch()) {
        return QApplication::font();
    }
    return QFontDatabase::systemFont(QFontDatabase::FixedFont);
}