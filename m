Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4546C6FD20
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Mar 2023 21:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sMdTpdaT+cIfJhPkJgi2j5FvIhujO3GQBFb014KbdkE=; b=x633+e/cuJhszB
	VW3d9KncJfhoO4ggObmmD6dgKKK2xfWsobRUKb1qjJzyR7FPfX+3aD2t7LXqjfablsmkg6oNFH1bD
	FjA9I9ZATW9ppYmRMDs1sb92MHpA987F+NYYTzyS6z6AW2XIxUG4dA5bdUfyzCKxJTUFBNG8gxoCq
	xCIZop2bsjTdhny5MsqE4FpA6WIHExvDEUItIzgEy7v2jlFPGaHgT/92GQUsTTOHWmnWhUOYKRmIz
	YEGYLR478uugnk62DqDGzVlZILmSrMUJiF0yEdsFTS1BWcbV2peXS0kZZh3u5eGXHgZvzl8uwdcKc
	8BVq2RXX3wI7YVZr6byg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pejzs-00DtD5-2k;
	Tue, 21 Mar 2023 21:58:24 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pejyZ-00DsGP-2z;
	Tue, 21 Mar 2023 21:57:06 +0000
Received: from localhost (unknown [188.24.179.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8B35566030F1;
	Tue, 21 Mar 2023 21:57:02 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1679435822;
	bh=GwkI7NvsahRI9WNBHxkf1so8O+1ehcR5/nTJjj5XqyE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=byK0mMTEq51+ezXCzHTz6KzNJ+w0ZC98Udl6/zMTpEEzpptMWt0laFhQVm9j1S0i3
	 8JR0X4E5elQRvtodxqrAT7dKFxnYdOYtF+t2dv9nbKN4xr/cN5pwY7abSPfc8sNtXo
	 HZih93oHeVNx2y9TGHx3B9vBC+NC+5gqDrhKM6y2zVJg4FmGyoPn7joqmw+/WO28q4
	 CtuTsX9UXuzPF/btdDE0fR7pQQq/vj7dVglw8NsrcI5G8hFwOh0Jis770zceqqOqpP
	 UJgYfRxWfYcZO6psUdBNBir+QOL4SDEwiTeP2lvM3z+GBTkQ2DIP9zz5dpYXeIcc+i
	 QMKLnbo2dhhiA==
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
Cc: linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v2 10/10] arm64: dts: rockchip: rk3588-rock-5b: Add analog audio
Date: Tue, 21 Mar 2023 23:56:24 +0200
Message-Id: <20230321215624.78383-11-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230321215624.78383-1-cristian.ciocaltea@collabora.com>
References: <20230321215624.78383-1-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_145704_562191_2C0AFC75 
X-CRM114-Status: GOOD (  10.35  )
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

Add the necessary DT nodes for the Rock 5B board to enable the analog
audio support provided by the Everest Semi ES8316 codec.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 .../boot/dts/rockchip/rk3588-rock-5b.dts      | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
index 95805cb0adfa..945eac304766 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
@@ -2,6 +2,7 @@
 
 /dts-v1/;
 
+#include <dt-bindings/gpio/gpio.h>
 #include "rk3588.dtsi"
 
 / {
@@ -25,6 +26,59 @@ vcc5v0_sys: vcc5v0-sys-regulator {
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 	};
+
+	sound {
+		compatible = "audio-graph-card";
+		label = "Analog";
+
+		widgets = "Microphone", "Mic Jack",
+			  "Headphone", "Headphones";
+
+		routing = "MIC2", "Mic Jack",
+			  "Headphones", "HPOL",
+			  "Headphones", "HPOR";
+
+		dais = <&i2s0_8ch_p0>;
+		hp-det-gpio = <&gpio1 RK_PD5 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&hp_detect>;
+	};
+};
+
+&i2c7 {
+	status = "okay";
+
+	es8316: es8316@11 {
+		compatible = "everest,es8316";
+		reg = <0x11>;
+		clocks = <&cru I2S0_8CH_MCLKOUT>;
+		clock-names = "mclk";
+		#sound-dai-cells = <0>;
+
+		port {
+			es8316_p0_0: endpoint {
+				remote-endpoint = <&i2s0_8ch_p0_0>;
+			};
+		};
+	};
+};
+
+&i2s0_8ch {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2s0_lrck
+		     &i2s0_mclk
+		     &i2s0_sclk
+		     &i2s0_sdi0
+		     &i2s0_sdo0>;
+	status = "okay";
+
+	i2s0_8ch_p0: port {
+		i2s0_8ch_p0_0: endpoint {
+			dai-format = "i2s";
+			mclk-fs = <256>;
+			remote-endpoint = <&es8316_p0_0>;
+		};
+	};
 };
 
 &sdhci {
@@ -42,3 +96,11 @@ &uart2 {
 	pinctrl-0 = <&uart2m0_xfer>;
 	status = "okay";
 };
+
+&pinctrl {
+	sound {
+		hp_detect: hp-detect {
+			rockchip,pins = <1 RK_PD5 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+};
-- 
2.40.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
