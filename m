Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3CECC77B7A
	for <linux-riscv@archiver.kernel.org>; Fri, 26 May 2023 17:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PCKIQJNN/jItHQhzrHZ8jpbYmtGmixFZZZ1Qbhl/NQo=; b=sFhc7hQzTMG7Os
	AzXjnNg0tINaYOF+GyiC6KEeEr/JI2OHDwIP9ep+3PzF88dra6kq1F3rkbUrcl0I7fOmzfEvZENtw
	tEkEMOYxw8h40vTi2OW0134e/Tf2u8/hFc8wndTWLTPC32xecgVvJaOWDjM6b8vPx+8Oj6uP+lexl
	jL4VSubcpQ2qUBYTAMqQ9oSc8eX1IZGVHOgGl4mGLEsGaWV4VY4b7Cd5Oa4JgCfyvs5xBPq+hDCJ/
	VjwKgWG764Eo4RTjvXmEzH60DueRFtPBLORnyGOGObnHmHRiwdeb3fSs4zcJDZw0izE718dBADMvB
	fZLBJLoo/SlYRa0VW9fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2ayK-003Fhe-1r;
	Fri, 26 May 2023 17:11:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2ayF-003FeJ-0a
	for linux-riscv@lists.infradead.org;
	Fri, 26 May 2023 17:11:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C197B650CE;
	Fri, 26 May 2023 17:11:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D085CC433EF;
	Fri, 26 May 2023 17:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685121078;
	bh=Bs4Qhmx5NZ+yKonQ7Rt09UyM8af1mOtvP1M80X6S4jQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q9Y1UXMhi4qK29CeyQI19Humy4yTmrqCpAopNGt1S+1XcaeUKmnORESujrBqXEfd3
	 qvyiSgkK20sTmXgyHEJccjGyXnZ17e5PF7iLp92CC0yT0Z/JZf7UIbIvqs2eUcTEaF
	 e//NjVYc1BMFIG/OE0/ik7wg3p8J1EIBIQXxrTR967X4dGzAEc5H2hrn8Sj+3pChl5
	 eF9S4qczAXnpMMxQYG0TdNBYrdEFdNDfMgLkRoSUisfE2yVc9fVNi6CfoPwMQD8SLi
	 i3ZmM+sElibCVv5j5oilGTXSrslQ3Or1mpAVnl8L7S9vaNgFA513T/J2wz7eAGGBBe
	 tcEgUMrGrAGiA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: [PATCH 4/6] riscv: mm: pass noncoherent or not to riscv_noncoherent_supported()
Date: Sat, 27 May 2023 00:59:56 +0800
Message-Id: <20230526165958.908-5-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230526165958.908-1-jszhang@kernel.org>
References: <20230526165958.908-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_101119_301504_3EEA6D39 
X-CRM114-Status: GOOD (  14.45  )
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

We will soon take different actions by checking the HW is noncoherent
or not, I.E ZICBOM/ERRATA_THEAD_CMO or not.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/errata/thead/errata.c    | 19 +++++++++++--------
 arch/riscv/include/asm/cacheflush.h |  4 ++--
 arch/riscv/kernel/setup.c           |  6 +++++-
 arch/riscv/mm/dma-noncoherent.c     | 10 ++++++----
 4 files changed, 24 insertions(+), 15 deletions(-)

diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead/errata.c
index be84b14f0118..c192b80a5166 100644
--- a/arch/riscv/errata/thead/errata.c
+++ b/arch/riscv/errata/thead/errata.c
@@ -36,21 +36,24 @@ static bool errata_probe_pbmt(unsigned int stage,
 static bool errata_probe_cmo(unsigned int stage,
 			     unsigned long arch_id, unsigned long impid)
 {
-	if (!IS_ENABLED(CONFIG_ERRATA_THEAD_CMO))
-		return false;
-
-	if (arch_id != 0 || impid != 0)
-		return false;
+	bool cmo;
 
 	if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
 		return false;
 
+	if (IS_ENABLED(CONFIG_ERRATA_THEAD_CMO) &&
+	    (arch_id == 0 && impid == 0))
+		cmo = true;
+	else
+		cmo = false;
+
 	if (stage == RISCV_ALTERNATIVES_BOOT) {
-		riscv_cbom_block_size = L1_CACHE_BYTES;
-		riscv_noncoherent_supported();
+		if (cmo)
+			riscv_cbom_block_size = L1_CACHE_BYTES;
+		riscv_noncoherent_supported(cmo);
 	}
 
-	return true;
+	return cmo;
 }
 
 static bool errata_probe_pmu(unsigned int stage,
diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm/cacheflush.h
index 8091b8bf4883..9d056c9b625a 100644
--- a/arch/riscv/include/asm/cacheflush.h
+++ b/arch/riscv/include/asm/cacheflush.h
@@ -54,9 +54,9 @@ extern unsigned int riscv_cboz_block_size;
 void riscv_init_cbo_blocksizes(void);
 
 #ifdef CONFIG_RISCV_DMA_NONCOHERENT
-void riscv_noncoherent_supported(void);
+void riscv_noncoherent_supported(bool cmo);
 #else
-static inline void riscv_noncoherent_supported(void) {}
+static inline void riscv_noncoherent_supported(bool cmo) {}
 #endif
 
 /*
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 36b026057503..565f3e20169b 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -264,6 +264,7 @@ static void __init parse_dtb(void)
 
 void __init setup_arch(char **cmdline_p)
 {
+	bool cmo;
 	parse_dtb();
 	setup_initial_init_mm(_stext, _etext, _edata, _end);
 
@@ -298,7 +299,10 @@ void __init setup_arch(char **cmdline_p)
 	apply_boot_alternatives();
 	if (IS_ENABLED(CONFIG_RISCV_ISA_ZICBOM) &&
 	    riscv_isa_extension_available(NULL, ZICBOM))
-		riscv_noncoherent_supported();
+		cmo = true;
+	else
+		cmo = false;
+	riscv_noncoherent_supported(cmo);
 }
 
 static int __init topology_init(void)
diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoherent.c
index d51a75864e53..0e172e2b4751 100644
--- a/arch/riscv/mm/dma-noncoherent.c
+++ b/arch/riscv/mm/dma-noncoherent.c
@@ -72,9 +72,11 @@ void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
 	dev->dma_coherent = coherent;
 }
 
-void riscv_noncoherent_supported(void)
+void riscv_noncoherent_supported(bool cmo)
 {
-	WARN(!riscv_cbom_block_size,
-	     "Non-coherent DMA support enabled without a block size\n");
-	noncoherent_supported = true;
+	if (cmo) {
+		WARN(!riscv_cbom_block_size,
+		     "Non-coherent DMA support enabled without a block size\n");
+		noncoherent_supported = true;
+	}
 }
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
