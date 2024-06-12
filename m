Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A36D9C27C53
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jun 2024 15:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bPd30CSv0LijxN7s3vWkKyIWkH3yTosBJMpzpCFG4Dc=; b=HfZejzCiU5NjXn
	FDiM5pvP3GC63/jKnVTr4PxM0YrccUYwL7ai+q2rj3Yy03hCR7nsu8dhpPphKsBHJPT/KLMeOHrAM
	nBKOBTn+/vph3qhhjqnF5UQ4s3UMIWXn4oosKawIEW6fI6G/8+FweTDc9lIp5iVRr+hY4KHBuiEZ8
	LYDYz6EXaosFSlu+KNQ1N2dG/EaEhMDZm3ZuwXLmbFuAQ9EbJqQnmbrR64ld2DCJJAnIIo/4Vqv0J
	EG8Hgxdcq2Ukdl4FS2vpitLv0N+sKhQZqE1L0uipv/l8ARIpEXeyMoFKw2x3c3hvILtnMGmXtzA0S
	Gx29NWYfMSGo7rqbnBzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHQDZ-0000000DEVb-1ZwB;
	Wed, 12 Jun 2024 15:48:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHQDX-0000000DEV6-1OeG
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jun 2024 15:48:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9A679614DD;
	Wed, 12 Jun 2024 15:48:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9393DC4AF1A;
	Wed, 12 Jun 2024 15:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718207334;
	bh=P1vOj2Rn7zuoaBh6AcqrcUTEi1rovxUtpHsy8CmdHr0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RM5rd5EJCfJaPHSF6RHPKysoR8lv3CkSLd4g2Berb4nT2sHLtIYnFt6NS60oRpl9g
	 oELj9VAHV47yQv/PW5bqKN4G8Pzc0J1OY+DCv21YxQEmcmfzvEUyCFc6XGpr3gaL8v
	 m42aKyyJ1o1WH/8kPZXWMVyo3tMASfqukyObPz/hrVo29vqFl0+HXgLAaFlXJvcA2h
	 5/zX4wXMTZOpYBUz+HtYelymZidotMFyoqz6B3QVwizDw5s+ubMk2Io9m2dkQ83SVE
	 Jpi6Eyt0tUJpbyJ0XNr/yRaFoytL9m/duTvKpg9sooyAurw9t6/PBbTepntmShB9Rn
	 7x12qvQbD/Rxw==
From: Conor Dooley <conor@kernel.org>
To: linux-mmc@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	cyril.jean@microchip.com,
	Mark Brown <broonie@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-spi@vger.kernel.org
Subject: [RFC v1 1/3] mmc: mmc_spi: allow for spi controllers incapable of getting as low as 400k
Date: Wed, 12 Jun 2024 16:48:31 +0100
Message-ID: <20240612-dense-resample-563f07c30185@spud>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240612-brigade-shell-1f626e7e592f@spud>
References: <20240612-brigade-shell-1f626e7e592f@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1284; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=tXCkjnYnQevs4Hom30XLCG5d2XL7igKpnQRl5B2TRkw=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGmZh32YQ6LF1YxuVN44oVfcacC3NEQq8fP2UjmeHOsvU xz69Sd3lLIwiHEwyIopsiTe7muRWv/HZYdzz1uYOaxMIEMYuDgFYCIsPIwMn456V+r3ir64lrdo KmPhpIDV4u8mNB94t0Rwf1q/maEiD8NfmZ3axzc5JC2xrbjnZyYflvhFedPN8EPp4tfsC9ds3DW BGQA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_084855_467659_752CF676 
X-CRM114-Status: GOOD (  11.65  )
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

Some controllers may not be able to reach a bus clock as low as 400 KHz
due to a lack of sufficient divisors. In these cases, the SD card slot
becomes non-functional as Linux continuously attempts to set the bus
clock to 400 KHz. If the controller is incapable of getting that low,
set its minimum frequency instead. While this may eliminate some SD
cards, it allows those capable of operating at the controller's minimum
frequency to be used.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/mmc/host/mmc_spi.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/mmc_spi.c b/drivers/mmc/host/mmc_spi.c
index 09d7a6a0dc1a..c9caa1ece7ef 100644
--- a/drivers/mmc/host/mmc_spi.c
+++ b/drivers/mmc/host/mmc_spi.c
@@ -1208,7 +1208,10 @@ static int mmc_spi_probe(struct spi_device *spi)
 	 * that's the only reason not to use a few MHz for f_min (until
 	 * the upper layer reads the target frequency from the CSD).
 	 */
-	mmc->f_min = 400000;
+	if (spi->controller->min_speed_hz > 400000)
+		dev_warn(&spi->dev,"Controller unable to reduce bus clock to 400 KHz\n");
+
+	mmc->f_min = max(spi->controller->min_speed_hz, 400000);
 	mmc->f_max = spi->max_speed_hz;
 
 	host = mmc_priv(mmc);
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
