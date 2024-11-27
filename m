Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A801D6ACE8
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Nov 2024 15:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qzQzd10y7vtR4zIPvzjIpvXCMW+dPR0wQk65q3xVJ7A=; b=NBrYDA0+I9wCnk
	1bI6w/ACsIvh3K5kxJKxAlDd8b/o4uLpJu8lbBOTgvjsVvMoXLEijbYHvAWH7CB3Y1gQjWTwD/1N7
	3s7KEEQeCi5njWgCIaQRgRYRvBKAVz/ftOlJtJbsQJLUcmI+kZOu7wwS1AuNH0zPV1Gd6r+zpSjC2
	BQN7ahQh/V0IwgSqUd5I18mjRWhP2EoG5vJesmQDab+tIMAMYOIzyRLz1084Kl9ManEBLufd1z2pX
	45R6WkVEr2azXhM9LHjiwplLn1IzIoyFlwH70PCMjdY/Mq/WhgqR8gNXp2htGXaU+qf1Ha+Yk4ARM
	Uama9GjiEiyFE1/UjeIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGJpO-0000000DU9l-06ZN;
	Wed, 27 Nov 2024 15:19:42 +0000
Received: from freeshell.de ([2a01:4f8:231:482b::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGJpL-0000000DU8L-25nL
	for linux-riscv@lists.infradead.org;
	Wed, 27 Nov 2024 15:19:40 +0000
Received: from hay.lan. (unknown [IPv6:2605:59c8:31de:bf00:6ecf:39ff:fe00:8375])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 2B8C0B4B1DCD;
	Wed, 27 Nov 2024 16:19:35 +0100 (CET)
From: E Shattow <e@freeshell.de>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Henry Bell <dmoo_dv@protonmail.com>
Cc: E Shattow <e@freeshell.de>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/1] riscv: dts: starfive: jh7110-pine64-star64: enable usb0  host function
Date: Wed, 27 Nov 2024 07:15:05 -0800
Message-ID: <20241127151843.70341-2-e@freeshell.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241127151843.70341-1-e@freeshell.de>
References: <20241127151843.70341-1-e@freeshell.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_071939_705800_6C49A231 
X-CRM114-Status: UNSURE (   7.45  )
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

Pine64 Star64 board routes all four USB-A ports to USB0 on the SoC.
Set JH7110 on-chip USB host mode and vbus pin assignment accordingly.

Signed-off-by: E Shattow <e@freeshell.de>
Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
---
 .../boot/dts/starfive/jh7110-pine64-star64.dts | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts b/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts
index fe4a490ecc61..b764d4d92fd9 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts
+++ b/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts
@@ -80,7 +80,23 @@ &spi0 {
 	status = "okay";
 };
 
+&sysgpio {
+	usb0_pins: usb0-0 {
+		vbus-pins {
+			pinmux = <GPIOMUX(25,  GPOUT_SYS_USB_DRIVE_VBUS,
+					       GPOEN_ENABLE,
+					       GPI_NONE)>;
+			bias-disable;
+			input-disable;
+			input-schmitt-disable;
+			slew-rate = <0>;
+		};
+	};
+};
+
 &usb0 {
-	dr_mode = "peripheral";
+	dr_mode = "host";
+	pinctrl-names = "default";
+	pinctrl-0 = <&usb0_pins>;
 	status = "okay";
 };
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
