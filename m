Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D115DC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Mar 2022 01:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IdHOdoazzwVYhIAgxrP6DbvXMu22Vg4WZRj5UmuszuQ=; b=sA/pHQU5Kr9AYY
	YtYW9ObJ7RhDZsjkOoP+43qbfvXTdHUssj19cqS1UgyVqblAk3kzZ7p1Fa7VHfPx26mESXizS8/bw
	Z7X6DF0onB+LG30PhVmY8GDmczwgdPS3e2tUTYph1MoGGOSq+lcm0Vo03/foeHyH5htdqeoifMtOM
	TXEIfNU3mSusasDO32vKSbh1+aPdGm7Vfl4/MDluBhb+4XyVhqsYarrQ6tLMIXMz3DSejfEPy3pw7
	gkCkAz4sNes/MrOB1c4Dqe/r//SjAc9cORAQW5LX+F1oJbgE8ByhGqbigudy4q4qysFbYT5gI6LzK
	p9zJ38ACf2kTr+fWSORg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYeHv-006zSM-Ac; Mon, 28 Mar 2022 01:35:19 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYeGm-006yuk-AS; Mon, 28 Mar 2022 01:34:11 +0000
Received: from kwepemi500024.china.huawei.com (unknown [172.30.72.57])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4KRZr84wvGzBrX2;
 Mon, 28 Mar 2022 09:30:00 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (7.193.23.234) by
 kwepemi500024.china.huawei.com (7.221.188.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 28 Mar 2022 09:34:01 +0800
Received: from localhost.localdomain (10.175.112.125) by
 kwepemm600017.china.huawei.com (7.193.23.234) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 28 Mar 2022 09:34:00 +0800
From: Tong Tiangen <tongtiangen@huawei.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Pasha Tatashin
 <pasha.tatashin@soleen.com>, Andrew Morton <akpm@linux-foundation.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
CC: <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
 Tong Tiangen <tongtiangen@huawei.com>
Subject: [PATCH -next v3 2/4] mm: page_table_check: add hooks to public helpers
Date: Mon, 28 Mar 2022 01:52:40 +0000
Message-ID: <20220328015242.1136836-3-tongtiangen@huawei.com>
X-Mailer: git-send-email 2.18.0.huawei.25
In-Reply-To: <20220328015242.1136836-1-tongtiangen@huawei.com>
References: <20220328015242.1136836-1-tongtiangen@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.125]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600017.china.huawei.com (7.193.23.234)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220327_183408_739215_0EEB41E4 
X-CRM114-Status: GOOD (  10.91  )
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

Move ptep_clear() to the include/linux/pgtable.h and add page table check
relate hooks to some helpers, it's prepare for support page table check
feature on new architecture.

Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>
---
 arch/x86/include/asm/pgtable.h | 10 ----------
 include/linux/pgtable.h        | 26 ++++++++++++++++++--------
 2 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index 8cd6514e3052..8c85f2eabbaa 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -1077,16 +1077,6 @@ static inline pte_t ptep_get_and_clear_full(struct mm_struct *mm,
 	return pte;
 }
 
-#define __HAVE_ARCH_PTEP_CLEAR
-static inline void ptep_clear(struct mm_struct *mm, unsigned long addr,
-			      pte_t *ptep)
-{
-	if (IS_ENABLED(CONFIG_PAGE_TABLE_CHECK))
-		ptep_get_and_clear(mm, addr, ptep);
-	else
-		pte_clear(mm, addr, ptep);
-}
-
 #define __HAVE_ARCH_PTEP_SET_WRPROTECT
 static inline void ptep_set_wrprotect(struct mm_struct *mm,
 				      unsigned long addr, pte_t *ptep)
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index f4f4077b97aa..c7556fa53986 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -12,6 +12,7 @@
 #include <linux/bug.h>
 #include <linux/errno.h>
 #include <asm-generic/pgtable_uffd.h>
+#include <linux/page_table_check.h>
 
 #if 5 - defined(__PAGETABLE_P4D_FOLDED) - defined(__PAGETABLE_PUD_FOLDED) - \
 	defined(__PAGETABLE_PMD_FOLDED) != CONFIG_PGTABLE_LEVELS
@@ -259,14 +260,6 @@ static inline int pmdp_clear_flush_young(struct vm_area_struct *vma,
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 #endif
 
-#ifndef __HAVE_ARCH_PTEP_CLEAR
-static inline void ptep_clear(struct mm_struct *mm, unsigned long addr,
-			      pte_t *ptep)
-{
-	pte_clear(mm, addr, ptep);
-}
-#endif
-
 #ifndef __HAVE_ARCH_PTEP_GET_AND_CLEAR
 static inline pte_t ptep_get_and_clear(struct mm_struct *mm,
 				       unsigned long address,
@@ -274,10 +267,22 @@ static inline pte_t ptep_get_and_clear(struct mm_struct *mm,
 {
 	pte_t pte = *ptep;
 	pte_clear(mm, address, ptep);
+	page_table_check_pte_clear(mm, address, pte);
 	return pte;
 }
 #endif
 
+#ifndef __HAVE_ARCH_PTEP_CLEAR
+static inline void ptep_clear(struct mm_struct *mm, unsigned long addr,
+			      pte_t *ptep)
+{
+	if (IS_ENABLED(CONFIG_PAGE_TABLE_CHECK))
+		ptep_get_and_clear(mm, addr, ptep);
+	else
+		pte_clear(mm, addr, ptep);
+}
+#endif
+
 #ifndef __HAVE_ARCH_PTEP_GET
 static inline pte_t ptep_get(pte_t *ptep)
 {
@@ -347,7 +352,10 @@ static inline pmd_t pmdp_huge_get_and_clear(struct mm_struct *mm,
 					    pmd_t *pmdp)
 {
 	pmd_t pmd = *pmdp;
+
 	pmd_clear(pmdp);
+	page_table_check_pmd_clear(mm, address, pmd);
+
 	return pmd;
 }
 #endif /* __HAVE_ARCH_PMDP_HUGE_GET_AND_CLEAR */
@@ -359,6 +367,8 @@ static inline pud_t pudp_huge_get_and_clear(struct mm_struct *mm,
 	pud_t pud = *pudp;
 
 	pud_clear(pudp);
+	page_table_check_pud_clear(mm, address, pud);
+
 	return pud;
 }
 #endif /* __HAVE_ARCH_PUDP_HUGE_GET_AND_CLEAR */
-- 
2.18.0.huawei.25


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
