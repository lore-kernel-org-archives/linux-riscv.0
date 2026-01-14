Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9090D29FF9
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jan 2026 12:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZvWRHUR7OI7pbNdxvpsHn+YF74UK5/XkbpQlFnNQ8cw=; b=BxBUfasSCMFoPS
	vprg6frxRX1l7ZUJcp2b2AIFaYDWeT2O0yIvRVZeaYcJI+Ik/XV0lh10Af64GcOZMJEUsAAOweKxe
	hhCp8yBXZw+7nGBnExvQt4MGv3A45QZXKtMXZIlJ1vM+QKKMFyJDZZ49WNiur8fKIbbmShRJB17EX
	HprGRTL7GJND2YKBXeS7T57a8SNKVDqNSFi4K8gblDlPHhmwXV3wezSK5ujl4Gteo+SuQkSoxyEf5
	1jTbtnFAD0rhVooVCxABX99uxTGrZeKp7Ld4sFvWWPq+6/qPu840hOqrvsIEnHIeucVpJ/MzyuGlj
	vpAV21GIFegsorIcaeIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg04G-00000009Bgn-3KLp;
	Wed, 14 Jan 2026 12:33:44 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg04D-00000009Bfb-2CuM
	for linux-riscv@lists.infradead.org;
	Wed, 14 Jan 2026 12:33:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=mQ
	FTKbJmOROnetJPdTEjD7x5P28wiTI7ho78GWvBYd0=; b=jxu6ALuxnRDLPlc6Aq
	QVckfXUk2tQl/7Rw5yLgsXkBuLv7qSVz7pwR+vNdXCp6sCwu2hnLN0ygwU8Y+w3I
	ANL6gSa8ZgRSW/gnrtEJ0+ZHG/kNXOX2bNezwwvuitLKWO31tinuVYXR+rFqfjTL
	eeJxyOLxXEt1AQ0XPs3Q/Z0NA=
Received: from emily-VMware-Virtual-Platform.. (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wAnEXLIjGdp_IcxGQ--.5443S2;
	Wed, 14 Jan 2026 20:32:10 +0800 (CST)
From: huyuye <huyuye812@163.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>
Subject: [PATCH v3] ACPI: pci_root: Clear the acpi dependencies after PCI root bridge initialization on RISC-V
Date: Wed, 14 Jan 2026 20:32:05 +0800
Message-ID: <20260114123205.4019-1-huyuye812@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260112141630.2869-1-huyuye812@163.com>
References: <20260112141630.2869-1-huyuye812@163.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wAnEXLIjGdp_IcxGQ--.5443S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxurykKr1xGF1kKFy3tF1DJrb_yoWrGw1fpF
	Wj9w1fCrWkJw47Kr1DZw1UXFy5JanY9342grZru34q9a1kuryYvF92yFyUAa4UuFWDGa1x
	ZF9rtF1rCF1jvaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRrb1bUUUUU=
X-Originating-IP: [111.30.198.3]
X-CM-SenderInfo: 5kx135bhyrjqqrwthudrp/xtbC5AqJkWlnjMrhdAAA3r
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_043341_993836_8A700432 
X-CRM114-Status: GOOD (  14.42  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-pci@vger.kernel.org, acpica-devel@lists.linux.dev, Robert Moore <robert.moore@intel.com>, linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, huyuye <huyuye812@163.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, linux-riscv@lists.infradead.org, hu.yuye@zte.com.cn, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On RISC-V platforms with multiple PCI root bridges, the enumeration
order varies randomly across reboots due to APLIC driver initialization
occurring after ACPI device scanning. This defers PCI probing to a
unbound workqueue, resulting in non-deterministic device discovery
sequences.

Such random enumeration leads to changes in device naming across each
boot, which disrupts storage configurations, network settings, and
severely impacts the stability of server maintenance.

By adding the acpi_dev_clear_dependencies() call in acpi_pci_root_add(),
this patch enables the firmware to actively control the enumeration order
of multiple PCI root bridges through the ACPI _DEP method, providing the
firmware with the opportunity to initialize devices in the intended order,
thereby ensuring consistent enumeration results across multiple boots.

Signed-off-by: huyuye <huyuye812@163.com>
---
v2 -> v3:
- Added back the missing commit description from v1
- Moved v2 changelog to correct location after "---"

v1 -> v2:
- Removed the redundant #ifdef CONFIG_ACPI and if (!acpi_disabled) guard
- Moved acpi_dev_clear_dependencies to RISC-V specific architecture code 

 drivers/acpi/pci_root.c       |  6 ++++++
 drivers/acpi/riscv/Makefile   |  2 +-
 drivers/acpi/riscv/acpi_pci.c | 11 +++++++++++
 include/acpi/acpi_bus.h       |  1 +
 4 files changed, 19 insertions(+), 1 deletion(-)
 create mode 100644 drivers/acpi/riscv/acpi_pci.c

diff --git a/drivers/acpi/pci_root.c b/drivers/acpi/pci_root.c
index 9d7f85dadc48..a16eb9097cdc 100644
--- a/drivers/acpi/pci_root.c
+++ b/drivers/acpi/pci_root.c
@@ -30,6 +30,11 @@ static int acpi_pci_root_add(struct acpi_device *device,
 			     const struct acpi_device_id *not_used);
 static void acpi_pci_root_remove(struct acpi_device *device);
 
+
+void __weak arch_acpi_pci_root_add_clear_dep(struct acpi_device *device)
+{
+}
+
 static int acpi_pci_root_scan_dependent(struct acpi_device *adev)
 {
 	acpiphp_check_host_bridge(adev);
@@ -760,6 +765,7 @@ static int acpi_pci_root_add(struct acpi_device *device,
 	pci_lock_rescan_remove();
 	pci_bus_add_devices(root->bus);
 	pci_unlock_rescan_remove();
+	arch_acpi_pci_root_add_clear_dep(device);
 	return 1;
 
 remove_dmar:
diff --git a/drivers/acpi/riscv/Makefile b/drivers/acpi/riscv/Makefile
index 1284a076fa88..5b1bd0298fb9 100644
--- a/drivers/acpi/riscv/Makefile
+++ b/drivers/acpi/riscv/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
-obj-y					+= rhct.o init.o irq.o
+obj-y					+= rhct.o init.o irq.o acpi_pci.o
 obj-$(CONFIG_ACPI_PROCESSOR_IDLE)	+= cpuidle.o
 obj-$(CONFIG_ACPI_CPPC_LIB)		+= cppc.o
 obj-$(CONFIG_ACPI_RIMT)			+= rimt.o
diff --git a/drivers/acpi/riscv/acpi_pci.c b/drivers/acpi/riscv/acpi_pci.c
new file mode 100644
index 000000000000..368ff113e5c6
--- /dev/null
+++ b/drivers/acpi/riscv/acpi_pci.c
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026, ZTE Corporation
+ *  Author: Yu Ye Hu <hu.yuye@zte.com.cn>
+ */
+#include <linux/acpi.h>
+
+void arch_acpi_pci_root_add_clear_dep(struct acpi_device *device)
+{
+	acpi_dev_clear_dependencies(device);
+}
diff --git a/include/acpi/acpi_bus.h b/include/acpi/acpi_bus.h
index aad1a95e6863..c00b523a6ebd 100644
--- a/include/acpi/acpi_bus.h
+++ b/include/acpi/acpi_bus.h
@@ -996,6 +996,7 @@ int acpi_wait_for_acpi_ipmi(void);
 
 int acpi_scan_add_dep(acpi_handle handle, struct acpi_handle_list *dep_devices);
 u32 arch_acpi_add_auto_dep(acpi_handle handle);
+void arch_acpi_pci_root_add_clear_dep(struct acpi_device *device);
 #else	/* CONFIG_ACPI */
 
 static inline int register_acpi_bus_type(void *bus) { return 0; }
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
