Return-Path: <SRS0=hJrJ=GY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D3F5C433E0
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Jan 2021 09:22:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE45823888
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Jan 2021 09:22:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE45823888
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zxGO/128SHd3dpxJTQqww4rIMc7e00cJrI9jowMF7Pg=; b=bJnKP4BDZR23fPoeMpWvJojGA
	IR6pOSG34xVGe/xkDsrxK05MBXubjsvuQoiWcLsPeu0FKhnIQ6P3svxvX7x+Kc7QH+oCXo6wwslKx
	Fwspc/vzMKF2STTs9iSJCGQfM456NlqQbY1FBo+U0tvGtCyG3Ff9yu3bnGTHPhQTU0Q/R+te7kpx/
	Ptlu7F7M4oUCiQtslZyjPA5VUF3q/32AEtqBmt3hBDYrOElP8tID7A6RsRxIBT3HgMNd1NRxYdtWG
	9Dv0jMk2xoXe7nCq5yGTizya3RNA09QPuJj1O+6ZL8TwKRRPVMcn5dodD5GNGIWPjTNSdwxQ/liB+
	MnESrlKZw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2WAH-0005TT-Kb; Thu, 21 Jan 2021 09:22:05 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2WAE-0005Sa-L3
 for linux-riscv@lists.infradead.org; Thu, 21 Jan 2021 09:22:03 +0000
Received: by mail-lj1-x232.google.com with SMTP id n8so1695676ljg.3
 for <linux-riscv@lists.infradead.org>; Thu, 21 Jan 2021 01:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=W2RjDBv9P3j9wxeJUAoiB4MW/LqAwK6JSb2C7o1dWoM=;
 b=bvWPlHHLe3bjw7pTPhEw3rCRornram+wtOuO7NizVyZiYTs1Dp7QoZch+nmjgd4Y62
 dTz3pgnSeHVqydBNPjiNGgE2J1QtzPhuS3xKaIhuBLXJNJWV7gPz0hz/m7hmftjNlhE8
 VvFtH83jLfsaGHVNMD0Rkf81VeVsG1O9dwU2o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W2RjDBv9P3j9wxeJUAoiB4MW/LqAwK6JSb2C7o1dWoM=;
 b=nKKHLbRfzvFjnIGzrih1Ar0TH5iHRq9GQ4Kf2nGBUJAgiuArw7l3ZwT2h07qZkIsPS
 oP4vMMT7vObjoRFlwUDSqXIZceJ3nMrsqyoPwquj6YOgeame2Acr9EK7RfwpJjnB8Qt7
 xuMl2q6hhdMdGcDSLhLPeFJaYJHbwt0Gm3tJjBCkRYhS2ENuvy8CHEfIyyXTNXentg8V
 6q082cefHgptYsS/nIiJsRWRZ8eE1Y1EEvN071MGkC9wmVRwCkCVuuvFR5e+cV1AesKg
 nPVSswrSQtDekr0ccuVvEq/rBSAhbi1mkWeVtDc1njLQGqex1cNb79dNazuhuDTu9u5v
 wN6Q==
X-Gm-Message-State: AOAM530a4DiwpckMVpO9zpr3hiQBEGcs1dr8qQzrk8GJAaUxpQri1b8M
 XHYu1gMYXE41goDFnLcLWiwMH0E9fW7nLHif7Wb7MT342M4=
X-Google-Smtp-Source: ABdhPJxNj6MOr6RpfwzZgv0VI4M3/od8Hezr+/6Jep8v6YkBDlSuq6ZVsP1gXCdC/IcnmjZecIOBtzvoa/VOt+c+cHE=
X-Received: by 2002:a2e:9153:: with SMTP id q19mr6211843ljg.173.1611220919160; 
 Thu, 21 Jan 2021 01:21:59 -0800 (PST)
MIME-Version: 1.0
References: <20210115234947.44014-1-vitaly.wool@konsulko.com>
In-Reply-To: <20210115234947.44014-1-vitaly.wool@konsulko.com>
From: Vitaly Wool <vitaly.wool@konsulko.com>
Date: Thu, 21 Jan 2021 10:21:48 +0100
Message-ID: <CAM4kBBLhKsysQCf1GgpSvnGKVV2HsOoVP+4VvYmQaqfpKJ45+A@mail.gmail.com>
Subject: Re: [PATCH v3] riscv: add BUILTIN_DTB support for MMU-enabled targets
To: linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210121_042202_695560_EA1BA9DE 
X-CRM114-Status: GOOD (  26.34  )
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
Cc: Anup Patel <anup@brainfault.org>, Damien Le Moal <damien.lemoal@wdc.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, LKML <linux-kernel@vger.kernel.org>,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Jan 16, 2021 at 12:57 AM Vitaly Wool <vitaly.wool@konsulko.com> wrote:
>
> Sometimes, especially in a production system we may not want to
> use a "smart bootloader" like u-boot to load kernel, ramdisk and
> device tree from a filesystem on eMMC, but rather load the kernel
> from a NAND partition and just run it as soon as we can, and in
> this case it is convenient to have device tree compiled into the
> kernel binary. Since this case is not limited to MMU-less systems,
> let's support it for these which have MMU enabled too.
>
> While at it, provide __dtb_start as a parameter to setup_vm() in
> BUILTIN_DTB case, so we don't have to duplicate BUILTIN_DTB specific
> processing in MMU-enabled and MMU-disabled versions of setup_vm().

@Palmer: ping :)

> Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.com>

While at it, since this is just a respin/concatenation:
@Damien: are you okay with re-adding 'Tested-By:' ?
@Anup: are you okay with adding 'Reviewed-by:' since you have reviewed
both v1 patches that were concatenated?

Best regards,
   Vitaly

> ---
> Changes from v2:
> * folded "RISC-V: simplify BUILTIN_DTB processing" patch
> [http://lists.infradead.org/pipermail/linux-riscv/2021-January/004153.html]
> Changes from v1:
> * no direct initial_boot_params assignment
> * skips the temporary mapping for DT if BUILTIN_DTB=y
>
>  arch/riscv/Kconfig       |  1 -
>  arch/riscv/kernel/head.S |  4 ++++
>  arch/riscv/mm/init.c     | 19 +++++++++++++------
>  3 files changed, 17 insertions(+), 7 deletions(-)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 2ef05ef921b5..444a1ed1e847 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -445,7 +445,6 @@ endmenu
>
>  config BUILTIN_DTB
>         def_bool n
> -       depends on RISCV_M_MODE
>         depends on OF
>
>  menu "Power management options"
> diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
> index 16e9941900c4..f5a9bad86e58 100644
> --- a/arch/riscv/kernel/head.S
> +++ b/arch/riscv/kernel/head.S
> @@ -260,7 +260,11 @@ clear_bss_done:
>
>         /* Initialize page tables and relocate to virtual addresses */
>         la sp, init_thread_union + THREAD_SIZE
> +#ifdef CONFIG_BUILTIN_DTB
> +       la a0, __dtb_start
> +#else
>         mv a0, s1
> +#endif /* CONFIG_BUILTIN_DTB */
>         call setup_vm
>  #ifdef CONFIG_MMU
>         la a0, early_pg_dir
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 30b61f2c6b87..45faad7c4291 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -192,10 +192,13 @@ void __init setup_bootmem(void)
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
> @@ -604,11 +615,7 @@ static void __init setup_vm_final(void)
>  #else
>  asmlinkage void __init setup_vm(uintptr_t dtb_pa)
>  {
> -#ifdef CONFIG_BUILTIN_DTB
> -       dtb_early_va = (void *) __dtb_start;
> -#else
>         dtb_early_va = (void *)dtb_pa;
> -#endif
>         dtb_early_pa = dtb_pa;
>  }
>
> --
> 2.20.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
