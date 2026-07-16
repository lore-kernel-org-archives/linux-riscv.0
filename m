Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43CE1C44515
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2026 12:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IOEN+bmNxnAPRoVsdkXI8KkW1V0oCXw/qN6tIAVEw5w=; b=3thxw898HTof2u
	i54v399YFuxJOtYWZ1CThVogFYhW6CFTZPvhPQAJp5sktbO3MTi4GeEH/XB/ZDZW2TifJMyPur9od
	shQijt7MmRgeLRw2Uqx7fgIrxJhrzV+nvz1RvzVXn0I6gGIkBknWBGBcmfBu109xdB8Y8oBlWXofk
	uMlXnGksYJ/KXvy1uPfZxE1AQkgI6SQNAtO6P5nUvMKcGgxX4AlY5iqx1ri+LRMEtzFaadrfcYV0I
	MH4zUBU4+3xEcqx2JFSTRoCzPgJ2zpD4EKiO76LE6Opwt/lMc16MxQIhXg8ZFe+qdFXJq7RcIX/sG
	zeAlNhxv1cMi9FvBaR3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkLQU-0000000HHrv-2SjK;
	Thu, 16 Jul 2026 12:42:54 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkLQR-0000000HHpk-3B17
	for linux-riscv@lists.infradead.org;
	Thu, 16 Jul 2026 12:42:52 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-c99eaa1f020so3118274a12.2
        for <linux-riscv@lists.infradead.org>; Thu, 16 Jul 2026 05:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1784205771; x=1784810571; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ldlfwiuLgMW2soE43Rq8OVhlEemN/KhXMrXMzIbx114=;
        b=KpQDlPwu4XHge7/h1velBafWtMGK7DHCSO+xKsf2b100JnaHp9rnMslyxTR3O8BcT/
         k6Unj82fLDPqTaRCGfcJnk7ZOrN7peni+T5drfp3h+peg6YedjCDaXvWOEjgWZ0wYPQL
         7oHX7uEB8wUxndT+ROlM+MbommMZWHgNpmQk1U/j6vsIZkHXe0TcUB4HrpkKfIrAuThN
         ZpwvAdUcCPOj+2LJFsFqZWgZzl9yq5dKmeO0b9P1mK7bdd4jYrT9idblWKwNY2Kftbpt
         g7+ZcwjgvglK/0zq/YloETazKS2tkaVVWgmq0fGjITjribfYK1nu1PqYXajDDjlZ1Zyt
         0R5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784205771; x=1784810571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ldlfwiuLgMW2soE43Rq8OVhlEemN/KhXMrXMzIbx114=;
        b=RIuHShbchGwOLFSIRAG8SKIpcdULuCGCEdNwqrVOjApVKoALQllGCm+GUgf4a+JKEA
         tO05Q2ETkLE3+0cm9EzFktOEA6qCVZ6gOFH565k4dLi+e4qNPWiBofe6HHVOOVVTNcwC
         ELExOnoxQBaZ82OGQam8aQIOm3RLQtfavwA2RFqxiFjg3VZzx99hs2komyA3bwWp9EuT
         mGKvbXhdubL7eCoaYBumkQLMz2KvG8j5b66NOQ2YL+YJUW8B4fuGNTz/+TgdI8ixgneI
         x9Vrswj7wzVJ5Td0QM8+Bqg1U/8U5jYQsmaSMYxCXjvGgKPLmJ9HbkucHHZVxaY7Zmas
         iVlQ==
X-Gm-Message-State: AOJu0Yz1LFUqmqCUhCCETcG62R32xwHsOrDr3kSMdB86HSi7+gfql4GN
	0TT2pAJk73kRgudws8emLgNtrOtOSamoIDnR1lCbdPaI6WtcMj4DXcCydzWC73LwP0rGSUu7fju
	EPv7t0GM=
X-Gm-Gg: AfdE7cnSnddVGrRbjRe3CBgOj+Egp/EuwJW6HFJh/v+VB1s3nY0rVxUIf470cCZP3II
	zZhr/nuGCF2uFfj0h6J/k51LWF1bxcZ39GRvhQKyprHBe1Dlexd3/kEbag2Dc3/7qR7CpBsJ1wv
	i2ZhjRKTXcvSnsUx48GPsTziHEIFrIgZhK778eRIBRuyO8wZndtt1NjqrAegH6TH6V6ko9exy8j
	9AZvVaZs5wUEWCAp0VZjPNbUtXFpdzdMQv6ucosc1tBNSunSAK4CaRbYCJfGDz1+o29ddkvGA2l
	sLEXh+6ZgKEeGj3LLoqQAr0PHqemUL5V8Yc9cCReuFfpUu7FoD3iu6yD3dZJFdZA0SFull/J/ln
	Z7Jv7m7IflrWpz+Z0381FX+i9waelEI2oQwMz0NhJJcPKj9rf5XIJcj5JELhyWjbVcafCRmWe2C
	nCNRdfxzDNiMFkjoocgZGP9HNQHOs4DBdPXg==
X-Received: by 2002:a05:6a21:10b:b0:3bf:b1d3:393e with SMTP id adf61e73a8af0-3c110009b76mr25226010637.2.1784205770620;
        Thu, 16 Jul 2026 05:42:50 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([2408:8606:1800:501::2:f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb258eeaba2sm1730793a12.12.2026.07.16.05.42.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 16 Jul 2026 05:42:50 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: linux-riscv@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Cc: linux-arch@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-efi@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	kasan-dev@googlegroups.com,
	Yunhui Cui <cuiyunhui@bytedance.com>
Subject: [PATCH v2 01/15] riscv: introduce raw PTE helpers
Date: Thu, 16 Jul 2026 20:41:36 +0800
Message-Id: <2bde82cde4c262d35663d386e8a16455c76ec3e6.1784201104.git.cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <cover.1784201104.git.cuiyunhui@bytedance.com>
References: <cover.1784201104.git.cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_054251_819899_F9975333 
X-CRM114-Status: GOOD (  13.37  )
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

Svnapot needs RISC-V to distinguish between two PTE views: the raw encoded
entries used by architecture code, and the logical per-page PTE view that
will later be exposed to generic MM paths.

Split the low-level RISC-V PTE operations from the public helpers so the
raw helpers can keep operating on the hardware encoding, while follow-up
changes build the Svnapot-aware public view on top.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/include/asm/pgtable.h | 129 +++++++++++++++++++++++++++----
 1 file changed, 114 insertions(+), 15 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index a810655ce8f9b..8ca5da9534967 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -9,6 +9,7 @@
 #include <linux/mmzone.h>
 #include <linux/sizes.h>
 
+#include <asm/cmpxchg.h>
 #include <asm/pgtable-bits.h>
 
 #ifndef CONFIG_MMU
@@ -628,11 +629,13 @@ static inline int pte_same(pte_t pte_a, pte_t pte_b)
  * a page table are directly modified.  Thus, the following hook is
  * made available.
  */
-static inline void set_pte(pte_t *ptep, pte_t pteval)
+static inline void __set_pte(pte_t *ptep, pte_t pteval)
 {
 	WRITE_ONCE(*ptep, pteval);
 }
 
+#define __set_pte __set_pte
+
 void flush_icache_pte(struct mm_struct *mm, pte_t pte);
 
 static inline void __set_pte_at(struct mm_struct *mm, pte_t *ptep, pte_t pteval)
@@ -640,13 +643,13 @@ static inline void __set_pte_at(struct mm_struct *mm, pte_t *ptep, pte_t pteval)
 	if (pte_present(pteval) && pte_exec(pteval))
 		flush_icache_pte(mm, pteval);
 
-	set_pte(ptep, pteval);
+	__set_pte(ptep, pteval);
 }
 
 #define PFN_PTE_SHIFT		_PAGE_PFN_SHIFT
 
-static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
-		pte_t *ptep, pte_t pteval, unsigned int nr)
+static inline void __set_ptes(struct mm_struct *mm, unsigned long addr,
+			      pte_t *ptep, pte_t pteval, unsigned int nr)
 {
 	page_table_check_ptes_set(mm, addr, ptep, pteval, nr);
 
@@ -658,24 +661,85 @@ static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
 		pte_val(pteval) += 1 << _PAGE_PFN_SHIFT;
 	}
 }
-#define set_ptes set_ptes
 
-static inline void pte_clear(struct mm_struct *mm,
-	unsigned long addr, pte_t *ptep)
+#define __set_ptes __set_ptes
+
+static inline void __pte_clear(struct mm_struct *mm,
+			       unsigned long addr, pte_t *ptep)
 {
 	__set_pte_at(mm, ptep, __pte(0));
 }
 
+#define __pte_clear __pte_clear
+
+#define __ptep_get __ptep_get
+static inline pte_t __ptep_get(pte_t *ptep)
+{
+	return READ_ONCE(*ptep);
+}
+
+#define __ptep_get_lockless __ptep_get_lockless
+static inline pte_t __ptep_get_lockless(pte_t *ptep)
+{
+	return __ptep_get(ptep);
+}
+
+static inline void __clear_young_dirty_pte(struct vm_area_struct *vma,
+					   unsigned long addr, pte_t *ptep,
+					   pte_t pte, cydp_t flags)
+{
+	pte_t old_pte;
+
+	do {
+		old_pte = pte;
+
+		if (flags & CYDP_CLEAR_YOUNG)
+			pte = pte_mkold(pte);
+		if (flags & CYDP_CLEAR_DIRTY)
+			pte = pte_mkclean(pte);
+
+		pte_val(pte) = cmpxchg_relaxed(&pte_val(*ptep),
+					       pte_val(old_pte),
+					       pte_val(pte));
+	} while (pte_val(pte) != pte_val(old_pte));
+}
+
+static inline void __clear_young_dirty_ptes(struct vm_area_struct *vma,
+					    unsigned long addr, pte_t *ptep,
+					    unsigned int nr, cydp_t flags)
+{
+	pte_t pte;
+
+	for (;;) {
+		pte = __ptep_get(ptep);
+
+		if (flags == (CYDP_CLEAR_YOUNG | CYDP_CLEAR_DIRTY))
+			__set_pte(ptep, pte_mkclean(pte_mkold(pte)));
+		else
+			__clear_young_dirty_pte(vma, addr, ptep, pte, flags);
+
+		if (--nr == 0)
+			break;
+		ptep++;
+		addr += PAGE_SIZE;
+	}
+}
+
 #define __HAVE_ARCH_PTEP_SET_ACCESS_FLAGS	/* defined in mm/pgtable.c */
 extern int ptep_set_access_flags(struct vm_area_struct *vma, unsigned long address,
 				 pte_t *ptep, pte_t entry, int dirty);
+int __ptep_set_access_flags(struct vm_area_struct *vma,
+			    unsigned long address, pte_t *ptep,
+			    pte_t entry, int dirty);
 #define __HAVE_ARCH_PTEP_TEST_AND_CLEAR_YOUNG	/* defined in mm/pgtable.c */
 bool ptep_test_and_clear_young(struct vm_area_struct *vma,
-		unsigned long address, pte_t *ptep);
+			       unsigned long address, pte_t *ptep);
+bool __ptep_test_and_clear_young(struct vm_area_struct *vma,
+				 unsigned long address, pte_t *ptep);
 
 #define __HAVE_ARCH_PTEP_GET_AND_CLEAR
-static inline pte_t ptep_get_and_clear(struct mm_struct *mm,
-				       unsigned long address, pte_t *ptep)
+static inline pte_t __ptep_get_and_clear(struct mm_struct *mm,
+					 unsigned long address, pte_t *ptep)
 {
 #ifdef CONFIG_SMP
 	pte_t pte = __pte(xchg(&ptep->pte, 0));
@@ -690,9 +754,24 @@ static inline pte_t ptep_get_and_clear(struct mm_struct *mm,
 	return pte;
 }
 
+#define __ptep_get_and_clear __ptep_get_and_clear
+
+static inline pte_t __ptep_clear_flush(struct vm_area_struct *vma,
+				       unsigned long address, pte_t *ptep)
+{
+	pte_t pte = __ptep_get_and_clear(vma->vm_mm, address, ptep);
+
+	if (pte_accessible(vma->vm_mm, pte))
+		flush_tlb_page(vma, address);
+
+	return pte;
+}
+
+#define __ptep_clear_flush __ptep_clear_flush
+
 #define __HAVE_ARCH_PTEP_SET_WRPROTECT
-static inline void ptep_set_wrprotect(struct mm_struct *mm,
-				      unsigned long address, pte_t *ptep)
+static inline void __ptep_set_wrprotect(struct mm_struct *mm,
+					unsigned long address, pte_t *ptep)
 {
 	pte_t read_pte = READ_ONCE(*ptep);
 	/*
@@ -705,9 +784,11 @@ static inline void ptep_set_wrprotect(struct mm_struct *mm,
 			((pte_val(read_pte) & ~(unsigned long)_PAGE_WRITE) | _PAGE_READ));
 }
 
+#define __ptep_set_wrprotect __ptep_set_wrprotect
+
 #define __HAVE_ARCH_PTEP_CLEAR_YOUNG_FLUSH
-static inline bool ptep_clear_flush_young(struct vm_area_struct *vma,
-		unsigned long address, pte_t *ptep)
+static inline bool __ptep_clear_flush_young(struct vm_area_struct *vma,
+					    unsigned long address, pte_t *ptep)
 {
 	/*
 	 * This comment is borrowed from x86, but applies equally to RISC-V:
@@ -724,9 +805,27 @@ static inline bool ptep_clear_flush_young(struct vm_area_struct *vma,
 	 * shouldn't really matter because there's no real memory
 	 * pressure for swapout to react to. ]
 	 */
-	return ptep_test_and_clear_young(vma, address, ptep);
+	return __ptep_test_and_clear_young(vma, address, ptep);
 }
 
+#define __ptep_clear_flush_young __ptep_clear_flush_young
+
+#define ptep_get __ptep_get
+#define ptep_get_lockless __ptep_get_lockless
+#define set_pte __set_pte
+#define set_ptes __set_ptes
+
+static inline void pte_clear(struct mm_struct *mm,
+			     unsigned long addr, pte_t *ptep)
+{
+	__pte_clear(mm, addr, ptep);
+}
+
+#define ptep_get_and_clear __ptep_get_and_clear
+#define clear_young_dirty_ptes __clear_young_dirty_ptes
+#define ptep_set_wrprotect __ptep_set_wrprotect
+#define ptep_clear_flush_young __ptep_clear_flush_young
+
 #define pgprot_nx pgprot_nx
 static inline pgprot_t pgprot_nx(pgprot_t _prot)
 {
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
