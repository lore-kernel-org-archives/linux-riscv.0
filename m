Return-Path: <SRS0=F85b=GA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72C94C433DB
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Dec 2020 16:39:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29ABF223E8
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Dec 2020 16:39:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 29ABF223E8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eGg0AXUsQbMHRju6z+CV4AsR+e0Sa7ahixqbqClOGCs=; b=lmdbfrF7xWnx6EEhSMAUhwCZl
	NTGmIO/aUfsMUWrm94CoAD3gSZBqBy3SmlRuXYqiYyVdCfOKeLUFh2lnT+ba73Cl6blegUd6HqK0Y
	Igl8SnJMQE4ZEgfGbgmbjTFY9VKoAZUWAce5wTBXNsEsbs96uzK7NykXkV0lJGofgDPAIx1gIHrag
	mUo7IpwV+hSti3rsSr1kue/6P4GlDIpSHMgzTBIV9iQBisO9kBGJJJEH4LsKxzKJHW3E7EeRK87Ea
	KybhU3/tDMyeo6ucQFZcCNzfJgqnukIB079hp6xRRmJjMHrMjj3E2FWOMGHBjfU2iSZLBy1CjdEpi
	2bT6iq+FA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ktvXr-0007Rk-79; Mon, 28 Dec 2020 16:38:55 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ktvXo-0007Qo-58
 for linux-riscv@lists.infradead.org; Mon, 28 Dec 2020 16:38:53 +0000
Received: by mail-lf1-x132.google.com with SMTP id y19so24960550lfa.13
 for <linux-riscv@lists.infradead.org>; Mon, 28 Dec 2020 08:38:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l6SS1scNjE1vPCP4wCk2BIZ3zGkp8hqDahwS2HOGBHc=;
 b=cI8VJXC1C/bDkRCEq7hbWM0zAjKz9rkUJwyt//MfgJsGxs31rPM8LDXwxR7+KO7bZT
 Sxb4blwNTPzKpjcqaNAiCVXhq2o0SvFVBjbCCU2lVaeH0O4FWkBotHzFUWtDYXUcuwZe
 tm6SULa0zv72CxkoEwKgqwMYW3JZAKNRWBBIY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l6SS1scNjE1vPCP4wCk2BIZ3zGkp8hqDahwS2HOGBHc=;
 b=lZQSyvsFheVTuBxKV8mWMNyASA94mUHvp9+8ZJGHC/ICxWrOIz3I+/Hes+My5S46K3
 oGFqv5WFUYaYncc3sVZfNITXd80tjkwUJMQcSHef6I7vcB9516Fki2IQ8r3uhaiXgaz0
 r+QXYePaYpu5Z1E0ZEVhIQYlzTDzhdn5QxlsG+mkO7xt6BS65SyOXVkhkDDju+5v/xjk
 EKFQPchLkPPlsL0CZ8kG7RB4EM6kWgtnhXzDSESjTk7MbTNFUGSkxkZx0wg5ShD2k1uE
 +aOqlgyC9Q3wzpIJ8S0fwTSrcGY1zGOojkSTOETjQgZWbzvQmvNh0wPZ0ov1Pu7hZj8r
 keuA==
X-Gm-Message-State: AOAM531IbUmLTeTv4uZvHE9cztDciOgAiaHOLo+vj7ncquIvixHdeJd8
 yeUUWGuP4GsxQgoKFxhZTdYixBPXbJEcIdXGsWgVlw==
X-Google-Smtp-Source: ABdhPJwz0Fxx9LLj2z88LTe0UC1LHs48miC1FDDtUcODfBZNxv/T65x8UtIsLR6HBrIViAxHgL0KvEm8Cu74BBDBfvw=
X-Received: by 2002:ac2:5edb:: with SMTP id d27mr18240410lfq.411.1609173529728; 
 Mon, 28 Dec 2020 08:38:49 -0800 (PST)
MIME-Version: 1.0
References: <20201226163037.43691-1-vitaly.wool@konsulko.com>
 <CAAhSdy1M5pMjYHNWdOicb3N3fjTfQLEgE8tFb74sqGbPE_9eyQ@mail.gmail.com>
 <CAM4kBBJ3Vbytx=dFK7+DMByV3zK=FVLATSwjyuuygkDK1MCQjA@mail.gmail.com>
 <CAAhSdy0E8xspb3epBdrTmjg7vSQanG9zwyMY19eeDDL8z=WJFg@mail.gmail.com>
In-Reply-To: <CAAhSdy0E8xspb3epBdrTmjg7vSQanG9zwyMY19eeDDL8z=WJFg@mail.gmail.com>
From: Vitaly Wool <vitaly.wool@konsulko.com>
Date: Mon, 28 Dec 2020 17:38:38 +0100
Message-ID: <CAM4kBBJLnrp8XB1OZnv2FEuKdEQuQfDWdgwsV--9mZYB=JmJPQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: add BUILTIN_DTB support for MMU-enabled targets
To: Anup Patel <anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201228_113852_322175_1C2C9796 
X-CRM114-Status: GOOD (  36.73  )
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

On Mon, Dec 28, 2020 at 3:10 PM Anup Patel <anup@brainfault.org> wrote:
>
> On Mon, Dec 28, 2020 at 7:05 PM Vitaly Wool <vitaly.wool@konsulko.com> wrote:
> >
> > On Mon, Dec 28, 2020 at 12:59 PM Anup Patel <anup@brainfault.org> wrote:
> > >
> > > On Sat, Dec 26, 2020 at 10:03 PM Vitaly Wool <vitaly.wool@konsulko.com> wrote:
> > > >
> > > > Sometimes, especially in a production system we may not want to
> > > > use a "smart bootloader" like u-boot to load kernel, ramdisk and
> > > > device tree from a filesystem on eMMC, but rather load the kernel
> > > > from a NAND partition and just run it as soon as we can, and in
> > > > this case it is convenient to have device tree compiled into the
> > > > kernel binary. Since this case is not limited to MMU-less systems,
> > > > let's support it for these which have MMU enabled too.
> > > >
> > > > Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.com>
> > > > ---
> > > >  arch/riscv/Kconfig   |  1 -
> > > >  arch/riscv/mm/init.c | 12 ++++++++++--
> > > >  2 files changed, 10 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > > > index 2b41f6d8e458..9464b4e3a71a 100644
> > > > --- a/arch/riscv/Kconfig
> > > > +++ b/arch/riscv/Kconfig
> > > > @@ -419,7 +419,6 @@ endmenu
> > > >
> > > >  config BUILTIN_DTB
> > > >         def_bool n
> > > > -       depends on RISCV_M_MODE
> > > >         depends on OF
> > > >
> > > >  menu "Power management options"
> > > > diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> > > > index 87c305c566ac..5d1c7a3ec01c 100644
> > > > --- a/arch/riscv/mm/init.c
> > > > +++ b/arch/riscv/mm/init.c
> > > > @@ -194,12 +194,20 @@ void __init setup_bootmem(void)
> > > >         setup_initrd();
> > > >  #endif /* CONFIG_BLK_DEV_INITRD */
> > > >
> > > > +       /*
> > > > +        * If DTB is built in, no need to reserve its memblock.
> > > > +        * OTOH, initial_boot_params has to be set to properly copy DTB
> > > > +        * before unflattening later on.
> > > > +        */
> > > > +       if (IS_ENABLED(CONFIG_BUILTIN_DTB))
> > > > +               initial_boot_params = __va(dtb_early_pa);
> > >
> > > Don't assign initial_boot_params directly here because the
> > > early_init_dt_scan() will do it.
> >
> > early_init_dt_scan will set initial_boot_params to dtb_early_va from
> > the early mapping which will be gone by the time
> > unflatten_and_copy_device_tree() is called.
>
> That's why we are doing early_init_dt_verify() again for the MMU-enabled
> case which already takes care of your concern.

I might be out in the woods here but... Do you mean the call to
early_init_dt_verify() in setup_arch() which is compiled out
completely in the CONFIG_BUILTIN_DTB case?
Or is there any other call that I'm overlooking?

Best regards,
   Vitaly

> We use early_init_dt_verify() like most architectures to set the initial DTB.
>
> >
> > > The setup_vm() is supposed to setup dtb_early_va and dtb_early_pa
> > > for MMU-enabled case so please add a "#ifdef" over there for the
> > > built-in DTB case.
> > >
> > > > +       else
> > > > +               memblock_reserve(dtb_early_pa, fdt_totalsize(dtb_early_va));
> > > > +
> > > >         /*
> > > >          * Avoid using early_init_fdt_reserve_self() since __pa() does
> > > >          * not work for DTB pointers that are fixmap addresses
> > > >          */
> > >
> > > This comment needs to be updated and moved along the memblock_reserve()
> > > statement.
> > >
> > > > -       memblock_reserve(dtb_early_pa, fdt_totalsize(dtb_early_va));
> > > > -
> > > >         early_init_fdt_scan_reserved_mem();
> > > >         dma_contiguous_reserve(dma32_phys_limit);
> > > >         memblock_allow_resize();
> > > > --
> > > > 2.29.2
> > > >
> > >
> > > This patch should be based upon Damiens builtin DTB patch.
> > > Refer, https://www.spinics.net/lists/linux-gpio/msg56616.html
> >
> > Thanks for the pointer, however I don't think our patches have
> > intersections. Besides, Damien is dealing with the MMU-less case
> > there.
>
> Damien's patch is also trying to move to use generic BUILTIN_DTB
> support for the MMU-less case so it is similar work hence the chance
> of patch conflict.
>
> Regards,
> Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
