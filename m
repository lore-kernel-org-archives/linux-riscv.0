Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C70CAC9EC93
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Jan 2026 14:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FyYOTw2hxS1Sm/eqsb5h9BfoAdxJyD1SF4gsggRnO/o=; b=Sfhc6B7QbtlEqa
	ZShMxwyxxMfqE0iD/fliIRjGvRJqzQOssVwe7+DMRWI0wYGffy+C/tjZ6EWZsw6pSVtp5LmfidYcU
	70ZgXSKmDAoehnsalLYjPuum0h91zb7WBu9O3ya+jj++Sv+t/0fCueKmbjH2QTien+l4HcNSZfNN5
	KsZF+TMGwLqFWG3PonGQ4WdOrvdCX5ebYqvK6t5P84AdKr++7ic3H2AE1qd5EiiFbPpxP3HVR7jXK
	FSMpp7BUju9xLhJlxyyZuGmbEX6jVkDyMWXF4UBbGBzg6OaZEuAmnaVokaR2Bwwk/1dHmW2uFVyeU
	0G2Igv0oXbF1AN70TYCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfIk5-00000005Vrq-1Bei;
	Mon, 12 Jan 2026 14:18:01 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfIk1-00000005VmH-3pnR
	for linux-riscv@lists.infradead.org;
	Mon, 12 Jan 2026 14:18:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=D6
	ibI2l2qeTk6D8zz4v4Fuljr3FpUb+m+bLiWQ2pp4o=; b=EHiK19qo5qPALSScCf
	DTm8yB6e7/6L1nNcj+DXj4Ibynkp4qkGPdNffWEpeCkEy76QForW3up/DfXcMLYi
	QbfdE/Tl6IMsOMzxCl8VFxGo8P2dV62IkR67wgNZrueeVO5R8hjuTxA/7jffoyxa
	CyzeA4re24dq+KbO3LAC73HkY=
Received: from emily-VMware-Virtual-Platform.. (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3X3dKAmVp1HqUGQ--.29256S2;
	Mon, 12 Jan 2026 22:16:45 +0800 (CST)
From: huyuye <huyuye812@163.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>
Subject: [PATCH v2] ACPI: pci_root: Clear the acpi dependencies after PCI root bridge initialization on RISC-V
Date: Mon, 12 Jan 2026 22:16:29 +0800
Message-ID: <20260112141630.2869-1-huyuye812@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251203140716.3065-1-huyuye812@163.com>
References: <20251203140716.3065-1-huyuye812@163.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wD3X3dKAmVp1HqUGQ--.29256S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxZF4DXF13KFykZryDAF47Arb_yoW5Zw4rpF
	Wj9w1fArZ7Jw47KwnrZw15XFy5Jw4F9342grZru34Dua18uryYvF92yFyUta4UuFWDGa1x
	ZF9rtF15CF1jvaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zic18DUUUUU=
X-Originating-IP: [111.30.198.3]
X-CM-SenderInfo: 5kx135bhyrjqqrwthudrp/xtbC4w1HT2llAk3SSwAA38
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_061758_312222_74212D83 
X-CRM114-Status: GOOD (  15.56  )
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
Cc: linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org, hu.yuye@zte.com.cn, guo.chang2@zte.com.cn, deng.weixian@zte.com.cn, acpica-devel@lists.linux.dev, Robert Moore <robert.moore@intel.com>, liu.qingtao2@zte.com.cn, zuo.jiang@zte.com.cn, linux-acpi@vger.kernel.org, li.kunpeng@zte.com.cn, wu.jiabao@zte.com.cn, Len Brown <lenb@kernel.org>, lin.yongchun@zte.com.cn, Albert Ou <aou@eecs.berkeley.edu>, huyuye <huyuye812@163.com>, dai.hualiang@zte.com.cn, Alexandre Ghiti <alex@ghiti.fr>, zhang.longxiang@zte.com.cn, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Rafael,
Thank you for your thorough review and valuable comments on v1.
I've updated the patch as follows:
1. Removed the redundant #ifdef CONFIG_ACPI and if (!acpi_disabled) 
guard as you pointed out. The entire code block indeed already depends
on CONFIG_ACPI at a higher level, making the inner guard unnecessary.
2. Moved acpi_dev_clear_dependencies to RISC-V specific architecture 
code (driver/acpi/riscv/acpi_pci.c). This ensures that ACPI dependency
clearing is handled within the appropriate architectural context.

Best regards
Signed-off-by: huyuye <huyuye812@163.com> 
---
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
