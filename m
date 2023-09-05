Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D128DC83F3E
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Sep 2023 13:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cNhHZZbh2+E+/jN7U3m7UyE2hphca93Gfr5aMvyP8s0=; b=QSCIa3D188FvQW
	MwbCx8XLz0PDOtx6ph3MlW3ebDxfGx5K9ytEWMQXfCJ8bvX731+hFtmsNwJ498znalENTSFrQedo4
	ggVm4Of9oGQwd0FreqN+IxN0vb53vLGvMjiTCmbI4S1SzuccHCHUoTUstY5XlcDoR4y+SSIT7p5Wn
	YdDr3C/xrr/FM42GbSRm/Lwq6oSylIypzVSHonBk/32GqKsJ6ArZ6M5lEshtjGFci1zi9F87QgnhW
	ZRfjYjSENgLUq06CCwCq7J4rya+NzY/wZWzzP+HYNahw8JaCp0Y5pwlbeVAd8SCo0jVa2b97ipaXF
	oyoVfhHamudISjlXPVkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdWSB-0067Pm-2q;
	Tue, 05 Sep 2023 13:50:51 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdWS8-0067OF-1i
	for linux-riscv@lists.infradead.org;
	Tue, 05 Sep 2023 13:50:50 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-68a56401c12so1584493b3a.2
        for <linux-riscv@lists.infradead.org>; Tue, 05 Sep 2023 06:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693921846; x=1694526646; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8746KGEIMDYvZy66/CTNAkcgr/TmGj5aYpS8lwWYVY4=;
        b=mx5LYsA3K7lkwfmK2EKMur/d6lzWMkqGPgUJPqe1L14HQ1G2Ik+JtNIwgVSkq07s3L
         lEXcxAKhoIecPaPsVOyszmt6q6F1oH1KuTv11Q9k/p8z0I64BxFcfCwrKailQqEft/48
         vxrAMrGNZ4Jagk7O1bKsewEL3u5/UsUoGQlNltOy9RTT6PvumJYv95SJizB29q7py/iT
         GDOhDxRwWJ+vDNTafymU68mQltxMeIRG07qWTjnU85AFBSjz3BbnEUoRZYrYzOEYBaik
         F4TL7/xodtA/L4FMRT3NPwew6nj4dkULiDkVIXJPh0zz+Ntty+o3ww5BNVKhBmAk6ZMK
         NmxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693921846; x=1694526646;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8746KGEIMDYvZy66/CTNAkcgr/TmGj5aYpS8lwWYVY4=;
        b=kD9F/sLg2AxWmj5kEQJoa+gPh4qY286+d/9TIV9IwEiGlFPUjNXaOoNJ4IIv4/dVzR
         Jc2TzyIhJasXHtCgu+DloJRI/iDtAGHEyUAk0iaUD4Oaa1UUxRW4qDaTGhxZGqUfoipX
         RuawRhGdzfChOf4aDOuL4LlXB4BwsEPosI/RRpOlwJS9Ucw9/HDpUpmzqq+pHJArc49i
         aOW6vDjic1c1LxsA9GpE0clGs4h5jliQtyZnzZXpRQk8jCq5Q3FcXzqdnTIrHCLPGIYp
         PATFIYRCccKtKerRqZqd42RdvcYIZpLjEHYLqadi2Njc8XXYXNJlUrvqBBUu4Jk2Xqep
         zHSQ==
X-Gm-Message-State: AOJu0YzYeP2W+vzqv5tupcq0AgHn72d22J+mVn6CepAU66wkpONMniqO
	F+XkiN6Ab7zGwDfKXavy4OsIh7ityWACqW6zrYGtAw==
X-Google-Smtp-Source: AGHT+IHyxlfWoLfe4fGuaYHNWVkerDWNPmsQOGwuwZTCoO+MCc5SzD8LdTfSRFNhOHbuXHxmu5RBbYiGz+ziPJEEFVE=
X-Received: by 2002:a05:6a00:1705:b0:68c:33a9:e572 with SMTP id
 h5-20020a056a00170500b0068c33a9e572mr13265343pfc.29.1693921846035; Tue, 05
 Sep 2023 06:50:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230901130312.247719-1-vincent.guittot@linaro.org>
 <20230901130312.247719-4-vincent.guittot@linaro.org> <20230905112455.GD28319@noisy.programming.kicks-ass.net>
In-Reply-To: <20230905112455.GD28319@noisy.programming.kicks-ass.net>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Tue, 5 Sep 2023 15:50:34 +0200
Message-ID: <CAKfTPtCt7m5c0y1ttF3k3coZ34fbALpAToK5vUpgtZVTPwNrzg@mail.gmail.com>
Subject: Re: [PATCH 3/4] cpufreq/schedutil: use a fixed reference frequency
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	sudeep.holla@arm.com, gregkh@linuxfoundation.org, rafael@kernel.org, 
	mingo@redhat.com, juri.lelli@redhat.com, dietmar.eggemann@arm.com, 
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, bristot@redhat.com, 
	vschneid@redhat.com, viresh.kumar@linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org, 
	conor.dooley@microchip.com, suagrfillet@gmail.com, ajones@ventanamicro.com, 
	lftan@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_065048_573479_81A90EE0 
X-CRM114-Status: GOOD (  20.03  )
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

On Tue, 5 Sept 2023 at 13:25, Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Fri, Sep 01, 2023 at 03:03:11PM +0200, Vincent Guittot wrote:
>
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
> > +{
> > +     return arch_scale_freq_ref(policy->cpu);
> > +}
> > +#else
> > +static __always_inline
> > +unsigned long  arch_scale_freq_ref_policy(struct cpufreq_policy *policy)
>
> double space    ^^

I was expecting checkpatch.pl to catch it

will fix them

>
> > +{
> > +     if (arch_scale_freq_invariant())
> > +             return policy->cpuinfo.max_freq;
> > +
> > +
>
> superfluous whitespace there.
>
> > +     return policy->cur;
> > +}
> > +#endif
>
> static __always_inline
> unsigned long arch_scale_freq_ref_policy(struct cpufreq_policy *policy)
> {
> #ifdef arch_scale_freq_ref
>         return arch_scale_freq_ref(policy->cpu);
> #endif
>
>         if (arch_scale_freq_invariant())
>                 return policy->cpuinfo.max_freq;
>
>         return policy->cur;
> }
>
> Would have the lot in a single function and possibly easier to read?

yes

>
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
>
> Leave the variable below per the inverse christmas thing.
>
> >
> >       util = map_util_perf(util);
> > +     freq = arch_scale_freq_ref_policy(policy);
> >       freq = map_util_freq(util, freq, max);
> >
> >       if (freq == sg_policy->cached_raw_freq && !sg_policy->need_freq_update)
> > --
> > 2.34.1
> >
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
