.class public Lcom/microsoft/appcenter/crashes/Crashes;
.super Lcom/microsoft/appcenter/AbstractAppCenterService;
.source "Crashes.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/microsoft/appcenter/crashes/Crashes$ErrorLogReport;,
        Lcom/microsoft/appcenter/crashes/Crashes$DefaultCrashesListener;,
        Lcom/microsoft/appcenter/crashes/Crashes$CallbackProcessor;,
        Lcom/microsoft/appcenter/crashes/Crashes$ExceptionModelBuilder;
    }
.end annotation


# static fields
.field public static final ALWAYS_SEND:I = 0x2

.field private static final DEFAULT_ERROR_REPORTING_LISTENER:Lcom/microsoft/appcenter/crashes/CrashesListener;

.field public static final DONT_SEND:I = 0x1

.field static final ERROR_GROUP:Ljava/lang/String; = "groupErrors"
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field

.field public static final LOG_TAG:Ljava/lang/String; = "AppCenterCrashes"

.field private static final MAX_ATTACHMENT_PER_CRASH:I = 0x2

.field private static final MAX_ATTACHMENT_SIZE:I = 0x700000

.field public static final PREF_KEY_ALWAYS_SEND:Ljava/lang/String; = "com.microsoft.appcenter.crashes.always.send"
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field

.field static final PREF_KEY_MEMORY_RUNNING_LEVEL:Ljava/lang/String; = "com.microsoft.appcenter.crashes.memory"
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field

.field public static final SEND:I = 0x0

.field private static final SERVICE_NAME:Ljava/lang/String; = "Crashes"

.field private static sInstance:Lcom/microsoft/appcenter/crashes/Crashes;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "StaticFieldLeak"
        }
    .end annotation
.end field


# instance fields
.field private mAutomaticProcessing:Z

.field private mContext:Landroid/content/Context;

.field private mCrashesListener:Lcom/microsoft/appcenter/crashes/CrashesListener;

.field private mDevice:Lcom/microsoft/appcenter/ingestion/models/Device;

.field private final mErrorReportCache:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/util/UUID;",
            "Lcom/microsoft/appcenter/crashes/Crashes$ErrorLogReport;",
            ">;"
        }
    .end annotation
.end field

.field private final mFactories:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/microsoft/appcenter/ingestion/models/json/LogFactory;",
            ">;"
        }
    .end annotation
.end field

.field private mHasReceivedMemoryWarningInLastSession:Z

.field private mInitializeTimestamp:J

.field private mLastSessionErrorReport:Lcom/microsoft/appcenter/crashes/model/ErrorReport;

.field private mLogSerializer:Lcom/microsoft/appcenter/ingestion/models/json/LogSerializer;

.field private mMemoryWarningListener:Landroid/content/ComponentCallbacks2;

.field private mSavedUncaughtException:Z

.field private mUncaughtExceptionHandler:Lcom/microsoft/appcenter/crashes/UncaughtExceptionHandler;

.field private final mUnprocessedErrorReports:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/util/UUID;",
            "Lcom/microsoft/appcenter/crashes/Crashes$ErrorLogReport;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 130
    new-instance v0, Lcom/microsoft/appcenter/crashes/Crashes$DefaultCrashesListener;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/microsoft/appcenter/crashes/Crashes$DefaultCrashesListener;-><init>(Lcom/microsoft/appcenter/crashes/Crashes$1;)V

    sput-object v0, Lcom/microsoft/appcenter/crashes/Crashes;->DEFAULT_ERROR_REPORTING_LISTENER:Lcom/microsoft/appcenter/crashes/CrashesListener;

    .line 136
    sput-object v1, Lcom/microsoft/appcenter/crashes/Crashes;->sInstance:Lcom/microsoft/appcenter/crashes/Crashes;

    return-void
.end method

.method private constructor <init>()V
    .locals 4

    .line 211
    invoke-direct {p0}, Lcom/microsoft/appcenter/AbstractAppCenterService;-><init>()V

    const/4 v0, 0x1

    .line 201
    iput-boolean v0, p0, Lcom/microsoft/appcenter/crashes/Crashes;->mAutomaticProcessing:Z

    .line 212
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/microsoft/appcenter/crashes/Crashes;->mFactories:Ljava/util/Map;

    .line 213
    iget-object v0, p0, Lcom/microsoft/appcenter/crashes/Crashes;->mFactories:Ljava/util/Map;

    invoke-static {}, Lcom/microsoft/appcenter/crashes/ingestion/models/json/ManagedErrorLogFactory;->getInstance()Lcom/microsoft/appcenter/crashes/ingestion/models/json/ManagedErrorLogFactory;

    move-result-object v1

    const-string v2, "managedError"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 214
    iget-object v0, p0, Lcom/microsoft/appcenter/crashes/Crashes;->mFactories:Ljava/util/Map;

    invoke-static {}, Lcom/microsoft/appcenter/crashes/ingestion/models/json/HandledErrorLogFactory;->getInstance()Lcom/microsoft/appcenter/crashes/ingestion/models/json/HandledErrorLogFactory;

    move-result-object v1

    const-string v3, "handledError"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 215
    iget-object v0, p0, Lcom/microsoft/appcenter/crashes/Crashes;->mFactories:Ljava/util/Map;

    invoke-static {}, Lcom/microsoft/appcenter/crashes/ingestion/models/json/ErrorAttachmentLogFactory;->getInstance()Lcom/microsoft/appcenter/crashes/ingestion/models/json/ErrorAttachmentLogFactory;

    move-result-object v1

    const-string v3, "errorAttachment"

    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 216
    new-instance v0, Lcom/microsoft/appcenter/ingestion/models/json/DefaultLogSerializer;

    invoke-direct {v0}, Lcom/microsoft/appcenter/ingestion/models/json/DefaultLogSerializer;-><init>()V

    iput-object v0, p0, Lcom/microsoft/appcenter/crashes/Crashes;->mLogSerializer:Lcom/microsoft/appcenter/ingestion/models/json/LogSerializer;

    .line 217
    iget-object v0, p0, Lcom/microsoft/appcenter/crashes/Crashes;->mLogSerializer:Lcom/microsoft/appcenter/ingestion/models/json/LogSerializer;

    invoke-static {}, Lcom/microsoft/appcenter/crashes/ingestion/models/json/ManagedErrorLogFactory;->getInstance()Lcom/microsoft/appcenter/crashes/ingestion/models/json/ManagedErrorLogFactory;

    move-result-object v1

    invoke-interface {v0, v2, v1}, Lcom/microsoft/appcenter/ingestion/models/json/LogSerializer;->addLogFactory(Ljava/lang/String;Lcom/microsoft/appcenter/ingestion/models/json/LogFactory;)V

    .line 218
    iget-object v0, p0, Lcom/microsoft/appcenter/crashes/Crashes;->mLogSerializer:Lcom/microsoft/appcenter/ingestion/models/json/LogSerializer;

    invoke-static {}, Lcom/microsoft/appcenter/crashes/ingestion/models/json/ErrorAttachmentLogFactory;->getInstance()Lcom/microsoft/appcenter/crashes/ingestion/models/json/ErrorAttachmentLogFactory;

    move-result-object v1

    invoke-interface {v0, v3, v1}, Lcom/microsoft/appcenter/ingestion/models/json/LogSerializer;->addLogFactory(Ljava/lang/String;Lcom/microsoft/appcenter/ingestion/models/json/LogFactory;)V

    .line 219
    sget-object v0, Lcom/microsoft/appcenter/crashes/Crashes;->DEFAULT_ERROR_REPORTING_LISTENER:Lcom/microsoft/appcenter/crashes/CrashesListener;

    iput-object v0, p0, Lcom/microsoft/appcenter/crashes/Crashes;->mCrashesListener:Lcom/microsoft/appcenter/crashes/CrashesListener;

    .line 220
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lcom/microsoft/appcenter/crashes/Crashes;->mUnprocessedErrorReports:Ljava/util/Map;

    .line 221
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lcom/microsoft/appcenter/crashes/Crashes;->mErrorReportCache:Ljava/util/Map;

    return-void
.end method

.method static synthetic access$100(Lcom/microsoft/appcenter/crashes/Crashes;)Lcom/microsoft/appcenter/crashes/model/ErrorReport;
    .locals 0

    .line 72
    iget-object p0, p0, Lcom/microsoft/appcenter/crashes/Crashes;->mLastSessionErrorReport:Lcom/microsoft/appcenter/crashes/model/ErrorReport;

    return-object p0
.end method

.method static synthetic access$1000(Lcom/microsoft/appcenter/crashes/Crashes;I)V
    .locals 0

    .line 72
    invoke-direct {p0, p1}, Lcom/microsoft/appcenter/crashes/Crashes;->handleUserConfirmation(I)V

    return-void
.end method

.method static synthetic access$1100(Lcom/microsoft/appcenter/crashes/Crashes;)Z
    .locals 0

    .line 72
    iget-boolean p0, p0, Lcom/microsoft/appcenter/crashes/Crashes;->mAutomaticProcessing:Z

    return p0
.end method

.method static synthetic access$1400(Lcom/microsoft/appcenter/crashes/Crashes;Ljava/util/UUID;)V
    .locals 0

    .line 72
    invoke-direct {p0, p1}, Lcom/microsoft/appcenter/crashes/Crashes;->removeAllStoredErrorLogFiles(Ljava/util/UUID;)V

    return-void
.end method

.method static synthetic access$1600(Lcom/microsoft/appcenter/crashes/Crashes;)Lcom/microsoft/appcenter/channel/Channel;
    .locals 0

    .line 72
    iget-object p0, p0, Lcom/microsoft/appcenter/crashes/Crashes;->mChannel:Lcom/microsoft/appcenter/channel/Channel;

    return-object p0
.end method

.method static synthetic access$1700(Lcom/microsoft/appcenter/crashes/Crashes;)Z
    .locals 0

    .line 72
    invoke-direct {p0}, Lcom/microsoft/appcenter/crashes/Crashes;->sendCrashReportsOrAwaitUserConfirmation()Z

    move-result p0

    return p0
.end method

.method static synthetic access$200(Lcom/microsoft/appcenter/crashes/Crashes;)Z
    .locals 0

    .line 72
    iget-boolean p0, p0, Lcom/microsoft/appcenter/crashes/Crashes;->mHasReceivedMemoryWarningInLastSession:Z

    return p0
.end method

.method static synthetic access$300(I)V
    .locals 0

    .line 72
    invoke-static {p0}, Lcom/microsoft/appcenter/crashes/Crashes;->saveMemoryRunningLevel(I)V

    return-void
.end method

.method static synthetic access$400(Lcom/microsoft/appcenter/crashes/Crashes;Ljava/util/UUID;)V
    .locals 0

    .line 72
    invoke-direct {p0, p1}, Lcom/microsoft/appcenter/crashes/Crashes;->removeStoredThrowable(Ljava/util/UUID;)V

    return-void
.end method

.method static synthetic access$500(Lcom/microsoft/appcenter/crashes/Crashes;Ljava/lang/Runnable;)V
    .locals 0

    .line 72
    invoke-virtual {p0, p1}, Lcom/microsoft/appcenter/crashes/Crashes;->post(Ljava/lang/Runnable;)V

    return-void
.end method

.method static synthetic access$600(Lcom/microsoft/appcenter/crashes/Crashes;)Lcom/microsoft/appcenter/crashes/CrashesListener;
    .locals 0

    .line 72
    iget-object p0, p0, Lcom/microsoft/appcenter/crashes/Crashes;->mCrashesListener:Lcom/microsoft/appcenter/crashes/CrashesListener;

    return-object p0
.end method

.method static synthetic access$700(Lcom/microsoft/appcenter/crashes/Crashes;)Lcom/microsoft/appcenter/channel/Channel;
    .locals 0

    .line 72
    iget-object p0, p0, Lcom/microsoft/appcenter/crashes/Crashes;->mChannel:Lcom/microsoft/appcenter/channel/Channel;

    return-object p0
.end method

.method static synthetic access$800(Lcom/microsoft/appcenter/crashes/Crashes;Ljava/util/UUID;Ljava/lang/Iterable;)V
    .locals 0

    .line 72
    invoke-direct {p0, p1, p2}, Lcom/microsoft/appcenter/crashes/Crashes;->sendErrorAttachment(Ljava/util/UUID;Ljava/lang/Iterable;)V

    return-void
.end method

.method static synthetic access$900(Lcom/microsoft/appcenter/crashes/Crashes;)Ljava/util/Map;
    .locals 0

    .line 72
    iget-object p0, p0, Lcom/microsoft/appcenter/crashes/Crashes;->mUnprocessedErrorReports:Ljava/util/Map;

    return-object p0
.end method

.method public static generateTestCrash()V
    .locals 2

    .line 289
    sget-boolean v0, Lcom/microsoft/appcenter/Constants;->APPLICATION_DEBUGGABLE:Z

    if-nez v0, :cond_0

    const-string v0, "AppCenterCrashes"

    const-string v1, "The application is not debuggable so SDK won\'t generate test crash"

    .line 292
    invoke-static {v0, v1}, Lcom/microsoft/appcenter/utils/AppCenterLog;->warn(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 290
    :cond_0
    new-instance v0, Lcom/microsoft/appcenter/crashes/model/TestCrashException;

    invoke-direct {v0}, Lcom/microsoft/appcenter/crashes/model/TestCrashException;-><init>()V

    throw v0
.end method

.method public static declared-synchronized getInstance()Lcom/microsoft/appcenter/crashes/Crashes;
    .locals 2
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    const-class v0, Lcom/microsoft/appcenter/crashes/Crashes;

    monitor-enter v0

    .line 226
    :try_start_0
    sget-object v1, Lcom/microsoft/appcenter/crashes/Crashes;->sInstance:Lcom/microsoft/appcenter/crashes/Crashes;

    if-nez v1, :cond_0

    .line 227
    new-instance v1, Lcom/microsoft/appcenter/crashes/Crashes;

    invoke-direct {v1}, Lcom/microsoft/appcenter/crashes/Crashes;-><init>()V

    sput-object v1, Lcom/microsoft/appcenter/crashes/Crashes;->sInstance:Lcom/microsoft/appcenter/crashes/Crashes;

    .line 229
    :cond_0
    sget-object v1, Lcom/microsoft/appcenter/crashes/Crashes;->sInstance:Lcom/microsoft/appcenter/crashes/Crashes;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method private declared-synchronized getInstanceLastSessionCrashReport()Lcom/microsoft/appcenter/utils/async/AppCenterFuture;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/microsoft/appcenter/utils/async/AppCenterFuture<",
            "Lcom/microsoft/appcenter/crashes/model/ErrorReport;",
            ">;"
        }
    .end annotation

    monitor-enter p0

    .line 406
    :try_start_0
    new-instance v0, Lcom/microsoft/appcenter/utils/async/DefaultAppCenterFuture;

    invoke-direct {v0}, Lcom/microsoft/appcenter/utils/async/DefaultAppCenterFuture;-><init>()V

    .line 407
    new-instance v1, Lcom/microsoft/appcenter/crashes/Crashes$4;

    invoke-direct {v1, p0, v0}, Lcom/microsoft/appcenter/crashes/Crashes$4;-><init>(Lcom/microsoft/appcenter/crashes/Crashes;Lcom/microsoft/appcenter/utils/async/DefaultAppCenterFuture;)V

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v0, v2}, Lcom/microsoft/appcenter/crashes/Crashes;->postAsyncGetter(Ljava/lang/Runnable;Lcom/microsoft/appcenter/utils/async/DefaultAppCenterFuture;Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 414
    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public static getLastSessionCrashReport()Lcom/microsoft/appcenter/utils/async/AppCenterFuture;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/microsoft/appcenter/utils/async/AppCenterFuture<",
            "Lcom/microsoft/appcenter/crashes/model/ErrorReport;",
            ">;"
        }
    .end annotation

    .line 344
    invoke-static {}, Lcom/microsoft/appcenter/crashes/Crashes;->getInstance()Lcom/microsoft/appcenter/crashes/Crashes;

    move-result-object v0

    invoke-direct {v0}, Lcom/microsoft/appcenter/crashes/Crashes;->getInstanceLastSessionCrashReport()Lcom/microsoft/appcenter/utils/async/AppCenterFuture;

    move-result-object v0

    return-object v0
.end method

.method public static getMinidumpDirectory()Lcom/microsoft/appcenter/utils/async/AppCenterFuture;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/microsoft/appcenter/utils/async/AppCenterFuture<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 312
    invoke-static {}, Lcom/microsoft/appcenter/crashes/Crashes;->getInstance()Lcom/microsoft/appcenter/crashes/Crashes;

    move-result-object v0

    invoke-direct {v0}, Lcom/microsoft/appcenter/crashes/Crashes;->getNewMinidumpDirectoryAsync()Lcom/microsoft/appcenter/utils/async/AppCenterFuture;

    move-result-object v0

    return-object v0
.end method

.method private declared-synchronized getNewMinidumpDirectoryAsync()Lcom/microsoft/appcenter/utils/async/AppCenterFuture;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/microsoft/appcenter/utils/async/AppCenterFuture<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    monitor-enter p0

    .line 361
    :try_start_0
    new-instance v0, Lcom/microsoft/appcenter/utils/async/DefaultAppCenterFuture;

    invoke-direct {v0}, Lcom/microsoft/appcenter/utils/async/DefaultAppCenterFuture;-><init>()V

    .line 362
    new-instance v1, Lcom/microsoft/appcenter/crashes/Crashes$1;

    invoke-direct {v1, p0, v0}, Lcom/microsoft/appcenter/crashes/Crashes$1;-><init>(Lcom/microsoft/appcenter/crashes/Crashes;Lcom/microsoft/appcenter/utils/async/DefaultAppCenterFuture;)V

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v0, v2}, Lcom/microsoft/appcenter/crashes/Crashes;->postAsyncGetter(Ljava/lang/Runnable;Lcom/microsoft/appcenter/utils/async/DefaultAppCenterFuture;Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 369
    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private declared-synchronized handleUserConfirmation(I)V
    .locals 1
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    monitor-enter p0

    .line 923
    :try_start_0
    new-instance v0, Lcom/microsoft/appcenter/crashes/Crashes$11;

    invoke-direct {v0, p0, p1}, Lcom/microsoft/appcenter/crashes/Crashes$11;-><init>(Lcom/microsoft/appcenter/crashes/Crashes;I)V

    invoke-virtual {p0, v0}, Lcom/microsoft/appcenter/crashes/Crashes;->post(Ljava/lang/Runnable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1010
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public static hasCrashedInLastSession()Lcom/microsoft/appcenter/utils/async/AppCenterFuture;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/microsoft/appcenter/utils/async/AppCenterFuture<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 334
    invoke-static {}, Lcom/microsoft/appcenter/crashes/Crashes;->getInstance()Lcom/microsoft/appcenter/crashes/Crashes;

    move-result-object v0

    invoke-direct {v0}, Lcom/microsoft/appcenter/crashes/Crashes;->hasInstanceCrashedInLastSession()Lcom/microsoft/appcenter/utils/async/AppCenterFuture;

    move-result-object v0

    return-object v0
.end method

.method private declared-synchronized hasInstanceCrashedInLastSession()Lcom/microsoft/appcenter/utils/async/AppCenterFuture;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/microsoft/appcenter/utils/async/AppCenterFuture<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    monitor-enter p0

    .line 376
    :try_start_0
    new-instance v0, Lcom/microsoft/appcenter/utils/async/DefaultAppCenterFuture;

    invoke-direct {v0}, Lcom/microsoft/appcenter/utils/async/DefaultAppCenterFuture;-><init>()V

    .line 377
    new-instance v1, Lcom/microsoft/appcenter/crashes/Crashes$2;

    invoke-direct {v1, p0, v0}, Lcom/microsoft/appcenter/crashes/Crashes$2;-><init>(Lcom/microsoft/appcenter/crashes/Crashes;Lcom/microsoft/appcenter/utils/async/DefaultAppCenterFuture;)V

    const/4 v2, 0x0

    .line 383
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    .line 377
    invoke-virtual {p0, v1, v0, v2}, Lcom/microsoft/appcenter/crashes/Crashes;->postAsyncGetter(Ljava/lang/Runnable;Lcom/microsoft/appcenter/utils/async/DefaultAppCenterFuture;Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 384
    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private declared-synchronized hasInstanceReceivedMemoryWarningInLastSession()Lcom/microsoft/appcenter/utils/async/AppCenterFuture;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/microsoft/appcenter/utils/async/AppCenterFuture<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    monitor-enter p0

    .line 391
    :try_start_0
    new-instance v0, Lcom/microsoft/appcenter/utils/async/DefaultAppCenterFuture;

    invoke-direct {v0}, Lcom/microsoft/appcenter/utils/async/DefaultAppCenterFuture;-><init>()V

    .line 392
    new-instance v1, Lcom/microsoft/appcenter/crashes/Crashes$3;

    invoke-direct {v1, p0, v0}, Lcom/microsoft/appcenter/crashes/Crashes$3;-><init>(Lcom/microsoft/appcenter/crashes/Crashes;Lcom/microsoft/appcenter/utils/async/DefaultAppCenterFuture;)V

    const/4 v2, 0x0

    .line 398
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    .line 392
    invoke-virtual {p0, v1, v0, v2}, Lcom/microsoft/appcenter/crashes/Crashes;->postAsyncGetter(Ljava/lang/Runnable;Lcom/microsoft/appcenter/utils/async/DefaultAppCenterFuture;Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 399
    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public static hasReceivedMemoryWarningInLastSession()Lcom/microsoft/appcenter/utils/async/AppCenterFuture;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/microsoft/appcenter/utils/async/AppCenterFuture<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 354
    invoke-static {}, Lcom/microsoft/appcenter/crashes/Crashes;->getInstance()Lcom/microsoft/appcenter/crashes/Crashes;

    move-result-object v0

    invoke-direct {v0}, Lcom/microsoft/appcenter/crashes/Crashes;->hasInstanceReceivedMemoryWarningInLastSession()Lcom/microsoft/appcenter/utils/async/AppCenterFuture;

    move-result-object v0

    return-object v0
.end method

.method private initialize()V
    .locals 3

    .line 663
    invoke-virtual {p0}, Lcom/microsoft/appcenter/crashes/Crashes;->isInstanceEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 664
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    goto :goto_0

    :cond_0
    const-wide/16 v1, -0x1

    :goto_0
    iput-wide v1, p0, Lcom/microsoft/appcenter/crashes/Crashes;->mInitializeTimestamp:J

    if-nez v0, :cond_1

    .line 666
    iget-object v0, p0, Lcom/microsoft/appcenter/crashes/Crashes;->mUncaughtExceptionHandler:Lcom/microsoft/appcenter/crashes/UncaughtExceptionHandler;

    if-eqz v0, :cond_2

    .line 667
    invoke-virtual {v0}, Lcom/microsoft/appcenter/crashes/UncaughtExceptionHandler;->unregister()V

    const/4 v0, 0x0

    .line 668
    iput-object v0, p0, Lcom/microsoft/appcenter/crashes/Crashes;->mUncaughtExceptionHandler:Lcom/microsoft/appcenter/crashes/UncaughtExceptionHandler;

    goto :goto_1

    .line 673
    :cond_1
    new-instance v0, Lcom/microsoft/appcenter/crashes/UncaughtExceptionHandler;

    invoke-direct {v0}, Lcom/microsoft/appcenter/crashes/UncaughtExceptionHandler;-><init>()V

    iput-object v0, p0, Lcom/microsoft/appcenter/crashes/Crashes;->mUncaughtExceptionHandler:Lcom/microsoft/appcenter/crashes/UncaughtExceptionHandler;

    .line 674
    iget-object v0, p0, Lcom/microsoft/appcenter/crashes/Crashes;->mUncaughtExceptionHandler:Lcom/microsoft/appcenter/crashes/UncaughtExceptionHandler;

    invoke-virtual {v0}, Lcom/microsoft/appcenter/crashes/UncaughtExceptionHandler;->register()V

    .line 677
    invoke-direct {p0}, Lcom/microsoft/appcenter/crashes/Crashes;->processMinidumpFiles()V

    :cond_2
    :goto_1
    return-void
.end method

.method public static isEnabled()Lcom/microsoft/appcenter/utils/async/AppCenterFuture;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/microsoft/appcenter/utils/async/AppCenterFuture<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 244
    invoke-static {}, Lcom/microsoft/appcenter/crashes/Crashes;->getInstance()Lcom/microsoft/appcenter/crashes/Crashes;

    move-result-object v0

    invoke-virtual {v0}, Lcom/microsoft/appcenter/crashes/Crashes;->isInstanceEnabledAsync()Lcom/microsoft/appcenter/utils/async/AppCenterFuture;

    move-result-object v0

    return-object v0
.end method

.method private static isMemoryRunningLevelWasReceived(I)Z
    .locals 1

    const/4 v0, 0x5

    if-eq p0, v0, :cond_1

    const/16 v0, 0xa

    if-eq p0, v0, :cond_1

    const/16 v0, 0xf

    if-eq p0, v0, :cond_1

    const/16 v0, 0x50

    if-ne p0, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p0, 0x1

    :goto_1
    return p0
.end method

.method public static notifyUserConfirmation(I)V
    .locals 1

    .line 324
    invoke-static {}, Lcom/microsoft/appcenter/crashes/Crashes;->getInstance()Lcom/microsoft/appcenter/crashes/Crashes;

    move-result-object v0

    invoke-direct {v0, p0}, Lcom/microsoft/appcenter/crashes/Crashes;->handleUserConfirmation(I)V

    return-void
.end method

.method private processMinidumpFiles()V
    .locals 15

    .line 684
    invoke-static {}, Lcom/microsoft/appcenter/crashes/utils/ErrorLogHelper;->getNewMinidumpFiles()[Ljava/io/File;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    const-string v4, "AppCenterCrashes"

    if-ge v3, v1, :cond_2

    aget-object v5, v0, v3

    .line 687
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Process pending minidump file: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v6}, Lcom/microsoft/appcenter/utils/AppCenterLog;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 688
    invoke-virtual {v5}, Ljava/io/File;->lastModified()J

    move-result-wide v6

    .line 689
    new-instance v8, Ljava/io/File;

    invoke-static {}, Lcom/microsoft/appcenter/crashes/utils/ErrorLogHelper;->getPendingMinidumpDirectory()Ljava/io/File;

    move-result-object v9

    invoke-virtual {v5}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v8, v9, v10}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 690
    new-instance v9, Lcom/microsoft/appcenter/crashes/ingestion/models/Exception;

    invoke-direct {v9}, Lcom/microsoft/appcenter/crashes/ingestion/models/Exception;-><init>()V

    const-string v10, "minidump"

    .line 691
    invoke-virtual {v9, v10}, Lcom/microsoft/appcenter/crashes/ingestion/models/Exception;->setType(Ljava/lang/String;)V

    const-string v10, "appcenter.ndk"

    .line 692
    invoke-virtual {v9, v10}, Lcom/microsoft/appcenter/crashes/ingestion/models/Exception;->setWrapperSdkName(Ljava/lang/String;)V

    .line 693
    invoke-virtual {v8}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v9, v11}, Lcom/microsoft/appcenter/crashes/ingestion/models/Exception;->setMinidumpFilePath(Ljava/lang/String;)V

    .line 694
    new-instance v11, Lcom/microsoft/appcenter/crashes/ingestion/models/ManagedErrorLog;

    invoke-direct {v11}, Lcom/microsoft/appcenter/crashes/ingestion/models/ManagedErrorLog;-><init>()V

    .line 695
    invoke-virtual {v11, v9}, Lcom/microsoft/appcenter/crashes/ingestion/models/ManagedErrorLog;->setException(Lcom/microsoft/appcenter/crashes/ingestion/models/Exception;)V

    .line 696
    new-instance v9, Ljava/util/Date;

    invoke-direct {v9, v6, v7}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v11, v9}, Lcom/microsoft/appcenter/crashes/ingestion/models/ManagedErrorLog;->setTimestamp(Ljava/util/Date;)V

    const/4 v9, 0x1

    .line 697
    invoke-static {v9}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v9

    invoke-virtual {v11, v9}, Lcom/microsoft/appcenter/crashes/ingestion/models/ManagedErrorLog;->setFatal(Ljava/lang/Boolean;)V

    .line 698
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v9

    invoke-virtual {v11, v9}, Lcom/microsoft/appcenter/crashes/ingestion/models/ManagedErrorLog;->setId(Ljava/util/UUID;)V

    .line 701
    invoke-static {}, Lcom/microsoft/appcenter/utils/context/SessionContext;->getInstance()Lcom/microsoft/appcenter/utils/context/SessionContext;

    move-result-object v9

    invoke-virtual {v9, v6, v7}, Lcom/microsoft/appcenter/utils/context/SessionContext;->getSessionAt(J)Lcom/microsoft/appcenter/utils/context/SessionContext$SessionInfo;

    move-result-object v9

    if-eqz v9, :cond_0

    .line 702
    invoke-virtual {v9}, Lcom/microsoft/appcenter/utils/context/SessionContext$SessionInfo;->getAppLaunchTimestamp()J

    move-result-wide v12

    cmp-long v14, v12, v6

    if-gtz v14, :cond_0

    .line 703
    new-instance v6, Ljava/util/Date;

    invoke-virtual {v9}, Lcom/microsoft/appcenter/utils/context/SessionContext$SessionInfo;->getAppLaunchTimestamp()J

    move-result-wide v12

    invoke-direct {v6, v12, v13}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v11, v6}, Lcom/microsoft/appcenter/crashes/ingestion/models/ManagedErrorLog;->setAppLaunchTimestamp(Ljava/util/Date;)V

    goto :goto_1

    .line 714
    :cond_0
    invoke-virtual {v11}, Lcom/microsoft/appcenter/crashes/ingestion/models/ManagedErrorLog;->getTimestamp()Ljava/util/Date;

    move-result-object v6

    invoke-virtual {v11, v6}, Lcom/microsoft/appcenter/crashes/ingestion/models/ManagedErrorLog;->setAppLaunchTimestamp(Ljava/util/Date;)V

    .line 721
    :goto_1
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v11, v6}, Lcom/microsoft/appcenter/crashes/ingestion/models/ManagedErrorLog;->setProcessId(Ljava/lang/Integer;)V

    const-string v6, ""

    .line 722
    invoke-virtual {v11, v6}, Lcom/microsoft/appcenter/crashes/ingestion/models/ManagedErrorLog;->setProcessName(Ljava/lang/String;)V

    .line 729
    invoke-static {}, Lcom/microsoft/appcenter/utils/context/UserIdContext;->getInstance()Lcom/microsoft/appcenter/utils/context/UserIdContext;

    move-result-object v6

    invoke-virtual {v6}, Lcom/microsoft/appcenter/utils/context/UserIdContext;->getUserId()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v11, v6}, Lcom/microsoft/appcenter/crashes/ingestion/models/ManagedErrorLog;->setUserId(Ljava/lang/String;)V

    .line 731
    :try_start_0
    iget-object v6, p0, Lcom/microsoft/appcenter/crashes/Crashes;->mContext:Landroid/content/Context;

    invoke-virtual {p0, v6}, Lcom/microsoft/appcenter/crashes/Crashes;->getDeviceInfo(Landroid/content/Context;)Lcom/microsoft/appcenter/ingestion/models/Device;

    move-result-object v6

    invoke-virtual {v11, v6}, Lcom/microsoft/appcenter/crashes/ingestion/models/ManagedErrorLog;->setDevice(Lcom/microsoft/appcenter/ingestion/models/Device;)V

    .line 732
    invoke-virtual {v11}, Lcom/microsoft/appcenter/crashes/ingestion/models/ManagedErrorLog;->getDevice()Lcom/microsoft/appcenter/ingestion/models/Device;

    move-result-object v6

    invoke-virtual {v6, v10}, Lcom/microsoft/appcenter/ingestion/models/Device;->setWrapperSdkName(Ljava/lang/String;)V

    .line 733
    new-instance v6, Lcom/microsoft/appcenter/crashes/model/NativeException;

    invoke-direct {v6}, Lcom/microsoft/appcenter/crashes/model/NativeException;-><init>()V

    invoke-direct {p0, v6, v11}, Lcom/microsoft/appcenter/crashes/Crashes;->saveErrorLogFiles(Ljava/lang/Throwable;Lcom/microsoft/appcenter/crashes/ingestion/models/ManagedErrorLog;)Ljava/util/UUID;

    .line 734
    invoke-virtual {v5, v8}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v6

    if-eqz v6, :cond_1

    goto :goto_2

    .line 735
    :cond_1
    new-instance v6, Ljava/io/IOException;

    const-string v7, "Failed to move file"

    invoke-direct {v6, v7}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v6
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception v6

    .line 740
    invoke-virtual {v5}, Ljava/io/File;->delete()Z

    .line 741
    invoke-virtual {v11}, Lcom/microsoft/appcenter/crashes/ingestion/models/ManagedErrorLog;->getId()Ljava/util/UUID;

    move-result-object v7

    invoke-direct {p0, v7}, Lcom/microsoft/appcenter/crashes/Crashes;->removeAllStoredErrorLogFiles(Ljava/util/UUID;)V

    .line 742
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Failed to process new minidump file: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5, v6}, Lcom/microsoft/appcenter/utils/AppCenterLog;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_0

    .line 747
    :cond_2
    invoke-static {}, Lcom/microsoft/appcenter/crashes/utils/ErrorLogHelper;->getLastErrorLogFile()Ljava/io/File;

    move-result-object v0

    :goto_3
    if-eqz v0, :cond_3

    .line 748
    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v1

    const-wide/16 v5, 0x0

    cmp-long v3, v1, v5

    if-nez v3, :cond_3

    .line 749
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Deleting empty error file: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v4, v1}, Lcom/microsoft/appcenter/utils/AppCenterLog;->warn(Ljava/lang/String;Ljava/lang/String;)V

    .line 752
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 753
    invoke-static {}, Lcom/microsoft/appcenter/crashes/utils/ErrorLogHelper;->getLastErrorLogFile()Ljava/io/File;

    move-result-object v0

    goto :goto_3

    :cond_3
    if-eqz v0, :cond_5

    const-string v1, "Processing crash report for the last session."

    .line 756
    invoke-static {v4, v1}, Lcom/microsoft/appcenter/utils/AppCenterLog;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 757
    invoke-static {v0}, Lcom/microsoft/appcenter/utils/storage/FileManager;->read(Ljava/io/File;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_4

    const-string v0, "Error reading last session error log."

    .line 759
    invoke-static {v4, v0}, Lcom/microsoft/appcenter/utils/AppCenterLog;->error(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_4

    .line 762
    :cond_4
    :try_start_1
    iget-object v1, p0, Lcom/microsoft/appcenter/crashes/Crashes;->mLogSerializer:Lcom/microsoft/appcenter/ingestion/models/json/LogSerializer;

    const/4 v2, 0x0

    invoke-interface {v1, v0, v2}, Lcom/microsoft/appcenter/ingestion/models/json/LogSerializer;->deserializeLog(Ljava/lang/String;Ljava/lang/String;)Lcom/microsoft/appcenter/ingestion/models/Log;

    move-result-object v0

    check-cast v0, Lcom/microsoft/appcenter/crashes/ingestion/models/ManagedErrorLog;

    .line 763
    invoke-virtual {p0, v0}, Lcom/microsoft/appcenter/crashes/Crashes;->buildErrorReport(Lcom/microsoft/appcenter/crashes/ingestion/models/ManagedErrorLog;)Lcom/microsoft/appcenter/crashes/model/ErrorReport;

    move-result-object v0

    iput-object v0, p0, Lcom/microsoft/appcenter/crashes/Crashes;->mLastSessionErrorReport:Lcom/microsoft/appcenter/crashes/model/ErrorReport;

    const-string v0, "Processed crash report for the last session."

    .line 764
    invoke-static {v4, v0}, Lcom/microsoft/appcenter/utils/AppCenterLog;->debug(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_4

    :catch_1
    move-exception v0

    const-string v1, "Error parsing last session error log."

    .line 766
    invoke-static {v4, v1, v0}, Lcom/microsoft/appcenter/utils/AppCenterLog;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_5
    :goto_4
    return-void
.end method

.method private processPendingErrors()V
    .locals 8

    .line 773
    invoke-static {}, Lcom/microsoft/appcenter/crashes/utils/ErrorLogHelper;->getStoredErrorLogFiles()[Ljava/io/File;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    const-string v3, "AppCenterCrashes"

    if-ge v2, v1, :cond_5

    aget-object v4, v0, v2

    .line 774
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Process pending error file: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v5}, Lcom/microsoft/appcenter/utils/AppCenterLog;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 775
    invoke-static {v4}, Lcom/microsoft/appcenter/utils/storage/FileManager;->read(Ljava/io/File;)Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_4

    .line 778
    :try_start_0
    iget-object v6, p0, Lcom/microsoft/appcenter/crashes/Crashes;->mLogSerializer:Lcom/microsoft/appcenter/ingestion/models/json/LogSerializer;

    const/4 v7, 0x0

    invoke-interface {v6, v5, v7}, Lcom/microsoft/appcenter/ingestion/models/json/LogSerializer;->deserializeLog(Ljava/lang/String;Ljava/lang/String;)Lcom/microsoft/appcenter/ingestion/models/Log;

    move-result-object v5

    check-cast v5, Lcom/microsoft/appcenter/crashes/ingestion/models/ManagedErrorLog;

    .line 779
    invoke-virtual {v5}, Lcom/microsoft/appcenter/crashes/ingestion/models/ManagedErrorLog;->getId()Ljava/util/UUID;

    move-result-object v6

    .line 780
    invoke-virtual {p0, v5}, Lcom/microsoft/appcenter/crashes/Crashes;->buildErrorReport(Lcom/microsoft/appcenter/crashes/ingestion/models/ManagedErrorLog;)Lcom/microsoft/appcenter/crashes/model/ErrorReport;

    move-result-object v5

    if-nez v5, :cond_0

    .line 782
    invoke-direct {p0, v6}, Lcom/microsoft/appcenter/crashes/Crashes;->removeAllStoredErrorLogFiles(Ljava/util/UUID;)V

    goto :goto_2

    .line 783
    :cond_0
    iget-boolean v7, p0, Lcom/microsoft/appcenter/crashes/Crashes;->mAutomaticProcessing:Z

    if-eqz v7, :cond_2

    iget-object v7, p0, Lcom/microsoft/appcenter/crashes/Crashes;->mCrashesListener:Lcom/microsoft/appcenter/crashes/CrashesListener;

    invoke-interface {v7, v5}, Lcom/microsoft/appcenter/crashes/CrashesListener;->shouldProcess(Lcom/microsoft/appcenter/crashes/model/ErrorReport;)Z

    move-result v5

    if-eqz v5, :cond_1

    goto :goto_1

    .line 789
    :cond_1
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "CrashesListener.shouldProcess returned false, clean up and ignore log: "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v5}, Lcom/microsoft/appcenter/utils/AppCenterLog;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 790
    invoke-direct {p0, v6}, Lcom/microsoft/appcenter/crashes/Crashes;->removeAllStoredErrorLogFiles(Ljava/util/UUID;)V

    goto :goto_2

    .line 784
    :cond_2
    :goto_1
    iget-boolean v5, p0, Lcom/microsoft/appcenter/crashes/Crashes;->mAutomaticProcessing:Z

    if-nez v5, :cond_3

    .line 785
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "CrashesListener.shouldProcess returned true, continue processing log: "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v5}, Lcom/microsoft/appcenter/utils/AppCenterLog;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 787
    :cond_3
    iget-object v5, p0, Lcom/microsoft/appcenter/crashes/Crashes;->mUnprocessedErrorReports:Ljava/util/Map;

    iget-object v7, p0, Lcom/microsoft/appcenter/crashes/Crashes;->mErrorReportCache:Ljava/util/Map;

    invoke-interface {v7, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    invoke-interface {v5, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :catch_0
    move-exception v5

    .line 793
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Error parsing error log. Deleting invalid file: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v3, v6, v5}, Lcom/microsoft/appcenter/utils/AppCenterLog;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 796
    invoke-virtual {v4}, Ljava/io/File;->delete()Z

    :cond_4
    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_0

    :cond_5
    const/4 v0, -0x1

    const-string v1, "com.microsoft.appcenter.crashes.memory"

    .line 800
    invoke-static {v1, v0}, Lcom/microsoft/appcenter/utils/storage/SharedPreferencesManager;->getInt(Ljava/lang/String;I)I

    move-result v0

    invoke-static {v0}, Lcom/microsoft/appcenter/crashes/Crashes;->isMemoryRunningLevelWasReceived(I)Z

    move-result v0

    iput-boolean v0, p0, Lcom/microsoft/appcenter/crashes/Crashes;->mHasReceivedMemoryWarningInLastSession:Z

    .line 801
    iget-boolean v0, p0, Lcom/microsoft/appcenter/crashes/Crashes;->mHasReceivedMemoryWarningInLastSession:Z

    if-eqz v0, :cond_6

    const-string v0, "The application received a low memory warning in the last session."

    .line 802
    invoke-static {v3, v0}, Lcom/microsoft/appcenter/utils/AppCenterLog;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 804
    :cond_6
    invoke-static {v1}, Lcom/microsoft/appcenter/utils/storage/SharedPreferencesManager;->remove(Ljava/lang/String;)V

    .line 807
    iget-boolean v0, p0, Lcom/microsoft/appcenter/crashes/Crashes;->mAutomaticProcessing:Z

    if-eqz v0, :cond_7

    .line 810
    invoke-direct {p0}, Lcom/microsoft/appcenter/crashes/Crashes;->sendCrashReportsOrAwaitUserConfirmation()Z

    :cond_7
    return-void
.end method

.method private declared-synchronized queueException(Lcom/microsoft/appcenter/crashes/Crashes$ExceptionModelBuilder;Ljava/util/Map;Ljava/lang/Iterable;)Ljava/util/UUID;
    .locals 8
    .param p1    # Lcom/microsoft/appcenter/crashes/Crashes$ExceptionModelBuilder;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/microsoft/appcenter/crashes/Crashes$ExceptionModelBuilder;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/Iterable<",
            "Lcom/microsoft/appcenter/crashes/ingestion/models/ErrorAttachmentLog;",
            ">;)",
            "Ljava/util/UUID;"
        }
    .end annotation

    monitor-enter p0

    .line 639
    :try_start_0
    invoke-static {}, Lcom/microsoft/appcenter/utils/context/UserIdContext;->getInstance()Lcom/microsoft/appcenter/utils/context/UserIdContext;

    move-result-object v0

    invoke-virtual {v0}, Lcom/microsoft/appcenter/utils/context/UserIdContext;->getUserId()Ljava/lang/String;

    move-result-object v4

    .line 640
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    const-string v1, "HandledError"

    .line 641
    invoke-static {p2, v1}, Lcom/microsoft/appcenter/crashes/utils/ErrorLogHelper;->validateProperties(Ljava/util/Map;Ljava/lang/String;)Ljava/util/Map;

    move-result-object v6

    .line 642
    new-instance p2, Lcom/microsoft/appcenter/crashes/Crashes$9;

    move-object v1, p2

    move-object v2, p0

    move-object v3, v0

    move-object v5, p1

    move-object v7, p3

    invoke-direct/range {v1 .. v7}, Lcom/microsoft/appcenter/crashes/Crashes$9;-><init>(Lcom/microsoft/appcenter/crashes/Crashes;Ljava/util/UUID;Ljava/lang/String;Lcom/microsoft/appcenter/crashes/Crashes$ExceptionModelBuilder;Ljava/util/Map;Ljava/lang/Iterable;)V

    invoke-virtual {p0, p2}, Lcom/microsoft/appcenter/crashes/Crashes;->post(Ljava/lang/Runnable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 659
    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method private declared-synchronized queueException(Ljava/lang/Throwable;Ljava/util/Map;Ljava/lang/Iterable;)V
    .locals 1
    .param p1    # Ljava/lang/Throwable;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Throwable;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/Iterable<",
            "Lcom/microsoft/appcenter/crashes/ingestion/models/ErrorAttachmentLog;",
            ">;)V"
        }
    .end annotation

    monitor-enter p0

    .line 609
    :try_start_0
    new-instance v0, Lcom/microsoft/appcenter/crashes/Crashes$7;

    invoke-direct {v0, p0, p1}, Lcom/microsoft/appcenter/crashes/Crashes$7;-><init>(Lcom/microsoft/appcenter/crashes/Crashes;Ljava/lang/Throwable;)V

    invoke-direct {p0, v0, p2, p3}, Lcom/microsoft/appcenter/crashes/Crashes;->queueException(Lcom/microsoft/appcenter/crashes/Crashes$ExceptionModelBuilder;Ljava/util/Map;Ljava/lang/Iterable;)Ljava/util/UUID;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 616
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method private removeAllStoredErrorLogFiles(Ljava/util/UUID;)V
    .locals 0

    .line 865
    invoke-static {p1}, Lcom/microsoft/appcenter/crashes/utils/ErrorLogHelper;->removeStoredErrorLogFile(Ljava/util/UUID;)V

    .line 866
    invoke-direct {p0, p1}, Lcom/microsoft/appcenter/crashes/Crashes;->removeStoredThrowable(Ljava/util/UUID;)V

    return-void
.end method

.method private removeStoredThrowable(Ljava/util/UUID;)V
    .locals 1

    .line 870
    iget-object v0, p0, Lcom/microsoft/appcenter/crashes/Crashes;->mErrorReportCache:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 871
    invoke-static {p1}, Lcom/microsoft/appcenter/crashes/WrapperSdkExceptionManager;->deleteWrapperExceptionData(Ljava/util/UUID;)V

    .line 872
    invoke-static {p1}, Lcom/microsoft/appcenter/crashes/utils/ErrorLogHelper;->removeStoredThrowableFile(Ljava/util/UUID;)V

    return-void
.end method

.method private saveErrorLogFiles(Ljava/lang/Throwable;Lcom/microsoft/appcenter/crashes/ingestion/models/ManagedErrorLog;)Ljava/util/UUID;
    .locals 7
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 1099
    invoke-static {}, Lcom/microsoft/appcenter/crashes/utils/ErrorLogHelper;->getErrorStorageDirectory()Ljava/io/File;

    move-result-object v0

    .line 1100
    invoke-virtual {p2}, Lcom/microsoft/appcenter/crashes/ingestion/models/ManagedErrorLog;->getId()Ljava/util/UUID;

    move-result-object v1

    .line 1101
    invoke-virtual {v1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "AppCenterCrashes"

    const-string v4, "Saving uncaught exception."

    .line 1102
    invoke-static {v3, v4}, Lcom/microsoft/appcenter/utils/AppCenterLog;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 1103
    new-instance v4, Ljava/io/File;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, ".json"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v0, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 1104
    iget-object v5, p0, Lcom/microsoft/appcenter/crashes/Crashes;->mLogSerializer:Lcom/microsoft/appcenter/ingestion/models/json/LogSerializer;

    invoke-interface {v5, p2}, Lcom/microsoft/appcenter/ingestion/models/json/LogSerializer;->serializeLog(Lcom/microsoft/appcenter/ingestion/models/Log;)Ljava/lang/String;

    move-result-object p2

    .line 1105
    invoke-static {v4, p2}, Lcom/microsoft/appcenter/utils/storage/FileManager;->write(Ljava/io/File;Ljava/lang/String;)V

    .line 1106
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Saved JSON content for ingestion into "

    invoke-virtual {p2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {v3, p2}, Lcom/microsoft/appcenter/utils/AppCenterLog;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 1107
    new-instance p2, Ljava/io/File;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ".throwable"

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p2, v0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    if-eqz p1, :cond_0

    .line 1110
    :try_start_0
    invoke-static {p1}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    .line 1111
    invoke-static {p2, v0}, Lcom/microsoft/appcenter/utils/storage/FileManager;->write(Ljava/io/File;Ljava/lang/String;)V

    .line 1112
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Saved stack trace as is for client side inspection in "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v4, " stack trace:"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Lcom/microsoft/appcenter/utils/AppCenterLog;->debug(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/StackOverflowError; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string v0, "Failed to store stack trace."

    .line 1114
    invoke-static {v3, v0, p1}, Lcom/microsoft/appcenter/utils/AppCenterLog;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 p1, 0x0

    .line 1118
    invoke-virtual {p2}, Ljava/io/File;->delete()Z

    :cond_0
    :goto_0
    if-nez p1, :cond_2

    .line 1127
    invoke-virtual {p2}, Ljava/io/File;->createNewFile()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 1130
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Saved empty Throwable file in "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v3, p1}, Lcom/microsoft/appcenter/utils/AppCenterLog;->debug(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 1128
    :cond_1
    new-instance p1, Ljava/io/IOException;

    invoke-virtual {p2}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_2
    :goto_1
    return-object v1
.end method

.method private static saveMemoryRunningLevel(I)V
    .locals 2
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    const-string v0, "com.microsoft.appcenter.crashes.memory"

    .line 1220
    invoke-static {v0, p0}, Lcom/microsoft/appcenter/utils/storage/SharedPreferencesManager;->putInt(Ljava/lang/String;I)V

    const/4 v0, 0x1

    .line 1221
    new-array v0, v0, [Ljava/lang/Object;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    const/4 v1, 0x0

    aput-object p0, v0, v1

    const-string p0, "The memory running level (%s) was saved."

    invoke-static {p0, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    const-string v0, "AppCenterCrashes"

    invoke-static {v0, p0}, Lcom/microsoft/appcenter/utils/AppCenterLog;->debug(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private sendCrashReportsOrAwaitUserConfirmation()Z
    .locals 2

    const-string v0, "com.microsoft.appcenter.crashes.always.send"

    const/4 v1, 0x0

    .line 829
    invoke-static {v0, v1}, Lcom/microsoft/appcenter/utils/storage/SharedPreferencesManager;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    .line 830
    new-instance v1, Lcom/microsoft/appcenter/crashes/Crashes$10;

    invoke-direct {v1, p0, v0}, Lcom/microsoft/appcenter/crashes/Crashes$10;-><init>(Lcom/microsoft/appcenter/crashes/Crashes;Z)V

    invoke-static {v1}, Lcom/microsoft/appcenter/utils/HandlerUtils;->runOnUiThread(Ljava/lang/Runnable;)V

    return v0
.end method

.method private sendErrorAttachment(Ljava/util/UUID;Ljava/lang/Iterable;)V
    .locals 9
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/UUID;",
            "Ljava/lang/Iterable<",
            "Lcom/microsoft/appcenter/crashes/ingestion/models/ErrorAttachmentLog;",
            ">;)V"
        }
    .end annotation

    const-string v0, "AppCenterCrashes"

    if-nez p2, :cond_0

    .line 1018
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Error report: "

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " does not have any attachment."

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/microsoft/appcenter/utils/AppCenterLog;->debug(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_1

    .line 1021
    :cond_0
    invoke-interface {p2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p2

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    const/4 v4, 0x2

    if-eqz v3, :cond_4

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/microsoft/appcenter/crashes/ingestion/models/ErrorAttachmentLog;

    if-eqz v3, :cond_3

    .line 1023
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v5

    invoke-virtual {v3, v5}, Lcom/microsoft/appcenter/crashes/ingestion/models/ErrorAttachmentLog;->setId(Ljava/util/UUID;)V

    .line 1024
    invoke-virtual {v3, p1}, Lcom/microsoft/appcenter/crashes/ingestion/models/ErrorAttachmentLog;->setErrorId(Ljava/util/UUID;)V

    .line 1025
    invoke-virtual {v3}, Lcom/microsoft/appcenter/crashes/ingestion/models/ErrorAttachmentLog;->isValid()Z

    move-result v5

    if-nez v5, :cond_1

    const-string v3, "Not all required fields are present in ErrorAttachmentLog."

    .line 1026
    invoke-static {v0, v3}, Lcom/microsoft/appcenter/utils/AppCenterLog;->error(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 1027
    :cond_1
    invoke-virtual {v3}, Lcom/microsoft/appcenter/crashes/ingestion/models/ErrorAttachmentLog;->getData()[B

    move-result-object v5

    array-length v5, v5

    const/high16 v6, 0x700000

    const/4 v7, 0x1

    if-le v5, v6, :cond_2

    .line 1028
    sget-object v5, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const/4 v8, 0x3

    new-array v8, v8, [Ljava/lang/Object;

    .line 1030
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v8, v1

    invoke-virtual {v3}, Lcom/microsoft/appcenter/crashes/ingestion/models/ErrorAttachmentLog;->getData()[B

    move-result-object v6

    array-length v6, v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v8, v7

    invoke-virtual {v3}, Lcom/microsoft/appcenter/crashes/ingestion/models/ErrorAttachmentLog;->getFileName()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v8, v4

    const-string v3, "Discarding attachment with size above %d bytes: size=%d, fileName=%s."

    .line 1028
    invoke-static {v5, v3, v8}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Lcom/microsoft/appcenter/utils/AppCenterLog;->error(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    add-int/lit8 v2, v2, 0x1

    .line 1033
    iget-object v4, p0, Lcom/microsoft/appcenter/crashes/Crashes;->mChannel:Lcom/microsoft/appcenter/channel/Channel;

    const-string v5, "groupErrors"

    invoke-interface {v4, v3, v5, v7}, Lcom/microsoft/appcenter/channel/Channel;->enqueue(Lcom/microsoft/appcenter/ingestion/models/Log;Ljava/lang/String;I)V

    goto :goto_0

    :cond_3
    const-string v3, "Skipping null ErrorAttachmentLog."

    .line 1036
    invoke-static {v0, v3}, Lcom/microsoft/appcenter/utils/AppCenterLog;->warn(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_4
    if-le v2, v4, :cond_5

    const-string p1, "A limit of 2 attachments per error report might be enforced by server."

    .line 1040
    invoke-static {v0, p1}, Lcom/microsoft/appcenter/utils/AppCenterLog;->warn(Ljava/lang/String;Ljava/lang/String;)V

    :cond_5
    :goto_1
    return-void
.end method

.method public static setEnabled(Z)Lcom/microsoft/appcenter/utils/async/AppCenterFuture;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Lcom/microsoft/appcenter/utils/async/AppCenterFuture<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 256
    invoke-static {}, Lcom/microsoft/appcenter/crashes/Crashes;->getInstance()Lcom/microsoft/appcenter/crashes/Crashes;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/microsoft/appcenter/crashes/Crashes;->setInstanceEnabledAsync(Z)Lcom/microsoft/appcenter/utils/async/AppCenterFuture;

    move-result-object p0

    return-object p0
.end method

.method public static setListener(Lcom/microsoft/appcenter/crashes/CrashesListener;)V
    .locals 1

    .line 302
    invoke-static {}, Lcom/microsoft/appcenter/crashes/Crashes;->getInstance()Lcom/microsoft/appcenter/crashes/Crashes;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/microsoft/appcenter/crashes/Crashes;->setInstanceListener(Lcom/microsoft/appcenter/crashes/CrashesListener;)V

    return-void
.end method

.method public static trackError(Ljava/lang/Throwable;)V
    .locals 1

    const/4 v0, 0x0

    .line 266
    invoke-static {p0, v0, v0}, Lcom/microsoft/appcenter/crashes/Crashes;->trackError(Ljava/lang/Throwable;Ljava/util/Map;Ljava/lang/Iterable;)V

    return-void
.end method

.method public static trackError(Ljava/lang/Throwable;Ljava/util/Map;Ljava/lang/Iterable;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Throwable;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/Iterable<",
            "Lcom/microsoft/appcenter/crashes/ingestion/models/ErrorAttachmentLog;",
            ">;)V"
        }
    .end annotation

    .line 282
    invoke-static {}, Lcom/microsoft/appcenter/crashes/Crashes;->getInstance()Lcom/microsoft/appcenter/crashes/Crashes;

    move-result-object v0

    invoke-direct {v0, p0, p1, p2}, Lcom/microsoft/appcenter/crashes/Crashes;->queueException(Ljava/lang/Throwable;Ljava/util/Map;Ljava/lang/Iterable;)V

    return-void
.end method

.method static declared-synchronized unsetInstance()V
    .locals 2
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    const-class v0, Lcom/microsoft/appcenter/crashes/Crashes;

    monitor-enter v0

    const/4 v1, 0x0

    .line 234
    :try_start_0
    sput-object v1, Lcom/microsoft/appcenter/crashes/Crashes;->sInstance:Lcom/microsoft/appcenter/crashes/Crashes;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 235
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method


# virtual methods
.method protected declared-synchronized applyEnabledState(Z)V
    .locals 6

    monitor-enter p0

    .line 420
    :try_start_0
    invoke-direct {p0}, Lcom/microsoft/appcenter/crashes/Crashes;->initialize()V

    if-eqz p1, :cond_0

    .line 422
    new-instance p1, Lcom/microsoft/appcenter/crashes/Crashes$5;

    invoke-direct {p1, p0}, Lcom/microsoft/appcenter/crashes/Crashes$5;-><init>(Lcom/microsoft/appcenter/crashes/Crashes;)V

    iput-object p1, p0, Lcom/microsoft/appcenter/crashes/Crashes;->mMemoryWarningListener:Landroid/content/ComponentCallbacks2;

    .line 438
    iget-object p1, p0, Lcom/microsoft/appcenter/crashes/Crashes;->mContext:Landroid/content/Context;

    iget-object v0, p0, Lcom/microsoft/appcenter/crashes/Crashes;->mMemoryWarningListener:Landroid/content/ComponentCallbacks2;

    invoke-virtual {p1, v0}, Landroid/content/Context;->registerComponentCallbacks(Landroid/content/ComponentCallbacks;)V

    goto :goto_1

    .line 442
    :cond_0
    invoke-static {}, Lcom/microsoft/appcenter/crashes/utils/ErrorLogHelper;->getErrorStorageDirectory()Ljava/io/File;

    move-result-object p1

    invoke-virtual {p1}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object p1

    if-eqz p1, :cond_2

    .line 444
    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_2

    aget-object v2, p1, v1

    const-string v3, "AppCenterCrashes"

    .line 445
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Deleting file "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/microsoft/appcenter/utils/AppCenterLog;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 446
    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    move-result v3

    if-nez v3, :cond_1

    const-string v3, "AppCenterCrashes"

    .line 447
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Failed to delete file "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v2}, Lcom/microsoft/appcenter/utils/AppCenterLog;->warn(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    const-string p1, "AppCenterCrashes"

    const-string v0, "Deleted crashes local files"

    .line 451
    invoke-static {p1, v0}, Lcom/microsoft/appcenter/utils/AppCenterLog;->info(Ljava/lang/String;Ljava/lang/String;)V

    .line 454
    iget-object p1, p0, Lcom/microsoft/appcenter/crashes/Crashes;->mErrorReportCache:Ljava/util/Map;

    invoke-interface {p1}, Ljava/util/Map;->clear()V

    const/4 p1, 0x0

    .line 455
    iput-object p1, p0, Lcom/microsoft/appcenter/crashes/Crashes;->mLastSessionErrorReport:Lcom/microsoft/appcenter/crashes/model/ErrorReport;

    .line 456
    iget-object v0, p0, Lcom/microsoft/appcenter/crashes/Crashes;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/microsoft/appcenter/crashes/Crashes;->mMemoryWarningListener:Landroid/content/ComponentCallbacks2;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterComponentCallbacks(Landroid/content/ComponentCallbacks;)V

    .line 457
    iput-object p1, p0, Lcom/microsoft/appcenter/crashes/Crashes;->mMemoryWarningListener:Landroid/content/ComponentCallbacks2;

    const-string p1, "com.microsoft.appcenter.crashes.memory"

    .line 458
    invoke-static {p1}, Lcom/microsoft/appcenter/utils/storage/SharedPreferencesManager;->remove(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 460
    :goto_1
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method buildErrorReport(Lcom/microsoft/appcenter/crashes/ingestion/models/ManagedErrorLog;)Lcom/microsoft/appcenter/crashes/model/ErrorReport;
    .locals 8
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .line 888
    invoke-virtual {p1}, Lcom/microsoft/appcenter/crashes/ingestion/models/ManagedErrorLog;->getId()Ljava/util/UUID;

    move-result-object v0

    .line 889
    iget-object v1, p0, Lcom/microsoft/appcenter/crashes/Crashes;->mErrorReportCache:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 890
    iget-object v1, p0, Lcom/microsoft/appcenter/crashes/Crashes;->mErrorReportCache:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/microsoft/appcenter/crashes/Crashes$ErrorLogReport;

    invoke-static {v0}, Lcom/microsoft/appcenter/crashes/Crashes$ErrorLogReport;->access$1200(Lcom/microsoft/appcenter/crashes/Crashes$ErrorLogReport;)Lcom/microsoft/appcenter/crashes/model/ErrorReport;

    move-result-object v0

    .line 891
    invoke-virtual {p1}, Lcom/microsoft/appcenter/crashes/ingestion/models/ManagedErrorLog;->getDevice()Lcom/microsoft/appcenter/ingestion/models/Device;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/microsoft/appcenter/crashes/model/ErrorReport;->setDevice(Lcom/microsoft/appcenter/ingestion/models/Device;)V

    return-object v0

    .line 894
    :cond_0
    invoke-static {v0}, Lcom/microsoft/appcenter/crashes/utils/ErrorLogHelper;->getStoredThrowableFile(Ljava/util/UUID;)Ljava/io/File;

    move-result-object v1

    const/4 v2, 0x0

    if-eqz v1, :cond_2

    .line 897
    invoke-virtual {v1}, Ljava/io/File;->length()J

    move-result-wide v3

    const-wide/16 v5, 0x0

    cmp-long v7, v3, v5

    if-lez v7, :cond_1

    .line 898
    invoke-static {v1}, Lcom/microsoft/appcenter/utils/storage/FileManager;->read(Ljava/io/File;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_1
    move-object v1, v2

    .line 900
    :goto_0
    invoke-static {p1, v1}, Lcom/microsoft/appcenter/crashes/utils/ErrorLogHelper;->getErrorReportFromErrorLog(Lcom/microsoft/appcenter/crashes/ingestion/models/ManagedErrorLog;Ljava/lang/String;)Lcom/microsoft/appcenter/crashes/model/ErrorReport;

    move-result-object v1

    .line 901
    iget-object v3, p0, Lcom/microsoft/appcenter/crashes/Crashes;->mErrorReportCache:Ljava/util/Map;

    new-instance v4, Lcom/microsoft/appcenter/crashes/Crashes$ErrorLogReport;

    invoke-direct {v4, p1, v1, v2}, Lcom/microsoft/appcenter/crashes/Crashes$ErrorLogReport;-><init>(Lcom/microsoft/appcenter/crashes/ingestion/models/ManagedErrorLog;Lcom/microsoft/appcenter/crashes/model/ErrorReport;Lcom/microsoft/appcenter/crashes/Crashes$1;)V

    invoke-interface {v3, v0, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v1

    :cond_2
    return-object v2
.end method

.method protected getChannelListener()Lcom/microsoft/appcenter/channel/Channel$GroupListener;
    .locals 1

    .line 498
    new-instance v0, Lcom/microsoft/appcenter/crashes/Crashes$6;

    invoke-direct {v0, p0}, Lcom/microsoft/appcenter/crashes/Crashes$6;-><init>(Lcom/microsoft/appcenter/crashes/Crashes;)V

    return-object v0
.end method

.method declared-synchronized getDeviceInfo(Landroid/content/Context;)Lcom/microsoft/appcenter/ingestion/models/Device;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/microsoft/appcenter/utils/DeviceInfoHelper$DeviceInfoException;
        }
    .end annotation

    monitor-enter p0

    .line 586
    :try_start_0
    iget-object v0, p0, Lcom/microsoft/appcenter/crashes/Crashes;->mDevice:Lcom/microsoft/appcenter/ingestion/models/Device;

    if-nez v0, :cond_0

    .line 587
    invoke-static {p1}, Lcom/microsoft/appcenter/utils/DeviceInfoHelper;->getDeviceInfo(Landroid/content/Context;)Lcom/microsoft/appcenter/ingestion/models/Device;

    move-result-object p1

    iput-object p1, p0, Lcom/microsoft/appcenter/crashes/Crashes;->mDevice:Lcom/microsoft/appcenter/ingestion/models/Device;

    .line 589
    :cond_0
    iget-object p1, p0, Lcom/microsoft/appcenter/crashes/Crashes;->mDevice:Lcom/microsoft/appcenter/ingestion/models/Device;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method protected getGroupName()Ljava/lang/String;
    .locals 1

    const-string v0, "groupErrors"

    return-object v0
.end method

.method declared-synchronized getInitializeTimestamp()J
    .locals 2

    monitor-enter p0

    .line 598
    :try_start_0
    iget-wide v0, p0, Lcom/microsoft/appcenter/crashes/Crashes;->mInitializeTimestamp:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-wide v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method getInstanceListener()Lcom/microsoft/appcenter/crashes/CrashesListener;
    .locals 1
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .line 910
    iget-object v0, p0, Lcom/microsoft/appcenter/crashes/Crashes;->mCrashesListener:Lcom/microsoft/appcenter/crashes/CrashesListener;

    return-object v0
.end method

.method public getLogFactories()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/microsoft/appcenter/ingestion/models/json/LogFactory;",
            ">;"
        }
    .end annotation

    .line 473
    iget-object v0, p0, Lcom/microsoft/appcenter/crashes/Crashes;->mFactories:Ljava/util/Map;

    return-object v0
.end method

.method protected getLoggerTag()Ljava/lang/String;
    .locals 1

    const-string v0, "AppCenterCrashes"

    return-object v0
.end method

.method public getServiceName()Ljava/lang/String;
    .locals 1

    const-string v0, "Crashes"

    return-object v0
.end method

.method protected getTriggerCount()I
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method getUncaughtExceptionHandler()Lcom/microsoft/appcenter/crashes/UncaughtExceptionHandler;
    .locals 1
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .line 877
    iget-object v0, p0, Lcom/microsoft/appcenter/crashes/Crashes;->mUncaughtExceptionHandler:Lcom/microsoft/appcenter/crashes/UncaughtExceptionHandler;

    return-object v0
.end method

.method getUnprocessedErrorReports()Lcom/microsoft/appcenter/utils/async/AppCenterFuture;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/microsoft/appcenter/utils/async/AppCenterFuture<",
            "Ljava/util/Collection<",
            "Lcom/microsoft/appcenter/crashes/model/ErrorReport;",
            ">;>;"
        }
    .end annotation

    .line 1146
    new-instance v0, Lcom/microsoft/appcenter/utils/async/DefaultAppCenterFuture;

    invoke-direct {v0}, Lcom/microsoft/appcenter/utils/async/DefaultAppCenterFuture;-><init>()V

    .line 1147
    new-instance v1, Lcom/microsoft/appcenter/crashes/Crashes$12;

    invoke-direct {v1, p0, v0}, Lcom/microsoft/appcenter/crashes/Crashes$12;-><init>(Lcom/microsoft/appcenter/crashes/Crashes;Lcom/microsoft/appcenter/utils/async/DefaultAppCenterFuture;)V

    .line 1157
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v2

    .line 1147
    invoke-virtual {p0, v1, v0, v2}, Lcom/microsoft/appcenter/crashes/Crashes;->postAsyncGetter(Ljava/lang/Runnable;Lcom/microsoft/appcenter/utils/async/DefaultAppCenterFuture;Ljava/lang/Object;)V

    return-object v0
.end method

.method public declared-synchronized onStarted(Landroid/content/Context;Lcom/microsoft/appcenter/channel/Channel;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/microsoft/appcenter/channel/Channel;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    monitor-enter p0

    .line 464
    :try_start_0
    iput-object p1, p0, Lcom/microsoft/appcenter/crashes/Crashes;->mContext:Landroid/content/Context;

    .line 465
    invoke-super/range {p0 .. p5}, Lcom/microsoft/appcenter/AbstractAppCenterService;->onStarted(Landroid/content/Context;Lcom/microsoft/appcenter/channel/Channel;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 466
    invoke-virtual {p0}, Lcom/microsoft/appcenter/crashes/Crashes;->isInstanceEnabled()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 467
    invoke-direct {p0}, Lcom/microsoft/appcenter/crashes/Crashes;->processPendingErrors()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 469
    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method declared-synchronized queueException(Lcom/microsoft/appcenter/crashes/ingestion/models/Exception;Ljava/util/Map;Ljava/lang/Iterable;)Ljava/util/UUID;
    .locals 1
    .param p1    # Lcom/microsoft/appcenter/crashes/ingestion/models/Exception;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/microsoft/appcenter/crashes/ingestion/models/Exception;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/Iterable<",
            "Lcom/microsoft/appcenter/crashes/ingestion/models/ErrorAttachmentLog;",
            ">;)",
            "Ljava/util/UUID;"
        }
    .end annotation

    monitor-enter p0

    .line 627
    :try_start_0
    new-instance v0, Lcom/microsoft/appcenter/crashes/Crashes$8;

    invoke-direct {v0, p0, p1}, Lcom/microsoft/appcenter/crashes/Crashes$8;-><init>(Lcom/microsoft/appcenter/crashes/Crashes;Lcom/microsoft/appcenter/crashes/ingestion/models/Exception;)V

    invoke-direct {p0, v0, p2, p3}, Lcom/microsoft/appcenter/crashes/Crashes;->queueException(Lcom/microsoft/appcenter/crashes/Crashes$ExceptionModelBuilder;Ljava/util/Map;Ljava/lang/Iterable;)Ljava/util/UUID;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method saveUncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;Lcom/microsoft/appcenter/crashes/ingestion/models/Exception;)Ljava/util/UUID;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 1079
    invoke-static {}, Lcom/microsoft/appcenter/crashes/Crashes;->isEnabled()Lcom/microsoft/appcenter/utils/async/AppCenterFuture;

    move-result-object v0

    invoke-interface {v0}, Lcom/microsoft/appcenter/utils/async/AppCenterFuture;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    .line 1087
    :cond_0
    iget-boolean v0, p0, Lcom/microsoft/appcenter/crashes/Crashes;->mSavedUncaughtException:Z

    if-eqz v0, :cond_1

    return-object v1

    :cond_1
    const/4 v0, 0x1

    .line 1090
    iput-boolean v0, p0, Lcom/microsoft/appcenter/crashes/Crashes;->mSavedUncaughtException:Z

    .line 1093
    iget-object v1, p0, Lcom/microsoft/appcenter/crashes/Crashes;->mContext:Landroid/content/Context;

    invoke-static {}, Ljava/lang/Thread;->getAllStackTraces()Ljava/util/Map;

    move-result-object v4

    iget-wide v5, p0, Lcom/microsoft/appcenter/crashes/Crashes;->mInitializeTimestamp:J

    const/4 v7, 0x1

    move-object v2, p1

    move-object v3, p3

    invoke-static/range {v1 .. v7}, Lcom/microsoft/appcenter/crashes/utils/ErrorLogHelper;->createErrorLog(Landroid/content/Context;Ljava/lang/Thread;Lcom/microsoft/appcenter/crashes/ingestion/models/Exception;Ljava/util/Map;JZ)Lcom/microsoft/appcenter/crashes/ingestion/models/ManagedErrorLog;

    move-result-object p1

    .line 1094
    invoke-direct {p0, p2, p1}, Lcom/microsoft/appcenter/crashes/Crashes;->saveErrorLogFiles(Ljava/lang/Throwable;Lcom/microsoft/appcenter/crashes/ingestion/models/ManagedErrorLog;)Ljava/util/UUID;

    move-result-object p1

    return-object p1
.end method

.method saveUncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V
    .locals 2

    const-string v0, "AppCenterCrashes"

    .line 1058
    :try_start_0
    invoke-static {p2}, Lcom/microsoft/appcenter/crashes/utils/ErrorLogHelper;->getModelExceptionFromThrowable(Ljava/lang/Throwable;)Lcom/microsoft/appcenter/crashes/ingestion/models/Exception;

    move-result-object v1

    invoke-virtual {p0, p1, p2, v1}, Lcom/microsoft/appcenter/crashes/Crashes;->saveUncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;Lcom/microsoft/appcenter/crashes/ingestion/models/Exception;)Ljava/util/UUID;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string p2, "Error writing error log to file"

    .line 1062
    invoke-static {v0, p2, p1}, Lcom/microsoft/appcenter/utils/AppCenterLog;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    :catch_1
    move-exception p1

    const-string p2, "Error serializing error log to JSON"

    .line 1060
    invoke-static {v0, p2, p1}, Lcom/microsoft/appcenter/utils/AppCenterLog;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method sendCrashReportsOrAwaitUserConfirmation(Ljava/util/Collection;)Lcom/microsoft/appcenter/utils/async/AppCenterFuture;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/microsoft/appcenter/utils/async/AppCenterFuture<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1165
    new-instance v0, Lcom/microsoft/appcenter/utils/async/DefaultAppCenterFuture;

    invoke-direct {v0}, Lcom/microsoft/appcenter/utils/async/DefaultAppCenterFuture;-><init>()V

    .line 1166
    new-instance v1, Lcom/microsoft/appcenter/crashes/Crashes$13;

    invoke-direct {v1, p0, p1, v0}, Lcom/microsoft/appcenter/crashes/Crashes$13;-><init>(Lcom/microsoft/appcenter/crashes/Crashes;Ljava/util/Collection;Lcom/microsoft/appcenter/utils/async/DefaultAppCenterFuture;)V

    const/4 p1, 0x0

    .line 1189
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    .line 1166
    invoke-virtual {p0, v1, v0, p1}, Lcom/microsoft/appcenter/crashes/Crashes;->postAsyncGetter(Ljava/lang/Runnable;Lcom/microsoft/appcenter/utils/async/DefaultAppCenterFuture;Ljava/lang/Object;)V

    return-object v0
.end method

.method sendErrorAttachments(Ljava/lang/String;Ljava/lang/Iterable;)V
    .locals 1
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Iterable<",
            "Lcom/microsoft/appcenter/crashes/ingestion/models/ErrorAttachmentLog;",
            ">;)V"
        }
    .end annotation

    .line 1198
    new-instance v0, Lcom/microsoft/appcenter/crashes/Crashes$14;

    invoke-direct {v0, p0, p1, p2}, Lcom/microsoft/appcenter/crashes/Crashes$14;-><init>(Lcom/microsoft/appcenter/crashes/Crashes;Ljava/lang/String;Ljava/lang/Iterable;)V

    invoke-virtual {p0, v0}, Lcom/microsoft/appcenter/crashes/Crashes;->post(Ljava/lang/Runnable;)V

    return-void
.end method

.method setAutomaticProcessing(Z)V
    .locals 0

    .line 1139
    iput-boolean p1, p0, Lcom/microsoft/appcenter/crashes/Crashes;->mAutomaticProcessing:Z

    return-void
.end method

.method declared-synchronized setInstanceListener(Lcom/microsoft/appcenter/crashes/CrashesListener;)V
    .locals 0
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    monitor-enter p0

    if-nez p1, :cond_0

    .line 916
    :try_start_0
    sget-object p1, Lcom/microsoft/appcenter/crashes/Crashes;->DEFAULT_ERROR_REPORTING_LISTENER:Lcom/microsoft/appcenter/crashes/CrashesListener;

    .line 918
    :cond_0
    iput-object p1, p0, Lcom/microsoft/appcenter/crashes/Crashes;->mCrashesListener:Lcom/microsoft/appcenter/crashes/CrashesListener;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 919
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method setLogSerializer(Lcom/microsoft/appcenter/ingestion/models/json/LogSerializer;)V
    .locals 0
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .line 1047
    iput-object p1, p0, Lcom/microsoft/appcenter/crashes/Crashes;->mLogSerializer:Lcom/microsoft/appcenter/ingestion/models/json/LogSerializer;

    return-void
.end method

.method setUncaughtExceptionHandler(Lcom/microsoft/appcenter/crashes/UncaughtExceptionHandler;)V
    .locals 0
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .line 882
    iput-object p1, p0, Lcom/microsoft/appcenter/crashes/Crashes;->mUncaughtExceptionHandler:Lcom/microsoft/appcenter/crashes/UncaughtExceptionHandler;

    return-void
.end method
