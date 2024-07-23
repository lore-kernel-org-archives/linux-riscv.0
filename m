Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7897C3DA49
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jul 2024 06:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6y8zPiXqNKnLij+JnFwf+i7Humq0hb4b2sR8onMVFoU=; b=nofgpjU1bUluNS
	uw0jX7y5F1WGwdrWZAsg7MysA0a3Awh3DuZO4M90TJwJmdE++mv8jlzrvSya67jsbaSGhUGbb3B4C
	SV+ZvjWS5RcIWM9SW6aR7Al1MTRhGq/IHpp4Fkz9I+Oh28n1r0TqeI8zCPcDDha0cgLJQB3pNFXGu
	N1lD2DZOmp277v3f4u/aSGqMKRKhJfi2IqWkk+WJO8Iownf0sTzQgO76pQVk1PjGWJX2j5mWqdBqq
	WuApife3Zoza4w3e8fWomBSv/TWYiVP9MaA8FEONgs7dCwlZdVu0r9F5XglgxVl8JtP7xFcHBkY3L
	H4/8v4tf6aThSIGofWbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sW9Oz-0000000Bcuh-3W3i;
	Tue, 23 Jul 2024 06:53:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sW9IX-0000000BZ8z-4BeK;
	Tue, 23 Jul 2024 06:47:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 533B560D17;
	Tue, 23 Jul 2024 06:46:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDFFDC4AF12;
	Tue, 23 Jul 2024 06:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721717217;
	bh=emeCYa9405g7/z24yhBWS68KWW8+Lb3s/YOK8bOaThI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jgAoC+Hcal9bWK9k7ho6yBYf06kymWVllDUMPiOaeuFSG/wojxIxKcWyED4DoWkCl
	 ZyPnLzk1UZksRbBGs+vwS6J3QRkp5NCWUyBtV2hPxbzh2xDsZ8HA+/i+k9yezOal8u
	 zhjJSmaqAV92XU7hpKX6nY/kRVxDgU4f5bxdcxuLSfaiLoEIwLORtA6VE/d1oMTTUm
	 Pqc1pcChaNRo/+GbV4+lfx2+t+YfKTxY+qn5wYaSZxtCRIZx8059ZX38rWfyX1IoPG
	 OdZJdrg7fImaUDMXuKWgBftxFVlRAZKp9u8sSnRW4s39ogVzgJG0rOPKH30S5pFCFo
	 G7ZwK7pI1cKjg==
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dan Williams <dan.j.williams@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Mike Rapoport <rppt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Will Deacon <will@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	devicetree@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-cxl@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev,
	nvdimm@lists.linux.dev,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH v2 24/25] mm: make range-to-target_node lookup facility a part of numa_memblks
Date: Tue, 23 Jul 2024 09:41:55 +0300
Message-ID: <20240723064156.4009477-25-rppt@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240723064156.4009477-1-rppt@kernel.org>
References: <20240723064156.4009477-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240722_234658_297064_53D0BE20 
X-CRM114-Status: GOOD (  19.92  )
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

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

The x86 implementation of range-to-target_node lookup (i.e.
phys_to_target_node() and memory_add_physaddr_to_nid()) relies on
numa_memblks.

Since numa_memblks are now part of the generic code, move these
functions from x86 to mm/numa_memblks.c and select
CONFIG_NUMA_KEEP_MEMINFO when CONFIG_NUMA_MEMBLKS=y for dax and cxl.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 arch/x86/include/asm/sparsemem.h |  9 --------
 arch/x86/mm/numa.c               | 38 --------------------------------
 drivers/cxl/Kconfig              |  2 +-
 drivers/dax/Kconfig              |  2 +-
 include/linux/numa_memblks.h     |  7 ++++++
 mm/numa.c                        |  1 +
 mm/numa_memblks.c                | 38 ++++++++++++++++++++++++++++++++
 7 files changed, 48 insertions(+), 49 deletions(-)

diff --git a/arch/x86/include/asm/sparsemem.h b/arch/x86/include/asm/sparsemem.h
index 64df897c0ee3..3918c7a434f5 100644
--- a/arch/x86/include/asm/sparsemem.h
+++ b/arch/x86/include/asm/sparsemem.h
@@ -31,13 +31,4 @@
 
 #endif /* CONFIG_SPARSEMEM */
 
-#ifndef __ASSEMBLY__
-#ifdef CONFIG_NUMA_KEEP_MEMINFO
-extern int phys_to_target_node(phys_addr_t start);
-#define phys_to_target_node phys_to_target_node
-extern int memory_add_physaddr_to_nid(u64 start);
-#define memory_add_physaddr_to_nid memory_add_physaddr_to_nid
-#endif
-#endif /* __ASSEMBLY__ */
-
 #endif /* _ASM_X86_SPARSEMEM_H */
diff --git a/arch/x86/mm/numa.c b/arch/x86/mm/numa.c
index 16bc703c9272..8e790528805e 100644
--- a/arch/x86/mm/numa.c
+++ b/arch/x86/mm/numa.c
@@ -449,41 +449,3 @@ u64 __init numa_emu_dma_end(void)
 	return PFN_PHYS(MAX_DMA32_PFN);
 }
 #endif /* CONFIG_NUMA_EMU */
-
-#ifdef CONFIG_NUMA_KEEP_MEMINFO
-static int meminfo_to_nid(struct numa_meminfo *mi, u64 start)
-{
-	int i;
-
-	for (i = 0; i < mi->nr_blks; i++)
-		if (mi->blk[i].start <= start && mi->blk[i].end > start)
-			return mi->blk[i].nid;
-	return NUMA_NO_NODE;
-}
-
-int phys_to_target_node(phys_addr_t start)
-{
-	int nid = meminfo_to_nid(&numa_meminfo, start);
-
-	/*
-	 * Prefer online nodes, but if reserved memory might be
-	 * hot-added continue the search with reserved ranges.
-	 */
-	if (nid != NUMA_NO_NODE)
-		return nid;
-
-	return meminfo_to_nid(&numa_reserved_meminfo, start);
-}
-EXPORT_SYMBOL_GPL(phys_to_target_node);
-
-int memory_add_physaddr_to_nid(u64 start)
-{
-	int nid = meminfo_to_nid(&numa_meminfo, start);
-
-	if (nid == NUMA_NO_NODE)
-		nid = numa_meminfo.blk[0].nid;
-	return nid;
-}
-EXPORT_SYMBOL_GPL(memory_add_physaddr_to_nid);
-
-#endif
diff --git a/drivers/cxl/Kconfig b/drivers/cxl/Kconfig
index 99b5c25be079..29c192f20082 100644
--- a/drivers/cxl/Kconfig
+++ b/drivers/cxl/Kconfig
@@ -6,7 +6,7 @@ menuconfig CXL_BUS
 	select FW_UPLOAD
 	select PCI_DOE
 	select FIRMWARE_TABLE
-	select NUMA_KEEP_MEMINFO if (NUMA && X86)
+	select NUMA_KEEP_MEMINFO if NUMA_MEMBLKS
 	help
 	  CXL is a bus that is electrically compatible with PCI Express, but
 	  layers three protocols on that signalling (CXL.io, CXL.cache, and
diff --git a/drivers/dax/Kconfig b/drivers/dax/Kconfig
index a88744244149..d656e4c0eb84 100644
--- a/drivers/dax/Kconfig
+++ b/drivers/dax/Kconfig
@@ -30,7 +30,7 @@ config DEV_DAX_PMEM
 config DEV_DAX_HMEM
 	tristate "HMEM DAX: direct access to 'specific purpose' memory"
 	depends on EFI_SOFT_RESERVE
-	select NUMA_KEEP_MEMINFO if (NUMA && X86)
+	select NUMA_KEEP_MEMINFO if NUMA_MEMBLKS
 	default DEV_DAX
 	help
 	  EFI 2.8 platforms, and others, may advertise 'specific purpose'
diff --git a/include/linux/numa_memblks.h b/include/linux/numa_memblks.h
index 5c6e12ad0b7a..17d4bcc34091 100644
--- a/include/linux/numa_memblks.h
+++ b/include/linux/numa_memblks.h
@@ -46,6 +46,13 @@ static inline int numa_emu_cmdline(char *str)
 }
 #endif /* CONFIG_NUMA_EMU */
 
+#ifdef CONFIG_NUMA_KEEP_MEMINFO
+extern int phys_to_target_node(phys_addr_t start);
+#define phys_to_target_node phys_to_target_node
+extern int memory_add_physaddr_to_nid(u64 start);
+#define memory_add_physaddr_to_nid memory_add_physaddr_to_nid
+#endif /* CONFIG_NUMA_KEEP_MEMINFO */
+
 #endif /* CONFIG_NUMA_MEMBLKS */
 
 #endif	/* __NUMA_MEMBLKS_H */
diff --git a/mm/numa.c b/mm/numa.c
index 67a0d7734a98..da27eb151dc5 100644
--- a/mm/numa.c
+++ b/mm/numa.c
@@ -3,6 +3,7 @@
 #include <linux/memblock.h>
 #include <linux/printk.h>
 #include <linux/numa.h>
+#include <linux/numa_memblks.h>
 
 struct pglist_data *node_data[MAX_NUMNODES];
 EXPORT_SYMBOL(node_data);
diff --git a/mm/numa_memblks.c b/mm/numa_memblks.c
index e4358ad92233..8609c6eb3998 100644
--- a/mm/numa_memblks.c
+++ b/mm/numa_memblks.c
@@ -528,3 +528,41 @@ int __init numa_fill_memblks(u64 start, u64 end)
 	}
 	return 0;
 }
+
+#ifdef CONFIG_NUMA_KEEP_MEMINFO
+static int meminfo_to_nid(struct numa_meminfo *mi, u64 start)
+{
+	int i;
+
+	for (i = 0; i < mi->nr_blks; i++)
+		if (mi->blk[i].start <= start && mi->blk[i].end > start)
+			return mi->blk[i].nid;
+	return NUMA_NO_NODE;
+}
+
+int phys_to_target_node(phys_addr_t start)
+{
+	int nid = meminfo_to_nid(&numa_meminfo, start);
+
+	/*
+	 * Prefer online nodes, but if reserved memory might be
+	 * hot-added continue the search with reserved ranges.
+	 */
+	if (nid != NUMA_NO_NODE)
+		return nid;
+
+	return meminfo_to_nid(&numa_reserved_meminfo, start);
+}
+EXPORT_SYMBOL_GPL(phys_to_target_node);
+
+int memory_add_physaddr_to_nid(u64 start)
+{
+	int nid = meminfo_to_nid(&numa_meminfo, start);
+
+	if (nid == NUMA_NO_NODE)
+		nid = numa_meminfo.blk[0].nid;
+	return nid;
+}
+EXPORT_SYMBOL_GPL(memory_add_physaddr_to_nid);
+
+#endif /* CONFIG_NUMA_KEEP_MEMINFO */
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
