.class public final Lcom/google/android/gms/internal/vision/zzea$zzi$zza;
.super Lcom/google/android/gms/internal/vision/zzgs$zza;
.source "com.google.android.gms:play-services-vision-common@@19.0.2"

# interfaces
.implements Lcom/google/android/gms/internal/vision/zzie;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/vision/zzea$zzi;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "zza"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/internal/vision/zzgs$zza<",
        "Lcom/google/android/gms/internal/vision/zzea$zzi;",
        "Lcom/google/android/gms/internal/vision/zzea$zzi$zza;",
        ">;",
        "Lcom/google/android/gms/internal/vision/zzie;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/google/android/gms/internal/vision/zzea$zzi;->zzcy()Lcom/google/android/gms/internal/vision/zzea$zzi;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/vision/zzgs$zza;-><init>(Lcom/google/android/gms/internal/vision/zzgs;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/android/gms/internal/vision/zzdz;)V
    .locals 0

    .line 21
    invoke-direct {p0}, Lcom/google/android/gms/internal/vision/zzea$zzi$zza;-><init>()V

    return-void
.end method


# virtual methods
.method public final zza(Lcom/google/android/gms/internal/vision/zzea$zzf$zza;)Lcom/google/android/gms/internal/vision/zzea$zzi$zza;
    .locals 1

    .line 10
    iget-boolean v0, p0, Lcom/google/android/gms/internal/vision/zzgs$zza;->zzwi:Z

    if-eqz v0, :cond_0

    .line 11
    invoke-virtual {p0}, Lcom/google/android/gms/internal/vision/zzgs$zza;->zzfy()V

    const/4 v0, 0x0

    .line 12
    iput-boolean v0, p0, Lcom/google/android/gms/internal/vision/zzgs$zza;->zzwi:Z

    .line 13
    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/vision/zzea$zzi$zza;->zzwh:Lcom/google/android/gms/internal/vision/zzgs;

    check-cast v0, Lcom/google/android/gms/internal/vision/zzea$zzi;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/vision/zzgs$zza;->zzgc()Lcom/google/android/gms/internal/vision/zzic;

    move-result-object p1

    check-cast p1, Lcom/google/android/gms/internal/vision/zzgs;

    check-cast p1, Lcom/google/android/gms/internal/vision/zzea$zzf;

    invoke-static {v0, p1}, Lcom/google/android/gms/internal/vision/zzea$zzi;->zza(Lcom/google/android/gms/internal/vision/zzea$zzi;Lcom/google/android/gms/internal/vision/zzea$zzf;)V

    return-object p0
.end method

.method public final zza(Lcom/google/android/gms/internal/vision/zzea$zzj;)Lcom/google/android/gms/internal/vision/zzea$zzi$zza;
    .locals 1

    .line 4
    iget-boolean v0, p0, Lcom/google/android/gms/internal/vision/zzgs$zza;->zzwi:Z

    if-eqz v0, :cond_0

    .line 5
    invoke-virtual {p0}, Lcom/google/android/gms/internal/vision/zzgs$zza;->zzfy()V

    const/4 v0, 0x0

    .line 6
    iput-boolean v0, p0, Lcom/google/android/gms/internal/vision/zzgs$zza;->zzwi:Z

    .line 7
    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/vision/zzea$zzi$zza;->zzwh:Lcom/google/android/gms/internal/vision/zzgs;

    check-cast v0, Lcom/google/android/gms/internal/vision/zzea$zzi;

    invoke-static {v0, p1}, Lcom/google/android/gms/internal/vision/zzea$zzi;->zza(Lcom/google/android/gms/internal/vision/zzea$zzi;Lcom/google/android/gms/internal/vision/zzea$zzj;)V

    return-object p0
.end method

.method public final zze(Ljava/lang/Iterable;)Lcom/google/android/gms/internal/vision/zzea$zzi$zza;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Lcom/google/android/gms/internal/vision/zzea$zzf;",
            ">;)",
            "Lcom/google/android/gms/internal/vision/zzea$zzi$zza;"
        }
    .end annotation

    .line 16
    iget-boolean v0, p0, Lcom/google/android/gms/internal/vision/zzgs$zza;->zzwi:Z

    if-eqz v0, :cond_0

    .line 17
    invoke-virtual {p0}, Lcom/google/android/gms/internal/vision/zzgs$zza;->zzfy()V

    const/4 v0, 0x0

    .line 18
    iput-boolean v0, p0, Lcom/google/android/gms/internal/vision/zzgs$zza;->zzwi:Z

    .line 19
    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/vision/zzea$zzi$zza;->zzwh:Lcom/google/android/gms/internal/vision/zzgs;

    check-cast v0, Lcom/google/android/gms/internal/vision/zzea$zzi;

    invoke-static {v0, p1}, Lcom/google/android/gms/internal/vision/zzea$zzi;->zza(Lcom/google/android/gms/internal/vision/zzea$zzi;Ljava/lang/Iterable;)V

    return-object p0
.end method
