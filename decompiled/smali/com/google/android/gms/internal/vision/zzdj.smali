.class public abstract Lcom/google/android/gms/internal/vision/zzdj;
.super Lcom/google/android/gms/internal/vision/zzdc;
.source "com.google.android.gms:play-services-vision-common@@19.0.2"

# interfaces
.implements Ljava/util/Set;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/android/gms/internal/vision/zzdc<",
        "TE;>;",
        "Ljava/util/Set<",
        "TE;>;"
    }
.end annotation


# instance fields
.field private transient zzlz:Lcom/google/android/gms/internal/vision/zzdf;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/internal/vision/zzdf<",
            "TE;>;"
        }
    .end annotation

    .annotation runtime Lorg/checkerframework/checker/nullness/compatqual/NullableDecl;
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/google/android/gms/internal/vision/zzdc;-><init>()V

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation runtime Lorg/checkerframework/checker/nullness/compatqual/NullableDecl;
        .end annotation
    .end param

    if-ne p1, p0, :cond_0

    const/4 p1, 0x1

    return p1

    .line 4
    :cond_0
    invoke-static {p0, p1}, Lcom/google/android/gms/internal/vision/zzdo;->zza(Ljava/util/Set;Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public hashCode()I
    .locals 1

    .line 5
    invoke-static {p0}, Lcom/google/android/gms/internal/vision/zzdo;->zza(Ljava/util/Set;)I

    move-result v0

    return v0
.end method

.method public synthetic iterator()Ljava/util/Iterator;
    .locals 1

    .line 9
    invoke-virtual {p0}, Lcom/google/android/gms/internal/vision/zzdc;->zzby()Lcom/google/android/gms/internal/vision/zzdr;

    move-result-object v0

    return-object v0
.end method

.method public zzcc()Lcom/google/android/gms/internal/vision/zzdf;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/android/gms/internal/vision/zzdf<",
            "TE;>;"
        }
    .end annotation

    .line 6
    iget-object v0, p0, Lcom/google/android/gms/internal/vision/zzdj;->zzlz:Lcom/google/android/gms/internal/vision/zzdf;

    if-nez v0, :cond_0

    .line 7
    invoke-virtual {p0}, Lcom/google/android/gms/internal/vision/zzdj;->zzch()Lcom/google/android/gms/internal/vision/zzdf;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/vision/zzdj;->zzlz:Lcom/google/android/gms/internal/vision/zzdf;

    :cond_0
    return-object v0
.end method

.method zzch()Lcom/google/android/gms/internal/vision/zzdf;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/android/gms/internal/vision/zzdf<",
            "TE;>;"
        }
    .end annotation

    .line 8
    invoke-virtual {p0}, Lcom/google/android/gms/internal/vision/zzdc;->toArray()[Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/internal/vision/zzdf;->zza([Ljava/lang/Object;)Lcom/google/android/gms/internal/vision/zzdf;

    move-result-object v0

    return-object v0
.end method
