Return-Path: <SRS0=D0Wr=CO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22F83C43461
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Sep 2020 03:45:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56184207EA
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Sep 2020 03:45:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P8pOqUWQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="Q4g4Anwu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56184207EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Jlk7D+pXBii0TZ19S7ihvfX8sbHspG4xAHZiuZLqrCw=; b=P8pOqUWQFMfv+ckC751/TLs2o
	OvivZ76rOOXvh1q22J/BfilWRKOZCKKADoJ5Qr6/gngzxBPXDfrVn8J3A65jdOLpOQ3S8xtlmvEO4
	j7haSBFfjJlGteCWBAn1b5lpMXPbcNIJI8nMwkqU3akbKMvOtrdqzr3gIxL/iqgPK3u+k6nFx96S9
	/GYdoyHlc7XjF1TGPB0fCbTNNU6RlVnu7uZs83veD58jirALqTnrP3f4EaIG6ZAgH/0B74SJk+BDJ
	EanBSVyyDBrnoA/oXZZpQpSURKjQgNDQd892XqgBvlVV6TdotSFkobAJKc2hPKcsmgtvVS19XC0iF
	/taK3qtJw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kEP8Y-0002po-B3; Sat, 05 Sep 2020 03:45:10 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kEP8V-0002pM-GX
 for linux-riscv@lists.infradead.org; Sat, 05 Sep 2020 03:45:08 +0000
Received: by mail-wr1-x442.google.com with SMTP id w5so9316817wrp.8
 for <linux-riscv@lists.infradead.org>; Fri, 04 Sep 2020 20:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JC2NfWX3wM+XvrLcXheEuYy0dMjiSLIKe0Uu5qVup6s=;
 b=Q4g4AnwuYG0us9KR0TOPAdz0UGoDzJuJJlYWkJrRros5dyrSXDIUWeek0CFRn03Kpq
 tU7hPiCx29jyFR4d8iNh7M8uepR7YizDm0L88qzbgcAzurpqlE1vNaKVTIKPc2Vcpvwp
 IDMSMsn4fpCRpIHBXGnKppgA/PTALrtOzDnprTAsBNfej6akHe2Qpr2Emz1OwTvw7viN
 Cy9lFVCdzpFoGkEbv8SyepAb2T0pYxYZXLm3FNDj151afc6MTPn1tjV4+4w5EEBH9CFh
 V04IlPey40Iv9Ht9T95cft7oZqGzy2khXAJ684vtWrTUKQpm82e7kV/Foeu5SFtC6aVa
 0I4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JC2NfWX3wM+XvrLcXheEuYy0dMjiSLIKe0Uu5qVup6s=;
 b=aDYxE1RmXkUVovqu6CdI/3R2AhpBwb2ZDlrKxbqCsY25qfQdjeDnwmgUhu/8okEy33
 +6NufyWCCM+xQRK4vyrTYLtXqXNTb9RpQsvlL1UCZbYnJGYPpUvZbr3BnP55MQZp/l5/
 JsWXemStxI+8nBr+BFkFmNKM0uRlS7kmQoiytdR8uP04bwW1bop8BJD4Bon6CRExK+rd
 JUcPUoKlUEM53HxhUNv2y5fFn8rYyPSIoyc0+rLRGjJx8Ln2AxvlttAiddcr5daGYXlK
 c1uNu4G9BWp3j6EKmPttoPkTYm17I2msGrpkXjv44Qq0shPMAw9pW/IeyHX0DvUyPyXe
 gcnw==
X-Gm-Message-State: AOAM530AM/Xp1V1U//VoVPupiamBVZmMhQQvDMvxh6o4wv7eQPr9061N
 keXt7BRs8pqTzOanwz4Bz+mp3bUgKYX6qpSXkJOK+g==
X-Google-Smtp-Source: ABdhPJyoM0sXDPtLbfcI3Sf4tEtx4UN05GZMzrC4OXrzAUDDnR5DL4dSb1z1I1fbtt9J+KkKsYq8MnxjmPI5fTuwChc=
X-Received: by 2002:a5d:674c:: with SMTP id l12mr10297980wrw.325.1599277502661; 
 Fri, 04 Sep 2020 20:45:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200904165709.GA32667@lst.de>
 <mhng-5249e999-3e82-417d-8d39-dcb4a159bd83@palmerdabbelt-glaptop1>
In-Reply-To: <mhng-5249e999-3e82-417d-8d39-dcb4a159bd83@palmerdabbelt-glaptop1>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 5 Sep 2020 09:14:50 +0530
Message-ID: <CAAhSdy0HW8Rjyoiu+Ldx31C9zCBdxJZxhDBcXC4sgitfXnPNDg@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Allow drivers to provide custom read_cycles64 for
 M-mode kernel
To: Palmer Dabbelt <palmerdabbelt@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200904_234507_652906_E3D910DB 
X-CRM114-Status: GOOD (  49.85  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <Atish.Patra@wdc.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Sep 5, 2020 at 6:47 AM Palmer Dabbelt <palmerdabbelt@google.com> wrote:
>
> On Fri, 04 Sep 2020 09:57:09 PDT (-0700), Christoph Hellwig wrote:
> > On Fri, Sep 04, 2020 at 10:13:18PM +0530, Anup Patel wrote:
> >> I respectfully disagree. IMHO, the previous code made the RISC-V
> >> timer driver convoluted (both SBI call and CLINT in one place) and
> >> mandated CLINT for NoMMU kernel. In fact, RISC-V spec does not
> >> mandate CLINT or PLIC. The RISC-V SOC vendors are free to
> >> implement their own timer device, IPI device and interrupt controller.
> >
> > Yes, exactly what we need is everyone coming up with another stupid
> > non-standard timer and irq driver.
>
> Well, we don't have a standard one so there's really no way around people
> coming up with their own.  It doesn't seem reasonable to just say "SiFive's
> driver landed first, so we will accept no other timer drivers for RISC-V
> systems".

I share the same views here.

In ARM 32bit world (arch/arm/), we have the same problem with no standard
timer device, IPI device, and interrupt controller. The ARM GICv2/GICv3 and
ARM Generic Timers were standardized very late in the ARM world so by that
time we had lots of custom timers and interrupt controllers. All these ARM
timer and interrupt controller drivers are now part of drivers/clocksource and
drivers/irqchip.

The ARM 32bit world has following indirections available to drivers:
1. set_smp_cross_call() in asm/smp.h for IPI injection
    (We have riscv_set_ipi_ops() in asm/smp.h)
2. register_current_timer_delay() in asm/delay.h
    (My patch is proposing riscv_set_read_cycles64() in asm/timex.h)

For RISC-V S-mode (MMU) kernel, we are using SBI calls for IPIs and
"TIME CSR + SBI calls" (i.e. RISC-V timer) as timer device which simplifies
things for regular S-mode kernel.

For RISC-V M-mode (NoMMU) kernel, we don't have any SBI provider
so we end-up having separate drivers for timer device, and IPI device
which is similar to ARM 32bit world.

>
> > But the point is this crap came in after -rc1, and it adds totally
> > pointless indirect calls to the IPI path, and with your "fix" also
> > to get_cycles which all have exactly one implementation for MMU or
> > NOMMU kernels.
> >
> > So the only sensible thing is to revert all this crap.  And if at some
> > point we actually have to deal with different implementations do it
> > with alternatives or static_branch infrastructure so that we don't
> > pay the price for indirect calls in the super hot path.
>
> I'm OK reverting the dynamic stuff, as I can buy it needs more time to bake,
> but I'm not sure performance is the right argument -- while this is adding an
> indirection, decoupling MMU/NOMMU from the timer driver is the first step
> towards getting rid of the traps which are a way bigger performance issue than
> the indirection (not to mention the issue of relying on instructions that don't
> technically exist in the ISA we're relying on any more).
>
> I'm not really convinced the timers are on such a hot path that an extra load
> is that bad, but I don't have that much experience with this stuff so you may
> be right.  I'd prefer to keep the driver separate, though, and just bring back
> the direct CLINT implementation in timex.h -- we've only got one implementation
> for now anyway, so it doesn't seem that bad to just inline it (and I suppose I
> could buy that the ISA says this register has to behave this way, though I
> don't think that's all that strong of an argument).
>
> I'm not convinced this is a big performance hit for IPIs either, but we could
> just do the same thing over there -- though I guess I'd be much less convinced
> about any arguments as to the ISA having a say in that as IIRC it's a lot more
> hands off.
>
> Something like this seems to fix the rdtime issue without any extra overhead,
> but I haven't tested it

I had initially thought about directly doing MMIO in asm/timex.h.

Your patch is CLINT specific because it assumes a 64bit MMIO register which
is always counting upwards. This will break if we have downard counting timer
on some SOC. It will also break if some SOC has implementation specific CSR
for reading cycles.

I am fine with your patch if you can address the above mentioned issue.

>
> diff --git a/arch/riscv/include/asm/clint.h b/arch/riscv/include/asm/clint.h
> new file mode 100644
> index 000000000000..51909ab60ad0
> --- /dev/null
> +++ b/arch/riscv/include/asm/clint.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2020 Google, Inc
> + */
> +
> +#ifndef _ASM_RISCV_CLINT_H
> +#define _ASM_RISCV_CLINT_H
> +
> +#include <linux/types.h>
> +#include <asm/mmio.h>
> +
> +#ifdef CONFIG_RISCV_M_MODE
> +/*
> + * This lives in the CLINT driver, but is accessed directly by timex.h to avoid
> + * any overhead when accessing the MMIO timer.
> + */
> +extern u64 __iomem *clint_time_val;
> +#endif
> +
> +#endif
> diff --git a/arch/riscv/include/asm/timex.h b/arch/riscv/include/asm/timex.h
> index a3fb85d505d4..7f659dda0032 100644
> --- a/arch/riscv/include/asm/timex.h
> +++ b/arch/riscv/include/asm/timex.h
> @@ -10,6 +10,31 @@
>
>  typedef unsigned long cycles_t;
>
> +#ifdef CONFIG_RISCV_M_MODE
> +
> +#include <asm/clint.h>
> +
> +#ifdef CONFIG_64BIT
> +static inline cycles_t get_cycles(void)
> +{
> +       return readq_relaxed(clint_time_val);
> +}
> +#else /* !CONFIG_64BIT */
> +static inline u32 get_cycles(void)
> +{
> +       return readl_relaxed(((u32 *)clint_time_val));
> +}
> +#define get_cycles get_cycles
> +
> +static inline u32 get_cycles_hi(void)
> +{
> +       return readl_relaxed(((u32 *)clint_time_val) + 1);
> +}
> +#define get_cycles_hi get_cycles_hi
> +#endif /* CONFIG_64BIT */
> +
> +#else /* CONFIG_RISCV_M_MODE */
> +
>  static inline cycles_t get_cycles(void)
>  {
>         return csr_read(CSR_TIME);
> @@ -41,6 +66,8 @@ static inline u64 get_cycles64(void)
>  }
>  #endif /* CONFIG_64BIT */
>
> +#endif /* !CONFIG_RISCV_M_MODE */
> +
>  #define ARCH_HAS_READ_CURRENT_TIMER
>  static inline int read_current_timer(unsigned long *timer_val)
>  {
> diff --git a/drivers/clocksource/timer-clint.c b/drivers/clocksource/timer-clint.c
> index 8eeafa82c03d..43ae0f885bfa 100644
> --- a/drivers/clocksource/timer-clint.c
> +++ b/drivers/clocksource/timer-clint.c
> @@ -19,6 +19,11 @@
>  #include <linux/interrupt.h>
>  #include <linux/of_irq.h>
>  #include <linux/smp.h>
> +#include <linux/timex.h>
> +
> +#ifndef CONFIG_MMU
> +#include <asm/clint.h>
> +#endif
>
>  #define CLINT_IPI_OFF          0
>  #define CLINT_TIMER_CMP_OFF    0x4000
> @@ -31,6 +36,10 @@ static u64 __iomem *clint_timer_val;
>  static unsigned long clint_timer_freq;
>  static unsigned int clint_timer_irq;
>
> +#ifdef CONFIG_RISCV_M_MODE
> +u64 __iomem *clint_time_val;
> +#endif
> +
>  static void clint_send_ipi(const struct cpumask *target)
>  {
>         unsigned int cpu;
> @@ -184,6 +193,14 @@ static int __init clint_timer_init_dt(struct device_node *np)
>         clint_timer_val = base + CLINT_TIMER_VAL_OFF;
>         clint_timer_freq = riscv_timebase;
>
> +#ifdef CONFIG_RISCV_M_MODE
> +       /*
> +        * Yes, that's an odd naming scheme.  time_val is public, but hopefully
> +        * will die in favor of something cleaner.
> +        */
> +       clint_time_val = clint_timer_val;
> +#endif
> +
>         pr_info("%pOFP: timer running at %ld Hz\n", np, clint_timer_freq);
>
>         rc = clocksource_register_hz(&clint_clocksource, clint_timer_freq);
>

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
