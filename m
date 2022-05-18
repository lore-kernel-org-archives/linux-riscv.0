Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3285C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 18 May 2022 09:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ekbg161hX5EY70OKKH1JQxSyxtoCrkklgViJfx+1lVM=; b=jzbAFlXCPCftEY
	SEw+nDq5dqLKzbGMuOecJgfHWq1372y7R50/xpw90ZuUJ8OfswtXW+NGpsbN/KbHUAXjH7pRidXzF
	vk1uhGAnNfHShO9cH7BrjaeHzy31CBEDIYhS6L64Odx2Ifmcd5obWmnjHhFDxr09crufCLrLuMzwy
	ZaAHQYA9Ety5x0dIaZ1KLqc1JFF1K+jn4FITaWpunOor0MfiW2g6zp0Mwmnz9fwNzPFOEkj7C5cIr
	uHhxQRbP/mVZIyJs33ye0E0rgkv+kfip8WnuzqFbhNt6LlnBe8vtuBlZuFMNVtm9Ac56cbYRK4ZAz
	iodiNvWbnUJSlHL2nuHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrG4T-0012ja-CO; Wed, 18 May 2022 09:34:21 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrG46-0012X4-FD; Wed, 18 May 2022 09:34:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 210931042;
 Wed, 18 May 2022 02:33:53 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9DD953F66F;
 Wed, 18 May 2022 02:33:51 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: Atish Patra <atishp@atishpatra.org>,
	linux-kernel@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@arm.com>, Atish Patra <atishp@rivosinc.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Morten Rasmussen <morten.rasmussen@arm.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>, Qing Wang <wangqing@vivo.com>,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 0/8] arch_topology: Updates to add socket support and fix
 cluster ids
Date: Wed, 18 May 2022 10:33:17 +0100
Message-Id: <20220518093325.2070336-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_023358_592898_2AF5F8EB 
X-CRM114-Status: GOOD (  15.71  )
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

P.S: I have not cc-ed Greg and Rafael so that all the users of arch_topology
agree with the changes first before we include them.

v1[1]->v2:
	- Updated ID validity check include all non-negative value
	- Added support to get the device node for the CPU's last level cache
	- Added support to build llc_sibling on DT platforms

[1] https://lore.kernel.org/lkml/20220513095559.1034633-1-sudeep.holla@arm.com

Sudeep Holla (8):
  arch_topology: Don't set cluster identifier as physical package identifier
  arch_topology: Set thread sibling cpumask only within the cluster
  arch_topology: Set cluster identifier in each core/thread from /cpu-map
  arch_topology: Add support for parsing sockets in /cpu-map
  arch_topology: Check for non-negative value rather than -1 for IDs validity
  arch_topology: Avoid parsing through all the CPUs once a outlier CPU is found
  of: base: add support to get the device node for the CPU's last level cache
  arch_topology: Add support to build llc_sibling on DT platforms

 drivers/base/arch_topology.c  | 75 +++++++++++++++++++++++++++--------
 drivers/of/base.c             | 33 +++++++++++----
 include/linux/arch_topology.h |  1 +
 include/linux/of.h            |  1 +
 4 files changed, 85 insertions(+), 25 deletions(-)

--
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
