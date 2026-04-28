Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAA67FF8868
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Apr 2026 16:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u5uUWFSwRwFQBWIFshKbUmDN6CcbfP2Ft4MpCB4xEn0=; b=hijxf2Rq+P6aTb
	YzhFzhR5YkGU/7UNEbYdtSeEU70SJVWgsugAxzQKGmm63v9wbdsZhwPkItinplth2NEEXw6W76qi7
	Lb6wGww9DYIEro5H6ZWzPASpXI069VRis7W9qKOZzKQpVRNsF+qXjGjiM2vJpUH8ANN/5CdVaUvRN
	MoZ89OZsI4H9N4vyoEzWfhCK+c6hM9ZYl5pP4+U4Jy4ky9M2o6s/MrM79xkHcsXUPv3rbZF2oEVff
	EZPLb1sc8jCq8rKnJE6oXOCGKt1SogIRUsBwNz67sZ+OPxUG8/VmpUyAZoWJQWOf2UoDMd0slY7l1
	GIiTInKsWvAEDn8pJGnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHl3A-00000001sKI-2Ptr;
	Tue, 28 Apr 2026 16:12:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHl38-00000001sJp-19jO
	for linux-riscv@lists.infradead.org;
	Tue, 28 Apr 2026 16:12:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 828E34395D;
	Tue, 28 Apr 2026 16:12:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F546C2BCB7;
	Tue, 28 Apr 2026 16:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777392757;
	bh=9Q6uV8cKHad5ySSh3Qs/emYBBb+y+VKWfJEEabOhhLQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GKPD44ddg81+hmbOp0rlAw36AFFOrm6LrIJe3e6gAjC9k9vYce2OzzYmTUESiWiNA
	 69SmnVh56UyOT6bxb5Bo4i712UyaH2nxKWADzIvqGCg1rRoKsiccJnSRnPPQJ0MZg2
	 ccSDjyi8lJOPblR/42XdpiuamjAgPNN6dT0QEz/b+DXadE+3NB1sQAyOpAQiYbbdcV
	 9aNe8WKQ/HAjXcScFUnYJ27u1lb5Lx6MIjYZM8JqJCFkY59VE12UCKqqLc6BAXIZrp
	 tN9vno7jjEUTr+Q0AhO9XbZcZRAaagAThhefk0uu2tOdpcnoipjgHFqNS1E67Ot3t+
	 kqeBqFT01l5Ow==
From: Conor Dooley <conor@kernel.org>
To: broonie@kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Cyril Jean <cyril.jean@microchip.com>,
	Valentina.FernandezAlanis@microchip.com,
	linux-riscv@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 1/3] spi: microchip-core-qspi: control built-in cs manually
Date: Tue, 28 Apr 2026 17:12:05 +0100
Message-ID: <20260428-perceive-kettle-d42b33eb62bc@spud>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260428-plexiglas-smith-6ae4e9ba8abd@spud>
References: <20260428-plexiglas-smith-6ae4e9ba8abd@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6855; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=iAT8mZu73GAc16eXh1LQW5xBkIPRUwf7fIgsuFj5Lzs=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJkf7iSw9iaq7ent65h7eabf/JdXVumrGh1c+Pmt/Jr0Q 9YL4lt3d5SyMIhxMciKKbIk3u5rkVr/x2WHc89bmDmsTCBDGLg4BWAiGZ8ZGZ4medzKnlgZcd9Z ZnWR7btzd7p+leWGfTQ+bbFMt77A6C0jw+vI0IT+5sq7b87J6d4WKvq+mE3Rb3Kjpli+gNn3ezt PcAMA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_091238_358968_C609D267 
X-CRM114-Status: GOOD (  25.05  )
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

The coreQSPI IP supports only a single chip select, which is
automagically operated by the hardware - set low when the transmit
buffer first gets written to and set high when the number of bytes
written to the TOTALBYTES field of the FRAMES register have been sent on
the bus. Additional devices must use GPIOs for their chip selects.
It was reported to me that if there are two devices attached to this
QSPI controller that the in-built chip select is set low while linux
tries to access the device attached to the GPIO.

This went undetected as the boards that connected multiple devices to
the SPI controller all exclusively used GPIOs for chip selects, not
relying on the built-in chip select at all. It turns out that this was
because the built-in chip select, when controlled automagically, is set
low when active and high when inactive, thereby ruling out its use for
active-high devices or devices that need to transmit with the chip
select disabled.

Modify the driver so that it controls chip select directly, retaining
the behaviour for mem_ops of setting the chip select active for the
entire duration of the transfer in the exec_op callback. For regular
transfers, implement the set_cs callback for the core to use.

As part of this, the existing setup callback, mchp_coreqspi_setup_op(),
is removed. Modifying the CLKIDLE field is not safe to do during
operation when there are multiple devices, so this code is removed
entirely. Setting the MASTER and ENABLE fields is something that can be
done once at probe, it doesn't need to be re-run for each device.
Instead the new setup callback sets the built-in chip select to its
inactive state for active-low devices, as the reset value of the chip
select in software controlled mode is low.

Fixes: 8f9cf02c88528 ("spi: microchip-core-qspi: Add regular transfers")
Fixes: 8596124c4c1bc ("spi: microchip-core-qspi: Add support for microchip fpga qspi controllers")
CC: stable@vger.kernel.org
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/spi/spi-microchip-core-qspi.c | 82 ++++++++++++++++++++++-----
 1 file changed, 67 insertions(+), 15 deletions(-)

diff --git a/drivers/spi/spi-microchip-core-qspi.c b/drivers/spi/spi-microchip-core-qspi.c
index eab059fb0bc2c..7bd2c9dcd4771 100644
--- a/drivers/spi/spi-microchip-core-qspi.c
+++ b/drivers/spi/spi-microchip-core-qspi.c
@@ -74,6 +74,13 @@
 #define STATUS_FLAGSX4		BIT(8)
 #define STATUS_MASK		GENMASK(8, 0)
 
+/*
+ * QSPI Direct Access register defines
+ */
+#define DIRECT_ACCESS_EN_SSEL		BIT(0)
+#define DIRECT_ACCESS_OP_SSEL		BIT(1)
+#define DIRECT_ACCESS_OP_SSEL_SHIFT	1
+
 #define BYTESUPPER_MASK		GENMASK(31, 16)
 #define BYTESLOWER_MASK		GENMASK(15, 0)
 
@@ -158,6 +165,41 @@ static int mchp_coreqspi_set_mode(struct mchp_coreqspi *qspi, const struct spi_m
 	return 0;
 }
 
+static void mchp_coreqspi_set_cs(struct spi_device *spi, bool enable)
+{
+	struct mchp_coreqspi *qspi = spi_controller_get_devdata(spi->controller);
+	u32 val;
+
+	val = readl(qspi->regs + REG_DIRECT_ACCESS);
+
+	val &= ~BIT(1);
+	if (spi->mode & SPI_CS_HIGH)
+		val |= enable << DIRECT_ACCESS_OP_SSEL_SHIFT;
+	else
+		val |= !enable << DIRECT_ACCESS_OP_SSEL_SHIFT;
+
+	writel(val, qspi->regs + REG_DIRECT_ACCESS);
+}
+
+static int mchp_coreqspi_setup(struct spi_device *spi)
+{
+	struct mchp_coreqspi *qspi = spi_controller_get_devdata(spi->controller);
+	u32 val;
+
+	/*
+	 * Active low devices need to be specifically set to their inactive
+	 * states during probe.
+	 */
+	if (spi->mode & SPI_CS_HIGH)
+		return 0;
+
+	val = readl(qspi->regs + REG_DIRECT_ACCESS);
+	val |= DIRECT_ACCESS_OP_SSEL;
+	writel(val, qspi->regs + REG_DIRECT_ACCESS);
+
+	return 0;
+}
+
 static inline void mchp_coreqspi_read_op(struct mchp_coreqspi *qspi)
 {
 	u32 control, data;
@@ -380,19 +422,6 @@ static int mchp_coreqspi_setup_clock(struct mchp_coreqspi *qspi, struct spi_devi
 	return 0;
 }
 
-static int mchp_coreqspi_setup_op(struct spi_device *spi_dev)
-{
-	struct spi_controller *ctlr = spi_dev->controller;
-	struct mchp_coreqspi *qspi = spi_controller_get_devdata(ctlr);
-	u32 control = readl_relaxed(qspi->regs + REG_CONTROL);
-
-	control |= (CONTROL_MASTER | CONTROL_ENABLE);
-	control &= ~CONTROL_CLKIDLE;
-	writel_relaxed(control, qspi->regs + REG_CONTROL);
-
-	return 0;
-}
-
 static inline void mchp_coreqspi_config_op(struct mchp_coreqspi *qspi, const struct spi_mem_op *op)
 {
 	u32 idle_cycles = 0;
@@ -483,6 +512,7 @@ static int mchp_coreqspi_exec_op(struct spi_mem *mem, const struct spi_mem_op *o
 
 	reinit_completion(&qspi->data_completion);
 	mchp_coreqspi_config_op(qspi, op);
+	mchp_coreqspi_set_cs(mem->spi, true);
 	if (op->cmd.opcode) {
 		qspi->txbuf = &opcode;
 		qspi->rxbuf = NULL;
@@ -523,6 +553,7 @@ static int mchp_coreqspi_exec_op(struct spi_mem *mem, const struct spi_mem_op *o
 		err = -ETIMEDOUT;
 
 error:
+	mchp_coreqspi_set_cs(mem->spi, false);
 	mutex_unlock(&qspi->op_lock);
 	mchp_coreqspi_disable_ints(qspi);
 
@@ -686,6 +717,7 @@ static int mchp_coreqspi_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
 	int ret;
+	u32 num_cs, val;
 
 	ctlr = devm_spi_alloc_host(&pdev->dev, sizeof(*qspi));
 	if (!ctlr)
@@ -718,10 +750,18 @@ static int mchp_coreqspi_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	/*
+	 * The IP core only has a single CS, any more have to be provided via
+	 * gpios
+	 */
+	if (of_property_read_u32(pdev->dev.of_node, "num-cs", &num_cs))
+		num_cs = 1;
+
+	ctlr->num_chipselect = num_cs;
+
 	ctlr->bits_per_word_mask = SPI_BPW_MASK(8);
 	ctlr->mem_ops = &mchp_coreqspi_mem_ops;
 	ctlr->mem_caps = &mchp_coreqspi_mem_caps;
-	ctlr->setup = mchp_coreqspi_setup_op;
 	ctlr->mode_bits = SPI_CPOL | SPI_CPHA | SPI_RX_DUAL | SPI_RX_QUAD |
 			  SPI_TX_DUAL | SPI_TX_QUAD;
 	ctlr->dev.of_node = np;
@@ -729,9 +769,21 @@ static int mchp_coreqspi_probe(struct platform_device *pdev)
 	ctlr->prepare_message = mchp_coreqspi_prepare_message;
 	ctlr->unprepare_message = mchp_coreqspi_unprepare_message;
 	ctlr->transfer_one = mchp_coreqspi_transfer_one;
-	ctlr->num_chipselect = 2;
+	ctlr->setup = mchp_coreqspi_setup;
+	ctlr->set_cs = mchp_coreqspi_set_cs;
 	ctlr->use_gpio_descriptors = true;
 
+	val = readl_relaxed(qspi->regs + REG_CONTROL);
+	val |= (CONTROL_MASTER | CONTROL_ENABLE);
+	writel_relaxed(val, qspi->regs + REG_CONTROL);
+
+	/*
+	 * Put cs into software controlled mode
+	 */
+	val = readl_relaxed(qspi->regs + REG_DIRECT_ACCESS);
+	val |= DIRECT_ACCESS_EN_SSEL;
+	writel(val, qspi->regs + REG_DIRECT_ACCESS);
+
 	ret = spi_register_controller(ctlr);
 	if (ret)
 		return dev_err_probe(&pdev->dev, ret,
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
