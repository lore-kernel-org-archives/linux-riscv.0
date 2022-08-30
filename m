Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9354CC0502A
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Aug 2022 04:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+L3nkbm7R3nwU/TUce83Vkc+kYz1y/riFBXWhGbuN6s=; b=sZi9owQ1rTFtJk
	uH+QEUk8IaDQt4h42sy6ocLuHdfi2nRtO+XR3H4WvsoZ/rynj+OUudVICbyXaMZSZARa6a3v7HQSH
	G57r7aMPgXzhJf04yj9YBAKDVl4t8334JLYct69wc4MUTooaCUjv1zUNVdMDdCs6baTjb/bL9Yr0n
	qZVqFj71cY7wD6+1JMOyx3FmRo/2Gxy1r/d+XEDQdndaSdKr8EbMaxxUaVU5I6H1uCsUOyTOsug8N
	sdYhgjNCi+pRBCSEjZgM74kEfnQ3eCyPdm3iRoIBUsnL2uXMQc57khlzX2/u4YpLWhpArYA4dMrY4
	OufJBZXmKwmqv3Ym4N/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oStA8-00E3nx-GW; Tue, 30 Aug 2022 04:47:44 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oStA4-00E3jY-Hp
	for linux-riscv@lists.infradead.org; Tue, 30 Aug 2022 04:47:42 +0000
Received: by mail-pg1-x536.google.com with SMTP id v4so9614385pgi.10
        for <linux-riscv@lists.infradead.org>; Mon, 29 Aug 2022 21:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=vtPor/JINehJpJFz1SJxkilKXT4UTOKJym5PpR3Plyk=;
        b=KLp7YXcUffNSRJEbHo1U1gFf2nnUmwcycrLDg1hpm4yGoo8eT6ngd5n7pJlrXiBTfk
         j9mnZNlk/zsBbPEOgU3W+ROlFAHnTuHqXnzV/oofvNyRSPOyvcx91nVFrWKSVynCcPQO
         Yozf5ttY5wiN4KYbGgaGXYPQihD5M8YpjS8/gPwI8uEgq/W+mOeS+ezvte8NW6wcjCSF
         rCNcKS5RQDnSnMsHqNs5otYgdI2seYwWH7idJpYGeH1+Ka7AwhCj4uHSxf/VZ4qdRiOg
         QjG/bvyS1x4sWKWaVmNPZ4nPdw/DqZ2phPArkK5QGPNK2wavVtdSzz1cqCr6qgUPLu0s
         kCug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=vtPor/JINehJpJFz1SJxkilKXT4UTOKJym5PpR3Plyk=;
        b=z5FgoLrcH3zBHnmd7wSuv/ZGWwr5tzlvusIM4PVSRiz5TZAjianT/8xUmWyBlXgxWG
         MbiJDmA/4O3DK47m/jOS18kMO8glp+Jm+OPW98kKmbsLUuPqRLqERqTQGhlhtYI/wiJs
         xeWKpb8hYL+EeJtjkmYql9QszVs8xnyS1d7OwawwlpoKRz6buKDp6+ne0ts0iylTrNeN
         PGPJIWiG3Ew5J9Trk/wVK791ju00FufavvNbzmGnL7BBOQOfxFQ+ymVOw7qmJiMV1JFX
         Oa2Gu5X7qGSdsWDsxPTayNrOc7JkrRNj+QGDJAjAY+RTg8zma23fTMCV6P0oz+EjmWlZ
         FhMg==
X-Gm-Message-State: ACgBeo0gFDUax9SlNb8kxPvcvnBo2oyjJLn3NzRBD9iBfWTzm5bsJJ8a
	S7t42QJbtOa72dMZOfb2pDXBDA==
X-Google-Smtp-Source: AA6agR4rh3ksVh2lnb3HasNfLMlOM72aYIH5s+vR9Vg3+NK7D0dv/gqNDtx+6K1K/D/vdy0w0onD2Q==
X-Received: by 2002:a63:ad02:0:b0:41a:910f:5195 with SMTP id g2-20020a63ad02000000b0041a910f5195mr16829161pgf.472.1661834857629;
        Mon, 29 Aug 2022 21:47:37 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([171.76.81.23])
        by smtp.gmail.com with ESMTPSA id y27-20020a634b1b000000b0041cd5ddde6fsm592240pga.76.2022.08.29.21.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 21:47:37 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Cc: Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>,
	Mayuresh Chitale <mchitale@ventanamicro.com>
Subject: [PATCH v2 2/4] RISC-V: Move riscv_init_cbom_blocksize() to cacheflush.c
Date: Tue, 30 Aug 2022 10:16:40 +0530
Message-Id: <20220830044642.566769-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220830044642.566769-1-apatel@ventanamicro.com>
References: <20220830044642.566769-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_214740_611091_4FD6F779 
X-CRM114-Status: GOOD (  14.39  )
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

The riscv_cbom_block_size parsing from DT belongs to cacheflush.c which
is home for all cache maintenance related stuff so let us move the
riscv_init_cbom_blocksize() and riscv_cbom_block_size to cacheflush.c.

Co-developed-by: Mayuresh Chitale <mchitale@ventanamicro.com>
Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/cacheflush.h |  2 ++
 arch/riscv/mm/cacheflush.c          | 39 +++++++++++++++++++++++++++++
 arch/riscv/mm/dma-noncoherent.c     | 38 ----------------------------
 3 files changed, 41 insertions(+), 38 deletions(-)

diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm/cacheflush.h
index a60acaecfeda..de55d6b8deeb 100644
--- a/arch/riscv/include/asm/cacheflush.h
+++ b/arch/riscv/include/asm/cacheflush.h
@@ -42,6 +42,8 @@ void flush_icache_mm(struct mm_struct *mm, bool local);
 
 #endif /* CONFIG_SMP */
 
+extern unsigned int riscv_cbom_block_size;
+
 #ifdef CONFIG_RISCV_ISA_ZICBOM
 void riscv_init_cbom_blocksize(void);
 #else
diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
index 6cb7d96ad9c7..336c5deea870 100644
--- a/arch/riscv/mm/cacheflush.c
+++ b/arch/riscv/mm/cacheflush.c
@@ -3,6 +3,8 @@
  * Copyright (C) 2017 SiFive
  */
 
+#include <linux/of.h>
+#include <linux/of_device.h>
 #include <asm/cacheflush.h>
 
 #ifdef CONFIG_SMP
@@ -86,3 +88,40 @@ void flush_icache_pte(pte_t pte)
 		flush_icache_all();
 }
 #endif /* CONFIG_MMU */
+
+unsigned int riscv_cbom_block_size = L1_CACHE_BYTES;
+
+#ifdef CONFIG_RISCV_ISA_ZICBOM
+void riscv_init_cbom_blocksize(void)
+{
+	struct device_node *node;
+	int ret;
+	u32 val;
+
+	for_each_of_cpu_node(node) {
+		unsigned long hartid;
+		int cbom_hartid;
+
+		ret = riscv_of_processor_hartid(node, &hartid);
+		if (ret)
+			continue;
+
+		if (hartid < 0)
+			continue;
+
+		/* set block-size for cbom extension if available */
+		ret = of_property_read_u32(node, "riscv,cbom-block-size", &val);
+		if (ret)
+			continue;
+
+		if (!riscv_cbom_block_size) {
+			riscv_cbom_block_size = val;
+			cbom_hartid = hartid;
+		} else {
+			if (riscv_cbom_block_size != val)
+				pr_warn("cbom-block-size mismatched between harts %d and %lu\n",
+					cbom_hartid, hartid);
+		}
+	}
+}
+#endif
diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoherent.c
index cd2225304c82..3f502a1a68b1 100644
--- a/arch/riscv/mm/dma-noncoherent.c
+++ b/arch/riscv/mm/dma-noncoherent.c
@@ -8,11 +8,8 @@
 #include <linux/dma-direct.h>
 #include <linux/dma-map-ops.h>
 #include <linux/mm.h>
-#include <linux/of.h>
-#include <linux/of_device.h>
 #include <asm/cacheflush.h>
 
-static unsigned int riscv_cbom_block_size = L1_CACHE_BYTES;
 static bool noncoherent_supported;
 
 void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
@@ -75,41 +72,6 @@ void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
 	dev->dma_coherent = coherent;
 }
 
-#ifdef CONFIG_RISCV_ISA_ZICBOM
-void riscv_init_cbom_blocksize(void)
-{
-	struct device_node *node;
-	int ret;
-	u32 val;
-
-	for_each_of_cpu_node(node) {
-		unsigned long hartid;
-		int cbom_hartid;
-
-		ret = riscv_of_processor_hartid(node, &hartid);
-		if (ret)
-			continue;
-
-		if (hartid < 0)
-			continue;
-
-		/* set block-size for cbom extension if available */
-		ret = of_property_read_u32(node, "riscv,cbom-block-size", &val);
-		if (ret)
-			continue;
-
-		if (!riscv_cbom_block_size) {
-			riscv_cbom_block_size = val;
-			cbom_hartid = hartid;
-		} else {
-			if (riscv_cbom_block_size != val)
-				pr_warn("cbom-block-size mismatched between harts %d and %lu\n",
-					cbom_hartid, hartid);
-		}
-	}
-}
-#endif
-
 void riscv_noncoherent_supported(void)
 {
 	noncoherent_supported = true;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
