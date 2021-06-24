Return-Path: <SRS0=igOf=LS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB0B8C49EA6
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Jun 2021 15:02:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A70356054E
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Jun 2021 15:02:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A70356054E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jGcWWA9MqzSZZwegZe/hpI0L0feh/mhIVQQXm0YSST0=; b=MATEDoGiKR1M54
	9JVM6bpAsW8xjpMBOhwtFPOV7BQn+TpOMYkqihcbp7BcK+kQBPXxOmgoUhCNRmE9rXp3Hczj4l1oj
	ulIIG2GLkKrRsQ3mE+xdXf9Qun/YAIK0PExSLAj8GKWB5UamaGx25KnX0eUMAFXTYTbx5p1Q2ZeDD
	hsRlNPW6941/OLSvRhIlFCLD+J5Pui3kXRBrDVdJBpN2qFvcb8O80X4lgikc0HK+IH28dUE2AhWjd
	UfZy2bd9um+MyajeCLt7xggMxF4yvss/WO5euk0BJs4wUZr4iRQYjjXpJvPBo+Tou8ythCBfCbqV0
	8ly5mtpwCHCG5FrLJUdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwQrt-00FABw-2I; Thu, 24 Jun 2021 15:02:13 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwQrl-00FA5p-Jm
 for linux-riscv@lists.infradead.org; Thu, 24 Jun 2021 15:02:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1624546926; x=1656082926;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+hysN7uppNBxXU4G8gz4qACDyd+5MZH9w/le/rKF1kk=;
 b=k7WOOa5Wl9AXtrPoQZariW7v/9hmOWqBpop/ZZnL9F4UifKlyeEddyMq
 qLGQUOkpFcOBSY2W2x73edbUgRRplPraZIbfFwZWkBNQVlRhoKBmiXmSR
 pgS2A11YwCoGQWAWpR3qwHZYh6EFVy3nl8/mlva9yAUeQX0NuwN8cgKdI
 1W960tXherYuC7kHMfXQEZMUSskrKVdZr/415w474YFzeYSD6mHuUFyvT
 Z7qIUBqd2iiy3oALmzcv3U3xF/W5TalL7dSWwViA0DMDyMZKyci1C8UlY
 uYQdEaavD2/+NjUQ1sVe8UZ8pJsYgD/k3x0C54d39rK15yyciQTGLhcYA w==;
IronPort-SDR: 3BF/SN3lAw5xFX05E8DTgYrKS9pQFhVk1GYPsBSWQ+NwVrMJb5H2pxgn87I8HcSGsYVwO1JUP3
 sUpK9I95P++rYRBORHUl06W93Olqze4YGdHRnysVIEy1bki+Is4/CSIeonetl8gXR9WS+Lx83p
 0x68mIHJzCg7SE8ttEwGZQnNHcUUstnffWblGnLvzdx2LR9p5Uf0Ht21WgGZwtjAB+n+ARF+l1
 Rqg/w1RF/Z7Q1Rlw2lyK1muTZKMF+XUHzu8sGsoOcpKTF4rKYWhIsrvUDmSIZ2mzLe+PuBvNFd
 bUs=
X-IronPort-AV: E=Sophos;i="5.83,296,1616482800"; d="scan'208";a="125939057"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 24 Jun 2021 08:01:48 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 24 Jun 2021 08:01:47 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Thu, 24 Jun 2021 08:01:44 -0700
From: <conor.dooley@microchip.com>
To: <robh+dt@kernel.org>, <damien.lemoal@wdc.com>, <jassisinghbrar@gmail.com>, 
 <aou@eecs.berkeley.edu>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, 
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <j.neuschaefer@gmx.net>, <sfr@canb.auug.org.au>
CC: <lewis.hanly@microchip.com>, <cyril.jean@microchip.com>,
 <daire.mcnamara@microchip.com>, <atish.patra@wdc.com>, <anup.patel@wdc.com>,
 <david.abdurachmanov@gmail.com>, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v9 4/5] soc: add polarfire soc system controller
Date: Thu, 24 Jun 2021 16:01:44 +0100
Message-ID: <20210624150144.11590-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210624_080205_735119_3937634F 
X-CRM114-Status: GOOD (  20.14  )
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

From: Conor Dooley <conor.dooley@microchip.com>

This driver provides an interface for other drivers to access the
functions of the system controller on the Microchip PolarFire SoC.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/soc/Kconfig                         |   1 +
 drivers/soc/Makefile                        |   1 +
 drivers/soc/microchip/Kconfig               |  10 ++
 drivers/soc/microchip/Makefile              |   1 +
 drivers/soc/microchip/mpfs-sys-controller.c | 121 ++++++++++++++++++++
 5 files changed, 134 insertions(+)
 create mode 100644 drivers/soc/microchip/Kconfig
 create mode 100644 drivers/soc/microchip/Makefile
 create mode 100644 drivers/soc/microchip/mpfs-sys-controller.c

diff --git a/drivers/soc/Kconfig b/drivers/soc/Kconfig
index e8a30c4c5aec..b33142e020e0 100644
--- a/drivers/soc/Kconfig
+++ b/drivers/soc/Kconfig
@@ -12,6 +12,7 @@ source "drivers/soc/imx/Kconfig"
 source "drivers/soc/ixp4xx/Kconfig"
 source "drivers/soc/litex/Kconfig"
 source "drivers/soc/mediatek/Kconfig"
+source "drivers/soc/microchip/Kconfig"
 source "drivers/soc/qcom/Kconfig"
 source "drivers/soc/renesas/Kconfig"
 source "drivers/soc/rockchip/Kconfig"
diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
index f678e4d9e585..10cfdcd972c7 100644
--- a/drivers/soc/Makefile
+++ b/drivers/soc/Makefile
@@ -17,6 +17,7 @@ obj-$(CONFIG_ARCH_IXP4XX)	+= ixp4xx/
 obj-$(CONFIG_SOC_XWAY)		+= lantiq/
 obj-$(CONFIG_LITEX_SOC_CONTROLLER) += litex/
 obj-y				+= mediatek/
+obj-y				+= microchip/
 obj-y				+= amlogic/
 obj-y				+= qcom/
 obj-y				+= renesas/
diff --git a/drivers/soc/microchip/Kconfig b/drivers/soc/microchip/Kconfig
new file mode 100644
index 000000000000..eb656b33156b
--- /dev/null
+++ b/drivers/soc/microchip/Kconfig
@@ -0,0 +1,10 @@
+config POLARFIRE_SOC_SYS_CTRL
+	tristate "POLARFIRE_SOC_SYS_CTRL"
+	depends on POLARFIRE_SOC_MAILBOX
+	help
+	  This driver adds support for the PolarFire SoC (MPFS) system controller.
+
+	  To compile this driver as a module, choose M here. the
+	  module will be called mpfs_system_controller.
+
+	  If unsure, say N.
diff --git a/drivers/soc/microchip/Makefile b/drivers/soc/microchip/Makefile
new file mode 100644
index 000000000000..14489919fe4b
--- /dev/null
+++ b/drivers/soc/microchip/Makefile
@@ -0,0 +1 @@
+obj-$(CONFIG_POLARFIRE_SOC_SYS_CTRL)	+= mpfs-sys-controller.o
diff --git a/drivers/soc/microchip/mpfs-sys-controller.c b/drivers/soc/microchip/mpfs-sys-controller.c
new file mode 100644
index 000000000000..b5c23cb5df2c
--- /dev/null
+++ b/drivers/soc/microchip/mpfs-sys-controller.c
@@ -0,0 +1,121 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Microchip PolarFire SoC (MPFS) system controller driver
+ *
+ * Copyright (c) 2020 Microchip Corporation. All rights reserved.
+ *
+ * Author: Conor Dooley <conor.dooley@microchip.com>
+ *
+ */
+
+#include <linux/slab.h>
+#include <linux/module.h>
+#include <linux/interrupt.h>
+#include <linux/of_platform.h>
+#include <linux/mailbox_client.h>
+#include <linux/platform_device.h>
+#include <soc/microchip/mpfs.h>
+
+static DEFINE_MUTEX(transaction_lock);
+
+struct mpfs_sys_controller {
+	struct mbox_client client;
+	struct mbox_chan *chan;
+	struct completion c;
+	u32 enabled;
+};
+
+int mpfs_blocking_transaction(struct mpfs_sys_controller *mpfs_client, void *msg)
+{
+	int ret;
+
+	ret = mutex_lock_interruptible(&transaction_lock);
+	if (ret)
+		return ret;
+
+	reinit_completion(&mpfs_client->c);
+
+	ret = mbox_send_message(mpfs_client->chan, msg);
+	if (ret >= 0) {
+		if (wait_for_completion_timeout(&mpfs_client->c, HZ)) {
+			ret = 0;
+		} else {
+			ret = -ETIMEDOUT;
+			dev_warn(mpfs_client->client.dev, "MPFS sys controller transaction timeout\n");
+		}
+	} else {
+		dev_err(mpfs_client->client.dev,
+			"mpfs sys controller transaction returned %d\n", ret);
+	}
+
+	mutex_unlock(&transaction_lock);
+
+	return ret;
+}
+EXPORT_SYMBOL(mpfs_blocking_transaction);
+
+static void rx_callback(struct mbox_client *client, void *msg)
+{
+	struct mpfs_sys_controller *mpfs_client =
+		container_of(client, struct mpfs_sys_controller, client);
+
+	complete(&mpfs_client->c);
+}
+
+static int mpfs_sys_controller_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct mpfs_sys_controller *mpfs_client;
+
+	mpfs_client = devm_kzalloc(dev, sizeof(*mpfs_client), GFP_KERNEL);
+	if (!mpfs_client)
+		return -ENOMEM;
+
+	mpfs_client->client.dev = dev;
+	mpfs_client->client.rx_callback = rx_callback;
+	mpfs_client->client.tx_block = 1U;
+
+	mpfs_client->chan = mbox_request_channel(&mpfs_client->client, 0);
+	if (IS_ERR(mpfs_client->chan))
+		return dev_err_probe(dev, PTR_ERR(mpfs_client->chan),
+				     "Failed to get mbox channel\n");
+
+	init_completion(&mpfs_client->c);
+
+	platform_set_drvdata(pdev, mpfs_client);
+
+	dev_info(&pdev->dev, "Registered MPFS system controller driver\n");
+
+	return 0;
+}
+
+struct mpfs_sys_controller *
+mpfs_sys_controller_get(struct device_node *mss_node)
+{
+	struct platform_device *pdev = of_find_device_by_node(mss_node);
+
+	if (!pdev)
+		return NULL;
+
+	return platform_get_drvdata(pdev);
+}
+EXPORT_SYMBOL(mpfs_sys_controller_get);
+
+static const struct of_device_id mpfs_sys_controller_of_match[] = {
+	{.compatible = "microchip,polarfire-soc-sys-controller", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, mpfs_sys_controller_of_match);
+
+static struct platform_driver mpfs_sys_controller_driver = {
+	.driver = {
+		.name = "mpfs-sys-controller",
+		.of_match_table = mpfs_sys_controller_of_match,
+	},
+	.probe = mpfs_sys_controller_probe,
+};
+module_platform_driver(mpfs_sys_controller_driver);
+
+MODULE_LICENSE("GPL v2");
+MODULE_AUTHOR("Conor Dooley <conor.dooley@microchip.com>");
+MODULE_DESCRIPTION("MPFS system controller driver");
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
