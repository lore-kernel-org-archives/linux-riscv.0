Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75581C46CCD
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Dec 2023 21:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t4msN7tXf1DuQscFIxDIVK5ERwYBVwLLnpx3TilFwQI=; b=UrEcDCW6pdalPF
	ip/dAG+zbyaoHR4y5AcgtVDu0qRFMPklRlWV5hOHxbwshEXv7Dho+b5zxwGYKfn5eBiBOb89HDkEe
	WTFXiG7MlbLRqkkysv6xEbmOfqG0qQS0xNLmakTvS9StYROzocKPDvvUqvMlXStDIurQDvDKcox78
	4ZRheYwHvB2sLxC1RpBhSwOBjmRDmUVA2CYZz4kybTAhjN1gzuI2nuqTptdcLzVSjuuZWFD0EnQPP
	AqpJBh2BAH0xITORzscI3AkUyp6HnQbj2s5noVbUQreqf4+wD/x5KcMoRJQZL/ZSUrv96XwTzzhir
	fWjnIyUukqSl9dkQ/MMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rG3x2-000uJ6-2T;
	Wed, 20 Dec 2023 21:18:00 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rG3wy-000uGW-1i
	for linux-riscv@lists.infradead.org;
	Wed, 20 Dec 2023 21:17:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1703107074;
	bh=xs6TIYSXHQI0In49A4/5cc954c7s8z1QQPzJQM1D+vg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WQLSZXuD9bQ3Aid8sl5ikYYAXwKMcp71zth2mQQnhv6+3UX7tjfmgCL9+v23ERUdm
	 4HFY9l3dmrnhKyLj/ywyZt0lu85Bi1BW9Oy+azKbcq0hpkdTfHSki/BkS3SBeI9pKJ
	 PcPiLeezH+4S2NuHI1fGyIHwLEbUp2Jjn8YUt9vcFlFfDuR0+z0O7+bsRUlv0UzZxC
	 ow520/mexsYB/4tKzRl4CtwfKroHQ02qYALz/ETQ4bIRgJ/Yc0Tn4JhIBL2bRl2SNx
	 rEA+s7N7DetUzzJHcqqzFo4346lmo4MIUFb1gxr/EbYqXzUUPC9uhMMCvFTqhXJTse
	 +bh5jMS8p5TmQ==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 36A403781FF7;
	Wed, 20 Dec 2023 21:17:54 +0000 (UTC)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Richard Cochran <richardcochran@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Jacob Keller <jacob.e.keller@intel.com>
Cc: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	kernel@collabora.com,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Subject: [PATCH v6 2/4] riscv: dts: starfive: jh7100-common: Setup pinmux and enable gmac
Date: Wed, 20 Dec 2023 23:17:40 +0200
Message-ID: <20231220211743.2490518-3-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231220211743.2490518-1-cristian.ciocaltea@collabora.com>
References: <20231220211743.2490518-1-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_131756_695683_75909312 
X-CRM114-Status: UNSURE (   8.28  )
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

Add pinmux configuration for DWMAC found on the JH7100 based boards and
enable the related DT node, providing a basic PHY configuration.

Co-developed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
---
 .../boot/dts/starfive/jh7100-common.dtsi      | 84 +++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7100-common.dtsi b/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
index 42fb61c36068..bcba08e5bdf2 100644
--- a/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
@@ -72,7 +72,91 @@ wifi_pwrseq: wifi-pwrseq {
 	};
 };
 
+&gmac {
+	pinctrl-names = "default";
+	pinctrl-0 = <&gmac_pins>;
+	phy-mode = "rgmii-id";
+	status = "okay";
+
+	mdio: mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "snps,dwmac-mdio";
+	};
+};
+
 &gpio {
+	gmac_pins: gmac-0 {
+		gtxclk-pins {
+			pins = <PAD_FUNC_SHARE(115)>;
+			bias-pull-up;
+			drive-strength = <35>;
+			input-enable;
+			input-schmitt-enable;
+			slew-rate = <0>;
+		};
+		miitxclk-pins {
+			pins = <PAD_FUNC_SHARE(116)>;
+			bias-pull-up;
+			drive-strength = <14>;
+			input-enable;
+			input-schmitt-disable;
+			slew-rate = <0>;
+		};
+		tx-pins {
+			pins = <PAD_FUNC_SHARE(117)>,
+			       <PAD_FUNC_SHARE(119)>,
+			       <PAD_FUNC_SHARE(120)>,
+			       <PAD_FUNC_SHARE(121)>,
+			       <PAD_FUNC_SHARE(122)>,
+			       <PAD_FUNC_SHARE(123)>,
+			       <PAD_FUNC_SHARE(124)>,
+			       <PAD_FUNC_SHARE(125)>,
+			       <PAD_FUNC_SHARE(126)>;
+			bias-pull-up;
+			drive-strength = <35>;
+			input-disable;
+			input-schmitt-disable;
+			slew-rate = <0>;
+		};
+		rxclk-pins {
+			pins = <PAD_FUNC_SHARE(127)>;
+			bias-pull-up;
+			drive-strength = <14>;
+			input-enable;
+			input-schmitt-disable;
+			slew-rate = <6>;
+		};
+		rxer-pins {
+			pins = <PAD_FUNC_SHARE(129)>;
+			bias-pull-up;
+			drive-strength = <14>;
+			input-enable;
+			input-schmitt-disable;
+			slew-rate = <0>;
+		};
+		rx-pins {
+			pins = <PAD_FUNC_SHARE(128)>,
+			       <PAD_FUNC_SHARE(130)>,
+			       <PAD_FUNC_SHARE(131)>,
+			       <PAD_FUNC_SHARE(132)>,
+			       <PAD_FUNC_SHARE(133)>,
+			       <PAD_FUNC_SHARE(134)>,
+			       <PAD_FUNC_SHARE(135)>,
+			       <PAD_FUNC_SHARE(136)>,
+			       <PAD_FUNC_SHARE(137)>,
+			       <PAD_FUNC_SHARE(138)>,
+			       <PAD_FUNC_SHARE(139)>,
+			       <PAD_FUNC_SHARE(140)>,
+			       <PAD_FUNC_SHARE(141)>;
+			bias-pull-up;
+			drive-strength = <14>;
+			input-enable;
+			input-schmitt-enable;
+			slew-rate = <0>;
+		};
+	};
+
 	i2c0_pins: i2c0-0 {
 		i2c-pins {
 			pinmux = <GPIOMUX(62, GPO_LOW,
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
