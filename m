Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF6C2CDB465
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Oct 2023 12:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rBnoDkA8U0IGSp6p7Fs30CLx+UOZr9QGcSdLejbH3Mo=; b=Q9RyOGVYCVQM/j
	gEXy2quBw4qUTDuMQpWwn0SqRhskF6W9rqAxigxQjd5fZ+nWelMsZUPIVNgNSo0REN09P133HXLaW
	FTuk7TVmcOvSFWHhRTwokETiYggGkernCfoJJAJoM4pfZloW4LNmVwpV0u03bW5OLMfcQh+oG5+Ww
	bRUX3YB5L+yVi94WHTAudl+o3+4s0JkXrxLW0i3dQxPJ29F4LFV+I6M4x4nsUWV/6NOrjlhAIZMNM
	fSD66pprQNjqU2fmRiz/DMK7Yy+wjUo+wLwYno5XLbBq6PVX0UHygDhirbnTVdy4Ks2re1Q0MPoU/
	hewaRFuHMuFjNSDB3Ivw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsMT6-009ZP7-2Q;
	Mon, 16 Oct 2023 12:13:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsMT2-009ZNT-0F;
	Mon, 16 Oct 2023 12:13:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0070E1FB;
	Mon, 16 Oct 2023 05:13:41 -0700 (PDT)
Received: from localhost (ionvoi01-desktop.cambridge.arm.com [10.2.78.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 18F683F5A1;
	Mon, 16 Oct 2023 05:13:00 -0700 (PDT)
Date: Mon, 16 Oct 2023 13:12:58 +0100
From: Ionela Voinescu <ionela.voinescu@arm.com>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: Pierre Gondois <pierre.gondois@arm.com>, linux@armlinux.org.uk,
	catalin.marinas@arm.com, will@kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, sudeep.holla@arm.com,
	gregkh@linuxfoundation.org, rafael@kernel.org, mingo@redhat.com,
	peterz@infradead.org, juri.lelli@redhat.com,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, bristot@redhat.com, vschneid@redhat.com,
	viresh.kumar@linaro.org, lukasz.luba@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org,
	conor.dooley@microchip.com, suagrfillet@gmail.com,
	ajones@ventanamicro.com, lftan@kernel.org
Subject: Re: [PATCH v2 6/6] cpufreq/cppc: set the frequency used for capacity
 computation
Message-ID: <ZS0oyhbVDtXO1p5b@arm.com>
References: <20231009103621.374412-7-vincent.guittot@linaro.org>
 <ac8968b9-8463-4aa2-a38d-fc2b9137460d@arm.com>
 <CAKfTPtBhXRk_Y-xiHn9_jQ1C_ALzbr3-KdwzcTCyupzJ4Gru5g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKfTPtBhXRk_Y-xiHn9_jQ1C_ALzbr3-KdwzcTCyupzJ4Gru5g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_051304_271492_F47C507A 
X-CRM114-Status: GOOD (  45.60  )
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

Hi both,

On Wednesday 11 Oct 2023 at 16:25:46 (+0200), Vincent Guittot wrote:
> On Wed, 11 Oct 2023 at 12:27, Pierre Gondois <pierre.gondois@arm.com> wrote:
> >
> > Hello Vincent,
> >
> > On 10/9/23 12:36, Vincent Guittot wrote:
> > > cppc cpufreq driver can register an artificial energy model. In such case,
> > > it also have to register the frequency that is used to define the CPU
> > > capacity
> > >
> > > Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> > > ---
> > >   drivers/cpufreq/cppc_cpufreq.c | 18 ++++++++++++++++++
> > >   1 file changed, 18 insertions(+)
> > >
> > > diff --git a/drivers/cpufreq/cppc_cpufreq.c b/drivers/cpufreq/cppc_cpufreq.c
> > > index fe08ca419b3d..24c6ba349f01 100644
> > > --- a/drivers/cpufreq/cppc_cpufreq.c
> > > +++ b/drivers/cpufreq/cppc_cpufreq.c
> > > @@ -636,6 +636,21 @@ static int populate_efficiency_class(void)
> > >       return 0;
> > >   }
> > >
> > > +
> > > +static void cppc_cpufreq_set_capacity_ref_freq(struct cpufreq_policy *policy)
> > > +{
> > > +     struct cppc_perf_caps *perf_caps;
> > > +     struct cppc_cpudata *cpu_data;
> > > +     unsigned int ref_freq;
> > > +
> > > +     cpu_data = policy->driver_data;
> > > +     perf_caps = &cpu_data->perf_caps;
> > > +
> > > +     ref_freq = cppc_cpufreq_perf_to_khz(cpu_data, perf_caps->highest_perf);
> > > +
> > > +     per_cpu(capacity_ref_freq, policy->cpu) = ref_freq;
> >
> > 'capacity_ref_freq' seems to be updated only if CONFIG_ENERGY_MODEL is set. However in
> > [1], get_capacity_ref_freq() relies on 'capacity_ref_freq'. The cpufreq_schedutil governor
> > should have a valid 'capacity_ref_freq' value set if the CPPC cpufreq driver is used
> > without energy model I believe.
> 
> we can disable it by setting capacity_ref_freq to 0 so it will
> fallback on cpuinfo like intel and amd which uses default
> SCHED_CAPACITY_SCALE capacity
> 
> Could you provide me with more details about your platform ? I still
> try to understand how the cpu compute capacity is set up on your
> system. How do you set per_cpu cpu_scale variable ? we should set the
> ref freq at the same time
> 

Yes, the best place to set it would be in:
drivers/base/arch_topology.c: topology_init_cpu_capacity_cppc()

But:
 - That function reuses topology_normalize_cpu_scale() and when called
   it needs to have capacity_ref_freq = 1. So either capacity_ref_freq
   needs to be set for each CPU after topology_normalize_cpu_scale() is
   called or we should not call topology_normalize_cpu_scale() here and
   just unpack a CPPC specific version of it in
   topology_init_cpu_capacity_cppc(). The latter is probably better as
   we avoid iterating through all CPUs a couple of times.

 - When set, capacity_ref_freq needs to be a "frequency" (at least
   in reference to the reference frequencies provided by CPPC). So 
   cppc_cpufreq_khz_to_perf() and cppc_cpufreq_perf_to_khz() would need
   to move to drivers/acpi/cppc_acpi.c. They don't have any dependency
   on cpufreq (policies) so that should be alright.

topology_init_cpu_capacity_cppc() is a better place to set
capacity_ref_freq because one can do it for each CPU, and it not only
caters for the EAS case but also for frequency invariance, when
arch_set_freq_scale() is called, if no counters are supported.

When counters are supported, there are still two loose threads:
 - amu_fie_setup(): Vincent, would you mind completely removing
   cpufreq_get_hw_max_freq() and reusing arch_scale_freq_ref() here?

 - It would be nice if cppc_scale_freq_workfn() would use
   arch_scale_freq_ref() as well, for consistency. But it would need
   to be converted back to performance before use, so that would mean
   extra work on the tick, which is not ideal.

Basically it would be good if what gets used for capacity
(arch_scale_freq_ref()) gets used for frequency invariance as well,
in all locations.

Thanks,
Ionela.

> >
> > Also 'capacity_ref_freq' seems to be set only for 'policy->cpu'. I believe it should
> > be set for the whole perf domain in case this 'policy->cpu' goes offline.
> >
> > Another thing, related my comment to [1] and to [2], for CPPC the max capacity matches
> > the boosting frequency. We have:
> >    'non-boosted max capacity' < 'boosted max capacity'.
> > -
> > If boosting is not enabled, the CPU utilization can still go above the 'non-boosted max
> > capacity'. The overutilization of the system seems to be triggered by comparing the CPU
> > util to the 'boosted max capacity'. So systems might not be detected as overutilized.
> 
> As Peter mentioned, we have to decide what is the original compute
> capacity of your CPUs which is usually the sustainable max compute
> capacity, especially when using EAS and EM
> 
> >
> > For the EAS energy computation, em_cpu_energy() tries to predict the frequency that will
> > be used. It is currently unknown to the function that the frequency request will be
> > clamped by __resolve_freq():
> > get_next_freq()
> > \-cpufreq_driver_resolve_freq()
> >    \-__resolve_freq()
> > This means that the energy computation might use boosting frequencies, which are not
> > available.
> >
> > Regards,
> > Pierre
> >
> > [1]: [PATCH v2 4/6] cpufreq/schedutil: use a fixed reference frequency
> > [2]: https://lore.kernel.org/lkml/20230905113308.GF28319@noisy.programming.kicks-ass.net/
> >
> > > +}
> > > +
> > >   static void cppc_cpufreq_register_em(struct cpufreq_policy *policy)
> > >   {
> > >       struct cppc_cpudata *cpu_data;
> > > @@ -643,6 +658,9 @@ static void cppc_cpufreq_register_em(struct cpufreq_policy *policy)
> > >               EM_ADV_DATA_CB(cppc_get_cpu_power, cppc_get_cpu_cost);
> > >
> > >       cpu_data = policy->driver_data;
> > > +
> > > +     cppc_cpufreq_set_capacity_ref_freq(policy);
> > > +
> > >       em_dev_register_perf_domain(get_cpu_device(policy->cpu),
> > >                       get_perf_level_count(policy), &em_cb,
> > >                       cpu_data->shared_cpu_map, 0);

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
