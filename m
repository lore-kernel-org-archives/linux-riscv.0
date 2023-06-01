Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E32ABC7EE23
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Jun 2023 08:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TO+Q/yb0Hoa+H3Ze3nAJNtKc1z2hZUDcXCgV2bcD2S4=; b=SHc0y+iJnU8DcZ
	nwLjuEJLeskLp62sYl3MjH9T6LntbLRlzutL3f3Mae4RX170msi9vOpWIxiUahAk9/Pxw42lUR0EH
	3QBaWuwFEYU+3qi4wGmX/5nD+IAOBbA1iFZtk8SDf4nWg2Y1bF1Rj0mgINKNiGShxHJ25H+AxStN5
	nX738+3WS9H1UYNU3kK8k1gnWOj+T+ZxH7CqeEoOsuL/ufOVu0+3WIbKhd23Bcvht/dnEVAMG+/Wm
	bGTfSiZ/i8RaRHJgZSLzvGPnNdT0YFmFK5JWcj6mlVB8vuspKd6kMFsy1LGTaiXXVHjBS6Wv2+dHq
	yi42qTprAeIQR/Jf2uEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4e2u-002dJB-21;
	Thu, 01 Jun 2023 08:52:36 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4e2r-002dE1-2K
	for linux-riscv@lists.infradead.org;
	Thu, 01 Jun 2023 08:52:35 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 712BC7FD6;
	Thu,  1 Jun 2023 16:51:58 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 1 Jun
 2023 16:51:58 +0800
Received: from williamqiu-virtual-machine.starfivetech.com (171.223.208.138)
 by EXMBX168.cuchost.com (172.16.6.78) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Thu, 1 Jun 2023 16:51:57 +0800
From: William Qiu <william.qiu@starfivetech.com>
To: <devicetree@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
CC: Thierry Reding <thierry.reding@gmail.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, Hal Feng
	<hal.feng@starfivetech.com>, William Qiu <william.qiu@starfivetech.com>
Subject: [PATCH v4 3/4] riscv: dts: starfive: jh7110: Add PWM node and pins configuration
Date: Thu, 1 Jun 2023 16:51:53 +0800
Message-ID: <20230601085154.36938-4-william.qiu@starfivetech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230601085154.36938-1-william.qiu@starfivetech.com>
References: <20230601085154.36938-1-william.qiu@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_015233_907477_C829202F 
X-CRM114-Status: UNSURE (   9.42  )
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

Add StarFive JH7110 PWM controller node and add PWM pins configuration
on VisionFive 2 board.

Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
Signed-off-by: William Qiu <william.qiu@starfivetech.com>
---
 .../jh7110-starfive-visionfive-2.dtsi         | 22 +++++++++++++++++++
 arch/riscv/boot/dts/starfive/jh7110.dtsi      |  9 ++++++++
 2 files changed, 31 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
index 2a6d81609284..bbc2531999bc 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
@@ -126,6 +126,12 @@ &i2c6 {
 	status = "okay";
 };
 
+&ptc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pwm_pins>;
+	status = "okay";
+};
+
 &sysgpio {
 	i2c0_pins: i2c0-0 {
 		i2c-pins {
@@ -183,6 +189,22 @@ GPOEN_SYS_I2C6_DATA,
 		};
 	};
 
+	pwm_pins: pwm-0 {
+		pwm-pins {
+			pinmux = <GPIOMUX(46, GPOUT_SYS_PWM_CHANNEL0,
+					      GPOEN_SYS_PWM0_CHANNEL0,
+					      GPI_NONE)>,
+				 <GPIOMUX(59, GPOUT_SYS_PWM_CHANNEL1,
+					      GPOEN_SYS_PWM0_CHANNEL1,
+					      GPI_NONE)>;
+			bias-disable;
+			drive-strength = <12>;
+			input-disable;
+			input-schmitt-disable;
+			slew-rate = <0>;
+		};
+	};
+
 	uart0_pins: uart0-0 {
 		tx-pins {
 			pinmux = <GPIOMUX(5, GPOUT_SYS_UART0_TX,
diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
index 4c5fdb905da8..a82b81d07d88 100644
--- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
@@ -440,6 +440,15 @@ i2c6: i2c@12060000 {
 			status = "disabled";
 		};
 
+		ptc: pwm@120d0000 {
+			compatible = "starfive,jh7110-pwm";
+			reg = <0x0 0x120d0000 0x0 0x10000>;
+			clocks = <&syscrg JH7110_SYSCLK_PWM_APB>;
+			resets = <&syscrg JH7110_SYSRST_PWM_APB>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
 		syscrg: clock-controller@13020000 {
 			compatible = "starfive,jh7110-syscrg";
 			reg = <0x0 0x13020000 0x0 0x10000>;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
