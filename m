Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8C45C43334
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Jul 2022 09:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u9J1nrZIYL9Hf0x9WGPWB3PorBfeLdx5nst3MgAS4iM=; b=hvwQ4v0cVEvkdh
	m+1up6VqL0nQ+NwuczqF+2lqbn8MsNFRB8eh99gvL1iEA8y9TAxSkL96gZqxFzbWGtBockFOLkpdv
	RB0IGoJ8Q/lE2xn9ofJStgKejce+IZH2WTIKgWTmVBupYK24t/E8YQE0Yhtj7QaXSsInGhsV1srre
	SO8gh5TlOz2WlQ+Jk2rOC02UDFOGekuwYY8SKlyVZCzIpS59FlPtcGZaipF4dqWAKiHL+O9lBKFMn
	2OKJJsgXU62SNx1x58QBuicm77+sM/cml+xWLCbn9hosnLRIly69Kf7XN1apq+xy2xu74zqilcS9B
	2SL2NgVX1V30+QVXTkQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9jwF-002ldi-Hp; Fri, 08 Jul 2022 09:06:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9jvc-002lON-Pn; Fri, 08 Jul 2022 09:05:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 53740D6E;
	Fri,  8 Jul 2022 02:05:35 -0700 (PDT)
Received: from localhost (ionvoi01-desktop.cambridge.arm.com [10.1.196.65])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9321F3F792;
	Fri,  8 Jul 2022 02:05:34 -0700 (PDT)
Date: Fri, 8 Jul 2022 10:05:32 +0100
From: Ionela Voinescu <ionela.voinescu@arm.com>
To: Darren Hart <darren@os.amperecomputing.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	conor.dooley@microchip.com, valentina.fernandezalanis@microchip.com,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Qing Wang <wangqing@vivo.com>, Rob Herring <robh+dt@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Pierre Gondois <pierre.gondois@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v6 17/21] arch_topology: Limit span of
 cpu_clustergroup_mask()
Message-ID: <YsfzXL7fp3sYVgda@arm.com>
References: <20220704101605.1318280-1-sudeep.holla@arm.com>
 <20220704101605.1318280-18-sudeep.holla@arm.com>
 <Ysd160PQdWoDIdRC@fedora>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Ysd160PQdWoDIdRC@fedora>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220708_020536_971999_5E5E85EA 
X-CRM114-Status: GOOD (  41.42  )
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

Hi Darren,

On Thursday 07 Jul 2022 at 17:10:19 (-0700), Darren Hart wrote:
> On Mon, Jul 04, 2022 at 11:16:01AM +0100, Sudeep Holla wrote:
> > From: Ionela Voinescu <ionela.voinescu@arm.com>
> 
> Hi Sudeep and Ionela,
> 
> > 
> > Currently the cluster identifier is not set on DT based platforms.
> > The reset or default value is -1 for all the CPUs. Once we assign the
> > cluster identifier values correctly, the cluster_sibling mask will be
> > populated and returned by cpu_clustergroup_mask() to contribute in the
> > creation of the CLS scheduling domain level, if SCHED_CLUSTER is
> > enabled.
> > 
> > To avoid topologies that will result in questionable or incorrect
> > scheduling domains, impose restrictions regarding the span of clusters,
> 
> Can you provide a specific example of a valid topology that results in
> the wrong thing currently?
> 

When CONFIG_SCHED_CLUSTER=y, all typical big.LITTLE platforms will end up
having a CLS level instead of MC, with an extra flag for the CLS level:
SD_PREFER_SIBLING. Additional to this, potentially broken cluster
descriptions in DT (let's say clusters spanning more CPUs than the LLC
domain) will result in broken scheduler topologies.

This drew our attention that the span of clusters should be restricted
to ensure they always span less CPUs than LLC, if LLC information exists
and LLC spans more than 1 core. But the Ampere Altra functionality you
introduced is maintained. I'll detail this below.

> > as presented to scheduling domains building code: cluster_sibling should
> > not span more or the same CPUs as cpu_coregroup_mask().
> > 
> > This is needed in order to obtain a strict separation between the MC and
> > CLS levels, and maintain the same domains for existing platforms in
> > the presence of CONFIG_SCHED_CLUSTER, where the new cluster information
> > is redundant and irrelevant for the scheduler.
> 
> Unfortunately, I believe this changes the behavior for the existing
> Ampere Altra systems, resulting in degraded performance particularly
> latency sensitive workloads by effectively reverting:
> 
>   db1e59483d topology: make core_mask include at least cluster_siblings
> 
> and ensuring the clustergroup_mask will return with just one CPU for the
> condition the above commit addresses.
> 

It does not change the functionality on Ampere Altra. cpu_coregroup_mask
will still return 2 CPUs (cluster span). The difference is that
cpu_clustergroup_mask will see that cpu_coregroup_masks spans the same
CPUs and it will return a single CPU. This results in the CLS level
being invalidated, and the MC level maintained. But MC will span 2 CPUs,
instead of 1, which was the case before your fix. This is alright as
MC and CLS have the same flags so the existing functionality is fully
maintained.

I've tested on Ampere Altra:

without patch:

cpu0/domain0/flags:SD_BALANCE_NEWIDLE SD_BALANCE_EXEC SD_BALANCE_FORK SD_WAKE_AFFINE SD_SHARE_PKG_RESOURCES SD_PREFER_SIBLING
cpu0/domain0/min_interval:2
cpu0/domain0/name:CLS

cpu0/domain1/flags:SD_BALANCE_NEWIDLE SD_BALANCE_EXEC SD_BALANCE_FORK SD_WAKE_AFFINE SD_PREFER_SIBLING
cpu0/domain1/min_interval:80
cpu0/domain1/name:DIE

cpu0/domain2/flags:SD_BALANCE_NEWIDLE SD_BALANCE_EXEC SD_BALANCE_FORK SD_WAKE_AFFINE SD_SERIALIZE SD_OVERLAP SD_NUMA
cpu0/domain2/min_interval:160
cpu0/domain2/name:NUMA

with this patch:

cpu0/domain0/flags:SD_BALANCE_NEWIDLE SD_BALANCE_EXEC SD_BALANCE_FORK SD_WAKE_AFFINE SD_SHARE_PKG_RESOURCES SD_PREFER_SIBLING
cpu0/domain0/min_interval:2
cpu0/domain0/name:MC

cpu0/domain1/flags:SD_BALANCE_NEWIDLE SD_BALANCE_EXEC SD_BALANCE_FORK SD_WAKE_AFFINE SD_PREFER_SIBLING
cpu0/domain1/min_interval:80
cpu0/domain1/name:DIE

cpu0/domain2/flags:SD_BALANCE_NEWIDLE SD_BALANCE_EXEC SD_BALANCE_FORK SD_WAKE_AFFINE SD_SERIALIZE SD_OVERLAP SD_NUMA
cpu0/domain2/min_interval:160
cpu0/domain2/name:NUMA

> > 
> > While previously the scheduling domain builder code would have removed MC
> > as redundant and kept CLS if SCHED_CLUSTER was enabled and the
> > cpu_coregroup_mask() and cpu_clustergroup_mask() spanned the same CPUs,
> > now CLS will be removed and MC kept.
> > 
> 
> This is not desireable for all systems, particular those which don't
> have an L3 but do share other resources - such as the snoop filter in
> the case of the Ampere Altra.
> 
> While not universally supported, we agreed in the discussion on the
> above patch to allow systems to define clusters independently from the
> L3 as an LLC since this is also independently defined in PPTT.
> 
> Going back to my first comment - does this fix an existing system with a
> valid topology? It's not clear to me what that would look like. The
> Ampere Altra presents a cluster level in PPTT because that is the
> desireable topology for the system. If it's not desirable for another
> system to have the cluster topology - shouldn't it not present that
> layer to the kernel in the first place?
> 

Hopefully my comments above have clarified these.

Thanks,
Ionela.

> Thanks,
> 
> > Cc: Darren Hart <darren@os.amperecomputing.com>
> > Acked-by: Vincent Guittot <vincent.guittot@linaro.org>
> > Tested-by: Ionela Voinescu <ionela.voinescu@arm.com>
> > Signed-off-by: Ionela Voinescu <ionela.voinescu@arm.com>
> > Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> > ---
> >  drivers/base/arch_topology.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
> > index e384afb6cac7..591c1f8e15e2 100644
> > --- a/drivers/base/arch_topology.c
> > +++ b/drivers/base/arch_topology.c
> > @@ -686,6 +686,14 @@ const struct cpumask *cpu_coregroup_mask(int cpu)
> >  
> >  const struct cpumask *cpu_clustergroup_mask(int cpu)
> >  {
> > +	/*
> > +	 * Forbid cpu_clustergroup_mask() to span more or the same CPUs as
> > +	 * cpu_coregroup_mask().
> > +	 */
> > +	if (cpumask_subset(cpu_coregroup_mask(cpu),
> > +			   &cpu_topology[cpu].cluster_sibling))
> > +		return get_cpu_mask(cpu);
> > +
> >  	return &cpu_topology[cpu].cluster_sibling;
> >  }
> >  
> > -- 
> > 2.37.0
> > 
> 
> -- 
> Darren Hart
> Ampere Computing / OS and Kernel

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
