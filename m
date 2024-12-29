Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CF51E7718F
	for <linux-riscv@archiver.kernel.org>; Sun, 29 Dec 2024 13:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ai9/XSyp/dPiWY1d8vc3Kj/bkZAjWx9H64mNrLB0Wco=; b=YFzPcZ/Rbxmlp1
	5xmOZcplpgghqWXbjmZrdBzgy8KT9BsVd2oyLro8hBD5lb1mooMOe61e54SNtaUbm0dBiZzoeXA0Z
	Rbeqt1/mJglg+SCklfIGzmm/qKGgiZg8M0n6MWt9dBiAZ62Sgdy00XT9XB8LCLAG4lyPUgCjTArhj
	WmDyVBU9uJzSC+dRBiOHo5B4oW5JxDLi/YGc8puOjM9yCBHjamJ3g6q3pB6ZJa8p+WFZ3oTwkiQVz
	jcczhoyneHlWEAjjU7+VDVKnVC4xJO413OqyGhLYzO5KccP/+jeZUr5LWpfvR++xnRl/ArM8YY/lO
	mt11+0BJJ1tncXY+KNIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRtFO-00000003QpW-1GTp;
	Sun, 29 Dec 2024 13:22:22 +0000
Received: from sender4-pp-o94.zoho.com ([136.143.188.94])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRtFL-00000003QnR-25re
	for linux-riscv@lists.infradead.org;
	Sun, 29 Dec 2024 13:22:20 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1735478523; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=URRcrEhbU952+043VBLmv/qWSHJ5/tigs27jYmMX91ucN+6DuKihTMhofLdIwhFVDVObVkyBn++3mspEgHbQU33tGgydvVdP4TlYJfWCe+QSvGxsUyiHOq5tqzrcp0w2X+KUJOwtyI3Z3R2aW11YA1GrrggfDZ1WI5elfhIjrQo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1735478523; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=9MOQQP/x77Ro5ASLfJZTxTTeYz6fqTSvvH80KDtJdi0=; 
	b=Pnu7FcXntZp0wsUsM3nFhbMYjxBGu3I3UxpfPmcRp3wj97EPGvoOa1DIc5DejkGG8g9Z0zSwPSAkvi9tUTQGjyaNIX+naNTiglrTdwvEgKN9kDPurhPZq0QahQiKaDyMxPohZytv6GnhM2KncrhEpXOTSVQB7RAHS2pr6wZGq9g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
	dmarc=pass header.from=<kingxukai@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1735478523;
	s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Feedback-ID:Reply-To;
	bh=9MOQQP/x77Ro5ASLfJZTxTTeYz6fqTSvvH80KDtJdi0=;
	b=cRZw/jOgRe0vO6s9R4BD+zo2RlgpGQnOBeZDN7KvUzCgqektJxD/VE+uX4B/9AGV
	3h7fin7eCgoWlh3jxSKHXgs8ImhXSpAUKY6uXYl5/KmApTYWSZ9Jzd2pV2YFxAaAs4B
	U1arPklCIC2nsClH9xVD2rZ5+Xktt/EeHbUCNF9Y=
Received: by mx.zohomail.com with SMTPS id 173547852017236.09863257523682;
	Sun, 29 Dec 2024 05:22:00 -0800 (PST)
From: Xukai Wang <kingxukai@zohomail.com>
Date: Sun, 29 Dec 2024 21:21:10 +0800
Subject: [PATCH 3/3] riscv: dts: canaan: Add clock initial support for K230
MIME-Version: 1.0
Message-Id: <20241229-b4-k230-clk-v1-3-221a917e80ed@zohomail.com>
References: <20241229-b4-k230-clk-v1-0-221a917e80ed@zohomail.com>
In-Reply-To: <20241229-b4-k230-clk-v1-0-221a917e80ed@zohomail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Troy Mitchell <TroyMitchell988@gmail.com>
X-Mailer: b4 0.14.2
Feedback-ID: rr0801122702ffcca89299b3078852e72a000005c72e0eace2615fcad8885e02fce6541bf0ba08c291f7dcf3:zu08011227d6d2d30888a3b43c703fd0c700003dbe33a86462bfcc434c9524a7bb3d4e7f14d2123ea28425d8:rf0801122d0c822b09e7e811d6dc6609fc00003dfde26ddcfc8442858b40cd9632b075de8e5875d239ee2e4004fca0c7646b:ZohoMail
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241229_052219_593449_1BA49045 
X-CRM114-Status: UNSURE (   9.63  )
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

This patch provides basic support for the K230 clock, which does not
cover all clocks.

The clock tree of the K230 SoC consists of OSC24M,
PLLs and sysclk.

Co-developed-by: Troy Mitchell <TroyMitchell988@gmail.com>
Signed-off-by: Troy Mitchell <TroyMitchell988@gmail.com>
Signed-off-by: Xukai Wang <kingxukai@zohomail.com>
---
 arch/riscv/boot/dts/canaan/k230.dtsi | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/riscv/boot/dts/canaan/k230.dtsi b/arch/riscv/boot/dts/canaan/k230.dtsi
index 95c1a3d8fb1192e30113d96d3e96329545bc6ae7..c407471af3daac154e0fbdd377d57ea3ff4698e1 100644
--- a/arch/riscv/boot/dts/canaan/k230.dtsi
+++ b/arch/riscv/boot/dts/canaan/k230.dtsi
@@ -3,6 +3,7 @@
  * Copyright (C) 2024 Yangyu Chen <cyy@cyyself.name>
  */
 
+#include <dt-bindings/clock/k230-clk.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 
 /dts-v1/;
@@ -65,6 +66,13 @@ apb_clk: apb-clk-clock {
 		#clock-cells = <0>;
 	};
 
+	osc24m: clock-24m {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+		clock-output-names = "osc24m";
+	};
+
 	soc {
 		compatible = "simple-bus";
 		interrupt-parent = <&plic>;
@@ -138,5 +146,24 @@ uart4: serial@91404000 {
 			reg-shift = <2>;
 			status = "disabled";
 		};
+
+		sysclk: clock-controller@91100000 {
+			compatible = "canaan,k230-clk";
+			reg = <0x0 0x91102000 0x0 0x1000>, <0x0 0x91100000 0x0 0x1000>;
+			clocks = <&osc24m>;
+			#clock-cells = <1>;
+			clock-output-names =
+			"CPU0_ACLK", "CPU0_PLIC", "CPU0_NOC_DDRCP4", "CPU0_PCLK",
+			"PMU_PCLK", "HS_HCLK_HIGN_SRC", "HS_HCLK_HIGN_GATE",
+			"HS_HCLK_SRC", "HS_SD0_HS_AHB_GAT", "HS_SD1_HS_AHB_GAT",
+			"HS_SSI1_HS_AHB_GA", "HS_SSI2_HS_AHB_GA", "HS_USB0_HS_AHB_GA",
+			"HS_USB1_HS_AHB_GA", "HS_SSI0_AXI", "HS_SSI1", "HS_SSI2",
+			"HS_QSPI_AXI_SRC", "HS_SSI1_ACLK_GATE", "HS_SSI2_ACLK_GATE",
+			"HS_SD_CARD_SRC", "HS_SD0_CARD_TX", "HS_SD1_CARD_TX",
+			"HS_SD_AXI_SRC", "HS_SD0_AXI_GATE", "HS_SD1_AXI_GATE",
+			"HS_SD0_BASE_GATE", "HS_SD1_BASE_GATE", "HS_OSPI_SRC",
+			"HS_USB_REF_51M", "HS_SD_TIMER_SRC", "HS_SD0_TIMER_GATE",
+			"HS_SD1_TIMER_GATE", "HS_USB0_REFERENCE", "HS_USB1_REFERENCE";
+		};
 	};
 };

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
