Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B536C4345F
	for <linux-riscv@archiver.kernel.org>; Thu,  2 May 2024 14:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XJUD0hJt6K6Rz0aV1/WrqZqO42txSNHPHchdYEPkdlo=; b=O20rZtZrOPe+PD
	oorCGie6A3py8HgYQhlTJe2Lbwxg0rmps15KEpN5hyO+AnyD2vLRfu+BG8fehMe/ezUY7AroWTDDP
	QC8hURAW2zqtQ6pv0xQ9vP5A4hWlsp2FU7KigD9BLJbOQqREOjvMX/n2Jx485bYO1EUfo81/Q1RHm
	JVOLreQOC6IrEn5rO4D9o7Vs/VOi4kbdboQ/SPNG73mp2cFDg5eSgeTeFvTv7ppt5A4OpEkATkIP1
	Jq5pzkinRYwdFcZCwZNw5xKh7tXmLDaH10o1U5Q3qry+R6aFf6JI7Qnp8eenmYIrd1YKlam1XYb7D
	JT7N6wzBxwHu9XvSY6gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2XWa-0000000CvvC-22ag;
	Thu, 02 May 2024 14:35:04 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2XWV-0000000Cvtw-3Yfh
	for linux-riscv@lists.infradead.org;
	Thu, 02 May 2024 14:35:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1714660499; x=1746196499;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=v9aRfS2wsTb+7Z0gnOhNLJHtPwt86gf3YphRSYDX72k=;
  b=AuJzXG8nWEiKIP/TcKpKN5yl9d8XyPwWLlxoav8rT0r3ZXWgBoNeTnRg
   1ZPBFIYlQPoV6oLhOddWATSopxIcaiPRj9B3V2EBEgH4B6Iczu+jSw1hk
   P17K9jfGCEUzZF7C8plBwgvUGkckSNwiDxo05U148asuKrmbknNlzRsOS
   6TXsP+C2cepmq7rRpqXb4rOuahegxw1gny00qCTav0A76qAn6l1UydJHQ
   0bRvMziSC4b6qXpG6CJzeIGqU3nSeAzP9qHnktxZOMdnTJkVq4UfAZF8e
   CLYhpyYk1Bu8GWRKMCOZHwDzXQu2z5NM5RrLGemCTs9g3Y+ljNavUwW5A
   w==;
X-CSE-ConnectionGUID: 6Y5bhyOoSXq5FFQlA0lIog==
X-CSE-MsgGUID: yXfQee23ReykRQVaYGMsQg==
X-IronPort-AV: E=Sophos;i="6.07,247,1708412400"; 
   d="scan'208";a="23394531"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 02 May 2024 07:34:56 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 2 May 2024 07:34:46 -0700
Received: from Lily.microchip.com (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 2 May 2024 07:34:44 -0700
From: Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>
To: Mark Brown <broonie@kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-spi@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>, Conor Dooley
	<conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>,
	<valentina.fernandezalanis@microchip.com>, Prajna Rajendra Kumar
	<prajna.rajendrakumar@microchip.com>
Subject: [PATCH 1/3] spi: spi-microchip-core: Add support for GPIO based CS
Date: Thu, 2 May 2024 15:34:08 +0100
Message-ID: <20240502143410.12629-2-prajna.rajendrakumar@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240502143410.12629-1-prajna.rajendrakumar@microchip.com>
References: <20240502143410.12629-1-prajna.rajendrakumar@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240502_073459_970676_0C968295 
X-CRM114-Status: GOOD (  11.29  )
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

The SPI controller within the PolarFire SoC is capable of handling
multiple CS, but only one CS line is wired in the MSS. Therefore,
use GPIO descriptors to configure additional CS lines.

Signed-off-by: Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>
---
 drivers/spi/spi-microchip-core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/spi/spi-microchip-core.c b/drivers/spi/spi-microchip-core.c
index 634364c7cfe6..71886c27bca3 100644
--- a/drivers/spi/spi-microchip-core.c
+++ b/drivers/spi/spi-microchip-core.c
@@ -258,6 +258,9 @@ static int mchp_corespi_setup(struct spi_device *spi)
 	struct mchp_corespi *corespi = spi_controller_get_devdata(spi->controller);
 	u32 reg;
 
+	if (spi->cs_gpiod)
+		return 0;
+
 	/*
 	 * Active high targets need to be specifically set to their inactive
 	 * states during probe by adding them to the "control group" & thus
@@ -516,6 +519,7 @@ static int mchp_corespi_probe(struct platform_device *pdev)
 
 	host->num_chipselect = num_cs;
 	host->mode_bits = SPI_CPOL | SPI_CPHA | SPI_CS_HIGH;
+	host->use_gpio_descriptors = true;
 	host->setup = mchp_corespi_setup;
 	host->bits_per_word_mask = SPI_BPW_MASK(8);
 	host->transfer_one = mchp_corespi_transfer_one;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
