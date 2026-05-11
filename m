Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 612E2CD37B9
	for <linux-riscv@archiver.kernel.org>; Mon, 11 May 2026 11:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9VU7qQ1I3OTSRQFH8ndWa1BHHwoJ7R3W2wZ5lMNj8mA=; b=tNUYfis6LCuiY4
	gmjbStPyJMv+pAQoeS5Jj4yz1YWU236OQMnVuMDLlylMmLIZprEYJ+dsBRWbko1vMjWzRilziFkqv
	hsIma6d1aJ34lFMWzVkBMP3jnJxxIML6CB3m6k70DlQ5hXE/9k3Qcz+iChSc3H37yy2Wb1lSSNLjW
	SpuaT7EEqx4uWKemuI4hX2SEBRyfbwIGia/z9jQmoXU5c8ioMKJSCgJbzQKKaCb95UzeGVdrahfVj
	fKwsjGT+1p56Hw09x9fN4k6S+PaKBs9ewJxymnMNNPNPrVkqOEqUlrr/oRnAwc5cde18IVuxAVaB1
	LbwXTWkAih3cF5edWDKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOXl-0000000DEuC-1Y9H;
	Mon, 11 May 2026 11:11:25 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOXi-0000000DEpg-2rMP
	for linux-riscv@lists.infradead.org;
	Mon, 11 May 2026 11:11:23 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4891c00e7aeso35039805e9.2
        for <linux-riscv@lists.infradead.org>; Mon, 11 May 2026 04:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778497881; x=1779102681; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GtTvf9vsfLePhnbh9KXY1gq0CLeR2YIl5j5cO/hpSW8=;
        b=S16UG0ckhRLBbJJ4Ne+wrWgz0OKCFemgKP7Ih9a94YjHD+UfATWUF9aohLPLpfKPPO
         FC+gIKXOodL4srptLwlpOaYZftmgXT/rw2EtbixXbsa8BrtTYNqUe8ygy3s3NPWoa9mB
         eHm7stZQ1eHhZ+IRq/YPcLuScujv1V+76tSWTqFUy1p9kjyQbs9+zu2BV8MXC7ofVf/W
         /EtrqVPaE1+V/j4nMk1fSG+8JD98HUi+J/ZpHqaRQOPzuK43RjxKBK5eZqodGGYB1erZ
         /Z+6b4xcEsULuduVx8Bcu3jQn47eBSmmmtxEi1wD0LNLkvLNPfXEDXfZr3hcb9OZAXAq
         OI6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778497881; x=1779102681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GtTvf9vsfLePhnbh9KXY1gq0CLeR2YIl5j5cO/hpSW8=;
        b=Th/RqisWcASLjVrD9Xi38AYAldvoHcuEXptWXp/oCz9Nerp31/ZLVsT6AES+BN8Ll7
         f2tRp6QVpu3wIAZUlkxnuMtuD9eQP6BvmXUchJCya4aCgkLcUCl6bIKgwAo6DRRw4SpT
         njY7g1zPbdwQ+f4oIIb9KBDZ9hZ2T46cxEkhCAVHuTo/XWvHK3BZV+bwcsSv9LVpzaU9
         glKVAmxWUjwFmAMDW7XnxOB9dIr3kneuHVq30ILX31uEOrgHokgXslsMQdI8BLXl/14R
         cGTkkAvc+t4A6zH37YswFoPeNIfDPe8HWEEokJqqlea2k/6pHnjaT6VSMLanLNs3ElQz
         1iug==
X-Forwarded-Encrypted: i=1; AFNElJ+HQL3oAAmVmvEw+halJLt74N9N3FEkcdf3nbS32YFo8YdfZldj7GaP23ya3LVBvUiGglADZQRIPLDjtg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzDKAbQmlyKBk1Nfsdm0jmnP8ONaXINMdtobSiGlf4EThKkMxnp
	K8BmyHkkcTC3SeoS3lfOFyt5XeyIGxcmtZzPYfcyuN8QakL31+bhl5Xk
X-Gm-Gg: Acq92OGH42Ts+qhARnNDvVqwG5w46QIZBHRHTWWrnfpcTBAFwc0dTqC1Kuz0/4eX7W/
	eZEiWB5cUKXjzPTRfeeONWPJE9rVGczE2yvJtad09jR0CgCiIwhwVYZ0nRhmX9CgWTXvDG7BC5H
	WJ69cGy/XdDTI71IvFfwAdDAjRa1uQ8eIo+sBN+ppwGMznMhZh03/Bp+K8niQAXB2AzkrgGcaWZ
	bSYbH1x2fSEN44x/xYfyaLASas+zwgfiFy++olQDuxi8/Kibhzcj3LongVs9I6vHk3AFcp+th4O
	oY9d22v23ZRRXNMYPcbvs6qKz9XqUNr3yTmkSyqiKmZCeppyYJadQ+tBFw7yWcU8AhjEIGjtIAB
	+lu5ciiA+V0jF8Od/LPFEm/dICWTK87+NQLP75tlCRA6riMXH77j/vV4wZsTB0qbFXDAWAXD3+u
	tdcazLkS114Z12LxkPGtISuegIk897gomtdo4F9aOQ2PvmTz9lngiPCeU23oYVeEojPQ==
X-Received: by 2002:a05:600c:4512:b0:488:ac01:72b6 with SMTP id 5b1f17b1804b1-48e51f3a538mr373235125e9.21.1778497880440;
        Mon, 11 May 2026 04:11:20 -0700 (PDT)
Received: from mamamia.internal (a89-182-129-90.net-htp.de. [89.182.129.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e701e9585sm175077375e9.5.2026.05.11.04.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 04:11:20 -0700 (PDT)
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
Subject: [PATCH v2 1/6] riscv: dts: spacemit: k1-musepi-pro: add PMIC and power infrastructure
Date: Mon, 11 May 2026 13:11:08 +0200
Message-ID: <20260511111116.1109643-2-a.heider@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260511111116.1109643-1-a.heider@gmail.com>
References: <20260511111116.1109643-1-a.heider@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_041122_810242_2DF55005 
X-CRM114-Status: UNSURE (   9.01  )
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
index 29e333b670cf0..88c35ad1ef2ae 100644
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
+	reg_vcc_4v0: regulator-vcc-40v {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC4V0";
+		regulator-min-microvolt = <4000000>;
+		regulator-max-microvolt = <4000000>;
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
+		vin1-supply = <&reg_vcc_4v0>;
+		vin2-supply = <&reg_vcc_4v0>;
+		vin3-supply = <&reg_vcc_4v0>;
+		vin4-supply = <&reg_vcc_4v0>;
+		vin5-supply = <&reg_vcc_4v0>;
+		vin6-supply = <&reg_vcc_4v0>;
+		aldoin-supply = <&reg_vcc_4v0>;
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
