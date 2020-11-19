Return-Path: <SRS0=5I1x=EZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B97BBC56201
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Nov 2020 17:08:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34B6E206F1
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Nov 2020 17:08:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="niK4Jn44";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="RMthc/0i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 34B6E206F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nd+EMguPXljCxgyages9TLkSdesVviXgqSs9tZbZFCc=; b=niK4Jn44wTzgTf8b6BC+Rse1U4
	Bp/a/1ROvKvhpnHgNgTCB7HERpImvYaDstBIxzG4ELm5joFi5o6MwZXkEK0aPqQD0LhguxmzmD8Wh
	+N/s+HR6Kv+8s1qE+DEgyCv9rSKa0+NFCLZp1CdudDfcDH+3lj5pw8sNn8+Hclv8SV3Y6FGUjQj58
	6N0yth6WZu+w2CXBbKORV3wbYe6jKi0Vr94HHyDhHi1Qgg6u83EMAJPNYnkNCnAx108jAHaR1HM7B
	4cvG7YQiFuAlcAag+Uxwn/xizB2WmS9PFzYucuc8KTblQCqFeHD9YjulSxdMTWt0P2xoicv7VAKV7
	mwqy1UzQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfnPh-0000fV-A6; Thu, 19 Nov 2020 17:08:05 +0000
Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfnPe-0000ep-UP
 for linux-riscv@lists.infradead.org; Thu, 19 Nov 2020 17:08:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1605805682; x=1637341682;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=hdKJ8AThaKsHmxLWkwQyL5C107/YEmRfruTeZIwBtm0=;
 b=RMthc/0iGACjD1pc1e292dCJvuJir3iea0UDIKgwmQOmdsgJYYIHY5Fp
 miZT71DsXYSwB0B5dk52MoQZsaM/XdK7Cu4BazRdYaiMz6vvtKKJozQIk
 RxmdH+5N9gw8g3Zn3SDIr+NnShhUeMqJtAvBNJmxybsi6jV+qzP3ylOUM
 J34vJHHFaFsSQorW4/BkEojvTVJ8IT7aJ8C0VLVQZ+foc7y8noVOvQdxx
 3xgwNREOBRb0/GZmfXXg9BpBPBRrL1xT2bbRlM4hYVCt5Av0blvpAyuol
 9JekmMeUO+O/+d2SnHPHPA+V5DEaEBPnQxovKsyjcZSkKgs38EHICb1hp g==;
IronPort-SDR: XkoR9uQfWqHtq/co6wl8d1Nd5BMEelRLCLIgk8OpbtCkZ28m9sdUzNGCzKdgECKA9s7XEa0amI
 0krN0ynUVLs5C5zmXlFhLM7/TYcp/2iMqKrTSW/4A6Ugq09NvvK+nllek1xRl+UZsFmwrYqahh
 zamJd1vjlRZQDAkN/KJQyczFmcM+RKU0qp+uO0BGDG+DB9wfGNCJetva722Y3HPTNLuO9YZbA+
 lqhfYGuNGgHzadLUmXWCVdAOOyiKHEySL6K7xmObmdflEFVGbSGupAJUROIZI4whm/Yi6OlJXJ
 Bq0=
X-IronPort-AV: E=Sophos;i="5.78,353,1599548400"; d="scan'208";a="99699047"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 19 Nov 2020 10:08:01 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 19 Nov 2020 10:08:01 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.1979.3 via Frontend
 Transport; Thu, 19 Nov 2020 10:07:58 -0700
From: <conor.dooley@microchip.com>
To: <robh+dt@kernel.org>, <jassisinghbrar@gmail.com>, <aou@eecs.berkeley.edu>, 
 <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: [PATCH 4/6] soc: add polarfire soc system controller
Date: Thu, 19 Nov 2020 17:07:58 +0000
Message-ID: <20201119170758.20245-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_120803_251493_C2329826 
X-CRM114-Status: GOOD (  20.76  )
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
 daire.mcnamara@microchip.com, anup.patel@wdc.com, atish.patra@wdc.com,
 Conor Dooley <conor.dooley@microchip.com>, lewis.hanly@microchip.com
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
 drivers/soc/microchip/mpfs_sys_controller.c | 136 ++++++++++++++++++++
 5 files changed, 149 insertions(+)
 create mode 100644 drivers/soc/microchip/Kconfig
 create mode 100644 drivers/soc/microchip/Makefile
 create mode 100644 drivers/soc/microchip/mpfs_sys_controller.c

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
index 000000000000..8fdba8b5eae3
--- /dev/null
+++ b/drivers/soc/microchip/Kconfig
@@ -0,0 +1,10 @@
+config MPFS_SYS_CONTROLLER
+	tristate "MPFS_SYS_CONTROLLER"
+	depends on MPFS_MBOX
+	help
+	  This driver adds support for the Polarfire SoC system controller.
+
+	  To compile this driver as a module, choose M here. the
+	  module will be called mpfs_system_controller.
+
+	  If unsure, say Y.
diff --git a/drivers/soc/microchip/Makefile b/drivers/soc/microchip/Makefile
new file mode 100644
index 000000000000..23b1f42a37db
--- /dev/null
+++ b/drivers/soc/microchip/Makefile
@@ -0,0 +1 @@
+obj-$(CONFIG_MPFS_SYS_CONTROLLER)	+= mpfs_sys_controller.o
diff --git a/drivers/soc/microchip/mpfs_sys_controller.c b/drivers/soc/microchip/mpfs_sys_controller.c
new file mode 100644
index 000000000000..0074ae529a2e
--- /dev/null
+++ b/drivers/soc/microchip/mpfs_sys_controller.c
@@ -0,0 +1,136 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Microchip MPFS system controller driver
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
+
+	if (ret >= 0U) {
+		if (wait_for_completion_timeout(&mpfs_client->c, HZ)) {
+			ret = 0U;
+		} else {
+			ret = -ETIMEDOUT;
+			WARN_ONCE(1, "MPFS sys controller transaction timeout");
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
+	memcpy(mpfs_client->response, (u8 *)msg,
+	       mpfs_client->response_size_bytes);
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
+	mpfs_client->chan = mbox_request_channel_byname(&mpfs_client->client,
+							"mbox-mpfs");
+	if (IS_ERR(mpfs_client->chan)) {
+		int ret = PTR_ERR(mpfs_client->chan);
+
+		if (ret != -EPROBE_DEFER)
+			dev_err(dev, "Failed to get mbox channel: %d\n", ret);
+		return ret;
+	}
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
+	{
+		.compatible = "microchip,polarfire-soc-sys-controller",
+	},
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
