Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 916EAFF885A
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Apr 2026 18:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BE+R9VIX834vV+un5y63cXds6dN0xLY4e8IPjiw95eM=; b=vypvXurAOsc+2C
	q8/RCEn5rDAeGwawhG3vvU4J08lNAQYqmiWeqOu1VtEpQhg5xt+NXOyrdKTP8lFB0fWaazEpwxSzW
	rPGaJKLlxCpFTtiS1DZC3mdPkeQdYrQ2gCGOPE5Im9AayLKc8MB4dGS9jFRxB4gMrUhNRCq7gANDu
	yzCyfd7EOAicn2Erd7r63NGXO+IiqpE37o41PSx3p4QIsjf0CJonZyODYM3iJZIxT+FH+2VX7NkL8
	jY3/vkwgG+sHWEoGF1vQiFAuhxuO/vGi+arXHbqbYoEtLcIkBE5GScSKbHkrE/KZmQj4LJk7yTzOs
	EgWCPRNeZ34yD/nJOfXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHmuA-000000023w6-2LWH;
	Tue, 28 Apr 2026 18:11:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHmu9-000000023vX-0HDc
	for linux-riscv@lists.infradead.org;
	Tue, 28 Apr 2026 18:11:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4D1B461146;
	Tue, 28 Apr 2026 18:11:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39EFBC2BCB8;
	Tue, 28 Apr 2026 18:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777399888;
	bh=hcu3cIxbJISHC0gNcOJ/3vzK9uK9FIeZl/utZ+BQJeI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jcL3n8XpAx7icKFDvBsClKf6Gw5KcG554tH6tVzSIWStgDSy95i/134tB1jZWw4kI
	 np47TKkujTrR7kjslzhSEQU8uF9qpKM9uT9JbwJG80PP0BGHrWmZHgewCz/pktJhrb
	 TdCMBFqgpbIDTki8UMdZ/32I+X7UCUBAKVGCI0npeOBZiVWaCOlPD2q3PBmVB2hm6O
	 suXRV4PPvRanb2FcrKOzVJNYkMMjbBMz777HtI83ccIl3z8El0t9YBbrOXJrttARPk
	 dkdXs6ESwfA4T5gpVzuXKWVM/bNLWblKOyaONnv0Su/lJDcuGFA0QzAiIWw/Gx8l1/
	 50pXwmrmLCEog==
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
Subject: [PATCH v2 1/2] spi: microchip-core-qspi: report device on which timeout occured instead of which controller
Date: Tue, 28 Apr 2026 19:11:11 +0100
Message-ID: <20260428-porcupine-ninetieth-af00cb11b990@spud>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260428-surfboard-unhearing-96776be0495d@spud>
References: <20260428-surfboard-unhearing-96776be0495d@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1017; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=b+S0ABQzEEVZUT2TBB5xfoa+31SnTtUvSbdC2jeWohY=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJkffth71DNHf3BRv7pNkEc/6NuBF893zV/tHbxt/5Y55 jEbtqzQ6ShlYRDjYpAVU2RJvN3XIrX+j8sO5563MHNYmUCGMHBxCsBE2t8wMnwP081UD0z+dGxb zuoN7n4eBXeLVnWsPSCUnXwg8oIK6ytGhiVV6TP8Jz7aJH3lo4LsNpltEXlnChiyn/Lv+SLId8D DhxEA
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
index eab059fb0bc2c..c8b053c7c857b 100644
--- a/drivers/spi/spi-microchip-core-qspi.c
+++ b/drivers/spi/spi-microchip-core-qspi.c
@@ -604,7 +604,7 @@ static int mchp_coreqspi_prepare_message(struct spi_controller *ctlr, struct spi
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
