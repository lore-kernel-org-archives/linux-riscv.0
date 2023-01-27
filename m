Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FAECC38142
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jan 2023 08:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K/5Of0hdMAuk5mwLvMLO14p6Q/IGYCYMnUR4bA1qQLo=; b=H+nTwVnH+6Cbpl
	1MeTPJJFrvzmEobLftpigEPsdPcPkLwu3fJYKefR43UNRnZF5BTw22G6Ip4EPRNFQBMvJY21gWLl3
	I8xG23O0FScyNdZtwjHiVBH35TL+djmNJLsJ2C9Fbz44+y7woZQRYP3UC93++JfjWJdXwGbpRfXNB
	J+WhRZoJPibbSHFzwfzJ5E9/iHL5pjP0f6uIAbn/5BmEEPC/g8A6kYTLX17u2vK7XT8eroaXF6Z01
	7X8pEOAsZxPYWhQmRp18wjpJmxQZyoXN+Ch3MohvQTaJ6WRXy4ehaj9Ia306VMT6SUSTtGCwyuRSL
	lBXDf7bbipv2K3YXO9PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLKPA-00DXsP-DT; Fri, 27 Jan 2023 08:48:16 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLKP8-00DXrw-2t
	for linux-riscv@lists.infradead.org; Fri, 27 Jan 2023 08:48:15 +0000
Received: by mail-wm1-x32e.google.com with SMTP id m15so2908418wms.4
        for <linux-riscv@lists.infradead.org>; Fri, 27 Jan 2023 00:48:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=74Srsc/HZaLd2G/K5A3jwcD5Q50sHxOztEiNF18Yd+E=;
        b=RBKipDzSGwfFqx+Z550Wd/qiFS3OXSJoMjvRXvDiE8KJyVGxOqiuSa/9k5Y3HqRdVK
         08SYhbOJDZxFBhfTE7oiUlPb/M7iaei1GBjuXjcIggMy6VeyK4rapz2XrQ1twT6rJOTl
         3zF/uWAxYkROGNDC3UcS2/jrsbguPTkVFj2z1Ln3sQX9aJ02TAXQO5f0ib3DH13vgZnN
         T5qQw4ZeUDwn+2akLuxIP5cyGJPzO8JftKjYk6QiAi+dQ9jjImcc79J2PepZJl5oLJvi
         JkxfZZRY0BKYcViDNQvkLzdNhIdzAFS6iWJ420abwsacwRsZngPA1wU22TgKOqpGORlW
         wFOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=74Srsc/HZaLd2G/K5A3jwcD5Q50sHxOztEiNF18Yd+E=;
        b=ktKgnRLYbpS5dJuniEIluZT32Lvzc6OPAFogmPV22kkwLRin7nRUzcPAS9ZoL5ee1P
         waGtL5uYOzIVJkwCvJQ1eB0NKn18eNxOJ19PNz1/PIOfnvfX52lAH7jmjtOMlIQfx1sr
         rwRs1dAmiK22llEvWPM1ugnplcnrXC0U4e7zGIRor4LwrL1XN//utceaJhfZOlqolZng
         YAVuWIASACTu8+8en/SZOdeudoY1c/3ByERSF1rabelfbgVZ/ZdWK/gj8/1c0nfrr4BX
         JQyea01TXQqAFLuC3M9TD0q/H5nnzZqIufb4XIgqQlTqfL02ljzFtY6/sMArPfm0TH50
         QZLA==
X-Gm-Message-State: AFqh2kpFr6VYsBYXqYLlWclezj/XCUDCsFayVjdHt6ckUWD6XCqV1e3o
	rEmBtGJr1F5h4zEBRr4GFs7RLm6WEUb44wWq5XuAsw==
X-Google-Smtp-Source: AMrXdXtA/AmyKEpy3TzOGc4/dtiZaApnUtb/X9HOLK9Y873+F+NyOjwK4O/G2ar6UmEvFhVsCxpDzY7fqrw3nl0IXyo=
X-Received: by 2002:a7b:c4d0:0:b0:3db:459:5847 with SMTP id
 g16-20020a7bc4d0000000b003db04595847mr2144158wmk.5.1674809292405; Fri, 27 Jan
 2023 00:48:12 -0800 (PST)
MIME-Version: 1.0
References: <20230125081214.1576313-1-alexghiti@rivosinc.com>
 <20230125081214.1576313-2-alexghiti@rivosinc.com> <20230125114044.qcr2canalvljevcu@orel>
In-Reply-To: <20230125114044.qcr2canalvljevcu@orel>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Fri, 27 Jan 2023 09:48:01 +0100
Message-ID: <CAHVXubgCK23digBakrPjC7_J-OVD9Bu2=hcvDYvvtnLnyj7Ajw@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] riscv: Get rid of riscv_pfn_base variable
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, 
	Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arch@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_004814_144326_79275E7D 
X-CRM114-Status: GOOD (  33.04  )
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

On Wed, Jan 25, 2023 at 12:40 PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> On Wed, Jan 25, 2023 at 09:12:13AM +0100, Alexandre Ghiti wrote:
> > Use directly phys_ram_base instead, riscv_pfn_base is just the pfn of
> > the address contained in phys_ram_base.
> >
> > Even if there is no functional change intended in this patch, actually
> > setting phys_ram_base that early changes the behaviour of
> > kernel_mapping_pa_to_va during the early boot: phys_ram_base used to be
> > zero before this patch and now it is set to the physical start address of
> > the kernel. But it does not break the conversion of a kernel physical
> > address into a virtual address since kernel_mapping_pa_to_va should only
> > be used on kernel physical addresses, i.e. addresses greater than the
> > physical start address of the kernel.
>
> afaict, only CONFIG_XIP_KERNEL kernels use phys_ram_base prior to
> setup_bootmem() and, for them, this change only redundantly sets
> phys_ram_base to the same thing, so I believe this is a no functional
> change patch.
>

Good, thanks for checking again

> >
> > Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> > ---
> >  arch/riscv/include/asm/page.h | 3 +--
> >  arch/riscv/mm/init.c          | 6 +-----
> >  2 files changed, 2 insertions(+), 7 deletions(-)
> >
> > diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
> > index 9f432c1b5289..728eee53152a 100644
> > --- a/arch/riscv/include/asm/page.h
> > +++ b/arch/riscv/include/asm/page.h
> > @@ -91,8 +91,7 @@ typedef struct page *pgtable_t;
> >  #endif
> >
> >  #ifdef CONFIG_MMU
> > -extern unsigned long riscv_pfn_base;
> > -#define ARCH_PFN_OFFSET              (riscv_pfn_base)
> > +#define ARCH_PFN_OFFSET              (PFN_DOWN(phys_ram_base))
> >  #else
> >  #define ARCH_PFN_OFFSET              (PAGE_OFFSET >> PAGE_SHIFT)
> >  #endif /* CONFIG_MMU */
> > diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> > index 478d6763a01a..225a7d2b65cc 100644
> > --- a/arch/riscv/mm/init.c
> > +++ b/arch/riscv/mm/init.c
> > @@ -271,9 +271,6 @@ static void __init setup_bootmem(void)
> >  #ifdef CONFIG_MMU
> >  struct pt_alloc_ops pt_ops __initdata;
> >
> > -unsigned long riscv_pfn_base __ro_after_init;
> > -EXPORT_SYMBOL(riscv_pfn_base);
> > -
> >  pgd_t swapper_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
> >  pgd_t trampoline_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
> >  static pte_t fixmap_pte[PTRS_PER_PTE] __page_aligned_bss;
> > @@ -285,7 +282,6 @@ static pmd_t __maybe_unused early_dtb_pmd[PTRS_PER_PMD] __initdata __aligned(PAG
> >
> >  #ifdef CONFIG_XIP_KERNEL
> >  #define pt_ops                       (*(struct pt_alloc_ops *)XIP_FIXUP(&pt_ops))
> > -#define riscv_pfn_base         (*(unsigned long  *)XIP_FIXUP(&riscv_pfn_base))
> >  #define trampoline_pg_dir      ((pgd_t *)XIP_FIXUP(trampoline_pg_dir))
> >  #define fixmap_pte             ((pte_t *)XIP_FIXUP(fixmap_pte))
> >  #define early_pg_dir           ((pgd_t *)XIP_FIXUP(early_pg_dir))
> > @@ -985,7 +981,7 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
> >       kernel_map.va_pa_offset = PAGE_OFFSET - kernel_map.phys_addr;
> >       kernel_map.va_kernel_pa_offset = kernel_map.virt_addr - kernel_map.phys_addr;
> >
> > -     riscv_pfn_base = PFN_DOWN(kernel_map.phys_addr);
> > +     phys_ram_base = kernel_map.phys_addr;
>
> nit: I'd put this in the #else part of the #ifdef CONFIG_XIP_KERNEL above
> to have some consistency with that #ifdef arm and also avoid the redundant
> assignment of phys_ram_base for CONFIG_XIP_KERNEL.

True, but as this is removed in the next patch, I guess we can live with that.

>
> >
> >       /*
> >        * The default maximal physical memory size is KERN_VIRT_SIZE for 32-bit
> > --
> > 2.37.2
> >
>
> Otherwise,
>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks!

Alex

>
> Thanks,
> drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
