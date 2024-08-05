Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73D31C3DA64
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Aug 2024 03:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iWT19EIo21soP2zKF2YSutDvWsclQRXwBpz2dkO1Ozc=; b=ckNqC0hrOtcBt1
	4cjMy3DDdHJIQ/RKdCGny+xSud5GceEJvpMBte6uhjUv5wyT+He7skmDJsu9NVPQttY5j43fFLqGO
	cL5NMN/aF0Mwzcl7adMvuulhBuSXr1ND7ss0DID+0K3Ty7TqbxKV37gUYj3BBCsVjQtPmya1Z0hk9
	QFPseqtirYbxPwcdYCMFlzaNtizQk3JJoHQU2V6SIkU8BBcXHtgfhibhz+7Avo9D1aOXIBKlPEDp6
	iSFoBj30NF32GWCHWVebH/oxszVxgFLxsRmyXv52RS5fmwL11bS+WUsifreD28WTrXFXnX9SCKwXk
	xCeM3Y2gS5HuGPiHflYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sao8H-0000000ETCL-3ev8;
	Mon, 05 Aug 2024 03:11:37 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sao7J-0000000ET0h-3Nma;
	Mon, 05 Aug 2024 03:10:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722827438; x=1754363438;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qIx1iuVHdoJtgpswxLF4/++ux2wkjECjyNV1k7XLWV8=;
  b=EUON4bCrR3SzMFY8tErpGdqRi9pbEGd4w9q3DM/WsQ+zkMkt9NjDOsTx
   orNnGkqFIb9RODOzhADWO+oUYW7k6n57poIhV03XQsZYoKBZl8yV6Q2LJ
   hORel3WCEiEqlldwGbDCCWI/euDyRYjoG6h6/EFnurEI9WzxXnLVb0MVu
   7D8b86fTjlh48GJtglnTlThAz1uzMVj+a+j656Y1Vbx2YD9+QKgLEj9n5
   vkp1M3Kz/zXEj9aXKH5Ux7kW5yJ/lL/0poXzsW1t/UXDjOWrmuvNHDg96
   pLqpRpL9KzpbRrlldHm5Os6tZkBiaOlihqS2XgfkZQgXiHqGm2bXUbsJ9
   Q==;
X-CSE-ConnectionGUID: zXLdTB7jRz2s0gmsA7tQwA==
X-CSE-MsgGUID: U8Vpt7JkSIOgG2l79phRrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11154"; a="20650848"
X-IronPort-AV: E=Sophos;i="6.09,263,1716274800"; 
   d="scan'208";a="20650848"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2024 20:10:37 -0700
X-CSE-ConnectionGUID: 6qWHaDcHTeOGQGgVMqLL2g==
X-CSE-MsgGUID: vY3YV1i0Q5u5gHgs3If29A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,263,1716274800"; 
   d="scan'208";a="86587491"
Received: from haibo-optiplex-7090.sh.intel.com ([10.239.153.94])
  by orviesa002.jf.intel.com with ESMTP; 04 Aug 2024 20:10:33 -0700
From: Haibo Xu <haibo1.xu@intel.com>
To: ajones@ventanamicro.com,
	sunilvl@ventanamicro.com
Cc: xiaobo55x@gmail.com,
	Haibo Xu <haibo1.xu@intel.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Hanjun Guo <guohanjun@huawei.com>,
	James Morse <james.morse@arm.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 2/2] arm64: ACPI: NUMA: initialize all values of acpi_early_node_map to NUMA_NO_NODE
Date: Mon,  5 Aug 2024 11:30:24 +0800
Message-Id: <853d7f74aa243f6f5999e203246f0d1ae92d2b61.1722828421.git.haibo1.xu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <0d362a8ae50558b95685da4c821b2ae9e8cf78be.1722828421.git.haibo1.xu@intel.com>
References: <0d362a8ae50558b95685da4c821b2ae9e8cf78be.1722828421.git.haibo1.xu@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240804_201037_877686_CD1BA835 
X-CRM114-Status: UNSURE (   9.96  )
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

Fixes: e18962491696 ("arm64: numa: rework ACPI NUMA initialization")
Reported-by: Andrew Jones <ajones@ventanamicro.com>
Suggested-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
Reviewed-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/arm64/kernel/acpi_numa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
