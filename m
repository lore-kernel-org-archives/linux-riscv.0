Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDD40C2BD05
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jun 2024 10:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W9is5wrvlv8i8fgL+zPT7WJp6pFrtfnBT+kmlBsQk58=; b=JL5AxPNVys1Bk6
	f1mNZF0Qw8AF71U95TxPvL+jdRPHL9nc35c0vVNV5PhTYee+QLHneCxN7th0cyDhQ2CETPFPf9eSt
	BJIaR5l4i861VivKFyWruyQ0uX1yHNLbItKQHFIA6iBEtXX4QS/LFmUTVjGRHXmbqAOlYrKNdiDZj
	XYP79xoR+dxissY4NU60/fBCwvgsJ/Jivny2o5JBKiU/AKZzbI+0pMNMbKm8w4W+ip5c/eXu82miE
	en6ee8132eRZ9acJMILHaBhqojmeeWy9zAKJ3yoVLUW7BufVjpdgJ7+Ge1HxfQCeIYCg1Br0X6CGa
	aCbYSCxUeOzr+9AIt34g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLh99-0000000GSdd-15Cz;
	Mon, 24 Jun 2024 10:42:03 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLh97-0000000GScF-18RW
	for linux-riscv@bombadil.infradead.org;
	Mon, 24 Jun 2024 10:42:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=b+bK2NFdsxB8JW2o/IJ9+rmn7pTq9xczB0p3+tluRCw=; b=gdAtvqNzw+1tExGMAUP0hQtVG+
	M1b0lHU63Lc31v6WNVz0NwF0+gJYQEymBeGS0asKstQo/DV9sWaidjlmBCQV1YcOAmxsaP7C/2K2r
	S/JEvHTEhgVEjoh1zrwT6/BDobiaWQErM7OiGfHcAsRJc1B7q7+QSP6o4V+ZxkNW4byCHG149N2Oh
	lWbUwbL/1aaiic20sfQs8qV6k0s6SecSPUfTcf3nK/hnEfqr+qhihIoywHwYlUPuaCLfMvzdfklCC
	wqseOCGrMqRNxBrO+48nousIlFiqHHEKfYTLz2/8GEVttFpHChSMyh//Sl54nd8mOfIRakAAhtbZ3
	Khy2p67Q==;
Received: from sakura.naobsd.org ([160.16.200.221] helo=mail.naobsd.org)
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLh93-00000009x9d-1iEE
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jun 2024 10:41:59 +0000
Received: from secure.fukaumi.org ([10.0.0.2])
	by mail.naobsd.org (8.14.4/8.14.4/Debian-4.1ubuntu1.1) with ESMTP id 45OAdw5Y009984;
	Mon, 24 Jun 2024 19:40:01 +0900
From: FUKAUMI Naoki <naoki@milkv.io>
To: kernel@esmil.dk
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
        FUKAUMI Naoki <naoki@milkv.io>
Subject: [PATCH v2 2/4] riscv: dts: starfive: enable heartbeat LED for Milk-V Mars
Date: Mon, 24 Jun 2024 19:39:23 +0900
Message-ID: <20240624103925.946-2-naoki@milkv.io>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240624103925.946-1-naoki@milkv.io>
References: <20240624103925.946-1-naoki@milkv.io>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_114158_111684_CE9CD54B 
X-CRM114-Status: UNSURE (   6.61  )
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

Changes in v2:
- reorder properties in led-0
---
 arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts b/arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts
index fa0eac78e0ba..1ca9657fef0e 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts
+++ b/arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts
@@ -4,11 +4,24 @@
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
