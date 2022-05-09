Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8715C433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  9 May 2022 14:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bYLqkozg96s3byTP38sq5BavXokOx8xJBKwTtxDTc04=; b=4aDLpbVZm9SbBk
	frW9jF7DWRE7FNzhlkmerePI9DmZKgamGMytkYiweBDJY9qVNHdpCcALD98sxIKc2OhaKhcqiq6Z2
	2WZfUpoTmyUXNOkUHDZ/+RSYzIrBW/6DKo/un1qVdj/faHYVMu7vD2hU4+JkwyTs5IDp2f/yb3sWX
	9IzOYZRHLANK6koTyGPUCeMpWIgKY2yr+vjCu2DLtPCfND6jDq3Z0D4F0zHVnbagzsF3jYdc8mlpr
	4ONb4Qz/Vsx4idZz1uatLzS2UHt4f5kxtfr5dYGuTgW49oBcgeOTnM7eq50nMN6Mat0hjSnXtRMFJ
	aKNo82/94EdV1oXgvh/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1no4M6-00Eq4j-JM; Mon, 09 May 2022 14:27:22 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1no4M1-00Eq1E-UH
 for linux-riscv@lists.infradead.org; Mon, 09 May 2022 14:27:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1652106437; x=1683642437;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3ojOsUB0BmRtwo5gMeoeGrNl3U9+C7e6Z5b5OxtO0A8=;
 b=YMNsIjAsIzcwmyjD6vw0WO6/IuANKAru9fAmr9QLJUe9EHqRQxaRyoF2
 JIqxW8TcY/XiqaiIk7jOhzpq3h3t6txGcAykxCjVJ5u8XhLWufUUh7NOD
 ckrKIEYnIAOtA6y9oalDbwGNXAldu/2dSkJtF+tfUVRh8OTbKIkLMHilW
 29VEtr/RX0y7fgPpyCabMu8zDrADYb46MwrOght0CUrpizhzYZmLkG5Qy
 8Km3T5y0VNOuqhBT1StGF5vubdjQLHq7dFaVYMgwJbf63Z4J3I4XncNfh
 6NZV9A5whl8rWzQtCojCGbicCQp2FqG0EQSyoN48STOlv3hmGFDKyQoRO g==;
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="163251770"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 09 May 2022 07:27:17 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 9 May 2022 07:27:16 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Mon, 9 May 2022 07:27:14 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley
 <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>,
 Cyril Jean <Cyril.Jean@microchip.com>, <devicetree@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <heiko@sntech.de>, Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v5 10/10] riscv: dts: icicle: sort nodes alphabetically
Date: Mon, 9 May 2022 15:26:11 +0100
Message-ID: <20220509142610.128590-11-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.2
In-Reply-To: <20220509142610.128590-1-conor.dooley@microchip.com>
References: <20220509142610.128590-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_072718_013104_F254E7BD 
X-CRM114-Status: GOOD (  10.10  )
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

The icicle device tree is in a "random" order, so clean it up and sort
its elements alphabetically to match the newly added PolarBerry dts.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../boot/dts/microchip/mpfs-icicle-kit.dts    | 104 +++++++++---------
 1 file changed, 52 insertions(+), 52 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
index 9cd1a30edf2c..044982a11df5 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
+++ b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
@@ -43,23 +43,57 @@ ddrc_cache_hi: memory@1000000000 {
 	};
 };
 
-&refclk {
-	clock-frequency = <125000000>;
+&core_pwm0 {
+	status = "okay";
 };
 
-&mmuart1 {
+&gpio2 {
+	interrupts = <53>, <53>, <53>, <53>,
+		     <53>, <53>, <53>, <53>,
+		     <53>, <53>, <53>, <53>,
+		     <53>, <53>, <53>, <53>,
+		     <53>, <53>, <53>, <53>,
+		     <53>, <53>, <53>, <53>,
+		     <53>, <53>, <53>, <53>,
+		     <53>, <53>, <53>, <53>;
 	status = "okay";
 };
 
-&mmuart2 {
+&i2c0 {
 	status = "okay";
 };
 
-&mmuart3 {
+&i2c1 {
 	status = "okay";
 };
 
-&mmuart4 {
+&i2c2 {
+	status = "okay";
+};
+
+&mac0 {
+	phy-mode = "sgmii";
+	phy-handle = <&phy0>;
+	status = "okay";
+};
+
+&mac1 {
+	phy-mode = "sgmii";
+	phy-handle = <&phy1>;
+	status = "okay";
+
+	phy1: ethernet-phy@9 {
+		reg = <9>;
+		ti,fifo-depth = <0x1>;
+	};
+
+	phy0: ethernet-phy@8 {
+		reg = <8>;
+		ti,fifo-depth = <0x1>;
+	};
+};
+
+&mbox {
 	status = "okay";
 };
 
@@ -78,74 +112,43 @@ &mmc {
 	status = "okay";
 };
 
-&spi0 {
-	status = "okay";
-};
-
-&spi1 {
-	status = "okay";
-};
-
-&qspi {
+&mmuart1 {
 	status = "okay";
 };
 
-&i2c0 {
+&mmuart2 {
 	status = "okay";
 };
 
-&i2c1 {
+&mmuart3 {
 	status = "okay";
 };
 
-&i2c2 {
+&mmuart4 {
 	status = "okay";
 };
 
-&mac0 {
-	phy-mode = "sgmii";
-	phy-handle = <&phy0>;
+&pcie {
 	status = "okay";
 };
 
-&mac1 {
-	phy-mode = "sgmii";
-	phy-handle = <&phy1>;
+&qspi {
 	status = "okay";
-
-	phy1: ethernet-phy@9 {
-		reg = <9>;
-		ti,fifo-depth = <0x1>;
-	};
-
-	phy0: ethernet-phy@8 {
-		reg = <8>;
-		ti,fifo-depth = <0x1>;
-	};
 };
 
-&gpio2 {
-	interrupts = <53>, <53>, <53>, <53>,
-		     <53>, <53>, <53>, <53>,
-		     <53>, <53>, <53>, <53>,
-		     <53>, <53>, <53>, <53>,
-		     <53>, <53>, <53>, <53>,
-		     <53>, <53>, <53>, <53>,
-		     <53>, <53>, <53>, <53>,
-		     <53>, <53>, <53>, <53>;
-	status = "okay";
+&refclk {
+	clock-frequency = <125000000>;
 };
 
 &rtc {
 	status = "okay";
 };
 
-&usb {
+&spi0 {
 	status = "okay";
-	dr_mode = "host";
 };
 
-&mbox {
+&spi1 {
 	status = "okay";
 };
 
@@ -153,10 +156,7 @@ &syscontroller {
 	status = "okay";
 };
 
-&pcie {
-	status = "okay";
-};
-
-&core_pwm0 {
+&usb {
 	status = "okay";
+	dr_mode = "host";
 };
-- 
2.35.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
