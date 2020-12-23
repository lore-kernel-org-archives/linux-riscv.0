Return-Path: <SRS0=SHZ6=F3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC1E6C433DB
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Dec 2020 16:33:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92C312229C
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Dec 2020 16:33:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 92C312229C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TVCFUAipv4jXRrb5cZAxr9opdrhFrv18qylDf8HvTpo=; b=3AsboW8aM572Sc5oSmB9U/4ySI
	eXYLbdg4O8zcP8Ph5dqiAlXaeQPh+bFEgajy05gfHw4vwwaL5V12EKoVAF1v5CGST7CT1Qe4Dl6hY
	RJrrSf40qVbEotfsabbxREpOkCokf92YjHwVg+W3Hj8eotPgcKUwG6wsAqzMyGgF5uu5DZ02k5p5r
	AZOed2QOBFGyhhZVcEUBxPsxNoMiRCAGmusBBqMms64SbiBfb7HihLk8+11cOswHTeIxpp3ZKBug+
	2zJarQslzxd0fs0s0t4L5khIRgA4Gphp3qUamOgmT+Os/monObcjZHCREV8ps0Ta8TlSBUtjyXaUJ
	qU1Q7oPQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ks74i-0007KS-2F; Wed, 23 Dec 2020 16:33:20 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ks74e-0007JV-EO
 for linux-riscv@lists.infradead.org; Wed, 23 Dec 2020 16:33:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1608741197; x=1640277197;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=aPhRJJpl+JraMj58CcbSvP1w+OJ7MRJUj8wOChAJIAA=;
 b=rnA0BI5XGRgVAZzyYyUvh/t+pAJ25ora+HxXpwL+5LjnD8MiPHVbUDiJ
 MnMAWzly/P2Eb30Sryw2eSztnR0x76N3qbnr7g3mewC9akLwFasZC+3O/
 19VqUfLISAKoCaYjiGtRRlTTn2ghHIrWKuy1F4QZKh05DycvYVXeWYM6z
 0LzOIl4VOoCWkdANl+ZpHwITMSo64AMxFghd3ejKr/hs5UhOiUk05MRn9
 t4SeAM53ZqrQa2Ek8wAuXA3Q+/Y82NUiDkUy+Hd5gkn6B60Z/rck84vbj
 I7z81dqcLK3VLIKlHk4TntntyRYFNuBBjeOiu8yWxuscQocl7D0IK+FfA A==;
IronPort-SDR: qqnan1vkMrwyzNmQZ/kgmxSwjGEO1jH0XJDETCV6lpkrnxFkg/2gnF7lzYcLsKYA+sOl+z5dHH
 Oo1D+UWO8UyM+KSDWQqzbX1w+7Ti5oNouUiqchfCJDMaUkczwcjQowOgJ7w6kIVh1N2wpGeZ+X
 2yEQd9Zoj4xBRa+cbiRQMzk3xunBwzsfJkghUf8ZeP8GfxUifqRehIZYE2ayCJ7PBPXwAz/NoX
 JONtiUp7qVoyTizvJ7Yrqn5aTJcEjosPtZf1V8+lqML4keo6SGElMXtopbGL23MdnzY3j9/+9S
 oZU=
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; d="scan'208";a="103299252"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 23 Dec 2020 09:33:15 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 23 Dec 2020 09:33:13 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.1979.3 via Frontend
 Transport; Wed, 23 Dec 2020 09:33:11 -0700
From: <conor.dooley@microchip.com>
To: <robh+dt@kernel.org>, <damien.lemoal@wdc.com>, <jassisinghbrar@gmail.com>, 
 <aou@eecs.berkeley.edu>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, 
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: [PATCH v3 3/5] soc: add polarfire soc system controller
Date: Wed, 23 Dec 2020 16:33:10 +0000
Message-ID: <20201223163310.29122-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201223_113316_653861_3D56EBE5 
X-CRM114-Status: GOOD (  20.71  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: cyril.jean@microchip.com, david.abdurachmanov@gmail.com,
 daire.mcnamara@microchip.com, anup.patel@wdc.com, j.neuschaefer@gmx.net,
 atish.patra@wdc.com, Conor Dooley <conor.dooley@microchip.com>,
 lewis.hanly@microchip.com
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
 drivers/soc/microchip/mpfs-sys-controller.c | 127 ++++++++++++++++++++
 5 files changed, 140 insertions(+)
 create mode 100644 drivers/soc/microchip/Kconfig
 create mode 100644 drivers/soc/microchip/Makefile
 create mode 100644 drivers/soc/microchip/mpfs-sys-controller.c

diff --git a/drivers/soc/Kconfig b/drivers/soc/Kconfig
index 425ab6f7e375..22cb097bcbdc 100644
--- a/drivers/soc/Kconfig
+++ b/drivers/soc/Kconfig
@@ -9,6 +9,7 @@ source "drivers/soc/bcm/Kconfig"
 source "drivers/soc/fsl/Kconfig"
 source "drivers/soc/imx/Kconfig"
 source "drivers/soc/ixp4xx/Kconfig"
+source "drivers/soc/microchip/Kconfig"
 source "drivers/soc/mediatek/Kconfig"
 source "drivers/soc/qcom/Kconfig"
 source "drivers/soc/renesas/Kconfig"
diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
index 36452bed86ef..fb084cf2d12e 100644
--- a/drivers/soc/Makefile
+++ b/drivers/soc/Makefile
@@ -14,6 +14,7 @@ obj-$(CONFIG_ARCH_GEMINI)	+= gemini/
 obj-y				+= imx/
 obj-$(CONFIG_ARCH_IXP4XX)	+= ixp4xx/
 obj-$(CONFIG_SOC_XWAY)		+= lantiq/
+obj-$(CONFIG_SOC_MICROCHIP_POLARFIRE)	+= microchip/
 obj-y				+= mediatek/
 obj-y				+= amlogic/
 obj-y				+= qcom/
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
index 000000000000..e8b44beb5ac5
--- /dev/null
+++ b/drivers/soc/microchip/mpfs-sys-controller.c
@@ -0,0 +1,127 @@
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
+	void *response;
+	u16 response_size_bytes;
+};
+
+int mpfs_blocking_transaction(struct mpfs_sys_controller *mpfs_client, void *msg,
+			      void *response, u16 response_size_bytes)
+{
+	int ret;
+
+	mpfs_client->response = response;
+	mpfs_client->response_size_bytes = response_size_bytes;
+
+	mutex_lock_interruptible(&transaction_lock);
+
+	reinit_completion(&mpfs_client->c);
+
+	ret = mbox_send_message(mpfs_client->chan, msg);
+	if (ret >= 0) {
+		if (wait_for_completion_timeout(&mpfs_client->c, HZ)) {
+			ret = 0;
+		} else {
+			ret = -ETIMEDOUT;
+			dev_warn(mpfs_client->client.dev, "MPFS sys controller transaction timeout");
+		}
+	} else {
+		dev_err(mpfs_client->client.dev,
+			"mpfs sys controller transaction returned %d\r\n", ret);
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
+	memcpy(mpfs_client->response, (u8 *)msg, mpfs_client->response_size_bytes);
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
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
