Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACF2DC77B76
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Apr 2023 11:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6qoUD4ihuG/88FQYCYYEi1gpkmLGhYOXOrSIUWxgIjU=; b=N8432Y62kpu869
	0HidYEuSEHKgZCaNJ3gesB7vs1LJMQgZSMonf2E85Tc6++yd6naGbgBc7/CqmpLWfTdwEm9ScsgtF
	nnzUcB0be9F7VFRTLOPJVPKoS6v4ssZar4Db5iuGUtbNHtnqjuMoyxZmKcUsmY0MjXOnrGkkpea7v
	v3S/7YlU5KTSkdBoSMZ0r3PAXJui9hx5yfi8rcAENlHbJOalSxDO0yr0u+nmAsH4xYeGqR1ACwN+d
	3EgwuaJWV407UE32xZLqNnsI1xcVWPk0ssQu6X99BvEc8fgGJCuqL/zZIaEliFi5FC4vTZ2pqk+vd
	c/eQJI1j4GfomI/s1Peg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmYM5-002kVO-1h;
	Wed, 12 Apr 2023 11:09:37 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmYM1-002kRs-1s
	for linux-riscv@lists.infradead.org;
	Wed, 12 Apr 2023 11:09:34 +0000
Received: by mail-wr1-x434.google.com with SMTP id j1so14482766wrb.0
        for <linux-riscv@lists.infradead.org>; Wed, 12 Apr 2023 04:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681297771; x=1683889771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nB3sPVEcrgu6W+ilG7iG45RRlHi0fVznqs8qRjeeZzA=;
        b=nG67AZDgYKdJnkqDzdBqL7IETA6Nq75bT/jKzTrBr0Rp8gJDxALJsSSAbhwkH/+mr9
         C/UfJ9aEvNz4Bic4fi+Xz/nZH+6/rajKZuQEo+934ySYt/Hp/pM01sfrd/ejBeb2Zaej
         efWKvkx2OjdciaTTIaH+ZZ3bXbg1tZXeFUHsjjzxl+xkbVLf50bDYx6BVlj+qQTuFoeW
         lnG20h5N1VxrmIWlhuMB3EWvjzlhsEd4SrQp9fqEW5Dx4JIShONrkjvt+HsnXu3zMRZJ
         KoLA912TXPOJL/D5SB/8G6IZcLcRC8q4KH+W9Jl845Hwba5FVro/vgPciPrNMkXfCfYb
         6B0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681297771; x=1683889771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nB3sPVEcrgu6W+ilG7iG45RRlHi0fVznqs8qRjeeZzA=;
        b=2lRl6iZjxdoPMuGnW7E8FxRdqyqOHG3ZfCCcwCWUGDkx8Ds2vLud9sSPuHWrcOjC9o
         O36X/v7pnbIoE/Ibb3L9mQVo+QUm/4deen+nHEXz+vNpX5IcGueIjgihQ6FOdg/9U65f
         cPhqYs3heK1LjeyeIZ5sjXjBvrXEfWQsho5Xtpv4qOrNTgSOWBDCtGFouu7Twq8E0CYa
         TOz3TRRizG37NpZ9diztR1gQhZkIvRXQ1X46detxp56mvSxugqQdK6a+jcAgECd/vRRH
         f0H6xVxqy1fgOxg5YcASfxB0/CmH+LT55wmrC8+ITKgywNQM9fAVbIILNYToadVwc8Ib
         cX7A==
X-Gm-Message-State: AAQBX9djqzTS9RyR4AGGKKFlS9QpvlDjdi5Ua5W4pgZOCSIYbhYPTcWb
	zZAsDUs54zwN5FNrswpIlNz/o0HM2Gqu1vrQ
X-Google-Smtp-Source: AKy350baFT53FrVZDDIYkVxi/WMtlVuaA05Nl+WNWc4qmRoasQeQvrWT71zHJavpnqvcSwx3li5Y1w==
X-Received: by 2002:a5d:6189:0:b0:2ce:9d06:58c6 with SMTP id j9-20020a5d6189000000b002ce9d0658c6mr1637641wru.53.1681297771385;
        Wed, 12 Apr 2023 04:09:31 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2501:c701:783d:9280:20c4:db22])
        by smtp.gmail.com with ESMTPSA id l13-20020a5d668d000000b002e61e002943sm16863582wru.116.2023.04.12.04.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Apr 2023 04:09:30 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Heiko Stuebner <heiko@sntech.de>,
	Guo Ren <guoren@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel@sholland.org>,
	linux-riscv@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v8 6/7] riscv: errata: Hookup the Andes AX45MP non-coherent handling
Date: Wed, 12 Apr 2023 12:08:59 +0100
Message-Id: <20230412110900.69738-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230412110900.69738-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20230412110900.69738-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_040933_616144_5F714351 
X-CRM114-Status: GOOD (  11.72  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hookup the Andes AX45MP non-coherent handling by updating the
ALT_CMO_OP() macro which will be used by dma-noncoherent.c for
non-coherent platforms.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v7->v8
* New patch
---
 arch/riscv/include/asm/cacheflush.h  |  9 ++++++++
 arch/riscv/include/asm/errata_list.h | 33 ++++++++++++++++++++++------
 2 files changed, 35 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm/cacheflush.h
index 8091b8bf4883..a8503cc04fdb 100644
--- a/arch/riscv/include/asm/cacheflush.h
+++ b/arch/riscv/include/asm/cacheflush.h
@@ -59,6 +59,15 @@ void riscv_noncoherent_supported(void);
 static inline void riscv_noncoherent_supported(void) {}
 #endif
 
+#ifdef CONFIG_AX45MP_L2_CACHE
+extern asmlinkage void ax45mp_dma_cache_wback_inv(void *vaddr, unsigned long size);
+extern asmlinkage void ax45mp_dma_cache_wback(void *vaddr, unsigned long size);
+extern asmlinkage void ax45mp_dma_cache_inv(void *vaddr, unsigned long size);
+#else
+static inline void ax45mp_dma_cache_wback_inv(void *vaddr, unsigned long size) {}
+static inline void ax45mp_dma_cache_wback(void *vaddr, unsigned long size) {}
+static inline void ax45mp_dma_cache_inv(void *vaddr, unsigned long size) {}
+#endif
 /*
  * Bits in sys_riscv_flush_icache()'s flags argument.
  */
diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
index e2ecd01bfac7..8e9811c14ba3 100644
--- a/arch/riscv/include/asm/errata_list.h
+++ b/arch/riscv/include/asm/errata_list.h
@@ -122,9 +122,13 @@ asm volatile(ALTERNATIVE(						\
 #define THEAD_flush_A0	".long 0x0275000b"
 #define THEAD_SYNC_S	".long 0x0190000b"
 
+#define ANDESTECH_AX45MP_clean	"call ax45mp_dma_cache_wback"
+#define ANDESTECH_AX45MP_inval	"call ax45mp_dma_cache_inv"
+#define ANDESTECH_AX45MP_flush	"call ax45mp_dma_cache_wback_inv"
+
 #define ALT_CMO_OP(_op, _start, _size, _cachesize)			\
-asm volatile(ALTERNATIVE_2(						\
-	__nops(6),							\
+asm volatile(ALTERNATIVE_3(						\
+	__nops(11),							\
 	"mv a0, %1\n\t"							\
 	"j 2f\n\t"							\
 	"3:\n\t"							\
@@ -132,7 +136,7 @@ asm volatile(ALTERNATIVE_2(						\
 	"add a0, a0, %0\n\t"						\
 	"2:\n\t"							\
 	"bltu a0, %2, 3b\n\t"						\
-	"nop", 0, RISCV_ISA_EXT_ZICBOM, CONFIG_RISCV_ISA_ZICBOM,	\
+	__nops(6), 0, RISCV_ISA_EXT_ZICBOM, CONFIG_RISCV_ISA_ZICBOM,	\
 	"mv a0, %1\n\t"							\
 	"j 2f\n\t"							\
 	"3:\n\t"							\
@@ -140,12 +144,27 @@ asm volatile(ALTERNATIVE_2(						\
 	"add a0, a0, %0\n\t"						\
 	"2:\n\t"							\
 	"bltu a0, %2, 3b\n\t"						\
-	THEAD_SYNC_S, THEAD_VENDOR_ID,					\
-			ERRATA_THEAD_CMO, CONFIG_ERRATA_THEAD_CMO)	\
+	THEAD_SYNC_S "\n\t"						\
+	__nops(5), THEAD_VENDOR_ID,					\
+			ERRATA_THEAD_CMO, CONFIG_ERRATA_THEAD_CMO,	\
+	"addi sp,sp,-16\n\t"						\
+	"sd s0,0(sp)\n\t"						\
+	"sd ra,8(sp)\n\t"						\
+	"addi s0,sp,16\n\t"						\
+	"mv a1,%4\n\t"							\
+	"mv a0,%3\n\t"							\
+	ANDESTECH_AX45MP_##_op "\n\t"					\
+	"ld ra,8(sp)\n\t"						\
+	"ld s0,0(sp)\n\t"						\
+	"addi sp,sp,16\n\t",						\
+	ANDESTECH_VENDOR_ID, ERRATA_ANDESTECH_NO_IOCP,			\
+		CONFIG_ERRATA_ANDES)					\
 	: : "r"(_cachesize),						\
 	    "r"((unsigned long)(_start) & ~((_cachesize) - 1UL)),	\
-	    "r"((unsigned long)(_start) + (_size))			\
-	: "a0")
+	    "r"((unsigned long)(_start) + (_size)),			\
+	    "r"((void *)(_start)),					\
+	    "r"((unsigned long)(_size))					\
+	: "a0", "a1")
 
 #define THEAD_C9XX_RV_IRQ_PMU			17
 #define THEAD_C9XX_CSR_SCOUNTEROF		0x5c5
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
