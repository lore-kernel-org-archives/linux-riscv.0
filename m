Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2E52C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Oct 2022 07:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I+TqpGYL5Hn8IxI6A5QFSIvI9oDUayPBi0LyZ/+c9Y8=; b=koj/f3e/jBLOZ7
	AsoJ1cCS6Byi2n3wnaYN+mF9+k7e/GU6vlL/kIhc0TiJnYRQlnffP63fatQxDO71x78ADBmPhzguu
	Y+YcdEsdclZBEyAKJV5rg5iWkTNBa4wdno8Km1FXoxEESuTlfF6IHJGkliQ60xRYYJ097XrQ9FcyG
	qvsBcZBMGMYLk/VZnV2/ERqAMmu9M+hProUxV6bXspCGebBGAUUMdwj7yCQC/OPFGVgHtHwHmycNT
	BFdmBdegh6rQfFd2aaAps+6VFr1grc4TyzRQ/xf4O8ZftJqc/pnwUuMD8rq3Os3IF0idRa0J1uhvU
	At4o2kHAI4J+DynGsnBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olQSH-00C0rs-Ax; Thu, 20 Oct 2022 07:59:05 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olQSE-00C0oq-BB
	for linux-riscv@lists.infradead.org; Thu, 20 Oct 2022 07:59:03 +0000
Received: by mail-pf1-x431.google.com with SMTP id m6so19609608pfb.0
        for <linux-riscv@lists.infradead.org>; Thu, 20 Oct 2022 00:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pAsIYw7sZ9pedrVTYHgIfzcW6BaLpjWwdgXvgEmQOaY=;
        b=KVCqQo/Qymbi41s1GUvHpj3Wa5ZypO8gqStPS/9xn5zgaSL7zarcIcxDhnsDA/Iv6H
         xDxS2Ox3UAG1mZR376x/ShdVFwZWb1o8wEai1lgskVK8Y2IGL9/Ulx0HVzk8RtyhbKhm
         QP/grnXg+4nuN2+5lplMkJjPRv6pcSnWZCLkH/y8xE86Y4JaQp9Cijci1o5tTkUDzGPj
         rZU62/JDjfV98OLvz/x0lhSpy3gj5m3JOcNChEIHA6cpCS4LSCXSz7KKmPPpcsPMgEdl
         JOAGQSC4At6e1OBUJ0L17wsET+PnN4fPY/XJvBo81AgTiL+SNJb5OfHwaMExuIQ2rZ+/
         2AzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pAsIYw7sZ9pedrVTYHgIfzcW6BaLpjWwdgXvgEmQOaY=;
        b=WBV3jkvChSSokSkj3kQjSD4WPbjX0GXsMhmhyFxmU4JP8Vjyfm7+3AmFJ4p8Uo/M3q
         VP2JaLmlqWJm95mK4viPAyR9kqyTbc7fN8ujtCfB0atTSTYSueK10NmWsiz1CnJYwmrQ
         934qfIonjgRFhVrg+xtt0cNiBOliff3FQs6utyH+lBlnJ9xtsGwyyiCe8lp4Jidmqxc3
         HZw/0f2hEt3G6fVRXuAYHhRx58IGmYuDA3GnX+chmIpeNedpciYY+uluI4vm1qvL9VjL
         9WAfF1KeZE5X7B2kodhkAiOkrosY/tgUSGfaoGSRifwrglE3GXmNRv4unsbBzStYnhEz
         ibtg==
X-Gm-Message-State: ACrzQf3RMl5614ztLGg2JluoWc8X5/0Q0EAXB+f1hrmxp+QoTphUE5PZ
	OSLZJr+32bRVEk2Wcq53VwEI2w==
X-Google-Smtp-Source: AMsMyM7UCFvQaa7jwg80SjAqa1N1TyrjSWdPX8DKXF4Z/drUnTh21rNLOzM1OFg/9Bs2UjVCRigQtQ==
X-Received: by 2002:a63:cf4f:0:b0:462:da7a:1ded with SMTP id b15-20020a63cf4f000000b00462da7a1dedmr10543458pgj.605.1666252739916;
        Thu, 20 Oct 2022 00:58:59 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([171.76.80.23])
        by smtp.gmail.com with ESMTPSA id h30-20020aa79f5e000000b0052dfe83e19csm13206438pfr.16.2022.10.20.00.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 00:58:59 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Cc: Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Arnd Bergmann <arnd@arndb.de>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrew Jones <ajones@ventanamicro.com>,
	kernel test robot <lkp@intel.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 1/4] RISC-V: Fix compilation without RISCV_ISA_ZICBOM
Date: Thu, 20 Oct 2022 13:28:43 +0530
Message-Id: <20221020075846.305576-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020075846.305576-1-apatel@ventanamicro.com>
References: <20221020075846.305576-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_005902_413777_19C6C829 
X-CRM114-Status: GOOD (  16.01  )
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

From: Andrew Jones <ajones@ventanamicro.com>

riscv_cbom_block_size and riscv_init_cbom_blocksize() should always
be available and riscv_init_cbom_blocksize() should always be
invoked, even when compiling without RISCV_ISA_ZICBOM enabled. This
is because disabling RISCV_ISA_ZICBOM means "don't use zicbom
instructions in the kernel" not "pretend there isn't zicbom, even
when there is". When zicbom is available, whether the kernel enables
its use with RISCV_ISA_ZICBOM or not, KVM will offer it to guests.
Ensure we can build KVM and that the block size is initialized even
when compiling without RISCV_ISA_ZICBOM.

Fixes: 8f7e001e0325 ("RISC-V: Clean up the Zicbom block size probing")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Tested-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/riscv/include/asm/cacheflush.h |  8 ------
 arch/riscv/mm/cacheflush.c          | 38 ++++++++++++++++++++++++++
 arch/riscv/mm/dma-noncoherent.c     | 41 -----------------------------
 3 files changed, 38 insertions(+), 49 deletions(-)

diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm/cacheflush.h
index 8a5c246b0a21..f6fbe7042f1c 100644
--- a/arch/riscv/include/asm/cacheflush.h
+++ b/arch/riscv/include/asm/cacheflush.h
@@ -42,16 +42,8 @@ void flush_icache_mm(struct mm_struct *mm, bool local);
 
 #endif /* CONFIG_SMP */
 
-/*
- * The T-Head CMO errata internally probe the CBOM block size, but otherwise
- * don't depend on Zicbom.
- */
 extern unsigned int riscv_cbom_block_size;
-#ifdef CONFIG_RISCV_ISA_ZICBOM
 void riscv_init_cbom_blocksize(void);
-#else
-static inline void riscv_init_cbom_blocksize(void) { }
-#endif
 
 #ifdef CONFIG_RISCV_DMA_NONCOHERENT
 void riscv_noncoherent_supported(void);
diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
index 6cb7d96ad9c7..57b40a350420 100644
--- a/arch/riscv/mm/cacheflush.c
+++ b/arch/riscv/mm/cacheflush.c
@@ -3,6 +3,7 @@
  * Copyright (C) 2017 SiFive
  */
 
+#include <linux/of.h>
 #include <asm/cacheflush.h>
 
 #ifdef CONFIG_SMP
@@ -86,3 +87,40 @@ void flush_icache_pte(pte_t pte)
 		flush_icache_all();
 }
 #endif /* CONFIG_MMU */
+
+unsigned int riscv_cbom_block_size;
+EXPORT_SYMBOL_GPL(riscv_cbom_block_size);
+
+void riscv_init_cbom_blocksize(void)
+{
+	struct device_node *node;
+	unsigned long cbom_hartid;
+	u32 val, probed_block_size;
+	int ret;
+
+	probed_block_size = 0;
+	for_each_of_cpu_node(node) {
+		unsigned long hartid;
+
+		ret = riscv_of_processor_hartid(node, &hartid);
+		if (ret)
+			continue;
+
+		/* set block-size for cbom extension if available */
+		ret = of_property_read_u32(node, "riscv,cbom-block-size", &val);
+		if (ret)
+			continue;
+
+		if (!probed_block_size) {
+			probed_block_size = val;
+			cbom_hartid = hartid;
+		} else {
+			if (probed_block_size != val)
+				pr_warn("cbom-block-size mismatched between harts %lu and %lu\n",
+					cbom_hartid, hartid);
+		}
+	}
+
+	if (probed_block_size)
+		riscv_cbom_block_size = probed_block_size;
+}
diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoherent.c
index b0add983530a..d919efab6eba 100644
--- a/arch/riscv/mm/dma-noncoherent.c
+++ b/arch/riscv/mm/dma-noncoherent.c
@@ -8,13 +8,8 @@
 #include <linux/dma-direct.h>
 #include <linux/dma-map-ops.h>
 #include <linux/mm.h>
-#include <linux/of.h>
-#include <linux/of_device.h>
 #include <asm/cacheflush.h>
 
-unsigned int riscv_cbom_block_size;
-EXPORT_SYMBOL_GPL(riscv_cbom_block_size);
-
 static bool noncoherent_supported;
 
 void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
@@ -77,42 +72,6 @@ void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
 	dev->dma_coherent = coherent;
 }
 
-#ifdef CONFIG_RISCV_ISA_ZICBOM
-void riscv_init_cbom_blocksize(void)
-{
-	struct device_node *node;
-	unsigned long cbom_hartid;
-	u32 val, probed_block_size;
-	int ret;
-
-	probed_block_size = 0;
-	for_each_of_cpu_node(node) {
-		unsigned long hartid;
-
-		ret = riscv_of_processor_hartid(node, &hartid);
-		if (ret)
-			continue;
-
-		/* set block-size for cbom extension if available */
-		ret = of_property_read_u32(node, "riscv,cbom-block-size", &val);
-		if (ret)
-			continue;
-
-		if (!probed_block_size) {
-			probed_block_size = val;
-			cbom_hartid = hartid;
-		} else {
-			if (probed_block_size != val)
-				pr_warn("cbom-block-size mismatched between harts %lu and %lu\n",
-					cbom_hartid, hartid);
-		}
-	}
-
-	if (probed_block_size)
-		riscv_cbom_block_size = probed_block_size;
-}
-#endif
-
 void riscv_noncoherent_supported(void)
 {
 	WARN(!riscv_cbom_block_size,
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
