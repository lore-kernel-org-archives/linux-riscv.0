Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2C50C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jun 2022 13:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2QtuBxNkVVD+lzFCVt2BDpNiQxx3xiWikhvczlVKwHI=; b=DRBw+oS5I2i8LG
	YWKRGonRamJkbJxRV0VdFttQ6ZRboy5KBoDrOChEvtB/7nq37d8IlhF6rYtoK85Wa+ZtyfYDZUZb2
	+2l2PNoZ+1NznPoeT0yfXnjcdkAA9Vw7QHKeuhRi1FRqny4X+d1LCO024iaAH+wG2quTm5YHWbwD8
	pyokT9C2LqgYZ11L+fkFScmCUq+9PqGyJ1JvrAeGebEmc3haW4D29omIgOgVf+w968l7DCNws4INk
	BjL99M2UjhbVmGgjmSAuXqjvCtToHOu89sKd3ZaAA4oCTUIufkdf9LfOheVzC1xcEzIAYV/3rrR2Y
	qvBRd7GCrizz65G1dC5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5p0x-001CUl-UV; Mon, 27 Jun 2022 13:42:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5p0m-001CR3-L7; Mon, 27 Jun 2022 13:42:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B7E7A1758;
	Mon, 27 Jun 2022 06:42:43 -0700 (PDT)
Received: from localhost (ionvoi01-desktop.cambridge.arm.com [10.1.196.65])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 29DB43F5A1;
	Mon, 27 Jun 2022 06:42:43 -0700 (PDT)
Date: Mon, 27 Jun 2022 14:42:41 +0100
From: Ionela Voinescu <ionela.voinescu@arm.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-kernel@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>,
	Atish Patra <atishp@atishpatra.org>,
	Atish Patra <atishp@rivosinc.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Qing Wang <wangqing@vivo.com>, Rob Herring <robh+dt@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Pierre Gondois <pierre.gondois@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH v4 12/20] arch_topology: Set thread sibling cpumask only
 within the cluster
Message-ID: <Yrmz0ZAUaFCqMt5u@arm.com>
References: <20220621192034.3332546-1-sudeep.holla@arm.com>
 <20220621192034.3332546-13-sudeep.holla@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220621192034.3332546-13-sudeep.holla@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_064244_810137_5CB77DF3 
X-CRM114-Status: GOOD (  19.20  )
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

On Tuesday 21 Jun 2022 at 20:20:26 (+0100), Sudeep Holla wrote:
> Currently the cluster identifier is not set on the DT based platforms.
> The reset or default value is -1 for all the CPUs. Once we assign the
> cluster identifier values correctly that imay result in getting the thread
                                           ^^^^
Nit: 					   may
> siblings wrongs as the core identifiers can be same for 2 different CPUs
Nit:       ^^^^^^
	   wrong


Thanks,
Ionela.

> belonging to 2 different cluster.
> 
> So, in order to get the thread sibling cpumasks correct, we need to
> update them only if the cores they belong are in the same cluster within
> the socket. Let us skip updation of the thread sibling cpumaks if the
> cluster identifier doesn't match.
> 
> This change won't affect even if the cluster identifiers are not set
> currently but will avoid any breakage once we set the same correctly.
> 
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> ---
>  drivers/base/arch_topology.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
> index b63cc52e12ce..7a5ff1ea5f00 100644
> --- a/drivers/base/arch_topology.c
> +++ b/drivers/base/arch_topology.c
> @@ -708,15 +708,17 @@ void update_siblings_masks(unsigned int cpuid)
>  		if (cpuid_topo->package_id != cpu_topo->package_id)
>  			continue;
>  
> -		if (cpuid_topo->cluster_id == cpu_topo->cluster_id &&
> -		    cpuid_topo->cluster_id != -1) {
> +		cpumask_set_cpu(cpuid, &cpu_topo->core_sibling);
> +		cpumask_set_cpu(cpu, &cpuid_topo->core_sibling);
> +
> +		if (cpuid_topo->cluster_id != cpu_topo->cluster_id)
> +			continue;
> +
> +		if (cpuid_topo->cluster_id != -1) {
>  			cpumask_set_cpu(cpu, &cpuid_topo->cluster_sibling);
>  			cpumask_set_cpu(cpuid, &cpu_topo->cluster_sibling);
>  		}
>  
> -		cpumask_set_cpu(cpuid, &cpu_topo->core_sibling);
> -		cpumask_set_cpu(cpu, &cpuid_topo->core_sibling);
> -
>  		if (cpuid_topo->core_id != cpu_topo->core_id)
>  			continue;
>  
> -- 
> 2.36.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
