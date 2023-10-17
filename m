Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75AB7CDB474
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Oct 2023 13:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jqNdeLsJQeqiOyh4K1/nNihCTmHehZE4L8WcelymceI=; b=Yy9vJ4TESA1pFZ
	WL7UYgc+r6rwEmT0VqlB1+fb6gCzN20snj1Snwl/9l5HwuhhMFBiKmx+kbCmp32FpCekrzCNwHCYy
	qCyrhgMNkLd+4R4oOCc1Z8laHMVPcsSQrAomgB9Q1dggZkhgpuIuygAkE7YUIfpQLLhjHPcvaFsiO
	8v+KNtSv1z33lA7bu5ujzV7KKRtJMd7Fnlbs/7Ym448GrOeKMQiSf7eDdT5coNH2Blr2X+DpOYgbJ
	W5q4/BXFWXo1kCqGIqBuK9ujBsswBZ/czyZgy4GWgZyUwzgbIR+9fFBQZ0lFoHL/T03EfSPHfSw6L
	SSoTFpQVBQXa8VurG7tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qskKz-00CRj6-18;
	Tue, 17 Oct 2023 13:42:21 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qskKs-00CRg6-0u
	for linux-riscv@lists.infradead.org;
	Tue, 17 Oct 2023 13:42:16 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-27d0251d305so3231803a91.2
        for <linux-riscv@lists.infradead.org>; Tue, 17 Oct 2023 06:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697550131; x=1698154931; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=f4Ac8357kjZmBSEr1y0XOi4bAEg4bWoPEyPAdAtsLWE=;
        b=PpiV2dqruB0r1KDCz3o8h7uFXBrwLtUKL+Gd1YFV5G2cC9rAp7cBKok1dReuq4EwFo
         s0hSxcvm9zh1NA7b3vRlz6QzC5WkTKJM79E514+PeaF3tsP2eTdoHvk94p+GsJHhBMpE
         Sz2wEoqIeL9I3x7SNripcBQseaDxD20zreXpiszs5D/LAsyE4TWX6nfoCNj7MxW2EVIx
         IJhbm0NjJhERmup20oC2xaC/sxcLU05PSEWPY6bvXjrZJrl2Jis95EN1sNKWfXJF0TFc
         Bwxhh5IyMDQ2hdCQSqsbD4Wb5x36CH+QSHTKHq9yqVXet7gohnjikIwDvwhA4U16coZn
         hqFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697550131; x=1698154931;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f4Ac8357kjZmBSEr1y0XOi4bAEg4bWoPEyPAdAtsLWE=;
        b=LshKYPMpD6rsRAZFXnUiTE/XKlgeeLEblIA0QXIvcD52DSWedNnnLuBbeTH7lc9F11
         pC+ws7phUziW4kBetsjboZdmBWHCPol2pNoqH+Xx/Mcrm3j8sDDXSHodX1LKOVaThAxJ
         nuyzuK+q4IWJTyJQEhDK++EA7XVpapVcCEQP+rQhQHREC2v3vKso50cBl2jikS7SuMrj
         hkfIgsP1hy2pAhRa+0GBQaAx1ZBgOvGq7eaqjAI+8zz9Zn1QVzaXA21/tMf5bBc5s1Gn
         gJhw1icO3gsVENYMGJkCqSN1lTCPABG/RpHcOMtfMDqZjWh97u0nbnlMCAtLK4hSkYkg
         T2TA==
X-Gm-Message-State: AOJu0YzFIP4AEtUd6rHyq16O3m0Ud930CFxxD3ZlSzafk0eM9xyU9ngo
	psDVVllRrDQI1VlNxwTphvtbUQ63CLTcS079mGFUTQ==
X-Google-Smtp-Source: AGHT+IHtFeoaUQqB6BbRSvNyCKcQArkdii6iyWxk/wLzPCeEtwyijjr9f1hjIT9Ej/YVkc3jHS7h3grHmlfjS3KThAE=
X-Received: by 2002:a17:90a:fb56:b0:27d:4eff:27ae with SMTP id
 iq22-20020a17090afb5600b0027d4eff27aemr2025710pjb.40.1697550131252; Tue, 17
 Oct 2023 06:42:11 -0700 (PDT)
MIME-Version: 1.0
References: <20231009103621.374412-7-vincent.guittot@linaro.org>
 <ac8968b9-8463-4aa2-a38d-fc2b9137460d@arm.com> <CAKfTPtBhXRk_Y-xiHn9_jQ1C_ALzbr3-KdwzcTCyupzJ4Gru5g@mail.gmail.com>
 <ZS0oyhbVDtXO1p5b@arm.com> <CAKfTPtCg9aYnWsReT=xtznwkMMMEepj6j9z4J6_ST5oUv69aUA@mail.gmail.com>
 <ZS5NuK7rjVFM5tj8@arm.com>
In-Reply-To: <ZS5NuK7rjVFM5tj8@arm.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Tue, 17 Oct 2023 15:41:59 +0200
Message-ID: <CAKfTPtAXeKRESDEZJMai3KhgXcE_hpndTRfMtcoVbH0FQZQd2Q@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] cpufreq/cppc: set the frequency used for capacity computation
To: Ionela Voinescu <ionela.voinescu@arm.com>
Cc: Pierre Gondois <pierre.gondois@arm.com>, linux@armlinux.org.uk, catalin.marinas@arm.com, 
	will@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, sudeep.holla@arm.com, gregkh@linuxfoundation.org, 
	rafael@kernel.org, mingo@redhat.com, peterz@infradead.org, 
	juri.lelli@redhat.com, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, mgorman@suse.de, bristot@redhat.com, vschneid@redhat.com, 
	viresh.kumar@linaro.org, lukasz.luba@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org, 
	conor.dooley@microchip.com, suagrfillet@gmail.com, ajones@ventanamicro.com, 
	lftan@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_064214_326370_CB32D9DF 
X-CRM114-Status: GOOD (  70.24  )
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

On Tue, 17 Oct 2023 at 11:02, Ionela Voinescu <ionela.voinescu@arm.com> wrote:
>
> Hi,
>
> On Monday 16 Oct 2023 at 17:32:03 (+0200), Vincent Guittot wrote:
> > Hi Ionela,
> >
> > On Mon, 16 Oct 2023 at 14:13, Ionela Voinescu <ionela.voinescu@arm.com> wrote:
> > >
> > > Hi both,
> > >
> > > On Wednesday 11 Oct 2023 at 16:25:46 (+0200), Vincent Guittot wrote:
> > > > On Wed, 11 Oct 2023 at 12:27, Pierre Gondois <pierre.gondois@arm.com> wrote:
> > > > >
> > > > > Hello Vincent,
> > > > >
> > > > > On 10/9/23 12:36, Vincent Guittot wrote:
> > > > > > cppc cpufreq driver can register an artificial energy model. In such case,
> > > > > > it also have to register the frequency that is used to define the CPU
> > > > > > capacity
> > > > > >
> > > > > > Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> > > > > > ---
> > > > > >   drivers/cpufreq/cppc_cpufreq.c | 18 ++++++++++++++++++
> > > > > >   1 file changed, 18 insertions(+)
> > > > > >
> > > > > > diff --git a/drivers/cpufreq/cppc_cpufreq.c b/drivers/cpufreq/cppc_cpufreq.c
> > > > > > index fe08ca419b3d..24c6ba349f01 100644
> > > > > > --- a/drivers/cpufreq/cppc_cpufreq.c
> > > > > > +++ b/drivers/cpufreq/cppc_cpufreq.c
> > > > > > @@ -636,6 +636,21 @@ static int populate_efficiency_class(void)
> > > > > >       return 0;
> > > > > >   }
> > > > > >
> > > > > > +
> > > > > > +static void cppc_cpufreq_set_capacity_ref_freq(struct cpufreq_policy *policy)
> > > > > > +{
> > > > > > +     struct cppc_perf_caps *perf_caps;
> > > > > > +     struct cppc_cpudata *cpu_data;
> > > > > > +     unsigned int ref_freq;
> > > > > > +
> > > > > > +     cpu_data = policy->driver_data;
> > > > > > +     perf_caps = &cpu_data->perf_caps;
> > > > > > +
> > > > > > +     ref_freq = cppc_cpufreq_perf_to_khz(cpu_data, perf_caps->highest_perf);
> > > > > > +
> > > > > > +     per_cpu(capacity_ref_freq, policy->cpu) = ref_freq;
> > > > >
> > > > > 'capacity_ref_freq' seems to be updated only if CONFIG_ENERGY_MODEL is set. However in
> > > > > [1], get_capacity_ref_freq() relies on 'capacity_ref_freq'. The cpufreq_schedutil governor
> > > > > should have a valid 'capacity_ref_freq' value set if the CPPC cpufreq driver is used
> > > > > without energy model I believe.
> > > >
> > > > we can disable it by setting capacity_ref_freq to 0 so it will
> > > > fallback on cpuinfo like intel and amd which uses default
> > > > SCHED_CAPACITY_SCALE capacity
> > > >
> > > > Could you provide me with more details about your platform ? I still
> > > > try to understand how the cpu compute capacity is set up on your
> > > > system. How do you set per_cpu cpu_scale variable ? we should set the
> > > > ref freq at the same time
> > > >
> > >
> > > Yes, the best place to set it would be in:
> > > drivers/base/arch_topology.c: topology_init_cpu_capacity_cppc()
> >
> > Thanks. I didn't notice it
> >
> > >
> > > But:
> > >  - That function reuses topology_normalize_cpu_scale() and when called
> > >    it needs to have capacity_ref_freq = 1. So either capacity_ref_freq
> > >    needs to be set for each CPU after topology_normalize_cpu_scale() is
> > >    called or we should not call topology_normalize_cpu_scale() here and
> > >    just unpack a CPPC specific version of it in
> > >    topology_init_cpu_capacity_cppc(). The latter is probably better as
> > >    we avoid iterating through all CPUs a couple of times.
> > >
> > >  - When set, capacity_ref_freq needs to be a "frequency" (at least
> > >    in reference to the reference frequencies provided by CPPC). So
> > >    cppc_cpufreq_khz_to_perf() and cppc_cpufreq_perf_to_khz() would need
> > >    to move to drivers/acpi/cppc_acpi.c. They don't have any dependency
> > >    on cpufreq (policies) so that should be alright.
> > >
> > > topology_init_cpu_capacity_cppc() is a better place to set
> > > capacity_ref_freq because one can do it for each CPU, and it not only
> >
> > I agree, topology_init_cpu_capacity_cppc() is the best place to set
> > capacity_ref_freq()
> >
> > > caters for the EAS case but also for frequency invariance, when
> > > arch_set_freq_scale() is called, if no counters are supported.
> > >
> > > When counters are supported, there are still two loose threads:
> > >  - amu_fie_setup(): Vincent, would you mind completely removing
> > >    cpufreq_get_hw_max_freq() and reusing arch_scale_freq_ref() here?
> >
> > I wonder if we can have a ordering dependency problem as both
> > init_cpu_capacity_notifier() and init_amu_fie_notifier() are
> > registered for the same CPUFREQ_POLICY_NOTIFIER event and I'm not sure
> >  it will happen in the right ordering
>
> Yes, you are right, this would be a problem for DT systems. With the
> implementation above, ACPI systems would obtain capacity_ref_freq on
> processor probe so it should be then available at policy creation when
> amu_fie_setup() would be called.

yes. the problem is only for DT

>
> Initially I thought the only solution might be to move
> freq_inv_set_max_ratio() in the arch topology driver to the same
> callback that initialises capacity, but that quickly becomes ugly with
> making it support both DT and ACPI systems. And then there's the
> question on whether it belongs there.

The goal would be to update the ratio while initializing everything
else. But this means that we must initialize the ratio in such a way
that amu will return by default SCHED_CAPACITY_SCALE until
arch_topology.c initializes it.

I will make it a try to check how ugly it will be

>
> But I think the better option is to wrap policy->cpuinfo.max_freq in
> another getter function which can be used in both amu_fie_setup() and
> init_cpu_capacity_callback(). This can be implemented in the
> arch topology driver and exposed to the architecture specific topology
> files.
>
> I'm not sure if this might be worth leaving for another patchset as
> well. Let us know if you'd like us to help on theses ones.
>
> Thanks,
> Ionela.
>
> >
> > >
> > >  - It would be nice if cppc_scale_freq_workfn() would use
> > >    arch_scale_freq_ref() as well, for consistency. But it would need
> > >    to be converted back to performance before use, so that would mean
> > >    extra work on the tick, which is not ideal.
> >
> > This once seems more complex as it implies other arch that are not
> > using arch_topology.c and would need more rework so I would prefer to
> > make it a separate patchset
> >
> > Thanks
> > Vincent
> >
> > >
> > > Basically it would be good if what gets used for capacity
> > > (arch_scale_freq_ref()) gets used for frequency invariance as well,
> > > in all locations.
> > >
> > > Thanks,
> > > Ionela.
> > >
> > > > >
> > > > > Also 'capacity_ref_freq' seems to be set only for 'policy->cpu'. I believe it should
> > > > > be set for the whole perf domain in case this 'policy->cpu' goes offline.
> > > > >
> > > > > Another thing, related my comment to [1] and to [2], for CPPC the max capacity matches
> > > > > the boosting frequency. We have:
> > > > >    'non-boosted max capacity' < 'boosted max capacity'.
> > > > > -
> > > > > If boosting is not enabled, the CPU utilization can still go above the 'non-boosted max
> > > > > capacity'. The overutilization of the system seems to be triggered by comparing the CPU
> > > > > util to the 'boosted max capacity'. So systems might not be detected as overutilized.
> > > >
> > > > As Peter mentioned, we have to decide what is the original compute
> > > > capacity of your CPUs which is usually the sustainable max compute
> > > > capacity, especially when using EAS and EM
> > > >
> > > > >
> > > > > For the EAS energy computation, em_cpu_energy() tries to predict the frequency that will
> > > > > be used. It is currently unknown to the function that the frequency request will be
> > > > > clamped by __resolve_freq():
> > > > > get_next_freq()
> > > > > \-cpufreq_driver_resolve_freq()
> > > > >    \-__resolve_freq()
> > > > > This means that the energy computation might use boosting frequencies, which are not
> > > > > available.
> > > > >
> > > > > Regards,
> > > > > Pierre
> > > > >
> > > > > [1]: [PATCH v2 4/6] cpufreq/schedutil: use a fixed reference frequency
> > > > > [2]: https://lore.kernel.org/lkml/20230905113308.GF28319@noisy.programming.kicks-ass.net/
> > > > >
> > > > > > +}
> > > > > > +
> > > > > >   static void cppc_cpufreq_register_em(struct cpufreq_policy *policy)
> > > > > >   {
> > > > > >       struct cppc_cpudata *cpu_data;
> > > > > > @@ -643,6 +658,9 @@ static void cppc_cpufreq_register_em(struct cpufreq_policy *policy)
> > > > > >               EM_ADV_DATA_CB(cppc_get_cpu_power, cppc_get_cpu_cost);
> > > > > >
> > > > > >       cpu_data = policy->driver_data;
> > > > > > +
> > > > > > +     cppc_cpufreq_set_capacity_ref_freq(policy);
> > > > > > +
> > > > > >       em_dev_register_perf_domain(get_cpu_device(policy->cpu),
> > > > > >                       get_perf_level_count(policy), &em_cb,
> > > > > >                       cpu_data->shared_cpu_map, 0);

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
