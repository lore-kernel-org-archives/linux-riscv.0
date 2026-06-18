Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22EBACD98ED
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jun 2026 06:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nVkv2X3/5Uyh5q0GbaUfEx3JKdXmqewjApBHhkULAJY=; b=dQfMZXZ2PxUOGK
	xh3VJJiNY0BwBo1jvLscC7u8rvU1lu6MwbsmSSu8xtMjh4PcqMOCvpvYaxVzIpyXzV4Ga+nCXpSyU
	OWl3AnzPI1W0TQupN9WBbxRXe1xc5TOvngF3beagu6D1TGYyExjbutQfhBSPalLWG/M8YTdMivOkc
	dQcg5zS5coOzMuFNELb33PEqehc3qqlMteg9omEfutIt/to3638zySrq69ZsvevSZ3p1RmXBjliny
	Yy0jdnfQhUaNReTYRjUT4YoSM8Hd84ZQuPmcpGFrKmJ85cB0D5Kf2M1vnUcFLQnAFHTkdFaK0gpn1
	kbF9/kroU7WrrHBJuz+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa6V3-00000000i3z-3sFU;
	Thu, 18 Jun 2026 06:45:17 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa6V1-00000000i3A-3pc0
	for linux-riscv@lists.infradead.org;
	Thu, 18 Jun 2026 06:45:17 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2c0c1e0b0faso4228385ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 17 Jun 2026 23:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1781765115; x=1782369915; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3mY4IoCKia/XuJ/oNtOCFVHCKeBb5u4W4dO0pcbEY+A=;
        b=OVvb/Ab2uopdQ8zZSw9ENgIyS3JkCX8JvfOLvAj6algBWXyOFCVdQezJ/ph7WVWZ9W
         B+12o/wUPQPCIYdibVLd9GJCQtttoNdtY/oRFWLhPz4W/D9atYtBigEBpNZdk6UcUlb6
         rAco5Vbz2PI7NM8lJPAxMfG33xWAyT/w9XEv77g4kybZtD39scYQQkW2X7S8HdbyrW99
         6N3Iy/tGKhCh2wks0nAsxW3Q1688N/imsrUjszhdtMvqw3eu4Bca4fRZjb1qn3cpXh8k
         Jemjz1mqwLiOQwSC1cm5s0EbzQ5IabnsNMfFvNrZQCKm0QXJMMHITVjKeu9CC7eoqPuC
         RvYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781765115; x=1782369915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3mY4IoCKia/XuJ/oNtOCFVHCKeBb5u4W4dO0pcbEY+A=;
        b=Eo4W7S5ewm5GSeXO+ZlJw2r5c/tiR2QtZVxYtbVDQkkP24K84gS4Fl7gPcxkGJWMMI
         UYxOfdU8sriKf5igngAYfIpeLTYxa9adb9MNx2Upv9PYNMJVvsvQr9SvihirAW8CRR3N
         rse0ivKnXQI7CSu6YF1ojGwxNAXYi9igyVRT43UaxX6n4PsIF20Iq6L2kDzFQu8bvert
         qtggCErFvuwfSb0JzBdJft+YpDJm2gS6LQ4/h0Eru6czkI4nTejf0CHRpzR8CjzLva0/
         bNddfroKJez/daNa+KILepQK3nAYt4mrcv3A1nUpHBfzOU0dKR+/2wfE6ps7biIEdnYe
         lFqQ==
X-Forwarded-Encrypted: i=1; AFNElJ8PN+lPRi8F8sHF8x2+ULkRsi3I24Qt5jYcpsqPxPvpCw6K4ryHHPeocPiT81RdQ9Z25dGX+NmIpm/ZnQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6XUz3r1I9D82XNT3IMrq32TJI4ij/gGn4k5Pnwe5RAHHSJwcw
	xnVQR8qBF1+yMp4CnfUyyOPIu0BCt4FjobU/7Ddo00iFJa/1srZNo6YXwlt+eRjlLSE=
X-Gm-Gg: AfdE7cm42zfICycbgCY5cCIyOqmjs836tjQgtXx2ZFyP7ToIRJoiVuTO7zA7xY7MWtP
	UVJ2XTxeALQkD2gN33pXcmRvYARaV3UDDdsWX6xpnuLCkVMwZsyKVkLj2UQ1YPy/P1e6T/asQEK
	Z9VlVCIXX/ervOJORQFBWRoTU2SPUvR6JfM7fisyf4zVW+NkGys7HHDG2lSegD0sOUTNeW6jwyz
	H9eVgKTE6bJKoaen2uPTSC/kpZudTJc4HHGXNg2vBkEM2lrH/bVQgXVoWHOL9Pqri7CV0C/mion
	xWu1cVvI7zeOhHJQ+oDnu/8bj7/fK41FrEAeZ/UGNFHQPoMUebND3TkBRIduj9DVdWQnWcga5tO
	//WlbhcRNraCFQU5+OhtOkNQ3KoOGFwpdXBg3j8hy9PhjL9qzEN1SEHNQ87glRmu0Xm+IOKgtye
	LgkrPHz4Uf91eajAnLSdRiq19msQZ0TFoz56zO8dlblz3bzQ==
X-Received: by 2002:a17:903:1b6f:b0:2bf:77b2:8b2d with SMTP id d9443c01a7336-2c6bc25ca62mr70159885ad.30.1781765114873;
        Wed, 17 Jun 2026 23:45:14 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4328a4c1fsm185275985ad.53.2026.06.17.23.45.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 17 Jun 2026 23:45:14 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: akpm@linux-foundation.org,
	alex@ghiti.fr,
	andrew+kernel@donnellan.id.au,
	aou@eecs.berkeley.edu,
	apatel@ventanamicro.com,
	apopple@nvidia.com,
	atishp@rivosinc.com,
	baolin.wang@linux.alibaba.com,
	cleger@rivosinc.com,
	conor+dt@kernel.org,
	cuiyunhui@bytedance.com,
	debug@rivosinc.com,
	devicetree@vger.kernel.org,
	guodong@riscstar.com,
	hui.wang@canonical.com,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	liu.xuemei1@zte.com.cn,
	namcao@linutronix.de,
	nick.hu@sifive.com,
	palmer@dabbelt.com,
	pincheng.plct@isrc.iscas.ac.cn,
	pjw@kernel.org,
	qingwei.hu@bytedance.com,
	ritesh.list@gmail.com,
	rmclure@linux.ibm.com,
	robh@kernel.org,
	wangruikang@iscas.ac.cn,
	zhangchunyan@iscas.ac.cn,
	zong.li@sifive.com
Subject: [PATCH v4 3/3] riscv: preserve A/D and soft-dirty state across PTE updates
Date: Thu, 18 Jun 2026 14:44:06 +0800
Message-Id: <20260618064406.14508-4-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20260618064406.14508-1-cuiyunhui@bytedance.com>
References: <20260618064406.14508-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_234515_955331_8A47A298 
X-CRM114-Status: GOOD (  15.94  )
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

Use cmpxchg-based PTE updates so software permission changes do not lose
concurrent A/D updates from hardware. Preserve soft-dirty state as well,
since RISC-V marks PTEs dirty and soft-dirty together.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
Reviewed-by: Qingwei Hu <qingwei.hu@bytedance.com>
---
 arch/riscv/include/asm/pgtable.h | 27 +++++++++----
 arch/riscv/mm/pgtable.c          | 68 ++++++++++++++++++++++++++------
 2 files changed, 77 insertions(+), 18 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 5d5756bda82e3..02286b48dc471 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -678,15 +678,21 @@ static inline pte_t ptep_get_and_clear(struct mm_struct *mm,
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
@@ -742,14 +748,14 @@ static inline pgprot_t pgprot_writecombine(pgprot_t _prot)
 #define pgprot_dmacoherent pgprot_writecombine
 
 /*
- * Both Svade and Svadu control the hardware behavior when the PTE A/D bits need to be set. By
- * default the M-mode firmware enables the hardware updating scheme when only Svadu is present in
- * DT.
+ * Both Svade and Svadu control the hardware behavior when the PTE A/D bits
+ * need to be set. The core MM code only cares whether hardware updating of
+ * the accessed/dirty state is currently active.
  */
 #define arch_has_hw_pte_young arch_has_hw_pte_young
 static inline bool arch_has_hw_pte_young(void)
 {
-	return riscv_has_extension_unlikely(RISCV_ISA_EXT_SVADU);
+	return riscv_has_hw_pte_ad_updating();
 }
 
 /*
@@ -1040,6 +1046,13 @@ static inline void pmdp_set_wrprotect(struct mm_struct *mm,
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
index 9c4427d0b1874..98eed19ea70de 100644
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
+	unsigned long preserved_flags;
+
+	preserved_flags = _PAGE_ACCESSED | _PAGE_DIRTY | _PAGE_SOFT_DIRTY;
+	pteval = cur & ~RISCV_PTE_ACCESS_FLAG_MASK;
+	pteval |= entry & (RISCV_PTE_ACCESS_FLAG_MASK & ~preserved_flags);
+	pteval |= (cur | entry) & preserved_flags;
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
