Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C215ACD37BE
	for <linux-riscv@archiver.kernel.org>; Mon, 11 May 2026 14:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mT6zULQKouJLOnfCnkBZy4J3nbHgVpEGc9SWmP5wb0o=; b=nd4wqM0DgUcu0u
	fJx8pN9mFg7ZVp2Z85J9BhbCi5hKEiRSFrCtCAebUecJMyl9xArY964SiAS48gom0NdnmJEPfeYob
	5z9zv/g2ioRA7Ass3QvHUnaUfRY8TI7NlCRVB4hSbbl5HfdJqBUaUQ2Z4VyXB3f5WondKgqXUAp/M
	hqbQXPew71m52feSRoZnbOQUIyuwqb+JwU0LbzgSsejJfxAUlpWd3/6pchf5dpANNHt9/AISNqp9e
	PisyPt/oEl0XOof+osR53QmySmxy1pUC6IbpuZmL3f0cr9wPePQBF/87zX+GovlRi0uz2E8KOtWu3
	iT6h9PUpPcnDqNuoiKsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMRMc-0000000DsGs-3YJQ;
	Mon, 11 May 2026 14:12:06 +0000
Received: from mail-out.m-online.net ([212.18.0.10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMRMY-0000000DsFl-3qbM
	for linux-riscv@lists.infradead.org;
	Mon, 11 May 2026 14:12:05 +0000
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail-out.m-online.net (Postfix) with ESMTP id 4gDhVh2cNsz1sHQ3;
	Mon, 11 May 2026 16:11:56 +0200 (CEST)
DKIM-Signature: a=rsa-sha256; bh=+CbS3bNUQzu0MAu8sUeYRjSUd4GKuS+acJBUfMpwj0I=;
        c=relaxed/relaxed; d=muenchen-mail.de;
        h=Date:From:To:Message-ID:Subject;
        s=r1; t=1778508716; v=1;
        b=U02IAbxW20+mLDSXSBnL//yWnFw0cmpReQdinMv0+pecTG1oO5yrn79TV/rc8UAw
         nZcBEpxu95fKg9txa+QlR1ATCfyvt+bVbVYvkOdXtobLmrb1nSKYeLN24wJMgIkO
         TuEmi8PeSOFw3QwYmM4FPKk5QfLv6TaPQRVFHTJD2VPYrSV8M044bi/IwePXKvLY
         i3sBF4V5xqk61kOO1VAR2omwG0hc5B2U4jxVwgP06WAKct2p5A5GcWKLmn1gPRh/
         XtrnPgJrwIMY6SFFOe38kp1krlZ0fJUefyrZA5L+tpPe1Z+8rtzvBTQzAAxXAHv+
         vgqHze0tc+OZ5yLA9h+38g==
Received: from frontend03.mail.m-online.net (unknown [192.168.6.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4gDhVf063Sz1sHPP;
	Mon, 11 May 2026 16:11:53 +0200 (CEST)
Received: from localhost (dynscan3.mnet-online.de [192.168.6.87])
	by mail.m-online.net (Postfix) with ESMTP id 4gDhVd5llqz1qqlS;
	Mon, 11 May 2026 16:11:53 +0200 (CEST)
X-Virus-Scanned: amavis at mnet-online.de
Received: from mail.mnet-online.de ([192.168.6.182])
 by localhost (dynscan3.mail.m-online.net [192.168.6.87]) (amavis, port 10024)
 with ESMTP id O6uJPu1FxYTY; Mon, 11 May 2026 16:11:53 +0200 (CEST)
X-Auth-Info: I0mXDoX6Dm3detU0TSzjhH8bSxf2eJ7TztcK6TYWMP4+A64YrwUfpb9WocUPFC0f
Received: from wiesel.intern (aftr-62-216-206-65.dynamic.mnet-online.de [62.216.206.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Mon, 11 May 2026 16:11:52 +0200 (CEST)
Received: from murmel.intern (unknown [IPv6:fdea:9b79:8984:1:8514:c35a:5b34:1596])
	by wiesel.intern (Postfix) with ESMTP id 7DFCD79A0378;
	Mon, 11 May 2026 16:11:52 +0200 (CEST)
From: Thomas Gerner <thomas.gerner@muenchen-mail.de>
To: Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Thomas Gerner <thomas.gerner@muenchen-mail.de>
Subject: [PATCH] Enable wifi on the BeagleV-Ahead
Date: Mon, 11 May 2026 16:11:00 +0200
Message-ID: <20260511141119.155369-1-thomas.gerner@muenchen-mail.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_071204_230079_0E94CDB6 
X-CRM114-Status: UNSURE (   9.71  )
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

The BeagleV-Ahead board uses an AP6203BM WiFi chip from AMPAK Technology
Inc. connected to SDIO1. The chip is compatible to the broadcom wireless
driver.

Enable wifi on the BeagleV-Ahead.

Signed-off-by: Thomas Gerner <thomas.gerner@muenchen-mail.de>
---
 .../boot/dts/thead/th1520-beaglev-ahead.dts   | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
index 91f3f9b987bc..5e0dc47d263c 100644
--- a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
+++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
@@ -86,6 +86,11 @@ hdmi_con_in: endpoint {
 			};
 		};
 	};
+
+	brcmf_pwrseq: brcmf_pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&gpio2 31 GPIO_ACTIVE_LOW>;	/* WL-REG-ON */
+	};
 };
 
 &osc {
@@ -239,6 +244,28 @@ rx-pins {
 			slew-rate = <0>;
 		};
 	};
+
+	wifi_pins: wifi-pins {
+	    host-wake-wl {
+			pins = "GPIO2_25";
+			function = "gpio";
+			bias-pull-up;
+			drive-strength = <1>;
+			input-enable;
+			input-schmitt-disable;
+			slew-rate = <0>;
+		};
+
+	    reg-on-wl {
+		    pins = "GPIO2_31";
+		    function = "gpio";
+			bias-pull-up;
+			drive-strength = <3>;
+			input-disable;
+			input-schmitt-disable;
+			slew-rate = <0>;
+	    };
+	};
 };
 
 &sdio0 {
@@ -247,6 +274,29 @@ &sdio0 {
 	status = "okay";
 };
 
+&sdio1 {
+	bus-width = <4>;
+	max-frequency = <198000000>;
+	status = "okay";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	non-removable;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&wifi_pins>;
+	mmc-pwrseq = <&brcmf_pwrseq>;
+
+	wifi@1 {
+		compatible = "cypress,cyw43012-fmac", "brcm,bcm4329-fmac";
+		reg = <1>;
+		brcm,sd_head_align = <4>;
+		brcm,sd_sgentry_align = <512>;
+		interrupt-parent = <&gpio2>;
+		interrupts = <25 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "host-wake";
+	};
+};
+
 &dpu {
 	status = "okay";
 };
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
