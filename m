Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54A50C43334
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Jun 2022 07:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=d2yUSwFiXWHKBLIyACTvSLgsfpHU8vLm68GZyIW4f24=; b=KBRFAtdAslJhyV
	JzamxMI3XAZ/P8WJ+a//195l3uzl3DE84t0wSy1wuKzk0DjdIB8WRe2olv0oxQ5l9wtFEcM1jwJCN
	lnEoodVm63DyMVz+zTPz4G5v6uhsGZHVIE+ye7R0+NljABHiYXXPjQERlRJqd07mwF7LRIO2ZKPbK
	uETPzQT2u8yjQmbSjHh8PrjLI0lioMosrsMWBUQ4dVWprLsKkSF6URqD11wtbyhcCU6YcRGNgQTDi
	rqIkpa8OEXrmUt/+gZTNoNOvqkyXQSD0GlfYmPhBpPhivXbU+J7j8Ba+jtMtW07q3X7kexAAZoBBC
	cijECZZ+gp8AX0vc2nNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzvh3-00BseU-8h; Sat, 11 Jun 2022 07:38:01 +0000
Received: from smtp04.smtpout.orange.fr ([80.12.242.126] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzvh0-00BscB-Ci
	for linux-riscv@lists.infradead.org; Sat, 11 Jun 2022 07:38:00 +0000
Received: from pop-os.home ([90.11.190.129])
	by smtp.orange.fr with ESMTPA
	id zvgpnz3IyEhCQzvgqnHwh7; Sat, 11 Jun 2022 09:37:49 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sat, 11 Jun 2022 09:37:49 +0200
X-ME-IP: 90.11.190.129
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Lewis Hanly <lewis.hanly@microchip.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Mark Brown <broonie@kernel.org>,
	Daire McNamara <daire.mcnamara@microchip.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-riscv@lists.infradead.org,
	linux-spi@vger.kernel.org
Subject: [PATCH] spi: microchip-core: Fix the error handling path in mchp_corespi_probe()
Date: Sat, 11 Jun 2022 09:37:46 +0200
Message-Id: <a90bec10dec43719b12afdb967e87526c4bc849a.1654933052.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220611_003758_620326_4A0856E9 
X-CRM114-Status: UNSURE (   9.98  )
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

clk_prepare_enable() is called instead of clk_disable_unprepare() in the
error handling path of the probe function.

Change the function that is called so that resources are released
correctly.

Fixes: 9ac8d17694b6 ("spi: add support for microchip fpga spi controllers")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/spi/spi-microchip-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-microchip-core.c b/drivers/spi/spi-microchip-core.c
index 5b2aee30fa04..bf6847d95fe3 100644
--- a/drivers/spi/spi-microchip-core.c
+++ b/drivers/spi/spi-microchip-core.c
@@ -580,7 +580,7 @@ static int mchp_corespi_probe(struct platform_device *pdev)
 
 error_release_hardware:
 	mchp_corespi_disable(spi);
-	clk_prepare_enable(spi->clk);
+	clk_disable_unprepare(spi->clk);
 error_release_master:
 	spi_master_put(master);
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
