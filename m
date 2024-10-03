Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EFFACF31BA
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Oct 2024 04:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EQPfTCRNTmdN5Ng8Bk2W8oV8U/aLky/HZAph0C4lZBs=; b=DK6yAkCH62VHV+
	CGooI/w8b8Lb7PpAd+Gzqe+pFpteDCy/RmuvA2iH1q5UCKIdXoX9KLdUCLWstb65xvemEhFAUOup1
	sAnTjP+Nf0b+N9CgRYtT8urEZWTC/CNMwIWRRBEKKf07jgDr8LPPh9g72H5H00Wk/nEAiOrWAvLN2
	cuQsBl1+1LL55XWf1KFFqWM0itZMmZOBhCpIvqosxJGXFr17gSkByTDZ8wT00ptghHvGPl7zqnZa9
	PQDy7uVvXqMqI8Egpbl5B0uUVkD6wHjcAIyeIi7xPGmLi0e/zShs0mzajOC576NviadMTELn4AGno
	FDQrGP+mmYrLOMZ7lSTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swDlm-00000008AMl-1SkP;
	Thu, 03 Oct 2024 04:48:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swDlj-00000008AMF-2lzY
	for linux-riscv@lists.infradead.org;
	Thu, 03 Oct 2024 04:48:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D8AC4339;
	Wed,  2 Oct 2024 21:49:19 -0700 (PDT)
Received: from a077893.arm.com (unknown [10.163.37.202])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 90A133F64C;
	Wed,  2 Oct 2024 21:48:45 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org,
	akpm@linux-foundation.org,
	paul.walmsley@sifive.com,
	dave.hansen@linux.intel.com
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	David Hildenbrand <david@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	x86@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND PATCH] mm: Move set_pxd_safe() helpers from generic to platform
Date: Thu,  3 Oct 2024 10:18:42 +0530
Message-Id: <20241003044842.246016-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_214851_807861_A6AE2D93 
X-CRM114-Status: GOOD (  13.11  )
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

set_pxd_safe() helpers that serve a specific purpose for both x86 and riscv
platforms, do not need to be in the common memory code. Otherwise they just
unnecessarily make the common API more complicated. This moves the helpers
from common code to platform instead.

Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: David Hildenbrand <david@redhat.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: x86@kernel.org
Cc: linux-mm@kvack.org
Cc: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Suggested-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
This patch applies on v6.12-rc1

This patch is just a resend for an earlier patch

https://lore.kernel.org/all/20240920053017.2514920-1-anshuman.khandual@arm.com/

 arch/riscv/include/asm/pgtable.h | 19 ++++++++++++++++
 arch/x86/include/asm/pgtable.h   | 37 +++++++++++++++++++++++++++++++
 include/linux/pgtable.h          | 38 --------------------------------
 3 files changed, 56 insertions(+), 38 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index e79f15293492..5d7f3e8c2e50 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -963,6 +963,25 @@ void misc_mem_init(void);
 extern unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)];
 #define ZERO_PAGE(vaddr) (virt_to_page(empty_zero_page))
 
+/*
+ * Use set_p*_safe(), and elide TLB flushing, when confident that *no*
+ * TLB flush will be required as a result of the "set". For example, use
+ * in scenarios where it is known ahead of time that the routine is
+ * setting non-present entries, or re-setting an existing entry to the
+ * same value. Otherwise, use the typical "set" helpers and flush the
+ * TLB.
+ */
+#define set_p4d_safe(p4dp, p4d) \
+({ \
+	WARN_ON_ONCE(p4d_present(*p4dp) && !p4d_same(*p4dp, p4d)); \
+	set_p4d(p4dp, p4d); \
+})
+
+#define set_pgd_safe(pgdp, pgd) \
+({ \
+	WARN_ON_ONCE(pgd_present(*pgdp) && !pgd_same(*pgdp, pgd)); \
+	set_pgd(pgdp, pgd); \
+})
 #endif /* !__ASSEMBLY__ */
 
 #endif /* _ASM_RISCV_PGTABLE_H */
diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index 4c2d080d26b4..593f10aabd45 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -1775,6 +1775,43 @@ bool arch_is_platform_page(u64 paddr);
 #define arch_is_platform_page arch_is_platform_page
 #endif
 
+/*
+ * Use set_p*_safe(), and elide TLB flushing, when confident that *no*
+ * TLB flush will be required as a result of the "set". For example, use
+ * in scenarios where it is known ahead of time that the routine is
+ * setting non-present entries, or re-setting an existing entry to the
+ * same value. Otherwise, use the typical "set" helpers and flush the
+ * TLB.
+ */
+#define set_pte_safe(ptep, pte) \
+({ \
+	WARN_ON_ONCE(pte_present(*ptep) && !pte_same(*ptep, pte)); \
+	set_pte(ptep, pte); \
+})
+
+#define set_pmd_safe(pmdp, pmd) \
+({ \
+	WARN_ON_ONCE(pmd_present(*pmdp) && !pmd_same(*pmdp, pmd)); \
+	set_pmd(pmdp, pmd); \
+})
+
+#define set_pud_safe(pudp, pud) \
+({ \
+	WARN_ON_ONCE(pud_present(*pudp) && !pud_same(*pudp, pud)); \
+	set_pud(pudp, pud); \
+})
+
+#define set_p4d_safe(p4dp, p4d) \
+({ \
+	WARN_ON_ONCE(p4d_present(*p4dp) && !p4d_same(*p4dp, p4d)); \
+	set_p4d(p4dp, p4d); \
+})
+
+#define set_pgd_safe(pgdp, pgd) \
+({ \
+	WARN_ON_ONCE(pgd_present(*pgdp) && !pgd_same(*pgdp, pgd)); \
+	set_pgd(pgdp, pgd); \
+})
 #endif	/* __ASSEMBLY__ */
 
 #endif /* _ASM_X86_PGTABLE_H */
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index e8b2ac6bd2ae..23aeffd89a4e 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -1056,44 +1056,6 @@ static inline int pgd_same(pgd_t pgd_a, pgd_t pgd_b)
 }
 #endif
 
-/*
- * Use set_p*_safe(), and elide TLB flushing, when confident that *no*
- * TLB flush will be required as a result of the "set". For example, use
- * in scenarios where it is known ahead of time that the routine is
- * setting non-present entries, or re-setting an existing entry to the
- * same value. Otherwise, use the typical "set" helpers and flush the
- * TLB.
- */
-#define set_pte_safe(ptep, pte) \
-({ \
-	WARN_ON_ONCE(pte_present(*ptep) && !pte_same(*ptep, pte)); \
-	set_pte(ptep, pte); \
-})
-
-#define set_pmd_safe(pmdp, pmd) \
-({ \
-	WARN_ON_ONCE(pmd_present(*pmdp) && !pmd_same(*pmdp, pmd)); \
-	set_pmd(pmdp, pmd); \
-})
-
-#define set_pud_safe(pudp, pud) \
-({ \
-	WARN_ON_ONCE(pud_present(*pudp) && !pud_same(*pudp, pud)); \
-	set_pud(pudp, pud); \
-})
-
-#define set_p4d_safe(p4dp, p4d) \
-({ \
-	WARN_ON_ONCE(p4d_present(*p4dp) && !p4d_same(*p4dp, p4d)); \
-	set_p4d(p4dp, p4d); \
-})
-
-#define set_pgd_safe(pgdp, pgd) \
-({ \
-	WARN_ON_ONCE(pgd_present(*pgdp) && !pgd_same(*pgdp, pgd)); \
-	set_pgd(pgdp, pgd); \
-})
-
 #ifndef __HAVE_ARCH_DO_SWAP_PAGE
 static inline void arch_do_swap_page_nr(struct mm_struct *mm,
 				     struct vm_area_struct *vma,
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
