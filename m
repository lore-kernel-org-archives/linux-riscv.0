Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46C07C27C53
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jun 2024 02:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BhgjfONpX8vCzRLodqFJ5pF6aYYo7/JrvcXPWr+h/cc=; b=GlYHknM6g1JEt2
	V4YDrTXdjBwubjL6jaDjSRKOdNOCo888MzzWUpSJOqF1qy9/9hIDHkL7l3V0hB41B+1P9XICC3yxQ
	SW2x1GGlH6GLZJKAKzCOMLkoBqzGXlBZ7dh4FrpKe3EM6WCL/oC62Pgf+cy5ZXVLnhAuZgJB2iMnJ
	wndCjasOxdT9Kqvs32chXkh3aVpRd+Yr3QJ0YW5OdN5tebUzK+GDlkCPc3HyOEwVejw8lgzBzEvM9
	p3ucczxeTv8azxxZcsVRI9dp08esKmZ1X7YGXikG73hHj1TDXdQUgJMW/pRhYKhf+5aUcca+7rYbA
	eaFUAp0/ltWitXzwyA+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHaX3-0000000EtqK-2HtB;
	Thu, 13 Jun 2024 02:49:45 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHaX0-0000000Etpj-2Arp
	for linux-riscv@bombadil.infradead.org;
	Thu, 13 Jun 2024 02:49:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ec8ArdH4kLt0BgRgX/XL8i8AF+VsYIAp41lvRk/ycTk=; b=WGmhH/GFMlXlZWY2hCdekYVZOU
	O8wT5QMBj73TKLkoVvU2PcHhL4UHVACs2P0/pqFOLLj8aRfGcA/lxRI/Lk76XxD0CwTuCrae70dLS
	B47Ib10SOxkjzhzRnq6++SwfifNKv8wjlEg4NQ3loZlgU92MYHSjox7Tdd+j/+z+dqVOHYA/aLHi0
	W6k70g07cfLgrVRd3ePifnsaZNdQH/6hcpwwh+Z0MCtN9X+1Yj8I7nfkzx8DRMExlsjkG/5rgI6gl
	jzF0YFmJVHNlkwxn6VLqjX8hhXN3PmiK8YeMKuuT6cav4Wd6TDEJ57daSM0mgXvIxJF8Rzi+DfY7l
	IOcdx42w==;
Received: from sakura.naobsd.org ([160.16.200.221] helo=mail.naobsd.org)
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHaWw-0000000FJsC-3COV
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jun 2024 02:49:41 +0000
Received: from secure.fukaumi.org ([10.0.0.2])
	by mail.naobsd.org (8.14.4/8.14.4/Debian-4.1ubuntu1.1) with ESMTP id 45D2n0mp000957;
	Thu, 13 Jun 2024 11:49:01 +0900
From: FUKAUMI Naoki <naoki@milkv.io>
To: kernel@esmil.dk
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
        FUKAUMI Naoki <naoki@milkv.io>
Subject: [PATCH 2/2] riscv: dts: starfive: enable heartbeat LED for Milk-V Mars
Date: Thu, 13 Jun 2024 11:48:26 +0900
Message-ID: <20240613024827.36512-2-naoki@milkv.io>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240613024827.36512-1-naoki@milkv.io>
References: <20240613024827.36512-1-naoki@milkv.io>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_034939_382017_98F90C20 
X-CRM114-Status: UNSURE (   6.56  )
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

Milk-V Mars has a green LED to show system load. This patch enables
a green LED as a heartbeat LED.

Signed-off-by: FUKAUMI Naoki <naoki@milkv.io>
---
 arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts b/arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts
index fa0eac78e0ba..4f4bbf64dbe4 100644
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
+			linux,default-trigger = "heartbeat";
+			function = LED_FUNCTION_HEARTBEAT;
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
