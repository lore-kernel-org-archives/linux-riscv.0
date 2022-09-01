Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 354D9ECAAD2
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Sep 2022 22:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GS4xtAd4gL1JQ6Jmj2sZjqnTrf/jOPPaZ1S6iU1adHQ=; b=XiY0w2vzIrP//q
	0fOS+QhXGToFH6jb+vOC9X8KOgjQ0g57pSkFDDA0YCu/+5cNXCR4svhiNCULrU/wvrbtpaPJEyuu2
	JmHcD2547ufmpHtn31xpJjRM9L45pxLj1XQ4tlI5RlFKBseupu0LzOgCHjMe97HnXHd27fl4Ld1t/
	8I+fjhYaJ6uFUwDQm9HZGGnLz0KAWf11Gi/vgj5Sln4CsJnH68icbvA/GRWF8+qGzK9qywTJ2Ly0X
	zgwWTezhZ29dzzR59aJU1a6CSbNZ7s42LW7qR5VvZZE26Pmctc6LQq0fSCn5kyi5gE4ugCURirWgU
	hGzBJg82gg3KHMpv4W2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTspy-00FRp8-Gs; Thu, 01 Sep 2022 22:39:02 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTsfh-00FLJE-G1
	for linux-riscv@lists.infradead.org; Thu, 01 Sep 2022 22:28:28 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1oTsfW-0007wk-5B; Fri, 02 Sep 2022 00:28:14 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: conor.dooley@microchip.com,
	guoren@kernel.org,
	apatel@ventanamicro.com,
	atishp@rivosinc.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 2/4] riscv: drop some idefs from CMO initialization
Date: Fri,  2 Sep 2022 00:27:42 +0200
Message-Id: <20220901222744.2210215-2-heiko@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220901222744.2210215-1-heiko@sntech.de>
References: <20220901222744.2210215-1-heiko@sntech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_152825_663181_FD62E26B 
X-CRM114-Status: GOOD (  12.49  )
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

Wrapping things in #ifdefs makes the code harder to read
while we also have IS_ENABLED() macros to do this in regular code
and the extension detection is not _that_ runtime critical.

So define a stub for riscv_noncoherent_supported() in the
non-CONFIG_RISCV_DMA_NONCOHERENT case and move the code to
us IS_ENABLED.

Suggested-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/riscv/errata/thead/errata.c    |  7 +++----
 arch/riscv/include/asm/cacheflush.h |  2 ++
 arch/riscv/kernel/cpufeature.c      | 22 +++++++++-------------
 3 files changed, 14 insertions(+), 17 deletions(-)

diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead/errata.c
index 202c83f677b2..bffa711aaf64 100644
--- a/arch/riscv/errata/thead/errata.c
+++ b/arch/riscv/errata/thead/errata.c
@@ -30,7 +30,9 @@ static bool errata_probe_pbmt(unsigned int stage,
 static bool errata_probe_cmo(unsigned int stage,
 			     unsigned long arch_id, unsigned long impid)
 {
-#ifdef CONFIG_ERRATA_THEAD_CMO
+	if (!IS_ENABLED(CONFIG_ERRATA_THEAD_CMO))
+		return false;
+
 	if (arch_id != 0 || impid != 0)
 		return false;
 
@@ -39,9 +41,6 @@ static bool errata_probe_cmo(unsigned int stage,
 
 	riscv_noncoherent_supported();
 	return true;
-#else
-	return false;
-#endif
 }
 
 static u32 thead_errata_probe(unsigned int stage,
diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm/cacheflush.h
index a60acaecfeda..4363d0beb38a 100644
--- a/arch/riscv/include/asm/cacheflush.h
+++ b/arch/riscv/include/asm/cacheflush.h
@@ -50,6 +50,8 @@ static inline void riscv_init_cbom_blocksize(void) { }
 
 #ifdef CONFIG_RISCV_DMA_NONCOHERENT
 void riscv_noncoherent_supported(void);
+#else
+static inline void riscv_noncoherent_supported(void) {}
 #endif
 
 /*
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 764ea220161f..729f7a218093 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -264,21 +264,17 @@ static bool __init_or_module cpufeature_probe_svpbmt(unsigned int stage)
 
 static bool __init_or_module cpufeature_probe_zicbom(unsigned int stage)
 {
-#ifdef CONFIG_RISCV_ISA_ZICBOM
-	switch (stage) {
-	case RISCV_ALTERNATIVES_EARLY_BOOT:
+	if (!IS_ENABLED(CONFIG_RISCV_ISA_ZICBOM))
+		return false;
+
+	if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
+		return false;
+
+	if (!riscv_isa_extension_available(NULL, ZICBOM))
 		return false;
-	default:
-		if (riscv_isa_extension_available(NULL, ZICBOM)) {
-			riscv_noncoherent_supported();
-			return true;
-		} else {
-			return false;
-		}
-	}
-#endif
 
-	return false;
+	riscv_noncoherent_supported();
+	return true;
 }
 
 /*
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
