Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E823C83F27
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jul 2025 06:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JHtIy59I7okFmy2voNSaWSdiGgPAYl9Fog6XZrINiMQ=; b=OxngpQolVPl/+Z
	tQxEu2PHcSgLPXoYHBVhDbn2M7TOh3mjMJx0rkIu9swCbyr37OZpkzuISurbtx3fC47Hutvxw/vf+
	vaWy5Mr/F9H/1UgjFJCdKZXjIfq9sDXMu7Kt3Iz5mZNu4uwbAA/CgfOrYcNUVxCsy8PMItY0DTSUn
	nHI/IvyIL4LHYOprdxM56bqaMlk0a58KRYLCH4U9PHatDeUcOULjqanPk1Y+TUoWGYHNboclfRau5
	ovth6WgRaZNmOvdU//YGR5LKQWgjpVISuwW3ZW54t++qLOAZfWgH8LBPVVFDIGAgliCFfOYdGRBGb
	y5iQ//XHCZUdW5smvuHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubvlz-00000006uGo-0joJ;
	Wed, 16 Jul 2025 06:37:47 +0000
Received: from freeshell.de ([116.202.128.144])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubvVC-00000006s1T-1OVN
	for linux-riscv@lists.infradead.org;
	Wed, 16 Jul 2025 06:20:27 +0000
Received: from hay.lan (unknown [IPv6:2605:59c0:2078:cf00:6ecf:39ff:fe00:8375])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 150B5B4D0E8F;
	Wed, 16 Jul 2025 08:20:20 +0200 (CEST)
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
Subject: [PATCH] riscv: dts: starfive: jh7110-milkv-mars sort properties
Date: Tue, 15 Jul 2025 23:19:33 -0700
Message-ID: <20250716061940.180231-1-e@freeshell.de>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_232026_520476_D2FDEB58 
X-CRM114-Status: UNSURE (   7.22  )
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

Improve style with node property order sort of common properties before
vendor prefixes

Signed-off-by: E Shattow <e@freeshell.de>
---
 arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts b/arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts
index 3bd62ab78523..fdaf6b4557da 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts
+++ b/arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts
@@ -12,9 +12,9 @@ / {
 };
 
 &gmac0 {
-	starfive,tx-use-rgmii-clk;
 	assigned-clocks = <&aoncrg JH7110_AONCLK_GMAC0_TX>;
 	assigned-clock-parents = <&aoncrg JH7110_AONCLK_GMAC0_RMII_RTX>;
+	starfive,tx-use-rgmii-clk;
 	status = "okay";
 };
 
@@ -31,14 +31,14 @@ &pcie1 {
 };
 
 &phy0 {
-	motorcomm,tx-clk-adj-enabled;
+	rx-internal-delay-ps = <1500>;
+	tx-internal-delay-ps = <1500>;
+	motorcomm,rx-clk-drv-microamp = <3970>;
+	motorcomm,rx-data-drv-microamp = <2910>;
 	motorcomm,tx-clk-10-inverted;
 	motorcomm,tx-clk-100-inverted;
 	motorcomm,tx-clk-1000-inverted;
-	motorcomm,rx-clk-drv-microamp = <3970>;
-	motorcomm,rx-data-drv-microamp = <2910>;
-	rx-internal-delay-ps = <1500>;
-	tx-internal-delay-ps = <1500>;
+	motorcomm,tx-clk-adj-enabled;
 };
 
 &pwm {

base-commit: 155a3c003e555a7300d156a5252c004c392ec6b0
-- 
2.50.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
