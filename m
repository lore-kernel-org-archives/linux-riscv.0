Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82F42C54E68
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Mar 2024 01:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bvUAe2QSDDkbl1JRpCC8Om65JeEdzVhqBMfoGZvtAuY=; b=Q80NFan9j6g1Xm
	wz6REHdrk0IilhF36rFpwlvGaetYDFn/DjqqVmYoRTYO6Pyk7PcSStE5SWe0zr4wIM2pqoG958Db9
	/eoFK5BHWVLG/L7+f9LFshetS1sdEkQC7YSnFV2TKEow7gWYK4cSOA91rYJ6UL9oQXfTDGgorc8bq
	5kld8MdlFQHi1DWKQMR/5YP2V5H8V0V/uZRxuRpQy7M4d8m+PWqHlh9XIZqHst7bcFnHHu1z4IbxC
	kPk5RDj1U726Q4QNewTtTyfEojV0g+7c8sxGtns728ihlhtdFKgBU0uBT7zYy933IkrPDRnnqnVp7
	LVCP9D+ihOtisBCcU4Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rm2Dz-00000006ycO-3wq3;
	Mon, 18 Mar 2024 01:55:39 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rm2Dw-00000006yax-2n9Y
	for linux-riscv@lists.infradead.org;
	Mon, 18 Mar 2024 01:55:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710726937; x=1742262937;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=iUMk+G89JkHrqV4fUL3Gt28oxAeNaZnrFGaHr6SxGkU=;
  b=kqJbCC7Vooj9ivIzDnqrHUoJpdM8o7JLG7mnQ7bDD6FyGoNdNrl0k5KS
   7QVOD1bsHSlBs/RiJ3SoWQLFl6Bsbw38M7njs4WxepME6s/WWhGq3stQq
   WRFY3jGghiZzwVFM+bnOmya9U3q6Clf/C+LdsYm3RmK+oehQo73Zk7K3L
   O7wEfGAz7ZAVizUF/80BD7vTOuKxe0eWuPxIuLUxD3vj7T/eQ8fU2YLTa
   bcwp/S/b6Fb/UbmHnvSbJjzkLC76iSa4UXDaeZvYKcwbrIJI/1uNfR18l
   QLx7tHJvlheH9vebIDLybmHQnK/+DsOl2LiHVVjOZdX6CmXG1uAbh4upm
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="16668195"
X-IronPort-AV: E=Sophos;i="6.07,133,1708416000"; 
   d="scan'208";a="16668195"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2024 18:55:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,133,1708416000"; 
   d="scan'208";a="44248090"
Received: from haibo-optiplex-7090.sh.intel.com ([10.239.159.132])
  by orviesa002.jf.intel.com with ESMTP; 17 Mar 2024 18:55:29 -0700
From: Haibo Xu <haibo1.xu@intel.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-efi@vger.kernel.org
Subject: [PATCH v2] riscv: dmi: Add SMBIOS/DMI support
Date: Mon, 18 Mar 2024 10:09:16 +0800
Message-Id: <20240318020916.1299190-1-haibo1.xu@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240317_185536_813812_DC892CAF 
X-CRM114-Status: GOOD (  17.45  )
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
Cc: aou@eecs.berkeley.edu, Haibo Xu <haibo1.xu@intel.com>, palmer@dabbelt.com, paul.walmsley@sifive.com, xiaobo55x@gmail.com, ardb@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Enable the dmi driver for riscv which would allow access the
SMBIOS info through some userspace file(/sys/firmware/dmi/*).

The change was based on that of arm64 and has been verified
by dmidecode tool.

Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
---
Changes since v1
  - Change to use memremap/memunmap for dmi_(early)_remap/unmap
    definition(suggested by Ard)
  - Minor clean up for comments (Ard)
---
 arch/riscv/Kconfig                   | 11 +++++++++++
 arch/riscv/include/asm/dmi.h         | 24 ++++++++++++++++++++++++
 drivers/firmware/efi/riscv-runtime.c | 13 +++++++++++++
 3 files changed, 48 insertions(+)
 create mode 100644 arch/riscv/include/asm/dmi.h

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 8ebafe337eac..3639151cb4ef 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -952,6 +952,17 @@ config EFI
 	  allow the kernel to be booted as an EFI application. This
 	  is only useful on systems that have UEFI firmware.
 
+config DMI
+	bool "Enable support for SMBIOS (DMI) tables"
+	depends on EFI
+	default y
+	help
+	  This enables SMBIOS/DMI feature for systems.
+
+	  This option is only useful on systems that have UEFI firmware.
+	  However, even with this option, the resultant kernel should
+	  continue to boot on existing non-UEFI platforms.
+
 config CC_HAVE_STACKPROTECTOR_TLS
 	def_bool $(cc-option,-mstack-protector-guard=tls -mstack-protector-guard-reg=tp -mstack-protector-guard-offset=0)
 
diff --git a/arch/riscv/include/asm/dmi.h b/arch/riscv/include/asm/dmi.h
new file mode 100644
index 000000000000..ca7cce557ef7
--- /dev/null
+++ b/arch/riscv/include/asm/dmi.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2024 Intel Corporation
+ *
+ * based on arch/arm64/include/asm/dmi.h
+ *
+ * This file is subject to the terms and conditions of the GNU General Public
+ * License.  See the file "COPYING" in the main directory of this archive
+ * for more details.
+ */
+
+#ifndef __ASM_DMI_H
+#define __ASM_DMI_H
+
+#include <linux/io.h>
+#include <linux/slab.h>
+
+#define dmi_early_remap(x, l)		memremap(x, l, MEMREMAP_WB)
+#define dmi_early_unmap(x, l)		memunmap(x)
+#define dmi_remap(x, l)			memremap(x, l, MEMREMAP_WB)
+#define dmi_unmap(x)			memunmap(x)
+#define dmi_alloc(l)			kzalloc(l, GFP_KERNEL)
+
+#endif
diff --git a/drivers/firmware/efi/riscv-runtime.c b/drivers/firmware/efi/riscv-runtime.c
index 09525fb5c240..c3bfb9e77e02 100644
--- a/drivers/firmware/efi/riscv-runtime.c
+++ b/drivers/firmware/efi/riscv-runtime.c
@@ -152,3 +152,16 @@ void arch_efi_call_virt_teardown(void)
 {
 	efi_virtmap_unload();
 }
+
+static int __init riscv_dmi_init(void)
+{
+	/*
+	 * On riscv, DMI depends on UEFI, and dmi_setup() needs to
+	 * be called early because dmi_id_init(), which is an arch_initcall
+	 * itself, depends on dmi_scan_machine() having been called already.
+	 */
+	dmi_setup();
+
+	return 0;
+}
+core_initcall(riscv_dmi_init);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
