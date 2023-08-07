Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD478C001B0
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Aug 2023 19:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=R2Zok0ErewZZPk7aF2ktULaINFOt6B0xyFTwj3WdBzU=; b=pDQlVgYm5CRVWw
	JndNGwpFC5ILBHoobXiqY2RuYpcD9Rc90nQoRNF1TP6kX+ZjVdjZrr9zyxCiHWP+c4hjkb0tCyqGv
	8RmwYz2j79B7xp1V43Kchh+YRx/fHEagqXcn/BDALxsVrG5MNRXvFhrsZtgmeo79vDF4Xp10aEl8i
	kBYLK0OCxK4xy67rqiBZYcHuxIPUwSNtfu3NKnjEMNDuPlqB+9lk156Aqp9geFYn5FjpEJsPScRQe
	YLpns2xHpPFFrjjW8ZWzk7hDfPxbUchfOI18QXXzpyPC/FvhbHsRzDLpQ0ObiTE/RJacRFMAHcXcc
	TCpI6RnTQdYk1TKLB1HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qT5mi-000UV2-0S;
	Mon, 07 Aug 2023 19:20:56 +0000
Received: from out-94.mta1.migadu.com ([95.215.58.94])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qT5mf-000USm-1E
	for linux-riscv@lists.infradead.org;
	Mon, 07 Aug 2023 19:20:54 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
	t=1691436036;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3MO64bm8DFoP+FtMNEmWQlPXqTMO4IBSAv4wntQ0uL4=;
	b=vDj1LhgzTqUvdYIJ+GyYNE/S8OovxIjbJAVnxEAJfbetB2Bs8LgZrUgjIh5e9wb2/CSec/
	T6ClYlSomL585prfZpsCyjU1Yf/RigIoIk+BSNJa2xVEEKj2i7zjsCd5wgKlFmVeLFL16c
	Pv6WpVr/YpPZFiTE4Am8W7lEnPOghWTv1sxC+jaamcOwz9wwpAdnRvdIvEPjV2woQ7R6y5
	aJfWJlt+sUyrZhv1yYqMACRb618Kmg5tbsYnLkserZbGzBHulv4rkNDXMUvmX90psWhoEe
	ViGgRiWSf+46Dgz+GRls+3yOA/18n9rNoU36Av4tPtBbttJEViMFeW1B/VphVA==
From: John Watts <contact@jookia.org>
To: linux-sunxi@lists.linux.dev
Subject: [PATCH v3] riscv: dts: allwinner: d1: Add CAN controller nodes
Date: Tue,  8 Aug 2023 05:19:52 +1000
Message-ID: <20230807191952.2019208-1-contact@jookia.org>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230807_122053_584688_5C483DF8 
X-CRM114-Status: UNSURE (   9.70  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>, John Watts <contact@jookia.org>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Maksim Kiselev <bigunclemax@gmail.com>, linux-riscv@lists.infradead.org, Marc Kleine-Budde <mkl@pengutronix.de>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The Allwinner D1, T113 provide two CAN controllers that are variants
of the R40 controller.

I have tested support for these controllers on two boards:

- A Lichee Panel RV 86 Panel running a D1 chip
- A Mango Pi MQ Dual running a T113-s3 chip

Both of these fully support both CAN controllers.

Signed-off-by: John Watts <contact@jookia.org>
---
Changes in v3:
- Set default pinctrl for can controller
- Moved can nodes to proper location
- Moved can pins to proper location

 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
index d59b4acf183a..24f2e70d5886 100644
--- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
@@ -52,6 +52,18 @@ pio: pinctrl@2000000 {
 			#gpio-cells = <3>;
 			#interrupt-cells = <3>;
 
+			/omit-if-no-ref/
+			can0_pins: can0-pins {
+				pins = "PB2", "PB3";
+				function = "can0";
+			};
+
+			/omit-if-no-ref/
+			can1_pins: can1-pins {
+				pins = "PB4", "PB5";
+				function = "can1";
+			};
+
 			/omit-if-no-ref/
 			clk_pg11_pin: clk-pg11-pin {
 				pins = "PG11";
@@ -356,6 +368,28 @@ i2c3: i2c@2502c00 {
 			#size-cells = <0>;
 		};
 
+		can0: can@2504000 {
+			pinctrl-names = "default";
+			pinctrl-0 = <&can0_pins>;
+			compatible = "allwinner,sun20i-d1-can";
+			reg = <0x02504000 0x400>;
+			interrupts = <SOC_PERIPHERAL_IRQ(21) IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_CAN0>;
+			resets = <&ccu RST_BUS_CAN0>;
+			status = "disabled";
+		};
+
+		can1: can@2504400 {
+			pinctrl-names = "default";
+			pinctrl-0 = <&can1_pins>;
+			compatible = "allwinner,sun20i-d1-can";
+			reg = <0x02504400 0x400>;
+			interrupts = <SOC_PERIPHERAL_IRQ(22) IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_CAN1>;
+			resets = <&ccu RST_BUS_CAN1>;
+			status = "disabled";
+		};
+
 		syscon: syscon@3000000 {
 			compatible = "allwinner,sun20i-d1-system-control";
 			reg = <0x3000000 0x1000>;
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
