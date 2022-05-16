Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9534DC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 16 May 2022 07:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dqsgc45shBeDg/Mgu+GRgfgG3I5+AXBXYkimQ+A1bBQ=; b=rdSwUeNjozTKpU
	4XrYAJ02vw8SBFE5IN8YktZnlVyKfwOAc4OnbDeQEJbEWyF4TVTQW8+meS6iGC8zxl+FND9LnTWJf
	Ij0p/dRU0vLY6RdkqTP/On5sxMAJp9AWdnv1iHuVD0ooLa4yWKvCTRMYfkpsIyQBrgqOjazdSoUYB
	mOYEbUhZ6nyKoE2oM23iV3nf1aH4DHQOYCrEA3Q65bLwBPCqgcbnyf1YozcZrICQo0YBF6E9YXDGK
	teUcxQ25N+VJ+IsgOQLMXlLuMIOb7NelasqpGFeGGr7t1p9SinIu9nygjRCbebajGaTUpW9Q8FAS2
	srIyMeG9WROrPTQHowog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqVGH-006Uiu-RM; Mon, 16 May 2022 07:35:25 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqVGD-006UhP-CK
 for linux-riscv@lists.infradead.org; Mon, 16 May 2022 07:35:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1652686522; x=1684222522;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xkvLfBqFsLz7Enawc3c0345Fmyze9LlERhpg8Kz9l3w=;
 b=ZaQHb1UhcqBkEFNo6uEJ9Z2YYLOq0OyNfsZ/1PUmlg9LZqr2rAO5CmCU
 5uu3B7Ep5aunH2F873Cw8ox0dA6cbMiEw2I+mWjo+SqyD2+HYayRcOjMP
 xwuo8MoTqwUd1WUVTFzj33yocU3fZHnSi7DNNdNMqF9X38nzED7kjmHBs
 fYjqjBA31/x+jXlBLEK3x53xK819NjRoIhS+Qu++6FcTfn7Wn8MdVpXak
 cQQd6A5iOxQ9et6acMl0CSKuIVf2Q2hm7dqXcfuiLUx3epKmAWlj8S7BG
 VbjzPV4Xl1rX0GpMolAkl8vflyGyg2w9IlNGUCc1kJR4gGIgzMbQBKtc+ A==;
X-IronPort-AV: E=Sophos;i="5.91,229,1647327600"; d="scan'208";a="156180375"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 16 May 2022 00:35:18 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 16 May 2022 00:35:17 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Mon, 16 May 2022 00:35:15 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <wsa@kernel.org>, <linux-i2c@vger.kernel.org>
CC: <ben.dooks@codethink.co.uk>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <daire.mcnamara@microchip.com>,
 <conor.dooley@microchip.com>
Subject: [PATCH v3] i2c: add support for microchip fpga i2c controllers
Date: Mon, 16 May 2022 08:33:32 +0100
Message-ID: <20220516073331.3508505-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220516_003521_610164_76BA76BF 
X-CRM114-Status: GOOD (  26.99  )
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

Add Microchip CoreI2C i2c controller support. This driver supports the
"hard" i2c controller on the Microchip PolarFire SoC & the basic feature
set for "soft" i2c controller implemtations in the FPGA fabric.

Co-developed-by: Daire McNamara <daire.mcnamara@microchip.com>
Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes from v2:
- Fixed whitespace in defines that I removed accidentally

Changes from v1:
- Use byte write and read functions
- Return IRQ_NONE and don't warn if not this drivers interrupt
- Add a clk_disable_unprepare to avoid leaking a clock in the probe
---
 drivers/i2c/busses/Kconfig              |  11 +
 drivers/i2c/busses/Makefile             |   1 +
 drivers/i2c/busses/i2c-microchip-core.c | 488 ++++++++++++++++++++++++
 3 files changed, 500 insertions(+)
 create mode 100644 drivers/i2c/busses/i2c-microchip-core.c

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index a1bae59208e3..3d4d8e0e9de7 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -781,6 +781,17 @@ config I2C_MESON
 	  If you say yes to this option, support will be included for the
 	  I2C interface on the Amlogic Meson family of SoCs.
 
+config I2C_MICROCHIP_CORE
+	tristate "Microchip FPGA I2C controller"
+	depends on SOC_MICROCHIP_POLARFIRE || COMPILE_TEST
+	depends on OF
+	help
+	  If you say yes to this option, support will be included for the
+	  I2C interface on Microchip FPGAs.
+
+	  This driver can also be built as a module. If so, the module will be
+	  called i2c-microchip-core.
+
 config I2C_MPC
 	tristate "MPC107/824x/85xx/512x/52xx/83xx/86xx"
 	depends on PPC
diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
index 479f60e4ee3d..75869b189e43 100644
--- a/drivers/i2c/busses/Makefile
+++ b/drivers/i2c/busses/Makefile
@@ -78,6 +78,7 @@ obj-$(CONFIG_I2C_JZ4780)	+= i2c-jz4780.o
 obj-$(CONFIG_I2C_KEMPLD)	+= i2c-kempld.o
 obj-$(CONFIG_I2C_LPC2K)		+= i2c-lpc2k.o
 obj-$(CONFIG_I2C_MESON)		+= i2c-meson.o
+obj-$(CONFIG_I2C_MICROCHIP_CORE)	+= i2c-microchip-core.o
 obj-$(CONFIG_I2C_MPC)		+= i2c-mpc.o
 obj-$(CONFIG_I2C_MT65XX)	+= i2c-mt65xx.o
 obj-$(CONFIG_I2C_MT7621)	+= i2c-mt7621.o
diff --git a/drivers/i2c/busses/i2c-microchip-core.c b/drivers/i2c/busses/i2c-microchip-core.c
new file mode 100644
index 000000000000..18793455f317
--- /dev/null
+++ b/drivers/i2c/busses/i2c-microchip-core.c
@@ -0,0 +1,488 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Microchip CoreI2C I2C controller driver
+ *
+ * Copyright (c) 2018 - 2022 Microchip Corporation. All rights reserved.
+ *
+ * Author: Daire McNamara <daire.mcnamara@microchip.com>
+ * Author: Conor Dooley <conor.dooley@microchip.com>
+ */
+#include <linux/clk.h>
+#include <linux/clkdev.h>
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/iopoll.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/platform_device.h>
+
+#define MICROCHIP_I2C_TIMEOUT (msecs_to_jiffies(1000))
+
+#define CORE_I2C_CTRL	(0x00)
+#define  CTRL_CR0	BIT(0)
+#define  CTRL_CR1	BIT(1)
+#define  CTRL_AA	BIT(2)
+#define  CTRL_SI	BIT(3)
+#define  CTRL_STO	BIT(4)
+#define  CTRL_STA	BIT(5)
+#define  CTRL_ENS1	BIT(6)
+#define  CTRL_CR2	BIT(7)
+
+#define STATUS_BUS_ERROR			(0x00)
+#define STATUS_M_START_SENT			(0x08)
+#define STATUS_M_REPEATED_START_SENT		(0x10)
+#define STATUS_M_SLAW_ACK			(0x18)
+#define STATUS_M_SLAW_NACK			(0x20)
+#define STATUS_M_TX_DATA_ACK			(0x28)
+#define STATUS_M_TX_DATA_NACK			(0x30)
+#define STATUS_M_ARB_LOST			(0x38)
+#define STATUS_M_SLAR_ACK			(0x40)
+#define STATUS_M_SLAR_NACK			(0x48)
+#define STATUS_M_RX_DATA_ACKED			(0x50)
+#define STATUS_M_RX_DATA_NACKED			(0x58)
+#define STATUS_S_SLAW_ACKED			(0x60)
+#define STATUS_S_ARB_LOST_SLAW_ACKED		(0x68)
+#define STATUS_S_GENERAL_CALL_ACKED		(0x70)
+#define STATUS_S_ARB_LOST_GENERAL_CALL_ACKED	(0x78)
+#define STATUS_S_RX_DATA_ACKED			(0x80)
+#define STATUS_S_RX_DATA_NACKED			(0x88)
+#define STATUS_S_GENERAL_CALL_RX_DATA_ACKED	(0x90)
+#define STATUS_S_GENERAL_CALL_RX_DATA_NACKED	(0x98)
+#define STATUS_S_RX_STOP			(0xA0)
+#define STATUS_S_SLAR_ACKED			(0xA8)
+#define STATUS_S_ARB_LOST_SLAR_ACKED		(0xB0)
+#define STATUS_S_TX_DATA_ACK			(0xB8)
+#define STATUS_S_TX_DATA_NACK			(0xC0)
+#define STATUS_LAST_DATA_ACK			(0xC8)
+#define STATUS_M_SMB_MASTER_RESET		(0xD0)
+#define STATUS_S_SCL_LOW_TIMEOUT		(0xD8) /* 25 ms */
+#define STATUS_NO_STATE_INFO			(0xF8)
+
+#define CORE_I2C_STATUS		(0x04)
+#define CORE_I2C_DATA		(0x08)
+#define WRITE_BIT		(0x0)
+#define READ_BIT		(0x1)
+#define SLAVE_ADDR_SHIFT	(1)
+#define CORE_I2C_SLAVE0_ADDR	(0x0c)
+#define GENERAL_CALL_BIT	(0x0)
+#define CORE_I2C_SMBUS		(0x10)
+#define SMBALERT_INT_ENB	(0x0)
+#define SMBSUS_INT_ENB		(0x1)
+#define SMBUS_ENB		(0x2)
+#define SMBALERT_NI_STATUS	(0x3)
+#define SMBALERT_NO_CTRL	(0x4)
+#define SMBSUS_NI_STATUS	(0x5)
+#define SMBSUS_NO_CTRL		(0x6)
+#define SMBUS_RESET		(0x7)
+#define CORE_I2C_FREQ		(0x14)
+#define CORE_I2C_GLITCHREG	(0x18)
+#define CORE_I2C_SLAVE1_ADDR	(0x1c)
+
+#define PCLK_DIV_960	(CTRL_CR2)
+#define PCLK_DIV_256	(0)
+#define PCLK_DIV_224	(CTRL_CR0)
+#define PCLK_DIV_192	(CTRL_CR1)
+#define PCLK_DIV_160	(CTRL_CR0 | CTRL_CR1)
+#define PCLK_DIV_120	(CTRL_CR0 | CTRL_CR2)
+#define PCLK_DIV_60	(CTRL_CR1 | CTRL_CR2)
+#define BCLK_DIV_8	(CTRL_CR0 | CTRL_CR1 | CTRL_CR2)
+#define CLK_MASK	(CTRL_CR0 | CTRL_CR1 | CTRL_CR2)
+
+/*
+ * mchp_corei2c_dev - I2C device context
+ * @base: pointer to register struct
+ * @msg: pointer to current message
+ * @msg_len: number of bytes transferred in msg
+ * @msg_err: error code for completed message
+ * @msg_complete: xfer completion object
+ * @dev: device reference
+ * @adapter: core i2c abstraction
+ * @i2c_clk: clock reference for i2c input clock
+ * @bus_clk_rate: current i2c bus clock rate
+ * @buf: ptr to msg buffer for easier use.
+ * @isr_status: cached copy of local ISR status.
+ * @lock: spinlock for IRQ synchronization.
+ */
+struct mchp_corei2c_dev {
+	void __iomem *base;
+	size_t msg_len;
+	int msg_err;
+	struct completion msg_complete;
+	struct device *dev;
+	struct i2c_adapter adapter;
+	struct clk *i2c_clk;
+	spinlock_t lock; /* IRQ synchronization */
+	u32 bus_clk_rate;
+	u32 msg_read;
+	u32 isr_status;
+	u8 *buf;
+	u8 addr;
+};
+
+static void mchp_corei2c_core_disable(struct mchp_corei2c_dev *idev)
+{
+	u8 ctrl = readb(idev->base + CORE_I2C_CTRL);
+
+	ctrl &= ~CTRL_ENS1;
+	writeb(ctrl, idev->base + CORE_I2C_CTRL);
+}
+
+static void mchp_corei2c_core_enable(struct mchp_corei2c_dev *idev)
+{
+	u8 ctrl = readb(idev->base + CORE_I2C_CTRL);
+
+	ctrl |= CTRL_ENS1;
+	writeb(ctrl, idev->base + CORE_I2C_CTRL);
+}
+
+static void mchp_corei2c_reset(struct mchp_corei2c_dev *idev)
+{
+	mchp_corei2c_core_disable(idev);
+	mchp_corei2c_core_enable(idev);
+}
+
+static inline void mchp_corei2c_stop(struct mchp_corei2c_dev *idev)
+{
+	u8 ctrl = readb(idev->base + CORE_I2C_CTRL);
+
+	ctrl |= CTRL_STO;
+	writeb(ctrl, idev->base + CORE_I2C_CTRL);
+}
+
+static inline int mchp_corei2c_set_divisor(u32 rate,
+					   struct mchp_corei2c_dev *idev)
+{
+	u8 clkval, ctrl;
+
+	if (rate >= 960)
+		clkval = PCLK_DIV_960;
+	else if (rate >= 256)
+		clkval = PCLK_DIV_256;
+	else if (rate >= 224)
+		clkval = PCLK_DIV_224;
+	else if (rate >= 192)
+		clkval = PCLK_DIV_192;
+	else if (rate >= 160)
+		clkval = PCLK_DIV_160;
+	else if (rate >= 120)
+		clkval = PCLK_DIV_120;
+	else if (rate >= 60)
+		clkval = PCLK_DIV_60;
+	else if (rate >= 8)
+		clkval = BCLK_DIV_8;
+	else
+		return -EINVAL;
+
+	ctrl = readb(idev->base + CORE_I2C_CTRL);
+	ctrl &= ~CLK_MASK;
+	ctrl |= clkval;
+	writeb(ctrl, idev->base + CORE_I2C_CTRL);
+
+	ctrl = readb(idev->base + CORE_I2C_CTRL);
+	if ((ctrl & CLK_MASK) != clkval)
+		return -EIO;
+
+	return 0;
+}
+
+static int mchp_corei2c_init(struct mchp_corei2c_dev *idev)
+{
+	u32 clk_rate = clk_get_rate(idev->i2c_clk);
+	u32 divisor = clk_rate / idev->bus_clk_rate;
+	int ret;
+
+	ret = mchp_corei2c_set_divisor(divisor, idev);
+	if (ret)
+		return ret;
+
+	mchp_corei2c_reset(idev);
+
+	return 0;
+}
+
+static void mchp_corei2c_transfer(struct mchp_corei2c_dev *idev, u32 data)
+{
+	if (idev->msg_len > 0)
+		writeb(data, idev->base + CORE_I2C_DATA);
+}
+
+static void mchp_corei2c_empty_rx(struct mchp_corei2c_dev *idev)
+{
+	u8 ctrl;
+
+	if (idev->msg_len > 0) {
+		*idev->buf++ = readb(idev->base + CORE_I2C_DATA);
+		idev->msg_len--;
+	}
+
+	if (idev->msg_len == 0) {
+		ctrl = readb(idev->base + CORE_I2C_CTRL);
+		ctrl &= ~CTRL_AA;
+		writeb(ctrl, idev->base + CORE_I2C_CTRL);
+	}
+}
+
+static int mchp_corei2c_fill_tx(struct mchp_corei2c_dev *idev)
+{
+	mchp_corei2c_transfer(idev, *idev->buf++);
+	idev->msg_len--;
+
+	return 0;
+}
+
+static irqreturn_t mchp_corei2c_handle_isr(struct mchp_corei2c_dev *idev)
+{
+	u32 status = idev->isr_status;
+	u8 ctrl;
+
+	if (!idev->buf)
+		return IRQ_NONE;
+
+	switch (status) {
+	case STATUS_M_START_SENT:
+	case STATUS_M_REPEATED_START_SENT:
+		ctrl = readb(idev->base + CORE_I2C_CTRL);
+		ctrl &= ~CTRL_STA;
+		writeb(idev->addr, idev->base + CORE_I2C_DATA);
+		writeb(ctrl, idev->base + CORE_I2C_CTRL);
+		if (idev->msg_len <= 0)
+			goto finished;
+		break;
+	case STATUS_M_ARB_LOST:
+		idev->msg_err = -EAGAIN;
+		goto finished;
+	case STATUS_M_SLAW_ACK:
+	case STATUS_M_TX_DATA_ACK:
+		if (idev->msg_len > 0)
+			mchp_corei2c_fill_tx(idev);
+		else
+			goto last_byte;
+		break;
+	case STATUS_M_TX_DATA_NACK:
+	case STATUS_M_SLAR_NACK:
+	case STATUS_M_SLAW_NACK:
+		idev->msg_err = -ENXIO;
+		goto last_byte;
+	case STATUS_M_SLAR_ACK:
+		ctrl = readb(idev->base + CORE_I2C_CTRL);
+		if (idev->msg_len == 1u) {
+			ctrl &= ~CTRL_AA;
+			writeb(ctrl, idev->base + CORE_I2C_CTRL);
+		} else {
+			ctrl |= CTRL_AA;
+			writeb(ctrl, idev->base + CORE_I2C_CTRL);
+		}
+		if (idev->msg_len < 1u)
+			goto last_byte;
+		break;
+	case STATUS_M_RX_DATA_ACKED:
+		mchp_corei2c_empty_rx(idev);
+		break;
+	case STATUS_M_RX_DATA_NACKED:
+		mchp_corei2c_empty_rx(idev);
+		if (idev->msg_len == 0)
+			goto last_byte;
+		break;
+	default:
+		break;
+	}
+
+	return IRQ_HANDLED;
+
+last_byte:
+	/* On the last byte to be transmitted, send STOP */
+	mchp_corei2c_stop(idev);
+finished:
+	complete(&idev->msg_complete);
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t mchp_corei2c_isr(int irq, void *_dev)
+{
+	struct mchp_corei2c_dev *idev = _dev;
+	irqreturn_t ret = IRQ_NONE;
+	u8 ctrl;
+
+	ctrl = readb(idev->base + CORE_I2C_CTRL);
+	if (ctrl & CTRL_SI) {
+		idev->isr_status = readb(idev->base + CORE_I2C_STATUS);
+		ret = mchp_corei2c_handle_isr(idev);
+	}
+
+	/* Clear the si flag */
+	ctrl = readb(idev->base + CORE_I2C_CTRL);
+	ctrl &= ~CTRL_SI;
+	writeb(ctrl, idev->base + CORE_I2C_CTRL);
+
+	return ret;
+}
+
+static int mchp_corei2c_xfer_msg(struct mchp_corei2c_dev *idev,
+				 struct i2c_msg *msg)
+{
+	u8 ctrl;
+	unsigned long time_left;
+
+	if (msg->len == 0)
+		return -EINVAL;
+
+	idev->addr = i2c_8bit_addr_from_msg(msg);
+	idev->msg_len = msg->len;
+	idev->buf = msg->buf;
+	idev->msg_err = 0;
+	idev->msg_read = (msg->flags & I2C_M_RD);
+
+	reinit_completion(&idev->msg_complete);
+
+	mchp_corei2c_core_enable(idev);
+
+	ctrl = readb(idev->base + CORE_I2C_CTRL);
+	ctrl |= CTRL_STA;
+	writeb(ctrl, idev->base + CORE_I2C_CTRL);
+
+	time_left = wait_for_completion_timeout(&idev->msg_complete,
+						MICROCHIP_I2C_TIMEOUT);
+	if (!time_left)
+		return -ETIMEDOUT;
+
+	return idev->msg_err;
+}
+
+static int mchp_corei2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
+			     int num)
+{
+	struct mchp_corei2c_dev *idev = i2c_get_adapdata(adap);
+	int i, ret;
+
+	for (i = 0; i < num; i++) {
+		ret = mchp_corei2c_xfer_msg(idev, msgs++);
+		if (ret)
+			return ret;
+	}
+
+	return num;
+}
+
+static u32 mchp_corei2c_func(struct i2c_adapter *adap)
+{
+	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
+}
+
+static const struct i2c_algorithm mchp_corei2c_algo = {
+	.master_xfer = mchp_corei2c_xfer,
+	.functionality = mchp_corei2c_func,
+};
+
+static int mchp_corei2c_probe(struct platform_device *pdev)
+{
+	struct mchp_corei2c_dev *idev = NULL;
+	struct resource *res;
+	int irq, ret;
+	u32 val;
+
+	idev = devm_kzalloc(&pdev->dev, sizeof(*idev), GFP_KERNEL);
+	if (!idev)
+		return -ENOMEM;
+
+	idev->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
+	if (IS_ERR(idev->base))
+		return PTR_ERR(idev->base);
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return dev_err_probe(&pdev->dev, irq,
+				     "missing interrupt resource\n");
+
+	idev->i2c_clk = devm_clk_get(&pdev->dev, NULL);
+	if (IS_ERR(idev->i2c_clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(idev->i2c_clk),
+				     "missing clock\n");
+
+	idev->dev = &pdev->dev;
+	init_completion(&idev->msg_complete);
+	spin_lock_init(&idev->lock);
+
+	val = device_property_read_u32(idev->dev, "clock-frequency",
+				       &idev->bus_clk_rate);
+	if (val) {
+		dev_info(&pdev->dev, "default to 100kHz\n");
+		idev->bus_clk_rate = 100000;
+	}
+
+	if (idev->bus_clk_rate > 400000)
+		return dev_err_probe(&pdev->dev, -EINVAL,
+				     "clock-frequency too high: %d\n",
+				     idev->bus_clk_rate);
+
+	ret = devm_request_irq(&pdev->dev, irq, mchp_corei2c_isr, IRQF_SHARED,
+			       pdev->name, idev);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to claim irq %d\n", irq);
+
+	ret = clk_prepare_enable(idev->i2c_clk);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to enable clock\n");
+
+	ret = mchp_corei2c_init(idev);
+	if (ret) {
+		clk_disable_unprepare(idev->i2c_clk);
+		return dev_err_probe(&pdev->dev, ret, "failed to program clock divider\n");
+	}
+
+	i2c_set_adapdata(&idev->adapter, idev);
+	snprintf(idev->adapter.name, sizeof(idev->adapter.name),
+		 "Microchip I2C hw bus");
+	idev->adapter.owner = THIS_MODULE;
+	idev->adapter.algo = &mchp_corei2c_algo;
+	idev->adapter.dev.parent = &pdev->dev;
+	idev->adapter.dev.of_node = pdev->dev.of_node;
+
+	platform_set_drvdata(pdev, idev);
+
+	ret = i2c_add_adapter(&idev->adapter);
+	if (ret) {
+		clk_disable_unprepare(idev->i2c_clk);
+		return ret;
+	}
+
+	dev_info(&pdev->dev, "Microchip I2C Probe Complete\n");
+
+	return 0;
+}
+
+static int mchp_corei2c_remove(struct platform_device *pdev)
+{
+	struct mchp_corei2c_dev *idev = platform_get_drvdata(pdev);
+
+	clk_disable_unprepare(idev->i2c_clk);
+	i2c_del_adapter(&idev->adapter);
+
+	return 0;
+}
+
+static const struct of_device_id mchp_corei2c_of_match[] = {
+	{ .compatible = "microchip,mpfs-i2c" },
+	{ .compatible = "microchip,corei2c-rtl-v7" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, mchp_corei2c_of_match);
+
+static struct platform_driver mchp_corei2c_driver = {
+	.probe = mchp_corei2c_probe,
+	.remove = mchp_corei2c_remove,
+	.driver = {
+		.name = "microchip-corei2c",
+		.of_match_table = mchp_corei2c_of_match,
+	},
+};
+
+module_platform_driver(mchp_corei2c_driver);
+
+MODULE_DESCRIPTION("Microchip CoreI2C bus driver");
+MODULE_AUTHOR("Daire McNamara <daire.mcnamara@microchip.com>");
+MODULE_AUTHOR("Conor Dooley <conor.dooley@microchip.com>");
+MODULE_LICENSE("GPL v2");
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
