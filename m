Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E5D2C43334
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jun 2022 06:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fWaWIrU8fzvfa6j+gHWJFkKYMpQZPviTfZjT3GYR+Ow=; b=BZ5KBlrfceTtjc
	cbVSVdffazwPa2YEwbq27KJxxEislvxUFIrY32KectDqzcbC27gjObB/U3GtBXB5t0r3DTSANLZFS
	LE5OHh6FGy0zWaE5wS5ik47cL0NvGidHGfjUe5xpanzWjNRPGUSwsD9FIiplusBYAAjZX4wA5uBby
	ZEwFGEsNaGrIUMEF73FA070VODDEUhxdTL1SkjsyjHEBdRcdHty6Ktc5a/2SCBw/wI2e1hStJEcld
	2PrhKhUIxYRqYB0rZ9zBwizk2hGMM3pko44RdjtHKtaaJpN1ZketrcuWhZbIRFfdN1jMmD9sJ+HSB
	bnEgeakqVWxx7lXXSbvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1jFV-000oC2-Il; Thu, 16 Jun 2022 06:45:01 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1jDx-000nFy-IA
	for linux-riscv@lists.infradead.org; Thu, 16 Jun 2022 06:43:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1655361805; x=1686897805;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=qjNRaKtVF9yCz0DwkTUlTSkU7fN8dVYg780X+fwpa0g=;
  b=ErzV/wREE4bZcEHJ0GV46iS0Hildvd6CltsIINPL6zONCUw9PU63NuTN
   xvezkqEam5YTRSsukYENyT0ap5ZCQoaKJCuzZbuIFsu2Um/zPjZOGkq4s
   pwWHTgfSycmITIYGBMrFDJIJB+oBJ5CWT5HELiN3hMAFds2SvLZa4mPzJ
   ejzsKLjAwBeTTvYEwzGUukBcI6JZhIYYbgoaXP4ztmhlTxVWKmBtNk39V
   2MkHHu7KEyGY8qx5BHIdrYdOFGodGc8tE/VwdLR03g4XzN72y7v2VdAKN
   7qKS6ADwAQWGDMPSE7s2gRgn8dwckL9zNzL3DppPkaL1HI5RSJfDGnC+o
   w==;
X-IronPort-AV: E=Sophos;i="5.91,304,1647327600"; 
   d="scan'208";a="160580445"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Jun 2022 23:43:20 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 15 Jun 2022 23:43:17 -0700
Received: from microchip-OptiPlex-5040.microchip.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Wed, 15 Jun 2022 23:43:13 -0700
From: Nagasuresh Relli <nagasuresh.relli@microchip.com>
To: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<palmer@dabbelt.com>
CC: <nagasuresh.relli@microchip.com>, <paul.walmsley@sifive.com>,
	<aou@eecs.berkeley.edu>, <conor.dooley@microchip.com>,
	<daire.mcnamara@microchip.com>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Rob
 Herring" <robh@kernel.org>
Subject: [PATCH] riscv: dts: microchip: remove spi-max-frequency property
Date: Thu, 16 Jun 2022 12:12:51 +0530
Message-ID: <20220616064251.586263-1-nagasuresh.relli@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_234325_716028_2ED615DA 
X-CRM114-Status: UNSURE (   6.97  )
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

Remove the spi-max-frequency property from the spi0 controller
node as it is supposed to be a per SPI peripheral device property.

Reported-by: Rob Herring <robh@kernel.org>
Link: https://lore.kernel.org/lkml/20220526014141.2872567-1-robh@kernel.org/
Signed-off-by: Nagasuresh Relli <nagasuresh.relli@microchip.com>
---
 arch/riscv/boot/dts/microchip/mpfs.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/boot/dts/microchip/mpfs.dtsi b/arch/riscv/boot/dts/microchip/mpfs.dtsi
index fb963559ba96..1a5aa8836099 100644
--- a/arch/riscv/boot/dts/microchip/mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/mpfs.dtsi
@@ -278,7 +278,6 @@ spi0: spi@20108000 {
 			interrupt-parent = <&plic>;
 			interrupts = <54>;
 			clocks = <&clkcfg CLK_SPI0>;
-			spi-max-frequency = <25000000>;
 			status = "disabled";
 		};
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
