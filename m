Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14834C3DA64
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Aug 2024 03:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ef0z5OEAgpQIAqWPTGmCbXcSZA0iOFWfGlUyVMBqWQI=; b=NQayHlWQKKPiEk
	T93usk+WUqu8JXyjTal9syvN9WrrWkOBXq/jAOZ0KqS2e+CLpcsQMG/3Qnp1dOP6xI3dXeqLIVtSy
	nRmXaoJy4/x4WjRsL1MZS5XZ3ELsRWxK8uL1xgT7PrabKMgRyjPxfynWw/zQM3ogCB3MpzD6Hrx4V
	nyyrgdFGmaviiGw3s0OsjCYXsKtINr5hvPCBxc2Kva2iANl29W2X4Hz6Scgm1/hHyNFxgw3y+Vytw
	hsG+rARL65L+FodINPLI0UmKi9HeraM13FzH/Eimmgwzdag6HaeehOFq8hetgYoaMH5TD+SFtlRvl
	NO3Bgfzpd7Amrze881Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sao7q-0000000ET6y-03Im;
	Mon, 05 Aug 2024 03:11:10 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sao7I-0000000ET0L-0qKp;
	Mon, 05 Aug 2024 03:10:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722827436; x=1754363436;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=sjJi4ci8CSMJ3+1aGEpOmPLYmSgD57qXbtIeGqxxXps=;
  b=J4ykFWsl/VLqAaIRIilKcEeguLV/xpEYnNyzw2n2OPLmvZlzQ/Uzg01G
   o3io+Uiivvu/tZQpUnZouVNM5lMEdXWMo6Dszz1ZpUp5sJUqhmagG1Uwl
   +WILuSye8YQ5zHlOlzfE9rB0ABezO7v6RcT1jrtNZsA2nTuyXLAeD9+BK
   saXheQ0wm6wRw+71guLZg3XJJu0NhJMBjTC2zZDBM9/kVjtegaQZm3EQ/
   1sqVROT6/kFObJ88DXJ/UTTvC1a1rYWP5iBrVc2BoIbYWQtmrpzfZd6Wt
   DAexN9Gzkl4ig8leDiMboSmyI7m1n5OaHTyVbWpKSWdkpM0iGwxhT41pf
   w==;
X-CSE-ConnectionGUID: lxxV8INERVO2ueYH0a87dw==
X-CSE-MsgGUID: 3tWy9spVQSSUsOA4W16cAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11154"; a="20650825"
X-IronPort-AV: E=Sophos;i="6.09,263,1716274800"; 
   d="scan'208";a="20650825"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2024 20:10:30 -0700
X-CSE-ConnectionGUID: QjZcPaedR0+3m/2U2W4tEg==
X-CSE-MsgGUID: /nt6f/pBQuum6h4f8E10Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,263,1716274800"; 
   d="scan'208";a="86587459"
Received: from haibo-optiplex-7090.sh.intel.com ([10.239.153.94])
  by orviesa002.jf.intel.com with ESMTP; 04 Aug 2024 20:10:24 -0700
From: Haibo Xu <haibo1.xu@intel.com>
To: ajones@ventanamicro.com,
	sunilvl@ventanamicro.com
Cc: xiaobo55x@gmail.com,
	Haibo Xu <haibo1.xu@intel.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Gavin Shan <gshan@redhat.com>,
	James Morse <james.morse@arm.com>,
	Hanjun Guo <guohanjun@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 1/2] RISC-V: ACPI: NUMA: initialize all values of acpi_early_node_map to NUMA_NO_NODE
Date: Mon,  5 Aug 2024 11:30:23 +0800
Message-Id: <0d362a8ae50558b95685da4c821b2ae9e8cf78be.1722828421.git.haibo1.xu@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240804_201036_277352_BB5073E0 
X-CRM114-Status: UNSURE (   9.71  )
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

Fixes: eabd9db64ea8 ("ACPI: RISCV: Add NUMA support based on SRAT and SLIT")
Reported-by: Andrew Jones <ajones@ventanamicro.com>
Suggested-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
Reviewed-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kernel/acpi_numa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
