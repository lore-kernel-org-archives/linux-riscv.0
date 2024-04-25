Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1430DC10F1A
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2024 08:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NMrv4COWAGzpYMuAnZadnjO+MuM/CMXv6YBhi8T358s=; b=SYd66p8DNzYLhT
	Fq7+CHN0hM2RMGuzKYhq8vgNdJZCkhUdak0kYPHqyTaOYY91ubkZkTzbk/UA/ZBLxkbyFJtwulQTr
	2jUFThQ2Z96sIkOtRTWUVpHCTFzbNO14iWOEvZyYG7/2XZJ5PAtlu7kpKxll6G5KXcpM8FHxk/Xrm
	OyRtq5pkMSFqpObdBuPx9s1wR2chfOtduTnYrkEQ+JPjhB8VidnDj697LWkKRWkdU0D2pvlSXrHOr
	IpqtzibCnNhsbU9UWdUyLda3fJ3RW1axLwfJb7P5BHg7qSOEeV2ULMFSXIe6AlzNz4UmjPY4kQR05
	ZtwJS/1CTbg8PUDcaHzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzuNt-00000007Q6t-0Q7a;
	Thu, 25 Apr 2024 08:23:13 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzuNm-00000007Q3K-0byf
	for linux-riscv@lists.infradead.org;
	Thu, 25 Apr 2024 08:23:07 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id CFF8920009;
	Thu, 25 Apr 2024 08:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1714033384;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wNBhZc5P3FFJ7PgVYztZ5Wmu9O6JEWzPXLoqXVlXc70=;
	b=fA57+TxGB/4H7ZGTgztIdQHhKXNEN8N2TG15Rwx1WZZFO5f2JAtLjW8NFRHpwsKcf28Yi/
	wy4Dy1dSJaE0djsTyxDOgWlspACp5pqXHYwr0/mcEkXmHbW4DGG+QtVHGJmKRWvk2hNuQe
	zFpMG4lGuwHhQOlJfGX8Wyi4VVhBBmAvZ5T8ysshf3SO/z1YxGXb5xb+IWvMuLWWOwdcln
	fjffGGDGD+6ykKsnDiZYuAbOoY2AkLMqbW8ZuRnaiRb6XD48Rq+iUXmrvwYIlzvXyJb4ei
	1chjeUhcLK9FtCNU2UkMUldRdiK0WeQu0ZvtmH5yzyhh4pasN2n4JJWx3qFvlw==
From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
To: jszhang@kernel.org,
	guoren@kernel.org,
	wefu@redhat.com,
	andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: miquel.raynal@bootlin.com,
	thomas.petazzoni@bootlin.com,
	linux-riscv@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Subject: [PATCH 3/4] riscv: dts: thead: Add TH1520 I2C nodes
Date: Thu, 25 Apr 2024 10:21:34 +0200
Message-ID: <20240425082138.374445-4-thomas.bonnefille@bootlin.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240425082138.374445-1-thomas.bonnefille@bootlin.com>
References: <20240425082138.374445-1-thomas.bonnefille@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: thomas.bonnefille@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_012306_488280_1BC05886 
X-CRM114-Status: UNSURE (   8.68  )
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

Add nodes for the five I2C on the T-Head TH1520 RISCV SoC.
All the I2C nodes are fed with the same clock named i2c_ic_clk.
As there is currently no clock support, the i2c_ic_clk is exposed
through a fixed-clock to mimic the existing nodes.

Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
---
 arch/riscv/boot/dts/thead/th1520.dtsi | 66 +++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index d2fa25839012..86ae507576dc 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -153,6 +153,12 @@ sdhci_clk: sdhci-clock {
 		#clock-cells = <0>;
 	};
 
+	i2c_ic_clk: i2c-clock {
+		compatible = "fixed-clock";
+		clock-frequency = <50000000>;
+		#clock-cells = <0>;
+	};
+
 	soc {
 		compatible = "simple-bus";
 		interrupt-parent = <&plic>;
@@ -258,6 +264,36 @@ portc: gpio-controller@0 {
 			};
 		};
 
+		i2c0: i2c@ffe7f20000 {
+			compatible = "thead,th1520-i2c", "snps,designware-i2c";
+			reg = <0xff 0xe7f20000 0x0 0x4000>;
+			interrupts = <44 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&i2c_ic_clk>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c1: i2c@ffe7f24000 {
+			compatible = "thead,th1520-i2c", "snps,designware-i2c";
+			reg = <0xff 0xe7f24000 0x0 0x4000>;
+			interrupts = <45 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&i2c_ic_clk>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c4: i2c@ffe7f28000 {
+			compatible = "thead,th1520-i2c", "snps,designware-i2c";
+			reg = <0xff 0xe7f28000 0x0 0x4000>;
+			interrupts = <48 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&i2c_ic_clk>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		gpio3: gpio@ffe7f38000 {
 			compatible = "snps,dw-apb-gpio";
 			reg = <0xff 0xe7f38000 0x0 0x1000>;
@@ -312,6 +348,16 @@ portb: gpio-controller@0 {
 			};
 		};
 
+		i2c2: i2c@ffec00c000 {
+			compatible = "thead,th1520-i2c", "snps,designware-i2c";
+			reg = <0xff 0xec00c000 0x0 0x4000>;
+			interrupts = <46 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&i2c_ic_clk>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		uart2: serial@ffec010000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0xff 0xec010000 0x0 0x4000>;
@@ -322,6 +368,16 @@ uart2: serial@ffec010000 {
 			status = "disabled";
 		};
 
+		i2c3: i2c@ffec014000 {
+			compatible = "thead,th1520-i2c", "snps,designware-i2c";
+			reg = <0xff 0xec014000 0x0 0x4000>;
+			interrupts = <47 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&i2c_ic_clk>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		dmac0: dma-controller@ffefc00000 {
 			compatible = "snps,axi-dma-1.01a";
 			reg = <0xff 0xefc00000 0x0 0x1000>;
@@ -394,6 +450,16 @@ uart5: serial@fff7f0c000 {
 			status = "disabled";
 		};
 
+		i2c5: i2c@fff7f2c000 {
+			compatible = "thead,th1520-i2c", "snps,designware-i2c";
+			reg = <0xff 0xf7f2c000 0x0 0x4000>;
+			interrupts = <49 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&i2c_ic_clk>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		timer4: timer@ffffc33000 {
 			compatible = "snps,dw-apb-timer";
 			reg = <0xff 0xffc33000 0x0 0x14>;
-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
