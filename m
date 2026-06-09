Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF0FECD8CA4
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jun 2026 13:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nVkv2X3/5Uyh5q0GbaUfEx3JKdXmqewjApBHhkULAJY=; b=qur1SWxg2g4/fS
	35LdI0UDi4a1p1rOWoEbmFq/FUWE+rVsZocCGsvZcEI90F+LC08DrM3jdrU1OzpjIQFgb7mnZjmTU
	AhLS3S1Fm1Ab678nkYotrai0S9SvAhsE5mlukZnzMWFhG7EdibnlZdU3QIkxvi/1UGoSQnBetcc6W
	Nf40foq24piJ3U2kAvSM9qKAN9JTlnU760zdAVFs5McUjm8LRPsWumLsSzeFaPNz5Zx4/xK30ae3K
	ZxJZiEzalf70PzpoAvYkMxh7XlAZo9Nt3NJ1ZcCSUhz4S1khsz51SHQTOSH5USVWACVG9DLTmvoLQ
	dO/QQwA6Qn+iuHLOxRzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWw5N-00000005cH4-2TSs;
	Tue, 09 Jun 2026 13:01:41 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWw5K-00000005cG6-3hRE
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jun 2026 13:01:40 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-36d5b11201aso3504167a91.2
        for <linux-riscv@lists.infradead.org>; Tue, 09 Jun 2026 06:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1781010098; x=1781614898; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3mY4IoCKia/XuJ/oNtOCFVHCKeBb5u4W4dO0pcbEY+A=;
        b=LIKo42vHT1DgTRohJp/BJXJ3nhPYEk91SG+VDvL/FvHHOPNF7xDetXjGHCQgAZeuk7
         s4m7s7N4GH90mBR0u/npvBnaMjRVdoahsfnQyMp3mtCTFF0OM/i0tY2KWI+IRIxhF4Zq
         pGZ9/I0G2D51tooiiPSvO7zufuHAJkL21zm0EIX2iv+UiMBeuJSvmHsaTv87nd5lbY3l
         7e40Wo5pnyYUUQMMSCe0g0jU0NDiByiMPICfCCNsy8GKo95IE9yaIFOOeNY9tyF4y7Pz
         1EqTFNA93W/RzDpqa0+2Q6He1DV8gpRLZBbaG2UAbMO6tuxuvuUZCTXZLTKtgQU9vXij
         hZ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781010098; x=1781614898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3mY4IoCKia/XuJ/oNtOCFVHCKeBb5u4W4dO0pcbEY+A=;
        b=in1mxcdUQ8CylWoJ36ilFCGGz0FvFabohvfMAxfkEjTWRmfNWdF9BSV0vjR8xEJpFm
         ZbBv/AK9Q1Yca/eVanEa/pvD+Kqq+fBoCBb17Gv5MaxhmYaG5aCuugFOPHrA8HEEqXAo
         vW7fW0hA+vEmCXPnMutNYzYFAMfVAJvLpAWaoBTHC0e3H+5qZrDfNcUmelWr1tG9hxZt
         ezyh6JA5JfALgyrhyu7p8V4/mny0a8/uoQT2KtiygesHP9s13EypHcf/6b+MG+/G9oNb
         EyO2KEz3WRZT0o6BBjAal99CD7AeZfJTaEtNwsHX3QC125JBk8SY8Jc+P8MqXpwgD72/
         F3Pw==
X-Forwarded-Encrypted: i=1; AFNElJ8Fu1JfuNN2dG1SfV/1NukiOUMqwrCzBsFnjVltOHMEcTo5SUZ1EdI3GOFfTn+kdj+21wuo+2GCAYzUTg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyk1jAiInbTINKgAAPnTHQxxC2EAfagP8db2DCQCTDUWfYZTWlg
	TJnk/hXq5jRqiw86qV7nSSLx4DFdqQcrEMry92jj/iXVdivdVLGQ45XleHeFQ/+iyac=
X-Gm-Gg: Acq92OHXu7zyccVI1QcEcercXGUs/04BaSaK5trbHXMXp7Jdduf1c0CHXhVPy8uvNcc
	4B95UPw26GNeOTJDk0m0mL8iU9pGS6yqPJm6XiHjQalD9T1sVjcToF6rkIp+jaQEpjHJwqrPyY1
	5xrs1RaxNI1ETSsQAr1eFVEvuv/825PUesSRVfnr6SQA4foM8BCS3m8WzYEr4gNjUYw3JeZ8obj
	vAXahLNBG+MmwWC2du9EdxCl2XAZw3IAW9vBCRTeAygPPDGHSZAlNSCsBtwBTKT0NQ+u2uensSi
	pWJPwB8WE620oRjmoabte/9SfaG7fHL5OHLEic7m7mCEhpugz8gySuU+K6KswpG8t2krpfQmwNI
	RndqOatL4VlrLSnIdv6zmZJrJvReUDCI4kh/m/P9ZadJVpjuhZYvg32pY9e72QOiBepLD5gpgFE
	4LqfZdgB87co8hoxJl4zjNivZHUViYvT4g0B9fKEWIHK9jaIygObscj2+wRr8dmUQaR90=
X-Received: by 2002:a17:90b:6c3:b0:36d:b9c5:e8f6 with SMTP id 98e67ed59e1d1-370f0481909mr22489848a91.19.1781010094844;
        Tue, 09 Jun 2026 06:01:34 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.240])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6bf8284dsm23267889a91.4.2026.06.09.06.01.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 09 Jun 2026 06:01:34 -0700 (PDT)
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
Subject: [PATCH v3 3/3] riscv: preserve A/D and soft-dirty state across PTE updates
Date: Tue,  9 Jun 2026 21:00:20 +0800
Message-Id: <20260609130021.99899-4-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20260609130021.99899-1-cuiyunhui@bytedance.com>
References: <20260609130021.99899-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_060138_928753_7555CACC 
X-CRM114-Status: GOOD (  16.22  )
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
