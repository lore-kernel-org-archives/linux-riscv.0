Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C5F1CE7A94
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 12:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r8OJS+fX0vpwDClc0kaQP0dkt3qiNaZCneFqUY45J0o=; b=SbHtG7Sf+OrEKH
	hx5aHKjRvG6XjeOUOGouMkE3eNlkq1/4I12cICqYMkxaJEWCDLmGsN0TvpvqE66Iow1z0kITM2vZc
	HaaJ6Oe7/TXVcdp3CvFlFYGsD6mwS54XeR3jeF0lyfsytISyf3QPRB2mQbkGGNjr7U8EAGUul/CE2
	KU/xx1WigmvkGku0n9Pne54D5MBQQFb6azjKAnTDg3cuQcVReYfhxho4OG3fCHxQAjpE+7CzakoHd
	qJ51Hhja45ic2Fi/EJRE3JP1ylDmJGryL7gMEcncGmVnVFMG+K5zq8Fb5VnFiijTxO42FXz1NuJmz
	6M330m7g2rC5Oy/yTweQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkkMY-00EDhk-1N;
	Mon, 25 Sep 2023 12:06:54 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkkMP-00EDew-15
	for linux-riscv@lists.infradead.org;
	Mon, 25 Sep 2023 12:06:52 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1c5bf7871dcso44739405ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 25 Sep 2023 05:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695643604; x=1696248404; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FVUt6ZlZlt1P8Ceh/hubtNxz/DIJsD3wgxBUc0MmUI4=;
        b=K3zOQPQTmF6DRGg5YWOaOFnjTgI4i7EnMgGnvAzcjXT1ZGANoomQoF+1zDSg4F3k5l
         RBNZQXYA9Bb26OpfwXA8bn4vv2PCyclv7cPe19K5XYnVkytK64aLgk422+6nuhrPg3c3
         4K5w//aqKfFjID0UPpMsNV1pPed8EeFsqswzBJAK/lwod+vl7/tLTHqkWXs3m38eiSZd
         UYlVFyK3f8zPkrnNYET/AggANNx/p3JpUD3k77nruIev+QXh+xwGghCRbjGSp8gqGrBj
         ACM6EtsJ3ohMwGFKs1XtcriVg01zQgSRu+G5rzESwWbdsdDt61E+Kljk05HE236iQyUE
         U+KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695643604; x=1696248404;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FVUt6ZlZlt1P8Ceh/hubtNxz/DIJsD3wgxBUc0MmUI4=;
        b=YomAXO4Sni+cXcnQAE4OBoDQ8AztMJ/3nRekbfeLp2mq7Z+6+rUcRMoFiPtq5JD269
         2qfoL+Tg7hDXNx3e+3Lm2yRYArCzg9ScwTTfejmTXGeW304Kh9tLn1d2CIawzsY9+edn
         iNw4NClc6rBZq26mTDvYJSbzuAoUKHBGVkBHgRgXkNQJBFc8U1FMtsdvcNo5BMaV5gQh
         A2IkwdPAfSUgMIrLQi0byzRros+oDa/vogmy4HyKa/Gp0N7sf19kc7uC9sZ0W4zFQ4lR
         jbVMyCRUvN/OT2jCwBogRl/gDwjKizxve7xwv++AMNvW3V15vEFzOfVCf5Sz7/e/KWIM
         RwWw==
X-Gm-Message-State: AOJu0YyAzb5rnW1nJUZjbO2MLZmK6cqA3yqaEKfy8uQThlcrmBTxOmDx
	SiJGQ/mEug+i89BW9eVFO25qG8LATJ/MvM/WfwuUNA==
X-Google-Smtp-Source: AGHT+IHTZAYH6v2yVOscns05lwBAjB14afRWd6clMBTAdvhJtdZPNbdfJYyNaZhnqQS2GA/pbd76KDTydWoU80lawxU=
X-Received: by 2002:a17:90a:5a81:b0:268:b0b:a084 with SMTP id
 n1-20020a17090a5a8100b002680b0ba084mr4015345pji.46.1695643604484; Mon, 25 Sep
 2023 05:06:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230901130312.247719-1-vincent.guittot@linaro.org>
 <20230901130312.247719-4-vincent.guittot@linaro.org> <ZQwKnnXbjLOYUSjO@arm.com>
In-Reply-To: <ZQwKnnXbjLOYUSjO@arm.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Mon, 25 Sep 2023 14:06:32 +0200
Message-ID: <CAKfTPtCM_dsWcD6qru_nLYpDH9_OoziMy5d3zAofXNsXzG94xQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] cpufreq/schedutil: use a fixed reference frequency
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
X-CRM114-CacheID: sfid-20230925_050645_373684_711FBD66 
X-CRM114-Status: GOOD (  35.93  )
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

On Thu, 21 Sept 2023 at 11:19, Ionela Voinescu <ionela.voinescu@arm.com> wrote:
>
> On Friday 01 Sep 2023 at 15:03:11 (+0200), Vincent Guittot wrote:
> > cpuinfo_max_freq can change at runtime because of boost as example. This
> > implies that the value could not be the same than the one that has been
> > used when computing the capacity of a CPU.
> >
> > The new arch_scale_freq_ref() returns a fixed and coherent frequency
> > reference that can be used when computing a frequency based on utilization.
> >
> > Use this arch_scale_freq_ref() when available and fallback to
> > cpuinfo.max_freq otherwise.
> >
> > Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> > ---
> >  kernel/sched/cpufreq_schedutil.c | 29 +++++++++++++++++++++++++++--
> >  1 file changed, 27 insertions(+), 2 deletions(-)
> >
> > diff --git a/kernel/sched/cpufreq_schedutil.c b/kernel/sched/cpufreq_schedutil.c
> > index 4492608b7d7f..9996ef429e2b 100644
> > --- a/kernel/sched/cpufreq_schedutil.c
> > +++ b/kernel/sched/cpufreq_schedutil.c
> > @@ -114,6 +114,31 @@ static void sugov_deferred_update(struct sugov_policy *sg_policy)
> >       }
> >  }
> >
> > +#ifdef arch_scale_freq_ref
> > +/**
> > + * arch_scale_freq_ref_policy - get the reference frequency of a given CPU that
> > + * has been used to correlate frequency and compute capacity.
> > + * @cpu: the CPU in question.
> > + *
> > + * Return: the reference CPU frequency.
> > + */
> > +static __always_inline
> > +unsigned long  arch_scale_freq_ref_policy(struct cpufreq_policy *policy)
>
> This should not be an arch_ function as it's only a wrapper over an
> arch_ function and not a function that different architectures might
> implement differently usually in architecture specific code.

I expect this function to disappear at some point once all arch will
use it that why I named it arch_* but I can rename it

>
> > +{
> > +     return arch_scale_freq_ref(policy->cpu);
>
> It might make it easier to read if arch_scale_freq_ref() had a default
> implementation that returned 0.

I will use the suggestion made by Peter to have only one function


>
> Then this code would simply become:
>
> freq = arch_scale_freq_ref(policy->cpu);
> if (freq)
>         return freq;
> else if (arch_scale_freq_invariant())
>         return ..
> ..
>
> This approach is similar to the use of arch_freq_get_on_cpu() in
> cpufreq.c, and, as there, having a chosen maximum frequency of 0 would
> not be a valid value.
>
> > +}
> > +#else
> > +static __always_inline
> > +unsigned long  arch_scale_freq_ref_policy(struct cpufreq_policy *policy)
> > +{
> > +     if (arch_scale_freq_invariant())
> > +             return policy->cpuinfo.max_freq;
> > +
> > +
> > +     return policy->cur;
> > +}
> > +#endif
> > +
> >  /**
> >   * get_next_freq - Compute a new frequency for a given cpufreq policy.
> >   * @sg_policy: schedutil policy object to compute the new frequency for.
> > @@ -139,11 +164,11 @@ static void sugov_deferred_update(struct sugov_policy *sg_policy)
> >  static unsigned int get_next_freq(struct sugov_policy *sg_policy,
> >                                 unsigned long util, unsigned long max)
> >  {
> > +     unsigned int freq;
> >       struct cpufreq_policy *policy = sg_policy->policy;
> > -     unsigned int freq = arch_scale_freq_invariant() ?
> > -                             policy->cpuinfo.max_freq : policy->cur;
> >
> >       util = map_util_perf(util);
> > +     freq = arch_scale_freq_ref_policy(policy);
>
> Given its single use here, it would likely be better to place the code
> above directly here, rather than create a wrapper over a few lines of
> code.
>
> Hope it helps,
> Ionela.
>
> >       freq = map_util_freq(util, freq, max);
> >
> >       if (freq == sg_policy->cached_raw_freq && !sg_policy->need_freq_update)
> > --
> > 2.34.1
> >
> >

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
