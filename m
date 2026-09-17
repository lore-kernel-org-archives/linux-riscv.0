Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01ECDC982D6
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2026 14:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q9GZA+vfGiJNyTfDnKe+IakkxeiCdLrEX6RrKs2XyAQ=; b=iBXmnZBFhjCZH1
	BbrAReulaur1JfVWuB+IHZRbhqvg1+YUf/IYjuuCz3ytg/CggCjPSu6udn8Y5UAmt1dmmEt65FEiv
	l5TSqVBMrHzuyxpP607rcJCn02qgSLbKn9lQg9Seu67jWXKZ4M/f79rNDJcJ49HaR+VoXuoPFRSPm
	Hl80xwmJ4WBidSo7A5CwSjwJFjn3oSIqo3bSO1HZuhgXJH34ub//cQXL14w8W/oHmEVPQImbpJchW
	b2qxTjjRV2JBvLHw1FAS3fb0kpxazD6MJfC0vJGETNPnk5sO+toO1GFQR3Q/B3C4fi5PI3ZVN1rdr
	1osY1I0MN44w3kWatx2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7D7K-0000000BXFB-40RH;
	Thu, 17 Sep 2026 14:29:38 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7D7H-0000000BXD4-3tz2
	for linux-riscv@lists.infradead.org;
	Thu, 17 Sep 2026 14:29:37 +0000
Received: from [127.0.1.1] (unknown [223.166.93.127])
	by APP-05 (Coremail) with SMTP id zQCowABHtD5A+atqNnqCCA--.4692S3;
	Thu, 17 Sep 2026 22:29:26 +0800 (CST)
From: Han Gao <gaohan@iscas.ac.cn>
Date: Thu, 17 Sep 2026 22:29:19 +0800
Subject: [PATCH 1/4] spi: sg2044-nor: Return transfer errors
MIME-Version: 1.0
Message-Id: <20260917-fix-sg204xspi-v1-1-5c95dac429a8@iscas.ac.cn>
References: <20260917-fix-sg204xspi-v1-0-5c95dac429a8@iscas.ac.cn>
In-Reply-To: <20260917-fix-sg204xspi-v1-0-5c95dac429a8@iscas.ac.cn>
To: Mark Brown <broonie@kernel.org>, Longbin Li <looong.bin@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <chen.wang@linux.dev>, 
 Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Han Gao <rabenda.cn@gmail.com>, linux-spi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
 Han Gao <gaohan@iscas.ac.cn>
X-Mailer: b4 0.14.2
X-CM-TRANSID: zQCowABHtD5A+atqNnqCCA--.4692S3
X-Coremail-Antispam: 1UD129KBjvJXoW7uFW5Aw4rCF45ZrW5Aw43ZFb_yoW8ZF4Dpa
	47ua1Utr1rKa1UAF4fJ3W7Xayay34fKa4UK347Kw1fZF4DZ3WUJF40vFyfXFy3tFy2qr1q
	vF42vry5Cr1DK37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUm014x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
	x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
	A2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
	0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
	IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
	Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2
	xKxwCY1x0262kKe7AKxVW8ZVWrXwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWU
	JVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67
	kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY
	6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0x
	vEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVj
	vjDU0xZFpf9x0pR75rsUUUUU=
X-Originating-IP: [223.166.93.127]
X-CM-SenderInfo: xjdrxt3q6l2u1dvotugofq/1tbiDAMNDGqr9nAGswAAs8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_072936_352028_DAE3AC87 
X-CRM114-Status: UNSURE (   9.26  )
X-CRM114-Notice: Please train this message.
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

The transfer helpers return errors, but both dispatchers discard them.
Return these errors to the SPI memory layer instead of reporting success.

Fixes: de16c322eefb ("spi: sophgo: add SG2044 SPI NOR controller driver")
Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 drivers/spi/spi-sg2044-nor.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/spi/spi-sg2044-nor.c b/drivers/spi/spi-sg2044-nor.c
index f3bcb8a1b92bb1ceee298fa0b720f55f22cf20c3..ff026ca0f76635fee959d7502f457d43dbec0706 100644
--- a/drivers/spi/spi-sg2044-nor.c
+++ b/drivers/spi/spi-sg2044-nor.c
@@ -307,15 +307,15 @@ static ssize_t sg2044_spifmc_tran_cmd(struct sg2044_spifmc *spifmc,
 	return 0;
 }
 
-static void sg2044_spifmc_trans(struct sg2044_spifmc *spifmc,
-				const struct spi_mem_op *op)
+static int sg2044_spifmc_trans(struct sg2044_spifmc *spifmc,
+			       const struct spi_mem_op *op)
 {
 	if (op->data.dir == SPI_MEM_DATA_IN)
-		sg2044_spifmc_read(spifmc, op);
+		return sg2044_spifmc_read(spifmc, op);
 	else if (op->data.dir == SPI_MEM_DATA_OUT)
-		sg2044_spifmc_write(spifmc, op);
+		return sg2044_spifmc_write(spifmc, op);
 	else
-		sg2044_spifmc_tran_cmd(spifmc, op);
+		return sg2044_spifmc_tran_cmd(spifmc, op);
 }
 
 static ssize_t sg2044_spifmc_trans_reg(struct sg2044_spifmc *spifmc,
@@ -389,19 +389,20 @@ static int sg2044_spifmc_exec_op(struct spi_mem *mem,
 				 const struct spi_mem_op *op)
 {
 	struct sg2044_spifmc *spifmc;
+	int ret;
 
 	spifmc = spi_controller_get_devdata(mem->spi->controller);
 
 	mutex_lock(&spifmc->lock);
 
 	if (op->addr.nbytes == 0)
-		sg2044_spifmc_trans_reg(spifmc, op);
+		ret = sg2044_spifmc_trans_reg(spifmc, op);
 	else
-		sg2044_spifmc_trans(spifmc, op);
+		ret = sg2044_spifmc_trans(spifmc, op);
 
 	mutex_unlock(&spifmc->lock);
 
-	return 0;
+	return ret;
 }
 
 static const struct spi_controller_mem_ops sg2044_spifmc_mem_ops = {

-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
