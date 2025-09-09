Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE2ABCA0FED
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Sep 2025 19:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Z4++WQCMas9omg9b88aiBhTccNHWe3UAG906YdXawEs=; b=Ysn989DJHQbZsO
	2quwZXCfqNLXAcIGsa+vLFv7l2BuXcNJ/GpLAP1hlFt4Y6Gc5o0wZwn7krjZ9Z4jfIj1IpcJykhiK
	zpjM+njLQoQOMROjvgtANmRDN2OrIlMj0pTghfZiVo5IvMYZsDfwelLpW+7Q1iKF5QbMht1xuEXAe
	gyDKmyz495Dz0dPDqsbq73Ocpg3NM3+UP6dLrWsy5kSDxFpuK506WZBBDbMa02/G0G38jG79R+zBs
	+8EFbR6lQN9hIngFjIAYBFZ37RCyXF1/smAf+0zD7ItBBpAlx3TvsvnaOH9qfx/Z96jGCVMOUJgg5
	asxOGj6zPDYX2onalnUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw4U0-00000009qB0-3S99;
	Tue, 09 Sep 2025 19:58:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw4Ty-00000009q8y-2LwF;
	Tue, 09 Sep 2025 19:58:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AB31D601F0;
	Tue,  9 Sep 2025 19:58:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5D6AC4CEF4;
	Tue,  9 Sep 2025 19:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757447905;
	bh=coVjTOw4sLHDfBakjSlveG2TDtwJq/PpPGElv5zd+KY=;
	h=From:To:Cc:Subject:Date:From;
	b=OEpAQBFaCqld1Z/XsKuXeu0kO0sa+Eh9Qoysb/M5+3/BBWMKwbB6dN/6XEyN+Tc7V
	 mCcOr4FjmzLrd5hbcMs8JkBlA0S6hO+cHQ2Q3XHJ2HT4G//LKnXw4gL7gmOT2o5Dpg
	 XIchr89SnWuwewzlGUMjNqsARy7RBFlt4pcD+MDFDX5QkpHXpEtsJhlTBLUswGF9lU
	 DPtgAkIx6bexUGwQtxEucONXZLmk+I/WAn75kVbdnTEl/wol/mn1U6lp/FRYp/mM+G
	 BhAhJkEBkhJasqwGrkLMl5embSN6vDd/s6+27NPTpwiZljwxnHtDlc0EMgmtCw7feV
	 zU0K+hiOdaTwg==
From: Conor Dooley <conor@kernel.org>
To: linux-sunxi@lists.linux.dev
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] riscv: dts: allwinner: rename devterm i2c-gpio node to comply with binding
Date: Tue,  9 Sep 2025 20:58:17 +0100
Message-ID: <20250909-frown-wrinkle-f16df243a970@spud>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1568; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=5nDAh3oXDhRSMzBY7Xh2+riGNHudXRKLDRxiREafnqA=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDBkH2m4UsH88fsjnefHviMCq9wUFX3/bNdvdm5BXeKxyw 5I75Yn3OkpZGMS4GGTFFFkSb/e1SK3/47LDuectzBxWJpAhDFycAjCR1uuMDEe5C7KOJ+xJ4XiU vXnG7Ddz7p/8zshouSTBp3D1VZuEZZEM/9OONv9zyDQr5W6R0cwXudnEXRMhUfl5mors35MzD27 azgAA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
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

From: Conor Dooley <conor.dooley@microchip.com>

The i2c controller binding does not permit permit the node name to
contain "gpio", resulting in two warnings:

i2c-gpio-0 (i2c-gpio): $nodename:0: 'i2c-gpio-0' does not match '^i2c(@.+|-[a-z0-9]+)?$'
i2c-gpio-0 (i2c-gpio): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'adc@54' were unexpected)

Drop it to satisfy dtbs_check.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Chen-Yu Tsai <wens@csie.org>
CC: Jernej Skrabec <jernej.skrabec@gmail.com>
CC: Samuel Holland <samuel@sholland.org>
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-sunxi@lists.linux.dev
CC: linux-riscv@lists.infradead.org
CC: linux-kernel@vger.kernel.org
---
 arch/riscv/boot/dts/allwinner/sun20i-d1-devterm-v3.14.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1-devterm-v3.14.dts b/arch/riscv/boot/dts/allwinner/sun20i-d1-devterm-v3.14.dts
index bc5c84f227622..5f2e5cc3e3d55 100644
--- a/arch/riscv/boot/dts/allwinner/sun20i-d1-devterm-v3.14.dts
+++ b/arch/riscv/boot/dts/allwinner/sun20i-d1-devterm-v3.14.dts
@@ -17,7 +17,7 @@ fan {
 		#cooling-cells = <2>;
 	};
 
-	i2c-gpio-0 {
+	i2c-0 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&pio 3 14 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>; /* PD14/GPIO44 */
 		scl-gpios = <&pio 3 15 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>; /* PD15/GPIO45 */
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
