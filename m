Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D05AAC531D0
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jul 2026 09:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5HEoJ2Iv8z8VHTdfQ1uhRoSj2UD1i837Dixup7PxG6Q=; b=1Ffxa/V1AWpX1Z
	ZU9IzkpF4HV2LIk02pk4xjd5GV623mWYQVlrMxrYsPMskk+MA4+u1lp1J6JuT3Lrs8XKoP0nmIwsE
	TtQ6RKX16+eVFqOTex0s2yYhJUgDpeaF6VPrmaGksE7d4nXO1ErBKgdwHU3g+qO8/yOG1MnijJWfV
	kv1REIRZwxS2ATt4yKwd6fK785LGs/CaFhUYxHY8mgF/h2V+UsZnLv8mWJbM3Wu3yFVHl3kIrx7mP
	Q03bDLpO73YbBdnWGXodwDfMDq9XU9k58i1G1eOAqk3OkfxBrii6W5m3FcwzTX42qwTdCbhSWRxxs
	w40CrLtFlfxNxW+5qobw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woHvz-00000002N3l-2bPg;
	Mon, 27 Jul 2026 09:47:43 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woHvy-00000002N35-0AVK
	for linux-riscv@lists.infradead.org;
	Mon, 27 Jul 2026 09:47:43 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2ced3386430so25339965ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 27 Jul 2026 02:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785145661; x=1785750461; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dh0DZFRQSMXyojhiGXgYXVI9ooE3AUB1jkilp6F9ssI=;
        b=PuakMVtdZNlTdwQUtLFsZNbjAeuDOIWmDH1o3nWBZ76LZHDRf3EQoPq0i+na5LmaA9
         TPToZj2njP3hku6QUbBuWEFxXbFvMeRQqcLBgeTW3EkEjHOJk40jcJp8B5x1UA1Qa+H3
         godPeLt8+8kwKOYfMQyE7839FIko3/OWRVo3y/7bSLEexM1SV99Ca+T24fCa4vM1VVQd
         KYFhFf66R3svRnxw3JKtQgRm/TST4ntPzc8U9U8ySZZ4pyrWiL46wMCx9Il5Ja0Z8KhK
         zbX+mQt5s4uRvbRDHy2FUWVh/8KeU48SZQBrbeHXxkZwqvKvvSOq2iNyVqFsBJH2+NaJ
         mCXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785145661; x=1785750461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Dh0DZFRQSMXyojhiGXgYXVI9ooE3AUB1jkilp6F9ssI=;
        b=nUkDnOq/+sHXsueNpUzXq580Sdc2+rDhV9E0boAuLNJoG9uWwmlwPo5Yo61Yf1rYWQ
         P1kWk1wzY04xrunDm9ZM2/MxR573GBVq/ER9Ayn/CY85XIa17F4C7PkqFlUB2nwc7Biv
         IwANbfGSTpT15sDkue7sGhj4wKQLoY72dZgjhSAVqrQ4rnntn1qQLsU8y9oJAtJCgE5w
         hgMu4PE9lBuJwx0VV/vTK7prpwkxANe2l77Wsg4YTDV001M3pPy7u/NBy5NdesErWa4p
         cXdqMUuYzaWA2fZaDJ2jjx8dGqKcETm8vjYNx6Pk8nytYdepPHRVhVke8W4t6lUIzmH4
         707w==
X-Forwarded-Encrypted: i=1; AHgh+RqYdQGn43MA4jXYMVvkel8qaKKT86Va43PAcuS6ruO04Ubg0Nxm9kXB4deSy8tn+qd+SW+tMX5uT1pnVQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyhg4rXnjMGXEyaQM8yWepNRqvNs/4FTDAC3XsAyjHRLymGIdMs
	HYCTZD9VPJh8lItdbXCZ/Y+xBDBWm6cjetSjGQTIlDKMe6VX8lozkacb
X-Gm-Gg: AR+sD12POeZ9uCZrCmmfrtJ+igFCgXjQtDDWKkT9TeVhrCV7aoJStenUuxQltP7pxmj
	CMEYLEiDFnzUN1zQVJDTJzNwb26voGCjbsyLeVqi97QRoao69svX8fxdLgU1nA44zH1VPeCUaWI
	HhaoGHYys07mqPMIJoW7lTQvOemWuql4VDeDMEcWGhmyuPOXXEMTJ9RahINapnK0q774vX7agf1
	7XAg6TsWv1xSPJFeOtw1hk6yJoI7UOGtbEjR3BiuTcwx5lSZAvYoan1WtchpiOpr2DOH6Ceyzaz
	xN9xa327YmCjsRNKlf182GbpkQ3ZnDbI4oYf7qgg9bL6ZD/BRGQ04OlElVDyClI2oUqpz3Hj+vn
	tNPeczBtyRDbX8lbNSYHWd4Cz0Map36LVT9dwcHysPw6eKE+A/IAomk5E+VbTMSBJFtqhHRxoO/
	/q
X-Received: by 2002:a17:903:3508:b0:2cf:ca89:4990 with SMTP id d9443c01a7336-2cfde7be87dmr72267495ad.17.1785145661135;
        Mon, 27 Jul 2026 02:47:41 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde59bc49sm31701585ad.7.2026.07.27.02.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 02:47:40 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 1/2] riscv: dts: spacemit: k3: add USB controller and USB phy support
Date: Mon, 27 Jul 2026 17:47:23 +0800
Message-ID: <20260727094726.890179-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260727094726.890179-1-inochiama@gmail.com>
References: <20260727094726.890179-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_024742_100954_119547EC 
X-CRM114-Status: UNSURE (   9.80  )
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

Add all USB device node to the Spacemit K3.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 13 ++++++
 arch/riscv/boot/dts/spacemit/k3.dtsi         | 42 ++++++++++++++++++++
 2 files changed, 55 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index b89c1521e664..2a6d35a64d5c 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -182,6 +182,11 @@ dldo7: dldo7 {
 	};
 };
 
+&combophy {
+	spacemit,apmu = <&syscon_apmu 0x11>;
+	status = "okay";
+};
+
 &eth0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&gmac0_rgmii_0_cfg>, <&gmac0_phy_0_cfg>;
@@ -221,3 +226,11 @@ hub@1 {
 &usb2_phy {
 	status = "okay";
 };
+
+&usb3d_u2phy {
+	status = "okay";
+};
+
+&usb3d {
+	status = "okay";
+};
diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index 19fc9b49668e..7863ab7dd308 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -7,6 +7,7 @@
 #include <dt-bindings/clock/spacemit,k3-clocks.h>
 #include <dt-bindings/reset/spacemit,k3-resets.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/phy/phy.h>
 
 /dts-v1/;
 
@@ -438,6 +439,47 @@ soc: soc {
 		dma-noncoherent;
 		ranges;
 
+		usb3d: usb@81a00000 {
+			compatible = "spacemit,k3-dwc3";
+			reg = <0x0 0x81a00000 0x0 0x10000>;
+			interrupts = <149 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-parent = <&saplic>;
+			clocks = <&syscon_apmu CLK_APMU_USB3_PORTD_BUS>;
+			clock-names = "usbdrd30";
+			resets = <&syscon_apmu RESET_APMU_USB3_D_AHB>,
+				 <&syscon_apmu RESET_APMU_USB3_D_VCC>,
+				 <&syscon_apmu RESET_APMU_USB3_D_PHY>;
+			reset-names = "ahb", "vcc", "phy";
+			phys = <&usb3d_u2phy>,
+			       <&combophy 4 PHY_TYPE_USB3>;
+			phy-names = "usb2-phy", "usb3-phy";
+			phy_type = "utmi";
+			snps,dis_enblslpm_quirk;
+			snps,dis_u2_susphy_quirk;
+			snps,dis_u3_susphy_quirk;
+			snps,dis-del-phy-power-chg-quirk;
+			snps,dis-tx-ipgap-linecheck-quirk;
+			snps,parkmode-disable-ss-quirk;
+			dr_mode = "host";
+			status = "disabled";
+		};
+
+		usb3d_u2phy: phy@81b00000 {
+			compatible = "spacemit,k3-usb2-phy";
+			reg = <0x0 0x81b00000 0x0 0x200>;
+			clocks = <&syscon_apmu CLK_APMU_USB3_PORTD_BUS>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
+		combophy: phy@81d00000 {
+			compatible = "spacemit,k3-combo-phy";
+			reg = <0x0 0x81d00000 0x0 0x600000>;
+			#phy-cells = <2>;
+			spacemit,apb-spare = <&pll>;
+			status = "disabled";
+		};
+
 		usb2_host: usb@c0a00000 {
 			compatible = "spacemit,k3-dwc3";
 			reg = <0x0 0xc0a00000 0x0 0x10000>;
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
