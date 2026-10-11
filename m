Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 864D3CA9EBD
	for <linux-riscv@archiver.kernel.org>; Sun, 11 Oct 2026 13:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sjHFIxqtbwizl6ZFGAJUfzyMxJYK2ePZ/4msRzaByeM=; b=ATn1JitXWq/imh
	Gy4o53HsfXZDgeu4AiF5c9vBtNu6byd751Pl5yUvRCn7ZS5vvdljLRNKKCeYMdI4ks9Dz3mrxWs7Z
	C3UQw3k6WqcNpnVnTfgJh5G4qhoJ4huzTlxb43n7HGXbDQ+LqExZM0GufMs0gaNsgaJHQsG/jDmSx
	9oYOR+GLjodYZCC2FnFizSxzpl+Sv1tgTk5tTmdvnZUvHr2JsMwLqALuXZpVAM5wScBb4XRaAKgMu
	IkSCH6KiItk7aKS5KwjjyVnA1OtP8c1rylJ8HcNldRQOYxevbh3iwWuwCZzvugBUpY9FpIZLgx/o0
	MSeSvo+RiuFXVOIDSZpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFtln-000000094Jh-3lOL;
	Sun, 11 Oct 2026 13:39:19 +0000
Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFtli-000000094HW-2OBn
	for linux-riscv@lists.infradead.org;
	Sun, 11 Oct 2026 13:39:17 +0000
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail-out.m-online.net (Postfix) with ESMTP id 4j2hX94YNZz1sR8g;
	Sun, 11 Oct 2026 15:39:05 +0200 (CEST)
DKIM-Signature: a=rsa-sha256; bh=AAYA6v5MnUMcI9QcPmOweeiWGFke9spuzNUKiC+8dQk=;
        c=relaxed/relaxed; d=muenchen-mail.de;
        h=Date:From:To:Message-ID:Subject;
        s=r1; t=1791725945; v=1;
        b=lqimsr+d3XBAIbP1dAkFm4PQDrYYKkjwksqiZwg9mxvSopH2HO0pAreftwjg4mqe
         CIfep0WRE3Gbqpm2rjtYaHxdXXF0f+0kyewlbG82BdxxNlu8H3AjgCAmim8rXPVb
         gHEklZrga8IXWbfRl3+UkmkfqI7QnqqXt+OjzuQhDdilAhpkhfgHwS2aOourDqk1
         tDdbF29b62VeyfxrbBBl+FEYr29quFfIbt1XqVBmNDWzBlXDAszD2+Hj3OodUYIQ
         LrDylKQQHoVRBE2KJRUFu9Wvl9epV6U3NrApWrr884p7/Z+u8Sv+qTiWsnaGo6ex
         1Vqq9MwWQ06LWRN077VQYw==
Received: from frontend03.mail.m-online.net (unknown [192.168.6.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4j2hX80GS8z1sR8H;
	Sun, 11 Oct 2026 15:39:03 +0200 (CEST)
Received: from localhost (dynscan3.mnet-online.de [192.168.6.87])
	by mail.m-online.net (Postfix) with ESMTP id 4j2hX74jXDz1qqlS;
	Sun, 11 Oct 2026 15:39:03 +0200 (CEST)
X-Virus-Scanned: amavis at mnet-online.de
Received: from mail.mnet-online.de ([192.168.6.182])
 by localhost (dynscan3.mail.m-online.net [192.168.6.87]) (amavis, port 10024)
 with ESMTP id ATq7ikQRj-9X; Sun, 11 Oct 2026 15:39:01 +0200 (CEST)
X-Auth-Info: RWtFOPa2WPAAcoNvORZRjrjvz3yyE/RdyuxRfNfJkBn6yqWRhEJ0wED3jO+mdFff
Received: from wiesel.intern (aftr-62-216-206-149.dynamic.mnet-online.de [62.216.206.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Sun, 11 Oct 2026 15:39:01 +0200 (CEST)
Received: from murmel.intern (unknown [IPv6:fdea:9b79:8984:1:c2df:628d:efc1:8817])
	by wiesel.intern (Postfix) with ESMTP id D62AC79A086A;
	Sun, 11 Oct 2026 15:39:00 +0200 (CEST)
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
Subject: [PATCH 1/2] riscv: dts: thead: Enable bluetooth on BeagleV-Ahead
Date: Sun, 11 Oct 2026 15:37:59 +0200
Message-ID: <22787b9b20b62ac010a0fd8de0aa1f564fa577ce.1791720467.git.thomas.gerner@muenchen-mail.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1791720467.git.thomas.gerner@muenchen-mail.de>
References: <cover.1791720467.git.thomas.gerner@muenchen-mail.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_063915_388413_9784E264 
X-CRM114-Status: GOOD (  11.23  )
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

On the BeagleV-Ahead the bluetooth module of the Ampak AP6203BM is
identified by the btbcm driver as BCM4362A2. The module is connected by
UART4, several gpio pins and an I2S interface. The I2S is currently not
used as there is no driver. 

Signed-off-by: Thomas Gerner <thomas.gerner@muenchen-mail.de>
---
 .../boot/dts/thead/th1520-beaglev-ahead.dts   | 89 +++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
index e16484a47653..bf64eb667745 100644
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
@@ -152,6 +169,31 @@ led-pins {
 };
 
 &padctrl0_apsys {
+	bluetooth_in_pins: bluetooth-0 {
+		in-pins {
+			bias-disable;
+			drive-strength = <1>;
+			function = "gpio";
+			input-enable;
+			input-schmitt-enable;
+			pins = "GPIO2_30";
+			slew-rate = <0>;
+		};
+	};
+
+	bluetooth_out_pins: bluetooth-1 {
+		out-pins {
+			bias-disable;
+			drive-strength = <3>;
+			function = "gpio";
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
@@ -268,6 +310,30 @@ reg-on-pins {
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
@@ -314,3 +380,26 @@ &uart0 {
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
+		pinctrl-0 = <&bluetooth_in_pins>;
+		pinctrl-1 = <&bluetooth_out_pins>;
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
