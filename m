Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2887C27C47
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Oct 2023 15:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Jg49hP9ocB3IBJ2YVQdXWnvEP1GTtHPsw8rZG+xjIRE=; b=W8h91lVCSx9HJL
	FcEoTCKokDFphKb+YF7J3mE4Kp7mGFPiX3wsXGMwJojFX+1u6XKodIWQGXmVm4da+ORKt4Y+df+Wp
	Au2D0qzkm6kmcdm3fmu6H0cXmoFpdD7i7lKFcBbqjmHQBVw5nfUl3LOOuANmxApKDxs/QoNOw7LM+
	f8kvoKBywz5auejq/O1ad+LOO6kUkMC/k57y1uBKokrYxahSqLC8/k82Oq0VZ5uiGXhmtq9B6twex
	QcdRU3gaJNhZCzQu8pE93c4O901wDr0Wgz3HN+Ex/z9e5gb6AgHpxHn6PQWOpGceQWbupRIN6jXnn
	Ob6qZbDFSAs7ZhmkzIig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwlai-000cW7-0I;
	Sat, 28 Oct 2023 15:51:12 +0000
Received: from 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qwlae-000cV5-0R;
	Sat, 28 Oct 2023 15:51:08 +0000
From: Christoph Hellwig <hch@lst.de>
To: geert+renesas@glider.be,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com
Cc: conor.dooley@microchip.com,
	linux-riscv@lists.infradead.org,
	soc@kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] riscv: split cache ops out of dma-noncoherent.c
Date: Sat, 28 Oct 2023 17:51:01 +0200
Message-Id: <20231028155101.1039049-1-hch@lst.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
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

The cache ops are also used by the pmem code which is unconditionally
built into the kernel.  Move them into a separate file that is built
based on the correct config option.

Fixes: fd962781270e ("riscv: RISCV_NONSTANDARD_CACHE_OPS shouldn't depend on RISCV_DMA_NONCOHERENT")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/riscv/mm/Makefile          |  1 +
 arch/riscv/mm/cache-ops.c       | 17 +++++++++++++++++
 arch/riscv/mm/dma-noncoherent.c | 15 ---------------
 3 files changed, 18 insertions(+), 15 deletions(-)
 create mode 100644 arch/riscv/mm/cache-ops.c

diff --git a/arch/riscv/mm/Makefile b/arch/riscv/mm/Makefile
index 9c454f90fd3da2..3a4dfc8babcf8c 100644
--- a/arch/riscv/mm/Makefile
+++ b/arch/riscv/mm/Makefile
@@ -36,3 +36,4 @@ endif
 
 obj-$(CONFIG_DEBUG_VIRTUAL) += physaddr.o
 obj-$(CONFIG_RISCV_DMA_NONCOHERENT) += dma-noncoherent.o
+obj-$(CONFIG_RISCV_NONSTANDARD_CACHE_OPS) += cache-ops.o
diff --git a/arch/riscv/mm/cache-ops.c b/arch/riscv/mm/cache-ops.c
new file mode 100644
index 00000000000000..a993ad11d0eca9
--- /dev/null
+++ b/arch/riscv/mm/cache-ops.c
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2021 Western Digital Corporation or its affiliates.
+ */
+
+#include <asm/dma-noncoherent.h>
+
+struct riscv_nonstd_cache_ops noncoherent_cache_ops __ro_after_init;
+
+void
+riscv_noncoherent_register_cache_ops(const struct riscv_nonstd_cache_ops *ops)
+{
+	if (!ops)
+		return;
+	noncoherent_cache_ops = *ops;
+}
+EXPORT_SYMBOL_GPL(riscv_noncoherent_register_cache_ops);
diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoherent.c
index b76e7e192eb183..341bd6706b4c56 100644
--- a/arch/riscv/mm/dma-noncoherent.c
+++ b/arch/riscv/mm/dma-noncoherent.c
@@ -15,12 +15,6 @@ static bool noncoherent_supported __ro_after_init;
 int dma_cache_alignment __ro_after_init = ARCH_DMA_MINALIGN;
 EXPORT_SYMBOL_GPL(dma_cache_alignment);
 
-struct riscv_nonstd_cache_ops noncoherent_cache_ops __ro_after_init = {
-	.wback = NULL,
-	.inv = NULL,
-	.wback_inv = NULL,
-};
-
 static inline void arch_dma_cache_wback(phys_addr_t paddr, size_t size)
 {
 	void *vaddr = phys_to_virt(paddr);
@@ -162,12 +156,3 @@ void __init riscv_set_dma_cache_alignment(void)
 	if (!noncoherent_supported)
 		dma_cache_alignment = 1;
 }
-
-void riscv_noncoherent_register_cache_ops(const struct riscv_nonstd_cache_ops *ops)
-{
-	if (!ops)
-		return;
-
-	noncoherent_cache_ops = *ops;
-}
-EXPORT_SYMBOL_GPL(riscv_noncoherent_register_cache_ops);
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
