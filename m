Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2D04C4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 10:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IpUZiG7Dnl8FXeq4sEJDDnsB2OjW4mhE8q8Ml6GnV4Q=; b=q8wjTGpL5m+cGl
	l65DG/qI35xu+fID7VUTibgl+HmDxQ5TLlr0mQY53mKrMpk/GH1HE7IPoLem0AorzWkYRbCgAWE4H
	hPcDVdQVZPlz2YdHqD8c7bihbDjgcTuEydjDtflj14EoBFXLQDQtHGgMij+g5uMudgFbh4me402B+
	WfmXvqpxySqg+IM0GIHMP8kqCRXvffSTIrXi0FMBz6riCvylJv4fTrvbqJZsWwbYI3rGBZSHUORoN
	lkcqirB52RCPTH9zmmFLzkzoFr58eZhlG0rbpjiS3tCPOJggr9p95I6WvnM7PQLKB4nSo5GSyJcP9
	Ayvmy2+JG81A9RcSTAgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyV7e-0098nN-0E;
	Thu, 02 Nov 2023 10:40:22 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyV7Y-0098ls-1m
	for linux-riscv@lists.infradead.org;
	Thu, 02 Nov 2023 10:40:20 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-28094a3b760so745025a91.3
        for <linux-riscv@lists.infradead.org>; Thu, 02 Nov 2023 03:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698921613; x=1699526413; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VHJLc1G73+gqKTC2Xm9NWInBDGQy6v8U6DlQWiOstY8=;
        b=VSwV6BOVBWVCjlKaL4ZxaWvIlMixIb2OAPKxB3cpeCCH5OvnLo+8Y3xJTFSD1k+5C7
         zVZkANGbTutg7UDt2tJlTU+iFHwf9QQ5+Dvk70Qb9Fg/qFCS761Zak97ZOedrpPXsj+m
         FvZoxc9XAx340egNqwapkxZQNuPWqcJh8AL3snoVXzGkaWuuICFk2H+9Qqou0az5+L0J
         AiIPbARtycXJ33RJf7umH1D6S2Ti7TFDQyGOPjxDPBNF6P10+1m3/zW405u46Otq03RE
         +CRXTOQgQtk1EZfYtjPpuXjl7JRMP4OUWdPb5fY/7ZsSkZkZ+CpoVStALOV3RnCbVNoC
         VeAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698921613; x=1699526413;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VHJLc1G73+gqKTC2Xm9NWInBDGQy6v8U6DlQWiOstY8=;
        b=DslA182zHIvTnXgUaOJKJnqE7lAoPBwozQgazaSzO/JdewwFLV/pMXc8dAycKRFQxv
         QmqSGigcXW6g0g/mSnZtVpCAyESrZIcaymBe7LnrBkk6vYWqzHpG+t7GrdKIFsuTcDPV
         1djvK/3wZqk5xYIV/1T3G08lBihSN3rCivz5jzOt2PmjRJ0KT5hXHEhZLBnys6jWy99Q
         8CbV1eUS635oRJtctbpufYArv0smI/1eVDwEdqs1nOFHyfvkbbrCSEXawqFsONxV5L9o
         1QDuH7W8wcbFcwq3pnWjizrZFo0og4yRhcsEZfQI6HY1WB1pq3SL8rvIyvSHIKi94o/0
         fl4w==
X-Gm-Message-State: AOJu0YwM7S53TRXkmVWf9hmLcNDuy9OIx1GZn/CUKtx1CUacKrCLVJHp
	F4XEyE8NBcq0leELmdDvEc6CsGaAOayhfMx/VKzlCg==
X-Google-Smtp-Source: AGHT+IG5Fx/wk5pJZI518EDcIhQ6yyQekshydKB4BpCdePXFbqLsJh6vVHLwUIeOLqdzX/f0W5WUrKqS/GQhQnehIKs=
X-Received: by 2002:a17:90b:1946:b0:27d:8fbd:be8c with SMTP id
 nk6-20020a17090b194600b0027d8fbdbe8cmr16042687pjb.28.1698921613003; Thu, 02
 Nov 2023 03:40:13 -0700 (PDT)
MIME-Version: 1.0
References: <20231027080400.56703-1-vincent.guittot@linaro.org>
 <20231027080400.56703-8-vincent.guittot@linaro.org> <ZUGUvdjrpw9NHSex@e129154.nice.arm.com>
 <CAKfTPtDDouduP57P8GH6J4qDjbKUasVRe-K0QUKcZHC2NZ+syQ@mail.gmail.com> <ZUN6K4d9FD31phbs@e129154.nice.arm.com>
In-Reply-To: <ZUN6K4d9FD31phbs@e129154.nice.arm.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Thu, 2 Nov 2023 11:40:01 +0100
Message-ID: <CAKfTPtATBHyCvGkoKrN1Y9LpWX7nb3njY2zFPiJyj2bTSfbcNw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20231102_034016_610156_8A417A3F 
X-CRM114-Status: GOOD (  34.40  )
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

On Thu, 2 Nov 2023 at 11:31, Beata Michalska <beata.michalska@arm.com> wrote:
>
> Hi Vincent,
>
> On Wed, Nov 01, 2023 at 10:04:27AM +0100, Vincent Guittot wrote:
> > Hi Beata,
> >
> > On Wed, 1 Nov 2023 at 00:59, Beata Michalska <beata.michalska@arm.com> wrote:
> > >
> > > On Fri, Oct 27, 2023 at 10:04:00AM +0200, Vincent Guittot wrote:
> > > > Use the new capacity_ref_freq to set the ratio that is used by AMU for
> > > > computing the arch_scale_freq_capacity().
> > > > This helps to keep everything aligned using the same reference for
> > > > computing CPUs capacity.
> > > >
> >
> > [..]
> >
> > > > @@ -381,6 +385,9 @@ void topology_init_cpu_capacity_cppc(void)
> > > >       }
> > > >
> > > >       for_each_possible_cpu(cpu) {
> > > > +             freq_inv_set_max_ratio(cpu,
> > > > +                                    per_cpu(capacity_ref_freq, cpu) * HZ_PER_KHZ);
> > > > +
> > > The capacity_ref_freq set earlier will still lead to units mismatch,
> > > as at the point of calling topology_init_cpu_capacity_cppc the lowest & nominal
> > > frequencies will be provided in MHz (unless I have missed smth).
> >
> > I don't get your point:
> > the unit of per_cpu(capacity_freq_ref, cpu) is Khz
> >
> > For cppc, we have
> > per_cpu(capacity_freq_ref, cpu) = cppc_perf_to_khz(&perf_caps,
> > raw_capacity[cpu]);
> >
> > freq_inv_set_max_ratio() uses
> > arch_timer_get_rate() which returns a freq in Hz
> > and
> > per_cpu(capacity_freq_ref, cpu) * HZ_PER_KHZ. to get a freq in Hz too.
> >
> Apologies, I should have been more verbose here.
> Before the change made in [1] the cppc_perf_to_khz was indeed operating on
> lowest & nominal frequency values expressed in kHZ, as those were appropriately
> amended:
> cppc_cpufreq_cpu_init
>         |__> cppc_cpufreq_get_cpu_data:
>                 |__>    ...
>                         /* Convert the lowest and nominal freq from MHz to KHz */
>                         cpu_data->perf_caps.lowest_freq *= 1000;
>                         cpu_data->perf_caps.nominal_freq *= 1000;
>
> So far cppc_perf_to_khz (previously cppc_cpufreq_perf_to_khz) was being called
> with the post-processed CPC data (through cppc_cpufreq_get_cpu_data) and thus
> guaranteed to be operating on values in kHz.
> With the new changes the cppc_perf_to_khz will operate on raw CPC data,
> which are expressed in MHz.(as per acpi spec)

Ok, thanks for the explanation. I haven't noticed that cppc_cpufreq
was processing the raw CPC data  (*1000) before using them. I'm going
to fix that.


>
> ---
> Best Regards
> B.
> > > This means that use of both, the capacity_ref_freq and the arch_freq_scale
> > > will generate unexpected results, so I guess this should get amended in the
> > > preceding patch (?) [1]
> > >
> > > ---
> > > BR
> > > B.
> > >
> > > [1] https://lore.kernel.org/linux-arm-kernel/20231027080400.56703-4-vincent.guittot@linaro.org/T/#m42daa167097edc190b1cfc05382c385ed801d909
> > >
> > > >               capacity = raw_capacity[cpu];
> > > >               capacity = div64_u64(capacity << SCHED_CAPACITY_SHIFT,
> > > >                                    capacity_scale);
> > > > @@ -422,8 +429,11 @@ init_cpu_capacity_callback(struct notifier_block *nb,
> > > >
> > > >       cpumask_andnot(cpus_to_visit, cpus_to_visit, policy->related_cpus);
> > > >
> > > > -     for_each_cpu(cpu, policy->related_cpus)
> > > > +     for_each_cpu(cpu, policy->related_cpus) {
> > > >               per_cpu(capacity_ref_freq, cpu) = policy->cpuinfo.max_freq;
> > > > +             freq_inv_set_max_ratio(cpu,
> > > > +                                    per_cpu(capacity_ref_freq, cpu) * HZ_PER_KHZ);
> > > > +     }
> > > >
> > > >       if (cpumask_empty(cpus_to_visit)) {
> > > >               topology_normalize_cpu_scale();
> > > > diff --git a/include/linux/arch_topology.h b/include/linux/arch_topology.h
> > > > index 38ca6c76af56..ffdf0b7c55fa 100644
> > > > --- a/include/linux/arch_topology.h
> > > > +++ b/include/linux/arch_topology.h
> > > > @@ -99,6 +99,7 @@ void update_siblings_masks(unsigned int cpu);
> > > >  void remove_cpu_topology(unsigned int cpuid);
> > > >  void reset_cpu_topology(void);
> > > >  int parse_acpi_topology(void);
> > > > +void freq_inv_set_max_ratio(int cpu, u64 max_rate);
> > > >  #endif
> > > >
> > > >  #endif /* _LINUX_ARCH_TOPOLOGY_H_ */
> > > > --
> > > > 2.34.1
> > > >

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
