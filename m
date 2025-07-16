Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93A79C83F27
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jul 2025 04:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fxCtr3rKY2U46RF5i4sA4IHqRLAorpoQuWcZsPpyuzA=; b=d2AMmWQyP1iF79
	uLHokK8IqI8uiof896r7wPWCuyYOSUglwHQoHkZxUalgmyzQYWOoHLm0QlcS0/msDwQr6mzNMczJV
	gZ+/l5Gs+1VavipDhbY8R/2+7N+Q040RbsSyMjkE/PjCbSzl92hH7JBH7nYvkSKQHSPJlbEsLyadh
	T19x2lEwB3eEffF7bt14SS7i2tX4RtSLlcOXmdoXW9TkCI8ZLRlG06T7RNslvbG5bsLcRiARCUwpk
	UJmOOuxi4b16+7BxJp2YxJgwLMZ5CQbdVk+V3A7pKeB7q8v0C4qk2AZwqN0O0KuWm+UV4isaUz1HM
	LJhpRAgVpM8dfk6Ub3/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubtOt-00000006i5A-2Ezh;
	Wed, 16 Jul 2025 04:05:47 +0000
Received: from freeshell.de ([116.202.128.144])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubtOr-00000006i4q-0T47
	for linux-riscv@lists.infradead.org;
	Wed, 16 Jul 2025 04:05:46 +0000
Received: from hay.lan (unknown [IPv6:2605:59c0:2078:cf00:6ecf:39ff:fe00:8375])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 18151B4D173D;
	Wed, 16 Jul 2025 06:05:39 +0200 (CEST)
From: E Shattow <e@freeshell.de>
To: Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: E Shattow <e@freeshell.de>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: dts: starfive: jh7110-common: add status power led node
Date: Tue, 15 Jul 2025 21:04:54 -0700
Message-ID: <20250716040500.178287-1-e@freeshell.de>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_210545_291336_3C0D9A15 
X-CRM114-Status: UNSURE (   6.98  )
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

Add status power led node for StarFive VisionFive2 and variant boards.

Signed-off-by: E Shattow <e@freeshell.de>
---
 arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
index 4baeb981d4df..2eaf01775ef5 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
@@ -8,6 +8,7 @@
 #include "jh7110.dtsi"
 #include "jh7110-pinfunc.h"
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/starfive,jh7110-pinctrl.h>
 
 / {
@@ -38,6 +39,14 @@ gpio-restart {
 		priority = <224>;
 	};
 
+	leds {
+		compatible = "gpio-leds";
+
+		led_status_power: led-0 {
+			gpios = <&aongpio 3 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
 	pwmdac_codec: audio-codec {
 		compatible = "linux,spdif-dit";
 		#sound-dai-cells = <0>;

base-commit: 155a3c003e555a7300d156a5252c004c392ec6b0
-- 
2.50.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
