Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5AD4CA5FDD
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Oct 2026 16:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xAP6nO4+457mErcMkDaGo9LjgpMO5z+0ISY6PIN55qo=; b=ioOBczxKbr4b8i
	6t55h7NCxy370W81h7zOA+e34tK4adgy/1yPCy+meYYFYX68cF6iSjOY36NRZiqTU9+lZNRtuRWCz
	TsPTEr3qkzXCK9kIwYRRX4yRskKe+TrBP0rcch+iS6RCC/Z9A72qrA2ACl+6xGtpZSMFz2/lfaMPp
	nhAwTGgzu/Lka0ZTRDnUa61G1Xo3d05Yz+E8lGktecY2EnddOWY1c9xmNckFxLOrwx172QPJ3eTi8
	mth6csJO1kLMqi5ron5/fndiHWrXtzFz1bPeDZJjhKCAjmafrXvTGPP4tAxF8c4h4c99MxzrKa0lZ
	xYBR28FFpTn9xke4lpPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCg8Y-0000000C1yz-20ny;
	Fri, 02 Oct 2026 16:29:30 +0000
Received: from sender5-op-o15.zoho.com ([165.173.182.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCg8V-0000000C1y2-2zn2
	for linux-riscv@lists.infradead.org;
	Fri, 02 Oct 2026 16:29:29 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1790958561; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YSAiN8oZJ03FXKrv8bJpP1GQmQHQy1Rtsa+kompP/6KbvCdxmJ0VWf8lx1eVCytdPzn7WWnF9USl0UErS0nxVXvu4MrMbFgXDqtm9nggUNIrF+bUGyAj7pB4DmMU2EqY8c0jPzvz9xQPDwl+rMhQdOwZy16T8OlDVc/OXtUi7WA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790958561; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=UvmIj1JJZ9BdEqm2dPeUXYXk/sWwp25/bJEGMfAEkF8=; 
	b=e05MiFOPdpVhRMZBdrZgdLrc+D5k5xqA+LVhtpPeZiE0l7LL/IRoVnyS2wZOMy3dzYGjmlBtQEwEmyxCGjo2zb5Ew4iRLzaeNDlp4BJK2R58OVbxYHZvohshVbZrZS91kGZFfTiFsIL8gfB9FbFsYfMV0GUwq/OOUY/BizrrYBg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790958561;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=UvmIj1JJZ9BdEqm2dPeUXYXk/sWwp25/bJEGMfAEkF8=;
	b=A+4b+wI/U0tT7CaNKCTRko9YViK6RSbWawDRA0oSKFddpwzpPs4Ab/f1VD8DjiyS
	0qeVxmQADQuBbndrg37QLEXiNoobmWMf6lWGQs9AeGNYumSOs0u4IRTYT4pyzp6N8Vw
	qLA8x9yjbxGWHMf2rLjMhrdZ+DDog7eS0DnVIzCc=
Received: by smtp.zohomail.com with SMTPS id 1790958559695614.4589575589154;
	Fri, 2 Oct 2026 09:29:19 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Sat, 03 Oct 2026 00:28:40 +0800
Subject: [PATCH v2 2/2] riscv: dts: anlogic: drop unused DR1V90 external
 clocks
MIME-Version: 1.0
Message-Id: <20261003-dr1v90-cru-dt-fix-v2-2-6e7d96612ac0@pigmoral.tech>
References: <20261003-dr1v90-cru-dt-fix-v2-0-6e7d96612ac0@pigmoral.tech>
In-Reply-To: <20261003-dr1v90-cru-dt-fix-v2-0-6e7d96612ac0@pigmoral.tech>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2064;
 i=junhui.liu@pigmoral.tech; h=from:subject:message-id;
 bh=vak7rymGzJwopaet2ROwEI9RUjVD+UnzLMycs5d+uEc=;
 b=owGbwMvMwCWWvDb1VEXc8j+Mp9WSGLL23z5SFSIld2rFtnvlU5Kzd+2cLXlVvl/AiGnmT0XGG
 ZMi6uUYO0pZGMS4GGTFFFm4/MX/WevwfDsi0HofZg4rE8gQBi5OAZjIxHWMDK9ueuv2rD1o1LH6
 W68q07/zKR1+0rbnlYwKLvK6MPX/CmNkeNHm/N3covTOjbt3d9zZPeV9w7MFNa5HmuQdn7ld1NO
 4wQ8A
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=openpgp;
 fpr=15B30CC69C4BF0CC3C08F85A2A90CDC122DF37BF
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_092927_814879_DE9E15EE 
X-CRM114-Status: UNSURE (   9.83  )
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
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
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
