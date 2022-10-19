Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 100B7C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Oct 2022 12:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MjNgANP3XUdGUBhNBDKxvXrU+Lw7hFMldGYZp095bPI=; b=dU4rxMw+DQ6rpv
	g4GaT9eYKFV7O0/1BHG5dZqSmGwPw7xZCAF5j+bZ5A7sKXErfa2v0vxNyJC3Lw0I921Ew900WhO0F
	v91tvpySPWYXuGfogXmVs7XfARtYLhuzyHjwJIeN9a1CzOdu5vmqSYde2guBYgEZVVCGlNPNrCLZ7
	YOnmzXD8WVyNzEgIyxpvibRsPjwFTeEYWxTT78ztBaqB12OwcDFVS4qeNocmv1aQNjvspFz7BKqNd
	QSxtCbB9Rc/FjDmQ4Qz89niUNQL7h3TwqmUauPeTktqdzGoqCx3JWGxxcG9+AbQf20PPNvJLHS2Ql
	imdfEFnipAg/eOnlJ+ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol80F-001MC5-0w; Wed, 19 Oct 2022 12:16:55 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol80B-001M9H-Kg
	for linux-riscv@lists.infradead.org; Wed, 19 Oct 2022 12:16:53 +0000
Received: by mail-pj1-x102c.google.com with SMTP id pq16so16745331pjb.2
        for <linux-riscv@lists.infradead.org>; Wed, 19 Oct 2022 05:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZdtB7nMd/miz6z/bYLXsK5LnjcXiRmtDmCC/irDiq08=;
        b=ZNTnuvr/My0fIC2ty0kF+NAFIXY/CL8dJ6j3U15+FaRaF/zMLjmLjP7RA0RhEINB/Q
         3w2uMYHYl41k+ZnfbD2vHNNPCIJbx1DMZunEU9IVtXOTM8i1EWvw3lizhEP1uIVVHpeb
         Z1dDpqVHwqRauvg8lBU7lXpRbvoNKicxkCRQp7VW9F3I5jAuQuuGM2tgu3chMPlMa2rR
         FBh8UXYEnr/85LhHRLxRm6SxfFcjrH/dHuglFLGNCuRvUvXsbw70YyBsZovrBvn6Ddt7
         azqsKprRSFmZMRR/j/3lakEhpLBco3VuJP1dSh23uOdXEmBlGyFFihXnxm5V4/EUxzHG
         QeoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZdtB7nMd/miz6z/bYLXsK5LnjcXiRmtDmCC/irDiq08=;
        b=UfQOsoAYZAPpgGu41yZPTXoMhwbOsSmKzMeJCg7kXXOslG+l5tlZ4U1uQyWBiDLJ3W
         bk7ECakCXlewe3ww1dk48F1lbG9/t2TC1nrGy2b/MFRmHHFvAgA3ULQJjEFKnHQ4App2
         JaJGt1dwsVfBxZLOmxKWrx0p2kQVRZ3orBQaRMZt5tBU1NW/RqApjkWo+U8D3tSkBN2h
         py0WO3uyzmafZK7DQIgfniNLsqKVcbZY2P9nxPLURxjbYrxKMBiCMe88T3SRXWGiKxrE
         PwNAqdC1+Dqh5uDqdjx/+B/dwSBCtPee+KIDbOfacNDVmtqi/1Up9yWWc94OwrLENcGx
         eclg==
X-Gm-Message-State: ACrzQf1b84I9Jcfz4oDcIUPRF33gxyTtXwlk6QCiTIGWnCX70QiAwTYQ
	jzHaxtvBJk+/poJ1T5+Smi7MaQ==
X-Google-Smtp-Source: AMsMyM43lEAuHZJ2yzkU8GrvCn2JCt/aIDmh+HadtSOnQ5dQ4xwNgJKColdK/KeW3iyLTPXkt3UhLA==
X-Received: by 2002:a17:903:2286:b0:185:3948:be93 with SMTP id b6-20020a170903228600b001853948be93mr8216477plh.121.1666181809464;
        Wed, 19 Oct 2022 05:16:49 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([171.76.82.102])
        by smtp.gmail.com with ESMTPSA id x7-20020a170902a38700b0017e93c158d7sm10529824pla.214.2022.10.19.05.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Oct 2022 05:16:48 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Cc: Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrew Jones <ajones@ventanamicro.com>,
	kernel test robot <lkp@intel.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 1/4] RISC-V: Fix compilation without RISCV_ISA_ZICBOM
Date: Wed, 19 Oct 2022 17:46:19 +0530
Message-Id: <20221019121622.179024-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221019121622.179024-1-apatel@ventanamicro.com>
References: <20221019121622.179024-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_051651_704917_B74F1168 
X-CRM114-Status: GOOD (  15.37  )
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
---
 arch/riscv/mm/cacheflush.c      | 41 +++++++++++++++++++++++++++++++++
 arch/riscv/mm/dma-noncoherent.c | 41 ---------------------------------
 2 files changed, 41 insertions(+), 41 deletions(-)

diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
index 6cb7d96ad9c7..f318b2553612 100644
--- a/arch/riscv/mm/cacheflush.c
+++ b/arch/riscv/mm/cacheflush.c
@@ -3,6 +3,8 @@
  * Copyright (C) 2017 SiFive
  */
 
+#include <linux/of.h>
+#include <linux/of_device.h>
 #include <asm/cacheflush.h>
 
 #ifdef CONFIG_SMP
@@ -86,3 +88,42 @@ void flush_icache_pte(pte_t pte)
 		flush_icache_all();
 }
 #endif /* CONFIG_MMU */
+
+unsigned int riscv_cbom_block_size;
+EXPORT_SYMBOL_GPL(riscv_cbom_block_size);
+
+#ifdef CONFIG_RISCV_ISA_ZICBOM
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
+#endif
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
