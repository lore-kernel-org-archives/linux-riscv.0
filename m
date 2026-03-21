Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 928BA1093174
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Mar 2026 06:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xqI2KCt9wNNTtjSZyL2kj1E2NIy8vQYOZYG0+9z4JGA=; b=4l6DkUC9bV3Gxz
	h3HHttTaQeSMGFl/gUHf5iOFS9D4DglNSpk+upQh0boQppxtukJiUMCJ15bweIbl1g+0djDtQ1lA6
	NpSb24ZNYqXo5CWVyd4Gu0MglxXOMqshk9bsgVyk1LU1EqvslPdKL61Ytc54K8/UuB6DFymB/ii1T
	XEDvp+Ty4na0f32ybS8jOWgTI/B+SakXcr5WgdL/uIXSZ7BZ9iDFRRwcFAVhd0F3sdgYXo/LYa4eQ
	Bv2HWS9a9Hw1VSHWYJg1v7w5fEQNiEZK6HYQFW7RbQ+TRBOmD+MYEGraJr7hqKHXMJ4zL4jWHDdkH
	s5c+8DI5J+OPV5xAe85g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3q3d-0000000E999-0jL3;
	Sat, 21 Mar 2026 06:43:37 +0000
Received: from out30-110.freemail.mail.aliyun.com ([115.124.30.110])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3q3K-0000000E8rY-3MlM;
	Sat, 21 Mar 2026 06:43:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1774075394; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=DKPUJMB2CvMsCVl9Ou1D+eNQe4gk5dNFjUcWcWZbm30=;
	b=WwTvA9eFUtgpyBuDvDNHbUJ9bUIJqcS3Of+XeHsgP+AQR5KBrwSRBMOO2eM6YQza+dXqOUF+dEL99CojeQr74WIdbGbfM/9t9S0/abcNLi2WJ2VTHvrQ9Of6k7R+G83vUysuOjZSt2NbTDTdLGYHbfSwsa9ZxPQl+LbEfTZwcbY=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R311e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=18;SR=0;TI=SMTPD_---0X.O5VF6_1774075390;
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0X.O5VF6_1774075390 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sat, 21 Mar 2026 14:43:10 +0800
From: Baolin Wang <baolin.wang@linux.alibaba.com>
To: akpm@linux-foundation.org,
	david@kernel.org
Cc: ljs@kernel.org,
	Liam.Howlett@oracle.com,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	baolin.wang@linux.alibaba.com,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-mm@kvack.org (open),
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/6] mm: change to return bool for pmdp_test_and_clear_young()
Date: Sat, 21 Mar 2026 14:42:51 +0800
Message-ID: <f1d31307a13365d3d0fed5809727dcc2dd59631b.1774075004.git.baolin.wang@linux.alibaba.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1774075004.git.baolin.wang@linux.alibaba.com>
References: <cover.1774075004.git.baolin.wang@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_234319_024845_48EE7CB5 
X-CRM114-Status: GOOD (  13.43  )
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

Callers use pmdp_test_and_clear_young() to clear the young flag and check
whether it was set for this PMD entry. Change the return type to bool to
make the intention clearer.

Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
Reviewed-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
---
 arch/arm64/include/asm/pgtable.h             |  5 ++---
 arch/powerpc/include/asm/book3s/64/pgtable.h | 10 +++++-----
 arch/powerpc/mm/book3s64/pgtable.c           |  4 ++--
 arch/riscv/include/asm/pgtable.h             |  4 ++--
 arch/s390/include/asm/pgtable.h              |  4 ++--
 arch/x86/include/asm/pgtable.h               |  4 ++--
 arch/x86/mm/pgtable.c                        |  6 +++---
 include/linux/pgtable.h                      | 19 +++++++++----------
 8 files changed, 27 insertions(+), 29 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 1009f719b157..52bafe79c10a 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1320,9 +1320,8 @@ static inline bool __ptep_clear_flush_young(struct vm_area_struct *vma,
 
 #if defined(CONFIG_TRANSPARENT_HUGEPAGE) || defined(CONFIG_ARCH_HAS_NONLEAF_PMD_YOUNG)
 #define __HAVE_ARCH_PMDP_TEST_AND_CLEAR_YOUNG
-static inline int pmdp_test_and_clear_young(struct vm_area_struct *vma,
-					    unsigned long address,
-					    pmd_t *pmdp)
+static inline bool pmdp_test_and_clear_young(struct vm_area_struct *vma,
+		unsigned long address, pmd_t *pmdp)
 {
 	/* Operation applies to PMD table entry only if FEAT_HAFT is enabled */
 	VM_WARN_ON(pmd_table(READ_ONCE(*pmdp)) && !system_supports_haft());
diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index c049a2e26e25..8b354e81ab22 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -1161,13 +1161,13 @@ pud_hugepage_update(struct mm_struct *mm, unsigned long addr, pud_t *pudp,
  * For radix we should always find H_PAGE_HASHPTE zero. Hence
  * the below will work for radix too
  */
-static inline int __pmdp_test_and_clear_young(struct mm_struct *mm,
-					      unsigned long addr, pmd_t *pmdp)
+static inline bool __pmdp_test_and_clear_young(struct mm_struct *mm,
+		unsigned long addr, pmd_t *pmdp)
 {
 	unsigned long old;
 
 	if ((pmd_raw(*pmdp) & cpu_to_be64(_PAGE_ACCESSED | H_PAGE_HASHPTE)) == 0)
-		return 0;
+		return false;
 	old = pmd_hugepage_update(mm, addr, pmdp, _PAGE_ACCESSED, 0);
 	return ((old & _PAGE_ACCESSED) != 0);
 }
@@ -1300,8 +1300,8 @@ extern int pudp_set_access_flags(struct vm_area_struct *vma,
 				 pud_t entry, int dirty);
 
 #define __HAVE_ARCH_PMDP_TEST_AND_CLEAR_YOUNG
-extern int pmdp_test_and_clear_young(struct vm_area_struct *vma,
-				     unsigned long address, pmd_t *pmdp);
+bool pmdp_test_and_clear_young(struct vm_area_struct *vma,
+		unsigned long address, pmd_t *pmdp);
 #define __HAVE_ARCH_PUDP_TEST_AND_CLEAR_YOUNG
 extern int pudp_test_and_clear_young(struct vm_area_struct *vma,
 				     unsigned long address, pud_t *pudp);
diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
index 4b09c04654a8..c584321e3d41 100644
--- a/arch/powerpc/mm/book3s64/pgtable.c
+++ b/arch/powerpc/mm/book3s64/pgtable.c
@@ -98,8 +98,8 @@ int pudp_set_access_flags(struct vm_area_struct *vma, unsigned long address,
 }
 
 
-int pmdp_test_and_clear_young(struct vm_area_struct *vma,
-			      unsigned long address, pmd_t *pmdp)
+bool pmdp_test_and_clear_young(struct vm_area_struct *vma,
+		unsigned long address, pmd_t *pmdp)
 {
 	return __pmdp_test_and_clear_young(vma->vm_mm, address, pmdp);
 }
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index b9dacfc280b1..67e7746e3fbe 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -1015,8 +1015,8 @@ static inline int pmdp_set_access_flags(struct vm_area_struct *vma,
 }
 
 #define __HAVE_ARCH_PMDP_TEST_AND_CLEAR_YOUNG
-static inline int pmdp_test_and_clear_young(struct vm_area_struct *vma,
-					unsigned long address, pmd_t *pmdp)
+static inline bool pmdp_test_and_clear_young(struct vm_area_struct *vma,
+		unsigned long address, pmd_t *pmdp)
 {
 	return ptep_test_and_clear_young(vma, address, (pte_t *)pmdp);
 }
diff --git a/arch/s390/include/asm/pgtable.h b/arch/s390/include/asm/pgtable.h
index ac74b5076d8f..87a5082da28e 100644
--- a/arch/s390/include/asm/pgtable.h
+++ b/arch/s390/include/asm/pgtable.h
@@ -1683,8 +1683,8 @@ static inline int pmdp_set_access_flags(struct vm_area_struct *vma,
 }
 
 #define __HAVE_ARCH_PMDP_TEST_AND_CLEAR_YOUNG
-static inline int pmdp_test_and_clear_young(struct vm_area_struct *vma,
-					    unsigned long addr, pmd_t *pmdp)
+static inline bool pmdp_test_and_clear_young(struct vm_area_struct *vma,
+		unsigned long addr, pmd_t *pmdp)
 {
 	pmd_t pmd = *pmdp;
 
diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index 3993657e0a35..ba867bac6096 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -1295,8 +1295,8 @@ extern int pudp_set_access_flags(struct vm_area_struct *vma,
 				 pud_t entry, int dirty);
 
 #define __HAVE_ARCH_PMDP_TEST_AND_CLEAR_YOUNG
-extern int pmdp_test_and_clear_young(struct vm_area_struct *vma,
-				     unsigned long addr, pmd_t *pmdp);
+bool pmdp_test_and_clear_young(struct vm_area_struct *vma,
+		unsigned long addr, pmd_t *pmdp);
 extern int pudp_test_and_clear_young(struct vm_area_struct *vma,
 				     unsigned long addr, pud_t *pudp);
 
diff --git a/arch/x86/mm/pgtable.c b/arch/x86/mm/pgtable.c
index 1348384a3bb9..b09e8c5dadf9 100644
--- a/arch/x86/mm/pgtable.c
+++ b/arch/x86/mm/pgtable.c
@@ -456,10 +456,10 @@ bool ptep_test_and_clear_young(struct vm_area_struct *vma,
 }
 
 #if defined(CONFIG_TRANSPARENT_HUGEPAGE) || defined(CONFIG_ARCH_HAS_NONLEAF_PMD_YOUNG)
-int pmdp_test_and_clear_young(struct vm_area_struct *vma,
-			      unsigned long addr, pmd_t *pmdp)
+bool pmdp_test_and_clear_young(struct vm_area_struct *vma,
+		unsigned long addr, pmd_t *pmdp)
 {
-	int ret = 0;
+	bool ret = false;
 
 	if (pmd_young(*pmdp))
 		ret = test_and_clear_bit(_PAGE_BIT_ACCESSED,
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 99450a3b0705..6db900a5d38b 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -507,25 +507,24 @@ static inline bool ptep_test_and_clear_young(struct vm_area_struct *vma,
 
 #ifndef __HAVE_ARCH_PMDP_TEST_AND_CLEAR_YOUNG
 #if defined(CONFIG_TRANSPARENT_HUGEPAGE) || defined(CONFIG_ARCH_HAS_NONLEAF_PMD_YOUNG)
-static inline int pmdp_test_and_clear_young(struct vm_area_struct *vma,
-					    unsigned long address,
-					    pmd_t *pmdp)
+static inline bool pmdp_test_and_clear_young(struct vm_area_struct *vma,
+		unsigned long address, pmd_t *pmdp)
 {
 	pmd_t pmd = *pmdp;
-	int r = 1;
+	bool young = true;
+
 	if (!pmd_young(pmd))
-		r = 0;
+		young = false;
 	else
 		set_pmd_at(vma->vm_mm, address, pmdp, pmd_mkold(pmd));
-	return r;
+	return young;
 }
 #else
-static inline int pmdp_test_and_clear_young(struct vm_area_struct *vma,
-					    unsigned long address,
-					    pmd_t *pmdp)
+static inline bool pmdp_test_and_clear_young(struct vm_area_struct *vma,
+		unsigned long address, pmd_t *pmdp)
 {
 	BUILD_BUG();
-	return 0;
+	return false;
 }
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE || CONFIG_ARCH_HAS_NONLEAF_PMD_YOUNG */
 #endif
-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
