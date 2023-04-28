Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38B61C77B60
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Apr 2023 07:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BvLZErSV0Q72xh2FC7tmBfrgozNKCWGBNEU8eLeLL6A=; b=kCRQFWw5nTNES9
	uxiYifDtJG12mHHh6uwlNDJgc0FrsrcsAOiIj/QShip9QA6ujDrn+vp2SYaNnNEQJi2/OYfGcmBe9
	c9r60S/9/RDDM4Vk9VUhBK5hQ9Cekyw38yDuAITyivZ3R0uE88nVKe3rjQ+WuRsi5xPMxYu1nSuDc
	L0+Ha/F2R4Kmshei6+dtb6S/lVBiQBFhO17bJdzeRM62tjWOVpLEE4O2aGJsBRTlG6sYhztOTWx5B
	esS03nd5GypoZpBE7+A6FOZO+u0Ek6M1s5jYLkm2cJ1Fr3ODZ9ZpHvMMvEKCU8OWr29VA09y1mq6D
	QeuCuHi8Pe/sRUfXP0rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psI5b-008Maz-1E;
	Fri, 28 Apr 2023 07:00:19 +0000
Received: from out30-111.freemail.mail.aliyun.com ([115.124.30.111])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psI5X-008MZn-1e
	for linux-riscv@lists.infradead.org;
	Fri, 28 Apr 2023 07:00:18 +0000
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R931e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046050;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0VhAGz.P_1682665205;
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0VhAGz.P_1682665205)
          by smtp.aliyun-inc.com;
          Fri, 28 Apr 2023 15:00:06 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: mturquette@baylibre.com
Cc: sboyd@kernel.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yang Li <yang.lee@linux.alibaba.com>
Subject: [PATCH -next] clk: sifive: Use devm_platform_ioremap_resource()
Date: Fri, 28 Apr 2023 15:00:05 +0800
Message-Id: <20230428070005.41192-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230428_000015_744333_56A8241C 
X-CRM114-Status: UNSURE (   8.76  )
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

Convert platform_get_resource(),devm_ioremap_resource() to a single
call to devm_platform_ioremap_resource(), as this is exactly what this
function does.

Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/clk/sifive/sifive-prci.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/clk/sifive/sifive-prci.c b/drivers/clk/sifive/sifive-prci.c
index 916d2fc28b9c..e317f3454e93 100644
--- a/drivers/clk/sifive/sifive-prci.c
+++ b/drivers/clk/sifive/sifive-prci.c
@@ -567,7 +567,6 @@ static int __prci_register_clocks(struct device *dev, struct __prci_data *pd,
 static int sifive_prci_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct resource *res;
 	struct __prci_data *pd;
 	const struct prci_clk_desc *desc;
 	int r;
@@ -578,8 +577,7 @@ static int sifive_prci_probe(struct platform_device *pdev)
 	if (!pd)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	pd->va = devm_ioremap_resource(dev, res);
+	pd->va = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(pd->va))
 		return PTR_ERR(pd->va);
 
-- 
2.20.1.7.g153144c


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
