Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5B9CC25B48
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Oct 2023 15:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HwxPzXkMaOkRmZrMIbioL2grauYO/Wg8zszUOnQS+wY=; b=BYBSwgwQKTR6uH
	LLpWagz08cLlteDt6aLa0OCIOB9awfTBpyhRNN083LLHzTSCjYRaqgiQQZEeScKz/Fgo4hd0DkNVo
	aTy0JTPDlP7UMbeBeAUJqHMpHk1K7GFkIn+zTk4gA+W6xUJDEuAQh4/NMqmTxF+SPAF7IB9ZSXP2L
	aFi8An11u938Q/pkij/OawM4UdLXwpmVurpzrwhubQD7/+9V02UQqiFFD+63GvjqY51I6U+mGqmZ/
	Pvtn5c09Pc1KagFsva9ze1DeT0TYM512H8FwBONvbcBBsESprc1kkP43z9dHeSgm8JQsZ+1kG3i60
	aup/SvI9o2uouIOLBsYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qw23Q-00EmP9-0c;
	Thu, 26 Oct 2023 15:13:48 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qw23N-00EmOA-2B
	for linux-riscv@lists.infradead.org;
	Thu, 26 Oct 2023 15:13:47 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-6b709048d8eso921493b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 26 Oct 2023 08:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698333223; x=1698938023; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sIQNokBhQSScd068h2R0va+GxK2e4ptgRXBIV8yGO3Q=;
        b=EL8hG5DAvMdjoKzbekMcjZpy8mMo/ZrOGSKb9HUtIaZmbPFia9CO6wH7fUPuN+HH6z
         Wx0U3os0dAaC4ZyYNvqSDj5EUzZHjMatjY8TjxlvdqehKvRh00gYjQ8Lzb5cZ9Prmkbz
         jgtO1ShlnUfat+ZXwm4oVJVSmmTTl6dJs6VbG2WYCGxTDFqlTojhBAtQMkipDhVasJnn
         zEMUAAaSC+HubbmBKKMrGTxh88TuFTTi7ye6NdJbQ1EMIojfAIWwUPeniU+5rCEcfSrS
         93g3ZtFqCTYz7GiaEzZ8UlReuRyzD6hDcPpcxz1RCQo7LJlHeXgQd5qLABuNtM4g0Gou
         CLkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698333223; x=1698938023;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sIQNokBhQSScd068h2R0va+GxK2e4ptgRXBIV8yGO3Q=;
        b=YukZPKxxU5z7zMRr17TyVAEY/IcAYJOz/INSt6nk7meMsndeh/BaEzONDUVFSidMVi
         GspCPwsl8GstU51HtY6LYi613lrmb8F4vWm6HpgOJpjoSpS8WMJFtmmCscPLZqf9wII4
         BV0X4DjhgvHm6BBXxrFg7nF/mSKSulFwZHU2k1Vdmb4MUNwL78vTbH2LKSDpcYNGUtyU
         wGtYQHP46ubnDC48mAuUpvjbT+ay9NInpha8KdVzp6IewapioPLFUTqXLlpSE/fiLK1K
         KqFvdf/t7kIxKdmXDS6wiTiqAqhqFBb/deGUgxkSeO2qjdxdn1sY+VTX8nWMh0LdMiDz
         4zTQ==
X-Gm-Message-State: AOJu0YwGJS3t0tpirF8SGgm1wVoXmx+x9bnrUWT1jgTd9lWiraX2HTKq
	SCKmqbio1qhEBUlRDkl/XitGLEgvPTFmQ7G/wZjaxw==
X-Google-Smtp-Source: AGHT+IHpvFfxEX2wvpX4oLmokC74kO3PgHJfv15pxMoSpuOPt/vENsjW1mHuLxZFo88vzceGkfO3QCACBcu/EM6N+5k=
X-Received: by 2002:a17:90a:1a43:b0:27d:12e1:94e0 with SMTP id
 3-20020a17090a1a4300b0027d12e194e0mr12590526pjl.36.1698333223116; Thu, 26 Oct
 2023 08:13:43 -0700 (PDT)
MIME-Version: 1.0
References: <20231018162540.667646-1-vincent.guittot@linaro.org>
 <20231018162540.667646-4-vincent.guittot@linaro.org> <f5e398f3-fbb7-4840-9084-14c8254b2118@arm.com>
In-Reply-To: <f5e398f3-fbb7-4840-9084-14c8254b2118@arm.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Thu, 26 Oct 2023 17:13:31 +0200
Message-ID: <CAKfTPtBJRT56dL7+UW-viZuK3wKfGimQfrkvtuCQ_20g4N5LPQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] cpufreq/schedutil: use a fixed reference frequency
To: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	sudeep.holla@arm.com, gregkh@linuxfoundation.org, rafael@kernel.org, 
	mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com, 
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, bristot@redhat.com, 
	vschneid@redhat.com, viresh.kumar@linaro.org, lenb@kernel.org, 
	robert.moore@intel.com, lukasz.luba@arm.com, ionela.voinescu@arm.com, 
	pierre.gondois@arm.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org, 
	acpica-devel@lists.linuxfoundation.org, conor.dooley@microchip.com, 
	suagrfillet@gmail.com, ajones@ventanamicro.com, lftan@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_081345_710412_7B2A53E2 
X-CRM114-Status: GOOD (  25.84  )
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

On Wed, 25 Oct 2023 at 22:13, Dietmar Eggemann <dietmar.eggemann@arm.com> wrote:
>
> On 18/10/2023 18:25, Vincent Guittot wrote:
> > cpuinfo.max_freq can change at runtime because of boost as an example. This
> > implies that the value could be different than the one that has been
> > used when computing the capacity of a CPU.
> >
> > The new arch_scale_freq_ref() returns a fixed and coherent reference
> > frequency that can be used when computing a frequency based on utilization.
> >
> > Use this arch_scale_freq_ref() when available and fallback to
> > policy otherwise.
> >
> > Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> > Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>
> > Tested-by: Lukasz Luba <lukasz.luba@arm.com>
> >
> > ---
> >  kernel/sched/cpufreq_schedutil.c | 26 ++++++++++++++++++++++++--
> >  1 file changed, 24 insertions(+), 2 deletions(-)
> >
> > diff --git a/kernel/sched/cpufreq_schedutil.c b/kernel/sched/cpufreq_schedutil.c
> > index 458d359f5991..6e4030482ae8 100644
> > --- a/kernel/sched/cpufreq_schedutil.c
> > +++ b/kernel/sched/cpufreq_schedutil.c
> > @@ -114,6 +114,28 @@ static void sugov_deferred_update(struct sugov_policy *sg_policy)
> >       }
> >  }
> >
> > +/**
> > + * cpufreq_get_capacity_ref_freq - get the reference frequency of a given CPU that
>
> s/cpufreq_get_capacity_ref_freq/get_capacity_ref_freq
>
> s/of a given CPU/for a given cpufreq policy ? (of which the CPU managing
> it is used for the arch_scale_freq_ref() call in the function.
>
> > + * has been used to correlate frequency and compute capacity.
> > + * @policy: the cpufreq policy of the CPU in question.
> > + * @use_current: Fallback to current freq instead of policy->cpuinfo.max_freq.
>
> Looks like use_current does not exists as a parameter.

Thanks for the review. I'm going to apply your comments

>
> > + *
> > + * Return: the reference CPU frequency to compute a capacity.
> > + */
> > +static __always_inline
> > +unsigned long get_capacity_ref_freq(struct cpufreq_policy *policy)
> > +{
> > +     unsigned int freq = arch_scale_freq_ref(policy->cpu);
> > +
> > +     if (freq)
> > +             return freq;
> > +
> > +     if (arch_scale_freq_invariant())
> > +             return policy->cpuinfo.max_freq;
> > +
> > +     return policy->cur;
> > +}
>
> Reviewed-by: Dietmar Eggemann <dietmar.eggemann@arm.com>
>
>
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
