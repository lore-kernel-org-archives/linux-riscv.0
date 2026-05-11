Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 892D0CD37B5
	for <linux-riscv@archiver.kernel.org>; Mon, 11 May 2026 08:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aIDgnxHxczn+6HAIML0YZT/9TP2rNiiMOn45ufHbI7U=; b=S+WVGwKM8/HzH5
	mi6KmvS00SdMUMFzq26hZ4V+vnhyIGD/qIbVYJY1nAJsJBEs8d3CxbhquL+N0lwOPCWUnxDLEZNJP
	PCLLUfJbCQ9e2BNvS0taW5oOj+7D9u5e1dZbes5POiETL6Q4Q84c2Emt8T7HNoGHIRUl1DO8i28sK
	TIFyhJLvb6fU3D4mfaZ/c+lGbwcDEzyt1gszPPjCtv/TN78pacvLFq8WTN9L/7Yj9AN4FB44bI4m2
	tc5M0CuXMrZS0Sw6m2hfwIEphD1gzHc+htpu/yI4yPB+LrFhCFRllR+wwa4+oGStZHCkmciQSqdlS
	BX/n8Wxk+qj6Ot1TDkKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMMPV-0000000CoCj-1ifo;
	Mon, 11 May 2026 08:54:45 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMMPS-0000000Co8m-2xEk
	for linux-riscv@lists.infradead.org;
	Mon, 11 May 2026 08:54:43 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-43d7645adbdso2146488f8f.1
        for <linux-riscv@lists.infradead.org>; Mon, 11 May 2026 01:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778489681; x=1779094481; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f4H6GewK9XOsCgFQsCNGKQNCNtvjUJJHPrHSaFKR1jE=;
        b=GoRVWPrd53VKDxfn6EqymoOxV7BjvebNLBI5vuePYwbLlpb1mLdToz2FWNntm3SgyH
         f9GNzOktMZji5JLJgl1f06XyptgDunNYBiIx1EAgPrI4kQHLB1U+K2IGIzA2M86+VA0y
         Ku9VLsj0q30uyTU5PFK5ypfSpxZiX2PNepkdqdjf1RFiE3MKj71M3mngivOaZPNtBWNE
         poa0G5Z2UBc4522+eSadglGXd7Ef2xK4Mf5MUUsenlJOuvEjlBP3Fv23nDSFuj+c2ljO
         3x2DgwpSPOG8/vdhS4CRTC8djbu5YG+sYQD5BiGNqqUe0dEZ4cn008mqCjizh8R1uqqs
         D2Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778489681; x=1779094481;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f4H6GewK9XOsCgFQsCNGKQNCNtvjUJJHPrHSaFKR1jE=;
        b=bUVt2ns6OhYyWojWIWRBRaL6Qk62qo5KCh9rdJVrGs7t5/9DVEuY1lmL07X5SBwvL3
         jwSUU6JlDMbZgw3WKlh0BOVcLPB5WAPUPOS1MAWIyOIN+nIUIKa3VJJRONcHmMZb3byM
         1+O7/eYH4EIR3eT6eKUnxVyV3NJRUeHaI+t4RLQSo+kdtGrIoNN393kY2gs9vq9rwtjP
         1pOyhgKp6VW9iqaKqUsjeS9HnALsmk8Cdiq0ivnca7+joaJ8zq+r67ryeytvK497YxcO
         3gi6ZKomLcxEp5dLoqZwm+n45CaQ5kWwjuCnTda33y6lacdRROJH9dvdWwomX/02WUrx
         4I8A==
X-Forwarded-Encrypted: i=1; AFNElJ//grKUeo46XD4UTkMz0ghs6I2Epy1Ihr48EGAYMdPAgUcRvQLONLjEXQkltakMBxm4U+ejZhw3Zyrm1A==@lists.infradead.org
X-Gm-Message-State: AOJu0YydTtzpYlGbLZ8RRck1HJb3ijD/sQrNTAgqbXlOHYtKkwR8ve37
	G9Ca/SatXG5oFYcXMugfAsGyMOywwBM9dOmCUwLbYSIPimnaq9iitqEp
X-Gm-Gg: Acq92OHJClBiaTCoBu0mkydvmToUPRVtO4VHi8xyclNiRhcpdLPnPtGyVroKqDASfVy
	Ca+PcZqfQXkb++dtlN4vhLPdsc45DCgLADoVp2h82uC5rZFFhBK/AO3oX9Io8KSwdOJCx+r0ojD
	Nn/XNCNQBrAG09XvAh7NAborwjYdjxe8OT7aTGQ1ax2y1ZIgBVFinRBseK5uo7/lnkWMIn/WLUi
	U6sJKYeli6azHDcklD/3wz2HSWBGuVQzMyj7Iz2I7GzC3oF/fBH2++OizBlz1rNuUjvoi5NF0BZ
	9yLvA6JTCyC616NaLiNPM/S57ITDnl342wBXlMHgB012DNGA0A5sw3MsBY3ge0OrGh7gKfcBo/I
	DXnKx7xIdQoZfMGJdy2fSxoEafLwsXpEZJzj5cSqEtU417u60bv/uZTvsmkMi3cKnPYlbXGMYLc
	wMeT8ROX0XC6d2iPDWAV0zzBXhR7Fk7BOv7lexMBn4Qi3w99e50K+mHw69DXdFt1U++A==
X-Received: by 2002:a05:6000:22c4:b0:44f:d9da:2c40 with SMTP id ffacd0b85a97d-4515cf125d1mr36512294f8f.21.1778489680789;
        Mon, 11 May 2026 01:54:40 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.237.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45491ca2fd6sm24944189f8f.30.2026.05.11.01.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 01:54:40 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 11 May 2026 10:54:03 +0200
Subject: [PATCH v9 8/8] riscv: dts: spacemit: k1-musepi-pro: add SD card
 support with UHS modes
MIME-Version: 1.0
Message-Id: <20260511-orangepi-sd-card-uhs-v9-8-ae48c0b2b2cf@gmail.com>
References: <20260511-orangepi-sd-card-uhs-v9-0-ae48c0b2b2cf@gmail.com>
In-Reply-To: <20260511-orangepi-sd-card-uhs-v9-0-ae48c0b2b2cf@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
 Ulf Hansson <ulfh@kernel.org>, Yixun Lan <dlan@kernel.org>
Cc: Troy Mitchell <troy.mitchell@linux.dev>, 
 Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>, 
 Trevor Gamblin <tgamblin@baylibre.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_015442_767724_622FD5FD 
X-CRM114-Status: UNSURE (   9.17  )
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

From: Trevor Gamblin <tgamblin@baylibre.com>

Update the Muse Pi Pro devicetree with SD card support to match what
was done for the OrangePi RV2 in [1]. More precisely:

- Enable sdhci0 controller with 4-bit bus width
- Configure card detect GPIO with inversion
- Connect vmmc-supply to buck4 for 3.3V card power
- Connect vqmmc-supply to aldo1 for 1.8V/3.3V I/O switching
- Add dual pinctrl states for voltage-dependent pin configuration
- Support UHS-I SDR25, SDR50, and SDR104 modes

[1] https://lore.kernel.org/linux-riscv/20260316-orangepi-sd-card-uhs-v3-0-aefd3b7832df@gmail.com/T/#

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts | 66 ++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
index 29e333b670cf..774a4640f065 100644
--- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
@@ -18,6 +18,24 @@ aliases {
 		ethernet0 = &eth0;
 		serial0 = &uart0;
 	};
+	reg_dc_in: dc-in-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "dc_in_5v";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	reg_vcc_4v: vcc-4v {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_4v";
+		regulator-min-microvolt = <4000000>;
+		regulator-max-microvolt = <4000000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
 
 	chosen {
 		stdout-path = "serial0";
@@ -77,3 +95,51 @@ &uart0 {
 	pinctrl-names = "default";
 	status = "okay";
 };
+
+&i2c8 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c8_cfg>;
+	status = "okay";
+
+	pmic@41 {
+		compatible = "spacemit,p1";
+		reg = <0x41>;
+		interrupts = <64>;
+		vin-supply = <&reg_vcc_4v>;
+
+		regulators {
+			buck4: buck4 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			aldo1: aldo1 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+		};
+	};
+};
+
+&sdhci0 {
+	pinctrl-names = "default", "uhs";
+	pinctrl-0 = <&mmc1_cfg>;
+	pinctrl-1 = <&mmc1_uhs_cfg>;
+	bus-width = <4>;
+	cd-gpios = <&gpio K1_GPIO(80) GPIO_ACTIVE_HIGH>;
+	cd-inverted;
+	no-mmc;
+	no-sdio;
+	disable-wp;
+	cap-sd-highspeed;
+	vmmc-supply = <&buck4>;
+	vqmmc-supply = <&aldo1>;
+	sd-uhs-sdr25;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	status = "okay";
+};

-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
