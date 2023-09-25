Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BB0ACE7A81
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 12:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ppZ3g31O2Hnog2ZAZEjkEDW7tagcnjcEYOzEW79Ae5o=; b=2vQ2Q35LHqw1bS
	VcyPeJY/9iMn6dBmAJiQXKKhWjcdh4Lqbm0biQfKnFLKuinpPwh/i99bqtq+fpGgfdsk30dEiilWG
	4osjucqceJ4vgrO9/ndN39BLf/pj0yYTBJSgHZB1ATTJxhoMJRI9Sj/ccHIRPSZBiWP+m36bVtvNg
	E6bAJAp8bz49TJPgNumgWPL3hmhPI5/hRBv2cytIDY9khBrspxbqIIab6MvxOoAaVssS0iDWPWj7J
	IBh2545x5H2qTWBuXU1S/z0dUas5GsEGkA28KtsKSyKXEqAFcIOlU2S8g867WubF0DM8ytgGGRudt
	UBYvwQoYyfm3ML8DdM9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkkM8-00EDb2-09;
	Mon, 25 Sep 2023 12:06:28 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkkM2-00EDYp-38
	for linux-riscv@lists.infradead.org;
	Mon, 25 Sep 2023 12:06:24 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-578b4981526so3658867a12.0
        for <linux-riscv@lists.infradead.org>; Mon, 25 Sep 2023 05:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695643582; x=1696248382; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=B+U6aD5x/VGpbdQ+U4y+MwY0gu5QAzijgLSvIiCbWdI=;
        b=PgNjoyHkJEYME8kBQAeGntahbTKzRbUUDD7Sv2ThjkJJwUROcseoPAjEfgMOKXL9E9
         PWbcVXBcEg31TRtWAmMJqDB0/YHQakNxmwtnLi+Z5BgAoDMgq/k/GlUXxWKRNOsBQ/s+
         3pGHUwLm/Gf/9OPZZYLJpqpLcvthPnPPXFJqMKTzzohpg9cE7CFBvTSVhFVmGkX+a92s
         4CZ2nQzZQsh3rWH/gucCOmsadIvk7S+rulf/iEQgvzEyqVWO9Y40W47C+EQT3OUGzRcp
         mNPHcUGIIAdH/d1Z+0S04J+WBsk8+LZBN9bPvPFQyuIVfAmZuETrUkGEni82ZFcc2aPh
         i9xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695643582; x=1696248382;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B+U6aD5x/VGpbdQ+U4y+MwY0gu5QAzijgLSvIiCbWdI=;
        b=xM6MHqLcPRU7V4CHyCu+iR/L3kE4ekolLyVUixT/kXg5iAJPdQAkSPQoxMzY9UJZx2
         XFpz3wZl9bnbqJ59v8W5CfZM6hCyhIADQN0J61dFalai0EdDoHkQ4V56srzdN74Z7z3z
         0OWi+Edddt++sIxcaia53at1rMHuylJREXlXrC/FBVY3xz9CoYq552fh+uG8N6HkY3dB
         G2fn3ma5wSZaHx1w1DonT4hvr6DFQagaOXqOUvCT0LDRH5hI5m1JmsAZZQNx8Ymc2yU3
         YIZQUZLMv7Wvqy1R7/ZvsPN4s5kec87JqM1/lR61HKxz17EY9tbSkUjWClYTOq03VQ71
         uofw==
X-Gm-Message-State: AOJu0Yw6agdA/JNze0WhtyrObc2yubn0ByA6DwUUShpkHq2sMT0j1OGu
	YCtP5QvENQXMGVDjTLFmlBI/yScubcoQ9fCsVd3+rg==
X-Google-Smtp-Source: AGHT+IF00Q7WAgbYXTduPsXYR+4Ir2vd7dif5dbXa6HjTMAbxFAfyV8XpwzQDXVHZ161+wFToPCdOAjQP0LAVXM8BRc=
X-Received: by 2002:a17:90a:c692:b0:274:111c:c14d with SMTP id
 n18-20020a17090ac69200b00274111cc14dmr3887972pjt.13.1695643581678; Mon, 25
 Sep 2023 05:06:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230901130312.247719-1-vincent.guittot@linaro.org>
 <20230901130312.247719-3-vincent.guittot@linaro.org> <ZQwGHBGg9B8SjzeS@arm.com>
In-Reply-To: <ZQwGHBGg9B8SjzeS@arm.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Mon, 25 Sep 2023 14:06:10 +0200
Message-ID: <CAKfTPtDbH94S74ok6SQGHC29dnZfmRfHG+N+j_p-moguTY2T-A@mail.gmail.com>
Subject: Re: [PATCH 2/4] topology: add a new arch_scale_freq_reference
To: Ionela Voinescu <ionela.voinescu@arm.com>
Cc: linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	sudeep.holla@arm.com, gregkh@linuxfoundation.org, rafael@kernel.org, 
	mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, bristot@redhat.com, vschneid@redhat.com, 
	viresh.kumar@linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-pm@vger.kernel.org, conor.dooley@microchip.com, suagrfillet@gmail.com, 
	ajones@ventanamicro.com, lftan@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_050623_067374_CD190579 
X-CRM114-Status: GOOD (  41.11  )
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

On Thu, 21 Sept 2023 at 11:00, Ionela Voinescu <ionela.voinescu@arm.com> wrote:
>
> Hi Vincent,
>
> On Friday 01 Sep 2023 at 15:03:10 (+0200), Vincent Guittot wrote:
> > Create a new method to get a unique and fixed max frequency. Currently
> > cpuinfo.max_freq or last item of performance domain are used as the max
> > frequency when computing the frequency for a level of utilization but:
> > - cpuinfo_max_freq can change at runtime. boost is one example of
> >   such change.
> > - cpuinfo.max_freq and last item of the PD can be different leading to
> >   different results betwen cpufreq and energy model.
> >
> > We need to save the max frequency that has been used when computing the
> > CPUs capacity and use this fixed and coherent value to convert between
> > frequency and CPU's capacity.
> >
> > In fact, we already save the frequency that has been used when computing
> > the capacity of each CPU. We extend the precision to save khZ instead of
> > Mhz currently and we modify the type to be aligned with other variables
> > used when converting frequency to capacity and the other way.
> >
> > Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> > ---
> >  arch/arm/include/asm/topology.h   | 1 +
> >  arch/arm64/include/asm/topology.h | 1 +
> >  arch/riscv/include/asm/topology.h | 1 +
> >  drivers/base/arch_topology.c      | 9 +++------
> >  include/linux/arch_topology.h     | 7 +++++++
> >  5 files changed, 13 insertions(+), 6 deletions(-)
> >
> > diff --git a/arch/arm/include/asm/topology.h b/arch/arm/include/asm/topology.h
> > index c7d2510e5a78..853c4f81ba4a 100644
> > --- a/arch/arm/include/asm/topology.h
> > +++ b/arch/arm/include/asm/topology.h
> > @@ -13,6 +13,7 @@
> >  #define arch_set_freq_scale topology_set_freq_scale
> >  #define arch_scale_freq_capacity topology_get_freq_scale
> >  #define arch_scale_freq_invariant topology_scale_freq_invariant
> > +#define arch_scale_freq_ref topology_get_freq_ref
>
> The "reference" frequency or performance of a CPU has a specific meaning
> in the ACPI specification as a fixed frequency of a constant clock and its
> associated performance level, usually used for performance to frequency
> conversions. This is not guaranteed to be the maximum
> performance/frequency and it's definitely not the case for arm systems
> where this is tied to the system timer - 1-50Mhz.
>
> So I believe it might create some confusion to call this "reference"
> frequency.
>
> Any reason for not calling it arch_scale_freq_max? I know not all max
> frequencies are equal :) but it would still drive the point that this is
> intended to act as a chosen maximum for the scheduler's use, especially
> if there's a well place comment.

I don't like max_freq because most will assume this is the cpufreq max
value whereas this value is the actual frequency that has been used as
a reference for computing the cpu capacity and should be used as the
reference for any further computation

>
> >  #endif
> >
> >  /* Replace task scheduler's default cpu-invariant accounting */
> > diff --git a/arch/arm64/include/asm/topology.h b/arch/arm64/include/asm/topology.h
> > index 9fab663dd2de..a323b109b9c4 100644
> > --- a/arch/arm64/include/asm/topology.h
> > +++ b/arch/arm64/include/asm/topology.h
> > @@ -23,6 +23,7 @@ void update_freq_counters_refs(void);
> >  #define arch_set_freq_scale topology_set_freq_scale
> >  #define arch_scale_freq_capacity topology_get_freq_scale
> >  #define arch_scale_freq_invariant topology_scale_freq_invariant
> > +#define arch_scale_freq_ref topology_get_freq_ref
> >
> >  #ifdef CONFIG_ACPI_CPPC_LIB
> >  #define arch_init_invariance_cppc topology_init_cpu_capacity_cppc
> > diff --git a/arch/riscv/include/asm/topology.h b/arch/riscv/include/asm/topology.h
> > index e316ab3b77f3..61183688bdd5 100644
> > --- a/arch/riscv/include/asm/topology.h
> > +++ b/arch/riscv/include/asm/topology.h
> > @@ -9,6 +9,7 @@
> >  #define arch_set_freq_scale          topology_set_freq_scale
> >  #define arch_scale_freq_capacity     topology_get_freq_scale
> >  #define arch_scale_freq_invariant    topology_scale_freq_invariant
> > +#define arch_scale_freq_ref          topology_get_freq_ref
> >
> >  /* Replace task scheduler's default cpu-invariant accounting */
> >  #define arch_scale_cpu_capacity      topology_get_cpu_scale
> > diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
> > index b741b5ba82bd..75fa67477a9d 100644
> > --- a/drivers/base/arch_topology.c
> > +++ b/drivers/base/arch_topology.c
> > @@ -26,7 +26,7 @@
> >  static DEFINE_PER_CPU(struct scale_freq_data __rcu *, sft_data);
> >  static struct cpumask scale_freq_counters_mask;
> >  static bool scale_freq_invariant;
> > -static DEFINE_PER_CPU(u32, freq_factor) = 1;
> > +DEFINE_PER_CPU(unsigned long, freq_factor) = 1;
>
> Given its new wider use, it might be good for this to get a more
> relevant name as well. Previously freq_factor made sense for its role
> in using the dmips/mhz values to obtain CPU capacities. But if this is
> now returned from arch_scale_freq_ref() it would be more difficult still
> to easily understand what this value is supposed to reflect, when
> reading the function name or the per-cpu variable name alone.

As long as it was used internally behind a function i didn't see a
problem but I will probably have cppc_cpufreq to set it while
registering its Energy model so I will change it

>
> Thanks,
> Ionela.
>
> >
> >  static bool supports_scale_freq_counters(const struct cpumask *cpus)
> >  {
> > @@ -183,10 +183,7 @@ void topology_update_thermal_pressure(const struct cpumask *cpus,
> >
> >       cpu = cpumask_first(cpus);
> >       max_capacity = arch_scale_cpu_capacity(cpu);
> > -     max_freq = per_cpu(freq_factor, cpu);
> > -
> > -     /* Convert to MHz scale which is used in 'freq_factor' */
> > -     capped_freq /= 1000;
> > +     max_freq = arch_scale_freq_ref(cpu);
> >
> >       /*
> >        * Handle properly the boost frequencies, which should simply clean
> > @@ -411,7 +408,7 @@ init_cpu_capacity_callback(struct notifier_block *nb,
> >       cpumask_andnot(cpus_to_visit, cpus_to_visit, policy->related_cpus);
> >
> >       for_each_cpu(cpu, policy->related_cpus)
> > -             per_cpu(freq_factor, cpu) = policy->cpuinfo.max_freq / 1000;
> > +             per_cpu(freq_factor, cpu) = policy->cpuinfo.max_freq;
> >
> >       if (cpumask_empty(cpus_to_visit)) {
> >               topology_normalize_cpu_scale();
> > diff --git a/include/linux/arch_topology.h b/include/linux/arch_topology.h
> > index a07b510e7dc5..7a2dba9c3dc0 100644
> > --- a/include/linux/arch_topology.h
> > +++ b/include/linux/arch_topology.h
> > @@ -27,6 +27,13 @@ static inline unsigned long topology_get_cpu_scale(int cpu)
> >
> >  void topology_set_cpu_scale(unsigned int cpu, unsigned long capacity);
> >
> > +DECLARE_PER_CPU(unsigned long, freq_factor);
> > +
> > +static inline unsigned long topology_get_freq_ref(int cpu)
> > +{
> > +     return per_cpu(freq_factor, cpu);
> > +}
> > +
> >  DECLARE_PER_CPU(unsigned long, arch_freq_scale);
> >
> >  static inline unsigned long topology_get_freq_scale(int cpu)
> > --
> > 2.34.1
> >
> >

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
