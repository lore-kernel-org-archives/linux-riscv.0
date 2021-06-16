Return-Path: <SRS0=JO3K=LK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17594C48BE5
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jun 2021 23:18:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4F6E611BE
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jun 2021 23:18:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D4F6E611BE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:To:From:
	Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CWX8hZ7KfUxJrBvoJC1KcgrJh88Yf5dzWeypRurPbVA=; b=TRjIbl1bkoBICu
	1NjrXFQq//9saHIhTosm/AC0Hh60lh5Ep5MYPw9KdKf3vz+yagNeMv35fyWixnynyssDVVAz5TJfV
	DLRX4HnhnR3KI2N+98/zjyIeiile8BbWqeMerTWS0SrUslLJKttmjc9Vvls9GbUcxjdWjXMr8Ofpv
	rBRl/O9qNXPCZ4VR0Gi5M67zKQKBcGubUf3PdYDqCShN6fxDNy8aQZda0N7HWAqL/VLsHzLvj53f8
	oL//rnhii2OOID3Vnrrft3oJXnLqs9fmcM8/1+Sk1cHbKoVEiIOccaMnaVH59YYRvk+QlQSe6E3a8
	D48UoNVZR/bDR4xyihlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltenT-0085it-CA; Wed, 16 Jun 2021 23:18:11 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltedm-0081Un-SP; Wed, 16 Jun 2021 23:08:12 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id CA07E613C2;
 Wed, 16 Jun 2021 23:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1623884890;
 bh=ofHW9QoDhGvklk0ZP/zeybJxASFeHfOy0FReGRQvBOs=;
 h=Date:From:To:Subject:From;
 b=hhu/kuf3N5xUW6JmaTyHWVlYmy/A9OvpWfe2Cy4Mr3trVhQDM7YluiBtbOagT9PFN
 h0SE5JBC3RQG17nJrV+1Qne1ORTp0lAQLWqFl7V1YJxx98b4k54CpZea6MhOe6WP3v
 Lc8ZvRoIs2DB6HoU7bPaII6eUO60AYUZLlaFj5ZQ=
Date: Wed, 16 Jun 2021 16:08:09 -0700
From: akpm@linux-foundation.org
To: aneesh.kumar@linux.ibm.com, linux-alpha@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-sh@vger.kernel.org, linux-um@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, mm-commits@vger.kernel.org,
 sparclinux@vger.kernel.org
Subject: [to-be-updated]
 mm-rename-p4d_page_vaddr-to-p4d_pgtable-and-make-it-return-pud_t.patch
 removed from -mm tree
Message-ID: <20210616230809.aAS-HuAzz%akpm@linux-foundation.org>
User-Agent: s-nail v14.8.16
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210616_160811_018095_17ADC4F8 
X-CRM114-Status: GOOD (  13.91  )
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


The patch titled
     Subject: mm: rename p4d_page_vaddr to p4d_pgtable and make it return pud_t *
has been removed from the -mm tree.  Its filename was
     mm-rename-p4d_page_vaddr-to-p4d_pgtable-and-make-it-return-pud_t.patch

This patch was dropped because an updated version will be merged

------------------------------------------------------
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: mm: rename p4d_page_vaddr to p4d_pgtable and make it return pud_t *

No functional change in this patch.

Link: https://lkml.kernel.org/r/20210615110859.320299-2-aneesh.kumar@linux.ibm.com
Link: https://lore.kernel.org/linuxppc-dev/CAHk-=wi+J+iodze9FtjM3Zi4j4OeS+qqbKxME9QN4roxPEXH9Q@mail.gmail.com/
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Cc: <linux-alpha@vger.kernel.org>
Cc: <linux-kernel@vger.kernel.org>
Cc: <linux-arm-kernel@lists.infradead.org>
Cc: <linux-ia64@vger.kernel.org>
Cc: <linux-m68k@lists.linux-m68k.org>
Cc: <linux-mips@vger.kernel.org>
Cc: <linux-parisc@vger.kernel.org>
Cc: <linuxppc-dev@lists.ozlabs.org>
Cc: <linux-riscv@lists.infradead.org>
Cc: <linux-sh@vger.kernel.org>
Cc: <sparclinux@vger.kernel.org>
Cc: <linux-um@lists.infradead.org>
Cc: <linux-arch@vger.kernel.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 arch/arm64/include/asm/pgtable.h                |    4 ++--
 arch/ia64/include/asm/pgtable.h                 |    2 +-
 arch/mips/include/asm/pgtable-64.h              |    4 ++--
 arch/powerpc/include/asm/book3s/64/pgtable.h    |    5 ++++-
 arch/powerpc/include/asm/nohash/64/pgtable-4k.h |    6 +++++-
 arch/powerpc/mm/book3s64/radix_pgtable.c        |    2 +-
 arch/powerpc/mm/pgtable_64.c                    |    2 +-
 arch/sparc/include/asm/pgtable_64.h             |    4 ++--
 arch/x86/include/asm/pgtable.h                  |    4 ++--
 arch/x86/mm/init_64.c                           |    4 ++--
 include/asm-generic/pgtable-nop4d.h             |    2 +-
 include/asm-generic/pgtable-nopud.h             |    2 +-
 include/linux/pgtable.h                         |    2 +-
 13 files changed, 25 insertions(+), 18 deletions(-)

--- a/arch/arm64/include/asm/pgtable.h~mm-rename-p4d_page_vaddr-to-p4d_pgtable-and-make-it-return-pud_t
+++ a/arch/arm64/include/asm/pgtable.h
@@ -694,9 +694,9 @@ static inline phys_addr_t p4d_page_paddr
 	return __p4d_to_phys(p4d);
 }
 
-static inline unsigned long p4d_page_vaddr(p4d_t p4d)
+static inline pud_t *p4d_pgtable(p4d_t p4d)
 {
-	return (unsigned long)__va(p4d_page_paddr(p4d));
+	return (pud_t *)__va(p4d_page_paddr(p4d));
 }
 
 /* Find an entry in the frst-level page table. */
--- a/arch/ia64/include/asm/pgtable.h~mm-rename-p4d_page_vaddr-to-p4d_pgtable-and-make-it-return-pud_t
+++ a/arch/ia64/include/asm/pgtable.h
@@ -281,7 +281,7 @@ ia64_phys_addr_valid (unsigned long addr
 #define p4d_bad(p4d)			(!ia64_phys_addr_valid(p4d_val(p4d)))
 #define p4d_present(p4d)		(p4d_val(p4d) != 0UL)
 #define p4d_clear(p4dp)			(p4d_val(*(p4dp)) = 0UL)
-#define p4d_page_vaddr(p4d)		((unsigned long) __va(p4d_val(p4d) & _PFN_MASK))
+#define p4d_pgtable(p4d)		((pud_t *) __va(p4d_val(p4d) & _PFN_MASK))
 #define p4d_page(p4d)			virt_to_page((p4d_val(p4d) + PAGE_OFFSET))
 #endif
 
--- a/arch/mips/include/asm/pgtable-64.h~mm-rename-p4d_page_vaddr-to-p4d_pgtable-and-make-it-return-pud_t
+++ a/arch/mips/include/asm/pgtable-64.h
@@ -209,9 +209,9 @@ static inline void p4d_clear(p4d_t *p4dp
 	p4d_val(*p4dp) = (unsigned long)invalid_pud_table;
 }
 
-static inline unsigned long p4d_page_vaddr(p4d_t p4d)
+static inline pud_t *p4d_pgtable(p4d_t p4d)
 {
-	return p4d_val(p4d);
+	return (pud_t *)p4d_val(p4d);
 }
 
 #define p4d_phys(p4d)		virt_to_phys((void *)p4d_val(p4d))
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h~mm-rename-p4d_page_vaddr-to-p4d_pgtable-and-make-it-return-pud_t
+++ a/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -1048,7 +1048,10 @@ extern struct page *p4d_page(p4d_t p4d);
 /* Pointers in the page table tree are physical addresses */
 #define __pgtable_ptr_val(ptr)	__pa(ptr)
 
-#define p4d_page_vaddr(p4d)	__va(p4d_val(p4d) & ~P4D_MASKED_BITS)
+static inline pud_t *p4d_pgtable(p4d_t p4d)
+{
+	return (pud_t *)__va(p4d_val(p4d) & ~P4D_MASKED_BITS);
+}
 
 static inline pmd_t *pud_pgtable(pud_t pud)
 {
--- a/arch/powerpc/include/asm/nohash/64/pgtable-4k.h~mm-rename-p4d_page_vaddr-to-p4d_pgtable-and-make-it-return-pud_t
+++ a/arch/powerpc/include/asm/nohash/64/pgtable-4k.h
@@ -56,10 +56,14 @@
 #define p4d_none(p4d)		(!p4d_val(p4d))
 #define p4d_bad(p4d)		(p4d_val(p4d) == 0)
 #define p4d_present(p4d)	(p4d_val(p4d) != 0)
-#define p4d_page_vaddr(p4d)	(p4d_val(p4d) & ~P4D_MASKED_BITS)
 
 #ifndef __ASSEMBLY__
 
+static inline pud_t *p4d_pgtable(p4d_t p4d)
+{
+	return (pud_t *) (p4d_val(p4d) & ~P4D_MASKED_BITS);
+}
+
 static inline void p4d_clear(p4d_t *p4dp)
 {
 	*p4dp = __p4d(0);
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c~mm-rename-p4d_page_vaddr-to-p4d_pgtable-and-make-it-return-pud_t
+++ a/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -860,7 +860,7 @@ static void __meminit remove_pagetable(u
 			continue;
 		}
 
-		pud_base = (pud_t *)p4d_page_vaddr(*p4d);
+		pud_base = p4d_pgtable(*p4d);
 		remove_pud_table(pud_base, addr, next);
 		free_pud_table(pud_base, p4d);
 	}
--- a/arch/powerpc/mm/pgtable_64.c~mm-rename-p4d_page_vaddr-to-p4d_pgtable-and-make-it-return-pud_t
+++ a/arch/powerpc/mm/pgtable_64.c
@@ -105,7 +105,7 @@ struct page *p4d_page(p4d_t p4d)
 		VM_WARN_ON(!p4d_huge(p4d));
 		return pte_page(p4d_pte(p4d));
 	}
-	return virt_to_page(p4d_page_vaddr(p4d));
+	return virt_to_page(p4d_pgtable(p4d));
 }
 #endif
 
--- a/arch/sparc/include/asm/pgtable_64.h~mm-rename-p4d_page_vaddr-to-p4d_pgtable-and-make-it-return-pud_t
+++ a/arch/sparc/include/asm/pgtable_64.h
@@ -856,8 +856,8 @@ static inline pmd_t *pud_pgtable(pud_t p
 #define pmd_clear(pmdp)			(pmd_val(*(pmdp)) = 0UL)
 #define pud_present(pud)		(pud_val(pud) != 0U)
 #define pud_clear(pudp)			(pud_val(*(pudp)) = 0UL)
-#define p4d_page_vaddr(p4d)		\
-	((unsigned long) __va(p4d_val(p4d)))
+#define p4d_pgtable(p4d)		\
+	((pud_t *) __va(p4d_val(p4d)))
 #define p4d_present(p4d)		(p4d_val(p4d) != 0U)
 #define p4d_clear(p4dp)			(p4d_val(*(p4dp)) = 0UL)
 
--- a/arch/x86/include/asm/pgtable.h~mm-rename-p4d_page_vaddr-to-p4d_pgtable-and-make-it-return-pud_t
+++ a/arch/x86/include/asm/pgtable.h
@@ -906,9 +906,9 @@ static inline int p4d_present(p4d_t p4d)
 	return p4d_flags(p4d) & _PAGE_PRESENT;
 }
 
-static inline unsigned long p4d_page_vaddr(p4d_t p4d)
+static inline pud_t *p4d_pgtable(p4d_t p4d)
 {
-	return (unsigned long)__va(p4d_val(p4d) & p4d_pfn_mask(p4d));
+	return (pud_t *)__va(p4d_val(p4d) & p4d_pfn_mask(p4d));
 }
 
 /*
--- a/arch/x86/mm/init_64.c~mm-rename-p4d_page_vaddr-to-p4d_pgtable-and-make-it-return-pud_t
+++ a/arch/x86/mm/init_64.c
@@ -195,8 +195,8 @@ static void sync_global_pgds_l4(unsigned
 			spin_lock(pgt_lock);
 
 			if (!p4d_none(*p4d_ref) && !p4d_none(*p4d))
-				BUG_ON(p4d_page_vaddr(*p4d)
-				       != p4d_page_vaddr(*p4d_ref));
+				BUG_ON(p4d_pgtable(*p4d)
+				       != p4d_pgtable(*p4d_ref));
 
 			if (p4d_none(*p4d))
 				set_p4d(p4d, *p4d_ref);
--- a/include/asm-generic/pgtable-nop4d.h~mm-rename-p4d_page_vaddr-to-p4d_pgtable-and-make-it-return-pud_t
+++ a/include/asm-generic/pgtable-nop4d.h
@@ -42,7 +42,7 @@ static inline p4d_t *p4d_offset(pgd_t *p
 #define __p4d(x)				((p4d_t) { __pgd(x) })
 
 #define pgd_page(pgd)				(p4d_page((p4d_t){ pgd }))
-#define pgd_page_vaddr(pgd)			(p4d_page_vaddr((p4d_t){ pgd }))
+#define pgd_page_vaddr(pgd)			(p4d_pgtable((p4d_t){ pgd }))
 
 /*
  * allocating and freeing a p4d is trivial: the 1-entry p4d is
--- a/include/asm-generic/pgtable-nopud.h~mm-rename-p4d_page_vaddr-to-p4d_pgtable-and-make-it-return-pud_t
+++ a/include/asm-generic/pgtable-nopud.h
@@ -49,7 +49,7 @@ static inline pud_t *pud_offset(p4d_t *p
 #define __pud(x)				((pud_t) { __p4d(x) })
 
 #define p4d_page(p4d)				(pud_page((pud_t){ p4d }))
-#define p4d_page_vaddr(p4d)			(pud_pgtable((pud_t){ p4d }))
+#define p4d_pgtable(p4d)			((pud_t *)(pud_pgtable((pud_t){ p4d })))
 
 /*
  * allocating and freeing a pud is trivial: the 1-entry pud is
--- a/include/linux/pgtable.h~mm-rename-p4d_page_vaddr-to-p4d_pgtable-and-make-it-return-pud_t
+++ a/include/linux/pgtable.h
@@ -114,7 +114,7 @@ static inline pmd_t *pmd_offset(pud_t *p
 #ifndef pud_offset
 static inline pud_t *pud_offset(p4d_t *p4d, unsigned long address)
 {
-	return (pud_t *)p4d_page_vaddr(*p4d) + pud_index(address);
+	return p4d_pgtable(*p4d) + pud_index(address);
 }
 #define pud_offset pud_offset
 #endif
_

Patches currently in -mm which might be from aneesh.kumar@linux.ibm.com are

mm-rename-p4d_page_vaddr-to-p4d_pgtable-and-make-it-return-pud_t-fix.patch


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
