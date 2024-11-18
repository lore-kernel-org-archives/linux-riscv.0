Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81001D10F5A
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Nov 2024 04:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kFXelZPW2O/6INkvb3MeQXPP5gHb0rmdMiAS9AZ7dH0=; b=Nng2EfFitKoltQ
	0MsLZTOIDPl1LBQiXmV9ILal1nbO2rKxBTjBh2IH/g5tXtlcqZGsTPTjMi6mMvdiJe5Mw5hmCDMcl
	mTU3QoZlXNu0W9gW3sbTKow/3QpkBdHmHxFnNzE7WdSeUAR76EDgqJqw6qppPJJSTZcCKU+1nL6sj
	a6YEOpVquJNP4/2X3EFgEi3E6I8N5M6SfxaaZ2nZbJVkPplJB9YgE+yKUmiRq7JcPkI5sk4BnIDBz
	5UQYlABDIAlURdr23wPFemET6CT01z87Do5IW4iLNHgFisSN8iBZcW6/imwWYwVBO27OFkU1ovMrr
	ZI59Lg5r09LQCBmMmeVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCsz0-00000008HPh-29lZ;
	Mon, 18 Nov 2024 04:03:26 +0000
Received: from freeshell.de ([116.202.128.144])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCsyy-00000008HOp-1IE8
	for linux-riscv@lists.infradead.org;
	Mon, 18 Nov 2024 04:03:25 +0000
Received: from hay.lan. (unknown [IPv6:2605:59c8:31de:bf00:6ecf:39ff:fe00:8375])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 99FC3B4B1654;
	Mon, 18 Nov 2024 05:03:20 +0100 (CET)
From: E Shattow <e@freeshell.de>
To: Henry Bell <dmoo_dv@protonmail.com>
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
Subject: [PATCH 1/1] riscv: dts: starfive: jh7110-pine64-star64: enable usb0 host function
Date: Sun, 17 Nov 2024 20:02:10 -0800
Message-ID: <20241118040250.43625-2-e@freeshell.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241118040250.43625-1-e@freeshell.de>
References: <20241118040250.43625-1-e@freeshell.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241117_200324_501632_85726515 
X-CRM114-Status: UNSURE (   6.79  )
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

Pine64 Star64 set host mode and vbus pin for JH7110 on-chip USB 2.0

Signed-off-by: E Shattow <e@freeshell.de>
---
 .../dts/starfive/jh7110-pine64-star64.dts     | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts b/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts
index 8e39fdc73ecb..9f608d00d3d3 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts
+++ b/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts
@@ -62,3 +62,24 @@ &phy1 {
 	motorcomm,tx-clk-10-inverted;
 	motorcomm,tx-clk-100-inverted;
 };
+
+&sysgpio {
+        usb0_pins: usb0-0 {
+                vbus-pins {
+                        pinmux = <GPIOMUX(25, GPOUT_SYS_USB_DRIVE_VBUS,
+                                              GPOEN_ENABLE,
+                                              GPI_NONE)>;
+                        bias-disable;
+                        input-disable;
+                        input-schmitt-disable;
+                        slew-rate = <0>;
+                };
+        };
+};
+
+&usb0 {
+        dr_mode = "host";
+        pinctrl-names = "default";
+        pinctrl-0 = <&usb0_pins>;
+        status = "okay";
+};
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
