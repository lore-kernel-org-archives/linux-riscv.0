Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67623C5AD4C
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Nov 2023 06:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XmPBk2Kh84SW7wzL34Oy4ZNf2grCfUw+0sSuU474vA8=; b=2W2XSD1jyX5zcb
	54al64+AmkX4+QQLx0ZF8i4Cpk8FFiYXwSqph9mi/fmn35cVuQhzXI3z2Lgd4tyIf9xPB4NHMvduG
	tNqE+N/TnANXrhCLvGB9kKdBUQUd5H/IQttYPpvlE2m86xLJ76Fnaq3L4wNYh621Yiuivtc64hflF
	eXn69PWyjxn9jQFLl478+hu1cQYTYuq/WwsSGUofsC78osNLnkK7IRxDhrzLuwFjRJsE2bn8D3hud
	lWTWZJNACvsQXczeMTDtJi5OKQFOaXdPQWWYzhYdM7fr/VBhw6wfoAO/ID00fv0QCNPbNE4PBznLN
	qUBlGkBJnK5rIrlB+5Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r63es-003xLA-0i;
	Thu, 23 Nov 2023 06:57:54 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r63eo-003xJ5-0r
	for linux-riscv@lists.infradead.org;
	Thu, 23 Nov 2023 06:57:52 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-6cbd24d9557so429766b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 22 Nov 2023 22:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1700722667; x=1701327467; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FqqTxLyku7Pb+ctpWN2ROyQtTus2hT3Qjo5g/GoNKE8=;
        b=lFNDpdKLNs/WqKns5cv0TGag+7MCfIAsJ02SVbmQtKYZwqvAXb7ee3nk/boRcVtvYh
         IxXUA5r7QoKdMipVdPdsMKGp+clSg3D+Vzf6+GrzBcywdKnaBsXQISfmR2KX02AVvtDd
         pmppJb27qwn9QZTdXUjtWqT38y9j5rMr5rxTe5V6by3575PNL1VoyZmqgdOpkDuPMkDC
         vkLSijSGc2y9AoT4wpNDhVC1sn/R9zJ+z8nrRRyhIoYgke7q6O649urUDQJqR+Zot2I0
         y1IwChIdewl9cG2AdEAct0yd49KBSw/lEy/MSbWA+mobG1fC3pAYT2mHsWBsUFe3Xcc5
         9k1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700722667; x=1701327467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FqqTxLyku7Pb+ctpWN2ROyQtTus2hT3Qjo5g/GoNKE8=;
        b=scGy26weIRIlVLFfblYV9fcT1TemkZ00X+BGbCO69C264WjhGwUAy4Ls9z4X9ZTSlG
         K2rm8Ny+dvRVA4gptkyxHmYPiL8t1iECaEHOqnX7fj85VAWxk8HwQBK7ReiF9ruflSZj
         LLgZ6hUa13nJJq+MrtwfZEzl/t32mQakOq0FzVo+Fk582lCjZR0d3+nBMEehbAMfSVCf
         QLD7xdpmZvDhLnhCh3713rdjb/MW4hqFoB4yjH+SvMXuJh+tU/FPnlltpMkNCpFKtPvl
         oySYg1IYny9NAMW0T//ptVyga1ly3xv0deaj28IyydYj4c3pgWOZLum95rksCZmXz+oa
         Hrmw==
X-Gm-Message-State: AOJu0YxTIMtSZPYtAcm6g8HgVsBKm+wvI2jYikyXL3yHwClb8abDEfyo
	CtHDfwH0hAbc42xRxobuHlHgDA==
X-Google-Smtp-Source: AGHT+IFPkQpg+ey3ertHh/TcNBgUDX7fnhdQHqcFtkkyI3tzskgpcz/a4p2oxDN3tA6VRXfdP6SYzg==
X-Received: by 2002:a05:6a00:a11:b0:68f:c078:b0c9 with SMTP id p17-20020a056a000a1100b0068fc078b0c9mr3267435pfh.11.1700722667294;
        Wed, 22 Nov 2023 22:57:47 -0800 (PST)
Received: from J9GPGXL7NT.bytedance.net ([139.177.225.230])
        by smtp.gmail.com with ESMTPSA id w37-20020a634765000000b005bd2b3a03eesm615437pgk.6.2023.11.22.22.57.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 22 Nov 2023 22:57:46 -0800 (PST)
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
Subject: [RFC PATCH V1 04/11] riscv: Adapt pte operations to gap between hw page and sw page
Date: Thu, 23 Nov 2023 14:57:01 +0800
Message-Id: <20231123065708.91345-5-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20231123065708.91345-1-luxu.kernel@bytedance.com>
References: <20231123065708.91345-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_225750_312013_32A9C88D 
X-CRM114-Status: GOOD (  16.62  )
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

MMU handles pages at a granularity of hardware page. That is, for 4K
MMU, the pfn decoded from page table entry will be regarded as 4K page
frame number, no matter how large the software page is. Thus, page table
entries should always be encoded at the granularity of hardware page.

This commit makes pte operations aware of the gap between hw page and sw
page. All pte operations now configure page table entries via hardware
page frame number.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/include/asm/page.h       |  3 +++
 arch/riscv/include/asm/pgalloc.h    | 21 ++++++++++-----
 arch/riscv/include/asm/pgtable-32.h |  2 +-
 arch/riscv/include/asm/pgtable-64.h | 40 ++++++++++++++++++-----------
 arch/riscv/include/asm/pgtable.h    | 19 +++++++-------
 arch/riscv/mm/init.c                | 18 ++++++-------
 6 files changed, 62 insertions(+), 41 deletions(-)

diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
index cbaa7e027f9a..12f2e73ed55b 100644
--- a/arch/riscv/include/asm/page.h
+++ b/arch/riscv/include/asm/page.h
@@ -177,6 +177,9 @@ extern phys_addr_t __phys_addr_symbol(unsigned long x);
 #define __pa(x)		__virt_to_phys((unsigned long)(x))
 #define __va(x)		((void *)__pa_to_va_nodebug((phys_addr_t)(x)))
 
+#define pfn_to_hwpfn(pfn)	(pfn << (PAGE_SHIFT - HW_PAGE_SHIFT))
+#define hwpfn_to_pfn(hwpfn)	(hwpfn >> (PAGE_SHIFT - HW_PAGE_SHIFT))
+
 #define phys_to_pfn(phys)	(PFN_DOWN(phys))
 #define pfn_to_phys(pfn)	(PFN_PHYS(pfn))
 
diff --git a/arch/riscv/include/asm/pgalloc.h b/arch/riscv/include/asm/pgalloc.h
index d169a4f41a2e..eab75d5f7093 100644
--- a/arch/riscv/include/asm/pgalloc.h
+++ b/arch/riscv/include/asm/pgalloc.h
@@ -19,32 +19,36 @@ static inline void pmd_populate_kernel(struct mm_struct *mm,
 	pmd_t *pmd, pte_t *pte)
 {
 	unsigned long pfn = virt_to_pfn(pte);
+	unsigned long hwpfn = pfn_to_hwpfn(pfn);
 
-	set_pmd(pmd, __pmd((pfn << _PAGE_PFN_SHIFT) | _PAGE_TABLE));
+	set_pmd(pmd, __pmd((hwpfn << _PAGE_PFN_SHIFT) | _PAGE_TABLE));
 }
 
 static inline void pmd_populate(struct mm_struct *mm,
 	pmd_t *pmd, pgtable_t pte)
 {
 	unsigned long pfn = virt_to_pfn(page_address(pte));
+	unsigned long hwpfn = pfn_to_hwpfn(pfn);
 
-	set_pmd(pmd, __pmd((pfn << _PAGE_PFN_SHIFT) | _PAGE_TABLE));
+	set_pmd(pmd, __pmd((hwpfn << _PAGE_PFN_SHIFT) | _PAGE_TABLE));
 }
 
 #ifndef __PAGETABLE_PMD_FOLDED
 static inline void pud_populate(struct mm_struct *mm, pud_t *pud, pmd_t *pmd)
 {
 	unsigned long pfn = virt_to_pfn(pmd);
+	unsigned long hwpfn = pfn_to_hwpfn(pfn);
 
-	set_pud(pud, __pud((pfn << _PAGE_PFN_SHIFT) | _PAGE_TABLE));
+	set_pud(pud, __pud((hwpfn << _PAGE_PFN_SHIFT) | _PAGE_TABLE));
 }
 
 static inline void p4d_populate(struct mm_struct *mm, p4d_t *p4d, pud_t *pud)
 {
 	if (pgtable_l4_enabled) {
 		unsigned long pfn = virt_to_pfn(pud);
+		unsigned long hwpfn = pfn_to_hwpfn(pfn);
 
-		set_p4d(p4d, __p4d((pfn << _PAGE_PFN_SHIFT) | _PAGE_TABLE));
+		set_p4d(p4d, __p4d((hwpfn << _PAGE_PFN_SHIFT) | _PAGE_TABLE));
 	}
 }
 
@@ -53,9 +57,10 @@ static inline void p4d_populate_safe(struct mm_struct *mm, p4d_t *p4d,
 {
 	if (pgtable_l4_enabled) {
 		unsigned long pfn = virt_to_pfn(pud);
+		unsigned long hwpfn = pfn_to_hwpfn(pfn);
 
 		set_p4d_safe(p4d,
-			     __p4d((pfn << _PAGE_PFN_SHIFT) | _PAGE_TABLE));
+			     __p4d((hwpfn << _PAGE_PFN_SHIFT) | _PAGE_TABLE));
 	}
 }
 
@@ -63,8 +68,9 @@ static inline void pgd_populate(struct mm_struct *mm, pgd_t *pgd, p4d_t *p4d)
 {
 	if (pgtable_l5_enabled) {
 		unsigned long pfn = virt_to_pfn(p4d);
+		unsigned long hwpfn = pfn_to_hwpfn(pfn);
 
-		set_pgd(pgd, __pgd((pfn << _PAGE_PFN_SHIFT) | _PAGE_TABLE));
+		set_pgd(pgd, __pgd((hwpfn << _PAGE_PFN_SHIFT) | _PAGE_TABLE));
 	}
 }
 
@@ -73,9 +79,10 @@ static inline void pgd_populate_safe(struct mm_struct *mm, pgd_t *pgd,
 {
 	if (pgtable_l5_enabled) {
 		unsigned long pfn = virt_to_pfn(p4d);
+		unsigned long hwpfn = pfn_to_hwpfn(pfn);
 
 		set_pgd_safe(pgd,
-			     __pgd((pfn << _PAGE_PFN_SHIFT) | _PAGE_TABLE));
+			     __pgd((hwpfn << _PAGE_PFN_SHIFT) | _PAGE_TABLE));
 	}
 }
 
diff --git a/arch/riscv/include/asm/pgtable-32.h b/arch/riscv/include/asm/pgtable-32.h
index 00f3369570a8..dec436e146ae 100644
--- a/arch/riscv/include/asm/pgtable-32.h
+++ b/arch/riscv/include/asm/pgtable-32.h
@@ -20,7 +20,7 @@
 /*
  * rv32 PTE format:
  * | XLEN-1  10 | 9             8 | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0
- *       PFN      reserved for SW   D   A   G   U   X   W   R   V
+ *     HW_PFN     reserved for SW   D   A   G   U   X   W   R   V
  */
 #define _PAGE_PFN_MASK  GENMASK(31, 10)
 
diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
index c08db54594a9..1926727698fc 100644
--- a/arch/riscv/include/asm/pgtable-64.h
+++ b/arch/riscv/include/asm/pgtable-64.h
@@ -50,7 +50,7 @@ typedef struct {
 
 #define p4d_val(x)	((x).p4d)
 #define __p4d(x)	((p4d_t) { (x) })
-#define PTRS_PER_P4D	(PAGE_SIZE / sizeof(p4d_t))
+#define PTRS_PER_P4D	(HW_PAGE_SIZE / sizeof(p4d_t))
 
 /* Page Upper Directory entry */
 typedef struct {
@@ -59,7 +59,7 @@ typedef struct {
 
 #define pud_val(x)      ((x).pud)
 #define __pud(x)        ((pud_t) { (x) })
-#define PTRS_PER_PUD    (PAGE_SIZE / sizeof(pud_t))
+#define PTRS_PER_PUD    (HW_PAGE_SIZE / sizeof(pud_t))
 
 /* Page Middle Directory entry */
 typedef struct {
@@ -69,12 +69,12 @@ typedef struct {
 #define pmd_val(x)      ((x).pmd)
 #define __pmd(x)        ((pmd_t) { (x) })
 
-#define PTRS_PER_PMD    (PAGE_SIZE / sizeof(pmd_t))
+#define PTRS_PER_PMD    (HW_PAGE_SIZE / sizeof(pmd_t))
 
 /*
  * rv64 PTE format:
  * | 63 | 62 61 | 60 54 | 53  10 | 9             8 | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0
- *   N      MT     RSV    PFN      reserved for SW   D   A   G   U   X   W   R   V
+ *   N      MT     RSV    HW_PFN   reserved for SW   D   A   G   U   X   W   R   V
  */
 #define _PAGE_PFN_MASK  GENMASK(53, 10)
 
@@ -94,13 +94,23 @@ enum napot_cont_order {
 	NAPOT_ORDER_MAX,
 };
 
-#define for_each_napot_order(order)						\
-	for (order = NAPOT_CONT_ORDER_BASE; order < NAPOT_ORDER_MAX; order++)
-#define for_each_napot_order_rev(order)						\
-	for (order = NAPOT_ORDER_MAX - 1;					\
-	     order >= NAPOT_CONT_ORDER_BASE; order--)
-#define napot_cont_order(val)							\
-	(__builtin_ctzl((pte_val(val) >> _PAGE_PFN_SHIFT) << 1))
+#define NAPOT_PAGE_ORDER_BASE						\
+	((NAPOT_CONT_ORDER_BASE >= (PAGE_SHIFT - HW_PAGE_SHIFT)) ?	\
+	 (NAPOT_CONT_ORDER_BASE - (PAGE_SHIFT - HW_PAGE_SHIFT)) : 1)
+#define NAPOT_PAGE_ORDER_MAX						\
+	((NAPOT_ORDER_MAX > (PAGE_SHIFT - HW_PAGE_SHIFT)) ?		\
+	 (NAPOT_ORDER_MAX - (PAGE_SHIFT - HW_PAGE_SHIFT)) :		\
+	 NAPOT_PAGE_ORDER_BASE)
+
+#define for_each_napot_order(order)					\
+	for (order = NAPOT_PAGE_ORDER_BASE;				\
+			order < NAPOT_PAGE_ORDER_MAX; order++)
+#define for_each_napot_order_rev(order)					\
+	for (order = NAPOT_PAGE_ORDER_MAX - 1;				\
+			order >= NAPOT_PAGE_ORDER_BASE; order--)
+#define napot_cont_order(val)						\
+	(__builtin_ctzl((pte_val(val) >> _PAGE_PFN_SHIFT) << 1)		\
+	 - (PAGE_SHIFT - HW_PAGE_SHIFT))
 
 #define napot_cont_shift(order)	((order) + PAGE_SHIFT)
 #define napot_cont_size(order)	BIT(napot_cont_shift(order))
@@ -108,7 +118,7 @@ enum napot_cont_order {
 #define napot_pte_num(order)	BIT(order)
 
 #ifdef CONFIG_RISCV_ISA_SVNAPOT
-#define HUGE_MAX_HSTATE		(2 + (NAPOT_ORDER_MAX - NAPOT_CONT_ORDER_BASE))
+#define HUGE_MAX_HSTATE		(2 + (NAPOT_ORDER_MAX - NAPOT_PAGE_ORDER_BASE))
 #else
 #define HUGE_MAX_HSTATE		2
 #endif
@@ -213,7 +223,7 @@ static inline void pud_clear(pud_t *pudp)
 
 static inline pud_t pfn_pud(unsigned long pfn, pgprot_t prot)
 {
-	return __pud((pfn << _PAGE_PFN_SHIFT) | pgprot_val(prot));
+	return __pud((pfn_to_hwpfn(pfn) << _PAGE_PFN_SHIFT) | pgprot_val(prot));
 }
 
 static inline unsigned long _pud_pfn(pud_t pud)
@@ -257,7 +267,7 @@ static inline pmd_t pfn_pmd(unsigned long pfn, pgprot_t prot)
 
 	ALT_THEAD_PMA(prot_val);
 
-	return __pmd((pfn << _PAGE_PFN_SHIFT) | prot_val);
+	return __pmd((pfn_to_hwpfn(pfn) << _PAGE_PFN_SHIFT) | prot_val);
 }
 
 static inline unsigned long _pmd_pfn(pmd_t pmd)
@@ -316,7 +326,7 @@ static inline void p4d_clear(p4d_t *p4d)
 
 static inline p4d_t pfn_p4d(unsigned long pfn, pgprot_t prot)
 {
-	return __p4d((pfn << _PAGE_PFN_SHIFT) | pgprot_val(prot));
+	return __p4d((pfn_to_hwpfn(pfn) << _PAGE_PFN_SHIFT) | pgprot_val(prot));
 }
 
 static inline unsigned long _p4d_pfn(p4d_t p4d)
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 342be2112fd2..d50c4588c1ed 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -26,9 +26,9 @@
 #endif
 
 /* Number of entries in the page global directory */
-#define PTRS_PER_PGD    (PAGE_SIZE / sizeof(pgd_t))
+#define PTRS_PER_PGD    (HW_PAGE_SIZE / sizeof(pgd_t))
 /* Number of entries in the page table */
-#define PTRS_PER_PTE    (PAGE_SIZE / sizeof(pte_t))
+#define PTRS_PER_PTE    (HW_PAGE_SIZE / sizeof(pte_t))
 
 /*
  * Half of the kernel address space (1/4 of the entries of the page global
@@ -118,7 +118,8 @@
 #include <linux/mm_types.h>
 #include <asm/compat.h>
 
-#define __page_val_to_pfn(_val)  (((_val) & _PAGE_PFN_MASK) >> _PAGE_PFN_SHIFT)
+#define __page_val_to_hwpfn(_val) (((_val) & _PAGE_PFN_MASK) >> _PAGE_PFN_SHIFT)
+#define __page_val_to_pfn(_val) hwpfn_to_pfn(__page_val_to_hwpfn(_val))
 
 #ifdef CONFIG_64BIT
 #include <asm/pgtable-64.h>
@@ -287,7 +288,7 @@ static inline pgd_t pfn_pgd(unsigned long pfn, pgprot_t prot)
 
 	ALT_THEAD_PMA(prot_val);
 
-	return __pgd((pfn << _PAGE_PFN_SHIFT) | prot_val);
+	return __pgd((pfn_to_hwpfn(pfn) << _PAGE_PFN_SHIFT) | prot_val);
 }
 
 static inline unsigned long _pgd_pfn(pgd_t pgd)
@@ -351,12 +352,12 @@ static inline unsigned long pte_napot(pte_t pte)
 /* Yields the page frame number (PFN) of a page table entry */
 static inline unsigned long pte_pfn(pte_t pte)
 {
-	unsigned long res  = __page_val_to_pfn(pte_val(pte));
+	unsigned long res  = __page_val_to_hwpfn(pte_val(pte));
 
 	if (has_svnapot() && pte_napot(pte))
 		res = res & (res - 1UL);
 
-	return res;
+	return hwpfn_to_pfn(res);
 }
 
 #define pte_page(x)     pfn_to_page(pte_pfn(x))
@@ -368,7 +369,7 @@ static inline pte_t pfn_pte(unsigned long pfn, pgprot_t prot)
 
 	ALT_THEAD_PMA(prot_val);
 
-	return __pte((pfn << _PAGE_PFN_SHIFT) | prot_val);
+	return __pte((pfn_to_hwpfn(pfn) << _PAGE_PFN_SHIFT) | prot_val);
 }
 
 #define mk_pte(page, prot)       pfn_pte(page_to_pfn(page), prot)
@@ -723,14 +724,14 @@ static inline pmd_t pmd_mkinvalid(pmd_t pmd)
 	return __pmd(pmd_val(pmd) & ~(_PAGE_PRESENT|_PAGE_PROT_NONE));
 }
 
-#define __pmd_to_phys(pmd)  (__page_val_to_pfn(pmd_val(pmd)) << PAGE_SHIFT)
+#define __pmd_to_phys(pmd)  (__page_val_to_hwpfn(pmd_val(pmd)) << HW_PAGE_SHIFT)
 
 static inline unsigned long pmd_pfn(pmd_t pmd)
 {
 	return ((__pmd_to_phys(pmd) & PMD_MASK) >> PAGE_SHIFT);
 }
 
-#define __pud_to_phys(pud)  (__page_val_to_pfn(pud_val(pud)) << PAGE_SHIFT)
+#define __pud_to_phys(pud)  (__page_val_to_hwpfn(pud_val(pud)) << HW_PAGE_SHIFT)
 
 static inline unsigned long pud_pfn(pud_t pud)
 {
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 2e011cbddf3a..a768b2b3ff05 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -466,7 +466,7 @@ static void __init create_pmd_mapping(pmd_t *pmdp,
 		pte_phys = pt_ops.alloc_pte(va);
 		pmdp[pmd_idx] = pfn_pmd(PFN_DOWN(pte_phys), PAGE_TABLE);
 		ptep = pt_ops.get_pte_virt(pte_phys);
-		memset(ptep, 0, PAGE_SIZE);
+		memset(ptep, 0, PTRS_PER_PTE * sizeof(pte_t));
 	} else {
 		pte_phys = PFN_PHYS(_pmd_pfn(pmdp[pmd_idx]));
 		ptep = pt_ops.get_pte_virt(pte_phys);
@@ -569,7 +569,7 @@ static void __init create_pud_mapping(pud_t *pudp,
 		next_phys = pt_ops.alloc_pmd(va);
 		pudp[pud_index] = pfn_pud(PFN_DOWN(next_phys), PAGE_TABLE);
 		nextp = pt_ops.get_pmd_virt(next_phys);
-		memset(nextp, 0, PAGE_SIZE);
+		memset(nextp, 0, PTRS_PER_PMD * sizeof(pmd_t));
 	} else {
 		next_phys = PFN_PHYS(_pud_pfn(pudp[pud_index]));
 		nextp = pt_ops.get_pmd_virt(next_phys);
@@ -596,7 +596,7 @@ static void __init create_p4d_mapping(p4d_t *p4dp,
 		next_phys = pt_ops.alloc_pud(va);
 		p4dp[p4d_index] = pfn_p4d(PFN_DOWN(next_phys), PAGE_TABLE);
 		nextp = pt_ops.get_pud_virt(next_phys);
-		memset(nextp, 0, PAGE_SIZE);
+		memset(nextp, 0, PTRS_PER_PUD * sizeof(pud_t));
 	} else {
 		next_phys = PFN_PHYS(_p4d_pfn(p4dp[p4d_index]));
 		nextp = pt_ops.get_pud_virt(next_phys);
@@ -654,7 +654,7 @@ void __init create_pgd_mapping(pgd_t *pgdp,
 		next_phys = alloc_pgd_next(va);
 		pgdp[pgd_idx] = pfn_pgd(PFN_DOWN(next_phys), PAGE_TABLE);
 		nextp = get_pgd_next_virt(next_phys);
-		memset(nextp, 0, PAGE_SIZE);
+		memset(nextp, 0, PTRS_PER_P4D * sizeof(p4d_t));
 	} else {
 		next_phys = PFN_PHYS(_pgd_pfn(pgdp[pgd_idx]));
 		nextp = get_pgd_next_virt(next_phys);
@@ -815,16 +815,16 @@ static __init void set_satp_mode(uintptr_t dtb_pa)
 	if (hw_satp != identity_satp) {
 		if (pgtable_l5_enabled) {
 			disable_pgtable_l5();
-			memset(early_pg_dir, 0, PAGE_SIZE);
+			memset(early_pg_dir, 0, PTRS_PER_PGD * sizeof(pgd_t));
 			goto retry;
 		}
 		disable_pgtable_l4();
 	}
 
-	memset(early_pg_dir, 0, PAGE_SIZE);
-	memset(early_p4d, 0, PAGE_SIZE);
-	memset(early_pud, 0, PAGE_SIZE);
-	memset(early_pmd, 0, PAGE_SIZE);
+	memset(early_pg_dir, 0, PTRS_PER_PGD * sizeof(pgd_t));
+	memset(early_p4d, 0, PTRS_PER_P4D * sizeof(p4d_t));
+	memset(early_pud, 0, PTRS_PER_PUD * sizeof(pud_t));
+	memset(early_pmd, 0, PTRS_PER_PMD * sizeof(pmd_t));
 }
 #endif
 
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
