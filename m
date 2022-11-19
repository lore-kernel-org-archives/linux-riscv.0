Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A533C4332F
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Nov 2022 02:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gSi0kcLmG1rF5aLUoGZk4vmEVymuBPUdcDYyoe9+mAE=; b=HcxqcWnAhl+Hq1
	GyI2cPpyQQLszY83c07XQrxuq4ic/obsqDQR/JTJibDriyFLwe+u0xt967P0dS9hnPR6pE4e7rhzJ
	0IC3ylunpiGb9RqumZKHrd4Dv0/eton0xxv3FLgX7n5wlxdDAU+x21RnN7Yto/ehLlf9L4lcFi1Ru
	bwa6PXspAezLuf1FfRcLCDJ6eeuVo0GfBZbHnHdmcg4xyUgG7XnVvcsWAgxEvQRTSVZ9CdP9M/jWs
	Jgvb0s+afyJiZ80OhnG54nlqFIKxIyQl89HMDLiq9W208Zlge+1lLBKQFP2N2uc5ZvhAeZxP+LZM5
	H2iej/m/oyUSCjvmqLzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owDKa-00AFBb-Ch; Sat, 19 Nov 2022 02:11:44 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owDKX-00AFAO-Kq
	for linux-riscv@lists.infradead.org; Sat, 19 Nov 2022 02:11:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id DAE43B82672;
	Sat, 19 Nov 2022 02:11:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4DBAC433D6;
	Sat, 19 Nov 2022 02:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668823898;
	bh=fgVj5nOWOnl47lIW/xWgrRwA6PJNr5fnn5l5d58KssQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IP/8xAdk+ZHc9Vvj7TCUBda8D1DKiv7HsRchOxxIgr21TkljX9ENajvFISAJ6Ka80
	 hhOjZZyhBXzApMSo0/pdGf9IbK5+VYN5uKHyKZ6X9VmaDzszbDTrhccbHRyCWpwsKX
	 LL0JsurLMoFDjM9xWYfjQ05xnZT0xdUmrDCzurD7vNfu+enm5eyP4r3pifradpUSCf
	 QzS8OtKyxu3bJ7aJCvz7xXunXlyys2ZReDkU8wlzhQsl91iw10V4WHG5C+/1b8iX4R
	 rLxN4sUXjKbBLCuNzytHO2TIRSHrgJD5G0MtbR0qG3xMKqUA0parwtm0HOYKWTq/+a
	 /CmhT+rjDMNBw==
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
Subject: [PATCH AUTOSEL 6.0 05/44] riscv: dts: sifive unleashed: Add PWM controlled LEDs
Date: Fri, 18 Nov 2022 21:10:45 -0500
Message-Id: <20221119021124.1773699-5-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221119021124.1773699-1-sashal@kernel.org>
References: <20221119021124.1773699-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_181142_021367_9FA60304 
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
index ced0d4e47938..900a50526d77 100644
--- a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
+++ b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
@@ -3,6 +3,8 @@
 
 #include "fu540-c000.dtsi"
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/pwm/pwm.h>
 
 /* Clock frequency (in Hz) of the PCB crystal for rtcclk */
 #define RTCCLK_FREQ		1000000
@@ -42,6 +44,42 @@ gpio-restart {
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
