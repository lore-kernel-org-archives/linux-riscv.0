Return-Path: <SRS0=/pGw=AQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57836C433DF
	for <linux-riscv@archiver.kernel.org>; Sun,  5 Jul 2020 15:03:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 238472073E
	for <linux-riscv@archiver.kernel.org>; Sun,  5 Jul 2020 15:03:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CTA2NqIv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 238472073E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uLnm7FCoq7W9MQG+Q1GXqCP5EuDZ7T7IGOKJ8xjg33Y=; b=CTA2NqIvMt4BKumWNsEmY/G5X
	OxBSRGvj4FkpAHQnTM5bd+z3CLXToK83mFYyLYaLCbbwOveYaCkymnC7NBZfsW0N1HZNmXm8yhJzg
	2aDJ09UfL7uzARHHQzaPYjZf4qY+bCdryT514hbLVbmCWklM95qQnFhiIyUc7cQuD+z+fyIkZASoQ
	fff3U9VjTVUzAN+adifjiUD70w8eewnRDwTfZh51B4xEQ9FJW8aqGgvuGKCD3/d/i6ULlg6lSh/bQ
	B59utno2CgNUmkFJ6K6XbzaveTQ5ggo1yaiU7AjwvUAIDXVmFJssnVF8gW4YXyJpUA/y95ubDRNa+
	oWAO4pNbA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1js6Av-0001dC-Eq; Sun, 05 Jul 2020 15:03:25 +0000
Received: from mail-yb1-f193.google.com ([209.85.219.193])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1js6At-0001cg-8o
 for linux-riscv@lists.infradead.org; Sun, 05 Jul 2020 15:03:24 +0000
Received: by mail-yb1-f193.google.com with SMTP id j202so17795269ybg.6
 for <linux-riscv@lists.infradead.org>; Sun, 05 Jul 2020 08:03:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7GPeP5MzENduE2hfu8IqaVVzjukSNYc23i7dv0fDD4Q=;
 b=kpFYn51iI3KqFclvm1w1DQjMA0QgS9DPeAWqPThPzGV8qO6IU7i5yoi5n5RtjKVawh
 jC0P4SZcdMFXXjfWN1n3ezw4nV2dimOQ1JaIp9BxJluiF4adPMmDnBB45BvzfArrOk+L
 pxWi5mxfzlFcG1W2mPYb6H2KaDx1u8l8h7jwZZgxT2O27FXAGyT8ZiZxmRHgixFf4GCM
 qfQYEpMP0Kdgvy5V51G20XLyTxDR4/sJKmYOtsdDJ3cRDdZMJYlvgIWz0jNOD+/s7Ger
 b4r20B0Jgj0g93KZcUzCCOZXqczAUtWVzoirubVT0wLXuJrKBl6xozgqwZTd5ccLBhoX
 CeFA==
X-Gm-Message-State: AOAM532jnOGEXXpOE4vBtuBzouD/s5mnSKUwACDGd5BU49waQHyKuGwQ
 Kget7Ah3GfEcIUtis1KFqjRhLZ/wbmndOocmK2I=
X-Google-Smtp-Source: ABdhPJxjMnCmpriOMpAr302IrCf8lCJCqNMcblicbvdhqj/DWvb1d0L31p3O8xBZPGZtw/tH/Ygz0BvjX7631aSNjII=
X-Received: by 2002:a25:6806:: with SMTP id d6mr15853416ybc.124.1593961402246; 
 Sun, 05 Jul 2020 08:03:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200705142640.279439-1-kernel@esmil.dk>
 <CAJF2gTSi+2qxfzWxa5xvZnyJBFi5WcdSc-LDrqavB-hZ9-e9-Q@mail.gmail.com>
In-Reply-To: <CAJF2gTSi+2qxfzWxa5xvZnyJBFi5WcdSc-LDrqavB-hZ9-e9-Q@mail.gmail.com>
From: Emil Renner Berthing <kernel@esmil.dk>
Date: Sun, 5 Jul 2020 17:03:11 +0200
Message-ID: <CANBLGcxWuO=xGfwwKPp7Faw1ZU=Z3p37KbopgQnB5HLg=CXTdg@mail.gmail.com>
Subject: Re: [PATCH] asm-generic/mmiowb: Get cpu in mmiowb_set_pending
To: Guo Ren <guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200705_110323_346238_D58E479D 
X-CRM114-Status: GOOD (  20.86  )
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
Cc: linux-arch <linux-arch@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Arnd Bergmann <arnd@arndb.de>,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Ren,

On Sun, 5 Jul 2020 at 16:44, Guo Ren <guoren@kernel.org> wrote:
>
> Hi Emil,
>
> On Sun, Jul 5, 2020 at 10:27 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> >
> > Without this enabling CONFIG_PREEMPT and CONFIG_DEBUG_PREEMPT
> > results in many errors like this on the HiFive Unleashed
> > RISC-V board:
> >
> > BUG: using smp_processor_id() in preemptible [00000000] code: swapper/0/1
> > caller is regmap_mmio_write32le+0x1c/0x46
> > CPU: 3 PID: 1 Comm: swapper/0 Not tainted 5.8.0-rc3-hfu+ #1
> > Call Trace:
> > [<ffffffe000201f6e>] walk_stackframe+0x0/0x7a
> > [<ffffffe0005b290e>] dump_stack+0x6e/0x88
> > [<ffffffe00047365e>] regmap_mmio_write32le+0x18/0x46
> > [<ffffffe0005c4c26>] check_preemption_disabled+0xa4/0xaa
> > [<ffffffe00047365e>] regmap_mmio_write32le+0x18/0x46
> > [<ffffffe0004737c8>] regmap_mmio_write+0x26/0x44
> > [<ffffffe0004715c4>] regmap_write+0x28/0x48
> > [<ffffffe00043dccc>] sifive_gpio_probe+0xc0/0x1da
> > [<ffffffe00000113e>] rdinit_setup+0x22/0x26
> > [<ffffffe000469054>] platform_drv_probe+0x24/0x52
> > [<ffffffe000467e16>] really_probe+0x92/0x21a
> > [<ffffffe0004683a8>] device_driver_attach+0x42/0x4a
> > [<ffffffe0004683ac>] device_driver_attach+0x46/0x4a
> > [<ffffffe0004683f0>] __driver_attach+0x40/0xac
> > [<ffffffe0004683ac>] device_driver_attach+0x46/0x4a
> > [<ffffffe000466a3e>] bus_for_each_dev+0x3c/0x64
> > [<ffffffe000467118>] bus_add_driver+0x11e/0x184
> > [<ffffffe00046889a>] driver_register+0x32/0xc6
> > [<ffffffe00000e5ac>] gpiolib_sysfs_init+0xaa/0xae
> > [<ffffffe0000019ec>] do_one_initcall+0x50/0xfc
> > [<ffffffe00000113e>] rdinit_setup+0x22/0x26
> > [<ffffffe000001bea>] kernel_init_freeable+0x152/0x1da
> > [<ffffffe0005c4d28>] rest_init+0xde/0xe2
> > [<ffffffe0005c4d36>] kernel_init+0xa/0x11a
> > [<ffffffe0005c4d28>] rest_init+0xde/0xe2
> > [<ffffffe000200ff6>] ret_from_syscall_rejected+0x8/0xc
> >
> > Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> > ---
> > This patch fixes it, but my guess is that it's not the right
> > fix. Do anyone have a better idea?
> >
> >  include/asm-generic/mmiowb.h | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/include/asm-generic/mmiowb.h b/include/asm-generic/mmiowb.h
> > index 9439ff037b2d..31a21cdfbbcf 100644
> > --- a/include/asm-generic/mmiowb.h
> > +++ b/include/asm-generic/mmiowb.h
> > @@ -34,8 +34,12 @@ DECLARE_PER_CPU(struct mmiowb_state, __mmiowb_state);
> >
> >  static inline void mmiowb_set_pending(void)
> >  {
> > -       struct mmiowb_state *ms = __mmiowb_state();
> > +       struct mmiowb_state *ms;
> > +
> > +       get_cpu();
> > +       ms = __mmiowb_state();
> >         ms->mmiowb_pending = ms->nesting_count;
> > +       put_cpu();
> >  }
>
> #define __mmiowb_state()        this_cpu_ptr(&__mmiowb_state)
>
> The ptr is a fixed address, so don't worry about the change, and just
> use an atomic_read is enough.
> static inline void mmiowb_set_pending(void)
> {
>         struct mmiowb_state *ms = __mmiowb_state();
> -       ms->mmiowb_pending = ms->nesting_count;
> +      ms->mmiowb_pending = atomic_read(ms->nesting_count);
> }

You may be right, but it doesn't fix the BUG. As far as I can tell it
happens in __mmiowb_state() which expands through this_cpu_ptr and
arch_raw_cpu_ptr to SHIFT_PERCPU_PTR(ptr, __my_cpu_offset), where
__my_cpu_offset is per_cpu_offset(smp_processor_id()) and with
CONFIG_DEBUG_PREEMPT smp_processor_id is actually
debug_smp_processor_id, which eventually checks that preemption is
disabled in check_preemption_disabled.

/Emil
> --
> Best Regards
>  Guo Ren
>
> ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
