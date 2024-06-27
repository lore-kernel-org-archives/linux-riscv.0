Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0198CC2BD09
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jun 2024 11:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WaVcihS7CUSCmOY0R9Wnsr+WdknvPRbVEcFON49TJ1I=; b=gZjV1R3i18HN/k
	C1xl2KJPlhxWYtABA5nDmIYKoP8QJtakpTHiutuQfs+X1VVo9JZChVmsf5a3tn/S4hdrsXeb/W52d
	Omas6+ZawF69w9YlrrwmNYhzpa7YpQ2ESEqtBuNIvEObA0VJtaJ1UdW0Y7pNx0psFY3Wca1oH/Pcf
	edIPnYTGJzsCUWrW6JndfGWPTzQbOxr1ebuJCCsw5Y6zzyazCNi/j51kJlUGOn1EDeL+0xoBJ2DTi
	c+nk3LO4fSI2P1Ga9/xuT8/zB+sYLgyjGS533tnXu2ohvb22dc7cUEePlk0PM0W+OT1a67Rw7V+ws
	pLdSQKzYAHy63yQFiAlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMnjh-0000000AEiO-2yQ8;
	Thu, 27 Jun 2024 11:56:21 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMnj6-0000000AEVm-2xe0
	for linux-riscv@bombadil.infradead.org;
	Thu, 27 Jun 2024 11:55:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=689za1HeQTUTb6AcrNWYfyGCkT0JdxnkEgTMKfzXogE=; b=Q4m3XUDkQ5pIyvIe3iPtOl0mkQ
	xYMSQHJqRS53TMnxc1na745M2E1svxuSl7QmqAuIgp7p1a1HV/bQzYQZfSqmSj6d9bbMh0NTZ2e/y
	WhAkoBhjQPqrA9/Q5dk0t0LSRnBN7szNtOlMHOwshn9LmJWTJuk/OQ2D8GUUtzBlEPcC3rbjjqb22
	YSDYW0LM29pG4tkFquAWksJUe5MTK/I4rWm7XwGdDpQcnLeQspb4d6fDvWmInjOIPHV8li2ZVLfWK
	jRtM6yHb/mQwqqWSVmclSVH3TCo8BiAiL+A+0K62o8XXEkSgTCS0L5Sk9AOY2Hbp7OeTssBGWgm27
	whii81Og==;
Received: from sakura.naobsd.org ([160.16.200.221] helo=mail.naobsd.org)
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMnj1-0000000DVB2-1jaK
	for linux-riscv@lists.infradead.org;
	Thu, 27 Jun 2024 11:55:43 +0000
Received: from secure.fukaumi.org ([10.0.0.2])
	by mail.naobsd.org (8.14.4/8.14.4/Debian-4.1ubuntu1.1) with ESMTP id 45RBr0rc021179;
	Thu, 27 Jun 2024 20:53:04 +0900
From: FUKAUMI Naoki <naoki@milkv.io>
To: kernel@esmil.dk
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
        FUKAUMI Naoki <naoki@milkv.io>
Subject: [PATCH v3 4/4] riscv: dts: starfive: enable heartbeat LED for StarFive VisionFive 2
Date: Thu, 27 Jun 2024 20:52:36 +0900
Message-ID: <20240627115236.618-4-naoki@milkv.io>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240627115236.618-1-naoki@milkv.io>
References: <20240627115236.618-1-naoki@milkv.io>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_125539_923767_80C95402 
X-CRM114-Status: UNSURE (   7.54  )
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

StarFive VisionFive 2 has a green LED to show system load[1]. This
patch enables a green LED as a heartbeat LED.

Signed-off-by: FUKAUMI Naoki <naoki@milkv.io>

[1] https://github.com/starfive-tech/linux/blob/a61d1d826ca3060fd76ab31d37c691fc09b52fc0/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi#L79

Changes in v3:
- add default-state = "on" to turn LED on at U-Boot (not enabled yet)
Changes in v2:
- new
---
 .../dts/starfive/jh7110-starfive-visionfive-2.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
index 18f38fc790a4..06efbed53cc7 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
@@ -5,12 +5,26 @@
  */
 
 /dts-v1/;
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
 #include "jh7110-common.dtsi"
 
 / {
 	aliases {
 		ethernet1 = &gmac1;
 	};
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
 
 &gmac1 {
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
