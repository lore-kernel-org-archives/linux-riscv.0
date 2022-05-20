Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE09FC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 20 May 2022 13:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XXqRNC3/KifC+uK/7/pd85cUNXdoSuJTSoZRFS0/WRc=; b=E+nwXnyX9H0RB9
	CFxBo1C/HLgMLW6lAm2AgpVduTuuoFGoAwpj50snSQZvNmtHO7yUCLL1YSryeDAC9TaaIkJyaamAm
	AqnTx5qyvoI5Ni+IE5TnuMhFnsTeizNKpU+R2az+rJeXrJVcCkDXYtdi6sy+V6UemH55376cBLDN2
	5pZygfvtU6BgUVMqpC37uJvvaBfEG2uxoctN+mfaeCxEYc5pa7/MB9xIMVmZLQypCMvANZlpt3ETk
	JQX5OiHzvsIQ/Awh9AA8g8IufLVjg9fwSNcG5wdeeaR+2O9SXwQFLF2vwbUATGyLViAcM3vDnLz3t
	tDT3UXVXXvXrOWF5TyHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ns360-00ClgT-HV; Fri, 20 May 2022 13:55:12 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ns35m-00ClZc-2y; Fri, 20 May 2022 13:55:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5280B1477;
 Fri, 20 May 2022 06:54:56 -0700 (PDT)
Received: from bogus (unknown [10.57.66.157])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F11AF3F73D;
 Fri, 20 May 2022 06:54:53 -0700 (PDT)
Date: Fri, 20 May 2022 14:54:47 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: Ionela Voinescu <ionela.voinescu@arm.com>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org,
 Atish Patra <atishp@rivosinc.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Morten Rasmussen <morten.rasmussen@arm.com>,
 Qing Wang <wangqing@vivo.com>, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 3/8] arch_topology: Set cluster identifier in each
 core/thread from /cpu-map
Message-ID: <20220520135447.bvdipvgjuy4dx64d@bogus>
References: <20220518093325.2070336-1-sudeep.holla@arm.com>
 <20220518093325.2070336-4-sudeep.holla@arm.com>
 <YoZ2gjjS3rbRaJZm@arm.com>
 <26f39a9d-1a02-b77d-5c89-88a1fb0e4eac@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <26f39a9d-1a02-b77d-5c89-88a1fb0e4eac@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_065458_285906_BAD6168E 
X-CRM114-Status: GOOD (  36.51  )
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

On Fri, May 20, 2022 at 02:33:19PM +0200, Dietmar Eggemann wrote:
> On 19/05/2022 18:55, Ionela Voinescu wrote:
> > Hi,
> > 
> > As said before, this creates trouble for CONFIG_SCHED_CLUSTER=y.
> > The output below is obtained from Juno.
> > 
> > When cluster_id is populated, a new CLS level is created by the scheduler
> > topology code. In this case the clusters in DT determine that the cluster
> > siblings and llc siblings are the same so the MC scheduler domain will
> > be removed and, for Juno, only CLS and DIE will be kept.
> 
> [...]
> 
> > To be noted that we also get a new flag SD_PREFER_SIBLING for the CLS
> > level that is not appropriate. We usually remove it for the child of a
> > SD_ASYM_CPUCAPACITY domain, but we don't currently redo this after some
> > levels are degenerated. This is a fixable issue.
> > 
> > But looking at the bigger picture, a good question is what is the best
> > thing to do when cluster domains and llc domains span the same CPUs?
> > 
> > Possibly it would be best to restrict clusters (which are almost an
> > arbitrary concept) to always span a subset of CPUs of the llc domain,
> > if llc siblings can be obtained? If those clusters are not properly set
> > up in DT to respect this condition, cluster_siblings would need to be
> > cleared (or set to the current CPU) so the CLS domain is not created at
> > all.
> > 
> > Additionally, should we use cluster information from DT (cluster_id) to
> > create an MC level if we don't have llc information, even if
> > CONFIG_SCHED_CLUSTER=n?
> > 
> > I currently don't have a very clear picture of how cluster domains and
> > llc domains would "live" together in a variety of topologies. I'll try
> > other DT topologies to see if there are others that can lead to trouble.
> 
> This would be an issue. Depending on CONFIG_SCHED_CLUSTER we would get
> two different systems from the viewpoint of the scheduler.
>

Agreed, but that is the issue with the change that updates cpu_coregroup_mask
based on CONFIG_SCHED_CLUSTER, the one that we added recent for Ampere
systems. Sorry, but I admit I was OK for the work around then but all
these discussions has made to disagree with that change now.

> To me `cluster_id/_sibling` don't describe a certain level of CPU
> grouping (e.g. one level above core or one level below package).
>

True, but based on how it is extracted from the firmware todat(ACPI and DT
with this series, it is one level above the cores.

> They were introduced to describe one level below LLC (e.g. Kunpeng920 L3
> (24 CPUs LLC) -> L3 tag (4 CPUs) or x86 Jacobsville L3 -> L2), (Commit
>                  ^^^^^^                                   ^^
> c5e22feffdd7 ("topology: Represent clusters of CPUs within a die")).
>

Again correct, but the description of sysfs is what we need to rely on from
now. If that is not clear, we need to make it clear. But I don't real bother
much on how it is related to LLC as it is known to vary with different
systems.

> The Ampere Altra issue already gave us a taste of the possible issues of
> this definition, commit db1e59483dfd ("topology: make core_mask include
> at least cluster_siblings").
>

Yes this is one I am referring above. I tend to disagree with that now.

> If we link `cluster_id/_sibling` against (1. level) cpu-map cluster
> nodes plus using llc and `cluster_sibling >= llc_sibling` we will run
> into these issues.

As I said you can't change the topology because it causes issues the
way we build sched_domains. You need to figure how to build sched domains
for such systems. If current set of domains or how the masks for each of
the domains are derived is not sufficient or incorrect, we need to fix that.
We are not changing topology masks for that, whatever the reason might be,
sorry as these are userspace visible.

--
Regards,
Sudeep

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
