Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C8EDECAAD4
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Aug 2022 12:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ly0vv2qrf2+4o5KAH9VgAbJzTp1ft3R6/DeBBMdGIhE=; b=g9XpdwlWu360F8
	uXRkYU8Q5a8oDtzLekxYsOGo4uOP2+5DkF/asXKdgfRv0kI48Tt0HgCW3gnkuuRh1rIeBSvNE5oYo
	bZRwpMH14JpWxJ3YTAq8rhJZoo9NeWgwuwyUP3dYI37WleRii+ZrHiGQ1ZgeP6RMMmi0xuFwwIxaw
	bQETK0WlWkdQpuUoA4kHBo5NFswYLUzHYwtUGW8API+++yx8cEMC41xD1fVFd4Hr04eM9xdqG8Rr/
	izUsbrjhxG2PiXX81mIUBEknIKEx6d+d8adCi5Ymisp7tac9XEkvQgMYY2cyBGJAEd5BbcGABD2+v
	fgNUFQvszzf3N2eaKTzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSeGG-009xCG-4m; Mon, 29 Aug 2022 12:53:04 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSeGB-009x3j-Rx
	for linux-riscv@lists.infradead.org; Mon, 29 Aug 2022 12:53:01 +0000
Received: by mail-pj1-x1029.google.com with SMTP id h11-20020a17090a470b00b001fbc5ba5224so8455748pjg.2
        for <linux-riscv@lists.infradead.org>; Mon, 29 Aug 2022 05:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=5ilaCtDntV5LvqrHcpDpXbfyMqkerLgg3poBAYZ46YQ=;
        b=Y5QcKGoYcZUCjnyFG9953lwHuj8t9eSGvfQexdUbQBs3F5Q74O7L0rLpj+Rk2NMLRB
         akZxLE23GhCaDZhrHVl4kvCKRrenMI/lG5N9iy1F5E1tHRv3GJsSzpnEOOs042Xuybrb
         pe7VGMP+ilvW34wpbW2Ocm3E8BupI9Rpo2t983yVIvRf3ARenyrZYqQ507gIEbhu8AJG
         8uhZkR4PxP+N2CQ87mbzj6ax4HHh8AvTYKL7Ck06mcZsrDe+dU3nmz8sB+eZbD3D4Ivp
         HL9tOZqtrKj6JOn2joQwSLIbJtXPt9h0gUjBubttZ0XYW4NhHWzdx6R0CRKU1o7Gq/II
         nMLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=5ilaCtDntV5LvqrHcpDpXbfyMqkerLgg3poBAYZ46YQ=;
        b=OSesvUXL+zSPx/8QiWoNWEG0qEPwKFeU0YwJH6qECNDz/fpfg3qLsGGhBV6ekNl0o8
         n0Iyl2aC0zYX1kNvLOsniEGPxESCqiOHN/6jHA1/ykGYCSsevLlLaBgjz/DN/qko5S3E
         Jlz9HtXWjz5yfodyMFWnGLKnZu1g+Rcxs0MCeuHvEzwA9b5Vsje2L7HvXsU3wKxK5kK+
         1TDbzEZS9KmyKlvaC1YxF0Dy5bweZDcA4cjD5e5Q6S1OpaTfwRwAy9lugUTU411sEDol
         p0COP85NUBv+m65frkjGaJKpePRuUOLOUq+oF11ectQR6oesMFSSN5o4SvwZsqV391A+
         Tj0A==
X-Gm-Message-State: ACgBeo0CCnE5E2+TrWJBKCLntPfAxMjD1XZJ1Y6x49lLaxHq4wYclKX9
	/kOlBAt8LGGIaRA5eEOwQarPbQ==
X-Google-Smtp-Source: AA6agR4OoFG/9b1mM+UxTLGwZsmbxe4eml0wufZpYjFVzAvxCeN1tO1qI+X9fHG9U5AkBhxKVgkPrA==
X-Received: by 2002:a17:902:a704:b0:174:3ad5:30b8 with SMTP id w4-20020a170902a70400b001743ad530b8mr15331334plq.14.1661777578696;
        Mon, 29 Aug 2022 05:52:58 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([171.76.81.110])
        by smtp.gmail.com with ESMTPSA id a6-20020a170902ecc600b0016ed5266a5csm7517607plh.170.2022.08.29.05.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 05:52:58 -0700 (PDT)
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
Subject: [PATCH 2/4] RISC-V: Move riscv_init_cbom_blocksize() to cacheflush.c
Date: Mon, 29 Aug 2022 18:22:24 +0530
Message-Id: <20220829125226.511564-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220829125226.511564-1-apatel@ventanamicro.com>
References: <20220829125226.511564-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_055259_964915_4D248D38 
X-CRM114-Status: GOOD (  13.72  )
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
 arch/riscv/mm/cacheflush.c          | 37 +++++++++++++++++++++++++++++
 arch/riscv/mm/dma-noncoherent.c     | 36 ----------------------------
 3 files changed, 39 insertions(+), 36 deletions(-)

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
index 6cb7d96ad9c7..26be957dcbf2 100644
--- a/arch/riscv/mm/cacheflush.c
+++ b/arch/riscv/mm/cacheflush.c
@@ -86,3 +86,40 @@ void flush_icache_pte(pte_t pte)
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
index cd2225304c82..b09e4b431307 100644
--- a/arch/riscv/mm/dma-noncoherent.c
+++ b/arch/riscv/mm/dma-noncoherent.c
@@ -12,7 +12,6 @@
 #include <linux/of_device.h>
 #include <asm/cacheflush.h>
 
-static unsigned int riscv_cbom_block_size = L1_CACHE_BYTES;
 static bool noncoherent_supported;
 
 void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
@@ -75,41 +74,6 @@ void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
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
