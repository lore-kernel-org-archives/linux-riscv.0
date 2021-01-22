Return-Path: <SRS0=nHLU=GZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D023BC433DB
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Jan 2021 03:26:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 880A223884
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Jan 2021 03:26:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 880A223884
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=xQSkL07pUfQCOe9XYE/4mV8VEoNIxBD1OWWWGw2KVzM=; b=pw0LSD/+0axnn6vzYtauoxl43
	hebasuwFe2yQcFfK9jFRlivpoQnFRCsdZac+uenn/nb4kHPomNSy5EYYVwpBil+ENqzD2az9zha3i
	fhvD8aQkeB81CeWiMhfiDKq4T1zK21aRirtX2ylWR4K+EPxpRKuU6Y3NYt1/8R8AhncqZc1GwS/y7
	cayh6B91cv4V18Gw2Xi3YhOjthRrraviB7GBO9Lnq/RQVFXNYrqLVjx+vtjREtGJiDB+RUaTZgCN/
	7skx8TPge2IsZtmfYYrWgShm/7UZrMwV7S5XtPrLNb8v4eHBlNb5y11NgMThOiHClJaZXLCrWxnws
	BtVi77IMA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2n5L-000315-SS; Fri, 22 Jan 2021 03:26:07 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2n5H-0002zi-DO
 for linux-riscv@lists.infradead.org; Fri, 22 Jan 2021 03:26:06 +0000
Received: by mail-pf1-x42c.google.com with SMTP id m6so2803350pfm.6
 for <linux-riscv@lists.infradead.org>; Thu, 21 Jan 2021 19:26:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=Gsjy534BQS56SU6SeFB/WjmC/NWzmnXhGpzGJe7xB60=;
 b=SG2JTRlpXpM4jYWnQLSpXSQqE1+M9/S0sKrdBaso1OszGUCKVrQPawHx1rQXdi28e/
 QvnG3RO7Y6iSNHtt7uaomykbpXiMdzyQJuvCqTRaj1qwFwwbcM/eMz2Q6pSeJmWeEna8
 LGe8DTS2wY1zx8ShTQSiqiJYutZx42G2Jo9R0WrJynYvRfrfTtIAIQrx/x9NVCJ9FrAZ
 p3COnS7W/dv8Y6AIxI2qybJGS3SM0C3lM6JOGNHG/JVTZBEr6LI1zdMjPqAKvgSKsjYg
 +nNccJ4jfcIyegU+I8KMgRhIx2B7LkAQPvWcy4t26jkVv8jPrdmrmtpcj6KKH0dQ0DUS
 UbwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=Gsjy534BQS56SU6SeFB/WjmC/NWzmnXhGpzGJe7xB60=;
 b=Gd4dIpkf9J1vfQrBXZYxtcjnKdVYhleKOH34XaFXlYKg8BUxN9tsRv9JeyS8WUF017
 sxn9z4+3dAdQciQ+Z8D0dwNPla4xR7NgIdLYFVACh10c9Y1yRyOYfC4BS7ub/EWYjJJ7
 PDsaxgzaNIo5DvVGt2O/FbaolzNKP6sPM56Puilfkm7PlAviOvKTud4rs8iD64DK/rpS
 AUVb+bq/R4dNMGgvs5Q144j1x1CRgU8WxWQ4mF+WNYfeJSB0TVlAHQYiUQPleh+7FvGb
 hNPt1DEPj/MB6jdweWztp22d1fd7/G7loZspBQY9S3GEGX991ndpeYFDSM+cdXhVjmmo
 AGjw==
X-Gm-Message-State: AOAM531NAPjMoEDanGM6ukpEOLNF5VObkspaVugk1Gq/cdZ52uZ0U2Dg
 r6RK3ZsQB6+kinhwvYS+abtXPgki+6qVYQ==
X-Google-Smtp-Source: ABdhPJzv+pZUIoh5eVCAREqwtrXilW4g0JNeb6u7OH+Lq191AYyMZ4OmtpuMycM9Wqk4ungdHbcaxw==
X-Received: by 2002:a62:ddcf:0:b029:1b7:baca:6c71 with SMTP id
 w198-20020a62ddcf0000b02901b7baca6c71mr2734869pff.43.1611285958914; 
 Thu, 21 Jan 2021 19:25:58 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id c11sm7153264pjv.3.2021.01.21.19.25.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 19:25:58 -0800 (PST)
Date: Thu, 21 Jan 2021 19:25:58 -0800 (PST)
X-Google-Original-Date: Thu, 21 Jan 2021 19:23:53 PST (-0800)
Subject: Re: [PATCH v3] riscv: add BUILTIN_DTB support for MMU-enabled targets
In-Reply-To: <20210115234947.44014-1-vitaly.wool@konsulko.com>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: vitaly.wool@konsulko.com
Message-ID: <mhng-44310bfb-e106-449b-830c-78b5e140fadb@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210121_222603_477337_F2746300 
X-CRM114-Status: GOOD (  26.47  )
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
Cc: devicetree@vger.kernel.org, Damien Le Moal <Damien.LeMoal@wdc.com>,
 anup@brainfault.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, vitaly.wool@konsulko.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 15 Jan 2021 15:49:48 PST (-0800), vitaly.wool@konsulko.com wrote:
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
>
> Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.com>
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
>  	def_bool n
> -	depends on RISCV_M_MODE
>  	depends on OF
>
>  menu "Power management options"
> diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
> index 16e9941900c4..f5a9bad86e58 100644
> --- a/arch/riscv/kernel/head.S
> +++ b/arch/riscv/kernel/head.S
> @@ -260,7 +260,11 @@ clear_bss_done:
>
>  	/* Initialize page tables and relocate to virtual addresses */
>  	la sp, init_thread_union + THREAD_SIZE
> +#ifdef CONFIG_BUILTIN_DTB
> +	la a0, __dtb_start
> +#else
>  	mv a0, s1
> +#endif /* CONFIG_BUILTIN_DTB */
>  	call setup_vm
>  #ifdef CONFIG_MMU
>  	la a0, early_pg_dir
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 30b61f2c6b87..45faad7c4291 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -192,10 +192,13 @@ void __init setup_bootmem(void)
>  #endif /* CONFIG_BLK_DEV_INITRD */
>
>  	/*
> -	 * Avoid using early_init_fdt_reserve_self() since __pa() does
> +	 * If DTB is built in, no need to reserve its memblock.
> +	 * Otherwise, do reserve it but avoid using
> +	 * early_init_fdt_reserve_self() since __pa() does
>  	 * not work for DTB pointers that are fixmap addresses
>  	 */
> -	memblock_reserve(dtb_early_pa, fdt_totalsize(dtb_early_va));
> +	if (!IS_ENABLED(CONFIG_BUILTIN_DTB))
> +		memblock_reserve(dtb_early_pa, fdt_totalsize(dtb_early_va));
>
>  	early_init_fdt_scan_reserved_mem();
>  	dma_contiguous_reserve(dma32_phys_limit);
> @@ -499,6 +502,7 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
>  	/* Setup early PMD for DTB */
>  	create_pgd_mapping(early_pg_dir, DTB_EARLY_BASE_VA,
>  			   (uintptr_t)early_dtb_pmd, PGDIR_SIZE, PAGE_TABLE);
> +#ifndef CONFIG_BUILTIN_DTB
>  	/* Create two consecutive PMD mappings for FDT early scan */
>  	pa = dtb_pa & ~(PMD_SIZE - 1);
>  	create_pmd_mapping(early_dtb_pmd, DTB_EARLY_BASE_VA,
> @@ -506,7 +510,11 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
>  	create_pmd_mapping(early_dtb_pmd, DTB_EARLY_BASE_VA + PMD_SIZE,
>  			   pa + PMD_SIZE, PMD_SIZE, PAGE_KERNEL);
>  	dtb_early_va = (void *)DTB_EARLY_BASE_VA + (dtb_pa & (PMD_SIZE - 1));
> +#else /* CONFIG_BUILTIN_DTB */
> +	dtb_early_va = __va(dtb_pa);
> +#endif /* CONFIG_BUILTIN_DTB */
>  #else
> +#ifndef CONFIG_BUILTIN_DTB
>  	/* Create two consecutive PGD mappings for FDT early scan */
>  	pa = dtb_pa & ~(PGDIR_SIZE - 1);
>  	create_pgd_mapping(early_pg_dir, DTB_EARLY_BASE_VA,
> @@ -514,6 +522,9 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
>  	create_pgd_mapping(early_pg_dir, DTB_EARLY_BASE_VA + PGDIR_SIZE,
>  			   pa + PGDIR_SIZE, PGDIR_SIZE, PAGE_KERNEL);
>  	dtb_early_va = (void *)DTB_EARLY_BASE_VA + (dtb_pa & (PGDIR_SIZE - 1));
> +#else /* CONFIG_BUILTIN_DTB */
> +	dtb_early_va = __va(dtb_pa);
> +#endif /* CONFIG_BUILTIN_DTB */
>  #endif
>  	dtb_early_pa = dtb_pa;
>
> @@ -604,11 +615,7 @@ static void __init setup_vm_final(void)
>  #else
>  asmlinkage void __init setup_vm(uintptr_t dtb_pa)
>  {
> -#ifdef CONFIG_BUILTIN_DTB
> -	dtb_early_va = (void *) __dtb_start;
> -#else
>  	dtb_early_va = (void *)dtb_pa;
> -#endif
>  	dtb_early_pa = dtb_pa;
>  }

Thanks, this is on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
