Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E633CE95A8E
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 11:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QSyDT0djIhIG+xdoeoHVljNEa2SGSU2Kt+a2YHbgu3o=; b=D5RBd13Isvptjc
	sQhSRN4mzXL6ZkdW7X14XF34MkRRqT+xdgn2nPfqeA7aIje5LN8RVlTEMUWCiR5CQzII2Z9wBCUBs
	hy9OSo9arEmSAQIQKzwog0tyrm7ondDR1/7dzOFQjdlcGb38PVfMogFB7sHqlOc2zbREE0vcezzMh
	HZmWDtzXpCAU8T6e6knz461+cPjnG0a6HSTubY+GNNjSsQZZX3Ht0TtuvIdRTCloAciC6HQsDDDx8
	W7VSQnojPXxvYXuSLn4KLEN8p0lBd10T12Y7QguYvbybCUxLcbJvBelKmoT05a8ujJJ92B9AmGp17
	KaIOKRRRrgwHqvQh9lqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpo0o-00APCA-32;
	Mon, 09 Oct 2023 11:01:22 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpo0k-00AP9U-0c;
	Mon, 09 Oct 2023 11:01:19 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-32003aae100so3283191f8f.0;
        Mon, 09 Oct 2023 04:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696849276; x=1697454076; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=//K5iOSx+LhnQE5qyVFs7BiRBbgN/L2K75+Fy0+HDh4=;
        b=Wa+RkbCXTPZD3aWlLLxxk+taArLPSpV1YbGOC14PeU2i82BWUXCkYV149LWtDaR2Gn
         gBp65G9Opo3UN2Hc0KYo1lD/6KpB3hXV6Tzi/WF3f1nh7l8g1TyRemNeP4QruOYXLpcK
         MQtX5ysFUgIlEwPcjYg0hFxMVnrGfL7qR1fLsIf922yxZ83xcdaWh3s7ELpuSnTogWsF
         Kz1RH6qMy8RWNoklagno2kRdW3E5x/TTDZEtNpreHZex/ZyTBFUrtUiwrZukujxfLXgB
         KaHmiuWgEUpTxkrqDWWN8V5Tt/XGomcRu3fGgzNfleylCwUPU97rE3Wv/vOW1JEq3+Ob
         jJaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696849276; x=1697454076;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=//K5iOSx+LhnQE5qyVFs7BiRBbgN/L2K75+Fy0+HDh4=;
        b=HyrhBwUvN7mNEHhJQVYKSGAgpX6S8k4/FU6gO4//obs0zhb4bDE7PsUdeFeYCp9FNt
         ja8g0r7V4XxdcQZvVUHqLeLtKDEZcQUysa1v6IXpI9ECGtfsAUgl/K8pjWh7c9OaHH7z
         nmOlAwDm6AzlRbmuEqA9CbH2bpEdUg8WvKmC4dcnV9SpsFZ+8pc0kaVVJbGfj2EnUJ3K
         GfGN5iZMX0iAboOTCXtLGXKDGaYY1bJCD+1e6J6MfXMz89vdPq2DdqZAysTRGY0youIX
         k5inhLbTTXZAtrC2GlgR1SaiH1771joMqfn2/EmJu4AntYfY3UWx3AYe5WjFIZ63mXyS
         7FNQ==
X-Gm-Message-State: AOJu0YxIHnLTp5fiFzin4kiK0akrlxKL55tkj7Q5VRGqV5MSmhuzsiJ0
	kCbnXjcFiZPaMbZTr8KAgE4=
X-Google-Smtp-Source: AGHT+IEFkAwgr/vL1oef8RnFaRM4o2hfmBtyLBgYWVUESswjOL3cwhDGTXs4EkSMp162uqsg+l3/dQ==
X-Received: by 2002:a5d:4690:0:b0:318:720c:bb3 with SMTP id u16-20020a5d4690000000b00318720c0bb3mr10012693wrq.20.1696849275995;
        Mon, 09 Oct 2023 04:01:15 -0700 (PDT)
Received: from gmail.com (1F2EF237.nat.pool.telekom.hu. [31.46.242.55])
        by smtp.gmail.com with ESMTPSA id b6-20020adfee86000000b0031f300a4c26sm9257600wro.93.2023.10.09.04.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 04:01:15 -0700 (PDT)
Date: Mon, 9 Oct 2023 13:01:12 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	sudeep.holla@arm.com, gregkh@linuxfoundation.org, rafael@kernel.org,
	mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, bristot@redhat.com, vschneid@redhat.com,
	viresh.kumar@linaro.org, lukasz.luba@arm.com,
	ionela.voinescu@arm.com, pierre.gondois@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org,
	conor.dooley@microchip.com, suagrfillet@gmail.com,
	ajones@ventanamicro.com, lftan@kernel.org
Subject: Re: [PATCH v2 1/6] sched: consolidate and cleanup access to CPU's
 max compute capacity
Message-ID: <ZSPdeMzCzDRCIqUw@gmail.com>
References: <20231009103621.374412-1-vincent.guittot@linaro.org>
 <20231009103621.374412-2-vincent.guittot@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231009103621.374412-2-vincent.guittot@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_040118_231866_2D7979D5 
X-CRM114-Status: GOOD (  16.27  )
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


* Vincent Guittot <vincent.guittot@linaro.org> wrote:

> Remove struct rq cpu_capacity_orig field and use arch_scale_cpu_capacity()
> instead.
> 
> Scheduler uses 3 methods to get access to the CPU's max compute capacity:
> - arch_scale_cpu_capacity(cpu) which is the default way to get CPU's capacity.
> - cpu_capacity_orig field which is periodically updated with
>   arch_scale_cpu_capacity().
> - capacity_orig_of(cpu) which encapsulates rq->cpu_capacity_orig.
> 
> There is no real need to save the value returned by arch_scale_cpu_capacity()
> in struct rq. arch_scale_cpu_capacity() returns:
> - either a per_cpu variable.
> - or a const value for systems which have only one capacity.
> 
> Remove cpu_capacity_orig and use arch_scale_cpu_capacity() everywhere.
> 
> No functional changes.
> 
> some tests of Arm64
> small SMP device (hikey): no noticeable changes
> HMP device (RB5): hackbench shows minor improvement (1-2%)
> large smp (thx2): hackbench and tbench shows minor improvement (1%)
> 
> Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> Reviewed-by: Dietmar Eggemann <dietmar.eggemann@arm.com>
> 
> ---
>  Documentation/scheduler/sched-capacity.rst | 13 +++++++------
>  kernel/sched/core.c                        |  2 +-
>  kernel/sched/cpudeadline.c                 |  2 +-
>  kernel/sched/deadline.c                    |  4 ++--
>  kernel/sched/fair.c                        | 18 ++++++++----------
>  kernel/sched/rt.c                          |  2 +-
>  kernel/sched/sched.h                       |  6 ------
>  kernel/sched/topology.c                    |  7 +++++--
>  8 files changed, 25 insertions(+), 29 deletions(-)

I've applied patch #1 to tip:sched/core, thanks!

	Ingo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
