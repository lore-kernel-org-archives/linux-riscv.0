Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9FCEC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 18:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=PYLoZbBYx1k+pIQy17QiFrQhmnwEt7g6EjDMOflwW4w=; b=z5ICFoTdIy5mZQLm1imhW5rCZu
	qyGdCOLnJJSkJMUZvoERxOPJVrIRxGI39hMXlsPd2qcJJaFf28MWMA6nIyfEd0CXNK+xVdgAeF00E
	WxtVyZrINF4ziYzo4u9OoSR64jdTaE4BO1I8yYnNFbMNGkHrEPgf0QXQRumrnal+LuO/Zy0DP6uTZ
	7w8AN+GJOONVgn5V7Eqn4BrUU5wGNSouFQ2vocEfgzfnauu9be1+Xpd7JrqBZsHoNRWY/9t+WCUWq
	mE9YVz+rSw/Oej0AKdnyvEPZYuwM0HFHD7M0Rw836LTIlJ2mUt/pvDybuK9dv/ulAGsIBFpHFHGAO
	eIn2/w+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p05aE-00Arse-3E; Tue, 29 Nov 2022 18:43:54 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p05aB-00ArrL-6d
	for linux-riscv@lists.infradead.org; Tue, 29 Nov 2022 18:43:52 +0000
Received: by mail-pj1-x102c.google.com with SMTP id w15-20020a17090a380f00b0021873113cb4so14368384pjb.0
        for <linux-riscv@lists.infradead.org>; Tue, 29 Nov 2022 10:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IIP9oJ9P+APqb6Nuc1oFCXi9Ku92JtxYoKl2iytzunU=;
        b=q3vblXcbmKuJHwVKfmwgfjy9/h4v0009YQb+0/FuwZ3Iz1csn6IZnsw5WdOAK6Bu+s
         lIsdvWmKpPYbHoqKvFZXyVqvjv1uy74XWP8+h1ZCm+EgJYF3Nw/b000sk+ErQNOyW+16
         N9nqb0EChxhay9SNzmCT53O0LKeIHgWshnVZH6cHxYm1s3qlsSJWYnBM8RAw5d6K+lja
         wYA/EX6BkBs0tJrwy69C64qsAQJgHNE936RwiiRtC/dsOQ9XDSuQfxkzSoAfxSnzoCvB
         vvWyI20zoJNU0tu6q2KvDXH8CS4tEH+/qWYMLrSoZKZWS0mc1E+GwOHwvaRxj6+bmhpO
         dwIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IIP9oJ9P+APqb6Nuc1oFCXi9Ku92JtxYoKl2iytzunU=;
        b=WrX8K6YbIeOddcxDskXDzuJ/28tfAJF/USR11S97s1qbbCUUavZvAr46lCZ7Eid5Td
         EaiIbACHQY0TDNV64wozCqEBPfPwTidLPO96uDg4IQUz3QO5pBBFjgzEmAyZ/VlU1kn/
         kO2t3w2hdIeiced3Yx8frGXh4SjJqG7eMr8zxmfW7aAEvdgT4clQtysjRcpMpfIMi+iY
         7eazSnkGrF8o+SW4R8AmcjxNromKGdKnlDFr+Mze8sGY6dPBSkNbqdn6ZqSzNYRcrH7A
         D5LXzgHjsKAdU7c+fVj4CIXO+DCGY1wd1NDFjgQzxZyN9GSae6Wmv2gFKp/lA9dAAYAU
         rvug==
X-Gm-Message-State: ANoB5pkmpKrinR75rSDlcGRPKaj5a7eopwP0XBhjP7BZcAXFeYcq87ps
	CymOgCoy365JsdPU8mLLWwukGg==
X-Google-Smtp-Source: AA0mqf4IeSQwsDl+1u45CxVm1HfRMtXFY7QhkodjxiwdD7ipkX2OKjUhJJbujpe8qWB0ItynPWazag==
X-Received: by 2002:a17:902:7443:b0:189:82da:7b70 with SMTP id e3-20020a170902744300b0018982da7b70mr13878354plt.159.1669747429462;
        Tue, 29 Nov 2022 10:43:49 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id u11-20020a170902e80b00b001743ba85d39sm11243785plg.110.2022.11.29.10.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 10:43:48 -0800 (PST)
Date: Tue, 29 Nov 2022 10:43:48 -0800 (PST)
X-Google-Original-Date: Tue, 29 Nov 2022 10:43:38 PST (-0800)
Subject: Re: [PATCH v4 3/3] clocksource: timer-riscv: Set CLOCK_EVT_FEAT_C3STOP based on DT
In-Reply-To: <CAK9=C2VtgCOk9S_FucJbwsG+nMuBqEsFk3sAMt7_doAKsMHQ8w@mail.gmail.com>
CC: Conor Dooley <conor@kernel.org>, anup@brainfault.org,
  Conor Dooley <conor.dooley@microchip.com>, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
  Paul Walmsley <paul.walmsley@sifive.com>, daniel.lezcano@linaro.org, tglx@linutronix.de, ajones@ventanamicro.com,
  atishp@atishpatra.org, samuel@sholland.org, devicetree@vger.kernel.org,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: apatel@ventanamicro.com
Message-ID: <mhng-7ff4d7f4-bbf5-45bf-b4c5-30bc2a53119c@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_104351_263967_798B8635 
X-CRM114-Status: GOOD (  40.14  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 29 Nov 2022 09:22:22 PST (-0800), apatel@ventanamicro.com wrote:
> On Tue, Nov 29, 2022 at 10:47 PM Conor Dooley <conor@kernel.org> wrote:
>>
>> On Tue, Nov 29, 2022 at 10:41:09PM +0530, Anup Patel wrote:
>> > On Tue, Nov 29, 2022 at 8:06 PM Conor Dooley <conor.dooley@microchip.com> wrote:
>> > >
>> > > On Tue, Nov 29, 2022 at 07:33:13PM +0530, Anup Patel wrote:
>> > > > We should set CLOCK_EVT_FEAT_C3STOP for a clock_event_device only
>> > > > when riscv,timer-cant-wake-up DT property is present in the RISC-V
>> > > > timer DT node.
>> > > >
>> > > > This way CLOCK_EVT_FEAT_C3STOP feature is set for clock_event_device
>> > > > based on RISC-V platform capabilities rather than having it set for
>> > > > all RISC-V platforms.
>> > > >
>> > > > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
>> > >
>> > > I thought I had left an R-b on this one?
>> > > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>> > >
>> > > Also, I think that we need to backport *something* that disables C3STOP
>> > > which is why I had suggested keeping the revert in place.
>> > > Patch 1 of this series only solves the timer issues but does not restore
>> > > sleep states to their prior behaviour, right?
>> > > Either this patch or the revert needs to go to stable IMO.
>> >
>> > Since it works for you with the C3STOP set and broadcast timer enabled,
>> > we can directly go with this patch. I am fine including the revert as well.
>>
>> I don't mind which gets backported. To me, this one is preferable as it
>> is more "complete" but it is a bit on the new feature side of things,
>> no?
>>
>> Whoever applies it can decide, and I'll backport the revert if they
>> decide that this patch is not stable material :)

IIRC the clock folks took the original C3 patch, so that's probably the 
best way to take these as well?

>>
>> Thanks again for helping sort this mess out, I see it helped with your
>> IPI series too!
>
> Yes, I was surprised to see that it helped the IPI series as well.
> Thanks for your patch.
>
> Regards,
> Anup
>
>>
>> Conor.
>>
>> > > > ---
>> > > >  drivers/clocksource/timer-riscv.c | 12 +++++++++++-
>> > > >  1 file changed, 11 insertions(+), 1 deletion(-)
>> > > >
>> > > > diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
>> > > > index 969a552da8d2..0c8bdd168a45 100644
>> > > > --- a/drivers/clocksource/timer-riscv.c
>> > > > +++ b/drivers/clocksource/timer-riscv.c
>> > > > @@ -28,6 +28,7 @@
>> > > >  #include <asm/timex.h>
>> > > >
>> > > >  static DEFINE_STATIC_KEY_FALSE(riscv_sstc_available);
>> > > > +static bool riscv_timer_cant_wake_cpu;
>> > > >
>> > > >  static int riscv_clock_next_event(unsigned long delta,
>> > > >               struct clock_event_device *ce)
>> > > > @@ -51,7 +52,7 @@ static int riscv_clock_next_event(unsigned long delta,
>> > > >  static unsigned int riscv_clock_event_irq;
>> > > >  static DEFINE_PER_CPU(struct clock_event_device, riscv_clock_event) = {
>> > > >       .name                   = "riscv_timer_clockevent",
>> > > > -     .features               = CLOCK_EVT_FEAT_ONESHOT | CLOCK_EVT_FEAT_C3STOP,
>> > > > +     .features               = CLOCK_EVT_FEAT_ONESHOT,
>> > > >       .rating                 = 100,
>> > > >       .set_next_event         = riscv_clock_next_event,
>> > > >  };
>> > > > @@ -85,6 +86,8 @@ static int riscv_timer_starting_cpu(unsigned int cpu)
>> > > >
>> > > >       ce->cpumask = cpumask_of(cpu);
>> > > >       ce->irq = riscv_clock_event_irq;
>> > > > +     if (riscv_timer_cant_wake_cpu)
>> > > > +             ce->features |= CLOCK_EVT_FEAT_C3STOP;
>> > > >       clockevents_config_and_register(ce, riscv_timebase, 100, 0x7fffffff);
>> > > >
>> > > >       enable_percpu_irq(riscv_clock_event_irq,
>> > > > @@ -139,6 +142,13 @@ static int __init riscv_timer_init_dt(struct device_node *n)
>> > > >       if (cpuid != smp_processor_id())
>> > > >               return 0;
>> > > >
>> > > > +     child = of_find_compatible_node(NULL, NULL, "riscv,timer");
>> > > > +     if (child) {
>> > > > +             riscv_timer_cant_wake_cpu = of_property_read_bool(child,
>> > > > +                                             "riscv,timer-cant-wake-cpu");
>> > > > +             of_node_put(child);
>> > > > +     }
>> > > > +
>> > > >       domain = NULL;
>> > > >       child = of_get_compatible_child(n, "riscv,cpu-intc");
>> > > >       if (!child) {
>> > > > --
>> > > > 2.34.1
>> > > >

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
