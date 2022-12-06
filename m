Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E812C3A5A7
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Dec 2022 22:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mLOmgofFTlTWeL29KCiGadvM9T2nVIseBLqE7XYyVD4=; b=w1CW6LBqFQ7mqz
	Tr9a16j/3327MGevtfQfDVtWEeByULJnUaGDKUaEZjlfP013nBf6cuIy4/I42bMwoo4iqtvnm+PWk
	fijgkln+ukp3x7q2iHgEW+dUxqplioYwk90IcSYdcfMM+F3mcIXIvaF5NQaRHdT+2i4JED18oM6j3
	3SE/S/IubXMgp4sfX/bnRkBC1Dj28ww++FnZQ5Uze80UZYysdu3a59ZG2tVX/72wGpTemuh+4K7sS
	40fk0xIbGaK/Rof7knMBl+eYY5iyz7tAYXkq0XBIWm4KgpoVpMn2PG5/sexDmBDv5hbX5ESxX3OUF
	wPTIckf3+Yad2x3WynQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2g2A-003hgA-8j; Tue, 06 Dec 2022 22:03:26 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2g27-003hIj-QC
	for linux-riscv@lists.infradead.org; Tue, 06 Dec 2022 22:03:25 +0000
Received: by mail-ej1-x62a.google.com with SMTP id qk9so9719843ejc.3
        for <linux-riscv@lists.infradead.org>; Tue, 06 Dec 2022 14:03:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1yIUVOdh+m3Dcu9OS+dIGaj9snCyPCPz+jQsInm3lVA=;
        b=fj+mMyzKgo1mb4RVbihyunopfeH48INBzqzhUoAqeUand973K6fikqQ/4UY4BIshIz
         BPSc2GE6YHZ9vmTlXVW/lLmbNN9LLuOX2mNUP1sPzMEja1GNI7qoudEilbfpKbL2fUTW
         yGgNax8Im6VcKpDsJW/kt2U64HTaQ0hEwi7npvxfpk6QEraQuPK4g2wHdZ2n5BHKSz9v
         WEdMsKqqGi7YcSFXhO7ckyc/9Hh3fAU/jtHQTzjh7bsp52AbLK7Xda+XXI03SFuZj+ic
         3ho4DpdfmtuCixZ6NLsWYjAlXbKiUF3A1OR9/E+DW/LtHnGorpVoK/5NxfrYk10OjfAE
         ZNxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1yIUVOdh+m3Dcu9OS+dIGaj9snCyPCPz+jQsInm3lVA=;
        b=zMauN1dizeR4hDy5utaZKXEza8+hSJXx//4upJEwNkDSFs2Hn0UK5WQooytb5wbvTX
         0WdzUbDau7VNQGb/B1RSESsAJoFb2FcXSe9kGM8l0xBqf6VmIxF7fSMwSbL1hLg0zZ2g
         ZLLh+L9QoyOTOJdPlWrHYpW8OGkLiUY4iUytdkb+T3BY00IXsIuck+Mex0kNBDlqgwsu
         a+vPC30XmdMpAbPWPPGaAMi5BTq409SBVQmRnjwcXZHZvUyovhH6fa5wJt7FPcVxoK1R
         5fI9PQ865mrBMvKLxPjQtBV7uho4WbeLaO1OWVJxGnYxD1ZE2lDJrgA0sluubTlVEOzc
         4kKw==
X-Gm-Message-State: ANoB5pkTo0BsPXuskDoxnu9T9ueNxXy+khl4tBLIiEGXaC3E3V9t0e4R
	Tw9S6mIwAFzoJDRjqmjPGPPF6H9DanqGQZfr8Z0=
X-Google-Smtp-Source: AA0mqf5GVsDkQt6G7Fo6+AxKAVUtqu8r2WD58xz9D2NRSSDU48e1GdP+G1fa5IRFLAvU1tEuXTVuWRgbkn9T8CXHFsM=
X-Received: by 2002:a17:906:2793:b0:7c1:174f:d69 with SMTP id
 j19-20020a170906279300b007c1174f0d69mr2191990ejc.447.1670364196158; Tue, 06
 Dec 2022 14:03:16 -0800 (PST)
MIME-Version: 1.0
References: <20221201123954.1111603-1-apatel@ventanamicro.com>
 <20221201123954.1111603-4-apatel@ventanamicro.com> <20221202000603.GA1720201-robh@kernel.org>
 <CAK9=C2VbM+CP0Y9Xx-SM9O4TFrQmOKvVWy-u5mxdPxrhacK4JQ@mail.gmail.com> <Y40ueQiTZK6hi7RS@spud>
In-Reply-To: <Y40ueQiTZK6hi7RS@spud>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 6 Dec 2022 22:02:49 +0000
Message-ID: <CA+V-a8vvS+0H8vv9AnifMzSoBMiOj3g4XBXcMjo-jcD__CaNCQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] clocksource: timer-riscv: Set CLOCK_EVT_FEAT_C3STOP
 based on DT
To: Conor Dooley <conor@kernel.org>
Cc: Anup Patel <apatel@ventanamicro.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Andrew Jones <ajones@ventanamicro.com>, 
	Atish Patra <atishp@atishpatra.org>, Samuel Holland <samuel@sholland.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Anup Patel <anup@brainfault.org>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_140323_877313_D70F170C 
X-CRM114-Status: GOOD (  38.45  )
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

Hi Conor,

On Sun, Dec 4, 2022 at 11:34 PM Conor Dooley <conor@kernel.org> wrote:
>
> Hey Rob, Anup, Prabhakar,
>
> On Fri, Dec 02, 2022 at 12:03:05PM +0530, Anup Patel wrote:
> > On Fri, Dec 2, 2022 at 5:36 AM Rob Herring <robh@kernel.org> wrote:
> > >
> > > On Thu, Dec 01, 2022 at 06:09:54PM +0530, Anup Patel wrote:
> > > > We should set CLOCK_EVT_FEAT_C3STOP for a clock_event_device only
> > > > when riscv,timer-cannot-wake-cpu DT property is present in the RISC-V
> > > > timer DT node.
> > > >
> > > > This way CLOCK_EVT_FEAT_C3STOP feature is set for clock_event_device
> > > > based on RISC-V platform capabilities rather than having it set for
> > > > all RISC-V platforms.
> > > >
> > > > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > > > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > > > Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> > > > ---
> > > >  drivers/clocksource/timer-riscv.c | 12 +++++++++++-
> > > >  1 file changed, 11 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
> > > > index 969a552da8d2..1b4b36df5484 100644
> > > > --- a/drivers/clocksource/timer-riscv.c
> > > > +++ b/drivers/clocksource/timer-riscv.c
> > > > @@ -28,6 +28,7 @@
> > > >  #include <asm/timex.h>
> > > >
> > > >  static DEFINE_STATIC_KEY_FALSE(riscv_sstc_available);
> > > > +static bool riscv_timer_cannot_wake_cpu;
> > > >
> > > >  static int riscv_clock_next_event(unsigned long delta,
> > > >               struct clock_event_device *ce)
> > > > @@ -51,7 +52,7 @@ static int riscv_clock_next_event(unsigned long delta,
> > > >  static unsigned int riscv_clock_event_irq;
> > > >  static DEFINE_PER_CPU(struct clock_event_device, riscv_clock_event) = {
> > > >       .name                   = "riscv_timer_clockevent",
> > > > -     .features               = CLOCK_EVT_FEAT_ONESHOT | CLOCK_EVT_FEAT_C3STOP,
> > > > +     .features               = CLOCK_EVT_FEAT_ONESHOT,
> > >
> > > A platform that depended on CLOCK_EVT_FEAT_C3STOP being set will break
> > > with this change because its existing DT will not have the new property.
> > >
> > > It needs to be the other way around which would effectively be the
> > > existing 'always-on' property.
> >
> > There are no RISC-V platforms using C3STOP. The patch which
> > added C3STOP has been reverted.
> > (Refer, https://lore.kernel.org/lkml/a218ebf8-0fba-168d-6598-c970bbff5faf@sholland.org/T/)
> >
> > I just need to rebase this patch upon the C3STOP revert patch.
>
> I guess you could say that the C3STOP addition was done spec-ulatively*,
> as the platform that actually exhibits that behaviour does not use the
> riscv-timer & its maintainer acked the revert (allwinner d1 family).
>
> *The spec does not make any guarantees about whether events arrive
> during suspend, only the behaviour *if* they arrive.
>
> Switching the property to "always-on" would require retrofitting that
> property to every other existing platform (and therefore regressing some
> behaviour there, no?).
>
> Most of the existing platforms are "toys" or demo platforms though, so
> it would not, I guess, be the end of the world to do so. Doubly so since
> none of them actually implement any sleep states that making it an
> "always-on" property.
>
> I've said since the start that defaulting to C3STOP is the "safer" thing
> to do, and although we disagreed on this last time Anup, I think the
> better outcome of someone missing a DT property is inaccessible sleep
> states rather than going into sleep states they cannot get out of.
>
> For PolarFire SoC, which I guess is one of the few "commerical"
> platforms, I'd be willing to accept retrofitting, since we have not yet
> implemented such sleep states yet.
>
> Maybe Prabhakar knows whether the RZ/Five has either a) implemented
> sleep states and b) which side of the "timer events arrive in suspend"
> divide their platform lies on.
> I'm particular interested here since that is not a SiFive core complex.
>
On RZ/Five we haven't implemented the sleep states yet.

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
