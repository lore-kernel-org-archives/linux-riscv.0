Return-Path: <SRS0=F85b=GA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1067C433E0
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Dec 2020 14:10:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FC4D207CC
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Dec 2020 14:10:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9FC4D207CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2h36JKDQJ0COcjPJCQx241npsaZLAXGmOPD1WZhyg6c=; b=P3vlHHa9N/blcv5LDdfIic+oh
	3A5iHYTiR9bKqv4lezROoHLTfC7OVZ67QmVlyISz6SoB8/IyfnOFyxiAv9cr3mftU3vmX67yu9Q51
	P9GoN/SZbzWvtIMNgflRvT/dbIW3DCE/HZ2i1Q5nEMxjP9Awj0gkz5ZSLFu2MdRCbE181DLRYVNkI
	oyG0wKEfggTvue1UheOcxzGJVu01pjAqzNYxjaZuMA2VYDuEvyjsZTPjSJ4Io8Ai3MPG4gEnuOqGn
	ULvp2oaNrbkOvR3W+YHOXBTX4S5/aHuPAIG8O7fe0J+vUSgSBW5JuZMhr9tDtNLHMh8Lwa1LNN4rk
	sdmLF4VjA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kttE6-00065w-Qt; Mon, 28 Dec 2020 14:10:22 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kttE3-00065K-T6
 for linux-riscv@lists.infradead.org; Mon, 28 Dec 2020 14:10:20 +0000
Received: by mail-lf1-x12d.google.com with SMTP id a12so24134760lfl.6
 for <linux-riscv@lists.infradead.org>; Mon, 28 Dec 2020 06:10:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eDrae5NlX7atsBnbOFDs+BsHNDAqH6cr7KQ2BZiRu9g=;
 b=dqHY0sUVNmDOTf+aHtGeQqT+ubwl8V7kw7gIzNrTS/0Zd7s285xIvbrMgrA93eRMAB
 /1GHwOroZP8yTdaDh+c/YPuYv6yF+l/23WK0pNPHosyN8/V+rJBncoRkWCiIxhDSuIOE
 sZq2Rs5xOn4W34uvmQXhL/gWHkBMVsxzvVHwV/phaWnNqkCZpJ/HXcjktxusJCdKGsky
 MtDEp8TBZdd1BbHpyknD+6LjUm9fdAaczpGPMbYX9r7PtCaL2c/KQxSld+s+AaIA6TbK
 JuzxMFf5+a71DwaQ2MWRs6FU8ho1Af0S6leDecn3FSRMB+NMuO5RuzBRmU1/mndvj2W0
 vjAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eDrae5NlX7atsBnbOFDs+BsHNDAqH6cr7KQ2BZiRu9g=;
 b=m6Py1SfkOj2qwepORpaGdOhlSJ9yB7MfDhM71AXf+wAdAnMZ7GqtJWBKLQc58WMDqJ
 91QVDzpfrTxcE9+8YqC3F5CkB5VNgLGbNQnwMa0wlVEo2KNhdcdjyJHYoLqSn1fbYJPh
 RIh/iV3CgkpCFDl8P5tLXwlAG+Sz+Zad9NIJg+khYImYOACMDEg26yiu9P0rIkfI+LlP
 3RXJKOcRpN20+eoKJSO01ABpt0xr6alg93mBFcAXKTmIb5HTySwaWvmviMRlB0f/i4PY
 nzwgy61VkEDt+qgYTYTiLoz9qWpnW32KuOgw0e5huN0YAGg9nQFTtPK87iyWecz0ZCfN
 8YzQ==
X-Gm-Message-State: AOAM532Mj1tcxOOr59ucgJhal8TjOOMYnZf+44EwM2q72rugRn16xlai
 Cjk2psmIDffZcUM+CaAlnodetaKLkNm5ZSKrkwTkvA==
X-Google-Smtp-Source: ABdhPJxse0shOvUnwJroAasQ1isNMTLZzoRqEfI03iytFRHnoPYRsIhHIflw56KmNtLdTnzsGf7RkAiaClFzBR41C6M=
X-Received: by 2002:a05:651c:202:: with SMTP id
 y2mr21426940ljn.162.1609164617377; 
 Mon, 28 Dec 2020 06:10:17 -0800 (PST)
MIME-Version: 1.0
References: <20201226163037.43691-1-vitaly.wool@konsulko.com>
 <CAAhSdy1M5pMjYHNWdOicb3N3fjTfQLEgE8tFb74sqGbPE_9eyQ@mail.gmail.com>
 <CAM4kBBJ3Vbytx=dFK7+DMByV3zK=FVLATSwjyuuygkDK1MCQjA@mail.gmail.com>
In-Reply-To: <CAM4kBBJ3Vbytx=dFK7+DMByV3zK=FVLATSwjyuuygkDK1MCQjA@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 28 Dec 2020 19:40:05 +0530
Message-ID: <CAAhSdy0E8xspb3epBdrTmjg7vSQanG9zwyMY19eeDDL8z=WJFg@mail.gmail.com>
Subject: Re: [PATCH] riscv: add BUILTIN_DTB support for MMU-enabled targets
To: Vitaly Wool <vitaly.wool@konsulko.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201228_091020_086452_3D91468C 
X-CRM114-Status: GOOD (  32.13  )
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

On Mon, Dec 28, 2020 at 7:05 PM Vitaly Wool <vitaly.wool@konsulko.com> wrote:
>
> On Mon, Dec 28, 2020 at 12:59 PM Anup Patel <anup@brainfault.org> wrote:
> >
> > On Sat, Dec 26, 2020 at 10:03 PM Vitaly Wool <vitaly.wool@konsulko.com> wrote:
> > >
> > > Sometimes, especially in a production system we may not want to
> > > use a "smart bootloader" like u-boot to load kernel, ramdisk and
> > > device tree from a filesystem on eMMC, but rather load the kernel
> > > from a NAND partition and just run it as soon as we can, and in
> > > this case it is convenient to have device tree compiled into the
> > > kernel binary. Since this case is not limited to MMU-less systems,
> > > let's support it for these which have MMU enabled too.
> > >
> > > Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.com>
> > > ---
> > >  arch/riscv/Kconfig   |  1 -
> > >  arch/riscv/mm/init.c | 12 ++++++++++--
> > >  2 files changed, 10 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > > index 2b41f6d8e458..9464b4e3a71a 100644
> > > --- a/arch/riscv/Kconfig
> > > +++ b/arch/riscv/Kconfig
> > > @@ -419,7 +419,6 @@ endmenu
> > >
> > >  config BUILTIN_DTB
> > >         def_bool n
> > > -       depends on RISCV_M_MODE
> > >         depends on OF
> > >
> > >  menu "Power management options"
> > > diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> > > index 87c305c566ac..5d1c7a3ec01c 100644
> > > --- a/arch/riscv/mm/init.c
> > > +++ b/arch/riscv/mm/init.c
> > > @@ -194,12 +194,20 @@ void __init setup_bootmem(void)
> > >         setup_initrd();
> > >  #endif /* CONFIG_BLK_DEV_INITRD */
> > >
> > > +       /*
> > > +        * If DTB is built in, no need to reserve its memblock.
> > > +        * OTOH, initial_boot_params has to be set to properly copy DTB
> > > +        * before unflattening later on.
> > > +        */
> > > +       if (IS_ENABLED(CONFIG_BUILTIN_DTB))
> > > +               initial_boot_params = __va(dtb_early_pa);
> >
> > Don't assign initial_boot_params directly here because the
> > early_init_dt_scan() will do it.
>
> early_init_dt_scan will set initial_boot_params to dtb_early_va from
> the early mapping which will be gone by the time
> unflatten_and_copy_device_tree() is called.

That's why we are doing early_init_dt_verify() again for the MMU-enabled
case which already takes care of your concern.

We use early_init_dt_verify() like most architectures to set the initial DTB.

>
> > The setup_vm() is supposed to setup dtb_early_va and dtb_early_pa
> > for MMU-enabled case so please add a "#ifdef" over there for the
> > built-in DTB case.
> >
> > > +       else
> > > +               memblock_reserve(dtb_early_pa, fdt_totalsize(dtb_early_va));
> > > +
> > >         /*
> > >          * Avoid using early_init_fdt_reserve_self() since __pa() does
> > >          * not work for DTB pointers that are fixmap addresses
> > >          */
> >
> > This comment needs to be updated and moved along the memblock_reserve()
> > statement.
> >
> > > -       memblock_reserve(dtb_early_pa, fdt_totalsize(dtb_early_va));
> > > -
> > >         early_init_fdt_scan_reserved_mem();
> > >         dma_contiguous_reserve(dma32_phys_limit);
> > >         memblock_allow_resize();
> > > --
> > > 2.29.2
> > >
> >
> > This patch should be based upon Damiens builtin DTB patch.
> > Refer, https://www.spinics.net/lists/linux-gpio/msg56616.html
>
> Thanks for the pointer, however I don't think our patches have
> intersections. Besides, Damien is dealing with the MMU-less case
> there.

Damien's patch is also trying to move to use generic BUILTIN_DTB
support for the MMU-less case so it is similar work hence the chance
of patch conflict.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
