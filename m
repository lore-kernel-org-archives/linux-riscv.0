Return-Path: <SRS0=G9o9=GE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A17BBC433E0
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Jan 2021 15:28:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBD6F20791
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Jan 2021 15:28:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EBD6F20791
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zL+EuYudu7EodXkVPmJohYTeDCtPVQzjW+Gy1/brUug=; b=u5JZpl6rW/PKd5zHpnon/80FF
	YERaQfP4EcE7H9zuJme5ervvB8dOCErT6T1iRY+HYigiasV8vZWmcIG5HNCFP3rr5YHXC4od/+pP5
	mqXDhqk3Lg+FyOhplPnaEVXSgJPNwtaTHdq/mATxIQdRmA7aDRfCiyUAZg2FdiGBeppgl6nSQErsP
	JDVflD6tn7gSwTd3H48mMK1RuaVRsKZrwvfot+Wm9O2KpAWFb4vyXfCgZ49Pn2DRflI93/ohKSirT
	ftKb1ZGFHtK/xUZ62bvJSwnSv3bkM5jAPL56UnhJaV6ebRZoF9ERR00ZQifgBTNBhdeYfrtLw/8Ug
	xJc/MI3Ig==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kvMLE-0004sc-D9; Fri, 01 Jan 2021 15:27:48 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kvMLB-0004sD-V8
 for linux-riscv@lists.infradead.org; Fri, 01 Jan 2021 15:27:47 +0000
Received: by mail-lf1-x129.google.com with SMTP id m25so49369638lfc.11
 for <linux-riscv@lists.infradead.org>; Fri, 01 Jan 2021 07:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nFODUIma3EDbIRqIpTnQ57GoUf+uy/YA2BkZQQikmd0=;
 b=nUC88GxRfSaOwyj/uFtLr9vSQ+zRNFbqMLVdy7KOoz5Pe5sXWFbc53vpKDbxPsmAaf
 ZijHDHKIi65hxKHZcQ3vqwiGz0Oz52d79k5gQRqG5aKWKERiRk9MCx4ftBEAnIAnKy/M
 rX3aESJbTVjzbVlK2OURpXr5JI5ILqZPpCfVu6b33lXjkcPhlNfBhJTDPsTg4xj2of0Q
 bG3K8igzvfOXeWFieNB7hMlN6Ra5Vmdg1bEutq6tk8EZkIwL/mBmKzp/wHmMCLhF+Zwz
 ku6SRsElMRD3AXxCgTt5J2IKNsk+MOiYWJf+MutYECX0l/4OEPap/3iy6aMp3/yh3vxB
 M5Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nFODUIma3EDbIRqIpTnQ57GoUf+uy/YA2BkZQQikmd0=;
 b=UDEkrBiBX9sOWBuJlkLRYz5tcp+ZPEGTvn9Hk0DTtI7AoNVIsSGcMKnVga3TNPmHH2
 NI7a+pLloCWWvlF98zQxyy+CfhvUZXxISk7o4xTit7UM1EUYF/U3gQNQXCIWdq9dvX+y
 BKfa6QS+T6azwW4alrmdkPlquERlO8UQXC00rwJuFaIE5zzX1rMF839eCseZF7/Txu3R
 aoKz5v61eOLgW2AQ1gq6xNvl19Y05uM2LpM9kJvFzeAtE4Nu7H0bwRM71SL5W/g6R/r2
 /zdS8WzWE2Tel9TWRHiDLEcClZ3M/xVoFbqxHOQut5pQD6GlnpUlO3AW0eEZMW5Gjth0
 Gc1w==
X-Gm-Message-State: AOAM533Xq57MtQiV8u+Vz8Z94HGNPeD3aWLND5+as2j/QZP6WJ81Am/K
 I/3Pwh8oAsdFstgVcbTIM3TSpdpmjN0sgnm9UWhNmA==
X-Google-Smtp-Source: ABdhPJx3bGnuobGT4zwh1rbnnaaQarkVpenAIfZhq2v0f5/++oyGZrTGjbyibQkW/PkKrYhyG44vW6fx38JiU1SPPcY=
X-Received: by 2002:a05:6512:3222:: with SMTP id
 f2mr25942710lfe.25.1609514861521; 
 Fri, 01 Jan 2021 07:27:41 -0800 (PST)
MIME-Version: 1.0
References: <20201226163037.43691-1-vitaly.wool@konsulko.com>
 <CAAhSdy1M5pMjYHNWdOicb3N3fjTfQLEgE8tFb74sqGbPE_9eyQ@mail.gmail.com>
 <CAM4kBBJ3Vbytx=dFK7+DMByV3zK=FVLATSwjyuuygkDK1MCQjA@mail.gmail.com>
 <CAAhSdy0E8xspb3epBdrTmjg7vSQanG9zwyMY19eeDDL8z=WJFg@mail.gmail.com>
 <CAM4kBBJLnrp8XB1OZnv2FEuKdEQuQfDWdgwsV--9mZYB=JmJPQ@mail.gmail.com>
 <CAAhSdy1VMujreaaWCDjO9BPa0P2As7c0Hh3riZsY3ncU3NnsGg@mail.gmail.com>
 <CAM4kBB+fAOhN6dodf8nz2qqTJbXhKQ-EF+jHrBu2OA9wtBv-7w@mail.gmail.com>
In-Reply-To: <CAM4kBB+fAOhN6dodf8nz2qqTJbXhKQ-EF+jHrBu2OA9wtBv-7w@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 1 Jan 2021 20:57:29 +0530
Message-ID: <CAAhSdy32+n5WcEYJZ5rB70=v1P=aG3haT1j_NGnUENQhqH54BA@mail.gmail.com>
Subject: Re: [PATCH] riscv: add BUILTIN_DTB support for MMU-enabled targets
To: Vitaly Wool <vitaly.wool@konsulko.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210101_102746_165804_9E3912CE 
X-CRM114-Status: GOOD (  40.67  )
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

On Thu, Dec 31, 2020 at 3:23 PM Vitaly Wool <vitaly.wool@konsulko.com> wrote:
>
> On Tue, Dec 29, 2020 at 6:05 AM Anup Patel <anup@brainfault.org> wrote:
> >
> > On Mon, Dec 28, 2020 at 10:08 PM Vitaly Wool <vitaly.wool@konsulko.com> wrote:
> > >
> > > On Mon, Dec 28, 2020 at 3:10 PM Anup Patel <anup@brainfault.org> wrote:
> > > >
> > > > On Mon, Dec 28, 2020 at 7:05 PM Vitaly Wool <vitaly.wool@konsulko.com> wrote:
> > > > >
> > > > > On Mon, Dec 28, 2020 at 12:59 PM Anup Patel <anup@brainfault.org> wrote:
> > > > > >
> > > > > > On Sat, Dec 26, 2020 at 10:03 PM Vitaly Wool <vitaly.wool@konsulko.com> wrote:
> > > > > > >
> > > > > > > Sometimes, especially in a production system we may not want to
> > > > > > > use a "smart bootloader" like u-boot to load kernel, ramdisk and
> > > > > > > device tree from a filesystem on eMMC, but rather load the kernel
> > > > > > > from a NAND partition and just run it as soon as we can, and in
> > > > > > > this case it is convenient to have device tree compiled into the
> > > > > > > kernel binary. Since this case is not limited to MMU-less systems,
> > > > > > > let's support it for these which have MMU enabled too.
> > > > > > >
> > > > > > > Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.com>
> > > > > > > ---
> > > > > > >  arch/riscv/Kconfig   |  1 -
> > > > > > >  arch/riscv/mm/init.c | 12 ++++++++++--
> > > > > > >  2 files changed, 10 insertions(+), 3 deletions(-)
> > > > > > >
> > > > > > > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > > > > > > index 2b41f6d8e458..9464b4e3a71a 100644
> > > > > > > --- a/arch/riscv/Kconfig
> > > > > > > +++ b/arch/riscv/Kconfig
> > > > > > > @@ -419,7 +419,6 @@ endmenu
> > > > > > >
> > > > > > >  config BUILTIN_DTB
> > > > > > >         def_bool n
> > > > > > > -       depends on RISCV_M_MODE
> > > > > > >         depends on OF
> > > > > > >
> > > > > > >  menu "Power management options"
> > > > > > > diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> > > > > > > index 87c305c566ac..5d1c7a3ec01c 100644
> > > > > > > --- a/arch/riscv/mm/init.c
> > > > > > > +++ b/arch/riscv/mm/init.c
> > > > > > > @@ -194,12 +194,20 @@ void __init setup_bootmem(void)
> > > > > > >         setup_initrd();
> > > > > > >  #endif /* CONFIG_BLK_DEV_INITRD */
> > > > > > >
> > > > > > > +       /*
> > > > > > > +        * If DTB is built in, no need to reserve its memblock.
> > > > > > > +        * OTOH, initial_boot_params has to be set to properly copy DTB
> > > > > > > +        * before unflattening later on.
> > > > > > > +        */
> > > > > > > +       if (IS_ENABLED(CONFIG_BUILTIN_DTB))
> > > > > > > +               initial_boot_params = __va(dtb_early_pa);
> > > > > >
> > > > > > Don't assign initial_boot_params directly here because the
> > > > > > early_init_dt_scan() will do it.
> > > > >
> > > > > early_init_dt_scan will set initial_boot_params to dtb_early_va from
> > > > > the early mapping which will be gone by the time
> > > > > unflatten_and_copy_device_tree() is called.
> > > >
> > > > That's why we are doing early_init_dt_verify() again for the MMU-enabled
> > > > case which already takes care of your concern.
> > >
> > > I might be out in the woods here but... Do you mean the call to
> > > early_init_dt_verify() in setup_arch() which is compiled out
> > > completely in the CONFIG_BUILTIN_DTB case?
> > > Or is there any other call that I'm overlooking?
> >
> > Sorry for the confusion, what I meant was that we are calling
> > early_init_dt_verify() from setup_arch() for the MMU-enabled
> > with built-in DTB disabled case to update "initial_boot_params"
> > after the boot CPU has switched from early_pg_dir to swapper_pg_dir.
> >
> > For MMU-enabled with built-in DTB case, if setup_vm() sets the
> > dtb_early_va and dtb_early_pa correctly then early_init_dt_scan()
> > called from setup_arch() will automatically set correct value for
> > "initial_boot_params".
>
> Oh I think I get it now. You are suggesting to skip the temporary
> mapping for DT altogether since it is anyway in the kernel mapping
> range, aren't you?
> That does make sense indeed, thanks :)

Yes, that's what I am suggesting.

>
> > It is strange that early_init_dt_verify() is being compiled-out for you
> > because the early_init_dt_scan() called from setup_arch() also uses
> > early_init_dt_verify(). I quickly compiled the NoMMU kernel for K210
> > which also uses built-in DTB and I see that early_init_dt_verify()
> > is not being compiled-out when built-in DTB is enabled.
>
> I did not say that early_init_dt_verify() is compiled out, it's the
> call to it in setup_arch() that is compiled out if BUILTIN_DTB is
> selected. However, if I understand you correctly now, it should not
> matter if we don't set dtb_early_va to point to the temporary mapping.

Yes, dtb_early_va can point to some other location such as
built-in DTB.

For MMU-enabled with built-in DTB case, the setup_vm() should
skip the temporary mapping to DT and instead set dtb_early_va
and dtb_early_pa to point to the built-in DTB.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
