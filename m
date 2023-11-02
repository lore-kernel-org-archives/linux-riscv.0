Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DF7AC4167B
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 10:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f7nc6/oQUeMnSH3DfgP6CzuDKgBi/lre038CZlWGg3s=; b=uvcn8zqj2J5/+t
	8ca2k01dRdNZtYwWPnwIH7WuD1Ro9QuJxeeGdrjA2GXdE0qC6j+n1I0x5vtaL08JqHheJcpofcudh
	E7zCYjbfKNqPFvaVM7FgOWJwjs9ZYuvlmH6D7h6Nh1CtUE51Ll2t+8fhmKCJeHukLE0tvw0CmAdrU
	AEwQBR4FTxk4bcpV5p7oCXqQxLMA6HcOoIZ3XkZhVscfO7T3IiLbDzhrldVzqNebgVDYWFbHDC3qV
	temoX1JYOBhog2wZkThnbgQ5Sv4scQN+/nvwIqUPn5X6iV+xgqz85+/X2pQCwvCXfXee2Fx/BMZX0
	blApGGa38u2B9ylVZ7cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyVA7-00990I-1u;
	Thu, 02 Nov 2023 10:42:55 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyVA2-0098z1-26
	for linux-riscv@lists.infradead.org;
	Thu, 02 Nov 2023 10:42:54 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-5a9bf4fbd3fso567818a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 02 Nov 2023 03:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698921768; x=1699526568; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Pd/NLx66E9zKbyZKSmW6GKzzom6QC7VJQH4VG6waGJI=;
        b=NpYGyl7+Q9MnjvKI1QtLgav5ForuMPyDdrzoinZfW43mCokzKxtc640yH1zFnaRh0o
         88LSPoNdmp2Ir3PhU0XI4bq115/pPPDKEaWUv9iJ8YujItO9dI9HhmLlE+z9CxcuUpiO
         42UBNzQWuP4aU4PXVZjSkF2OOdcrc8DdGCgApiytiXgOTmChITDlHWoJvF19DB7+/zA1
         mDIZsk79Us9l6wAKvIElsIeftt/8flA45NOzy5yQWm7Mk4emaf3e/hbgvovT72PqRRz4
         JCWCwv9oSD3XEzzQimPRFEhQhCY2imA/yf0C0aqVuKmBf1qqLc3racC4f2s8WM2wRDxn
         lZsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698921768; x=1699526568;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pd/NLx66E9zKbyZKSmW6GKzzom6QC7VJQH4VG6waGJI=;
        b=waCP+YQwMpk85C414x2qD0Oh4ty9+aMnIiWWxsDTl96Geci7IPHxTp8rUorZ5FKrFg
         i3pR4F62j1n4uQLbBWJj1hdY86llx0IBqxayT/22/IVs+/ErfUFwBn8lx4eBSq7OH09t
         d8Fs32eegUsvr+h8mkC9jH5wpJ9BD7J7hquYr0PMSx3LBpA4earnN9gfT2NjQOYGCpZ+
         pwf+/GWePajxuwjijOnGRrmQjitR5AcFIdmTVqjrI1wFiAlDp5lXEjV6XhmB2uigslAu
         swro+JRriv7RC++L3/Ah+MPo8sY5F1fxtJdj8Gn2aH3c7dvlrACGOw7QMhgbUHByg/6Y
         mW7w==
X-Gm-Message-State: AOJu0YzXSib+1GZtZASAb7TxW+iE1V9zC9eovCs7dkZ+06NM+QqI3BJN
	ttVRZu8F6xaRMe9wv5yiRSLf/HbPZHBl6Hrnkr/oPg==
X-Google-Smtp-Source: AGHT+IG9q8u5gOigN0kAQNp7r+iSnUd3jOn4cu/HyW0nSc2d2OH3QUFya3mfy+9toAaBAa+OcGAKzvricdwJEQfd/c4=
X-Received: by 2002:a05:6a21:7903:b0:181:7914:7b34 with SMTP id
 bg3-20020a056a21790300b0018179147b34mr3334001pzc.21.1698921768594; Thu, 02
 Nov 2023 03:42:48 -0700 (PDT)
MIME-Version: 1.0
References: <20231027080400.56703-1-vincent.guittot@linaro.org>
 <20231027080400.56703-7-vincent.guittot@linaro.org> <89b5db0e-1121-4d0c-a8f4-1202465f5251@arm.com>
In-Reply-To: <89b5db0e-1121-4d0c-a8f4-1202465f5251@arm.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Thu, 2 Nov 2023 11:42:37 +0100
Message-ID: <CAKfTPtDKMhNpjATHtVuTvas59=ugtw7Q2T3fVKx8T83=-nM3xQ@mail.gmail.com>
Subject: Re: [PATCH v4 6/7] cpufreq/cppc: set the frequency used for computing
 the capacity
To: Pierre Gondois <pierre.gondois@arm.com>
Cc: linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	sudeep.holla@arm.com, gregkh@linuxfoundation.org, rafael@kernel.org, 
	mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, bristot@redhat.com, vschneid@redhat.com, 
	viresh.kumar@linaro.org, lenb@kernel.org, robert.moore@intel.com, 
	lukasz.luba@arm.com, ionela.voinescu@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org, 
	linux-acpi@vger.kernel.org, acpica-devel@lists.linuxfoundation.org, 
	conor.dooley@microchip.com, suagrfillet@gmail.com, ajones@ventanamicro.com, 
	lftan@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231102_034250_715799_BF814596 
X-CRM114-Status: GOOD (  20.68  )
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

Hi Pierre,

On Thu, 2 Nov 2023 at 10:07, Pierre Gondois <pierre.gondois@arm.com> wrote:
>
> Hello Vincent,
>
> On 10/27/23 10:03, Vincent Guittot wrote:
> > Save the frequency associated to the performance that has been used when
> > initializing the capacity of CPUs.
> > Also, cppc cpufreq driver can register an artificial energy model. In such
> > case, it needs the frequency for this compute capacity.
> >
> > Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> > ---
> >   drivers/base/arch_topology.c | 15 ++++++++++++++-
> >   1 file changed, 14 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
> > index 9a073c2d2086..d4bef370feb3 100644
> > --- a/drivers/base/arch_topology.c
> > +++ b/drivers/base/arch_topology.c
> > @@ -349,6 +349,7 @@ bool __init topology_parse_cpu_capacity(struct device_node *cpu_node, int cpu)
> >
> >   void topology_init_cpu_capacity_cppc(void)
> >   {
> > +     u64 capacity, capacity_scale = 0;
> >       struct cppc_perf_caps perf_caps;
> >       int cpu;
> >
> > @@ -365,6 +366,10 @@ void topology_init_cpu_capacity_cppc(void)
> >                   (perf_caps.highest_perf >= perf_caps.nominal_perf) &&
> >                   (perf_caps.highest_perf >= perf_caps.lowest_perf)) {
> >                       raw_capacity[cpu] = perf_caps.highest_perf;
> > +                     capacity_scale = max_t(u64, capacity_scale, raw_capacity[cpu]);
> > +
> > +                     per_cpu(capacity_ref_freq, cpu) = cppc_perf_to_khz(&perf_caps, raw_capacity[cpu]);
> > +
>
> To continue Beata's point, I think there is an issue with the following:
> cppc_perf_to_khz() and cppc_khz_to_perf() were previously used with a struct containing
> frequencies in KHz, cf. [1].
> In the original _CPC object, frequencies are in MHz. It means that the perf_caps struct
> here contains frequencies in MHz, and per_cpu(capacity_ref_freq, cpu) is in MHz aswell.

Yeah, I haven't noticed this intermediate step in cppc_cpufreq. I'm
going to fix this

>
> [1] https://github.com/torvalds/linux/blob/master/drivers/cpufreq/cppc_cpufreq.c#L682
>
>
> >                       pr_debug("cpu_capacity: CPU%d cpu_capacity=%u (raw).\n",
> >                                cpu, raw_capacity[cpu]);
> >                       continue;
> > @@ -375,7 +380,15 @@ void topology_init_cpu_capacity_cppc(void)
> >               goto exit;
> >       }
> >
> > -     topology_normalize_cpu_scale();
> > +     for_each_possible_cpu(cpu) {
> > +             capacity = raw_capacity[cpu];
> > +             capacity = div64_u64(capacity << SCHED_CAPACITY_SHIFT,
> > +                                  capacity_scale);
> > +             topology_set_cpu_scale(cpu, capacity);
> > +             pr_debug("cpu_capacity: CPU%d cpu_capacity=%lu\n",
> > +                     cpu, topology_get_cpu_scale(cpu));
> > +     }
> > +
> >       schedule_work(&update_topology_flags_work);
> >       pr_debug("cpu_capacity: cpu_capacity initialization done\n");
> >

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
