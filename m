Return-Path: <SRS0=uc63=OT=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AB98C04EB8
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 10 Dec 2018 06:23:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46633205C9
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 10 Dec 2018 06:23:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Kqiz5Y4B"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46633205C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=upmem.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=VLLMNbZrejTwl5dIM6e+QElMxKgzvS+ZkqUl47BSrUo=; b=Kqiz5Y4BuO991ODuXcrRDxb38y
	acgJMYO2KxXlst7fdS2rTnhii7FheRd1ooirgYD6DOGrVeshVhlheseaNkyNXUDCU1pGyl0xsO1ms
	fQhP5wlnwo/TkuO1s2OY2PuwUvmwF9hWmHyXzj6Tjdqei/XWhesBOro1iJfAsJgs3tmAqT1OOdMjP
	SQR5HtDJB+If86FGAm9R70K8BFDR5tDR1uX7G4NJKsJn3zKHSYP2SPB3fJfkKppq0yBQQnE+Zc9jm
	Am4+K2VmG+E1Ya3acbjGpgWX6xr5j31IRPWUQqeP8AkR9+NVL9urfpaclUpUZ6AQLgE5zO0THS+O5
	vKji6bSg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gWEyS-0003Ej-NV; Mon, 10 Dec 2018 06:23:24 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gWEyP-0003E6-5O
 for linux-riscv@lists.infradead.org; Mon, 10 Dec 2018 06:23:23 +0000
X-Originating-IP: 79.86.19.127
Received: from alex.numericable.fr (127.19.86.79.rev.sfr.net [79.86.19.127])
 (Authenticated sender: alex@ghiti.fr)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id C3A43240003;
 Mon, 10 Dec 2018 06:22:58 +0000 (UTC)
From: Alexandre Ghiti <aghiti@upmem.com>
To: palmer@sifive.com
Subject: [PATCH 1/3] riscv: Introduce huge page support for 32/64bit kernel
Date: Mon, 10 Dec 2018 06:21:44 +0000
Message-Id: <20181210062146.24951-2-aghiti@upmem.com>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20181210062146.24951-1-aghiti@upmem.com>
References: <20181210062146.24951-1-aghiti@upmem.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181209_222321_487480_57CDBFD8 
X-CRM114-Status: GOOD (  12.36  )
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
Cc: aou@eecs.berkeley.edu, catalin.marinas@arm.com, ndesaulniers@google.com,
 linux-riscv@lists.infradead.org, Alexandre Ghiti <aghiti@upmem.com>,
 atish.patra@wdc.com, akpm@linux-foundation.org, mingo@kernel.org,
 mike.kravetz@oracle.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

This patch implements both 4MB huge page support for 32bit kernel
and 2MB/1GB huge pages support for 64bit kernel.

Signed-off-by: Alexandre Ghiti <aghiti@upmem.com>
---
 arch/riscv/Kconfig               |  7 +++++++
 arch/riscv/include/asm/hugetlb.h | 22 ++++++++++++++++++++++
 arch/riscv/include/asm/page.h    | 10 ++++++++++
 arch/riscv/include/asm/pgtable.h |  6 +++++-
 arch/riscv/mm/Makefile           |  2 ++
 arch/riscv/mm/hugetlbpage.c      | 36 ++++++++++++++++++++++++++++++++++++
 6 files changed, 82 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/include/asm/hugetlb.h
 create mode 100644 arch/riscv/mm/hugetlbpage.c

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 55da93f4e818..7bb21533d927 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -57,6 +57,12 @@ config PAGE_OFFSET
 	default 0xffffffff80000000 if 64BIT && MAXPHYSMEM_2GB
 	default 0xffffffe000000000 if 64BIT && MAXPHYSMEM_128GB
 
+config ARCH_WANT_GENERAL_HUGETLB
+	def_bool y
+
+config SYS_SUPPORTS_HUGETLBFS
+	def_bool y
+
 config STACKTRACE_SUPPORT
 	def_bool y
 
@@ -118,6 +124,7 @@ config ARCH_RV64I
 	select HAVE_DYNAMIC_FTRACE
 	select HAVE_DYNAMIC_FTRACE_WITH_REGS
 	select SWIOTLB
+	select ARCH_HAS_GIGANTIC_PAGE if (MEMORY_ISOLATION && COMPACTION) || CMA
 
 endchoice
 
diff --git a/arch/riscv/include/asm/hugetlb.h b/arch/riscv/include/asm/hugetlb.h
new file mode 100644
index 000000000000..b7d88cf4e315
--- /dev/null
+++ b/arch/riscv/include/asm/hugetlb.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_RISCV_HUGETLB_H
+#define _ASM_RISCV_HUGETLB_H
+
+#include <asm-generic/hugetlb.h>
+#include <asm/page.h>
+
+static inline int is_hugepage_only_range(struct mm_struct *mm,
+					 unsigned long addr,
+					 unsigned long len) {
+	return 0;
+}
+
+static inline void arch_clear_hugepage_flags(struct page *page)
+{
+}
+
+#ifdef CONFIG_ARCH_HAS_GIGANTIC_PAGE
+static inline bool gigantic_page_supported(void) { return true; }
+#endif
+
+#endif /* _ASM_RISCV_HUGETLB_H */
diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
index 06cfbb3aacbb..ceaa73b82b25 100644
--- a/arch/riscv/include/asm/page.h
+++ b/arch/riscv/include/asm/page.h
@@ -24,6 +24,16 @@
 #define PAGE_SIZE	(_AC(1, UL) << PAGE_SHIFT)
 #define PAGE_MASK	(~(PAGE_SIZE - 1))
 
+#ifdef CONFIG_64BIT
+#define HUGE_MAX_HSTATE		2
+#else
+#define HUGE_MAX_HSTATE		1
+#endif
+#define HPAGE_SHIFT		PMD_SHIFT
+#define HPAGE_SIZE		(_AC(1, UL) << HPAGE_SHIFT)
+#define HPAGE_MASK              (~(HPAGE_SIZE - 1))
+#define HUGETLB_PAGE_ORDER      (HPAGE_SHIFT - PAGE_SHIFT)
+
 /*
  * PAGE_OFFSET -- the first address of the first page of memory.
  * When not using MMU this corresponds to the first free page in
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 16301966d65b..50ea3d6e7de7 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -121,7 +121,6 @@ static inline void pmd_clear(pmd_t *pmdp)
 	set_pmd(pmdp, __pmd(0));
 }
 
-
 static inline pgd_t pfn_pgd(unsigned long pfn, pgprot_t prot)
 {
 	return __pgd((pfn << _PAGE_PFN_SHIFT) | pgprot_val(prot));
@@ -258,6 +257,11 @@ static inline pte_t pte_mkspecial(pte_t pte)
 	return __pte(pte_val(pte) | _PAGE_SPECIAL);
 }
 
+static inline pte_t pte_mkhuge(pte_t pte)
+{
+	return pte;
+}
+
 /* Modify page protection bits */
 static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
 {
diff --git a/arch/riscv/mm/Makefile b/arch/riscv/mm/Makefile
index eb22ab49b3e0..eeadb130d7cf 100644
--- a/arch/riscv/mm/Makefile
+++ b/arch/riscv/mm/Makefile
@@ -3,3 +3,5 @@ obj-y += fault.o
 obj-y += extable.o
 obj-y += ioremap.o
 obj-y += cacheflush.o
+
+obj-$(CONFIG_HUGETLB_PAGE) += hugetlbpage.o
diff --git a/arch/riscv/mm/hugetlbpage.c b/arch/riscv/mm/hugetlbpage.c
new file mode 100644
index 000000000000..7bac8b22d486
--- /dev/null
+++ b/arch/riscv/mm/hugetlbpage.c
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <linux/hugetlb.h>
+#include <linux/err.h>
+
+int pud_huge(pud_t pud)
+{
+	return pud_present(pud)
+		&& (pud_val(pud) & (_PAGE_READ | _PAGE_WRITE | _PAGE_EXEC));
+}
+
+int pmd_huge(pmd_t pmd)
+{
+	return pmd_present(pmd)
+		&& (pmd_val(pmd) & (_PAGE_READ | _PAGE_WRITE | _PAGE_EXEC));
+}
+
+static __init int setup_hugepagesz(char *opt)
+{
+	unsigned long ps = memparse(opt, &opt);
+
+	if (ps == HPAGE_SIZE) {
+		hugetlb_add_hstate(HPAGE_SHIFT - PAGE_SHIFT);
+#if defined(CONFIG_64BIT)
+	} else if (ps == PUD_SIZE) {
+		hugetlb_add_hstate(PUD_SHIFT - PAGE_SHIFT);
+#endif
+	} else {
+		hugetlb_bad_size();
+		printk(KERN_ERR "hugepagesz: Unsupported page size %lu M\n",
+			ps >> 20);
+		return 0;
+	}
+
+	return 1;
+}
+__setup("hugepagesz=", setup_hugepagesz);
-- 
2.16.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
