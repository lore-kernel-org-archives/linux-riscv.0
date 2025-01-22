Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4ECCC0218C
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jan 2025 10:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B9JR7M3XtCiZFdgxPhFSLhO0jvhI9jEEY7a816IFX8Y=; b=BFI5WKtoPFhutu
	hLHOqe4GiaoRdVcDthi+ZmdnTUByu2PutBGiJLo+tQPIP4tShY2ofLJj8qTHC7alR200zRqRVWi3k
	wy/LpuYB28s5HtvtD8D8LPKIL3qG797BqlejuYTC+dwDnZMYChF2lHsT0sxK1VH53CEri7ek5X5je
	3/plhvKiVESxzaBHz/UXkqi4kRqbMYKZVzqiq23UFO6qj6pzDGkqoeuEnilWH+PGNImuza4/dUKl+
	iIeukYAwmv7rTmMfPAvAL7qR9ArlzxspcZ5YfzuKOA8tUdZM0FX0O7ruVvwvaz9JZ8IuM526MmZBs
	CwRblekUD8xPJEyghY4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taXYb-00000009sBg-2Yed;
	Wed, 22 Jan 2025 10:01:57 +0000
Received: from sender4-pp-o94.zoho.com ([136.143.188.94])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taXTy-00000009rYE-38zJ
	for linux-riscv@lists.infradead.org;
	Wed, 22 Jan 2025 09:57:11 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1737539805; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Zpm3EIWmz+kHUp8QG9TUENfhiYlXqhhg5Ng9Fhz5b46Zn52mHzu8UJg/OQycM4osGdNmtbch69/ZXs6NfkZ/ZKOOxgRdpFRlSRP82xdwhiWBJHpFnirWcfMCX2Vac5+e2NkfEgHLJAXPNkHobL2rCt9xQmBOHU8byilkjGAjfP4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1737539805; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Syb9XStZ74dZ9UjkC86uQY//S07l8lYvVVc6rFRliac=; 
	b=Fk8TpOqf6JDcjE98+WkKcDIgBSupFTLJWkzOXUWjphQLbR4CidV7M0eWI+xevZw1g23vuxMKJJ100wO8kx3laTuWphelqBOOeMk3Uls7PAMjb7rAmI4+YkUR2xjn/CobA8iRLQG/cu3ESfx24e0F6FNHJbfIjk9iXGnf+OGMJ/E=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
	dmarc=pass header.from=<kingxukai@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1737539805;
	s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Feedback-ID:Reply-To;
	bh=Syb9XStZ74dZ9UjkC86uQY//S07l8lYvVVc6rFRliac=;
	b=SOkWeO44kE2AW9l0Hh83lGQwokQ+k0A2oadXlA1biHJH7xm769I32zvZlFOIwuw+
	gOto9k7E/zCSkQs566lEduLVZAsKGbWdNXw9alD5Kfl51Dq1fvBivwm9G+6TfKV4w7M
	YVL5KzKtbQUzL182NC9TCh73UnTVKAqSRTFoBoMk=
Received: by mx.zohomail.com with SMTPS id 173753980464133.89882163947368;
	Wed, 22 Jan 2025 01:56:44 -0800 (PST)
From: Xukai Wang <kingxukai@zohomail.com>
Date: Wed, 22 Jan 2025 17:55:57 +0800
Subject: [PATCH v3 3/3] riscv: dts: canaan: Add clock initial support for
 K230
MIME-Version: 1.0
Message-Id: <20250122-b4-k230-clk-v3-3-bff755ac9cfc@zohomail.com>
References: <20250122-b4-k230-clk-v3-0-bff755ac9cfc@zohomail.com>
In-Reply-To: <20250122-b4-k230-clk-v3-0-bff755ac9cfc@zohomail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Xukai Wang <kingxukai@zohomail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Troy Mitchell <TroyMitchell988@gmail.com>
X-Mailer: b4 0.14.2
Feedback-ID: rr080112277910a4d436f4fbce1f2f21ad0000e158bfd99fa6093e83b8bb5a6e3bb66d9b742312236b742c8b:zu08011227264464127912d748287f1789000049c465d702938ae78b4da75186aaf627a908fcaf844eb5427b:rf0801122da4a83bf7efbd56ad96b034730000d3694be2e4d4cc0e0f2f45f682cf5e28a58e886fc72eba43ed599f227f702b:ZohoMail
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_015710_878997_220B7636 
X-CRM114-Status: GOOD (  10.08  )
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
 arch/riscv/boot/dts/canaan/k230.dtsi | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/riscv/boot/dts/canaan/k230.dtsi b/arch/riscv/boot/dts/canaan/k230.dtsi
index 95c1a3d8fb1192e30113d96d3e96329545bc6ae7..e50ba03c2c21597e5f7d04a652db08f84101cbfb 100644
--- a/arch/riscv/boot/dts/canaan/k230.dtsi
+++ b/arch/riscv/boot/dts/canaan/k230.dtsi
@@ -3,6 +3,7 @@
  * Copyright (C) 2024 Yangyu Chen <cyy@cyyself.name>
  */
 
+#include <dt-bindings/clock/canaan,k230-clk.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 
 /dts-v1/;
@@ -65,6 +66,13 @@ apb_clk: apb-clk-clock {
 		#clock-cells = <0>;
 	};
 
+	osc24m: clock-24m {
+		compatible = "fixed-clock";
+		clock-frequency = <24000000>;
+		clock-output-names = "osc24m";
+		#clock-cells = <0>;
+	};
+
 	soc {
 		compatible = "simple-bus";
 		interrupt-parent = <&plic>;
@@ -138,5 +146,29 @@ uart4: serial@91404000 {
 			reg-shift = <2>;
 			status = "disabled";
 		};
+
+		sysclk: clock-controller@91102000 {
+			compatible = "canaan,k230-clk";
+			reg = <0x0 0x91102000 0x0 0x1000>,
+			      <0x0 0x91100000 0x0 0x1000>;
+			clocks = <&osc24m>;
+			clock-output-names = "CPU0_ACLK", "CPU0_PLIC", "CPU0_NOC_DDRCP4",
+					     "CPU0_PCLK", "PMU_PCLK", "HS_HCLK_HIGH_SRC",
+					     "HS_HCLK_HIGH_GATE", "HS_HCLK_SRC",
+					     "HS_SD0_HS_AHB_GAT", "HS_SD1_HS_AHB_GAT",
+					     "HS_SSI1_HS_AHB_GA", "HS_SSI2_HS_AHB_GA",
+					     "HS_USB0_HS_AHB_GA", "HS_USB1_HS_AHB_GA",
+					     "HS_SSI0_AXI", "HS_SSI1", "HS_SSI2",
+					     "HS_QSPI_AXI_SRC", "HS_SSI1_ACLK_GATE",
+					     "HS_SSI2_ACLK_GATE", "HS_SD_CARD_SRC",
+					     "HS_SD0_CARD_TX", "HS_SD1_CARD_TX",
+					     "HS_SD_AXI_SRC", "HS_SD0_AXI_GATE",
+					     "HS_SD1_AXI_GATE", "HS_SD0_BASE_GATE",
+					     "HS_SD1_BASE_GATE", "HS_OSPI_SRC",
+					     "HS_USB_REF_51M", "HS_SD_TIMER_SRC",
+					     "HS_SD0_TIMER_GATE", "HS_SD1_TIMER_GATE",
+					     "HS_USB0_REFERENCE", "HS_USB1_REFERENCE";
+			#clock-cells = <1>;
+		};
 	};
 };

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
