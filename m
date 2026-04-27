Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 055F0FF8861
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Apr 2026 07:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WJThkbBIMlm2zSbK5EkmtusY5FAEaXdq0B3nf7h+wyQ=; b=UY92Bnolq31skK
	TKXibwld4zrF0DNZ5UEkorg2xc3gmmR4cAl9MO/gxmAM+D5vf3PmVidyXKKPVC63mFb4yuDAekdHJ
	c4jKXNQAyCMQsMehlKm/9tj3k5X2G9gw9tVzPx5ym5pzz0+qroxxn9uc36y8ArrLn6ktBCxVOW43j
	0zDKG8pMzIb4wzOgIkXcTEg1MkvqIa7NW4ABb0pfj2RMMK0baSQKywURMu1ZCC4GubGZLbfEUT7PB
	Bg+yH2Ti5u4lfLYoKOeet0ensv0pNvgSEKXlRxoRfT/1dWKqe3gYvgsA5v+w3rcoHcqHqoCTh9h5T
	TMopVWYr9fOxlKq6lYyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHGCt-0000000GM1Q-35RA;
	Mon, 27 Apr 2026 07:16:39 +0000
Received: from mout-p-201.mailbox.org ([80.241.56.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHGCr-0000000GLy2-2Ifx
	for linux-riscv@lists.infradead.org;
	Mon, 27 Apr 2026 07:16:38 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4g3vxv4gTyz9tty;
	Mon, 27 Apr 2026 09:16:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777274195;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VNJkRq0Y8simejX2Aa8XtIUh6Eyf4vR8aRfuoLPHrWY=;
	b=Zl9Pj3qBfuKkbhhIB73UH0q0hqcVm6qjP6z4eldu+8C7/fN6RLYMhKRIraW/Hl1DcNKwLL
	eTQd/9evh+MGwoXxx9xWzaq/mw5OehGTHgqFNlngxfMZ/+mgksiHGFWjL0xvMqcMWSx4Fe
	8SBjWYrS5SI2P2uJFzzohxRtwL1hW7J5V4Y3rgEOO9HejIx4SVdyGPLuGDjOFrtsz7fpzK
	KEcUwwxubv7cyclG4MvuiIDKHOAew3F8i3iZoS/jG2+ZTsef+cy81tD7pajQeFYQULGOfo
	yaftIBD4kQ5jmyJgJ2dJ+8gX2rVqXZJDQ6h7ZtzdLSA4QibvVRDAa9KdAFR2dA==
From: Shuwei Wu <shuwei.wu@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777274193;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VNJkRq0Y8simejX2Aa8XtIUh6Eyf4vR8aRfuoLPHrWY=;
	b=txtDWcEBiElxI0YPtmeKnq5I2+M25J+FjsalJWL40Fsb6PzGrmwrTFPKwEKbNOHS5wDAOP
	uKmc/EdJn5YO0gh5Cvy83Q1zRatlR8kj2ewbc8Wlo1b3Z4/UsFm/brdF+/uaJSLSl8mSyp
	2NWF/BKO3TrballD9OKKXehU5F+q0iRPDgt21kM0kvfoCN4Nw9vpWhDRvwt4GJkrb+neVT
	PVrwXBy8l7k17xDim5lHMtysIIreKAiDRxgpAaCxk9uR4eqq1tXzpMfEe1nHZjmGKauVvQ
	SQ2NVrI3EV7XtghjC/Yv1KQren//EjMD1paABk45IPW7b7E733jwvOKLtNlLEg==
Date: Mon, 27 Apr 2026 15:15:17 +0800
Subject: [PATCH v5 3/3] riscv: dts: spacemit: Add thermal sensor for K1 SoC
MIME-Version: 1.0
Message-Id: <20260427-k1-thermal-v5-3-df39187480ed@mailbox.org>
References: <20260427-k1-thermal-v5-0-df39187480ed@mailbox.org>
In-Reply-To: <20260427-k1-thermal-v5-0-df39187480ed@mailbox.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Shuwei Wu <shuwei.wu@mailbox.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Vincent Legoll <legoll@online.fr>, 
 Gong Shuai <gsh517025@gmail.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777274126; l=3192;
 i=shuwei.wu@mailbox.org; s=20251125; h=from:subject:message-id;
 bh=8HzKh0CsYmGIMngJ/4+BYykBWGiMmfP0pM8J1UsfrB0=;
 b=sPSo1p+fRgWfsIBAcWspbSex6Q+7fR3ybqJIkbskOZxkD7AxY1MFkmmpVh5Ps5X0eCAf+8hUc
 hsumGXIewy5C1H9TpeSr6e4GKLgjDuLuNCIUPPOzBwuo3D/wRuRSSQn
X-Developer-Key: i=shuwei.wu@mailbox.org; a=ed25519;
 pk=qZs6i2UZnXkmjUrwO5HJxcfpCvgSNrR4dcU5cjtfTSk=
X-MBO-RS-META: 1edu9cugtjhi4dqfs4p77qwrqgmidauy
X-MBO-RS-ID: 5067cfa422e911d2738
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_001637_799110_7A6ADF07 
X-CRM114-Status: UNSURE (   7.68  )
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

Include the Thermal Sensor node in the SpacemiT K1 dtsi
with definitions for registers, clocks, and interrupts.
Additionally, configure thermal zones for the soc, package, gpu, and
clusters to enable temperature monitoring via the thermal framework.

Tested-by: Vincent Legoll <legoll@online.fr> # OrangePi-RV2
Tested-by: Gong Shuai <gsh517025@gmail.com>
Signed-off-by: Shuwei Wu <shuwei.wu@mailbox.org>

---
Changes in v2:
- Update compatible to "spacemit,k1-tsensor"
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 101 +++++++++++++++++++++++++++++++++++
 1 file changed, 101 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 529ec68e9c23..e9952204224e 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -339,6 +339,96 @@ osc_32k: clock-32k {
 		};
 	};
 
+	thermal-zones {
+		soc-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&thermal 0>;
+
+			trips {
+				soc-crit {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		package-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&thermal 1>;
+
+			trips {
+				package-crit {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpu-thermal {
+			polling-delay-passive = <100>;
+			polling-delay = <0>;
+			thermal-sensors = <&thermal 2>;
+
+			trips {
+				gpu-alert {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				gpu-crit {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cluster0-thermal {
+			polling-delay-passive = <100>;
+			polling-delay = <0>;
+			thermal-sensors = <&thermal 3>;
+
+			trips {
+				cluster0-alert {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cluster0-crit {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cluster1-thermal {
+			polling-delay-passive = <100>;
+			polling-delay = <0>;
+			thermal-sensors = <&thermal 4>;
+
+			trips {
+				cluster1-alert {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cluster1-crit {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+	};
+
 	soc {
 		compatible = "simple-bus";
 		interrupt-parent = <&plic>;
@@ -494,6 +584,17 @@ syscon_apbc: system-controller@d4015000 {
 			#reset-cells = <1>;
 		};
 
+		thermal: thermal@d4018000 {
+			compatible = "spacemit,k1-tsensor";
+			reg = <0x0 0xd4018000 0x0 0x100>;
+			clocks = <&syscon_apbc CLK_TSEN>,
+				 <&syscon_apbc CLK_TSEN_BUS>;
+			clock-names = "core", "bus";
+			interrupts = <61>;
+			resets = <&syscon_apbc RESET_TSEN>;
+			#thermal-sensor-cells = <1>;
+		};
+
 		i2c6: i2c@d4018800 {
 			compatible = "spacemit,k1-i2c";
 			reg = <0x0 0xd4018800 0x0 0x38>;

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
