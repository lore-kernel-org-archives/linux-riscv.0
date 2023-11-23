Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E983C61D85
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Nov 2023 06:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EQnvrTGeGtLQMMsWJ6VkHXglD44uz1GQVc78mP8ehko=; b=qzB8SnJnSmIA19
	Oatic/BqFzThTftvOCzGlN0em5ZMOpdGsNwZj0AcTRS+XuFZhSBbZ6OQ/cZZFoo0B4WhFGz3Duixd
	6tsWszPzAdN/4rMRd0mnr+Hl7ZObnl3WfiXB/biE3g8Spf0cMbMld85j0a0mP0RUXpGlCcKMxdlxC
	tOwUzKVPtAfmc5043KBQqoHz+/kAQDscwpG6iHvkjFp9vheE9c35Psa5GSgx4U88TlrUJFwMZ561B
	Oilr3fbjrzVDROIBib3KAlk7rmlG7fWbDxpEr+kq8aCmQJrXkOnQkLrFBmOsI/zSfmeB9MldFhY8D
	dXBqhdWeoSlgAIClLclg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r63f6-003xSk-1j;
	Thu, 23 Nov 2023 06:58:08 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r63f3-003xQr-1O
	for linux-riscv@lists.infradead.org;
	Thu, 23 Nov 2023 06:58:07 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6cbd24d9557so429905b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 22 Nov 2023 22:58:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1700722684; x=1701327484; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WlPuhP739U6c+OrO0VAY/Be/8JPEzg6mBNajKv/ssXQ=;
        b=Mpu4HmlIXCLa3hyHHLEpFiTARq9HXAaRvvx6TOZZZPc62kBhYchIbt5b97Td50m9QK
         03uoyDm/Bp7S858n2YT1qvVz7hNjY7XyZuE+9qlcOrzLRfQ5WWWHlWNg1XMz56Y0k5jj
         vsc2Xs/7FZQUmBfzFZcTBHNhry05h6zdnh6fMugzoKyI61sr3fSO74L0UIFXq5UdUUsd
         sq3YfhQHt9KDO0JEvjBkb4qNObKoQxrtihhWx4u0cGGVm67EQ4G+/e99QDS3I2HzmMOa
         BDBjz4gaKOjnUkSKtUt5TFKzPDnVDpQfiPkm7AWiwpcaNS+S5ZFDCOsohmayvTFQhoOG
         PvWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700722684; x=1701327484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WlPuhP739U6c+OrO0VAY/Be/8JPEzg6mBNajKv/ssXQ=;
        b=pti+ChPnVYFI2LkQKmutcVRomyPhIrZfSbIPMPj2vjU4Br6rjZLwbhScrcflXa/LaX
         vwi+TIH6KkHKkkEGEUop8kUihRSG3Naw+iLETdiAN4BJ60c0384rmTh1Nn9ix9OSeUwx
         tSO3RRciU5T+eNcm4u/8LUW7GU+wi6zxf5U0aiKEGsU0loSQjmdOj+R4C88QeFWFGIhY
         anOS0gmnRmR8RjChcF2xaiU9x1hxiRsTJ4zpShXsV2sn7D6G4lOd5GR7BxQ6lgbM6jr5
         Zd2xWGe8fUatlDOY0IcW2L6cesAlHPZjz/8hMu+M1z5wUygns7zxli+LHqKvzNQMiFIC
         cFCA==
X-Gm-Message-State: AOJu0YyuaEo39xcpfqmg2qMU7F0kj0+vxqROINDHaq3nWNKtT/MjB3X8
	i10oU7+w5kH8thw86+1lPR1ELg==
X-Google-Smtp-Source: AGHT+IE8riuXo5L/cjCywKIfFVpKle7h5wIh28b47x4mdmNZCzuyeGv68fbHbrOiwUZ6PsJ9tMJIhw==
X-Received: by 2002:a05:6a20:7484:b0:187:72e7:6d98 with SMTP id p4-20020a056a20748400b0018772e76d98mr2523467pzd.3.1700722683901;
        Wed, 22 Nov 2023 22:58:03 -0800 (PST)
Received: from J9GPGXL7NT.bytedance.net ([139.177.225.230])
        by smtp.gmail.com with ESMTPSA id w37-20020a634765000000b005bd2b3a03eesm615437pgk.6.2023.11.22.22.57.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 22 Nov 2023 22:58:03 -0800 (PST)
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
Subject: [RFC PATCH V1 07/11] riscv: Adapt satp operations to gap between hw page and sw page
Date: Thu, 23 Nov 2023 14:57:04 +0800
Message-Id: <20231123065708.91345-8-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20231123065708.91345-1-luxu.kernel@bytedance.com>
References: <20231123065708.91345-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_225805_474361_E3C4141F 
X-CRM114-Status: GOOD (  15.42  )
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

The control register CSR_SATP on RISC-V, which points to the root page
table page, is used by MMU to translate va to pa when TLB miss happens.
Thus it should be encoded at a granularity of hardware page, while
existing code usually encodes it via software page frame number.

This commit corrects encoding operations of CSR_SATP register. To get
developers rid of the annoying encoding format of CSR_SATP and the
conversion between sw pfn and hw pfn, we abstract the encoding
operations of CSR_SATP into a specific function.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/include/asm/pgtable.h | 7 +++++++
 arch/riscv/kernel/head.S         | 4 ++--
 arch/riscv/kernel/hibernate.c    | 3 ++-
 arch/riscv/mm/context.c          | 7 +++----
 arch/riscv/mm/fault.c            | 1 +
 arch/riscv/mm/init.c             | 7 +++++--
 arch/riscv/mm/kasan_init.c       | 7 +++++--
 7 files changed, 25 insertions(+), 11 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 9f81fe046cb8..56366f07985d 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -213,6 +213,13 @@ extern pgd_t swapper_pg_dir[];
 extern pgd_t trampoline_pg_dir[];
 extern pgd_t early_pg_dir[];
 
+static inline unsigned long make_satp(unsigned long pfn,
+		unsigned long asid, unsigned long satp_mode)
+{
+	return (pfn_to_hwpfn(pfn) |
+		((asid & SATP_ASID_MASK) << SATP_ASID_SHIFT) | satp_mode);
+}
+
 static __always_inline int __pte_present(unsigned long pteval)
 {
 	return (pteval & (_PAGE_PRESENT | _PAGE_PROT_NONE));
diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index b77397432403..dace2e4e6164 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -87,7 +87,7 @@ relocate_enable_mmu:
 	csrw CSR_TVEC, a2
 
 	/* Compute satp for kernel page tables, but don't load it yet */
-	srl a2, a0, PAGE_SHIFT
+	srl a2, a0, HW_PAGE_SHIFT
 	la a1, satp_mode
 	REG_L a1, 0(a1)
 	or a2, a2, a1
@@ -100,7 +100,7 @@ relocate_enable_mmu:
 	 */
 	la a0, trampoline_pg_dir
 	XIP_FIXUP_OFFSET a0
-	srl a0, a0, PAGE_SHIFT
+	srl a0, a0, HW_PAGE_SHIFT
 	or a0, a0, a1
 	sfence.vma
 	csrw CSR_SATP, a0
diff --git a/arch/riscv/kernel/hibernate.c b/arch/riscv/kernel/hibernate.c
index 671b686c0158..155be6b1d32c 100644
--- a/arch/riscv/kernel/hibernate.c
+++ b/arch/riscv/kernel/hibernate.c
@@ -395,7 +395,8 @@ int swsusp_arch_resume(void)
 	if (ret)
 		return ret;
 
-	hibernate_restore_image(resume_hdr.saved_satp, (PFN_DOWN(__pa(resume_pg_dir)) | satp_mode),
+	hibernate_restore_image(resume_hdr.saved_satp,
+				make_satp(PFN_DOWN(__pa(resume_pg_dir)), 0, satp_mode),
 				resume_hdr.restore_cpu_addr);
 
 	return 0;
diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
index 217fd4de6134..2ecf87433dfc 100644
--- a/arch/riscv/mm/context.c
+++ b/arch/riscv/mm/context.c
@@ -190,9 +190,8 @@ static void set_mm_asid(struct mm_struct *mm, unsigned int cpu)
 	raw_spin_unlock_irqrestore(&context_lock, flags);
 
 switch_mm_fast:
-	csr_write(CSR_SATP, virt_to_pfn(mm->pgd) |
-		  ((cntx & asid_mask) << SATP_ASID_SHIFT) |
-		  satp_mode);
+	csr_write(CSR_SATP, make_satp(virt_to_pfn(mm->pgd), (cntx & asid_mask),
+				      satp_mode));
 
 	if (need_flush_tlb)
 		local_flush_tlb_all();
@@ -201,7 +200,7 @@ static void set_mm_asid(struct mm_struct *mm, unsigned int cpu)
 static void set_mm_noasid(struct mm_struct *mm)
 {
 	/* Switch the page table and blindly nuke entire local TLB */
-	csr_write(CSR_SATP, virt_to_pfn(mm->pgd) | satp_mode);
+	csr_write(CSR_SATP, make_satp(virt_to_pfn(mm->pgd), 0, satp_mode));
 	local_flush_tlb_all();
 }
 
diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
index 90d4ba36d1d0..026ac007febf 100644
--- a/arch/riscv/mm/fault.c
+++ b/arch/riscv/mm/fault.c
@@ -133,6 +133,7 @@ static inline void vmalloc_fault(struct pt_regs *regs, int code, unsigned long a
 	 */
 	index = pgd_index(addr);
 	pfn = csr_read(CSR_SATP) & SATP_PPN;
+	pfn = hwpfn_to_pfn(pfn);
 	pgd = (pgd_t *)pfn_to_virt(pfn) + index;
 	pgd_k = init_mm.pgd + index;
 
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index a768b2b3ff05..c33a90d0c51d 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -805,7 +805,7 @@ static __init void set_satp_mode(uintptr_t dtb_pa)
 				(uintptr_t)early_p4d : (uintptr_t)early_pud,
 			   PGDIR_SIZE, PAGE_TABLE);
 
-	identity_satp = PFN_DOWN((uintptr_t)&early_pg_dir) | satp_mode;
+	identity_satp = make_satp(PFN_DOWN((uintptr_t)&early_pg_dir), 0, satp_mode);
 
 	local_flush_tlb_all();
 	csr_write(CSR_SATP, identity_satp);
@@ -1285,6 +1285,8 @@ static void __init create_linear_mapping_page_table(void)
 
 static void __init setup_vm_final(void)
 {
+	unsigned long satp;
+
 	/* Setup swapper PGD for fixmap */
 #if !defined(CONFIG_64BIT)
 	/*
@@ -1318,7 +1320,8 @@ static void __init setup_vm_final(void)
 	clear_fixmap(FIX_P4D);
 
 	/* Move to swapper page table */
-	csr_write(CSR_SATP, PFN_DOWN(__pa_symbol(swapper_pg_dir)) | satp_mode);
+	satp = make_satp(PFN_DOWN(__pa_symbol(swapper_pg_dir)), 0, satp_mode);
+	csr_write(CSR_SATP, satp);
 	local_flush_tlb_all();
 
 	pt_ops_set_late();
diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c
index 5e39dcf23fdb..72269e9f1964 100644
--- a/arch/riscv/mm/kasan_init.c
+++ b/arch/riscv/mm/kasan_init.c
@@ -471,11 +471,13 @@ static void __init create_tmp_mapping(void)
 
 void __init kasan_init(void)
 {
+	unsigned long satp;
 	phys_addr_t p_start, p_end;
 	u64 i;
 
 	create_tmp_mapping();
-	csr_write(CSR_SATP, PFN_DOWN(__pa(tmp_pg_dir)) | satp_mode);
+	satp = make_satp(PFN_DOWN(__pa(tmp_pg_dir)), 0, satp_mode);
+	csr_write(CSR_SATP, satp);
 
 	kasan_early_clear_pgd(pgd_offset_k(KASAN_SHADOW_START),
 			      KASAN_SHADOW_START, KASAN_SHADOW_END);
@@ -520,6 +522,7 @@ void __init kasan_init(void)
 	memset(kasan_early_shadow_page, KASAN_SHADOW_INIT, PAGE_SIZE);
 	init_task.kasan_depth = 0;
 
-	csr_write(CSR_SATP, PFN_DOWN(__pa(swapper_pg_dir)) | satp_mode);
+	satp = make_satp(PFN_DOWN(__pa(swapper_pg_dir)), 0, satp_mode);
+	csr_write(CSR_SATP, satp);
 	local_flush_tlb_all();
 }
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
