Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94789C43334
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jun 2022 16:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fvTdIXxyXuRtGMeprjnvT0tMU1kUBriFK6yIAgzoOsE=; b=jEEqG1zEVbmYqG
	j6pxiKGAxkCWQnLwSANkuv564bEXdICHOoFfLp0hCz4rrIZD7G3/0U1a9QHvu3W6JD8BmHUy6FtKv
	6GzJ4fW34kdBY7rc2mqYfklKNSFvrMu6UBKmn8mCcBffxZDZdJhjgF9O1JTTgCdmLObTvouNR2qkz
	BWwwDc+Y+gN/cKFELqbuNXCOCL3UNlttFdZB3GjPt9OauqBb+Z8/9ptIm4+x3snq0lQXWUvOwfI+D
	D7VgYbGuVRXds+ViobiFXLwZabA2GVsjeqTmuu48U4nvqbkjS13UYxHRmy71PUu/a9+aPqaDxNWdX
	MbzJXK3+2mRrd9PR4aZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5rxG-001uB9-FH; Mon, 27 Jun 2022 16:51:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5rwz-001u1P-65; Mon, 27 Jun 2022 16:51:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 116A71758;
	Mon, 27 Jun 2022 09:50:58 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 291263F792;
	Mon, 27 Jun 2022 09:50:56 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: linux-kernel@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Atish Patra <atishp@atishpatra.org>,
	Atish Patra <atishp@rivosinc.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Qing Wang <wangqing@vivo.com>,
	Rob Herring <robh+dt@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Ionela Voinescu <ionela.voinescu@arm.com>,
	Pierre Gondois <pierre.gondois@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v5 00/19] arch_topology: Updates to add socket support and fix cluster ids
Date: Mon, 27 Jun 2022 17:50:28 +0100
Message-Id: <20220627165047.336669-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_095101_363391_03241745 
X-CRM114-Status: GOOD (  22.97  )
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

Hi All,

This version updates cacheinfo to populate and use the information from
there for all the cache topology.

This series intends to fix some discrepancies we have in the CPU topology
parsing from the device tree /cpu-map node. Also this diverges from the
behaviour on a ACPI enabled platform. The expectation is that both DT
and ACPI enabled systems must present consistent view of the CPU topology.

Currently we assign generated cluster count as the physical package identifier
for each CPU which is wrong. The device tree bindings for CPU topology supports
sockets to infer the socket or physical package identifier for a given CPU.
Also we don't check if all the cores/threads belong to the same cluster before
updating their sibling masks which is fine as we don't set the cluster id yet.

These changes also assigns the cluster identifier as parsed from the device tree
cluster nodes within /cpu-map without support for nesting of the clusters.
Finally, it also add support for socket nodes in /cpu-map. With this the
parsing of exact same information from ACPI PPTT and /cpu-map DT node
aligns well.

The only exception is that the last level cache id information can be
inferred from the same ACPI PPTT while we need to parse CPU cache nodes
in the device tree.

Hi Greg,

I had not cc-ed you on first 3 versions as we had some disagreement
amongst Arm developers which we have now(since v4) settled. Let me know
how you want to merge this once you agree with the changes. I can send
pull request if you prefer. Let me know.

v4[4]->v5:
	- Added all the tags recieved so far. Rafael has acked only change
	  in ACPI and Catalin has acked only change in arm64.
	- Addressed all the typos pointed by Ionela and dropped the patch
	  removing the checks for invalid package id as discussed and update
	  depth in nested cluster warning check.

v3[3]->v4[4]:
	- Updated ACPI PPTT fw_token to use table offset instead of virtual
	  address as it could get changed for everytime it is mapped before
	  the global acpi_permanent_mmap is set
	- Added warning for the topology with nested clusters
	- Added update to cpu_clustergroup_mask so that introduction of
	  correct cluster_id doesn't break existing platforms by limiting
	  the span of clustergroup_mask(by Ionela)

v2[2]->v3[3]:
        - Dropped support to get the device node for the CPU's LLC
        - Updated cacheinfo to support calling of detect_cache_attributes
          early in smp_prepare_cpus stage
        - Added support to check if LLC is valid and shared in the cacheinfo
        - Used the same in arch_topology

v1[1]->v2[2]:
        - Updated ID validity check include all non-negative value
        - Added support to get the device node for the CPU's last level cache
        - Added support to build llc_sibling on DT platforms

[1] https://lore.kernel.org/lkml/20220513095559.1034633-1-sudeep.holla@arm.com
[2] https://lore.kernel.org/lkml/20220518093325.2070336-1-sudeep.holla@arm.com
[3] https://lore.kernel.org/lkml/20220525081416.3306043-1-sudeep.holla@arm.com
[4] https://lore.kernel.org/lkml/20220621192034.3332546-1-sudeep.holla@arm.com

Ionela Voinescu (1):
  arch_topology: Limit span of cpu_clustergroup_mask()

Sudeep Holla (18):
  ACPI: PPTT: Use table offset as fw_token instead of virtual address
  cacheinfo: Use of_cpu_device_node_get instead cpu_dev->of_node
  cacheinfo: Add helper to access any cache index for a given CPU
  cacheinfo: Move cache_leaves_are_shared out of CONFIG_OF
  cacheinfo: Add support to check if last level cache(LLC) is valid or shared
  cacheinfo: Allow early detection and population of cache attributes
  cacheinfo: Use cache identifiers to check if the caches are shared if available
  arch_topology: Add support to parse and detect cache attributes
  arch_topology: Use the last level cache information from the cacheinfo
  arm64: topology: Remove redundant setting of llc_id in CPU topology
  arch_topology: Drop LLC identifier stash from the CPU topology
  arch_topology: Set thread sibling cpumask only within the cluster
  arch_topology: Check for non-negative value rather than -1 for IDs validity
  arch_topology: Avoid parsing through all the CPUs once a outlier CPU is found
  arch_topology: Don't set cluster identifier as physical package identifier
  arch_topology: Set cluster identifier in each core/thread from /cpu-map
  arch_topology: Add support for parsing sockets in /cpu-map
  arch_topology: Warn that topology for nested clusters is not supported

 arch/arm64/kernel/topology.c  |  14 ----
 drivers/acpi/pptt.c           |   3 +-
 drivers/base/arch_topology.c  |  97 +++++++++++++++++++-------
 drivers/base/cacheinfo.c      | 127 ++++++++++++++++++++++------------
 include/linux/arch_topology.h |   1 -
 include/linux/cacheinfo.h     |   3 +
 6 files changed, 162 insertions(+), 83 deletions(-)

--
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
