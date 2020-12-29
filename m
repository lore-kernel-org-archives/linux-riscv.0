Return-Path: <SRS0=DsFQ=GB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 273A5C433DB
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Dec 2020 05:05:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25A68207C8
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Dec 2020 05:05:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 25A68207C8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RgJp6YK6/jsKenNptdBIR+3aAcyFSXz02FKZ69MxGj0=; b=eyBtjQ8D4XeDQYwt9bmG2/n/C
	UQ+C9htfW/ZHIeDUBIfI4pAbDLTaGHftZQQ63HaM0owMJ7acvyDx3Y/C+6u9JxsqZhmAibuulGBqO
	rho5/BENSOICJtOrv4XKhdYX/Dy7QhgiAX3vWFMWOrQdZ9V2VCHOZM9rlbVEMJ034haaLa7cXf0FD
	cn7aXveZNzGT4F412MZwLEi7Cz/r0Q7OsS3VZNoe5A7zycm5qgUCveYOsVI66fWXiMi38S8JWKy87
	XRpdxhCl6ftumkFkya5dpVjtrgTw4TMSKH1Uws0S2M2ZiUI7Zvi2+3NTXnGbFxv6rTlvAF3zQbMk2
	06W5tC55w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ku7CT-0003Ke-TN; Tue, 29 Dec 2020 05:05:37 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ku7CQ-0003JU-Ay
 for linux-riscv@lists.infradead.org; Tue, 29 Dec 2020 05:05:36 +0000
Received: by mail-wr1-x42c.google.com with SMTP id w5so13316731wrm.11
 for <linux-riscv@lists.infradead.org>; Mon, 28 Dec 2020 21:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MtTLYi9/z5bmG8OV/D75QNEkytkigcLic7eAluHSrCY=;
 b=t9u1IrL/S3W78GpLyJzQ8Qzl8cWPmCvKbbo7w/axT4HDhgZ+gDilMN1q1jFaIyhZdC
 OU8hAO2aNrqmYhfagLWR/bEirursfUlBkFnVpi7xAZvc6kzVshYo4/Ihpsx97UYN0+LH
 WTdMhYY4wewmrzM5dS6FE5R6fc7T+rM97v+X6llxUkakepof8dZE/AeWUJDMVJfg38ZQ
 suN9aVmt+rUx8mJQFHDuZDA5UVXHIrjyvw63R9CxXMUb47Z1Ir5FLEN9uM3j5swJohRx
 4mKBSXFf4fPfE/TBFvyCg7aGlYfMEr46AHQ3PuXVlrRIoXeG7oI9uj3VPuEfrvfbuyUP
 q4wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MtTLYi9/z5bmG8OV/D75QNEkytkigcLic7eAluHSrCY=;
 b=NjzTBV0Inw0U0Aa5Jd+grca/Xb0ub0aGYoq98igdinrx6Ezr/OnP/GHKgzp2RReNbc
 6pjmpHoqQPzODOwkvtiD9WGEX5A14ZT2JgRd1fBJsDwPlRFEJ+uCAsWW4e+ZU5dA8LxW
 8TYyB6ReV4RLKW/3wj6JrXwgq9UDBl/N10OC2c9Fb/gYG+A7d1BjyivtNVHrG/LYqQCU
 lfZdF+LpsXwHwYb8FyuEuX0pPrNn5kOe6lj6Z3eM6QCW3lXNLCYOPAcvyVLY70b3NSRV
 16dKRJWAXFpWXH/Cwx06iT0OIZlZ1ZTy7LcaJgIV83YlyWMwJqQHoHcLX6UmcSy5SDql
 5fSA==
X-Gm-Message-State: AOAM5301Z8wlS556l8NIK+hAxcijBsXyLa6ibyVUSS5dUIlpFf01RSmJ
 zKkqnYETzaFbgMGZtXoJ9mUM72/iY467EjEnL4bNWmEOqzxQ1mtB
X-Google-Smtp-Source: ABdhPJxLHZXfHgfk1GwltK7Tl1Tbo73bR6sjspJj13PwgW8mG6N0YLIxy1J5tc0rFLw9Lzv9PfemqI3Ugs9gQkLIxcM=
X-Received: by 2002:adf:e44d:: with SMTP id t13mr53677244wrm.144.1609218332256; 
 Mon, 28 Dec 2020 21:05:32 -0800 (PST)
MIME-Version: 1.0
References: <20201226163037.43691-1-vitaly.wool@konsulko.com>
 <CAAhSdy1M5pMjYHNWdOicb3N3fjTfQLEgE8tFb74sqGbPE_9eyQ@mail.gmail.com>
 <CAM4kBBJ3Vbytx=dFK7+DMByV3zK=FVLATSwjyuuygkDK1MCQjA@mail.gmail.com>
 <CAAhSdy0E8xspb3epBdrTmjg7vSQanG9zwyMY19eeDDL8z=WJFg@mail.gmail.com>
 <CAM4kBBJLnrp8XB1OZnv2FEuKdEQuQfDWdgwsV--9mZYB=JmJPQ@mail.gmail.com>
In-Reply-To: <CAM4kBBJLnrp8XB1OZnv2FEuKdEQuQfDWdgwsV--9mZYB=JmJPQ@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 29 Dec 2020 10:35:20 +0530
Message-ID: <CAAhSdy1VMujreaaWCDjO9BPa0P2As7c0Hh3riZsY3ncU3NnsGg@mail.gmail.com>
Subject: Re: [PATCH] riscv: add BUILTIN_DTB support for MMU-enabled targets
To: Vitaly Wool <vitaly.wool@konsulko.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201229_000534_546346_F9B14570 
X-CRM114-Status: GOOD (  40.82  )
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

On Mon, Dec 28, 2020 at 10:08 PM Vitaly Wool <vitaly.wool@konsulko.com> wrote:
>
> On Mon, Dec 28, 2020 at 3:10 PM Anup Patel <anup@brainfault.org> wrote:
> >
> > On Mon, Dec 28, 2020 at 7:05 PM Vitaly Wool <vitaly.wool@konsulko.com> wrote:
> > >
> > > On Mon, Dec 28, 2020 at 12:59 PM Anup Patel <anup@brainfault.org> wrote:
> > > >
> > > > On Sat, Dec 26, 2020 at 10:03 PM Vitaly Wool <vitaly.wool@konsulko.com> wrote:
> > > > >
> > > > > Sometimes, especially in a production system we may not want to
> > > > > use a "smart bootloader" like u-boot to load kernel, ramdisk and
> > > > > device tree from a filesystem on eMMC, but rather load the kernel
> > > > > from a NAND partition and just run it as soon as we can, and in
> > > > > this case it is convenient to have device tree compiled into the
> > > > > kernel binary. Since this case is not limited to MMU-less systems,
> > > > > let's support it for these which have MMU enabled too.
> > > > >
> > > > > Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.com>
> > > > > ---
> > > > >  arch/riscv/Kconfig   |  1 -
> > > > >  arch/riscv/mm/init.c | 12 ++++++++++--
> > > > >  2 files changed, 10 insertions(+), 3 deletions(-)
> > > > >
> > > > > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > > > > index 2b41f6d8e458..9464b4e3a71a 100644
> > > > > --- a/arch/riscv/Kconfig
> > > > > +++ b/arch/riscv/Kconfig
> > > > > @@ -419,7 +419,6 @@ endmenu
> > > > >
> > > > >  config BUILTIN_DTB
> > > > >         def_bool n
> > > > > -       depends on RISCV_M_MODE
> > > > >         depends on OF
> > > > >
> > > > >  menu "Power management options"
> > > > > diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> > > > > index 87c305c566ac..5d1c7a3ec01c 100644
> > > > > --- a/arch/riscv/mm/init.c
> > > > > +++ b/arch/riscv/mm/init.c
> > > > > @@ -194,12 +194,20 @@ void __init setup_bootmem(void)
> > > > >         setup_initrd();
> > > > >  #endif /* CONFIG_BLK_DEV_INITRD */
> > > > >
> > > > > +       /*
> > > > > +        * If DTB is built in, no need to reserve its memblock.
> > > > > +        * OTOH, initial_boot_params has to be set to properly copy DTB
> > > > > +        * before unflattening later on.
> > > > > +        */
> > > > > +       if (IS_ENABLED(CONFIG_BUILTIN_DTB))
> > > > > +               initial_boot_params = __va(dtb_early_pa);
> > > >
> > > > Don't assign initial_boot_params directly here because the
> > > > early_init_dt_scan() will do it.
> > >
> > > early_init_dt_scan will set initial_boot_params to dtb_early_va from
> > > the early mapping which will be gone by the time
> > > unflatten_and_copy_device_tree() is called.
> >
> > That's why we are doing early_init_dt_verify() again for the MMU-enabled
> > case which already takes care of your concern.
>
> I might be out in the woods here but... Do you mean the call to
> early_init_dt_verify() in setup_arch() which is compiled out
> completely in the CONFIG_BUILTIN_DTB case?
> Or is there any other call that I'm overlooking?

Sorry for the confusion, what I meant was that we are calling
early_init_dt_verify() from setup_arch() for the MMU-enabled
with built-in DTB disabled case to update "initial_boot_params"
after the boot CPU has switched from early_pg_dir to swapper_pg_dir.

For MMU-enabled with built-in DTB case, if setup_vm() sets the
dtb_early_va and dtb_early_pa correctly then early_init_dt_scan()
called from setup_arch() will automatically set correct value for
"initial_boot_params".

It is strange that early_init_dt_verify() is being compiled-out for you
because the early_init_dt_scan() called from setup_arch() also uses
early_init_dt_verify(). I quickly compiled the NoMMU kernel for K210
which also uses built-in DTB and I see that early_init_dt_verify()
is not being compiled-out when built-in DTB is enabled.

Regards,
Anup

>
> Best regards,
>    Vitaly
>
> > We use early_init_dt_verify() like most architectures to set the initial DTB.
> >
> > >
> > > > The setup_vm() is supposed to setup dtb_early_va and dtb_early_pa
> > > > for MMU-enabled case so please add a "#ifdef" over there for the
> > > > built-in DTB case.
> > > >
> > > > > +       else
> > > > > +               memblock_reserve(dtb_early_pa, fdt_totalsize(dtb_early_va));
> > > > > +
> > > > >         /*
> > > > >          * Avoid using early_init_fdt_reserve_self() since __pa() does
> > > > >          * not work for DTB pointers that are fixmap addresses
> > > > >          */
> > > >
> > > > This comment needs to be updated and moved along the memblock_reserve()
> > > > statement.
> > > >
> > > > > -       memblock_reserve(dtb_early_pa, fdt_totalsize(dtb_early_va));
> > > > > -
> > > > >         early_init_fdt_scan_reserved_mem();
> > > > >         dma_contiguous_reserve(dma32_phys_limit);
> > > > >         memblock_allow_resize();
> > > > > --
> > > > > 2.29.2
> > > > >
> > > >
> > > > This patch should be based upon Damiens builtin DTB patch.
> > > > Refer, https://www.spinics.net/lists/linux-gpio/msg56616.html
> > >
> > > Thanks for the pointer, however I don't think our patches have
> > > intersections. Besides, Damien is dealing with the MMU-less case
> > > there.
> >
> > Damien's patch is also trying to move to use generic BUILTIN_DTB
> > support for the MMU-less case so it is similar work hence the chance
> > of patch conflict.
> >
> > Regards,
> > Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
