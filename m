Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 285A3C00140
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Aug 2022 21:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TqPQgT6nUyC6Q5ZwILtKwpAKsq00Juf+UVid9Cu0kNU=; b=KSn1fF22BlAMbI
	Ox3gxPZSK2sNKwqBNmGHanItoMkYB+lESgHFfP41bTyLRR2WzloUybHmMrAun/fVeDJ8nDUvNXG/F
	6fWxUL8mZNA7D4M96OjyVRdd/ntN4qAtKLfJkdSPJRV26/QLkQ9RVVE+eTR+6YwA52KkX6PVun7+y
	2kRKtNw/NZ2Dae4cmsLn0l31HRlbhDdeX197WSfevG3FNOojJdH+lPYta+7AV0yNtf3+lpzwjT2bl
	pf41soK7XyxToaIXfO8bxsxSQWBWlsCSDDbW/HugUmz/3pw7S+7hWXqT8ex7FVGdohu2YaFJUqrqC
	cKLuOr0KYffXzGaks64g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oK4wj-000r9h-BB; Fri, 05 Aug 2022 21:33:29 +0000
Received: from smtp08.smtpout.orange.fr ([80.12.242.130] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oK4wf-000r7f-Jj
	for linux-riscv@lists.infradead.org; Fri, 05 Aug 2022 21:33:27 +0000
Received: from pop-os.home ([90.11.190.129])
	by smtp.orange.fr with ESMTPA
	id K4wYoXZvugtndK4wZoVbCl; Fri, 05 Aug 2022 23:33:20 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Fri, 05 Aug 2022 23:33:20 +0200
X-ME-IP: 90.11.190.129
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Mark Brown <broonie@kernel.org>,
	Yang Yingliang <yangyingliang@huawei.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-riscv@lists.infradead.org,
	linux-spi@vger.kernel.org
Subject: [PATCH] spi: microchip-core: Simplify some error message
Date: Fri,  5 Aug 2022 23:33:17 +0200
Message-Id: <fb894ecec68e03fb7fc9353027c8b1a2610833d7.1659735153.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220805_143325_888116_9865F287 
X-CRM114-Status: GOOD (  11.52  )
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

dev_err_probe() already prints the error code in a human readable way, so
there is no need to duplicate it as a numerical value at the end of the
message.

Moreover, in the case of devm_clk_get() it would only display '0' because
'ret' is know to be 0 at this point.

Fixes: cdeaf3a99a02 ("spi: microchip-core: switch to use dev_err_probe()")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/spi/spi-microchip-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-microchip-core.c b/drivers/spi/spi-microchip-core.c
index ce4385330b19..d352844c798c 100644
--- a/drivers/spi/spi-microchip-core.c
+++ b/drivers/spi/spi-microchip-core.c
@@ -548,12 +548,12 @@ static int mchp_corespi_probe(struct platform_device *pdev)
 			       IRQF_SHARED, dev_name(&pdev->dev), master);
 	if (ret)
 		return dev_err_probe(&pdev->dev, ret,
-				     "could not request irq: %d\n", ret);
+				     "could not request irq\n");
 
 	spi->clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(spi->clk))
 		return dev_err_probe(&pdev->dev, PTR_ERR(spi->clk),
-				     "could not get clk: %d\n", ret);
+				     "could not get clk\n");
 
 	ret = clk_prepare_enable(spi->clk);
 	if (ret)
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
