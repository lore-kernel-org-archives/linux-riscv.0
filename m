Return-Path: <SRS0=373N=RB=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32830C4360F
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 26 Feb 2019 12:07:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03650217F9
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 26 Feb 2019 12:07:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qD1C0g+l";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk header.b="pfrM7SNJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 03650217F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:
	In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	References:List-Owner; bh=EDnE59xYd6TkBK34f45xAzpWvlox9CLJ4eqGyzKsbR4=; b=qD1
	C0g+l0VB6/duUlw+zaSqv++H3UCXqTPG2LXeAPHC413S4oQYSWd/uhVBrs59cuJAZ+5oVxLxie9tx
	AIVFof8b9j7zOvZh9eGECKUvCKvbwWIOvJxj416HvGq1HKeTeShdzZAUTg/cnipaAkj7JDoZ456ig
	TCZ8EmWaQVcfcKG3wf0qAkBF9YMIHt6+u60JInSIE9MGo1lXVmhHQGSDSJYabR/IF/SfNZ4ZE3qo1
	sUuuogjOGkhyPPxFJNZjKzZhE43EzRKmmotAMfe+zUlkdagPC0dfMkiHULxCuhwuqz6jMM13ztLg9
	bQByZxPXvV3WOe4nbQz+LInJarESNrg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gybWd-0001ww-MS; Tue, 26 Feb 2019 12:07:55 +0000
Received: from heliosphere.sirena.org.uk ([2a01:7e01::f03c:91ff:fed4:a3b6])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gybVz-0000vA-A3
 for linux-riscv@lists.infradead.org; Tue, 26 Feb 2019 12:07:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=KwKQU1IqMUbYnYJa+u2a7s291D53PbtMyD6LVxOfrsA=; b=pfrM7SNJ/e/K
 3VeH2aODVgbJt/oLYFWzEomwT0IC7BCxd6akf5yxfbnWL90po47uzNqKrZ8r5BbE35+lGF2dEXJxl
 LAjBYxOqyz48xNoTjcgaSja5BX94gsO6V/cFviGT5YNWNGepgzt9bTT+WbJunAIdnMGBSjYO9HDPB
 FAKhQ=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=debutante.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1gybVt-0007jg-Og; Tue, 26 Feb 2019 12:07:09 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
 id 3F17E11284E3; Tue, 26 Feb 2019 12:07:09 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Wei Yongjun <weiyongjun1@huawei.com>
Subject: Applied "spi: sifive: Remove spi_master_put in sifive_spi_remove()"
 to the spi tree
In-Reply-To: <20190222054616.4523-1-weiyongjun1@huawei.com>
X-Patchwork-Hint: ignore
Message-Id: <20190226120709.3F17E11284E3@debutante.sirena.org.uk>
Date: Tue, 26 Feb 2019 12:07:09 +0000 (GMT)
X-Bad-Reply: In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190226_040715_895587_6F01948E 
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
 linux-spi@vger.kernel.org, Yash Shah <yash.shah@sifive.com>,
 Mark Brown <broonie@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The patch

   spi: sifive: Remove spi_master_put in sifive_spi_remove()

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

From 049e5feae18fe07df0687dc14582f338dde3fb56 Mon Sep 17 00:00:00 2001
From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Fri, 22 Feb 2019 05:46:16 +0000
Subject: [PATCH] spi: sifive: Remove spi_master_put in sifive_spi_remove()

The call to spi_master_put() in sifive_spi_remove() is redundant since
the master is registered using devm_spi_register_master() and no
reference hold by using spi_master_get() in sifive_spi_remove().

This is detected by Coccinelle semantic patch.

Fixes: 484a9a68d669 ("spi: sifive: Add driver for the SiFive SPI controller")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/spi/spi-sifive.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/spi/spi-sifive.c b/drivers/spi/spi-sifive.c
index 961307c4a613..ebca3fc4d345 100644
--- a/drivers/spi/spi-sifive.c
+++ b/drivers/spi/spi-sifive.c
@@ -424,7 +424,6 @@ static int sifive_spi_remove(struct platform_device *pdev)
 
 	/* Disable all the interrupts just in case */
 	sifive_spi_write(spi, SIFIVE_SPI_REG_IE, 0);
-	spi_master_put(master);
 
 	return 0;
 }
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
