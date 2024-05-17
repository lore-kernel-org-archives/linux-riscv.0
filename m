Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E0DEC25B7A
	for <linux-riscv@archiver.kernel.org>; Fri, 17 May 2024 09:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HS0/Yg1AkeCq0YDTtKwsNrVbB9zdV5Js6QFt/2Pn8a4=; b=HCUBGj7SKsgFdu
	c96b0ddjCKCqzlUaQpFiDg5coSLpx1fx961iwlcYJxJe1pEsKo1LZWnsFRGGqxZPYs09cbJayMaE0
	SfxeFsRY+QQnHoXQ8gw4ATiraFkyQqW7ZImwbuITM4KIyiKgoQ8qBIirgHdpaBNKQq0t12JiAHHY3
	2raaXbcgDIyfBuOHzMsY4w3rsVQkT2iKYKwDYlwQDEFgHhqKmMISiJgL5Njvv/r90hdVI5iHNZ3lF
	R2M7bvjImRumJYx3dBEqUuseMchykX2CPAqIhTj8eIQQkqoMowO5V9qXSNN7l8rE9eA2S7ifXR2IN
	3hFZaY5ZyNCFlHHNsJlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7tbd-00000007Idt-3ukT;
	Fri, 17 May 2024 09:10:25 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7tbX-00000007Ibk-48j9
	for linux-riscv@lists.infradead.org;
	Fri, 17 May 2024 09:10:21 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id CBE952000D;
	Fri, 17 May 2024 09:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715937015;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EwF/BXW9VuWyeGGtBGV6L8qqYk6pudzw8mEgBwrvKoE=;
	b=A7Sibcpp7VdAE4eFezK6+SgcyDBETp+BQszGyTDm2sWcMBlnnD3GRRTuWhGwo+/epLz1VF
	8h0LOHICpOrlxlkh8oUUETFz6ZsRpAaRFadsD4pq9AqPRWfJ2z36uf2LV4A9FRbfyvO6ez
	G6QOU5slbuubU5awFaKUIIh3svrzWLcQ+GGAXN/2MXEXrMWf/pZ8jYMx97PQBd5lU04Ezl
	JJdr+5nrQQ93mXee+/ZzayLREv9CvA477djVCbZOjc0J2FLcM24BuOuqNR1DYk57L5Rx4u
	SPcGNFFdY/KvgK5sJ7ZiYlfUAwfJWPKHSVlGSwzXkdQUll80OHDpWjxFgUruyA==
From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Date: Fri, 17 May 2024 11:09:54 +0200
Subject: [PATCH v2 2/3] riscv: dts: thead: Add TH1520 I2C nodes
MIME-Version: 1.0
Message-Id: <20240517-i2c-th1520-v2-2-d364d135ccc6@bootlin.com>
References: <20240517-i2c-th1520-v2-0-d364d135ccc6@bootlin.com>
In-Reply-To: <20240517-i2c-th1520-v2-0-d364d135ccc6@bootlin.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, 
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
 Drew Fustini <dfustini@tenstorrent.com>, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Conor Dooley <conor@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>, 
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>
X-Mailer: b4 0.13.0
X-GND-Sasl: thomas.bonnefille@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240517_021020_348705_1A5AC781 
X-CRM114-Status: UNSURE (   7.15  )
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

Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
---
 arch/riscv/boot/dts/thead/th1520.dtsi | 50 +++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index de7116290ca4..ae6cf4c441cf 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -252,6 +252,36 @@ gpio2: gpio-controller@0 {
 			};
 		};
 
+		i2c0: i2c@ffe7f20000 {
+			compatible = "thead,th1520-i2c", "snps,designware-i2c";
+			reg = <0xff 0xe7f20000 0x0 0x4000>;
+			interrupts = <44 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk CLK_I2C0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c1: i2c@ffe7f24000 {
+			compatible = "thead,th1520-i2c", "snps,designware-i2c";
+			reg = <0xff 0xe7f24000 0x0 0x4000>;
+			interrupts = <45 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk CLK_I2C1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c4: i2c@ffe7f28000 {
+			compatible = "thead,th1520-i2c", "snps,designware-i2c";
+			reg = <0xff 0xe7f28000 0x0 0x4000>;
+			interrupts = <48 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk CLK_I2C4>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		gpio@ffe7f38000 {
 			compatible = "snps,dw-apb-gpio";
 			reg = <0xff 0xe7f38000 0x0 0x1000>;
@@ -342,6 +372,16 @@ uart2: serial@ffec010000 {
 			status = "disabled";
 		};
 
+		i2c3: i2c@ffec014000 {
+			compatible = "thead,th1520-i2c", "snps,designware-i2c";
+			reg = <0xff 0xec014000 0x0 0x4000>;
+			interrupts = <47 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk CLK_I2C3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		dmac0: dma-controller@ffefc00000 {
 			compatible = "snps,axi-dma-1.01a";
 			reg = <0xff 0xefc00000 0x0 0x1000>;
@@ -416,6 +456,16 @@ uart5: serial@fff7f0c000 {
 			status = "disabled";
 		};
 
+		i2c5: i2c@fff7f2c000 {
+			compatible = "thead,th1520-i2c", "snps,designware-i2c";
+			reg = <0xff 0xf7f2c000 0x0 0x4000>;
+			interrupts = <49 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk CLK_I2C5>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		timer4: timer@ffffc33000 {
 			compatible = "snps,dw-apb-timer";
 			reg = <0xff 0xffc33000 0x0 0x14>;

-- 
2.45.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
