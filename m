Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D49606A32E
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Oct 2026 13:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fCqywoLy;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=muenchen-mail.de header.i=@muenchen-mail.de header.a=rsa-sha256 header.s=r1 header.b=3w4L8FIE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rdgMkK6KXPGLFWzbnQZ5YahdA84RvrSWZnhOBK99ihA=; b=fCqywoLyDYiK1L
	tl7YYdazefz00lkou/7loz5rQTfiveKxA1n/R9ywvCVZ8pM6AJoey8DlDSidGJS+P+hR2swt5ECKK
	8K0shw+BHfDG0QXD6rwWa2uRzE3tKmCjS0QohDtxQw63oYgnGO0kweipHO03hLuo268Xfg0NoZq24
	Mn5dryhiLxYUV02hKkBrsBeEafktigo0gr4WTPkiTp/mg3ufz2UY4sk0yb4EG8fRVb8xWqyMm6mlQ
	pyp/RrOldaH8UQUUABQAe8Bbjl+irhJm+hjM0PCy+sKp3ephaVwyUbdJUZ6JD2bcrmk3IFTDpLfe8
	LmjOXVKIiTC3xAuu1Y7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ9re-00000009mwS-0KVA;
	Tue, 20 Oct 2026 13:26:50 +0000
Received: from mail-out.m-online.net ([212.18.0.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ9rY-00000009muZ-1yL0
	for linux-riscv@lists.infradead.org;
	Tue, 20 Oct 2026 13:26:47 +0000
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail-out.m-online.net (Postfix) with ESMTP id 4j8Cqd5dZFz1rB8S;
	Tue, 20 Oct 2026 15:26:37 +0200 (CEST)
DKIM-Signature: a=rsa-sha256; bh=gxqjTLXP2Bdl4XJTAtgSbJ5PxXoA7v64IqgAkEOSj9w=;
        c=relaxed/relaxed; d=muenchen-mail.de;
        h=Date:From:To:Message-ID:Subject;
        s=r1; t=1792502797; v=1;
        b=3w4L8FIE/Ywd9uazcASiiL2vg4piD76E1+r2pBrGet6WRgBAN4pG39h73KVusL13
         AD5osIiiRJrBfeljB438B8mfA5gGUwf0ETQjXrHRAdsVIgBi2jY/GvYTXJ9elojI
         PauLK8TM+rAkyowl2O6Tk91Xa1+q29i1LcMp9IoKL6ojD89HxOhzEpMaz9oKcO8o
         pUrFnVh+Qg4sWBRAh5iAFlJ4nYmT5oXsdXR8ToUo3Frco1Lo8DDnLGJHf9QfyDRi
         SAqOHRLBIyWkI78l8lVtjst8zYjoBLJo4yOS0lU9FvYh3WmhhFnlKsbhJm7olR0C
         3hRY3+lvBWN5ylRnbNriIA==
Received: from frontend03.mail.m-online.net (unknown [192.168.6.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4j8Cqc2Gkgz1rB88;
	Tue, 20 Oct 2026 15:26:36 +0200 (CEST)
Received: from localhost (dynscan3.mnet-online.de [192.168.6.87])
	by mail.m-online.net (Postfix) with ESMTP id 4j8Cqc21yyz1qqlT;
	Tue, 20 Oct 2026 15:26:36 +0200 (CEST)
X-Virus-Scanned: amavis at mnet-online.de
Received: from mail.mnet-online.de ([192.168.6.182])
 by localhost (dynscan3.mail.m-online.net [192.168.6.87]) (amavis, port 10024)
 with ESMTP id D802EUZcgVnU; Tue, 20 Oct 2026 15:26:34 +0200 (CEST)
X-Auth-Info: X//PJFB5cKJHMaFeE+OqOQNjOzV+MxMHlhQBdCjykIl9w5Vw+uMptPISYU/ALOh0
Received: from wiesel.intern (aftr-62-216-206-189.dynamic.mnet-online.de [62.216.206.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Tue, 20 Oct 2026 15:26:34 +0200 (CEST)
Received: from murmel.intern (unknown [IPv6:fdea:9b79:8984:1:7b8d:a039:76a5:1596])
	by wiesel.intern (Postfix) with ESMTP id DB9AB79A0932;
	Tue, 20 Oct 2026 15:26:33 +0200 (CEST)
From: Thomas Gerner <thomas.gerner@muenchen-mail.de>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	Thomas Gerner <thomas.gerner@muenchen-mail.de>
Subject: [PATCH v2 2/2] riscv: dts: thead: Enable bluetooth on BeagleV-Ahead
Date: Tue, 20 Oct 2026 15:26:04 +0200
Message-ID: <20261020132604.90708-3-thomas.gerner@muenchen-mail.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261020132604.90708-1-thomas.gerner@muenchen-mail.de>
References: <20261020132604.90708-1-thomas.gerner@muenchen-mail.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_062645_871134_9FD0EE00 
X-CRM114-Status: GOOD (  11.72  )
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On the BeagleV-Ahead the bluetooth module of the Ampak AP6203BM is
identified by the btbcm driver as BCM4362A2. The module is connected by
UART4, several gpio pins and an I2S interface. The I2S is currently not
used as there is currently no driver.

Signed-off-by: Thomas Gerner <thomas.gerner@muenchen-mail.de>
---
Changes in v2:
	- use default pinctrl definition for bluetooth in and out pins
	
 .../boot/dts/thead/th1520-beaglev-ahead.dts   | 85 +++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
index e16484a47653..7161a9d4c61f 100644
--- a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
+++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
@@ -76,6 +76,23 @@ led-5 {
 		};
 	};
 
+	reg_vbat_1v8: regulator-vbat-1v8 {
+		compatible = "regulator-fixed";
+		regulator-boot-on;
+		regulator-max-microvolt = <1800000>;
+		regulator-min-microvolt = <1800000>;
+		regulator-name = "vbat-1v8";
+	};
+
+	reg_vbat_3v3: regulator-vbat-3v3 {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		regulator-boot-on;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "vbat-3v3";
+	};
+
 	hdmi-connector {
 		compatible = "hdmi-connector";
 		type = "d";
@@ -152,6 +169,28 @@ led-pins {
 };
 
 &padctrl0_apsys {
+	bluetooth_pins: bluetooth-0 {
+		in-pins {
+			bias-disable;
+			drive-strength = <1>;
+			function = "gpio";
+			input-enable;
+			input-schmitt-enable;
+			pins = "GPIO2_30";
+			slew-rate = <0>;
+		};
+
+		out-pins {
+			bias-disable;
+			drive-strength = <3>;
+			input-disable;
+			input-schmitt-disable;
+			pins = "SDIO1_DETN",	/* GPIO2_29 */
+			       "SDIO1_WPRTN";	/* GPIO2_28 */
+			slew-rate = <0>;
+		};
+	};
+
 	gmac0_pins: gmac0-0 {
 		tx-pins {
 			pins = "GMAC0_TX_CLK",
@@ -268,6 +307,30 @@ reg-on-pins {
 	};
 };
 
+&padctrl1_apsys {
+	uart4_pins: uart4-0 {
+		rx-pins {
+			bias-disable;
+			drive-strength = <1>;
+			function = "uart";
+			input-enable;
+			pins = "UART4_RXD", "UART4_CTSN";
+			input-schmitt-enable;
+			slew-rate = <0>;
+		};
+
+		tx-pins {
+			bias-disable;
+			drive-strength = <3>;
+			function = "uart";
+			input-disable;
+			pins = "UART4_TXD", "UART4_RTSN";
+			input-schmitt-disable;
+			slew-rate = <0>;
+		};
+	};
+};
+
 &sdio0 {
 	bus-width = <4>;
 	max-frequency = <198000000>;
@@ -314,3 +377,25 @@ &uart0 {
 	pinctrl-0 = <&uart0_pins>;
 	status = "okay";
 };
+
+&uart4 {
+	pinctrl-0 = <&uart4_pins>;
+	pinctrl-names = "default";
+	uart-has-rtscts;
+
+	status = "okay";
+
+	bluetooth {
+		compatible = "brcm,bcm4329-bt";
+		device-wakeup-gpios = <&gpio2 29 GPIO_ACTIVE_HIGH>;
+		interrupt-parent = <&gpio2>;
+		interrupts = <30 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "host-wakeup";
+		max-speed = <921600>;
+		pinctrl-0 = <&bluetooth_pins>;
+		pinctrl-names = "default";
+		shutdown-gpios = <&gpio2 28 GPIO_ACTIVE_HIGH>; 	/* BT-REG-ON */
+		vbat-supply = <&reg_vbat_3v3>;
+		vddio-supply = <&reg_vbat_1v8>;
+	};
+};
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
