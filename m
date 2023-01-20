Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EBF6C05027
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Jan 2023 12:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JVk3rBCMhAFBVEpZPvBBz5BbuSM9lWQ9CUnAEFR99n4=; b=jULTyUAmncM/xD
	ygY4QKSXc91A+utxP5rL3lWBjzQC3BSST6sgdnLi7fvQVKjWKcqPrAOW98MJ446Lj4cXUTSMBTrki
	0sGcJYip/MRudYfx9KsyuEc6E2ZEvZ5YMDt0BZtW48t+7rPzUWmqDZQiUDjEu/MjmbddyyxZyTvD8
	W11xxXz+hyl/snWlH8TQGv0QsaddPuNOUGU64xi++Qkay5y+lE1NpE2cMErqpLmcvQ5GQMyRW3hkx
	eO4EhQDwYvbaImLfbZEKZq0a8ZpAjFHS5ObGzmwhZYvKJ5eEV3j7ULDfcXvpbphJ4SlV/QAvBLSpv
	5O45qpmGvd5EKfsqG2BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIqN4-00ADkm-EV; Fri, 20 Jan 2023 12:19:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIqMs-00ADiW-PW; Fri, 20 Jan 2023 12:19:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8363C14BF;
	Fri, 20 Jan 2023 04:20:16 -0800 (PST)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D379E3F71A;
	Fri, 20 Jan 2023 04:19:33 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	ALKML <linux-arm-kernel@lists.infradead.org>,
	linux-riscv@lists.infradead.org,
	Pierre Gondois <pierre.gondois@arm.com>
Subject: [GIT PULL]  cacheinfo/arch_topology: Updates for v6.3
Date: Fri, 20 Jan 2023 12:18:56 +0000
Message-Id: <20230120121856.1407369-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230120_041938_921409_4BDE8EF2 
X-CRM114-Status: GOOD (  11.21  )
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

Hi Greg,

Please pull !

It has been tested on RISC-V which is the main users outside of arm64.
The ACPI the RISC-V parts are acked-by the respective maintainers. All
the changes are in the -next for sometime and no issues reported at this
time.

Regards,
Sudeep

-->8

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/archtopo-cacheinfo-updates-6.3

for you to fetch changes up to 198102c9103fc78d8478495971947af77edb05c1:

  cacheinfo: Fix shared_cpu_map to handle shared caches at different levels (2023-01-18 09:58:40 +0000)

----------------------------------------------------------------
cacheinfo and arch_topology updates for v6.3

The main change is to build the cache topology information for all
the CPUs from the primary CPU. Currently the cacheinfo for secondary CPUs
is created during the early boot on the respective CPU itself. Preemption
and interrupts are disabled at this stage. On PREEMPT_RT kernels, allocating
memory and even parsing the PPTT table for ACPI based systems triggers a:
  'BUG: sleeping function called from invalid context'

To prevent this bug, the cacheinfo is now allocated from the primary CPU
when preemption and interrupts are enabled and before booting secondary
CPUs. The cache levels/leaves are computed from DT/ACPI PPTT information
only, without relying on any architecture specific mechanism if done so
early.

The other minor change included here is to handle shared caches at
different levels when not all the CPUs on the system have the same
cache hierarchy.

----------------------------------------------------------------
Pierre Gondois (6):
      cacheinfo: Use RISC-V's init_cache_level() as generic OF implementation
      cacheinfo: Return error code in init_of_cache_level()
      cacheinfo: Check 'cache-unified' property to count cache leaves
      ACPI: PPTT: Remove acpi_find_cache_levels()
      ACPI: PPTT: Update acpi_find_last_cache_level() to acpi_get_cache_info()
      arch_topology: Build cacheinfo from primary CPU

Yong-Xuan Wang (1):
      cacheinfo: Fix shared_cpu_map to handle shared caches at different levels

 arch/arm64/kernel/cacheinfo.c |  11 +--
 arch/riscv/kernel/cacheinfo.c |  42 -----------
 drivers/acpi/pptt.c           |  93 ++++++++++++++----------
 drivers/base/arch_topology.c  |  12 +++-
 drivers/base/cacheinfo.c      | 161 +++++++++++++++++++++++++++++++++++-------
 include/linux/cacheinfo.h     |  11 ++-
 6 files changed, 213 insertions(+), 117 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
