Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC3FBC4332F
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Nov 2023 10:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yUemoyD0Q2Eidz2bI7AQhZgSvCqh06DmxkFb8NZ55RM=; b=J0J5KE2rmjWYvo
	/qc6BMxzNXFVHCVU6rzFES8cydD/RT0COdTHCqfd7CFCiRhCcsHpU6kNpfeandOeRq6LB+tsVNZLB
	LdlS7O2L1VMvmMOLzbafmav4gmYrIiH2PKDCAKYbPB8U1wJHl7DtmLbf7Lm7NObf182usPtm/IkES
	gJRPJUOrMpmUmEvaFZyJ4MDBPnTuUVKif6UB1TmIu/pdnFuvb/qoawg/xGvca8CSvUaaXtK5xXyA+
	qK0RCT3A1zPa1yhgZUAsjkx3wB7ypXdbNHo3MOSPibh3wh9AIOKdvfozXudmjwZicHRFYa/eczOMb
	Ol8+6kU7pgUeiOT4CZRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0JTU-0016fV-1k;
	Tue, 07 Nov 2023 10:38:24 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0JTQ-0016e6-21;
	Tue, 07 Nov 2023 10:38:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A26A5CE0E56;
	Tue,  7 Nov 2023 10:38:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D2C9C433C7;
	Tue,  7 Nov 2023 10:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699353497;
	bh=vJRAI9RGy/58A+FlzWE10PI0MfMhXjXb/jXWE3sfgoA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P8DR9XQVqGWE/jSsPbBMbBE96MY+i3o2DaeBsP5f6BDjvx/DOhiZNZZkcqIWdiFKJ
	 TQMPoAXJ0x2TtXE67Y62VjspTbRGAOufa4CRGNzTRwseWqPxAx2JnJvge/Pd8SFd/C
	 652UC6kbexqs2g1LA//blK+R2I/ceR0tGVIZOvphJyLJCKGKy/GV+1hSXjmqkt/xhR
	 QmDw9YouENrjpbSlFvRNGZ4uqm5R6SOn8pBYci5FtRJOl5X53LgfZP6jDSFRzvsNRb
	 AqCng9dzoPE8U7OlzHAE3pB05STFWs0eE49/RyTVp5RDEpT6znfC9+1yYkxANs1vFN
	 9OLw0jdWTTD0A==
Date: Tue, 7 Nov 2023 10:38:09 +0000
From: Will Deacon <will@kernel.org>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: linux@armlinux.org.uk, catalin.marinas@arm.com,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	sudeep.holla@arm.com, gregkh@linuxfoundation.org, rafael@kernel.org,
	mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, bristot@redhat.com, vschneid@redhat.com,
	viresh.kumar@linaro.org, lenb@kernel.org, robert.moore@intel.com,
	lukasz.luba@arm.com, ionela.voinescu@arm.com,
	pierre.gondois@arm.com, beata.michalska@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-acpi@vger.kernel.org, conor.dooley@microchip.com,
	suagrfillet@gmail.com, ajones@ventanamicro.com, lftan@kernel.org
Subject: Re: [PATCH v5 7/7] arm64/amu: Use capacity_ref_freq to set AMU ratio
Message-ID: <20231107103808.GF18944@willie-the-truck>
References: <20231104105907.1365392-1-vincent.guittot@linaro.org>
 <20231104105907.1365392-8-vincent.guittot@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231104105907.1365392-8-vincent.guittot@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_023821_103732_FCED0771 
X-CRM114-Status: GOOD (  22.28  )
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

On Sat, Nov 04, 2023 at 11:59:07AM +0100, Vincent Guittot wrote:
> Use the new capacity_ref_freq to set the ratio that is used by AMU for
> computing the arch_scale_freq_capacity().
> This helps to keep everything aligned using the same reference for
> computing CPUs capacity.
> 
> The default value of the ratio (stored in per_cpu(arch_max_freq_scale))
> ensures that arch_scale_freq_capacity() returns max capacity until it is
> set to its correct value with the cpu capacity and capacity_ref_freq.
> 
> Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> ---
>  arch/arm64/kernel/topology.c  | 26 ++++++++++++++------------
>  drivers/base/arch_topology.c  | 12 +++++++++++-
>  include/linux/arch_topology.h |  1 +
>  3 files changed, 26 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
> index 817d788cd866..615c1a20129f 100644
> --- a/arch/arm64/kernel/topology.c
> +++ b/arch/arm64/kernel/topology.c
> @@ -82,7 +82,12 @@ int __init parse_acpi_topology(void)
>  #undef pr_fmt
>  #define pr_fmt(fmt) "AMU: " fmt
>  
> -static DEFINE_PER_CPU_READ_MOSTLY(unsigned long, arch_max_freq_scale);
> +/*
> + * Ensure that amu_scale_freq_tick() will return SCHED_CAPACITY_SCALE until
> + * the CPU capacity and its associated frequency have been correctly
> + * initialized.
> + */
> +static DEFINE_PER_CPU_READ_MOSTLY(unsigned long, arch_max_freq_scale) =  1UL << (2 * SCHED_CAPACITY_SHIFT);

This doesn't seem to match the comment? SCHED_CAPACITY_SCALE doesn't have
the '2 *' multiplier.

>  static DEFINE_PER_CPU(u64, arch_const_cycles_prev);
>  static DEFINE_PER_CPU(u64, arch_core_cycles_prev);
>  static cpumask_var_t amu_fie_cpus;
> @@ -112,14 +117,14 @@ static inline bool freq_counters_valid(int cpu)
>  	return true;
>  }
>  
> -static int freq_inv_set_max_ratio(int cpu, u64 max_rate, u64 ref_rate)
> +void freq_inv_set_max_ratio(int cpu, u64 max_rate)
>  {
> -	u64 ratio;
> +	u64 ratio, ref_rate = arch_timer_get_rate();
>  
>  	if (unlikely(!max_rate || !ref_rate)) {
> -		pr_debug("CPU%d: invalid maximum or reference frequency.\n",
> +		WARN_ONCE(1, "CPU%d: invalid maximum or reference frequency.\n",
>  			 cpu);
> -		return -EINVAL;
> +		return;
>  	}
>  
>  	/*
> @@ -139,12 +144,12 @@ static int freq_inv_set_max_ratio(int cpu, u64 max_rate, u64 ref_rate)
>  	ratio = div64_u64(ratio, max_rate);
>  	if (!ratio) {
>  		WARN_ONCE(1, "Reference frequency too low.\n");
> -		return -EINVAL;
> +		return;
>  	}
>  
> -	per_cpu(arch_max_freq_scale, cpu) = (unsigned long)ratio;
> +	WRITE_ONCE(per_cpu(arch_max_freq_scale, cpu), (unsigned long)ratio);

Why is WRITE_ONCE() now needed?

> -	return 0;
> +	return;

Pointless 'return;' statement.

Will

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
