Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D16B1C5B56A
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Aug 2026 09:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=crL8Xeh8Iq0xgPBrStNvVUC/YFxFkCBapTEs0/37np8=; b=MIjaxKu/Cr2F3Q
	d8EP4tMTSDdFDzupSfMGIUAS6fqU9Ne9WZ2RlTZP2K8EyOP5hwbi/B2zfGyh1IgNCALIWp4jwPYSt
	y7j/fJGDB3L2NpmKL1R5yEaFd+hB7NCb+Iq66biyKlA8Bbhu7G6i1e6f4bm7LhROMnLIagndy3ljo
	rxXvUZbEgZnth4qPorymGI1UYsYYx9XEO9Fmqx33LZXpMnHhBEXUHMyj3F5OmpUTcU5Ai4c2FJrJD
	UMet6rOviUc3ArglYicTy9nthxMuvFOmtvYfgvLzTv0Xld3C584GY7s1g5SLYa2+gmgwfWzaFNE0L
	gzDI3J2mYMkt8NZ7pYeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu5GJ-0000000FkZz-1S6C;
	Wed, 12 Aug 2026 09:28:39 +0000
Received: from smtpbgsg1.qq.com ([54.254.200.92])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu5GA-0000000FkTK-1H7G
	for linux-riscv@lists.infradead.org;
	Wed, 12 Aug 2026 09:28:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1786526898;
	bh=F5XGTR/1/p7UZ79IdQekx+2Gc+B01cJJFAaBEaKPZKg=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=wjW6AZhMMyyIfiYdKpx1kemyLQTBCvZ3pkpe3iptcD6hAudd/rgzYeL6c2MyG3OVD
	 empGg+ga+1FCIKjYKLKIhF4u1m3kKbo7TFLuMyBU2ISPJd++PqumeBEYpqgQp1si45
	 DyI6B1qHQSVIt6/N6lHn2RMKg8/f0+HOFFo39yWg=
X-QQ-mid: esmtpsz19t1786526890t9287317e
X-QQ-Originating-IP: DubCNOQBpC5Qsd7AefZ/6Vu40ZEGCdDF9NuIdoogClU=
Received: from LT-PANJUNZHONG.dc.com ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 12 Aug 2026 17:28:08 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16440051225847281482
EX-QQ-RecipientCnt: 20
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
Date: Wed, 12 Aug 2026 17:26:15 +0800
Subject: [PATCH 4/6] riscv: dts: spacemit: add USB2.0 controller nodes for
 K1
MIME-Version: 1.0
Message-Id: <20260812-b4-spacemit-k1-usb2-v1-4-f28cf29e522b@linux.spacemit.com>
References: <20260812-b4-spacemit-k1-usb2-v1-0-f28cf29e522b@linux.spacemit.com>
In-Reply-To: <20260812-b4-spacemit-k1-usb2-v1-0-f28cf29e522b@linux.spacemit.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
 Peter Chen <peter.chen@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Junzhong Pan <panjunzhong@linux.spacemit.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786526874; l=2102;
 i=panjunzhong@linux.spacemit.com; s=20260306; h=from:subject:message-id;
 bh=+K8VgzxywmFUIjxY4clQKUBveKERwzvX0RcNjc/EX8I=;
 b=jhB8Z/r5cWiwJRn88exQbM8EJw4VLgyglgFtIT0WrKA0irHh386XY32FRVzz/w43x2IYpJGS7
 qfBXttnoIceD1JAuCVc5vIox/xjY3z4wF2Evv+RZazMKtuTkaC4tXWM
X-Developer-Key: i=panjunzhong@linux.spacemit.com; a=ed25519;
 pk=bY08BOg2T9H93/jG8fEE/tVmdXoQQMp9M2rtzPFoyJg=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: MxX5kg4KifQ2cXutadDsHHJgjRqMw125sfPOXOx1Q0bnSBzdBEYTTWQS
	5Yhm28c/TKcpBa7jPGU0dREynb0SuBgQ7f0HX+paBtt6YaubK2BoygDGDwlJNeIHuX8tLlM
	DrXenRxd1sUHmTuktoD5ZW3Qik2O0oQCahLTdsgBciRSE3w14ccBNwY3nZuMrxpzJ1cNnjQ
	1G59GVbgrSaacVpiuG07s0A0/LADJlfX2ed5E8paNNlWJf4cKy0Iz1AXQOp193OZeDfHXQ1
	NezTkwLTxDrHx7LZkip2ZAjdUhsjmjEUwXv2EC2s7H5UkX7pBdl6aOmb2bfKladGo6YyT06
	1VXZodLvZhxDOEkwXcACcdzj2FXhNE55F2xyDkUuL+bDuTUrEcNePGNPEdtULajYdGFz9za
	vX7Tyuj9+KOiFwPrWCe8pdgfzjfr0IKsBbrxzBoZhuAhXzrExFhrRun6dM0fsy331Jc+IIQ
	j98YL+RoHg6EANQav/2qL1CEm2z/k3L7JcRGghwt091zbR3Q1k9hJq8r0vNZ2cfN1vdCr2C
	P1OemLnxPFyW8xLyRW3zaQFfXNJcle4BGwgOeQsgVd+tPgyQl/YFgM2p+yLa2pPYB8JQsrw
	hiRObIOC4RF7KybIjMlTMAdEQBak82bT++zfa25dau5yub6shKhBGqBJWp2meuEU1eqDR8T
	N8fg5ftXNEDixf3NWcnamK6+AnQIBUXbYcK2Md2YDM8vYvGvIqO5j0stkYQPHC4JN4KSW/N
	MCVIwKMUH0+dz/rcD0JP5BvIXkHo0o54XGDD49LVo9WbGrpQygP0eKWQYOKI8MUUi2HA+HD
	lelpn4ZDTV1PsWLrjqIFg5dfHwQcBHIZRrCECvvPjRAWg0+Kb45wAxn1RoAigEFS1jjILk4
	UdW14VhJ46C+xic1tZ5LXAZu/i+8o1uu+6UkX24Yw1PVLiUt//0rS43F0w9UuJM8chKvMpL
	7NgLk0ObhOr/uKzDxjyRbvbp+lE4A/Q/THxCTPv9J4GseYzr+CTcQq51Z++tzw2MusFOuot
	hOBUyYPXI4hF0nXsGTptO19xth8Zynr5DLwJlWh4JPk0x0dOLTgQCKzk0vijci1Yi3/OYNU
	k+P2WNxLuytX7GKoKYcNflQLOO76fzi0+f/6F2CoL5ekY1FoMqZlIha4n0hDrkuUxabkoPG
	5h3juaWuMeseKTmbkqKBpI2hcG2a2VrE3abHpTzxMz/zm5U=
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_022830_806896_3EAB4B6C 
X-CRM114-Status: UNSURE (   8.38  )
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

The SpacemiT K1 SoC has two ChipIdea USB2.0 controllers.
- USB2.0 Dual-Role
- usb2.0 Host Only

Add the controller and PHY nodes.

Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 40 ++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 08a0f28d011f..aa35a3489250 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -449,6 +449,22 @@ syscon_rcpu2: system-controller@c0888000 {
 			#reset-cells = <1>;
 		};
 
+		usbphy0: phy@c0940000 {
+			compatible = "spacemit,k1-usb2-phy";
+			reg = <0x0 0xc0940000 0x0 0x200>;
+			clocks = <&syscon_apmu CLK_USB_AXI>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
+		usbphy1: phy@c09c0000 {
+			compatible = "spacemit,k1-usb2-phy";
+			reg = <0x0 0xc09c0000 0x0 0x200>;
+			clocks = <&syscon_apmu CLK_USB_P1>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
 		usbphy2: phy@c0a30000 {
 			compatible = "spacemit,k1-usb2-phy";
 			reg = <0x0 0xc0a30000 0x0 0x200>;
@@ -1291,6 +1307,30 @@ storage-bus {
 			#size-cells = <2>;
 			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>;
 
+			usb2_0: usb@c0900000 {
+				compatible = "spacemit,k1-usb2";
+				reg = <0x0 0xc0900000 0x0 0x4100>;
+				interrupts = <105>;
+				clocks = <&syscon_apmu CLK_USB_AXI>;
+				resets = <&syscon_apmu RESET_USB_AXI>;
+				phys = <&usbphy0>;
+				phy-names = "usb-phy";
+				dr_mode = "otg";
+				status = "disabled";
+			};
+
+			usb2_1: usb@c0980000 {
+				compatible = "spacemit,k1-usb2";
+				reg = <0x0 0xc0980000 0x0 0x4100>;
+				interrupts = <118>;
+				clocks = <&syscon_apmu CLK_USB_P1>;
+				resets = <&syscon_apmu RESET_USBP1_AXI>;
+				phys = <&usbphy1>;
+				phy-names = "usb-phy";
+				dr_mode = "host";
+				status = "disabled";
+			};
+
 			usb_dwc3: usb@c0a00000 {
 				compatible = "spacemit,k1-dwc3";
 				reg = <0x0 0xc0a00000 0x0 0x10000>;

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
