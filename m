Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74A32CD3427
	for <linux-riscv@archiver.kernel.org>; Tue,  5 May 2026 16:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H/RdD9z1nC0lHjtdBocRtQALD9p+AjtcpDNZyRlIGnM=; b=EBrhR6vuJQNWqv
	kYxO+6LFIhLeMrM97T3BpV43CxtbrsWwNRWMkFGWrPAUTTZJaPmJlpT6Ji1HkdhGH0eae+xvL+M+P
	axCu22ulWs5rC8Dff/b1jH4SngO4nm88MN5i3FHjoMnsfdiD1rAGOq5FOBHE4uAEt+Cw+X8m7aqT9
	HCamB3h7rPAJIbFRUUkBQQkQbKwLEVDLnUcJE1Gk00NJE+FUJMWDNoBjtorpJam0jTGI0zwQJ3V9s
	IRsp+Z0Jp6513QMg4jT3lwJ4RLq4gmS9oUg3qLqNWG5TAAjzMJx/LSaHUBhCTrx1bV0mMlBhppIb/
	OptFNZYp/pfsf6c2W6Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKII3-0000000GmHj-2XEt;
	Tue, 05 May 2026 16:06:31 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKII0-0000000GmGO-2o45
	for linux-riscv@lists.infradead.org;
	Tue, 05 May 2026 16:06:29 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-44b330c5cc6so2518318f8f.1
        for <linux-riscv@lists.infradead.org>; Tue, 05 May 2026 09:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777997187; x=1778601987; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=th+e+aR6DHOg780tOLy6m1AslF9E2KIAxcxgB18vgPY=;
        b=MeI0ofL6tO10eTURqw93juIxjyOHAKIUhcZmEvs2Vybw4UTZIRYqEscrJPMv2PEbbm
         TdqIIL4arTkJqOpZ/1QLhrhvwwUbKuI/n/cBZN2Inu2XcVDLb5gn+IeaU/hYZxw2BNn4
         75nQLLdr7abZUhYHh3hp0y7Tp0F8drTwLd5t78OQgyvCw0lb4xcJVkBi0a0dHEF7pI1T
         WZsBsFvKdOqjWM1cgXBO5MYmp914oCwTcomah1gouHeaJuOMdEjl+6Bg2c7fL4mn649j
         5t5gGhOvk+KoKljk62LTFlXU4DCVBEXcVR03U6MR7S5z3V/hNaO4nk34EZTKYY2jP+hm
         0dfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777997187; x=1778601987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=th+e+aR6DHOg780tOLy6m1AslF9E2KIAxcxgB18vgPY=;
        b=k4+THzpGjJqkXV11qI9LdWgKUsF8da9zAB6rwLBeBG+zvyGBodl9zbiypLgGqmf7en
         ZrFIxcxrsBmERnP5GurP58/QObojiPLa45QfLVJHQYuNUFhtJ22Bc0ZpT6XZnGU2JWHe
         e1M3Z7FuE+WEGCIuSeK0CuwqXNn2ThJVPalg7R1eP7BjuK3oNBerUZzw2MsJ8ZrI06Jg
         7xKSK04Ya7ZFhx+v/ICnb9Yk+CfaRALBkDhlqTtGehZ5Ni3ZoNzkjjA8e0I/b3kiG2IO
         zgCF5kF9KkYzTueMpk3Bm+FDJ9aE5MaaLJUn5Ivmouy4RewuLULXekSIelDCzEixSCyI
         JU1g==
X-Forwarded-Encrypted: i=1; AFNElJ8gL2a7w66TZS3ugXd7tWS/65T1vfQ17ZNcGhG3q11Ir8hNXN0VlkNvBIl4yK7+vBamMlSSEp3PhNyizA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxDFWRhqgWFZeolMfhRjBGd0rXtnPAz+12LjSqlYrQL5O5WyAZ/
	ezenZ2z5kjFH9k3fEsdyVYABiUVnyKtmIJpOmVQFVmROB6olIc0KmIBe
X-Gm-Gg: AeBDievog/KiCc1N6vA7nZoSv7oLzO31Phlsd/t183l5wFX2MKwBBwOgy1KtBcilrL3
	o15NSysHViq8QHcDEzDriAs2zpuAH5wI0LtxkEIrG2/2+ipAccWdIkyS9ImiAxIXxWMOlzwNL9Z
	KH9VoFQ0wCueAxRKd+arakuPhmOw8/BsUqFfkcZlz+wA16r/5ZdCWzMuyxE0JmFcxVcy8xA/4Nz
	+czbVivWcCi8jXJ91ZlFXbIcktFeBtWjRk0JGKvgxv1luet7Hm5EC226NHO1NufNJqUUWHYUf8j
	LgRTplWpcvPIocacBKEr4auru0CJRNRNeouxqeLtCx27hFTN146P6Wl2PVNamA+FqIU06i3lTjh
	2Fo3OdFsdW1yzziXDtVXnMHhSdtDTZCrRXX7PTOz7eWaSawlOIOXQrcAfOKJ9cKpgM6y3wx5EW6
	jAEkKZSYCbx95RELgt+Z6cTsccsSoHe34Q3QDiy9TCaK4KXzBhjQofbUzHWkMfm4SmHuFw5ZRE3
	p3S/h7iXhYbpH2r5w==
X-Received: by 2002:a05:6000:40c7:b0:43b:5672:efe with SMTP id ffacd0b85a97d-44bb36d17efmr23828993f8f.9.1777997186712;
        Tue, 05 May 2026 09:06:26 -0700 (PDT)
Received: from mamamia.internal (a89-182-137-143.net-htp.de. [89.182.137.143])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055d36dacsm5398891f8f.32.2026.05.05.09.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:06:26 -0700 (PDT)
From: Andre Heider <a.heider@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/6] riscv: dts: spacemit: k1-musepi-pro: add PMIC and power infrastructure
Date: Tue,  5 May 2026 18:06:15 +0200
Message-ID: <20260505160623.1369347-2-a.heider@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260505160623.1369347-1-a.heider@gmail.com>
References: <20260505160623.1369347-1-a.heider@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_090628_731343_BF42ADE7 
X-CRM114-Status: UNSURE (   9.76  )
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

Enable i2c8 and add the connected SpacemiT P1 PMIC with its related regulators
for the board's power infrastructure and voltage regulation support.

Signed-off-by: Andre Heider <a.heider@gmail.com>
---
 .../riscv/boot/dts/spacemit/k1-musepi-pro.dts | 144 ++++++++++++++++++
 1 file changed, 144 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
index 29e333b670cf0..07eef3274192c 100644
--- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
@@ -17,6 +17,7 @@ / {
 	aliases {
 		ethernet0 = &eth0;
 		serial0 = &uart0;
+		i2c8 = &i2c8;
 	};
 
 	chosen {
@@ -33,6 +34,25 @@ led1 {
 			default-state = "on";
 		};
 	};
+
+	reg_usb_vbus: regulator-usb-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "USBVBUS";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	reg_vcc_5v0_sys: regulator-vcc5v0-sys {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC5V0_SYS";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		regulator-always-on;
+		vin-supply = <&reg_usb_vbus>;
+	};
 };
 
 &emmc {
@@ -72,6 +92,130 @@ &pdma {
 	status = "okay";
 };
 
+&i2c8 {
+	pinctrl-0 = <&i2c8_cfg>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	pmic@41 {
+		compatible = "spacemit,p1";
+		reg = <0x41>;
+		interrupts = <64>;
+		vin1-supply = <&reg_vcc_5v0_sys>;
+		vin2-supply = <&reg_vcc_5v0_sys>;
+		vin3-supply = <&reg_vcc_5v0_sys>;
+		vin4-supply = <&reg_vcc_5v0_sys>;
+		vin5-supply = <&reg_vcc_5v0_sys>;
+		vin6-supply = <&reg_vcc_5v0_sys>;
+		aldoin-supply = <&reg_vcc_5v0_sys>;
+		dldoin1-supply = <&buck5>;
+		dldoin2-supply = <&buck5>;
+
+		regulators {
+			buck1 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3450000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck2 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3450000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck3 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck4 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck5: buck5 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3450000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck6 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3450000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			aldo1 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-boot-on;
+			};
+
+			aldo2 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			aldo3 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			aldo4 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			dldo1 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-boot-on;
+			};
+
+			dldo2 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			dldo3 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			dldo4 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-always-on;
+			};
+
+			dldo5 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			dldo6 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-always-on;
+			};
+
+			dldo7 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+		};
+	};
+};
+
 &uart0 {
 	pinctrl-0 = <&uart0_2_cfg>;
 	pinctrl-names = "default";
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
