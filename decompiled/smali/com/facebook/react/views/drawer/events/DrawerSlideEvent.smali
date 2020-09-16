.class public Lcom/facebook/react/views/drawer/events/DrawerSlideEvent;
.super Lcom/facebook/react/uimanager/events/Event;
.source "DrawerSlideEvent.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/facebook/react/uimanager/events/Event<",
        "Lcom/facebook/react/views/drawer/events/DrawerSlideEvent;",
        ">;"
    }
.end annotation


# static fields
.field public static final EVENT_NAME:Ljava/lang/String; = "topDrawerSlide"


# instance fields
.field private final mOffset:F


# direct methods
.method public constructor <init>(IF)V
    .locals 0

    .line 22
    invoke-direct {p0, p1}, Lcom/facebook/react/uimanager/events/Event;-><init>(I)V

    .line 23
    iput p2, p0, Lcom/facebook/react/views/drawer/events/DrawerSlideEvent;->mOffset:F

    return-void
.end method

.method private serializeEventData()Lcom/facebook/react/bridge/WritableMap;
    .locals 4

    .line 47
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createMap()Lcom/facebook/react/bridge/WritableMap;

    move-result-object v0

    .line 48
    invoke-virtual {p0}, Lcom/facebook/react/views/drawer/events/DrawerSlideEvent;->getOffset()F

    move-result v1

    float-to-double v1, v1

    const-string v3, "offset"

    invoke-interface {v0, v3, v1, v2}, Lcom/facebook/react/bridge/WritableMap;->putDouble(Ljava/lang/String;D)V

    return-object v0
.end method


# virtual methods
.method public dispatch(Lcom/facebook/react/uimanager/events/RCTEventEmitter;)V
    .locals 3

    .line 43
    invoke-virtual {p0}, Lcom/facebook/react/views/drawer/events/DrawerSlideEvent;->getViewTag()I

    move-result v0

    invoke-virtual {p0}, Lcom/facebook/react/views/drawer/events/DrawerSlideEvent;->getEventName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0}, Lcom/facebook/react/views/drawer/events/DrawerSlideEvent;->serializeEventData()Lcom/facebook/react/bridge/WritableMap;

    move-result-object v2

    invoke-interface {p1, v0, v1, v2}, Lcom/facebook/react/uimanager/events/RCTEventEmitter;->receiveEvent(ILjava/lang/String;Lcom/facebook/react/bridge/WritableMap;)V

    return-void
.end method

.method public getCoalescingKey()S
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public getEventName()Ljava/lang/String;
    .locals 1

    const-string/jumbo v0, "topDrawerSlide"

    return-object v0
.end method

.method public getOffset()F
    .locals 1

    .line 27
    iget v0, p0, Lcom/facebook/react/views/drawer/events/DrawerSlideEvent;->mOffset:F

    return v0
.end method
