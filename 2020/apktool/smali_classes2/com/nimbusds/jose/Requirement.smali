.class public final enum Lcom/nimbusds/jose/Requirement;
.super Ljava/lang/Enum;
.source "Requirement.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/nimbusds/jose/Requirement;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic ENUM$VALUES:[Lcom/nimbusds/jose/Requirement;

.field public static final enum OPTIONAL:Lcom/nimbusds/jose/Requirement;

.field public static final enum RECOMMENDED:Lcom/nimbusds/jose/Requirement;

.field public static final enum REQUIRED:Lcom/nimbusds/jose/Requirement;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 31
    new-instance v0, Lcom/nimbusds/jose/Requirement;

    const/4 v1, 0x0

    const-string v2, "REQUIRED"

    invoke-direct {v0, v2, v1}, Lcom/nimbusds/jose/Requirement;-><init>(Ljava/lang/String;I)V

    .line 34
    sput-object v0, Lcom/nimbusds/jose/Requirement;->REQUIRED:Lcom/nimbusds/jose/Requirement;

    .line 37
    new-instance v0, Lcom/nimbusds/jose/Requirement;

    const/4 v2, 0x1

    const-string v3, "RECOMMENDED"

    invoke-direct {v0, v3, v2}, Lcom/nimbusds/jose/Requirement;-><init>(Ljava/lang/String;I)V

    .line 40
    sput-object v0, Lcom/nimbusds/jose/Requirement;->RECOMMENDED:Lcom/nimbusds/jose/Requirement;

    .line 43
    new-instance v0, Lcom/nimbusds/jose/Requirement;

    const/4 v3, 0x2

    const-string v4, "OPTIONAL"

    invoke-direct {v0, v4, v3}, Lcom/nimbusds/jose/Requirement;-><init>(Ljava/lang/String;I)V

    .line 46
    sput-object v0, Lcom/nimbusds/jose/Requirement;->OPTIONAL:Lcom/nimbusds/jose/Requirement;

    const/4 v0, 0x3

    .line 28
    new-array v0, v0, [Lcom/nimbusds/jose/Requirement;

    sget-object v4, Lcom/nimbusds/jose/Requirement;->REQUIRED:Lcom/nimbusds/jose/Requirement;

    aput-object v4, v0, v1

    sget-object v1, Lcom/nimbusds/jose/Requirement;->RECOMMENDED:Lcom/nimbusds/jose/Requirement;

    aput-object v1, v0, v2

    sget-object v1, Lcom/nimbusds/jose/Requirement;->OPTIONAL:Lcom/nimbusds/jose/Requirement;

    aput-object v1, v0, v3

    sput-object v0, Lcom/nimbusds/jose/Requirement;->ENUM$VALUES:[Lcom/nimbusds/jose/Requirement;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .line 28
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/nimbusds/jose/Requirement;
    .locals 1

    .line 1
    const-class v0, Lcom/nimbusds/jose/Requirement;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/nimbusds/jose/Requirement;

    return-object p0
.end method

.method public static values()[Lcom/nimbusds/jose/Requirement;
    .locals 4

    .line 1
    sget-object v0, Lcom/nimbusds/jose/Requirement;->ENUM$VALUES:[Lcom/nimbusds/jose/Requirement;

    array-length v1, v0

    new-array v2, v1, [Lcom/nimbusds/jose/Requirement;

    const/4 v3, 0x0

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method
