Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1568C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 11 May 2022 21:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c1ZEZ35Y4/IIi+RgB/OY1a1wvIX5it57z62g/GkrlmE=; b=Mmi/Yx2ifbLKx7
	VQcB8VXknKR0IvR4XZ7YaU5vLKHFZKB1kRTFoBAJ5jOP2FkeNeeP6AJxKS8Nj+N+KJixRmHBhSuwF
	yivaT69LHipQVm7sxMylA91dF6QTX98UHSVsPoB469Nt8AtTiacQQ59S4wXi0h9U5nUEz7uYMwq60
	m4LpxD285o2VoQAO/So8+WHE8Qc5n336fdgUB/pfCWLxlJU+DgP6Ea68dDxe8oaW8/wGm4B8BfIDm
	Cgf6FEwyLdGrWycsVY2qV8n21/COAfjJFKoQ0CyAkhP3cDn5eUfBblyAVoP6PG50glE5si/GukkSe
	G+MtR2aqic6zIrPC07Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nou5V-008p5Y-I9; Wed, 11 May 2022 21:41:41 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nou5R-008p3o-P5
 for linux-riscv@lists.infradead.org; Wed, 11 May 2022 21:41:39 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nou5P-0005NU-OT; Wed, 11 May 2022 23:41:35 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: palmer@dabbelt.com,
	paul.walmsley@sifive.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 wefu@redhat.com, guoren@kernel.org, atishp@atishpatra.org,
 anup@brainfault.org, mick@ics.forth.gr, samuel@sholland.org,
 cmuellner@linux.com, philipp.tomsich@vrull.eu, robh+dt@kernel.org,
 krzk+dt@kernel.org, devicetree@vger.kernel.org,
 Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH v2 3/3] riscv: implement cache-management errata for T-Head
 SoCs
Date: Wed, 11 May 2022 23:41:32 +0200
Message-Id: <20220511214132.2281431-4-heiko@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220511214132.2281431-1-heiko@sntech.de>
References: <20220511214132.2281431-1-heiko@sntech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_144137_862879_DC1ADF8D 
X-CRM114-Status: GOOD (  14.19  )
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

The T-Head C906 and C910 implement a scheme for handling
cache operations different from the generic Zicbom extension.

Add an errata for it next to the generic dma coherency ops.

Tested-by: Samuel Holland <samuel@sholland.org>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/riscv/Kconfig.erratas           | 10 ++++++
 arch/riscv/errata/thead/errata.c     |  5 +++
 arch/riscv/include/asm/errata_list.h | 47 +++++++++++++++++++++++++---
 3 files changed, 58 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/Kconfig.erratas b/arch/riscv/Kconfig.erratas
index ebfcd5cc6eaf..213629bac5d7 100644
--- a/arch/riscv/Kconfig.erratas
+++ b/arch/riscv/Kconfig.erratas
@@ -54,4 +54,14 @@ config ERRATA_THEAD_PBMT
 
 	  If you don't know what to do here, say "Y".
 
+config ERRATA_THEAD_CMO
+	bool "Apply T-Head cache management errata"
+	depends on ERRATA_THEAD && RISCV_ISA_ZICBOM
+	default y
+	help
+	  This will apply the cache management errata to handle the
+	  non-standard handling on non-coherent operations on T-Head SoCs.
+
+	  If you don't know what to do here, say "Y".
+
 endmenu
diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead/errata.c
index e5d75270b99c..9545f43d3504 100644
--- a/arch/riscv/errata/thead/errata.c
+++ b/arch/riscv/errata/thead/errata.c
@@ -33,6 +33,11 @@ static const struct errata_info errata_list[ERRATA_THEAD_NUMBER] = {
 		.stage = RISCV_ALTERNATIVES_EARLY_BOOT,
 		.check_func = errata_mt_check_func
 	},
+	{
+		.name = "cache-management",
+		.stage = RISCV_ALTERNATIVES_BOOT,
+		.check_func = errata_mt_check_func
+	},
 };
 
 static u32 thead_errata_probe(unsigned int stage, unsigned long archid, unsigned long impid)
diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
index eebcd4415049..1da311fc5126 100644
--- a/arch/riscv/include/asm/errata_list.h
+++ b/arch/riscv/include/asm/errata_list.h
@@ -16,7 +16,8 @@
 
 #ifdef CONFIG_ERRATA_THEAD
 #define	ERRATA_THEAD_PBMT 0
-#define	ERRATA_THEAD_NUMBER 1
+#define	ERRATA_THEAD_CMO 1
+#define	ERRATA_THEAD_NUMBER 2
 #endif
 
 #define	CPUFEATURE_SVPBMT 0
@@ -111,8 +112,37 @@ asm volatile(ALTERNATIVE(						\
 #define CBO_CLEAN_A0	".long 0x25200F"
 #define CBO_FLUSH_A0	".long 0x05200F"
 
+/*
+ * dcache.ipa rs1 (invalidate, physical address)
+ * | 31 - 25 | 24 - 20 | 19 - 15 | 14 - 12 | 11 - 7 | 6 - 0 |
+ *   0000001    01010      rs1       000      00000  0001011
+ * dache.iva rs1 (invalida, virtual address)
+ *   0000001    00110      rs1       000      00000  0001011
+ *
+ * dcache.cpa rs1 (clean, physical address)
+ * | 31 - 25 | 24 - 20 | 19 - 15 | 14 - 12 | 11 - 7 | 6 - 0 |
+ *   0000001    01001      rs1       000      00000  0001011
+ * dcache.cva rs1 (clean, virtual address)
+ *   0000001    00100      rs1       000      00000  0001011
+ *
+ * dcache.cipa rs1 (clean then invalidate, physical address)
+ * | 31 - 25 | 24 - 20 | 19 - 15 | 14 - 12 | 11 - 7 | 6 - 0 |
+ *   0000001    01011      rs1       000      00000  0001011
+ * dcache.civa rs1 (... virtual address)
+ *   0000001    00111      rs1       000      00000  0001011
+ *
+ * sync.s (make sure all cache operations finished)
+ * | 31 - 25 | 24 - 20 | 19 - 15 | 14 - 12 | 11 - 7 | 6 - 0 |
+ *   0000000    11001     00000      000      00000  0001011
+ */
+#define THEAD_INVAL_A0	".long 0x0265000b"
+#define THEAD_CLEAN_A0	".long 0x0245000b"
+#define THEAD_FLUSH_A0	".long 0x0275000b"
+#define THEAD_SYNC_S	".long 0x0190000b"
+
 #define ALT_CMO_OP(_op, _start, _size, _cachesize)			\
-asm volatile(ALTERNATIVE(						\
+asm volatile(ALTERNATIVE_2(						\
+	"nop\n\t"							\
 	"nop\n\t"							\
 	"nop\n\t"							\
 	"nop\n\t"							\
@@ -124,8 +154,17 @@ asm volatile(ALTERNATIVE(						\
 	CBO_##_op##_A0 "\n\t"						\
 	"add a0, a0, %0\n\t"						\
 	"2:\n\t"							\
-	"bltu a0, %2, 3b\n\t", 0,					\
-		CPUFEATURE_CMO, CONFIG_RISCV_ISA_ZICBOM)		\
+	"bltu a0, %2, 3b\n\t"						\
+	"nop", 0, CPUFEATURE_CMO, CONFIG_RISCV_ISA_ZICBOM,		\
+	"mv a0, %1\n\t"							\
+	"j 2f\n\t"							\
+	"3:\n\t"							\
+	THEAD_##_op##_A0 "\n\t"						\
+	"add a0, a0, %0\n\t"						\
+	"2:\n\t"							\
+	"bltu a0, %2, 3b\n\t"						\
+	THEAD_SYNC_S, THEAD_VENDOR_ID,					\
+			ERRATA_THEAD_CMO, CONFIG_ERRATA_THEAD_CMO)	\
 	: : "r"(_cachesize),						\
 	    "r"(ALIGN((_start), (_cachesize))),				\
 	    "r"(ALIGN((_start) + (_size), (_cachesize))))
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
