Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67713C4345F
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Apr 2024 07:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=URG64qts+sASiccIWJwyZsRUrSOCVc0m3XO+h+JAXzw=; b=1Yo+EgzF/HDqA7
	PjWQHynqWvP/9ScQzlNDLnedot2I13hrPmS65SV/0Y3dCYr1KTdaxqYD3VsDeg7DxY6CtQk9eDJLX
	nIgBz7f+f3LKT/bg0aAQcAb/2f8E11A/PA3OJYSjLF96LdW/9kxWJnrgX32HogLMmAPYIxxrqiPa9
	I7FiIUSGS/2jHpCzRMDrb3TGeeCD5xVQduxid9VUdbPE5JnRSSgkZ4ARnmazhXy99SjpMPGcoKF/7
	XlPt/3/MjJbyChhRVZugffWn6AJbaWbrRfKyt9dxSPYSib+arInZFA+ZPbHD6/eqqVMDQdOjFBK4I
	Iv6Pio1J4oiAL6pgnMmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0ctR-0000000F6Bj-43lZ;
	Sat, 27 Apr 2024 07:54:45 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0ctM-0000000F68M-0vzT
	for linux-riscv@lists.infradead.org;
	Sat, 27 Apr 2024 07:54:41 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-6f00f24f761so2741095b3a.3
        for <linux-riscv@lists.infradead.org>; Sat, 27 Apr 2024 00:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714204478; x=1714809278; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d7TMXDCvu+SKHpbmKD1m7Pq7A0/TWju7J0p7ed3sm/8=;
        b=A5pZ8rcwnRdsqfGBUkkw5MjzltvFGLtRkoUjVFUCyikTKp5BzrQ4PHCiGX/eO/36rP
         zJA1Pv1strrhUBXhj9wNbSzhL5+Ksy/to0g0RNNZJkKuHznHTdS7nLXj5Khspz8bq0BP
         Dr0CEs5yC6m9MM2rMUcQoJsZklGRFR5LrZocZPiNh7UdvZ0cg+QW/ej23mSZX/LjSiWs
         eKWtRab4T193jKz00BqxHerqxOql3flsc/dan0P4q23HYtUgBJdFCL9oxoTJoLo/WTKp
         8M243WKGjTq4PtCeDt8qR7+NJrM2326c7Hf6736H+I6giwu5myXjBDEsxu2qz4QHZYvi
         Pkxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714204478; x=1714809278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d7TMXDCvu+SKHpbmKD1m7Pq7A0/TWju7J0p7ed3sm/8=;
        b=j6wh1ze53UkT33dj6R9ohnnrUiBj2eTlpz+s6KzRmS3Iu+caymVppysJ91JjFDaTzT
         Mw9t6xy6JRUYECDDd0Dl+AvTq2M9Vh6Nm7peWs3u+80frh72+bwaf7v5wjrbJROORCY6
         pzY+cVPB/uEEdaibbYu2cEAwfFJ12CN0ndmbY35F8U0+rD848BwULYqiJxZeFmMHqceE
         4cgCLErf8aO2kFtltLM6xZVbTxuKM4xNZ3nKT/8gHS+Y81fj/aGZQ3SEqoPK+nPMdwah
         gZuLQXf3CNAmlq4VfRu/wkuPsQ8PW7625KVaS648Q95AghA9bDM4Klc4EXizjhMQ4jEE
         FJpA==
X-Forwarded-Encrypted: i=1; AJvYcCVmOQ0na4vR8r8TV0wHibaQxgtHlbZPt9ziORZwenZyPeL2FYUEWlEH48vOtjNI+LibDBcwT55mkTt6kysHBUGweA637vjAFHebQhSBXvKy
X-Gm-Message-State: AOJu0YyFqv4TowlvanS1KvKQX4+aCMQC0LSH/WAu8F1BgLk/p/sfLWJg
	qL3QQ00rpqS3Mu5JRKDOE0erfX3EdF19bp0/JOun7+klCAkjD3Qr
X-Google-Smtp-Source: AGHT+IGzIDLoLkD8sTwrlpX4G39Zd3wFCBM8sBggCL0vDj3rBjh2ZHPbwk2/tTWAtQuxRqizRdbTWw==
X-Received: by 2002:a05:6a00:1788:b0:6ed:1c7:8c6b with SMTP id s8-20020a056a00178800b006ed01c78c6bmr6489072pfg.1.1714204478087;
        Sat, 27 Apr 2024 00:54:38 -0700 (PDT)
Received: from localhost ([46.3.240.103])
        by smtp.gmail.com with ESMTPSA id r16-20020a056a00217000b006ed87983f95sm15860556pff.52.2024.04.27.00.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Apr 2024 00:54:37 -0700 (PDT)
From: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
To: broonie@kernel.org,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	unicorn_wang@outlook.com,
	inochiama@outlook.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: dlan@gentoo.org,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Jingbao Qiu <qiujingbao.dlmu@gmail.com>
Subject: [PATCH v1 2/2] spi: add support for sophgo spi-nor controller
Date: Sat, 27 Apr 2024 15:54:26 +0800
Message-Id: <20240427075426.662671-3-qiujingbao.dlmu@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240427075426.662671-1-qiujingbao.dlmu@gmail.com>
References: <20240427075426.662671-1-qiujingbao.dlmu@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240427_005440_376529_F410796A 
X-CRM114-Status: GOOD (  23.87  )
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

This is a driver for sophgo spi-nor controller using spi-mem interface.

Signed-off-by: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
---
 drivers/spi/Kconfig             |   9 +
 drivers/spi/Makefile            |   1 +
 drivers/spi/spi-sophgo-cv1800.c | 370 ++++++++++++++++++++++++++++++++
 3 files changed, 380 insertions(+)
 create mode 100644 drivers/spi/spi-sophgo-cv1800.c

diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
index bc7021da2fe9..41ad7c0aaab8 100644
--- a/drivers/spi/Kconfig
+++ b/drivers/spi/Kconfig
@@ -971,6 +971,15 @@ config SPI_SN_F_OSPI
 	  for connecting an SPI Flash memory over up to 8-bit wide bus.
 	  It supports indirect access mode only.
 
+config SPI_SOPHGO_CV1800
+	tristate "Sophgo SPI NOR Controller"
+	depends on ARCH_SOPHGO || COMPILE_TEST
+	help
+	  This enables support for the Sophgo SPI NOR controller,
+	  which supports Dual/Qual read and write operations while
+	  also supporting 3Byte address devices and 4Byte address
+	  devices.
+
 config SPI_SPRD
 	tristate "Spreadtrum SPI controller"
 	depends on ARCH_SPRD || COMPILE_TEST
diff --git a/drivers/spi/Makefile b/drivers/spi/Makefile
index 4ff8d725ba5e..a25549155106 100644
--- a/drivers/spi/Makefile
+++ b/drivers/spi/Makefile
@@ -128,6 +128,7 @@ obj-$(CONFIG_SPI_SH_SCI)		+= spi-sh-sci.o
 obj-$(CONFIG_SPI_SIFIVE)		+= spi-sifive.o
 obj-$(CONFIG_SPI_SLAVE_MT27XX)          += spi-slave-mt27xx.o
 obj-$(CONFIG_SPI_SN_F_OSPI)		+= spi-sn-f-ospi.o
+obj-$(CONFIG_SPI_SOPHGO_CV1800)		+= spi-sophgo-cv1800.o
 obj-$(CONFIG_SPI_SPRD)			+= spi-sprd.o
 obj-$(CONFIG_SPI_SPRD_ADI)		+= spi-sprd-adi.o
 obj-$(CONFIG_SPI_STM32) 		+= spi-stm32.o
diff --git a/drivers/spi/spi-sophgo-cv1800.c b/drivers/spi/spi-sophgo-cv1800.c
new file mode 100644
index 000000000000..2e453b7d45f0
--- /dev/null
+++ b/drivers/spi/spi-sophgo-cv1800.c
@@ -0,0 +1,370 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Sophgo SPI NOR controller driver
+//
+// Copyright (C) 2020 Jingbao Qiu <qiujingbao.dlmu@gmail.com>
+
+#include <linux/bitfield.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/spi/spi.h>
+#include <linux/spi/spi-mem.h>
+
+#define SOPHGO_SPI_CTRL                 0x000
+#define SOPHGO_SPI_CE_CTRL              0x004
+#define SOPHGO_SPI_DLY_CTRL             0x008
+#define SOPHGO_SPI_DMMR                 0x00C
+#define SOPHGO_SPI_TRAN_CSR             0x010
+#define SOPHGO_SPI_TRAN_NUM             0x014
+#define SOPHGO_SPI_FIFO_PORT            0x018
+#define SOPHGO_SPI_FIFO_PT              0x020
+#define SOPHGO_SPI_INT_STS              0x028
+
+#define SOPHGO_NOR_CTRL_SCK_DIV_MASK    GENMASK(10, 0)
+#define SOPHGO_NOR_CTRL_DEFAULT_DIV     4
+#define SOPHGO_NOR_DLY_CTRL_NEG_SAMPLE  BIT(14)
+
+#define SOPHGO_NOR_CE_MANUAL            BIT(0)
+#define SOPHGO_NOR_CE_MANUAL_EN         BIT(1)
+#define SOPHGO_NOR_CE_ENABLE            (SOPHGO_NOR_CE_MANUAL | SOPHGO_NOR_CE_MANUAL_EN)
+#define SOPHGO_NOR_CE_DISABLE           SOPHGO_NOR_CE_MANUAL_EN
+#define SOPHGO_NOR_CE_HARDWARE          0
+
+#define SOPHGO_NOR_TRAN_MODE_RX         BIT(0)
+#define SOPHGO_NOR_TRAN_MODE_TX         BIT(1)
+#define SOPHGO_NOR_TRAN_MODE_MASK       GENMASK(1, 0)
+#define SOPHGO_NOR_TRANS_FAST           BIT(3)
+#define SOPHGO_NOR_TRANS_BUS_WIDTH(n)   (n << 4)
+#define SOPHGO_NOR_TRANS_BUS_WIDTH_MASK GENMASK(5, 4)
+
+#define SOPHGO_NOR_TRANS_MIOS           BIT(7)
+
+#define SOPHGO_NOR_TRAN_ADDR(n)         (n << 8)
+#define SOPHGO_NOR_TRANS_ADDR_MASK      GENMASK(10, 8)
+#define SOPHGO_NOR_TRANS_CMD            BIT(11)
+#define SOPHGO_NOR_TRAN_FIFO_MASK       GENMASK(13, 12)
+#define SOPHGO_NOR_TRAN_FIFO_8_BYTE     GENMASK(13, 12)
+#define SOPHGO_NOR_TRAN_GO_BUSY         BIT(15)
+
+#define SOPHGO_NOR_TRANS_DMMR_EN        BIT(20)
+#define SOPHGO_NOR_TRANS_DMMR_CMD       BIT(21)
+
+#define SOPHGO_NOR_TRANS_MMIO									\
+	(SOPHGO_NOR_TRANS_FAST | SOPHGO_NOR_TRANS_DMMR_EN |			\
+		SOPHGO_NOR_TRANS_DMMR_CMD | SOPHGO_NOR_TRANS_MIOS |		\
+		SOPHGO_NOR_TRAN_MODE_RX | SOPHGO_NOR_TRAN_FIFO_8_BYTE)
+
+#define SOPHGO_NOR_TRANS_PORT								\
+	(SOPHGO_NOR_TRAN_MODE_MASK | SOPHGO_NOR_TRANS_ADDR_MASK |	\
+		SOPHGO_NOR_TRAN_FIFO_MASK | SOPHGO_NOR_TRANS_BUS_WIDTH_MASK |	\
+		SOPHGO_NOR_TRANS_BUS_WIDTH_MASK)
+
+#define SOPHGO_NOR_FIFO_CAPACITY  8
+#define SOPHGO_NOR_FIFO_AVAI_MASK GENMASK(3, 0)
+
+#define SOPHGO_NOR_INT_TRAN_DONE  BIT(0)
+#define SOPHGO_NOR_INT_RD_FIFO    BIT(1)
+#define SOPHGO_NOR_INT_WR_FIFO    BIT(2)
+
+struct sophgo_nor {
+	struct spi_controller *ctlr;
+	struct device *dev;
+	void __iomem *io_base;
+	uint32_t tran_csr_orig;
+	uint32_t sck_div_orig;
+	struct mutex lock;
+};
+
+static uint32_t sophgo_nor_clk_setup(struct sophgo_nor *spif, uint32_t sck_div)
+{
+	uint32_t reg;
+	uint32_t old_clk;
+
+	reg = readl(spif->io_base + SOPHGO_SPI_DLY_CTRL);
+
+	if (sck_div < SOPHGO_NOR_CTRL_DEFAULT_DIV)
+		reg |= SOPHGO_NOR_DLY_CTRL_NEG_SAMPLE;
+
+	writel(reg, spif->io_base + SOPHGO_SPI_DLY_CTRL);
+
+	reg = readl(spif->io_base + SOPHGO_SPI_CTRL);
+	old_clk = FIELD_GET(SOPHGO_NOR_CTRL_SCK_DIV_MASK, reg);
+
+	reg &= ~SOPHGO_NOR_CTRL_SCK_DIV_MASK;
+	reg |= sck_div;
+	writel(reg, spif->io_base + SOPHGO_SPI_CTRL);
+
+	return old_clk;
+}
+
+static inline uint32_t sophgo_nor_trans_csr_config(struct sophgo_nor *spif,
+					       const struct spi_mem_op *op)
+{
+	uint32_t tran_csr = 0;
+
+	if (op->dummy.nbytes)
+		tran_csr |= (op->dummy.nbytes * 8) / op->dummy.buswidth << 16;
+
+	tran_csr |= SOPHGO_NOR_TRANS_MMIO;
+	tran_csr |= SOPHGO_NOR_TRANS_BUS_WIDTH(op->data.buswidth / 2);
+	tran_csr |= SOPHGO_NOR_TRAN_ADDR(op->addr.nbytes);
+
+	return tran_csr;
+}
+
+static void sophgo_nor_config_mmio(struct sophgo_nor *spif,
+				   const struct spi_mem_op *op,
+				   uint32_t enabled)
+{
+	uint32_t ctrl, tran_csr;
+
+	if (enabled) {
+		spif->tran_csr_orig =
+			readl(spif->io_base + SOPHGO_SPI_TRAN_CSR);
+		tran_csr = sophgo_nor_trans_csr_config(spif, op);
+		ctrl = SOPHGO_NOR_CE_HARDWARE;
+	} else {
+		tran_csr = spif->tran_csr_orig;
+		ctrl = SOPHGO_NOR_CE_ENABLE;
+	}
+
+	writel(tran_csr, spif->io_base + SOPHGO_SPI_TRAN_CSR);
+	writel(ctrl, spif->io_base + SOPHGO_SPI_CE_CTRL);
+	writel(enabled, spif->io_base + SOPHGO_SPI_DMMR);
+}
+
+static void sophgo_nor_config_port(struct sophgo_nor *spif, uint32_t enabled)
+{
+	uint32_t ctrl = SOPHGO_NOR_CE_ENABLE;
+
+	if (enabled) {
+		ctrl = SOPHGO_NOR_CE_MANUAL_EN;
+		writel(!enabled, spif->io_base + SOPHGO_SPI_DMMR);
+	}
+
+	writel(ctrl, spif->io_base + SOPHGO_SPI_CE_CTRL);
+}
+
+static int sophgo_nor_xfer(struct sophgo_nor *spif, const uint8_t *dout,
+			   uint8_t *din, uint32_t data_bytes,
+			   uint32_t bus_width)
+{
+	uint32_t xfer_size, off;
+	uint32_t fifo_cnt;
+	uint32_t interrupt_mask = 0;
+	uint32_t stat, tran_csr = 0;
+	int ret = 0;
+
+	writel(0, spif->io_base + SOPHGO_SPI_INT_STS);
+	writel(0, spif->io_base + SOPHGO_SPI_FIFO_PT);
+
+	writew(data_bytes, spif->io_base + SOPHGO_SPI_TRAN_NUM);
+
+	if (din && dout)
+		return -1;
+	else if (!din && !dout)
+		return -1;
+
+	tran_csr = readw(spif->io_base + SOPHGO_SPI_TRAN_CSR);
+
+	tran_csr &= ~SOPHGO_NOR_TRANS_PORT;
+
+	tran_csr |= SOPHGO_NOR_TRAN_FIFO_8_BYTE;
+	tran_csr |= SOPHGO_NOR_TRAN_GO_BUSY;
+	tran_csr |= (bus_width / 2) << 4;
+
+	interrupt_mask |= SOPHGO_NOR_INT_TRAN_DONE;
+
+	if (din) {
+		tran_csr |= SOPHGO_NOR_TRAN_MODE_RX;
+		interrupt_mask |= SOPHGO_NOR_INT_RD_FIFO;
+		spif->sck_div_orig =
+			sophgo_nor_clk_setup(spif, SOPHGO_NOR_CTRL_DEFAULT_DIV);
+	} else if (dout) {
+		tran_csr |= SOPHGO_NOR_TRAN_MODE_TX;
+		interrupt_mask |= SOPHGO_NOR_INT_WR_FIFO;
+	}
+
+	writew(tran_csr, spif->io_base + SOPHGO_SPI_TRAN_CSR);
+
+	ret = readb_poll_timeout(spif->io_base + SOPHGO_SPI_INT_STS, stat,
+				 stat & interrupt_mask, 10, 30);
+	if (ret)
+		dev_warn(spif->dev, "%s stat timedout\n", __func__);
+
+	off = 0;
+	while (off < data_bytes) {
+		xfer_size = min_t(uint32_t, data_bytes - off,
+				  SOPHGO_NOR_FIFO_CAPACITY);
+
+		fifo_cnt = readl(spif->io_base + SOPHGO_SPI_FIFO_PT) &
+			   SOPHGO_NOR_FIFO_AVAI_MASK;
+
+		if (fifo_cnt > SOPHGO_NOR_FIFO_CAPACITY)
+			goto exit;
+
+		if (din)
+			xfer_size = min(xfer_size, fifo_cnt);
+		else
+			xfer_size = min_t(uint32_t, xfer_size,
+					  SOPHGO_NOR_FIFO_CAPACITY - fifo_cnt);
+
+		while (xfer_size--) {
+			if (din)
+				*(din + off) = readb(spif->io_base +
+						     SOPHGO_SPI_FIFO_PORT);
+			else
+				writeb(*(dout + off),
+				       spif->io_base + SOPHGO_SPI_FIFO_PORT);
+			off++;
+		}
+	}
+
+	ret = readb_poll_timeout(spif->io_base + SOPHGO_SPI_INT_STS, stat,
+				 (stat & interrupt_mask), 10, 30);
+	if (ret) {
+		dev_warn(spif->dev, " %s command timed out %x\n", __func__,
+			 stat);
+	}
+
+exit:
+	writeb(0, spif->io_base + SOPHGO_SPI_FIFO_PT);
+	stat = readb(spif->io_base + SOPHGO_SPI_INT_STS) & ~interrupt_mask;
+	writeb(stat, spif->io_base + SOPHGO_SPI_INT_STS);
+
+	if (din)
+		sophgo_nor_clk_setup(spif, spif->sck_div_orig);
+
+	return 0;
+}
+
+static int sophgo_nor_port_trans(struct sophgo_nor *spif,
+				 const struct spi_mem_op *op)
+{
+	const uint8_t *dout = NULL;
+	uint8_t *din = NULL;
+	uint32_t addr;
+
+	sophgo_nor_config_port(spif, 1);
+
+	if (op->cmd.nbytes)
+		sophgo_nor_xfer(spif, (uint8_t *)&op->cmd.opcode, NULL,
+				op->cmd.nbytes, op->cmd.buswidth);
+
+	if (op->addr.nbytes) {
+		addr = cpu_to_be32(op->addr.val);
+		sophgo_nor_xfer(spif, (uint8_t *)&addr, NULL, op->addr.nbytes,
+				op->addr.buswidth);
+	}
+
+	if (op->data.dir == SPI_MEM_DATA_IN)
+		din = op->data.buf.in;
+	else if (op->data.dir == SPI_MEM_DATA_OUT)
+		dout = op->data.buf.out;
+
+	sophgo_nor_xfer(spif, dout, din, op->data.nbytes, op->data.buswidth);
+
+	sophgo_nor_config_port(spif, 0);
+
+	return 0;
+}
+
+static void sophgo_nore_read_mmio(struct sophgo_nor *spif,
+				  const struct spi_mem_op *op)
+{
+	sophgo_nor_config_mmio(spif, op, 1);
+	memcpy_fromio(op->data.buf.in, spif->io_base + op->addr.val,
+		      op->data.nbytes);
+	sophgo_nor_config_mmio(spif, op, 0);
+}
+
+static int sophgo_nor_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
+{
+	struct sophgo_nor *spif;
+
+	spif = spi_controller_get_devdata(mem->spi->controller);
+
+	mutex_lock(&spif->lock);
+	if (op->data.dir == SPI_MEM_DATA_IN && op->data.nbytes &&
+	    op->addr.nbytes == 4) {
+		sophgo_nore_read_mmio(spif, op);
+		goto exit;
+	}
+
+	sophgo_nor_port_trans(spif, op);
+
+exit:
+	mutex_unlock(&spif->lock);
+	return 0;
+}
+
+static const struct spi_controller_mem_ops sophgo_nor_mem_ops = {
+	.exec_op = sophgo_nor_exec_op,
+};
+
+static const struct of_device_id sophgo_nor_match[] = {
+	{ .compatible = "sophgo,cv1800b-nor" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, sophgo_nor_match);
+
+static int sophgo_nor_probe(struct platform_device *pdev)
+{
+	struct spi_controller *ctlr;
+	struct sophgo_nor *sp;
+	void __iomem *base;
+
+	ctlr = devm_spi_alloc_host(&pdev->dev, sizeof(*sp));
+	if (!ctlr)
+		return -ENOMEM;
+
+	sp = spi_controller_get_devdata(ctlr);
+	dev_set_drvdata(&pdev->dev, ctlr);
+
+	sp->dev = &pdev->dev;
+	sp->ctlr = ctlr;
+
+	sp->io_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	ctlr->num_chipselect = 1;
+	ctlr->dev.of_node = pdev->dev.of_node;
+	ctlr->bits_per_word_mask = SPI_BPW_MASK(8);
+	ctlr->auto_runtime_pm = false;
+	ctlr->mem_ops = &sophgo_nor_mem_ops;
+	ctlr->mode_bits = SPI_RX_DUAL | SPI_TX_DUAL | SPI_RX_QUAD | SPI_TX_QUAD;
+
+	mutex_init(&sp->lock);
+
+	sophgo_nor_config_port(sp, 1);
+
+	return devm_spi_register_controller(&pdev->dev, ctlr);
+}
+
+static int sophgo_nor_remove(struct platform_device *pdev)
+{
+	struct sophgo_nor *spif = platform_get_drvdata(pdev);
+
+	mutex_destroy(&spif->lock);
+	return 0;
+}
+
+static struct platform_driver sophgo_nor_driver = {
+	.driver = {
+		.name = "sophgo-spif",
+		.of_match_table = sophgo_nor_match,
+	},
+	.probe = sophgo_nor_probe,
+	.remove = sophgo_nor_remove,
+};
+
+module_platform_driver(sophgo_nor_driver);
+
+MODULE_DESCRIPTION("Sophgo SPI NOR controller driver");
+MODULE_AUTHOR("Jingbao Qiu <qiujingbao.dlmu@gmail.com>");
+MODULE_LICENSE("GPL");
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
