Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2605C27C75
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jun 2024 06:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=s/bPpdKG61tpVZsN60LQ4klUjrnrPVeVOC2O7vdJmZw=; b=rLPVMaF33pM0b3
	FHTBR9l2i/s92+P3biFFZl/jqsETXW61kp08DKeBKrifeAXWCZSey4aBEWBcxYu6OgYTBal50ApAH
	ThMaVVVU5JxfUjTHBzTjQvsMuu5h0xufZMpssdIgoaw639zBfX+SXf5piaXXgFItBVnD9VqcWUuJh
	LLTOeolcWOxKTNAyCQm+7vNj1BcT9nIlV6YP+aKGumHbxmacGahpHshgOTLLJrtLalg4/QNCyhON/
	VeKnmQG/TqwzjEBxlyIa9ADUb24XcspqAxl26NapBRMtkHtPQxoikJ//DR1MO4k+HWwG02icEC5Nd
	cgvXmdbeWjWDbcpi0I0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHe4p-0000000FKwi-2VQa;
	Thu, 13 Jun 2024 06:36:51 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHe4m-0000000FKvL-2ucb
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jun 2024 06:36:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718260609; x=1749796609;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=eDdu2f2vHJxLbLwxDJ+vmJ3c8IHG3EBc5uQ2lTCDa7s=;
  b=O2sEawNZRbxh0dIRyV96GyWSjBZ/Y6GWHM36/utFu71PoxaYV4I+V/y1
   HcGDXW9SETQ4m1ARdSi7d3jvJbZmL2Tz6aG4icHohL0EPB+9X9fv0To3X
   fYCjj12rSP8q+YzhkOolacqNdX+sefEcCdVz5FVqWwtkoX9bT4lcWaLbb
   ZrbkMGof5+aGkyY3nqYf6p/ji7im5Jh6X3V/IdrEwcFA/21liS2PkeMcR
   8nAqKfHD7ntfuS6Z8ONsL4JP9YN0E1C/MJuoYEXy3gBJ37OnEBNzscmGr
   0BeOovsk0JY9Eu4rUwiTfl6/kIJu/0BJ1Ks/W3K1myl1EDAdLLhjfsKbW
   Q==;
X-CSE-ConnectionGUID: aX9SUvQzQke7JYyaW9nhhQ==
X-CSE-MsgGUID: k/jDsEKsRN+UcBjk1tULKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="14780590"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="14780590"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 23:36:46 -0700
X-CSE-ConnectionGUID: J12hYHyfTnGD4ai7Jeh/5A==
X-CSE-MsgGUID: 9MGimWN5SvWDIfmjW64BAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="44939106"
Received: from unknown (HELO haibo-OptiPlex-7090.sh.intel.com) ([10.239.159.132])
  by orviesa003.jf.intel.com with ESMTP; 12 Jun 2024 23:36:43 -0700
From: Haibo Xu <haibo1.xu@intel.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-efi@vger.kernel.org
Subject: [PATCH v3] riscv: dmi: Add SMBIOS/DMI support
Date: Thu, 13 Jun 2024 14:55:07 +0800
Message-Id: <20240613065507.287577-1-haibo1.xu@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_233648_765421_DF8F6F70 
X-CRM114-Status: GOOD (  17.08  )
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
Cc: aou@eecs.berkeley.edu, Haibo Xu <haibo1.xu@intel.com>, Atish Patra <atishp@rivosinc.com>, palmer@dabbelt.com, paul.walmsley@sifive.com, xiaobo55x@gmail.com, ardb@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Enable the dmi driver for riscv which would allow access the
SMBIOS info through some userspace file(/sys/firmware/dmi/*).

The change was based on that of arm64 and has been verified
by dmidecode tool.

Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
---
 Changes since v2
   - Rebase to Linux 6.10-rc3
   - Add Reviewed-by tag
---
 arch/riscv/Kconfig                   | 11 +++++++++++
 arch/riscv/include/asm/dmi.h         | 24 ++++++++++++++++++++++++
 drivers/firmware/efi/riscv-runtime.c | 13 +++++++++++++
 3 files changed, 48 insertions(+)
 create mode 100644 arch/riscv/include/asm/dmi.h

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 0525ee2d63c7..b1fc6db48e7a 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -967,6 +967,17 @@ config EFI
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
index 01f0f90ea418..fa71cd898120 100644
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
