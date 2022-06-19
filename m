Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 990D0C43334
	for <linux-riscv@archiver.kernel.org>; Sun, 19 Jun 2022 20:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=afNyaUtG2UsFhA0kr/IkDhDS847zjS6eI7QARP3+Y00=; b=qQHPgNcFPqIy5V
	gIDSDDTN23MRg5vKcSXa/go5/hsfjk8J9Pq3MBTUMZZhGrlfx5MhdoJwcNhgNJrQNUFuY8YmnCsvD
	tKWkb+4H4/1WW0BQsc5qaEi2GqY/lVwKFdjg9gP9ho9gHo65dQm5QWJY9zu8kPYvzQGuD3TeB88b1
	bVGdPKlPLVal035+XZF6pBuYUYmoys9//KXgG+ly4cuaSzYvV1iBcnhb6rur68xy4LbcSAWzgS3wh
	bfw3VLAjBQFy8wN+CAaKEzMM1PqVnbBXBsAGJi0M1fbR5GUk1xfFFVmktuYyfijpvQrSEAYF0RQjg
	nDp3TtvjrKFBZgjQ8YsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o31b0-00F7xP-Si; Sun, 19 Jun 2022 20:32:34 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o31at-00F7tz-K9
	for linux-riscv@lists.infradead.org; Sun, 19 Jun 2022 20:32:30 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1o31ap-0000EW-AQ; Sun, 19 Jun 2022 22:32:23 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: palmer@dabbelt.com,
	paul.walmsley@sifive.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	wefu@redhat.com,
	guoren@kernel.org,
	cmuellner@linux.com,
	philipp.tomsich@vrull.eu,
	hch@lst.de,
	samuel@sholland.org,
	atishp@atishpatra.org,
	anup@brainfault.org,
	mick@ics.forth.gr,
	robh+dt@kernel.org,
	krzk+dt@kernel.org,
	devicetree@vger.kernel.org,
	drew@beagleboard.org,
	rdunlap@infradead.org,
	Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 4/4] riscv: implement cache-management errata for T-Head SoCs
Date: Sun, 19 Jun 2022 22:32:12 +0200
Message-Id: <20220619203212.3604485-5-heiko@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220619203212.3604485-1-heiko@sntech.de>
References: <20220619203212.3604485-1-heiko@sntech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220619_133227_771154_64DFA1D4 
X-CRM114-Status: GOOD (  12.98  )
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

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/riscv/Kconfig.erratas           | 11 +++++++
 arch/riscv/errata/thead/errata.c     | 15 +++++++++
 arch/riscv/include/asm/errata_list.h | 48 +++++++++++++++++++++++++---
 3 files changed, 69 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/Kconfig.erratas b/arch/riscv/Kconfig.erratas
index 457ac72c9b36..3223e533fd87 100644
--- a/arch/riscv/Kconfig.erratas
+++ b/arch/riscv/Kconfig.erratas
@@ -55,4 +55,15 @@ config ERRATA_THEAD_PBMT
 
 	  If you don't know what to do here, say "Y".
 
+config ERRATA_THEAD_CMO
+	bool "Apply T-Head cache management errata"
+	depends on ERRATA_THEAD
+	select RISCV_DMA_NONCOHERENT
+	default y
+	help
+	  This will apply the cache management errata to handle the
+	  non-standard handling on non-coherent operations on T-Head SoCs.
+
+	  If you don't know what to do here, say "Y".
+
 endmenu
diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead/errata.c
index b37b6fedd53b..c97e59ae1b79 100644
--- a/arch/riscv/errata/thead/errata.c
+++ b/arch/riscv/errata/thead/errata.c
@@ -27,6 +27,18 @@ static bool errata_probe_pbmt(unsigned int stage,
 	return false;
 }
 
+static bool errata_probe_cmo(unsigned int stage,
+			     unsigned long arch_id, unsigned long impid)
+{
+	if (arch_id != 0 || impid != 0)
+		return false;
+
+	if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
+		return false;
+
+	return true;
+}
+
 static u32 thead_errata_probe(unsigned int stage,
 			      unsigned long archid, unsigned long impid)
 {
@@ -35,6 +47,9 @@ static u32 thead_errata_probe(unsigned int stage,
 	if (errata_probe_pbmt(stage, archid, impid))
 		cpu_req_errata |= (1U << ERRATA_THEAD_PBMT);
 
+	if (errata_probe_cmo(stage, archid, impid))
+		cpu_req_errata |= (1U << ERRATA_THEAD_CMO);
+
 	return cpu_req_errata;
 }
 
diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
index 79d89aeeaa6c..19a771085781 100644
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
@@ -88,17 +89,54 @@ asm volatile(ALTERNATIVE(						\
 #define ALT_THEAD_PMA(_val)
 #endif
 
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
+#define THEAD_inval_A0	".long 0x0265000b"
+#define THEAD_clean_A0	".long 0x0245000b"
+#define THEAD_flush_A0	".long 0x0275000b"
+#define THEAD_SYNC_S	".long 0x0190000b"
+
 #define ALT_CMO_OP(_op, _start, _size, _cachesize)			\
-asm volatile(ALTERNATIVE(						\
-	__nops(5),							\
+asm volatile(ALTERNATIVE_2(						\
+	__nops(6),							\
 	"mv a0, %1\n\t"							\
 	"j 2f\n\t"							\
 	"3:\n\t"							\
 	"cbo." __stringify(_op) " (a0)\n\t"				\
 	"add a0, a0, %0\n\t"						\
 	"2:\n\t"							\
-	"bltu a0, %2, 3b\n\t", 0,					\
-		CPUFEATURE_ZICBOM, CONFIG_RISCV_ISA_ZICBOM)		\
+	"bltu a0, %2, 3b\n\t"						\
+	"nop", 0, CPUFEATURE_ZICBOM, CONFIG_RISCV_ISA_ZICBOM,		\
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
 	    "r"((unsigned long)(_start) & ~((_cachesize) - 1UL)),	\
 	    "r"((unsigned long)(_start) + (_size))			\
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
