Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C14A9C61D85
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Nov 2023 06:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=atfAOuwG5T2uQN564PVTXBEzUW9CJInCf2sEQbCQN7o=; b=W8iaijJXYTI0mT
	pCdvxvlAzP0G2ZZOWtxu160SrQN9KZpuQZWbr2w/UklSGwF2+YZ8jX8RE4BPCz7F3dXQBktrVeHc0
	fcIZUYnuKKNxmEPteh9pIO9LaboYlkHpePseSvQPM4EuQVOaSJYbLtjvWIW7HOZJdJdOFbf5bhsaF
	TzUZiob/Vme6C4UmhOKMTXfmOineTkvGn2JfRkdH9lVD6R5iJ9mm6HIfa6EeMDDWApQTxAviD6Is+
	eO0WlG6Ca4ZXuqr0TqhMcwSxudrTpWfkodGPfwx1ly0+VXs3uZlJDW+n3h8fDV4Kuk1Y+AGUv5xCI
	lOLWEc0bUZfhDbWlMgGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r63f0-003xPj-2e;
	Thu, 23 Nov 2023 06:58:02 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r63ex-003xNa-2f
	for linux-riscv@lists.infradead.org;
	Thu, 23 Nov 2023 06:58:01 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-6cbd24d9557so429852b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 22 Nov 2023 22:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1700722678; x=1701327478; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C94qAqj8zbtSDuRHlmOHD8Q2VGFM2PRqxiBp3mJrf0U=;
        b=Vu2g4hzrvkT2A8oF7szasjV6qRmiNUU05wCacTArVG5BpEIHsGDEK9Xbfeks2NgX72
         Uf86dnNFnzQwIxORb2QgfS2aqq9J0/tAAPMKT9r0ZlJhbyz76MWmwgvRPgGM6GA1MEMz
         ctlr6E/dYWdDZFPYaKdG4SV9P/D/fb0pYQlXJC2TC2XhboJoBiK79WCgRiHc9gJAnzfO
         8gBzN9Nsz9UX7ULiCbwEOsnCujYv3BJLcY7xliCHs8nYMDEOGB6mEZlD4auuHsTp3ZDB
         /o8TR9ONZ6TvHMdNg3McW4TwxemSoxL5lC6hyvq/odIclbTnXfM603Rq4aIDy5kWy4BX
         CUHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700722678; x=1701327478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C94qAqj8zbtSDuRHlmOHD8Q2VGFM2PRqxiBp3mJrf0U=;
        b=BiGqh+zYt1BBAH34X2M5/fGeQgXO6/6stsNFvInXhVlheIyZ0+nE+hpLRfApAWiOVe
         vKFuPqDP7VjHV7hvAIAra15OBIn41PzYtzCEgEi2V5vjCaO8eQxlxQlJhS1AjkoINbWM
         9b4EtA0TP5xbD80v4852INwhQYC8b2iZ7TKaXklapy1BGiWKQSPvxwbcV2EqUtHL4cta
         iZYC9OHsbcHct/kLExVCh2w17vQJ64CG6FbQg0ij+K4zsSWDejKQBoK5AYcIsr0/n1te
         Y2UACy5g/jZ1FZ8HR+puoKPWtrt6kZJQPTE3umnwIurov7GNSMAF5iqfMx2oJUuvExbU
         7s9Q==
X-Gm-Message-State: AOJu0Yzlncp7N46llTvspTnrYFz838MhQpkZGRvIepWtiO+KT0QOsWGQ
	fzV74FMDGtbTbmB1d1z1KFjppA==
X-Google-Smtp-Source: AGHT+IGnHCkqYYh5NefAhg3MFCZ+EXB4xUd+vxXu7NalDhM8+VhB4KPw88X/a6YywB+kIuA/EhnA0w==
X-Received: by 2002:a05:6a00:2d94:b0:6cb:db40:4568 with SMTP id fb20-20020a056a002d9400b006cbdb404568mr2701949pfb.17.1700722678597;
        Wed, 22 Nov 2023 22:57:58 -0800 (PST)
Received: from J9GPGXL7NT.bytedance.net ([139.177.225.230])
        by smtp.gmail.com with ESMTPSA id w37-20020a634765000000b005bd2b3a03eesm615437pgk.6.2023.11.22.22.57.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 22 Nov 2023 22:57:58 -0800 (PST)
From: Xu Lu <luxu.kernel@bytedance.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	ardb@kernel.org,
	anup@brainfault.org,
	atishp@atishpatra.org
Cc: dengliang.1214@bytedance.com,
	xieyongji@bytedance.com,
	lihangjing@bytedance.com,
	songmuchun@bytedance.com,
	punit.agrawal@bytedance.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [RFC PATCH V1 06/11] riscv: Distinguish pmd huge pte and napot huge pte
Date: Thu, 23 Nov 2023 14:57:03 +0800
Message-Id: <20231123065708.91345-7-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20231123065708.91345-1-luxu.kernel@bytedance.com>
References: <20231123065708.91345-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_225759_868090_842383BA 
X-CRM114-Status: GOOD (  13.68  )
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

There exist two kinds of huge pte on RISC-V: pmd and napot pte. For pmd
kind huge pte, the huge page it represents is much larger than base
page. Thus pmd kind huge pte can be represented via a single pmd entry
and needs no special handling. For napot kind huge pte, it is actually
several normal pte entries encoded in Svnapot format. Thus napot kind
huge pte should be represented via pte_t struct and handled via pte
operations.

This commit distinguishes these two kinds of huge pte and handles them
with different operations.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/include/asm/hugetlb.h | 71 +++++++++++++++++++++++++++++++-
 arch/riscv/mm/hugetlbpage.c      | 40 ++++++++++++------
 2 files changed, 97 insertions(+), 14 deletions(-)

diff --git a/arch/riscv/include/asm/hugetlb.h b/arch/riscv/include/asm/hugetlb.h
index 4c5b0e929890..1cdd5a26e6d4 100644
--- a/arch/riscv/include/asm/hugetlb.h
+++ b/arch/riscv/include/asm/hugetlb.h
@@ -4,6 +4,7 @@
 
 #include <asm/cacheflush.h>
 #include <asm/page.h>
+#include <asm/pgtable.h>
 
 static inline void arch_clear_hugepage_flags(struct page *page)
 {
@@ -12,6 +13,7 @@ static inline void arch_clear_hugepage_flags(struct page *page)
 #define arch_clear_hugepage_flags arch_clear_hugepage_flags
 
 #ifdef CONFIG_RISCV_ISA_SVNAPOT
+
 #define __HAVE_ARCH_HUGE_PTE_CLEAR
 void huge_pte_clear(struct mm_struct *mm, unsigned long addr,
 		    pte_t *ptep, unsigned long sz);
@@ -41,10 +43,77 @@ int huge_ptep_set_access_flags(struct vm_area_struct *vma,
 #define __HAVE_ARCH_HUGE_PTEP_GET
 pte_t huge_ptep_get(pte_t *ptep);
 
+#define __HAVE_ARCH_HUGE_PTEP_GET_LOCKLESS
+static inline pte_t huge_ptep_get_lockless(pte_t *ptep)
+{
+	unsigned long pteval = READ_ONCE(ptep->ptes[0]);
+
+	return __pte(pteval);
+}
+
 pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags);
 #define arch_make_huge_pte arch_make_huge_pte
 
-#endif /*CONFIG_RISCV_ISA_SVNAPOT*/
+#else /* CONFIG_RISCV_ISA_SVNAPOT */
+
+#define __HAVE_ARCH_HUGE_PTEP_GET
+static inline pte_t huge_ptep_get(pte_t *ptep)
+{
+	pmd_t *pmdp = (pmd_t *)ptep;
+
+	return pmd_pte(pmdp_get(pdmp));
+}
+
+#define __HAVE_ARCH_HUGE_PTEP_GET_LOCKLESS
+static inline pte_t huge_ptep_get_lockless(pte_t *ptep)
+{
+	return huge_ptep_get(ptep);
+}
+
+#define __HAVE_ARCH_HUGE_SET_HUGE_PTE_AT
+static inline void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
+		pte_t *ptep, pte_t pte)
+{
+	set_pmd_at(mm, addr, (pmd_t *)ptep, pte_pmd(pte));
+}
+
+#define __HAVE_ARCH_HUGE_PTEP_SET_ACCESS_FLAGS
+static inline int huge_ptep_set_access_flags(struct vm_area_struct *vma,
+		unsigned long addr, pte_t *ptep,
+		pte_t pte, int dirty)
+{
+	return pmdp_set_access_flags(vma, addr, (pmd_t *)ptep, pte_pmd(pte), dirty);
+}
+
+#define __HAVE_ARCH_HUGE_PTEP_GET_AND_CLEAR
+static inline pte_t huge_ptep_get_and_clear(struct mm_struct *mm,
+		unsigned long addr, pte_t *ptep)
+{
+	return pmd_pte(pmdp_get_and_clear(mm, addr, (pmd_t *)ptep));
+}
+
+#define __HAVE_ARCH_HUGE_PTEP_SET_WRPROTECT
+static inline void huge_ptep_set_wrprotect(struct mm_struct *mm,
+		unsigned long addr, pte_t *ptep)
+{
+	pmdp_set_wrprotect(mm, addr, (pmd_t *)ptep);
+}
+
+#define __HAVE_ARCH_HUGE_PTEP_CLEAR_FLUSH
+static inline pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
+		unsigned long addr, pte_t *ptep)
+{
+	return pmd_pte(pmdp_clear_flush(vma, addr, (pmd_t *)ptep));
+}
+
+#define __HAVE_ARCH_HUGE_PTE_CLEAR
+static inline void huge_pte_clear(struct mm_struct *mm, unsigned long addr,
+		    pte_t *ptep, unsigned long sz)
+{
+	pmd_clear((pmd_t *)ptep);
+}
+
+#endif /* CONFIG_RISCV_ISA_SVNAPOT */
 
 #include <asm-generic/hugetlb.h>
 
diff --git a/arch/riscv/mm/hugetlbpage.c b/arch/riscv/mm/hugetlbpage.c
index 67fd71c36853..4a2ad8657502 100644
--- a/arch/riscv/mm/hugetlbpage.c
+++ b/arch/riscv/mm/hugetlbpage.c
@@ -7,8 +7,13 @@ pte_t huge_ptep_get(pte_t *ptep)
 {
 	unsigned long pte_num;
 	int i;
-	pte_t orig_pte = ptep_get(ptep);
+	pmd_t *pmdp = (pmd_t *)ptep;
+	pte_t orig_pte = pmd_pte(pmdp_get(pmdp));
 
+	/*
+	 * Non napot pte indicates a middle page table entry and
+	 * should be treated as a pmd.
+	 */
 	if (!pte_present(orig_pte) || !pte_napot(orig_pte))
 		return orig_pte;
 
@@ -198,6 +203,8 @@ void set_huge_pte_at(struct mm_struct *mm,
 		hugepage_shift = PAGE_SHIFT;
 
 	pte_num = sz >> hugepage_shift;
+	if (pte_num == 1)
+		set_pmd_at(mm, addr, (pmd_t *)ptep, pte_pmd(pte));
 	for (i = 0; i < pte_num; i++, ptep++, addr += (1 << hugepage_shift))
 		set_pte_at(mm, addr, ptep, pte);
 }
@@ -214,7 +221,8 @@ int huge_ptep_set_access_flags(struct vm_area_struct *vma,
 	int i, pte_num;
 
 	if (!pte_napot(pte))
-		return ptep_set_access_flags(vma, addr, ptep, pte, dirty);
+		return pmdp_set_access_flags(vma, addr, (pmd_t *)ptep,
+					     pte_pmd(pte), dirty);
 
 	order = napot_cont_order(pte);
 	pte_num = napot_pte_num(order);
@@ -237,11 +245,12 @@ pte_t huge_ptep_get_and_clear(struct mm_struct *mm,
 			      unsigned long addr,
 			      pte_t *ptep)
 {
-	pte_t orig_pte = ptep_get(ptep);
+	pmd_t *pmdp = (pmd_t *)ptep;
+	pte_t orig_pte = pmd_pte(pmdp_get(pmdp));
 	int pte_num;
 
 	if (!pte_napot(orig_pte))
-		return ptep_get_and_clear(mm, addr, ptep);
+		return pmd_pte(pmdp_get_and_clear(mm, addr, pmdp));
 
 	pte_num = napot_pte_num(napot_cont_order(orig_pte));
 
@@ -252,13 +261,14 @@ void huge_ptep_set_wrprotect(struct mm_struct *mm,
 			     unsigned long addr,
 			     pte_t *ptep)
 {
-	pte_t pte = ptep_get(ptep);
+	pmd_t *pmdp = (pmd_t *)ptep;
+	pte_t pte = pmd_pte(pmdp_get(pmdp));
 	unsigned long order;
 	pte_t orig_pte;
 	int i, pte_num;
 
 	if (!pte_napot(pte)) {
-		ptep_set_wrprotect(mm, addr, ptep);
+		pmdp_set_wrprotect(mm, addr, pmdp);
 		return;
 	}
 
@@ -277,11 +287,12 @@ pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
 			    unsigned long addr,
 			    pte_t *ptep)
 {
-	pte_t pte = ptep_get(ptep);
+	pmd_t *pmdp = (pmd_t *)ptep;
+	pte_t pte = pmd_pte(pmdp_get(pmdp));
 	int pte_num;
 
 	if (!pte_napot(pte))
-		return ptep_clear_flush(vma, addr, ptep);
+		return pmd_pte(pmdp_clear_flush(vma, addr, pmdp));
 
 	pte_num = napot_pte_num(napot_cont_order(pte));
 
@@ -293,11 +304,12 @@ void huge_pte_clear(struct mm_struct *mm,
 		    pte_t *ptep,
 		    unsigned long sz)
 {
-	pte_t pte = ptep_get(ptep);
+	pmd_t *pmdp = (pmd_t *)ptep;
+	pte_t pte = pmd_pte(pmdp_get(pmdp));
 	int i, pte_num;
 
 	if (!pte_napot(pte)) {
-		pte_clear(mm, addr, ptep);
+		pmd_clear(pmdp);
 		return;
 	}
 
@@ -325,8 +337,10 @@ static __init int napot_hugetlbpages_init(void)
 	if (has_svnapot()) {
 		unsigned long order;
 
-		for_each_napot_order(order)
-			hugetlb_add_hstate(order);
+		for_each_napot_order(order) {
+			if (napot_cont_shift(order) > PAGE_SHIFT)
+				hugetlb_add_hstate(order);
+		}
 	}
 	return 0;
 }
@@ -357,7 +371,7 @@ bool __init arch_hugetlb_valid_size(unsigned long size)
 		return true;
 	else if (IS_ENABLED(CONFIG_64BIT) && size == PUD_SIZE)
 		return true;
-	else if (is_napot_size(size))
+	else if (is_napot_size(size) && size > PAGE_SIZE)
 		return true;
 	else
 		return false;
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
