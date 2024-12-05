Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 123BEE77170
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Dec 2024 10:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+rqxzBM2GhBfjuuxT3loWPDbusKa5KkzlT+fUlFXAkw=; b=AuDjc+20ocNm3p
	bjI4tS3NMv5pCp58g5l1IBSE11vzQ8KVPzoHRUca8XXOAwFqrN929KOUBowIzqdebwpd5ppNV1aHt
	GGgWPzPPOt/thUobnxadYR5oqsRHGe2L4VP4p+uqRMFi8rK/EaGjc9I8kBaNJJoSfkR7+LYeRCIN/
	pWdlb126lscuFMBzUve/CuKi1UHZ6b9kA4pi9c7SxTUWgjRTiD7cD57Xfzbx06rJljthYIZCngftU
	oBGGCFhxmP8B0WZhLq2WhaB8H0PXFEY0eh3/ekKZBOikcDLACka/rJxdFDCHLGHLa5hmcQe3NzjDC
	R6ZY49M0szTicsc5UKgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9Lr-0000000FaS0-3pmX;
	Thu, 05 Dec 2024 10:44:55 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9FQ-0000000FYBU-14Yc
	for linux-riscv@lists.infradead.org;
	Thu, 05 Dec 2024 10:38:17 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-7fd17f230c2so424815a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 05 Dec 2024 02:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1733395095; x=1733999895; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=83UO5ozW5NdISNbxrvGH5KVgxXxH6sNR5OZieItF5/g=;
        b=J21zQXG3GLISQbU7dnogfBUBmYYCz55IaXD5ojK2mwDE7jBJ23zIlzaTCZKg3Ih6qK
         dlnKy/YJw+doP8QQYXeWnazHRxvYmWEMVfaC614bx7OdZXumq+j9zEePDzj0H+gTB2yv
         yWxZU6YC1gvBRsv6msPIjhB/iyCKdfrXyU2GN/0eCFfoiNRcImXGtx7rM75Gg4djNYFP
         IAlf5oG+WmYNTUdId/nQ9qgzLkKspTqZtX4u/A4c7qZ84pigV+DL7QJVtEKWloX0WH1Y
         x/B5FcUGxln0KjuxwgwGwimQBPSsA6cnpPmZwWJegOFo9IrnMkANQX3tM2UfpEkiNyek
         Qcnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733395095; x=1733999895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=83UO5ozW5NdISNbxrvGH5KVgxXxH6sNR5OZieItF5/g=;
        b=uqLupPYjr0uQYF/e1Chj5lOnaIDjFecQIaZAu821bZ8Nbs7fqZRPJjV7i5ySJgbaSq
         QheCxU/EEoa+NLENHmIYuV69f/hjBFPUIpxcA3SZPy5Sl7SmfRT4QJAtPHaLHhDqK2fE
         HfJrqBX1WUKE89N/pfCrlG3TjPBNcdkK/DoPZmxBetXQh0z0Cpg8mAb6tF3xcB2qxqT3
         H/R/44/Rr+nFpVUmK/Y2b3pLa3YBw1lUjy7FBcX/TzVsop4bEr+cfa0vSAME5ShDbgg2
         4d4J+uy0T3CWMr3YT0YaX1Yyh2MK+6tnpCSECpSsqNtl0EWu09jPbDIRiyh07P/iYfYL
         vNfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCfRLEwRRkyupXlosG1ZmPrfl1xnIbWjPaPTC1x9BbbSqiYfflvs9jz5sHIxSW7RjCWOrki6qoE6ygdg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzS2EgZftymkO3rgIVy/UCrqpobtfcub2zLDKQfqmNyLPxb6VyW
	eZMwjc4vOqx8W7xXVAWgQBAZezEicIdDQ2P0L5RZlrw6rByphrwWhFnKOM73o7o=
X-Gm-Gg: ASbGncuoNsNRwgAhwdt1ywIoCuUiLM3+vUpXcIDOYjhW+vNLgZSj4JDYVxbtmK4fiRG
	QVaIacabwqlCuSalajX3ksMnEh2MsBUt+R6gBX/WjHRU6jjht0RXIZh6oNnZ/vQ3TWY0uEZvuWt
	3zS0vmigBkYYOwx59qWwjFNAnNU7FWTLpxCEOcK06g3nzvnc+okgk5Iia07hDjYyjYwsOG+ZDK+
	5M+A4ULtyrT4hAFEfluGgqiyxOA0ZDePrZqmE84pkNObqQKBpaEJAJkesamfmiYeKRrlRuad+Mx
	ltFe/AVyPlPpkInXwUoa2o3oYKaE7mn5
X-Google-Smtp-Source: AGHT+IHonPj5or3FCVlbY151Zkh3FREpG17bX8AKYVEQ/Cqc6X6geX5o43T/JV8/DVhtAO5u57D41Q==
X-Received: by 2002:a05:6a21:99a2:b0:1d9:c615:944f with SMTP id adf61e73a8af0-1e1653b9f1bmr15516117637.11.1733395095235;
        Thu, 05 Dec 2024 02:38:15 -0800 (PST)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fd156f048csm886826a12.39.2024.12.05.02.38.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 05 Dec 2024 02:38:15 -0800 (PST)
From: Xu Lu <luxu.kernel@bytedance.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	ardb@kernel.org,
	anup@brainfault.org,
	atishp@atishpatra.org
Cc: xieyongji@bytedance.com,
	lihangjing@bytedance.com,
	punit.agrawal@bytedance.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [RFC PATCH v2 09/21] riscv: mm: Replace READ_ONCE with atomic pte get function
Date: Thu,  5 Dec 2024 18:37:17 +0800
Message-Id: <20241205103729.14798-10-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20241205103729.14798-1-luxu.kernel@bytedance.com>
References: <20241205103729.14798-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_023816_296497_FB6A5358 
X-CRM114-Status: GOOD (  16.16  )
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

READ_ONCE can not be applied to pte structure with multipling mapping
entries. This commit replaces READ_ONCE with atomic pte get function.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/include/asm/pgtable-64.h |  6 +++---
 arch/riscv/include/asm/pgtable.h    | 21 +++++++++++++--------
 arch/riscv/kernel/hibernate.c       | 18 +++++++++---------
 arch/riscv/mm/pgtable.c             | 12 +++++++++---
 kernel/events/core.c                |  6 +++---
 mm/debug_vm_pgtable.c               |  4 ++--
 mm/gup.c                            | 10 +++++-----
 mm/hmm.c                            |  2 +-
 mm/mapping_dirty_helpers.c          |  2 +-
 mm/memory.c                         |  4 ++--
 mm/mprotect.c                       |  2 +-
 mm/ptdump.c                         |  8 ++++----
 mm/sparse-vmemmap.c                 |  2 +-
 mm/vmscan.c                         |  2 +-
 14 files changed, 55 insertions(+), 44 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
index efcf63667f93..2649cc90b14e 100644
--- a/arch/riscv/include/asm/pgtable-64.h
+++ b/arch/riscv/include/asm/pgtable-64.h
@@ -242,7 +242,7 @@ static inline int pud_user(pud_t pud)
 
 static inline void set_pud(pud_t *pudp, pud_t pud)
 {
-	WRITE_ONCE(*pudp, pud);
+	*pudp = pud;
 }
 
 static inline void pud_clear(pud_t *pudp)
@@ -318,7 +318,7 @@ static inline unsigned long _pmd_pfn(pmd_t pmd)
 static inline void set_p4d(p4d_t *p4dp, p4d_t p4d)
 {
 	if (pgtable_l4_enabled)
-		WRITE_ONCE(*p4dp, p4d);
+		*p4dp = p4d;
 	else
 		set_pud((pud_t *)p4dp, __pud(p4d_val(p4d)));
 }
@@ -401,7 +401,7 @@ pud_t *pud_offset(p4d_t *p4d, unsigned long address);
 static inline void set_pgd(pgd_t *pgdp, pgd_t pgd)
 {
 	if (pgtable_l5_enabled)
-		WRITE_ONCE(*pgdp, pgd);
+		*pgdp = pgd;
 	else
 		set_p4d((p4d_t *)pgdp, __p4d(pgd_val(pgd)));
 }
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index fe42afb4441e..bf724d006236 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -289,7 +289,7 @@ static inline bool pmd_leaf(pmd_t pmd)
 
 static inline void set_pmd(pmd_t *pmdp, pmd_t pmd)
 {
-	WRITE_ONCE(*pmdp, pmd);
+	*pmdp = pmd;
 }
 
 static inline void pmd_clear(pmd_t *pmdp)
@@ -713,7 +713,7 @@ static inline int pte_same(pte_t pte_a, pte_t pte_b)
  */
 static inline void set_pte(pte_t *ptep, pte_t pteval)
 {
-	WRITE_ONCE(*ptep, pteval);
+	*ptep = pteval;
 }
 
 static inline pte_t ptep_get(pte_t *ptep)
@@ -953,10 +953,9 @@ extern int ptep_test_and_clear_young(struct vm_area_struct *vma, unsigned long a
 static inline pte_t ptep_get_and_clear(struct mm_struct *mm,
 				       unsigned long address, pte_t *ptep)
 {
-	pte_t pte = __pte(atomic_long_xchg((atomic_long_t *)ptep, 0));
-
+	pte_t pte = ptep_get(ptep);
+	pte_clear(mm, address, ptep);
 	page_table_check_pte_clear(mm, pte);
-
 	return pte;
 }
 
@@ -964,7 +963,8 @@ static inline pte_t ptep_get_and_clear(struct mm_struct *mm,
 static inline void ptep_set_wrprotect(struct mm_struct *mm,
 				      unsigned long address, pte_t *ptep)
 {
-	atomic_long_and(~(unsigned long)_PAGE_WRITE, (atomic_long_t *)ptep);
+	pte_t old_pte = ptep_get(ptep);
+	set_pte(ptep, pte_wrprotect(old_pte));
 }
 
 #define __HAVE_ARCH_PTEP_CLEAR_YOUNG_FLUSH
@@ -1170,8 +1170,9 @@ static inline int pmdp_test_and_clear_young(struct vm_area_struct *vma,
 static inline pmd_t pmdp_huge_get_and_clear(struct mm_struct *mm,
 					unsigned long address, pmd_t *pmdp)
 {
-	pmd_t pmd = __pmd(atomic_long_xchg((atomic_long_t *)pmdp, 0));
+	pmd_t pmd = pmdp_get(pmdp);
 
+	pmd_clear(pmdp);
 	page_table_check_pmd_clear(mm, pmd);
 
 	return pmd;
@@ -1188,8 +1189,12 @@ static inline void pmdp_set_wrprotect(struct mm_struct *mm,
 static inline pmd_t pmdp_establish(struct vm_area_struct *vma,
 				unsigned long address, pmd_t *pmdp, pmd_t pmd)
 {
+	pmd_t old_pmd = pmdp_get(pmdp);
+
 	page_table_check_pmd_set(vma->vm_mm, pmdp, pmd);
-	return __pmd(atomic_long_xchg((atomic_long_t *)pmdp, pmd_val(pmd)));
+	set_pmd(pmdp, pmd);
+
+	return old_pmd;
 }
 
 #define pmdp_collapse_flush pmdp_collapse_flush
diff --git a/arch/riscv/kernel/hibernate.c b/arch/riscv/kernel/hibernate.c
index 155be6b1d32c..5018d38f5280 100644
--- a/arch/riscv/kernel/hibernate.c
+++ b/arch/riscv/kernel/hibernate.c
@@ -171,7 +171,7 @@ static int temp_pgtable_map_pte(pmd_t *dst_pmdp, pmd_t *src_pmdp, unsigned long
 	pte_t *src_ptep;
 	pte_t *dst_ptep;
 
-	if (pmd_none(READ_ONCE(*dst_pmdp))) {
+	if (pmd_none(pmdp_get_lockless(dst_pmdp))) {
 		dst_ptep = (pte_t *)get_safe_page(GFP_ATOMIC);
 		if (!dst_ptep)
 			return -ENOMEM;
@@ -183,7 +183,7 @@ static int temp_pgtable_map_pte(pmd_t *dst_pmdp, pmd_t *src_pmdp, unsigned long
 	src_ptep = pte_offset_kernel(src_pmdp, start);
 
 	do {
-		pte_t pte = READ_ONCE(*src_ptep);
+		pte_t pte = ptep_get_lockless(src_ptep);
 
 		if (pte_present(pte))
 			set_pte(dst_ptep, __pte(pte_val(pte) | pgprot_val(prot)));
@@ -200,7 +200,7 @@ static int temp_pgtable_map_pmd(pud_t *dst_pudp, pud_t *src_pudp, unsigned long
 	pmd_t *src_pmdp;
 	pmd_t *dst_pmdp;
 
-	if (pud_none(READ_ONCE(*dst_pudp))) {
+	if (pud_none(pudp_get_lockless(dst_pudp))) {
 		dst_pmdp = (pmd_t *)get_safe_page(GFP_ATOMIC);
 		if (!dst_pmdp)
 			return -ENOMEM;
@@ -212,7 +212,7 @@ static int temp_pgtable_map_pmd(pud_t *dst_pudp, pud_t *src_pudp, unsigned long
 	src_pmdp = pmd_offset(src_pudp, start);
 
 	do {
-		pmd_t pmd = READ_ONCE(*src_pmdp);
+		pmd_t pmd = pmdp_get_lockless(src_pmdp);
 
 		next = pmd_addr_end(start, end);
 
@@ -239,7 +239,7 @@ static int temp_pgtable_map_pud(p4d_t *dst_p4dp, p4d_t *src_p4dp, unsigned long
 	pud_t *dst_pudp;
 	pud_t *src_pudp;
 
-	if (p4d_none(READ_ONCE(*dst_p4dp))) {
+	if (p4d_none(p4dp_get_lockless(dst_p4dp))) {
 		dst_pudp = (pud_t *)get_safe_page(GFP_ATOMIC);
 		if (!dst_pudp)
 			return -ENOMEM;
@@ -251,7 +251,7 @@ static int temp_pgtable_map_pud(p4d_t *dst_p4dp, p4d_t *src_p4dp, unsigned long
 	src_pudp = pud_offset(src_p4dp, start);
 
 	do {
-		pud_t pud = READ_ONCE(*src_pudp);
+		pud_t pud = pudp_get_lockless(src_pudp);
 
 		next = pud_addr_end(start, end);
 
@@ -278,7 +278,7 @@ static int temp_pgtable_map_p4d(pgd_t *dst_pgdp, pgd_t *src_pgdp, unsigned long
 	p4d_t *dst_p4dp;
 	p4d_t *src_p4dp;
 
-	if (pgd_none(READ_ONCE(*dst_pgdp))) {
+	if (pgd_none(pgdp_get_lockless(dst_pgdp))) {
 		dst_p4dp = (p4d_t *)get_safe_page(GFP_ATOMIC);
 		if (!dst_p4dp)
 			return -ENOMEM;
@@ -290,7 +290,7 @@ static int temp_pgtable_map_p4d(pgd_t *dst_pgdp, pgd_t *src_pgdp, unsigned long
 	src_p4dp = p4d_offset(src_pgdp, start);
 
 	do {
-		p4d_t p4d = READ_ONCE(*src_p4dp);
+		p4d_t p4d = p4dp_get_lockless(src_p4dp);
 
 		next = p4d_addr_end(start, end);
 
@@ -317,7 +317,7 @@ static int temp_pgtable_mapping(pgd_t *pgdp, unsigned long start, unsigned long
 	unsigned long ret;
 
 	do {
-		pgd_t pgd = READ_ONCE(*src_pgdp);
+		pgd_t pgd = pgdp_get_lockless(src_pgdp);
 
 		next = pgd_addr_end(start, end);
 
diff --git a/arch/riscv/mm/pgtable.c b/arch/riscv/mm/pgtable.c
index f57ada26a183..150aea8e2d7a 100644
--- a/arch/riscv/mm/pgtable.c
+++ b/arch/riscv/mm/pgtable.c
@@ -128,9 +128,15 @@ int ptep_test_and_clear_young(struct vm_area_struct *vma,
 			      unsigned long address,
 			      pte_t *ptep)
 {
-	if (!pte_young(ptep_get(ptep)))
-		return 0;
-	return test_and_clear_bit(_PAGE_ACCESSED_OFFSET, &pte_val(*ptep));
+	int r = 1;
+	pte_t pte = ptep_get(ptep);
+
+	if (!pte_young(pte))
+		r = 0;
+	else
+		set_pte(ptep, pte_mkold(pte));
+
+	return r;
 }
 EXPORT_SYMBOL_GPL(ptep_test_and_clear_young);
 
diff --git a/kernel/events/core.c b/kernel/events/core.c
index df27d08a7232..84d49c60f55b 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -7709,7 +7709,7 @@ static u64 perf_get_pgtable_size(struct mm_struct *mm, unsigned long addr)
 	pte_t *ptep, pte;
 
 	pgdp = pgd_offset(mm, addr);
-	pgd = READ_ONCE(*pgdp);
+	pgd = pgdp_get_lockless(pgdp);
 	if (pgd_none(pgd))
 		return 0;
 
@@ -7717,7 +7717,7 @@ static u64 perf_get_pgtable_size(struct mm_struct *mm, unsigned long addr)
 		return pgd_leaf_size(pgd);
 
 	p4dp = p4d_offset_lockless(pgdp, pgd, addr);
-	p4d = READ_ONCE(*p4dp);
+	p4d = p4dp_get_lockless(p4dp);
 	if (!p4d_present(p4d))
 		return 0;
 
@@ -7725,7 +7725,7 @@ static u64 perf_get_pgtable_size(struct mm_struct *mm, unsigned long addr)
 		return p4d_leaf_size(p4d);
 
 	pudp = pud_offset_lockless(p4dp, p4d, addr);
-	pud = READ_ONCE(*pudp);
+	pud = pudp_get_lockless(pudp);
 	if (!pud_present(pud))
 		return 0;
 
diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
index bc748f700a9e..1cec548cc6c7 100644
--- a/mm/debug_vm_pgtable.c
+++ b/mm/debug_vm_pgtable.c
@@ -438,7 +438,7 @@ static void __init pmd_huge_tests(struct pgtable_debug_args *args)
 	 * X86 defined pmd_set_huge() verifies that the given
 	 * PMD is not a populated non-leaf entry.
 	 */
-	WRITE_ONCE(*args->pmdp, __pmd(0));
+	set_pmd(args->pmdp, __pmd(0));
 	WARN_ON(!pmd_set_huge(args->pmdp, __pfn_to_phys(args->fixed_pmd_pfn), args->page_prot));
 	WARN_ON(!pmd_clear_huge(args->pmdp));
 	pmd = pmdp_get(args->pmdp);
@@ -458,7 +458,7 @@ static void __init pud_huge_tests(struct pgtable_debug_args *args)
 	 * X86 defined pud_set_huge() verifies that the given
 	 * PUD is not a populated non-leaf entry.
 	 */
-	WRITE_ONCE(*args->pudp, __pud(0));
+	set_pud(args->pudp, __pud(0));
 	WARN_ON(!pud_set_huge(args->pudp, __pfn_to_phys(args->fixed_pud_pfn), args->page_prot));
 	WARN_ON(!pud_clear_huge(args->pudp));
 	pud = pudp_get(args->pudp);
diff --git a/mm/gup.c b/mm/gup.c
index ad0c8922dac3..db444d732028 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -1004,7 +1004,7 @@ static struct page *follow_pud_mask(struct vm_area_struct *vma,
 	struct mm_struct *mm = vma->vm_mm;
 
 	pudp = pud_offset(p4dp, address);
-	pud = READ_ONCE(*pudp);
+	pud = pudp_get_lockless(pudp);
 	if (!pud_present(pud))
 		return no_page_table(vma, flags, address);
 	if (pud_leaf(pud)) {
@@ -1029,7 +1029,7 @@ static struct page *follow_p4d_mask(struct vm_area_struct *vma,
 	p4d_t *p4dp, p4d;
 
 	p4dp = p4d_offset(pgdp, address);
-	p4d = READ_ONCE(*p4dp);
+	p4d = p4dp_get_lockless(p4dp);
 	BUILD_BUG_ON(p4d_leaf(p4d));
 
 	if (!p4d_present(p4d) || p4d_bad(p4d))
@@ -3259,7 +3259,7 @@ static int gup_fast_pud_range(p4d_t *p4dp, p4d_t p4d, unsigned long addr,
 
 	pudp = pud_offset_lockless(p4dp, p4d, addr);
 	do {
-		pud_t pud = READ_ONCE(*pudp);
+		pud_t pud = pudp_get_lockless(pudp);
 
 		next = pud_addr_end(addr, end);
 		if (unlikely(!pud_present(pud)))
@@ -3285,7 +3285,7 @@ static int gup_fast_p4d_range(pgd_t *pgdp, pgd_t pgd, unsigned long addr,
 
 	p4dp = p4d_offset_lockless(pgdp, pgd, addr);
 	do {
-		p4d_t p4d = READ_ONCE(*p4dp);
+		p4d_t p4d = p4dp_get_lockless(p4dp);
 
 		next = p4d_addr_end(addr, end);
 		if (!p4d_present(p4d))
@@ -3307,7 +3307,7 @@ static void gup_fast_pgd_range(unsigned long addr, unsigned long end,
 
 	pgdp = pgd_offset(current->mm, addr);
 	do {
-		pgd_t pgd = READ_ONCE(*pgdp);
+		pgd_t pgd = pgdp_get_lockless(pgdp);
 
 		next = pgd_addr_end(addr, end);
 		if (pgd_none(pgd))
diff --git a/mm/hmm.c b/mm/hmm.c
index 7e0229ae4a5a..fa56b735883e 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -423,7 +423,7 @@ static int hmm_vma_walk_pud(pud_t *pudp, unsigned long start, unsigned long end,
 	/* Normally we don't want to split the huge page */
 	walk->action = ACTION_CONTINUE;
 
-	pud = READ_ONCE(*pudp);
+	pud = pudp_get_lockless(pudp);
 	if (!pud_present(pud)) {
 		spin_unlock(ptl);
 		return hmm_vma_walk_hole(start, end, -1, walk);
diff --git a/mm/mapping_dirty_helpers.c b/mm/mapping_dirty_helpers.c
index 2f8829b3541a..8771432c3300 100644
--- a/mm/mapping_dirty_helpers.c
+++ b/mm/mapping_dirty_helpers.c
@@ -149,7 +149,7 @@ static int wp_clean_pud_entry(pud_t *pud, unsigned long addr, unsigned long end,
 			      struct mm_walk *walk)
 {
 #ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
-	pud_t pudval = READ_ONCE(*pud);
+	pud_t pudval = pudp_get_lockless(pud);
 
 	/* Do not split a huge pud */
 	if (pud_trans_huge(pudval) || pud_devmap(pudval)) {
diff --git a/mm/memory.c b/mm/memory.c
index bdf77a3ec47b..03ee104cb009 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -6428,12 +6428,12 @@ int follow_pfnmap_start(struct follow_pfnmap_args *args)
 		goto out;
 
 	p4dp = p4d_offset(pgdp, address);
-	p4d = READ_ONCE(*p4dp);
+	p4d = p4dp_get_lockless(p4dp);
 	if (p4d_none(p4d) || unlikely(p4d_bad(p4d)))
 		goto out;
 
 	pudp = pud_offset(p4dp, address);
-	pud = READ_ONCE(*pudp);
+	pud = pudp_get_lockless(pudp);
 	if (pud_none(pud))
 		goto out;
 	if (pud_leaf(pud)) {
diff --git a/mm/mprotect.c b/mm/mprotect.c
index 6f450af3252e..a165ab597a73 100644
--- a/mm/mprotect.c
+++ b/mm/mprotect.c
@@ -447,7 +447,7 @@ static inline long change_pud_range(struct mmu_gather *tlb,
 			break;
 		}
 
-		pud = READ_ONCE(*pudp);
+		pud = pudp_get_lockless(pudp);
 		if (pud_none(pud))
 			continue;
 
diff --git a/mm/ptdump.c b/mm/ptdump.c
index 106e1d66e9f9..b8a2ad43392f 100644
--- a/mm/ptdump.c
+++ b/mm/ptdump.c
@@ -30,7 +30,7 @@ static int ptdump_pgd_entry(pgd_t *pgd, unsigned long addr,
 			    unsigned long next, struct mm_walk *walk)
 {
 	struct ptdump_state *st = walk->private;
-	pgd_t val = READ_ONCE(*pgd);
+	pgd_t val = pgdp_get_lockless(pgd);
 
 #if CONFIG_PGTABLE_LEVELS > 4 && \
 		(defined(CONFIG_KASAN_GENERIC) || defined(CONFIG_KASAN_SW_TAGS))
@@ -53,7 +53,7 @@ static int ptdump_p4d_entry(p4d_t *p4d, unsigned long addr,
 			    unsigned long next, struct mm_walk *walk)
 {
 	struct ptdump_state *st = walk->private;
-	p4d_t val = READ_ONCE(*p4d);
+	p4d_t val = p4dp_get_lockless(p4d);
 
 #if CONFIG_PGTABLE_LEVELS > 3 && \
 		(defined(CONFIG_KASAN_GENERIC) || defined(CONFIG_KASAN_SW_TAGS))
@@ -76,7 +76,7 @@ static int ptdump_pud_entry(pud_t *pud, unsigned long addr,
 			    unsigned long next, struct mm_walk *walk)
 {
 	struct ptdump_state *st = walk->private;
-	pud_t val = READ_ONCE(*pud);
+	pud_t val = pudp_get_lockless(pud);
 
 #if CONFIG_PGTABLE_LEVELS > 2 && \
 		(defined(CONFIG_KASAN_GENERIC) || defined(CONFIG_KASAN_SW_TAGS))
@@ -99,7 +99,7 @@ static int ptdump_pmd_entry(pmd_t *pmd, unsigned long addr,
 			    unsigned long next, struct mm_walk *walk)
 {
 	struct ptdump_state *st = walk->private;
-	pmd_t val = READ_ONCE(*pmd);
+	pmd_t val = pmdp_get_lockless(pmd);
 
 #if defined(CONFIG_KASAN_GENERIC) || defined(CONFIG_KASAN_SW_TAGS)
 	if (pmd_page(val) == virt_to_page(lm_alias(kasan_early_shadow_pte)))
diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index c0388b2e959d..6621fb096fd0 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -337,7 +337,7 @@ int __meminit vmemmap_populate_hugepages(unsigned long start, unsigned long end,
 			return -ENOMEM;
 
 		pmd = pmd_offset(pud, addr);
-		if (pmd_none(READ_ONCE(*pmd))) {
+		if (pmd_none(pmdp_get_lockless(pmd))) {
 			void *p;
 
 			p = vmemmap_alloc_block_buf(PMD_SIZE, node, altmap);
diff --git a/mm/vmscan.c b/mm/vmscan.c
index 28ba2b06fc7d..2bc78c339fd1 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -3608,7 +3608,7 @@ static int walk_pud_range(p4d_t *p4d, unsigned long start, unsigned long end,
 	pud = pud_offset(p4d, start & P4D_MASK);
 restart:
 	for (i = pud_index(start), addr = start; addr != end; i++, addr = next) {
-		pud_t val = READ_ONCE(pud[i]);
+		pud_t val = pudp_get_lockless(&pud[i]);
 
 		next = pud_addr_end(addr, end);
 
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
