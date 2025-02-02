// SPDX-License-Identifier: BSD-3-Clause
// SPDX-FileCopyrightText: 2020-2023 The Monero Project

#include "WalletListenerImpl.h"
#include "Wallet.h"

WalletListenerImpl::WalletListenerImpl(Wallet * w)
    : m_wallet(w)
    , m_phelper(w)
{

}

void WalletListenerImpl::moneySpent(const std::string &txId, uint64_t amount)
{
    qDebug() << __FUNCTION__;
    emit m_wallet->moneySpent(QString::fromStdString(txId), amount);
}

void WalletListenerImpl::moneyReceived(const std::string &txId, uint64_t amount)
{
    qDebug() << __FUNCTION__;
    emit m_wallet->moneyReceived(QString::fromStdString(txId), amount);
}

void WalletListenerImpl::unconfirmedMoneyReceived(const std::string &txId, uint64_t amount)
{
    qDebug() << __FUNCTION__;
    emit m_wallet->unconfirmedMoneyReceived(QString::fromStdString(txId), amount);
}

void WalletListenerImpl::newBlock(uint64_t height)
{
    // qDebug() << __FUNCTION__;
    m_wallet->onNewBlock(height);
    emit m_wallet->newBlock(height, m_wallet->daemonBlockChainTargetHeight());
}

void WalletListenerImpl::updated()
{
    emit m_wallet->updated();
}

// called when wallet refreshed by background thread or explicitly
void WalletListenerImpl::refreshed(bool success)
{
    QString message = m_wallet->errorString();
    m_wallet->onRefreshed(success);
    emit m_wallet->refreshed(success, message);
}

void WalletListenerImpl::onDeviceButtonRequest(uint64_t code)
{
    qDebug() << __FUNCTION__;
    emit m_wallet->deviceButtonRequest(code);
}

void WalletListenerImpl::onDeviceButtonPressed()
{
    qDebug() << __FUNCTION__;
    emit m_wallet->deviceButtonPressed();
}

void WalletListenerImpl::onDeviceError(const std::string &message)
{
    qDebug() << __FUNCTION__;
    emit m_wallet->deviceError(QString::fromStdString(message));
}

void WalletListenerImpl::onPassphraseEntered(const QString &passphrase, bool enter_on_device, bool entry_abort)
{
    qDebug() << __FUNCTION__;
    m_phelper.onPassphraseEntered(passphrase, enter_on_device, entry_abort);
}

Monero::optional<std::string> WalletListenerImpl::onDevicePassphraseRequest(bool & on_device)
{
    qDebug() << __FUNCTION__;
    return m_phelper.onDevicePassphraseRequest(on_device);
}
