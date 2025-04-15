Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B374C369AB
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Apr 2025 14:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ilCf5YZHL9NsPTz7aw0QehOuxb85RV5j6OoQJMLercM=; b=Vor4xnIyKawwE8
	FnZVJT2W91kCC3TSTp+CPmz/EJK5nag8REE4XmQgwTF0xUZiw3MhrEnRTj57VSL/H9ARGfRgTF2eH
	JuKGIw5qTYlcOryJ4F9H+SP/xjkDb1oCuJVAGJNTY/blz/1BrHtUbWb5kO4tcgzCVld1+bawDie8A
	XwijugoCD81lPNSfBNS0qxKKICjgSfQji0a3hdT4Krtry7mBdMFWL68cDshnESXqAegSgNELTTmlY
	EwyqGM4piENBX+yZqC/BjTUCj9TTutPtX25otZ3JrnG3QqzFZYlqd1WjJDCREFVjzurxvOo+ddTW2
	U6ZYXqKkm8tZTOzL8OOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4hEr-000000065DM-1120;
	Tue, 15 Apr 2025 14:26:13 +0000
Received: from sender4-pp-o94.zoho.com ([136.143.188.94])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4hEo-000000065Cb-3U8R
	for linux-riscv@lists.infradead.org;
	Tue, 15 Apr 2025 14:26:12 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1744727156; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=OmZlNtLEyorw+1a9Z0CatqyFcrJbMlc6cllJwuD72k/iumMXF/rr5DZUkF0oTfsX7z4mm2yf3yOWKvUR8AtYS0tmMrXMoNQTl7e262eSEdwAPHo3JI8iCCzY+7HsViOCimsL0FoNLtkY8csDNWFDYaoIUZELTSkdgZZtlbgPThY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1744727156; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=3ydZCPGpoQBdvJRWpULIrkhPs9pNUlcKM0pGYMjjiqQ=; 
	b=Q1RUHY9eMXFvnq2MaigMUY0czTDLgENsoIgwa4Qq95zkIpd8OMCuGbsb9l/2tER6BnwUYL+3yvPayBgfqHGZWcr44VBhP08SViODDf1HDn3IJlFZtCq935BBmdU2Vw5zr+vuMfGGeSj6KHjsRGN1Kt3Zo0oiBOIIuppzVhEsHSw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
	dmarc=pass header.from=<kingxukai@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744727156;
	s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Feedback-ID:Reply-To;
	bh=3ydZCPGpoQBdvJRWpULIrkhPs9pNUlcKM0pGYMjjiqQ=;
	b=Pdni9tYotp9GZCjV4p2gQmAa6ULg3lHnSZcN5ARyLdznry/BwSXUyyYZ0DrnuOSf
	z6FsJMbiT5/vUwKxTcLI0TOPJmarEjLHGJbM4Qq4Ks5Tgtx7Z1IRVVxkVS419IsdvIf
	1R4k7yKTEmOmMM4QcD7TV5QtOPdVJYOyNsfvAsmI=
Received: by mx.zohomail.com with SMTPS id 1744727153297241.47526668971102;
	Tue, 15 Apr 2025 07:25:53 -0700 (PDT)
From: Xukai Wang <kingxukai@zohomail.com>
Date: Tue, 15 Apr 2025 22:25:11 +0800
Subject: [PATCH v6 1/3] dt-bindings: clock: Add bindings for Canaan K230
 clock controller
MIME-Version: 1.0
Message-Id: <20250415-b4-k230-clk-v6-1-7fd89f427250@zohomail.com>
References: <20250415-b4-k230-clk-v6-0-7fd89f427250@zohomail.com>
In-Reply-To: <20250415-b4-k230-clk-v6-0-7fd89f427250@zohomail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Xukai Wang <kingxukai@zohomail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Troy Mitchell <TroyMitchell988@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
Feedback-ID: rr08011227b8f9efd0a5fb3ce6f2226fbc000089858a2ec298811604470f69b8f687f1d833361aed80ef1b39:zu08011227ebd1e9a2d9f48ab4099001cb00008da75685824158c19f05b3086f3f42fa343d7ca735718ce3ff:rf0801122ca4456f0d48fd10a9d5a79f040000d3bb90d0d3c8d9fe108d58b63fc46e5705cc340e3f6022eb398132cf415b:ZohoMail
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_072611_221158_C2746986 
X-CRM114-Status: GOOD (  11.70  )
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

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Xukai Wang <kingxukai@zohomail.com>
---
 .../devicetree/bindings/clock/canaan,k230-clk.yaml | 43 ++++++++++++++
 include/dt-bindings/clock/canaan,k230-clk.h        | 69 ++++++++++++++++++++++
 2 files changed, 112 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/canaan,k230-clk.yaml b/Documentation/devicetree/bindings/clock/canaan,k230-clk.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..d7220fa30e4699a68fa5279c04abc63c1905fa4a
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/canaan,k230-clk.yaml
@@ -0,0 +1,43 @@
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
+  reg:
+    items:
+      - description: PLL control registers.
+      - description: Sysclk control registers.
+
+  clocks:
+    maxItems: 1
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
+        reg = <0x91102000 0x1000>,
+              <0x91100000 0x1000>;
+        clocks = <&osc24m>;
+        #clock-cells = <1>;
+    };
diff --git a/include/dt-bindings/clock/canaan,k230-clk.h b/include/dt-bindings/clock/canaan,k230-clk.h
new file mode 100644
index 0000000000000000000000000000000000000000..41edb13ea04bffaa1ddd1d1af87ae3406b688332
--- /dev/null
+++ b/include/dt-bindings/clock/canaan,k230-clk.h
@@ -0,0 +1,69 @@
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
+#define K230_CPU0_SRC			0
+#define K230_CPU0_ACLK			1
+#define K230_CPU0_PLIC			2
+#define K230_CPU0_NOC_DDRCP4		3
+#define K230_CPU0_PCLK			4
+#define K230_PMU_PCLK			5
+#define K230_HS_HCLK_HIGH_SRC		6
+#define K230_HS_HCLK_HIGH_GATE		7
+#define K230_HS_HCLK_SRC		8
+#define K230_HS_SD0_HS_AHB_GAT		9
+#define K230_HS_SD1_HS_AHB_GAT		10
+#define K230_HS_SSI1_HS_AHB_GA		11
+#define K230_HS_SSI2_HS_AHB_GA		12
+#define K230_HS_USB0_HS_AHB_GA		13
+#define K230_HS_USB1_HS_AHB_GA		14
+#define K230_HS_SSI0_AXI15		15
+#define K230_HS_SSI1			16
+#define K230_HS_SSI2			17
+#define K230_HS_QSPI_AXI_SRC		18
+#define K230_HS_SSI1_ACLK_GATE		19
+#define K230_HS_SSI2_ACLK_GATE		20
+#define K230_HS_SD_CARD_SRC		21
+#define K230_HS_SD0_CARD_TX		22
+#define K230_HS_SD1_CARD_TX		23
+#define K230_HS_SD_AXI_SRC		24
+#define K230_HS_SD0_AXI_GATE		25
+#define K230_HS_SD1_AXI_GATE		26
+#define K230_HS_SD0_BASE_GATE		27
+#define K230_HS_SD1_BASE_GATE		28
+#define K230_HS_OSPI_SRC		29
+#define K230_HS_USB_REF_50M		30
+#define K230_HS_SD_TIMER_SRC		31
+#define K230_HS_SD0_TIMER_GATE		32
+#define K230_HS_SD1_TIMER_GATE		33
+#define K230_HS_USB0_REFERENCE		34
+#define K230_HS_USB1_REFERENCE		35
+#define K230_LS_APB_SRC			36
+#define K230_LS_UART0_APB		37
+#define K230_LS_UART1_APB		38
+#define K230_LS_UART2_APB		39
+#define K230_LS_UART3_APB		40
+#define K230_LS_UART4_APB		41
+#define K230_LS_I2C0_APB		42
+#define K230_LS_I2C1_APB		43
+#define K230_LS_I2C2_APB		44
+#define K230_LS_I2C3_APB		45
+#define K230_LS_GPIO_APB		46
+#define K230_LS_PWM_APB			47
+#define K230_LS_UART0			48
+#define K230_LS_UART1			49
+#define K230_LS_UART2			50
+#define K230_LS_UART3			51
+#define K230_LS_UART4			52
+#define K230_SHRM_AXI_SRC		53
+#define K230_SHRM_SDMA_AXI_GATE		54
+#define K230_SHRM_PDMA_AXI_GATE		55
+
+#endif /* CLOCK_K230_CLK_H */

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
