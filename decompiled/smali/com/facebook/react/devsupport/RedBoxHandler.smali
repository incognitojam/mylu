.class public interface abstract Lcom/facebook/react/devsupport/RedBoxHandler;
.super Ljava/lang/Object;
.source "RedBoxHandler.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/react/devsupport/RedBoxHandler$ReportCompletedListener;,
        Lcom/facebook/react/devsupport/RedBoxHandler$ErrorType;
    }
.end annotation


# virtual methods
.method public abstract handleRedbox(Ljava/lang/String;[Lcom/facebook/react/devsupport/interfaces/StackFrame;Lcom/facebook/react/devsupport/RedBoxHandler$ErrorType;)V
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
.end method

.method public abstract isReportEnabled()Z
.end method

.method public abstract reportRedbox(Landroid/content/Context;Ljava/lang/String;[Lcom/facebook/react/devsupport/interfaces/StackFrame;Ljava/lang/String;Lcom/facebook/react/devsupport/RedBoxHandler$ReportCompletedListener;)V
.end method
