.class public final synthetic Lio/invertase/firebase/messaging/-$$Lambda$ReactNativeFirebaseMessagingModule$TASPju9cCVgRj0jqh3Fu_VCDbvw;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Lcom/google/android/gms/tasks/OnCompleteListener;


# instance fields
.field private final synthetic f$0:Lcom/facebook/react/bridge/Promise;


# direct methods
.method public synthetic constructor <init>(Lcom/facebook/react/bridge/Promise;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lio/invertase/firebase/messaging/-$$Lambda$ReactNativeFirebaseMessagingModule$TASPju9cCVgRj0jqh3Fu_VCDbvw;->f$0:Lcom/facebook/react/bridge/Promise;

    return-void
.end method


# virtual methods
.method public final onComplete(Lcom/google/android/gms/tasks/Task;)V
    .locals 1

    iget-object v0, p0, Lio/invertase/firebase/messaging/-$$Lambda$ReactNativeFirebaseMessagingModule$TASPju9cCVgRj0jqh3Fu_VCDbvw;->f$0:Lcom/facebook/react/bridge/Promise;

    invoke-static {v0, p1}, Lio/invertase/firebase/messaging/ReactNativeFirebaseMessagingModule;->lambda$deleteToken$5(Lcom/facebook/react/bridge/Promise;Lcom/google/android/gms/tasks/Task;)V

    return-void
.end method
