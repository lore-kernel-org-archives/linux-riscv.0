Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15F93C2BD09
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jun 2024 10:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GlzrbSE/4Q8mUTJOw6vS0FNfClwZ6/8oqclZjBVN+Cg=; b=FG5G0Ka8LHoKsr
	fgX5udo0CkNYl3X6pqaTpNz842iiFSsMxRK7wjSL9F3lasauabfUV9TJNrx+bpmzRN8/EX+gy9fUI
	JOVLdVTBlEoLX4KyiK5Falxorq5NJMS3FpWCNtsYtfx8dI82cDIzPuoCYZX1fdzMJNYLumNZOQZfz
	yvtjDHhS1BTm1ev3lK84VJuW5Sqfdy5j9Yz6GOHctIkZcDcex1IOxlXx8j2dpeBka6fNvRbwY/t/V
	F8DXS6/X4fLQzjjue5oCKvXKzP0mQ45oJjc+1avgvmYPmcWGENCJrUb91FQ05c2tVzfiLm5QktJbf
	ny48pKo6DG31VWNS0BpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLh9I-0000000GSkW-3EXm;
	Mon, 24 Jun 2024 10:42:12 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLh9C-0000000GSfl-49PQ
	for linux-riscv@bombadil.infradead.org;
	Mon, 24 Jun 2024 10:42:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=m7lJPoUac29okIOedhA9lOgMfp8VIgIaDtoGCR7cuxU=; b=sOTlmQ561y8j1MZ3dAxoin1YXq
	rP6KCNP9jU5gmw0MPD6LLEKgb72EIm3VQ/008vmPxry4cugG2IKw/UW5Kdjb3z4d5O6tZed3kyyh4
	DV5cAuGT3CbbzotGgnuX7pai5QimR6wvcUYPHjoCvVhkcRKcncocCe6lOXWuSJgrnlm6Z6WYYSONE
	TLLvMQrd1rclRT1prC78y3PdqkuPUPoPSGy4zw4nFSPIsvv39BM63XpgqXwu+lmaUZLQ7rT6oGF9Y
	bPUTi7NQM8geGceQ4dk1JYYxe2Lrf0PZCndEW5yBJ3GPcQzbLs5yjCm7R8CTRB45gFzHbzYVKpEoC
	zb/xM7DA==;
Received: from sakura.naobsd.org ([160.16.200.221] helo=mail.naobsd.org)
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLh98-00000009xAL-42AS
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jun 2024 10:42:05 +0000
Received: from secure.fukaumi.org ([10.0.0.2])
	by mail.naobsd.org (8.14.4/8.14.4/Debian-4.1ubuntu1.1) with ESMTP id 45OAdw5Z009984;
	Mon, 24 Jun 2024 19:40:01 +0900
From: FUKAUMI Naoki <naoki@milkv.io>
To: kernel@esmil.dk
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
        FUKAUMI Naoki <naoki@milkv.io>
Subject: [PATCH v2 3/4] riscv: dts: starfive: enable heartbeat LED for Pine64 Star64
Date: Mon, 24 Jun 2024 19:39:24 +0900
Message-ID: <20240624103925.946-3-naoki@milkv.io>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240624103925.946-1-naoki@milkv.io>
References: <20240624103925.946-1-naoki@milkv.io>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_114203_697859_D4A0123C 
X-CRM114-Status: UNSURE (   6.77  )
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

Changes in v2:
- new
---
 .../boot/dts/starfive/jh7110-pine64-star64.dts      | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts b/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts
index 2d41f18e0359..6749e9b51593 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts
+++ b/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts
@@ -4,6 +4,8 @@
  */
 
 /dts-v1/;
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
 #include "jh7110-common.dtsi"
 
 / {
@@ -12,6 +14,17 @@ / {
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
