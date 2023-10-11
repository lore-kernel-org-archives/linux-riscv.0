Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7BC7CD6E71
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Oct 2023 13:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iVzhpihzhHnT+L1hv1qCiJEG83PC8kxMbWeFKErPZzY=; b=ukMzFxZa9PmSX0
	PWJEpXt68DKy0vNM+Mhe9zpqsr7f0Ph3BgJ9Vrcxt6f47vAWtWY8HFV3FwwU2Ic8f5qQRjOUqikpq
	dNupw6sdl9PV8wtKNo/Ju8376XNLeKSJc9HiBX1ybnlWn6pa22w4R6jZprJ876MiJYOLHMP4u9SOE
	QBK+XtSORlck9NINBgXAYr+T4ijM4je2ypqtBdeYu4Y9/hMlgBGsseN1oXv00H/GaKhpcqKit5Cdx
	x58gT29l6R9jjfCvqF5PwSFSXg4hfZd9ywCpsxA9rYfj2rmGf2yszyH6YZRtpy6Iltxx7GAA1ep0i
	RU7vk0h6DRqpXFQ3TYkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqZZp-00G1JI-1s;
	Wed, 11 Oct 2023 13:48:41 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqZZm-00G1Gy-25
	for linux-riscv@lists.infradead.org;
	Wed, 11 Oct 2023 13:48:40 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1c9bf22fe05so13503225ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 11 Oct 2023 06:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697032116; x=1697636916; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ixCt6NnW81dfiXj0LHHWg4GT6PXYyiPLSK5qgds3Ofo=;
        b=ESICRvyWxV+IliNKUx72Jns9WpnFVzuJqIh07J94pviK9559skunBRr7px6/UDtuOx
         N0siPLdzK+AQPYunw+vyzYdbfbBRb1Ofpq3cvFinoJu8b5B6SNZuLbFS/zDDV28O21t8
         lU1NbtCXOV1EUN3IUKYKxpnwKUDdj1UpOdo/N5+ioE9Mma1eKXPcgwkzLerYcHspBwll
         XadAYI6wu6dFETVEnxVNYEiUqb+h+Tc05i0zMkQvkWm/OBzVxMk520pQYfUMpCrwudx4
         VoOuzP+P+IsIKNz6tt9+Fc27lPtDl+QBz3KIt9ikvWDXEtemHTO2k/SL+qbwdaof796V
         vghQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697032116; x=1697636916;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ixCt6NnW81dfiXj0LHHWg4GT6PXYyiPLSK5qgds3Ofo=;
        b=J5nfdREcHqJ8umLfw+aKDxZ6f6PmW1De5vZgH3SKh9Pb+CM2CAbqPjgd0NVyCNdui4
         Egj8lSjm1yK8MGCs0a0mx4V9qbcwzobyrpeiftAVf8dtetjNIUmj2YnerlWX0GdujXHY
         Fm2hc6S1NF3wW2XdQJORS6fib3lhcVSKIpu2jmw5au0X7V2X8U8MVh6F4/uKvzLb7bp4
         HoVBYu6I29rDYkT2FCJsuzyoi/97tM6RWygXo+i5lSt5XoXJFFTYfrEeliNcJ6ai0Uh8
         sahpc8SBTa/pPdRk3dmrvvxvxLP5uubNATVUoW7rebB+zkudgZ39KJcNqoyww8Ka+Po7
         lBEA==
X-Gm-Message-State: AOJu0Ywo1FDFvfEWbMHqxnBn7u/NSDpcfWMr9uQyPlIQnM4zrY44Hv9s
	8gfwFC0wfgntLCfvnfo+/1Y1Cbt7zxs4UEyA0UjG7w==
X-Google-Smtp-Source: AGHT+IHxQ3oFdJ+Ocx7MX6JfQcL5dTT86dTikgG6eNFhgqpK4zW0ipOVNjpTP9AOB5ebinWoGU/Ru3iOx0CmOUY9ctE=
X-Received: by 2002:a17:903:246:b0:1c0:b84d:3f73 with SMTP id
 j6-20020a170903024600b001c0b84d3f73mr21436735plh.53.1697032115568; Wed, 11
 Oct 2023 06:48:35 -0700 (PDT)
MIME-Version: 1.0
References: <20231009103621.374412-1-vincent.guittot@linaro.org>
 <20231009103621.374412-3-vincent.guittot@linaro.org> <142277eb-766e-4524-b507-c75bbc143ade@arm.com>
In-Reply-To: <142277eb-766e-4524-b507-c75bbc143ade@arm.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Wed, 11 Oct 2023 15:48:24 +0200
Message-ID: <CAKfTPtBnj=b9siWQmu9ddJeQrV0KsWtyMj3LQkrCmJ1w2ZyShg@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] topology: add a new arch_scale_freq_reference
To: Pierre Gondois <pierre.gondois@arm.com>
Cc: linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	sudeep.holla@arm.com, gregkh@linuxfoundation.org, rafael@kernel.org, 
	mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, bristot@redhat.com, vschneid@redhat.com, 
	viresh.kumar@linaro.org, lukasz.luba@arm.com, ionela.voinescu@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org, 
	conor.dooley@microchip.com, suagrfillet@gmail.com, ajones@ventanamicro.com, 
	lftan@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231011_064838_693172_4A4169B9 
X-CRM114-Status: GOOD (  40.03  )
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

On Wed, 11 Oct 2023 at 12:27, Pierre Gondois <pierre.gondois@arm.com> wrote:
>
> Hello Vincent,
>
> On 10/9/23 12:36, Vincent Guittot wrote:
> > Create a new method to get a unique and fixed max frequency. Currently
> > cpuinfo.max_freq or the highest (or last) state of performance domain are
> > used as the max frequency when computing the frequency for a level of
> > utilization but:
> > - cpuinfo_max_freq can change at runtime. boost is one example of
> >    such change.
> > - cpuinfo.max_freq and last item of the PD can be different leading to
> >    different results between cpufreq and energy model.
> >
> > We need to save the reference frequency that has been used when computing
> > the CPUs capacity and use this fixed and coherent value to convert between
> > frequency and CPU's capacity.
> >
> > In fact, we already save the frequency that has been used when computing
> > the capacity of each CPU. We extend the precision to save khZ instead of
> > Mhz currently and we modify the type to be aligned with other variables
> > used when converting frequency to capacity and the other way.
> >
> > Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> > ---
> >   arch/arm/include/asm/topology.h   |  1 +
> >   arch/arm64/include/asm/topology.h |  1 +
> >   arch/riscv/include/asm/topology.h |  1 +
> >   drivers/base/arch_topology.c      | 29 ++++++++++++++---------------
> >   include/linux/arch_topology.h     |  7 +++++++
> >   5 files changed, 24 insertions(+), 15 deletions(-)
> >
> > diff --git a/arch/arm/include/asm/topology.h b/arch/arm/include/asm/topology.h
> > index c7d2510e5a78..853c4f81ba4a 100644
> > --- a/arch/arm/include/asm/topology.h
> > +++ b/arch/arm/include/asm/topology.h
> > @@ -13,6 +13,7 @@
> >   #define arch_set_freq_scale topology_set_freq_scale
> >   #define arch_scale_freq_capacity topology_get_freq_scale
> >   #define arch_scale_freq_invariant topology_scale_freq_invariant
> > +#define arch_scale_freq_ref topology_get_freq_ref
> >   #endif
> >
> >   /* Replace task scheduler's default cpu-invariant accounting */
> > diff --git a/arch/arm64/include/asm/topology.h b/arch/arm64/include/asm/topology.h
> > index 9fab663dd2de..a323b109b9c4 100644
> > --- a/arch/arm64/include/asm/topology.h
> > +++ b/arch/arm64/include/asm/topology.h
> > @@ -23,6 +23,7 @@ void update_freq_counters_refs(void);
> >   #define arch_set_freq_scale topology_set_freq_scale
> >   #define arch_scale_freq_capacity topology_get_freq_scale
> >   #define arch_scale_freq_invariant topology_scale_freq_invariant
> > +#define arch_scale_freq_ref topology_get_freq_ref
> >
> >   #ifdef CONFIG_ACPI_CPPC_LIB
> >   #define arch_init_invariance_cppc topology_init_cpu_capacity_cppc
> > diff --git a/arch/riscv/include/asm/topology.h b/arch/riscv/include/asm/topology.h
> > index e316ab3b77f3..61183688bdd5 100644
> > --- a/arch/riscv/include/asm/topology.h
> > +++ b/arch/riscv/include/asm/topology.h
> > @@ -9,6 +9,7 @@
> >   #define arch_set_freq_scale         topology_set_freq_scale
> >   #define arch_scale_freq_capacity    topology_get_freq_scale
> >   #define arch_scale_freq_invariant   topology_scale_freq_invariant
> > +#define arch_scale_freq_ref          topology_get_freq_ref
> >
> >   /* Replace task scheduler's default cpu-invariant accounting */
> >   #define arch_scale_cpu_capacity     topology_get_cpu_scale
> > diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
> > index b741b5ba82bd..9a073c2d2086 100644
> > --- a/drivers/base/arch_topology.c
> > +++ b/drivers/base/arch_topology.c
> > @@ -19,6 +19,7 @@
> >   #include <linux/init.h>
> >   #include <linux/rcupdate.h>
> >   #include <linux/sched.h>
> > +#include <linux/units.h>
> >
> >   #define CREATE_TRACE_POINTS
> >   #include <trace/events/thermal_pressure.h>
> > @@ -26,7 +27,8 @@
> >   static DEFINE_PER_CPU(struct scale_freq_data __rcu *, sft_data);
> >   static struct cpumask scale_freq_counters_mask;
> >   static bool scale_freq_invariant;
> > -static DEFINE_PER_CPU(u32, freq_factor) = 1;
> > +DEFINE_PER_CPU(unsigned long, capacity_ref_freq) = 1;
> > +EXPORT_PER_CPU_SYMBOL_GPL(capacity_ref_freq);
> >
> >   static bool supports_scale_freq_counters(const struct cpumask *cpus)
> >   {
> > @@ -170,9 +172,9 @@ DEFINE_PER_CPU(unsigned long, thermal_pressure);
> >    * operating on stale data when hot-plug is used for some CPUs. The
> >    * @capped_freq reflects the currently allowed max CPUs frequency due to
> >    * thermal capping. It might be also a boost frequency value, which is bigger
> > - * than the internal 'freq_factor' max frequency. In such case the pressure
> > - * value should simply be removed, since this is an indication that there is
> > - * no thermal throttling. The @capped_freq must be provided in kHz.
> > + * than the internal 'capacity_ref_freq' max frequency. In such case the
> > + * pressure value should simply be removed, since this is an indication that
> > + * there is no thermal throttling. The @capped_freq must be provided in kHz.
> >    */
> >   void topology_update_thermal_pressure(const struct cpumask *cpus,
> >                                     unsigned long capped_freq)
> > @@ -183,10 +185,7 @@ void topology_update_thermal_pressure(const struct cpumask *cpus,
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
> > @@ -279,13 +278,13 @@ void topology_normalize_cpu_scale(void)
> >
> >       capacity_scale = 1;
> >       for_each_possible_cpu(cpu) {
> > -             capacity = raw_capacity[cpu] * per_cpu(freq_factor, cpu);
> > +             capacity = raw_capacity[cpu] * per_cpu(capacity_ref_freq, cpu);
> >               capacity_scale = max(capacity, capacity_scale);
> >       }
> >
> >       pr_debug("cpu_capacity: capacity_scale=%llu\n", capacity_scale);
> >       for_each_possible_cpu(cpu) {
> > -             capacity = raw_capacity[cpu] * per_cpu(freq_factor, cpu);
> > +             capacity = raw_capacity[cpu] * per_cpu(capacity_ref_freq, cpu);
> >               capacity = div64_u64(capacity << SCHED_CAPACITY_SHIFT,
> >                       capacity_scale);
> >               topology_set_cpu_scale(cpu, capacity);
> > @@ -321,15 +320,15 @@ bool __init topology_parse_cpu_capacity(struct device_node *cpu_node, int cpu)
> >                       cpu_node, raw_capacity[cpu]);
> >
> >               /*
> > -              * Update freq_factor for calculating early boot cpu capacities.
> > +              * Update capacity_ref_freq for calculating early boot cpu capacities.
> >                * For non-clk CPU DVFS mechanism, there's no way to get the
> >                * frequency value now, assuming they are running at the same
> > -              * frequency (by keeping the initial freq_factor value).
> > +              * frequency (by keeping the initial capacity_ref_freq value).
> >                */
> >               cpu_clk = of_clk_get(cpu_node, 0);
> >               if (!PTR_ERR_OR_ZERO(cpu_clk)) {
> > -                     per_cpu(freq_factor, cpu) =
> > -                             clk_get_rate(cpu_clk) / 1000;
> > +                     per_cpu(capacity_ref_freq, cpu) =
> > +                             clk_get_rate(cpu_clk) / HZ_PER_KHZ;
> >                       clk_put(cpu_clk);
> >               }
> >       } else {
> > @@ -411,7 +410,7 @@ init_cpu_capacity_callback(struct notifier_block *nb,
> >       cpumask_andnot(cpus_to_visit, cpus_to_visit, policy->related_cpus);
> >
> >       for_each_cpu(cpu, policy->related_cpus)
> > -             per_cpu(freq_factor, cpu) = policy->cpuinfo.max_freq / 1000;
> > +             per_cpu(capacity_ref_freq, cpu) = policy->cpuinfo.max_freq;
>
> It seems init_cpu_capacity_callback() is only called when a policy is created
> (cf. CPUFREQ_CREATE_POLICY). This means that CPU capacities are only updated
> in this specific case, eluding the cases where:
> - boost is enabled. 'policy->cpuinfo.max_freq' is updated in the cpufreq driver,
>    but it seems it doesn't have any consequence regarding CPU capacities.

Yes, that's why we have to rely on something else than max_freq. And
one might not want to take boost into account in the compute capacity
because it's not sustainable. Nothing as change on this side

> - a cpufreq driver is unplugged (e.g. rmmod cpufreq_driver.ko). In this case
>    the CPU capacities are only updated when plugging in the driver (e.g. insmod
>    cpufreq_driver.ko).

same here

>
> Regards,
> Pierre
>
>
> >
> >       if (cpumask_empty(cpus_to_visit)) {
> >               topology_normalize_cpu_scale();
> > diff --git a/include/linux/arch_topology.h b/include/linux/arch_topology.h
> > index a07b510e7dc5..38ca6c76af56 100644
> > --- a/include/linux/arch_topology.h
> > +++ b/include/linux/arch_topology.h
> > @@ -27,6 +27,13 @@ static inline unsigned long topology_get_cpu_scale(int cpu)
> >
> >   void topology_set_cpu_scale(unsigned int cpu, unsigned long capacity);
> >
> > +DECLARE_PER_CPU(unsigned long, capacity_ref_freq);
> > +
> > +static inline unsigned long topology_get_freq_ref(int cpu)
> > +{
> > +     return per_cpu(capacity_ref_freq, cpu);
> > +}
> > +
> >   DECLARE_PER_CPU(unsigned long, arch_freq_scale);
> >
> >   static inline unsigned long topology_get_freq_scale(int cpu)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
