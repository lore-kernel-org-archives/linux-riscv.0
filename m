Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90D47C6FD19
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Mar 2023 09:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6SLI665Agf4MuB+gqOJbzyZoyvLeML2O0ews8KD77C4=; b=TIUBFrnXaDJurM
	TEgpaTaaVwQXMUV2UyT1xpDWmToa4MQqJPRHzWMcB5Gpno5AhxKlOwEFoguqslsSutEpKWW86WYNN
	8GMsQXk9SO/Dq+B8/bVYMtRt4owwcxwDIm/a0YkSJn5SXJ29ikHLKN6dm6wprOMaevmXZxlJNxw9s
	TDTdCh4kafvn/1aP0mtsQUGL35lj1iU5p45P6ARLZPG6l6Mbz31nHB5a0tISKTy1+gRLFzgZ2s03H
	53RVeLZRma+55WbJYagFHzv1oKOS5j2AY9kFx5XcLj+1l8VlluSa1Kia1iZhMgBhFFEaHl9w0I7nG
	1V9q1adNQx2JLZ/vCYgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paZL5-00E1CB-FK; Fri, 10 Mar 2023 09:47:03 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paZKr-00E15S-7f
	for linux-riscv@lists.infradead.org; Fri, 10 Mar 2023 09:46:51 +0000
Received: by mail-wm1-x32e.google.com with SMTP id ay29-20020a05600c1e1d00b003e9f4c2b623so5551556wmb.3
        for <linux-riscv@lists.infradead.org>; Fri, 10 Mar 2023 01:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678441605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KgQQy0WOaC8x36p48NSIJDImmcDBT39MIpy6PGzDwU8=;
        b=DK0AVNF24CSovjJHjfX2BnbZdKEc3SCRhmed7jkWmNWONYRQJpkIDL/dDxC8+TqV4s
         iPdx2usmr4K0UsSvTjdyMJmHIJpwPpBtCXOt0TWuokX7Zry9p/D+3rjrf+QNRJWTAH9d
         FjemEPIjcSPl6Z/IT3jQJZ+EuCULRYq4LA1+kUq2ILkogKGSgomgez1hILg2QQS3XD5g
         MnLjt536CUEpLSQiQqLquY6n4kpR5vSmgTKTmGbi96kMFXMKcVgHdPrFYi3R8Xkr71dD
         FrlWWYDKsTczd5y5BLAiMFpgQ4ohQfrZRU/KQHi3A7pE0F0Ua9QPnaql2wwabry3iuEd
         DTwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678441605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KgQQy0WOaC8x36p48NSIJDImmcDBT39MIpy6PGzDwU8=;
        b=DUspEdV4VyjDidqJaEZ6xKGFAt3ImR6T6Zcv5TqvXZuXkviTrGeVD3Dz1W4LSJAMSe
         QsPjz6pEI25ETKqXPJYIAqNL6GLuj3SZ4J0MRL9kLxxI/Eb00f+XA1l6mXqaTjZ4BQz/
         q4NTisifGowt/OPyOeoFKk30205kUW0ZYoM5dhLC+e+kvJyKzgL9jEjn3p94zpRVA4nd
         lO1m0vSw8Gf+Pm2RYy930ZwmWJRt9g8pyheDc2l1XohsHouxGw9AGwSyqngrCFi/CHck
         hohUT/vt077kwD/Y5ETr64C9mG454gzVZlSvhHn/el5WH/F+tc1hrQbfG9RFl8WseP77
         YoRw==
X-Gm-Message-State: AO0yUKWN9nbR9S1OR3U64Jt7Th+RdxjfGH8SM2DVCYJ45zD//H0yCKfj
	tXGB/dP8t3AjNNYFaeQN3xLiLg==
X-Google-Smtp-Source: AK7set8b349TneToQStuc8wRqpg6p575gxaExAvpkNXCodRjWOTreYyk5UxGc9fCPDchPDs9B8XsoA==
X-Received: by 2002:a05:600c:4452:b0:3eb:2de8:b739 with SMTP id v18-20020a05600c445200b003eb2de8b739mr1958858wmn.37.1678441605417;
        Fri, 10 Mar 2023 01:46:45 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id iz9-20020a05600c554900b003eb369abd92sm2461929wmb.2.2023.03.10.01.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 01:46:45 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anup Patel <anup@brainfault.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-mm@kvack.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v7 1/4] riscv: Get rid of riscv_pfn_base variable
Date: Fri, 10 Mar 2023 10:45:36 +0100
Message-Id: <20230310094539.764357-2-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230310094539.764357-1-alexghiti@rivosinc.com>
References: <20230310094539.764357-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_014649_302023_7CD4FC51 
X-CRM114-Status: GOOD (  16.89  )
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

Use directly phys_ram_base instead, riscv_pfn_base is just the pfn of
the address contained in phys_ram_base.

Even if there is no functional change intended in this patch, actually
setting phys_ram_base that early changes the behaviour of
kernel_mapping_pa_to_va during the early boot: phys_ram_base used to be
zero before this patch and now it is set to the physical start address of
the kernel. But it does not break the conversion of a kernel physical
address into a virtual address since kernel_mapping_pa_to_va should only
be used on kernel physical addresses, i.e. addresses greater than the
physical start address of the kernel.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/page.h | 3 +--
 arch/riscv/mm/init.c          | 6 +-----
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
index 7fed7c431928..8dc686f549b6 100644
--- a/arch/riscv/include/asm/page.h
+++ b/arch/riscv/include/asm/page.h
@@ -91,8 +91,7 @@ typedef struct page *pgtable_t;
 #endif
 
 #ifdef CONFIG_MMU
-extern unsigned long riscv_pfn_base;
-#define ARCH_PFN_OFFSET		(riscv_pfn_base)
+#define ARCH_PFN_OFFSET		(PFN_DOWN((unsigned long)phys_ram_base))
 #else
 #define ARCH_PFN_OFFSET		(PAGE_OFFSET >> PAGE_SHIFT)
 #endif /* CONFIG_MMU */
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 478d6763a01a..225a7d2b65cc 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -271,9 +271,6 @@ static void __init setup_bootmem(void)
 #ifdef CONFIG_MMU
 struct pt_alloc_ops pt_ops __initdata;
 
-unsigned long riscv_pfn_base __ro_after_init;
-EXPORT_SYMBOL(riscv_pfn_base);
-
 pgd_t swapper_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
 pgd_t trampoline_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
 static pte_t fixmap_pte[PTRS_PER_PTE] __page_aligned_bss;
@@ -285,7 +282,6 @@ static pmd_t __maybe_unused early_dtb_pmd[PTRS_PER_PMD] __initdata __aligned(PAG
 
 #ifdef CONFIG_XIP_KERNEL
 #define pt_ops			(*(struct pt_alloc_ops *)XIP_FIXUP(&pt_ops))
-#define riscv_pfn_base         (*(unsigned long  *)XIP_FIXUP(&riscv_pfn_base))
 #define trampoline_pg_dir      ((pgd_t *)XIP_FIXUP(trampoline_pg_dir))
 #define fixmap_pte             ((pte_t *)XIP_FIXUP(fixmap_pte))
 #define early_pg_dir           ((pgd_t *)XIP_FIXUP(early_pg_dir))
@@ -985,7 +981,7 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 	kernel_map.va_pa_offset = PAGE_OFFSET - kernel_map.phys_addr;
 	kernel_map.va_kernel_pa_offset = kernel_map.virt_addr - kernel_map.phys_addr;
 
-	riscv_pfn_base = PFN_DOWN(kernel_map.phys_addr);
+	phys_ram_base = kernel_map.phys_addr;
 
 	/*
 	 * The default maximal physical memory size is KERN_VIRT_SIZE for 32-bit
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
