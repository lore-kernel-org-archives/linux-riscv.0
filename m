Return-Path: <SRS0=F85b=GA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A271C433DB
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Dec 2020 13:35:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14215207C9
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Dec 2020 13:35:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 14215207C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7K9Yptbo67hO2HoTLQ4ZrIaIlvUzaeRy+21qlpdrelg=; b=prQ2VsbZt1lt/dRozrrOEugw9
	g0whQOEaR4UNvJLK2bcjmTvoiKyZdfA6ggVZPQLOYEaqL7lpvPQfdTuyKaNmS3xt18XCvX4V/FTQq
	zIYoxzUlUkMPsnkXpSvUqmnb0BCeJwy7o2+GMtkdh9qHSyI2NXMxlyRfmo6Hff3gdzmrhlKg9NVzn
	k1IULYOTA0LMQiEr+yX+Nh1EZWlsuqs5J6QW7e4b5S2OA7Mvb9dgVKqe8ZtT2sILMO9OfcM86+QSf
	3psiUtUt3+zgjjXqydvMMYMEtJ3FZy8z/jDr9tFobaAl0vsLLJqnZjEu7VP/HUAVBPn6LzYy2A8i2
	QlenhcKHQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ktsgP-0001aG-5j; Mon, 28 Dec 2020 13:35:33 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ktsgM-0001ZY-54
 for linux-riscv@lists.infradead.org; Mon, 28 Dec 2020 13:35:31 +0000
Received: by mail-lf1-x134.google.com with SMTP id o19so23988005lfo.1
 for <linux-riscv@lists.infradead.org>; Mon, 28 Dec 2020 05:35:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lnlocphoctX4r6uKPUYm4iHsqJYYWrO7RnR7sqTcTMQ=;
 b=DdXN+SIqlIxijQhfqX1KanDmg13RIXZawO+UXnE2GnWP6WUQA7qLK01tybwDacK6iT
 h9liV046J29RuS5Zo7EOoAUQXF2kmtjRWi7TLj0vlg/kmog2D6lwCNkbM3zfTiw0/Gnt
 2A7ihf1wx1d8wlrQdJbC9WjqiuVOgoEiAoSPc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lnlocphoctX4r6uKPUYm4iHsqJYYWrO7RnR7sqTcTMQ=;
 b=oDmBp4XK//dOdAj60rdTCc0xf1gczE1yPi7xFgmuvGQVGBKSiNi+d4JkYLWJ3Whgbm
 BY5hrjlPLrP721x8vFGSoBV/+XvCxR9EN2vnfkX204krHMSb/QGdmOw/+kx4fnQtDWNC
 dUY3JEdyFgoNrhI1Z8fVOWNNlpAouYCMReLmDQT1tgxAcCcZ/hRuEbcJ74/Hr9g/2XLt
 u0c4Qy/ZkRj7Yc2seNvOcVD2DDg9SSY41hY3TrbTPGT/XhcGoHgIJFNxsYGUMKwexJiK
 YKTaus4iKJWU8wUCU1t+Oe+ULSJSZKSiF0no3+Rpatkve9n63kogAv4Q7dW07t08dhx0
 HxVg==
X-Gm-Message-State: AOAM533f+pd8GgdgSMSzfGVfSXKW8K1u025/HhBojORBTwIrr79K+X25
 oqQh5tPQvO9Z0MH4YyJn2kS5qs294xuY+5yxEp6YrQ==
X-Google-Smtp-Source: ABdhPJyiqupZuDE0Vxp4Jp2VXGNRbz8ArOYKPHzS+2ZWvcmC136bVxjhF83SmGCPsFzZ1cANTCZzpN6YjAEuwCAW2d0=
X-Received: by 2002:a05:6512:2009:: with SMTP id
 a9mr18356183lfb.575.1609162526880; 
 Mon, 28 Dec 2020 05:35:26 -0800 (PST)
MIME-Version: 1.0
References: <20201226163037.43691-1-vitaly.wool@konsulko.com>
 <CAAhSdy1M5pMjYHNWdOicb3N3fjTfQLEgE8tFb74sqGbPE_9eyQ@mail.gmail.com>
In-Reply-To: <CAAhSdy1M5pMjYHNWdOicb3N3fjTfQLEgE8tFb74sqGbPE_9eyQ@mail.gmail.com>
From: Vitaly Wool <vitaly.wool@konsulko.com>
Date: Mon, 28 Dec 2020 14:35:16 +0100
Message-ID: <CAM4kBBJ3Vbytx=dFK7+DMByV3zK=FVLATSwjyuuygkDK1MCQjA@mail.gmail.com>
Subject: Re: [PATCH] riscv: add BUILTIN_DTB support for MMU-enabled targets
To: Anup Patel <anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201228_083530_314630_CD17A619 
X-CRM114-Status: GOOD (  28.01  )
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

On Mon, Dec 28, 2020 at 12:59 PM Anup Patel <anup@brainfault.org> wrote:
>
> On Sat, Dec 26, 2020 at 10:03 PM Vitaly Wool <vitaly.wool@konsulko.com> wrote:
> >
> > Sometimes, especially in a production system we may not want to
> > use a "smart bootloader" like u-boot to load kernel, ramdisk and
> > device tree from a filesystem on eMMC, but rather load the kernel
> > from a NAND partition and just run it as soon as we can, and in
> > this case it is convenient to have device tree compiled into the
> > kernel binary. Since this case is not limited to MMU-less systems,
> > let's support it for these which have MMU enabled too.
> >
> > Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.com>
> > ---
> >  arch/riscv/Kconfig   |  1 -
> >  arch/riscv/mm/init.c | 12 ++++++++++--
> >  2 files changed, 10 insertions(+), 3 deletions(-)
> >
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index 2b41f6d8e458..9464b4e3a71a 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -419,7 +419,6 @@ endmenu
> >
> >  config BUILTIN_DTB
> >         def_bool n
> > -       depends on RISCV_M_MODE
> >         depends on OF
> >
> >  menu "Power management options"
> > diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> > index 87c305c566ac..5d1c7a3ec01c 100644
> > --- a/arch/riscv/mm/init.c
> > +++ b/arch/riscv/mm/init.c
> > @@ -194,12 +194,20 @@ void __init setup_bootmem(void)
> >         setup_initrd();
> >  #endif /* CONFIG_BLK_DEV_INITRD */
> >
> > +       /*
> > +        * If DTB is built in, no need to reserve its memblock.
> > +        * OTOH, initial_boot_params has to be set to properly copy DTB
> > +        * before unflattening later on.
> > +        */
> > +       if (IS_ENABLED(CONFIG_BUILTIN_DTB))
> > +               initial_boot_params = __va(dtb_early_pa);
>
> Don't assign initial_boot_params directly here because the
> early_init_dt_scan() will do it.

early_init_dt_scan will set initial_boot_params to dtb_early_va from
the early mapping which will be gone by the time
unflatten_and_copy_device_tree() is called.

> The setup_vm() is supposed to setup dtb_early_va and dtb_early_pa
> for MMU-enabled case so please add a "#ifdef" over there for the
> built-in DTB case.
>
> > +       else
> > +               memblock_reserve(dtb_early_pa, fdt_totalsize(dtb_early_va));
> > +
> >         /*
> >          * Avoid using early_init_fdt_reserve_self() since __pa() does
> >          * not work for DTB pointers that are fixmap addresses
> >          */
>
> This comment needs to be updated and moved along the memblock_reserve()
> statement.
>
> > -       memblock_reserve(dtb_early_pa, fdt_totalsize(dtb_early_va));
> > -
> >         early_init_fdt_scan_reserved_mem();
> >         dma_contiguous_reserve(dma32_phys_limit);
> >         memblock_allow_resize();
> > --
> > 2.29.2
> >
>
> This patch should be based upon Damiens builtin DTB patch.
> Refer, https://www.spinics.net/lists/linux-gpio/msg56616.html

Thanks for the pointer, however I don't think our patches have
intersections. Besides, Damien is dealing with the MMU-less case
there.

Best regards,
   Vitaly

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
