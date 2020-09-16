.class public Lcom/facebook/react/touch/JSResponderHandler;
.super Ljava/lang/Object;
.source "JSResponderHandler.java"

# interfaces
.implements Lcom/facebook/react/touch/OnInterceptTouchEventListener;


# static fields
.field private static final JS_RESPONDER_UNSET:I = -0x1


# instance fields
.field private volatile mCurrentJSResponder:I

.field private mViewParentBlockingNativeResponder:Landroid/view/ViewParent;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 27
    iput v0, p0, Lcom/facebook/react/touch/JSResponderHandler;->mCurrentJSResponder:I

    return-void
.end method

.method private maybeUnblockNativeResponder()V
    .locals 2

    .line 52
    iget-object v0, p0, Lcom/facebook/react/touch/JSResponderHandler;->mViewParentBlockingNativeResponder:Landroid/view/ViewParent;

    if-eqz v0, :cond_0

    const/4 v1, 0x0

    .line 53
    invoke-interface {v0, v1}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    const/4 v0, 0x0

    .line 54
    iput-object v0, p0, Lcom/facebook/react/touch/JSResponderHandler;->mViewParentBlockingNativeResponder:Landroid/view/ViewParent;

    :cond_0
    return-void
.end method


# virtual methods
.method public clearJSResponder()V
    .locals 1

    const/4 v0, -0x1

    .line 47
    iput v0, p0, Lcom/facebook/react/touch/JSResponderHandler;->mCurrentJSResponder:I

    .line 48
    invoke-direct {p0}, Lcom/facebook/react/touch/JSResponderHandler;->maybeUnblockNativeResponder()V

    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/ViewGroup;Landroid/view/MotionEvent;)Z
    .locals 3

    .line 60
    iget v0, p0, Lcom/facebook/react/touch/JSResponderHandler;->mCurrentJSResponder:I

    const/4 v1, 0x0

    const/4 v2, -0x1

    if-eq v0, v2, :cond_0

    .line 61
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result p2

    const/4 v2, 0x1

    if-eq p2, v2, :cond_0

    .line 68
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getId()I

    move-result p1

    if-ne p1, v0, :cond_0

    const/4 v1, 0x1

    :cond_0
    return v1
.end method

.method public setJSResponder(ILandroid/view/ViewParent;)V
    .locals 0
    .param p2    # Landroid/view/ViewParent;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 33
    iput p1, p0, Lcom/facebook/react/touch/JSResponderHandler;->mCurrentJSResponder:I

    .line 39
    invoke-direct {p0}, Lcom/facebook/react/touch/JSResponderHandler;->maybeUnblockNativeResponder()V

    if-eqz p2, :cond_0

    const/4 p1, 0x1

    .line 41
    invoke-interface {p2, p1}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 42
    iput-object p2, p0, Lcom/facebook/react/touch/JSResponderHandler;->mViewParentBlockingNativeResponder:Landroid/view/ViewParent;

    :cond_0
    return-void
.end method
