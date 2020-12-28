Return-Path: <SRS0=F85b=GA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01A69C433DB
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Dec 2020 14:14:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9620B20715
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Dec 2020 14:14:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9620B20715
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gNViCl0tCaWvdBnOGwKZLq5IZqVblIChKDvWHi4bR2U=; b=GUWDQfKV+UkkCFmtaKqAHI1/t
	1Wj7bG1LuFa79u9s4dEuOEex7pMqkmieD09wZRnZ6P8/adJ6MyFzqA6CayxPZIqfibBniSacOsaZN
	RWLYI3OEs42CneR2k2rKZkreY6tLuSs291o2l1+WtXTbLsYzlSHzMimhXfU4BtCXDtnzzVXKi8+vn
	49iAB4SVLaadIilzKB5sGTUgUwQ525h69Uk/2BVTL9NgjJgkyAdmUg19qa6bbt8D7LN2vVXjFRuOo
	8spqFT2GEoDu1SqQU5dQIEyYPum994v63ggEQnVVDzlnn922klVTiLE/diZwXEFrEFml93D01fWXh
	Mv82eLNTg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kttHj-0006kB-UL; Mon, 28 Dec 2020 14:14:07 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kttHh-0006jJ-Lo
 for linux-riscv@lists.infradead.org; Mon, 28 Dec 2020 14:14:06 +0000
Received: by mail-lf1-x129.google.com with SMTP id o13so24183247lfr.3
 for <linux-riscv@lists.infradead.org>; Mon, 28 Dec 2020 06:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NPeSW+R1SSfRx+04CRlDhpX7N3sgocK07oaNDyUcAtQ=;
 b=ca8s8BXf1hhY+CYTlYaY7cbOnbBLNRpJziaNgNL0O1DmVav7uY5DZU2FrvBAul3FPK
 qASLpWCCyZr9LhbzyJyL0w2jNgqhiCu7DzFiLXvv+70lS6bxurLywKj+A2S933Y09OIR
 kntxzCfNY2NlsQpftT/btNwnwCnQWF9KIY9dbib2K5X3Ll0lHqxXETqnUCW/U+Fh93zo
 il/p3u/GOX8kaoIqzEqV+5OycVEntz0Vc7SOeV0vXzya03eFYka/8dnE1D7k/Zgk8ZR9
 g55hWD6PTSH11D9lCwPnoTp1QtW0Ks7lGV2ZF8eDa+m4YAOc/9tO9ABvEPrvio0PgqM5
 G+0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NPeSW+R1SSfRx+04CRlDhpX7N3sgocK07oaNDyUcAtQ=;
 b=R22o/yBstFe3c/emnjhcRw3IJVAM0DRmVxwauU6ATQhL3x5gS6hXueVbbf2NRxsAoI
 p6adc9qFXE6LmY2qxAyQ+JIO5Jq4wd8F+xHbanuTygUu1AGKWTF6slB8Z+CHupbqvhVW
 Mw2k1hl+qa9+RVu83Zl3f2AzG9jGeIbkEjgdDjUBSR6fZcVULIFMHHjCHSXeo//UzfqP
 O6opNJd23a6+pJS1yec+HB+aEFES9JotYTCnsRRvmRBJoj4i/GkZgxGV81ZdWVJqLWC+
 wCunX56eUoEvOUPZZzj5NSnxhpHHLco0jFVw0wGyCoVeIi+e7ppNYauEtwvVtKIEX6lI
 ny7g==
X-Gm-Message-State: AOAM531QGCiAM4PmVHS2bFtapP8RtNGh3LSk2hpVXp8xtXcy2rNjn1sL
 whFBmmsRnkfbuZf7BYyi8gVmdA/39wEHv+KxYjodNQ==
X-Google-Smtp-Source: ABdhPJxkOkUZ2+WFCA9kUXkWVgnWKZbc6ENUsxa3iUZhVqA8izUArbjN5NvmwueKDr2OZFrqx7CqbYQQPKiwAhSOzRs=
X-Received: by 2002:a05:651c:202:: with SMTP id
 y2mr21433617ljn.162.1609164843848; 
 Mon, 28 Dec 2020 06:14:03 -0800 (PST)
MIME-Version: 1.0
References: <20201226163037.43691-1-vitaly.wool@konsulko.com>
 <CAAhSdy1M5pMjYHNWdOicb3N3fjTfQLEgE8tFb74sqGbPE_9eyQ@mail.gmail.com>
 <CAM4kBBJ3Vbytx=dFK7+DMByV3zK=FVLATSwjyuuygkDK1MCQjA@mail.gmail.com>
In-Reply-To: <CAM4kBBJ3Vbytx=dFK7+DMByV3zK=FVLATSwjyuuygkDK1MCQjA@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 28 Dec 2020 19:43:52 +0530
Message-ID: <CAAhSdy2CssmEJVP=+eXsNqRXbQgTSn=+1d6w1UcFOJTA3Zbcug@mail.gmail.com>
Subject: Re: [PATCH] riscv: add BUILTIN_DTB support for MMU-enabled targets
To: Vitaly Wool <vitaly.wool@konsulko.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201228_091405_728014_7195A92D 
X-CRM114-Status: GOOD (  32.76  )
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

The throw-away early DTB mapping in early_pg_dir is anyway
redundant when we have built-in DTB so this patch needs to
add an "#ifdef" around it for the MMU-enabled case. Also, please
update dtb_early_va and dtb_early_pa separately for MMU-enabled
case in the setup_vm()

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
>
> Best regards,
>    Vitaly

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
