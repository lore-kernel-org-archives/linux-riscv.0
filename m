Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F8D1C04FFE
	for <linux-riscv@archiver.kernel.org>; Wed,  8 May 2024 19:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9kQTF4TnSJbGSbky6nCvqb7NxoXMbyyw09SbmsFnZSk=; b=WIBgbNIOdBbA4i
	6u4GvV+DtcPjszOR90rgQAdAiIUYLOhjr6UKtYqTzS25GENCBZkYfM5SSe6uRqRvstlaiXM3Vd3gA
	t1yG1uByiBwxN4U0e+l3bC4D4g9ORYPpdhm8zoCvGbL5HgsFsx5iDW0BrtySQcIA1Z3wP2Qs8EQIs
	Q5QilvSCtL/8twTfSFMJ2Lm73qKq4BlufZMKC7+doAJ5g862RhS8PcDx00SmJq2KlqTDZOjBuHvOA
	aMhl+r/jryApFdr6o6ofz10VUTelMf8a94rXNugrit9w5PhVMFTww7jL1EvvXSICo4yYV8aWj26Kq
	aJMnZ/qPtCE5xCCzdz+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4mqH-0000000GhCz-2JdF;
	Wed, 08 May 2024 19:20:41 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4mqD-0000000GhAc-2tJQ
	for linux-riscv@lists.infradead.org;
	Wed, 08 May 2024 19:20:39 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-a59cf8140d0so20571266b.3
        for <linux-riscv@lists.infradead.org>; Wed, 08 May 2024 12:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715196035; x=1715800835; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=datyv3e5LLeWOM64wvZ1mfI1WId3P2rVazcirFn2Oxk=;
        b=idYCjN/RXOGcRI3Et4CstnRmWY7BqUzuDTvPi8RJcXMTWwqEUFPJaUipvibNYTiA/P
         Qh69keCy6p2qQDsv1uLiFxheMS8qU0xAeBvroXXllP92NNjuRXZs0xPWpu2nqG2NBw5g
         771x6wU+aux4NjJK09Ga82hBuxJ6mWwdpmPS51sJFuZRmbzE2yluttQvN3G8hedVf2DE
         vjeubBEXR6JFKiGV5TbxJ8+zLLk+x6cr/HyClGFJvD6sv8YjqicU85XGTnEuvocFaPKl
         GUMpx6YSz3q9STVAt+M5GwIqSH8Q1R5V7otXcGUJIJMsIrMOGsxvQ8C7GHnVCnKGpmdx
         XQjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715196035; x=1715800835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=datyv3e5LLeWOM64wvZ1mfI1WId3P2rVazcirFn2Oxk=;
        b=iIGFGwJMpHqtF1+ha/6hXAOS8AtW/wWBoXcAUPfkz5jbhdQivXYdtbohGniaGSIJQ7
         qFih/zVpxpqJbex5dxjzKtCBOJdGEWitUvS7JnAeXsrbfK37RWgooc2uOssxsnEYjSrM
         Sx8ZKhGrokKY1xF2YT8mKePSJqSzH12L982dqxAyLumxaaxzMns3mprH5IQ4ar1AFit9
         wWD4jrUpsfsUyvHyoWJNfe/QkbgUhafMSDzB7vudZw6mEF/v84jelGsH0vA+rNHL4Fxp
         IWkn0wTcrJ9KVIoKEcYPaRjgefldOH94P6KTnsIsctK/v5OmJ78eEkqZF7dEm38UfnKN
         Kkhg==
X-Forwarded-Encrypted: i=1; AJvYcCWEARerfeLvlVQStWx4Dl99LqxB/imkTyAV4BQvbY5o3n+lP25IruVix1BjYj/UtOgbbo380xqxIodK5/zmME5qjCvawiKVQNToN4GtZwag
X-Gm-Message-State: AOJu0YxwT6OroxEy3kZ41E5evVpdjwund6dnrupmNq/qQsyHWfTrsWxR
	j1sVls+Plz9jE2uyAJn+2yH6e7lAtoLeQFqWlP8kdgG7WzMTwVeX/l2nT4j7ARg=
X-Google-Smtp-Source: AGHT+IFPtUz+3X9HHx3rOZWYiSnLgxFfxDjotG1sGB7J9SeveUOh2JXAABXt+ni1vfq6RI0lDXdHfA==
X-Received: by 2002:a50:ab59:0:b0:570:3b8:a990 with SMTP id 4fb4d7f45d1cf-5731da6977emr2508293a12.39.1715196034646;
        Wed, 08 May 2024 12:20:34 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id g17-20020a056402091100b00571bbaa1c45sm7881992edz.1.2024.05.08.12.20.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 12:20:34 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Ryan Roberts <ryan.roberts@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Alexander Potapenko <glider@google.com>,
	Marco Elver <elver@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Ard Biesheuvel <ardb@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com,
	linux-riscv@lists.infradead.org,
	linux-efi@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-mm@kvack.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH 01/12] mm, arm64: Rename ARM64_CONTPTE to THP_CONTPTE
Date: Wed,  8 May 2024 21:19:20 +0200
Message-Id: <20240508191931.46060-2-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240508191931.46060-1-alexghiti@rivosinc.com>
References: <20240508191931.46060-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_122037_801244_A5DDC9BC 
X-CRM114-Status: GOOD (  12.66  )
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

The ARM64_CONTPTE config represents the capability to transparently use
contpte mappings for THP userspace mappings, which will be implemented
in the next commits for riscv, so make this config more generic and move
it to mm.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/arm64/Kconfig               | 9 ---------
 arch/arm64/include/asm/pgtable.h | 6 +++---
 arch/arm64/mm/Makefile           | 2 +-
 mm/Kconfig                       | 9 +++++++++
 4 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index ac2f6d906cc3..9d823015b4e5 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -2227,15 +2227,6 @@ config UNWIND_PATCH_PAC_INTO_SCS
 	select UNWIND_TABLES
 	select DYNAMIC_SCS
 
-config ARM64_CONTPTE
-	bool "Contiguous PTE mappings for user memory" if EXPERT
-	depends on TRANSPARENT_HUGEPAGE
-	default y
-	help
-	  When enabled, user mappings are configured using the PTE contiguous
-	  bit, for any mappings that meet the size and alignment requirements.
-	  This reduces TLB pressure and improves performance.
-
 endmenu # "Kernel Features"
 
 menu "Boot options"
diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 7c2938cb70b9..1758ce71fae9 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1369,7 +1369,7 @@ extern void ptep_modify_prot_commit(struct vm_area_struct *vma,
 				    unsigned long addr, pte_t *ptep,
 				    pte_t old_pte, pte_t new_pte);
 
-#ifdef CONFIG_ARM64_CONTPTE
+#ifdef CONFIG_THP_CONTPTE
 
 /*
  * The contpte APIs are used to transparently manage the contiguous bit in ptes
@@ -1622,7 +1622,7 @@ static inline int ptep_set_access_flags(struct vm_area_struct *vma,
 	return contpte_ptep_set_access_flags(vma, addr, ptep, entry, dirty);
 }
 
-#else /* CONFIG_ARM64_CONTPTE */
+#else /* CONFIG_THP_CONTPTE */
 
 #define ptep_get				__ptep_get
 #define set_pte					__set_pte
@@ -1642,7 +1642,7 @@ static inline int ptep_set_access_flags(struct vm_area_struct *vma,
 #define __HAVE_ARCH_PTEP_SET_ACCESS_FLAGS
 #define ptep_set_access_flags			__ptep_set_access_flags
 
-#endif /* CONFIG_ARM64_CONTPTE */
+#endif /* CONFIG_THP_CONTPTE */
 
 int find_num_contig(struct mm_struct *mm, unsigned long addr,
 		    pte_t *ptep, size_t *pgsize);
diff --git a/arch/arm64/mm/Makefile b/arch/arm64/mm/Makefile
index 60454256945b..52a1b2082627 100644
--- a/arch/arm64/mm/Makefile
+++ b/arch/arm64/mm/Makefile
@@ -3,7 +3,7 @@ obj-y				:= dma-mapping.o extable.o fault.o init.o \
 				   cache.o copypage.o flush.o \
 				   ioremap.o mmap.o pgd.o mmu.o \
 				   context.o proc.o pageattr.o fixmap.o
-obj-$(CONFIG_ARM64_CONTPTE)	+= contpte.o
+obj-$(CONFIG_THP_CONTPTE)	+= contpte.o
 obj-$(CONFIG_HUGETLB_PAGE)	+= hugetlbpage.o
 obj-$(CONFIG_PTDUMP_CORE)	+= ptdump.o
 obj-$(CONFIG_PTDUMP_DEBUGFS)	+= ptdump_debugfs.o
diff --git a/mm/Kconfig b/mm/Kconfig
index c325003d6552..fd4de221a1c6 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -984,6 +984,15 @@ config ARCH_HAS_CACHE_LINE_SIZE
 config ARCH_HAS_CONTPTE
 	bool
 
+config THP_CONTPTE
+	bool "Contiguous PTE mappings for user memory" if EXPERT
+	depends on ARCH_HAS_CONTPTE && TRANSPARENT_HUGEPAGE
+	default y
+	help
+	  When enabled, user mappings are configured using the PTE contiguous
+	  bit, for any mappings that meet the size and alignment requirements.
+	  This reduces TLB pressure and improves performance.
+
 config ARCH_HAS_CURRENT_STACK_POINTER
 	bool
 	help
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
