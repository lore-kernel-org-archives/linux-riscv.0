Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90A23E70709
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Sep 2023 10:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i5BJkQvmFSpDw7BmP8112P7DVrnx7Y7y7TFcXfyT9u8=; b=uSzhRyT3nbgUn/
	SClE2nbWfFvH79GQIhcgcCPlfCYvCxYCsUoyMhH+3DVQGSR5ArYBvaFiRstYq3q1wwinrjV9JIHlh
	J+hZiuVDwx14Ik8QkusVWypru/ACg1+F15IXW+xHOhxcoXjGY03dZLkT8nKxJUbcbPQp3wTavXo6d
	YiMZSyJRsYYoMgLoejj0zieBXls74P4EsQzYgA/ZzVZckjCUcCcs6/LmxzwfjtNBCoWKV6OyTJiQ1
	be7pbBOXnB2yhxNvB4pHbZOdk/E177B94G4g07WRn0xFOFIYBISM4P5YG9l6vopAxrg6rab6WqVNd
	nPiOBOcQBCxzq3I3nhug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjGfU-005gJN-0D;
	Thu, 21 Sep 2023 10:12:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjGfQ-005gIF-0E;
	Thu, 21 Sep 2023 10:12:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B63E61595;
	Thu, 21 Sep 2023 03:12:48 -0700 (PDT)
Received: from localhost (ionvoi01-desktop.cambridge.arm.com [10.2.78.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 366B93F59C;
	Thu, 21 Sep 2023 03:12:11 -0700 (PDT)
Date: Thu, 21 Sep 2023 11:12:09 +0100
From: Ionela Voinescu <ionela.voinescu@arm.com>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	sudeep.holla@arm.com, gregkh@linuxfoundation.org, rafael@kernel.org,
	mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, bristot@redhat.com, vschneid@redhat.com,
	viresh.kumar@linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-pm@vger.kernel.org, conor.dooley@microchip.com,
	suagrfillet@gmail.com, ajones@ventanamicro.com, lftan@kernel.org
Subject: Re: [PATCH 0/4] consolidate and cleanup CPU capacity
Message-ID: <ZQwW+XoOFqvyuQ63@arm.com>
References: <20230901130312.247719-1-vincent.guittot@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230901130312.247719-1-vincent.guittot@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_031216_206443_5450CAB2 
X-CRM114-Status: GOOD (  21.13  )
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

On Friday 01 Sep 2023 at 15:03:08 (+0200), Vincent Guittot wrote:
> This is the 1st part of consolidating how the max compute capacity is
> used in the scheduler and how we calculate the frequency for a level of
> utilization.
> 
> Fix some unconsistancy when computing frequency for an utilization. There
> can be a mismatch between energy model and schedutil.

There are a few more pieces of functionality that would be worth
consolidating in this set as well, if you'd like to consider them:

- arch_set_freq_scale() still uses policy->cpuinfo.max_freq. It might be
  good to use the boot time stored max_freq here as well. Given that
  arch_scale_cpu_capacity() would be based on that stored value, if
  arch_scale_freq_capacity() ends up using a different value, it could
  have interesting effects on the utilization signals in case of
  boosting.

- As Pierre mentioned in a previous comment, there is already a
  cpufreq_get_hw_max_freq() weak function that returns
  policy->cpuinfo.max_freq and it's only used at boot time by 
  the setup code for AMU use for frequency invariance. I'm tempted to
  suggest to use this to initialize what is now "freq_factor" as my
  intention when I created that function was to provide platform
  providers with the possibility to implement their own and decide on
  the frequency they choose as their maximum. This could have been an
  arch_ function as well, but as you mentioned before, mobile and server
  platforms might want to choose different maximum values even if they
  are using the same architecture.

Thanks,
Ionela.

> 
> Next step will be to make a difference between the original
> max compute capacity of a CPU and what is currently available when
> there is a capping applying forever (i.e. seconds or more).
> 
> Vincent Guittot (4):
>   sched: consolidate and cleanup access to CPU's max compute capacity
>   topology: add a new arch_scale_freq_reference
>   cpufreq/schedutil: use a fixed reference frequency
>   energy_model: use a fixed reference frequency
> 
>  arch/arm/include/asm/topology.h   |  1 +
>  arch/arm64/include/asm/topology.h |  1 +
>  arch/riscv/include/asm/topology.h |  1 +
>  drivers/base/arch_topology.c      |  9 +++------
>  include/linux/arch_topology.h     |  7 +++++++
>  include/linux/energy_model.h      | 20 +++++++++++++++++---
>  kernel/sched/core.c               |  2 +-
>  kernel/sched/cpudeadline.c        |  2 +-
>  kernel/sched/cpufreq_schedutil.c  | 29 +++++++++++++++++++++++++++--
>  kernel/sched/deadline.c           |  4 ++--
>  kernel/sched/fair.c               | 18 ++++++++----------
>  kernel/sched/rt.c                 |  2 +-
>  kernel/sched/sched.h              |  6 ------
>  kernel/sched/topology.c           |  7 +++++--
>  14 files changed, 75 insertions(+), 34 deletions(-)
> 
> -- 
> 2.34.1
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
