Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8481C4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Dec 2022 06:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p8YZoCfPWw3pvPTlXfBTjBc6prGxm09hgXpIpy4a2ZQ=; b=4QwFyUTpuJFeLB
	u1X4HTJXowg7aPcCh0V++UzeZbmSUpfyS7dGq5nYW/kv73Wx7OCRjzoZbdq6Lrf843nTeokD0UeGC
	fFFf8rPrw34j24Cb9UFsvSxnwb8xQA5m4RR8GVnRDZnQgAX3h76/5ZOB/X27sTFsBklj8tgCKZfxX
	RMsX3nZORuOCAyYXhK1OdFWK6sqiwcWi94d7VlozINvTJyOY+/6pA4ZMHMAA230Moi+uz1rrVAYaA
	Y7XMztu/EMapvC/IeMuS5fUL5tWyAHHM+OnbMgU/tCileYXQfxSnWiTwJWRB88oB93xsp9S8iwA1Z
	UGVqVem0FleVmpuJzQDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0zbv-00DrJY-G6; Fri, 02 Dec 2022 06:33:23 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0zbr-00DrHL-IC
	for linux-riscv@lists.infradead.org; Fri, 02 Dec 2022 06:33:21 +0000
Received: by mail-pl1-x634.google.com with SMTP id 4so3839559pli.0
        for <linux-riscv@lists.infradead.org>; Thu, 01 Dec 2022 22:33:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2e1OCsgpQNrHz221Q80v+bgx3Vtueie52dKFWOYQJSQ=;
        b=cLwhrx2YMiyfexSmRCG6SM82EW5jtTgg3wsriLEp/9LKaJKD23d2JHKrIT3Y+LSUYR
         zXzzs15WgIGKR62/1sIg0wxQxnM2fFpVPz38dIzaCTUS0Lp1MzHlpGSApedTw8igk1M9
         Z5J3ZEduWncWqp06Qhsfwq7DrlSqRXZ567dy1gbr7PCk0io3XxDIRmXljq4y6hejN3eo
         3hW2b2df4W092RtPIfjev+F9cbGR+p1MFXKoZPFUKk/9JgY2Z2M8XJWLsdhkCz8olKRb
         e8S23JmkDYohlg63hMhm6MAk7SMlLtQpsprUGmOhknKg3tt5SLTruS8dD4/wsl0owD+X
         mrzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2e1OCsgpQNrHz221Q80v+bgx3Vtueie52dKFWOYQJSQ=;
        b=xLZDtPnmqQIZ3+df/j9tutonZbTJ3j1pODKt2C4paN76AelLRkwnxKpRZvgCVgBExs
         D5tMLBQZEQyqmrPpLTc/13oDuND0DrFAxV7MCj5eOoM8COIuYTEQWoib4s9hF6pIFf3j
         FIK928XNMh6Mf1I5UebvepPQ8NSdTXM0mnHvuGJ1ew3QzO2AOYwfEhMhTqB7XSS6mYFP
         NU07cwGGshdcmiA4rLa7JABK0tRXxc/uOOMxDbHMl0qLse+spCyCfm5nM8l3gJhc6xk9
         QQVwJ14PoM4BeSxZyTm8ih+kRr587qr8kQwAswE9STOqVoBb+4iWuZzjBU8TWK39UZ+G
         WwLw==
X-Gm-Message-State: ANoB5plsrFijGtmY6mgsmilM5hpdcBIu4rjZGibulsd9O8Ss0/fras7A
	8e+VFOZk04pzFh9MyVOchiW2aZJpcHYTR5kSXRvgSA==
X-Google-Smtp-Source: AA0mqf6edCrbkPO/2NIPJtveMoyJuTxhGlTMC/i4iyB4uN+af8x0IEyVANxR79VxqTYPY+zUxaMHPVZhgvFjHJXeGDk=
X-Received: by 2002:a17:90b:1d45:b0:218:6db5:fd98 with SMTP id
 ok5-20020a17090b1d4500b002186db5fd98mr75858015pjb.164.1669962797780; Thu, 01
 Dec 2022 22:33:17 -0800 (PST)
MIME-Version: 1.0
References: <20221201123954.1111603-1-apatel@ventanamicro.com>
 <20221201123954.1111603-4-apatel@ventanamicro.com> <20221202000603.GA1720201-robh@kernel.org>
In-Reply-To: <20221202000603.GA1720201-robh@kernel.org>
From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 2 Dec 2022 12:03:05 +0530
Message-ID: <CAK9=C2VbM+CP0Y9Xx-SM9O4TFrQmOKvVWy-u5mxdPxrhacK4JQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] clocksource: timer-riscv: Set CLOCK_EVT_FEAT_C3STOP
 based on DT
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Andrew Jones <ajones@ventanamicro.com>, 
	Atish Patra <atishp@atishpatra.org>, Samuel Holland <samuel@sholland.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Anup Patel <anup@brainfault.org>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_223319_631519_6B75E295 
X-CRM114-Status: GOOD (  26.43  )
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

On Fri, Dec 2, 2022 at 5:36 AM Rob Herring <robh@kernel.org> wrote:
>
> On Thu, Dec 01, 2022 at 06:09:54PM +0530, Anup Patel wrote:
> > We should set CLOCK_EVT_FEAT_C3STOP for a clock_event_device only
> > when riscv,timer-cannot-wake-cpu DT property is present in the RISC-V
> > timer DT node.
> >
> > This way CLOCK_EVT_FEAT_C3STOP feature is set for clock_event_device
> > based on RISC-V platform capabilities rather than having it set for
> > all RISC-V platforms.
> >
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> > ---
> >  drivers/clocksource/timer-riscv.c | 12 +++++++++++-
> >  1 file changed, 11 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
> > index 969a552da8d2..1b4b36df5484 100644
> > --- a/drivers/clocksource/timer-riscv.c
> > +++ b/drivers/clocksource/timer-riscv.c
> > @@ -28,6 +28,7 @@
> >  #include <asm/timex.h>
> >
> >  static DEFINE_STATIC_KEY_FALSE(riscv_sstc_available);
> > +static bool riscv_timer_cannot_wake_cpu;
> >
> >  static int riscv_clock_next_event(unsigned long delta,
> >               struct clock_event_device *ce)
> > @@ -51,7 +52,7 @@ static int riscv_clock_next_event(unsigned long delta,
> >  static unsigned int riscv_clock_event_irq;
> >  static DEFINE_PER_CPU(struct clock_event_device, riscv_clock_event) = {
> >       .name                   = "riscv_timer_clockevent",
> > -     .features               = CLOCK_EVT_FEAT_ONESHOT | CLOCK_EVT_FEAT_C3STOP,
> > +     .features               = CLOCK_EVT_FEAT_ONESHOT,
>
> A platform that depended on CLOCK_EVT_FEAT_C3STOP being set will break
> with this change because its existing DT will not have the new property.
>
> It needs to be the other way around which would effectively be the
> existing 'always-on' property.

There are no RISC-V platforms using C3STOP. The patch which
added C3STOP has been reverted.
(Refer, https://lore.kernel.org/lkml/a218ebf8-0fba-168d-6598-c970bbff5faf@sholland.org/T/)

I just need to rebase this patch upon the C3STOP revert patch.

>
> >       .rating                 = 100,
> >       .set_next_event         = riscv_clock_next_event,
> >  };
> > @@ -85,6 +86,8 @@ static int riscv_timer_starting_cpu(unsigned int cpu)
> >
> >       ce->cpumask = cpumask_of(cpu);
> >       ce->irq = riscv_clock_event_irq;
> > +     if (riscv_timer_cannot_wake_cpu)
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
> > +             riscv_timer_cannot_wake_cpu = of_property_read_bool(child,
> > +                                     "riscv,timer-cannot-wake-cpu");
> > +             of_node_put(child);
> > +     }
> > +
> >       domain = NULL;
> >       child = of_get_compatible_child(n, "riscv,cpu-intc");
> >       if (!child) {
> > --
> > 2.34.1
> >
> >

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
