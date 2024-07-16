Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78406C3DA59
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Jul 2024 10:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QVvAs8vt9JdZ5ZfEG1I2nDgO0gboF43pFCOHIr1eJ8s=; b=kEL2okizwEzRJW
	Eevn9pECBe4cSFV842k/sjh4O582F4ZvZZgiatc58Kc8Mh0oMC3sFbFrRQDxrCzlyTkthsgfXfN78
	IIZtluqTnv1yNtgYuwp8QVVAz6N+4AKisdDNCGEYgAYQgqOQSmZAfob3LlDM85wHEcg5Uc8i1+HSf
	Z5eKAFIxeIbbnoY5vPyjD7bSj0FHcajIodogIyQ1Z3SCnIc4Eo9do5ejkgdg7rlcw9nYlAI/iSJ59
	iLyHAmLHjAVkdFlfCFfsToS8HGDdXPTaGlWPF0la4+AIamjp+Xloq067QBpxniNNO1aoDjdraC9EW
	cEgKkOFt7LCQJdpDxXAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTfpL-0000000A6xr-3uT2;
	Tue, 16 Jul 2024 10:54:35 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTfpI-0000000A6wp-2TTZ
	for linux-riscv@lists.infradead.org;
	Tue, 16 Jul 2024 10:54:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1721127272; x=1752663272;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=6gdpDGE1/LIdEVfgCRKL8aaj9UTnYSsTvPqQ935Y1Lg=;
  b=vaLflb1aB+QQS22i1BzJWayEyXkAVS2aG4dgYfiDxY6eP7dlaU80zafc
   Pcob67z8ZUM5Ty0m9c8Jdg4/TOHoq9DLW9RgLlJHg63TQOCBY/6JDC5RM
   5DpZleZRfgsmo9Z32rGR6WCxeCfXtO2nYDTtt7PqqxPZdl3djlEuiEagR
   0jvpGfhySD5EJ5ca4TWcWri1o5DkaQF/DzzvdYCeEjrYWgGOXQ48xxoXN
   VirWN86L8FebfPUI9in1hwBfg+1905I7cUJlmmr3R+7xabB4kCpKtAsT+
   2Xjy9OzPuuzFYrwinbAaJyIcW/m/2vmDkIOy4yt07FgU0BTPfC0z21Jea
   A==;
X-CSE-ConnectionGUID: /vnhTfboQ6C0iy9Ax+QmOQ==
X-CSE-MsgGUID: SCamelLoSPSu/5eVa//GXg==
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; 
   d="scan'208";a="196700543"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 16 Jul 2024 03:54:30 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Jul 2024 03:54:26 -0700
Received: from wendy.microchip.com (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 16 Jul 2024 03:54:24 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <linux-riscv@lists.infradead.org>
CC: <conor@kernel.org>, <conor.dooley@microchip.com>, Emil Renner Berthing
	<kernel@esmil.dk>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, William Qiu
	<william.qiu@starfivetech.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v1] riscv: dts: starfive: remove non-existant spi device from jh7110-common.dtsi
Date: Tue, 16 Jul 2024 11:54:00 +0100
Message-ID: <20240716-majesty-antler-d9bedc7fd0af@wendy>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1639; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=6gdpDGE1/LIdEVfgCRKL8aaj9UTnYSsTvPqQ935Y1Lg=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGnTAj1CfUt+8dRlTvH4E1GlMZ3FW7LF8/WMJzvr5TyqQvdE c6/pKGVhEONgkBVTZEm83dcitf6Pyw7nnrcwc1iZQIYwcHEKwEQe7mH4X6n61TNXbu/6kHdG9nPKrh pWvtOOfPztX2HFvPX/XQ9qRjAyrIj1lV3frCa3KfVnyovg1cn7mPdcDL9QfNKy2DN7b74JAwA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240716_035432_763225_97ABCC01 
X-CRM114-Status: GOOD (  11.62  )
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

There is no rohm,dh2228fv on any of supported JH7110 boards - in fact
the dh2228fv almost certainly does not exist as it is not a valid Rohm
part number. Likely a typo by Maxime when adding the device originally,
and should have been bh2228fv, but these boards do not have a bh2228fv
either! Remove it from jh7110-common.dtsi - pretending to have a device
so that the spidev driver will be bound by Linux is not acceptable.

Fixes: 74fb20c8f05d ("riscv: dts: starfive: Add spi node and pins configuration")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
CC: Emil Renner Berthing <kernel@esmil.dk>
CC: Conor Dooley <conor@kernel.org>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>
CC: Palmer Dabbelt <palmer@dabbelt.com>
CC: Albert Ou <aou@eecs.berkeley.edu>
CC: William Qiu <william.qiu@starfivetech.com>
CC: linux-riscv@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
---
 arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
index 8ff6ea64f048..395436ec0f97 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
@@ -346,12 +346,6 @@ &spi0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&spi0_pins>;
 	status = "okay";
-
-	spi_dev0: spi@0 {
-		compatible = "rohm,dh2228fv";
-		reg = <0>;
-		spi-max-frequency = <10000000>;
-	};
 };
 
 &sysgpio {
-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
