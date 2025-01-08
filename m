Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05E84E77188
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jan 2025 12:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YYRuiSkpaiUgcG6a2O/MArU1rZQzebxHHHpBi7JB1zQ=; b=PhL/yQZlUaDl3A
	YvQPc9KvRhvopDaNR4Ul7PckLCOMUSzIRJR2mptUfC+QVMoNxqUmpxQqNqxdxGOCKNHEj5Y2+5hta
	THsHGoiJCk/0GGmREjCvq2hOTlSHmqiFP53cRaDNZgk3mgzxeb9qySo+K9oEwxWA72dskF+hAHyYW
	mFVHB9hsYXa3gQM9AxvYOMV6VgpxC/3GLNWHgnMYnxKGh0fei6mWi+K0jzosQTcCqOtzfcjh4oMYZ
	9hOh3qNXQgCGDhRixVAOK/lYysqaF9ycjWwQXEzb8sCFKcS7hKmVhoYSb1L6zMUBFmrSjAM1jEd8k
	uQBmbCJQna7bjTyxt5Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVVVb-00000008UQE-3aDH;
	Wed, 08 Jan 2025 12:50:03 +0000
Received: from sender4-pp-o94.zoho.com ([136.143.188.94])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVUd9-00000008J9M-2phz
	for linux-riscv@lists.infradead.org;
	Wed, 08 Jan 2025 11:53:48 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1736337220; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PR6VtCgXo1XOBm2LYJzUAVtcIEu12tWQD++aLlAx3JRB8QgNG4I+W8JW0NX/YkLXsTNm4DZgLIhpLeUL3mET6x1BcBJtkTGuaRnNZl23N1AcHAPeZOFTeyKmUQGTkj8RinLY/I10xzBlkzvOr6fw7Vw0tTKoFJZOcQHaKamos4c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1736337220; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=R1KgsU6VXHm0JLzM+L4MdgvW173mPsf0MRAif107U+M=; 
	b=lfKY9u/jFEn5AqG4fQvWJ7ADMfGPrtOhRptmZQNFNaNOdM3sQyy47/7MOHZoUUlkD9+/72ZgSN3PhTAehSsYq5eaOg2OkrMl2NJSeRhorpBGkIoyErwSmsiV01aQNztI7jWp2umAzdItNDntAAHaVOf4R4geUi5JJSfNenxmXNU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
	dmarc=pass header.from=<kingxukai@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1736337220;
	s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Feedback-ID:Reply-To;
	bh=R1KgsU6VXHm0JLzM+L4MdgvW173mPsf0MRAif107U+M=;
	b=XeHiqTStfQRHO7VgFeEMX5OX3AFhQ/bPaOHS7SKwrgNM50isY/6Y4b2ptWg7BZcv
	KOr8N8f7ro6Wcyzh/InLUxhWU/3bUthk5VGrddvg1rVqvPPlzMnxynMYougjg508e2D
	80/utVNaBbhN7KLdaTkCqSkKOq9jyQbemB91OMo8=
Received: by mx.zohomail.com with SMTPS id 1736337217677117.77501870213621;
	Wed, 8 Jan 2025 03:53:37 -0800 (PST)
From: Xukai Wang <kingxukai@zohomail.com>
Date: Wed, 08 Jan 2025 19:53:07 +0800
Subject: [PATCH v2 1/3] dt-bindings: clock: Add bindings for Canaan K230
 clock controller
MIME-Version: 1.0
Message-Id: <20250108-b4-k230-clk-v2-1-27b30a2ca52d@zohomail.com>
References: <20250108-b4-k230-clk-v2-0-27b30a2ca52d@zohomail.com>
In-Reply-To: <20250108-b4-k230-clk-v2-0-27b30a2ca52d@zohomail.com>
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
Feedback-ID: rr0801122745ca7e76ca2434a241a0651f0000ab1998d5e7b691fcb40c97d86321ea9239a4d6193549d9a8ab:zu0801122748d05716b95c7a377408fb49000003c24f5004d0cb9943038f416d73881fb5525077f119b8d48f:rf0801122dde88c84aabd21b152689e4640000cfc7348a52002013de419afa9fb1fcc94fb6e51278f7d04234b3c02dacd9f0:ZohoMail
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_035347_745677_A54708C8 
X-CRM114-Status: GOOD (  11.47  )
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
 .../devicetree/bindings/clock/canaan,k230-clk.yaml | 42 +++++++++++++++++++
 include/dt-bindings/clock/canaan,k230-clk.h        | 49 ++++++++++++++++++++++
 2 files changed, 91 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/canaan,k230-clk.yaml b/Documentation/devicetree/bindings/clock/canaan,k230-clk.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..4b738eb7e7de754787f6d1acf7be09a3577d3b95
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/canaan,k230-clk.yaml
@@ -0,0 +1,42 @@
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
+    maxItems: 1
+
+  reg:
+    items:
+      - description: PLL control registers.
+      - description: Sysclk control registers.
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
diff --git a/include/dt-bindings/clock/canaan,k230-clk.h b/include/dt-bindings/clock/canaan,k230-clk.h
new file mode 100644
index 0000000000000000000000000000000000000000..b6972dcb1fc97f96a6045f75ad296e86096b6a9a
--- /dev/null
+++ b/include/dt-bindings/clock/canaan,k230-clk.h
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
+#define K230_CPU0_SRC			0
+#define K230_CPU0_ACLK			1
+#define K230_CPU0_PLIC			2
+#define K230_CPU0_NOC_DDRCP4		3
+#define K230_CPU0_PCLK			4
+#define K230_PMU_PCLK			5
+#define K230_HS_HCLK_HIGN_SRC		6
+#define K230_HS_HCLK_HIGN_GATE		7
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
+
+#endif /* CLOCK_K230_CLK_H */

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
