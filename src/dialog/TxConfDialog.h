// SPDX-License-Identifier: BSD-3-Clause
// SPDX-FileCopyrightText: 2020-2023 The Monero Project

#ifndef FEATHER_TXCONFDIALOG_H
#define FEATHER_TXCONFDIALOG_H

#include <QDialog>

#include "appcontext.h"
#include "components.h"
#include "libwalletqt/PendingTransaction.h"
#include "libwalletqt/WalletManager.h"

namespace Ui {
    class TxConfDialog;
}

class TxConfDialog : public WindowModalDialog
{
Q_OBJECT

public:
    explicit TxConfDialog(QSharedPointer<AppContext> ctx, PendingTransaction *tx, const QString &address, const QString &description, QWidget *parent = nullptr);
    ~TxConfDialog() override;

    bool showAdvanced = false;

private:
    void setShowAdvanced();

    QScopedPointer<Ui::TxConfDialog> ui;
    QSharedPointer<AppContext> m_ctx;
    PendingTransaction *m_tx;
    QString m_address;
    QString m_description;
};

#endif //FEATHER_TXCONFDIALOG_H
