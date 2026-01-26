Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 374BDD1951A
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jan 2026 21:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KycxAhkaZUDZO6luT/H+MUTMCZ7C0HRWNy473Arlb2s=; b=4myKCz+iP9g3as
	qNGe1WGAATDe6D1uG7KgvWPsQ++7mPLHwsioLv/f8Jp1mzZ8S+WRKkohZIa9hGNlO943FV9YiDKlr
	Ri4pK+aRhKdK0Qvg7sLfC7JYzbBCi23c+4vo28utQOe7c520Qm1JF9Bcaoq5HqAiWzye1J20bKP88
	4x5bYLgL4q40xZX0iCuyXgVB7LzwVvydLFuuch+aU8I5atVOdk1Zvj3X1WU7DVjlw2AAr6b33gS9D
	sqIRnUZa5gmy1wOxl9dySk3bvpDL8xyLz9hkV9r3wVTnhp/EoOdIci7Wmq0eTm71eE791gXNaShBe
	mIqdWOcsS8Zi9Zf79ltw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkTny-0000000DFTM-0ix1;
	Mon, 26 Jan 2026 21:07:26 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkTnv-0000000DFRd-0sRq
	for linux-riscv@lists.infradead.org;
	Mon, 26 Jan 2026 21:07:24 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-79456d5ebf9so18249707b3.2
        for <linux-riscv@lists.infradead.org>; Mon, 26 Jan 2026 13:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1769461642; x=1770066442; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VmgB4JOviFy42/0uIZfa03y/6mB8pldrtvsYd3V5d+M=;
        b=h1xl9FhEclmIs3HDVAm5EdO2IACPjAdgBAh+w11qLoq7B+tGP2RpGE+7mFiDm4aYyO
         3hPf+3JepwRNpyOOkRQ+xzQei6O4bK3vseIPQDrcduz/aAA/GI1ApIxufY7Ng/aRH6qP
         ar3vShf8PZUmjLq18GKajJlcHKcjT/QJYkQpn38vb9/NJA2kTTACrZ5pFPsHUAL9LyYX
         btw6LIP195pq55SK8HVserBK7yr/1N4EMeHizlLwRsYZkbCAAANXRPjESODKwbQu4HTs
         4NxiopH6VfGlM9PARiaoa+ojFaBg16X2XRxPmXBWfdFpnogw6Hnze4Sy/5xIsV5OAZtE
         2eDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769461642; x=1770066442;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VmgB4JOviFy42/0uIZfa03y/6mB8pldrtvsYd3V5d+M=;
        b=axSe1F0yNIYewMBrAF/b8EcDetAjPkPHY2geIRi0M4W31sjxvwofz3VB4n0bIsHg4I
         2dJWCE6cXUeX6+qlcF2YpuWNd27l5a2uVcIekrbsViD9WOoDnFhBVm2Hr6+wBgH82tyI
         2+CoXVqACELe4gmbGqbE/xG4Ht52rZIAajRfpXVN6ds9YnL/CGa5v8Y/qfNFrJQzb1SB
         4L76uKvdzA/NEVkTozb2kr5P84Wd9CC2E+bP7ZOuqlf02yMR3Aim/Rt9Merj+/uyDufW
         j3TYIV0jWHTu8/7LbjrsM5GlrZ+Fw4bgfAJ2l4UMkpmYAlU+Q4yCwbJ/NZtyDeRC6jf0
         kR/A==
X-Gm-Message-State: AOJu0YwO7iGuhkGnyK458hJ0HQ2gJuJDfmcOb3vaNj1fiIKqGmAgU2GI
	6NO6vPOQ9S5bBFj57mMCvT6y9+I4HLnzQq+/42Jo9fLmwuEr1aAAkhSQwJEzDPc7ahs=
X-Gm-Gg: AZuq6aIKYLFextC93ipOaO9WQUeUB2CfbGXffrT5gEVDX3KFTx1ySKfV2stRms7dCZS
	Z3wZ7zJfXsp55GkvxzvpaP15X4smLNMCgYZ0vWdxRwsiMb64tdmxyVPkMSWUP85ssC2WOtQuFP3
	qLtFuTD+fQRslZiXeK5CGQUWg7QGBmpPHNjMOKFdnl3evneRrwXAnmnrusuxLmJ1aK7RCGbXdON
	fJleZTcdgaOA5zV91aGtwMu4yTPwDbNv0FPU7aJi+bhtkybMs7PDKdvAhl5MiLkKDYWAXvMj9FK
	8TPumWZ5IK0eaiyJm380SsSPHjHS3ncGCotuccIASw5xJev0CqYy5+QVKK+R7SydgGEv/hfxB1X
	jdGZpxPOVKcpqO7KxtXtTM2MGOhjdqV6UiBq9HXV8JlTkf2zDnyG/W778ZlakC3uYrVltLVcgFO
	qOI+QDE4qUYcWR71cA2BCzvpM7JNNUWNe8ipq7+XxZAbj1JSQThkmuDX8bRGnf568f8Z6zKeg=
X-Received: by 2002:a05:690c:6f0b:b0:794:ef5:cf9f with SMTP id 00721157ae682-7945a9cf77amr48608167b3.60.1769461642017;
        Mon, 26 Jan 2026 13:07:22 -0800 (PST)
Received: from [192.168.5.15] ([68.95.197.245])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7944bed27casm37948757b3.7.2026.01.26.13.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 13:07:21 -0800 (PST)
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Mon, 26 Jan 2026 15:07:14 -0600
Subject: [PATCH v3 1/3] dt-bindings: clk: tenstorrent: Add
 tenstorrent,atlantis-prcm
MIME-Version: 1.0
Message-Id: <20260126-atlantis-clocks-v3-1-b016135551b7@oss.tenstorrent.com>
References: <20260126-atlantis-clocks-v3-0-b016135551b7@oss.tenstorrent.com>
In-Reply-To: <20260126-atlantis-clocks-v3-0-b016135551b7@oss.tenstorrent.com>
To: Drew Fustini <dfustini@oss.tenstorrent.com>, 
 Joel Stanley <jms@oss.tenstorrent.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, joel@jms.id.au, 
 fustini@kernel.org, mpe@kernel.org, mpe@oss.tenstorrent.com, 
 npiggin@oss.tenstorrent.com, agross@kernel.org, agross@oss.tenstorrent.com, 
 bmasney@redhat.com
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_130723_269298_510B0D73 
X-CRM114-Status: GOOD (  15.11  )
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

Document bindings for Tenstorrent Atlantis PRCM that manages clocks
and resets. This block is instantiated 4 times in the SoC.
This commit documents the clocks from the RCPU PRCM block.

Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
---
 .../bindings/clock/tenstorrent,atlantis-prcm.yaml  |  82 ++++++++++++++++
 MAINTAINERS                                        |   2 +
 .../dt-bindings/clock/tenstorrent,atlantis-prcm.h  | 103 +++++++++++++++++++++
 3 files changed, 187 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/tenstorrent,atlantis-prcm.yaml b/Documentation/devicetree/bindings/clock/tenstorrent,atlantis-prcm.yaml
new file mode 100644
index 000000000000..c5716a9928bc
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/tenstorrent,atlantis-prcm.yaml
@@ -0,0 +1,82 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/tenstorrent,atlantis-prcm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Tenstorrent Atlantis PRCM (Power, Reset, Clock Management) Module
+
+maintainers:
+  - Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
+
+description:
+  Multifunctional register block found in Tenstorrent Atlantis SoC whose main
+  function is to control clocks and resets. This block is instantiated multiple
+  times in the SoC, each block controls clock and resets for a different
+  subsystem. RCPU prcm serves low speed IO interfaces. PCIe prcm serves all
+  PCIe related functions, HSIO prcm serves high speed IO interfaces (Ethernet,
+  USB), MM prcm serves GPU, display and video processing functions.
+
+properties:
+  compatible:
+    enum:
+      - tenstorrent,atlantis-prcm-rcpu
+      - tenstorrent,atlantis-prcm-pcie
+      - tenstorrent,atlantis-prcm-mm
+      - tenstorrent,atlantis-prcm-hsio
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  "#clock-cells":
+    const: 1
+    description:
+      See <dt-bindings/clock/tenstorrent,atlantis-prcm.h> for valid indices.
+
+  "#reset-cells":
+    const: 1
+
+  tenstorrent,prcm-rcpu:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle reference to RCPU prcm, needed by other 3 prcms (PCIe, MM, HSIO)
+      as the control registers for the PLLs that drive these subsystems are in
+      RCPU prcm's range
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - "#clock-cells"
+  - "#reset-cells"
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - tenstorrent,atlantis-prcm-pcie
+              - tenstorrent,atlantis-prcm-mm
+              - tenstorrent,atlantis-prcm-hsio
+    then:
+      required:
+        - tenstorrent,prcm-rcpu
+    else:
+      properties:
+        tenstorrent,prcm-rcpu: false
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller@a8000000 {
+      compatible = "tenstorrent,atlantis-prcm-rcpu";
+      reg = <0xa8000000 0x10000>;
+      clocks = <&osc_24m>;
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index dc731d37c8fe..0fc7bc6d0458 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22534,8 +22534,10 @@ M:	Joel Stanley <jms@oss.tenstorrent.com>
 L:	linux-riscv@lists.infradead.org
 S:	Maintained
 T:	git https://github.com/tenstorrent/linux.git
+F:	Documentation/devicetree/bindings/clock/tenstorrent,atlantis-prcm.yaml
 F:	Documentation/devicetree/bindings/riscv/tenstorrent.yaml
 F:	arch/riscv/boot/dts/tenstorrent/
+F:	include/dt-bindings/clock/tenstorrent,atlantis-prcm.h
 
 RISC-V THEAD SoC SUPPORT
 M:	Drew Fustini <fustini@kernel.org>
diff --git a/include/dt-bindings/clock/tenstorrent,atlantis-prcm.h b/include/dt-bindings/clock/tenstorrent,atlantis-prcm.h
new file mode 100644
index 000000000000..3820781127c3
--- /dev/null
+++ b/include/dt-bindings/clock/tenstorrent,atlantis-prcm.h
@@ -0,0 +1,103 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Tenstorrent Atlantis PRCM Clock and Reset Indices
+ *
+ * Copyright (c) 2026 Tenstorrent
+ */
+
+#ifndef _DT_BINDINGS_ATLANTIS_PRCM_H
+#define _DT_BINDINGS_ATLANTIS_PRCM_H
+
+/*
+ * RCPU Domain Clock IDs
+ */
+#define CLK_RCPU_PLL		0
+#define CLK_RCPU_ROOT		1
+#define CLK_RCPU_DIV2		2
+#define CLK_RCPU_DIV4		3
+#define CLK_RCPU_RTC		4
+#define CLK_SMNDMA0_ACLK	5
+#define CLK_SMNDMA1_ACLK	6
+#define CLK_WDT0_PCLK		7
+#define CLK_WDT1_PCLK		8
+#define CLK_TIMER_PCLK		9
+#define CLK_PVTC_PCLK		10
+#define CLK_PMU_PCLK		11
+#define CLK_MAILBOX_HCLK	12
+#define CLK_SEC_SPACC_HCLK	13
+#define CLK_SEC_OTP_HCLK	14
+#define CLK_TRNG_PCLK		15
+#define CLK_SEC_CRC_HCLK	16
+#define CLK_SMN_HCLK		17
+#define CLK_AHB0_HCLK		18
+#define CLK_SMN_PCLK		19
+#define CLK_SMN_CLK		20
+#define CLK_SCRATCHPAD_CLK	21
+#define CLK_RCPU_CORE_CLK	22
+#define CLK_RCPU_ROM_CLK	23
+#define CLK_OTP_LOAD_CLK	24
+#define CLK_NOC_PLL		25
+#define CLK_NOCC_CLK		26
+#define CLK_NOCC_DIV2		27
+#define CLK_NOCC_DIV4		28
+#define CLK_NOCC_RTC		29
+#define CLK_NOCC_CAN		30
+#define CLK_QSPI_SCLK		31
+#define CLK_QSPI_HCLK		32
+#define CLK_I2C0_PCLK		33
+#define CLK_I2C1_PCLK		34
+#define CLK_I2C2_PCLK		35
+#define CLK_I2C3_PCLK		36
+#define CLK_I2C4_PCLK		37
+#define CLK_UART0_PCLK		38
+#define CLK_UART1_PCLK		39
+#define CLK_UART2_PCLK		40
+#define CLK_UART3_PCLK		41
+#define CLK_UART4_PCLK		42
+#define CLK_SPI0_PCLK		43
+#define CLK_SPI1_PCLK		44
+#define CLK_SPI2_PCLK		45
+#define CLK_SPI3_PCLK		46
+#define CLK_GPIO_PCLK		47
+#define CLK_CAN0_HCLK		48
+#define CLK_CAN0_CLK		49
+#define CLK_CAN1_HCLK		50
+#define CLK_CAN1_CLK		51
+#define CLK_CAN0_TIMER_CLK	52
+#define CLK_CAN1_TIMER_CLK	53
+
+/* RCPU domain reset */
+#define RST_SMNDMA0		0
+#define RST_SMNDMA1		1
+#define RST_WDT0		2
+#define RST_WDT1		3
+#define RST_TMR			4
+#define RST_PVTC		5
+#define RST_PMU			6
+#define RST_MAILBOX		7
+#define RST_SPACC		8
+#define RST_OTP			9
+#define RST_TRNG		10
+#define RST_CRC			11
+#define RST_QSPI		12
+#define RST_I2C0		13
+#define RST_I2C1		14
+#define RST_I2C2		15
+#define RST_I2C3		16
+#define RST_I2C4		17
+#define RST_UART0		18
+#define RST_UART1		19
+#define RST_UART2		20
+#define RST_UART3		21
+#define RST_UART4		22
+#define RST_SPI0		23
+#define RST_SPI1		24
+#define RST_SPI2		25
+#define RST_SPI3		26
+#define RST_GPIO		27
+#define RST_CAN0		28
+#define RST_CAN1		29
+#define RST_I2S0		30
+#define RST_I2S1		31
+
+#endif /* _DT_BINDINGS_ATLANTIS_PRCM_H */

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
