Return-Path: <SRS0=guVx=FF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 540A6C64E7B
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Dec 2020 11:02:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 940EA206CB
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Dec 2020 11:02:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L255gSgN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="wXbWtrHW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 940EA206CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Vm7XbxnbAF3rrrSwRLJ5Lax37cov0IyQvdn5Hea4EEQ=; b=L255gSgNjh95I+jN0nzarf2ZJA
	UxyP/IpjnjMk1GTJoa055qofkVaNzGiSZ/ktFZikaKoinHW2AYb8qAx1vpV47g9ogVQ/WAfU5coF4
	yPH6DJFhSp1zSL3O+2PD1u6QrKh5yL+JD4jsO+eKipEOXgAE2hWnjCvG2RJ6zPFXpHb/A17UmVGbv
	A7u9AgQcXOF45zkmnQtUSzdKHNluLv8U2x5iRhL9Jm+cuMbl6d2LKfFx1WQS7zP40bwn9e9YNaJBF
	W3luzhWCIO6iUHa23TtUgUy7fbR3edxEONRQ79h+WUwF3aqysnhuKnkgcX65idv5NdaASnLD+Sn47
	c0xYwK2A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kk3Qp-0004HD-6d; Tue, 01 Dec 2020 11:02:51 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kk3Qn-0004GF-5h
 for linux-riscv@lists.infradead.org; Tue, 01 Dec 2020 11:02:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1606820569; x=1638356569;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=TzoHd8I4u2+/+v0zhzlXi6LqlLClLcqizItaKVCOV6g=;
 b=wXbWtrHW5IZF1PcMkBdc6+gYn6lfCuiVbaqm9PAyT7LsCdoetY3wCSpN
 89qpdLOR2VvfjcdMFyR6Nk6s77U41UI3esYhGUmZ46YxF+tf2bOtMSdYv
 THrm6OyJFLvB2qsPwyhAXBB4kW9r+AH0FXcH7JtIUrNo7kGxI0tS4l5K8
 LSeP/wRsrCR5P0MdFtDpu6uXbmIPSsFURmjIEnzu6y5bgSlBiKlPt0Z5Z
 W311xVrCFsGHvvvMJykUAm3D1GiTFBg53Xh6G3CTh8Tu9zi5A3LdAaUrA
 kSQ0T0LqPwoHYMDLPi8SCN3Q0Tm7wl0ek2QrQig8zauIMhjalQxAtUPx+ w==;
IronPort-SDR: 4lYMsp5ZGQwZhaWzu1SVPUIaHHLw9UfPq+rgOR5+kfcQs6OWawiTAp3UO++86S7j4EYU6Vt+iG
 /Kg9DUEtmPLM5t+XimNhvVI2xhYe/jGWK/Ecuf26PvL9+WrZRz8VSv4z2LuoYwsMheNvqBlcBw
 YtfWFl3Qed0n0AMOqqbI3XKXb1tRdDDlWVv8LCoDCtagz00eFCs9Mp3aL6O0qNJ/2+GTl/KM4t
 /qV2gcj86XdR3kC/3w/H406hEm7LF3M61Q5V1YgTM7qRgy73YSgCT4lL+0M/JvoGHP/RHtRZnL
 640=
X-IronPort-AV: E=Sophos;i="5.78,384,1599548400"; d="scan'208";a="100384360"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 01 Dec 2020 04:02:47 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 1 Dec 2020 04:02:45 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.1979.3 via Frontend
 Transport; Tue, 1 Dec 2020 04:02:43 -0700
From: <conor.dooley@microchip.com>
To: <robh+dt@kernel.org>, <damien.lemoal@wdc.com>, <jassisinghbrar@gmail.com>, 
 <aou@eecs.berkeley.edu>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, 
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: [PATCH v2 1/5] mbox: add polarfire soc system controller mailbox
Date: Tue, 1 Dec 2020 11:02:42 +0000
Message-ID: <20201201110242.28369-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_060249_387588_4D57002A 
X-CRM114-Status: GOOD (  24.30  )
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

This driver adds support for the single mailbox channel of the MSS
system controller on the Microchip PolarFire SoC.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/mailbox/Kconfig        |  12 ++
 drivers/mailbox/Makefile       |   2 +
 drivers/mailbox/mailbox-mpfs.c | 285 +++++++++++++++++++++++++++++++++
 include/soc/microchip/mpfs.h   |  51 ++++++
 4 files changed, 350 insertions(+)
 create mode 100644 drivers/mailbox/mailbox-mpfs.c
 create mode 100644 include/soc/microchip/mpfs.h

diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
index 05b1009e2820..fbf6902c3541 100644
--- a/drivers/mailbox/Kconfig
+++ b/drivers/mailbox/Kconfig
@@ -153,6 +153,18 @@ config MAILBOX_TEST
 	  Test client to help with testing new Controller driver
 	  implementations.
 
+config MPFS_MBOX
+	tristate "MPFS Mailbox"
+	depends on HAS_IOMEM
+	depends on SOC_MICROCHIP_POLARFIRE || COMPILE_TEST
+	help
+	  This driver adds support for the Polarfire SoC mailbox controller.
+
+	  To compile this driver as a module, choose M here. the
+	  module will be called mailbox-mpfs.
+
+	  If unsure, say N.
+
 config QCOM_APCS_IPC
 	tristate "Qualcomm APCS IPC driver"
 	depends on ARCH_QCOM || COMPILE_TEST
diff --git a/drivers/mailbox/Makefile b/drivers/mailbox/Makefile
index 2e06e02b2e03..63f49b5bcc43 100644
--- a/drivers/mailbox/Makefile
+++ b/drivers/mailbox/Makefile
@@ -39,6 +39,8 @@ obj-$(CONFIG_BCM_PDC_MBOX)	+= bcm-pdc-mailbox.o
 
 obj-$(CONFIG_BCM_FLEXRM_MBOX)	+= bcm-flexrm-mailbox.o
 
+obj-$(CONFIG_MPFS_MBOX)	+= mailbox-mpfs.o
+
 obj-$(CONFIG_QCOM_APCS_IPC)	+= qcom-apcs-ipc-mailbox.o
 
 obj-$(CONFIG_TEGRA_HSP_MBOX)	+= tegra-hsp.o
diff --git a/drivers/mailbox/mailbox-mpfs.c b/drivers/mailbox/mailbox-mpfs.c
new file mode 100644
index 000000000000..e1ecf3081312
--- /dev/null
+++ b/drivers/mailbox/mailbox-mpfs.c
@@ -0,0 +1,285 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Microchip MPFS system controller/mailbox controller driver
+ *
+ * Copyright (c) 2020 Microchip Corporation. All rights reserved.
+ *
+ * Author: Conor Dooley <conor.dooley@microchip.com>
+ *
+ */
+
+#include <linux/io.h>
+#include <linux/err.h>
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/interrupt.h>
+#include <linux/platform_device.h>
+#include <linux/mailbox_controller.h>
+#include <soc/microchip/mpfs.h>
+
+#define SERVICES_CR_OFFSET		0x50u
+#define SERVICES_SR_OFFSET		0x54u
+#define MAILBOX_REG_OFFSET		0x800u
+#define MSS_SYS_BUSY			-EBUSY
+#define MSS_SYS_PARAM_ERR		-EINVAL
+#define MSS_SYS_MAILBOX_DATA_OFFSET	0u
+#define SCB_MASK_WIDTH 			16u
+/* SCBCTRL service control register */
+
+#define SCB_CTRL_REQ (0u)
+#define SCB_CTRL_REQ_MASK BIT(SCB_CTRL_REQ)
+
+#define SCB_CTRL_BUSY (1u)
+#define SCB_CTRL_BUSY_MASK BIT(SCB_CTRL_BUSY)
+
+#define SCB_CTRL_ABORT (2u)
+#define SCB_CTRL_ABORT_MASK BIT(SCB_CTRL_ABORT)
+
+#define SCB_CTRL_NOTIFY (3u)
+#define SCB_CTRL_NOTIFY_MASK BIT(SCB_CTRL_NOTIFY)
+
+#define SCB_CTRL_POS (16u)
+#define SCB_CTRL_MASK GENMASK(SCB_CTRL_POS+SCB_MASK_WIDTH, SCB_CTRL_POS)
+
+/* SCBCTRL service status registers */
+
+#define SCB_STATUS_REQ (0u)
+#define SCB_STATUS_REQ_MASK BIT(SCB_STATUS_REQ)
+
+#define SCB_STATUS_BUSY (1u)
+#define SCB_STATUS_BUSY_MASK BIT(SCB_STATUS_BUSY)
+
+#define SCB_STATUS_ABORT (2u)
+#define SCB_STATUS_ABORT_MASK BIT(SCB_STATUS_ABORT)
+
+#define SCB_STATUS_NOTIFY (3u)
+#define SCB_STATUS_NOTIFY_MASK BIT(SCB_STATUS_NOTIFY)
+
+#define SCB_STATUS_POS (16u)
+#define SCB_STATUS_MASK GENMASK(SCB_STATUS_POS+SCB_MASK_WIDTH, SCB_STATUS_POS)
+
+struct mpfs_mbox {
+	struct mbox_controller controller;
+	struct device *dev;
+	int irq;
+	void __iomem *mailbox_base;
+	void __iomem *int_reg;
+	struct mbox_chan *chan;
+	u16 response_size;
+	u16 response_offset;
+};
+
+static bool mpfs_mbox_busy(struct mpfs_mbox *mbox)
+{
+	u32 status;
+
+	status = readl_relaxed(mbox->mailbox_base + SERVICES_SR_OFFSET);
+
+	return status & SCB_STATUS_BUSY_MASK;
+}
+
+static struct mpfs_mbox *mbox_chan_to_mpfs_mbox(struct mbox_chan *chan)
+{
+	if (!chan || !chan->con_priv)
+		return NULL;
+
+	return (struct mpfs_mbox *)chan->con_priv;
+}
+
+static int mpfs_mbox_send_data(struct mbox_chan *chan, void *data)
+{
+	u32 index;
+	u32 *word_buf;
+	u8 *byte_buf;
+	u8 byte_off;
+	u8 i;
+	u32 mailbox_val = 0u;
+	u16 mb_offset;
+	u16 mbox_options_select;
+	u32 mbox_tx_trigger;
+	struct mpfs_mss_msg *msg = data;
+	struct mpfs_mbox *mbox = mbox_chan_to_mpfs_mbox(chan);
+	mb_offset = msg->mailbox_offset;
+	mbox->response_size = msg->response_size;
+	mbox->response_offset = msg->response_offset;
+
+	if (mpfs_mbox_busy(mbox))
+		return MSS_SYS_BUSY;
+
+	mbox_options_select = ((mb_offset << 7u) | (msg->cmd_opcode & 0x7fu));
+	mbox_tx_trigger = (((mbox_options_select << SCB_CTRL_POS) &
+		SCB_CTRL_MASK) | SCB_CTRL_REQ_MASK | SCB_STATUS_NOTIFY_MASK);
+
+	/* Code for MSS_SYS_PARAM_ERR is not implemented with this version of driver. */
+
+	writel_relaxed(0x0u, mbox->int_reg);
+
+	if (msg->cmd_data_size) {
+		byte_buf = (u8 *)(msg->cmd_data);
+
+		for (index = 0; index < (msg->cmd_data_size / 4); index++) {
+			writel_relaxed(word_buf[index],
+				       mbox->mailbox_base + MAILBOX_REG_OFFSET + index);
+		}
+
+		if ((msg->cmd_data_size % 4) > 0) {
+			byte_off = (((msg->cmd_data_size / 4) * 4));
+			byte_buf = (u8 *)(msg->cmd_data + byte_off);
+
+			mailbox_val = readl_relaxed(mbox->mailbox_base +
+					    MAILBOX_REG_OFFSET + index);
+
+			for (i = 0u; i < (msg->cmd_data_size % 4u); i++) {
+				mailbox_val &= ~(0xffu << (i * 8u));
+				mailbox_val |= (byte_buf[i] << (i * 8u));
+			}
+
+			writel_relaxed(mailbox_val, mbox->mailbox_base + MAILBOX_REG_OFFSET + index);
+		}
+	}
+
+	writel_relaxed(mbox_tx_trigger, mbox->mailbox_base + SERVICES_CR_OFFSET);
+
+	return 0;
+}
+
+static inline bool mpfs_mbox_pending(struct mpfs_mbox *mbox)
+{
+	u32 status;
+
+	status = readl_relaxed(mbox->mailbox_base + SERVICES_SR_OFFSET);
+
+	return !(status & SCB_STATUS_BUSY_MASK);
+}
+
+static void mpfs_mbox_rx_data(struct mbox_chan *chan)
+{
+	struct mpfs_mbox *mbox = mbox_chan_to_mpfs_mbox(chan);
+	u32 *data;
+	u32 i;
+	u32 response_limit;
+
+	data = devm_kzalloc(mbox->dev, sizeof(*data) * mbox->response_size, GFP_ATOMIC);
+	if (!data)
+		dev_err(mbox->dev, "failed to register mailbox interrupt:%d\n", -ENOMEM);
+
+	response_limit = (mbox->response_size) + (mbox->response_offset);
+	if (mpfs_mbox_pending(mbox) && mbox->response_size > 0U) {
+		for (i = (mbox->response_offset); i < response_limit; i++) {
+			data[i - (mbox->response_offset)] =
+				readl_relaxed(mbox->mailbox_base + MAILBOX_REG_OFFSET + i * 0x4);
+		}
+	}
+
+	mbox_chan_received_data(chan, (void *)data);
+	devm_kfree(mbox->dev, data);
+}
+
+static irqreturn_t mpfs_mbox_inbox_isr(int irq, void *data)
+{
+	struct mbox_chan *chan = (struct mbox_chan *)data;
+	struct mpfs_mbox *mbox = mbox_chan_to_mpfs_mbox(chan);
+
+	writel_relaxed(0x0U, mbox->int_reg);
+
+	mpfs_mbox_rx_data(chan);
+
+	mbox_chan_txdone(chan, 0);
+	return IRQ_HANDLED;
+}
+
+static int mpfs_mbox_startup(struct mbox_chan *chan)
+{
+	struct mpfs_mbox *mbox = mbox_chan_to_mpfs_mbox(chan);
+	int ret = 0;
+
+	if (!mbox)
+		return -EINVAL;
+	ret = devm_request_irq(mbox->dev, mbox->irq, mpfs_mbox_inbox_isr, 0, "mpfs-mailbox", chan);
+	if (ret) {
+		dev_err(mbox->dev, "failed to register mailbox interrupt:%d\n", ret);
+	}
+
+	return ret;
+}
+
+static void mpfs_mbox_shutdown(struct mbox_chan *chan)
+{
+	struct mpfs_mbox *mbox = mbox_chan_to_mpfs_mbox(chan);
+
+	devm_free_irq(mbox->dev, mbox->irq, chan);
+}
+
+static const struct mbox_chan_ops mpfs_mbox_ops = {
+	.send_data = mpfs_mbox_send_data,
+	.startup = mpfs_mbox_startup,
+	.shutdown = mpfs_mbox_shutdown,
+};
+
+static int mpfs_mbox_probe(struct platform_device *pdev)
+{
+	struct mpfs_mbox *mbox;
+	struct resource *regs;
+	struct mbox_chan *chans;
+	int ret;
+
+	mbox = devm_kzalloc(&pdev->dev, sizeof(*mbox), GFP_KERNEL);
+	if (!mbox)
+		return -ENOMEM;
+
+	chans = devm_kzalloc(&pdev->dev, sizeof(*chans), GFP_KERNEL);
+	if (!chans)
+		return -ENOMEM;
+
+	mbox->mailbox_base = devm_platform_get_and_ioremap_resource(pdev, 0, &regs);
+	if (IS_ERR(mbox->mailbox_base))
+		return PTR_ERR(mbox->mailbox_base);
+
+	mbox->int_reg = devm_platform_get_and_ioremap_resource(pdev, 1, &regs);
+	if (IS_ERR(mbox->int_reg))
+		return PTR_ERR(mbox->int_reg);
+
+	mbox->irq = platform_get_irq(pdev, 0);
+	if (mbox->irq < 0)
+		return mbox->irq;
+
+	mbox->dev = &pdev->dev;
+
+	chans[0].con_priv = mbox;
+	mbox->controller.dev = mbox->dev;
+	mbox->controller.num_chans = 1;
+	mbox->controller.chans = chans;
+	mbox->controller.ops = &mpfs_mbox_ops;
+	mbox->controller.txdone_irq = true;
+
+	ret = devm_mbox_controller_register(&pdev->dev, &mbox->controller);
+	if (ret) {
+		dev_err(&pdev->dev, "Registering MPFS mailbox controller failed\n");
+		return ret;
+	}
+	dev_info(&pdev->dev, "Registered MPFS mailbox controller driver\n");
+
+	return 0;
+}
+
+static const struct of_device_id mpfs_mbox_of_match[] = {
+	{
+		.compatible = "microchip,polarfire-soc-mailbox",
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(of, mpfs_mbox_of_match);
+
+static struct platform_driver mpfs_mbox_driver = {
+	.driver = {
+		.name = "mpfs-mailbox",
+		.of_match_table = mpfs_mbox_of_match,
+	},
+	.probe = mpfs_mbox_probe,
+};
+module_platform_driver(mpfs_mbox_driver);
+
+MODULE_LICENSE("GPL v2");
+MODULE_AUTHOR("Conor Dooley <conor.dooley@microchip.com>");
+MODULE_DESCRIPTION("MPFS mailbox controller driver");
diff --git a/include/soc/microchip/mpfs.h b/include/soc/microchip/mpfs.h
new file mode 100644
index 000000000000..b231f39f32eb
--- /dev/null
+++ b/include/soc/microchip/mpfs.h
@@ -0,0 +1,51 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ *
+ * Microchip MPFS mailbox
+ *
+ * Copyright (c) 2020 Microchip Corporation. All rights reserved.
+ *
+ * Author: Conor Dooley <conor.dooley@microchip.com>
+ *
+ */
+
+#ifndef __SOC_MPFS_H__
+#define __SOC_MPFS_H__
+
+#include <linux/types.h>
+#include <linux/of_device.h>
+
+struct mpfs_sys_controller;
+
+struct mpfs_mss_msg {
+	u8 cmd_opcode;
+	u16 cmd_data_size;
+	u16 response_size;
+	u8 *cmd_data;
+	u16 mailbox_offset;
+	u16 response_offset;
+};
+
+#if IS_ENABLED(CONFIG_MPFS_SYS_CONTROLLER)
+
+int mpfs_blocking_transaction(struct mpfs_sys_controller *mpfs_client, void *msg,
+			      void *response, u16 response_size_bytes);
+
+struct mpfs_sys_controller *mpfs_sys_controller_get(struct device_node *mailbox_node);
+
+#else
+
+static int mpfs_blocking_transaction(struct mpfs_sys_controller *mpfs_client, void *msg,
+				     void *response, u16 response_size_bytes)
+{
+	return -ENOSYS;
+};
+
+struct mpfs_sys_controller *mpfs_sys_controller_get(struct device_node *mailbox_node)
+{
+	return NULL;
+}
+
+#endif /* IS_ENABLED(CONFIG_MPFS_SYS_CONTROLLER) */
+
+#endif /* __SOC_MPFS_H__ */
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
