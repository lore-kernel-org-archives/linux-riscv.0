Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34333C6FA83
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Sep 2022 07:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GiqOFPnws5pF99IlUOUQQ9xaSmtO43Bbcdh8XPPC6FY=; b=LmrxVq7bKN5t1c
	mSwf2gDVA2Elui4WyZgnoEW5zN8JgCZq/zRCV8Jv7sRBNpNwZhwgIIqY6zVa2AsCDpTCDADd4HhvM
	N1bBjtqqn68PMt26GKrVLlI0haPGQZ4gwUcnEcr4MCrDOjfZzca7aUFAepLUdsskZfx+hkOKT7Kga
	WNBYWN70tikwi93dAi+FGUGJKGrxqtTOOdXUX8Owk+0z/0aBqCx4rXLeObDeIFlmtBwcz3ZHpbU7S
	x04ejAveyV154dq7QtPrH1izj+B5UYa8wp93j8GbZZPDvhWs4mCzSUTsmKJvcfitU28M4d5jlmPLo
	ILX9lelwXZNe3f0q2xFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVTGn-00Atth-HJ; Tue, 06 Sep 2022 07:45:17 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVTGl-00Atr9-CR
	for linux-riscv@lists.infradead.org; Tue, 06 Sep 2022 07:45:16 +0000
Received: by mail-ej1-x631.google.com with SMTP id bj12so21186812ejb.13
        for <linux-riscv@lists.infradead.org>; Tue, 06 Sep 2022 00:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=MBjllyr6PHhY45e7puO11eGQKDVBea7fZ7OX5dT+ItQ=;
        b=HNxyqxLEGCuTh9eORSYhOvSMdT3zoHDdkBJx75wXYbx0a3898WD4dkZUhKismWlhsv
         pwfYVMcoZkVcMQME3LY7pyXd9bLJjExmJeJ1kQCWWu16FZN3A4xz2NRp6cEMjPztBQfn
         V1ZYT+J6UmUw7aCyAN/aUIYf1SsspWxvOEgpoGjjm0pwtfqWwwCNgoT6sd3P0sf3juNo
         SBvgrcSjukdyHAHwKZmTGimrm0LrNn48XEUBZ6Nk9Yb2baKKqEAvJr+fQHEx9ongp7hz
         yp+wc1VzrSfIgbcg1JTWTd3thxbLg3RTK+SwXUrI+1aWo49oaWWnn2WQqFEdGbo1YGyJ
         NCdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=MBjllyr6PHhY45e7puO11eGQKDVBea7fZ7OX5dT+ItQ=;
        b=HG5EmbFWJiwA7zsLT6Nj+pr9K7FMj9enxZYhUyBB2Cruj3VDhApYZYcxjW5H3X2Y6U
         KZBf+R/JbtDKxEo6GJZsjEPng5s8SJiHNqJ36dONmwkIvzx7S3y2NTc/bElhplQ301vf
         yFL+/qSLASK95Ct0tCx4SkY0x/931PZfhgXDeo36hTdPnv7sMOcP+UsqaXBhodeAuGtU
         tj3qhG/PKDoBEv7CYlFr+Cy7xeD3P3vcmJHABFBQ/viahSLQ6kbSFGIc62Rnxtxr386R
         sQ2O7v+aw1EmqpDbXWmyya6n0VzdoLLDk4uv3IPWRJqujWQXUdYmDdpfaz/7GOBi3g+B
         XMSA==
X-Gm-Message-State: ACgBeo1sKgmFYGyuLnCWK+aoNaJ940vUJdy5wK/IXR8TpdAfMlN86N31
	Qk82U+MMOq2vG7v1Rln6KzqCy6NpMl3aYA==
X-Google-Smtp-Source: AA6agR5GqBcsNHqUUuKh0fj+refmY+2bnWKBmlR1TPb8DI14bpKVMeQZLLVzvYSR3HdyCHpXwqIJkg==
X-Received: by 2002:a17:906:fc6:b0:72f:d080:416 with SMTP id c6-20020a1709060fc600b0072fd0800416mr38362304ejk.1.1662450313025;
        Tue, 06 Sep 2022 00:45:13 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id e10-20020a1709062d4a00b0073dafb227c0sm6181623eji.161.2022.09.06.00.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 00:45:12 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Anup Patel <anup@brainfault.org>,
	Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: Atish Patra <atishp@atishpatra.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Jessica Clarke <jrtc27@jrtc27.com>,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v3 1/2] RISC-V: Move riscv_init_cbom_blocksize() to cacheflush.c
Date: Tue,  6 Sep 2022 09:45:08 +0200
Message-Id: <20220906074509.928865-2-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220906074509.928865-1-ajones@ventanamicro.com>
References: <20220906074509.928865-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_004515_466609_05D87D8F 
X-CRM114-Status: GOOD (  14.65  )
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

From: Anup Patel <apatel@ventanamicro.com>

The riscv_cbom_block_size parsing from DT belongs to cacheflush.c which
is home for all cache maintenance related stuff so let us move the
riscv_init_cbom_blocksize() and riscv_cbom_block_size to cacheflush.c.

Co-developed-by: Mayuresh Chitale <mchitale@ventanamicro.com>
Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
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
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
