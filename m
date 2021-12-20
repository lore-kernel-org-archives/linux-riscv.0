Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4A6DC43219
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Dec 2021 14:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LvBRq5fQHKTRW8kkPHMAMzQ+0nS1lNzO3JybFL3El7w=; b=2cIlvK5sC5nqN2
	PVr3O8tciKU0ivhuBN3Jn6Etxv84LxhlP0iXexwMVXxcSLzaHGGEfMDFYiPF79BmuvM5Smt79+hbj
	pEXF0fDpL5LhT88iwaWbgqhIJv4dH2FIyX/BJsQlG/yrcstFEBd6dGnRrBj8o1CrAx8vYd1TKoz++
	UiJgNqJ4xxC3io1FRAcaD9kL7xo7KZ1wGRFDQmPpk4N/63xyUxsnCVhFDoUgsbAbH1Ycabc7dsVVv
	iNqbEfd/YxgS1P9f7l1CVIfL6ZabBDZADO6nTXvX5jUM2MyL0N0pqR7NTsiTM4x1Zhr0i+AX7qVU8
	n+J3l4BoOoWp4JNF/GCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzJsw-002sST-CY; Mon, 20 Dec 2021 14:43:30 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzJsr-002sP1-E3; Mon, 20 Dec 2021 14:43:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1640011405; x=1671547405;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=w73IfcBHI2FV4/yj8pvcDvBzB/pwQuj46iB9BZRbAfU=;
 b=mZ1gszQsj99R+uxRD0LZ9WBQOAdjNYpbSLxr37XCQJcWQyVlAa7VmOGv
 Z8NEeiKRCiqSqK5al9GoHuat/vSdIHRS6NSlBCpK+5snLCN09WNlHIO0+
 GuyosjRurz0oe0dPWUGRrSNy8xPABl7Thvb+YgjI27TbtpXIZktoQ55Yh
 oc1aEAGMjwBuEPXZktVMU+0uXfq3xXZyoLs11TWryajM6yMO+SMM7gt7J
 5EKUbG7exGnOLIoOyV/G6G5KsvIz3sZxx76PZcP+RcIoO4q2WuX6l+lVz
 UUxR6Eq+Wu1HfpeEoKoqsGf3TmudwUngwH9Oj9XBiQMt+JuTAnolNpSUb Q==;
IronPort-SDR: RRNooySPvRBqeBZlkYAHAcqyzpvTIUoUd+2AycdG/rXaU4laCr2uqKgkZbJz1MIoC+pP2wcwpe
 c6Qic6QtZQZOA6dpMSJZvfMM6Z0C6UA0wJPlM2SQOOzLTiNdN+s2knI/rC3g3AYIJqeGIQmZqa
 YBJyEZLkN6GkV6znjyiXcDQn+SbqKIwWPRQe0IE2df0MxkZ66Z00Dh1U3yeo0TphiMGCrm0BS9
 DGdUBYKelYOEQ1zcV6ZCd/iT/sKahE4dgIVTG7J4MIC8s5pRj9ySb8Q5kRAY6new3IwXlynQTX
 2KqmhGc70mYf8TjZ0gDLpTEW
X-IronPort-AV: E=Sophos;i="5.88,220,1635231600"; d="scan'208";a="156110002"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 20 Dec 2021 07:42:28 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 20 Dec 2021 07:42:27 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Mon, 20 Dec 2021 07:42:24 -0700
From: <conor.dooley@microchip.com>
To: <aou@eecs.berkeley.edu>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, 
 <arnd@arndb.de>, <olof@lixom.net>, <linux-riscv@lists.infradead.org>
CC: <cyril.jean@microchip.com>, <daire.mcnamara@microchip.com>,
 <lewis.hanly@microchip.com>, <jassisinghbrar@gmail.com>,
 <j.neuschaefer@gmx.net>, <sfr@canb.auug.org.au>, <damien.lemoal@wdc.com>,
 <atishp@atishpatra.org>, <nicolas.ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <ludovic.desroches@microchip.com>,
 <claudiu.beznea@microchip.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/1] soc: add polarfire soc system controller
Date: Mon, 20 Dec 2021 14:44:13 +0000
Message-ID: <20211220144413.6798-2-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211220144413.6798-1-conor.dooley@microchip.com>
References: <20211220144413.6798-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211220_064325_554942_AB40D0EA 
X-CRM114-Status: GOOD (  22.31  )
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
 drivers/soc/microchip/mpfs-sys-controller.c | 169 ++++++++++++++++++++
 include/soc/microchip/mpfs.h                |   3 +-
 6 files changed, 184 insertions(+), 1 deletion(-)
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
index a05e9fbcd3e0..e3be151e391e 100644
--- a/drivers/soc/Makefile
+++ b/drivers/soc/Makefile
@@ -17,6 +17,7 @@ obj-y				+= ixp4xx/
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
index 000000000000..af3b05d8b41e
--- /dev/null
+++ b/drivers/soc/microchip/mpfs-sys-controller.c
@@ -0,0 +1,169 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Microchip PolarFire SoC (MPFS) system controller driver
+ *
+ * Copyright (c) 2020-2021 Microchip Corporation. All rights reserved.
+ *
+ * Author: Conor Dooley <conor.dooley@microchip.com>
+ *
+ */
+
+#include <linux/slab.h>
+#include <linux/kref.h>
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
+	struct kref consumers;
+};
+
+int mpfs_blocking_transaction(struct mpfs_sys_controller *sys_controller, void *msg)
+{
+	int ret, err;
+
+	err = mutex_lock_interruptible(&transaction_lock);
+	if (err)
+		return err;
+
+	reinit_completion(&sys_controller->c);
+
+	ret = mbox_send_message(sys_controller->chan, msg);
+	if (ret >= 0) {
+		if (wait_for_completion_timeout(&sys_controller->c, HZ)) {
+			ret = 0;
+		} else {
+			ret = -ETIMEDOUT;
+			dev_warn(sys_controller->client.dev,
+				 "MPFS sys controller transaction timeout\n");
+		}
+	} else {
+		dev_err(sys_controller->client.dev,
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
+	struct mpfs_sys_controller *sys_controller =
+		container_of(client, struct mpfs_sys_controller, client);
+
+	complete(&sys_controller->c);
+}
+
+static void mpfs_sys_controller_delete(struct kref *kref)
+{
+	struct mpfs_sys_controller *sys_controller = container_of(kref, struct mpfs_sys_controller,
+					       consumers);
+
+	mbox_free_channel(sys_controller->chan);
+	kfree(sys_controller);
+}
+
+void mpfs_sys_controller_put(void *data)
+{
+	struct mpfs_sys_controller *sys_controller = data;
+
+	kref_put(&sys_controller->consumers, mpfs_sys_controller_delete);
+}
+EXPORT_SYMBOL_GPL(mpfs_sys_controller_put);
+
+static int mpfs_sys_controller_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct mpfs_sys_controller *sys_controller;
+
+	sys_controller = kzalloc(sizeof(*sys_controller), GFP_KERNEL);
+	if (!sys_controller)
+		return -ENOMEM;
+
+	sys_controller->client.dev = dev;
+	sys_controller->client.rx_callback = rx_callback;
+	sys_controller->client.tx_block = 1U;
+
+	sys_controller->chan = mbox_request_channel(&sys_controller->client, 0);
+	if (IS_ERR(sys_controller->chan))
+		return dev_err_probe(dev, PTR_ERR(sys_controller->chan),
+				     "Failed to get mbox channel\n");
+
+	init_completion(&sys_controller->c);
+	kref_init(&sys_controller->consumers);
+
+	platform_set_drvdata(pdev, sys_controller);
+
+	dev_info(&pdev->dev, "Registered MPFS system controller driver\n");
+
+	return 0;
+}
+
+static int mpfs_sys_controller_remove(struct platform_device *pdev)
+{
+	struct mpfs_sys_controller *sys_controller = platform_get_drvdata(pdev);
+
+	mpfs_sys_controller_put(sys_controller);
+
+	return 0;
+}
+
+struct mpfs_sys_controller *mpfs_sys_controller_get(struct device *dev,
+						    struct device_node *sys_ctrl_node)
+{
+	struct mpfs_sys_controller *sys_controller;
+	struct platform_device *pdev;
+
+	pdev = of_find_device_by_node(sys_ctrl_node);
+	if (!pdev)
+		return NULL;
+
+	sys_controller = platform_get_drvdata(pdev);
+	if (!sys_controller)
+		goto err_put_device;
+
+	if (!kref_get_unless_zero(&sys_controller->consumers))
+		goto err_put_device;
+
+	put_device(&pdev->dev);
+
+	if (devm_add_action_or_reset(dev, mpfs_sys_controller_put, sys_controller))
+		return NULL;
+
+	return sys_controller;
+
+err_put_device:
+	put_device(&pdev->dev);
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(mpfs_sys_controller_get);
+
+static const struct of_device_id mpfs_sys_controller_of_match[] = {
+	{.compatible = "microchip,mpfs-sys-controller", },
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
+	.remove = mpfs_sys_controller_remove,
+};
+module_platform_driver(mpfs_sys_controller_driver);
+
+MODULE_LICENSE("GPL v2");
+MODULE_AUTHOR("Conor Dooley <conor.dooley@microchip.com>");
+MODULE_DESCRIPTION("MPFS system controller driver");
diff --git a/include/soc/microchip/mpfs.h b/include/soc/microchip/mpfs.h
index 2b64c95f3be5..0a594dfa8094 100644
--- a/include/soc/microchip/mpfs.h
+++ b/include/soc/microchip/mpfs.h
@@ -36,7 +36,8 @@ struct mpfs_mss_response {
 
 int mpfs_blocking_transaction(struct mpfs_sys_controller *mpfs_client, void *msg);
 
-struct mpfs_sys_controller *mpfs_sys_controller_get(struct device_node *mailbox_node);
+struct mpfs_sys_controller *mpfs_sys_controller_get(struct device *dev,
+						    struct device_node *sys_ctrl_node);
 
 #endif /* if IS_ENABLED(CONFIG_POLARFIRE_SOC_SYS_CTRL) */
 
-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
