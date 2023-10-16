Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DC85CDB465
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Oct 2023 15:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=asLEh5eL0ZVh77bEcdoB/cEe70t0MbZ4DXyefWDbiUs=; b=YFaNQ61nONkzD7
	ZzBKrTpJ7hK++vjN0FX+uEptkIC0bVyYq06gIKcbpZt3oo7FcEJHrAaMuCSNYbTQaTpIwemdTZ3VH
	K7VhPWBPP/EcJSDqcjvbjLc0BdiAjI8d3LjV/m4U0M3bmTOBU8xr7K6GfoFJEHYs0gedRq1bvDcUT
	5PVJ2Zod8njwhSr9EM9/7x3pnyUFZ5NyRKP8xqLi2xuG8guIx6s9sQQvdcuqFZESSotyP+LYtJxjc
	mmVEV3L0RrzL/YT4uI5oHQHiLGtZnhab+s66KCXA7Awcndzl7pMynxMe1vnW/9ZNBhKfOSPRSTBDI
	hSZaDGqfAF82ub2vHnlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsPZv-009zEa-0p;
	Mon, 16 Oct 2023 15:32:23 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsPZq-009zCE-1T
	for linux-riscv@lists.infradead.org;
	Mon, 16 Oct 2023 15:32:20 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6b709048d8eso1757885b3a.2
        for <linux-riscv@lists.infradead.org>; Mon, 16 Oct 2023 08:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697470335; x=1698075135; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5pngVXoLiR/0bx1FlI0DnQePf5uJ9GAS4LvTh4IY1Rk=;
        b=TOJ4TJMPgVRMSOUbYy3uK8Gqc37t0ES6RLPAwJ1UR+nILaG9+/lHKUGF7dmru2b9EC
         WbD6dpnrPsBlfqwgfGYkn+2vewSitZ+lxtraeYBOEwI8lY4/pfAYVXKh4lslmYcIawIz
         ohqeZnW9Gzn4BVLgfG2Fofq/xcVQdT1d0PU+wSK9q5FVlY/SxFB9kgrBsRixHJ6ADzpq
         QpBWPUiksMVj9set6Mk+VuYpeROCoC4Ln9WjvXNxF0xtPFtcrK0+Tu3wDGhtQcpjmO9n
         brUi9SCXxSkBff+zT5oYr8UXGNfsHO5SNmD38DwQW0KULK8cAgNx4I0ZiSltKkfp4wIQ
         yIiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697470335; x=1698075135;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5pngVXoLiR/0bx1FlI0DnQePf5uJ9GAS4LvTh4IY1Rk=;
        b=YD1bOtaR9vfm0wyv3CruGYWRvkjxq2QU8CWmsudjPM+8H+rA+ro7qeA2BJSegWNy+i
         AC941TjCIbrhq5TSHZ34MzGUIppPXNprHuFZ/ixTGfo3AeLAk7QDSAYr9BHMZgbFPnCq
         EXx3Iv7+PKvn97Zv6PcocPJPxK9Emxw8ABJ1iMn1bEqgAG1HwsMkEImpo9xGodowioD/
         QMMfVyM4zI39l9jdoTiIfTaoFPOTwOTFOaoZUR28e1I+rRdW3TXQfjWwetjOxis8XXoQ
         UtUFOipFfjfKr2BmQwlnhbJ6N6PwJUx9Bz7T1qbHEyz2gFoO0Xj9HCWnwjQ844NYWBGL
         ESNw==
X-Gm-Message-State: AOJu0Yyn4lPkALKRVHbOqavZ40bc+1fh6pQnha0HRu+YuQt3h27v/QYU
	hUwdCRYdNsHMHMOjEjwzTt/fkWdeJ4U28lslOZSjPw==
X-Google-Smtp-Source: AGHT+IFftRs3dPcu6O0OhThxtR8bcXVQFGGiwi0Ct1Wsm4gD9N/FBldJtlh3k9It5AHC5p/u1BypsA1/wFruHNSEbyQ=
X-Received: by 2002:a05:6a20:9793:b0:174:af85:954b with SMTP id
 hx19-20020a056a20979300b00174af85954bmr8954867pzc.22.1697470335048; Mon, 16
 Oct 2023 08:32:15 -0700 (PDT)
MIME-Version: 1.0
References: <20231009103621.374412-7-vincent.guittot@linaro.org>
 <ac8968b9-8463-4aa2-a38d-fc2b9137460d@arm.com> <CAKfTPtBhXRk_Y-xiHn9_jQ1C_ALzbr3-KdwzcTCyupzJ4Gru5g@mail.gmail.com>
 <ZS0oyhbVDtXO1p5b@arm.com>
In-Reply-To: <ZS0oyhbVDtXO1p5b@arm.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Mon, 16 Oct 2023 17:32:03 +0200
Message-ID: <CAKfTPtCg9aYnWsReT=xtznwkMMMEepj6j9z4J6_ST5oUv69aUA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20231016_083218_494664_F4B71700 
X-CRM114-Status: GOOD (  55.43  )
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

Hi Ionela,

On Mon, 16 Oct 2023 at 14:13, Ionela Voinescu <ionela.voinescu@arm.com> wrote:
>
> Hi both,
>
> On Wednesday 11 Oct 2023 at 16:25:46 (+0200), Vincent Guittot wrote:
> > On Wed, 11 Oct 2023 at 12:27, Pierre Gondois <pierre.gondois@arm.com> wrote:
> > >
> > > Hello Vincent,
> > >
> > > On 10/9/23 12:36, Vincent Guittot wrote:
> > > > cppc cpufreq driver can register an artificial energy model. In such case,
> > > > it also have to register the frequency that is used to define the CPU
> > > > capacity
> > > >
> > > > Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> > > > ---
> > > >   drivers/cpufreq/cppc_cpufreq.c | 18 ++++++++++++++++++
> > > >   1 file changed, 18 insertions(+)
> > > >
> > > > diff --git a/drivers/cpufreq/cppc_cpufreq.c b/drivers/cpufreq/cppc_cpufreq.c
> > > > index fe08ca419b3d..24c6ba349f01 100644
> > > > --- a/drivers/cpufreq/cppc_cpufreq.c
> > > > +++ b/drivers/cpufreq/cppc_cpufreq.c
> > > > @@ -636,6 +636,21 @@ static int populate_efficiency_class(void)
> > > >       return 0;
> > > >   }
> > > >
> > > > +
> > > > +static void cppc_cpufreq_set_capacity_ref_freq(struct cpufreq_policy *policy)
> > > > +{
> > > > +     struct cppc_perf_caps *perf_caps;
> > > > +     struct cppc_cpudata *cpu_data;
> > > > +     unsigned int ref_freq;
> > > > +
> > > > +     cpu_data = policy->driver_data;
> > > > +     perf_caps = &cpu_data->perf_caps;
> > > > +
> > > > +     ref_freq = cppc_cpufreq_perf_to_khz(cpu_data, perf_caps->highest_perf);
> > > > +
> > > > +     per_cpu(capacity_ref_freq, policy->cpu) = ref_freq;
> > >
> > > 'capacity_ref_freq' seems to be updated only if CONFIG_ENERGY_MODEL is set. However in
> > > [1], get_capacity_ref_freq() relies on 'capacity_ref_freq'. The cpufreq_schedutil governor
> > > should have a valid 'capacity_ref_freq' value set if the CPPC cpufreq driver is used
> > > without energy model I believe.
> >
> > we can disable it by setting capacity_ref_freq to 0 so it will
> > fallback on cpuinfo like intel and amd which uses default
> > SCHED_CAPACITY_SCALE capacity
> >
> > Could you provide me with more details about your platform ? I still
> > try to understand how the cpu compute capacity is set up on your
> > system. How do you set per_cpu cpu_scale variable ? we should set the
> > ref freq at the same time
> >
>
> Yes, the best place to set it would be in:
> drivers/base/arch_topology.c: topology_init_cpu_capacity_cppc()

Thanks. I didn't notice it

>
> But:
>  - That function reuses topology_normalize_cpu_scale() and when called
>    it needs to have capacity_ref_freq = 1. So either capacity_ref_freq
>    needs to be set for each CPU after topology_normalize_cpu_scale() is
>    called or we should not call topology_normalize_cpu_scale() here and
>    just unpack a CPPC specific version of it in
>    topology_init_cpu_capacity_cppc(). The latter is probably better as
>    we avoid iterating through all CPUs a couple of times.
>
>  - When set, capacity_ref_freq needs to be a "frequency" (at least
>    in reference to the reference frequencies provided by CPPC). So
>    cppc_cpufreq_khz_to_perf() and cppc_cpufreq_perf_to_khz() would need
>    to move to drivers/acpi/cppc_acpi.c. They don't have any dependency
>    on cpufreq (policies) so that should be alright.
>
> topology_init_cpu_capacity_cppc() is a better place to set
> capacity_ref_freq because one can do it for each CPU, and it not only

I agree, topology_init_cpu_capacity_cppc() is the best place to set
capacity_ref_freq()

> caters for the EAS case but also for frequency invariance, when
> arch_set_freq_scale() is called, if no counters are supported.
>
> When counters are supported, there are still two loose threads:
>  - amu_fie_setup(): Vincent, would you mind completely removing
>    cpufreq_get_hw_max_freq() and reusing arch_scale_freq_ref() here?

I wonder if we can have a ordering dependency problem as both
init_cpu_capacity_notifier() and init_amu_fie_notifier() are
registered for the same CPUFREQ_POLICY_NOTIFIER event and I'm not sure
 it will happen in the right ordering

>
>  - It would be nice if cppc_scale_freq_workfn() would use
>    arch_scale_freq_ref() as well, for consistency. But it would need
>    to be converted back to performance before use, so that would mean
>    extra work on the tick, which is not ideal.

This once seems more complex as it implies other arch that are not
using arch_topology.c and would need more rework so I would prefer to
make it a separate patchset

Thanks
Vincent

>
> Basically it would be good if what gets used for capacity
> (arch_scale_freq_ref()) gets used for frequency invariance as well,
> in all locations.
>
> Thanks,
> Ionela.
>
> > >
> > > Also 'capacity_ref_freq' seems to be set only for 'policy->cpu'. I believe it should
> > > be set for the whole perf domain in case this 'policy->cpu' goes offline.
> > >
> > > Another thing, related my comment to [1] and to [2], for CPPC the max capacity matches
> > > the boosting frequency. We have:
> > >    'non-boosted max capacity' < 'boosted max capacity'.
> > > -
> > > If boosting is not enabled, the CPU utilization can still go above the 'non-boosted max
> > > capacity'. The overutilization of the system seems to be triggered by comparing the CPU
> > > util to the 'boosted max capacity'. So systems might not be detected as overutilized.
> >
> > As Peter mentioned, we have to decide what is the original compute
> > capacity of your CPUs which is usually the sustainable max compute
> > capacity, especially when using EAS and EM
> >
> > >
> > > For the EAS energy computation, em_cpu_energy() tries to predict the frequency that will
> > > be used. It is currently unknown to the function that the frequency request will be
> > > clamped by __resolve_freq():
> > > get_next_freq()
> > > \-cpufreq_driver_resolve_freq()
> > >    \-__resolve_freq()
> > > This means that the energy computation might use boosting frequencies, which are not
> > > available.
> > >
> > > Regards,
> > > Pierre
> > >
> > > [1]: [PATCH v2 4/6] cpufreq/schedutil: use a fixed reference frequency
> > > [2]: https://lore.kernel.org/lkml/20230905113308.GF28319@noisy.programming.kicks-ass.net/
> > >
> > > > +}
> > > > +
> > > >   static void cppc_cpufreq_register_em(struct cpufreq_policy *policy)
> > > >   {
> > > >       struct cppc_cpudata *cpu_data;
> > > > @@ -643,6 +658,9 @@ static void cppc_cpufreq_register_em(struct cpufreq_policy *policy)
> > > >               EM_ADV_DATA_CB(cppc_get_cpu_power, cppc_get_cpu_cost);
> > > >
> > > >       cpu_data = policy->driver_data;
> > > > +
> > > > +     cppc_cpufreq_set_capacity_ref_freq(policy);
> > > > +
> > > >       em_dev_register_perf_domain(get_cpu_device(policy->cpu),
> > > >                       get_perf_level_count(policy), &em_cb,
> > > >                       cpu_data->shared_cpu_map, 0);

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
