.class public abstract Lcom/google/android/gms/internal/vision/zzbe;
.super Ljava/lang/Object;
.source "com.google.android.gms:play-services-vision-common@@19.0.2"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field private static zze:Landroid/content/Context;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "StaticFieldLeak"
        }
    .end annotation
.end field

.field private static final zzfz:Ljava/lang/Object;

.field private static zzga:Z

.field private static zzgb:Lcom/google/android/gms/internal/vision/zzcu;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/internal/vision/zzcu<",
            "Lcom/google/android/gms/internal/vision/zzcn<",
            "Lcom/google/android/gms/internal/vision/zzba;",
            ">;>;"
        }
    .end annotation
.end field

.field private static final zzge:Ljava/util/concurrent/atomic/AtomicInteger;


# instance fields
.field private final name:Ljava/lang/String;

.field private final zzgc:Lcom/google/android/gms/internal/vision/zzbk;

.field private final zzgd:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field private volatile zzgf:I

.field private volatile zzgg:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 113
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/vision/zzbe;->zzfz:Ljava/lang/Object;

    const/4 v0, 0x0

    .line 114
    sput-object v0, Lcom/google/android/gms/internal/vision/zzbe;->zze:Landroid/content/Context;

    const/4 v0, 0x0

    .line 115
    sput-boolean v0, Lcom/google/android/gms/internal/vision/zzbe;->zzga:Z

    .line 116
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/vision/zzbe;->zzge:Ljava/util/concurrent/atomic/AtomicInteger;

    return-void
.end method

.method private constructor <init>(Lcom/google/android/gms/internal/vision/zzbk;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/vision/zzbk;",
            "Ljava/lang/String;",
            "TT;)V"
        }
    .end annotation

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 21
    iput v0, p0, Lcom/google/android/gms/internal/vision/zzbe;->zzgf:I

    .line 22
    iget-object v0, p1, Lcom/google/android/gms/internal/vision/zzbk;->zzgl:Ljava/lang/String;

    if-nez v0, :cond_1

    iget-object v0, p1, Lcom/google/android/gms/internal/vision/zzbk;->zzgm:Landroid/net/Uri;

    if-eqz v0, :cond_0

    goto :goto_0

    .line 23
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Must pass a valid SharedPreferences file name or ContentProvider URI"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 24
    :cond_1
    :goto_0
    iget-object v0, p1, Lcom/google/android/gms/internal/vision/zzbk;->zzgl:Ljava/lang/String;

    if-eqz v0, :cond_3

    iget-object v0, p1, Lcom/google/android/gms/internal/vision/zzbk;->zzgm:Landroid/net/Uri;

    if-nez v0, :cond_2

    goto :goto_1

    .line 25
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Must pass one of SharedPreferences file name or ContentProvider URI"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 26
    :cond_3
    :goto_1
    iput-object p1, p0, Lcom/google/android/gms/internal/vision/zzbe;->zzgc:Lcom/google/android/gms/internal/vision/zzbk;

    .line 27
    iput-object p2, p0, Lcom/google/android/gms/internal/vision/zzbe;->name:Ljava/lang/String;

    .line 28
    iput-object p3, p0, Lcom/google/android/gms/internal/vision/zzbe;->zzgd:Ljava/lang/Object;

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/android/gms/internal/vision/zzbk;Ljava/lang/String;Ljava/lang/Object;Lcom/google/android/gms/internal/vision/zzbg;)V
    .locals 0

    .line 112
    invoke-direct {p0, p1, p2, p3}, Lcom/google/android/gms/internal/vision/zzbe;-><init>(Lcom/google/android/gms/internal/vision/zzbk;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public static init(Landroid/content/Context;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/google/android/gms/internal/vision/zzbe;->zzfz:Ljava/lang/Object;

    monitor-enter v0

    .line 2
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    if-nez v1, :cond_0

    goto :goto_0

    :cond_0
    move-object p0, v1

    .line 5
    :goto_0
    sget-object v1, Lcom/google/android/gms/internal/vision/zzbe;->zze:Landroid/content/Context;

    if-eq v1, p0, :cond_1

    .line 6
    invoke-static {}, Lcom/google/android/gms/internal/vision/zzaq;->zzx()V

    .line 7
    invoke-static {}, Lcom/google/android/gms/internal/vision/zzbj;->zzx()V

    .line 8
    invoke-static {}, Lcom/google/android/gms/internal/vision/zzav;->zzaa()V

    .line 9
    sget-object v1, Lcom/google/android/gms/internal/vision/zzbe;->zzge:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 10
    sput-object p0, Lcom/google/android/gms/internal/vision/zzbe;->zze:Landroid/content/Context;

    .line 11
    sget-object p0, Lcom/google/android/gms/internal/vision/zzbd;->zzfy:Lcom/google/android/gms/internal/vision/zzcu;

    .line 12
    invoke-static {p0}, Lcom/google/android/gms/internal/vision/zzcx;->zza(Lcom/google/android/gms/internal/vision/zzcu;)Lcom/google/android/gms/internal/vision/zzcu;

    move-result-object p0

    sput-object p0, Lcom/google/android/gms/internal/vision/zzbe;->zzgb:Lcom/google/android/gms/internal/vision/zzcu;

    .line 13
    :cond_1
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public static maybeInit(Landroid/content/Context;)V
    .locals 2

    .line 14
    sget-object v0, Lcom/google/android/gms/internal/vision/zzbe;->zzfz:Ljava/lang/Object;

    monitor-enter v0

    .line 15
    :try_start_0
    sget-object v1, Lcom/google/android/gms/internal/vision/zzbe;->zze:Landroid/content/Context;

    if-nez v1, :cond_0

    .line 16
    invoke-static {p0}, Lcom/google/android/gms/internal/vision/zzbe;->init(Landroid/content/Context;)V

    .line 17
    :cond_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method private static zza(Lcom/google/android/gms/internal/vision/zzbk;Ljava/lang/String;J)Lcom/google/android/gms/internal/vision/zzbe;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/vision/zzbk;",
            "Ljava/lang/String;",
            "J)",
            "Lcom/google/android/gms/internal/vision/zzbe<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .line 105
    new-instance v0, Lcom/google/android/gms/internal/vision/zzbg;

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    invoke-direct {v0, p0, p1, p2}, Lcom/google/android/gms/internal/vision/zzbg;-><init>(Lcom/google/android/gms/internal/vision/zzbk;Ljava/lang/String;Ljava/lang/Long;)V

    return-object v0
.end method

.method private static zza(Lcom/google/android/gms/internal/vision/zzbk;Ljava/lang/String;Ljava/lang/Object;Lcom/google/android/gms/internal/vision/zzbh;)Lcom/google/android/gms/internal/vision/zzbe;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/android/gms/internal/vision/zzbk;",
            "Ljava/lang/String;",
            "TT;",
            "Lcom/google/android/gms/internal/vision/zzbh<",
            "TT;>;)",
            "Lcom/google/android/gms/internal/vision/zzbe<",
            "TT;>;"
        }
    .end annotation

    .line 107
    new-instance v0, Lcom/google/android/gms/internal/vision/zzbi;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/google/android/gms/internal/vision/zzbi;-><init>(Lcom/google/android/gms/internal/vision/zzbk;Ljava/lang/String;Ljava/lang/Object;Lcom/google/android/gms/internal/vision/zzbh;)V

    return-object v0
.end method

.method private static zza(Lcom/google/android/gms/internal/vision/zzbk;Ljava/lang/String;Z)Lcom/google/android/gms/internal/vision/zzbe;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/vision/zzbk;",
            "Ljava/lang/String;",
            "Z)",
            "Lcom/google/android/gms/internal/vision/zzbe<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 106
    new-instance v0, Lcom/google/android/gms/internal/vision/zzbf;

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p2

    invoke-direct {v0, p0, p1, p2}, Lcom/google/android/gms/internal/vision/zzbf;-><init>(Lcom/google/android/gms/internal/vision/zzbk;Ljava/lang/String;Ljava/lang/Boolean;)V

    return-object v0
.end method

.method static zzab()V
    .locals 1

    .line 18
    sget-object v0, Lcom/google/android/gms/internal/vision/zzbe;->zzge:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    return-void
.end method

.method private final zzad()Ljava/lang/Object;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 67
    iget-object v0, p0, Lcom/google/android/gms/internal/vision/zzbe;->zzgc:Lcom/google/android/gms/internal/vision/zzbk;

    iget-boolean v0, v0, Lcom/google/android/gms/internal/vision/zzbk;->zzgr:Z

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_1

    sget-object v0, Lcom/google/android/gms/internal/vision/zzbe;->zze:Landroid/content/Context;

    .line 68
    invoke-static {v0}, Lcom/google/android/gms/internal/vision/zzav;->zze(Landroid/content/Context;)Lcom/google/android/gms/internal/vision/zzav;

    move-result-object v0

    const-string v3, "gms:phenotype:phenotype_flag:debug_bypass_phenotype"

    .line 70
    invoke-virtual {v0, v3}, Lcom/google/android/gms/internal/vision/zzav;->zzb(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 71
    sget-object v3, Lcom/google/android/gms/internal/vision/zzal;->zzev:Ljava/util/regex/Pattern;

    invoke-virtual {v3, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_1

    const/4 v1, 0x1

    :cond_1
    const/4 v0, 0x0

    if-nez v1, :cond_5

    .line 75
    iget-object v1, p0, Lcom/google/android/gms/internal/vision/zzbe;->zzgc:Lcom/google/android/gms/internal/vision/zzbk;

    iget-object v1, v1, Lcom/google/android/gms/internal/vision/zzbk;->zzgm:Landroid/net/Uri;

    if-eqz v1, :cond_4

    .line 76
    sget-object v1, Lcom/google/android/gms/internal/vision/zzbe;->zze:Landroid/content/Context;

    iget-object v3, p0, Lcom/google/android/gms/internal/vision/zzbe;->zzgc:Lcom/google/android/gms/internal/vision/zzbk;

    iget-object v3, v3, Lcom/google/android/gms/internal/vision/zzbk;->zzgm:Landroid/net/Uri;

    invoke-static {v1, v3}, Lcom/google/android/gms/internal/vision/zzbc;->zza(Landroid/content/Context;Landroid/net/Uri;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 77
    iget-object v1, p0, Lcom/google/android/gms/internal/vision/zzbe;->zzgc:Lcom/google/android/gms/internal/vision/zzbk;

    iget-boolean v1, v1, Lcom/google/android/gms/internal/vision/zzbk;->zzgs:Z

    if-eqz v1, :cond_2

    .line 78
    sget-object v1, Lcom/google/android/gms/internal/vision/zzbe;->zze:Landroid/content/Context;

    .line 79
    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    iget-object v3, p0, Lcom/google/android/gms/internal/vision/zzbe;->zzgc:Lcom/google/android/gms/internal/vision/zzbk;

    iget-object v3, v3, Lcom/google/android/gms/internal/vision/zzbk;->zzgm:Landroid/net/Uri;

    .line 80
    invoke-virtual {v3}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v3

    sget-object v4, Lcom/google/android/gms/internal/vision/zzbe;->zze:Landroid/content/Context;

    .line 81
    invoke-virtual {v4}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    add-int/2addr v5, v2

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    add-int/2addr v5, v2

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v5}, Ljava/lang/StringBuilder;-><init>(I)V

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "#"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 82
    invoke-static {v2}, Lcom/google/android/gms/internal/vision/zzbb;->getContentProviderUri(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    .line 83
    invoke-static {v1, v2}, Lcom/google/android/gms/internal/vision/zzaq;->zza(Landroid/content/ContentResolver;Landroid/net/Uri;)Lcom/google/android/gms/internal/vision/zzaq;

    move-result-object v1

    goto :goto_1

    .line 84
    :cond_2
    sget-object v1, Lcom/google/android/gms/internal/vision/zzbe;->zze:Landroid/content/Context;

    .line 85
    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/internal/vision/zzbe;->zzgc:Lcom/google/android/gms/internal/vision/zzbk;

    iget-object v2, v2, Lcom/google/android/gms/internal/vision/zzbk;->zzgm:Landroid/net/Uri;

    .line 86
    invoke-static {v1, v2}, Lcom/google/android/gms/internal/vision/zzaq;->zza(Landroid/content/ContentResolver;Landroid/net/Uri;)Lcom/google/android/gms/internal/vision/zzaq;

    move-result-object v1

    goto :goto_1

    :cond_3
    move-object v1, v0

    goto :goto_1

    .line 87
    :cond_4
    sget-object v1, Lcom/google/android/gms/internal/vision/zzbe;->zze:Landroid/content/Context;

    iget-object v2, p0, Lcom/google/android/gms/internal/vision/zzbe;->zzgc:Lcom/google/android/gms/internal/vision/zzbk;

    iget-object v2, v2, Lcom/google/android/gms/internal/vision/zzbk;->zzgl:Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/vision/zzbj;->zzb(Landroid/content/Context;Ljava/lang/String;)Lcom/google/android/gms/internal/vision/zzbj;

    move-result-object v1

    :goto_1
    if-eqz v1, :cond_7

    .line 89
    invoke-virtual {p0}, Lcom/google/android/gms/internal/vision/zzbe;->zzac()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/google/android/gms/internal/vision/zzau;->zzb(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_7

    .line 91
    invoke-virtual {p0, v1}, Lcom/google/android/gms/internal/vision/zzbe;->zza(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    :cond_5
    const/4 v1, 0x3

    const-string v2, "PhenotypeFlag"

    .line 93
    invoke-static {v2, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v1

    if-eqz v1, :cond_7

    const-string v1, "Bypass reading Phenotype values for flag: "

    .line 94
    invoke-virtual {p0}, Lcom/google/android/gms/internal/vision/zzbe;->zzac()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    if-eqz v4, :cond_6

    invoke-virtual {v1, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_2

    :cond_6
    new-instance v3, Ljava/lang/String;

    invoke-direct {v3, v1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    move-object v1, v3

    :goto_2
    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_7
    return-object v0
.end method

.method private final zzae()Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 96
    iget-object v0, p0, Lcom/google/android/gms/internal/vision/zzbe;->zzgc:Lcom/google/android/gms/internal/vision/zzbk;

    iget-boolean v0, v0, Lcom/google/android/gms/internal/vision/zzbk;->zzgp:Z

    const/4 v1, 0x0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/google/android/gms/internal/vision/zzbe;->zzgc:Lcom/google/android/gms/internal/vision/zzbk;

    iget-object v0, v0, Lcom/google/android/gms/internal/vision/zzbk;->zzgt:Lcom/google/android/gms/internal/vision/zzcl;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/vision/zzbe;->zzgc:Lcom/google/android/gms/internal/vision/zzbk;

    iget-object v0, v0, Lcom/google/android/gms/internal/vision/zzbk;->zzgt:Lcom/google/android/gms/internal/vision/zzcl;

    sget-object v2, Lcom/google/android/gms/internal/vision/zzbe;->zze:Landroid/content/Context;

    .line 97
    invoke-interface {v0, v2}, Lcom/google/android/gms/internal/vision/zzcl;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 98
    :cond_0
    sget-object v0, Lcom/google/android/gms/internal/vision/zzbe;->zze:Landroid/content/Context;

    invoke-static {v0}, Lcom/google/android/gms/internal/vision/zzav;->zze(Landroid/content/Context;)Lcom/google/android/gms/internal/vision/zzav;

    move-result-object v0

    .line 100
    iget-object v2, p0, Lcom/google/android/gms/internal/vision/zzbe;->zzgc:Lcom/google/android/gms/internal/vision/zzbk;

    iget-boolean v2, v2, Lcom/google/android/gms/internal/vision/zzbk;->zzgp:Z

    if-eqz v2, :cond_1

    move-object v2, v1

    goto :goto_0

    :cond_1
    iget-object v2, p0, Lcom/google/android/gms/internal/vision/zzbe;->zzgc:Lcom/google/android/gms/internal/vision/zzbk;

    iget-object v2, v2, Lcom/google/android/gms/internal/vision/zzbk;->zzgn:Ljava/lang/String;

    invoke-direct {p0, v2}, Lcom/google/android/gms/internal/vision/zzbe;->zze(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 101
    :goto_0
    invoke-interface {v0, v2}, Lcom/google/android/gms/internal/vision/zzau;->zzb(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 103
    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/vision/zzbe;->zza(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    :cond_2
    return-object v1
.end method

.method static final synthetic zzaf()Lcom/google/android/gms/internal/vision/zzcn;
    .locals 1

    .line 108
    new-instance v0, Lcom/google/android/gms/internal/vision/zzaz;

    invoke-direct {v0}, Lcom/google/android/gms/internal/vision/zzaz;-><init>()V

    sget-object v0, Lcom/google/android/gms/internal/vision/zzbe;->zze:Landroid/content/Context;

    invoke-static {v0}, Lcom/google/android/gms/internal/vision/zzaz;->zzf(Landroid/content/Context;)Lcom/google/android/gms/internal/vision/zzcn;

    move-result-object v0

    return-object v0
.end method

.method static synthetic zzb(Lcom/google/android/gms/internal/vision/zzbk;Ljava/lang/String;J)Lcom/google/android/gms/internal/vision/zzbe;
    .locals 0

    .line 109
    invoke-static {p0, p1, p2, p3}, Lcom/google/android/gms/internal/vision/zzbe;->zza(Lcom/google/android/gms/internal/vision/zzbk;Ljava/lang/String;J)Lcom/google/android/gms/internal/vision/zzbe;

    move-result-object p0

    return-object p0
.end method

.method static synthetic zzb(Lcom/google/android/gms/internal/vision/zzbk;Ljava/lang/String;Ljava/lang/Object;Lcom/google/android/gms/internal/vision/zzbh;)Lcom/google/android/gms/internal/vision/zzbe;
    .locals 0

    .line 111
    invoke-static {p0, p1, p2, p3}, Lcom/google/android/gms/internal/vision/zzbe;->zza(Lcom/google/android/gms/internal/vision/zzbk;Ljava/lang/String;Ljava/lang/Object;Lcom/google/android/gms/internal/vision/zzbh;)Lcom/google/android/gms/internal/vision/zzbe;

    move-result-object p0

    return-object p0
.end method

.method static synthetic zzb(Lcom/google/android/gms/internal/vision/zzbk;Ljava/lang/String;Z)Lcom/google/android/gms/internal/vision/zzbe;
    .locals 0

    .line 110
    invoke-static {p0, p1, p2}, Lcom/google/android/gms/internal/vision/zzbe;->zza(Lcom/google/android/gms/internal/vision/zzbk;Ljava/lang/String;Z)Lcom/google/android/gms/internal/vision/zzbe;

    move-result-object p0

    return-object p0
.end method

.method private final zze(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    if-eqz p1, :cond_0

    .line 30
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p1, p0, Lcom/google/android/gms/internal/vision/zzbe;->name:Ljava/lang/String;

    return-object p1

    :cond_0
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Lcom/google/android/gms/internal/vision/zzbe;->name:Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {p1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_1
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, p1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    return-object v0
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 32
    sget-object v0, Lcom/google/android/gms/internal/vision/zzbe;->zzge:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    .line 33
    iget v1, p0, Lcom/google/android/gms/internal/vision/zzbe;->zzgf:I

    if-ge v1, v0, :cond_8

    .line 34
    monitor-enter p0

    .line 35
    :try_start_0
    iget v1, p0, Lcom/google/android/gms/internal/vision/zzbe;->zzgf:I

    if-ge v1, v0, :cond_7

    .line 37
    sget-object v1, Lcom/google/android/gms/internal/vision/zzbe;->zze:Landroid/content/Context;

    if-eqz v1, :cond_6

    .line 40
    iget-object v1, p0, Lcom/google/android/gms/internal/vision/zzbe;->zzgc:Lcom/google/android/gms/internal/vision/zzbk;

    iget-boolean v1, v1, Lcom/google/android/gms/internal/vision/zzbk;->zzgq:Z

    if-eqz v1, :cond_1

    .line 41
    invoke-direct {p0}, Lcom/google/android/gms/internal/vision/zzbe;->zzae()Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 44
    :cond_0
    invoke-direct {p0}, Lcom/google/android/gms/internal/vision/zzbe;->zzad()Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_3

    goto :goto_0

    .line 47
    :cond_1
    invoke-direct {p0}, Lcom/google/android/gms/internal/vision/zzbe;->zzad()Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_2

    goto :goto_0

    .line 50
    :cond_2
    invoke-direct {p0}, Lcom/google/android/gms/internal/vision/zzbe;->zzae()Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_3

    goto :goto_0

    .line 53
    :cond_3
    iget-object v1, p0, Lcom/google/android/gms/internal/vision/zzbe;->zzgd:Ljava/lang/Object;

    .line 55
    :goto_0
    sget-object v2, Lcom/google/android/gms/internal/vision/zzbe;->zzgb:Lcom/google/android/gms/internal/vision/zzcu;

    invoke-interface {v2}, Lcom/google/android/gms/internal/vision/zzcu;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/internal/vision/zzcn;

    .line 56
    invoke-virtual {v2}, Lcom/google/android/gms/internal/vision/zzcn;->isPresent()Z

    move-result v3

    if-eqz v3, :cond_5

    .line 58
    invoke-virtual {v2}, Lcom/google/android/gms/internal/vision/zzcn;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/internal/vision/zzba;

    iget-object v2, p0, Lcom/google/android/gms/internal/vision/zzbe;->zzgc:Lcom/google/android/gms/internal/vision/zzbk;

    iget-object v2, v2, Lcom/google/android/gms/internal/vision/zzbk;->zzgm:Landroid/net/Uri;

    iget-object v3, p0, Lcom/google/android/gms/internal/vision/zzbe;->zzgc:Lcom/google/android/gms/internal/vision/zzbk;

    iget-object v3, v3, Lcom/google/android/gms/internal/vision/zzbk;->zzgl:Ljava/lang/String;

    iget-object v4, p0, Lcom/google/android/gms/internal/vision/zzbe;->zzgc:Lcom/google/android/gms/internal/vision/zzbk;

    iget-object v4, v4, Lcom/google/android/gms/internal/vision/zzbk;->zzgo:Ljava/lang/String;

    iget-object v5, p0, Lcom/google/android/gms/internal/vision/zzbe;->name:Ljava/lang/String;

    .line 59
    invoke-virtual {v1, v2, v3, v4, v5}, Lcom/google/android/gms/internal/vision/zzba;->zza(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_4

    .line 60
    iget-object v1, p0, Lcom/google/android/gms/internal/vision/zzbe;->zzgd:Ljava/lang/Object;

    goto :goto_1

    :cond_4
    invoke-virtual {p0, v1}, Lcom/google/android/gms/internal/vision/zzbe;->zza(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 62
    :cond_5
    :goto_1
    iput-object v1, p0, Lcom/google/android/gms/internal/vision/zzbe;->zzgg:Ljava/lang/Object;

    .line 63
    iput v0, p0, Lcom/google/android/gms/internal/vision/zzbe;->zzgf:I

    goto :goto_2

    .line 38
    :cond_6
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Must call PhenotypeFlag.init() first"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 64
    :cond_7
    :goto_2
    monitor-exit p0

    goto :goto_3

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    .line 65
    :cond_8
    :goto_3
    iget-object v0, p0, Lcom/google/android/gms/internal/vision/zzbe;->zzgg:Ljava/lang/Object;

    return-object v0
.end method

.method abstract zza(Ljava/lang/Object;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")TT;"
        }
    .end annotation
.end method

.method public final zzac()Ljava/lang/String;
    .locals 1

    .line 31
    iget-object v0, p0, Lcom/google/android/gms/internal/vision/zzbe;->zzgc:Lcom/google/android/gms/internal/vision/zzbk;

    iget-object v0, v0, Lcom/google/android/gms/internal/vision/zzbk;->zzgo:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/google/android/gms/internal/vision/zzbe;->zze(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
