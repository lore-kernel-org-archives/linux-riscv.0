Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2AC6C54E49
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Mar 2024 08:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=duGG3jj3afK4vuastDU2MaEcP8U4CO/c4O8bXoCSO+w=; b=wOPNIR1BKWhlJc
	sSzfzm/vB02UxueqcH4Ttxr2d1o2QNwsUGueMqGZYw2ILZcBQH9L1g8m6+dY7nfWYfLIwuT0YlHdA
	1hRhhtvNNGK/kXQTdNdGQKll/J7nNiVZ83SpYJ+XhZgSzEkTLHRdAJAibdiNg3gP3POYmvQS91OuO
	t0vpKyAAxZmS/Yspi0A0hpA0BBUXZXA1uv4HbhGgBsD+gSw750RslSMW/1gFWhQMW6GqP/94mFyq3
	ulwXn8pFq9D3pkwS7yV0p9BRzFdKBuqBr0Dy50NbP7g8Ss4L9iGoKlJPa2RMm1o7oH1j3amFyGjA4
	bwW4BlSu8Vo7bqXFKAAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ri8x7-00000003aSI-3dbW;
	Thu, 07 Mar 2024 08:18:09 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ri8x5-00000003aRl-0GAf
	for linux-riscv@lists.infradead.org;
	Thu, 07 Mar 2024 08:18:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709799487; x=1741335487;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=0eSjyN2LlC9Wrx63xy7rOACa0dzQKMyCRU8Nm4Mq0Hg=;
  b=FNFXqnbv8bBioXZ5xDG2fF9OAKXnmEEZPbZcCLW/lBzwDui1cCnWgHnf
   pcvJp3PqvItPViXkQ3KOAXnIgv/11Jio2avgPcUGxmcOQxVkQpKCAf8UY
   LD4U/i2M40+c4FEBNqV+IMD6VO9nLOQOvq1Ti24cCQx6kWxwHg+WX3yT0
   Va688wrS/AyVDEDbiRY0CdV2Uy1Na1tmrUq776Mv7MQanyCNvSHN1H7p9
   ZDqzruka8nemdopGFY4po5bbWnSP4XUrkp+q3LbuOfU42XHBtHu11af2Y
   gOFIFnjxT5oRukI/l6pnyk/VsNRMlthploKkSTxhgCMmw4bgeWLLPVgTt
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="4577442"
X-IronPort-AV: E=Sophos;i="6.06,210,1705392000"; 
   d="scan'208";a="4577442"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2024 00:18:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,210,1705392000"; 
   d="scan'208";a="14598959"
Received: from haibo-optiplex-7090.sh.intel.com ([10.239.159.132])
  by fmviesa003.fm.intel.com with ESMTP; 07 Mar 2024 00:18:02 -0800
From: Haibo Xu <haibo1.xu@intel.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-efi@vger.kernel.org
Subject: [PATCH] riscv: dmi: Add SMBIOS/DMI support
Date: Thu,  7 Mar 2024 16:31:54 +0800
Message-Id: <20240307083154.346542-1-haibo1.xu@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_001807_197890_162C7944 
X-CRM114-Status: GOOD (  18.49  )
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
 arch/riscv/Kconfig                   | 11 +++++++++++
 arch/riscv/include/asm/dmi.h         | 29 ++++++++++++++++++++++++++++
 drivers/firmware/efi/riscv-runtime.c | 13 +++++++++++++
 3 files changed, 53 insertions(+)
 create mode 100644 arch/riscv/include/asm/dmi.h

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 0bfcfec67ed5..a123a3e7e5f3 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -918,6 +918,17 @@ config EFI
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
index 000000000000..a861043f02dc
--- /dev/null
+++ b/arch/riscv/include/asm/dmi.h
@@ -0,0 +1,29 @@
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
+/*
+ * According to section 2.3.6 of the UEFI spec, the firmware should not
+ * request a virtual mapping for configuration tables such as SMBIOS.
+ * This means we have to map them before use.
+ */
+#define dmi_early_remap(x, l)		ioremap_prot(x, l, _PAGE_KERNEL)
+#define dmi_early_unmap(x, l)		iounmap(x)
+#define dmi_remap(x, l)			ioremap_prot(x, l, _PAGE_KERNEL)
+#define dmi_unmap(x)			iounmap(x)
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
