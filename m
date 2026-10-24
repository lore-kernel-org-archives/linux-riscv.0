Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC3A60A5BCD
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Oct 2026 09:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VgPacIQd;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=T9Pej+/0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=azm/05DeuhTHZrWVpilmNN+QvILgjay1lRl1MGwk3Z8=; b=VgPacIQdXpcdJ/W6Fs/A+rPpjG
	yilAQcBxxBa4hIWK8+S5RgetOMUZIOCr7nOe5zujGFUF5edYJLygwmoTLs5yzexYOP9x1jdNm50Nl
	9kzmhw6psBNW4dvqxFaGp5z7Xwft3TBVYFE7hRWfxazSV3OSjGkxdhf9FGW2Vo20nVaZAyjbDrCsS
	/LqvhGxsazyT65XOXybDDX8fOODFED/zLhVWZRp8alqgUrvvkVCPgNvMfAlR4P1APvt38g9yJij6X
	ZU55zih9KfAa3lyF+aT5KrRoFcxlTh/e9cc0fMt7JF6chOD3rNwtfl2yUaJfpTvqIO8HrlYOsYsMO
	uLgh8sdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKY13-000000002nW-1v8U;
	Sat, 24 Oct 2026 09:26:17 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKY0x-000000002mI-3PQS
	for linux-riscv@lists.infradead.org;
	Sat, 24 Oct 2026 09:26:14 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-ccca948203aso559682a12.3
        for <linux-riscv@lists.infradead.org>; Sat, 24 Oct 2026 02:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792833971; x=1793438771; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=thIlTFdBb0qcp3PAkfPcVWyFY4ERXyIUZczud0xoE2o=;
        b=T9Pej+/08OMRPxePpVmVvKH2Y2oKxU/tyEcNKHKTGq4hKaxzBuDGebXQ8ysW8p4OYC
         RNyChUJgw3/9MeaZOykpvqJThnUqqwO5zMJVFVNJrE1Ykc0ftsZkoM5ygyxsnhEjMNsl
         X1xkUchb+ahBeS+qj5AivM1OKnHnZhe4y/VskodQBWPGscdkNkJn7fQmtoiakZdPjfW3
         RSMt1HikrreicY9y621UN4wEzU+/ZACR3waHKybrvXEmagtDjjypvgKpVGLr8+DpOlLA
         zkXoa4X77NBQ57dOZ5w9KbKSy1VkAPIAOjGuZOwbvx3HSQVBIISfOH/ECBn8RR40eOkP
         eHcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792833971; x=1793438771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=thIlTFdBb0qcp3PAkfPcVWyFY4ERXyIUZczud0xoE2o=;
        b=EhT9sPHMbiJxc66eJoFV2Ee9T9//65Q2USQfcfMc3BlJn/xbhtRkMTBZfGFmfsjahs
         oA0qotRP/UHEe6haJkBximCPvYk/9UuMPXAp9iPEOFnFWDHUq/I78l5gnT8EBvkVACME
         u5nZp/HF0QWpRKgVFOPpgX3W8K1MOlBLWT8H41hd8XkKOd0MuxTWV3zYPOUPbv0KtyR2
         ogP7jEeQXq3mknoKQ5SXrY3tFPQusJCSn3/ocA2n1q9nveZ8ofLWRzA6qoRdchSb8rt8
         BdRKLjF36sZzARj8uOFoWw5IPlQsXSbRy+lc0fQjh3bQxPt11QIfSDLkcF7xFs4HGbiJ
         +W8g==
X-Forwarded-Encrypted: i=1; AKwUvBzz6BmbTORfHrPPMsbpoQNbtsHRFyucHCfmJbd4U9cM2yfApTS3QS8DYAbu3YjjTurClUP7WmHBgBl+yA==@lists.infradead.org
X-Gm-Message-State: AFq9FYIyEvjvecjHEeS7OOvj0o9rmF72rVbDsPJvPe8E4NKjcj9QKFys
	/vLu9aO1zA8svf5jxRX9y+Z2jga+5kfwrZnDLzEgZzqII5N5fm2MehwF
X-Gm-Gg: AYBFou0y0aB88ibfhBlryyhlP8cSgqR/gu9EB0dFmX97PCr2n5lClHZvE3bM0sksMwV
	OwzicTawn+0G48ZV8yG4LG2FyXx1Lrw+s/d66rFwJUbONG6Hfek9i8/VKfCiNbEEb7lNzDaSavE
	lKVCph/BKf/IhUi7GejmrGkozvcD6dP2hk+2Z17uQjg2CcxbR8QN1TlH5scQYqBLOYK8E+mCYnk
	R7m4CMjrRJmPi3i27v3noVqwzFZbw93PjNpSvqxig/YqYUCvu4rigj6YeSMF80Qc7aQ5K3UEf3g
	fv5vXHm2uxm48vUNFMxh4k7L9XAQg+MUBgmqhBs67qt6661M7t/41KeNrcPhxfEIhOeVRKgQP1J
	ezT+1H5nmRtJCuwCWkLiIoxg/eoETXt/E+K4zwL5x3MngpC+gL01uOQQ305B5M7wJX6SeqCOTVg
	xVjZOf+Ig47d6rF0T2GVn2S0d5M7947x8yl8V5Xn+YltJJgTcoD7nWdNb+YsgMrw2eHrQPA/AUd
	VpqlcragM6CTk1Y67JQLba/yKXN+9Sru3dtbOkpAJSX8eRB9G8R1ta/CxMqJXeGeMOyqET/ahI7
	+1p3PLCFQ1B56X0jq8Hb5TDNOsG5Y4JY2DKYB4jWvRbCsEKvTjYMo1PQRjJPwmXKrGtrSiO9eWP
	T+h5OIeN5VE6yGaboGSOy8WfT22+lOii5PyU=
X-Received: by 2002:a17:90b:35c6:b0:3ac:8897:7baa with SMTP id 98e67ed59e1d1-3adeae64f23mr1257289a91.40.1792833970704;
        Sat, 24 Oct 2026 02:26:10 -0700 (PDT)
Received: from alanhc-14700.tailb22ec2.ts.net (180-177-138-120.dynamic.kbronet.com.tw. [180.177.138.120])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adeba38910sm1392312a91.1.2026.10.24.02.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 02:26:10 -0700 (PDT)
From: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
To: Yixun Lan <dlan@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	E Shattow <e@freeshell.de>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] riscv: dts: spacemit: mark K1 board boot devices bootph-pre-ram
Date: Sat, 24 Oct 2026 17:25:58 +0800
Message-ID: <20261024092558.143621-3-alan.tseng.cs@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261024092558.143621-1-alan.tseng.cs@gmail.com>
References: <20261024092558.143621-1-alan.tseng.cs@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_022613_243515_191A2D24 
X-CRM114-Status: UNSURE (   9.60  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The board EEPROM at 0x50 holds the DRAM configuration (number of chip
selects, data rate and type), which has to be read before DRAM can be
trained. The P1 PMIC at 0x41 supplies the CPU core (buck1), the 1.8 V
rail of the EEPROM (buck3) and the SD card I/O (aldo1), which have to
be set up before that. Boards that boot from SPI NOR also need the
flash.

Mark these board devices bootph-pre-ram on the boards that have them.

Reviewed-by: E Shattow <e@freeshell.de>
Signed-off-by: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi | 5 +++++
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts   | 5 +++++
 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts | 6 ++++++
 arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts    | 6 ++++++
 arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts  | 5 +++++
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts  | 6 ++++++
 6 files changed, 33 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi b/arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi
index 81c40df2a3..5d1132f5a9 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi
@@ -71,6 +71,7 @@ &i2c2 {
 	eeprom@50 {
 		compatible = "atmel,24c02";
 		reg = <0x50>;
+		bootph-pre-ram;
 		vcc-supply = <&buck3_1v8>;
 		pagesize = <16>;
 		read-only;
@@ -100,6 +101,7 @@ &i2c8 {
 	pmic@41 {
 		compatible = "spacemit,p1";
 		reg = <0x41>;
+		bootph-pre-ram;
 		interrupts = <64>;
 		vin1-supply = <&reg_vcc_4v>;
 		vin2-supply = <&reg_vcc_4v>;
@@ -113,6 +115,7 @@ pmic@41 {
 
 		regulators {
 			buck1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1050000>;
 				regulator-ramp-delay = <5000>;
@@ -127,6 +130,7 @@ buck2 {
 			};
 
 			buck3_1v8: buck3 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1800000>;
 				regulator-ramp-delay = <5000>;
@@ -155,6 +159,7 @@ buck6 {
 			};
 
 			aldo1: aldo1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3400000>;
 				regulator-boot-on;
diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 58035d886b..90c4585d94 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -194,6 +194,7 @@ &i2c2 {
 	eeprom@50 {
 		compatible = "atmel,24c02";
 		reg = <0x50>;
+		bootph-pre-ram;
 		vcc-supply = <&buck3_1v8>; /* EEPROM_VCC1V8 */
 		pagesize = <16>;
 		read-only;
@@ -223,6 +224,7 @@ &i2c8 {
 	pmic@41 {
 		compatible = "spacemit,p1";
 		reg = <0x41>;
+		bootph-pre-ram;
 		interrupts = <64>;
 		vin1-supply = <&reg_vcc_4v>;
 		vin2-supply = <&reg_vcc_4v>;
@@ -236,6 +238,7 @@ pmic@41 {
 
 		regulators {
 			buck1_0v9: buck1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1050000>;
 				regulator-ramp-delay = <5000>;
@@ -250,6 +253,7 @@ buck2 {
 			};
 
 			buck3_1v8: buck3 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1800000>;
 				regulator-ramp-delay = <5000>;
@@ -278,6 +282,7 @@ buck6 {
 			};
 
 			aldo1: aldo1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3400000>;
 				regulator-boot-on;
diff --git a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
index 635e95aad1..93f486ba60 100644
--- a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
@@ -208,6 +208,7 @@ &i2c2 {
 	eeprom@50 {
 		compatible = "atmel,24c04";
 		reg = <0x50>;
+		bootph-pre-ram;
 		vcc-supply = <&buck3_1v8>; /* EEPROM_VCC18 */
 		pagesize = <16>;
 		read-only;
@@ -230,6 +231,7 @@ &i2c8 {
 	pmic@41 {
 		compatible = "spacemit,p1";
 		reg = <0x41>;
+		bootph-pre-ram;
 		interrupts = <64>;
 		vin1-supply = <&reg_vcc_4v>;
 		vin2-supply = <&reg_vcc_4v>;
@@ -243,6 +245,7 @@ pmic@41 {
 
 		regulators {
 			buck1_0v9: buck1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1050000>;
 				regulator-ramp-delay = <5000>;
@@ -257,6 +260,7 @@ buck2 {
 			};
 
 			buck3_1v8: buck3 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1800000>;
 				regulator-ramp-delay = <5000>;
@@ -285,6 +289,7 @@ buck6 {
 			};
 
 			aldo1: aldo1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3400000>;
 				regulator-boot-on;
@@ -386,6 +391,7 @@ &qspi {
 	flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0>;
+		bootph-pre-ram;
 		spi-max-frequency = <26500000>;
 		spi-rx-bus-width = <4>;
 		spi-tx-bus-width = <4>;
diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
index 23f32a8a3d..ce7342ed82 100644
--- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
@@ -167,6 +167,7 @@ &i2c2 {
 	eeprom@50 {
 		compatible = "atmel,24c02";
 		reg = <0x50>;
+		bootph-pre-ram;
 		vcc-supply = <&buck3_1v8>; /* EEPROM_VCC1V8 */
 		pagesize = <8>;
 		read-only;
@@ -199,6 +200,7 @@ &i2c8 {
 	pmic@41 {
 		compatible = "spacemit,p1";
 		reg = <0x41>;
+		bootph-pre-ram;
 		interrupts = <64>;
 		vin1-supply = <&reg_vcc_4v>;
 		vin2-supply = <&reg_vcc_4v>;
@@ -212,6 +214,7 @@ pmic@41 {
 
 		regulators {
 			buck1_0v9: buck1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1050000>;
 				regulator-ramp-delay = <5000>;
@@ -226,6 +229,7 @@ buck2 {
 			};
 
 			buck3_1v8: buck3 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1800000>;
 				regulator-ramp-delay = <5000>;
@@ -254,6 +258,7 @@ buck6 {
 			};
 
 			aldo1: aldo1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3400000>;
 				regulator-boot-on;
@@ -353,6 +358,7 @@ &qspi {
 	flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0>;
+		bootph-pre-ram;
 		spi-max-frequency = <26500000>;
 		spi-rx-bus-width = <4>;
 		spi-tx-bus-width = <4>;
diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
index eb77aae9d6..83ad1cc06d 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
@@ -158,6 +158,7 @@ &i2c2 {
 	eeprom@50 {
 		compatible = "atmel,24c02";
 		reg = <0x50>;
+		bootph-pre-ram;
 		pagesize = <16>;
 		size = <256>;
 		read-only;
@@ -187,6 +188,7 @@ &i2c8 {
 	pmic@41 {
 		compatible = "spacemit,p1";
 		reg = <0x41>;
+		bootph-pre-ram;
 		interrupts = <64>;
 		vin1-supply = <&vcc4v0>;
 		vin2-supply = <&vcc4v0>;
@@ -200,6 +202,7 @@ pmic@41 {
 
 		regulators {
 			buck1_0v9: buck1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1050000>;
 				regulator-ramp-delay = <5000>;
@@ -214,6 +217,7 @@ buck2 {
 			};
 
 			buck3_1v8: buck3 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1800000>;
 				regulator-ramp-delay = <5000>;
@@ -242,6 +246,7 @@ buck6 {
 			};
 
 			aldo1_3v3: aldo1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3400000>;
 				regulator-boot-on;
diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index 790234f355..dba5f8a021 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -185,6 +185,7 @@ &i2c2 {
 	eeprom@50 {
 		compatible = "atmel,24c02";
 		reg = <0x50>;
+		bootph-pre-ram;
 		pagesize = <16>;
 		size = <256>;
 		read-only;
@@ -214,6 +215,7 @@ &i2c8 {
 	pmic@41 {
 		compatible = "spacemit,p1";
 		reg = <0x41>;
+		bootph-pre-ram;
 		interrupts = <64>;
 		vin1-supply = <&vcc4v0>;
 		vin2-supply = <&vcc4v0>;
@@ -227,6 +229,7 @@ pmic@41 {
 
 		regulators {
 			buck1_0v9: buck1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1050000>;
 				regulator-ramp-delay = <5000>;
@@ -241,6 +244,7 @@ buck2 {
 			};
 
 			buck3_1v8: buck3 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1800000>;
 				regulator-ramp-delay = <5000>;
@@ -269,6 +273,7 @@ buck6 {
 			};
 
 			aldo1: aldo1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3400000>;
 				regulator-boot-on;
@@ -366,6 +371,7 @@ &qspi {
 	flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0>;
+		bootph-pre-ram;
 		spi-max-frequency = <26500000>;
 		spi-rx-bus-width = <4>;
 		spi-tx-bus-width = <4>;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
