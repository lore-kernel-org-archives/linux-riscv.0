Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 065FDC10DC3
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Dec 2023 15:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tBJexGt1FIg0kg2iHOlshh1M0vJSrEi0zpTTgr2RyUA=; b=IEYoTPJmCAUEHT
	SeZdNrdckvsrnRBfwX8wjP21vrNh972iWurrAwKaw7MJchKd79WLRw7TS+c0GbZZmnVLRK+jc4HUX
	hAXTRe5BIFyuG8V1vu6j9Cz0Q3S7/l6mPpoL+fdTNkaZYyTptj9eq7ieVztvPFjS4bIDo564UlWvi
	E3EunalGEU+RlxVSQXhqB4L1fu5bpwihr9p27DecLdzmKYNmGCLtaHnWuhyFcCVBATq9y5f4Y8y6a
	JBGC/WmEQQLSMEKRIV+vRW0fcxnxrMOmgQPuWQdhBUg4d8qoHuZzZRXqpvFg63zsYUkppU3K0pySH
	2vxCEbqoTJtS3PZlx22Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBFws-00D7av-0r;
	Thu, 07 Dec 2023 15:05:58 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBFwo-00D7Yd-2s
	for linux-riscv@lists.infradead.org;
	Thu, 07 Dec 2023 15:05:56 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-332f90a375eso1061124f8f.3
        for <linux-riscv@lists.infradead.org>; Thu, 07 Dec 2023 07:05:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1701961553; x=1702566353; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LVN+VzhbTBys9mVhAQGqZxkaIjV/7TRqzMN+a14FBcU=;
        b=M2iOva94H/0KbplKPodoz19S8Qp1YcfqRq3aHbU/jKq1JMokyX2y4f7FfprFCR+pLX
         PPvOm/YEIumQdzWoXPr/4yYRXH3fcxP+VTi70UjJRI6LXpMiegN6uKnFx1aLARTj1wtz
         4/FndGOR6fdmys1yzhsA65CagPzSOR3SJXDxvi7sg+R+aM/HECVrh8TZC6Zf4lKrlptU
         dGFcdQrlFhtshMg6fZu7W8nr78lmG6qcvXU11hpF9zezjZTbP6pUEbeBu5pa2mEnw0Fs
         29UwficI5ZGEHNhBMB5XCoWaxHK3ByvhLIPHUPo55HHWoanM8pHwoT5ZxZaevt0nt0Rk
         rxpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701961553; x=1702566353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LVN+VzhbTBys9mVhAQGqZxkaIjV/7TRqzMN+a14FBcU=;
        b=U/iL2QDMHXiUXNj9emz5wRD/Qss7lz2EXtzgLKMJhfx8z17XNwWIjihFCzbmZLYIvU
         Cf90/9g88y31vP1+F7+bLTaIOflSHuumZTWkZz/i2L0sgcaFBZsgo7DjdBr4cUujE1mT
         453ZaOheCpGf9RrNUvW/9FowqNLew849DfSmgpEw8nJOd8Oh62Rf6vu3YtG/BoTpLxk3
         fYjlP1mbRIRBBnOM1CxQVglGG1gR5FL1MEqjxfxDfSQ9aAifEsJqbHUTwDSw24P5X5yc
         NE50G4t3KmYTH/J7hCMG04lABUuLXUb/fllTWQOckhFnz9MK/j/zWncF0xaAv6OW5CP6
         6xJg==
X-Gm-Message-State: AOJu0YxjzkH1u4CsGRGLoqe7KQ6OKAztmY6blwbHXQVA/WXo0t0VNkQ8
	Z5ms4bOnmAhg7ZjAqRjQws7qFg==
X-Google-Smtp-Source: AGHT+IEj2QTBGpOf3OHBs9Yni4aQareAokfWZfEZoiM8ehZh4/VLAukwcmzFcEIzO5CULnzn0YcNZw==
X-Received: by 2002:adf:ea82:0:b0:333:1907:c2a3 with SMTP id s2-20020adfea82000000b003331907c2a3mr1503404wrm.21.1701961553264;
        Thu, 07 Dec 2023 07:05:53 -0800 (PST)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id p13-20020a056000018d00b00333415503a7sm1644486wrx.22.2023.12.07.07.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 07:05:53 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ved Shanbhogue <ved@rivosinc.com>,
	Matt Evans <mev@rivosinc.com>,
	Dylan Jhong <dylan@andestech.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-mm@kvack.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH RFC/RFT 2/4] riscv: Add a runtime detection of invalid TLB entries caching
Date: Thu,  7 Dec 2023 16:03:46 +0100
Message-Id: <20231207150348.82096-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231207150348.82096-1-alexghiti@rivosinc.com>
References: <20231207150348.82096-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_070554_931563_C05F8B20 
X-CRM114-Status: GOOD (  14.84  )
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

This mechanism allows to completely bypass the sfence.vma introduced by
the previous commit for uarchs that do not cache invalid TLB entries.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/mm/init.c | 124 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 124 insertions(+)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 379403de6c6f..2e854613740c 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -56,6 +56,8 @@ bool pgtable_l5_enabled = IS_ENABLED(CONFIG_64BIT) && !IS_ENABLED(CONFIG_XIP_KER
 EXPORT_SYMBOL(pgtable_l4_enabled);
 EXPORT_SYMBOL(pgtable_l5_enabled);
 
+bool tlb_caching_invalid_entries;
+
 phys_addr_t phys_ram_base __ro_after_init;
 EXPORT_SYMBOL(phys_ram_base);
 
@@ -750,6 +752,18 @@ static void __init disable_pgtable_l4(void)
 	satp_mode = SATP_MODE_39;
 }
 
+static void __init enable_pgtable_l5(void)
+{
+	pgtable_l5_enabled = true;
+	satp_mode = SATP_MODE_57;
+}
+
+static void __init enable_pgtable_l4(void)
+{
+	pgtable_l4_enabled = true;
+	satp_mode = SATP_MODE_48;
+}
+
 static int __init print_no4lvl(char *p)
 {
 	pr_info("Disabled 4-level and 5-level paging");
@@ -826,6 +840,112 @@ static __init void set_satp_mode(uintptr_t dtb_pa)
 	memset(early_pud, 0, PAGE_SIZE);
 	memset(early_pmd, 0, PAGE_SIZE);
 }
+
+/* Determine at runtime if the uarch caches invalid TLB entries */
+static __init void set_tlb_caching_invalid_entries(void)
+{
+#define NR_RETRIES_CACHING_INVALID_ENTRIES	50
+	uintptr_t set_tlb_caching_invalid_entries_pmd = ((unsigned long)set_tlb_caching_invalid_entries) & PMD_MASK;
+	// TODO the test_addr as defined below could go into another pud...
+	uintptr_t test_addr = set_tlb_caching_invalid_entries_pmd + 2 * PMD_SIZE;
+	pmd_t valid_pmd;
+	u64 satp;
+	int i = 0;
+
+	/* To ease the page table creation */
+	disable_pgtable_l5();
+	disable_pgtable_l4();
+
+	/* Establish a mapping for set_tlb_caching_invalid_entries() in sv39 */
+	create_pgd_mapping(early_pg_dir,
+			   set_tlb_caching_invalid_entries_pmd,
+			   (uintptr_t)early_pmd,
+			   PGDIR_SIZE, PAGE_TABLE);
+
+	/* Handle the case where set_tlb_caching_invalid_entries straddles 2 PMDs */
+	create_pmd_mapping(early_pmd,
+			   set_tlb_caching_invalid_entries_pmd,
+			   set_tlb_caching_invalid_entries_pmd,
+			   PMD_SIZE, PAGE_KERNEL_EXEC);
+	create_pmd_mapping(early_pmd,
+			   set_tlb_caching_invalid_entries_pmd + PMD_SIZE,
+			   set_tlb_caching_invalid_entries_pmd + PMD_SIZE,
+			   PMD_SIZE, PAGE_KERNEL_EXEC);
+
+	/* Establish an invalid mapping */
+	create_pmd_mapping(early_pmd, test_addr, 0, PMD_SIZE, __pgprot(0));
+
+	/* Precompute the valid pmd here because the mapping for pfn_pmd() won't exist */
+	valid_pmd = pfn_pmd(PFN_DOWN(set_tlb_caching_invalid_entries_pmd), PAGE_KERNEL);
+
+	local_flush_tlb_all();
+	satp = PFN_DOWN((uintptr_t)&early_pg_dir) | SATP_MODE_39;
+	csr_write(CSR_SATP, satp);
+
+	/*
+	 * Set stvec to after the trapping access, access this invalid mapping
+	 * and legitimately trap
+	 */
+	// TODO: Should I save the previous stvec?
+#define ASM_STR(x)	__ASM_STR(x)
+	asm volatile(
+		"la a0, 1f				\n"
+		"csrw " ASM_STR(CSR_TVEC) ", a0		\n"
+		"ld a0, 0(%0)				\n"
+		".align 2				\n"
+		"1:					\n"
+		:
+		: "r" (test_addr)
+		: "a0"
+	);
+
+	/* Now establish a valid mapping to check if the invalid one is cached */
+	early_pmd[pmd_index(test_addr)] = valid_pmd;
+
+	/*
+	 * Access the valid mapping multiple times: indeed, we can't use
+	 * sfence.vma as a barrier to make sure the cpu did not reorder accesses
+	 * so we may trap even if the uarch does not cache invalid entries. By
+	 * trying a few times, we make sure that those uarchs will see the right
+	 * mapping at some point.
+	 */
+
+	i = NR_RETRIES_CACHING_INVALID_ENTRIES;
+
+#define ASM_STR(x)	__ASM_STR(x)
+	asm_volatile_goto(
+		"la a0, 1f					\n"
+		"csrw " ASM_STR(CSR_TVEC) ", a0			\n"
+		".align 2					\n"
+		"1:						\n"
+		"addi %0, %0, -1				\n"
+		"blt %0, zero, %l[caching_invalid_entries]	\n"
+		"ld a0, 0(%1)					\n"
+		:
+		: "r" (i), "r" (test_addr)
+		: "a0"
+		: caching_invalid_entries
+	);
+
+	csr_write(CSR_SATP, 0ULL);
+	local_flush_tlb_all();
+
+	/* If we don't trap, the uarch does not cache invalid entries! */
+	tlb_caching_invalid_entries = false;
+	goto clean;
+
+caching_invalid_entries:
+	csr_write(CSR_SATP, 0ULL);
+	local_flush_tlb_all();
+
+	tlb_caching_invalid_entries = true;
+clean:
+	memset(early_pg_dir, 0, PAGE_SIZE);
+	memset(early_pmd, 0, PAGE_SIZE);
+
+	enable_pgtable_l4();
+	enable_pgtable_l5();
+}
 #endif
 
 /*
@@ -1072,6 +1192,7 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 #endif
 
 #if defined(CONFIG_64BIT) && !defined(CONFIG_XIP_KERNEL)
+	set_tlb_caching_invalid_entries();
 	set_satp_mode(dtb_pa);
 #endif
 
@@ -1322,6 +1443,9 @@ static void __init setup_vm_final(void)
 	local_flush_tlb_all();
 
 	pt_ops_set_late();
+
+	pr_info("uarch caches invalid entries: %s",
+		tlb_caching_invalid_entries ? "yes" : "no");
 }
 #else
 asmlinkage void __init setup_vm(uintptr_t dtb_pa)
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
