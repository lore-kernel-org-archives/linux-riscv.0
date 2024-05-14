Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F211C04FFE
	for <linux-riscv@archiver.kernel.org>; Tue, 14 May 2024 10:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nZ4//DKhTW6XbHMQdep/Pmy2gPMBb5gpozVDi5nRenY=; b=Vw+niiWlqz3cxV
	nqpYHUrz43b4MlNPWKPutCKPp8ByqqrRrk3Fnwzgv2d4iWXtVMnavGLhVT7H5oYenkMWV/0qdpxil
	FjwdTL0v8DQ+suz5deIKmhheK6eZlp97zkNosNC4ml0leAFljuAlUs9DAYfowrLQ0t1UmfclSqC4w
	kaGaccd1sl5Lkdcv+FcMkXMEo8O8A+Y9dQe8XscKRgYTXQ2JJs7w/kB34bbF22Zo23QsTx3/U1hBF
	laKJCtZcF6muPDVFhG+DorLZ2Cnf7p9PD3KN4X9TqX8KTzBizx6Jt86k4j/TYz5uWhVtm3f5Q4bL6
	80aETk1Mm95eAJAQxCuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6pep-0000000FcMk-2wxg;
	Tue, 14 May 2024 10:45:19 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6pem-0000000FcL8-3tPh
	for linux-riscv@lists.infradead.org;
	Tue, 14 May 2024 10:45:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1715683516; x=1747219516;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rlzB6/rDQbIjLk5lmcHcPcaK9fFkQm1X7kDxNwBZFVc=;
  b=EnJgigltVCzLIC80VAF/uqfT/pjOUXSDj+u0VwRddvj6/YwcoNCL3c7n
   nGHW/xdF6gPwGAoTHqjEMqpYpst+bIe64X4FLKenC4xXokccseTlU3Oyf
   eVO21iJoa7Kra4GkEllZhS68kqu6wFrhdQym2WC732qd5k9n+iXAok9IT
   hF619S9zMAX6c8nbQ/hm4RgaNU/hg+apa+bRnYl9gHM6Sf1jMKAlnvJa8
   5NFx0HAWTNhxiYxjoydcq6GM2qxNLl4GO05FykwADso77SzOpviPKOgTb
   afhRXO5qOHoMoi5cZO9PkgafMyD7GTZBV8SeoCpNpFTQkYgQwBx4wl6yv
   g==;
X-CSE-ConnectionGUID: CRVhllyDQl2XuPQNxlB5Rg==
X-CSE-MsgGUID: nK6nDysRTn+Y+1qP6SwjEQ==
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="24625780"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 14 May 2024 03:45:14 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 14 May 2024 03:45:03 -0700
Received: from Lily.microchip.com (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 14 May 2024 03:45:01 -0700
From: Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>
To: Mark Brown <broonie@kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-spi@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>, Conor Dooley
	<conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>,
	<valentina.fernandezalanis@microchip.com>,
	<prajna.rajendrakumar@microchip.com>
Subject: [PATCH v2 3/3] spi: spi-microchip-core: Add support for GPIO based CS
Date: Tue, 14 May 2024 11:45:08 +0100
Message-ID: <20240514104508.938448-4-prajna.rajendrakumar@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240514104508.938448-1-prajna.rajendrakumar@microchip.com>
References: <20240514104508.938448-1-prajna.rajendrakumar@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240514_034517_052283_9A92637A 
X-CRM114-Status: GOOD (  11.26  )
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

The SPI "hard" controller within the PolarFire SoC is capable of
handling eight CS lines, but only one CS line is wired. Therefore, use
GPIO descriptors to configure additional CS lines.

Signed-off-by: Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>
---
 drivers/spi/spi-microchip-core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/spi/spi-microchip-core.c b/drivers/spi/spi-microchip-core.c
index c10de45aa472..6246254e1dff 100644
--- a/drivers/spi/spi-microchip-core.c
+++ b/drivers/spi/spi-microchip-core.c
@@ -258,6 +258,9 @@ static int mchp_corespi_setup(struct spi_device *spi)
 	struct mchp_corespi *corespi = spi_controller_get_devdata(spi->controller);
 	u32 reg;
 
+	if (spi_is_csgpiod(spi))
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
