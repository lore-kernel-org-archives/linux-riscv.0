Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBEA9C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Mar 2022 13:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UlNF8Q60bUbP6fUpmeDqm566rtRbhvI0k4Al3t2co1s=; b=RBdY04KMNZbHBk
	YvgG/+KQpERZkIjY1StWH3GiD4kbc5MyQniQV3+n7SQnt+dTINicKruxCobJ7zYICHhZk0+LB/uC5
	pXNR/E5bCXXAFMbVwreA2xBrvJAhmfBLGFAeDtN7zwneRt/qEaA/aEWzYiW12aVGC5Wvtdc/Gy8JM
	qEFAOUKt/OM1Fw8yU04eTopfe23zVp/SqTLVz+ECsicgB9M8CDwFH14gi1VLFFaw1KhZEx2OOOUX+
	Lup9ejvUdMGpASO489J8Aea84LVzngf/NCA7pBuh7TWehh61lNtm5OSVH2tg3IRjRymMRxygN/JT9
	ghHrTxr221DEy92K0VOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUqb0-00GKJK-N1; Thu, 17 Mar 2022 13:55:18 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUqZM-00GJUk-U3; Thu, 17 Mar 2022 13:53:39 +0000
Received: from kwepemi500024.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4KK7pr2lctzCqmy;
 Thu, 17 Mar 2022 21:51:32 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (7.193.23.234) by
 kwepemi500024.china.huawei.com (7.221.188.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 17 Mar 2022 21:53:34 +0800
Received: from localhost.localdomain (10.175.112.125) by
 kwepemm600017.china.huawei.com (7.193.23.234) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Thu, 17 Mar 2022 21:53:33 +0800
From: Tong Tiangen <tongtiangen@huawei.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Pasha Tatashin
 <pasha.tatashin@soleen.com>, Andrew Morton <akpm@linux-foundation.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Palmer Dabbelt <palmerdabbelt@google.com>, Albert Ou
 <aou@eecs.berkeley.edu>
CC: <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
 Tong Tiangen <tongtiangen@huawei.com>
Subject: [PATCH -next 3/4] arm64: mm: add support for page table check
Date: Thu, 17 Mar 2022 14:12:02 +0000
Message-ID: <20220317141203.3646253-4-tongtiangen@huawei.com>
X-Mailer: git-send-email 2.18.0.huawei.25
In-Reply-To: <20220317141203.3646253-1-tongtiangen@huawei.com>
References: <20220317141203.3646253-1-tongtiangen@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.125]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600017.china.huawei.com (7.193.23.234)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220317_065337_411413_C51421E6 
X-CRM114-Status: GOOD (  11.91  )
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

From: Kefeng Wang <wangkefeng.wang@huawei.com>

As commit d283d422c6c4 ("x86: mm: add x86_64 support for page table
check"), add some necessary page table check hooks into routines that
modify user page tables.

Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 arch/arm64/Kconfig               |  1 +
 arch/arm64/include/asm/pgtable.h | 63 +++++++++++++++++++++++++++++---
 2 files changed, 59 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 962c84952c98..1880dd0a8a11 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -91,6 +91,7 @@ config ARM64
 	select ARCH_SUPPORTS_ATOMIC_RMW
 	select ARCH_SUPPORTS_INT128 if CC_HAS_INT128
 	select ARCH_SUPPORTS_NUMA_BALANCING
+	select ARCH_SUPPORTS_PAGE_TABLE_CHECK
 	select ARCH_WANT_COMPAT_IPC_PARSE_VERSION if COMPAT
 	select ARCH_WANT_DEFAULT_BPF_JIT
 	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT
diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 94e147e5456c..2ea6b5e268d0 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -33,6 +33,7 @@
 #include <linux/mmdebug.h>
 #include <linux/mm_types.h>
 #include <linux/sched.h>
+#include <linux/page_table_check.h>
 
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 #define __HAVE_ARCH_FLUSH_PMD_TLB_RANGE
@@ -312,7 +313,7 @@ static inline void __check_racy_pte_update(struct mm_struct *mm, pte_t *ptep,
 		     __func__, pte_val(old_pte), pte_val(pte));
 }
 
-static inline void set_pte_at(struct mm_struct *mm, unsigned long addr,
+static inline void __set_pte_at(struct mm_struct *mm, unsigned long addr,
 			      pte_t *ptep, pte_t pte)
 {
 	if (pte_present(pte) && pte_user_exec(pte) && !pte_special(pte))
@@ -343,6 +344,13 @@ static inline void set_pte_at(struct mm_struct *mm, unsigned long addr,
 	set_pte(ptep, pte);
 }
 
+static inline void set_pte_at(struct mm_struct *mm, unsigned long addr,
+			      pte_t *ptep, pte_t pte)
+{
+	page_table_check_pte_set(mm, addr, ptep, pte);
+	return __set_pte_at(mm, addr, ptep, pte);
+}
+
 /*
  * Huge pte definitions.
  */
@@ -485,8 +493,19 @@ static inline pmd_t pmd_mkdevmap(pmd_t pmd)
 #define pud_pfn(pud)		((__pud_to_phys(pud) & PUD_MASK) >> PAGE_SHIFT)
 #define pfn_pud(pfn,prot)	__pud(__phys_to_pud_val((phys_addr_t)(pfn) << PAGE_SHIFT) | pgprot_val(prot))
 
-#define set_pmd_at(mm, addr, pmdp, pmd)	set_pte_at(mm, addr, (pte_t *)pmdp, pmd_pte(pmd))
-#define set_pud_at(mm, addr, pudp, pud)	set_pte_at(mm, addr, (pte_t *)pudp, pud_pte(pud))
+static inline void set_pmd_at(struct mm_struct *mm, unsigned long addr,
+			      pmd_t *pmdp, pmd_t pmd)
+{
+	page_table_check_pmd_set(mm, addr, pmdp, pmd);
+	return __set_pte_at(mm, addr, (pte_t *)pmdp, pmd_pte(pmd));
+}
+
+static inline void set_pud_at(struct mm_struct *mm, unsigned long addr,
+			      pud_t *pudp, pud_t pud)
+{
+	page_table_check_pud_set(mm, addr, pudp, pud);
+	return __set_pte_at(mm, addr, (pte_t *)pudp, pud_pte(pud));
+}
 
 #define __p4d_to_phys(p4d)	__pte_to_phys(p4d_pte(p4d))
 #define __phys_to_p4d_val(phys)	__phys_to_pte_val(phys)
@@ -628,6 +647,25 @@ static inline unsigned long pmd_page_vaddr(pmd_t pmd)
 #define pud_leaf(pud)		pud_sect(pud)
 #define pud_valid(pud)		pte_valid(pud_pte(pud))
 
+#ifdef CONFIG_PAGE_TABLE_CHECK
+static inline bool pte_user_accessible_page(pte_t pte)
+{
+	return (pte_val(pte) & PTE_VALID) && (pte_val(pte) & PTE_USER);
+}
+
+static inline bool pmd_user_accessible_page(pmd_t pmd)
+{
+	return pmd_leaf(pmd) && (pmd_val(pmd) & PTE_VALID) &&
+		(pmd_val(pmd) & PTE_USER);
+}
+
+static inline bool pud_user_accessible_page(pud_t pud)
+{
+	return pud_leaf(pud) && (pud_val(pud) & PTE_VALID) &&
+		(pud_val(pud) & PTE_USER);
+}
+#endif
+
 static inline void set_pud(pud_t *pudp, pud_t pud)
 {
 #ifdef __PAGETABLE_PUD_FOLDED
@@ -856,11 +894,21 @@ static inline int pmdp_test_and_clear_young(struct vm_area_struct *vma,
 }
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 
+static inline pte_t __ptep_get_and_clear(struct mm_struct *mm,
+				       unsigned long address, pte_t *ptep)
+{
+	return __pte(xchg_relaxed(&pte_val(*ptep), 0));
+}
+
 #define __HAVE_ARCH_PTEP_GET_AND_CLEAR
 static inline pte_t ptep_get_and_clear(struct mm_struct *mm,
 				       unsigned long address, pte_t *ptep)
 {
-	return __pte(xchg_relaxed(&pte_val(*ptep), 0));
+	pte_t pte = __ptep_get_and_clear(mm, address, ptep);
+
+	page_table_check_pte_clear(mm, address, pte);
+
+	return pte;
 }
 
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
@@ -868,7 +916,11 @@ static inline pte_t ptep_get_and_clear(struct mm_struct *mm,
 static inline pmd_t pmdp_huge_get_and_clear(struct mm_struct *mm,
 					    unsigned long address, pmd_t *pmdp)
 {
-	return pte_pmd(ptep_get_and_clear(mm, address, (pte_t *)pmdp));
+	pmd_t pmd = pte_pmd(__ptep_get_and_clear(mm, address, (pte_t *)pmdp));
+
+	page_table_check_pmd_clear(mm, address, pmd);
+
+	return pmd;
 }
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 
@@ -902,6 +954,7 @@ static inline void pmdp_set_wrprotect(struct mm_struct *mm,
 static inline pmd_t pmdp_establish(struct vm_area_struct *vma,
 		unsigned long address, pmd_t *pmdp, pmd_t pmd)
 {
+	page_table_check_pmd_set(vma->vm_mm, address, pmdp, pmd);
 	return __pmd(xchg_relaxed(&pmd_val(*pmdp), pmd_val(pmd)));
 }
 #endif
-- 
2.18.0.huawei.25


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
