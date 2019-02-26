Return-Path: <SRS0=373N=RB=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EF8DC10F0B
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 26 Feb 2019 12:07:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BCB121852
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 26 Feb 2019 12:07:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dkLY+DrT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk header.b="BqlgeEZI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2BCB121852
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:
	In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	References:List-Owner; bh=VazLL3KTqMzMl2Wj7fq4ZVhzCRVPOxgWYa/5869ajcE=; b=dkL
	Y+DrTu2GkR1jXpJ12Y948KP3RkhFEJxrK+YnfiIjWGdUIwKtxZbTp8daNZMU1rqIBOYRj07rCVDZ0
	s2cP4JPtqXBxhBPHF3+LNfNH/m3qmGFd1aL13QC8hW8xb6HxpKf4yMbyvJI2nkax0ehD/0FioT+nV
	8xPANDBr3uVfM32LALl5HHQFDW9w3SnQaWROVyiAoC4TEZ9d6aJHvAinsTgPQQh+0sVEQtT/cytrl
	zpYUF+nTsFbG5yzrjVZUuhnSTYc3KcEtSTBhDlwiGRiDH8BTUVCLl2TI94cjNjmPNdEmk1niawDRv
	uM+pNmMNvnCn8/cpoxTCGdmuhpTRo2Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gybWc-0001uh-5W; Tue, 26 Feb 2019 12:07:54 +0000
Received: from heliosphere.sirena.org.uk ([2a01:7e01::f03c:91ff:fed4:a3b6])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gybVy-0000tY-Ee
 for linux-riscv@lists.infradead.org; Tue, 26 Feb 2019 12:07:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=/2a0tTLRuZKD44USz5fZmkt2j11XP7rIjcGKcN5yQw8=; b=BqlgeEZIjTE9
 Ik97fM6ip8NT2Bv0J4EiT0oQ1/k+Xx9JZH6V6xDV8ZyWJUopkYettw5j8bnQOAIhUwqS0sRmJwKhR
 sNAJIWKdIbbLZauTm4/hElTxwz1gz3uZwdiXHRVQFb4x+bJXZcJIAWPi34iYEpkqDLFuBgzmPdEKc
 SjjUk=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=debutante.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1gybVr-0007jd-GL; Tue, 26 Feb 2019 12:07:07 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
 id 0798011284E3; Tue, 26 Feb 2019 12:07:07 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Wei Yongjun <weiyongjun1@huawei.com>
Subject: Applied "spi: sifive: Remove redundant dev_err call in
 sifive_spi_probe()" to the spi tree
In-Reply-To: <20190222054632.4610-1-weiyongjun1@huawei.com>
X-Patchwork-Hint: ignore
Message-Id: <20190226120707.0798011284E3@debutante.sirena.org.uk>
Date: Tue, 26 Feb 2019 12:07:07 +0000 (GMT)
X-Bad-Reply: In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190226_040715_233006_95784217 
X-CRM114-Status: GOOD (  12.46  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Palmer Dabbelt <palmer@sifive.com>, kernel-janitors@vger.kernel.org,
 linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The patch

   spi: sifive: Remove redundant dev_err call in sifive_spi_probe()

has been applied to the spi tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git 

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

From daad4d2a0a60b0b2879e66194100b43c41e96ca9 Mon Sep 17 00:00:00 2001
From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Fri, 22 Feb 2019 05:46:32 +0000
Subject: [PATCH] spi: sifive: Remove redundant dev_err call in
 sifive_spi_probe()

There is a error message within devm_ioremap_resource
already, so remove the dev_err call to avoid redundant
error message.

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/spi/spi-sifive.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/spi/spi-sifive.c b/drivers/spi/spi-sifive.c
index ebca3fc4d345..93ec2c6cdbfd 100644
--- a/drivers/spi/spi-sifive.c
+++ b/drivers/spi/spi-sifive.c
@@ -310,7 +310,6 @@ static int sifive_spi_probe(struct platform_device *pdev)
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	spi->regs = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(spi->regs)) {
-		dev_err(&pdev->dev, "Unable to map IO resources\n");
 		ret = PTR_ERR(spi->regs);
 		goto put_master;
 	}
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
