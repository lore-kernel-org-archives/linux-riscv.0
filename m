Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 926F5CD4F41
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Nov 2025 01:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QQqYHzgiZXKDNYB7oAzLOLWcbRper8drwtlPxavvbRs=; b=yZgsqhetUxq2BP
	H8z+yyquT9jczma97BfRmrHNfy4G3+dib5V7z3Gk//hTPUbQFh0TiLhPQ9XxpKToSgCK+uBc2Xv9f
	X8ztpucu7u39zNMEowc8xQyK36Innd58i5bIJNytiKTkWL45g/ehKTE4Ectel1DsC25CMbpknwBSc
	5DLKytuETVO0xUVGw0xRCcb0f9k2WlkLtd3mRovFDJSn61c3Lxc8YzQWIlXJLPArkBxJLNxbbqVow
	3FO4TFUU8Z+ztm51LlwZT3ZSzW7lVHXTDkkTShXJaNUkEMd2uCoq2GCUpJRxBdSVeSwSeMvZlakI6
	xcS84NMZ65Noz6LoV3lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJMQh-00000009jon-2PZ0;
	Thu, 13 Nov 2025 01:47:19 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJMQd-00000009jl7-0vJL
	for linux-riscv@lists.infradead.org;
	Thu, 13 Nov 2025 01:47:16 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-ba2450aba80so158499a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 12 Nov 2025 17:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1762998434; x=1763603234; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=onXS1ZyyTIk7E4Phjch+Gs0PpMpoB1JPFOZexalawi0=;
        b=J6S0H7HiBazAmQ6XRNj9vV65Mo5nxMxACSWZdB2KyxK990/EQSgAuj4CpHKJC0jN97
         tFrfYrv09XblwLcCrJEj4/BMvL5uEpTyZur0HNqFuI1tFof6YNQX95p9MIgsG32Qp3MP
         xV37CopNrQVi1WwfejSJ0HlRdbpBTuPcXyUFaDDk/bcxxWq9eCOwaF5RTDgSWhlKy6MP
         04eWcT1NDpaNZt5O5LsSdaFEnh1V5WQstWh6iuopFUoKieTCgrI+0Ac8rHycHrATTtVY
         xgRSCHSe/JPcfEKCn/zx7EUfO2ALGyCwPD2Sk37BopfWLjVXp6QbRKPskczkYzN3Z0Jz
         ZRAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762998434; x=1763603234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=onXS1ZyyTIk7E4Phjch+Gs0PpMpoB1JPFOZexalawi0=;
        b=IBRKBjulcUfsqottWeQff6ZgviwTScOWVYqGVwZADOrLUubbypYzppljxHHB19ceQK
         +vOYfw/102jMQAP9CGr9g4MvsmPp0X13TIsil90VBTLwTk9DYmIHOVPxkuXIgboIglCq
         I9Ly2zzJgXdf3Pm9BEZnh1mZaIh8VYePQ5rcfjurZKt7Ysih8vshQ2gTMKRXmkM8JQQH
         oSYoKfT/X/I/7OsIt5RdGbQilFcGXzbE214UPGY14/fznfRK1vlnAv4L4nFjDAcGSQ8s
         JAgxllACQgAf5WK+jzADbBarNIksAJp+2g8SmSCztK0NbBUDK5IDjEx9hAqTGH6W33I9
         EnDA==
X-Forwarded-Encrypted: i=1; AJvYcCXngfmB8QDWMrQBIDeuJ0BLT8L/Pxx2o4u1y0TsnttkPPZTVN/e6pmXSmIsF3JHWw25C48tFH5HIshHmQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzw0zwqOGHTZoIFILjfCFw0QjX7S40N3f4jDFxUos0o769XbAby
	ns9HPbyrFQRnbT76OhhPrkGWk8HWZicQfgI++s2Jt+fWrKjc7+VAAXexn/aLUnaR41A=
X-Gm-Gg: ASbGnctYjEAV8UYoUs7XnqvxbyP2FczYXZy+ZxDtRBXz4GTWo9sXE8q6MDKAYuhLTTQ
	ThD61+nz1b5MwC+bjRwG7t7ItGomaOD1dj5b9Uvqtgy7CEq1htUONxCxNokFE78F5gVqOeG/sYR
	JsrKvNQc0anb729pmZLkVp1xMAnY75BlONqMKN+HA8g6+AJlfk2FW8Q0UEGYFlbKC5NHX9e+NGF
	2Tl/tho7/ldurnC4FpnJg0LIYcI55osPXTcyKuE9rosMUkZE6Bc55ra9+O26+X8hz+CevA+wWKK
	1cYzcpOzhPFalBzk+EOd1ChiJxkV7RNJ8gFnWfalxS+anrWmOi38Q4dIRe0jacX8FujPxzW+Sbg
	TAjWdP9wXiZZoUp8aqDKzRWyQMtOsQRIbg4XAXxIOZxqR7vGBosBPG5fZdIZHdR0y4rT7BTamT/
	o16xgVt4lG+3C+JgtcG9hXDQ==
X-Google-Smtp-Source: AGHT+IEPUQpGJSnlpoH1wKnMxfvk73znW6zYh27mDLEJKnxaxWn+hw/P1W+C7Nu+pbcglz2Jny/U/g==
X-Received: by 2002:a17:902:cccf:b0:297:f8d9:aad7 with SMTP id d9443c01a7336-2984ede5755mr62262705ad.50.1762998434336;
        Wed, 12 Nov 2025 17:47:14 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2ccae8sm4986485ad.98.2025.11.12.17.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 17:47:14 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	linux-riscv@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	linux-mm@kvack.org
Cc: devicetree@vger.kernel.org,
	Suren Baghdasaryan <surenb@google.com>,
	linux-kernel@vger.kernel.org,
	Mike Rapoport <rppt@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Conor Dooley <conor@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh+dt@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v3 10/22] riscv: mm: Always use page table accessor functions
Date: Wed, 12 Nov 2025 17:45:23 -0800
Message-ID: <20251113014656.2605447-11-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251113014656.2605447-1-samuel.holland@sifive.com>
References: <20251113014656.2605447-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_174715_268924_A018F72A 
X-CRM114-Status: GOOD (  17.64  )
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

Use the semantically appropriate accessor function instead of a raw
pointer dereference. This will become important once these functions
start transforming the PTE value on some platforms.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v2)

Changes in v2:
 - New patch for v2

 arch/riscv/include/asm/pgtable.h |  8 ++--
 arch/riscv/kvm/gstage.c          |  6 +--
 arch/riscv/mm/init.c             | 68 +++++++++++++++++---------------
 arch/riscv/mm/pgtable.c          |  9 +++--
 4 files changed, 49 insertions(+), 42 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 5a08eb5fe99f..acfd48f92010 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -952,7 +952,7 @@ static inline pud_t pudp_huge_get_and_clear(struct mm_struct *mm,
 #ifdef CONFIG_SMP
 	pud_t pud = __pud(xchg(&pudp->pud, 0));
 #else
-	pud_t pud = *pudp;
+	pud_t pud = pudp_get(pudp);
 
 	pud_clear(pudp);
 #endif
@@ -1129,13 +1129,15 @@ extern unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)];
  */
 #define set_p4d_safe(p4dp, p4d) \
 ({ \
-	WARN_ON_ONCE(p4d_present(*p4dp) && !p4d_same(*p4dp, p4d)); \
+	p4d_t old = p4dp_get(p4dp); \
+	WARN_ON_ONCE(p4d_present(old) && !p4d_same(old, p4d)); \
 	set_p4d(p4dp, p4d); \
 })
 
 #define set_pgd_safe(pgdp, pgd) \
 ({ \
-	WARN_ON_ONCE(pgd_present(*pgdp) && !pgd_same(*pgdp, pgd)); \
+	pgd_t old = pgdp_get(pgdp); \
+	WARN_ON_ONCE(pgd_present(old) && !pgd_same(old, pgd)); \
 	set_pgd(pgdp, pgd); \
 })
 #endif /* !__ASSEMBLER__ */
diff --git a/arch/riscv/kvm/gstage.c b/arch/riscv/kvm/gstage.c
index b67d60d722c2..297744e2ab5d 100644
--- a/arch/riscv/kvm/gstage.c
+++ b/arch/riscv/kvm/gstage.c
@@ -154,7 +154,7 @@ int kvm_riscv_gstage_set_pte(struct kvm_gstage *gstage,
 		ptep = &next_ptep[gstage_pte_index(map->addr, current_level)];
 	}
 
-	if (pte_val(*ptep) != pte_val(map->pte)) {
+	if (pte_val(ptep_get(ptep)) != pte_val(map->pte)) {
 		set_pte(ptep, map->pte);
 		if (gstage_pte_leaf(ptep))
 			gstage_tlb_flush(gstage, current_level, map->addr);
@@ -241,12 +241,12 @@ void kvm_riscv_gstage_op_pte(struct kvm_gstage *gstage, gpa_t addr,
 		if (op == GSTAGE_OP_CLEAR)
 			put_page(virt_to_page(next_ptep));
 	} else {
-		old_pte = *ptep;
+		old_pte = ptep_get(ptep);
 		if (op == GSTAGE_OP_CLEAR)
 			set_pte(ptep, __pte(0));
 		else if (op == GSTAGE_OP_WP)
 			set_pte(ptep, __pte(pte_val(ptep_get(ptep)) & ~_PAGE_WRITE));
-		if (pte_val(*ptep) != pte_val(old_pte))
+		if (pte_val(ptep_get(ptep)) != pte_val(old_pte))
 			gstage_tlb_flush(gstage, ptep_level, addr);
 	}
 }
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index d85efe74a4b6..ac686c1b2f85 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -459,8 +459,8 @@ static void __meminit create_pte_mapping(pte_t *ptep, uintptr_t va, phys_addr_t
 
 	BUG_ON(sz != PAGE_SIZE);
 
-	if (pte_none(ptep[pte_idx]))
-		ptep[pte_idx] = pfn_pte(PFN_DOWN(pa), prot);
+	if (pte_none(ptep_get(ptep + pte_idx)))
+		set_pte(ptep + pte_idx, pfn_pte(PFN_DOWN(pa), prot));
 }
 
 #ifndef __PAGETABLE_PMD_FOLDED
@@ -542,18 +542,19 @@ static void __meminit create_pmd_mapping(pmd_t *pmdp,
 	uintptr_t pmd_idx = pmd_index(va);
 
 	if (sz == PMD_SIZE) {
-		if (pmd_none(pmdp[pmd_idx]))
-			pmdp[pmd_idx] = pfn_pmd(PFN_DOWN(pa), prot);
+		if (pmd_none(pmdp_get(pmdp + pmd_idx)))
+			set_pmd(pmdp + pmd_idx, pfn_pmd(PFN_DOWN(pa), prot));
 		return;
 	}
 
-	if (pmd_none(pmdp[pmd_idx])) {
+	if (pmd_none(pmdp_get(pmdp + pmd_idx))) {
 		pte_phys = pt_ops.alloc_pte(va);
-		pmdp[pmd_idx] = pfn_pmd(PFN_DOWN(pte_phys), PAGE_TABLE);
+		set_pmd(pmdp + pmd_idx,
+			pfn_pmd(PFN_DOWN(pte_phys), PAGE_TABLE));
 		ptep = pt_ops.get_pte_virt(pte_phys);
 		memset(ptep, 0, PAGE_SIZE);
 	} else {
-		pte_phys = PFN_PHYS(_pmd_pfn(pmdp[pmd_idx]));
+		pte_phys = PFN_PHYS(_pmd_pfn(pmdp_get(pmdp + pmd_idx)));
 		ptep = pt_ops.get_pte_virt(pte_phys);
 	}
 
@@ -644,18 +645,19 @@ static void __meminit create_pud_mapping(pud_t *pudp, uintptr_t va, phys_addr_t
 	uintptr_t pud_index = pud_index(va);
 
 	if (sz == PUD_SIZE) {
-		if (pud_val(pudp[pud_index]) == 0)
-			pudp[pud_index] = pfn_pud(PFN_DOWN(pa), prot);
+		if (pud_val(pudp_get(pudp + pud_index)) == 0)
+			set_pud(pudp + pud_index, pfn_pud(PFN_DOWN(pa), prot));
 		return;
 	}
 
-	if (pud_val(pudp[pud_index]) == 0) {
+	if (pud_val(pudp_get(pudp + pud_index)) == 0) {
 		next_phys = pt_ops.alloc_pmd(va);
-		pudp[pud_index] = pfn_pud(PFN_DOWN(next_phys), PAGE_TABLE);
+		set_pud(pudp + pud_index,
+			pfn_pud(PFN_DOWN(next_phys), PAGE_TABLE));
 		nextp = pt_ops.get_pmd_virt(next_phys);
 		memset(nextp, 0, PAGE_SIZE);
 	} else {
-		next_phys = PFN_PHYS(_pud_pfn(pudp[pud_index]));
+		next_phys = PFN_PHYS(_pud_pfn(pudp_get(pudp + pud_index)));
 		nextp = pt_ops.get_pmd_virt(next_phys);
 	}
 
@@ -670,18 +672,19 @@ static void __meminit create_p4d_mapping(p4d_t *p4dp, uintptr_t va, phys_addr_t
 	uintptr_t p4d_index = p4d_index(va);
 
 	if (sz == P4D_SIZE) {
-		if (p4d_val(p4dp[p4d_index]) == 0)
-			p4dp[p4d_index] = pfn_p4d(PFN_DOWN(pa), prot);
+		if (p4d_val(p4dp_get(p4dp + p4d_index)) == 0)
+			set_p4d(p4dp + p4d_index, pfn_p4d(PFN_DOWN(pa), prot));
 		return;
 	}
 
-	if (p4d_val(p4dp[p4d_index]) == 0) {
+	if (p4d_val(p4dp_get(p4dp + p4d_index)) == 0) {
 		next_phys = pt_ops.alloc_pud(va);
-		p4dp[p4d_index] = pfn_p4d(PFN_DOWN(next_phys), PAGE_TABLE);
+		set_p4d(p4dp + p4d_index,
+			pfn_p4d(PFN_DOWN(next_phys), PAGE_TABLE));
 		nextp = pt_ops.get_pud_virt(next_phys);
 		memset(nextp, 0, PAGE_SIZE);
 	} else {
-		next_phys = PFN_PHYS(_p4d_pfn(p4dp[p4d_index]));
+		next_phys = PFN_PHYS(_p4d_pfn(p4dp_get(p4dp + p4d_index)));
 		nextp = pt_ops.get_pud_virt(next_phys);
 	}
 
@@ -727,18 +730,19 @@ void __meminit create_pgd_mapping(pgd_t *pgdp, uintptr_t va, phys_addr_t pa, phy
 	uintptr_t pgd_idx = pgd_index(va);
 
 	if (sz == PGDIR_SIZE) {
-		if (pgd_val(pgdp[pgd_idx]) == 0)
-			pgdp[pgd_idx] = pfn_pgd(PFN_DOWN(pa), prot);
+		if (pgd_val(pgdp_get(pgdp + pgd_idx)) == 0)
+			set_pgd(pgdp + pgd_idx, pfn_pgd(PFN_DOWN(pa), prot));
 		return;
 	}
 
-	if (pgd_val(pgdp[pgd_idx]) == 0) {
+	if (pgd_val(pgdp_get(pgdp + pgd_idx)) == 0) {
 		next_phys = alloc_pgd_next(va);
-		pgdp[pgd_idx] = pfn_pgd(PFN_DOWN(next_phys), PAGE_TABLE);
+		set_pgd(pgdp + pgd_idx,
+			pfn_pgd(PFN_DOWN(next_phys), PAGE_TABLE));
 		nextp = get_pgd_next_virt(next_phys);
 		memset(nextp, 0, PAGE_SIZE);
 	} else {
-		next_phys = PFN_PHYS(_pgd_pfn(pgdp[pgd_idx]));
+		next_phys = PFN_PHYS(_pgd_pfn(pgdp_get(pgdp + pgd_idx)));
 		nextp = get_pgd_next_virt(next_phys);
 	}
 
@@ -1574,14 +1578,14 @@ struct execmem_info __init *execmem_arch_setup(void)
 #ifdef CONFIG_MEMORY_HOTPLUG
 static void __meminit free_pte_table(pte_t *pte_start, pmd_t *pmd)
 {
-	struct page *page = pmd_page(*pmd);
+	struct page *page = pmd_page(pmdp_get(pmd));
 	struct ptdesc *ptdesc = page_ptdesc(page);
 	pte_t *pte;
 	int i;
 
 	for (i = 0; i < PTRS_PER_PTE; i++) {
 		pte = pte_start + i;
-		if (!pte_none(*pte))
+		if (!pte_none(ptep_get(pte)))
 			return;
 	}
 
@@ -1595,14 +1599,14 @@ static void __meminit free_pte_table(pte_t *pte_start, pmd_t *pmd)
 
 static void __meminit free_pmd_table(pmd_t *pmd_start, pud_t *pud, bool is_vmemmap)
 {
-	struct page *page = pud_page(*pud);
+	struct page *page = pud_page(pudp_get(pud));
 	struct ptdesc *ptdesc = page_ptdesc(page);
 	pmd_t *pmd;
 	int i;
 
 	for (i = 0; i < PTRS_PER_PMD; i++) {
 		pmd = pmd_start + i;
-		if (!pmd_none(*pmd))
+		if (!pmd_none(pmdp_get(pmd)))
 			return;
 	}
 
@@ -1617,13 +1621,13 @@ static void __meminit free_pmd_table(pmd_t *pmd_start, pud_t *pud, bool is_vmemm
 
 static void __meminit free_pud_table(pud_t *pud_start, p4d_t *p4d)
 {
-	struct page *page = p4d_page(*p4d);
+	struct page *page = p4d_page(p4dp_get(p4d));
 	pud_t *pud;
 	int i;
 
 	for (i = 0; i < PTRS_PER_PUD; i++) {
 		pud = pud_start + i;
-		if (!pud_none(*pud))
+		if (!pud_none(pudp_get(pud)))
 			return;
 	}
 
@@ -1668,7 +1672,7 @@ static void __meminit remove_pte_mapping(pte_t *pte_base, unsigned long addr, un
 
 		ptep = pte_base + pte_index(addr);
 		pte = ptep_get(ptep);
-		if (!pte_present(*ptep))
+		if (!pte_present(ptep_get(ptep)))
 			continue;
 
 		pte_clear(&init_mm, addr, ptep);
@@ -1698,7 +1702,7 @@ static void __meminit remove_pmd_mapping(pmd_t *pmd_base, unsigned long addr, un
 			continue;
 		}
 
-		pte_base = (pte_t *)pmd_page_vaddr(*pmdp);
+		pte_base = (pte_t *)pmd_page_vaddr(pmdp_get(pmdp));
 		remove_pte_mapping(pte_base, addr, next, is_vmemmap, altmap);
 		free_pte_table(pte_base, pmdp);
 	}
@@ -1777,10 +1781,10 @@ static void __meminit remove_pgd_mapping(unsigned long va, unsigned long end, bo
 		next = pgd_addr_end(addr, end);
 		pgd = pgd_offset_k(addr);
 
-		if (!pgd_present(*pgd))
+		if (!pgd_present(pgdp_get(pgd)))
 			continue;
 
-		if (pgd_leaf(*pgd))
+		if (pgd_leaf(pgdp_get(pgd)))
 			continue;
 
 		p4d_base = p4d_offset(pgd, 0);
diff --git a/arch/riscv/mm/pgtable.c b/arch/riscv/mm/pgtable.c
index 8b6c0a112a8d..c4b85a828797 100644
--- a/arch/riscv/mm/pgtable.c
+++ b/arch/riscv/mm/pgtable.c
@@ -95,8 +95,8 @@ int pud_free_pmd_page(pud_t *pud, unsigned long addr)
 	flush_tlb_kernel_range(addr, addr + PUD_SIZE);
 
 	for (i = 0; i < PTRS_PER_PMD; i++) {
-		if (!pmd_none(pmd[i])) {
-			pte_t *pte = (pte_t *)pmd_page_vaddr(pmd[i]);
+		if (!pmd_none(pmdp_get(pmd + i))) {
+			pte_t *pte = (pte_t *)pmd_page_vaddr(pmdp_get(pmd + i));
 
 			pte_free_kernel(NULL, pte);
 		}
@@ -158,8 +158,9 @@ pmd_t pmdp_collapse_flush(struct vm_area_struct *vma,
 pud_t pudp_invalidate(struct vm_area_struct *vma, unsigned long address,
 		      pud_t *pudp)
 {
-	VM_WARN_ON_ONCE(!pud_present(*pudp));
-	pud_t old = pudp_establish(vma, address, pudp, pud_mkinvalid(*pudp));
+	VM_WARN_ON_ONCE(!pud_present(pudp_get(pudp)));
+	pud_t old = pudp_establish(vma, address, pudp,
+				   pud_mkinvalid(pudp_get(pudp)));
 
 	flush_pud_tlb_range(vma, address, address + HPAGE_PUD_SIZE);
 	return old;
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
