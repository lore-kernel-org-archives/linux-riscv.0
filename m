Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAE6AC61D85
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Nov 2023 06:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jaUpQ/WJrSz2jsEiiTxhuRPPBeaz0YHOE/UWSC/LuPk=; b=WyswLNPlNupCdT
	gFyEYQaA1eljzbOwuGNpqIIdH8z4iX4kpy/ef+ufzoN5qPBdgBij/lM506Ma4xubhB2XlRsuJoHS8
	f0Ph9h4ciTV5/zilgUbY1FWuRDE9bKLrX3lKFflRjTHfpJHF41t4jITXcJuXS+8hsX2Szeb1TGQn5
	VTGa0fvjaEhRUnInDO0U3HNg6hKN1rUS4IFuhjo02ZsNFVH9YGT0Ap0Dsso+P+YltzXL2/czghxqh
	/KmyRDdiRHlVuCZiDF/dU2Lo9RUpPDFoPIUdPbWkqEC9EJWZtD/OmLrceFdbea0fYSZJDlAnIDtWZ
	fknrcVwOpg+f9X0Mj+Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r63el-003xIZ-1G;
	Thu, 23 Nov 2023 06:57:47 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r63eh-003xH5-2J
	for linux-riscv@lists.infradead.org;
	Thu, 23 Nov 2023 06:57:45 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6cb749044a2so599632b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 22 Nov 2023 22:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1700722662; x=1701327462; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1pQabAU2EIOA7IYsCP/RDHpXwqUYYVOXCKbRpkKm/sI=;
        b=F6bERXC4SfWoigX/XWC0O6jfkQpTbUU+xmX2xUmtqnKxYxPV70N1xqBlIdDSuUFvmb
         YeZNoYlx/Q4/NgIDr+wuQet6d9wwuff9xynLY+HRxEXhKkMnI0WzJNoYY8H4U6Jdh1Rb
         pmKHjDhfhDW+NVl61+SUFSSO+Rql7olf+9jev2fioATNM3ycjk5BXdarg6tT3PrpfDNn
         gFyw/jE44+nBhn8EM0suAVuE5lNZZam/IAbNRvEldX9nYdVBGPAWo6HlXBCtHP7Zzi2D
         Xp1C2u2bCo5J8ELUoPutKN6mH5JBVfVWa1CuJ0T7exL4N2ET6ouic94MDcMRgDkcjlJT
         Fc8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700722662; x=1701327462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1pQabAU2EIOA7IYsCP/RDHpXwqUYYVOXCKbRpkKm/sI=;
        b=iJSTsvUytT3vPm8K04ymwp7+/HweKB12X0szDEL6BG7ILJs0Gs/t/zyqXFhy0i3TsK
         fb/6TKkpWQkpMl0Wv/rAWx0F/cgd+UPmt3rx3CkBKaLsi0/FEuBT5YB6xCVoFAalLNsy
         8whJjzbZfMEScbjyJr0Dt9sPC2QLUkEPmOz1zd2CYOzG6IKLcC8TCnO8YR4FIpd86ZZ/
         AkKqGGaRVAyNW/SZbw11sxXMsmqqgFeNdztCaldpcCgf8Z6CTyctjgOtuNSwwFVZ22qR
         OwR1J3R+WiiGoocN5U5/D9+YLGuUJ7r9fqFNHT/0LUG1i4bJlDm0xCQX+GjdZMdGb2G/
         2ZRg==
X-Gm-Message-State: AOJu0YyjPAxGoONR9SfS7DgdH74MqaZDbSVN47oeH1ch52uyd7JOLWgt
	bgvf8gOg/7gfGmLwwcY7xEsbng==
X-Google-Smtp-Source: AGHT+IEjrB3TX75kVy8EQWnz59Mr28Ta2QXhohdgO7PmW2QllvYs+v4WN85i+Msea7MqDkKVKQnXQg==
X-Received: by 2002:a05:6a00:8d97:b0:68f:bb02:fdf with SMTP id im23-20020a056a008d9700b0068fbb020fdfmr5401752pfb.27.1700722661962;
        Wed, 22 Nov 2023 22:57:41 -0800 (PST)
Received: from J9GPGXL7NT.bytedance.net ([139.177.225.230])
        by smtp.gmail.com with ESMTPSA id w37-20020a634765000000b005bd2b3a03eesm615437pgk.6.2023.11.22.22.57.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 22 Nov 2023 22:57:41 -0800 (PST)
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
Subject: [RFC PATCH V1 03/11] riscv: Adapt pte struct to gap between hw page and sw page
Date: Thu, 23 Nov 2023 14:57:00 +0800
Message-Id: <20231123065708.91345-4-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20231123065708.91345-1-luxu.kernel@bytedance.com>
References: <20231123065708.91345-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_225743_756430_C25C0CD6 
X-CRM114-Status: GOOD (  20.23  )
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

The pte_t struct maps a virtual page to a physical page, both of which
are the concept of software page in view of kernel mm. In contrary, per
page table entry refers to a single hardware page. When sw page is
larger than hw page, the existing pte_t struct with only one page table
entry can not represent a software page anymore.

This commit extends pte_t struct to contain an array of page table
entries. The pte_t struct now maps a software page to an exact number of
hardware pages, the total size of which still matches sw page size.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/include/asm/page.h       |  7 ++-
 arch/riscv/include/asm/pgtable-64.h |  3 +-
 arch/riscv/include/asm/pgtable.h    | 91 ++++++++++++++++++++++++++---
 arch/riscv/kernel/efi.c             |  2 +-
 arch/riscv/mm/hugetlbpage.c         |  2 +-
 arch/riscv/mm/pageattr.c            |  2 +-
 6 files changed, 92 insertions(+), 15 deletions(-)

diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
index a8c59d80683c..cbaa7e027f9a 100644
--- a/arch/riscv/include/asm/page.h
+++ b/arch/riscv/include/asm/page.h
@@ -68,9 +68,11 @@ typedef struct {
 	unsigned long pgd;
 } pgd_t;
 
+#define PTES_PER_PAGE	(1 << (PAGE_SHIFT - HW_PAGE_SHIFT))
+
 /* Page Table entry */
 typedef struct {
-	unsigned long pte;
+	unsigned long ptes[PTES_PER_PAGE];
 } pte_t;
 
 typedef struct {
@@ -79,11 +81,10 @@ typedef struct {
 
 typedef struct page *pgtable_t;
 
-#define pte_val(x)	((x).pte)
+#define pte_val(x)	((x).ptes[0])
 #define pgd_val(x)	((x).pgd)
 #define pgprot_val(x)	((x).pgprot)
 
-#define __pte(x)	((pte_t) { (x) })
 #define __pgd(x)	((pgd_t) { (x) })
 #define __pgprot(x)	((pgprot_t) { (x) })
 
diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
index 9a2c780a11e9..c08db54594a9 100644
--- a/arch/riscv/include/asm/pgtable-64.h
+++ b/arch/riscv/include/asm/pgtable-64.h
@@ -99,7 +99,8 @@ enum napot_cont_order {
 #define for_each_napot_order_rev(order)						\
 	for (order = NAPOT_ORDER_MAX - 1;					\
 	     order >= NAPOT_CONT_ORDER_BASE; order--)
-#define napot_cont_order(val)	(__builtin_ctzl((val.pte >> _PAGE_PFN_SHIFT) << 1))
+#define napot_cont_order(val)							\
+	(__builtin_ctzl((pte_val(val) >> _PAGE_PFN_SHIFT) << 1))
 
 #define napot_cont_shift(order)	((order) + PAGE_SHIFT)
 #define napot_cont_size(order)	BIT(napot_cont_shift(order))
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 294044429e8e..342be2112fd2 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -212,6 +212,31 @@ extern pgd_t swapper_pg_dir[];
 extern pgd_t trampoline_pg_dir[];
 extern pgd_t early_pg_dir[];
 
+static __always_inline int __pte_present(unsigned long pteval)
+{
+	return (pteval & (_PAGE_PRESENT | _PAGE_PROT_NONE));
+}
+
+static __always_inline unsigned long __pte_napot(unsigned long pteval)
+{
+	return pteval & _PAGE_NAPOT;
+}
+
+static inline pte_t __pte(unsigned long pteval)
+{
+	pte_t pte;
+	unsigned int i;
+
+	for (i = 0; i < PTES_PER_PAGE; i++) {
+		pte.ptes[i] = pteval;
+		if (__pte_present(pteval) && !__pte_napot(pteval))
+			pteval += 1 << _PAGE_PFN_SHIFT;
+	}
+
+	return pte;
+}
+#define __pte	__pte
+
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 static inline int pmd_present(pmd_t pmd)
 {
@@ -300,7 +325,7 @@ static __always_inline bool has_svnapot(void)
 
 static inline unsigned long pte_napot(pte_t pte)
 {
-	return pte_val(pte) & _PAGE_NAPOT;
+	return __pte_napot(pte_val(pte));
 }
 
 static inline pte_t pte_mknapot(pte_t pte, unsigned int order)
@@ -350,7 +375,7 @@ static inline pte_t pfn_pte(unsigned long pfn, pgprot_t prot)
 
 static inline int pte_present(pte_t pte)
 {
-	return (pte_val(pte) & (_PAGE_PRESENT | _PAGE_PROT_NONE));
+	return __pte_present(pte_val(pte));
 }
 
 static inline int pte_none(pte_t pte)
@@ -439,6 +464,36 @@ static inline pte_t pte_mkhuge(pte_t pte)
 	return pte;
 }
 
+static inline pte_t ptep_get(pte_t *ptep)
+{
+	unsigned int i;
+	pte_t pte = *ptep;
+
+	for (i = 0; i < PTES_PER_PAGE; i++) {
+		if (pte.ptes[i] & _PAGE_DIRTY) {
+			pte = pte_mkdirty(pte);
+			break;
+		}
+	}
+	for (i = 0; i < PTES_PER_PAGE; i++) {
+		if (pte.ptes[i] & _PAGE_ACCESSED) {
+			pte = pte_mkyoung(pte);
+			break;
+		}
+	}
+
+	return pte;
+}
+#define ptep_get	ptep_get
+
+static inline pte_t ptep_get_lockless(pte_t *ptep)
+{
+	unsigned long pteval = READ_ONCE(ptep->ptes[0]);
+
+	return __pte(pteval);
+}
+#define ptep_get_lockless	ptep_get_lockless
+
 #ifdef CONFIG_NUMA_BALANCING
 /*
  * See the comment in include/asm-generic/pgtable.h
@@ -526,6 +581,8 @@ static inline void __set_pte_at(pte_t *ptep, pte_t pteval)
 static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
 		pte_t *ptep, pte_t pteval, unsigned int nr)
 {
+	unsigned int i;
+
 	page_table_check_ptes_set(mm, ptep, pteval, nr);
 
 	for (;;) {
@@ -533,7 +590,10 @@ static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
 		if (--nr == 0)
 			break;
 		ptep++;
-		pte_val(pteval) += 1 << _PAGE_PFN_SHIFT;
+		if (pte_present(pteval) && !pte_napot(pteval)) {
+			for (i = 0; i < PTES_PER_PAGE; i++)
+				pteval.ptes[i] += PTES_PER_PAGE << _PAGE_PFN_SHIFT;
+		}
 	}
 }
 #define set_ptes set_ptes
@@ -562,7 +622,11 @@ static inline int ptep_set_access_flags(struct vm_area_struct *vma,
 static inline pte_t ptep_get_and_clear(struct mm_struct *mm,
 				       unsigned long address, pte_t *ptep)
 {
-	pte_t pte = __pte(atomic_long_xchg((atomic_long_t *)ptep, 0));
+	pte_t pte;
+	unsigned int i;
+
+	for (i = 0; i < PTES_PER_PAGE; i++)
+		pte.ptes[i] = atomic_long_xchg((atomic_long_t *)(&ptep->ptes[i]), 0);
 
 	page_table_check_pte_clear(mm, pte);
 
@@ -574,16 +638,27 @@ static inline int ptep_test_and_clear_young(struct vm_area_struct *vma,
 					    unsigned long address,
 					    pte_t *ptep)
 {
-	if (!pte_young(*ptep))
+	int ret = 0;
+	unsigned int i;
+
+	if (!pte_young(ptep_get(ptep)))
 		return 0;
-	return test_and_clear_bit(_PAGE_ACCESSED_OFFSET, &pte_val(*ptep));
+
+	for (i = 0; i < PTES_PER_PAGE; i++)
+		ret |= test_and_clear_bit(_PAGE_ACCESSED_OFFSET, &ptep->ptes[i]);
+
+	return ret;
 }
 
 #define __HAVE_ARCH_PTEP_SET_WRPROTECT
 static inline void ptep_set_wrprotect(struct mm_struct *mm,
 				      unsigned long address, pte_t *ptep)
 {
-	atomic_long_and(~(unsigned long)_PAGE_WRITE, (atomic_long_t *)ptep);
+	unsigned int i;
+
+	for (i = 0; i < PTES_PER_PAGE; i++)
+		atomic_long_and(~(unsigned long)_PAGE_WRITE,
+				(atomic_long_t *)(&ptep->ptes[i]));
 }
 
 #define __HAVE_ARCH_PTEP_CLEAR_YOUNG_FLUSH
@@ -829,7 +904,7 @@ extern pmd_t pmdp_collapse_flush(struct vm_area_struct *vma,
 	  ((offset) << __SWP_OFFSET_SHIFT) })
 
 #define __pte_to_swp_entry(pte)	((swp_entry_t) { pte_val(pte) })
-#define __swp_entry_to_pte(x)	((pte_t) { (x).val })
+#define __swp_entry_to_pte(x)	__pte((x).val)
 
 static inline int pte_swp_exclusive(pte_t pte)
 {
diff --git a/arch/riscv/kernel/efi.c b/arch/riscv/kernel/efi.c
index aa6209a74c83..b64bf1624a05 100644
--- a/arch/riscv/kernel/efi.c
+++ b/arch/riscv/kernel/efi.c
@@ -60,7 +60,7 @@ int __init efi_create_mapping(struct mm_struct *mm, efi_memory_desc_t *md)
 static int __init set_permissions(pte_t *ptep, unsigned long addr, void *data)
 {
 	efi_memory_desc_t *md = data;
-	pte_t pte = READ_ONCE(*ptep);
+	pte_t pte = ptep_get(ptep);
 	unsigned long val;
 
 	if (md->attribute & EFI_MEMORY_RO) {
diff --git a/arch/riscv/mm/hugetlbpage.c b/arch/riscv/mm/hugetlbpage.c
index d7cf8e2d3c5b..67fd71c36853 100644
--- a/arch/riscv/mm/hugetlbpage.c
+++ b/arch/riscv/mm/hugetlbpage.c
@@ -293,7 +293,7 @@ void huge_pte_clear(struct mm_struct *mm,
 		    pte_t *ptep,
 		    unsigned long sz)
 {
-	pte_t pte = READ_ONCE(*ptep);
+	pte_t pte = ptep_get(ptep);
 	int i, pte_num;
 
 	if (!pte_napot(pte)) {
diff --git a/arch/riscv/mm/pageattr.c b/arch/riscv/mm/pageattr.c
index fc5fc4f785c4..b8e30df2e7df 100644
--- a/arch/riscv/mm/pageattr.c
+++ b/arch/riscv/mm/pageattr.c
@@ -68,7 +68,7 @@ static int pageattr_pmd_entry(pmd_t *pmd, unsigned long addr,
 static int pageattr_pte_entry(pte_t *pte, unsigned long addr,
 			      unsigned long next, struct mm_walk *walk)
 {
-	pte_t val = READ_ONCE(*pte);
+	pte_t val = ptep_get(pte);
 
 	val = __pte(set_pageattr_masks(pte_val(val), walk));
 	set_pte(pte, val);
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
