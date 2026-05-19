Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD4FACD4F54
	for <linux-riscv@archiver.kernel.org>; Tue, 19 May 2026 03:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O8lvfANnUewq5CpFb6P+mkE2b1TiNlRwoxxdoau2eCk=; b=Ee2GL39PHghRI2
	0+8bbLvfP5J1J/9LqkGgeOYdsm/ZGX+XuuMdjo0uLIPK4mw6j4urHQMSjlvwV1X2kqGMYVnj+3qoi
	B0cVA9LXLDPs4RUgA5NCJDsB9jM97z+u1fGXMW0DUufvwuQXZpQm25wkBt4rwliLeXViS92Dv9Rer
	J0FFStZQQwSpCVoxP4l4133aQYcu3pqyKoaDtVP5zAv2XY3pvbvwwFBO4JYlfDLanFNJkHVtIt9tk
	leHquPDD/5oZV894CfjxA2MobnqNxaZT9WUdWO2Z+lwklMrVnJb4QPK4IFhE9TkgAkHxn0Y8FU2uK
	Kfdia0mMAMCnluJpLU8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPB17-0000000HYg1-0xVk;
	Tue, 19 May 2026 03:21:13 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPB14-0000000HYea-03tV
	for linux-riscv@lists.infradead.org;
	Tue, 19 May 2026 03:21:11 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2bcd3ac3307so16756695ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 18 May 2026 20:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1779160869; x=1779765669; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h4fHtLWbjgxAw/RuryI1Zn991wS9DJVk1T6sfJuVej8=;
        b=Dpw3BP4oOAxLuAglaDd+g/V0aOcIP2gPcy13yo4MxOSRxSvNCCNKb4IJJfK1VAiSah
         SiHwhfQpzr4Wq0176/tBwyN4eY8YoCWm/Nsp6meHaRz2asoC8AQdzWl5YHMbnYHGkj1A
         nvcJSbDLh6xpfzMMHO81RA3L1tCe/Cjegm6y5L6UslyBdpfC/2FFcA0DoraqzvR8mVp4
         ib6KrxohEpDwFeywLAfBWjl1Q9C6an9T7X3aGxWPgd7UTfsjKTilTZxq+6E4jORUXJMw
         UWA0w6phwZVeELeHJNVxj76zdzxIklRK9GHGyKR292obRLdUqxui4C/9nR6FvfJIZyQv
         oFlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779160869; x=1779765669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h4fHtLWbjgxAw/RuryI1Zn991wS9DJVk1T6sfJuVej8=;
        b=iC5TCodpta5bJtwn2Med2tb4/nJwWS9jDWOEaCFKJAlQHwHkWdQRepqaSYj+VGiJ1V
         ZqK0Iu12nEVHml6T7/sAGPg4Qzqnl7+10dhmIeT0Ys7jztHyMMxFu5iLo5/XsK3KiuCV
         x1QFCJVMEM6xVvon8J9UKJTJRpBWlPwwYBayy/jr+aivfOFA8WWPfBD3x0V0V5A1SE+J
         Z0VDLceSMH4OP3B0sc0oC0ax4CNtoPQgZ1Vyui+BIigdVoZ5kEr9/HPSViIFRvj6MkZl
         v6kWCb0fLoTXM4cSejze0iCo8mqIV2ogLnDSzTIHxS8ReCxK0Os9gst/7AkGCexmwHE+
         KQNg==
X-Forwarded-Encrypted: i=1; AFNElJ+jN/P8BnBeWPUmXpl6EHFNhXMNg5lp+aMe0zU8USSgil8uwNsfDRr7/TwRrtviE7WGDKFFxCLzDEn9Dg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy83Pn/UxWcC02j5MA2nyIYQZkv87iD78yzLnxE+JnD2pNWny/f
	DPsQp7FifpGyTaUVogftyxecM+Q/bMRctOceMlwCNNDRgrJbPkla1DiL77b7BSoMYRQ=
X-Gm-Gg: Acq92OHyqCpS0A2qgb/B42jCZX8JEvnPvMd/yy71vN6VzqgBuejbcW8jC1yd1AfkA6B
	737LgOGezpLA6GN05kEnXJ+/58bPzV0Bbz1NqE46gUt6E68nsuL/k7PnjEVbLO93kwySRP6twEh
	SvzWmPDvQUeyuqM1gLc2vxiyPDGEnC3kJ3zw8fsQHh0A7lV4JIvVm2fyPgUULwunT8larLJ/tNG
	naoiYKTb+yy5mqYS63dkelHGWdiemHkWXyKCBcIwNJ2ekcMOmb87SFuJnULOCfs5ZCPPhzKa9OB
	NYqHFUFgqMaVFE4VWz3qSib9PMYCPAjXmoVIC2nsa4PVJq2xhLCnI8meHvS3Ylm73AiJTD7DltK
	TE2XkEsu/EHrPuUWjJiVDB6dn1D9lZscKmL/5uVLbdUlqgfrQNXGZ8vmvLWjBlhZoeFnXh64jZL
	8f4E5bikTVg52t0m80RF3mNqluK6A+huz7cCvv5DqWGc+2arJ8
X-Received: by 2002:a17:903:2a8f:b0:2b2:57f3:8d07 with SMTP id d9443c01a7336-2bd7e8ae696mr183879905ad.7.1779160868998;
        Mon, 18 May 2026 20:21:08 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([2001:218:2001:0:1000:0:1:7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c16ac4asm156453495ad.33.2026.05.18.20.21.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 18 May 2026 20:21:08 -0700 (PDT)
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
Subject: [PATCH 2/2] riscv: merge hardware A/D updates in PTE accessors
Date: Tue, 19 May 2026 11:19:27 +0800
Message-Id: <20260519031927.70683-2-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20260519031927.70683-1-cuiyunhui@bytedance.com>
References: <20260519031927.70683-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_202110_057366_6B1217E2 
X-CRM114-Status: GOOD (  14.95  )
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
