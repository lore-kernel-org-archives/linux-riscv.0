Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80056C3064D
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jun 2024 11:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lz1yM46ZrTr+T8nPfijCi3qpo7x9JFZszlNYWKL+F9w=; b=jeuWN0Of3eH12y
	kKu/7sGyB3bOmxybgnWLxANyH4zboPo/4cBTAqINuuE9Yof3HYk17SOtfePvzxGh/xJh3kzV0MAHx
	YARh63O/eqYfOlxIFFLSTCJTgEy4ZFjzergCr/ZokFT/AWeUBvBwvJWyVTchbMJB4LmYEAIoospS2
	Et+lVU5TDm6PczhNcx51LJ0COk4JnZZcAkHA5F5KlcFIdCsSaz6homzd8TB9XWto/Bp6Oag1SdLCP
	rTIXUVBK+oS4cNCIfqgvCHAkXmCbVc9KqauH/AZwsJl45pu+CGV6hLa1F7Wn0S8gjonig2DIn2l2U
	hua1uhAgOTzZ/QrXEanA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMnjb-0000000AEdS-1II9;
	Thu, 27 Jun 2024 11:56:16 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMnj6-0000000AEVn-2xFD
	for linux-riscv@bombadil.infradead.org;
	Thu, 27 Jun 2024 11:55:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=HOHblRxpjrDXEv5rzYrr1RteTC8ZRzUEqbbqHkvHtYw=; b=Am+/verdnAldzZEolwaOY3+6/n
	bgmoJQfbA8MZwx/iGSziPHtGSrVrLLWkiMJxxyhszeCGaenKPaYWio7TxLRmboR1GrRqhiEOUUmq8
	gikKinbGDAnw4qdqbHGV8juADekZciLGTj4Z9b2YRVl8Rpwc5f8daF1VKt/kT0/w55fkWP9n2hz2Z
	KbTm7obHRNJ0JJnowmzUA4U+pgXslWKIjdwgMB2xfopwNtH71OplIY3LjyzRRPA+a/xG4eZB1CLDW
	2Qphwd2WeWCSUwc8Y9Xl7qBBdbAvyO7VYvanbKKy/mmns8o1cntLiXPrzq+3yMAJrZOic2vWZs3dd
	JXbv+cgw==;
Received: from sakura.naobsd.org ([160.16.200.221] helo=mail.naobsd.org)
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMnj2-0000000DVB4-0yEu
	for linux-riscv@lists.infradead.org;
	Thu, 27 Jun 2024 11:55:43 +0000
Received: from secure.fukaumi.org ([10.0.0.2])
	by mail.naobsd.org (8.14.4/8.14.4/Debian-4.1ubuntu1.1) with ESMTP id 45RBr0rb021179;
	Thu, 27 Jun 2024 20:53:04 +0900
From: FUKAUMI Naoki <naoki@milkv.io>
To: kernel@esmil.dk
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
        FUKAUMI Naoki <naoki@milkv.io>
Subject: [PATCH v3 3/4] riscv: dts: starfive: enable heartbeat LED for Pine64 Star64
Date: Thu, 27 Jun 2024 20:52:35 +0900
Message-ID: <20240627115236.618-3-naoki@milkv.io>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240627115236.618-1-naoki@milkv.io>
References: <20240627115236.618-1-naoki@milkv.io>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_125540_773814_E087E321 
X-CRM114-Status: UNSURE (   7.80  )
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

Pine64 Star64 has a blue LED to show system load[1]. This patch
enables a blue LED as a heartbeat LED.

Signed-off-by: FUKAUMI Naoki <naoki@milkv.io>

[1] https://github.com/Fishwaldo/Star64_linux/blob/Star64_devel/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dtsi#L79

Changes in v3:
- add default-state = "on" to turn LED on at U-Boot (not enabled yet)
Changes in v2:
- new
---
 .../boot/dts/starfive/jh7110-pine64-star64.dts     | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts b/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts
index 2d41f18e0359..b9962b4e8eca 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts
+++ b/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts
@@ -4,6 +4,8 @@
  */
 
 /dts-v1/;
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
 #include "jh7110-common.dtsi"
 
 / {
@@ -12,6 +14,18 @@ / {
 	aliases {
 		ethernet1 = &gmac1;
 	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-0 {
+			gpios = <&aongpio 3 GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_BLUE>;
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
