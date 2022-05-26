Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEA27C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 26 May 2022 14:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+nE8ta0opIUGvkMkix59BXpNEAUbY6tzgs9NMayRMBU=; b=0tNckPUu5ceuq2
	HfOrLz6iGSAFpycFMGE+KXL3FKWucn+7j9mKzyYWUM6IR2xpXrtM1+ar/dN2FYBB4ZxQ160dGqpi2
	fLc7l4O2+Rku8070YKrYyq0tjidEXvbcsjJPVFheRBHCimevf81P11M8FVKl39G9OU+dlCS8i8Nyc
	XdnkpgcXL0SwJoAEmQxzEFTUBFLXfcFfnQBrmNkQzaOAX2TCDe1JXDZ0OkpwOABoDxZxtUaY3N1IR
	c/WYJkUj4OZnbA0sSgKbxYXdOKzgGpo8scaCA3/SmgrOnzVjFPLDNZDWlsl4jmfx8oCxq05PexSwA
	8CztznBpRvj8RO9x8LHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuEWI-00F8GS-7O; Thu, 26 May 2022 14:31:22 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuEWE-00F8F5-9U
	for linux-riscv@lists.infradead.org; Thu, 26 May 2022 14:31:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1653575478; x=1685111478;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Ed2yd8aNhL4cQz8uqrkE0QxcuOYwBtlwGyXKgcop6bw=;
  b=xKawfrcL6rMMYx4AX3pK1EA73KNvpXT8IX+paw4MgLTMqfZNG9QqO2AP
   YxT76GQC6OP03yxmHsZL5wIjaPG2ut3RRtE6xDgKTNFk1V/y/4wOeUUb0
   4EfCQNl2YdeqAbNTwpESQ1Dq0bmMUMePyKXPaASEObi62VtDbkeMuG0Zm
   BByWVkvSD3iHweFTKklc5rW8p6YUXSwtYVmd14YWtkn1i5jukvvssEs5m
   t+eBzTpJamxPQI2WwDOwR73yKjtLL+JnXabZOfWLONiKRrJQhEfqrEoGI
   J6FOd1xxOKeFTTtF4GV8rsZ+LZnb2AckEGqu05shuFQI6ybcmIVHbSrt3
   g==;
X-IronPort-AV: E=Sophos;i="5.91,252,1647327600"; 
   d="scan'208";a="160739016"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 26 May 2022 07:31:12 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 26 May 2022 07:31:12 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Thu, 26 May 2022 07:31:09 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley
	<conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>,
	Cyril Jean <Cyril.Jean@microchip.com>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Rob
 Herring" <robh@kernel.org>
Subject: [PATCH] riscv: dts: microchip: remove spi-max-frequency property
Date: Thu, 26 May 2022 15:29:07 +0100
Message-ID: <20220526142906.2285607-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220526_073118_434939_03DE1B8E 
X-CRM114-Status: UNSURE (   7.74  )
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

spi-max-frequency property is supposed to be a per SPI peripheral device
property, not a SPI controller property, so drop it.

Reported-by: Rob Herring <robh@kernel.org>
Link: https://lore.kernel.org/lkml/20220526014141.2872567-1-robh@kernel.org/
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
index c5c9d1360de0..40b11b530bca 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
@@ -274,7 +274,6 @@ spi0: spi@20108000 {
 			interrupt-parent = <&plic>;
 			interrupts = <54>;
 			clocks = <&clkcfg CLK_SPI0>;
-			spi-max-frequency = <25000000>;
 			status = "disabled";
 		};
 
@@ -286,7 +285,6 @@ spi1: spi@20109000 {
 			interrupt-parent = <&plic>;
 			interrupts = <55>;
 			clocks = <&clkcfg CLK_SPI1>;
-			spi-max-frequency = <25000000>;
 			status = "disabled";
 		};
 
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
