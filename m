Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62F51C6FD1F
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Mar 2023 14:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q8mDaPTH5FP0KljysdEm3P7xSzsLqgoEln0z/v0unrg=; b=rwIvMHr+lVWQy4
	1d4xJ+FayT2QdY/KuK6oP3DFG7+rUhZUn6mmFq/x/YX1BmieYOALsY7zM71rFymJKgEFK2pJIBwyi
	dOdjjmnWanrsWtsfx0bH/pBm1bVM4Fb8XWL3VkzSYITuZ8MnSCR+sWI32Yj+1IqQdaKq/YX5jIyme
	u55M8qh74O/qhvQbCo0NaW0P0wLSywYAaQ6+p55Mkvmf379Fj2jIgByIsW80ZlmBJtQH5yZuOYb8x
	HUKfzvbsDdY55aHEtpjmSLTsuzl0aYmq1o47JSTl1mJXkUjbVwKbVA5wpqjiwIwkvbEFT/qNmXr0Z
	MAmLilKhJ6QcG7a3tWZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcodH-00Ggwi-2I;
	Thu, 16 Mar 2023 14:31:07 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcnUq-00GV6g-2h
	for linux-riscv@lists.infradead.org;
	Thu, 16 Mar 2023 13:18:24 +0000
Received: by mail-wm1-x331.google.com with SMTP id p16so1229219wmq.5
        for <linux-riscv@lists.infradead.org>; Thu, 16 Mar 2023 06:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678972698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tp3HoPN4Gc82+RijS+v6sxY9JgB+vr3DxCDQErkACNI=;
        b=PToYMu0cKs8JYZ6vE0jZ7YqptxvvNxzJLVidWaPVHOytoFMIFwdTLHn0duEcW9msRA
         1DEp4a1ec5G0nWISGMpEGtVdHHRcqLIy32AocIm6p96VGsWXu1VqxQPHrribt2ncNfPa
         IT7NvAy3f1XFXxF4ab7MvjC7CER1BZR7JNhxXrN5STyfV/hVjikL5OIksSxcZfM5NZ7b
         p+sKuSERVfHhmhbBauv0yFqr6stSOvpGururNP0b9AutYpWisTZOOvIyYvb+WKc3PTc5
         kSNH7H862sCAjFRcT5NtWiledbRkxgFXVqgQFo/OSB2M+TbcKKYrTnLSa0NrQWaJraNx
         warg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678972698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tp3HoPN4Gc82+RijS+v6sxY9JgB+vr3DxCDQErkACNI=;
        b=RNFlE2gUehTlkFltFK4gwNs2+oEf3/hxyikYoToB8N1EN0wAx776I4lAfFDviSTZml
         tvyEYc60fHsEjWAPhCxDTux+cK+nOBqRkLagEzxxX/5cE/et0xlibCcTvgJgUD61RJTZ
         jpO0Dal7UwAmqNsPDPZqrrMfg52haEaM7B+Zs+tCfYgVFy73SU5HQDbitzdjS0KxKGrW
         QDl3RkGyH2T72oLziEDVrI97gSrzaJtQz/zzpPuv51xnHeQ3eVcGlJCqwq5zV48UBRHG
         ojUtGOVNZlvm/ngXFl2c5LrJWRKpKp9yokxQdyWm8VjN6YRHchkmJFVlUBuveQD7GpE6
         HG3w==
X-Gm-Message-State: AO0yUKUKYL5qkbCY+8sKPHEzDg6bdqAfzSqk5VwpZ+/JfozrTyd8r2Sp
	hxx1JLVfgNgACQwrJalJy2iURQ==
X-Google-Smtp-Source: AK7set/fPYDWjI/nDNH4Tp4cX0o/pdQFhcmC6kakh/lPH0h+uqTf9K4xF0cfCvGEO1gwABpPdHlqIw==
X-Received: by 2002:a05:600c:a46:b0:3ec:4621:680b with SMTP id c6-20020a05600c0a4600b003ec4621680bmr17906976wmq.14.1678972698428;
        Thu, 16 Mar 2023 06:18:18 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (238.174.185.81.rev.sfr.net. [81.185.174.238])
        by smtp.gmail.com with ESMTPSA id c16-20020adffb50000000b002d2f0e23acbsm24648wrs.12.2023.03.16.06.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 06:18:18 -0700 (PDT)
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
Subject: [PATCH v8 1/4] riscv: Get rid of riscv_pfn_base variable
Date: Thu, 16 Mar 2023 14:17:08 +0100
Message-Id: <20230316131711.1284451-2-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230316131711.1284451-1-alexghiti@rivosinc.com>
References: <20230316131711.1284451-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230316_061820_880031_17F5EB9F 
X-CRM114-Status: GOOD (  16.57  )
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
Reviewed-by: Anup Patel <anup@brainfault.org>
Tested-by: Anup Patel <anup@brainfault.org>
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
index 87f6a5d475a6..cc558d94559a 100644
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
