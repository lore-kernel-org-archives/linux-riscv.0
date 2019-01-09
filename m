Return-Path: <SRS0=AFlu=PR=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4617FC43444
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  9 Jan 2019 20:39:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11A49206B7
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  9 Jan 2019 20:39:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="R6Q69yGS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 11A49206B7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=deltatee.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:MIME-Version:References:
	In-Reply-To:Message-Id:Date:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RVtAp5JXCLgSwllVk5aFeNNHK3TTCga1BSpOFy7Xh7A=; b=R6Q69yGSMFCZmR
	EgK86N+qZYO50gedel8mt3uqKcfGzP8D3bHzOVGMWGe0fFpXSiLCLrDemvApON4FfDsz1Pot6x/F9
	U0FWM9fkWHjqmzKFI0Qw9webXdDvluDIHC/gC632fthFuQEneXhZgXw3NTYkZ8fEKxHy9xF6KhMeV
	9YUKx2O2kzzQ9Hl9aX0n8GETrYSRbLK5MNUFQ+3g7ia/He7GSr84DUNrXh6aEsXk9RcGUsxWpoTac
	V6FGq55SkFswRNc62hUu5/CRih6Pgdcewvnyq6z6MwvY6+8XhTxxK9WbbiquY09YaxkgG0pDCEYS8
	euoJ4NCE8x42EnuJ1o9Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ghKdK-0000pa-Va; Wed, 09 Jan 2019 20:39:26 +0000
Received: from ale.deltatee.com ([207.54.116.67])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ghKdG-0000lj-Oi
 for linux-riscv@lists.infradead.org; Wed, 09 Jan 2019 20:39:25 +0000
Received: from cgy1-donard.priv.deltatee.com ([172.16.1.31])
 by ale.deltatee.com with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <gunthorp@deltatee.com>)
 id 1ghKdE-0005yi-4T; Wed, 09 Jan 2019 13:39:22 -0700
Received: from gunthorp by cgy1-donard.priv.deltatee.com with local (Exim 4.89)
 (envelope-from <gunthorp@deltatee.com>)
 id 1ghKd9-000242-HG; Wed, 09 Jan 2019 13:39:15 -0700
From: Logan Gunthorpe <logang@deltatee.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Date: Wed,  9 Jan 2019 13:39:11 -0700
Message-Id: <20190109203911.7887-3-logang@deltatee.com>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20190109203911.7887-1-logang@deltatee.com>
References: <20190109203911.7887-1-logang@deltatee.com>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 172.16.1.31
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, sbates@raithlin.com, hch@lst.de,
 logang@deltatee.com, aou@eecs.berkeley.edu, palmer@sifive.com,
 andrew@sifive.com, olof@lixom.net, michaeljclark@mac.com, robh@kernel.org,
 zong@andestech.com
X-SA-Exim-Mail-From: gunthorp@deltatee.com
Subject: [PATCH v4 2/2] RISC-V: Implement sparsemem
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190109_123923_168118_31092C04 
X-CRM114-Status: GOOD (  16.74  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Rob Herring <robh@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Andrew Waterman <andrew@sifive.com>, Palmer Dabbelt <palmer@sifive.com>,
 Stephen Bates <sbates@raithlin.com>, Zong Li <zong@andestech.com>,
 Olof Johansson <olof@lixom.net>, Michael Clark <michaeljclark@mac.com>,
 Logan Gunthorpe <logang@deltatee.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

This patch implements sparsemem support for risc-v which helps pave the
way for memory hotplug and eventually P2P support.

We introduce Kconfig options for virtual and physical address bits which
are used to calculate the size of the vmemmap and set the
MAX_PHYSMEM_BITS.

The vmemmap is located directly before the VMALLOC region and sized
such that we can allocate enough pages to populate all the virtual
address space in the system (similar to the way it's done in arm64).

During initialization, call memblocks_present() and sparse_init(),
and provide a stub for vmemmap_populate() (all of which is similar to
arm64).

Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: Andrew Waterman <andrew@sifive.com>
Cc: Olof Johansson <olof@lixom.net>
Cc: Michael Clark <michaeljclark@mac.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Zong Li <zong@andestech.com>
---
 arch/riscv/Kconfig                 | 23 +++++++++++++++++++++++
 arch/riscv/include/asm/pgtable.h   | 21 +++++++++++++++++----
 arch/riscv/include/asm/sparsemem.h | 11 +++++++++++
 arch/riscv/kernel/setup.c          |  4 +++-
 arch/riscv/mm/init.c               |  8 ++++++++
 5 files changed, 62 insertions(+), 5 deletions(-)
 create mode 100644 arch/riscv/include/asm/sparsemem.h

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index e0d7d61779a6..bd659327bc6b 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -54,12 +54,32 @@ config ZONE_DMA32
 	bool
 	default y if 64BIT
 
+config VA_BITS
+	int
+	default 32 if 32BIT
+	default 39 if 64BIT
+
+config PA_BITS
+	int
+	default 34 if 32BIT
+	default 56 if 64BIT
+
 config PAGE_OFFSET
 	hex
 	default 0xC0000000 if 32BIT && MAXPHYSMEM_2GB
 	default 0xffffffff80000000 if 64BIT && MAXPHYSMEM_2GB
 	default 0xffffffe000000000 if 64BIT && MAXPHYSMEM_128GB
 
+config ARCH_FLATMEM_ENABLE
+	def_bool y
+
+config ARCH_SPARSEMEM_ENABLE
+	def_bool y
+	select SPARSEMEM_VMEMMAP_ENABLE
+
+config ARCH_SELECT_MEMORY_MODEL
+	def_bool ARCH_SPARSEMEM_ENABLE
+
 config STACKTRACE_SUPPORT
 	def_bool y
 
@@ -94,6 +114,9 @@ config PGTABLE_LEVELS
 config HAVE_KPROBES
 	def_bool n
 
+config HAVE_ARCH_PFN_VALID
+	def_bool y
+
 menu "Platform type"
 
 choice
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 16301966d65b..e1162336f5ea 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -89,6 +89,23 @@ extern pgd_t swapper_pg_dir[];
 #define __S110	PAGE_SHARED_EXEC
 #define __S111	PAGE_SHARED_EXEC
 
+#define VMALLOC_SIZE     (KERN_VIRT_SIZE >> 1)
+#define VMALLOC_END      (PAGE_OFFSET - 1)
+#define VMALLOC_START    (PAGE_OFFSET - VMALLOC_SIZE)
+
+/*
+ * Roughly size the vmemmap space to be large enough to fit enough
+ * struct pages to map half the virtual address space. Then
+ * position vmemmap directly below the VMALLOC region.
+ */
+#define VMEMMAP_SHIFT \
+	(CONFIG_VA_BITS - PAGE_SHIFT - 1 + STRUCT_PAGE_MAX_SHIFT)
+#define VMEMMAP_SIZE	(1UL << VMEMMAP_SHIFT)
+#define VMEMMAP_END	(VMALLOC_START - 1)
+#define VMEMMAP_START	(VMALLOC_START - VMEMMAP_SIZE)
+
+#define vmemmap		((struct page *)VMEMMAP_START)
+
 /*
  * ZERO_PAGE is a global shared page that is always zero,
  * used for zero-mapped memory areas, etc.
@@ -411,10 +428,6 @@ static inline void pgtable_cache_init(void)
 	/* No page table caches to initialize */
 }
 
-#define VMALLOC_SIZE     (KERN_VIRT_SIZE >> 1)
-#define VMALLOC_END      (PAGE_OFFSET - 1)
-#define VMALLOC_START    (PAGE_OFFSET - VMALLOC_SIZE)
-
 /*
  * Task size is 0x40000000000 for RV64 or 0xb800000 for RV32.
  * Note that PGDIR_SIZE must evenly divide TASK_SIZE.
diff --git a/arch/riscv/include/asm/sparsemem.h b/arch/riscv/include/asm/sparsemem.h
new file mode 100644
index 000000000000..b58ba2d9ed6e
--- /dev/null
+++ b/arch/riscv/include/asm/sparsemem.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __ASM_SPARSEMEM_H
+#define __ASM_SPARSEMEM_H
+
+#ifdef CONFIG_SPARSEMEM
+#define MAX_PHYSMEM_BITS	CONFIG_PA_BITS
+#define SECTION_SIZE_BITS	27
+#endif /* CONFIG_SPARSEMEM */
+
+#endif /* __ASM_SPARSEMEM_H */
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index fc8006a042eb..98f39adefb1a 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -193,6 +193,9 @@ static void __init setup_bootmem(void)
 		                  PFN_PHYS(end_pfn - start_pfn),
 		                  &memblock.memory, 0);
 	}
+
+	memblocks_present();
+	sparse_init();
 }
 
 void __init setup_arch(char **cmdline_p)
@@ -224,4 +227,3 @@ void __init setup_arch(char **cmdline_p)
 
 	riscv_fill_hwcap();
 }
-
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 1d9bfaff60bc..09568d5bc5b8 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -69,3 +69,11 @@ void free_initrd_mem(unsigned long start, unsigned long end)
 {
 }
 #endif /* CONFIG_BLK_DEV_INITRD */
+
+#ifdef CONFIG_SPARSEMEM
+int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
+			       struct vmem_altmap *altmap)
+{
+	return vmemmap_populate_basepages(start, end, node);
+}
+#endif
-- 
2.19.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
