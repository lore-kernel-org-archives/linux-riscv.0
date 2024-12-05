Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FEEEE7716C
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Dec 2024 10:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yEXztEQru495sbpjDgV9UGiOS7KrZQxVQIeum8FhVwY=; b=oz8+oO3UizPlFb
	4KGcPA485yUFZaz1/5CCxZxYhsOKfCGdtWRrfuyVQmF2vOuPpdFj7fc1XnRGKWjryLwjhOSnY6bOR
	bKz7+rRsxLf3Fz5z7l9wfQHC0l5jcbNK1ftmm7odwdgM2h9VEr0mveC1WHwWiiUI770rVd3kNKJXz
	vjK0IaMdqI2HHbEjwad7j0PYM/TCIR54433hZ4X0vw0LLznMu7qDcWU9MKlIlcjmSm+FfseKeYqft
	GTWgetQ7p7Iue6rGgCKwWd94vsX8TlzIBfadjOkk36rYmPgJNf24LfWKrxq60cwVxv64xgbtEClml
	oya5lPsDvdSFKvOJo5zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9Lm-0000000FaMi-25cH;
	Thu, 05 Dec 2024 10:44:50 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9Ey-0000000FY0N-3HnX
	for linux-riscv@lists.infradead.org;
	Thu, 05 Dec 2024 10:37:49 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-215666ea06aso15455225ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 05 Dec 2024 02:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1733395068; x=1733999868; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UNKH3fzWVL17kpFj96xVkU+IFapkCvyeY63L7HJogMk=;
        b=dNpRxqiqOciAPJY4zFX9tRcz0qx82pgIW3XvUjbpNJaHSWyZ7w6cGU7AvV6e9rbA8f
         u0v2Ry8UwQUhxYdKbiGXlHBEtdIAGcb82O86tkGrJgxEQFgKRBd205Hz1XQoLcfnDM3K
         11fsnbGyGIWJmf9Hm3aTewoNyq/kcdcDTl7liM20J0Kn/wLvKdMQR4eHcgM2d3qfzVtJ
         u4DHd/4eqixPmABPVHOSLXm+ROsBMZYytmL1zfQ1RJ6cp7SD5h1IUjJxYEqUFuoqCCq8
         t55jVda7kFx8Cgd6bOPPa/FIQ2niBZvsp3uq2rP9gAzFj3CaUZ/+vEJGkNw6SuWpSlst
         nQiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733395068; x=1733999868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UNKH3fzWVL17kpFj96xVkU+IFapkCvyeY63L7HJogMk=;
        b=L5wN0n2nVf9bpDFcEvz48LLDXd+WI3RXeCGVz1yXPe3M44dvwgbd6JWSKhzSiF8HN9
         3n1PBseMqA0wiBRc528UmwrmN1AOwD+eSJBIzXxei9j7x8BQKpMfFLXhWxbEmA2/Ic5e
         tq1MS4cGpU/crQsyik5DGyFwCAEB4OAc6AoeTXzxJ1RakQR2SfuIsgfkFg4d5VjmvYT2
         M8O7wxkB8Ts/kPiEnaivPrg7HwL+Q9dLpPhzLNaVRdS/+KuXd1yZXQomdxGjbSoLOTs5
         4lHj6DNoF4QUIUdIwREQh0GaZBiExXHshBasHzSPBoQvEzF3igV1rmG3/dtHKVhun+EC
         Z2+w==
X-Forwarded-Encrypted: i=1; AJvYcCU8G3Tl/129PuU1Zea2g0d1sxUgvMrQU91NxCpbD1BNIPvNusug9BEFBAgzuPG9oVC8vwNK7NW+aBZt5g==@lists.infradead.org
X-Gm-Message-State: AOJu0YyaCGA/V5ypOA0IXKNeANOCxI4zqzN5Qj3OA//4eBRRQorj4yN0
	W8A459hP6fKWYirWUvzvBbYpUrEAvzff1Hmk04ynqBaa/Acqt0wMoMKnXjaHVY85UFDA8K0zXce
	vXQ0=
X-Gm-Gg: ASbGnctjRsd51Sycd95USXEm3AdQc0DheVhMqSAVtKMcQbzefIqc6ZCUT5aiO1Rgd25
	1W7bJfIclgnbfUde3nmuE8ZeEFUT/zr6SqHAdClnHxQD/wwv67sRnQI4XOoq3La2dgVSxzjgRz0
	j91s2CBa2IRowogFaX2XTU7FKXZoLOd88ZnVaBZhdcdcFOSMOEZTIbh/7wCu5wlH3Efzn6Bi5NJ
	KSXTQxyrwEGJEftMDz/3OZSRmmm4gbL/9fFRSGBHcDiH6Ode/3x9QsXcWq/hM1H5Fgug5jl32qW
	kNpZjaTKinU2UwajB992BUU57vY+Ggvh
X-Google-Smtp-Source: AGHT+IGkn+Ya+kK82LZNSNu9BskAONVJ6LJWivbKYKO/n1RCbEvXyllqnQCmoUfNjTenfPmHl113mQ==
X-Received: by 2002:a17:902:d48a:b0:215:8112:2fb with SMTP id d9443c01a7336-215f3c7ec62mr46538845ad.13.1733395066881;
        Thu, 05 Dec 2024 02:37:46 -0800 (PST)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fd156f048csm886826a12.39.2024.12.05.02.37.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 05 Dec 2024 02:37:46 -0800 (PST)
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
Subject: [RFC PATCH v2 02/21] riscv: mm: Configure satp with hw page pfn
Date: Thu,  5 Dec 2024 18:37:10 +0800
Message-Id: <20241205103729.14798-3-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20241205103729.14798-1-luxu.kernel@bytedance.com>
References: <20241205103729.14798-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_023748_822614_7E158836 
X-CRM114-Status: GOOD (  15.32  )
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
 arch/riscv/include/asm/pgtable.h | 14 ++++++++++++++
 arch/riscv/kernel/head.S         |  4 ++--
 arch/riscv/kernel/hibernate.c    |  3 ++-
 arch/riscv/mm/context.c          |  7 +++----
 arch/riscv/mm/fault.c            |  2 +-
 arch/riscv/mm/init.c             |  7 +++++--
 arch/riscv/mm/kasan_init.c       |  7 +++++--
 7 files changed, 32 insertions(+), 12 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 9d6d0ff86c76..9d3947ec3523 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -206,6 +206,20 @@ extern pgd_t swapper_pg_dir[];
 extern pgd_t trampoline_pg_dir[];
 extern pgd_t early_pg_dir[];
 
+static inline unsigned long make_satp(unsigned long pfn,
+		unsigned long asid, unsigned long satp_mode)
+{
+	return (pfn_to_hwpfn(pfn) |
+		((asid & SATP_ASID_MASK) << SATP_ASID_SHIFT) | satp_mode);
+}
+
+static inline unsigned long satp_pfn(unsigned long satp)
+{
+	unsigned long hwpfn = satp & SATP_PPN;
+
+	return hwpfn_to_pfn(hwpfn);
+}
+
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 static inline int pmd_present(pmd_t pmd)
 {
diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 356d5397b2a2..b8568e3ddefa 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -86,7 +86,7 @@ relocate_enable_mmu:
 	csrw CSR_TVEC, a2
 
 	/* Compute satp for kernel page tables, but don't load it yet */
-	srl a2, a0, PAGE_SHIFT
+	srl a2, a0, HW_PAGE_SHIFT
 	la a1, satp_mode
 	XIP_FIXUP_OFFSET a1
 	REG_L a1, 0(a1)
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
index 4abe3de23225..229c78d9ad3a 100644
--- a/arch/riscv/mm/context.c
+++ b/arch/riscv/mm/context.c
@@ -189,9 +189,8 @@ static void set_mm_asid(struct mm_struct *mm, unsigned int cpu)
 	raw_spin_unlock_irqrestore(&context_lock, flags);
 
 switch_mm_fast:
-	csr_write(CSR_SATP, virt_to_pfn(mm->pgd) |
-		  (cntx2asid(cntx) << SATP_ASID_SHIFT) |
-		  satp_mode);
+	csr_write(CSR_SATP, make_satp(virt_to_pfn(mm->pgd), cntx2asid(cntx),
+				      satp_mode));
 
 	if (need_flush_tlb)
 		local_flush_tlb_all();
@@ -200,7 +199,7 @@ static void set_mm_asid(struct mm_struct *mm, unsigned int cpu)
 static void set_mm_noasid(struct mm_struct *mm)
 {
 	/* Switch the page table and blindly nuke entire local TLB */
-	csr_write(CSR_SATP, virt_to_pfn(mm->pgd) | satp_mode);
+	csr_write(CSR_SATP, make_satp(virt_to_pfn(mm->pgd), 0, satp_mode));
 	local_flush_tlb_all_asid(0);
 }
 
diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
index a9f2b4af8f3f..4772152be0f9 100644
--- a/arch/riscv/mm/fault.c
+++ b/arch/riscv/mm/fault.c
@@ -133,7 +133,7 @@ static inline void vmalloc_fault(struct pt_regs *regs, int code, unsigned long a
 	 * of a task switch.
 	 */
 	index = pgd_index(addr);
-	pfn = csr_read(CSR_SATP) & SATP_PPN;
+	pfn = satp_pfn(csr_read(CSR_SATP));
 	pgd = (pgd_t *)pfn_to_virt(pfn) + index;
 	pgd_k = init_mm.pgd + index;
 
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 0e8c20adcd98..f9334aab45a6 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -836,7 +836,7 @@ static __init void set_satp_mode(uintptr_t dtb_pa)
 				(uintptr_t)early_p4d : (uintptr_t)early_pud,
 			   PGDIR_SIZE, PAGE_TABLE);
 
-	identity_satp = PFN_DOWN((uintptr_t)&early_pg_dir) | satp_mode;
+	identity_satp = make_satp(PFN_DOWN((uintptr_t)&early_pg_dir), 0, satp_mode);
 
 	local_flush_tlb_all();
 	csr_write(CSR_SATP, identity_satp);
@@ -1316,6 +1316,8 @@ static void __init create_linear_mapping_page_table(void)
 
 static void __init setup_vm_final(void)
 {
+	unsigned long satp;
+
 	/* Setup swapper PGD for fixmap */
 #if !defined(CONFIG_64BIT)
 	/*
@@ -1349,7 +1351,8 @@ static void __init setup_vm_final(void)
 	clear_fixmap(FIX_P4D);
 
 	/* Move to swapper page table */
-	csr_write(CSR_SATP, PFN_DOWN(__pa_symbol(swapper_pg_dir)) | satp_mode);
+	satp = make_satp(PFN_DOWN(__pa_symbol(swapper_pg_dir)), 0, satp_mode);
+	csr_write(CSR_SATP, satp);
 	local_flush_tlb_all();
 
 	pt_ops_set_late();
diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c
index c301c8d291d2..3eee1665358e 100644
--- a/arch/riscv/mm/kasan_init.c
+++ b/arch/riscv/mm/kasan_init.c
@@ -482,11 +482,13 @@ static void __init create_tmp_mapping(void)
 
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
@@ -531,6 +533,7 @@ void __init kasan_init(void)
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
