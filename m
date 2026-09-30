Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44C31CA5FC5
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 18:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4cisSQUyve9yNK7d9V0qTXhh/+wK8Z7eeYFCfshwPXs=; b=MWUC5wXFBan3/z
	5tWSeZWEM7KNy3pU3aBnAMnInNH9tYfi4RIK2gawdEc7vsx3SHnzdNhWoG6e6KJQE1XLAv8IQwmA8
	qUyq8oSyNKfDfsb1M1+5S93vP6OrRKokv4fydy1kwWwJpfGsfjEmXZAUkz1tg+A030pxIfynUZ1QV
	42WkiWN9bB7p+L2LMw4Rs56de+dQ9IGb1Zeo0TjahOiMNznYqCKWFlhmuj//7vdhfJ1j82u3XOZY4
	1EKQGQoOup0VUSbcb4O5USfIFp9A2pX2cleBg2BLF/yDwCWCV/PiuG1t8eIvgK2qQyAQQli7fH8i2
	csbG1JhxfrZhIggyMcNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xByxc-00000006xdf-1gDi;
	Wed, 30 Sep 2026 18:23:20 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xByxY-00000006xcE-13Mk
	for linux-riscv@lists.infradead.org;
	Wed, 30 Sep 2026 18:23:18 +0000
Received: from [127.0.1.1] (unknown [223.166.93.127])
	by APP-01 (Coremail) with SMTP id qwCowAAHofR9U71q8y58CQ--.14027S4;
	Thu, 01 Oct 2026 02:23:03 +0800 (CST)
From: Han Gao <gaohan@iscas.ac.cn>
Date: Thu, 01 Oct 2026 02:22:51 +0800
Subject: [PATCH v2 2/4] spi: sg2044-nor: Honor SPI clock limits
MIME-Version: 1.0
Message-Id: <20261001-fix-sg204xspi-v2-2-014dbaf22b5e@iscas.ac.cn>
References: <20261001-fix-sg204xspi-v2-0-014dbaf22b5e@iscas.ac.cn>
In-Reply-To: <20261001-fix-sg204xspi-v2-0-014dbaf22b5e@iscas.ac.cn>
To: Mark Brown <broonie@kernel.org>, Longbin Li <looong.bin@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <chen.wang@linux.dev>, 
 Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Han Gao <rabenda.cn@gmail.com>, Hangfan Li <lihangfan@iscas.ac.cn>, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
 linux-riscv@lists.infradead.org, Han Gao <gaohan@iscas.ac.cn>
X-Mailer: b4 0.14.2
X-CM-TRANSID: qwCowAAHofR9U71q8y58CQ--.14027S4
X-Coremail-Antispam: 1UD129KBjvJXoWxZr13XryfAw1UXry5ZF4rAFb_yoW5ZF47pa
	y7W3Waqr48KFsrGFWfJF17Xw4ay34SkayUK347K34kAFs8Cr15JFWxJFyaqFW3tFySyF92
	vF47XFy3CFW2q3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmI14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
	8EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4U
	JwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
	IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4U
	M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2
	kIc2xKxwCY1x0262kKe7AKxVW8ZVWrXwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkE
	bVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67
	AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI
	42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCw
	CI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnI
	WIevJa73UjIFyTuYvjTRNiSHDUUUU
X-Originating-IP: [223.166.93.127]
X-CM-SenderInfo: xjdrxt3q6l2u1dvotugofq/1tbiCRMGDGq9GDh3AAAAsQ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_112316_665586_DE135207 
X-CRM114-Status: GOOD (  12.66  )
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

The fixed divider ignores device and operation clock limits. Calculate
the divider before each transfer so SCK does not exceed either limit.

Advertise the controller maximum speed so the SPI core supplies a default
when the device omits its maximum speed. Use the fastest divider when no
speed limit is supplied.

Fixes: de16c322eefb ("spi: sophgo: add SG2044 SPI NOR controller driver")
Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 drivers/spi/spi-sg2044-nor.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/spi/spi-sg2044-nor.c b/drivers/spi/spi-sg2044-nor.c
index ff026ca0f76635fee959d7502f457d43dbec0706..bc9a8ee9bce448ccb2cad63f83ce54e30cbb0ea8 100644
--- a/drivers/spi/spi-sg2044-nor.c
+++ b/drivers/spi/spi-sg2044-nor.c
@@ -385,6 +385,29 @@ static ssize_t sg2044_spifmc_trans_reg(struct sg2044_spifmc *spifmc,
 	return 0;
 }
 
+static int sg2044_spifmc_set_speed(struct sg2044_spifmc *spifmc,
+				   unsigned int speed_hz)
+{
+	unsigned long rate = clk_get_rate(spifmc->clk);
+	u64 div;
+	u32 reg;
+
+	if (!rate)
+		return -EINVAL;
+
+	/* SCK = HCLK / (2 * (SckDiv + 1)); round down the resulting SCK. */
+	div = speed_hz ? DIV_ROUND_UP_ULL(rate, 2ULL * speed_hz) : 1;
+	if (div > SPIFMC_CTRL_SCK_DIV_MASK + 1)
+		return -EINVAL;
+
+	reg = readl(spifmc->io_base + SPIFMC_CTRL);
+	reg &= ~SPIFMC_CTRL_SCK_DIV_MASK;
+	reg |= div - 1;
+	writel(reg, spifmc->io_base + SPIFMC_CTRL);
+
+	return 0;
+}
+
 static int sg2044_spifmc_exec_op(struct spi_mem *mem,
 				 const struct spi_mem_op *op)
 {
@@ -395,11 +418,18 @@ static int sg2044_spifmc_exec_op(struct spi_mem *mem,
 
 	mutex_lock(&spifmc->lock);
 
+	ret = sg2044_spifmc_set_speed(spifmc, op->max_freq ?
+				    min(op->max_freq, mem->spi->max_speed_hz) :
+				    mem->spi->max_speed_hz);
+	if (ret)
+		goto out_unlock;
+
 	if (op->addr.nbytes == 0)
 		ret = sg2044_spifmc_trans_reg(spifmc, op);
 	else
 		ret = sg2044_spifmc_trans(spifmc, op);
 
+out_unlock:
 	mutex_unlock(&spifmc->lock);
 
 	return ret;
@@ -409,6 +439,10 @@ static const struct spi_controller_mem_ops sg2044_spifmc_mem_ops = {
 	.exec_op = sg2044_spifmc_exec_op,
 };
 
+static const struct spi_controller_mem_caps sg2044_spifmc_mem_caps = {
+	.per_op_freq = true,
+};
+
 static void sg2044_spifmc_init(struct sg2044_spifmc *spifmc)
 {
 	u32 tran_csr;
@@ -448,6 +482,10 @@ static int sg2044_spifmc_probe(struct platform_device *pdev)
 	if (IS_ERR(spifmc->clk))
 		return dev_err_probe(dev, PTR_ERR(spifmc->clk), "Cannot get and enable AHB clock\n");
 
+	ctrl->max_speed_hz = clk_get_rate(spifmc->clk) / 2;
+	if (!ctrl->max_speed_hz)
+		return dev_err_probe(dev, -EINVAL, "Invalid AHB clock rate\n");
+
 	spifmc->dev = &pdev->dev;
 	spifmc->ctrl = ctrl;
 
@@ -459,6 +497,7 @@ static int sg2044_spifmc_probe(struct platform_device *pdev)
 	ctrl->bits_per_word_mask = SPI_BPW_MASK(8);
 	ctrl->auto_runtime_pm = false;
 	ctrl->mem_ops = &sg2044_spifmc_mem_ops;
+	ctrl->mem_caps = &sg2044_spifmc_mem_caps;
 	ctrl->mode_bits = SPI_RX_DUAL | SPI_TX_DUAL | SPI_RX_QUAD | SPI_TX_QUAD;
 
 	ret = devm_mutex_init(dev, &spifmc->lock);

-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
