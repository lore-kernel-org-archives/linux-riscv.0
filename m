Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C590EC4167B
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Nov 2023 14:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CcFAkc1Hp4+5uT8NuBKagBlzj6qv8rfVHqPMu+Xl350=; b=3ygK3a+ieksg5w
	qgDM+AE8ZYdIWPP0e2DcnlagKxHNwpIZKTkq0/4dzBBYqDfchah2218cm+xw6e5PxFOPl6ijZIc0R
	Lo1Gi7eWPY56f4qix9sdiH4c38YbbYjZ1VedzRf1Yaymu5BOvWZnI4nsF+8V8FReAwMJD0ju/hdYr
	KonPzl8yt/NTkRVJJQBVQ/WqxA/rWUkyG9D9gaLBsq16gOSD29lYTqPpqrYRq2S2jluUw8xTZcAQ0
	aBeqijlUNpISCK7ovv+cbM2AsmOExnUEDnmDe6DK+dW9DylFFuQTJnwBmmcdcxE6yqdkCwYLM+P7K
	w09PMhaZFb3Fa5DUFkJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8M0D-008hRd-0Q;
	Wed, 29 Nov 2023 14:57:25 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8M09-008hQQ-1q
	for linux-riscv@lists.infradead.org;
	Wed, 29 Nov 2023 14:57:23 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-2839b922c18so5390767a91.1
        for <linux-riscv@lists.infradead.org>; Wed, 29 Nov 2023 06:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701269840; x=1701874640; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lBDvY8xfUiRwWpZzeQ9H8DFnchFRqEtZ7Anhmfk/MaE=;
        b=dAf6onBLS4pXsoyDrirbo8ofORe6BS1ehVqIrtg7fuepo6xgqnH09yLDUk/ssEYf7d
         5cDKNeoQ3zaMy6Ki+fmH/jabtCD2i7XVYRY6vpDuD5omLj2EMsT/OTPZwZ7aSCsDw4aB
         HjTLj0b9jqHQQrrxlI6C5bnKgucqpOEtNrOBPHUkvev7erMmJynzhC91UZUltK5+6HYA
         xCbchn9YVV2tHjw0P/zlDFXubAAy+wTQ5uZwdtbdvSgergsMRHzikVybUvgMD/gKArST
         LQGNaeIy5+LaGrpPXiCCw24Kk4lAkS0uM1PnvSzcQTzkEo9qt+j2gtICvwWhT5Hqi8zL
         yAfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701269840; x=1701874640;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lBDvY8xfUiRwWpZzeQ9H8DFnchFRqEtZ7Anhmfk/MaE=;
        b=QJolpgUTRIWCBq+io3WlQRGn4fiescHotwfopjYcwPdcH5htGyCYqg9atlwQpcdDqY
         HT/DfTTWPBvKsYFtqH08jw5CnU7+50rTEAtTNq92uS53HHrYCI+iu+vFzOKRgTjWovfD
         33q3KWdu3wBk1IdppqxF0dv0FA1/X5su0pEBJrtwyuI2nxX2q55a48nZQtwFd1I5qXpb
         2WsWHqAcgBMbtWt+aLezqiXMmq5ewE3QKpk0mPbqvgysrXU3OK7MKwCVR/mtRidkcCts
         aKcAImuhvHNZamrBi4Qf+FyUrh7KF7QfKL3wU+6NT30F1MCqQHDsb1BU66SK1JuG6uKx
         cNpA==
X-Gm-Message-State: AOJu0YyvY0hpDnM5jO3IyvBw7BvrmQHz6LBz5j/OxEmnpMopzmnzqcGh
	A8rQlcNtvimdOJZPOtRuX5GNYFMjXhwNlV1wdFftaA==
X-Google-Smtp-Source: AGHT+IEHJzKIugJyAirnHA8jm9ZsrM79uoKWJCmfioIMr8438yJMfCRcgL5l4g9Ssds+KQR6JrFMN1Np/NBF2zPVw/0=
X-Received: by 2002:a17:90b:17c7:b0:285:9b51:64f with SMTP id
 me7-20020a17090b17c700b002859b51064fmr16079874pjb.36.1701269839853; Wed, 29
 Nov 2023 06:57:19 -0800 (PST)
MIME-Version: 1.0
References: <20231109101438.1139696-1-vincent.guittot@linaro.org>
 <20231109101438.1139696-2-vincent.guittot@linaro.org> <ZWYM0hn28RHjAalh@arm.com>
 <ZWYOg1gIIgI1qXn7@arm.com>
In-Reply-To: <ZWYOg1gIIgI1qXn7@arm.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Wed, 29 Nov 2023 15:57:08 +0100
Message-ID: <CAKfTPtA2g-rDPBJkoXpcHrz4vcYAivequkLvWUXgwQpqFcZkOQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/7] topology: Add a new arch_scale_freq_reference
To: Ionela Voinescu <ionela.voinescu@arm.com>
Cc: linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	sudeep.holla@arm.com, gregkh@linuxfoundation.org, rafael@kernel.org, 
	mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, bristot@redhat.com, vschneid@redhat.com, 
	viresh.kumar@linaro.org, lenb@kernel.org, robert.moore@intel.com, 
	lukasz.luba@arm.com, pierre.gondois@arm.com, beata.michalska@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org, 
	linux-acpi@vger.kernel.org, conor.dooley@microchip.com, suagrfillet@gmail.com, 
	ajones@ventanamicro.com, lftan@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_065721_617996_324E1C74 
X-CRM114-Status: GOOD (  22.37  )
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

On Tue, 28 Nov 2023 at 17:00, Ionela Voinescu <ionela.voinescu@arm.com> wrote:
>
> On Tuesday 28 Nov 2023 at 15:52:52 (+0000), Ionela Voinescu wrote:
> > Hi Vincent,
> >
> > I have a small request on this patch, which is useful for [1].
> > I'll detail what is needed lower in the code.
> >
> > [1] https://lore.kernel.org/lkml/ZWYDr6JJJzBvsqf0@arm.com/
> >
> > On Thursday 09 Nov 2023 at 11:14:32 (+0100), Vincent Guittot wrote:
> > > @@ -279,13 +278,13 @@ void topology_normalize_cpu_scale(void)
> > >
> > >     capacity_scale = 1;
> > >     for_each_possible_cpu(cpu) {
> > > -           capacity = raw_capacity[cpu] * per_cpu(freq_factor, cpu);
> > > +           capacity = raw_capacity[cpu] * per_cpu(capacity_freq_ref, cpu);
> >
> > The only affected code that I could find is here and below.
> >
> > The above line would have to change to:
> > capacity = raw_capacity[cpu] * per_cpu(capacity_freq_ref, cpu) ?: 1;
> >
> > >             capacity_scale = max(capacity, capacity_scale);
> > >     }
> > >
> > >     pr_debug("cpu_capacity: capacity_scale=%llu\n", capacity_scale);
> > >     for_each_possible_cpu(cpu) {
> > > -           capacity = raw_capacity[cpu] * per_cpu(freq_factor, cpu);
> > > +           capacity = raw_capacity[cpu] * per_cpu(capacity_freq_ref, cpu);
> >
> > and here:
> > capacity = raw_capacity[cpu] * per_cpu(capacity_freq_ref, cpu) ?: 1;
> >
> > I think it's nicer to start with capacity_freq_ref as 0 and compensate here
> > for uninitialized capacity_freq_ref.
> >
> > Let me know if this is alright of if you'd prefer us to make this change
> > in a separate patch.
> >
> > Thanks,
> > Ionela.
> >
>
> Correction - both will need to be:
> capacity = raw_capacity[cpu] * (per_cpu(capacity_freq_ref, cpu) ?: 1);

Yes, this one is better to keep the same behavior when cpufreq driver
is never loaded

I think this change should come as an additional patch either on top
of this series or directly as part of [1] which is the main user of
the change. I assume that's because you want arch_freq_get_on_cpu()
returns 0 until everything has been initialized

Vincent

>
> Thanks,
> Ionela.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
