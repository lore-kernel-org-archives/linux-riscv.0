Return-Path: <SRS0=p8lL=J3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 508B0C433ED
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Apr 2021 07:57:13 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94507613CA
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Apr 2021 07:57:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94507613CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Fkq+rpXCc7007vDQTJXVDPW0BlfBfY4tMR1lcznr8zw=; b=GmNiOoF6rGSat255k54a+Wp88
	YUBAE2wKseQ3Kvjhqhw1KkiLNO/WO1EWJ35vJGaelvXb09qTcWRGjmikMOH1WHl2ESZhYSlaY78rD
	0hSNSlUIjHtdpeoqhlNhNI7f0k1EiONefTAdD88xx/j0pExLO4FDqyLgaheYNuNRTkbskrUpQ2vWd
	uVnSeDLPEEN6NGTFYUNUJf/AVclm5iIzeQLtQWyrMwWJ6HbtAQfPtDNKM+t3LfkM1xLoRTydHgauH
	pJ0yy2RDWNJU+Y+FPRLdL6ZSFwMZpVj1GbVOzzPjjbssmmZ7XdFunjwH6cTmssYbSmSkdLtZTxdjO
	QtqlcPaDQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcO1A-007Sxx-Vi; Fri, 30 Apr 2021 07:56:57 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcO0z-007SvJ-Lp
 for linux-riscv@desiato.infradead.org; Fri, 30 Apr 2021 07:56:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:
 Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
 :Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=+2/35myo+MUDQ5/DlrKVkE/w38btxog7a//J8qkX02I=; b=MpOb2Qpncbzqdoo3MbRfdYJjtV
 roHUMJ6PlRH2hEqO8TDhglOP9RBxXSYQMYZi6fkWXItewZksL5tPeixpAColuzwfV52VDbXk/snjE
 JQHQrAdgkAgyi4P/iNtSX0WjLEKRajbQdcWlhrUbp6oXfw2mvaa5McliQs8gS6CoBDlxkmin6Cexf
 0DGnHirK4mtyxVXhtie0bSE5wZ8hJEFCVvxHxTepYrdWMxfV0RlecoYyxc7s3Opnar33buRCgBe5p
 0WRS4D/OoN7bBZdUtdNgkEfBcBORmm6ZGf3bXt2HkNpnufvVz4PLK27aHRO8qve5k9iaeg4RHarD7
 2TAZZitA==;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcO0u-001DWX-QJ
 for linux-riscv@lists.infradead.org; Fri, 30 Apr 2021 07:56:44 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FWl4T70yPznTVV;
 Fri, 30 Apr 2021 15:54:01 +0800 (CST)
Received: from huawei.com (10.175.113.32) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.498.0; Fri, 30 Apr 2021
 15:56:23 +0800
From: Nanyong Sun <sunnanyong@huawei.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <palmerdabbelt@google.com>, <atish.patra@wdc.com>,
 <wangkefeng.wang@huawei.com>, <sunnanyong@huawei.com>
Subject: [PATCH -next 4/4] riscv: mm: add THP support on 64-bit
Date: Fri, 30 Apr 2021 16:28:50 +0800
Message-ID: <20210430082850.462609-5-sunnanyong@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430082850.462609-1-sunnanyong@huawei.com>
References: <20210430082850.462609-1-sunnanyong@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.113.32]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210430_005641_219777_C69E976D 
X-CRM114-Status: GOOD (  10.01  )
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

Bring Transparent HugePage support to riscv. A
transparent huge page is always represented as a pmd.

Signed-off-by: Nanyong Sun <sunnanyong@huawei.com>
---
 arch/riscv/Kconfig               |   1 +
 arch/riscv/include/asm/pgtable.h | 156 +++++++++++++++++++++++++++++++
 arch/riscv/mm/tlbflush.c         |   7 ++
 3 files changed, 164 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 4e124b2eb..3628f9f12 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -101,6 +101,7 @@ config RISCV
 	select SYSCTL_EXCEPTION_TRACE
 	select THREAD_INFO_IN_TASK
 	select UACCESS_MEMCPY if !MMU
+	select HAVE_ARCH_TRANSPARENT_HUGEPAGE if 64BIT
 
 config ARCH_MMAP_RND_BITS_MIN
 	default 18 if 64BIT
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index f7fc47c58..ceb4b9c82 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -148,10 +148,23 @@ extern pgd_t swapper_pg_dir[];
 #define __S110	PAGE_SHARED_EXEC
 #define __S111	PAGE_SHARED_EXEC
 
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
+static inline int pmd_present(pmd_t pmd)
+{
+	/*
+	 * Checking for _PAGE_LEAF is needed too because:
+	 * When splitting a THP, split_huge_page() will temporarily clear
+	 * the present bit, in this situation, pmd_present() and
+	 * pmd_trans_huge() still needs to return true.
+	 */
+	return (pmd_val(pmd) & (_PAGE_PRESENT | _PAGE_PROT_NONE | _PAGE_LEAF));
+}
+#else
 static inline int pmd_present(pmd_t pmd)
 {
 	return (pmd_val(pmd) & (_PAGE_PRESENT | _PAGE_PROT_NONE));
 }
+#endif
 
 static inline int pmd_none(pmd_t pmd)
 {
@@ -345,6 +358,14 @@ static inline void update_mmu_cache(struct vm_area_struct *vma,
 	local_flush_tlb_page(address);
 }
 
+static inline void update_mmu_cache_pmd(struct vm_area_struct *vma,
+		unsigned long address, pmd_t *pmdp)
+{
+	pte_t *ptep = (pte_t *)pmdp;
+
+	update_mmu_cache(vma, address, ptep);
+}
+
 #define __HAVE_ARCH_PTE_SAME
 static inline int pte_same(pte_t pte_a, pte_t pte_b)
 {
@@ -438,6 +459,141 @@ static inline int ptep_clear_flush_young(struct vm_area_struct *vma,
 	return ptep_test_and_clear_young(vma, address, ptep);
 }
 
+/*
+ * THP functions
+ */
+static inline pmd_t pte_pmd(pte_t pte)
+{
+	return __pmd(pte_val(pte));
+}
+
+static inline pmd_t pmd_mkhuge(pmd_t pmd)
+{
+	return pmd;
+}
+
+static inline pmd_t pmd_mkinvalid(pmd_t pmd)
+{
+	return __pmd(pmd_val(pmd) & ~(_PAGE_PRESENT|_PAGE_PROT_NONE));
+}
+
+#define __pmd_to_phys(pmd)  (pmd_val(pmd) >> _PAGE_PFN_SHIFT << PAGE_SHIFT)
+
+static inline unsigned long pmd_pfn(pmd_t pmd)
+{
+	return ((__pmd_to_phys(pmd) & PMD_MASK) >> PAGE_SHIFT);
+}
+
+static inline pmd_t mk_pmd(struct page *page, pgprot_t prot)
+{
+	return pfn_pmd(page_to_pfn(page), prot);
+}
+
+static inline pmd_t pmd_modify(pmd_t pmd, pgprot_t newprot)
+{
+	return pte_pmd(pte_modify(pmd_pte(pmd), newprot));
+}
+
+#define pmd_write pmd_write
+static inline int pmd_write(pmd_t pmd)
+{
+	return pte_write(pmd_pte(pmd));
+}
+
+static inline int pmd_dirty(pmd_t pmd)
+{
+	return pte_dirty(pmd_pte(pmd));
+}
+
+static inline int pmd_young(pmd_t pmd)
+{
+	return pte_young(pmd_pte(pmd));
+}
+
+static inline pmd_t pmd_mkold(pmd_t pmd)
+{
+	return pte_pmd(pte_mkold(pmd_pte(pmd)));
+}
+
+static inline pmd_t pmd_mkyoung(pmd_t pmd)
+{
+	return pte_pmd(pte_mkyoung(pmd_pte(pmd)));
+}
+
+static inline pmd_t pmd_mkwrite(pmd_t pmd)
+{
+	return pte_pmd(pte_mkwrite(pmd_pte(pmd)));
+}
+
+static inline pmd_t pmd_wrprotect(pmd_t pmd)
+{
+	return pte_pmd(pte_wrprotect(pmd_pte(pmd)));
+}
+
+static inline pmd_t pmd_mkclean(pmd_t pmd)
+{
+	return pte_pmd(pte_mkclean(pmd_pte(pmd)));
+}
+
+static inline pmd_t pmd_mkdirty(pmd_t pmd)
+{
+	return pte_pmd(pte_mkdirty(pmd_pte(pmd)));
+}
+
+static inline void set_pmd_at(struct mm_struct *mm, unsigned long addr,
+				pmd_t *pmdp, pmd_t pmd)
+{
+	return set_pte_at(mm, addr, (pte_t *)pmdp, pmd_pte(pmd));
+}
+
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
+static inline int pmd_trans_huge(pmd_t pmd)
+{
+	return pmd_leaf(pmd);
+}
+
+#define __HAVE_ARCH_PMDP_SET_ACCESS_FLAGS
+static inline int pmdp_set_access_flags(struct vm_area_struct *vma,
+					unsigned long address, pmd_t *pmdp,
+					pmd_t entry, int dirty)
+{
+	return ptep_set_access_flags(vma, address, (pte_t *)pmdp, pmd_pte(entry), dirty);
+}
+
+#define __HAVE_ARCH_PMDP_TEST_AND_CLEAR_YOUNG
+static inline int pmdp_test_and_clear_young(struct vm_area_struct *vma,
+					unsigned long address, pmd_t *pmdp)
+{
+	return ptep_test_and_clear_young(vma, address, (pte_t *)pmdp);
+}
+
+#define __HAVE_ARCH_PMDP_HUGE_GET_AND_CLEAR
+static inline pmd_t pmdp_huge_get_and_clear(struct mm_struct *mm,
+					unsigned long address, pmd_t *pmdp)
+{
+	return pte_pmd(ptep_get_and_clear(mm, address, (pte_t *)pmdp));
+}
+
+#define __HAVE_ARCH_PMDP_SET_WRPROTECT
+static inline void pmdp_set_wrprotect(struct mm_struct *mm,
+					unsigned long address, pmd_t *pmdp)
+{
+	ptep_set_wrprotect(mm, address, (pte_t *)pmdp);
+}
+
+#define pmdp_establish pmdp_establish
+static inline pmd_t pmdp_establish(struct vm_area_struct *vma,
+				unsigned long address, pmd_t *pmdp, pmd_t pmd)
+{
+	return __pmd(atomic_long_xchg((atomic_long_t *)pmdp, pmd_val(pmd)));
+}
+
+#define __HAVE_ARCH_FLUSH_PMD_TLB_RANGE
+void flush_pmd_tlb_range(struct vm_area_struct *vma, unsigned long start,
+			unsigned long end);
+
+#endif /* CONFIG_TRANSPARENT_HUGEPAGE */
+
 /*
  * Encode and decode a swap entry
  *
diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index 382781abf..fea45af91 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -54,3 +54,10 @@ void flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
 {
 	__sbi_tlb_flush_range(mm_cpumask(vma->vm_mm), start, end - start, PAGE_SIZE);
 }
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
+void flush_pmd_tlb_range(struct vm_area_struct *vma, unsigned long start,
+			unsigned long end)
+{
+	__sbi_tlb_flush_range(mm_cpumask(vma->vm_mm), start, end - start, PMD_SIZE);
+}
+#endif
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
