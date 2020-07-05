Return-Path: <SRS0=/pGw=AQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D6C4C433DF
	for <linux-riscv@archiver.kernel.org>; Sun,  5 Jul 2020 15:19:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 466EC20747
	for <linux-riscv@archiver.kernel.org>; Sun,  5 Jul 2020 15:19:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0dZhR5ch";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="LNZVvv0p"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 466EC20747
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AVCAFLsoFLJnS5rl9+DlDcgTAdkmvjBOPkwovLS1wjI=; b=0dZhR5chWohrOyKcZ2qgKgGcM
	YY91mUxcsOx/yyRXlCwPXDQgTDDHHO6tS28TOzuqC7CxmvK6gGNTAsv7t9Kd/y4DNX+Zg8n4ZwUmY
	8Zvgx8iufrVEBqBocLH+GFhgN1oECZQSW/LJmAEM5DEsna7hxJ6DgAK4+Mkos6jMbmDHjC1tVi2df
	4F0qFcAXNNy7ypzeeFGfcqZ45SkwrUmeNCBpvz8hoecAzXUDGEh+PflPUbzdsKVdIq2GHuzSUzN49
	JZSu2BJdeIxUNHQtzDlAF0BHAioFPkk0RGkrI7dPYiE7wkGUK1T/yMPnS+cRE9GVOKb28IJxWzFe2
	65tx2FkAQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1js6QJ-0002Ad-Dc; Sun, 05 Jul 2020 15:19:19 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1js6QG-0002A6-Se
 for linux-riscv@lists.infradead.org; Sun, 05 Jul 2020 15:19:17 +0000
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CEC702075D
 for <linux-riscv@lists.infradead.org>; Sun,  5 Jul 2020 15:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593962355;
 bh=d1gwuW9EbLFqUp2o/eqZ88VrRhIJvuujmU+xQyWZ/LI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=LNZVvv0pjJkZC07cfRGLC9pq9pU7KTK8dlsJGPcEZS+l6XENHoXhk/srelxojjkYl
 HybGUD2DmDOv1kwYGOkIIBytqekx3tO4QrxGmBgwTh5as8+PvIxSMrvM5gmo5DygIS
 xeIH8fN2JVDJlArg0ndqzxbSeGo8e48NhGcuIu2s=
Received: by mail-lj1-f179.google.com with SMTP id h19so42362630ljg.13
 for <linux-riscv@lists.infradead.org>; Sun, 05 Jul 2020 08:19:14 -0700 (PDT)
X-Gm-Message-State: AOAM531u8Up8Z02x5f6HUbNOVHMe7TMcMcWXcVHEza6Q4agGnVtKZ6Wo
 P/HciM9JkhTBauqS0n8Aq/rQXm0EJUtY9RRK3hs=
X-Google-Smtp-Source: ABdhPJx59Ibqq14nclGju0l11e6asQW1mA7a584lKkXuWRdzoZGRly4EG6eVo88gkdI+Wc8AMDcbraRn99eUsBnZGlQ=
X-Received: by 2002:a2e:864e:: with SMTP id i14mr22457241ljj.441.1593962353137; 
 Sun, 05 Jul 2020 08:19:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200705142640.279439-1-kernel@esmil.dk>
 <CAJF2gTSi+2qxfzWxa5xvZnyJBFi5WcdSc-LDrqavB-hZ9-e9-Q@mail.gmail.com>
 <CAJF2gTRr=7_S5M5Y71Fxx66o6fvv1NN=d9nWiUqnAqHFHiu3Cw@mail.gmail.com>
In-Reply-To: <CAJF2gTRr=7_S5M5Y71Fxx66o6fvv1NN=d9nWiUqnAqHFHiu3Cw@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 5 Jul 2020 23:19:01 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQSy9TU+viBhKF2yk4Awjqjkpp7dPEsJv7y-YFtMzsBGw@mail.gmail.com>
Message-ID: <CAJF2gTQSy9TU+viBhKF2yk4Awjqjkpp7dPEsJv7y-YFtMzsBGw@mail.gmail.com>
Subject: Re: [PATCH] asm-generic/mmiowb: Get cpu in mmiowb_set_pending
To: Emil Renner Berthing <kernel@esmil.dk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200705_111917_048506_3DBD5503 
X-CRM114-Status: GOOD (  23.65  )
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

On Sun, Jul 5, 2020 at 10:51 PM Guo Ren <guoren@kernel.org> wrote:
>
> Sorry:  Use atomic_set, not atomic read,
> seams like:
>  +       atomic_set(&ms->mmiowb_pending, ms->nesting_count);
It's still wrong, forgive me.

>
> But you need still deal with these for atomic
> struct mmiowb_state {
>         u16     nesting_count;
>         u16     mmiowb_pending;
> };
>
> On Sun, Jul 5, 2020 at 10:43 PM Guo Ren <guoren@kernel.org> wrote:
> >
> > Hi Emil,
> >
> > On Sun, Jul 5, 2020 at 10:27 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> > >
> > > Without this enabling CONFIG_PREEMPT and CONFIG_DEBUG_PREEMPT
> > > results in many errors like this on the HiFive Unleashed
> > > RISC-V board:
> > >
> > > BUG: using smp_processor_id() in preemptible [00000000] code: swapper/0/1
> > > caller is regmap_mmio_write32le+0x1c/0x46
> > > CPU: 3 PID: 1 Comm: swapper/0 Not tainted 5.8.0-rc3-hfu+ #1
> > > Call Trace:
> > > [<ffffffe000201f6e>] walk_stackframe+0x0/0x7a
> > > [<ffffffe0005b290e>] dump_stack+0x6e/0x88
> > > [<ffffffe00047365e>] regmap_mmio_write32le+0x18/0x46
> > > [<ffffffe0005c4c26>] check_preemption_disabled+0xa4/0xaa
> > > [<ffffffe00047365e>] regmap_mmio_write32le+0x18/0x46
> > > [<ffffffe0004737c8>] regmap_mmio_write+0x26/0x44
> > > [<ffffffe0004715c4>] regmap_write+0x28/0x48
> > > [<ffffffe00043dccc>] sifive_gpio_probe+0xc0/0x1da
> > > [<ffffffe00000113e>] rdinit_setup+0x22/0x26
> > > [<ffffffe000469054>] platform_drv_probe+0x24/0x52
> > > [<ffffffe000467e16>] really_probe+0x92/0x21a
> > > [<ffffffe0004683a8>] device_driver_attach+0x42/0x4a
> > > [<ffffffe0004683ac>] device_driver_attach+0x46/0x4a
> > > [<ffffffe0004683f0>] __driver_attach+0x40/0xac
> > > [<ffffffe0004683ac>] device_driver_attach+0x46/0x4a
> > > [<ffffffe000466a3e>] bus_for_each_dev+0x3c/0x64
> > > [<ffffffe000467118>] bus_add_driver+0x11e/0x184
> > > [<ffffffe00046889a>] driver_register+0x32/0xc6
> > > [<ffffffe00000e5ac>] gpiolib_sysfs_init+0xaa/0xae
> > > [<ffffffe0000019ec>] do_one_initcall+0x50/0xfc
> > > [<ffffffe00000113e>] rdinit_setup+0x22/0x26
> > > [<ffffffe000001bea>] kernel_init_freeable+0x152/0x1da
> > > [<ffffffe0005c4d28>] rest_init+0xde/0xe2
> > > [<ffffffe0005c4d36>] kernel_init+0xa/0x11a
> > > [<ffffffe0005c4d28>] rest_init+0xde/0xe2
> > > [<ffffffe000200ff6>] ret_from_syscall_rejected+0x8/0xc
> > >
> > > Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> > > ---
> > > This patch fixes it, but my guess is that it's not the right
> > > fix. Do anyone have a better idea?
> > >
> > >  include/asm-generic/mmiowb.h | 6 +++++-
> > >  1 file changed, 5 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/include/asm-generic/mmiowb.h b/include/asm-generic/mmiowb.h
> > > index 9439ff037b2d..31a21cdfbbcf 100644
> > > --- a/include/asm-generic/mmiowb.h
> > > +++ b/include/asm-generic/mmiowb.h
> > > @@ -34,8 +34,12 @@ DECLARE_PER_CPU(struct mmiowb_state, __mmiowb_state);
> > >
> > >  static inline void mmiowb_set_pending(void)
> > >  {
> > > -       struct mmiowb_state *ms = __mmiowb_state();
> > > +       struct mmiowb_state *ms;
> > > +
> > > +       get_cpu();
> > > +       ms = __mmiowb_state();
> > >         ms->mmiowb_pending = ms->nesting_count;
> > > +       put_cpu();
> > >  }
> >
> > #define __mmiowb_state()        this_cpu_ptr(&__mmiowb_state)
> >
> > The ptr is a fixed address, so don't worry about the change, and just
> > use an atomic_read is enough.
> > static inline void mmiowb_set_pending(void)
> > {
> >         struct mmiowb_state *ms = __mmiowb_state();
> > -       ms->mmiowb_pending = ms->nesting_count;
> > +      ms->mmiowb_pending = atomic_read(ms->nesting_count);
> > }
> >
> >
> > --
> > Best Regards
> >  Guo Ren
> >
> > ML: https://lore.kernel.org/linux-csky/
>
>
>
> --
> Best Regards
>  Guo Ren
>
> ML: https://lore.kernel.org/linux-csky/



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
