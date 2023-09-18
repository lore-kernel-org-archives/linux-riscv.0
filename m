Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C55DFCD37B0
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Sep 2023 11:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gsfTqN5qOaABCXP0j/CYk9PX5x2u6iBRMG1tO7u8ZEU=; b=LuZqrBWgwm77Li
	90YG8cOWRR3z6tZz5gdxzHUAo7cqRU/O4RriMGdCcSQxghrzeKvFO1ZlJzqoQf0Ucl2rPej/+xPrz
	4y6Vi+SrDR3CAPadRk897X63DCXpwfgMUkUT1TqTVb/2TMJTFzifGUEW0+QfVuBMRz/BaJj3Cf4sK
	vSVXduHnu34i4gzyJkATeqZLbQ+PGrcwaEX6/Uh5HqabTjqaaiUl/hCHgnOiBXv89y3Ruw5T8L4/e
	epu3whqsWgjbqHntJVLv8Ur7cltV72VeE3bubCjzh08ARbzI9EBujGzFc+rDHXToEClprXyllLdDX
	b4gFlBNgJbSp/kO/SPOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiCMT-00FJuM-2K;
	Mon, 18 Sep 2023 11:24:17 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiCMQ-00FJsq-0M
	for linux-riscv@lists.infradead.org;
	Mon, 18 Sep 2023 11:24:15 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-51b4ef5378bso3568409a12.1
        for <linux-riscv@lists.infradead.org>; Mon, 18 Sep 2023 04:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695036252; x=1695641052; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+JIoagGbUxbJdnZ/11AR40I+FsTVn6KCyqjzpGRwohg=;
        b=CCXrtkn9EFOl+/qIHJt+uwDFT+iKFPQ61fljl14N5AiI+s2t+PludlUuyc+C/iJriJ
         GNLfmirgAXz/e5ZU6j+DmKdQHWwT37p1PTJSRjW6zKizZQhPI1o/O3Mw9A0ykqRFJ6+u
         c3Y5RH/CXtGDTpK3E11HyPUoNfWSxzHJfOc3oVVxz/kJ6adaPBMTXPvERTEyTqYLgfuC
         IZ+OMzd5ake7M5uOAkx65zrBS0H8f0n0FsFVS3c2f4WQAd6yaR8X/IPLP19b8nH3H+SX
         iUcrzc7TZ7yhcxccQY4yw/D66sscejk1KbBznbCvBK1Qj/8K98djniWVJ7q9xkP3ljiA
         YC9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695036252; x=1695641052;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+JIoagGbUxbJdnZ/11AR40I+FsTVn6KCyqjzpGRwohg=;
        b=rcn+hDg5ZC7gdAL27C5BeTHn+/XB2mHKS8pD8w4UUtO0nskah+kJZdbcyqFyhf7zpL
         oJJTGNHauC+BuQDKWyQVZqh/AExtLyxlaUFRGRumZwBfY+H8jWG90rfhw9acN3w97Ntr
         MdhD0xFtz7ST2yrfyGT3za82Y07OeBUmSUxtL86rE5H8o/AmvZksWR6eV0CeCrBLzel5
         2h+g3ImAxdvC32/QinVYq8Ec4Xt8Zt+KCSykAGYXAnlfiRwp/0pUKac9mSucm3nzoib/
         gCbq/L4mzj4pX9ZSWNBAPOieCPv3ebdGYSMkLn5FHOs9yaCZtx0ggP2PHw7dnitkp8q2
         q9Ug==
X-Gm-Message-State: AOJu0YyyMA2BSjWLEodXLqII6XHXkNC/PhkhzDgAiNySNS1W92wGBxw8
	487eserJyt6FNzMGTrdSF+zJqbdg+zXYqWiTOZ0KEA==
X-Google-Smtp-Source: AGHT+IEYnp5mNbH0vm2kgMzPq48KRD0OiUzdkJ9b2tXtBZlshoSaZMZ7r/copZVbT9J2mDht277Rf/2gg2PDi+Zaj9E=
X-Received: by 2002:a17:90a:8a15:b0:274:6d4e:e0d9 with SMTP id
 w21-20020a17090a8a1500b002746d4ee0d9mr7943000pjn.45.1695036251982; Mon, 18
 Sep 2023 04:24:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230901130312.247719-1-vincent.guittot@linaro.org>
 <20230901130312.247719-3-vincent.guittot@linaro.org> <840cb103-8ffb-9798-05a3-a557f78f7f7a@arm.com>
In-Reply-To: <840cb103-8ffb-9798-05a3-a557f78f7f7a@arm.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Mon, 18 Sep 2023 13:23:59 +0200
Message-ID: <CAKfTPtDahUNatFpy+cQgbadhON_kwEaBVuDpUfW2kQHJUvecHg@mail.gmail.com>
Subject: Re: [PATCH 2/4] topology: add a new arch_scale_freq_reference
To: Lukasz Luba <lukasz.luba@arm.com>
Cc: conor.dooley@microchip.com, linux-arm-kernel@lists.infradead.org, 
	suagrfillet@gmail.com, juri.lelli@redhat.com, sudeep.holla@arm.com, 
	palmer@dabbelt.com, linux-riscv@lists.infradead.org, ajones@ventanamicro.com, 
	lftan@kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux@armlinux.org.uk, bristot@redhat.com, catalin.marinas@arm.com, 
	bsegall@google.com, will@kernel.org, vschneid@redhat.com, rostedt@goodmis.org, 
	rafael@kernel.org, dietmar.eggemann@arm.com, aou@eecs.berkeley.edu, 
	mingo@redhat.com, paul.walmsley@sifive.com, mgorman@suse.de, 
	gregkh@linuxfoundation.org, peterz@infradead.org, viresh.kumar@linaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_042414_195167_23D7E9C7 
X-CRM114-Status: GOOD (  30.31  )
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

On Mon, 4 Sept 2023 at 14:34, Lukasz Luba <lukasz.luba@arm.com> wrote:
>
> Hi Vincent,
>
>
> On 9/1/23 14:03, Vincent Guittot wrote:
> > Create a new method to get a unique and fixed max frequency. Currently
> > cpuinfo.max_freq or last item of performance domain are used as the max
> > frequency when computing the frequency for a level of utilization but:
> > - cpuinfo_max_freq can change at runtime. boost is one example of
> >    such change.
> > - cpuinfo.max_freq and last item of the PD can be different leading to
> >    different results betwen cpufreq and energy model.
> >
> > We need to save the max frequency that has been used when computing the
> > CPUs capacity and use this fixed and coherent value to convert between
> > frequency and CPU's capacity.
> >
> > In fact, we already save the frequency that has been used when computing
> > the capacity of each CPU. We extend the precision to save khZ instead of
> > Mhz currently and we modify the type to be aligned with other variables
> > used when converting frequency to capacity and the other way.
>
> I do like this 'kHz' change. We also use kHz in the EM, so better
> aligned now.
>
> >
> > Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> > ---
> >   arch/arm/include/asm/topology.h   | 1 +
> >   arch/arm64/include/asm/topology.h | 1 +
> >   arch/riscv/include/asm/topology.h | 1 +
> >   drivers/base/arch_topology.c      | 9 +++------
> >   include/linux/arch_topology.h     | 7 +++++++
> >   5 files changed, 13 insertions(+), 6 deletions(-)
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
> > index b741b5ba82bd..75fa67477a9d 100644
> > --- a/drivers/base/arch_topology.c
> > +++ b/drivers/base/arch_topology.c
> > @@ -26,7 +26,7 @@
> >   static DEFINE_PER_CPU(struct scale_freq_data __rcu *, sft_data);
> >   static struct cpumask scale_freq_counters_mask;
> >   static bool scale_freq_invariant;
> > -static DEFINE_PER_CPU(u32, freq_factor) = 1;
> > +DEFINE_PER_CPU(unsigned long, freq_factor) = 1;
>
> Why it's not static now?

it can be accessed outside with inline function like cpu_scale and
arch_freq_scale

>
> >
> >   static bool supports_scale_freq_counters(const struct cpumask *cpus)
> >   {
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
> >   void topology_set_cpu_scale(unsigned int cpu, unsigned long capacity);
> >
> > +DECLARE_PER_CPU(unsigned long, freq_factor);
> > +
> > +static inline unsigned long topology_get_freq_ref(int cpu)
> > +{
> > +     return per_cpu(freq_factor, cpu);
> > +}
> > +
> >   DECLARE_PER_CPU(unsigned long, arch_freq_scale);
> >
> >   static inline unsigned long topology_get_freq_scale(int cpu)
>
> Apart from that 'static' missing, that looks good.
>
> Regards,
> Lukasz

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
