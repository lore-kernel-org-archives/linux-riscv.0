Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48509C433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jun 2022 12:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hp8HoAlK4+PAXYvJhKvTa460VISOVtjnP/6hZ7QSgWo=; b=LUd22fVBIB0igQ
	DBY+J9PalHsSGNBFfuFzNfyhNEQd4XSRWWdf0C6TZw0DBYLiQqCibHzotiCKvyxhXOhw8VlSF5Ocy
	aRKgy6poggliUeeSclnOXyOdyWXgWFRNwKDi8LJ798QaQXIXNMRCNYQiTzAAHQtl2aPeJ22HqCD/N
	zgHbsHP23xtFSJhSzak6I24nnalXC3MI0BS6tzS6OwsgVfZGvhFnmjY1UuN5nb6TOSyOKYCFacgSV
	2Z0D27bawJVbL6+3OEm8TMXms/uTdC4FeRVK4IbtEVidWpJPDUfU42sjWM0XIL1HeX6PtmNzS0Bho
	q8bgDC9xh4KILC7ExBLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwN7z-00FwqE-BN; Wed, 01 Jun 2022 12:07:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwN5n-00Ftbf-S4; Wed, 01 Jun 2022 12:04:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 261B7ED1;
	Wed,  1 Jun 2022 05:04:44 -0700 (PDT)
Received: from bogus (unknown [10.57.9.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9707D3F73D;
	Wed,  1 Jun 2022 05:04:41 -0700 (PDT)
Date: Wed, 1 Jun 2022 13:03:53 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Gavin Shan <gshan@redhat.com>
Cc: linux-kernel@vger.kernel.org, Atish Patra <atishp@atishpatra.org>,
	Atish Patra <atishp@rivosinc.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Morten Rasmussen <morten.rasmussen@arm.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Qing Wang <wangqing@vivo.com>, linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v3 00/16] arch_topology: Updates to add socket support
 and fix cluster ids
Message-ID: <20220601120353.mz3t3sse2ja6engx@bogus>
References: <20220525081416.3306043-1-sudeep.holla@arm.com>
 <5258e7c2-7829-af20-6416-1a40a09d1917@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5258e7c2-7829-af20-6416-1a40a09d1917@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_050452_051041_66C1E571 
X-CRM114-Status: GOOD (  40.14  )
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

On Wed, Jun 01, 2022 at 11:49:07AM +0800, Gavin Shan wrote:
> Hi Sudeep,
> 
> On 5/25/22 4:14 PM, Sudeep Holla wrote:
> > This version updates cacheinfo to populate and use the information from
> > there for all the cache topology. Sorry for posting in the middle of
> > merge window but better to get this tested earlier so that it is ready
> > for next merge window.
> > 
> > This series intends to fix some discrepancies we have in the CPU topology
> > parsing from the device tree /cpu-map node. Also this diverges from the
> > behaviour on a ACPI enabled platform. The expectation is that both DT
> > and ACPI enabled systems must present consistent view of the CPU topology.
> > 
> > Currently we assign generated cluster count as the physical package identifier
> > for each CPU which is wrong. The device tree bindings for CPU topology supports
> > sockets to infer the socket or physical package identifier for a given CPU.
> > Also we don't check if all the cores/threads belong to the same cluster before
> > updating their sibling masks which is fine as we don't set the cluster id yet.
> > 
> > These changes also assigns the cluster identifier as parsed from the device tree
> > cluster nodes within /cpu-map without support for nesting of the clusters.
> > Finally, it also add support for socket nodes in /cpu-map. With this the
> > parsing of exact same information from ACPI PPTT and /cpu-map DT node
> > aligns well.
> > 
> > The only exception is that the last level cache id information can be
> > inferred from the same ACPI PPTT while we need to parse CPU cache nodes
> > in the device tree.
> > 
> > P.S: I have not cc-ed Greg and Rafael so that all the users of arch_topology
> > agree with the changes first before we include them.
> > 
> > v2[2]->v3:
> > 	- Dropped support to get the device node for the CPU's LLC
> > 	- Updated cacheinfo to support calling of detect_cache_attributes
> > 	  early in smp_prepare_cpus stage
> > 	- Added support to check if LLC is valid and shared in the cacheinfo
> > 	- Used the same in arch_topology
> > 
> > v1[1]->v2[2]:
> > 	- Updated ID validity check include all non-negative value
> > 	- Added support to get the device node for the CPU's last level cache
> > 	- Added support to build llc_sibling on DT platforms
> > 
> > [1] https://lore.kernel.org/lkml/20220513095559.1034633-1-sudeep.holla@arm.com
> > [2] https://lore.kernel.org/lkml/20220518093325.2070336-1-sudeep.holla@arm.com
> > 
> > Sudeep Holla (16):
> >    cacheinfo: Use of_cpu_device_node_get instead cpu_dev->of_node
> >    cacheinfo: Add helper to access any cache index for a given CPU
> >    cacheinfo: Move cache_leaves_are_shared out of CONFIG_OF
> >    cacheinfo: Add support to check if last level cache(LLC) is valid or shared
> >    cacheinfo: Allow early detection and population of cache attributes
> >    arch_topology: Add support to parse and detect cache attributes
> >    arch_topology: Use the last level cache information from the cacheinfo
> >    arm64: topology: Remove redundant setting of llc_id in CPU topology
> >    arch_topology: Drop LLC identifier stash from the CPU topology
> >    arch_topology: Set thread sibling cpumask only within the cluster
> >    arch_topology: Check for non-negative value rather than -1 for IDs validity
> >    arch_topology: Avoid parsing through all the CPUs once a outlier CPU is found
> >    arch_topology: Don't set cluster identifier as physical package identifier
> >    arch_topology: Drop unnecessary check for uninitialised package_id
> >    arch_topology: Set cluster identifier in each core/thread from /cpu-map
> >    arch_topology: Add support for parsing sockets in /cpu-map
> > 
> >   arch/arm64/kernel/topology.c  |  14 -----
> >   drivers/base/arch_topology.c  |  92 +++++++++++++++++----------
> >   drivers/base/cacheinfo.c      | 114 +++++++++++++++++++++-------------
> >   include/linux/arch_topology.h |   1 -
> >   include/linux/cacheinfo.h     |   3 +
> >   5 files changed, 135 insertions(+), 89 deletions(-)
> > 
> 
> I tried this series on virtual machine where ACPI is enabled and looks good.
> Especially for PATCH[10], resolving the issue I have. So I provided my tested-by
> tag for it. Besides, I checked the changes related to ACPI part and looks to
> me either after the mentioned nits fixed. I leave the changes related to device-tree
> to be reviewed by the experts :)
> 

Thanks for the review and testing, much appreciated!
Yes the changes for ACPI is very minimal in this series, except the bug fix
you are interested, nothing changes in the system behaviour. The main aim
is to get the same behaviour on a similar DT based system.

-- 
Regards,
Sudeep

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
