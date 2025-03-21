Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 389D4C36002
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Mar 2025 12:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tPquoGkySXlkwOza9Nv6QSEkQtAQI6Qz8IOzTvVqiTg=; b=VrRa3/gVobT3Vk
	0JMt1dptNq6hkecR0zq75Ow1kKhIH3MduP/eX5C4Ab44OqPly9qBNgCADHRNQ73Lrl1PAvJkVoP78
	Sodm/rGYA4G0z+CHytPA4eYD4chdPk5XgLPQbt2BZvvgfqhmJvTFgki7HCVikVPUX8zZraRfJZeze
	W8gEIERa/uaQWzp4mRro2ojNYAoQ3DgJ0EZPBoIxCA2elzudOOIOI70+gG+5QxKQAYF4iAUBrW59g
	xBl/sh7PkmiRv1SOKZkqtTBMMMuiika2KeIZyBjE85GS68MqYOCJGtq/zC06Yot1WZTm9XegBmb3D
	1Q7ZEevGnLffd6PeENZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvbgl-0000000EmmT-2K2p;
	Fri, 21 Mar 2025 12:41:27 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvbfU-0000000EmSQ-2api
	for linux-riscv@lists.infradead.org;
	Fri, 21 Mar 2025 12:40:10 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3912fdddf8fso1967578f8f.1
        for <linux-riscv@lists.infradead.org>; Fri, 21 Mar 2025 05:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742560806; x=1743165606; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=54rLr9I61euILvlhMaBhXDgCyKGyEgMmgO4n1SA6YHE=;
        b=SPLsz7t6xR+osjFKywB8C+nS1WToy7gHmJccwFhTJOGMhWGLnVZhAZZxHMnJ8pIroz
         epZKMCxOWooit9M/8JAzaCsLewaRx3R0BwJxgUqbnZTk1zJjV/a27hTCZJk+kiGK1dNb
         UsIr3GEM5hpvoW4Wf2nBJzENx8H/NK0S2r2LlDdp1AK9/2sSpNAks1n6v+1hc3Hrg6Ld
         0ddvTBACKjnz0ir9sUaLyMxiEJle/YXsFyzThFjnFlTLD6IsZrkcOWp2X2NVTgGHfS6g
         d38qmY7EvPFocfcibOM/Oas03jh3T0ttMrOx+MTRjG1Uv5RtAg8n4EVoyOP4HJ8JeJV/
         dXng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742560806; x=1743165606;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=54rLr9I61euILvlhMaBhXDgCyKGyEgMmgO4n1SA6YHE=;
        b=ifUZTYwtCYgFh24Cf+YwKf3jaT8sa0gpVkQhJtGPsDJ3YCo+F7gVvWM0saKQI67SSe
         HMh1tzShN1B9xUlbuD3rnPUeoaHIQiHPi0C0ANWETHVqD5FuHoNVYw8DccuZSTYdGQ51
         Nuylgwxoc1zd4WZhRE021tN3VQRSzplQRXGfkDaCqwIY3skZcWIsnpZKI/CGrs4ojyqN
         sqrRyJta2bbBuaJlhlgAKe3UfU0hvgYJuOLjOLXYfUA32s0L8Uj68OfAga8HAyXbdI+Z
         0oQyl93XEgaq/M1Ir63XB4PhJ7nDNoSazALch2bvFTTfG8Ofz0P0LBnTY0EX7+pbFRig
         4/5w==
X-Forwarded-Encrypted: i=1; AJvYcCWFsn8WvNBF5kHLlwFZt9EDk4/CwfunXgEory45ODeKixAC4vbk8Wv0O7hmbXHkbG8Cm1uYTMQDh7dT0w==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywowu8Wi1+M9QFHFk3ujPC3tOi8ssJh6Ce0omwOAZY2RKkSoynP
	BLSMYIY73s3S3ZSermTK6be26RrdjZxOI4+TwkXUOHFnKzsoPBl0Ney2E22gd2h5HNQQogjxu5/
	R
X-Gm-Gg: ASbGncvqtX2rJ/YD9K3ndjnvJA8WhQRCqaHsr2LM6LqbyoDa10+EjSlV/2ogrl1B6AP
	5knFUQ1oyMGesXZYXsiiYRNBcjMZ9s9w4KO9PlKVJKFajhqqJW2BOvPUtMmN5MKwDnLPflEXz3+
	oKzjQsADuRKALwodaZ5HDwKrVSqrJbbi2VGSKzMd1/8Bl3hpulX5yMSw6JumQpau5OcHCvfQR0K
	a4yzF3NWAMcRRxwBTdZWqqVXvqc0auQLXpMT19Ex0Ziz3o4G2RqtKhBoY02qiOwIAFYNAzi+NYc
	IbQoM/UGaQMvJ5Bqs/+oSVQACRSami1B3VieSwalKqxa2h8pQblqkg==
X-Google-Smtp-Source: AGHT+IF5g4aUqXmT7kRUsux/61ZQuk8ahvVmMCTSCiEnwytnOngRDQHxxpHZQNkTu0VDgx0+BzQeig==
X-Received: by 2002:a5d:6485:0:b0:391:1218:d5f4 with SMTP id ffacd0b85a97d-3997f93388amr2655970f8f.23.1742560806267;
        Fri, 21 Mar 2025 05:40:06 -0700 (PDT)
Received: from alex-rivos.lan ([2001:861:3382:ef90:3d12:52fe:c1cc:c94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9ef16csm2242730f8f.86.2025.03.21.05.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 05:40:05 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH] riscv: Add support for PUD THP
Date: Fri, 21 Mar 2025 13:39:54 +0100
Message-Id: <20250321123954.225097-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_054008_856860_3F6A920A 
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

Add the necessary page table functions to deal with PUD THP, this
enables the use of PUD pfnmap.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---

This patch depends on some macros defined in
https://lore.kernel.org/lkml/20250108135700.2614848-1-abrestic@rivosinc.com/
which should get merged in 6.15.

 arch/riscv/Kconfig                  |  1 +
 arch/riscv/include/asm/pgtable-64.h |  5 +-
 arch/riscv/include/asm/pgtable.h    | 97 +++++++++++++++++++++++++++++
 arch/riscv/include/asm/tlbflush.h   |  2 +
 arch/riscv/mm/pgtable.c             | 10 +++
 arch/riscv/mm/tlbflush.c            |  7 +++
 6 files changed, 120 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 7612c52e9b1e..b88dea700164 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -138,6 +138,7 @@ config RISCV
 	select HAVE_ARCH_THREAD_STRUCT_WHITELIST
 	select HAVE_ARCH_TRACEHOOK
 	select HAVE_ARCH_TRANSPARENT_HUGEPAGE if 64BIT && MMU
+	select HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD if 64BIT && MMU
 	select HAVE_ARCH_USERFAULTFD_MINOR if 64BIT && USERFAULTFD
 	select HAVE_ARCH_VMAP_STACK if MMU && 64BIT
 	select HAVE_ASM_MODVERSIONS
diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
index 0897dd99ab8d..a2c00235c447 100644
--- a/arch/riscv/include/asm/pgtable-64.h
+++ b/arch/riscv/include/asm/pgtable-64.h
@@ -184,7 +184,7 @@ static inline int pud_none(pud_t pud)
 
 static inline int pud_bad(pud_t pud)
 {
-	return !pud_present(pud);
+	return !pud_present(pud) || (pud_val(pud) & _PAGE_LEAF);
 }
 
 #define pud_leaf	pud_leaf
@@ -401,6 +401,7 @@ p4d_t *p4d_offset(pgd_t *pgd, unsigned long address);
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 static inline int pte_devmap(pte_t pte);
 static inline pte_t pmd_pte(pmd_t pmd);
+static inline pte_t pud_pte(pud_t pud);
 
 static inline int pmd_devmap(pmd_t pmd)
 {
@@ -409,7 +410,7 @@ static inline int pmd_devmap(pmd_t pmd)
 
 static inline int pud_devmap(pud_t pud)
 {
-	return 0;
+	return pte_devmap(pud_pte(pud));
 }
 
 static inline int pgd_devmap(pgd_t pgd)
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 050fdc49b5ad..10252419ed84 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -849,6 +849,103 @@ static inline pmd_t pmdp_establish(struct vm_area_struct *vma,
 #define pmdp_collapse_flush pmdp_collapse_flush
 extern pmd_t pmdp_collapse_flush(struct vm_area_struct *vma,
 				 unsigned long address, pmd_t *pmdp);
+
+static inline pud_t pud_wrprotect(pud_t pud)
+{
+	return pte_pud(pte_wrprotect(pud_pte(pud)));
+}
+
+static inline int pud_trans_huge(pud_t pud)
+{
+	return pud_leaf(pud);
+}
+
+static inline int pud_dirty(pud_t pud)
+{
+	return pte_dirty(pud_pte(pud));
+}
+
+static inline pud_t pud_mkyoung(pud_t pud)
+{
+	return pte_pud(pte_mkyoung(pud_pte(pud)));
+}
+
+static inline pud_t pud_mkold(pud_t pud)
+{
+	return pte_pud(pte_mkold(pud_pte(pud)));
+}
+
+static inline pud_t pud_mkdirty(pud_t pud)
+{
+	return pte_pud(pte_mkdirty(pud_pte(pud)));
+}
+
+static inline pud_t pud_mkclean(pud_t pud)
+{
+	return pte_pud(pte_mkclean(pud_pte(pud)));
+}
+
+static inline pud_t pud_mkwrite(pud_t pud)
+{
+	return pte_pud(pte_mkwrite_novma(pud_pte(pud)));
+}
+
+static inline pud_t pud_mkhuge(pud_t pud)
+{
+	return pud;
+}
+
+static inline pud_t pud_mkdevmap(pud_t pud)
+{
+	return pte_pud(pte_mkdevmap(pud_pte(pud)));
+}
+
+static inline int pudp_set_access_flags(struct vm_area_struct *vma,
+					unsigned long address, pud_t *pudp,
+					pud_t entry, int dirty)
+{
+	return ptep_set_access_flags(vma, address, (pte_t *)pudp, pud_pte(entry), dirty);
+}
+
+static inline int pudp_test_and_clear_young(struct vm_area_struct *vma,
+					    unsigned long address, pud_t *pudp)
+{
+	return ptep_test_and_clear_young(vma, address, (pte_t *)pudp);
+}
+
+static inline int pud_young(pud_t pud)
+{
+	return pte_young(pud_pte(pud));
+}
+
+static inline void update_mmu_cache_pud(struct vm_area_struct *vma,
+					unsigned long address, pud_t *pudp)
+{
+	pte_t *ptep = (pte_t *)pudp;
+
+	update_mmu_cache(vma, address, ptep);
+}
+
+static inline pud_t pudp_establish(struct vm_area_struct *vma,
+				   unsigned long address, pud_t *pudp, pud_t pud)
+{
+	page_table_check_pud_set(vma->vm_mm, pudp, pud);
+	return __pud(atomic_long_xchg((atomic_long_t *)pudp, pud_val(pud)));
+}
+
+static inline pud_t pud_mkinvalid(pud_t pud)
+{
+	return __pud(pud_val(pud) & ~(_PAGE_PRESENT | _PAGE_PROT_NONE));
+}
+
+extern pud_t pudp_invalidate(struct vm_area_struct *vma, unsigned long address,
+			     pud_t *pudp);
+
+static inline pud_t pud_modify(pud_t pud, pgprot_t newprot)
+{
+	return pte_pud(pte_modify(pud_pte(pud), newprot));
+}
+
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 
 /*
diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
index 72e559934952..be1ebd03658b 100644
--- a/arch/riscv/include/asm/tlbflush.h
+++ b/arch/riscv/include/asm/tlbflush.h
@@ -56,6 +56,8 @@ void local_flush_tlb_kernel_range(unsigned long start, unsigned long end);
 #define __HAVE_ARCH_FLUSH_PMD_TLB_RANGE
 void flush_pmd_tlb_range(struct vm_area_struct *vma, unsigned long start,
 			unsigned long end);
+void flush_pud_tlb_range(struct vm_area_struct *vma, unsigned long start,
+			 unsigned long end);
 #endif
 
 bool arch_tlbbatch_should_defer(struct mm_struct *mm);
diff --git a/arch/riscv/mm/pgtable.c b/arch/riscv/mm/pgtable.c
index 4ae67324f992..8b6c0a112a8d 100644
--- a/arch/riscv/mm/pgtable.c
+++ b/arch/riscv/mm/pgtable.c
@@ -154,4 +154,14 @@ pmd_t pmdp_collapse_flush(struct vm_area_struct *vma,
 	flush_tlb_mm(vma->vm_mm);
 	return pmd;
 }
+
+pud_t pudp_invalidate(struct vm_area_struct *vma, unsigned long address,
+		      pud_t *pudp)
+{
+	VM_WARN_ON_ONCE(!pud_present(*pudp));
+	pud_t old = pudp_establish(vma, address, pudp, pud_mkinvalid(*pudp));
+
+	flush_pud_tlb_range(vma, address, address + HPAGE_PUD_SIZE);
+	return old;
+}
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index 9b6e86ce3867..5765cb6f6c06 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -178,6 +178,13 @@ void flush_pmd_tlb_range(struct vm_area_struct *vma, unsigned long start,
 	__flush_tlb_range(mm_cpumask(vma->vm_mm), get_mm_asid(vma->vm_mm),
 			  start, end - start, PMD_SIZE);
 }
+
+void flush_pud_tlb_range(struct vm_area_struct *vma, unsigned long start,
+			 unsigned long end)
+{
+	__flush_tlb_range(mm_cpumask(vma->vm_mm), get_mm_asid(vma->vm_mm),
+			  start, end - start, PUD_SIZE);
+}
 #endif
 
 bool arch_tlbbatch_should_defer(struct mm_struct *mm)
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
