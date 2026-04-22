Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C54DF9EDF3
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Apr 2026 15:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZxOK8shR84triFALok4D9NAFLOPBeLREoisAN7skyco=; b=fwOlTPLcny8+xb
	5RYC0jAyhM1VnCysHYg9pWaSgiuHIqfF9G4fbsFs7Kl4CyG90hAiA/FYUSRkjac7SBkmLgPxiteWz
	K9dnkKP9TUJnC4s2JJstDwG5JRGlHz1Z7jg7zpsuEAlCIzRpsEWiYS8PXga1vBtPkZHkQ2mTdQk99
	WYGROnNX6wxJETKwmvw+ksxbsLd1E9iABJcjubs6GXDZuwbJHDRTMrgHy4/EH38hgT9vT39MCTRwL
	/pQ0RG1WVm11LKVYETW9GT+ut/LBAGRRLB3bZtnGsssEjRGYXjXis7p65VEujvrlL1Ou++AImkQae
	ten5Lm4QOhjm1u7/eaaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFZJz-0000000AQ6y-1Z2Y;
	Wed, 22 Apr 2026 15:16:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFZJw-0000000AQ6b-4388
	for linux-riscv@lists.infradead.org;
	Wed, 22 Apr 2026 15:16:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 65CB461330;
	Wed, 22 Apr 2026 15:16:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52B76C2BCAF;
	Wed, 22 Apr 2026 15:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776871015;
	bh=mm7l28cn3pCYCLf3GVDEBAVzraqXFwXdDi0avE3W0Dg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cPRCAYl3IEqxaXl+anejQi2GVfTs7FdWGaN7t3FXMVHbrX2wFpQXNewX0NF0e3OEu
	 4lNSuPHaeGt2yObFfzopY93ZcGC1V3s+fNn4d824Si9heoiQpNL3pFVu5z8lUMyXSd
	 YsxqPUmOaU0rqv/1IVxaI4QUVlWnapMuNtsq8kXPC0dZnOBfTf2UEYl5Ik0aehYjSK
	 Wzool//GKVKzocTEcC14O0/8YzN324j3cqWblv8ljCVfy32IBR6yswG3ucUQt0aWY2
	 DpZNhCdBTsMSlQoFRbYxexqmJBeD0BLgdIvjDEHYYsFI6pkZt5npau92VgwxtHW3Tp
	 nypy/fID2UciA==
From: Conor Dooley <conor@kernel.org>
To: broonie@kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Cyril Jean <cyril.jean@microchip.com>,
	Valentina.FernandezAlanis@microchip.com,
	linux-riscv@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/5] spi: microchip-core-qspi: report device on which timeout occured instead of which controller
Date: Wed, 22 Apr 2026 16:15:44 +0100
Message-ID: <20260422-apricot-wok-76d22d53d5fc@spud>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260422-foe-strength-a5d8ad650ef4@spud>
References: <20260422-foe-strength-a5d8ad650ef4@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1017; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=qRF8UGHvy5H5R9RLjT10J+zjZQsaD/qbyylMGRr28JU=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJkvnjlkBj6e7DNHJePXpJb9jcvkVX8zrT5a6X1E/s+2v rd5Ey6Yd5SyMIhxMciKKbIk3u5rkVr/x2WHc89bmDmsTCBDGLg4BWAi6X6MDJM/WVmsapYtFVw6 03CF5em87baLS87O+hZz5fC3q/sPlnQy/BWbxiWu9Dxv1Z6odD0rTw3NsCVic2xvnQ+T/HvnuEr EcVYA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
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

When prepare_message callbacks fail, the SPI core already reports which
controller the failure happened on. The corresponding code in the mem_ops
portion of the driver already reports the device a timeout occurred on,
so make the regular part of the driver do the same.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/spi/spi-microchip-core-qspi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-microchip-core-qspi.c b/drivers/spi/spi-microchip-core-qspi.c
index d39b04f9b6b38..629f785bd230b 100644
--- a/drivers/spi/spi-microchip-core-qspi.c
+++ b/drivers/spi/spi-microchip-core-qspi.c
@@ -635,7 +635,7 @@ static int mchp_coreqspi_prepare_message(struct spi_controller *ctlr, struct spi
 	ret = mchp_coreqspi_wait_for_ready(qspi);
 	if (ret) {
 		mutex_unlock(&qspi->op_lock);
-		dev_err(&ctlr->dev, "Timeout waiting on QSPI ready.\n");
+		dev_err(&m->spi->dev, "Timeout waiting on QSPI ready.\n");
 		return ret;
 	}
 
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
