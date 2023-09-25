Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D557CE7A95
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 12:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K0gma4/K67lA5F62+AxYK5kuYPs94vLjvSmoWIJWZe4=; b=D66qouf9X0hpD2
	nUhPFk/X34aim5atBORY2TT5i1pqodSO3odUlRNXxcTOn0oWF5FiqbKIwXicjDTyPg1JUnC+3TSlH
	UDmUVPZhHb+6qGtPaFipBXdyMPDLRguXV00dnW9HmdwoM4d8YZ6e1AsX74bBS0tOu0avwvid8uT29
	BqIDRZZz5ccrnNSveex6l8dGk9H8E5BWINuJqMBRaeUJu5AVKfBckXAnqG8WVMTWtgGIn5WXyabHw
	/ZTtFopB78rQDKv5ouHK/vwENa7R2HWyPhr9ePv4YuJennn0gGWdN25H52u89u7ov4uYn1mbPn/IE
	XYkINI8kCMGNpOKZwdiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkkLi-00EDUP-1p;
	Mon, 25 Sep 2023 12:06:02 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkkLe-00EDSS-1U
	for linux-riscv@lists.infradead.org;
	Mon, 25 Sep 2023 12:05:59 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-27751ac0653so1134640a91.3
        for <linux-riscv@lists.infradead.org>; Mon, 25 Sep 2023 05:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695643556; x=1696248356; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3AQMzFTiHHxsEkB1mP8F0ofwmLCD3NmtCDXLCwWRp38=;
        b=SIq/VPDUEpT7fwPWIXKWg5Qbak/Fn7uhrgQia01teuN+8f2Ljv6BzFajKqQfNWlwEq
         QYJ6Tl/Tud3hLWKPaxHAwyEN6zZEqu1YE8o50U5ZXpX6oIWFh/2Fy3hhi72iiMVKPnB6
         NLSx3Ww588ZNfzGQ/kWQwT9aURF8ZJ8357YN1Czo7IAcLPGj97wPtmmIpawhpY6+voUe
         jPCmB3eLK3f95LusRYRgIq59sySpQJBeQOMfSGiu+slawxjINrv3e2mmuQwapM90tt5B
         pyJpTx6lRucY7rTZqLdOTY4pmRxPlbHR2xPkNo3qW23ngy4lHzDDggVx+Sk7XxJx1kcV
         1X1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695643556; x=1696248356;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3AQMzFTiHHxsEkB1mP8F0ofwmLCD3NmtCDXLCwWRp38=;
        b=gqrpa0K2iRsUtxRuqt44gxDgeYoFPvo5t/N7Cc2xPQU7dBn14pgjdGa1B5kjZfv9Tm
         q9ofY/+XXc+dVx/6AC+2FWFWCRVguZ5pfxBBdq4ul0eclmJq+fzUSq+0F4n1UkohLSHh
         tYiVYU7qnAYzSEktbeQNHBMSgDKjy3GXa/Xs8azx4AIm2m67DzZB3f+z24Xw27y3KO+U
         bUsakFhvJHzdZaNYWsQFhDcbEYziPd0zrCbvs0Te67ErVdI5+FexANvac7/OM36uSH6I
         bcHLruzz6wlMjiD2JID8ykx0hHPSY7yBKs6XFIg2AwfyyhzPdiM5S8lLstzNu9oJ1eJ1
         P8Pw==
X-Gm-Message-State: AOJu0YxKv/zpDDpxu4d/Gw2al9tcBr9XC6ZTMc8GUAvooSFA4VjANPF8
	5vmrEnnMy4Wj+ugnBjzLdA/fsAXE1In/dHjVRR1fEw==
X-Google-Smtp-Source: AGHT+IEMG7wYE1v5WNPowSB4OI1pjxJk59BVXgECJSpoy8JeeRRykPlun/yJH3SD+MYcGrEgbFO/3NawGB+miB/mjAA=
X-Received: by 2002:a17:90a:d354:b0:273:f584:40ca with SMTP id
 i20-20020a17090ad35400b00273f58440camr4169349pjx.16.1695643555929; Mon, 25
 Sep 2023 05:05:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230901130312.247719-1-vincent.guittot@linaro.org> <ZQwW+XoOFqvyuQ63@arm.com>
In-Reply-To: <ZQwW+XoOFqvyuQ63@arm.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Mon, 25 Sep 2023 14:05:43 +0200
Message-ID: <CAKfTPtC+qBEjnwketZRdF6Lgbr9aCYNW1sqSVe5-TJfUq25p8w@mail.gmail.com>
Subject: Re: [PATCH 0/4] consolidate and cleanup CPU capacity
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
X-CRM114-CacheID: sfid-20230925_050558_507309_0D77C873 
X-CRM114-Status: GOOD (  31.41  )
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

On Thu, 21 Sept 2023 at 12:12, Ionela Voinescu <ionela.voinescu@arm.com> wrote:
>
> On Friday 01 Sep 2023 at 15:03:08 (+0200), Vincent Guittot wrote:
> > This is the 1st part of consolidating how the max compute capacity is
> > used in the scheduler and how we calculate the frequency for a level of
> > utilization.
> >
> > Fix some unconsistancy when computing frequency for an utilization. There
> > can be a mismatch between energy model and schedutil.
>
> There are a few more pieces of functionality that would be worth
> consolidating in this set as well, if you'd like to consider them:
>
> - arch_set_freq_scale() still uses policy->cpuinfo.max_freq. It might be
>   good to use the boot time stored max_freq here as well. Given that
>   arch_scale_cpu_capacity() would be based on that stored value, if
>   arch_scale_freq_capacity() ends up using a different value, it could
>   have interesting effects on the utilization signals in case of
>   boosting.

That's a good point, I will have a look at this part too. From a quick
look, this seems to be only used by  architecture that are using
arch_topology.c too


>
> - As Pierre mentioned in a previous comment, there is already a
>   cpufreq_get_hw_max_freq() weak function that returns
>   policy->cpuinfo.max_freq and it's only used at boot time by
>   the setup code for AMU use for frequency invariance. I'm tempted to
>   suggest to use this to initialize what is now "freq_factor" as my
>   intention when I created that function was to provide platform
>   providers with the possibility to implement their own and decide on
>   the frequency they choose as their maximum. This could have been an
>   arch_ function as well, but as you mentioned before, mobile and server
>   platforms might want to choose different maximum values even if they
>   are using the same architecture.
>
> Thanks,
> Ionela.
>
> >
> > Next step will be to make a difference between the original
> > max compute capacity of a CPU and what is currently available when
> > there is a capping applying forever (i.e. seconds or more).
> >
> > Vincent Guittot (4):
> >   sched: consolidate and cleanup access to CPU's max compute capacity
> >   topology: add a new arch_scale_freq_reference
> >   cpufreq/schedutil: use a fixed reference frequency
> >   energy_model: use a fixed reference frequency
> >
> >  arch/arm/include/asm/topology.h   |  1 +
> >  arch/arm64/include/asm/topology.h |  1 +
> >  arch/riscv/include/asm/topology.h |  1 +
> >  drivers/base/arch_topology.c      |  9 +++------
> >  include/linux/arch_topology.h     |  7 +++++++
> >  include/linux/energy_model.h      | 20 +++++++++++++++++---
> >  kernel/sched/core.c               |  2 +-
> >  kernel/sched/cpudeadline.c        |  2 +-
> >  kernel/sched/cpufreq_schedutil.c  | 29 +++++++++++++++++++++++++++--
> >  kernel/sched/deadline.c           |  4 ++--
> >  kernel/sched/fair.c               | 18 ++++++++----------
> >  kernel/sched/rt.c                 |  2 +-
> >  kernel/sched/sched.h              |  6 ------
> >  kernel/sched/topology.c           |  7 +++++--
> >  14 files changed, 75 insertions(+), 34 deletions(-)
> >
> > --
> > 2.34.1
> >
> >

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
