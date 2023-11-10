Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C3D4C4167B
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Nov 2023 06:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+mxfmA5O5XDpNRgkg9InxMJdDMPTthSUb2g9UegL+E8=; b=YXHaT+yqlm5mKL
	hLjvTbHwWckjnQgZbG08rHbXC+/d61ZV2V2sQUdyibXkE0i26PaLmSd+eJC1oguH5zLjKbqL+Q3US
	uakSolpl6q8k4JMZiynkwwdvPX2ZwGOkFM/TCCPJ4VejS9h8tD3w+pLj67pG0lfYeMQ+jqAgNQUzv
	a2XlVMCEqifmhhvkUrg6ibD1AuR9kXNwfdJHJMjInGWZ/hrCQc9C3ceswhOFRj0f5gymAAOSPRArA
	xdSrIuaw3z6STWNx3D4Zxc/8NuGoV2YTg/C23PCs4yLLKN0z4svKLzH3HY5VroGeeyfGF6bo/kB7e
	NbQcpVq/PGv7mOf1y08g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1KtN-007wfy-0k;
	Fri, 10 Nov 2023 06:21:21 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1KtI-007weL-2s
	for linux-riscv@lists.infradead.org;
	Fri, 10 Nov 2023 06:21:19 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 8860924E29F;
	Fri, 10 Nov 2023 14:20:44 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 10 Nov
 2023 14:20:44 +0800
Received: from williamqiu-virtual-machine.starfivetech.com (171.223.208.138)
 by EXMBX168.cuchost.com (172.16.6.78) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Fri, 10 Nov 2023 14:20:43 +0800
From: William Qiu <william.qiu@starfivetech.com>
To: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-pwm@vger.kernel.org>
CC: Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, "Hal
 Feng" <hal.feng@starfivetech.com>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	William Qiu <william.qiu@starfivetech.com>
Subject: [PATCH v7 3/4] riscv: dts: starfive: jh7110: Add PWM node and pins configuration
Date: Fri, 10 Nov 2023 14:20:38 +0800
Message-ID: <20231110062039.103339-4-william.qiu@starfivetech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231110062039.103339-1-william.qiu@starfivetech.com>
References: <20231110062039.103339-1-william.qiu@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_222117_235590_B5972869 
X-CRM114-Status: UNSURE (   8.97  )
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

Add OpenCores PWM controller node and add PWM pins configuration
on VisionFive 2 board.

Signed-off-by: William Qiu <william.qiu@starfivetech.com>
Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
---
 .../jh7110-starfive-visionfive-2.dtsi         | 22 +++++++++++++++++++
 arch/riscv/boot/dts/starfive/jh7110.dtsi      |  9 ++++++++
 2 files changed, 31 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
index 2c02358abd71..823f298c3f4c 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
@@ -268,6 +268,12 @@ reserved-data@600000 {
 	};
 };
 
+&pwm {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pwm_pins>;
+	status = "okay";
+};
+
 &spi0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&spi0_pins>;
@@ -402,6 +408,22 @@ GPOEN_SYS_SDIO1_DATA3,
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
 	spi0_pins: spi0-0 {
 		mosi-pins {
 			pinmux = <GPIOMUX(52, GPOUT_SYS_SPI0_TXD,
diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
index e85464c328d0..74630feff7a8 100644
--- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
@@ -736,6 +736,15 @@ spi6: spi@120a0000 {
 			status = "disabled";
 		};
 
+		pwm: pwm@120d0000 {
+			compatible = "starfive,jh7110-pwm", "opencores,pwm";
+			reg = <0x0 0x120d0000 0x0 0x10000>;
+			clocks = <&syscrg JH7110_SYSCLK_PWM_APB>;
+			resets = <&syscrg JH7110_SYSRST_PWM_APB>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
 		sfctemp: temperature-sensor@120e0000 {
 			compatible = "starfive,jh7110-temp";
 			reg = <0x0 0x120e0000 0x0 0x10000>;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
