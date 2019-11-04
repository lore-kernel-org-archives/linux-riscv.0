Return-Path: <SRS0=KpWC=Y4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD072CA9EB5
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  4 Nov 2019 13:27:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E108222C2
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  4 Nov 2019 13:27:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZrkFMC4Z";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk header.b="t6QsbpYG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E108222C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:
	In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	References:List-Owner; bh=M1LCHy25qAIzUXt44gGGbzNxpqKLnwdkhB6R0zZKL/o=; b=Zrk
	FMC4Z7mKuRol0JDT4PIhadbko+K6csYNYl1JkJWi48a7Kpj9rFGmCM+m/tjgB8Ui1NRGoxR8YgqAB
	HgYFeGAghadM/1g3hV8b/7THtMQM11dSpIaRBmPlX2GyPSHDzjt+NlOBuuLObfUj+y+2sRHUBddmC
	rSZnJdow0PgRQpUu72Qvy88tNMAnpJYCL5DfBJBwvpdyFJ/jCIPph+QTewLQRWUJ0CpGBg2b4KFFr
	ReuN/Q5PG0MVZjbiEnonBQrbLlemsnCBO20W5d+a3elVeOYOvM5KqisHSqAebw6ff10a80HBpF1+/
	XCFHr+/LG2plHY5lOER69mOxNxpIPNg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iRcOD-0005j8-ED; Mon, 04 Nov 2019 13:27:25 +0000
Received: from heliosphere.sirena.org.uk ([172.104.155.198])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iRcOA-0005gc-4L
 for linux-riscv@lists.infradead.org; Mon, 04 Nov 2019 13:27:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=qRAzUev+rMHvML7RdvPeQ9Nk4I6D/EvxELQHAmiFmI0=; b=t6QsbpYGmCRe
 LXO45YwBKtOg9YypR8KqnxjFnpRA6VQ1yZZLwujiyc2I9B7rb8qmwqYn1lm/mtqr8fuQSvfOQzTXk
 WnwhKiW2+4lUJXlZcJao0yOsY4hbqPJcphbp3mGjsxnaOIM88DpcTRdhuFkq1W9OqmSFTHCRNqa4j
 zMQ5g=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iRcO8-0002g1-94; Mon, 04 Nov 2019 13:27:20 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id C2681274301E; Mon,  4 Nov 2019 13:27:19 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Chuhong Yuan <hslester96@gmail.com>
Subject: Applied "spi: sifive: disable clk when probe fails and remove" to the
 spi tree
In-Reply-To: <20191101121745.13413-1-hslester96@gmail.com>
X-Patchwork-Hint: ignore
Message-Id: <20191104132719.C2681274301E@ypsilon.sirena.org.uk>
Date: Mon,  4 Nov 2019 13:27:19 +0000 (GMT)
X-Bad-Reply: In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191104_052722_171916_39D02167 
X-CRM114-Status: GOOD (  14.03  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 "Cc:"@sirena.co.uk
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The patch

   spi: sifive: disable clk when probe fails and remove

has been applied to the spi tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-5.4

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From a725272bda77e61c1b4de85c7b0c875b2ea639b6 Mon Sep 17 00:00:00 2001
From: Chuhong Yuan <hslester96@gmail.com>
Date: Fri, 1 Nov 2019 20:17:45 +0800
Subject: [PATCH] spi: sifive: disable clk when probe fails and remove

The driver forgets to disable and unprepare clk when probe fails and
remove.
Add the calls to fix the problem.

Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
Reviewed-by: Palmer Dabbelt <palmer@dabbelt.com>
Link: https://lore.kernel.org/r/20191101121745.13413-1-hslester96@gmail.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/spi/spi-sifive.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-sifive.c b/drivers/spi/spi-sifive.c
index 35254bdc42c4..f7c1e20432e0 100644
--- a/drivers/spi/spi-sifive.c
+++ b/drivers/spi/spi-sifive.c
@@ -357,14 +357,14 @@ static int sifive_spi_probe(struct platform_device *pdev)
 	if (!cs_bits) {
 		dev_err(&pdev->dev, "Could not auto probe CS lines\n");
 		ret = -EINVAL;
-		goto put_master;
+		goto disable_clk;
 	}
 
 	num_cs = ilog2(cs_bits) + 1;
 	if (num_cs > SIFIVE_SPI_MAX_CS) {
 		dev_err(&pdev->dev, "Invalid number of spi slaves\n");
 		ret = -EINVAL;
-		goto put_master;
+		goto disable_clk;
 	}
 
 	/* Define our master */
@@ -393,7 +393,7 @@ static int sifive_spi_probe(struct platform_device *pdev)
 			       dev_name(&pdev->dev), spi);
 	if (ret) {
 		dev_err(&pdev->dev, "Unable to bind to interrupt\n");
-		goto put_master;
+		goto disable_clk;
 	}
 
 	dev_info(&pdev->dev, "mapped; irq=%d, cs=%d\n",
@@ -402,11 +402,13 @@ static int sifive_spi_probe(struct platform_device *pdev)
 	ret = devm_spi_register_master(&pdev->dev, master);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "spi_register_master failed\n");
-		goto put_master;
+		goto disable_clk;
 	}
 
 	return 0;
 
+disable_clk:
+	clk_disable_unprepare(spi->clk);
 put_master:
 	spi_master_put(master);
 
@@ -420,6 +422,7 @@ static int sifive_spi_remove(struct platform_device *pdev)
 
 	/* Disable all the interrupts just in case */
 	sifive_spi_write(spi, SIFIVE_SPI_REG_IE, 0);
+	clk_disable_unprepare(spi->clk);
 
 	return 0;
 }
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
