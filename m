Return-Path: <SRS0=r0AO=M3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A795C71133
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 15 Oct 2018 18:03:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D1592064A
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 15 Oct 2018 18:03:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="D3i4yDrh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="EuVg3oBi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D1592064A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=deltatee.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:MIME-Version:References:
	In-Reply-To:Message-Id:Date:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zJ+HJCX6KxgDKO+ApKbld/ek46tJ+kocVIzRa7UFrTY=; b=D3i4yDrh8Ef8G9
	SCUmyOPIy5MjcckkFgiWzNIJbWttQuRnxsO4+R01JU5P9qq73y2I56+MfQDENof3YHg3aHD6AyB2Y
	0A+v0Mekb6ApFBZZnyOqi13g9PBwfgb19XxzQrP55bEvWnI7pW4RB8DM71tPB4g+2bQyO4/2/Lbh9
	OajbgiaIrpsTN+ERceQyGpmqxqj730/ex+jyoNfKDFXXxwkQ8wFVP9AKfIz/v+uyk3AwVY1GjeGX3
	Buy4YWYJcbMj3uzshzmOddo9wE7KISZElCNSPwEuGwxsTyjRMHL/F8ynrmoo/wgXQ1HaQa9Yijz3w
	Mnxpyg1a4feS1v0VFmMA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gC7D3-0003Um-7e; Mon, 15 Oct 2018 18:03:17 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gC77f-0008TO-Dk; Mon, 15 Oct 2018 17:57:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Subject:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Cc:To:From:Sender:
 Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=n4jIzrbnBCacqLnjvleqlZ7L9vWuleOBeEwBxh/6H+A=; b=EuVg3oBiaUWux6iKzLVBmeXi+K
 TOjCmGNOBteWS16mctIuWdwBhFsd/3VSVC5+FYHTEwCnomxR75zXwucuz06mL0QDP4B/dYQVmGcuy
 2w3A/reHSp0zam/iV0h6eVQbBH1cJODgMpAcztOYjmgbUlvOSl55QcJ7J2CSolLm8ZIQccwlRpioc
 2EQYJCfjx1qKB78x6ni0dTCz4gQ9ksNCnWJYjjPmpApycdJvwkiEVnswBbZzRhzTVxBZCwDjppqO4
 OTGgwWIVX4wEmdUWzU0IW1vncobh62hu0XqLbJREhrOlueyM0sbUQY6ULMcrxYGngkrP5cx9EO+nw
 PjpjX8bw==;
Received: from ale.deltatee.com ([207.54.116.67])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gC77a-00028J-25; Mon, 15 Oct 2018 17:57:39 +0000
Received: from cgy1-donard.priv.deltatee.com ([172.16.1.31])
 by ale.deltatee.com with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <gunthorp@deltatee.com>)
 id 1gC77D-0002IN-0U; Mon, 15 Oct 2018 11:57:16 -0600
Received: from gunthorp by cgy1-donard.priv.deltatee.com with local (Exim 4.89)
 (envelope-from <gunthorp@deltatee.com>)
 id 1gC779-0002Mp-Lw; Mon, 15 Oct 2018 11:57:11 -0600
From: Logan Gunthorpe <logang@deltatee.com>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-sh@vger.kernel.org
Date: Mon, 15 Oct 2018 11:57:02 -0600
Message-Id: <20181015175702.9036-7-logang@deltatee.com>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20181015175702.9036-1-logang@deltatee.com>
References: <20181015175702.9036-1-logang@deltatee.com>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 172.16.1.31
X-SA-Exim-Rcpt-To: linux-mm@kvack.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-sh@vger.kernel.org, sbates@raithlin.com, aou@eecs.berkeley.edu,
 hch@lst.de, akpm@linux-foundation.org, arnd@arndb.de, logang@deltatee.com,
 palmer@sifive.com, andrew@sifive.com, olof@lixom.net, michaeljclark@mac.com,
 robh@kernel.org, zong@andestech.com
X-SA-Exim-Mail-From: gunthorp@deltatee.com
Subject: [PATCH v2 6/6] RISC-V: Implement sparsemem
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181015_135738_570591_72B0E7D8 
X-CRM114-Status: GOOD (  22.26  )
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
 Andrew Waterman <andrew@sifive.com>, Arnd Bergmann <arnd@arndb.de>,
 Palmer Dabbelt <palmer@sifive.com>, Stephen Bates <sbates@raithlin.com>,
 Zong Li <zong@andestech.com>, Olof Johansson <olof@lixom.net>,
 Andrew Morton <akpm@linux-foundation.org>,
 Michael Clark <michaeljclark@mac.com>, Logan Gunthorpe <logang@deltatee.com>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181015175702.oGLZqjTXMI5NwePlBSu5UCDeMBXrTDUnXBemTzFSex0@z>

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
index a344980287a5..a1b5d758a542 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -52,12 +52,32 @@ config ZONE_DMA32
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
 
@@ -92,6 +112,9 @@ config PGTABLE_LEVELS
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
index 000000000000..215530b24336
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
+#define SECTION_SIZE_BITS	30
+#endif /* CONFIG_SPARSEMEM */
+
+#endif /* __ASM_SPARSEMEM_H */
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index b2d26d9d8489..494c380e4ea6 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -205,6 +205,9 @@ static void __init setup_bootmem(void)
 		                  PFN_PHYS(end_pfn - start_pfn),
 		                  &memblock.memory, 0);
 	}
+
+	memblocks_present();
+	sparse_init();
 }
 
 void __init setup_arch(char **cmdline_p)
@@ -239,4 +242,3 @@ void __init setup_arch(char **cmdline_p)
 
 	riscv_fill_hwcap();
 }
-
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 58a522f9bcc3..5d529878667c 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -70,3 +70,11 @@ void free_initrd_mem(unsigned long start, unsigned long end)
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
