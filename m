Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E43E5EBFD05
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Apr 2026 07:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D2evt9Gsyj2nI7vLNAsCGs18gExtADHzuXWr8C89W6k=; b=uvteCJnWOoeSfX
	FsMqcYhAc3AjFV3wInetooQw3+m7S1z1I3l1nUXnxHznzMuuH+w6EEHk+ek3CxnAtcP15h5sMK2qx
	4/y0Yaby5Ky2XJ7fGxjV1vYrpVjR5N9OtKAPm81dz9ZjYghyye5xx79r8Hy/NlVywv639j4xD0Tcb
	2sCgRfR/JS6czK55qtzKn8GZfPtM7O19AaCG8ZQ3YlUskDk/3iQHXYYjhK/0eOJ4DHF5cK48YKflB
	7e0X55TRdGUTF0yemQc1Y152BnNPnGP6pvs8wwCkml0Kzpl2MDXM0XEWVl8VOqCQOE8h/YUaEYoDF
	FRaJVNT8FRBOedvdjfaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCBhK-0000000F8vR-0syb;
	Mon, 13 Apr 2026 07:27:06 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCBhH-0000000F8t2-1NI3
	for linux-riscv@lists.infradead.org;
	Mon, 13 Apr 2026 07:27:04 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-43cfac48bc7so2691736f8f.0
        for <linux-riscv@lists.infradead.org>; Mon, 13 Apr 2026 00:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776065221; x=1776670021; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rPuO322us0uZuJ4hizKSGfFjcUXHsAzG0IoitERG8vY=;
        b=Z2h3QeO1lbByAhYci74Oq7QMHYCZOKh7UEZndqKwHVbCd/8ln6/Rve4i+pAlYpF1qx
         hkBGyKnDdji5sBO1IVjFHgyOx4MS23e9d2TQ4huo/QilV23mITdlEhqQYa8z9sPYnB2Z
         XGb9HiD2QTINJ2TPSvmyyCCZBAZx2F6Upd6K7pke5I3+nOM6+xePjefqg3aYsjKeQgUK
         LI5+hIhXifTDAgH0Rt05q1AZsuhVcNkYS3ij6Hss+fRxq+A7Ik6Avsj53WeKQuGjYqzv
         p6Esk+vaie+dApAMW2OhAT7kG6OC9DrZnzwyHj3gSaz1Za8MEdgI3AexgrmCoY5w2BsW
         4C7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776065221; x=1776670021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rPuO322us0uZuJ4hizKSGfFjcUXHsAzG0IoitERG8vY=;
        b=bH0uJM9eMECfP5bd4mbQrPkP9rSDqGo8Vp/h6yApfrnVAqSCFwdTzPtlliQ6AqA06j
         NIJPOZip1UwtmbyjqL+whhepw/iRwnnq9GMH5fMG0dKptLSY0wVz+QHHomcFGEipOKci
         3LujmrERuu1QbN75lgSL4Gqk5yTrAp5PCPJRRGH5FDS1BuaCwcV7iRhbzR3QBYAVYgQ3
         olwVM70SVkB1POE8KyPO71maMGEK3+Uty5qKVfIIY1LpJb6PJYGB3ykDlRMKp6k+vJvf
         SbdpFCG4UcT8vk1ZSgxx+jwfHpE6CKnKtjaJG9PQVrqikFA7ZkJjUjrIMNgOeDnGy4lB
         xe0w==
X-Forwarded-Encrypted: i=1; AFNElJ9emJcMo0oHBjXP5Juh3FzmN6Q7voFspd1iy4G6TpwvhzPZ4IJYzILt00AaUufrVPd9aFV+Z/8gAPZ+vw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzShXhJFfEBTlBVN10lRmwwip99/2uAJJe1qDFViyM75kKYyTNG
	c59x2xAa9rQZXJaSjkmFubxSs2jTAYDOnAJk8aVYjrN0EKRF0RstWcuV
X-Gm-Gg: AeBDietBRB6SIZMH4oYghXjs84fKU3WD1A4qpWmMQbjQBVAdSw2yjex0KeVANNcd7Qx
	+uxoZN1S63zuII6uShm79aFEhrsVwkMm/mUR/6i4e7DEwt7g7Ks1i/fJAZBbShZ9xF3mup7JcPT
	VuR9PBA6FvyUsvjm++fQHqH93sxkJbv5L6LZ4cE//n0IBjAKZhJDlOYgzdl2mIMjwGvlYzS2/BG
	/x4QDueJHXQ41/VluDsKXfzA3jTtT/aEt0v4IvfcNYQKX8bc9PCjiM9vYE4sm6hLxXDPIUwvnB3
	T8CvJ3+XXmCizlhhTdHs/Cq2spe4JjktyMAvMS3cTlIU4ORYXnw+LHkblVinX67rWn4c/dppcbQ
	dCHkFtSlhQ0fuuc8I6mBpZSz9nVUjD0TuiYPehiwTGjj0xb9HXPTp8ve3S10GnL7FXseyCy81QT
	sEYLCeY64wLpbc83u66mnOvgOYrNjHGqOagkiO3KhoGGw0uwt6x2ETrFqTo1ux+mFc
X-Received: by 2002:a05:6000:3109:b0:43d:1c21:eb14 with SMTP id ffacd0b85a97d-43d6429bcbbmr18388161f8f.21.1776065221249;
        Mon, 13 Apr 2026 00:27:01 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.239.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d73b44b3esm13045692f8f.13.2026.04.13.00.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 00:27:00 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: Iker Pedrosa <ikerpedrosam@gmail.com>,
	Troy Mitchell <troy.mitchell@linux.dev>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Trevor Gamblin <tgamblin@baylibre.com>
Subject: [PATCH v7 9/9] riscv: dts: spacemit: k1-musepi-pro: add SD card support with UHS modes
Date: Mon, 13 Apr 2026 09:24:51 +0200
Message-ID: <20260413-orangepi-sd-card-uhs-v7-9-16650f49c022@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260413-orangepi-sd-card-uhs-v7-0-16650f49c022@gmail.com>
References: <20260413-orangepi-sd-card-uhs-v7-0-16650f49c022@gmail.com>
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_002703_399976_69F406D1 
X-CRM114-Status: GOOD (  10.29  )
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
