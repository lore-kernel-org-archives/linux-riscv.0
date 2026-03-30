Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB4E4F3D61F
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Mar 2026 08:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/ivNAHJkm8x69ZuBEf2Pnx8cLMqCIwW0qN7Y30YGVhQ=; b=W9C8kNBdaJlmre
	UmmJroeGYePKMe77foF7qoAIATq7DjPSDEePMbdoPjTNBA8hf7g8tybPZ4FBWpAUB1QKtEfbNXKpQ
	wFs+Rq9kfXep9v56aAdTD53dSMxPI01x9mcn27mwycpQt85J55xlG/031jCLCuS9U6aIfQnyX7G5X
	76T4RzvxOnRURdYCzJLVUO19pVgrwhl4jETGSfBoFMeltYVkIc2W369/qhu7kttYq8I8Pgy9OF0Hn
	0ix/71a9Nr6Cj+UsdFUxF3jMfZYGXWFMCnThDoJW0nVFJI9sr5BDKVo7TNm1Wb/9kxahm0cZlRr+r
	9KWu2pmy6qZ02AaZnrQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w788y-0000000At3o-3ug6;
	Mon, 30 Mar 2026 08:38:44 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w788v-0000000AszX-10A4
	for linux-riscv@lists.infradead.org;
	Mon, 30 Mar 2026 08:38:42 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-43cff5dafc3so516891f8f.1
        for <linux-riscv@lists.infradead.org>; Mon, 30 Mar 2026 01:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774859919; x=1775464719; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s2b3A5VlJa4lpM7E2GeEDRbbHgTsaHKFUASwgrv7Rf4=;
        b=gs32U17nzu0FRNTPDveBlIa9hKHbs94l+s2E5U1QVRvcZ0awVxErFmIPubdG3wtUdi
         Z2A7BtFfpB0ByAh69EW2SucGU5Rfd/ocmFLHpbLJNQPhxo+oO88zeecFjUBuxu8LSeQ2
         Fl8ZSpaXEPU5j2VH7x4xHuUUxRVRFPvFCY91+y2XCSMnHaFcDl8rR2moxE+hSGsXTifR
         4onY7XH469GPaXDQT7GjDZtT/TNnXYZwtLb01Eb8nq4+KokD/3hZrpnbbBi36ThDJukN
         JUPDpVsPew+JKo2Rmai3+ea0BHKumi5XsOyi+F8y2n+6WKP8J4UG6ayTAPJ6rtXPhoUL
         Ecaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774859919; x=1775464719;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s2b3A5VlJa4lpM7E2GeEDRbbHgTsaHKFUASwgrv7Rf4=;
        b=bw7R806/Sq3Gdm5+Tp27kPdXq+vKd0IVzbyYVuHCK7Dh4UDRFfpGGadzIuzMRrS4vV
         AUqtP08a5PnGREn2N3tEyCFHp1ieOKBkNztFAUhjHe6lUszh1PorjYWw/OKcoVDVHDd7
         8biDHvXBpO9VDWk+rGqMmTYv2OfGowHylr650uuPiaI7ueuWr9eXW7f87WY+OAUNU40z
         BS7S2RiSo8/DmH7Xw5pA5eJOkM6FKMEsUu6BRR0gryrDY+bNt5l12yvHVS7cMBTVkD8o
         UeOtGva0ISP66mViQiCi5SSJATPJ6vpRfQJt+l8TwOsxYZGZcXORbUy1hP5bfsMLsXfB
         8Myg==
X-Forwarded-Encrypted: i=1; AJvYcCX97dt/nPbuypA1wN+qg3in28AcH7XyE3pUC+wkCylfem2RtZbiQTboH8mPo7JycxK1gb0yLfB2Wd4Ohg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxLYVVafbl35dFd25qzF9W8HdIXUvM+oHNHJtO/Swz7JLHLqnRr
	Y6PdY7ZvsHb/77KyliOp8hhFnRQcfWNbzTnw7CGUoFFsg4uSzUp1qeLk
X-Gm-Gg: ATEYQzzPbiObHYak/SpGcDjM33DcPapf97HSy1UQq0LaWXmupQ+meihMDziweXrHNQn
	Lr9843yN9S2C7yNEVFQe4L3yD3zqOF/xTMRZmTOhYqLNEj8E3SpwPGks6xed6994WGB2M5Icev9
	IGu/kowpjmv+9adQr//t32Vcs/a2SGqEPKT6/f2HnMgv7xW8d4e4oReK/h8KlLzkW4fEYxQXLY9
	hm25QscywCWq+UPdG9lqqqe5pO0/hSgxpJ4pVLJgnOFuWQOnBdE/UtP32O5FhBVeh4WZBs8Is0+
	pysauV/pVbbfu+0SHxFEFUAI3SopyeodDsZXVruE6vPEPo7fPLZwDN78e1JBFXSoJuMRIay7G79
	BgYQa1eMkNOCU5cHSZhzLnTvXuPmdENai7lsMySSubp+0zRUN3p8ZivP39kMTvFIa+DCeX4eCEo
	JzL7HxcleA7pEoKEG4Xgsn4ROzMcsZ/bgFKEaJ6QhJcU7fq2HXxJ7qd1z4vlX8w3Ab
X-Received: by 2002:a05:600c:4e08:b0:485:363b:fafe with SMTP id 5b1f17b1804b1-48727d5e971mr206919765e9.1.1774859919161;
        Mon, 30 Mar 2026 01:38:39 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.232.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4872712c236sm74063315e9.14.2026.03.30.01.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 01:38:38 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 30 Mar 2026 10:38:10 +0200
Subject: [PATCH v5 9/9] riscv: dts: spacemit: k1-musepi-pro: add SD card
 support with UHS modes
MIME-Version: 1.0
Message-Id: <20260330-orangepi-sd-card-uhs-v5-9-bd853604322d@gmail.com>
References: <20260330-orangepi-sd-card-uhs-v5-0-bd853604322d@gmail.com>
In-Reply-To: <20260330-orangepi-sd-card-uhs-v5-0-bd853604322d@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Yixun Lan <dlan@kernel.org>
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>, 
 Trevor Gamblin <tgamblin@baylibre.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_013841_341244_86601ABF 
X-CRM114-Status: UNSURE (   9.93  )
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
index 29e333b670cf0a5c4ed852668460db475b9c44cb..b63723978a4b5317c506c6df6ad410d23b0f0ea0 100644
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
+	pinctrl-names = "default", "state_uhs";
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
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
