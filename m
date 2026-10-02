Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD0A8CA5FC4
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Oct 2026 06:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kjez9diFgBYNPY2kCWgQaKxAg/Wjt+gGw2izr0aslp0=; b=EEk39LTWgjFGhY
	xqtlApxLmcIhq3NpLDj9AA/lu+rF9oLzhQ7us3WvYsCoIfiaZJeA4mLsIlf43AqEEt3VLZ/JdrY18
	GYKm44uNsPSW5M8z0y4DdZvyoFbMIGRvZRNCYQITm/WiAE15qSEmeEK2V2lZmu6Qiez+2HmjP6Pjk
	cxPO06bPCGNfRsIaxQvoyqZRqOmKQPxb5A0QvuR3PuzVzhMcXutKJjqEWLshFweb1qeiZS5NwNQcQ
	c0oDwz8/p6nJ1KwOaXbOmJptNMlzmg6x2B9TVpZpveIclKo2ZptPjloUZTn9ygqdavyFhVVY7m8gy
	g38lFyG1SP7FZOZhGdYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCWS9-0000000AgWv-0fxL;
	Fri, 02 Oct 2026 06:09:05 +0000
Received: from sender5-op-o15.zoho.com ([165.173.182.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCWS6-0000000AgWF-1uja
	for linux-riscv@lists.infradead.org;
	Fri, 02 Oct 2026 06:09:03 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1790921334; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=SXYZ3HI/NROTzUqqGYNaTqL2AgRydBHxGHYt3BiER8YYL5eA6OS26qw9giFkfyW22RYyPw1gO3GIFZ7GiLV5yDlH60ZYmHrKyflxl/fDoN6HYUorf5ZzPNDjiFf19qVvRGcTS1epvCy9ErmGvijBhJ2eduGFDQonlsMWskVc5ks=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790921334; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=JKeVGPFgfQ5lweEBhVgIYAh6odqbkZlVxrmazE1hKcY=; 
	b=QEv/B+jHqi/GC36sNSUGHXNnb3M0aEYEInU0SZaJfRg4PHPgAsNtb5cw7PnzPXoDpSYwG/JW+Fgx6isb8aSw44tKi/WffIl6LSzBNwc+p+8aDddCdRDQMEkqZ4x6Y8/zFXqKJ1GUAGZNrr2s6N7+/vg3Zylsx169iDgoWNCSQa4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790921334;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=JKeVGPFgfQ5lweEBhVgIYAh6odqbkZlVxrmazE1hKcY=;
	b=gdUeOkGXwnJnAb2pbi7Q5Z06cbfsYRRywlhmFa1h85O2Yy2MWOaeuO89PBVGRzHx
	OY5M4saUP3w2DqttGL21T26onXI5EUGphAXfCumRHuSfzq9LOJRCfy/jRRm9BUFRp8k
	SFrvXTVuLSr9n7jb96EAZhTpsD8rC+ABqoajkY30=
Received: by smtp.zohomail.com with SMTPS id 1790921334397660.4618848222665;
	Thu, 1 Oct 2026 23:08:54 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Fri, 02 Oct 2026 14:07:01 +0800
Subject: [PATCH 2/2] riscv: dts: anlogic: drop unused DR1V90 external
 clocks
MIME-Version: 1.0
Message-Id: <20261002-dr1v90-cru-dt-fix-v1-2-c3e0b5d4c30d@pigmoral.tech>
References: <20261002-dr1v90-cru-dt-fix-v1-0-c3e0b5d4c30d@pigmoral.tech>
In-Reply-To: <20261002-dr1v90-cru-dt-fix-v1-0-c3e0b5d4c30d@pigmoral.tech>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: Brian Masney <bmasney@redhat.com>, 
 Conor Dooley <conor.dooley@microchip.com>, Yixun Lan <dlan@kernel.org>, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Junhui Liu <junhui.liu@pigmoral.tech>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1955;
 i=junhui.liu@pigmoral.tech; h=from:subject:message-id;
 bh=dkjrKeFFo83NCP/okhbIBBG6/Y0iD/qUm4cUUFujpdg=;
 b=owGbwMvMwCWWvDb1VEXc8j+Mp9WSGLL2e8VOX5y9PpjHVvLJh96ptRKr1hlPFn3lOVXl+jY+9
 TChrL6zHaUsDGJcDLJiiixc/uL/rHV4vh0RaL0PM4eVCWQIAxenAEzE4RzDfw/b1Z7La+fMK2jN
 XBX+2t++5+cX3ic7eo//ultrtmj762KG/wUK4evMd/7unvss8cT0kAdxD2cVrLv917Hna/Fxz4v
 r7TgB
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=openpgp;
 fpr=15B30CC69C4BF0CC3C08F85A2A90CDC122DF37BF
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_230902_556190_72C36292 
X-CRM114-Status: UNSURE (   9.96  )
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

The external CAN and watchdog clock inputs are not routed on the MLKPAI
FS01, the only board currently supported. Drop the two fixed-clock
placeholders from the common dtsi, as fixed clocks require a valid
clock-frequency property.

Both clock muxes select their internal parent clocks after reset, so
the CRU operates correctly without the external inputs. Keep only the
required oscillator input to the CRU.

A board using these external clocks should define them in its own
board-level dts and override the clocks and clock-names properties of
the CRU node.

Reported-by: Yixun Lan <dlan@kernel.org>
Fixes: 7849521aaac2 ("riscv: dts: anlogic: add clocks and CRU for DR1V90")
Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 arch/riscv/boot/dts/anlogic/dr1v90.dtsi | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/arch/riscv/boot/dts/anlogic/dr1v90.dtsi b/arch/riscv/boot/dts/anlogic/dr1v90.dtsi
index 574c6608aef0..fe85d01563ad 100644
--- a/arch/riscv/boot/dts/anlogic/dr1v90.dtsi
+++ b/arch/riscv/boot/dts/anlogic/dr1v90.dtsi
@@ -44,23 +44,11 @@ cpu0_intc: interrupt-controller {
 	};
 
 	clocks {
-		can_ext: clock-ext-can {
-			compatible = "fixed-clock";
-			clock-output-names = "can_ext";
-			#clock-cells = <0>;
-		};
-
 		osc: clock-osc {
 			compatible = "fixed-clock";
 			clock-output-names = "osc";
 			#clock-cells = <0>;
 		};
-
-		wdt_ext: clock-ext-wdt {
-			compatible = "fixed-clock";
-			clock-output-names = "wdt_ext";
-			#clock-cells = <0>;
-		};
 	};
 
 	soc {
@@ -128,8 +116,8 @@ uart1: serial@f8401000 {
 		cru: clock-controller@f8801000 {
 			compatible = "anlogic,dr1v90-cru";
 			reg = <0x0 0xf8801000 0 0x400>;
-			clocks = <&osc>, <&can_ext>, <&wdt_ext>;
-			clock-names = "osc", "can_ext", "wdt_ext";
+			clocks = <&osc>;
+			clock-names = "osc";
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 		};

-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
