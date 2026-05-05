Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68F7EFF8855
	for <linux-riscv@archiver.kernel.org>; Tue,  5 May 2026 16:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wHUHuPoH37vxrhlbDISXnK8NFHWKWeKiR5CYzhW6V+I=; b=Eyp9Tmmep1sKMl
	D0O7ClpgZgNxuqzhqkqpXdkAEJIVGnEIneZnHz9VfgrpJynYwAcwpDVo3/AO9mx8fuFnVAWf9MmvL
	3oCA+vFmL9Xb6bV5VJVTdUA3p2+PxQ2UBaK4+rfS0OqkY9tE79LVq5Qce9+JGgsRPSYoCm4yw/L2I
	tK3VI7GEUpxIsKkTH8FR/9JwTpVr+fDj1hg83GytEhJnUzNanHAH7v51enGnhND0/qs6Aw/CqA6FZ
	5WpyAc+f4ZbYoQpniUxLuSpI6dd8JbSEiCgwcqnq7vvIRrT4itWZ8vXJQNJAG7m3CEzx4iy9y2Ljj
	bDtP3UVeO89Uf/Wglxfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKII8-0000000GmKI-0sKc;
	Tue, 05 May 2026 16:06:36 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKII5-0000000GmI2-0qrN
	for linux-riscv@lists.infradead.org;
	Tue, 05 May 2026 16:06:34 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-ba92146cc86so905806666b.1
        for <linux-riscv@lists.infradead.org>; Tue, 05 May 2026 09:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777997191; x=1778601991; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uFVRK+/tJ5TyBkXs2ToW3IvAArIzFRTr/jPdIAnnb/Y=;
        b=XUiP2hiaCC0afJYviASS4xNh9uk6dHhdpgbtCrlotGc7buHEmj4Py0DMf06Hhfsv27
         uWYa1O2Ys+EuH+LcyoC+Te/eGZ62wJOu38a+pWqpI5yA3od7IDZPMYSGI2P8RMHtTuku
         fM/d0IKzFnaTCBNS+x9cdcSfUrhSLMWiJrlHnCGwboMeeJ7/ySdCO0U9U0E5pi01wK9G
         ykWzh0i0H3YWPhGKou/tq1kwdnVUIjFQN8j/ePqZPwVBmZWA3bcX/lEp6q6KTscKqP+U
         nBjcT9ZRXyKxITdiKlzH8ocovUNdpfMklYgndH+H84KIzUAZMxw/uO0pjnhxS2o0//d+
         R+Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777997191; x=1778601991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uFVRK+/tJ5TyBkXs2ToW3IvAArIzFRTr/jPdIAnnb/Y=;
        b=KgsF2zpaWr4voF4pq61LfQ8NXWAC/a9r9GYEvW0L5OlxD6jH8uUeCXdHv+LApzBRCT
         N2kBxDWT5bwEajshBoW7oCb7mTOXMAVP9uDubB9ChvRTZ2b25KZ34mDYX7Xhh5N93Wbt
         zdQFJ9tNHhT4j7LDhpGneVaFkCFFutYW4tZu7P6DMxTkAlTqDhfAMb7b3GQFm5cSDI2V
         O28nlIuYLX8QRxZbRnYhG+pmz6W3htvWqLcVo8UZ4lCGOHbEUNgcZ+m7zA8qDkLY5lEK
         pmcBd6CpOOBj9V4Nd9O48RM6gyXaX/Xq5ZNmnMHnPMigLuIA5UJvbCUETjZZvEwIS9hG
         0BDA==
X-Forwarded-Encrypted: i=1; AFNElJ/kPfizJEI9HaAAg2dsLEL4hJgi80aw9ihFk0V+gUDVZ0nGr1wR+AFCE0tLiHoACnaR8tz2Z4cbwczeHg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+piZyaxBUlc1bz9WQNjFBcmX08mtk/mQNWvEovfR/1fE5/LBJ
	9Rt4y61rqCTq+Fqvd+m3Y7DwVpqExMfhJ2fglnpjEJJeO24GI59ln2ds
X-Gm-Gg: AeBDievktsmXX6pXTC2cyk9p8typlOE20qmaehiVcnGgO714EEjWcoQWvKhzL3bOohM
	SjU48OHzG8qL0rgsfQhybZoUj2TgZZEYcw/7FX8Jxtkyp/MXxmoPgDOoyKme8ZgVjMsa7Op0Hcg
	NxbZXECRj5wceBBm2sLUPj/cYbNkWNFSyc8tgiI1nmUCykjSHIUdqEDOgzkGMTcCgpfu9+ktisK
	sPjIsKMmHmHgOl48OVsOg9wyvJfg4o60lWZo4rj7VrUcxcH5Oi7xr0OUrbCMQs3ShkwZYz3ZldU
	osi6KiUZ+r+2GgsiHN+lQBcjuJkAXA/ovT+eLeAIypnojDrIBtiMFlqhEDeH7FUgeO1rXs+zCy2
	nAz0l+NtarTD8cU3lgl9gFm9CqNw2H5f1GlsnJ6mr14O/Adz1dq2+5E5vzg46StUJz9C2JRUd91
	YChX8LP11pgoTYF5TIlxtcvnajrBVF1CSiMSx3nEX5+qEXHEaSmLvuKac4vtCw5CJzfNNdx5Uz0
	izV5Yc=
X-Received: by 2002:a17:907:868d:b0:b9c:b069:8ab6 with SMTP id a640c23a62f3a-bc40f43860dmr230618766b.7.1777997191045;
        Tue, 05 May 2026 09:06:31 -0700 (PDT)
Received: from mamamia.internal (a89-182-137-143.net-htp.de. [89.182.137.143])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055d36dacsm5398891f8f.32.2026.05.05.09.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:06:30 -0700 (PDT)
From: Andre Heider <a.heider@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] riscv: dts: spacemit: k1-musepi-pro: enable USB 3 ports
Date: Tue,  5 May 2026 18:06:18 +0200
Message-ID: <20260505160623.1369347-5-a.heider@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260505160623.1369347-1-a.heider@gmail.com>
References: <20260505160623.1369347-1-a.heider@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_090633_372740_7DD0020F 
X-CRM114-Status: UNSURE (   9.36  )
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

Enable the DWC3 USB 3.0 controller, its associated combo_phy (USB 3 PHY)
and usbphy2 (USB 2 PHY) on the MusePi Pro board.

The board uses a VLI VL817 hub, providing four ports.

Signed-off-by: Andre Heider <a.heider@gmail.com>
---
 .../riscv/boot/dts/spacemit/k1-musepi-pro.dts | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
index 32599082b3c36..869172d23e259 100644
--- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
@@ -54,6 +54,28 @@ reg_vcc_5v0_sys: regulator-vcc5v0-sys {
 		regulator-always-on;
 		vin-supply = <&reg_usb_vbus>;
 	};
+
+	reg_5v_vbus: regulator-5v-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "5V_VBUS";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+		vin-supply = <&reg_vcc_5v0_sys>;
+		gpio = <&gpio K1_GPIO(79) GPIO_ACTIVE_HIGH>; /* USB3_PWREN */
+		enable-active-high;
+	};
+
+	reg_vcc5v_hub: regulator-vcc5v-hub {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC5V0_HUB";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+		vin-supply = <&reg_vcc_5v0_sys>;
+		gpio = <&gpio K1_GPIO(127) GPIO_ACTIVE_HIGH>; /* HUB_PWREN */
+		enable-active-high;
+	};
 };
 
 &emmc {
@@ -66,6 +88,10 @@ &emmc {
 	status = "okay";
 };
 
+&combo_phy {
+	status = "okay";
+};
+
 &eth0 {
 	phy-handle = <&rgmii0>;
 	phy-mode = "rgmii-id";
@@ -295,3 +321,31 @@ &uart0 {
 	pinctrl-names = "default";
 	status = "okay";
 };
+
+&usbphy2 {
+	status = "okay";
+};
+
+&usb_dwc3 {
+	dr_mode = "host";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	vbus-supply = <&reg_5v_vbus>;
+	status = "okay";
+
+	hub_2_0: hub@1 {
+		compatible = "usb2109,2817";
+		reg = <0x1>;
+		vdd-supply = <&reg_vcc5v_hub>;
+		peer-hub = <&hub_3_0>;
+		reset-gpios = <&gpio K1_GPIO(123) GPIO_ACTIVE_LOW>; /* HUB_RST */
+	};
+
+	hub_3_0: hub@2 {
+		compatible = "usb2109,817";
+		reg = <0x2>;
+		vdd-supply = <&reg_vcc5v_hub>;
+		peer-hub = <&hub_2_0>;
+		reset-gpios = <&gpio K1_GPIO(123) GPIO_ACTIVE_LOW>; /* HUB_RST */
+	};
+};
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
