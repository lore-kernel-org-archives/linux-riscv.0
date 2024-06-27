Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FC8BC2BD09
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jun 2024 11:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gUtfhKyteS9R8gvYeNMSF2pxYcGK1C5cw7+PTruNBlE=; b=uGhRk/ig70ZujP
	747517o4t38bewZ9862I7WigHGD5e6vsrG+wyXvDAzy3mmPAtbkD7Pwr9TtejxfQNC/9ZEVweZSXj
	MGJMpfxPZpXvgmDB+wnLOX1Omppjgx3rxCDekPFlTKc5GWYopQ4+hXrJb8IJUrJelJDC0WqIB+fRB
	6jW3ZjIXPwYwoHCmWrjzPOtBJ9+jqRNJH8C+143u1CDtuTjI1LIsHZwWpckFbVkUefNocMqlm82z1
	F2DIsMrYRDKA/QCcrKNaKTD/LR2uKyU38I1KuQg7CchG+puUgQ0ctvbi0gYbjcI8bQz199c9GjMUh
	FniJlA7iQiXBKC5uC/rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMnje-0000000AEfV-1iok;
	Thu, 27 Jun 2024 11:56:18 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMnj4-0000000AEVh-3xnc
	for linux-riscv@bombadil.infradead.org;
	Thu, 27 Jun 2024 11:55:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Vlzlm/49+m8i0infKudfAark56YywDXqG48rtyMxt7U=; b=Yje3zYRF4M3zNLfdid5LzTJlYZ
	qEL9ph2QYXjf5g1pZ0KTlXlL94q3NKIR/fakKPN6hjCD2rW8tX8kBZOXIQXqLZgNqSmxO/N8raZHv
	gv9ze+iHJZCJaK2OGx2+Y2I2ZFZrDCWEkWH8npHrEOJ5n00RXoQgENfYVDCnM0T1rIuBxLIMXGtzW
	LdSKlcKcrt/8Qyupc0FZGiiu1RT/qBSS84rEitTJZmBPIGQ7hMym1yGUWQYiJhsF+xPC6RwqMiHXN
	+0AMzTCmlp/SZN6qfXj+7udLrBZaEa+YgoHi/tQCa9c/N/iFP/vKiBEy+dpSfQp+KHbBX52b2Nh5w
	3eAiom0g==;
Received: from sakura.naobsd.org ([160.16.200.221] helo=mail.naobsd.org)
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMnj1-0000000DVB1-1SAD
	for linux-riscv@lists.infradead.org;
	Thu, 27 Jun 2024 11:55:41 +0000
Received: from secure.fukaumi.org ([10.0.0.2])
	by mail.naobsd.org (8.14.4/8.14.4/Debian-4.1ubuntu1.1) with ESMTP id 45RBr0ra021179;
	Thu, 27 Jun 2024 20:53:04 +0900
From: FUKAUMI Naoki <naoki@milkv.io>
To: kernel@esmil.dk
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
        FUKAUMI Naoki <naoki@milkv.io>
Subject: [PATCH v3 2/4] riscv: dts: starfive: enable heartbeat LED for Milk-V Mars
Date: Thu, 27 Jun 2024 20:52:34 +0900
Message-ID: <20240627115236.618-2-naoki@milkv.io>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240627115236.618-1-naoki@milkv.io>
References: <20240627115236.618-1-naoki@milkv.io>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_125539_842612_773A2304 
X-CRM114-Status: UNSURE (   7.64  )
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

Milk-V Mars has a green LED to show system load[1]. This patch enables
a green LED as a heartbeat LED.

Signed-off-by: FUKAUMI Naoki <naoki@milkv.io>

[1] https://github.com/milkv-mars/mars-buildroot-sdk/blob/dev/linux/arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dtsi#L79

Changes in v3:
- add default-state = "on" to turn LED on at U-Boot (not enabled yet)
Changes in v2:
- reorder properties in led-0
---
 arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts b/arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts
index 5cb9e99e1dac..5cae7a5d2f86 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts
+++ b/arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts
@@ -4,11 +4,25 @@
  */
 
 /dts-v1/;
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
 #include "jh7110-common.dtsi"
 
 / {
 	model = "Milk-V Mars";
 	compatible = "milkv,mars", "starfive,jh7110";
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-0 {
+			gpios = <&aongpio 3 GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "on";
+			function = LED_FUNCTION_HEARTBEAT;
+			linux,default-trigger = "heartbeat";
+		};
+	};
 };
 
 &gmac0 {
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
