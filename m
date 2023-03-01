Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97EDAC7EE31
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Mar 2023 08:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yUZo5nY4GYBFtTByqFxWOhTvObEAMCr++JtbsPbHTq0=; b=iqWq/lyR4WYVzq
	n+joGARxqBlPAVIsFcUb+0dCd2zSdzOsUXqcnZRutfxsVQhtGfgmMJkU6mbD1hdfiFNsZBUICaZrj
	MRugD7Z9rVp2rUC/LhBcMsXaa+kgSvvHhiFGugP+AsSoGzIgl3AVLIk+LOlF+kO0oHV4cK30om5/x
	LZgAQ8aVCFM/44Tmn8U/f2CdCgSf8vTaoTBNVZ/OObnCEjWc2uS7K2+srT8om758gYdXHBE8zZCaI
	r+7Ej8+y+4T0ZB6ozzO48anbYAw78vYhcr60aRE5mLWKJLBOPaGGqXopl5k6UXe9c+P8vS+b1DmKP
	/P253nrrtL6oB1WyTNnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXHo1-00FRsd-A1; Wed, 01 Mar 2023 08:27:21 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXHny-00FRs1-Ca
	for linux-riscv@lists.infradead.org; Wed, 01 Mar 2023 08:27:19 +0000
Received: by mail-wr1-x430.google.com with SMTP id q16so12349235wrw.2
        for <linux-riscv@lists.infradead.org>; Wed, 01 Mar 2023 00:27:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677659237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V/vQkURrK2ciTBU+Pt35U7ABlbP4247yVAlnFnqItRY=;
        b=3wXq47ftSOAUsi4xd1gwHP/t2Qx2KSSDziZTN3nPLxzatHbZBgdoCKE6SAPoS7W1lu
         1kuOgyEs4Tjc+RkZd93D/tViTECmkVthQO5CeRnm6i21/GbHLDryAaco6DrEB+OakKn+
         0nm0nkzgPiEJWD7GeblE24M92kfnQKUPRy7q6cGr6YX61df1jswOf9aBCWEmNb5TNmnA
         6eE31v0qusiKaLJwSliWrxA/5MBcJYNkovnh+YXSKczWctIzFxeTmcgoJqDfCdNVVqgs
         W+7plCVvMuDDogVPvBOFfeTBth2+l5dy/CkjPMJXZ08frdc3+flmoNRZ4Ys8R/GaXzTv
         12bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677659237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V/vQkURrK2ciTBU+Pt35U7ABlbP4247yVAlnFnqItRY=;
        b=ve8DnqwsixQypJrkHo3i8+z3kq7LvXt8HqWqDFu3acT9/lpm0zNe7IlHnCxMzqR85N
         FbPojHycYuYF7IsiRNyrfR5GefWTfcCocdqwgZNt0Mu0EleqcHkiKYpFzYZ/4lMCBD3O
         sJFUe0TEP5/oxqpLfSl9kruh+1yHG7ShTpsQPz6EBPCce9Kih7BB1bGr1i8MX5qIPAUy
         dLjazrFvbsQ6nd1fJ6ThOUYGEr4igsPTNWOWYu4T9fCth1nAZsKaABJ8sgwlMfKjbSgU
         MKZIyfQjNomx2j12R9835aviIGuMWS9FEB/whB24MZ+kNrRINKO2+gn2yZUpywRm/w+o
         3S2A==
X-Gm-Message-State: AO0yUKWuIGGmqZ+e3LAFVwe3vsheXSz3g5N7DF9SgmQIESJkzYJMGssx
	9yHZVshwK0cri+F8B9m6GApWAw==
X-Google-Smtp-Source: AK7set9kiW+CiLCN+hsyoYIr1BHQff84nc5C3ZNm3+08O9K8LMZJnYtk8c6lYQ13uO/PhTaNmAd0uQ==
X-Received: by 2002:a5d:6507:0:b0:2c5:a6d4:1398 with SMTP id x7-20020a5d6507000000b002c5a6d41398mr3821917wru.70.1677659237035;
        Wed, 01 Mar 2023 00:27:17 -0800 (PST)
Received: from alex-rivos.home (lfbn-gre-1-235-32.w90-112.abo.wanadoo.fr. [90.112.194.32])
        by smtp.gmail.com with ESMTPSA id n16-20020a5d4850000000b002c6e8cb612fsm11733252wrs.92.2023.03.01.00.27.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Mar 2023 00:27:16 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v6 1/2] riscv: Get rid of riscv_pfn_base variable
Date: Wed,  1 Mar 2023 09:25:51 +0100
Message-Id: <20230301082552.274331-2-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230301082552.274331-1-alexghiti@rivosinc.com>
References: <20230301082552.274331-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_002718_446016_D7338BCC 
X-CRM114-Status: GOOD (  17.07  )
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
index 9f432c1b5289..926af5a3d02e 100644
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
index 04d20e41894e..bef639fa330b 100644
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
@@ -1009,7 +1005,7 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
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
