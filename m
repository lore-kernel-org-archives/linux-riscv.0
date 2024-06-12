Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05972C27C77
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jun 2024 15:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v8eAcZMo/2IA9d26beQPCeI6wH82qMiIFLI9+PigSwU=; b=nhjDrKNk2tJYKs
	gEjHzQB1y8LRzrUfrmJPJKmQ5c++O2nQyMssyUiXNOzNpbaBygKzqWDUE9x0xf6je59Y/f69/1cl9
	1dB+Wu8VH/JCq2+Gx6axVTMkabqRaGdtFxL806W57Qln8T9VSHD8TbGbK5P3+Rul/2GWj92vMqmTa
	jpqvUk1lomnqpDy1gEj8b1kxzrPyUXsfkbGpkUI17Aqz7io+MHcwu5fRWGLmISO66cbLyfLT4ysne
	XV8vDdbn5cwVPLUN6DgoaP/Zo0ZzD0yA7KxDwaj+RBCnCTmaHPh424G0SIJyg5UwELhC9W9ypytjD
	Nqpb8uqkqtyA2cUanKEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHQDg-0000000DEaE-2yR6;
	Wed, 12 Jun 2024 15:49:04 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHQDd-0000000DEYJ-3qp6
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jun 2024 15:49:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1B589614DD;
	Wed, 12 Jun 2024 15:49:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E301C4AF1A;
	Wed, 12 Jun 2024 15:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718207340;
	bh=LaagHmLtHa02PqrnfSRNf9Efh1AA8FhF1xWGgB7qiDU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aqL4E593HE6FBLtOmyFIOKrIMD5dhcFtcEOaqwRwBYlr1rbWEEnLlf+zTxQsPG65G
	 ofyRr1EkMcr5oB38/1mB9k1dAFO6+hhLIxiySP3+gG+tYPX3W/WIyyArM7LmBzlOJp
	 pe1n/JtogylSDtRVl/c7V6jIga7KJVIUZBt9kS24wUBdwNH6zXXHl/nfUM1HFOWgrX
	 d3H5OPazlmfW+yiIBbwmMvz56hzvj6qAdlk3D/7/XynHvKCVwzO2CP0NEGapX1NXBb
	 LsdvXZFG0HfeubchgL3r6NlvS3hCh4tN0Gse4UlNlG9JN/2hkm0yU3rztyxNQxyPA4
	 vUhU6xhQSehLw==
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
Subject: [RFC v1 3/3] spi: microchip-core-qspi: set min_speed_hz during probe
Date: Wed, 12 Jun 2024 16:48:33 +0100
Message-ID: <20240612-attach-distaste-5c32099c1a76@spud>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240612-brigade-shell-1f626e7e592f@spud>
References: <20240612-brigade-shell-1f626e7e592f@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=943; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=AySwqgGoZBkSC9iafcJMybZD7Uy/tn7eS25Dxx5hvrk=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGmZh32tHs8R7f/0n1feU7W14kqKbsjk9CkTQhyVVnyZs uC+/BGhjlIWBjEOBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAEykSJiR4RuXXZvMB8HqXcFv C+00E083mzUE73ea47Wi9hRP4PzyHIa/4pvd6hnvGbExncp1ZFykb6bmnc/84fHZZYnrQ1Mbi+Y xAgA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_084902_033861_B11CDB96 
X-CRM114-Status: UNSURE (   7.99  )
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

From: Conor Dooley <conor.dooley@microchip.com>

The controller's minimum possible bus clock is 1/30 the rate of the
input clock. Naively set the minimum bus clock speed the controller
is capable of during probe, assuming that the rate will never reduce
further.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/spi/spi-microchip-core-qspi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/spi/spi-microchip-core-qspi.c b/drivers/spi/spi-microchip-core-qspi.c
index 1b23a38c155c..a549911b2f66 100644
--- a/drivers/spi/spi-microchip-core-qspi.c
+++ b/drivers/spi/spi-microchip-core-qspi.c
@@ -763,6 +763,7 @@ static int mchp_coreqspi_probe(struct platform_device *pdev)
 	ctlr->transfer_one_message = mchp_coreqspi_transfer_one_message;
 	ctlr->num_chipselect = 2;
 	ctlr->use_gpio_descriptors = true;
+	ctlr->min_speed_hz = clk_get_rate(qspi->clk) / 30;
 
 	ret = devm_spi_register_controller(&pdev->dev, ctlr);
 	if (ret)
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
