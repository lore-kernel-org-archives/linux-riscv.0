Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A853C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 17:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Z+kTuOdtZbfotOoImvR2AqXQVsyk7IYxhkplEeJv6w=; b=hurSUh3dY5t+og
	xFw9Oc+Eu5G2Q4TigGyUyCpBkYqQUGihkAF+c+E6JsqFlpCSqzB7FObJo4TMgnLifN7hxHbxe+oZj
	BQ770UbLS6CXjYh73TKEmU5iXcpB+W90k4+EYGrc2qYC5NqF8mh7PreLkLj3BnsOskz65PaeY6YdK
	/cuQ06ptM6wX3DyL4UfLLcraZsAd+osSkhQ6h5Lcf+b6ZTgOo701dgimVn7mKYS83k4WhcWmTqqcC
	0wibI+4ze+p3n8ZxY3pATbQGTdm7anzBt1ABYfWgw68yAZmpFtF2KzAwflamKECp+fGJcY5iI9TF9
	+K3hfRHaObM9cuIV/rBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p048l-00AQBo-05; Tue, 29 Nov 2022 17:11:27 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p048i-00AQA2-Rk
	for linux-riscv@lists.infradead.org; Tue, 29 Nov 2022 17:11:26 +0000
Received: by mail-ej1-x62e.google.com with SMTP id ud5so35423707ejc.4
        for <linux-riscv@lists.infradead.org>; Tue, 29 Nov 2022 09:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=msAP4TW5rerQcRILPebntv36PL15yDZMgzxuUAAXhBo=;
        b=EFB2JMJ3F/3YqygGeoSAEyPEakOW5kvArTiOzsA0yzHsk4p6KRfIUh7rxEMQU3BhZH
         N9rVP1i4aoUUl8Ey8S1k/0q3QfvOuSG8vxzDIc+WrE3nw5YbxYNWOxFP6Kijy2AAFamY
         OpAZdUXNXUYHJuO97qquTUMoCHByqL5D7UbIDJl/JYq53RctML+qOaInF4A3+ejTIAD5
         hOEFkISVjaupTcKeEBKxEoxstI4CL+HdfuPYgfdAfExwsw8C33PIMQlCaHB4VwyjRvjK
         FFTEWLSxc5qNF48lOfyjpL+l99xZvqWuQ8wz7tpxOByjvelA3xrthH9QtCyBSMOP5D2f
         ajGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=msAP4TW5rerQcRILPebntv36PL15yDZMgzxuUAAXhBo=;
        b=o06k9/y6nTPhxpAwWZY0BaI7ZoRfQLkfptV9QC4/JuVtAn3UrDu+/ryf8AB2OxAXVm
         nHAhvp5zYCXaY9tyg4jfsbmo7fTZDL4dCmm6RCW1SwIDP9n6sfBpVUcukmj/Hpu3awte
         BD3HhCPqKi3CTlF+8fRHXB62PMU04wB+thKgqgREYU7Zu/VRcUHtRKirN9e7/3uPK/dc
         R5gJ3aXoXX0B0Wo0dpsefdnvmxxKcMsyP0LOzrvzfLeTeSqPr1zOc9hEQ6coGKubBOuB
         leS7G7wTDDCOp/KTbLQgTXXA5MggNg5wHWiDpTxsbF68++c607I4rSIc5CW2DlXKrIaz
         uh6g==
X-Gm-Message-State: ANoB5pkaFctjoBEMsLsHzZzT4AVSZijWEh0E37PWsHcdhEON6EGDzjDu
	MUjTmJ6zgxd2R1780w5TQzV2cqdV8phJQkR5ezNOPw==
X-Google-Smtp-Source: AA0mqf73SKGfO58rsYtsa7lCegwo/y+/CexGd7oZ4HQ0wrmXXGXeCzaLTyB6c1XPiCFExVs/Zdrn6C0KCE56h6ozwCs=
X-Received: by 2002:a17:907:a044:b0:7bc:27ab:6b2d with SMTP id
 gz4-20020a170907a04400b007bc27ab6b2dmr20998752ejc.750.1669741879740; Tue, 29
 Nov 2022 09:11:19 -0800 (PST)
MIME-Version: 1.0
References: <20221129140313.886192-1-apatel@ventanamicro.com>
 <20221129140313.886192-4-apatel@ventanamicro.com> <Y4YY6kBBEBdZoUIp@wendy>
In-Reply-To: <Y4YY6kBBEBdZoUIp@wendy>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 29 Nov 2022 22:41:09 +0530
Message-ID: <CAAhSdy3dWGVV=jh5mzK=m63A3UAqwJhxidcAZQU_WC4TRNfCjQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] clocksource: timer-riscv: Set CLOCK_EVT_FEAT_C3STOP
 based on DT
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Anup Patel <apatel@ventanamicro.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Andrew Jones <ajones@ventanamicro.com>, 
	Atish Patra <atishp@atishpatra.org>, Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_091125_074788_2CC5B118 
X-CRM114-Status: GOOD (  28.04  )
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

On Tue, Nov 29, 2022 at 8:06 PM Conor Dooley <conor.dooley@microchip.com> wrote:
>
> On Tue, Nov 29, 2022 at 07:33:13PM +0530, Anup Patel wrote:
> > We should set CLOCK_EVT_FEAT_C3STOP for a clock_event_device only
> > when riscv,timer-cant-wake-up DT property is present in the RISC-V
> > timer DT node.
> >
> > This way CLOCK_EVT_FEAT_C3STOP feature is set for clock_event_device
> > based on RISC-V platform capabilities rather than having it set for
> > all RISC-V platforms.
> >
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
>
> I thought I had left an R-b on this one?
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>
> Also, I think that we need to backport *something* that disables C3STOP
> which is why I had suggested keeping the revert in place.
> Patch 1 of this series only solves the timer issues but does not restore
> sleep states to their prior behaviour, right?
> Either this patch or the revert needs to go to stable IMO.

Since it works for you with the C3STOP set and broadcast timer enabled,
we can directly go with this patch. I am fine including the revert as well.

Regards,
Anup

>
> Thanks,
> Conor.
>
> > ---
> >  drivers/clocksource/timer-riscv.c | 12 +++++++++++-
> >  1 file changed, 11 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
> > index 969a552da8d2..0c8bdd168a45 100644
> > --- a/drivers/clocksource/timer-riscv.c
> > +++ b/drivers/clocksource/timer-riscv.c
> > @@ -28,6 +28,7 @@
> >  #include <asm/timex.h>
> >
> >  static DEFINE_STATIC_KEY_FALSE(riscv_sstc_available);
> > +static bool riscv_timer_cant_wake_cpu;
> >
> >  static int riscv_clock_next_event(unsigned long delta,
> >               struct clock_event_device *ce)
> > @@ -51,7 +52,7 @@ static int riscv_clock_next_event(unsigned long delta,
> >  static unsigned int riscv_clock_event_irq;
> >  static DEFINE_PER_CPU(struct clock_event_device, riscv_clock_event) = {
> >       .name                   = "riscv_timer_clockevent",
> > -     .features               = CLOCK_EVT_FEAT_ONESHOT | CLOCK_EVT_FEAT_C3STOP,
> > +     .features               = CLOCK_EVT_FEAT_ONESHOT,
> >       .rating                 = 100,
> >       .set_next_event         = riscv_clock_next_event,
> >  };
> > @@ -85,6 +86,8 @@ static int riscv_timer_starting_cpu(unsigned int cpu)
> >
> >       ce->cpumask = cpumask_of(cpu);
> >       ce->irq = riscv_clock_event_irq;
> > +     if (riscv_timer_cant_wake_cpu)
> > +             ce->features |= CLOCK_EVT_FEAT_C3STOP;
> >       clockevents_config_and_register(ce, riscv_timebase, 100, 0x7fffffff);
> >
> >       enable_percpu_irq(riscv_clock_event_irq,
> > @@ -139,6 +142,13 @@ static int __init riscv_timer_init_dt(struct device_node *n)
> >       if (cpuid != smp_processor_id())
> >               return 0;
> >
> > +     child = of_find_compatible_node(NULL, NULL, "riscv,timer");
> > +     if (child) {
> > +             riscv_timer_cant_wake_cpu = of_property_read_bool(child,
> > +                                             "riscv,timer-cant-wake-cpu");
> > +             of_node_put(child);
> > +     }
> > +
> >       domain = NULL;
> >       child = of_get_compatible_child(n, "riscv,cpu-intc");
> >       if (!child) {
> > --
> > 2.34.1
> >

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
