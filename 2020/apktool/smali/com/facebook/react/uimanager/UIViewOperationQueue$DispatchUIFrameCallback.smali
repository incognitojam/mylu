.class Lcom/facebook/react/uimanager/UIViewOperationQueue$DispatchUIFrameCallback;
.super Lcom/facebook/react/uimanager/GuardedFrameCallback;
.source "UIViewOperationQueue.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/react/uimanager/UIViewOperationQueue;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DispatchUIFrameCallback"
.end annotation


# static fields
.field private static final FRAME_TIME_MS:I = 0x10


# instance fields
.field private final mMinTimeLeftInFrameForNonBatchedOperationMs:I

.field final synthetic this$0:Lcom/facebook/react/uimanager/UIViewOperationQueue;


# direct methods
.method private constructor <init>(Lcom/facebook/react/uimanager/UIViewOperationQueue;Lcom/facebook/react/bridge/ReactContext;I)V
    .locals 0

    .line 927
    iput-object p1, p0, Lcom/facebook/react/uimanager/UIViewOperationQueue$DispatchUIFrameCallback;->this$0:Lcom/facebook/react/uimanager/UIViewOperationQueue;

    .line 928
    invoke-direct {p0, p2}, Lcom/facebook/react/uimanager/GuardedFrameCallback;-><init>(Lcom/facebook/react/bridge/ReactContext;)V

    .line 929
    iput p3, p0, Lcom/facebook/react/uimanager/UIViewOperationQueue$DispatchUIFrameCallback;->mMinTimeLeftInFrameForNonBatchedOperationMs:I

    return-void
.end method

.method synthetic constructor <init>(Lcom/facebook/react/uimanager/UIViewOperationQueue;Lcom/facebook/react/bridge/ReactContext;ILcom/facebook/react/uimanager/UIViewOperationQueue$1;)V
    .locals 0

    .line 921
    invoke-direct {p0, p1, p2, p3}, Lcom/facebook/react/uimanager/UIViewOperationQueue$DispatchUIFrameCallback;-><init>(Lcom/facebook/react/uimanager/UIViewOperationQueue;Lcom/facebook/react/bridge/ReactContext;I)V

    return-void
.end method

.method private dispatchPendingNonBatchedOperations(J)V
    .locals 8

    :goto_0
    const-wide/16 v0, 0x10

    .line 956
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v2

    sub-long/2addr v2, p1

    const-wide/32 v4, 0xf4240

    div-long/2addr v2, v4

    sub-long/2addr v0, v2

    .line 957
    iget v2, p0, Lcom/facebook/react/uimanager/UIViewOperationQueue$DispatchUIFrameCallback;->mMinTimeLeftInFrameForNonBatchedOperationMs:I

    int-to-long v2, v2

    cmp-long v4, v0, v2

    if-gez v4, :cond_0

    goto :goto_1

    .line 962
    :cond_0
    iget-object v0, p0, Lcom/facebook/react/uimanager/UIViewOperationQueue$DispatchUIFrameCallback;->this$0:Lcom/facebook/react/uimanager/UIViewOperationQueue;

    invoke-static {v0}, Lcom/facebook/react/uimanager/UIViewOperationQueue;->access$2300(Lcom/facebook/react/uimanager/UIViewOperationQueue;)Ljava/lang/Object;

    move-result-object v0

    monitor-enter v0

    .line 963
    :try_start_0
    iget-object v1, p0, Lcom/facebook/react/uimanager/UIViewOperationQueue$DispatchUIFrameCallback;->this$0:Lcom/facebook/react/uimanager/UIViewOperationQueue;

    invoke-static {v1}, Lcom/facebook/react/uimanager/UIViewOperationQueue;->access$2400(Lcom/facebook/react/uimanager/UIViewOperationQueue;)Ljava/util/ArrayDeque;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayDeque;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 964
    monitor-exit v0

    :goto_1
    return-void

    .line 967
    :cond_1
    iget-object v1, p0, Lcom/facebook/react/uimanager/UIViewOperationQueue$DispatchUIFrameCallback;->this$0:Lcom/facebook/react/uimanager/UIViewOperationQueue;

    invoke-static {v1}, Lcom/facebook/react/uimanager/UIViewOperationQueue;->access$2400(Lcom/facebook/react/uimanager/UIViewOperationQueue;)Ljava/util/ArrayDeque;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayDeque;->pollFirst()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/facebook/react/uimanager/UIViewOperationQueue$UIOperation;

    .line 968
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 971
    :try_start_1
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    .line 972
    invoke-interface {v1}, Lcom/facebook/react/uimanager/UIViewOperationQueue$UIOperation;->execute()V

    .line 973
    iget-object v0, p0, Lcom/facebook/react/uimanager/UIViewOperationQueue$DispatchUIFrameCallback;->this$0:Lcom/facebook/react/uimanager/UIViewOperationQueue;

    iget-object v1, p0, Lcom/facebook/react/uimanager/UIViewOperationQueue$DispatchUIFrameCallback;->this$0:Lcom/facebook/react/uimanager/UIViewOperationQueue;

    invoke-static {v1}, Lcom/facebook/react/uimanager/UIViewOperationQueue;->access$2500(Lcom/facebook/react/uimanager/UIViewOperationQueue;)J

    move-result-wide v4

    .line 974
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v6

    sub-long/2addr v6, v2

    add-long/2addr v4, v6

    .line 973
    invoke-static {v0, v4, v5}, Lcom/facebook/react/uimanager/UIViewOperationQueue;->access$2502(Lcom/facebook/react/uimanager/UIViewOperationQueue;J)J
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 976
    iget-object p2, p0, Lcom/facebook/react/uimanager/UIViewOperationQueue$DispatchUIFrameCallback;->this$0:Lcom/facebook/react/uimanager/UIViewOperationQueue;

    const/4 v0, 0x1

    invoke-static {p2, v0}, Lcom/facebook/react/uimanager/UIViewOperationQueue;->access$2102(Lcom/facebook/react/uimanager/UIViewOperationQueue;Z)Z

    .line 977
    throw p1

    :catchall_0
    move-exception p1

    .line 968
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p1
.end method


# virtual methods
.method public doFrameGuarded(J)V
    .locals 3

    .line 934
    iget-object v0, p0, Lcom/facebook/react/uimanager/UIViewOperationQueue$DispatchUIFrameCallback;->this$0:Lcom/facebook/react/uimanager/UIViewOperationQueue;

    invoke-static {v0}, Lcom/facebook/react/uimanager/UIViewOperationQueue;->access$2100(Lcom/facebook/react/uimanager/UIViewOperationQueue;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string p1, "ReactNative"

    const-string p2, "Not flushing pending UI operations because of previously thrown Exception"

    .line 935
    invoke-static {p1, p2}, Lcom/facebook/common/logging/FLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    const-wide/16 v0, 0x0

    const-string v2, "dispatchNonBatchedUIOperations"

    .line 941
    invoke-static {v0, v1, v2}, Lcom/facebook/systrace/Systrace;->beginSection(JLjava/lang/String;)V

    .line 943
    :try_start_0
    invoke-direct {p0, p1, p2}, Lcom/facebook/react/uimanager/UIViewOperationQueue$DispatchUIFrameCallback;->dispatchPendingNonBatchedOperations(J)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 945
    invoke-static {v0, v1}, Lcom/facebook/systrace/Systrace;->endSection(J)V

    .line 948
    iget-object p1, p0, Lcom/facebook/react/uimanager/UIViewOperationQueue$DispatchUIFrameCallback;->this$0:Lcom/facebook/react/uimanager/UIViewOperationQueue;

    invoke-static {p1}, Lcom/facebook/react/uimanager/UIViewOperationQueue;->access$2200(Lcom/facebook/react/uimanager/UIViewOperationQueue;)V

    .line 950
    invoke-static {}, Lcom/facebook/react/modules/core/ReactChoreographer;->getInstance()Lcom/facebook/react/modules/core/ReactChoreographer;

    move-result-object p1

    sget-object p2, Lcom/facebook/react/modules/core/ReactChoreographer$CallbackType;->DISPATCH_UI:Lcom/facebook/react/modules/core/ReactChoreographer$CallbackType;

    .line 951
    invoke-virtual {p1, p2, p0}, Lcom/facebook/react/modules/core/ReactChoreographer;->postFrameCallback(Lcom/facebook/react/modules/core/ReactChoreographer$CallbackType;Lcom/facebook/react/modules/core/ChoreographerCompat$FrameCallback;)V

    return-void

    :catchall_0
    move-exception p1

    .line 945
    invoke-static {v0, v1}, Lcom/facebook/systrace/Systrace;->endSection(J)V

    .line 946
    throw p1
.end method
