Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7DE2C4167B
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Nov 2023 09:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=urz7F1gW5JywKdAWCQ5leeO0AZalrnUokwQ7L70azBs=; b=DarJ+TZgoMfWbg
	TeThKflYEie6p5mCM/JQrqBP/G0/bWJDIGwra4waZc4bjK1/od/it5a1KQXJ+TlWQBxQj7O+j5jFP
	ESQ3MGOkfhHHYdHcqtZrWwv7C4Hc608QZDvMbyNpj9joRcY9K10Tuwm6sUS5RjtR2YfKg+WN7AllH
	QzLM2dS75vPUTC9eSOnL2lz3+f9ObLdm2FlKGrnC0Vma3n4Yvs3dK0H6h64CC2nCJgbKpotxLNIo0
	cdDiVG+xJRt+m3vQw+Fwuh3ejekFQC5Kb7lnARntUCmscnJPYS4gtBdMEgVWZ2w4SLumygsyKi/p/
	rl4V96FM/TG5YqmQGNzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qy79b-006v5x-0M;
	Wed, 01 Nov 2023 09:04:47 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qy79V-006v3q-0j
	for linux-riscv@lists.infradead.org;
	Wed, 01 Nov 2023 09:04:45 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-53fa455cd94so4901654a12.2
        for <linux-riscv@lists.infradead.org>; Wed, 01 Nov 2023 02:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698829480; x=1699434280; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=T97XsuQPDMRDtHy08B+rqECq/pabjxSIR/W6V7wvFWM=;
        b=d48COgA863Kw7K4ZW/mIHHxO5ViM2TY10GfgT+yeFmzggMSNFfTv0/I9P0Y1Hr8mPP
         h7jJftKugVDvdivV6HDuqkz/xF2ZOGC8CaF1CT7nK2nikeKiqlwHs6+IsesEhvcMUVr1
         cKkZAznApizSOtHYj0kwajfH9MWP0IOaYYmue5KcSE1mhXyeUN1vYm2q6kn0cF9bAWZ5
         isv7uM/FA/MdahfRtYSXsVE3xcYqDkxCKByPBYJYHj8/GRVTf6NY/gI0dUwc9o4sGZZR
         +C2L9W8KTXAaI1t0mgrB5JNKSWFmvKVw5BLxyVaB5oL3dp6aleGA8yBIuWQLqgsOWrbi
         5LQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698829480; x=1699434280;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T97XsuQPDMRDtHy08B+rqECq/pabjxSIR/W6V7wvFWM=;
        b=sZrLBqfXlVLk3yLzJgqtkHXOAi9ZY74M0bxDZzDSIPC1QmyBkTyMMxpduCpau/uiQd
         /7jYkxq3oQsvSFUPu6fra8TFbaruLo2vorY4E+UYKxlemgMLLkITQ0mMNvf5zODU1eEM
         VoKsbd4xxMv+0OH2r5hVzBHtxzWOWgC26j4cEb1vY7mxqmH7r3EBeTuyBanM+bStMhtC
         KfmO8aKs7NXjJwiqDZ5477tCs3WrtV0Gk0MSOdROhldUdQb0Yh3CptFvhh1nhwD7nTII
         OYm7ZufiN4yjVI1r15IEsxyGr4OnzoJFe4AvXGDOnwFrnBolkJSvKOqA4/TNdDqOl9KP
         ljRw==
X-Gm-Message-State: AOJu0YwMNLt9MSIdp5tlJ7CwZQbypsL18P6BGj8LPlgV6kc6TErBzBli
	Ks3Q2akZbi2e+t1v+U7XDS6JmIPk/1DKA3U3nJVlGQ==
X-Google-Smtp-Source: AGHT+IE3lvIVL/RqHctY3lvCHB1fhOmc51H/phVezjStkLmOqrn9OaDOQHPPmsK4zrwvjKKx4RwmqYLMKXfHu3BQP9o=
X-Received: by 2002:a05:6a20:4327:b0:16b:b4a0:e06b with SMTP id
 h39-20020a056a20432700b0016bb4a0e06bmr14390989pzk.43.1698829479791; Wed, 01
 Nov 2023 02:04:39 -0700 (PDT)
MIME-Version: 1.0
References: <20231027080400.56703-1-vincent.guittot@linaro.org>
 <20231027080400.56703-8-vincent.guittot@linaro.org> <ZUGUvdjrpw9NHSex@e129154.nice.arm.com>
In-Reply-To: <ZUGUvdjrpw9NHSex@e129154.nice.arm.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Wed, 1 Nov 2023 10:04:27 +0100
Message-ID: <CAKfTPtDDouduP57P8GH6J4qDjbKUasVRe-K0QUKcZHC2NZ+syQ@mail.gmail.com>
Subject: Re: [PATCH v4 7/7] arm64/amu: use capacity_ref_freq to set AMU ratio
To: Beata Michalska <beata.michalska@arm.com>
Cc: linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	sudeep.holla@arm.com, gregkh@linuxfoundation.org, rafael@kernel.org, 
	mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, bristot@redhat.com, vschneid@redhat.com, 
	viresh.kumar@linaro.org, lenb@kernel.org, robert.moore@intel.com, 
	lukasz.luba@arm.com, ionela.voinescu@arm.com, pierre.gondois@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org, 
	linux-acpi@vger.kernel.org, acpica-devel@lists.linuxfoundation.org, 
	conor.dooley@microchip.com, suagrfillet@gmail.com, ajones@ventanamicro.com, 
	lftan@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231101_020441_265554_50015343 
X-CRM114-Status: GOOD (  20.42  )
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

Hi Beata,

On Wed, 1 Nov 2023 at 00:59, Beata Michalska <beata.michalska@arm.com> wrote:
>
> On Fri, Oct 27, 2023 at 10:04:00AM +0200, Vincent Guittot wrote:
> > Use the new capacity_ref_freq to set the ratio that is used by AMU for
> > computing the arch_scale_freq_capacity().
> > This helps to keep everything aligned using the same reference for
> > computing CPUs capacity.
> >

[..]

> > @@ -381,6 +385,9 @@ void topology_init_cpu_capacity_cppc(void)
> >       }
> >
> >       for_each_possible_cpu(cpu) {
> > +             freq_inv_set_max_ratio(cpu,
> > +                                    per_cpu(capacity_ref_freq, cpu) * HZ_PER_KHZ);
> > +
> The capacity_ref_freq set earlier will still lead to units mismatch,
> as at the point of calling topology_init_cpu_capacity_cppc the lowest & nominal
> frequencies will be provided in MHz (unless I have missed smth).

I don't get your point:
the unit of per_cpu(capacity_freq_ref, cpu) is Khz

For cppc, we have
per_cpu(capacity_freq_ref, cpu) = cppc_perf_to_khz(&perf_caps,
raw_capacity[cpu]);

freq_inv_set_max_ratio() uses
arch_timer_get_rate() which returns a freq in Hz
and
per_cpu(capacity_freq_ref, cpu) * HZ_PER_KHZ. to get a freq in Hz too.

> This means that use of both, the capacity_ref_freq and the arch_freq_scale
> will generate unexpected results, so I guess this should get amended in the
> preceding patch (?) [1]
>
> ---
> BR
> B.
>
> [1] https://lore.kernel.org/linux-arm-kernel/20231027080400.56703-4-vincent.guittot@linaro.org/T/#m42daa167097edc190b1cfc05382c385ed801d909
>
> >               capacity = raw_capacity[cpu];
> >               capacity = div64_u64(capacity << SCHED_CAPACITY_SHIFT,
> >                                    capacity_scale);
> > @@ -422,8 +429,11 @@ init_cpu_capacity_callback(struct notifier_block *nb,
> >
> >       cpumask_andnot(cpus_to_visit, cpus_to_visit, policy->related_cpus);
> >
> > -     for_each_cpu(cpu, policy->related_cpus)
> > +     for_each_cpu(cpu, policy->related_cpus) {
> >               per_cpu(capacity_ref_freq, cpu) = policy->cpuinfo.max_freq;
> > +             freq_inv_set_max_ratio(cpu,
> > +                                    per_cpu(capacity_ref_freq, cpu) * HZ_PER_KHZ);
> > +     }
> >
> >       if (cpumask_empty(cpus_to_visit)) {
> >               topology_normalize_cpu_scale();
> > diff --git a/include/linux/arch_topology.h b/include/linux/arch_topology.h
> > index 38ca6c76af56..ffdf0b7c55fa 100644
> > --- a/include/linux/arch_topology.h
> > +++ b/include/linux/arch_topology.h
> > @@ -99,6 +99,7 @@ void update_siblings_masks(unsigned int cpu);
> >  void remove_cpu_topology(unsigned int cpuid);
> >  void reset_cpu_topology(void);
> >  int parse_acpi_topology(void);
> > +void freq_inv_set_max_ratio(int cpu, u64 max_rate);
> >  #endif
> >
> >  #endif /* _LINUX_ARCH_TOPOLOGY_H_ */
> > --
> > 2.34.1
> >

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
