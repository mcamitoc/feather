// SPDX-License-Identifier: BSD-3-Clause
// SPDX-FileCopyrightText: 2020-2022 The Monero Project

#ifndef FEATHER_MAINWINDOW_H
#define FEATHER_MAINWINDOW_H

#include <QMainWindow>
#include <QSystemTrayIcon>
#include <QMenu>

#include "appcontext.h"
#include "components.h"
#include "CalcWindow.h"
#include "SettingsDialog.h"

#include "dialog/AboutDialog.h"
#include "dialog/SignVerifyDialog.h"
#include "dialog/VerifyProofDialog.h"
#include "dialog/SeedDialog.h"
#include "dialog/PasswordChangeDialog.h"
#include "dialog/KeysDialog.h"
#include "dialog/AboutDialog.h"
#include "dialog/SplashDialog.h"
#include "libwalletqt/Wallet.h"
#include "model/SubaddressModel.h"
#include "model/SubaddressProxyModel.h"
#include "model/TransactionHistoryModel.h"
#include "model/CoinsModel.h"
#include "model/CoinsProxyModel.h"
#include "utils/networking.h"
#include "utils/config.h"
#include "utils/EventFilter.h"
#include "widgets/CCSWidget.h"
#include "widgets/RedditWidget.h"
#include "widgets/TickerWidget.h"
#include "wizard/WalletWizard.h"

#include "ContactsWidget.h"
#include "HistoryWidget.h"
#include "SendWidget.h"
#include "ReceiveWidget.h"
#include "CoinsWidget.h"

#include "WindowManager.h"

#ifdef HAS_LOCALMONERO
#include "widgets/LocalMoneroWidget.h"
#endif

#ifdef HAS_XMRIG
#include "widgets/XMRigWidget.h"
#endif

namespace Ui {
    class MainWindow;
}

struct ToggleTab {
    ToggleTab(QWidget *tab, QString name, QString description, QAction *menuAction, Config::ConfigKey configKey) :
            tab(tab), key(std::move(name)), name(std::move(description)), menuAction(menuAction), configKey(configKey){}
    QWidget *tab;
    QString key;
    QString name;
    QAction *menuAction;
    Config::ConfigKey configKey;
};

class WindowManager;
class MainWindow : public QMainWindow
{
Q_OBJECT

public:
    explicit MainWindow(WindowManager *windowManager, Wallet *wallet, QWidget *parent = nullptr);
    ~MainWindow() override;

    QString walletName();
    QString walletCachePath();
    QString walletKeysPath();

    enum Tabs {
        HOME = 0,
        HISTORY,
        SEND,
        RECEIVE,
        COINS,
        CALC,
        EXCHANGES,
        XMRIG
    };

    enum TabsHome {
        CCS,
        REDDIT
    };

    void showOrHide();
    void bringToFront();

signals:
    void closed();

private slots:
    // TODO: use a consistent naming convention for slots
    // Menu
    void menuOpenClicked();
    void menuNewRestoreClicked();
    void menuQuitClicked();
    void menuSettingsClicked();
    void menuAboutClicked();
    void menuSignVerifyClicked();
    void menuVerifyTxProof();
    void menuWalletCloseClicked();
    void menuTorClicked();
    void menuToggleTabVisible(const QString &key);
    void menuClearHistoryClicked();
    void onExportHistoryCSV(bool checked);
    void onExportContactsCSV(bool checked);
    void onCreateDesktopEntry(bool checked);
    void onShowDocumentaton();
    void onReportBug(bool checked);
    void onShowSettingsPage(int page);

    // offline tx signing
    void exportKeyImages();
    void importKeyImages();
    void exportOutputs();
    void importOutputs();
    void loadUnsignedTx();
    void loadUnsignedTxFromClipboard();
    void loadSignedTx();
    void loadSignedTxFromText();

    void onTorConnectionStateChanged(bool connected);
    void onCheckUpdatesComplete(const QString &version, const QString &binaryFilename, const QString &hash, const QString &signer);
    void onShowUpdateCheck(const QString &version, const QString &binaryFilename, const QString &hash, const QString &signer);
    void onSignedHashesReceived(QNetworkReply *reply, const QString &platformTag, const QString &version);
    void onInitiateTransaction();
    void onEndTransaction();
    void onKeysCorrupted();
    void onSelectedInputsChanged(const QStringList &selectedInputs);

    // libwalletqt
    void onBalanceUpdated(quint64 balance, quint64 spendable);
    void onSynchronized();
    void onWalletOpened();
    void onConnectionStatusChanged(int status);
    void onCreateTransactionError(const QString &message);
    void onCreateTransactionSuccess(PendingTransaction *tx, const QVector<QString> &address);
    void onTransactionCommitted(bool status, PendingTransaction *tx, const QStringList& txid);

    // Dialogs
    void showWalletInfoDialog();
    void showSeedDialog();
    void showPasswordDialog();
    void showKeysDialog();
    void showViewOnlyDialog();
    void showWalletCacheDebugDialog();
    void showAccountSwitcherDialog();
    void showAddressChecker();

    void donateButtonClicked();
    void showCalcWindow();
    void payToMany();
    void showSendTab();
    void showHistoryTab();
    void showSendScreen(const CCSEntry &entry);
    void skinChanged(const QString &skinName);
    void onBlockchainSync(int height, int target);
    void onRefreshSync(int height, int target);
    void onViewOnBlockExplorer(const QString &txid);
    void onResendTransaction(const QString &txid);
    void importContacts();
    void importTransaction();
    void onDeviceError(const QString &error);
    void onDeviceButtonRequest(quint64 code);
    void onDeviceButtonPressed();
    void onWalletPassphraseNeeded(bool on_device);
    void menuHwDeviceClicked();
    void onUpdatesAvailable(const QJsonObject &updates);
    void toggleSearchbar(bool enabled);
    void tryStoreWallet();
    void onWebsocketStatusChanged(bool enabled);

private:
    friend WindowManager;

    void initStatusBar();
    void initWidgets();
    void initMenu();
    void initHome();
    void initWalletContext();

    void closeEvent(QCloseEvent *event) override;

    void saveGeo();
    void restoreGeo();
    void showDebugInfo();
    void showNodeExhaustedMessage();
    void showWSNodeExhaustedMessage();
    void createUnsignedTxDialog(UnsignedTransaction *tx);
    void updatePasswordIcon();
    void updateNetStats();
    void rescanSpent();
    void setStatusText(const QString &text, bool override = false, int timeout = 1000);
    void showBalanceDialog();
    QString statusDots();
    QString getPlatformTag();
    void displayWalletErrorMsg(const QString &err);
    QString getHardwareDevice();
    void updateTitle();
    void donationNag();
    void addToRecentlyOpened(const QString &filename);
    void updateRecentlyOpenedMenu();
    void updateWidgetIcons();
    bool verifyPassword();
    void patchStylesheetMac();
    void userActivity();
    void checkUserActivity();

    QIcon hardwareDevicePairedIcon();
    QIcon hardwareDeviceUnpairedIcon();

    QScopedPointer<Ui::MainWindow> ui;
    WindowManager *m_windowManager;
    QSharedPointer<AppContext> m_ctx;

    CalcWindow *m_windowCalc = nullptr;
    SplashDialog *m_splashDialog = nullptr;

#ifdef HAS_XMRIG
    XMRigWidget *m_xmrig = nullptr;
#endif
    ContactsWidget *m_contactsWidget = nullptr;
    HistoryWidget *m_historyWidget = nullptr;
    SendWidget *m_sendWidget = nullptr;
    ReceiveWidget *m_receiveWidget = nullptr;
    CoinsWidget *m_coinsWidget = nullptr;
#ifdef HAS_LOCALMONERO
    LocalMoneroWidget *m_localMoneroWidget = nullptr;
#endif

    QList<TickerWidgetBase*> m_tickerWidgets;
    BalanceTickerWidget *m_balanceTickerWidget;

    QPointer<QAction> m_clearRecentlyOpenAction;

    // lower status bar
    QPushButton *m_statusUpdateAvailable;
    ClickableLabel *m_statusLabelBalance;
    QLabel *m_statusLabelStatus;
    QLabel *m_statusLabelNetStats;
    StatusBarButton *m_statusAccountSwitcher;
    StatusBarButton *m_statusBtnConnectionStatusIndicator;
    StatusBarButton *m_statusBtnPassword;
    StatusBarButton *m_statusBtnPreferences;
    StatusBarButton *m_statusBtnSeed;
    StatusBarButton *m_statusBtnTor;
    StatusBarButton *m_statusBtnHwDevice;

    QSignalMapper *m_tabShowHideSignalMapper;
    QMap<QString, ToggleTab*> m_tabShowHideMapper;

    QTimer m_updateBytes;
    QTimer m_checkUserActivity;

    QString m_statusText;
    int m_statusDots;
    bool m_constructingTransaction = false;
    bool m_statusOverrideActive = false;
    bool m_showDeviceError = false;
    QTimer m_txTimer;

    bool cleanedUp = false;
    bool m_criticalWarningShown = false;

    EventFilter *m_eventFilter = nullptr;
    qint64 m_userLastActive = QDateTime::currentSecsSinceEpoch();
};

#endif // FEATHER_MAINWINDOW_H
