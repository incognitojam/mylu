.class final Lcom/google/android/gms/internal/vision/zzja;
.super Ljava/lang/Object;
.source "com.google.android.gms:play-services-vision-common@@19.0.2"


# static fields
.field private static final zzaaj:Ljava/util/Iterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Iterator<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private static final zzaak:Ljava/lang/Iterable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Iterable<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 3
    new-instance v0, Lcom/google/android/gms/internal/vision/zziz;

    invoke-direct {v0}, Lcom/google/android/gms/internal/vision/zziz;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/vision/zzja;->zzaaj:Ljava/util/Iterator;

    .line 4
    new-instance v0, Lcom/google/android/gms/internal/vision/zzjc;

    invoke-direct {v0}, Lcom/google/android/gms/internal/vision/zzjc;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/vision/zzja;->zzaak:Ljava/lang/Iterable;

    return-void
.end method

.method static zzid()Ljava/lang/Iterable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">()",
            "Ljava/lang/Iterable<",
            "TT;>;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/google/android/gms/internal/vision/zzja;->zzaak:Ljava/lang/Iterable;

    return-object v0
.end method

.method static synthetic zzie()Ljava/util/Iterator;
    .locals 1

    .line 2
    sget-object v0, Lcom/google/android/gms/internal/vision/zzja;->zzaaj:Ljava/util/Iterator;

    return-object v0
.end method
