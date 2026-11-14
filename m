Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55619606A32E
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Nov 2026 08:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0K1c9TbG;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=NsHziZzt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:Mime-Version:Subject:Date:From:To:
	Message-Id:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=hWQwgTfwuz8ZyBtue6qZCosQz7NxYnDNkM3ggYWidoc=; b=0K1c9TbGRkrxHNyMetEFOB3/hH
	hSOFpbMTTta19fK25b1eB+1zhyfEaFQfk7l+B5xvTfk4bYWR+nXXcGkt2w7iTjE9EGQgyMtUJcPou
	sRSE40nHpgQ8ZJKWJ7L1Se9ZwMi1kGb/9SL1jmweGQX8Yw4G0H24iGg2KIYqQ8uKcHxHCAZ/YhvFP
	ldAoaefdBTRMbuET133qA9wSbzxKWcKK34FtBpyEHjSSBds4DkpJh6OzuiZ+tLBFuIZRspeTGmQzF
	eh5Lci434tNGVf+iqYwtHDuPOaAw5bVKgghwu3IXePaFfdqTuDOKG5ppE4ZH3g/fCkC0+m46rWPax
	YkpGCplA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS99M-0000000Fax5-3L9x;
	Sat, 14 Nov 2026 08:30:16 +0000
Received: from va-1-111.ptr.blmpb.com ([209.127.230.111])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS99K-0000000Fawf-0mbT
	for linux-riscv@lists.infradead.org;
	Sat, 14 Nov 2026 08:30:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1794645005; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=X/E8rE53z/h6J1QRHBaStJJ7ym5OmsZ7MzTsgKR+Y+c=;
 b=NsHziZztJI5Sg250MxW4+6/9FYsnbDTcSPeD3zQKnCYStVNhDGwngUPlomuR6HKjiwASmc
 /PMBBHOAl1J1HQ9rnMTmCENM0x553tXlmpnD+0Ymq3nN/x4KFhJZaIrm4QvfYVqrV+PwYq
 h5A+flWzaS8dMCd9fc3IMSdIs4o6aNH4q+jl0aJkK80+SWBjA1t2c7QxuRemue4ZTpwqdJ
 PPN2ztrJdhEaIpKfA9ksCvzxkAJOBNSLSftpN9VrNoZluUkbADeIRCFwg/HWEJnLGIGSVU
 Tf1n8xTCzWmjk/S9D5PuL3f2hBMf8BG0sNyD2qeZf7h07DOD+KpxMqJEYjEMWQ==
Message-Id: <20261114082940.66057-1-zhaogongyi@bytedance.com>
X-Original-From: Zhao Gongyi <zhaogongyi@bytedance.com>
To: "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>
From: "Zhao Gongyi" <zhaogongyi@bytedance.com>
Date: Sat, 14 Nov 2026 16:29:40 +0800
Subject: [PATCH] riscv: mm: Fix /dev/mem read/write range validation
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, <linux-riscv@lists.infradead.org>, 
	<linux-kernel@vger.kernel.org>, "Zhao Gongyi" <zhaogongyi@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
X-Lms-Return-Path: <lba+26af81c0b+6b4664+lists.infradead.org+zhaogongyi@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_003014_307648_6794BDA7 
X-CRM114-Status: GOOD (  15.07  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

RISC-V uses the generic valid_phys_addr_range(), which checks only the
upper limit. A pwrite() to physical address 0 on QEMU virt can therefore
reach write_mem() -> xlate_dev_mem_ptr() -> __va(), triggering a
hardened usercopy BUG ("vmalloc 'no area'"). UART MMIO with iomem=relaxed
triggers the same fault.

Limit read/write to ranges fully covered by System RAM with valid PFNs
at or above the physical start of the linear map. This rejects holes
and MMIO before the __va() access. Keep the mmap() range policy unchanged.

MMIO read/write now returns -EFAULT even with iomem=relaxed. With
CONFIG_STRICT_DEVMEM=y, the existing RAM policy blocks the remaining
non-empty read/write ranges.

Signed-off-by: Zhao Gongyi <zhaogongyi@bytedance.com>
---
RV64 and RV32 Image builds passed. RV64 QEMU covered the faulting
physical-0 and UART-MMIO writes, RAM/hole boundaries, and MMIO mmap.

 arch/riscv/include/asm/io.h |  4 ++
 arch/riscv/mm/Makefile      |  2 +-
 arch/riscv/mm/mmap.c        | 93 +++++++++++++++++++++++++++++++++++++
 3 files changed, 98 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/mm/mmap.c

diff --git a/arch/riscv/include/asm/io.h b/arch/riscv/include/asm/io.h
index 92d5f831f..ef305ede2 100644
--- a/arch/riscv/include/asm/io.h
+++ b/arch/riscv/include/asm/io.h
@@ -32,6 +32,10 @@
 #define ioremap_wc(addr, size)	\
 	ioremap_prot((addr), (size), __pgprot(_PAGE_KERNEL_NC))
 
+#define ARCH_HAS_VALID_PHYS_ADDR_RANGE
+int valid_phys_addr_range(phys_addr_t addr, size_t size);
+int valid_mmap_phys_addr_range(unsigned long pfn, size_t size);
+
 #endif /* CONFIG_MMU */
 
 /*
diff --git a/arch/riscv/mm/Makefile b/arch/riscv/mm/Makefile
index b916a68d3..e3461bec3 100644
--- a/arch/riscv/mm/Makefile
+++ b/arch/riscv/mm/Makefile
@@ -13,7 +13,7 @@ endif
 KCOV_INSTRUMENT_init.o := n
 
 obj-y += init.o
-obj-$(CONFIG_MMU) += extable.o fault.o pageattr.o pgtable.o tlbflush.o
+obj-$(CONFIG_MMU) += extable.o fault.o mmap.o pageattr.o pgtable.o tlbflush.o
 obj-y += cacheflush.o
 obj-y += context.o
 obj-y += pmem.o
diff --git a/arch/riscv/mm/mmap.c b/arch/riscv/mm/mmap.c
new file mode 100644
index 000000000..45a0ac740
--- /dev/null
+++ b/arch/riscv/mm/mmap.c
@@ -0,0 +1,93 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/ioport.h>
+#include <linux/mm.h>
+#include <linux/pfn.h>
+#include <asm/io.h>
+#include <asm/page.h>
+
+struct devmem_ram_range {
+	unsigned long next_pfn;
+	unsigned long end_pfn;
+	bool complete;
+};
+
+static int devmem_ram_range_check(unsigned long pfn, unsigned long nr_pages,
+				  void *arg)
+{
+	struct devmem_ram_range *range = arg;
+	unsigned long last_pfn;
+
+	if (pfn != range->next_pfn)
+		return 1;
+
+	last_pfn = pfn + nr_pages - 1;
+	if (last_pfn < pfn)
+		return 1;
+	if (last_pfn > range->end_pfn)
+		last_pfn = range->end_pfn;
+
+	for (;;) {
+		if (!pfn_valid(pfn))
+			return 1;
+		if (pfn == last_pfn)
+			break;
+		pfn++;
+	}
+
+	if (last_pfn == range->end_pfn) {
+		range->complete = true;
+		return 0;
+	}
+
+	range->next_pfn = last_pfn + 1;
+	return 0;
+}
+
+/*
+ * You really should not be using read() or write() on /dev/mem. Restrict
+ * these operations to ranges that are completely covered by System RAM with
+ * valid struct page backing. Device access should use proper I/O accessors,
+ * and /dev/mem mmap() keeps its separate policy below.
+ */
+int valid_phys_addr_range(phys_addr_t addr, size_t size)
+{
+	struct devmem_ram_range range;
+	phys_addr_t end;
+	phys_addr_t linear_start;
+	unsigned long start_pfn;
+	unsigned long nr_pages;
+
+	if (!size)
+		return 1;
+
+	end = addr + size - 1;
+	if (end < addr)
+		return 0;
+
+	linear_start = __pa(PAGE_OFFSET);
+	if (addr < linear_start)
+		return 0;
+
+	start_pfn = PHYS_PFN(addr);
+	range.end_pfn = PHYS_PFN(end);
+	if (range.end_pfn < start_pfn)
+		return 0;
+
+	nr_pages = range.end_pfn - start_pfn + 1;
+	range.next_pfn = start_pfn;
+	range.complete = false;
+
+	return !walk_system_ram_range(start_pfn, nr_pages, &range,
+				      devmem_ram_range_check) &&
+	       range.complete;
+}
+
+/*
+ * Preserve the existing /dev/mem mmap() range policy. Access filtering for
+ * mmap() is still handled by range_is_allowed().
+ */
+int valid_mmap_phys_addr_range(unsigned long pfn, size_t size)
+{
+	return 1;
+}

base-commit: 79fc9d9467a113bb93f4539c11fa8c937982ff89
-- 
2.39.5 (Apple Git-154)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
