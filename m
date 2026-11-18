Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67AF3606A331
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 08:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RBOS7O2j;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=voT9lWHO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Mime-Version:Message-Id:
	From:To:Date:Subject:Cc:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vOssKWL8KMDtFcafYLVRoTzUpABV04s4bipJvlTqc6c=; b=RBOS7O2j1+zw+fNHMzpqNREula
	jxle0rpgbCrV9TUjoNfiztZS6A9HDIWN5XLHidpOLAgSilmHJMRCb9fHlF+kN6PIUS0HJq/4Itdjj
	B2+taE4M8PIIywsm2i4x/xLj1rpSM1D0cLfOocIzYUWUdooktQQgPNgFViuGcw39IWplgtnme+kz2
	zumX4FoZ6rPg0wv8iu/O/UmbC4rfPGJnTFjZOKl4XFnqJY+I4bTnEDIk9lML0GuLfDcn+RDrSPgJc
	dvjkLoA7cumBUOMNOEF89in/IjZbIjSJTxWhuH583CKuSbtwWx/46WfuidzirQjLmEDl8R/rwgEJs
	n16nR8NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTbUb-00000008Ffg-3Yrd;
	Wed, 18 Nov 2026 08:58:13 +0000
Received: from va-2-55.ptr.blmpb.com ([209.127.231.55])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTbUW-00000008FZw-1HH3
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 08:58:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1794992283;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=XQX1cRghhwWoZ6tqBwATGaWp4YUW0rgfuI9XQxe2P+k=;
 b=voT9lWHOaown/vi4Be0WO2JSxZOocSNJaMj+NBv5D5kIwVqlYvBv/FPBl3Ax6kifolf/Ph
 pleFUOwhURV7JBhHeSflucsl/knSCLPqMESkjJipwgnfatoQ+o1XfTyGFKfL8ZbOZG/DgS
 RPmtH50YA2RG7IpCpIeWmN9CRcYCTB2wCXMtxaxs6ka9Pz9l/Hzk/HYgb8IWiJ0Y3zGluz
 UmkNswkFn5qkwaOvLcX+Dt9wUF0Yc4vL+DR79w8MCfUpW4W/zI5nd11p/Wxzw1Dp36d1fw
 qj4aKGbjN7O8MHXuDIUT3r4UeQskjUiuLgmH1H97Dz9PkulLefkJXtt7ZwdUYQ==
References: <20261118085742.1817536-1-yang.wang@deepcomputing.io>
Cc: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Tzung-Bi Shih" <tzungbi@kernel.org>, 
	"Guenter Roeck" <groeck@chromium.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Paul Walmsley" <pjw@kernel.org>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>, <devicetree@vger.kernel.org>, 
	<chrome-platform@lists.linux.dev>, <linux-riscv@lists.infradead.org>, 
	<spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 3/9] bus: Add SpacemiT K3 eSPI controller support
Date: Wed, 18 Nov 2026 16:57:36 +0800
X-Mailer: git-send-email 2.43.0
To: "Yixun Lan" <dlan@kernel.org>, "Benson Leung" <bleung@chromium.org>
From: "Wang Yang" <yang.wang@deepcomputing.io>
Message-Id: <20261118085742.1817536-4-yang.wang@deepcomputing.io>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-Lms-Return-Path: <lba+26afd6899+b61c37+lists.infradead.org+yang.wang@deepcomputing.io>
Received: from ubuntu.. ([183.23.101.74]) by smtp.feishu.cn with ESMTPS; Wed, 18 Nov 2026 16:57:59 +0800
In-Reply-To: <20261118085742.1817536-1-yang.wang@deepcomputing.io>
X-Original-From: Wang Yang <yang.wang@deepcomputing.io>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_005809_218663_4D8A68C8 
X-CRM114-Status: GOOD (  20.40  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Initialize and recover the K3 eSPI peripheral channel before populating
its children. Keep controller register programming, clock and reset
handling in the controller driver rather than in the EC transport.

Port the existing vendor-derived implementation separately from the EC
client. The controller logic comes from the vendor BSP at revision
29b78afb484b, authored by goumin <min.gou@spacemit.com>. Preserve its
register programming and link-recovery behavior.

No matching SpacemiT eSPI submission was found in the archived SPI,
RISC-V and Chrome platform searches used for this port.

Prepared with Codex assistance from the existing DC-linux EC support.

Signed-off-by: Wang Yang <yang.wang@deepcomputing.io>
---
 drivers/bus/Kconfig              |  10 +
 drivers/bus/Makefile             |   1 +
 drivers/bus/spacemit-k3-espi.c   | 804 +++++++++++++++++++++++++++++++
 include/linux/spacemit-k3-espi.h |  20 +
 4 files changed, 835 insertions(+)
 create mode 100644 drivers/bus/spacemit-k3-espi.c
 create mode 100644 include/linux/spacemit-k3-espi.h

diff --git a/drivers/bus/Kconfig b/drivers/bus/Kconfig
index e4b1db809..35b00c9ba 100644
--- a/drivers/bus/Kconfig
+++ b/drivers/bus/Kconfig
@@ -149,6 +149,16 @@ config STM32_DBG_BUS
 	  platforms when the debug configuration is not accessible by the
 	  normal world.
 
+config SPACEMIT_ESPI_BUS
+	bool "SpacemiT K3 eSPI controller"
+	depends on OF && HAS_IOMEM
+	depends on ARCH_SPACEMIT || COMPILE_TEST
+	help
+	  Enable the SpacemiT K3 eSPI controller, including clock and reset
+	  management, link initialization and recovery after an EC reboot.
+	  Child devices can use its peripheral shared-memory window.
+	  Say Y here to use the EC keyboard on DeepComputing FML13V05.
+
 config STM32_FIREWALL
 	bool "STM32 Firewall framework"
 	depends on (ARCH_STM32 || COMPILE_TEST) && OF
diff --git a/drivers/bus/Makefile b/drivers/bus/Makefile
index a01f97fef..cc46cfc68 100644
--- a/drivers/bus/Makefile
+++ b/drivers/bus/Makefile
@@ -26,6 +26,7 @@ obj-$(CONFIG_OMAP_OCP2SCP)	+= omap-ocp2scp.o
 obj-$(CONFIG_QCOM_EBI2)		+= qcom-ebi2.o
 obj-$(CONFIG_QCOM_SSC_BLOCK_BUS)	+= qcom-ssc-block-bus.o
 obj-$(CONFIG_STM32_DBG_BUS)	+= stm32_dbg_bus.o
+obj-$(CONFIG_SPACEMIT_ESPI_BUS) += spacemit-k3-espi.o
 obj-$(CONFIG_STM32_FIREWALL)	+= stm32_firewall.o stm32_rifsc.o stm32_etzpc.o
 obj-$(CONFIG_SUN50I_DE2_BUS)	+= sun50i-de2.o
 obj-$(CONFIG_SUNXI_RSB)		+= sunxi-rsb.o
diff --git a/drivers/bus/spacemit-k3-espi.c b/drivers/bus/spacemit-k3-espi.c
new file mode 100644
index 000000000..b511b164b
--- /dev/null
+++ b/drivers/bus/spacemit-k3-espi.c
@@ -0,0 +1,804 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * SpacemiT K3 eSPI controller driver
+ *
+ * This driver owns controller-level initialization and recovery so child
+ * devices such as cros_ec_espi can treat the peripheral shared memory window
+ * as a transport and ask the parent controller to recover the link when the
+ * EC reboots underneath Linux.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/reset.h>
+#include <linux/sizes.h>
+#include <linux/spacemit-k3-espi.h>
+#include <linux/wordpart.h>
+
+#define ESPI_DN_TXHDR			0x00
+#define ESPI_DN_TXDATA_PORT		0x0c
+#define ESPI_MASTER_CAP			0x2c
+#define ESPI_GLOBAL_CONTROL_0		0x30
+#define ESPI_GLOBAL_CONTROL_1		0x34
+#define ESPI_PR_BASE_ADDR_MEM0		0x38
+#define ESPI_PR_BASE_ADDR_MEM1		0x3c
+#define ESPI_SLAVE0_CONFIG		0x68
+#define ESPI_SLAVE0_INT_EN		0x6c
+#define ESPI_SLAVE0_INT_STS		0x70
+
+#define ESPI_DNCMD_TYPE_MASK		GENMASK(2, 0)
+#define ESPI_DNCMD_EN			BIT(3)
+#define ESPI_DNCMD_SLAVE_SEL_MASK	GENMASK(5, 4)
+
+#define ESPI_DNCMD_SET_CONFIGURATION	0x00
+#define ESPI_DNCMD_GET_CONFIGURATION	0x01
+#define ESPI_DNCMD_IN_BAND_RESET	0x02
+
+#define ESPI_FLASH_REQ_INT		BIT(31)
+#define ESPI_RXOOB_INT			BIT(30)
+#define ESPI_RXMSG_INT			BIT(29)
+#define ESPI_DNCMD_INT			BIT(28)
+#define ESPI_RXVW_GRP3_INT		BIT(27)
+#define ESPI_RXVW_GRP2_INT		BIT(26)
+#define ESPI_RXVW_GRP1_INT		BIT(25)
+#define ESPI_RXVW_GRP0_INT		BIT(24)
+#define ESPI_PROTOCOL_ERR_INT		BIT(15)
+#define ESPI_RXFLASH_OFLOW_INT		BIT(14)
+#define ESPI_RXMSG_OFLOW_INT		BIT(13)
+#define ESPI_RXOOB_OFLOW_INT		BIT(12)
+#define ESPI_ILLEGAL_LEN_INT		BIT(11)
+#define ESPI_ILLEGAL_TAG_INT		BIT(10)
+#define ESPI_UNSUCSS_CPL_INT		BIT(9)
+#define ESPI_INVALID_CT_RSP_INT		BIT(8)
+#define ESPI_UNKNOWN_RSP_INT		BIT(7)
+#define ESPI_NON_FATAL_INT		BIT(6)
+#define ESPI_FATAL_ERR_INT		BIT(5)
+#define ESPI_NO_RSP_INT			BIT(4)
+#define ESPI_CRC_ERR_INT		BIT(2)
+#define ESPI_WAIT_TIMEOUT_INT		BIT(1)
+#define ESPI_BUS_ERR_INT		BIT(0)
+
+#define ESPI_CALLBACK_INT		(ESPI_FLASH_REQ_INT | \
+					 ESPI_RXOOB_INT | \
+					 ESPI_RXMSG_INT | \
+					 ESPI_DNCMD_INT | \
+					 ESPI_RXVW_GRP3_INT | \
+					 ESPI_RXVW_GRP2_INT | \
+					 ESPI_RXVW_GRP1_INT | \
+					 ESPI_RXVW_GRP0_INT)
+#define ESPI_PROTOCOL_INT		(ESPI_PROTOCOL_ERR_INT | \
+					 ESPI_RXFLASH_OFLOW_INT | \
+					 ESPI_RXMSG_OFLOW_INT | \
+					 ESPI_RXOOB_OFLOW_INT | \
+					 ESPI_ILLEGAL_LEN_INT | \
+					 ESPI_ILLEGAL_TAG_INT | \
+					 ESPI_UNSUCSS_CPL_INT | \
+					 ESPI_INVALID_CT_RSP_INT | \
+					 ESPI_UNKNOWN_RSP_INT | \
+					 ESPI_CRC_ERR_INT | \
+					 ESPI_WAIT_TIMEOUT_INT | \
+					 ESPI_BUS_ERR_INT)
+#define ESPI_RESPONSE_INT		(ESPI_NON_FATAL_INT | \
+					 ESPI_FATAL_ERR_INT | \
+					 ESPI_NO_RSP_INT)
+#define ESPI_ALL_INT			(ESPI_CALLBACK_INT | \
+					 ESPI_PROTOCOL_INT | \
+					 ESPI_RESPONSE_INT)
+
+#define ESPI_MST_STOP_EN		BIT(3)
+#define ESPI_CONTROL_WATCHDOG_EN	BIT(0)
+#define ESPI_CONTROL_WATCHDOG_CNT_MASK	GENMASK(23, 8)
+
+#define ESPI_CRC_CHECK_EN		BIT(31)
+#define ESPI_ALERT_MODE_SEL		BIT(30)
+#define ESPI_IO_MODE_SEL_MASK		GENMASK(29, 28)
+#define ESPI_CLK_FREQ_SEL_MASK		GENMASK(27, 25)
+#define ESPI_PR_CHANNEL_ENABLE		BIT(3)
+#define ESPI_VW_CHANNEL_ENABLE		BIT(2)
+#define ESPI_OOB_CHANNEL_ENABLE		BIT(1)
+#define ESPI_FLASH_CHANNEL_ENABLE	BIT(0)
+
+#define ESPI_ESPI_RSTN			BIT(5)
+#define ESPI_SW_RST			BIT(0)
+
+#define ESPI_SLAVE_GEN_CFG		0x08
+#define ESPI_SLAVE_PERI_CFG		0x10
+#define ESPI_SLAVE_VWIRE_CFG		0x20
+#define ESPI_SLAVE_OOB_CFG		0x30
+#define ESPI_SLAVE_FLASH_CFG		0x40
+
+#define ESPI_GEN_CRC_ENABLE		BIT(31)
+#define ESPI_GEN_ALERT_MODE_PIN		BIT(28)
+#define ESPI_GEN_IO_MODE_SUP_MASK	GENMASK(25, 24)
+#define ESPI_GEN_OPEN_DRAIN_ALERT_SEL	BIT(23)
+#define ESPI_GEN_OPEN_DRAIN_ALERT_SUP	BIT(19)
+#define ESPI_GEN_OP_FREQ_SUP_MASK	GENMASK(18, 16)
+#define ESPI_GEN_OP_FREQ_SEL_MASK	GENMASK(22, 20)
+#define ESPI_GEN_IO_MODE_SEL_MASK	GENMASK(27, 26)
+#define ESPI_GEN_FLASH_CHAN_SUP		BIT(3)
+#define ESPI_GEN_OOB_CHAN_SUP		BIT(2)
+#define ESPI_GEN_VWIRE_CHAN_SUP		BIT(1)
+#define ESPI_GEN_PERI_CHAN_SUP		BIT(0)
+
+#define ESPI_GEN_IO_MODE_SINGLE		0x0
+#define ESPI_GEN_IO_MODE_DUAL		0x1
+#define ESPI_GEN_IO_MODE_QUAD		0x2
+
+#define ESPI_GEN_OP_FREQ_20MHZ		0x0
+#define ESPI_GEN_OP_FREQ_25MHZ		0x1
+#define ESPI_GEN_OP_FREQ_33MHZ		0x2
+#define ESPI_GEN_OP_FREQ_50MHZ		0x3
+#define ESPI_GEN_OP_FREQ_66MHZ		0x4
+
+#define ESPI_ENABLE_PR_CHANNEL		0x1115
+#define ESPI_ENABLE_VW_CHANNEL		0x70701
+#define ESPI_ENABLE_OOB_CHANNEL		0x111
+#define ESPI_ENABLE_FLASH_CHANNEL	0x11125
+
+#define ESPI_CFG_TIMEOUT_US		50000
+#define ESPI_TX_IDLE_TIMEOUT_US		1000
+
+#define SPACEMIT_ESPI_DEFAULT_FREQ_MHZ	20
+#define SPACEMIT_ESPI_DEFAULT_WDT	0xffff
+
+struct spacemit_espi {
+	struct device *dev;
+	struct clk_bulk_data *clks;
+	int num_clks;
+	struct clk *sclk;
+	struct reset_control *resets;
+	bool clocks_enabled;
+	void __iomem *regs;
+	u32 pr_mem_base0;
+	u32 pr_mem_base1;
+	u32 op_freq_mhz;
+	u32 watchdog_timeout;
+	u32 io_mode;
+	bool alert_pin_mode;
+	bool alert_open_drain;
+	bool crc_enable;
+	bool enable_peri;
+	bool enable_vwire;
+	bool enable_oob;
+	bool enable_flash;
+	bool auto_gating;
+	bool initialized;
+	bool slave_ready;
+	/* Serialize controller setup, PM and EC-triggered link recovery. */
+	struct mutex lock;
+};
+
+static bool spacemit_espi_property_enabled(struct device_node *np,
+					   const char *name, bool default_value)
+{
+	if (of_find_property(np, name, NULL))
+		return of_property_read_bool(np, name);
+
+	return default_value;
+}
+
+static u32 spacemit_espi_txhdr_reg(unsigned int index)
+{
+	return ESPI_DN_TXHDR + ((index + 1) & ~0x3);
+}
+
+static u32 spacemit_espi_txhdr_shift(unsigned int index)
+{
+	return ((index + 1) & 0x3) * 8;
+}
+
+static void spacemit_espi_write_hdr(struct spacemit_espi *espi, unsigned int index,
+				    u8 value)
+{
+	u32 reg = spacemit_espi_txhdr_reg(index);
+	u32 shift = spacemit_espi_txhdr_shift(index);
+	u32 data;
+
+	data = readl(espi->regs + reg);
+	data &= ~(GENMASK(7, 0) << shift);
+	data |= (u32)value << shift;
+	writel(data, espi->regs + reg);
+}
+
+static u8 spacemit_espi_read_hdr(struct spacemit_espi *espi, unsigned int index)
+{
+	u32 reg = spacemit_espi_txhdr_reg(index);
+	u32 shift = spacemit_espi_txhdr_shift(index);
+
+	return (readl(espi->regs + reg) >> shift) & 0xff;
+}
+
+static void spacemit_espi_trigger_cmd(struct spacemit_espi *espi, u32 cmd_type)
+{
+	u32 val;
+
+	val = readl(espi->regs + ESPI_DN_TXHDR);
+	val &= ~(ESPI_DNCMD_TYPE_MASK | ESPI_DNCMD_EN |
+		 ESPI_DNCMD_SLAVE_SEL_MASK);
+	val |= FIELD_PREP(ESPI_DNCMD_TYPE_MASK, cmd_type);
+	val |= ESPI_DNCMD_EN;
+	writel(val, espi->regs + ESPI_DN_TXHDR);
+}
+
+static int spacemit_espi_wait_tx_idle(struct spacemit_espi *espi)
+{
+	unsigned int timeout = ESPI_TX_IDLE_TIMEOUT_US;
+
+	do {
+		if (!(readl(espi->regs + ESPI_DN_TXHDR) & ESPI_DNCMD_EN))
+			return 0;
+		udelay(1);
+	} while (--timeout);
+
+	return -EBUSY;
+}
+
+static int spacemit_espi_poll_status(struct spacemit_espi *espi, u32 expected)
+{
+	unsigned int timeout = ESPI_CFG_TIMEOUT_US / 10;
+	u32 status;
+
+	writel(expected, espi->regs + ESPI_SLAVE0_INT_STS);
+
+	do {
+		status = readl(espi->regs + ESPI_SLAVE0_INT_STS);
+		if (!status) {
+			fsleep(10);
+			continue;
+		}
+
+		writel(status, espi->regs + ESPI_SLAVE0_INT_STS);
+
+		if (status & expected)
+			return 0;
+
+		if (status & (ESPI_PROTOCOL_INT | ESPI_RESPONSE_INT))
+			return -EIO;
+
+		fsleep(10);
+	} while (--timeout);
+
+	return -ETIMEDOUT;
+}
+
+static int spacemit_espi_cmd_get_config(struct spacemit_espi *espi, u16 addr, u32 *value)
+{
+	int ret;
+
+	spacemit_espi_write_hdr(espi, 0, 0);
+	spacemit_espi_write_hdr(espi, 1, addr >> 8);
+	spacemit_espi_write_hdr(espi, 2, addr);
+	spacemit_espi_trigger_cmd(espi, ESPI_DNCMD_GET_CONFIGURATION);
+
+	ret = spacemit_espi_poll_status(espi, ESPI_DNCMD_INT);
+	if (ret)
+		return ret;
+
+	*value = spacemit_espi_read_hdr(espi, 3);
+	*value |= (u32)spacemit_espi_read_hdr(espi, 4) << 8;
+	*value |= (u32)spacemit_espi_read_hdr(espi, 5) << 16;
+	*value |= (u32)spacemit_espi_read_hdr(espi, 6) << 24;
+
+	return 0;
+}
+
+static int spacemit_espi_cmd_set_config(struct spacemit_espi *espi, u16 addr, u32 value)
+{
+	spacemit_espi_write_hdr(espi, 0, 0);
+	spacemit_espi_write_hdr(espi, 1, addr >> 8);
+	spacemit_espi_write_hdr(espi, 2, addr);
+	spacemit_espi_write_hdr(espi, 3, value);
+	spacemit_espi_write_hdr(espi, 4, value >> 8);
+	spacemit_espi_write_hdr(espi, 5, value >> 16);
+	spacemit_espi_write_hdr(espi, 6, value >> 24);
+	spacemit_espi_trigger_cmd(espi, ESPI_DNCMD_SET_CONFIGURATION);
+
+	return spacemit_espi_poll_status(espi, ESPI_DNCMD_INT);
+}
+
+static void spacemit_espi_enable_irqs(struct spacemit_espi *espi)
+{
+	writel(ESPI_ALL_INT, espi->regs + ESPI_SLAVE0_INT_EN);
+}
+
+static void spacemit_espi_reset_controller(struct spacemit_espi *espi)
+{
+	u32 val;
+
+	val = readl(espi->regs + ESPI_GLOBAL_CONTROL_1);
+	val &= ~ESPI_ESPI_RSTN;
+	writel(val, espi->regs + ESPI_GLOBAL_CONTROL_1);
+
+	val = readl(espi->regs + ESPI_GLOBAL_CONTROL_1);
+	val |= ESPI_ESPI_RSTN | ESPI_SW_RST;
+	writel(val, espi->regs + ESPI_GLOBAL_CONTROL_1);
+}
+
+static void spacemit_espi_send_inband_reset(struct spacemit_espi *espi)
+{
+	spacemit_espi_trigger_cmd(espi, ESPI_DNCMD_IN_BAND_RESET);
+	spacemit_espi_wait_tx_idle(espi);
+	fsleep(1000);
+}
+
+static u32 spacemit_espi_freq_to_sel(u32 mhz)
+{
+	switch (mhz) {
+	case 66:
+		return ESPI_GEN_OP_FREQ_66MHZ;
+	case 50:
+		return ESPI_GEN_OP_FREQ_50MHZ;
+	case 33:
+		return ESPI_GEN_OP_FREQ_33MHZ;
+	case 25:
+		return ESPI_GEN_OP_FREQ_25MHZ;
+	case 20:
+	default:
+		return ESPI_GEN_OP_FREQ_20MHZ;
+	}
+}
+
+static u32 spacemit_espi_build_master_only_config(struct spacemit_espi *espi)
+{
+	u32 cfg = 0;
+
+	if (espi->crc_enable)
+		cfg |= ESPI_GEN_CRC_ENABLE;
+
+	if (espi->alert_pin_mode) {
+		cfg |= ESPI_GEN_ALERT_MODE_PIN;
+		if (espi->alert_open_drain)
+			cfg |= ESPI_GEN_OPEN_DRAIN_ALERT_SEL;
+	}
+
+	cfg |= FIELD_PREP(ESPI_GEN_IO_MODE_SEL_MASK, espi->io_mode);
+	cfg |= FIELD_PREP(ESPI_GEN_OP_FREQ_SEL_MASK,
+			  spacemit_espi_freq_to_sel(espi->op_freq_mhz));
+
+	if (espi->enable_peri)
+		cfg |= ESPI_GEN_PERI_CHAN_SUP;
+	if (espi->enable_vwire)
+		cfg |= ESPI_GEN_VWIRE_CHAN_SUP;
+	if (espi->enable_oob)
+		cfg |= ESPI_GEN_OOB_CHAN_SUP;
+	if (espi->enable_flash)
+		cfg |= ESPI_GEN_FLASH_CHAN_SUP;
+
+	return cfg;
+}
+
+static u32 spacemit_espi_build_negotiated_config(struct spacemit_espi *espi,
+						 u32 slave_caps)
+{
+	u32 cfg = 0;
+	u32 io_mode;
+	u32 freq;
+
+	if (espi->crc_enable)
+		cfg |= ESPI_GEN_CRC_ENABLE;
+
+	if (espi->alert_pin_mode) {
+		cfg |= ESPI_GEN_ALERT_MODE_PIN;
+		if (espi->alert_open_drain &&
+		    (slave_caps & ESPI_GEN_OPEN_DRAIN_ALERT_SUP))
+			cfg |= ESPI_GEN_OPEN_DRAIN_ALERT_SEL;
+	}
+
+	io_mode = min_t(u32, espi->io_mode,
+			FIELD_GET(ESPI_GEN_IO_MODE_SUP_MASK, slave_caps));
+	freq = min_t(u32, spacemit_espi_freq_to_sel(espi->op_freq_mhz),
+		     FIELD_GET(ESPI_GEN_OP_FREQ_SUP_MASK, slave_caps));
+	cfg |= FIELD_PREP(ESPI_GEN_IO_MODE_SEL_MASK, io_mode);
+	cfg |= FIELD_PREP(ESPI_GEN_OP_FREQ_SEL_MASK, freq);
+
+	if (espi->enable_peri && (slave_caps & ESPI_GEN_PERI_CHAN_SUP))
+		cfg |= ESPI_GEN_PERI_CHAN_SUP;
+	if (espi->enable_vwire && (slave_caps & ESPI_GEN_VWIRE_CHAN_SUP))
+		cfg |= ESPI_GEN_VWIRE_CHAN_SUP;
+	if (espi->enable_oob && (slave_caps & ESPI_GEN_OOB_CHAN_SUP))
+		cfg |= ESPI_GEN_OOB_CHAN_SUP;
+	if (espi->enable_flash && (slave_caps & ESPI_GEN_FLASH_CHAN_SUP))
+		cfg |= ESPI_GEN_FLASH_CHAN_SUP;
+
+	return cfg;
+}
+
+static int spacemit_espi_configure_channels(struct spacemit_espi *espi, u32 cfg)
+{
+	int ret;
+
+	if (cfg & ESPI_GEN_PERI_CHAN_SUP) {
+		ret = spacemit_espi_cmd_set_config(espi, ESPI_SLAVE_PERI_CFG,
+						   ESPI_ENABLE_PR_CHANNEL);
+		if (ret)
+			return ret;
+	}
+
+	if (cfg & ESPI_GEN_VWIRE_CHAN_SUP) {
+		ret = spacemit_espi_cmd_set_config(espi, ESPI_SLAVE_VWIRE_CFG,
+						   ESPI_ENABLE_VW_CHANNEL);
+		if (ret)
+			return ret;
+	}
+
+	if (cfg & ESPI_GEN_OOB_CHAN_SUP) {
+		ret = spacemit_espi_cmd_set_config(espi, ESPI_SLAVE_OOB_CFG,
+						   ESPI_ENABLE_OOB_CHANNEL);
+		if (ret)
+			return ret;
+	}
+
+	if (cfg & ESPI_GEN_FLASH_CHAN_SUP) {
+		ret = spacemit_espi_cmd_set_config(espi, ESPI_SLAVE_FLASH_CFG,
+						   ESPI_ENABLE_FLASH_CHANNEL);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static void spacemit_espi_apply_controller_config(struct spacemit_espi *espi, u32 cfg)
+{
+	u32 val;
+	u32 mask = ESPI_CRC_CHECK_EN | ESPI_ALERT_MODE_SEL |
+		   ESPI_IO_MODE_SEL_MASK | ESPI_CLK_FREQ_SEL_MASK |
+		   ESPI_PR_CHANNEL_ENABLE | ESPI_VW_CHANNEL_ENABLE |
+		   ESPI_OOB_CHANNEL_ENABLE | ESPI_FLASH_CHANNEL_ENABLE;
+
+	val = readl(espi->regs + ESPI_SLAVE0_CONFIG);
+	val &= ~mask;
+
+	if (cfg & ESPI_GEN_CRC_ENABLE)
+		val |= ESPI_CRC_CHECK_EN;
+	if (cfg & ESPI_GEN_ALERT_MODE_PIN)
+		val |= ESPI_ALERT_MODE_SEL;
+
+	val |= FIELD_PREP(ESPI_IO_MODE_SEL_MASK,
+			  FIELD_GET(ESPI_GEN_IO_MODE_SEL_MASK, cfg));
+	val |= FIELD_PREP(ESPI_CLK_FREQ_SEL_MASK,
+			  FIELD_GET(ESPI_GEN_OP_FREQ_SEL_MASK, cfg));
+
+	if (cfg & ESPI_GEN_PERI_CHAN_SUP)
+		val |= ESPI_PR_CHANNEL_ENABLE;
+	if (cfg & ESPI_GEN_VWIRE_CHAN_SUP)
+		val |= ESPI_VW_CHANNEL_ENABLE;
+	if (cfg & ESPI_GEN_OOB_CHAN_SUP)
+		val |= ESPI_OOB_CHANNEL_ENABLE;
+	if (cfg & ESPI_GEN_FLASH_CHAN_SUP)
+		val |= ESPI_FLASH_CHANNEL_ENABLE;
+
+	writel(val, espi->regs + ESPI_SLAVE0_CONFIG);
+}
+
+static void spacemit_espi_program_window(struct spacemit_espi *espi)
+{
+	u32 val;
+
+	val = readl(espi->regs + ESPI_GLOBAL_CONTROL_0);
+	val &= ~(ESPI_CONTROL_WATCHDOG_CNT_MASK | ESPI_MST_STOP_EN);
+	val |= ESPI_CONTROL_WATCHDOG_EN;
+	val |= FIELD_PREP(ESPI_CONTROL_WATCHDOG_CNT_MASK,
+			  espi->watchdog_timeout);
+	if (espi->auto_gating)
+		val |= ESPI_MST_STOP_EN;
+	writel(val, espi->regs + ESPI_GLOBAL_CONTROL_0);
+
+	writel(espi->pr_mem_base0, espi->regs + ESPI_PR_BASE_ADDR_MEM0);
+	writel(espi->pr_mem_base1, espi->regs + ESPI_PR_BASE_ADDR_MEM1);
+}
+
+static int spacemit_espi_parse_dt(struct platform_device *pdev,
+				  struct spacemit_espi *espi)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct resource range;
+	const char *str;
+	u32 value;
+	int ret;
+
+	espi->op_freq_mhz = SPACEMIT_ESPI_DEFAULT_FREQ_MHZ;
+	of_property_read_u32(np, "operating-frequency", &espi->op_freq_mhz);
+
+	espi->watchdog_timeout = SPACEMIT_ESPI_DEFAULT_WDT;
+	of_property_read_u32(np, "watchdog-timeout", &espi->watchdog_timeout);
+
+	ret = of_range_to_resource(np, 0, &range);
+	if (!ret)
+		espi->pr_mem_base0 = lower_32_bits(range.start);
+
+	if (!of_property_read_u32(np, "pr-mem-base0", &value))
+		espi->pr_mem_base0 = value;
+
+	if (!espi->pr_mem_base0)
+		dev_warn(dev, "missing PR memory base, shared window recovery may fail\n");
+
+	if (!of_property_read_u32(np, "pr-mem-base1", &value))
+		espi->pr_mem_base1 = value;
+	else if (espi->pr_mem_base0)
+		espi->pr_mem_base1 = espi->pr_mem_base0 + SZ_16M;
+
+	if (!of_property_read_string(np, "io-mode", &str)) {
+		if (!strcmp(str, "quad"))
+			espi->io_mode = ESPI_GEN_IO_MODE_QUAD;
+		else if (!strcmp(str, "dual"))
+			espi->io_mode = ESPI_GEN_IO_MODE_DUAL;
+		else
+			espi->io_mode = ESPI_GEN_IO_MODE_SINGLE;
+	} else {
+		espi->io_mode = ESPI_GEN_IO_MODE_SINGLE;
+	}
+
+	if (!of_property_read_string(np, "alert-mode", &str))
+		espi->alert_pin_mode = !strcmp(str, "pin");
+	else
+		espi->alert_pin_mode = false;
+
+	if (!of_property_read_string(np, "alert-type", &str))
+		espi->alert_open_drain = !strcmp(str, "open-drain");
+	else
+		espi->alert_open_drain = true;
+
+	espi->crc_enable = spacemit_espi_property_enabled(np, "crc-enable", true);
+	espi->enable_peri = spacemit_espi_property_enabled(np,
+							   "peripheral-channel-enable",
+							   true);
+	espi->enable_vwire = spacemit_espi_property_enabled(np,
+							    "vwire-channel-enable",
+							    true);
+	espi->enable_oob = spacemit_espi_property_enabled(np,
+							  "oob-channel-enable",
+							  true);
+	espi->enable_flash = spacemit_espi_property_enabled(np,
+							    "flash-channel-enable",
+							    true);
+	espi->auto_gating = spacemit_espi_property_enabled(np,
+							   "auto-gating-enable",
+							   true);
+
+	return 0;
+}
+
+static int spacemit_espi_enable_clks(struct device *dev, struct spacemit_espi *espi)
+{
+	int ret;
+
+	if (!espi->num_clks || espi->clocks_enabled)
+		return 0;
+
+	ret = clk_bulk_prepare_enable(espi->num_clks, espi->clks);
+	if (ret) {
+		dev_err(dev, "failed to enable clocks: %d\n", ret);
+		return ret;
+	}
+
+	espi->clocks_enabled = true;
+	return 0;
+}
+
+static void spacemit_espi_disable_clks(struct spacemit_espi *espi)
+{
+	if (!espi->num_clks || !espi->clocks_enabled)
+		return;
+
+	clk_bulk_disable_unprepare(espi->num_clks, espi->clks);
+	espi->clocks_enabled = false;
+}
+
+static int spacemit_espi_init_locked(struct spacemit_espi *espi)
+{
+	u32 slave_caps = 0;
+	u32 cfg;
+	int ret;
+
+	/*
+	 * Clear the cached link state before starting a new recovery cycle so
+	 * callers never observe a stale "ready" state after an early failure.
+	 */
+	espi->initialized = false;
+	espi->slave_ready = false;
+
+	ret = spacemit_espi_enable_clks(espi->dev, espi);
+	if (ret)
+		return ret;
+
+	ret = reset_control_deassert(espi->resets);
+	if (ret)
+		return ret;
+
+	if (espi->sclk && !IS_ERR(espi->sclk) && espi->op_freq_mhz) {
+		ret = clk_set_rate(espi->sclk, espi->op_freq_mhz * 1000000UL);
+		if (ret)
+			dev_dbg(espi->dev, "failed to set sclk rate: %d\n", ret);
+	}
+
+	spacemit_espi_enable_irqs(espi);
+	writel(ESPI_ALL_INT, espi->regs + ESPI_SLAVE0_INT_STS);
+
+	spacemit_espi_reset_controller(espi);
+	spacemit_espi_send_inband_reset(espi);
+
+	ret = spacemit_espi_cmd_get_config(espi, ESPI_SLAVE_GEN_CFG, &slave_caps);
+	if (ret) {
+		cfg = spacemit_espi_build_master_only_config(espi);
+		espi->slave_ready = false;
+		dev_warn(espi->dev, "slave capability negotiation failed: %d\n", ret);
+	} else {
+		cfg = spacemit_espi_build_negotiated_config(espi, slave_caps);
+		ret = spacemit_espi_configure_channels(espi, cfg);
+		if (ret) {
+			dev_warn(espi->dev, "channel configuration failed: %d\n", ret);
+			cfg = spacemit_espi_build_master_only_config(espi);
+			espi->slave_ready = false;
+		} else {
+			ret = spacemit_espi_cmd_set_config(espi, ESPI_SLAVE_GEN_CFG, cfg);
+			if (ret) {
+				dev_warn(espi->dev, "general configuration failed: %d\n", ret);
+				cfg = spacemit_espi_build_master_only_config(espi);
+				espi->slave_ready = false;
+			} else {
+				espi->slave_ready = true;
+			}
+		}
+	}
+
+	spacemit_espi_apply_controller_config(espi, cfg);
+	spacemit_espi_program_window(espi);
+	espi->initialized = true;
+
+	dev_dbg(espi->dev, "controller ready, slave_ready=%d master_cap=0x%08x\n",
+		espi->slave_ready,
+		readl(espi->regs + ESPI_MASTER_CAP));
+
+	return 0;
+}
+
+/**
+ * spacemit_k3_espi_recover() - Reinitialize the controller and negotiate the link
+ * @dev: K3 eSPI controller device
+ *
+ * Context: Process context. This function may sleep.
+ * Return: 0 on success or a negative error code.
+ */
+int spacemit_k3_espi_recover(struct device *dev)
+{
+	struct spacemit_espi *espi;
+	int ret;
+
+	if (!dev)
+		return -EINVAL;
+
+	espi = dev_get_drvdata(dev);
+	if (!espi)
+		return -ENODEV;
+
+	mutex_lock(&espi->lock);
+	ret = spacemit_espi_init_locked(espi);
+	mutex_unlock(&espi->lock);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(spacemit_k3_espi_recover);
+
+static void spacemit_espi_cleanup(void *data)
+{
+	struct spacemit_espi *espi = data;
+
+	reset_control_assert(espi->resets);
+	spacemit_espi_disable_clks(espi);
+}
+
+static int spacemit_espi_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct spacemit_espi *espi;
+	struct resource *res;
+	int ret;
+
+	espi = devm_kzalloc(dev, sizeof(*espi), GFP_KERNEL);
+	if (!espi)
+		return -ENOMEM;
+
+	espi->dev = dev;
+	mutex_init(&espi->lock);
+
+	espi->num_clks = devm_clk_bulk_get_all(dev, &espi->clks);
+	if (espi->num_clks < 0)
+		return dev_err_probe(dev, espi->num_clks,
+				     "failed to get clocks\n");
+
+	espi->sclk = devm_clk_get_optional(dev, "sclk");
+	if (IS_ERR(espi->sclk))
+		return dev_err_probe(dev, PTR_ERR(espi->sclk),
+				     "failed to get sclk\n");
+
+	espi->resets = devm_reset_control_array_get_optional_exclusive(dev);
+	if (IS_ERR(espi->resets))
+		return dev_err_probe(dev, PTR_ERR(espi->resets),
+				     "failed to get resets\n");
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	espi->regs = devm_ioremap_resource(dev, res);
+	if (IS_ERR(espi->regs))
+		return PTR_ERR(espi->regs);
+
+	spacemit_espi_parse_dt(pdev, espi);
+	platform_set_drvdata(pdev, espi);
+
+	ret = spacemit_espi_enable_clks(dev, espi);
+	if (ret)
+		return ret;
+
+	ret = reset_control_deassert(espi->resets);
+	if (ret) {
+		dev_err_probe(dev, ret, "failed to deassert resets\n");
+		goto err_disable_clks;
+	}
+
+	ret = devm_add_action_or_reset(dev, spacemit_espi_cleanup, espi);
+	if (ret)
+		return ret;
+
+	ret = spacemit_k3_espi_recover(dev);
+	if (ret)
+		dev_warn(dev, "controller init failed, keeping bootloader state: %d\n",
+			 ret);
+
+	ret = devm_of_platform_populate(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to populate child devices\n");
+
+	return 0;
+
+err_disable_clks:
+	spacemit_espi_disable_clks(espi);
+	return ret;
+}
+
+#ifdef CONFIG_PM_SLEEP
+static int spacemit_espi_suspend_noirq(struct device *dev)
+{
+	struct spacemit_espi *espi = dev_get_drvdata(dev);
+
+	spacemit_espi_disable_clks(espi);
+	return 0;
+}
+
+static int spacemit_espi_resume_noirq(struct device *dev)
+{
+	return spacemit_k3_espi_recover(dev);
+}
+#endif
+
+static const struct dev_pm_ops spacemit_espi_pm_ops = {
+	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(spacemit_espi_suspend_noirq,
+				      spacemit_espi_resume_noirq)
+};
+
+static const struct of_device_id spacemit_espi_of_match[] = {
+	{ .compatible = "spacemit,k3-espi" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, spacemit_espi_of_match);
+
+static struct platform_driver spacemit_espi_driver = {
+	.probe = spacemit_espi_probe,
+	.driver = {
+		.name = "spacemit-k3-espi",
+		.of_match_table = spacemit_espi_of_match,
+		.pm = pm_ptr(&spacemit_espi_pm_ops),
+	},
+};
+module_platform_driver(spacemit_espi_driver);
+
+MODULE_DESCRIPTION("SpacemiT K3 eSPI controller driver");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/spacemit-k3-espi.h b/include/linux/spacemit-k3-espi.h
new file mode 100644
index 000000000..a2a75e2b7
--- /dev/null
+++ b/include/linux/spacemit-k3-espi.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef _LINUX_SPACEMIT_K3_ESPI_H
+#define _LINUX_SPACEMIT_K3_ESPI_H
+
+#include <linux/errno.h>
+#include <linux/kconfig.h>
+
+struct device;
+
+#if IS_ENABLED(CONFIG_SPACEMIT_ESPI_BUS)
+int spacemit_k3_espi_recover(struct device *dev);
+#else
+static inline int spacemit_k3_espi_recover(struct device *dev)
+{
+	return -EOPNOTSUPP;
+}
+#endif
+
+#endif /* _LINUX_SPACEMIT_K3_ESPI_H */
-- 
2.43.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
