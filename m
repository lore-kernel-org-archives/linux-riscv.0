Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AFFFC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Oct 2022 13:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HUb+lCq6Ggn6QX4ox/1hXfrNly6jy60vSIoXky1flpc=; b=D1XG2uRSJ1QvI7
	g40NVmFoSM8512zQCFDcIWQapkLZ624YaFLE/jrYUwwoEVN238iHU6sf8jnRHvQ5Il7XC5c1GmYAC
	KQ46Vrai364iaNW5jTuA5nmegGyb45hvc7TyefvVWNADOXhQKT81PmrylGmEAOvkNVFPV2m8n9IMv
	LnEhLiebXMTqoXhLTO+pC0HrWy9W0n9tjIYeX33W16hgtOlQJMZigdZLTyHCchV1eiSIeTXMr66iC
	kbpFbtm1Ir5txGMQKybvHSI7Fzcth6bQPVAxbS2b8xiF4Xm3CbejYHHI79sb3QSAwpVBN1NtD1kYZ
	Fg/lVUl9u7coWtDA7TJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiyfT-00C1vf-0m; Thu, 13 Oct 2022 13:54:35 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiyTg-00BwVt-AG
	for linux-riscv@lists.infradead.org; Thu, 13 Oct 2022 13:42:29 +0000
Received: by mail-ed1-x530.google.com with SMTP id r14so2686742edc.7
        for <linux-riscv@lists.infradead.org>; Thu, 13 Oct 2022 06:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pqOWyuVikGvWHPzHMqzAPLrLFa3N03OWz+a8OHuV0QE=;
        b=OEb3mT+rDtZY1p6evO6qqT3pYCLxnSih5KnPBaUwcnXOwuePfc4xXORdjrBawolGxz
         SKLCsc8c6j/qVkd8GrlL/JregFLivFjUp4qc0iXfaWC/oPgP4PgnNzuA3aOgJtDffetO
         XnMtTY/TfAwRJrBJWQzOdwhEtDwkSkGW0VitfpXKeOfENuovZskU0TbR5gZPClvOonRf
         Ok6QcJqJXk+KhCO1wrnYH+sPS63aqObYbd/Bu/r+OjwHHX3siRrBeXCj2vI8HssrHhYO
         ci+rKzztRXcBs3+lW/IVB/p/FppUNF75vHmU4ksvt+LCKMv0GO03Ha0elIAY+0TV38Eg
         J/7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pqOWyuVikGvWHPzHMqzAPLrLFa3N03OWz+a8OHuV0QE=;
        b=Qi+3ck0sFKD447bGLNmXwSkUlUGwwRcOzoniVEwXD0Pyw+LbDyCfMMa80FzxJ2WwaW
         4DG1X4zZeWmAhvm2Bb2Sc5GJ6C177WiiaH2DzmmumoVhbaqXsguw9U/IQU3fGeBOXRqs
         F1U6ii77iFaFmWEs8VqQGL69rkwcJcKyxoequ5eE7Y37wzgIlzyq+t2qu4u3KvMSZD3/
         PNMPDMSecwPaDqHBNiTvS9R2W4TTaCfdEWX3YUtnW2K9JKsf1gAV6iY4U0c6E7dpLptK
         ztZXIJrQYBSlQkpVmvgNUW7c+2Ms3K4SX4pMILys9otjIY/kh8x/DV7nSbY/20mXiGQC
         aqtQ==
X-Gm-Message-State: ACrzQf1P3B+7f47gmiWJ+LeNolxEDpeDIbbI8hUpDXI6TeNPRbYj/fT3
	+MfVJNuNLOiut7RAZwsfElLjUQ==
X-Google-Smtp-Source: AMsMyM6fCuHlpZgNAAHxcS1moHAX+6cAIdQskiPf5wEQqYsQNfZmrAyoKu7CmWxjcfzAd6VMYDNy0w==
X-Received: by 2002:a05:6402:50cd:b0:45d:74d:93a2 with SMTP id h13-20020a05640250cd00b0045d074d93a2mr463879edb.156.1665668539421;
        Thu, 13 Oct 2022 06:42:19 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id h9-20020a170906854900b0078d3f96d293sm3049077ejy.30.2022.10.13.06.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Oct 2022 06:42:19 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: palmer@dabbelt.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	conor.dooley@microchip.com,
	vernon2gm@gmail.com,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v2] RISC-V: KVM: Fix compilation without RISCV_ISA_ZICBOM
Date: Thu, 13 Oct 2022 15:42:17 +0200
Message-Id: <20221013134217.1850349-1-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221013_064224_396861_10B76F7A 
X-CRM114-Status: GOOD (  13.96  )
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
---
 arch/riscv/include/asm/cacheflush.h |  8 ------
 arch/riscv/mm/cacheflush.c          | 38 ++++++++++++++++++++++++++
 arch/riscv/mm/dma-noncoherent.c     | 41 -----------------------------
 3 files changed, 38 insertions(+), 49 deletions(-)

diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm/cacheflush.h
index 273ece6b622f..1470e556cdb1 100644
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
index 6cb7d96ad9c7..8525f4a2d598 100644
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
+EXPORT_SYMBOL(riscv_cbom_block_size);
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
2.37.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
