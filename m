Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57A8CEBFD10
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Apr 2026 08:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D2evt9Gsyj2nI7vLNAsCGs18gExtADHzuXWr8C89W6k=; b=J1i+fcpdbpJuik
	Kp4MXishALGLOHwr2OaLDTUILe44N0v1wlTrKYg96AxX1bBArGSPpyZWc5aZDG2ebbI7l95HxZ9lw
	HLSnkylB9+TKO0roBgvPSYO2WU7UOihkzuQf7COI5pkSMiavxqxBpwjX1GbUC2L/57bNMyFJBIyLo
	ILBPj/WLDVCV37fRKeMCMz/XSLHwk1yB9fHwr0SLrZn7yRJ34TFNnMUo9oGho0uwaytLhX9IvElor
	ZD+gm2QAl8OuJaS36Nn8FddBJo1o5MR+fFAe/nyxLzTDuzlPWJ7o3O3SjLzv0JKDQeOmxpJLh0vkx
	QPs4KVIFWfmqklT9K7CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCCGC-0000000FDQ9-2Ist;
	Mon, 13 Apr 2026 08:03:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCCGB-0000000FDPI-3XCW
	for linux-riscv@bombadil.infradead.org;
	Mon, 13 Apr 2026 08:03:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=rPuO322us0uZuJ4hizKSGfFjcUXHsAzG0IoitERG8vY=; b=llH+YTHMMJ2k6DNROq3Vzk6ijv
	EjPATWl3Xn2djJBiKHX8c5pcgMeoz10hUIYLDweH14jn3GgAOpmY1EBvkHaC6jloYzePzGmdT3Mr0
	+zVxANpcRmC9s/DSBpoXxPAkiH247jBOmooJdD2LZtYaVX+8dSSVZDN0Jl3DK5kgN9e2LE+pOVERE
	qRFs9JMsHvAWucYiw8w/EXiU3a/4QcnmdS3xGpHRiVcCDETAqRW6Y4+huunSfHVWj9+R77M7+GtQd
	PDEAgw6TgSjV98HVZ8sj74XFvY+eLXwO9aSrCz4lSRBMB0q7C9mOe/DryaFN2Kk6d37xib3ZogPfY
	oClCeUHQ==;
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCCFy-0000000GLEe-2MZB
	for linux-riscv@lists.infradead.org;
	Mon, 13 Apr 2026 08:03:02 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-b9c6f1d1282so539859766b.3
        for <linux-riscv@lists.infradead.org>; Mon, 13 Apr 2026 01:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776067373; x=1776672173; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rPuO322us0uZuJ4hizKSGfFjcUXHsAzG0IoitERG8vY=;
        b=Utdcty61L6GZ9Dmse5Y2yZx3C/7hubpw4KlKaogodFHzttwtkkV5qnDmR69pjlRUqc
         L/Ha4Z/1STKmuQarcKA5tuRcA0ppiPY20A2hyRe3HXbgJDUIol3AlHx0Lygq4TzmNJMW
         9y3Zya4t2JllgNA8u3uT+DFrvbFuEvD8nBXiToz95x8iLGk3kY95JBdLJ9S/9Je1wVqc
         oAfIkN1HXF1TEyFisD5gHRksbfr1elolBHaagxWhNRc+O9KeIO23vd1yu3uxPTb7YwtZ
         Chx0i8LCuE9Zzovv7e//83s5huOKlSBC/8dDjqiZg0YmnFPIDFXXkMWp39gqmMbsg4o1
         bYmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776067373; x=1776672173;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rPuO322us0uZuJ4hizKSGfFjcUXHsAzG0IoitERG8vY=;
        b=BB238lOySfPWhqoHQh1b0S571vIKCU3RM+0oHJ06tGtt4PnTU85sFLzHpBg+926XW1
         dgJ2GrN+qmh2UbrXsbX3Xx864zeFiHZDXehSw5RpjwswNtY5KDmQaaYqT/VOQu9axbC4
         izx1LKJkRRD1Jyz+xqzwHkogyFz0I3/NKgdlfDD/LqkXwCaNegfk0/DE1JJyCiCZvEgU
         ySpV2bYMPQmFJED8P6p45//9+JEVJo0Wv0hdsa5qr95+JlkKlGC+gytLIZGkGCAStQRa
         /GW9kW9zRYkUDKPNjEEFjmVULFn6OVaUQTRlO/YlS2sRfcIEA2PuaI0ExzPQ5gIptpqj
         FjWQ==
X-Forwarded-Encrypted: i=1; AFNElJ+ZEWel3E4kqCiQLItlRNMRZuKJgDz1UjOdbsnFsnU307q9Xo9AgBqNDT+3aJiFJVLT+ABiunKt7RgqUA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyliu6cUKrF7P2odzAgmN+qvYu8I09VGebVDokajCqRtRTQcAeC
	+aKnt30Gt3oDnG15q0L7ir/wcp16VLRkJ5um1/9wSpjCekjqFWnoUUQH
X-Gm-Gg: AeBDievLwecAlVa2zWCQn85ioICKThhJ0s+9ndlHpnW+eCFVLyTChwvLuR9WUYkkRCL
	hs/A9pC6dUc64tRZBMf4rRo78FsqPBP2CW0HasvqGKLQ9NYnOrHMxqmGE9zxLZ6pYS4gbHxSv+F
	aEcsXMQm66vUWkZzyvBFOwITQWK+Tn1UGTin+WqIhDKiYeenXsEBx0AQMIMdYBuqzlCXknbhUaK
	Ac2b4WiCItT8YRSRUYgeIooYoHbohOyKGwEMkNmZUgPR/qHIK3hDq1/idwn2BANwLFqN+XlUwHL
	ImHCFmtOqfC0LzbqgYww6E3LE5NbV+8SzlDyd91K0HZkDBQ1iaqSqo3Xvrj7buYfKSVcKfJvbZb
	AC2EarKbx7LKATt9g3N1zvLxvXU4uYBtFghNRliy7ddt2TU5/h24wHvCPlRxx6nnj5fmJBReyOY
	Wl444uAvayRN5HNwuoMfX2gt+v3sGdh3JZfCzwJW9N/5x1WpEX1Z65nJ8aYtJWRe15
X-Received: by 2002:a17:907:788:b0:b9c:b682:83ba with SMTP id a640c23a62f3a-b9d7277c7admr701543166b.4.1776067372290;
        Mon, 13 Apr 2026 01:02:52 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.239.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e5c981sm32155932f8f.33.2026.04.13.01.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 01:02:51 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 13 Apr 2026 10:02:18 +0200
Subject: [PATCH v8 9/9] riscv: dts: spacemit: k1-musepi-pro: add SD card
 support with UHS modes
MIME-Version: 1.0
Message-Id: <20260413-orangepi-sd-card-uhs-v8-9-c21c40ec16d0@gmail.com>
References: <20260413-orangepi-sd-card-uhs-v8-0-c21c40ec16d0@gmail.com>
In-Reply-To: <20260413-orangepi-sd-card-uhs-v8-0-c21c40ec16d0@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Yixun Lan <dlan@kernel.org>
Cc: Troy Mitchell <troy.mitchell@linux.dev>, 
 Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>, 
 Trevor Gamblin <tgamblin@baylibre.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_090256_042656_EF7981A7 
X-CRM114-Status: UNSURE (   9.61  )
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
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
