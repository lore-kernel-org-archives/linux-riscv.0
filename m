Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E64B1C43334
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Jul 2022 17:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NtOXV/jvqd++TLDb8JFfEJHSKkLb7qKgSZbA1f8IR9o=; b=zQguLiR2IBsdwE
	uRx81ebc3LNBS5m4/Bx8giLnS+8kC2kB12EHusRBilzjardIlbGaV/C+IqdqI8SBfan6leuSGoHUH
	bi7siaEpDh2qIuk/XDZknI3nfO1Tk3IbmCdZOJBERe6UaA/fHnqP9/9i+Fs3MAsC/DZJiKsBYLJ/7
	YQNTfjrhjCI3B2QhZ79BK59JIbCSd8/rvgUQ7RMcWTv47gx5dpRJ+48eBKm4RweZqy3Gu0KnQr5h+
	Ma6x1MICH7S1uBiPs0p7/9SN7vbQUGzXoRlMllTAFtePVpRUNQKcfqTEnQiumAUc9oPczjvAYpc6P
	iHniSnz51M0O0b/vIWBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oC31Q-00Gtih-Qd; Thu, 14 Jul 2022 17:53:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oC31F-00GtdQ-4i; Thu, 14 Jul 2022 17:52:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4062C1D13;
	Thu, 14 Jul 2022 10:52:52 -0700 (PDT)
Received: from localhost (ionvoi01-desktop.cambridge.arm.com [10.1.196.65])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6883F3F70D;
	Thu, 14 Jul 2022 10:52:51 -0700 (PDT)
Date: Thu, 14 Jul 2022 18:52:49 +0100
From: Ionela Voinescu <ionela.voinescu@arm.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-kernel@vger.kernel.org, conor.dooley@microchip.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Pierre Gondois <pierre.gondois@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH -next] arch_topology: Fix cache attributes detection in
 the CPU hotplug path
Message-ID: <YtBX8WX+oyPww/m+@arm.com>
References: <20220713133344.1201247-1-sudeep.holla@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220713133344.1201247-1-sudeep.holla@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220714_105257_319094_540BB4D5 
X-CRM114-Status: GOOD (  27.47  )
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

Hi Sudeep,

Thank you for the fix!

On Wednesday 13 Jul 2022 at 14:33:44 (+0100), Sudeep Holla wrote:
> init_cpu_topology() is called only once at the boot and all the cache
> attributes are detected early for all the possible CPUs. However when
> the CPUs are hotplugged out, the cacheinfo gets removed. While the
> attributes are added back when the CPUs are hotplugged back in as part
> of CPU hotplug state machine, it ends up called quite late after the
> update_siblings_masks() are called in the secondary_start_kernel()
> resulting in wrong llc_sibling_masks.
> 
> Move the call to detect_cache_attributes() inside update_siblings_masks()
> to ensure the cacheinfo is updated before the LLC sibling masks are
> updated. This will fix the incorrect LLC sibling masks generated when
> the CPUs are hotplugged out and hotplugged back in again.
> 
> Reported-by: Ionela Voinescu <ionela.voinescu@arm.com>
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> ---
>  drivers/base/arch_topology.c | 16 ++++++----------
>  1 file changed, 6 insertions(+), 10 deletions(-)
> 
> Hi Conor,
> 
> Ionela reported an issue with the CPU hotplug and as a fix I need to
> move the call to detect_cache_attributes() which I had thought to keep
> it there from first but for no reason had moved it to init_cpu_topology().
> 
> Wonder if this fixes the -ENOMEM on RISC-V as this one is called on the
> cpu in the secondary CPUs init path while init_cpu_topology executed
> detect_cache_attributes() for all possible CPUs much earlier. I think
> this might help as the percpu memory might be initialised in this case.
> 
> Anyways give this a try, also test the CPU hotplug and check if nothing
> is broken on RISC-V. We noticed this bug only on one platform while
> 
> Regards,
> Sudeep
> 
> diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
> index 441e14ac33a4..0424b59b695e 100644
> --- a/drivers/base/arch_topology.c
> +++ b/drivers/base/arch_topology.c
> @@ -732,7 +732,11 @@ const struct cpumask *cpu_clustergroup_mask(int cpu)
>  void update_siblings_masks(unsigned int cpuid)
>  {
>  	struct cpu_topology *cpu_topo, *cpuid_topo = &cpu_topology[cpuid];
> -	int cpu;
> +	int cpu, ret;
> +
> +	ret = detect_cache_attributes(cpuid);
> +	if (ret)
> +		pr_info("Early cacheinfo failed, ret = %d\n", ret);
>  	/* update core and thread sibling masks */
>  	for_each_online_cpu(cpu) {
> @@ -821,7 +825,7 @@ __weak int __init parse_acpi_topology(void)
>  #if defined(CONFIG_ARM64) || defined(CONFIG_RISCV)
>  void __init init_cpu_topology(void)
>  {
> -	int ret, cpu;
> +	int ret;
>  	reset_cpu_topology();
>  	ret = parse_acpi_topology();
> @@ -836,13 +840,5 @@ void __init init_cpu_topology(void)
>  		reset_cpu_topology();
>  		return;
>  	}
> -
> -	for_each_possible_cpu(cpu) {
> -		ret = detect_cache_attributes(cpu);
> -		if (ret) {
> -			pr_info("Early cacheinfo failed, ret = %d\n", ret);
> -			break;
> -		}
> -	}
>  }
>  #endif
> --2.37.1
> 

Reviewed-by: Ionela Voinescu <ionela.voinescu@arm.com>
Tested-by:  Ionela Voinescu <ionela.voinescu@arm.com>

Kind regards,
Ionela.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
