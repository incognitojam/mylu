.class final Lcom/google/android/exoplayer2/mediacodec/MediaCodecUtil$MediaCodecListCompatV16;
.super Ljava/lang/Object;
.source "MediaCodecUtil.java"

# interfaces
.implements Lcom/google/android/exoplayer2/mediacodec/MediaCodecUtil$MediaCodecListCompat;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer2/mediacodec/MediaCodecUtil;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "MediaCodecListCompatV16"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 646
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/android/exoplayer2/mediacodec/MediaCodecUtil$1;)V
    .locals 0

    .line 646
    invoke-direct {p0}, Lcom/google/android/exoplayer2/mediacodec/MediaCodecUtil$MediaCodecListCompatV16;-><init>()V

    return-void
.end method


# virtual methods
.method public getCodecCount()I
    .locals 1

    .line 650
    invoke-static {}, Landroid/media/MediaCodecList;->getCodecCount()I

    move-result v0

    return v0
.end method

.method public getCodecInfoAt(I)Landroid/media/MediaCodecInfo;
    .locals 0

    .line 655
    invoke-static {p1}, Landroid/media/MediaCodecList;->getCodecInfoAt(I)Landroid/media/MediaCodecInfo;

    move-result-object p1

    return-object p1
.end method

.method public isSecurePlaybackSupported(Ljava/lang/String;Landroid/media/MediaCodecInfo$CodecCapabilities;)Z
    .locals 0

    const-string/jumbo p2, "video/avc"

    .line 667
    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public secureDecodersExplicit()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method
