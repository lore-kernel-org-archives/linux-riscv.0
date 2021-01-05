Return-Path: <SRS0=oZIk=GI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1504AC433E0
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Jan 2021 11:25:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 953CE22262
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Jan 2021 11:25:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 953CE22262
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qqhDICcl9zXj6TypH/JBowmtN0PVu8vSx8J5ucE+dXI=; b=WVZzBsEMi0R+UywLDx1vPOVBF
	hil2Yjh9z0ShBf/6Ogw38m2o3dhbeG+LHhe8y5/tXjLIKGjJ1UmqZ38wl7Zm3k/AYaFkZzTKGJ/q/
	kwtUSEkzzh4BpICJDR7amFv5Zo5+6UYlRySSnJBN0yehIwH9KwlxidU6CjxJIJLfEOcvTqoRBs+O6
	DmIpnk1f0LUDi4PXpNYdKDQNcO7keRXuEsiZm7bwR3eKFi7K8nBKPC/IakXt40ANZO5Z8cGbYwZv5
	u2rSJvOZKoE7gAZseZAxP9z6Mo51h+/Snn1OQgamjhrgXSIxwuL4RUuJ8Ag5doRhq7h0q7e/giZEd
	dg8Z4smNw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwkSy-0005ZT-RW; Tue, 05 Jan 2021 11:25:32 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwkSw-0005Xy-IR
 for linux-riscv@lists.infradead.org; Tue, 05 Jan 2021 11:25:31 +0000
Received: by mail-lf1-x134.google.com with SMTP id m12so71747359lfo.7
 for <linux-riscv@lists.infradead.org>; Tue, 05 Jan 2021 03:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hjZ/0WcAaB7nd5drpvsqUaYdHBWyehQvrygbYW5v7xY=;
 b=dTxzWqeihvhN5HaLbEHaMANFr/Uc0Q6j7hsR6BLXMwiX43VNxsItgZXmPx/kQguS7Y
 2kGu1hQ5KjAhGGUo9tMJ8H0iXQSxbWhV/O+93uhq0aK1nxSrQY+II09z8xqu/2DafVz3
 5i9rjhEKC2Dm/PA3HjtTGA74YCWsyM+B2kXPlMjcwBPHI/29qqBq8gdzDBK0LgwLqkii
 ufpnn7DUHXIRYVISJpfZoyNBVzb3XLy7jo9U6TPL9ZTIxXwBxhLnJDck6lFcoQ+m61Ya
 s9HPihJRNKZkIWCzyAvT21ciexOpSWKSNgUoenFkAd348b5dQPZ+ojXubVPcWlHmJP0w
 nTtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hjZ/0WcAaB7nd5drpvsqUaYdHBWyehQvrygbYW5v7xY=;
 b=qHnGS/ZWKKEb8Uw6Vg60BfZuuIevI1MACFSud2vWRW1R2SuIYs4ds1JtnK7xUztnhC
 3DTSb+PX08sz3omfi93DBkGXyOAcyrJ3lT71oJ/13yTnXPNRlGhKRdQBY3URSMzEqaJj
 Pa2bGu0XW2bfOr8kNcS/vYWrcaNJGuvFcY3TTPtkbCw7WwFzblbKv6UICEPWkL/XmCNM
 +LjqCWEsLnvMbss+kMHoLKs1mOSBMTMDmRMsvxQ9UaPgaOI7Cqk4ousBvNU2MAz5QSjg
 O1CgOg3G8ZIuxS9uhHkEPeRlKZp8CbmKQDDABTgbCD/LuTvPcat1PCnh7s69XzwnUWcz
 ggiQ==
X-Gm-Message-State: AOAM531WiQuJkRfl4R4y4oMxJvKRBIye3Sx7+nCAD6ND2m6Or/GQuDAG
 x5tQTEUXn65oqKwIcjPRqsQ6kFxSgMRD5htBvGd6Dv0FCY91Wg==
X-Google-Smtp-Source: ABdhPJyAM5SLslHbDuU6oBuwZTfmdAwPNjAK+nPky/kIgx/sFvYRdz7DjTMbC66MWX9yUvElKiaR8eyQ+0wwVy0BCsA=
X-Received: by 2002:a05:6512:34c5:: with SMTP id
 w5mr32780407lfr.214.1609845927414; 
 Tue, 05 Jan 2021 03:25:27 -0800 (PST)
MIME-Version: 1.0
References: <20210104124314.7489-1-vitaly.wool@konsulko.com>
In-Reply-To: <20210104124314.7489-1-vitaly.wool@konsulko.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 5 Jan 2021 16:55:14 +0530
Message-ID: <CAAhSdy08ujtYCrSr-O0Me-UbqQTa9N6vjtqgUV3NZofnkOjFwg@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: add BUILTIN_DTB support for MMU-enabled targets
To: Vitaly Wool <vitaly.wool@konsulko.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210105_062530_729210_799B864D 
X-CRM114-Status: GOOD (  22.87  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Damien Le Moal <damien.lemoal@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmerdabbelt@google.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jan 4, 2021 at 6:15 PM Vitaly Wool <vitaly.wool@konsulko.com> wrote:
>
> Sometimes, especially in a production system we may not want to
> use a "smart bootloader" like u-boot to load kernel, ramdisk and
> device tree from a filesystem on eMMC, but rather load the kernel
> from a NAND partition and just run it as soon as we can, and in
> this case it is convenient to have device tree compiled into the
> kernel binary. Since this case is not limited to MMU-less systems,
> let's support it for these which have MMU enabled too.
>
> Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.com>
> ---
> Changelog from v1:
> * no direct initial_boot_params assignment
> * skips the temporary mapping for DT if BUILTIN_DTB=y
>
>  arch/riscv/Kconfig   |  1 -
>  arch/riscv/mm/init.c | 15 +++++++++++++--
>  2 files changed, 13 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 81b76d44725d..07a8bdcc423f 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -416,7 +416,6 @@ endmenu
>
>  config BUILTIN_DTB
>         def_bool n
> -       depends on RISCV_M_MODE
>         depends on OF
>
>  menu "Power management options"
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 13ba533f462b..04aeee276817 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -191,10 +191,13 @@ void __init setup_bootmem(void)
>  #endif /* CONFIG_BLK_DEV_INITRD */
>
>         /*
> -        * Avoid using early_init_fdt_reserve_self() since __pa() does
> +        * If DTB is built in, no need to reserve its memblock.
> +        * Otherwise, do reserve it but avoid using
> +        * early_init_fdt_reserve_self() since __pa() does
>          * not work for DTB pointers that are fixmap addresses
>          */
> -       memblock_reserve(dtb_early_pa, fdt_totalsize(dtb_early_va));
> +       if (!IS_ENABLED(CONFIG_BUILTIN_DTB))
> +               memblock_reserve(dtb_early_pa, fdt_totalsize(dtb_early_va));
>
>         early_init_fdt_scan_reserved_mem();
>         dma_contiguous_reserve(dma32_phys_limit);
> @@ -499,6 +502,7 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
>         /* Setup early PMD for DTB */
>         create_pgd_mapping(early_pg_dir, DTB_EARLY_BASE_VA,
>                            (uintptr_t)early_dtb_pmd, PGDIR_SIZE, PAGE_TABLE);
> +#ifndef CONFIG_BUILTIN_DTB
>         /* Create two consecutive PMD mappings for FDT early scan */
>         pa = dtb_pa & ~(PMD_SIZE - 1);
>         create_pmd_mapping(early_dtb_pmd, DTB_EARLY_BASE_VA,
> @@ -506,7 +510,11 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
>         create_pmd_mapping(early_dtb_pmd, DTB_EARLY_BASE_VA + PMD_SIZE,
>                            pa + PMD_SIZE, PMD_SIZE, PAGE_KERNEL);
>         dtb_early_va = (void *)DTB_EARLY_BASE_VA + (dtb_pa & (PMD_SIZE - 1));
> +#else /* CONFIG_BUILTIN_DTB */
> +       dtb_early_va = __va(dtb_pa);
> +#endif /* CONFIG_BUILTIN_DTB */
>  #else
> +#ifndef CONFIG_BUILTIN_DTB
>         /* Create two consecutive PGD mappings for FDT early scan */
>         pa = dtb_pa & ~(PGDIR_SIZE - 1);
>         create_pgd_mapping(early_pg_dir, DTB_EARLY_BASE_VA,
> @@ -514,6 +522,9 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
>         create_pgd_mapping(early_pg_dir, DTB_EARLY_BASE_VA + PGDIR_SIZE,
>                            pa + PGDIR_SIZE, PGDIR_SIZE, PAGE_KERNEL);
>         dtb_early_va = (void *)DTB_EARLY_BASE_VA + (dtb_pa & (PGDIR_SIZE - 1));
> +#else /* CONFIG_BUILTIN_DTB */
> +       dtb_early_va = __va(dtb_pa);
> +#endif /* CONFIG_BUILTIN_DTB */
>  #endif
>         dtb_early_pa = dtb_pa;
>
> --
> 2.20.1
>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
