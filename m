Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55CAAC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Feb 2022 11:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OzcDUD5RCqPdJ2e8Afvv3pupUBAQArV3rvmq5+9RBjM=; b=iEwyk+YVslU8DO
	7DyeDjXinlQ8SOK9hepbC+R65xP9GLJU8l74kQk8T98NpoEkNMNCCExsdK+oPqDELRfH1UBpLkTWm
	dHxcHpmp+p7kiwhXyFzfXTd+ygevQsgGPhkIEkP7eq1+LldvMalyzQ23WW3ovu6OB+h9oiKxpavj9
	yn4KGn5cIrQxrIK1PitOioVuUkcFr/tPS729XAKG+OI8hwm7g+DMFxQsgVsJHQwzVJtR7ACrP6YC0
	BgiYnJoYcuEgzozENOxNBSJI8eeh8fZQCIhizfYNNdQ0SPXRHsMva+qVvV4WQUyPbl+2NWHpU0cKL
	sr8Oq/SX1E2eoaqT9ohA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOe0q-00BmO4-3F; Mon, 28 Feb 2022 11:16:20 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOddr-00BZYl-SK; Mon, 28 Feb 2022 10:52:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 43542106F;
 Mon, 28 Feb 2022 02:52:35 -0800 (PST)
Received: from p8cg001049571a15.arm.com (unknown [10.163.47.185])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 28EEB3F73D;
 Mon, 28 Feb 2022 02:52:26 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org,
	akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, geert@linux-m68k.org,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Christoph Hellwig <hch@infradead.org>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, sparclinux@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-s390@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-alpha@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, linux-parisc@vger.kernel.org,
 openrisc@lists.librecores.org, linux-um@lists.infradead.org,
 linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-arch@vger.kernel.org, Nick Hu <nickhu@andestech.com>
Subject: [PATCH V3 27/30] nds32/mm: Enable ARCH_HAS_VM_GET_PAGE_PROT
Date: Mon, 28 Feb 2022 16:17:50 +0530
Message-Id: <1646045273-9343-28-git-send-email-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1646045273-9343-1-git-send-email-anshuman.khandual@arm.com>
References: <1646045273-9343-1-git-send-email-anshuman.khandual@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_025236_066869_17AA97EB 
X-CRM114-Status: UNSURE (   9.23  )
X-CRM114-Notice: Please train this message.
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This defines and exports a platform specific custom vm_get_page_prot() via
subscribing ARCH_HAS_VM_GET_PAGE_PROT. Subsequently all __SXXX and __PXXX
macros can be dropped which are no longer needed.

Cc: Nick Hu <nickhu@andestech.com>
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/nds32/Kconfig               |  1 +
 arch/nds32/include/asm/pgtable.h | 17 ---------------
 arch/nds32/mm/mmap.c             | 37 ++++++++++++++++++++++++++++++++
 3 files changed, 38 insertions(+), 17 deletions(-)

diff --git a/arch/nds32/Kconfig b/arch/nds32/Kconfig
index 4d1421b18734..576e05479925 100644
--- a/arch/nds32/Kconfig
+++ b/arch/nds32/Kconfig
@@ -10,6 +10,7 @@ config NDS32
 	select ARCH_HAS_DMA_PREP_COHERENT
 	select ARCH_HAS_SYNC_DMA_FOR_CPU
 	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
+	select ARCH_HAS_VM_GET_PAGE_PROT
 	select ARCH_WANT_FRAME_POINTERS if FTRACE
 	select CLKSRC_MMIO
 	select CLONE_BACKWARDS
diff --git a/arch/nds32/include/asm/pgtable.h b/arch/nds32/include/asm/pgtable.h
index 419f984eef70..79f64ed734cb 100644
--- a/arch/nds32/include/asm/pgtable.h
+++ b/arch/nds32/include/asm/pgtable.h
@@ -152,23 +152,6 @@ extern void __pgd_error(const char *file, int line, unsigned long val);
 #endif /* __ASSEMBLY__ */
 
 /*         xwr */
-#define __P000  (PAGE_NONE | _PAGE_CACHE_SHRD)
-#define __P001  (PAGE_READ | _PAGE_CACHE_SHRD)
-#define __P010  (PAGE_COPY | _PAGE_CACHE_SHRD)
-#define __P011  (PAGE_COPY | _PAGE_CACHE_SHRD)
-#define __P100  (PAGE_EXEC | _PAGE_CACHE_SHRD)
-#define __P101  (PAGE_READ | _PAGE_E | _PAGE_CACHE_SHRD)
-#define __P110  (PAGE_COPY | _PAGE_E | _PAGE_CACHE_SHRD)
-#define __P111  (PAGE_COPY | _PAGE_E | _PAGE_CACHE_SHRD)
-
-#define __S000  (PAGE_NONE | _PAGE_CACHE_SHRD)
-#define __S001  (PAGE_READ | _PAGE_CACHE_SHRD)
-#define __S010  (PAGE_RDWR | _PAGE_CACHE_SHRD)
-#define __S011  (PAGE_RDWR | _PAGE_CACHE_SHRD)
-#define __S100  (PAGE_EXEC | _PAGE_CACHE_SHRD)
-#define __S101  (PAGE_READ | _PAGE_E | _PAGE_CACHE_SHRD)
-#define __S110  (PAGE_RDWR | _PAGE_E | _PAGE_CACHE_SHRD)
-#define __S111  (PAGE_RDWR | _PAGE_E | _PAGE_CACHE_SHRD)
 
 #ifndef __ASSEMBLY__
 /*
diff --git a/arch/nds32/mm/mmap.c b/arch/nds32/mm/mmap.c
index 1bdf5e7d1b43..0399b928948d 100644
--- a/arch/nds32/mm/mmap.c
+++ b/arch/nds32/mm/mmap.c
@@ -71,3 +71,40 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
 	info.align_offset = pgoff << PAGE_SHIFT;
 	return vm_unmapped_area(&info);
 }
+
+pgprot_t vm_get_page_prot(unsigned long vm_flags)
+{
+	switch (vm_flags & (VM_READ | VM_WRITE | VM_EXEC | VM_SHARED)) {
+	case VM_NONE:
+		return (PAGE_NONE | _PAGE_CACHE_SHRD);
+	case VM_READ:
+		return (PAGE_READ | _PAGE_CACHE_SHRD);
+	case VM_WRITE:
+	case VM_WRITE | VM_READ:
+		return (PAGE_COPY | _PAGE_CACHE_SHRD);
+	case VM_EXEC:
+		return (PAGE_EXEC | _PAGE_CACHE_SHRD);
+	case VM_EXEC | VM_READ:
+		return (PAGE_READ | _PAGE_E | _PAGE_CACHE_SHRD);
+	case VM_EXEC | VM_WRITE:
+	case VM_EXEC | VM_WRITE | VM_READ:
+		return (PAGE_COPY | _PAGE_E | _PAGE_CACHE_SHRD);
+	case VM_SHARED:
+		return (PAGE_NONE | _PAGE_CACHE_SHRD);
+	case VM_SHARED | VM_READ:
+		return (PAGE_READ | _PAGE_CACHE_SHRD);
+	case VM_SHARED | VM_WRITE:
+	case VM_SHARED | VM_WRITE | VM_READ:
+		return (PAGE_RDWR | _PAGE_CACHE_SHRD);
+	case VM_SHARED | VM_EXEC:
+		return (PAGE_EXEC | _PAGE_CACHE_SHRD);
+	case VM_SHARED | VM_EXEC | VM_READ:
+		return (PAGE_READ | _PAGE_E | _PAGE_CACHE_SHRD);
+	case VM_SHARED | VM_EXEC | VM_WRITE:
+	case VM_SHARED | VM_EXEC | VM_WRITE | VM_READ:
+		return (PAGE_RDWR | _PAGE_E | _PAGE_CACHE_SHRD);
+	default:
+		BUILD_BUG();
+	}
+}
+EXPORT_SYMBOL(vm_get_page_prot);
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
