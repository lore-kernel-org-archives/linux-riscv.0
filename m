Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9F8DD44C5E
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 14:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GmtGvXGPd88s8wzt3JD0GnD0KMprOlv0okT7fDstoG0=; b=ydVF+ztNpm6vIy
	BITdkSxy/22bAexsD8n14ZZ4qZE+1uZ8pO4b4ecA5KOkXPfSDTzxxK52OHV5xyBFdiePvrvbLOtzB
	hb0ilRGOSq7WyMbaH0tHk1910Jk4xPvgKtzkOrPsXyA9V/Qb20k2qo49L/N0YuAXwo5Vwh7e4bFI/
	ZoOdVgE27848xFHQhMDjgBclLTNCsQJUPtjqXfpS/bmN1QO20n+/Pc7Ef0IPeCTHVBH6MhGFstnUo
	yKp/okDiY16H2JyrvtjW24Ur4RNEd2tg+bSEuy/xxSGABvIHz/58PPuxXgjBsn3QvIlwuwn7SQ1uK
	6Cu8W66Dybzc4HYP4ApQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgOkD-0000000CXiF-10Rv;
	Thu, 15 Jan 2026 14:54:41 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgOk0-0000000CXa3-3cJv
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jan 2026 14:54:39 +0000
Received: from mail.andestech.com (ATCPCS31.andestech.com [10.0.1.89])
	by Atcsqr.andestech.com with ESMTPS id 60FEqngt039399
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Jan 2026 22:52:49 +0800 (+08)
	(envelope-from ben717@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS31.andestech.com
 (10.0.1.89) with Microsoft SMTP Server id 14.3.498.0; Thu, 15 Jan 2026
 22:52:49 +0800
From: Ben Zong-You Xie <ben717@andestech.com>
To: 
CC: <andi.shyti@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>, <linux-riscv@lists.infradead.org>,
        Ben Zong-You Xie
	<ben717@andestech.com>
Subject: [PATCH 2/4] drivers: i2c: add the driver for Andes I2C controller
Date: Thu, 15 Jan 2026 22:52:42 +0800
Message-ID: <20260115145244.435890-3-ben717@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260115145244.435890-1-ben717@andestech.com>
References: <20260115145244.435890-1-ben717@andestech.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-DKIM-Results: atcpcs31.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 60FEqngt039399
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_065429_293464_712F39F8 
X-CRM114-Status: GOOD (  29.25  )
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

Add the driver for Andes I2C controller.

Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
---
 drivers/i2c/busses/Kconfig         |  10 +
 drivers/i2c/busses/Makefile        |   1 +
 drivers/i2c/busses/i2c-atciic100.c | 353 +++++++++++++++++++++++++++++
 3 files changed, 364 insertions(+)
 create mode 100644 drivers/i2c/busses/i2c-atciic100.c

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 860812e224a0..c0fc6c0a7197 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -446,6 +446,16 @@ config I2C_AT91_SLAVE_EXPERIMENTAL
 	    - There are some mismatches with a SAMA5D4 as slave and a SAMA5D2 as
 	    master.
 
+config I2C_ATCIIC100
+	tristate "Andes I2C Controller"
+	depends on ARCH_ANDES || COMPILE_TEST
+	help
+	  If you say yes to this option, support will be included for the
+	  Andes I2C controller.
+
+	  This support is also available as a module. If so, the module
+	  will be called i2c-atciic100.
+
 config I2C_AU1550
 	tristate "Au1550/Au1200/Au1300 SMBus interface"
 	depends on MIPS_ALCHEMY
diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
index 547123ab351f..7d48e0cb5a6d 100644
--- a/drivers/i2c/busses/Makefile
+++ b/drivers/i2c/busses/Makefile
@@ -41,6 +41,7 @@ obj-$(CONFIG_I2C_ASPEED)	+= i2c-aspeed.o
 obj-$(CONFIG_I2C_AT91)		+= i2c-at91.o
 i2c-at91-y			:= i2c-at91-core.o i2c-at91-master.o
 i2c-at91-$(CONFIG_I2C_AT91_SLAVE_EXPERIMENTAL)	+= i2c-at91-slave.o
+obj-$(CONFIG_I2C_ATCIIC100)	+= i2c-atciic100.o
 obj-$(CONFIG_I2C_AU1550)	+= i2c-au1550.o
 obj-$(CONFIG_I2C_AXXIA)		+= i2c-axxia.o
 obj-$(CONFIG_I2C_BCM2835)	+= i2c-bcm2835.o
diff --git a/drivers/i2c/busses/i2c-atciic100.c b/drivers/i2c/busses/i2c-atciic100.c
new file mode 100644
index 000000000000..c6a7ee90425d
--- /dev/null
+++ b/drivers/i2c/busses/i2c-atciic100.c
@@ -0,0 +1,353 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Driver for Andes I2C controller, used in Andes AE350 platform and QiLai SoC
+ *
+ * Copyright (C) 2026 Andes Technology Corporation.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/completion.h>
+#include <linux/iopoll.h>
+#include <linux/i2c.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/spinlock.h>
+
+#define ATCIIC100_ID_REG		0x0
+#define ATCIIC100_ID_MASK		GENMASK(31, 8)
+#define ATCIIC100_ID			0x020210
+
+#define	ATCIIC100_CFG_REG		0x10
+#define ATCIIC100_CFG_FIFOSIZE		GENMASK(1, 0)
+
+#define	ATCIIC100_INTEN_REG		0x14
+#define	ATCIIC100_INTEN_FIFO_EMPTY	BIT(0)
+#define	ATCIIC100_INTEN_FIFO_FULL	BIT(1)
+#define	ATCIIC100_INTEN_CMPL		BIT(9)
+
+#define	ATCIIC100_STATUS_REG		0x18
+#define ATCIIC100_STATUS_FIFO_EMPTY	BIT(0)
+#define ATCIIC100_STATUS_FIFO_FULL	BIT(1)
+#define ATCIIC100_STATUS_ADDR_HIT	BIT(3)
+#define ATCIIC100_STATUS_CMPL		BIT(9)
+#define ATCIIC100_STATUS_W1C		GENMASK(9, 3)
+
+#define	ATCIIC100_ADDR_REG		0x1C
+
+#define	ATCIIC100_DATA_REG		0x20
+
+#define	ATCIIC100_CTRL_REG		0x24
+#define ATCIIC100_CTRL_DATA_CNT		GENMASK(7, 0)
+#define ATCIIC100_CTRL_DIR		BIT(8)
+#define ATCIIC100_CTRL_PHASE		GENMASK(12, 9)
+
+#define	ATCIIC100_CMD_REG		0x28
+#define ATCIIC100_CMD_ACTION		GENMASK(2, 0)
+#define ATCIIC100_CMD_TRANS		BIT(0)
+
+#define	ATCIIC100_SETUP_REG		0x2C
+#define ATCIIC100_SETUP_IICEN		BIT(0)
+#define ATCIIC100_SETUP_REQ		BIT(2)
+
+#define ATCIIC100_TPM_REG		0x30
+
+#define ATCIIC100_TIMEOUT_US		400000
+#define ATCIIC100_TIMEOUT		usecs_to_jiffies(ATCIIC100_TIMEOUT_US)
+
+#define ATCIIC100_MAX_DATA_LEN		256
+
+struct atciic100 {
+	struct i2c_adapter adap;
+	struct completion completion;
+	spinlock_t lock;
+	struct regmap *map;
+	u8 *buf;
+	unsigned int fifo_size;
+	int irq;
+	u16 buf_len;
+	bool addr_hit;
+	bool xfer_done;
+};
+
+static const struct regmap_config atciic100_regmap_config = {
+	.name = "atciic100",
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.pad_bits = 0,
+	.max_register = ATCIIC100_TPM_REG,
+	.cache_type = REGCACHE_NONE,
+};
+
+static void atciic100_xfer_common(struct atciic100 *i2c, u32 status)
+{
+	unsigned long flags;
+	unsigned int fsize = i2c->fifo_size;
+	unsigned int val;
+
+	spin_lock_irqsave(&i2c->lock, flags);
+	if (status & ATCIIC100_STATUS_FIFO_EMPTY) {
+		/* Disable the FIFO empty interrupt for the last write */
+		if (i2c->buf_len <= fsize) {
+			fsize = i2c->buf_len;
+			regmap_clear_bits(i2c->map, ATCIIC100_INTEN_REG,
+					  ATCIIC100_INTEN_FIFO_EMPTY);
+		}
+
+		while (fsize--) {
+			val = *i2c->buf++;
+			regmap_write(i2c->map, ATCIIC100_DATA_REG, val);
+			i2c->buf_len--;
+		}
+	} else if (status & ATCIIC100_STATUS_FIFO_FULL) {
+		while (fsize--) {
+			regmap_read(i2c->map, ATCIIC100_DATA_REG, &val);
+			*i2c->buf++ = (u8)val;
+			i2c->buf_len--;
+		}
+	}
+
+	if (status & ATCIIC100_STATUS_CMPL) {
+		i2c->xfer_done = true;
+		if (status & ATCIIC100_STATUS_ADDR_HIT)
+			i2c->addr_hit = true;
+
+		/* Write 1 to clear the status */
+		regmap_set_bits(i2c->map, ATCIIC100_STATUS_REG,
+				ATCIIC100_STATUS_W1C);
+
+		/* For the last read, retrieve all remaining data in FIFO. */
+		while (i2c->buf_len > 0) {
+			regmap_read(i2c->map, ATCIIC100_DATA_REG, &val);
+			*i2c->buf++ = (u8)val;
+			i2c->buf_len--;
+		}
+	}
+
+	spin_unlock_irqrestore(&i2c->lock, flags);
+}
+
+static irqreturn_t atciic100_irq_handler(int irq, void *data)
+{
+	struct atciic100 *i2c = data;
+	u32 i2c_status;
+
+	regmap_read(i2c->map, ATCIIC100_STATUS_REG, &i2c_status);
+	atciic100_xfer_common(i2c, i2c_status);
+	if (i2c->xfer_done)
+		complete(&i2c->completion);
+
+	return IRQ_HANDLED;
+}
+
+static int atciic100_xfer_wait(struct atciic100 *i2c, struct i2c_msg *msg)
+{
+	unsigned int mask;
+	unsigned int i2c_ctrl;
+
+	/*
+	 * Set the data count. If there are 256 bytes to be transmitted, write
+	 * zero to the data count field.
+	 */
+	regmap_update_bits(i2c->map, ATCIIC100_CTRL_REG,
+			   ATCIIC100_CTRL_DATA_CNT,
+			   FIELD_PREP(ATCIIC100_CTRL_DATA_CNT, i2c->buf_len));
+
+	regmap_set_bits(i2c->map, ATCIIC100_CTRL_REG, ATCIIC100_CTRL_PHASE);
+	if (msg->flags & I2C_M_RD)
+		regmap_set_bits(i2c->map, ATCIIC100_CTRL_REG,
+				ATCIIC100_CTRL_DIR);
+	else
+		regmap_clear_bits(i2c->map, ATCIIC100_CTRL_REG,
+				  ATCIIC100_CTRL_DIR);
+
+	regmap_write(i2c->map, ATCIIC100_ADDR_REG, msg->addr);
+
+	if (i2c->irq >= 0) {
+		mask = ATCIIC100_INTEN_CMPL;
+		mask |= (msg->flags & I2C_M_RD) ? ATCIIC100_INTEN_FIFO_FULL
+						: ATCIIC100_INTEN_FIFO_EMPTY;
+		regmap_set_bits(i2c->map, ATCIIC100_INTEN_REG, mask);
+	}
+
+	regmap_set_bits(i2c->map, ATCIIC100_CMD_REG, ATCIIC100_CMD_TRANS);
+	if (i2c->irq >= 0) {
+		unsigned long time_left;
+
+		time_left = wait_for_completion_timeout(&i2c->completion,
+							ATCIIC100_TIMEOUT);
+		if (!time_left)
+			return -ETIMEDOUT;
+
+		if (!i2c->addr_hit)
+			return -ENXIO;
+
+		regmap_write(i2c->map, ATCIIC100_INTEN_REG, 0);
+		reinit_completion(&i2c->completion);
+	} else {
+		unsigned int val;
+		int ret;
+
+		mask = ATCIIC100_STATUS_CMPL;
+		mask |= (msg->flags & I2C_M_RD) ? ATCIIC100_STATUS_FIFO_FULL
+						: ATCIIC100_STATUS_FIFO_EMPTY;
+		while (!i2c->xfer_done) {
+			ret = regmap_read_poll_timeout(i2c->map,
+						       ATCIIC100_STATUS_REG,
+						       val, val & mask, 2000,
+						       ATCIIC100_TIMEOUT_US);
+			if (ret)
+				return ret;
+
+			atciic100_xfer_common(i2c, val);
+		}
+
+		if (!i2c->addr_hit)
+			return -ENXIO;
+	}
+
+	/* Check if all data is successfully transmitted */
+	regmap_read(i2c->map, ATCIIC100_CTRL_REG, &i2c_ctrl);
+	if (FIELD_GET(ATCIIC100_CTRL_DATA_CNT, i2c_ctrl))
+		return -EIO;
+
+	return 0;
+}
+
+static int atciic100_xfer(struct i2c_adapter *adap, struct i2c_msg *msg,
+			  int num)
+{
+	int i;
+	struct i2c_msg *m;
+	struct atciic100 *i2c = i2c_get_adapdata(adap);
+	int ret;
+
+	for (i = 0; i < num; i++) {
+		m = &msg[i];
+		i2c->addr_hit = false;
+		i2c->buf = m->buf;
+		i2c->buf_len = m->len;
+		i2c->xfer_done = false;
+		ret = atciic100_xfer_wait(i2c, m);
+		if (ret < 0)
+			return ret;
+	}
+
+	return num;
+}
+
+static u32 atciic100_func(struct i2c_adapter *adap)
+{
+	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
+}
+
+static struct i2c_algorithm atciic100_algo = {
+	.xfer = atciic100_xfer,
+	.functionality = atciic100_func,
+};
+
+static const struct i2c_adapter_quirks atciic100_quirks = {
+	.flags = I2C_AQ_NO_ZERO_LEN,
+	.max_write_len = ATCIIC100_MAX_DATA_LEN,
+	.max_read_len = ATCIIC100_MAX_DATA_LEN,
+};
+
+static int atciic100_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct atciic100 *i2c;
+	void __iomem *reg_base;
+	u32 i2c_id;
+	int ret;
+	struct i2c_adapter *adap;
+
+	i2c = devm_kzalloc(dev, sizeof(*i2c), GFP_KERNEL);
+	if (!i2c)
+		return -ENOMEM;
+
+	reg_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(reg_base))
+		return dev_err_probe(dev, PTR_ERR(reg_base),
+				     "failed to map I/O space\n");
+
+	i2c->map = devm_regmap_init_mmio(dev, reg_base,
+					 &atciic100_regmap_config);
+	if (IS_ERR(i2c->map))
+		return dev_err_probe(dev, PTR_ERR(i2c->map),
+				     "failed to initialize regmap\n");
+
+	regmap_read(i2c->map, ATCIIC100_ID_REG, &i2c_id);
+	if (FIELD_GET(ATCIIC100_ID_MASK, i2c_id) != ATCIIC100_ID)
+		return dev_err_probe(dev, -ENODEV, "unmatched hardware ID 0x%x\n",
+				     i2c_id);
+
+	i2c->irq = platform_get_irq(pdev, 0);
+	if (i2c->irq >= 0) {
+		ret = devm_request_irq(dev, i2c->irq, atciic100_irq_handler, 0,
+				       dev_name(dev), i2c);
+		if (ret < 0)
+			return dev_err_probe(dev, ret, "unable to request IRQ %d\n",
+					     i2c->irq);
+	} else {
+		dev_warn(dev, "no IRQ resource, falling back to poll mode\n");
+	}
+
+	spin_lock_init(&i2c->lock);
+	init_completion(&i2c->completion);
+	adap = &i2c->adap;
+	strscpy(adap->name, pdev->name, sizeof(adap->name));
+	adap->algo = &atciic100_algo;
+	adap->class = I2C_CLASS_HWMON;
+	adap->dev.parent = dev;
+	adap->dev.of_node = dev->of_node;
+	adap->owner = THIS_MODULE;
+	adap->quirks = &atciic100_quirks;
+	adap->retries = 1;
+	adap->timeout = ATCIIC100_TIMEOUT;
+	i2c_set_adapdata(adap, i2c);
+	platform_set_drvdata(pdev, i2c);
+	ret = devm_i2c_add_adapter(dev, adap);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to add adapter\n");
+
+	regmap_read(i2c->map, ATCIIC100_CFG_REG, &i2c->fifo_size);
+	i2c->fifo_size = 2 << FIELD_GET(ATCIIC100_CFG_FIFOSIZE, i2c->fifo_size);
+
+	/* Configure ATCIIC100 as a controller and enable it */
+	regmap_set_bits(i2c->map, ATCIIC100_SETUP_REG,
+			ATCIIC100_SETUP_IICEN | ATCIIC100_SETUP_REQ);
+	return 0;
+}
+
+static const struct of_device_id atciic100_of_match[] = {
+	{ .compatible = "andestech,atciic100" },
+	{ /* sentinel */ }
+};
+
+MODULE_DEVICE_TABLE(of, atciic100_of_match);
+
+static struct platform_driver atciic100_platform_driver = {
+	.driver = {
+		.name = "atciic100",
+		.of_match_table	= atciic100_of_match,
+	},
+	.probe = atciic100_probe,
+};
+
+/* I2C may be needed to bring up other drivers */
+static int __init atciic100_init_driver(void)
+{
+	return platform_driver_register(&atciic100_platform_driver);
+}
+subsys_initcall(atciic100_init_driver);
+
+static void __exit atciic100_exit_driver(void)
+{
+	platform_driver_unregister(&atciic100_platform_driver);
+}
+module_exit(atciic100_exit_driver);
+
+MODULE_AUTHOR("Ben Zong-You Xie <ben717@andestech.com>");
+MODULE_DESCRIPTION("Andes I2C controller driver");
+MODULE_LICENSE("GPL");
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
