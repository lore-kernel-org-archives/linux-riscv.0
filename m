Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BC44C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 17:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qFpxSXDNzsE5iZsQkd9TRs7HoL1byn1Q3YhPm5c/KQY=; b=cFdGHRySC3+rMq
	I3ErWb7ceid8IkdD+THhtskvMB2U3hHm6ecF1YGEZkZjaArXv3CcXBYxYljM9ILXu0ST6zQ/WTCtk
	YnqWIN2dNGoTKy8hjdRLQJGGhEgR389G78xw4ExhYUpGHLdFoXSIzimqbnHfM0BPvobumvZFDO5gr
	wccbbIOc6JfKgRjb68QkUj9GJJ6DeDAniX6TrSz3kITspmB9t/uRf4gDjjrjjj+LN430eeILXSC4l
	Ff1dEE/TfN9USQe8NJTHi63+Upd9K8Vcg1YvYfLwenw+mAmTRX7mCYdBUWL0PZs9kV77nzogEW7/+
	Ar5Dsjicx/B9FCCvpSXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p04F6-00ASXh-Ie; Tue, 29 Nov 2022 17:18:00 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p04F3-00ASWT-OV
	for linux-riscv@lists.infradead.org; Tue, 29 Nov 2022 17:17:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 60EA5B817B0;
	Tue, 29 Nov 2022 17:17:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2278CC433C1;
	Tue, 29 Nov 2022 17:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669742275;
	bh=j4z3J0ry4LI3/VTORpWZJtphzv1izE78JWgG7lR/3Zk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h0XZp60OUgaSX9b2oURE0NkBldWPiVzpBd1f8qCCQykExGnSfJCu+dSv2kEcaCf9N
	 qu2Ok1ai439ftZYrxZWXyc2KsvsH7bHc2+T1Ums7BnYLd5sgZvTsg5gmrHgwJX0MAE
	 s/otXrepDuTD/9Z1fo8cH5t8grwebLxpleWyRST2SJETJoSkB4XpE36S+FBReHL4PP
	 EwUFwUWrpD85E6mIjFkbHPSTn2n1L2I/XJWfNWIgQtyiyebm1D5v1S4GonRIPFf275
	 HzpJfee0pDKysM3nGnmhapFEPxkyInzOOsMnvRU8F+ENemHgI3dPzGXn5g8V4oNdVI
	 oaaQNlgoa0H+w==
Date: Tue, 29 Nov 2022 17:17:49 +0000
From: Conor Dooley <conor@kernel.org>
To: Anup Patel <anup@brainfault.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@atishpatra.org>,
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/3] clocksource: timer-riscv: Set
 CLOCK_EVT_FEAT_C3STOP based on DT
Message-ID: <Y4Y+vZ7qndV2c5Ai@spud>
References: <20221129140313.886192-1-apatel@ventanamicro.com>
 <20221129140313.886192-4-apatel@ventanamicro.com>
 <Y4YY6kBBEBdZoUIp@wendy>
 <CAAhSdy3dWGVV=jh5mzK=m63A3UAqwJhxidcAZQU_WC4TRNfCjQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAhSdy3dWGVV=jh5mzK=m63A3UAqwJhxidcAZQU_WC4TRNfCjQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_091758_110337_CB2B4390 
X-CRM114-Status: GOOD (  35.15  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Nov 29, 2022 at 10:41:09PM +0530, Anup Patel wrote:
> On Tue, Nov 29, 2022 at 8:06 PM Conor Dooley <conor.dooley@microchip.com> wrote:
> >
> > On Tue, Nov 29, 2022 at 07:33:13PM +0530, Anup Patel wrote:
> > > We should set CLOCK_EVT_FEAT_C3STOP for a clock_event_device only
> > > when riscv,timer-cant-wake-up DT property is present in the RISC-V
> > > timer DT node.
> > >
> > > This way CLOCK_EVT_FEAT_C3STOP feature is set for clock_event_device
> > > based on RISC-V platform capabilities rather than having it set for
> > > all RISC-V platforms.
> > >
> > > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> >
> > I thought I had left an R-b on this one?
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> >
> > Also, I think that we need to backport *something* that disables C3STOP
> > which is why I had suggested keeping the revert in place.
> > Patch 1 of this series only solves the timer issues but does not restore
> > sleep states to their prior behaviour, right?
> > Either this patch or the revert needs to go to stable IMO.
> 
> Since it works for you with the C3STOP set and broadcast timer enabled,
> we can directly go with this patch. I am fine including the revert as well.

I don't mind which gets backported. To me, this one is preferable as it
is more "complete" but it is a bit on the new feature side of things,
no?

Whoever applies it can decide, and I'll backport the revert if they
decide that this patch is not stable material :)

Thanks again for helping sort this mess out, I see it helped with your
IPI series too!

Conor.

> > > ---
> > >  drivers/clocksource/timer-riscv.c | 12 +++++++++++-
> > >  1 file changed, 11 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
> > > index 969a552da8d2..0c8bdd168a45 100644
> > > --- a/drivers/clocksource/timer-riscv.c
> > > +++ b/drivers/clocksource/timer-riscv.c
> > > @@ -28,6 +28,7 @@
> > >  #include <asm/timex.h>
> > >
> > >  static DEFINE_STATIC_KEY_FALSE(riscv_sstc_available);
> > > +static bool riscv_timer_cant_wake_cpu;
> > >
> > >  static int riscv_clock_next_event(unsigned long delta,
> > >               struct clock_event_device *ce)
> > > @@ -51,7 +52,7 @@ static int riscv_clock_next_event(unsigned long delta,
> > >  static unsigned int riscv_clock_event_irq;
> > >  static DEFINE_PER_CPU(struct clock_event_device, riscv_clock_event) = {
> > >       .name                   = "riscv_timer_clockevent",
> > > -     .features               = CLOCK_EVT_FEAT_ONESHOT | CLOCK_EVT_FEAT_C3STOP,
> > > +     .features               = CLOCK_EVT_FEAT_ONESHOT,
> > >       .rating                 = 100,
> > >       .set_next_event         = riscv_clock_next_event,
> > >  };
> > > @@ -85,6 +86,8 @@ static int riscv_timer_starting_cpu(unsigned int cpu)
> > >
> > >       ce->cpumask = cpumask_of(cpu);
> > >       ce->irq = riscv_clock_event_irq;
> > > +     if (riscv_timer_cant_wake_cpu)
> > > +             ce->features |= CLOCK_EVT_FEAT_C3STOP;
> > >       clockevents_config_and_register(ce, riscv_timebase, 100, 0x7fffffff);
> > >
> > >       enable_percpu_irq(riscv_clock_event_irq,
> > > @@ -139,6 +142,13 @@ static int __init riscv_timer_init_dt(struct device_node *n)
> > >       if (cpuid != smp_processor_id())
> > >               return 0;
> > >
> > > +     child = of_find_compatible_node(NULL, NULL, "riscv,timer");
> > > +     if (child) {
> > > +             riscv_timer_cant_wake_cpu = of_property_read_bool(child,
> > > +                                             "riscv,timer-cant-wake-cpu");
> > > +             of_node_put(child);
> > > +     }
> > > +
> > >       domain = NULL;
> > >       child = of_get_compatible_child(n, "riscv,cpu-intc");
> > >       if (!child) {
> > > --
> > > 2.34.1
> > >

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
