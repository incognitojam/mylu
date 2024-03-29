.class public Lcom/reactnativecommunity/art/ARTTextShadowNode;
.super Lcom/reactnativecommunity/art/ARTShapeShadowNode;
.source "ARTTextShadowNode.java"


# static fields
.field private static final DEFAULT_FONT_SIZE:I = 0xc

.field private static final PROP_FONT:Ljava/lang/String; = "font"

.field private static final PROP_FONT_FAMILY:Ljava/lang/String; = "fontFamily"

.field private static final PROP_FONT_SIZE:Ljava/lang/String; = "fontSize"

.field private static final PROP_FONT_STYLE:Ljava/lang/String; = "fontStyle"

.field private static final PROP_FONT_WEIGHT:Ljava/lang/String; = "fontWeight"

.field private static final PROP_LINES:Ljava/lang/String; = "lines"

.field private static final TEXT_ALIGNMENT_CENTER:I = 0x2

.field private static final TEXT_ALIGNMENT_LEFT:I = 0x0

.field private static final TEXT_ALIGNMENT_RIGHT:I = 0x1


# instance fields
.field private mFrame:Lcom/facebook/react/bridge/ReadableMap;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private mTextAlignment:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 43
    invoke-direct {p0}, Lcom/reactnativecommunity/art/ARTShapeShadowNode;-><init>()V

    const/4 v0, 0x0

    .line 41
    iput v0, p0, Lcom/reactnativecommunity/art/ARTTextShadowNode;->mTextAlignment:I

    return-void
.end method

.method private applyTextPropertiesToPaint(Landroid/graphics/Paint;)V
    .locals 7

    .line 103
    iget v0, p0, Lcom/reactnativecommunity/art/ARTTextShadowNode;->mTextAlignment:I

    const/4 v1, 0x2

    const/4 v2, 0x1

    if-eqz v0, :cond_2

    if-eq v0, v2, :cond_1

    if-eq v0, v1, :cond_0

    goto :goto_0

    .line 112
    :cond_0
    sget-object v0, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    goto :goto_0

    .line 109
    :cond_1
    sget-object v0, Landroid/graphics/Paint$Align;->RIGHT:Landroid/graphics/Paint$Align;

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    goto :goto_0

    .line 106
    :cond_2
    sget-object v0, Landroid/graphics/Paint$Align;->LEFT:Landroid/graphics/Paint$Align;

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 115
    :goto_0
    iget-object v0, p0, Lcom/reactnativecommunity/art/ARTTextShadowNode;->mFrame:Lcom/facebook/react/bridge/ReadableMap;

    if-eqz v0, :cond_9

    const-string v3, "font"

    .line 116
    invoke-interface {v0, v3}, Lcom/facebook/react/bridge/ReadableMap;->hasKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 117
    iget-object v0, p0, Lcom/reactnativecommunity/art/ARTTextShadowNode;->mFrame:Lcom/facebook/react/bridge/ReadableMap;

    invoke-interface {v0, v3}, Lcom/facebook/react/bridge/ReadableMap;->getMap(Ljava/lang/String;)Lcom/facebook/react/bridge/ReadableMap;

    move-result-object v0

    if-eqz v0, :cond_9

    const/high16 v3, 0x41400000    # 12.0f

    const-string v4, "fontSize"

    .line 120
    invoke-interface {v0, v4}, Lcom/facebook/react/bridge/ReadableMap;->hasKey(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 121
    invoke-interface {v0, v4}, Lcom/facebook/react/bridge/ReadableMap;->getDouble(Ljava/lang/String;)D

    move-result-wide v3

    double-to-float v3, v3

    .line 123
    :cond_3
    iget v4, p0, Lcom/reactnativecommunity/art/ARTTextShadowNode;->mScale:F

    mul-float v3, v3, v4

    invoke-virtual {p1, v3}, Landroid/graphics/Paint;->setTextSize(F)V

    const-string v3, "fontWeight"

    .line 125
    invoke-interface {v0, v3}, Lcom/facebook/react/bridge/ReadableMap;->hasKey(Ljava/lang/String;)Z

    move-result v4

    const/4 v5, 0x0

    if-eqz v4, :cond_4

    invoke-interface {v0, v3}, Lcom/facebook/react/bridge/ReadableMap;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "bold"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    const/4 v3, 0x1

    goto :goto_1

    :cond_4
    const/4 v3, 0x0

    :goto_1
    const-string v4, "fontStyle"

    .line 127
    invoke-interface {v0, v4}, Lcom/facebook/react/bridge/ReadableMap;->hasKey(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_5

    invoke-interface {v0, v4}, Lcom/facebook/react/bridge/ReadableMap;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v6, "italic"

    invoke-virtual {v6, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5

    const/4 v4, 0x1

    goto :goto_2

    :cond_5
    const/4 v4, 0x0

    :goto_2
    if-eqz v3, :cond_6

    if-eqz v4, :cond_6

    const/4 v1, 0x3

    goto :goto_3

    :cond_6
    if-eqz v3, :cond_7

    const/4 v1, 0x1

    goto :goto_3

    :cond_7
    if-eqz v4, :cond_8

    goto :goto_3

    :cond_8
    const/4 v1, 0x0

    :goto_3
    const-string v2, "fontFamily"

    .line 139
    invoke-interface {v0, v2}, Lcom/facebook/react/bridge/ReadableMap;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v1}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    :cond_9
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;Landroid/graphics/Paint;F)V
    .locals 9

    .line 57
    iget-object v0, p0, Lcom/reactnativecommunity/art/ARTTextShadowNode;->mFrame:Lcom/facebook/react/bridge/ReadableMap;

    if-nez v0, :cond_0

    return-void

    .line 60
    :cond_0
    iget v0, p0, Lcom/reactnativecommunity/art/ARTTextShadowNode;->mOpacity:F

    mul-float p3, p3, v0

    const v0, 0x3c23d70a    # 0.01f

    cmpg-float v0, p3, v0

    if-gtz v0, :cond_1

    return-void

    .line 64
    :cond_1
    iget-object v0, p0, Lcom/reactnativecommunity/art/ARTTextShadowNode;->mFrame:Lcom/facebook/react/bridge/ReadableMap;

    const-string v1, "lines"

    invoke-interface {v0, v1}, Lcom/facebook/react/bridge/ReadableMap;->hasKey(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    return-void

    .line 67
    :cond_2
    iget-object v0, p0, Lcom/reactnativecommunity/art/ARTTextShadowNode;->mFrame:Lcom/facebook/react/bridge/ReadableMap;

    invoke-interface {v0, v1}, Lcom/facebook/react/bridge/ReadableMap;->getArray(Ljava/lang/String;)Lcom/facebook/react/bridge/ReadableArray;

    move-result-object v0

    if-eqz v0, :cond_a

    .line 68
    invoke-interface {v0}, Lcom/facebook/react/bridge/ReadableArray;->size()I

    move-result v1

    if-nez v1, :cond_3

    goto/16 :goto_3

    .line 73
    :cond_3
    invoke-virtual {p0, p1}, Lcom/reactnativecommunity/art/ARTTextShadowNode;->saveAndSetupCanvas(Landroid/graphics/Canvas;)V

    .line 74
    invoke-interface {v0}, Lcom/facebook/react/bridge/ReadableArray;->size()I

    move-result v1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    .line 75
    :goto_0
    array-length v3, v1

    if-ge v2, v3, :cond_4

    .line 76
    invoke-interface {v0, v2}, Lcom/facebook/react/bridge/ReadableArray;->getString(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_4
    const-string v0, "\n"

    .line 78
    invoke-static {v0, v1}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 79
    invoke-virtual {p0, p2, p3}, Lcom/reactnativecommunity/art/ARTTextShadowNode;->setupStrokePaint(Landroid/graphics/Paint;F)Z

    move-result v1

    const/4 v8, 0x0

    if-eqz v1, :cond_6

    .line 80
    invoke-direct {p0, p2}, Lcom/reactnativecommunity/art/ARTTextShadowNode;->applyTextPropertiesToPaint(Landroid/graphics/Paint;)V

    .line 81
    iget-object v1, p0, Lcom/reactnativecommunity/art/ARTTextShadowNode;->mPath:Landroid/graphics/Path;

    if-nez v1, :cond_5

    .line 82
    invoke-virtual {p2}, Landroid/graphics/Paint;->ascent()F

    move-result v1

    neg-float v1, v1

    invoke-virtual {p1, v0, v8, v1, p2}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    goto :goto_1

    .line 84
    :cond_5
    iget-object v4, p0, Lcom/reactnativecommunity/art/ARTTextShadowNode;->mPath:Landroid/graphics/Path;

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v2, p1

    move-object v3, v0

    move-object v7, p2

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawTextOnPath(Ljava/lang/String;Landroid/graphics/Path;FFLandroid/graphics/Paint;)V

    .line 87
    :cond_6
    :goto_1
    invoke-virtual {p0, p2, p3}, Lcom/reactnativecommunity/art/ARTTextShadowNode;->setupFillPaint(Landroid/graphics/Paint;F)Z

    move-result p3

    if-eqz p3, :cond_8

    .line 88
    invoke-direct {p0, p2}, Lcom/reactnativecommunity/art/ARTTextShadowNode;->applyTextPropertiesToPaint(Landroid/graphics/Paint;)V

    .line 89
    iget-object p3, p0, Lcom/reactnativecommunity/art/ARTTextShadowNode;->mPath:Landroid/graphics/Path;

    if-nez p3, :cond_7

    .line 90
    invoke-virtual {p2}, Landroid/graphics/Paint;->ascent()F

    move-result p3

    neg-float p3, p3

    invoke-virtual {p1, v0, v8, p3, p2}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    goto :goto_2

    .line 92
    :cond_7
    iget-object v4, p0, Lcom/reactnativecommunity/art/ARTTextShadowNode;->mPath:Landroid/graphics/Path;

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v2, p1

    move-object v3, v0

    move-object v7, p2

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawTextOnPath(Ljava/lang/String;Landroid/graphics/Path;FFLandroid/graphics/Paint;)V

    .line 95
    :cond_8
    :goto_2
    iget p3, p0, Lcom/reactnativecommunity/art/ARTTextShadowNode;->mShadowOpacity:F

    cmpl-float p3, p3, v8

    if-lez p3, :cond_9

    .line 96
    iget p3, p0, Lcom/reactnativecommunity/art/ARTTextShadowNode;->mShadowRadius:F

    iget v0, p0, Lcom/reactnativecommunity/art/ARTTextShadowNode;->mShadowOffsetX:F

    iget v1, p0, Lcom/reactnativecommunity/art/ARTTextShadowNode;->mShadowOffsetY:F

    iget v2, p0, Lcom/reactnativecommunity/art/ARTTextShadowNode;->mShadowColor:I

    invoke-virtual {p2, p3, v0, v1, v2}, Landroid/graphics/Paint;->setShadowLayer(FFFI)V

    .line 98
    :cond_9
    invoke-virtual {p0, p1}, Lcom/reactnativecommunity/art/ARTTextShadowNode;->restoreCanvas(Landroid/graphics/Canvas;)V

    .line 99
    invoke-virtual {p0}, Lcom/reactnativecommunity/art/ARTTextShadowNode;->markUpdateSeen()V

    :cond_a
    :goto_3
    return-void
.end method

.method public setAlignment(I)V
    .locals 0
    .annotation runtime Lcom/facebook/react/uimanager/annotations/ReactProp;
        defaultInt = 0x0
        name = "alignment"
    .end annotation

    .line 52
    iput p1, p0, Lcom/reactnativecommunity/art/ARTTextShadowNode;->mTextAlignment:I

    return-void
.end method

.method public setFrame(Lcom/facebook/react/bridge/ReadableMap;)V
    .locals 0
    .param p1    # Lcom/facebook/react/bridge/ReadableMap;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation runtime Lcom/facebook/react/uimanager/annotations/ReactProp;
        name = "frame"
    .end annotation

    .line 47
    iput-object p1, p0, Lcom/reactnativecommunity/art/ARTTextShadowNode;->mFrame:Lcom/facebook/react/bridge/ReadableMap;

    return-void
.end method
