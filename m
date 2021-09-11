Return-Path: <SRS0=Il0f=OB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98DDAC433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Sep 2021 09:22:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FF4761242
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Sep 2021 09:22:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5FF4761242
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5OtR8KhVSWPzdVXwggWyP8eC6Po7ht3v4MWhN/hrHYQ=; b=qbX72dtvHOz7Ay
	5bwro1NptRV5RkSKW4H39Vj6pzH52wPI8qfASU6ApaRzWx8k8bQhfxcN1GnpI8/VhDHnyNxcpjET6
	MSmAG7Z2DhoL4X7JQ4Wsgy0/Oc7d77kJ5JFK+nu5E50U17iyuTaQ+x7RMAGzbtmf7dcKMJxbbQrL+
	F+g+LuK99lRJhN+qOGW6C1ATJhIFpcUhBs6KusDKWMm0zgJGX4Xuj2YLdg4IQx1npR0/g1OrIHa0Q
	VMTqzka8mAdRaaqnug4x4hLhZRhDjF1uYmmQjKEhExHgGOhENlCHC42GKTmYtgNrNab1co+h4IFlg
	iwJN2EFMD5d5maDHONEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mOzDM-00Eb30-DW; Sat, 11 Sep 2021 09:22:24 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mOzDI-00Eb1d-CU
 for linux-riscv@lists.infradead.org; Sat, 11 Sep 2021 09:22:22 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1E10A61214;
 Sat, 11 Sep 2021 09:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631352140;
 bh=3VCxxqXbTa0UBxOLuOi/PMP0R3acXRdfAijemphVwnY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MqVdVjcImN/2xd+K6RJYF+BcgXSPA/KdI/oUvPiRQMNqwTfbPeJXxQ4J2EufALOsV
 T/78RlnGAzwLlNHn2Qsw6GJgwA9Uc05GpuxIeR7CL6ecGvZn/g51y9GUDvql0IvRFk
 lGSl5DkvUOFTavimKc/9rnMDanN5XqYQmF+CZiA3VcmdRe+YJg8LHMsiFtDkrDvnXS
 Be2zrtRKE4hzk0kfj6sEMqSSW6yagHi3i1reRFVAIc+QCa/AQ14Q2/7LQMqrzevZZV
 jJA9WIHvwlrUQp8Agrgrb6JDUyf15bt87kWBVMKl+3Sr3HxYWoAOeM1BRNj8Fq+6q0
 beWk8xw2RzLfA==
From: guoren@kernel.org
To: anup.patel@wdc.com, atish.patra@wdc.com, palmerdabbelt@google.com,
 guoren@kernel.org, christoph.muellner@vrull.eu, philipp.tomsich@vrull.eu,
 hch@lst.de, liush@allwinnertech.com, wefu@redhat.com, lazyparser@gmail.com,
 drew@beagleboard.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 taiten.peng@canonical.com, aniket.ponkshe@canonical.com,
 heinrich.schuchardt@canonical.com, gordan.markus@canonical.com
Subject: [RFC PATCH V4 4/6] RISC-V: Implement arch_sync_dma* functions
Date: Sat, 11 Sep 2021 17:21:37 +0800
Message-Id: <20210911092139.79607-5-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210911092139.79607-1-guoren@kernel.org>
References: <20210911092139.79607-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210911_022220_516102_8EB9FE89 
X-CRM114-Status: GOOD (  18.38  )
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

From: Atish Patra <atish.patra@wdc.com>

To facilitate streaming DMA APIs, this patch introduces a set of generic
cache operations related dma sync. Any platform can use the generic ops
to provide platform specific cache management operations. Once the
standard RISC-V CMO extension is available, it can be built on top of it.

Below Added by Guo Ren:
1. Fixup arch_sync_dma_for_cpu with "add DMA_TO_DEVICE force" by Guo Ren and
follow the tips by Christoph:
/*
 * Cache operations depending on function and direction argument, inspired by
 * https://lkml.org/lkml/2018/5/18/979
 * "dma_sync_*_for_cpu and direction=TO_DEVICE (was Re: [PATCH 02/20]
 * dma-mapping: provide a generic dma-noncoherent implementation)"
 *
 *          |   map          ==  for_device     |   unmap     ==  for_cpu
 *          |----------------------------------------------------------------
 * TO_DEV   |   writeback        writeback      |   none          none
 * FROM_DEV |   invalidate       invalidate     |   invalidate*   invalidate*
 * BIDIR    |   writeback+inv    writeback+inv  |   invalidate    invalidate
 *
 *     [*] needed for CPU speculative prefetches
 *
 * NOTE: we don't check the validity of direction argument as it is done in
 * upper layer functions (in include/linux/dma-mapping.h)
 */

2. Christoph:
As told a bunch of times before: doing indirect calls here is a
performance nightmare.  Use something that actually does perform
horribly like alternatives.  Or even delay implementing that until
              ^^^^^^^^^^^^ Agree, and TODO in Atish next path?
we need it and do a plain direct call for now.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>
---
 arch/riscv/include/asm/dma-noncoherent.h | 19 +++++++
 arch/riscv/mm/Makefile                   |  1 +
 arch/riscv/mm/dma-noncoherent.c          | 66 ++++++++++++++++++++++++
 3 files changed, 86 insertions(+)
 create mode 100644 arch/riscv/include/asm/dma-noncoherent.h
 create mode 100644 arch/riscv/mm/dma-noncoherent.c

diff --git a/arch/riscv/include/asm/dma-noncoherent.h b/arch/riscv/include/asm/dma-noncoherent.h
new file mode 100644
index 000000000000..5bdb03c9c427
--- /dev/null
+++ b/arch/riscv/include/asm/dma-noncoherent.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2021 Western Digital Corporation or its affiliates.
+ */
+
+#ifndef __ASM_RISCV_DMA_NON_COHERENT_H
+#define __ASM_RISCV_DMA_NON_COHERENT_H
+
+#ifdef CONFIG_RISCV_DMA_NONCOHERENT
+struct riscv_dma_cache_sync {
+	void (*cache_invalidate)(phys_addr_t paddr, size_t size);
+	void (*cache_clean)(phys_addr_t paddr, size_t size);
+	void (*cache_flush)(phys_addr_t paddr, size_t size);
+};
+
+void riscv_dma_cache_sync_set(struct riscv_dma_cache_sync *ops);
+#endif
+
+#endif
diff --git a/arch/riscv/mm/Makefile b/arch/riscv/mm/Makefile
index 7ebaef10ea1b..959bef49098b 100644
--- a/arch/riscv/mm/Makefile
+++ b/arch/riscv/mm/Makefile
@@ -27,3 +27,4 @@ KASAN_SANITIZE_init.o := n
 endif
 
 obj-$(CONFIG_DEBUG_VIRTUAL) += physaddr.o
+obj-$(CONFIG_RISCV_DMA_NONCOHERENT) += dma-noncoherent.o
diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoherent.c
new file mode 100644
index 000000000000..63134d57016c
--- /dev/null
+++ b/arch/riscv/mm/dma-noncoherent.c
@@ -0,0 +1,66 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * RISC-V specific functions to support DMA for non-coherent devices
+ *
+ * Copyright (c) 2021 Western Digital Corporation or its affiliates.
+ */
+
+#include <linux/dma-direct.h>
+#include <linux/dma-map-ops.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/libfdt.h>
+#include <linux/mm.h>
+#include <linux/of.h>
+#include <linux/of_fdt.h>
+#include <asm/dma-noncoherent.h>
+
+static struct riscv_dma_cache_sync *dma_cache_sync;
+unsigned long riscv_dma_uc_offset;
+
+static void __dma_sync(phys_addr_t paddr, size_t size, enum dma_data_direction dir)
+{
+	if ((dir == DMA_FROM_DEVICE) && (dma_cache_sync->cache_invalidate))
+		dma_cache_sync->cache_invalidate(paddr, size);
+	else if ((dir == DMA_TO_DEVICE) && (dma_cache_sync->cache_clean))
+		dma_cache_sync->cache_clean(paddr, size);
+	else if ((dir == DMA_BIDIRECTIONAL) && dma_cache_sync->cache_flush)
+		dma_cache_sync->cache_flush(paddr, size);
+}
+
+void arch_sync_dma_for_device(phys_addr_t paddr, size_t size, enum dma_data_direction dir)
+{
+	if (!dma_cache_sync)
+		return;
+
+	__dma_sync(paddr, size, dir);
+}
+
+void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size, enum dma_data_direction dir)
+{
+	if (!dma_cache_sync || dir == DMA_TO_DEVICE)
+		return;
+
+	__dma_sync(paddr, size, DMA_FROM_DEVICE);
+}
+
+void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
+		const struct iommu_ops *iommu, bool coherent)
+{
+	/* If a specific device is dma-coherent, set it here */
+	dev->dma_coherent = coherent;
+}
+
+void arch_dma_prep_coherent(struct page *page, size_t size)
+{
+	void *flush_addr = page_address(page);
+
+	memset(flush_addr, 0, size);
+	if (dma_cache_sync && dma_cache_sync->cache_flush)
+		dma_cache_sync->cache_flush(__pa(flush_addr), size);
+}
+
+void riscv_dma_cache_sync_set(struct riscv_dma_cache_sync *ops)
+{
+	dma_cache_sync = ops;
+}
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
