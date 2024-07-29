Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EA16C3DA4A
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jul 2024 03:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=L61fTRigCLegOWDOcFRrqtbf88x9SWFV6cAlI89Zf+g=; b=OknLkGuu+poBg6
	fNTfjsDZdOWF9yfgiVzclWEg43f8NOwYEX2CNFWH5NZbXtqY73IrBU/GKDtZsBKcXyLaXEKcVp+xv
	5pVqNxWwoHBOCM8vhN+8I+i2E0Va+8ABGMefNzFSFsmK+ArYFl84mmK1jE9pOvWY7S36++wjiLQ49
	2zpo2Vz77yjopKfPasMyJIGVnQaCp6aENxbtm+lGwGi9SbMQjQEYu00m327chpacUWZ+kEOEXtNCe
	tDkhpjRt1rH/3CUNWBkbCRZ3JQWPc08DTc4p0WCgWIfEXRR6YGE5RxZYJyWtl1Hz8V0YHyP0Z0nv3
	BJJjCQ5I93hikV/B51EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYHQ6-00000009tEv-3tx9;
	Mon, 29 Jul 2024 03:51:34 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYHPe-00000009t7i-2dJ2;
	Mon, 29 Jul 2024 03:51:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722225066; x=1753761066;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ZpwWrfhr0BCpVCzOb3mGLsmOC01fvDnLhqm5077dkm4=;
  b=ESksQcTPD4/i3RMmdKyHcmay5qlfZtQia5c9pzHv08foF4AnMglEY+Oi
   VvoMjS91LoK93VhD2sQWU9M0avXyV3tGuW7eA/S+mVVno8sS9KLI5jjeV
   wLifg3Kd9URrryG9LfOln2Xq7MxblRCE8y6ShW2UrmrEWIX0TpLWngOmS
   F0D+mjTTdfpX8MIKBqyQzFg1wMoVlxh4VnbV32zBCtMcvot8pgmx3MuO4
   8TCVQIk9SsefX+SCwb/nNtxmBQW6sg4OVTpRF7S2c6pEsyzRbOHrba+dZ
   +ikQuLYm+FuE11G2Ua5zUuw6hJU2xkoDKEGbybAnXclDgw1l8eU364Y7f
   g==;
X-CSE-ConnectionGUID: jrDQnHlyTnavYuhKzsPlKA==
X-CSE-MsgGUID: BWHCR2YVRFexfibCK/3BVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11147"; a="30615180"
X-IronPort-AV: E=Sophos;i="6.09,245,1716274800"; 
   d="scan'208";a="30615180"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2024 20:39:53 -0700
X-CSE-ConnectionGUID: 0zLNhc/mRxOz496DDR05WA==
X-CSE-MsgGUID: ZPSBfYE3S8WC5jwhC9pzLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,245,1716274800"; 
   d="scan'208";a="58418026"
Received: from haibo-optiplex-7090.sh.intel.com ([10.239.153.94])
  by fmviesa004.fm.intel.com with ESMTP; 28 Jul 2024 20:39:47 -0700
From: Haibo Xu <haibo1.xu@intel.com>
To: sunilvl@ventanamicro.com
Cc: xiaobo55x@gmail.com,
	ajones@ventanamicro.com,
	Haibo Xu <haibo1.xu@intel.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Gavin Shan <gshan@redhat.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	James Morse <james.morse@arm.com>,
	Hanjun Guo <guohanjun@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH] ACPI: NUMA: initialize all values of acpi_early_node_map to NUMA_NO_NODE
Date: Mon, 29 Jul 2024 11:59:55 +0800
Message-Id: <20240729035958.1957185-1-haibo1.xu@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240728_205106_735297_7DC65BDA 
X-CRM114-Status: UNSURE (   9.25  )
X-CRM114-Notice: Please train this message.
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

Currently, only acpi_early_node_map[0] was initialized to NUMA_NO_NODE.
To ensure all the values were properly initialized, switch to initialize
all of them to NUMA_NO_NODE.

Suggested-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
---
 arch/arm64/kernel/acpi_numa.c | 2 +-
 arch/riscv/kernel/acpi_numa.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/acpi_numa.c b/arch/arm64/kernel/acpi_numa.c
index 0c036a9a3c33..2465f291c7e1 100644
--- a/arch/arm64/kernel/acpi_numa.c
+++ b/arch/arm64/kernel/acpi_numa.c
@@ -27,7 +27,7 @@
 
 #include <asm/numa.h>
 
-static int acpi_early_node_map[NR_CPUS] __initdata = { NUMA_NO_NODE };
+static int acpi_early_node_map[NR_CPUS] __initdata = { [0 ... NR_CPUS - 1] = NUMA_NO_NODE };
 
 int __init acpi_numa_get_nid(unsigned int cpu)
 {
diff --git a/arch/riscv/kernel/acpi_numa.c b/arch/riscv/kernel/acpi_numa.c
index 0231482d6946..ff95aeebee3e 100644
--- a/arch/riscv/kernel/acpi_numa.c
+++ b/arch/riscv/kernel/acpi_numa.c
@@ -28,7 +28,7 @@
 
 #include <asm/numa.h>
 
-static int acpi_early_node_map[NR_CPUS] __initdata = { NUMA_NO_NODE };
+static int acpi_early_node_map[NR_CPUS] __initdata = { [0 ... NR_CPUS - 1] = NUMA_NO_NODE };
 
 int __init acpi_numa_get_nid(unsigned int cpu)
 {
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
