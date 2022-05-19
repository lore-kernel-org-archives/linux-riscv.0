Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03C0AC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 19 May 2022 16:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=30rT2W3bg6E+qAJQTKoiaDpIOPX/cA3sTPwLocnedk0=; b=cO7t7qTfE8Hlce
	FOyQKl1Bwu/Jq/TXSLERPaBlCHCVK/a2GqS4yy1QjY1i9q0A8tREtTjyxfuynG7K26iN0YWAPpURc
	DbQUpe90kgOTIPcXj7VtMqC2x2+MHURrXavZFSMeEXro6wHIVuAW8gJgzDlCVfqeQA7FMNLsbbulr
	FExY/VxBnS76zU/isAAzg60hpPXcYwKd9FgBZOn5Rwb1WxX5kGTg4jsUm8x6mw+rgPVxtT/Y9amim
	LvSra92QU8rex9Or6cb1PXnrhK9UZk8UzrnnOY24N+Dvs/6OOZLpWy6OkLTflKyjNylcBtwfJW4CJ
	vzMnMPgOERd/O3eY+nAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrjRB-008Uly-L2; Thu, 19 May 2022 16:55:45 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrjQz-008Ui3-IW; Thu, 19 May 2022 16:55:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2EFF41477;
 Thu, 19 May 2022 09:55:32 -0700 (PDT)
Received: from localhost (ionvoi01-desktop.cambridge.arm.com [10.1.196.65])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C430A3F718;
 Thu, 19 May 2022 09:55:31 -0700 (PDT)
Date: Thu, 19 May 2022 17:55:30 +0100
From: Ionela Voinescu <ionela.voinescu@arm.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org,
 Atish Patra <atishp@rivosinc.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Morten Rasmussen <morten.rasmussen@arm.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Qing Wang <wangqing@vivo.com>, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 3/8] arch_topology: Set cluster identifier in each
 core/thread from /cpu-map
Message-ID: <YoZ2gjjS3rbRaJZm@arm.com>
References: <20220518093325.2070336-1-sudeep.holla@arm.com>
 <20220518093325.2070336-4-sudeep.holla@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220518093325.2070336-4-sudeep.holla@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_095533_742569_79C58481 
X-CRM114-Status: GOOD (  28.29  )
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

Hi,

As said before, this creates trouble for CONFIG_SCHED_CLUSTER=y.
The output below is obtained from Juno.

When cluster_id is populated, a new CLS level is created by the scheduler
topology code. In this case the clusters in DT determine that the cluster
siblings and llc siblings are the same so the MC scheduler domain will
be removed and, for Juno, only CLS and DIE will be kept.

root@debian-arm64-buster:/sys/kernel/debug/sched/domains/cpu1# grep . */*
domain0/busy_factor:16
domain0/cache_nice_tries:1
domain0/flags:SD_BALANCE_NEWIDLE SD_BALANCE_EXEC SD_BALANCE_FORK SD_WAKE_AFFINE SD_SHARE_PKG_RESOURCES SD_PREFER_SIBLING
domain0/imbalance_pct:117
domain0/max_interval:4
domain0/max_newidle_lb_cost:14907
domain0/min_interval:2
domain0/name:CLS
domain1/busy_factor:16
domain1/cache_nice_tries:1
domain1/flags:SD_BALANCE_NEWIDLE SD_BALANCE_EXEC SD_BALANCE_FORK SD_WAKE_AFFINE SD_ASYM_CPUCAPACITY SD_ASYM_CPUCAPACITY_FULL SD_PREFER_SIBLING
domain1/imbalance_pct:117
domain1/max_interval:12
domain1/max_newidle_lb_cost:11858
domain1/min_interval:6
domain1/name:DIE

To be noted that we also get a new flag SD_PREFER_SIBLING for the CLS
level that is not appropriate. We usually remove it for the child of a
SD_ASYM_CPUCAPACITY domain, but we don't currently redo this after some
levels are degenerated. This is a fixable issue.

But looking at the bigger picture, a good question is what is the best
thing to do when cluster domains and llc domains span the same CPUs?

Possibly it would be best to restrict clusters (which are almost an
arbitrary concept) to always span a subset of CPUs of the llc domain,
if llc siblings can be obtained? If those clusters are not properly set
up in DT to respect this condition, cluster_siblings would need to be
cleared (or set to the current CPU) so the CLS domain is not created at
all.

Additionally, should we use cluster information from DT (cluster_id) to
create an MC level if we don't have llc information, even if
CONFIG_SCHED_CLUSTER=n?

I currently don't have a very clear picture of how cluster domains and
llc domains would "live" together in a variety of topologies. I'll try
other DT topologies to see if there are others that can lead to trouble.

Thanks,
Ionela.

On Wednesday 18 May 2022 at 10:33:20 (+0100), Sudeep Holla wrote:
> Let us set the cluster identifier as parsed from the device tree
> cluster nodes within /cpu-map.
> 
> We don't support nesting of clusters yet as there are no real hardware
> to support clusters of clusters.
> 
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> ---
>  drivers/base/arch_topology.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
> index 7f5aa655c1f4..bdb6f2a17df0 100644
> --- a/drivers/base/arch_topology.c
> +++ b/drivers/base/arch_topology.c
> @@ -491,7 +491,7 @@ static int __init get_cpu_for_node(struct device_node *node)
>  }
>  
>  static int __init parse_core(struct device_node *core, int package_id,
> -			     int core_id)
> +			     int cluster_id, int core_id)
>  {
>  	char name[20];
>  	bool leaf = true;
> @@ -507,6 +507,7 @@ static int __init parse_core(struct device_node *core, int package_id,
>  			cpu = get_cpu_for_node(t);
>  			if (cpu >= 0) {
>  				cpu_topology[cpu].package_id = package_id;
> +				cpu_topology[cpu].cluster_id = cluster_id;
>  				cpu_topology[cpu].core_id = core_id;
>  				cpu_topology[cpu].thread_id = i;
>  			} else if (cpu != -ENODEV) {
> @@ -528,6 +529,7 @@ static int __init parse_core(struct device_node *core, int package_id,
>  		}
>  
>  		cpu_topology[cpu].package_id = package_id;
> +		cpu_topology[cpu].cluster_id = cluster_id;
>  		cpu_topology[cpu].core_id = core_id;
>  	} else if (leaf && cpu != -ENODEV) {
>  		pr_err("%pOF: Can't get CPU for leaf core\n", core);
> @@ -537,7 +539,8 @@ static int __init parse_core(struct device_node *core, int package_id,
>  	return 0;
>  }
>  
> -static int __init parse_cluster(struct device_node *cluster, int depth)
> +static int __init
> +parse_cluster(struct device_node *cluster, int cluster_id, int depth)
>  {
>  	char name[20];
>  	bool leaf = true;
> @@ -557,7 +560,7 @@ static int __init parse_cluster(struct device_node *cluster, int depth)
>  		c = of_get_child_by_name(cluster, name);
>  		if (c) {
>  			leaf = false;
> -			ret = parse_cluster(c, depth + 1);
> +			ret = parse_cluster(c, i, depth + 1);
>  			of_node_put(c);
>  			if (ret != 0)
>  				return ret;
> @@ -581,7 +584,7 @@ static int __init parse_cluster(struct device_node *cluster, int depth)
>  			}
>  
>  			if (leaf) {
> -				ret = parse_core(c, 0, core_id++);
> +				ret = parse_core(c, 0, cluster_id, core_id++);
>  			} else {
>  				pr_err("%pOF: Non-leaf cluster with core %s\n",
>  				       cluster, name);
> @@ -621,7 +624,7 @@ static int __init parse_dt_topology(void)
>  	if (!map)
>  		goto out;
>  
> -	ret = parse_cluster(map, 0);
> +	ret = parse_cluster(map, -1, 0);
>  	if (ret != 0)
>  		goto out_map;
>  
> -- 
> 2.36.1
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
