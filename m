Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 128BAC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 17:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OOtd9K84OLOc6TMcaH+cQhkqTtlpXhRxzXQ20EZe7Xk=; b=NqnN3Br+TYKB0G
	QxOai904Y7BpHk5/HCC89GTgu5fn5m2f0O9JjPe+BWeSo10rib+PT6jcH6jMI6M1Vu16cu7sEcWXX
	Q3sbAaMVurxPbtGbj39l6N8UsTMZlpNA//Azq+1S2Ldu9WCfR7W/y+/InENOKgPT/UTM6kg5Hly66
	uO6fd4Lj1DRhWwKKpRZJBtobx2Iny9MStDWAU2P1pd3Jxv3ifYdxw0RRVif0/w0IAl4oF8TIdbKkF
	95nlrb9CBCP3YVkJCJG5dyye2vfYZQkz3jjeWdcBfJyrVcNpdinE+vtorHRHRGq9VJGI0p3mNKmgD
	2qmEp4Cm+R8JHPI0ktAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p04Ja-00AUBr-AZ; Tue, 29 Nov 2022 17:22:38 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p04JX-00AU9t-CO
	for linux-riscv@lists.infradead.org; Tue, 29 Nov 2022 17:22:36 +0000
Received: by mail-ot1-x32c.google.com with SMTP id g51-20020a9d12b6000000b0066dbea0d203so9536198otg.6
        for <linux-riscv@lists.infradead.org>; Tue, 29 Nov 2022 09:22:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ERzS4U2j7MTY+q0b6hybFjdEdU2YsUOeh9tkV6tQ7R8=;
        b=P68pHJx/xDGYU19tBbtmlh8dH2BZ4O1B8pO10i2goAlNMAaQ54qSn0jtNJ1sIg9Aj1
         Q9R6vEb91togZPOme6eJRs5dz6XBeE8Dzass+tIHqztTEHyxk0bIiC53v1Tt1CY+srYZ
         i6QPA8GTjjQ5XG9/j5tHAcWF6cdU/KNQ6sYXua/r/ARkT6b2PYtXl3ZeNIHFTdLGfufK
         5Ta5ta0fmTaV5U6lr7Xu/9EZ8IfqvmcM1s4l1Melm5rF6wmjZrv7Ka/h5MVX+D6mMkFy
         SH9UD7+S4bAlBYT8GS8QlFUhZox5kO+vq58DXuB7IF72XF/FV1+QBexFmISXFyu5LzEG
         nWfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ERzS4U2j7MTY+q0b6hybFjdEdU2YsUOeh9tkV6tQ7R8=;
        b=z+7qxwVKni0y9cOKDV1yY2+bK+VF24IDnsmTf6D79g03wV7MlNS5+/TtbdYyAbZCmk
         MTNVNukbLm8koUVfefd4rvA5003oq9xtH/+SFxRfJzp3HXXVo6GVwYqjttz0FtRpr6WB
         5m3IjJJuyjkqvHW4qkV5lqHYS4uwFj82H5OF/3go6n7Vf0G/dZGgEX2XC7uQJnwHaPKg
         uZ0tTdPdBXTpmqAojAsK3mZs5M8jXDbjNcYN3KWJygaDPqYr8Pl+Qarowba3gYyKqypT
         yua7XALEBV0R/KBRsv63j6RdxKydsln+l2HoHbuJcmGq7aLNApbzYDIzhJ3NADz+kIYU
         ZDKg==
X-Gm-Message-State: ANoB5pnakRulFilgDF4AuISApgFu0K2FUvX3FTPuoPnsNBpm9hyCk+6C
	1IL6uirmxDds0sQQPaT0sR0GQH9f0lBU3xY+eIgAsg==
X-Google-Smtp-Source: AA0mqf5CWImQG2jZGF4VQvkIetPlLOql83+imxUC6Tcb57B0VvferIBl3sP6CqUAMmLR+kzm9Cm3iIBaqBt6oKZvJ5g=
X-Received: by 2002:a9d:5e0f:0:b0:662:2458:3ef7 with SMTP id
 d15-20020a9d5e0f000000b0066224583ef7mr28862254oti.150.1669742552546; Tue, 29
 Nov 2022 09:22:32 -0800 (PST)
MIME-Version: 1.0
References: <20221129140313.886192-1-apatel@ventanamicro.com>
 <20221129140313.886192-4-apatel@ventanamicro.com> <Y4YY6kBBEBdZoUIp@wendy>
 <CAAhSdy3dWGVV=jh5mzK=m63A3UAqwJhxidcAZQU_WC4TRNfCjQ@mail.gmail.com> <Y4Y+vZ7qndV2c5Ai@spud>
In-Reply-To: <Y4Y+vZ7qndV2c5Ai@spud>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 29 Nov 2022 22:52:22 +0530
Message-ID: <CAK9=C2VtgCOk9S_FucJbwsG+nMuBqEsFk3sAMt7_doAKsMHQ8w@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] clocksource: timer-riscv: Set CLOCK_EVT_FEAT_C3STOP
 based on DT
To: Conor Dooley <conor@kernel.org>
Cc: Anup Patel <anup@brainfault.org>, Conor Dooley <conor.dooley@microchip.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Andrew Jones <ajones@ventanamicro.com>, 
	Atish Patra <atishp@atishpatra.org>, Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_092235_441516_7D67D77D 
X-CRM114-Status: GOOD (  36.88  )
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

On Tue, Nov 29, 2022 at 10:47 PM Conor Dooley <conor@kernel.org> wrote:
>
> On Tue, Nov 29, 2022 at 10:41:09PM +0530, Anup Patel wrote:
> > On Tue, Nov 29, 2022 at 8:06 PM Conor Dooley <conor.dooley@microchip.com> wrote:
> > >
> > > On Tue, Nov 29, 2022 at 07:33:13PM +0530, Anup Patel wrote:
> > > > We should set CLOCK_EVT_FEAT_C3STOP for a clock_event_device only
> > > > when riscv,timer-cant-wake-up DT property is present in the RISC-V
> > > > timer DT node.
> > > >
> > > > This way CLOCK_EVT_FEAT_C3STOP feature is set for clock_event_device
> > > > based on RISC-V platform capabilities rather than having it set for
> > > > all RISC-V platforms.
> > > >
> > > > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > >
> > > I thought I had left an R-b on this one?
> > > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > >
> > > Also, I think that we need to backport *something* that disables C3STOP
> > > which is why I had suggested keeping the revert in place.
> > > Patch 1 of this series only solves the timer issues but does not restore
> > > sleep states to their prior behaviour, right?
> > > Either this patch or the revert needs to go to stable IMO.
> >
> > Since it works for you with the C3STOP set and broadcast timer enabled,
> > we can directly go with this patch. I am fine including the revert as well.
>
> I don't mind which gets backported. To me, this one is preferable as it
> is more "complete" but it is a bit on the new feature side of things,
> no?
>
> Whoever applies it can decide, and I'll backport the revert if they
> decide that this patch is not stable material :)
>
> Thanks again for helping sort this mess out, I see it helped with your
> IPI series too!

Yes, I was surprised to see that it helped the IPI series as well.
Thanks for your patch.

Regards,
Anup

>
> Conor.
>
> > > > ---
> > > >  drivers/clocksource/timer-riscv.c | 12 +++++++++++-
> > > >  1 file changed, 11 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
> > > > index 969a552da8d2..0c8bdd168a45 100644
> > > > --- a/drivers/clocksource/timer-riscv.c
> > > > +++ b/drivers/clocksource/timer-riscv.c
> > > > @@ -28,6 +28,7 @@
> > > >  #include <asm/timex.h>
> > > >
> > > >  static DEFINE_STATIC_KEY_FALSE(riscv_sstc_available);
> > > > +static bool riscv_timer_cant_wake_cpu;
> > > >
> > > >  static int riscv_clock_next_event(unsigned long delta,
> > > >               struct clock_event_device *ce)
> > > > @@ -51,7 +52,7 @@ static int riscv_clock_next_event(unsigned long delta,
> > > >  static unsigned int riscv_clock_event_irq;
> > > >  static DEFINE_PER_CPU(struct clock_event_device, riscv_clock_event) = {
> > > >       .name                   = "riscv_timer_clockevent",
> > > > -     .features               = CLOCK_EVT_FEAT_ONESHOT | CLOCK_EVT_FEAT_C3STOP,
> > > > +     .features               = CLOCK_EVT_FEAT_ONESHOT,
> > > >       .rating                 = 100,
> > > >       .set_next_event         = riscv_clock_next_event,
> > > >  };
> > > > @@ -85,6 +86,8 @@ static int riscv_timer_starting_cpu(unsigned int cpu)
> > > >
> > > >       ce->cpumask = cpumask_of(cpu);
> > > >       ce->irq = riscv_clock_event_irq;
> > > > +     if (riscv_timer_cant_wake_cpu)
> > > > +             ce->features |= CLOCK_EVT_FEAT_C3STOP;
> > > >       clockevents_config_and_register(ce, riscv_timebase, 100, 0x7fffffff);
> > > >
> > > >       enable_percpu_irq(riscv_clock_event_irq,
> > > > @@ -139,6 +142,13 @@ static int __init riscv_timer_init_dt(struct device_node *n)
> > > >       if (cpuid != smp_processor_id())
> > > >               return 0;
> > > >
> > > > +     child = of_find_compatible_node(NULL, NULL, "riscv,timer");
> > > > +     if (child) {
> > > > +             riscv_timer_cant_wake_cpu = of_property_read_bool(child,
> > > > +                                             "riscv,timer-cant-wake-cpu");
> > > > +             of_node_put(child);
> > > > +     }
> > > > +
> > > >       domain = NULL;
> > > >       child = of_get_compatible_child(n, "riscv,cpu-intc");
> > > >       if (!child) {
> > > > --
> > > > 2.34.1
> > > >

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
