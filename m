Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38CE2CD5BB4
	for <linux-riscv@archiver.kernel.org>; Fri, 22 May 2026 14:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O8lvfANnUewq5CpFb6P+mkE2b1TiNlRwoxxdoau2eCk=; b=FRG7M4ltbcqY/E
	QmeefsKOt2Zwn6/1bNTbDMSMDAoP9Y2ocC3BTxfpedvjU/81/utZW8TLwaZrvbqZAF7kq7eGjxJy5
	R0HpESCALrODHE196ZDWMzyz8029K/2zKm+AVM/IK1x2g/CLaDnMnKruRbyidRtLmGv8jUDQfPHHl
	FZogEf1JRDfRSkb7qyZKkKeXtwZyBNSxN01QfLwKND4sSsRHXJqaauahybsoJ/uAl0pPcIGDS+7qT
	Ii/liNJzSpE4w0KHU1aIL/HTTLd/eJjbOT37qksFwAogFcD/v6VIUo7/1zu9XuD0sWpRA/43yfh3K
	BwotK9+7/e6eqf+UYorw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQQoK-0000000B7p1-11KD;
	Fri, 22 May 2026 14:25:12 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQQoH-0000000B7o0-2PVs
	for linux-riscv@lists.infradead.org;
	Fri, 22 May 2026 14:25:11 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-82f8b60e485so3115566b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 22 May 2026 07:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1779459909; x=1780064709; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h4fHtLWbjgxAw/RuryI1Zn991wS9DJVk1T6sfJuVej8=;
        b=ZegYr1ZrkumRfKpt+kL/9whOlWcS0m7X/Y2ETX7uNcyZPDfTVVj5LNvjBWLNQda079
         9TS0DSIUDOlZDsL1D9QtwmIxh7xuEwMc05CqB4zkvnFGXgd7+YJBBE8T/Uho+PIEQp3a
         UHADe2WfGVVDZewHPjGqXt38xMFe0SLHTJN+LQz/sirGRBHraV0IUSHfF+X8fTp10QUk
         qHkbV6KweuBj3DPC9CoLY1n/Mc5Lpch3O6BnMF3XmExZiwFzhX0yVE70DqIxnReGsQwY
         fX2nBSf22+LRLEcOAAV/ccG/za8BrBDk6KjCHW263WU1cOk3P0K5V4fISrvm2lrBbiA3
         y5vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779459909; x=1780064709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h4fHtLWbjgxAw/RuryI1Zn991wS9DJVk1T6sfJuVej8=;
        b=otr3fwcHJ9MY7B/a99twI9VVCNLPnLDKvQgRXoHgRTlxChlmsc+bsxqq6k/dZlQ0Aj
         aoN+87aJ4UZ+fWaCRcIAwSWbVNYCocpE96aJZUemrmu1qHPZr2vy2n4Nzczne/HbPyPx
         mcOZG53hmSlfq8QBqSjDs0xQvtaZETO2bbtU4hWIVxOr2cFTb2tAQMMn2FfcpUpBUJEB
         ZLFTP0JZta92lFLHH1QCnDtjy9GcuMFPHaGyFYREAOO7wS9yhWtqrWkM0SxlbbXc9FWy
         hJea0NCXyWU/DNDjznImz5LrV7ciHxmZhODooeJD2cnd7U9IC88eJ/oAArc8NdZu9xgt
         yO7Q==
X-Forwarded-Encrypted: i=1; AFNElJ+EwL8POhOOmPjHWsBxwbAfw9FiyIqprTnl9ZRq2aaVMZ+FZVy5j9V1YCbkRQd4urSC2PwqD6esGvWg3g==@lists.infradead.org
X-Gm-Message-State: AOJu0YyZhioBqmkXXgNrQHgwYXTKZgBOtbst2ceWtRF6z/1mFyjvpAEE
	4iaF2giN44tlVZt1iaiH6H5Y4WweK7hflOPhdaxZJ5Bfdh/kLRyJOIilLmxAwoNPOF4=
X-Gm-Gg: Acq92OHCTC2kfl5Lait8qEzZdKchJpOj19uZkXhY3SDTM8812kHyNloIGj6pH1EpP9q
	/njfYwKBXnvcGQhyXV+yygyj7OvciVJfLfMiO4zCUCwCeaU+z33jZ/q7AngGxbZqtBD4NqHfBWa
	pxNlJWiKLhS7X7LOKkah4HnRhtgsZk5sBIezeFB9t6YcYzs6LnUeozt3FWQrgjiK6lNuI/2nxiu
	QvbREzsUIXaLYIbQxBlnXa2F76u0QGx3fXtXi4doKr3BqlnQ7VNiC9UMgFz9QX5UH1M1W/8I+kv
	xfkKxZr+j3Mf7U0/K4g+ZB2GZwqM9fBAJNLWnPSW7z/rN01bZVWJyFFJSU22BEQPq45Hm3bfH2Q
	wQaLNepK/+A379vovKYyg2UZNAx1+P2TGLoozyiDiJRXMxul/GPczvaOLLfkRdbRz9Z85xzOtbD
	4wRid0BTQHaRE8LM7iOMwVB/i8cVm6vIMnMJRZ+L+7awArAfniWfVLONIoFDUl+L/oOTJ0i+BQ
X-Received: by 2002:a05:6a00:3498:b0:837:fe75:104e with SMTP id d2e1a72fcca58-8415f0f0279mr4202939b3a.5.1779459908747;
        Fri, 22 May 2026 07:25:08 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.253])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ea14d0sm1963997b3a.37.2026.05.22.07.25.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 22 May 2026 07:25:08 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	akpm@linux-foundation.org,
	pasha.tatashin@soleen.com,
	andrew+kernel@donnellan.id.au,
	rmclure@linux.ibm.com,
	debug@rivosinc.com,
	baolin.wang@linux.alibaba.com,
	zhangchunyan@iscas.ac.cn,
	cuiyunhui@bytedance.com,
	apopple@nvidia.com,
	namcao@linutronix.de,
	wangruikang@iscas.ac.cn,
	apatel@ventanamicro.com,
	liu.xuemei1@zte.com.cn,
	ajones@ventanamicro.com,
	cleger@rivosinc.com,
	charlie@rivosinc.com,
	hui.wang@canonical.com,
	guodong@riscstar.com,
	pincheng.plct@isrc.iscas.ac.cn,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Qingwei Hu <qingwei.hu@bytedance.com>
Subject: [PATCH v2 2/2] riscv: preserve hardware-updated A/D bits in PTE accessors
Date: Fri, 22 May 2026 22:23:58 +0800
Message-Id: <20260522142358.87589-2-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20260522142358.87589-1-cuiyunhui@bytedance.com>
References: <20260522142358.87589-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_072509_875728_37F830C9 
X-CRM114-Status: GOOD (  14.26  )
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

Use cmpxchg-based merges for live RISC-V PTE permission updates so
software changes do not lose concurrently hardware-updated accessed and
dirty state. Cover ptep_set_access_flags(),
ptep_test_and_clear_young(), and ptep_set_wrprotect(), and extend the
same wrprotect handling to the PUD leaf helper used by huge mappings.

Keep the existing Svvptc flush behaviour, but only flush when the
merged PTE value actually changed.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
Reviewed-by: Qingwei Hu <qingwei.hu@bytedance.com>
---
 arch/riscv/include/asm/pgtable.h | 19 +++++++--
 arch/riscv/mm/pgtable.c          | 68 ++++++++++++++++++++++++++------
 2 files changed, 73 insertions(+), 14 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 20663a466cf6c..984c37ca8aef7 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -668,15 +668,21 @@ static inline pte_t ptep_get_and_clear(struct mm_struct *mm,
 static inline void ptep_set_wrprotect(struct mm_struct *mm,
 				      unsigned long address, pte_t *ptep)
 {
-	pte_t read_pte = READ_ONCE(*ptep);
+	pte_t old_pte;
+	pte_t pte;
 	/*
 	 * ptep_set_wrprotect can be called for shadow stack ranges too.
 	 * shadow stack memory is XWR = 010 and thus clearing _PAGE_WRITE will lead to
 	 * encoding 000b which is wrong encoding with V = 1. This should lead to page fault
 	 * but we dont want this wrong configuration to be set in page tables.
 	 */
-	atomic_long_set((atomic_long_t *)ptep,
-			((pte_val(read_pte) & ~(unsigned long)_PAGE_WRITE) | _PAGE_READ));
+	pte = READ_ONCE(*ptep);
+	do {
+		old_pte = pte;
+		pte = pte_wrprotect(pte);
+		pte_val(pte) = cmpxchg_relaxed(&pte_val(*ptep), pte_val(old_pte),
+					       pte_val(pte));
+	} while (pte_val(pte) != pte_val(old_pte));
 }
 
 #define __HAVE_ARCH_PTEP_CLEAR_YOUNG_FLUSH
@@ -1030,6 +1036,13 @@ static inline void pmdp_set_wrprotect(struct mm_struct *mm,
 	ptep_set_wrprotect(mm, address, (pte_t *)pmdp);
 }
 
+#define __HAVE_ARCH_PUDP_SET_WRPROTECT
+static inline void pudp_set_wrprotect(struct mm_struct *mm,
+				      unsigned long address, pud_t *pudp)
+{
+	ptep_set_wrprotect(mm, address, (pte_t *)pudp);
+}
+
 #define pmdp_establish pmdp_establish
 static inline pmd_t pmdp_establish(struct vm_area_struct *vma,
 				unsigned long address, pmd_t *pmdp, pmd_t pmd)
diff --git a/arch/riscv/mm/pgtable.c b/arch/riscv/mm/pgtable.c
index 9c4427d0b1874..b77e82362442e 100644
--- a/arch/riscv/mm/pgtable.c
+++ b/arch/riscv/mm/pgtable.c
@@ -5,23 +5,55 @@
 #include <linux/kernel.h>
 #include <linux/pgtable.h>
 
+#define RISCV_PTE_ACCESS_FLAG_MASK	(_PAGE_READ | _PAGE_WRITE | _PAGE_EXEC | \
+					 _PAGE_ACCESSED | _PAGE_DIRTY | \
+					 _PAGE_SOFT_DIRTY)
+
+static inline unsigned long riscv_pte_access_flags(unsigned long cur,
+						   unsigned long entry)
+{
+	unsigned long pteval;
+	unsigned long hw_flags;
+
+	hw_flags = _PAGE_ACCESSED | _PAGE_DIRTY | _PAGE_SOFT_DIRTY;
+	pteval = cur & ~RISCV_PTE_ACCESS_FLAG_MASK;
+	pteval |= entry & (RISCV_PTE_ACCESS_FLAG_MASK & ~hw_flags);
+	pteval |= (cur | entry) & hw_flags;
+
+	return pteval;
+}
+
 int ptep_set_access_flags(struct vm_area_struct *vma,
 			  unsigned long address, pte_t *ptep,
 			  pte_t entry, int dirty)
 {
+	unsigned long old_pteval;
+	unsigned long new_pteval;
+	unsigned long prev_pteval;
+	bool changed;
+
+	old_pteval = pte_val(ptep_get(ptep));
+	do {
+		new_pteval = riscv_pte_access_flags(old_pteval, pte_val(entry));
+		if (new_pteval == old_pteval)
+			break;
+
+		prev_pteval = cmpxchg_relaxed(&pte_val(*ptep), old_pteval,
+					      new_pteval);
+		if (prev_pteval == old_pteval)
+			break;
+
+		old_pteval = prev_pteval;
+	} while (1);
+
+	changed = old_pteval != new_pteval;
 	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SVVPTC)) {
-		if (!pte_same(ptep_get(ptep), entry)) {
-			__set_pte_at(vma->vm_mm, ptep, entry);
-			/* Here only not svadu is impacted */
+		if (changed)
 			flush_tlb_page(vma, address);
-			return true;
-		}
 
-		return false;
+		return changed;
 	}
 
-	if (!pte_same(ptep_get(ptep), entry))
-		__set_pte_at(vma->vm_mm, ptep, entry);
 	/*
 	 * update_mmu_cache will unconditionally execute, handling both
 	 * the case that the PTE changed and the spurious fault case.
@@ -32,9 +64,23 @@ int ptep_set_access_flags(struct vm_area_struct *vma,
 bool ptep_test_and_clear_young(struct vm_area_struct *vma,
 		unsigned long address, pte_t *ptep)
 {
-	if (!pte_young(ptep_get(ptep)))
-		return false;
-	return test_and_clear_bit(_PAGE_ACCESSED_OFFSET, &pte_val(*ptep));
+	unsigned long old_pteval;
+	unsigned long new_pteval;
+	unsigned long prev_pteval;
+
+	old_pteval = pte_val(ptep_get(ptep));
+	do {
+		if (!(old_pteval & _PAGE_ACCESSED))
+			return false;
+
+		new_pteval = pte_val(pte_mkold(__pte(old_pteval)));
+		prev_pteval = cmpxchg_relaxed(&pte_val(*ptep), old_pteval,
+					      new_pteval);
+		if (prev_pteval == old_pteval)
+			return true;
+
+		old_pteval = prev_pteval;
+	} while (1);
 }
 EXPORT_SYMBOL_GPL(ptep_test_and_clear_young);
 
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
