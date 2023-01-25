Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08F2BC27C76
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jan 2023 11:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LQJ16LXJZfaTkJOYSq5y7Cke7GkbD1Uq/+yheKNJOMg=; b=uCeYFUphPQ03C7
	6nQ7Ma/yaaLqIrwVWZ1dNdifa0jIvIhvVteLYDDOXSmAdrwmLbJamTdUsgJ809C1RYnyFHWN42m0E
	rtcbqoMF5nFTkU6qZAFY/qrmAO3arFGvXdt4JdcBsWkY0esHUCjHRUrNJF2ciuuSjkiRpm+DtIf4+
	rmQAsBYrqB8XT7enCKa/VcFjdo8K4QgV+9UVjCU7z3G7xfV+yNcxGQ1sLYO1wPOHeAeLKB1iTz89J
	C2d/gj5OC1cvxO271SwIZWHPjxOC61O3oC5HcA8T/5sCRP+D8lfrO8zvjdSn+mcrXLMwlhU2nl6eT
	CywWgxapIcvHYC4aijwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKe95-007C9P-Vh; Wed, 25 Jan 2023 11:40:52 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKe92-007C8h-6F
	for linux-riscv@lists.infradead.org; Wed, 25 Jan 2023 11:40:49 +0000
Received: by mail-ej1-x631.google.com with SMTP id tz11so46932664ejc.0
        for <linux-riscv@lists.infradead.org>; Wed, 25 Jan 2023 03:40:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M9CONn1V7Ye0B52Z8jaNfjazx4lKqTqS2Pz1n8BRitY=;
        b=glVFMNjSO3M/lJkAc38ryLFpJX/PuxEQkkajt8a8RsWGcjR8b0wC4FIAHEqN+saZRU
         29/3wnp6WOHjMxZgsD3Dsd04QuzB/iBeyDHvgh8hLSt3sJbiVLfq5QQRMViMQjkfnuXy
         7fnNMqWzBhDEGEDuKuz5a2Fc11hnRancjlfkzMpttm3Prl/KmYmN9ZHL9QJHechR44US
         89Uy9V1IgfRLqpZmyiUSpJM6L7lFa6H2esZgfi5Uzm5BVrgpfRHqINY3OBwquk9cBBrL
         lfDD+cmFKD6j8G7diOV21inLVr5BH0fQgv47esxBZaSZv5ODsKGDocUZ5XzvaFAxBi0e
         N9HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M9CONn1V7Ye0B52Z8jaNfjazx4lKqTqS2Pz1n8BRitY=;
        b=YcG36sBTI9DfD/GwczbOJAkdOWSa3TOxrqP/BeK6GQOVqKqWYkT6wE4oGlh2GQpZTo
         3/Fjk7rg1PJDWylIfaCWzWLw0MbQ+1/NVc+D/2jHA3D2bRv4syd0fHs9iWaPWo31o1u0
         22FC6F+gmaW4rFXzllqQzbwHkMMH7IG5vfubG+gNP7oxyB2hw0ajD14LJVYBP+jhuo5k
         XYqDv/vIgBDFkbHyD96DMlzRThCUchGm4bCFR3h6qzhEvOXpHEiTzsPkEXcB9blz/l+m
         hnTWzewQ94tLobl2DDPac+5Gq+wdNK/iWjN29jSgf0tHy1CrypshOrK+Zbgn7lKaa9aC
         R0BA==
X-Gm-Message-State: AFqh2ko6RWXgNzdcljjXVk9zTBJf2OR5hTISfkLR1ero63+YT6kjXulC
	Z1l2miOUYRMXESsx5ledSnZxhw==
X-Google-Smtp-Source: AMrXdXuOtX/o0noIZONw0GP3yL+7WMkkHddkrvvKpIG3R3OivXD5kAxRBtnLfDYjR/dvWr01000UcQ==
X-Received: by 2002:a17:906:6313:b0:7c1:6151:34c0 with SMTP id sk19-20020a170906631300b007c1615134c0mr35279437ejc.6.1674646846419;
        Wed, 25 Jan 2023 03:40:46 -0800 (PST)
Received: from localhost ([93.99.189.36])
        by smtp.gmail.com with ESMTPSA id p7-20020a1709060e8700b0086f4b8f9e42sm2287363ejf.65.2023.01.25.03.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 03:40:45 -0800 (PST)
Date: Wed, 25 Jan 2023 12:40:44 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arch@vger.kernel.org
Subject: Re: [PATCH v5 1/2] riscv: Get rid of riscv_pfn_base variable
Message-ID: <20230125114044.qcr2canalvljevcu@orel>
References: <20230125081214.1576313-1-alexghiti@rivosinc.com>
 <20230125081214.1576313-2-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230125081214.1576313-2-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_034048_247657_20FE70A7 
X-CRM114-Status: GOOD (  26.97  )
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

On Wed, Jan 25, 2023 at 09:12:13AM +0100, Alexandre Ghiti wrote:
> Use directly phys_ram_base instead, riscv_pfn_base is just the pfn of
> the address contained in phys_ram_base.
> 
> Even if there is no functional change intended in this patch, actually
> setting phys_ram_base that early changes the behaviour of
> kernel_mapping_pa_to_va during the early boot: phys_ram_base used to be
> zero before this patch and now it is set to the physical start address of
> the kernel. But it does not break the conversion of a kernel physical
> address into a virtual address since kernel_mapping_pa_to_va should only
> be used on kernel physical addresses, i.e. addresses greater than the
> physical start address of the kernel.

afaict, only CONFIG_XIP_KERNEL kernels use phys_ram_base prior to
setup_bootmem() and, for them, this change only redundantly sets
phys_ram_base to the same thing, so I believe this is a no functional
change patch.

> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/include/asm/page.h | 3 +--
>  arch/riscv/mm/init.c          | 6 +-----
>  2 files changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
> index 9f432c1b5289..728eee53152a 100644
> --- a/arch/riscv/include/asm/page.h
> +++ b/arch/riscv/include/asm/page.h
> @@ -91,8 +91,7 @@ typedef struct page *pgtable_t;
>  #endif
>  
>  #ifdef CONFIG_MMU
> -extern unsigned long riscv_pfn_base;
> -#define ARCH_PFN_OFFSET		(riscv_pfn_base)
> +#define ARCH_PFN_OFFSET		(PFN_DOWN(phys_ram_base))
>  #else
>  #define ARCH_PFN_OFFSET		(PAGE_OFFSET >> PAGE_SHIFT)
>  #endif /* CONFIG_MMU */
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 478d6763a01a..225a7d2b65cc 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -271,9 +271,6 @@ static void __init setup_bootmem(void)
>  #ifdef CONFIG_MMU
>  struct pt_alloc_ops pt_ops __initdata;
>  
> -unsigned long riscv_pfn_base __ro_after_init;
> -EXPORT_SYMBOL(riscv_pfn_base);
> -
>  pgd_t swapper_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
>  pgd_t trampoline_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
>  static pte_t fixmap_pte[PTRS_PER_PTE] __page_aligned_bss;
> @@ -285,7 +282,6 @@ static pmd_t __maybe_unused early_dtb_pmd[PTRS_PER_PMD] __initdata __aligned(PAG
>  
>  #ifdef CONFIG_XIP_KERNEL
>  #define pt_ops			(*(struct pt_alloc_ops *)XIP_FIXUP(&pt_ops))
> -#define riscv_pfn_base         (*(unsigned long  *)XIP_FIXUP(&riscv_pfn_base))
>  #define trampoline_pg_dir      ((pgd_t *)XIP_FIXUP(trampoline_pg_dir))
>  #define fixmap_pte             ((pte_t *)XIP_FIXUP(fixmap_pte))
>  #define early_pg_dir           ((pgd_t *)XIP_FIXUP(early_pg_dir))
> @@ -985,7 +981,7 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
>  	kernel_map.va_pa_offset = PAGE_OFFSET - kernel_map.phys_addr;
>  	kernel_map.va_kernel_pa_offset = kernel_map.virt_addr - kernel_map.phys_addr;
>  
> -	riscv_pfn_base = PFN_DOWN(kernel_map.phys_addr);
> +	phys_ram_base = kernel_map.phys_addr;

nit: I'd put this in the #else part of the #ifdef CONFIG_XIP_KERNEL above
to have some consistency with that #ifdef arm and also avoid the redundant
assignment of phys_ram_base for CONFIG_XIP_KERNEL.

>  
>  	/*
>  	 * The default maximal physical memory size is KERN_VIRT_SIZE for 32-bit
> -- 
> 2.37.2
>

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
