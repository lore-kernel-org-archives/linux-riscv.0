Return-Path: <SRS0=igOf=LS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77F52C49EA6
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Jun 2021 15:02:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42204613F2
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Jun 2021 15:02:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42204613F2
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=A6AzJEW2dm3W/lEKp3+8jKkOOfjb/+TPEZWyTf4+2+4=; b=btBIe1hR4kJagl
	kNX1ZPiKiwUf51R/5ejQ52oK8L+Jz1edgVQrh6dii4JVdHlH+qpewzTTvzbUDk2XnVsuLrbdBmDBg
	nym25Ev2i+A1k+yjZhSBVMIQK+LVRN7+SrFW1eqCUuwaXhfQrqv8HQ40/xnD1YkHXro62PD8W1/Mf
	7MfV0AwDQSY8vHg/WGsfkxybZxHfIyJCNpUZcrZjPwYrXjpWPGmXqOij21S7Hvy0dHJjgelMevplD
	eKTQlMtV78VnNuUIBIgIubMiJy16qsAw5b7QwKOJjKsO+q95O7ONSQ1RrFMx1+tyhDCyEMpf/aEVv
	SAe1uyAnUAjx51nJa2cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwQrh-00FA3B-R6; Thu, 24 Jun 2021 15:02:01 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwQrQ-00F9pX-SB
 for linux-riscv@lists.infradead.org; Thu, 24 Jun 2021 15:01:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1624546904; x=1656082904;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ABlHuMU7/47NEwUn6U98jVGKhvjZVuWiEHuyHuNbCIs=;
 b=ViX6nkjrwN06W/14Ga5Uog/3Tb9FYGILy1+lu9uODDcbKEeWbc+0iJz/
 Oob/R0n1awsjt86qduHDVtbLCLKqrK2PPdUkOVLkun/I4Wr2FVMiBuabq
 FV50R+nJw2U3zwcdmnmCaPIzJ2cx9SM+0NND7yclLDcsqfpuUrERn0nhM
 8AdOJsNCbSEBU4t+J3bgG6qqBKC/e8zeu7UxMNU9Ko3M7XRgChRxmuzOn
 rUB8WpH5ipWJS+ayruDQzReWUGG7k6S2YCGbEGnf+eHGMb+9lzOTm7q1i
 5YiQAenVehWA8J8YkiqezmjX6Ui6GMDMmVPvYIgFrwwOHVKblMSnC2Lwv g==;
IronPort-SDR: RPlQgSRknKq0oNe+bqEeG5mTZdXXi7aXGT776pTPWOUAer1kElnoIlzTQKplpi1s8viN+wViUY
 5sjgPj9KjFn5iJRnKyfsp5x2X68OfJDtWwHdWzgOxIGZio9gxH1zQlokohZw/JnqeZMMt4Zhxm
 IJpysJ2OeNoGBg8fHevxW92AkNFrZed86/1G8KZ6Xn6aScxZ4pX5d7XusXOgbXKIUPvpOCL8yv
 DNr5cxXkAdR4vWoFR9qlpwzB2mrXwOenxq6MLtt3/8PXyDv1DQdh8EkHpX+BXKDQ2zZjPOWjzR
 6gM=
X-IronPort-AV: E=Sophos;i="5.83,296,1616482800"; d="scan'208";a="119885687"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 24 Jun 2021 08:01:31 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 24 Jun 2021 08:00:58 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Thu, 24 Jun 2021 08:00:56 -0700
From: <conor.dooley@microchip.com>
To: <robh+dt@kernel.org>, <damien.lemoal@wdc.com>, <jassisinghbrar@gmail.com>, 
 <aou@eecs.berkeley.edu>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, 
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <j.neuschaefer@gmx.net>, <sfr@canb.auug.org.au>
CC: <lewis.hanly@microchip.com>, <cyril.jean@microchip.com>,
 <daire.mcnamara@microchip.com>, <atish.patra@wdc.com>, <anup.patel@wdc.com>,
 <david.abdurachmanov@gmail.com>, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v9 2/5] mbox: add polarfire soc system controller mailbox
Date: Thu, 24 Jun 2021 16:00:55 +0100
Message-ID: <20210624150055.11298-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210624_080145_095236_39663A0F 
X-CRM114-Status: GOOD (  23.31  )
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

This driver adds support for the single mailbox channel of the MSS
system controller on the Microchip PolarFire SoC.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/mailbox/Kconfig        |  12 ++
 drivers/mailbox/Makefile       |   2 +
 drivers/mailbox/mailbox-mpfs.c | 251 +++++++++++++++++++++++++++++++++
 include/soc/microchip/mpfs.h   |  43 ++++++
 4 files changed, 308 insertions(+)
 create mode 100644 drivers/mailbox/mailbox-mpfs.c
 create mode 100644 include/soc/microchip/mpfs.h

diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
index 68de2c6af727..b4b780ea2ac8 100644
--- a/drivers/mailbox/Kconfig
+++ b/drivers/mailbox/Kconfig
@@ -160,6 +160,18 @@ config MAILBOX_TEST
 	  Test client to help with testing new Controller driver
 	  implementations.
 
+config POLARFIRE_SOC_MAILBOX
+	tristate "PolarFire SoC (MPFS) Mailbox"
+	depends on HAS_IOMEM
+	depends on SOC_MICROCHIP_POLARFIRE || COMPILE_TEST
+	help
+	  This driver adds support for the PolarFire SoC (MPFS) mailbox controller.
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
index 7194fa92c787..c2089f04887e 100644
--- a/drivers/mailbox/Makefile
+++ b/drivers/mailbox/Makefile
@@ -41,6 +41,8 @@ obj-$(CONFIG_BCM_PDC_MBOX)	+= bcm-pdc-mailbox.o
 
 obj-$(CONFIG_BCM_FLEXRM_MBOX)	+= bcm-flexrm-mailbox.o
 
+obj-$(CONFIG_POLARFIRE_SOC_MAILBOX)	+= mailbox-mpfs.o
+
 obj-$(CONFIG_QCOM_APCS_IPC)	+= qcom-apcs-ipc-mailbox.o
 
 obj-$(CONFIG_TEGRA_HSP_MBOX)	+= tegra-hsp.o
diff --git a/drivers/mailbox/mailbox-mpfs.c b/drivers/mailbox/mailbox-mpfs.c
new file mode 100644
index 000000000000..0d6e2231a2c7
--- /dev/null
+++ b/drivers/mailbox/mailbox-mpfs.c
@@ -0,0 +1,251 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Microchip PolarFire SoC (MPFS) system controller/mailbox controller driver
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
+#define MSS_SYS_MAILBOX_DATA_OFFSET	0u
+#define SCB_MASK_WIDTH			16u
+
+/* SCBCTRL service control register */
+
+#define SCB_CTRL_REQ (0)
+#define SCB_CTRL_REQ_MASK BIT(SCB_CTRL_REQ)
+
+#define SCB_CTRL_BUSY (1)
+#define SCB_CTRL_BUSY_MASK BIT(SCB_CTRL_BUSY)
+
+#define SCB_CTRL_ABORT (2)
+#define SCB_CTRL_ABORT_MASK BIT(SCB_CTRL_ABORT)
+
+#define SCB_CTRL_NOTIFY (3)
+#define SCB_CTRL_NOTIFY_MASK BIT(SCB_CTRL_NOTIFY)
+
+#define SCB_CTRL_POS (16)
+#define SCB_CTRL_MASK GENMASK_ULL(SCB_CTRL_POS + SCB_MASK_WIDTH, SCB_CTRL_POS)
+
+/* SCBCTRL service status register */
+
+#define SCB_STATUS_REQ (0)
+#define SCB_STATUS_REQ_MASK BIT(SCB_STATUS_REQ)
+
+#define SCB_STATUS_BUSY (1)
+#define SCB_STATUS_BUSY_MASK BIT(SCB_STATUS_BUSY)
+
+#define SCB_STATUS_ABORT (2)
+#define SCB_STATUS_ABORT_MASK BIT(SCB_STATUS_ABORT)
+
+#define SCB_STATUS_NOTIFY (3)
+#define SCB_STATUS_NOTIFY_MASK BIT(SCB_STATUS_NOTIFY)
+
+#define SCB_STATUS_POS (16)
+#define SCB_STATUS_MASK GENMASK_ULL(SCB_STATUS_POS + SCB_MASK_WIDTH, SCB_STATUS_POS)
+
+struct mpfs_mbox {
+	struct mbox_controller controller;
+	struct device *dev;
+	int irq;
+	void __iomem *mbox_base;
+	void __iomem *int_reg;
+	struct mbox_chan chans[1];
+	struct mpfs_mss_response *response;
+	u16 resp_offset;
+};
+
+static bool mpfs_mbox_busy(struct mpfs_mbox *mbox)
+{
+	u32 status;
+
+	status = readl_relaxed(mbox->mbox_base + SERVICES_SR_OFFSET);
+
+	return status & SCB_STATUS_BUSY_MASK;
+}
+
+static int mpfs_mbox_send_data(struct mbox_chan *chan, void *data)
+{
+	struct mpfs_mbox *mbox = (struct mpfs_mbox *)chan->con_priv;
+	struct mpfs_mss_msg *msg = data;
+	u32 tx_trigger;
+	u16 opt_sel;
+	u32 val = 0u;
+
+	mbox->response = msg->response;
+	mbox->resp_offset = msg->resp_offset;
+
+	if (mpfs_mbox_busy(mbox))
+		return -EBUSY;
+
+	if (msg->cmd_data_size) {
+		u32 index;
+		u8 extra_bits = msg->cmd_data_size & 3;
+		u32 *word_buf = (u32 *)msg->cmd_data;
+
+		for (index = 0; index < (msg->cmd_data_size / 4); index++)
+			writel_relaxed(word_buf[index],
+				       mbox->mbox_base + MAILBOX_REG_OFFSET + index * 0x4);
+		if (extra_bits) {
+			u8 i;
+			u8 byte_off = ALIGN_DOWN(msg->cmd_data_size, 4);
+			u8 *byte_buf = msg->cmd_data + byte_off;
+
+			val = readl_relaxed(mbox->mbox_base +
+					    MAILBOX_REG_OFFSET + index * 0x4);
+
+			for (i = 0u; i < extra_bits; i++) {
+				val &= ~(0xffu << (i * 8u));
+				val |= (byte_buf[i] << (i * 8u));
+			}
+
+			writel_relaxed(val,
+				       mbox->mbox_base + MAILBOX_REG_OFFSET + index * 0x4);
+		}
+	}
+
+	opt_sel = ((msg->mbox_offset << 7u) | (msg->cmd_opcode & 0x7fu));
+	tx_trigger = (opt_sel << SCB_CTRL_POS) & SCB_CTRL_MASK;
+	tx_trigger |= SCB_CTRL_REQ_MASK | SCB_STATUS_NOTIFY_MASK;
+	writel_relaxed(tx_trigger, mbox->mbox_base + SERVICES_CR_OFFSET);
+
+	return 0;
+}
+
+static void mpfs_mbox_rx_data(struct mbox_chan *chan)
+{
+	struct mpfs_mbox *mbox = (struct mpfs_mbox *)chan->con_priv;
+	struct mpfs_mss_response *response = mbox->response;
+	u16 num_words = ALIGN((response->resp_size), (4)) / 4U;
+	u32 i;
+
+	if (!response->resp_msg) {
+		dev_err(mbox->dev, "failed to assign memory for response %d\n", -ENOMEM);
+		return;
+	}
+
+	if (!mpfs_mbox_busy(mbox)) {
+		for (i = 0; i < num_words; i++) {
+			response->resp_msg[i] =
+				readl_relaxed(mbox->mbox_base + MAILBOX_REG_OFFSET
+					      + mbox->resp_offset + i * 0x4);
+		}
+	}
+
+	mbox_chan_received_data(chan, response);
+}
+
+static irqreturn_t mpfs_mbox_inbox_isr(int irq, void *data)
+{
+	struct mbox_chan *chan = data;
+	struct mpfs_mbox *mbox = (struct mpfs_mbox *)chan->con_priv;
+
+	writel_relaxed(0, mbox->int_reg);
+
+	mpfs_mbox_rx_data(chan);
+
+	mbox_chan_txdone(chan, 0);
+	return IRQ_HANDLED;
+}
+
+static int mpfs_mbox_startup(struct mbox_chan *chan)
+{
+	struct mpfs_mbox *mbox = (struct mpfs_mbox *)chan->con_priv;
+	int ret = 0;
+
+	if (!mbox)
+		return -EINVAL;
+
+	ret = devm_request_irq(mbox->dev, mbox->irq, mpfs_mbox_inbox_isr, 0, "mpfs-mailbox", chan);
+	if (ret)
+		dev_err(mbox->dev, "failed to register mailbox interrupt:%d\n", ret);
+
+	return ret;
+}
+
+static void mpfs_mbox_shutdown(struct mbox_chan *chan)
+{
+	struct mpfs_mbox *mbox = (struct mpfs_mbox *)chan->con_priv;
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
+	int ret;
+
+	mbox = devm_kzalloc(&pdev->dev, sizeof(*mbox), GFP_KERNEL);
+	if (!mbox)
+		return -ENOMEM;
+
+	mbox->mbox_base = devm_platform_get_and_ioremap_resource(pdev, 0, &regs);
+	if (IS_ERR(mbox->mbox_base))
+		return PTR_ERR(mbox->mbox_base);
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
+	mbox->chans[0].con_priv = mbox;
+	mbox->controller.dev = mbox->dev;
+	mbox->controller.num_chans = 1;
+	mbox->controller.chans = mbox->chans;
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
+	{.compatible = "microchip,polarfire-soc-mailbox", },
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
index 000000000000..2b64c95f3be5
--- /dev/null
+++ b/include/soc/microchip/mpfs.h
@@ -0,0 +1,43 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ *
+ * Microchip PolarFire SoC (MPFS)
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
+	struct mpfs_mss_response *response;
+	u8 *cmd_data;
+	u16 mbox_offset;
+	u16 resp_offset;
+};
+
+struct mpfs_mss_response {
+	u32 resp_status;
+	u32 *resp_msg;
+	u16 resp_size;
+};
+
+#if IS_ENABLED(CONFIG_POLARFIRE_SOC_SYS_CTRL)
+
+int mpfs_blocking_transaction(struct mpfs_sys_controller *mpfs_client, void *msg);
+
+struct mpfs_sys_controller *mpfs_sys_controller_get(struct device_node *mailbox_node);
+
+#endif /* if IS_ENABLED(CONFIG_POLARFIRE_SOC_SYS_CTRL) */
+
+#endif /* __SOC_MPFS_H__ */
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
