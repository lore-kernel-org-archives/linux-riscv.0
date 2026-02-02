Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64617E7FDC4
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Feb 2026 19:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ngrD9Gt2baUVcelV1xekktbG8w2iSorMYV+yHDW998U=; b=q2EERbCsjb+imf
	9vMSh0qdfO4ojyQR7Pi9Ye1TMdRh0xR4eLsSLTOAy7qUT8hxc1IwaxeCuGx0N0MHajUGTVrvSZZ2g
	AXLAUlJ4O1DC/wuDF2E7VojFkaZFfSrEOlUSv3xSxRPtL4cyRxhHAqEyGKAOCLdnPiAVkuw76VV3W
	Fgghn+UaUSsgsJHlBphl93ztPE5zvTEv2Vjp1fi8iAnj+u6jPW5bMUOCmNSfOTgZsuLiW2huS/BaB
	RdUdU4NQSSj1OkTjlr9LtI+Z8d0yFK5P4ShAc1y/Mrg3ytKwn4NcZUtzuJPZ6PZ2OnUkSCkz/PSME
	8O7AtckI1ezgaFg0Ho+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmzt1-00000005YJu-3tZx;
	Mon, 02 Feb 2026 19:47:03 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmzsy-00000005YIa-2y1E
	for linux-riscv@lists.infradead.org;
	Mon, 02 Feb 2026 19:47:02 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-794d4f11a20so14987817b3.1
        for <linux-riscv@lists.infradead.org>; Mon, 02 Feb 2026 11:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1770061619; x=1770666419; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6HRScxpZBIdFwHbDU0nWkn3kbt9KpCxuv2w1T+YYeTI=;
        b=Ll8bnddBdQxxbBsSYBtI19VDcMSeJaPNTCln1eKQLQcyP/lPTvySsCHbXND+eacucY
         HceWfN3nrDh4VHLl/9/41soeajBmFtwjmiIOTA+TbUmIp0TJz2/VML7FYFuImba/IlQK
         Gt7R7Gaq2HWdl6fyAUmBHvMMR4QAW77e+uDP3L60OkbI2LaeuBvomWp8zvDFpjq6/s5Q
         OpSzXT+R2rAlU9Qu+Jx9m6Gw3wFfM/YPG+V+J9lNk08zoq78YQDfClitf1qqpElE+QvQ
         aHbSPHe6wl2JQBxnaGyY/rHzXXl4yrCZvwCoBVuLYAP5CJzLFxKr4FNo63svBR+I3rAM
         rHMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770061619; x=1770666419;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6HRScxpZBIdFwHbDU0nWkn3kbt9KpCxuv2w1T+YYeTI=;
        b=IgL/Om6KPpFKzZyKkaADh9usWcgBE/Cynjt7TrNd9/utG+cEejREc7yBo323RjgLcI
         9x73LiM/SK+L/xRyqKkpmjWYrupREebpmSYTj5ELpT/mVBK3DBQjSZAGfd/rnJCgZKvl
         ARXGZXUJExeo1Lxq6FHXFvw0CvTmWz6ndiq+YJGF5ByOQj4B4fwhXmpo+0PFVyhVYXTD
         zIF+S7hLKwwYdBoxfjsXmtmHdX+XNDsXyxCNuaeSlaxLXx4vDxjajfACzUn1bopUk06i
         mNsIaFRY4r6dnBKwvddRvvoaOrp94qZ0dVNrt5SaP/D+/do6FV3VCFC6N8lAJjpJIy7d
         NwnA==
X-Gm-Message-State: AOJu0YzAEG40mjcdQfSE1rKjSl7H0IHaSISARz3kXfvNF1BKV7b7cUW4
	9SuqaUY806zQLwdwH98GD8POVbmTzDPWpDdgvFfPsCCxzxEgZwF+wVBYtzd7bGrksHI=
X-Gm-Gg: AZuq6aL+HRWyQxNfFRvA5UxIlgyhdJsIMU+f85mA8A67vxF5flRZWeZVwnTLO1QmhHp
	2sczqJz1O8R/UCwxyx/P1APEfogZjKfbgQJomT9NPW7W8b/2VHw+7nGc39i7a3smoRPepmU7TPk
	CAU/tp18aYGahrrJVcKl7YKZEI+hnfxuci9D9AuZ3rQ6nSbUhaOjc9WiaobLBGukB/TDK05mprP
	dfKGjKqFA8UAxawwSOBVq1k7KE3Ftit1ekd0o4Xpthbr9Mlaz23vQoypUNonKslzo/NJX9CfUt5
	CEpBpDUNiQ3tDGav68pka37yRRaOLGhlaH0+0aHOrwOcj9U7SIweRt6xicKf30GVxtB4p8KDRrO
	znJBIm3890VT0o9FBri4Q90GbwCXyiecY0LbGckhOLaIzh4A9G9lt9uV0j18lCAO5z03oVKiD5g
	7fxR6GypIcKKqDCy50xIx2b2pZ+GfJk9DWxCDsQ+0rCONkXBYv45WJp6l+ZJ80Yoveg+HK6et/
X-Received: by 2002:a05:690c:387:b0:793:a445:c659 with SMTP id 00721157ae682-7949dfa60cfmr105745697b3.44.1770061619467;
        Mon, 02 Feb 2026 11:46:59 -0800 (PST)
Received: from [192.168.5.15] ([50.231.163.162])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-794cd7241c0sm39493667b3.24.2026.02.02.11.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 11:46:59 -0800 (PST)
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Mon, 02 Feb 2026 13:46:49 -0600
Subject: [PATCH v5 1/3] dt-bindings: clk: tenstorrent: Add
 tenstorrent,atlantis-prcm
MIME-Version: 1.0
Message-Id: <20260202-atlantis-clocks-v5-1-0922e43acaba@oss.tenstorrent.com>
References: <20260202-atlantis-clocks-v5-0-0922e43acaba@oss.tenstorrent.com>
In-Reply-To: <20260202-atlantis-clocks-v5-0-0922e43acaba@oss.tenstorrent.com>
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
X-CRM114-CacheID: sfid-20260202_114700_758471_E7D42F64 
X-CRM114-Status: GOOD (  14.27  )
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
and resets. This block is instantiated multiple times in the SoC.
This commit documents the clocks from the RCPU PRCM block.

Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
---
 .../bindings/clock/tenstorrent,atlantis-prcm.yaml  |  54 +++++++++++
 MAINTAINERS                                        |   2 +
 .../dt-bindings/clock/tenstorrent,atlantis-prcm.h  | 103 +++++++++++++++++++++
 3 files changed, 159 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/tenstorrent,atlantis-prcm.yaml b/Documentation/devicetree/bindings/clock/tenstorrent,atlantis-prcm.yaml
new file mode 100644
index 000000000000..0f3e18f5ea1a
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/tenstorrent,atlantis-prcm.yaml
@@ -0,0 +1,54 @@
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
+  subsystem. RCPU prcm serves low speed IO interfaces.
+
+properties:
+  compatible:
+    enum:
+      - tenstorrent,atlantis-prcm-rcpu
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
+required:
+  - compatible
+  - reg
+  - clocks
+  - "#clock-cells"
+  - "#reset-cells"
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
