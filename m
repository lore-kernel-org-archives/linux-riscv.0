Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37C95D6CFAA
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 22:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mrZityX6nGcQrFc7FlaTez1PPaULUKxga6qH03/Mr+A=; b=tZ9zu9q807ZEBu
	bRL9+7SkROmOPgU4WR0DFBzjrEU/lsla50kgWDVMYOCGNgX4Xnt6fnXhSD4QhkIuvu4FumqsQCJp8
	BMrorOhy82LplypCsrGuDHvQ9U9rzEKj51V8ncpG78ncnJ9pf5rrW+ZryAVT6ozch4OLXSflX4xQI
	NvdVxoNf3EspNa1o5NsjKrfmlls4kRVEwZkIDUSqLuELUHDTlo7cW04LMgEZGoXvF4+VjUeD2sIq5
	2BZLVfJs4rXPYyg8ruIEK30USLBH9y0V3uZpq3vdEIMc7nTW/dXuudEE9ttPr00X60JWBOAOZ49MS
	Q7By5Fx6f/FISoF3gxiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj3Ie-00000007qnM-0FFd;
	Thu, 22 Jan 2026 22:37:12 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj3Ib-00000007qlj-2EUB
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 22:37:10 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-79430ef54c3so11634237b3.2
        for <linux-riscv@lists.infradead.org>; Thu, 22 Jan 2026 14:37:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1769121428; x=1769726228; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jy1u4d8feAZPBgF+/xH/YbvlGqaa/pPappPh2V1R7Jg=;
        b=RUsIq2afv03ne2y6S9SgFNTxlGhXPGLGX+QwP66ju67wB1+Dsz9LP+HK60v99ngsW/
         1b2fVqXtEdrEPPtundIR5jSsFTQEKXvanyjRgZfEhIPWxIEhRNnG2eFNl+hUXmAnu8Yz
         yR1dEpeZwgsS5AW69GI/QBGRVyFB7UnIFAveP1gOJ2RBmW6f3C2SKLS3ULpAAL93VCTW
         GeQ/Ofqiycdn/Eft9/7NQakzvgjFBWYjDpsTJ4FiMTRMACJNNIJFYcRjwqPN60xNT+kJ
         OLt/2y1J2dahGR5rkNiCkXHs7KKwwFIjKB37PNRQJyiyhejrSzyFQ/LIILpqMAzZXzDt
         nz2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769121428; x=1769726228;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Jy1u4d8feAZPBgF+/xH/YbvlGqaa/pPappPh2V1R7Jg=;
        b=cXZu+ND3R9YTP0dp7fLVbcYNxl6pf4l6xM592DQ69zrAxWHDfJWGpPAn/Z+p/jqOWo
         etyFhzcjOzgxj0Tc+RmaTBK6xcNHz2OXeRpWDHS/7vvTdP0GSS/t0eZneVNsNaySC0WJ
         G+avkhEWPBYSMCX4udovOVOqUaXBvnihsSo2NPMMZR7dN+lwlk8qH2rzyOW2S07N16UR
         RKbYGTevl0YS8DxEbYBFu19zdI6rJuijcat+ezK5EgGu7q2LO3fVgXV4+qV8+f8pYkKj
         7vXaegR4R8Zw0tKXfNzC/ktXjDdGa2uC8VyLGdvYIa+biUKqY50KeS7eceL07dqhRr1K
         BFNA==
X-Gm-Message-State: AOJu0YzBOnde1j0hrqi+goxGSS/EuWFzizH5dzFTc1uN7g8qr01piTw+
	8UlGTUZ+70xNBkWxlxda3bBlHQgPDu2yjKoOqcEW5AnPPXvO09nnJpQaqclDC2NVu84=
X-Gm-Gg: AZuq6aJmFjHA3jP9avCOGDxunrk0Wuhp/yLG4e0Zxr8yEaTiRp92+qThQauTjzCQITL
	ymV5agr96T2i654L+XyWNxsdsWG0vbcTyw/YPTmZp7saVNZ/9TjsRv7+ELaJM7R130nw53BAWT6
	QYeex93D0Gb4fj7RKmDXBA8q71NpeijKqdoegkCq9PbayYJRGn6Hmx7HrvgSUve9uXGvwEvC7hp
	1R0Bd/PdDzEfCa59bQCMyIkTOlBOzATyOzIL4xf0Ob2mX3MQlSHxRShwzm7ntvajn0I1m6o5cTI
	N6xH9o83kcAEYTA/AjgSKIiJAjq6WlKr6PG63O3YOfC34a18O0UeYKw3gzryAoqy73FsQ/iEbq4
	Di2rbphA4GTQRlvyk6oEX3nP1uRaEL3+r4WGJ9KgQPmKo3o/YXrpjktAjYoxOferxhhWNZrZSIW
	ToWwKt0iA6JERJuyFRCjlHEkU1HzRCyhW27+iEhY4HQJFkn2mhSmykCPq1xWs/GcnfArJJ7tydt
	8ugdrKSjQ==
X-Received: by 2002:a05:690c:c50c:b0:794:3cb7:80fe with SMTP id 00721157ae682-7943cb78460mr470627b3.20.1769121428408;
        Thu, 22 Jan 2026 14:37:08 -0800 (PST)
Received: from [192.168.5.15] ([68.95.197.245])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7943b01b09csm2766167b3.15.2026.01.22.14.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 14:37:08 -0800 (PST)
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Thu, 22 Jan 2026 16:36:37 -0600
Subject: [PATCH v2 1/3] dt-bindings: soc: tenstorrent: Add
 tenstorrent,atlantis-syscon
MIME-Version: 1.0
Message-Id: <20260122-atlantis-clocks-v2-1-c66371639e66@oss.tenstorrent.com>
References: <20260122-atlantis-clocks-v2-0-c66371639e66@oss.tenstorrent.com>
In-Reply-To: <20260122-atlantis-clocks-v2-0-c66371639e66@oss.tenstorrent.com>
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
X-CRM114-CacheID: sfid-20260122_143709_590864_2FE0E1E4 
X-CRM114-Status: GOOD (  14.50  )
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

Document bindings for Tenstorrent Atlantis syscon that manages clocks
and resets. This syscon block is instantiated 4 times in the SoC.
This commit documents the clocks from the RCPU syscon block.

Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
---
 .../tenstorrent/tenstorrent,atlantis-syscon.yaml   |  90 ++++++++++++++++++
 MAINTAINERS                                        |   2 +
 .../clock/tenstorrent,atlantis-syscon.h            | 101 +++++++++++++++++++++
 3 files changed, 193 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/tenstorrent/tenstorrent,atlantis-syscon.yaml b/Documentation/devicetree/bindings/soc/tenstorrent/tenstorrent,atlantis-syscon.yaml
new file mode 100644
index 000000000000..49fbe2423be0
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/tenstorrent/tenstorrent,atlantis-syscon.yaml
@@ -0,0 +1,90 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/tenstorrent/tenstorrent,atlantis-syscon.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Tenstorrent Atlantis SoC Syscon
+
+maintainers:
+  - Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
+
+description:
+  Multifunctional register block found in Tenstorrent Atlantis SoC whose main function
+  is to control clocks and resets. This Block is instantiated multiple times in the SoC,
+  each block controls clock and resets for a different subsystem.
+
+  RCPU syscon serves low speed IO interfaces on chip
+  PCIe syscon serves all PCIe related functions
+  HSIO syscon serves high speed IO interfaces (Ethernet, USB)
+  MM syscon serves GPU, display and video processing functions
+
+properties:
+  compatible:
+    enum:
+      - tenstorrent,atlantis-syscon-rcpu
+      - tenstorrent,atlantis-syscon-pcie
+      - tenstorrent,atlantis-syscon-mm
+      - tenstorrent,atlantis-syscon-hsio
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
+      See <dt-bindings/clock/tenstorrent,atlantis-syscon.h> for valid indices.
+
+  "#reset-cells":
+    const: 1
+
+  tenstorrent,syscon-rcpu:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle reference to RCPU syscon, needed by other 3 syscons (PCIe, MM, HSIO)
+      as the control registers for the PLLs that drive these subsystems are in RCPU
+      syscon's range
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
+              - tenstorrent,atlantis-syscon-pcie
+              - tenstorrent,atlantis-syscon-mm
+              - tenstorrent,atlantis-syscon-hsio
+    then:
+      required:
+        - tenstorrent,syscon-rcpu
+
+additionalProperties: false
+
+examples:
+  - |
+    syscon_rcpu: system-controller@a8000000 {
+      compatible = "tenstorrent,atlantis-syscon-rcpu";
+      reg = <0xa8000000 0x10000>;
+      clocks = <&osc_24m>;
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+    };
+  - |
+    syscon_hsio: system-controller@e00c0000 {
+      compatible = "tenstorrent,atlantis-syscon-hsio";
+      reg = <0xe00c0000 0x500>;
+      clocks = <&osc_24m>;
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      tenstorrent,syscon-rcpu = <&syscon_rcpu>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index dc731d37c8fe..19a98b1fa456 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22535,7 +22535,9 @@ L:	linux-riscv@lists.infradead.org
 S:	Maintained
 T:	git https://github.com/tenstorrent/linux.git
 F:	Documentation/devicetree/bindings/riscv/tenstorrent.yaml
+F:	Documentation/devicetree/bindings/soc/tenstorrent/tenstorrent,atlantis-syscon.yaml
 F:	arch/riscv/boot/dts/tenstorrent/
+F:	include/dt-bindings/clock/tenstorrent,atlantis-syscon.h
 
 RISC-V THEAD SoC SUPPORT
 M:	Drew Fustini <fustini@kernel.org>
diff --git a/include/dt-bindings/clock/tenstorrent,atlantis-syscon.h b/include/dt-bindings/clock/tenstorrent,atlantis-syscon.h
new file mode 100644
index 000000000000..053cef2b43c8
--- /dev/null
+++ b/include/dt-bindings/clock/tenstorrent,atlantis-syscon.h
@@ -0,0 +1,101 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2026 Tenstorrent
+ */
+
+#ifndef _DT_BINDINGS_ATLANTIS_SYSCON_H
+#define _DT_BINDINGS_ATLANTIS_SYSCON_H
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
+#endif /* _DT_BINDINGS_ATLANTIS_SYSCON_H */

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
