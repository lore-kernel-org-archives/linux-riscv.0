Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 231EDC43217
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Nov 2022 02:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BSeNijikZzpDBp+4qFlEWVK3HkAryH3I76IjKzyLDA0=; b=rxg38RZHGnSY6N
	6/E0zZfdHgnhT2GEKSX1SgPkXd0l8HLFRSVLhORrtZtZrB68ozz7uabSN3aoKGU2pCwhmO83ChH/J
	xc0oNFaDR/JYiO91wWnqFsj304j/Kc/W8QfA/6alqqDRqD0eKTcwcvuNir10AGUmw+OhkM+OGZdw0
	dz30Fx3WvI3McVp2g8W5jeHMf4XyK27T5sfg3pQi7vBBrwguIIhVByVdhE91rM/hlFRQFjGJk+3t7
	rOwDS8huY7vBxsZFkV4iwJGsIe+3l6Huty9IeKMqE6hbBXU++vU2vt+AEPqzPcp5tmf4NajnbPKvq
	chlhHOAoPIMLtDqsVJPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owDMs-00AGDi-Cq; Sat, 19 Nov 2022 02:14:06 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owDMo-00AGBA-N6
	for linux-riscv@lists.infradead.org; Sat, 19 Nov 2022 02:14:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 4C3F3B825B6;
	Sat, 19 Nov 2022 02:14:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94402C43470;
	Sat, 19 Nov 2022 02:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668824041;
	bh=x7MgMSBYsh7ZsW8NjRE23dg4v8oznSggoiJ1A8oIq7M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fSaapoiT28sV+/T3NOUaqjz60r+WGq7G0mO7s1pwUHKkOp3mqbajw5pUwT9/MKbXr
	 5elBxUpQ7jkuGs/fCgs9VEOaDjVw1zk0R+cB6yjVFEvb3tnn9g3v0ulXMpd9FJSjzz
	 ai9hVfhxnkvREbBqWQAcM/aAnMQ3aJIconUVw1FxthbhuaWlmXJ5yixbfgtXSgbTnE
	 tW+Id9e103awI5h42QcoxYYT239oSOHhrGO+g05/O/bOZa5K6e4ISIw8PrwnBIfGzA
	 8TYULOBae/PoRNiSLCigfAHu3Gu9RGXpC4bBtnzfX2MP3mgx76fOD1hDEXdd0DUVCD
	 CPC13eJMWRzlg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Sasha Levin <sashal@kernel.org>,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	bin.meng@windriver.com,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH AUTOSEL 5.15 03/27] riscv: dts: sifive unleashed: Add PWM controlled LEDs
Date: Fri, 18 Nov 2022 21:13:28 -0500
Message-Id: <20221119021352.1774592-3-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221119021352.1774592-1-sashal@kernel.org>
References: <20221119021352.1774592-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_181403_081935_E4AA9AD3 
X-CRM114-Status: GOOD (  10.92  )
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

From: Emil Renner Berthing <emil.renner.berthing@canonical.com>

[ Upstream commit 8bc8824d30193eb7755043d5bb65fa7f0d11a595 ]

This adds the 4 PWM controlled green LEDs to the HiFive Unleashed device
tree. The schematic doesn't specify any special function for the LEDs,
so they're added here without any default triggers and named d1, d2, d3
and d4 just like in the schematic.

Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Tested-by: Conor Dooley <conor.dooley@microchip.com>
Link: https://lore.kernel.org/r/20221012110928.352910-1-emil.renner.berthing@canonical.com
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../boot/dts/sifive/hifive-unleashed-a00.dts  | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
index 22f971e97161..2f4d677c9c4f 100644
--- a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
+++ b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
@@ -3,6 +3,8 @@
 
 #include "fu540-c000.dtsi"
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/pwm/pwm.h>
 
 /* Clock frequency (in Hz) of the PCB crystal for rtcclk */
 #define RTCCLK_FREQ		1000000
@@ -46,6 +48,42 @@ gpio-restart {
 		compatible = "gpio-restart";
 		gpios = <&gpio 10 GPIO_ACTIVE_LOW>;
 	};
+
+	led-controller {
+		compatible = "pwm-leds";
+
+		led-d1 {
+			pwms = <&pwm0 0 7812500 PWM_POLARITY_INVERTED>;
+			active-low;
+			color = <LED_COLOR_ID_GREEN>;
+			max-brightness = <255>;
+			label = "d1";
+		};
+
+		led-d2 {
+			pwms = <&pwm0 1 7812500 PWM_POLARITY_INVERTED>;
+			active-low;
+			color = <LED_COLOR_ID_GREEN>;
+			max-brightness = <255>;
+			label = "d2";
+		};
+
+		led-d3 {
+			pwms = <&pwm0 2 7812500 PWM_POLARITY_INVERTED>;
+			active-low;
+			color = <LED_COLOR_ID_GREEN>;
+			max-brightness = <255>;
+			label = "d3";
+		};
+
+		led-d4 {
+			pwms = <&pwm0 3 7812500 PWM_POLARITY_INVERTED>;
+			active-low;
+			color = <LED_COLOR_ID_GREEN>;
+			max-brightness = <255>;
+			label = "d4";
+		};
+	};
 };
 
 &uart0 {
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
