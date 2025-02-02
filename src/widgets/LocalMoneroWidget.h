// SPDX-License-Identifier: BSD-3-Clause
// SPDX-FileCopyrightText: 2020-2023 The Monero Project

#ifndef FEATHER_LOCALMONEROWIDGET_H
#define FEATHER_LOCALMONEROWIDGET_H

#include <QWidget>

#include "api/LocalMoneroApi.h"
#include "appcontext.h"
#include "model/LocalMoneroModel.h"

namespace Ui {
    class LocalMoneroWidget;
}

class LocalMoneroWidget : public QWidget
{
Q_OBJECT

public:
    explicit LocalMoneroWidget(QWidget *parent, QSharedPointer<AppContext> ctx);
    ~LocalMoneroWidget() override;

public slots:
    void skinChanged();

private slots:
    void onSearchClicked();
    void onSignUpClicked();
    void onApiResponse(const LocalMoneroApi::LocalMoneroResponse &resp);
    void onLoadMore();
    void onWsCountriesReceived(const QJsonArray &countries);
    void onWsCurrenciesReceived(const QJsonArray &currencies);
    void onWsPaymentMethodsReceived(const QJsonObject &payment_methods);

private:
    void searchOffers(int page = 0);
    void showContextMenu(const QPoint &point);
    void openOfferUrl();
    void viewOfferDetails();
    void updatePaymentMethods();

    QScopedPointer<Ui::LocalMoneroWidget> ui;
    QSharedPointer<AppContext> m_ctx;

    int m_currentPage = 0;

    LocalMoneroApi *m_api;
    LocalMoneroModel *m_model;
    UtilsNetworking *m_network;
    QJsonObject m_paymentMethods;
};


#endif //FEATHER_LOCALMONEROWIDGET_H
