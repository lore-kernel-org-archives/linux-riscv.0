Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EE6CC02197
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Feb 2025 14:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B9JR7M3XtCiZFdgxPhFSLhO0jvhI9jEEY7a816IFX8Y=; b=ZOcduw4LZcdS01
	t7GjkYrjoFow32IJEnkowNTQw5P6Rl4Tg3n2AVcWOaMgVl6hT9nXozLSnGmlOCgNniHWYF2bPFyIc
	/o+buP6wmLEWRQUFvZd7h9zYKpa3G51VNmiCkdwh78xeLU68bZqY07AHGPKx8IyOIC3UyAIRmBAUl
	fS74r7pEkKhwefkOJALzMRwPAnYU3L2rvSa6s+fjgHZrNMre7j5Achv8Gte3xp4pa+Pt35GC7+gsZ
	yjeREVqZpr2xtJUzHNgA86+82xY8WAAhtc6K5rXXBIBmpoQeYDxyLiC1PNaX+5c4sUnSzvHSRzOkf
	4deXxtxrEVPXLOx4ePzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1texu3-0000000FmSb-2JbJ;
	Mon, 03 Feb 2025 14:58:23 +0000
Received: from sender4-pp-o92.zoho.com ([136.143.188.92])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1texpv-0000000FlcO-3str
	for linux-riscv@lists.infradead.org;
	Mon, 03 Feb 2025 14:54:09 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1738594411; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JcqvtMqcMieo997JEIs72YQYVWtko+QStp1rLeJkk0YIqiKWfbEU8VmtJELnNd3pJV7AJfyORDJW1OSIUUUi/0taJkyVBFdDZGkA9P0uh1r0QlSTKF+m5d8rl9A0cch6CQc4rwRB/XeJ5Vjmn3ep7h1C+z6t3pfbuN9n5/Vk/Go=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1738594411; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Syb9XStZ74dZ9UjkC86uQY//S07l8lYvVVc6rFRliac=; 
	b=MDhBqX1xiNWmPvN9Et1L5KfXLfQBBI6XRzzLMoOWvEtrxyAmdwjU1//F2L7sLWb3mym6pRNq7liX+0pvQzwSHuR6dKhYNfQiVIW9EDKurOLQMTLQp6pdJB7mjBS462HapBc+fVwUXiople5LqyIyFTxJhP72VNlRrXov5b24QgY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
	dmarc=pass header.from=<kingxukai@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1738594411;
	s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Feedback-ID:Reply-To;
	bh=Syb9XStZ74dZ9UjkC86uQY//S07l8lYvVVc6rFRliac=;
	b=ADDkMDhCe56AxdypqqikCmg3b0yuIE2GWQEb0f/KQLf70DJVcjN2qbZfHXNKEtbJ
	T82mJah7KuE5RWvd+MoQhCABXbQfd2TQSsofPVtRMw7/fP4f6a7jk8HehkAKeQ3lPyN
	tAI9nW7WGmxWEGTdGmtK/bZ2EHmfecZsKm9ZISPg=
Received: by mx.zohomail.com with SMTPS id 1738594408629965.8786061662063;
	Mon, 3 Feb 2025 06:53:28 -0800 (PST)
From: Xukai Wang <kingxukai@zohomail.com>
Date: Mon, 03 Feb 2025 22:49:57 +0800
Subject: [PATCH RESEND v3 3/3] riscv: dts: canaan: Add clock initial
 support for K230
MIME-Version: 1.0
Message-Id: <20250203-b4-k230-clk-v3-3-362c79124572@zohomail.com>
References: <20250203-b4-k230-clk-v3-0-362c79124572@zohomail.com>
In-Reply-To: <20250203-b4-k230-clk-v3-0-362c79124572@zohomail.com>
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
Feedback-ID: rr080112270992e02b4f705f56f6fc30fe000042dfdaa070337a3026dff550f67a180f702183f5ee7da4b2ae:zu08011227e19cfecdd80517604a5e77bd00007e675372f9696a0dcfe7c7075d9ccb646559ab3d0afaa816d7:rf0801122b9bd85940fa49cf4007e3a85c0000df1bfb6016b4915bc6c1fce2636eec59e7272842f77bed447034abd375:ZohoMail
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_065408_031664_DBE1160E 
X-CRM114-Status: UNSURE (   9.36  )
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
