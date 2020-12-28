Return-Path: <SRS0=F85b=GA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F7BDC433DB
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Dec 2020 12:00:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDD1222583
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Dec 2020 12:00:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EDD1222583
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QTm+XbiqYGxRBMYmErAPKjq/onr2Eipz7sHfPJBX5hQ=; b=otWttYTgSKRkCeeaMsse8P9YK
	PaaBmhUQbFgwpLzJJZ7HEyiJ3cb0h4GQ7OPNYnRTZPJj6s6xPVUi+yfEDAJJqrTIy+P6hUX5aG9s0
	goCkJTwpaFaFzkR0HpCzfhLhpcqsnyGvVucZX7BbXJYYtngca7EESn2gp6Y/RMrqRSht5tvVFZeTV
	rPaYwNjRAlif1FXihTWEx0X4Fg0NMPiDzsOPFudHwEvlpURMCzBOTi55K4Ufw+rdvmjNP1RUurpYs
	m1ofgSplWERtHcqX7OUq+2HJ+vH6CmWSLq8FryeMR2o/EeE3WqXE48bYKhz+CBEjDocufvM/9UzfQ
	bYW8HflLQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ktrBv-0006fz-Sf; Mon, 28 Dec 2020 11:59:59 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ktrBs-0006ec-8w
 for linux-riscv@lists.infradead.org; Mon, 28 Dec 2020 11:59:57 +0000
Received: by mail-lf1-x134.google.com with SMTP id m12so23354080lfo.7
 for <linux-riscv@lists.infradead.org>; Mon, 28 Dec 2020 03:59:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CQXhRRDzjlbyFL6HuKDo1qcz0JWdNrGspVv13+VGFG8=;
 b=TLGqJjuprzMMitUd3G2MLt/hoY1pE/ifUzV5yAl16eEysA9YhxucEjaQHFNqGcelRb
 WIGJqosgxLCaMxJUfCqzaze/AT+U0dd8bzfilexccjnhf+/xUy8tkvTc9EYMSRepnhl6
 Io458XPzFLf/Yq84pXF6PhYIvJhPGwkY25oLe3LuuPvwXSNIMkUyDTZCQcAgAxADbVO7
 HE9prWnTd4TwEZTesxiL02Xw7kHbxwE219/+vkhoYzykYa3fOL44JYUWrg5oH1Yym/YT
 ui37Qv7/1OzQqdOAI/L8tA+Y74tVuFhDZ/akgA91cjJUsC2zvzGhKmWMfmS9Cj+M/A1Z
 1JnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CQXhRRDzjlbyFL6HuKDo1qcz0JWdNrGspVv13+VGFG8=;
 b=eC4uIBNkhQL7PDnJZCHg7nmFN/E0NwyzuSjmPTANZY9s6BgpHZLSpqLLsuN1PhY72G
 gALOTqUGnxEdW0igiOd7xuTmFyoE8LMgpxZKhFMSAXg7LXw8dE5hxcSxjgrzBMKMgDen
 SId2hpDeEnzeypbj+gLICAw08AZvrDTltkx3fQksR2S3K5Z/8NSBvG43J/6TaUxgHU/T
 lFFCsowpwXv/PqigZgkpViJiTx9Tdr1b18o70R6iWHMNAFXKG1Q6UuJn8RmgqPuN5s+h
 KeoZMJ+6EnvSL91s+8orBHPEdHOj3GvUnmBBXoHUh4Gu0c9e4JxRyiYoKuK3YymN5Dgr
 9HpQ==
X-Gm-Message-State: AOAM530W6am/AzmlAqnOwLpkPSsHX4ePKin+OeN57X8VypecBRhMQPlv
 zT7a7DnF6ugKKfEQ3Noyeq9q0b2vOpPDHFWTFrlmFA==
X-Google-Smtp-Source: ABdhPJx+bmRmvOvTWYfCwO3iZKYn8ngz/btucRMsO8fxpFJYcl0o+weX50AldeSzSaIizIB0Fh9I0MKgFChOg8OCVcw=
X-Received: by 2002:a2e:3312:: with SMTP id d18mr23130837ljc.284.1609156792508; 
 Mon, 28 Dec 2020 03:59:52 -0800 (PST)
MIME-Version: 1.0
References: <20201226163037.43691-1-vitaly.wool@konsulko.com>
In-Reply-To: <20201226163037.43691-1-vitaly.wool@konsulko.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 28 Dec 2020 17:29:41 +0530
Message-ID: <CAAhSdy1M5pMjYHNWdOicb3N3fjTfQLEgE8tFb74sqGbPE_9eyQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: add BUILTIN_DTB support for MMU-enabled targets
To: Vitaly Wool <vitaly.wool@konsulko.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201228_065956_512524_5E413F4E 
X-CRM114-Status: GOOD (  22.96  )
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

On Sat, Dec 26, 2020 at 10:03 PM Vitaly Wool <vitaly.wool@konsulko.com> wrote:
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
>  arch/riscv/Kconfig   |  1 -
>  arch/riscv/mm/init.c | 12 ++++++++++--
>  2 files changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 2b41f6d8e458..9464b4e3a71a 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -419,7 +419,6 @@ endmenu
>
>  config BUILTIN_DTB
>         def_bool n
> -       depends on RISCV_M_MODE
>         depends on OF
>
>  menu "Power management options"
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 87c305c566ac..5d1c7a3ec01c 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -194,12 +194,20 @@ void __init setup_bootmem(void)
>         setup_initrd();
>  #endif /* CONFIG_BLK_DEV_INITRD */
>
> +       /*
> +        * If DTB is built in, no need to reserve its memblock.
> +        * OTOH, initial_boot_params has to be set to properly copy DTB
> +        * before unflattening later on.
> +        */
> +       if (IS_ENABLED(CONFIG_BUILTIN_DTB))
> +               initial_boot_params = __va(dtb_early_pa);

Don't assign initial_boot_params directly here because the
early_init_dt_scan() will do it.

The setup_vm() is supposed to setup dtb_early_va and dtb_early_pa
for MMU-enabled case so please add a "#ifdef" over there for the
built-in DTB case.

> +       else
> +               memblock_reserve(dtb_early_pa, fdt_totalsize(dtb_early_va));
> +
>         /*
>          * Avoid using early_init_fdt_reserve_self() since __pa() does
>          * not work for DTB pointers that are fixmap addresses
>          */

This comment needs to be updated and moved along the memblock_reserve()
statement.

> -       memblock_reserve(dtb_early_pa, fdt_totalsize(dtb_early_va));
> -
>         early_init_fdt_scan_reserved_mem();
>         dma_contiguous_reserve(dma32_phys_limit);
>         memblock_allow_resize();
> --
> 2.29.2
>

This patch should be based upon Damiens builtin DTB patch.
Refer, https://www.spinics.net/lists/linux-gpio/msg56616.html

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
