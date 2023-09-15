Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46BEFEE645C
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 13:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2NTK0WhEg4TB7injo094eC1O15HtBZsKjHQeAeouihU=; b=ogUw/9dIwSFM8L
	/sMx5NWfXu0Jloh4V1oabnhHoD9UvbDAubl76rCsoAsadCHU0X6miU74Lb26/cLz3ZzHGZqaq2q5+
	8+qJuCRWQRL1TXGBuoWlXBCLDxlQTdfoPSW5G/krtalYlddO6LKxFHEi98jtWB654iqjen0EywQWl
	vCfrayddh+HKlfEgvxALqUWXJTZoyJ0Lw0etfkDCjiyhB8zogTZKr5d+kMuDgZl1+s/DABr9r02M7
	yAijBNmsy7yL89s2OUOv8pDuYakZW3C/B22bYGhI+7jvbEIWU4UoiPpPBmXbOCacMkLrSR7rEaDd5
	ilb2Vn/KDLe8JZSTmFgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh8zJ-00Ap94-2a;
	Fri, 15 Sep 2023 13:36:01 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh8zG-00Ap87-0b
	for linux-riscv@lists.infradead.org;
	Fri, 15 Sep 2023 13:35:59 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-2746af1b835so1475729a91.2
        for <linux-riscv@lists.infradead.org>; Fri, 15 Sep 2023 06:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694784957; x=1695389757; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OZ8CSbGWetSq5KjL5/lk3LJxa/SsVHXEdQVhCsaB3uQ=;
        b=CZHUCSdNIqFwgSD/tMpfrVC9qgA265mjBWgHWWqiF3nwJ+TW3AXpku411Y/H5/ITNn
         X7fqc4pXZ0RQKgIzBnTTbPTD8pIuKROhQfnKQPTNjGq7X/6UmYNfHmMFE0q7gxZOp3ag
         c1UptwSHtKgNqSqUlBQ178Uy8NfMjqb+JskRVojlPuxfDS99AWoFXwLfwaBQeBBVyH1q
         oJ+ikHvjaOxrYaxuPjiYYDdunW3Cisjbev0b59vD13t8qCQ5SoE2Z4PrdvVpYuIcPSpv
         GMf1aUjt0pyih29XHVJVPVOdYJZRGBjWbN3d080acqi7lQKTAkq4kQm4MctGlGqAeIF9
         yrPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694784957; x=1695389757;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OZ8CSbGWetSq5KjL5/lk3LJxa/SsVHXEdQVhCsaB3uQ=;
        b=jw1wSK8/N8qXBqJmileVo0MH6IALfhGf5gYQlhqvWPl530Hmbs9T896Aak9l/8g87K
         lFDlOCKjAjRxqKT4r9zCL1E447OIL0NaF7gNSlMjNV6nZE/Jby2eI1Pcu+zqKo1IzdV/
         nFnj0OLwWL9Erc4r3sgCHy+m5nQ8O4UeJhhonh3N6bzvxfQ8ZoDkPLlJ46/BzzqyiEqG
         WCWmIirXXIndHF1hbqky9R4U4BpSMLJrDxMjLHbM9B4cM5+QnPxExMGU50YJgvq4QGm+
         QrOVoy6FMq02uRyWcl6VqEg7/Ki0PSxXNiMv3KHT/BO4x+nhfUDKM6fHP1u/REZYj46N
         Lvrg==
X-Gm-Message-State: AOJu0YzaIVrUHMmgOjPbM4b2K/Jlj+F6ucVwj9rMhvwU3x5OXOe+pggm
	ex2WWBJ3FfQivB2mNT6nEyqA3btg7HZEqTGEjK171g==
X-Google-Smtp-Source: AGHT+IFwjT0h9F2Ard6U8WLpdM+nhA36OwS1IIu8c2vCtkZ5nia7iOFHTHVgtD7ruyjxTYqWUmmfnL6OvVnvqIMepmU=
X-Received: by 2002:a17:90a:6746:b0:269:524f:2a19 with SMTP id
 c6-20020a17090a674600b00269524f2a19mr1537651pjm.26.1694784957249; Fri, 15 Sep
 2023 06:35:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230901130312.247719-1-vincent.guittot@linaro.org>
 <20230901130312.247719-5-vincent.guittot@linaro.org> <8cfa9edb-67f9-80f9-0a5c-1920f95b338a@arm.com>
In-Reply-To: <8cfa9edb-67f9-80f9-0a5c-1920f95b338a@arm.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Fri, 15 Sep 2023 15:35:46 +0200
Message-ID: <CAKfTPtDxJjj6wtpRnLjUi65j+5sQyYcHsQzbd+eSQCf4MVOiWA@mail.gmail.com>
Subject: Re: [PATCH 4/4] energy_model: use a fixed reference frequency
To: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	sudeep.holla@arm.com, gregkh@linuxfoundation.org, rafael@kernel.org, 
	mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com, 
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, bristot@redhat.com, 
	vschneid@redhat.com, viresh.kumar@linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org, 
	conor.dooley@microchip.com, suagrfillet@gmail.com, ajones@ventanamicro.com, 
	lftan@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_063558_251138_4C72C30C 
X-CRM114-Status: GOOD (  16.76  )
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

On Thu, 14 Sept 2023 at 23:07, Dietmar Eggemann
<dietmar.eggemann@arm.com> wrote:
>
> On 01/09/2023 15:03, Vincent Guittot wrote:
>
> [...]
>
> > diff --git a/include/linux/energy_model.h b/include/linux/energy_model.h
> > index b9caa01dfac4..7ee07be6928e 100644
> > --- a/include/linux/energy_model.h
> > +++ b/include/linux/energy_model.h
> > @@ -204,6 +204,20 @@ struct em_perf_state *em_pd_get_efficient_state(struct em_perf_domain *pd,
> >       return ps;
> >  }
> >
> > +#ifdef arch_scale_freq_ref
> > +static __always_inline
> > +unsigned long  arch_scale_freq_ref_em(int cpu, struct em_perf_domain *pd)
>
> Why is this function named with the arch prefix?
>
> So far we have 5 arch functions (arch_scale_freq_tick() <->
> arch_scale_freq_ref()) and e.g. Arm/Arm64 defines them with there
> topology_foo implementations.
>
> Isn't arch_scale_freq_ref_em() (as well as arch_scale_freq_ref_policy())
> different in this sense and so a proper EM function which should
> manifest in its name?

arch_scale_freq_ref_em() is there to handle cases where
arch_scale_freq_ref() is not defined by arch. I keep arch_ prefix
because this should be provided by architecture which wants to use EM.

In the case of EM, it's only there for allyes|randconfig on arch that
doesn't use arch_topology.c like x86_64

>
> > +{
> > +     return arch_scale_freq_ref(cpu);
> > +}
> > +#else
> > +static __always_inline
> > +unsigned long  arch_scale_freq_ref_em(int cpu, struct em_perf_domain *pd)
> > +{
> > +     return pd->table[pd->nr_perf_states - 1].frequency;
> > +}
> > +#endif
>
> [...]
>
> > @@ -241,11 +255,11 @@ static inline unsigned long em_cpu_energy(struct em_perf_domain *pd,
> >        */
> >       cpu = cpumask_first(to_cpumask(pd->cpus));
> >       scale_cpu = arch_scale_cpu_capacity(cpu);
> > -     ps = &pd->table[pd->nr_perf_states - 1];
> > +     ref_freq = arch_scale_freq_ref_em(cpu, pd);
>
> Why not using existing `unsigned long freq` here like in schedutil's
> get_next_freq()?

Find it easier to read and understand and will not make any difference
in the compiled code

>
> >
> >       max_util = map_util_perf(max_util);
>
> [...]
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
