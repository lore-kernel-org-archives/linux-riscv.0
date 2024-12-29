Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25F29E7718B
	for <linux-riscv@archiver.kernel.org>; Sun, 29 Dec 2024 13:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lYcrJAByjQ1WeQtpT2/ztrzUM/ETrauLq0+M7wby//Y=; b=yoInuDs1YZ3ZZw
	+C7bbVRcV2/O6OYUugV88QN2paRX6durgncvfWk8PIqfhmgpYnQK6NxPnL2Zty9JEycESkuPEf93Y
	8xViBCUG+1G8sBvNu6MNCMrhtPHX6gFCexKokJSUC4thWq5rGRl0MuxigQBhI499kbDUYvzVxfmc4
	jqCWeHKtRM4WPna3xViDI7bzu4CRxWP6PQKKjD+vBH+E3Wpk31vC3hel5DmtOLAzMN4O7MLXEqOTW
	H2tpqz0pJWCyc1BgWif3e1kRHb78TxJfQ4C0TPW2vgUpOEvBOC9eAtAEjY32V/b22R5EhUP2KpGUO
	5t79uS4E03DB7QebKNpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRtF0-00000003Qff-2SJE;
	Sun, 29 Dec 2024 13:21:58 +0000
Received: from sender4-pp-o94.zoho.com ([136.143.188.94])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRtEy-00000003QfB-390j
	for linux-riscv@lists.infradead.org;
	Sun, 29 Dec 2024 13:21:58 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1735478506; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=czHXv0igCWGSGjl8bF+ezAwII4lDF+G7/bZ1U1zfiRRwO2WDYtM/wQeoDKYV+8GivBI17kYCga8Vr8/YZdx4uIsP8orWTfQU2g/XaDJAaahohruLspQPKvDdNA/bYqZqDLXMRqKfkeidgkzNcsfPoNE6kLdzzNYL+CaInTd5go8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1735478506; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=H/LKZs6R4X4KuQVGNIBC19UZOmWhnn+Z2CAoilDgTYo=; 
	b=GHNRh60+zfRcyqVXlIpag2QHJufzVN+Wxf3aTy6LAUt+L+iuMQSjTnSzn7dZc/jHJltwbrreDhTlPVzM2zARKP6vOC8e24wa8nOhQi2NMQm08ZIXerUpyVkewE3kAf8PzGJVz9f9x5swLDFBhn/7gQHBiPiP7UNLV6I4H0jh7MY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
	dmarc=pass header.from=<kingxukai@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1735478506;
	s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Feedback-ID:Reply-To;
	bh=H/LKZs6R4X4KuQVGNIBC19UZOmWhnn+Z2CAoilDgTYo=;
	b=f6zmlLg1w72bubAiw9a5u2tFKxZ/4kyt8xXO1F4sF8LWv6kTlVgHnPrrYEqtJy0F
	qqVjBSI/9QdvPiPjeoxAfdiKO+X/dLy8hL6d36Ooe6pz6Jer8QW+d1l2bUi8111M4FQ
	+1p5i3zP+4wFR/6Lmtyj0hobrouvLCOTgSYE3Z9o=
Received: by mx.zohomail.com with SMTPS id 1735478504202268.9749734238811;
	Sun, 29 Dec 2024 05:21:44 -0800 (PST)
From: Xukai Wang <kingxukai@zohomail.com>
Date: Sun, 29 Dec 2024 21:21:08 +0800
Subject: [PATCH 1/3] dt-bindings: clock: Add bindings for Canaan K230 clock
 controller
MIME-Version: 1.0
Message-Id: <20241229-b4-k230-clk-v1-1-221a917e80ed@zohomail.com>
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
Feedback-ID: rr080112275934c349a16a5b16774bf0ef00003d5fca0de8558e38392459fe9c1c0e289adf3bcc9263de08bc:zu08011227ea281bca0fed68bfab3f4cd80000ca43fae85065a1fe85553f5d9c151622f0bdadbe01b81e1d6c:rf0801122d02305146aea5ec0d92f1ea970000df079701845cc0aa6bfab7370d5f211e2559227824913884525a4015f839c7:ZohoMail
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241229_052156_827165_2AC8E57A 
X-CRM114-Status: GOOD (  11.28  )
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

This patch adds the Device Tree binding for the clock controller
on Canaan k230. The binding defines the new clocks available and
the required properties to configure them correctly.

Signed-off-by: Xukai Wang <kingxukai@zohomail.com>
---
 .../devicetree/bindings/clock/canaan,k230-clk.yaml | 41 ++++++++++++++++++
 include/dt-bindings/clock/k230-clk.h               | 49 ++++++++++++++++++++++
 2 files changed, 90 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/canaan,k230-clk.yaml b/Documentation/devicetree/bindings/clock/canaan,k230-clk.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..ffd4e0b052455bf3dcedd9355d93764119df3d68
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/canaan,k230-clk.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/canaan,k230-clk.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Canaan Kendryte K230 Clock
+
+maintainers:
+  - Xukai Wang <kingxukai@zohomail.com>
+
+properties:
+  compatible:
+    const: canaan,k230-clk
+
+  clocks: 
+    const: 1
+
+  reg:
+    maxItems: 2
+    minItems: 1
+
+  '#clock-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller@91102000 {
+        compatible = "canaan,k230-clk";
+        reg = <0x91102000 0x1000>, <0x91100000 0x1000>;
+        #clock-cells = <1>;
+        clocks = <&osc24m>;
+    };
diff --git a/include/dt-bindings/clock/k230-clk.h b/include/dt-bindings/clock/k230-clk.h
new file mode 100644
index 0000000000000000000000000000000000000000..31d1f82fbcff654072ef1a8985a884377d801e72
--- /dev/null
+++ b/include/dt-bindings/clock/k230-clk.h
@@ -0,0 +1,49 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Kendryte Canaan K230 Clock Drivers
+ *
+ * Author: Xukai Wang <kingxukai@zohomail.com>
+ */
+
+#ifndef CLOCK_K230_CLK_H
+#define CLOCK_K230_CLK_H
+
+/* Kendryte K230 SoC clock identifiers (arbitrary values). */
+#define	K230_CPU0_SRC			0
+#define	K230_CPU0_ACLK			1
+#define	K230_CPU0_PLIC			2
+#define	K230_CPU0_NOC_DDRCP4		3
+#define	K230_CPU0_PCLK			4
+#define	K230_PMU_PCLK			5
+#define	K230_HS_HCLK_HIGN_SRC		6
+#define	K230_HS_HCLK_HIGN_GATE		7
+#define	K230_HS_HCLK_SRC		8
+#define	K230_HS_SD0_HS_AHB_GAT		9
+#define	K230_HS_SD1_HS_AHB_GAT		10
+#define	K230_HS_SSI1_HS_AHB_GA		11
+#define	K230_HS_SSI2_HS_AHB_GA		12
+#define	K230_HS_USB0_HS_AHB_GA		13
+#define	K230_HS_USB1_HS_AHB_GA		14
+#define	K230_HS_SSI0_AXI15		15
+#define	K230_HS_SSI1			16
+#define	K230_HS_SSI2			17
+#define	K230_HS_QSPI_AXI_SRC		18
+#define	K230_HS_SSI1_ACLK_GATE		19
+#define	K230_HS_SSI2_ACLK_GATE		20
+#define	K230_HS_SD_CARD_SRC		21
+#define	K230_HS_SD0_CARD_TX		22
+#define	K230_HS_SD1_CARD_TX		23
+#define	K230_HS_SD_AXI_SRC		24
+#define	K230_HS_SD0_AXI_GATE		25
+#define	K230_HS_SD1_AXI_GATE		26
+#define	K230_HS_SD0_BASE_GATE		27
+#define	K230_HS_SD1_BASE_GATE		28
+#define	K230_HS_OSPI_SRC		29
+#define	K230_HS_USB_REF_50M		30
+#define	K230_HS_SD_TIMER_SRC		31
+#define	K230_HS_SD0_TIMER_GATE		32
+#define	K230_HS_SD1_TIMER_GATE		33
+#define	K230_HS_USB0_REFERENCE		34
+#define	K230_HS_USB1_REFERENCE		35
+
+#endif /* CLOCK_K230_CLK_H */

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
