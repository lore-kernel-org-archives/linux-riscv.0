Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 844A9C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 19 May 2022 16:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PvtPctjK+MplTm/c+cS5TQ+S/UJCLkxfkBq6z1MZ828=; b=X0664lREy7qc4s
	j1LV7Z+057+BxkytgsktH1hdzwhhpWTUOJyu0N0F+YAfH4Mow/ZqeHZrZhQpnRKgYMM+HopKq29l7
	EyYxkDIfW69q1HlCoqwvn5f1Hqfcja7J1y6wdKLGwYuMgaNgPqWzEQzIixGq1DRUf3QT1gtKoLS8j
	qgTcVq/aY4ub2ydaAWqSrrnwqXsPA/rKAmXoYNnOmOJyxgl02kSZfUvM7of3z+/NC/sVyBzVnKG1J
	wTLOMGpd94i73IOcj5Y7I/CfFqqv8ftsWuqRxsEvvN1aZN/FuRmSG3+qxOU2acWGVj8+nnhOC5C/v
	fshUti15kVaGeSDRMytw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrj5J-008Ocq-IK; Thu, 19 May 2022 16:33:09 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrj57-008OXX-3E; Thu, 19 May 2022 16:32:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 25AE21477;
 Thu, 19 May 2022 09:32:51 -0700 (PDT)
Received: from localhost (ionvoi01-desktop.cambridge.arm.com [10.1.196.65])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B50B33F718;
 Thu, 19 May 2022 09:32:50 -0700 (PDT)
Date: Thu, 19 May 2022 17:32:49 +0100
From: Ionela Voinescu <ionela.voinescu@arm.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org,
 Atish Patra <atishp@rivosinc.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Morten Rasmussen <morten.rasmussen@arm.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Qing Wang <wangqing@vivo.com>, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 0/8] arch_topology: Updates to add socket support and
 fix cluster ids
Message-ID: <YoZxKJ6TiAsxTXNl@arm.com>
References: <20220518093325.2070336-1-sudeep.holla@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220518093325.2070336-1-sudeep.holla@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_093257_276306_0EE17A1B 
X-CRM114-Status: GOOD (  31.52  )
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

On Wednesday 18 May 2022 at 10:33:17 (+0100), Sudeep Holla wrote:
> Hi All,
> 
> This series intends to fix some discrepancies we have in the CPU topology
> parsing from the device tree /cpu-map node. Also this diverges from the
> behaviour on a ACPI enabled platform. The expectation is that both DT
> and ACPI enabled systems must present consistent view of the CPU topology.
> 
> Currently we assign generated cluster count as the physical package identifier
> for each CPU which is wrong. The device tree bindings for CPU topology supports
> sockets to infer the socket or physical package identifier for a given CPU.
> Also we don't check if all the cores/threads belong to the same cluster before
> updating their sibling masks which is fine as we don't set the cluster id yet.
> 
> These changes also assigns the cluster identifier as parsed from the device tree
> cluster nodes within /cpu-map without support for nesting of the clusters.
> Finally, it also add support for socket nodes in /cpu-map. With this the
> parsing of exact same information from ACPI PPTT and /cpu-map DT node
> aligns well.
> 
> The only exception is that the last level cache id information can be
> inferred from the same ACPI PPTT while we need to parse CPU cache nodes
> in the device tree.
> 
> P.S: I have not cc-ed Greg and Rafael so that all the users of arch_topology
> agree with the changes first before we include them.
> 
> v1[1]->v2:
> 	- Updated ID validity check include all non-negative value
> 	- Added support to get the device node for the CPU's last level cache
> 	- Added support to build llc_sibling on DT platforms
> 
> [1] https://lore.kernel.org/lkml/20220513095559.1034633-1-sudeep.holla@arm.com
> 
> Sudeep Holla (8):
>   arch_topology: Don't set cluster identifier as physical package identifier
>   arch_topology: Set thread sibling cpumask only within the cluster
>   arch_topology: Set cluster identifier in each core/thread from /cpu-map
>   arch_topology: Add support for parsing sockets in /cpu-map
>   arch_topology: Check for non-negative value rather than -1 for IDs validity
>   arch_topology: Avoid parsing through all the CPUs once a outlier CPU is found
>   of: base: add support to get the device node for the CPU's last level cache
>   arch_topology: Add support to build llc_sibling on DT platforms
> 

Just a recommendation for patch-set structure: it would be best to have
the following sequence to maintain the same scheduler topology and
behaviour when partially applying the set (currently testing this on Juno,
but should be the case for other platforms as well):

2/8 arch_topology: Set thread sibling cpumask only within the cluster
5/8 arch_topology: Check for non-negative value rather than -1 for IDs validity
6/8 arch_topology: Avoid parsing through all the CPUs once a outlier CPU is found

--> these are only preparation/cleanup patches and don't affect current
functionality

7/8 of: base: add support to get the device node for the CPU's last level cache
8/8 arch_topology: Add support to build llc_sibling on DT platforms

--> these will populate llc siblings but this list will be equal to
core siblings (based on package_id) so nothing changes in the scheduler
topology. Even if CONFIG_SCHED_CLUSTER=y, we still have cluster_id=-1 so
nothing will change in that case either, for the patches so far.

1/8 arch_topology: Don't set cluster identifier as physical package identifier

--> 1/8 is the trouble maker if it's the first patch as it will result
in having all CPUs in core_siblings so the topology will be flattened to
just an MC level for a typical b.L system like Juno. But if you add it after
all of the above patches, the llc_siblings will contribute to create the same
MC and DIE levels we expect.

3/8 arch_topology: Set cluster identifier in each core/thread from /cpu-map
4/8 arch_topology: Add support for parsing sockets in /cpu-map

--> Here 3/8 will start creating complications when having clusters in
DT and we have CONFIG_SCHED_CLUSTER=y. But I'll detail this in a reply
to that patch. For CONFIG_SCHED_CLUSTER=n the topology and scheduler
behaviour should be the same as before this set.

Hope it helps,
Ionela.


>  drivers/base/arch_topology.c  | 75 +++++++++++++++++++++++++++--------
>  drivers/of/base.c             | 33 +++++++++++----
>  include/linux/arch_topology.h |  1 +
>  include/linux/of.h            |  1 +
>  4 files changed, 85 insertions(+), 25 deletions(-)
> 
> --
> 2.36.1
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
