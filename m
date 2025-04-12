Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF7E6C369A1
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Apr 2025 07:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BGdQI9WN9jbZlw6krPeB32ODgzn8kesx8veF47u8fTE=; b=QEfkC1R1nMI5r+
	ieXEk/iqudLBKDnvUW/Qb5AiVsX6ezyZE0T1JME5K3Jh3hYh/dHwJlqrOZ4gvmq6VLahMVD/Avt1K
	y5TxeIrQTXPfDEVZ27XysCSGYM238YbgCSY6fw2Hx0dqAWSCJJ1xw8qFwjH3JHD97tgE7PJZhQQ+/
	FIg9TlE8qugpBInOZD8++TIc6JjLwrDRet39zn9os/isdCUUsCch4BTwmA2L6A8RNZBXIIiItaVOk
	I5AyvcQkyrnzApGEg25ucreA6pcLqtOI5oiNwhDC65kJi+yzB0TFQuLXjGGJ0ClAdRKBktWuSB1oo
	ynuOZM4bAbO1WUBKLhWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3VY9-0000000FbMJ-3E2M;
	Sat, 12 Apr 2025 07:45:13 +0000
Received: from bayard.4d2.org ([155.254.16.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3VY7-0000000FbLo-1B3N
	for linux-riscv@lists.infradead.org;
	Sat, 12 Apr 2025 07:45:12 +0000
Received: from bayard.4d2.org (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id C0C3312FB451;
	Sat, 12 Apr 2025 00:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1744443910; bh=HjRajC66ZXMvS7nHpFo8I7frSxUKTAzXBZUlqTgj3K0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VKvidHjCLqKiavsyFrkjA4MCSPJ9vgHKBvE3l9zVWXGKry59SzsotZn9BXs2Wp5KA
	 bsj0g9QyuT/3BfWDBob2ZGl3+vaBz82wkO9BbJa+MFDzP/YTbjAIzeNKsjUAfjXFmq
	 Hr1o6TKO5nGw7cWAhWAoiL3rKoiRqxIKUOlIOR4wpMkUdDCAYF7oClj1kWYSunBAK9
	 xj4vdwsJ7hto/YwutNDINBdJqDyEk2s3O8HMTkVLgNL4jQZ+VXusA2iFo1LUuzQgts
	 SW+1sJjO1Vpsraup+iPBCZVpRlqQuw3jSPeB3stup1oZl9CRnCrfdXpsooSQ99UtiA
	 Ojrm6FFad4Vvw==
X-Virus-Scanned: amavisd-new at 4d2.org
Authentication-Results: bayard.4d2.org (amavisd-new); dkim=pass (2048-bit key)
 header.d=4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by bayard.4d2.org (bayard.4d2.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t0lVx51_6p61; Sat, 12 Apr 2025 00:45:08 -0700 (PDT)
Received: from localhost.localdomain (unknown [183.217.81.239])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id 1106A12FB41C;
	Sat, 12 Apr 2025 00:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1744443908; bh=HjRajC66ZXMvS7nHpFo8I7frSxUKTAzXBZUlqTgj3K0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=w0KN8st5x6xIuQ6epOmywtVNWNRGHYmardR0S9feyUkn2mPLl57wXckdwJfbIXm19
	 MRuJrfceOy9PQWZz/j3SmGT3BQDMFjiwSHCxflYeMhuoBkpv3ngtCKkkJHMAUWOfYD
	 mdpTCJ04Jmk2PZ8f3EP4p05pIxgOYS8pYUiMxRY/wlr/Pr0SfCbjqTA1x4FfIWaEsX
	 FcsOtp0YhmoonwOxF97HKPKa0AE4mPO9/lIRM4ChPgm3jzKQPcIETG0Gzs1UdxhVQ0
	 A0A/FJW/tAMSvuPMIo2tTTaifc2CbvXpN4iQ8Ihiza6HPn92OF8bBnQVhEPDYA0JGG
	 Xmw/624GFp/cQ==
From: Haylen Chu <heylenay@4d2.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Haylen Chu <heylenay@outlook.com>,
	Yixun Lan <dlan@gentoo.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev,
	Inochi Amaoto <inochiama@outlook.com>,
	Chen Wang <unicornxdotw@foxmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
	Haylen Chu <heylenay@4d2.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alex Elder <elder@riscstar.com>
Subject: [PATCH v7 2/6] dt-bindings: clock: spacemit: Add spacemit,k1-pll
Date: Sat, 12 Apr 2025 07:44:20 +0000
Message-ID: <20250412074423.38517-4-heylenay@4d2.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250412074423.38517-2-heylenay@4d2.org>
References: <20250412074423.38517-2-heylenay@4d2.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250412_004511_362239_9FEA4ADE 
X-CRM114-Status: GOOD (  13.23  )
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

Add definition for the PLL found on SpacemiT K1 SoC, which takes the
external 24MHz oscillator as input and generates clocks in various
frequencies for the system.

Signed-off-by: Haylen Chu <heylenay@4d2.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Alex Elder <elder@riscstar.com>
---
 .../bindings/clock/spacemit,k1-pll.yaml       | 50 +++++++++++++++++++
 .../dt-bindings/clock/spacemit,k1-syscon.h    | 37 ++++++++++++++
 2 files changed, 87 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/spacemit,k1-pll.yaml

diff --git a/Documentation/devicetree/bindings/clock/spacemit,k1-pll.yaml b/Documentation/devicetree/bindings/clock/spacemit,k1-pll.yaml
new file mode 100644
index 000000000000..06bafd68c00a
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/spacemit,k1-pll.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/spacemit,k1-pll.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SpacemiT K1 PLL
+
+maintainers:
+  - Haylen Chu <heylenay@4d2.org>
+
+properties:
+  compatible:
+    const: spacemit,k1-pll
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    description: External 24MHz oscillator
+
+  spacemit,mpmu:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the "Main PMU (MPMU)" syscon. It is used to check PLL
+      lock status.
+
+  "#clock-cells":
+    const: 1
+    description:
+      See <dt-bindings/clock/spacemit,k1-syscon.h> for valid indices.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - spacemit,mpmu
+  - "#clock-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller@d4090000 {
+        compatible = "spacemit,k1-pll";
+        reg = <0xd4090000 0x1000>;
+        clocks = <&vctcxo_24m>;
+        spacemit,mpmu = <&sysctl_mpmu>;
+        #clock-cells = <1>;
+    };
diff --git a/include/dt-bindings/clock/spacemit,k1-syscon.h b/include/dt-bindings/clock/spacemit,k1-syscon.h
index 0c5b9b5f6073..35968ae98246 100644
--- a/include/dt-bindings/clock/spacemit,k1-syscon.h
+++ b/include/dt-bindings/clock/spacemit,k1-syscon.h
@@ -6,6 +6,43 @@
 #ifndef _DT_BINDINGS_SPACEMIT_CCU_H_
 #define _DT_BINDINGS_SPACEMIT_CCU_H_
 
+/* APBS (PLL) clocks */
+#define CLK_PLL1		0
+#define CLK_PLL2		1
+#define CLK_PLL3		2
+#define CLK_PLL1_D2		3
+#define CLK_PLL1_D3		4
+#define CLK_PLL1_D4		5
+#define CLK_PLL1_D5		6
+#define CLK_PLL1_D6		7
+#define CLK_PLL1_D7		8
+#define CLK_PLL1_D8		9
+#define CLK_PLL1_D11		10
+#define CLK_PLL1_D13		11
+#define CLK_PLL1_D23		12
+#define CLK_PLL1_D64		13
+#define CLK_PLL1_D10_AUD	14
+#define CLK_PLL1_D100_AUD	15
+#define CLK_PLL2_D1		16
+#define CLK_PLL2_D2		17
+#define CLK_PLL2_D3		18
+#define CLK_PLL2_D4		19
+#define CLK_PLL2_D5		20
+#define CLK_PLL2_D6		21
+#define CLK_PLL2_D7		22
+#define CLK_PLL2_D8		23
+#define CLK_PLL3_D1		24
+#define CLK_PLL3_D2		25
+#define CLK_PLL3_D3		26
+#define CLK_PLL3_D4		27
+#define CLK_PLL3_D5		28
+#define CLK_PLL3_D6		29
+#define CLK_PLL3_D7		30
+#define CLK_PLL3_D8		31
+#define CLK_PLL3_80		32
+#define CLK_PLL3_40		33
+#define CLK_PLL3_20		34
+
 /* MPMU clocks */
 #define CLK_PLL1_307P2		0
 #define CLK_PLL1_76P8		1
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
