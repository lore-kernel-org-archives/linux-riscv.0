Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6DC8CD6E79
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Oct 2023 14:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2wSJEYtKGoW5IGK1myijN4O1nwCcwitSQnQTGzt1ITs=; b=LMvXroLdRq3xzR
	lpUL+dlHuBI9LfmTZURrADvaePFLx23sBaamWqrDveKk59exMpg0R1O4cycFu4zhHM+MJMbK1q6u1
	25dh+rOGJGdwmQH2mRzZH/mExhaWaI97TkKhP+WOSby/st2QvbPMWkdpPdvPJevA71SCOEklX/fvm
	NoKAjUWuJwyg8KQC1tSED7aMimbr4kyz7VJ2nBYv9ryoSYe4/uRb/mPdBshwdA7ZoXboETAEMyESS
	fP2iTGrH6wvZLou7wwpf2zMeaX+GpZvusS7lGZ+cm6VxLz9VGzbjir8X+yL8vqIkhxaC9TPOz8Hmi
	n85GkD9Mm0b6a6vAI1Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqa9z-00G5Zw-0O;
	Wed, 11 Oct 2023 14:26:03 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqa9u-00G5Wt-2a
	for linux-riscv@lists.infradead.org;
	Wed, 11 Oct 2023 14:26:01 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1c8a1541232so34918325ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 11 Oct 2023 07:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697034357; x=1697639157; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=l14hTncC5mvc9d55sNzpnO/j1EgvBAnkseX/eOj6QQ8=;
        b=h+Pg7p4v0EpbFIA956InCLEOMXTTObnxMaRYzhwtt+LZ+B4iwgX0ZLIw04wa8woESF
         /IerOFWcB3yOhTUngroVMWxFNT3YmRbxIy2/kNwjecEDsRoRzojdyMsCh87xtkHIb7Bg
         uScsUBKvayuOIaukG+QGa8wFXxvO4hCgJz7u0AjchKA21fiAGjKROAzllXVexHprU0oF
         9aZ2dqdm6pSCy77Y9++faxrgvZ8V6E8+vt7r0M8UG2TVJ8JToKYp406YayNordlLJ1Qj
         2eg4GhGrNvuz0CztdGDYieWrFOZq8YQo57bCz4b8dCDrbSSpH2McBOubc+GM9RoMQSxA
         5n6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697034357; x=1697639157;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l14hTncC5mvc9d55sNzpnO/j1EgvBAnkseX/eOj6QQ8=;
        b=WRh2jPJVmGSNCLVx+It/NU/u2aVH/SqO4y7qzGHZWU6/+qsYe6NumF8w7SQB5aSteH
         3og7Tj50kkYZsSDNvTQjrJ02ERO1cqxjcr66vA2lm27R0tY30WTSE63AMCWQ/zGom64T
         cA31RyQIpd+t27XDtsW8TD3GiABDfvur95bFD03yXWSXos2N/nMGHDZs2DKO7iM6mVLY
         vzA+kQpirbMaqIEH1UskW5k3ka7vtdDyDqv0XaytV/2jx3Fwjviz7gI1SZtGnrWGozw2
         Mp8HcAMFsIH44yWa8WTz/RHn5s+rH2OlqxrLZs5lRy+ktn12BluOifus8NHxb8gXWO3p
         LFHg==
X-Gm-Message-State: AOJu0Yx8Z9cChnXQzaDS8Nd6Ao7GMxnywawDy5gS7swH2/7w/U4NRHEW
	f0qHT6NkSSXzPR+IkMOiJjgwuKvgSKNhL1ogcGg9aSPz+Ti4q2h4isI=
X-Google-Smtp-Source: AGHT+IEWkxKy7XH4G4dusSIdv8F7TkD3FNAIrXX1NOI+wrbvLjl3cPagIDjlyQ3TAMp3+0VNOOg/I7dqaW8LUiMWIfQ=
X-Received: by 2002:a17:903:248:b0:1c7:495c:87e0 with SMTP id
 j8-20020a170903024800b001c7495c87e0mr25613343plh.37.1697034357305; Wed, 11
 Oct 2023 07:25:57 -0700 (PDT)
MIME-Version: 1.0
References: <20231009103621.374412-1-vincent.guittot@linaro.org>
 <20231009103621.374412-7-vincent.guittot@linaro.org> <ac8968b9-8463-4aa2-a38d-fc2b9137460d@arm.com>
In-Reply-To: <ac8968b9-8463-4aa2-a38d-fc2b9137460d@arm.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Wed, 11 Oct 2023 16:25:46 +0200
Message-ID: <CAKfTPtBhXRk_Y-xiHn9_jQ1C_ALzbr3-KdwzcTCyupzJ4Gru5g@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] cpufreq/cppc: set the frequency used for capacity computation
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
X-CRM114-CacheID: sfid-20231011_072558_839374_2D3D91D2 
X-CRM114-Status: GOOD (  29.23  )
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
> > cppc cpufreq driver can register an artificial energy model. In such case,
> > it also have to register the frequency that is used to define the CPU
> > capacity
> >
> > Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> > ---
> >   drivers/cpufreq/cppc_cpufreq.c | 18 ++++++++++++++++++
> >   1 file changed, 18 insertions(+)
> >
> > diff --git a/drivers/cpufreq/cppc_cpufreq.c b/drivers/cpufreq/cppc_cpufreq.c
> > index fe08ca419b3d..24c6ba349f01 100644
> > --- a/drivers/cpufreq/cppc_cpufreq.c
> > +++ b/drivers/cpufreq/cppc_cpufreq.c
> > @@ -636,6 +636,21 @@ static int populate_efficiency_class(void)
> >       return 0;
> >   }
> >
> > +
> > +static void cppc_cpufreq_set_capacity_ref_freq(struct cpufreq_policy *policy)
> > +{
> > +     struct cppc_perf_caps *perf_caps;
> > +     struct cppc_cpudata *cpu_data;
> > +     unsigned int ref_freq;
> > +
> > +     cpu_data = policy->driver_data;
> > +     perf_caps = &cpu_data->perf_caps;
> > +
> > +     ref_freq = cppc_cpufreq_perf_to_khz(cpu_data, perf_caps->highest_perf);
> > +
> > +     per_cpu(capacity_ref_freq, policy->cpu) = ref_freq;
>
> 'capacity_ref_freq' seems to be updated only if CONFIG_ENERGY_MODEL is set. However in
> [1], get_capacity_ref_freq() relies on 'capacity_ref_freq'. The cpufreq_schedutil governor
> should have a valid 'capacity_ref_freq' value set if the CPPC cpufreq driver is used
> without energy model I believe.

we can disable it by setting capacity_ref_freq to 0 so it will
fallback on cpuinfo like intel and amd which uses default
SCHED_CAPACITY_SCALE capacity

Could you provide me with more details about your platform ? I still
try to understand how the cpu compute capacity is set up on your
system. How do you set per_cpu cpu_scale variable ? we should set the
ref freq at the same time

>
> Also 'capacity_ref_freq' seems to be set only for 'policy->cpu'. I believe it should
> be set for the whole perf domain in case this 'policy->cpu' goes offline.
>
> Another thing, related my comment to [1] and to [2], for CPPC the max capacity matches
> the boosting frequency. We have:
>    'non-boosted max capacity' < 'boosted max capacity'.
> -
> If boosting is not enabled, the CPU utilization can still go above the 'non-boosted max
> capacity'. The overutilization of the system seems to be triggered by comparing the CPU
> util to the 'boosted max capacity'. So systems might not be detected as overutilized.

As Peter mentioned, we have to decide what is the original compute
capacity of your CPUs which is usually the sustainable max compute
capacity, especially when using EAS and EM

>
> For the EAS energy computation, em_cpu_energy() tries to predict the frequency that will
> be used. It is currently unknown to the function that the frequency request will be
> clamped by __resolve_freq():
> get_next_freq()
> \-cpufreq_driver_resolve_freq()
>    \-__resolve_freq()
> This means that the energy computation might use boosting frequencies, which are not
> available.
>
> Regards,
> Pierre
>
> [1]: [PATCH v2 4/6] cpufreq/schedutil: use a fixed reference frequency
> [2]: https://lore.kernel.org/lkml/20230905113308.GF28319@noisy.programming.kicks-ass.net/
>
> > +}
> > +
> >   static void cppc_cpufreq_register_em(struct cpufreq_policy *policy)
> >   {
> >       struct cppc_cpudata *cpu_data;
> > @@ -643,6 +658,9 @@ static void cppc_cpufreq_register_em(struct cpufreq_policy *policy)
> >               EM_ADV_DATA_CB(cppc_get_cpu_power, cppc_get_cpu_cost);
> >
> >       cpu_data = policy->driver_data;
> > +
> > +     cppc_cpufreq_set_capacity_ref_freq(policy);
> > +
> >       em_dev_register_perf_domain(get_cpu_device(policy->cpu),
> >                       get_perf_level_count(policy), &em_cb,
> >                       cpu_data->shared_cpu_map, 0);

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
