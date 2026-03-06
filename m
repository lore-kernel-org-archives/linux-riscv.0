Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE09EFCB637
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Mar 2026 17:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QdX1KBCQoOg8GyTJWxDMTbSiLVoOewfRnHFywZAlnIo=; b=yKCzXGGQSHlxtd
	ff81mXJh16JDVbKk6AIfYsz6nuzpc/Hh1CrKOgYPJWvg52saNC833WJaxbMe9h1T8q+ZNkaCGx8Yk
	yyk+clu7zuxAqYU0Avc3WjZSU8RF7vXareZrHrYYWJXbrc9bHT+wuukwn37XsGJ0MWEmeZ2wAXVV/
	PM9pCXTANwUiGtviYx5Q94mtMO5vN6X8HAGQzmJnzX76CSk7gAKkjgAyXSN+TwR4rzP4uGT1jO2en
	A28BgMu8ZummXf0GBBFoCFxQPaszPQH4uw+9Ioq8mytl5RVNje2Aw5Ba0goyEBTJmeoM0pGmIVWXb
	LxFTINzIYsjXA6as2ieA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyYj8-00000004FMb-13rO;
	Fri, 06 Mar 2026 17:12:38 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyYj4-00000004FKu-21kd
	for linux-riscv@lists.infradead.org;
	Fri, 06 Mar 2026 17:12:35 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-79801df3e21so87186057b3.2
        for <linux-riscv@lists.infradead.org>; Fri, 06 Mar 2026 09:12:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1772817153; x=1773421953; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0HaqjdpdHc/fQbEY4OtrbjxxM+K8US2OS03rxWtvBv4=;
        b=CN3XMZBpP6B1WZ+VCY+9rIltzBzW6WNxOgR6Pw4UBmcFuHb5hQZCI9KZKN32PlaJKg
         q+ZrqH6E/AnFqIA9zFoHrXawB2wdJ6O9wiKWV4waTlvvlHyjyUNRHLxKQ1CDl04VU1ge
         480FKwR6Brr+eNqL8ZGrj+DD7enZP7iSL2RycIGHIH1G/PzSNB3lISQegZ4JkfFOxbmP
         9mBe+4oyXYX64XYBVJ5hMZtCWlRsEyW9bSWPNVFJEAHWKpM3Jf8z1jITxR7O4hUsaDG/
         gikQGwy3SNHR2w1I+9TgI7tySJUFGUcUhEBE3uSpoPAA3VIQ8s/8SL7GynBlG2Hl3716
         elBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772817153; x=1773421953;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0HaqjdpdHc/fQbEY4OtrbjxxM+K8US2OS03rxWtvBv4=;
        b=G97tm2B8FMTGJkx3ITslRiWEalNFT1bW/gF6vYkQumXXLGMv3+wywYAR6eijjpyks2
         fz54TCkt17MZCiUdxpppROl0Xi4M54CDgmB96WPoCysa96jEZyQ/ppP4Cu0N9Agy+R/P
         Q5wq7ZDUrqzl9/QWuxzYSvodMqhjQdqtda5daU6Mmkgq3K1fqjQvgO66ro7bfyl+tv8V
         X/4uE21X/tiy0HWf49Q6t1vd2x1IYK/Ej2qX7X9Zk/XFoPZvy9+9+3blNRSKTGkSliZm
         eeJSeo2BMJApJI2tHr6wAd2kf8ZoARmd+dkR8A3ZWIm6r/ui6NfYK16dXNasEfdQiPyc
         +0Bg==
X-Gm-Message-State: AOJu0YwsttBuFGjOGnUO4aD05g06l2qE1eknsdehDfvFBpK3H0X9MDhx
	3cFOhCjRx9NetQMcuFf7qya3ssd8nwRK6CZTj7rZN/zsg5stoshycZxyOFCnk6H4miw=
X-Gm-Gg: ATEYQzx4pWPwYKYKeoW2pcM+kWkDXuXOPMJfu3ggnL/NrKuJfVpAor/IxlORpj9ZmQ/
	wGWhzogE7NnvcdI6ZohrnQz/fTSREbrHYmB/nVmqZ/EiSHmw6CdtDlxcCppWx+Wk2nIWmG2qhyb
	kEeDOAjQT/DPYr9/Ok9NR8vKy4E77sYM7K6sQMOmp7Hgn8xzdCJnQGTj0/RPVeCgOyDqC0C2682
	pau8XTfSu5xW/omWn5lijhFM/3qeKy43OM75Sg6O5gS0KfjUq6vB9odod9WcaPjf68OxgUtrKXQ
	U9cA8ec1AryQli1+IDX3o+04y8TsPse9dZofBatUi+0ZG0dp/ayxpefnkqq6fSxBYm+o3wpTX0V
	C/4B1MhJQPFP4TD6uAX4Uquvd16qLTQoj9Lq1aBd1qAgQph0nZsC1AIjZrQ/UuYDaandYXfoUmv
	AM1IGMOXkIXZeANNpOM8cPse3Fdm4LmGV77kPMtFUNO8wSiehDRlcxUZa3uz/06DBvH5cJF7VD7
	5b368uYd1Y=
X-Received: by 2002:a05:690c:450e:b0:798:1637:ff0e with SMTP id 00721157ae682-798dd6b047amr28584697b3.22.1772817153174;
        Fri, 06 Mar 2026 09:12:33 -0800 (PST)
Received: from [192.168.5.15] ([68.95.197.245])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-798ded769ecsm9331237b3.23.2026.03.06.09.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 09:12:32 -0800 (PST)
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Fri, 06 Mar 2026 11:12:17 -0600
Subject: [PATCH v8 1/3] dt-bindings: clk: tenstorrent: Add
 tenstorrent,atlantis-prcm-rcpu
MIME-Version: 1.0
Message-Id: <20260306-atlantis-clocks-v8-1-6c9b14a4aa8e@oss.tenstorrent.com>
References: <20260306-atlantis-clocks-v8-0-6c9b14a4aa8e@oss.tenstorrent.com>
In-Reply-To: <20260306-atlantis-clocks-v8-0-6c9b14a4aa8e@oss.tenstorrent.com>
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
 bmasney@redhat.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_091234_542073_9C39BEA5 
X-CRM114-Status: GOOD (  13.50  )
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

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
---
 .../clock/tenstorrent,atlantis-prcm-rcpu.yaml      |  54 +++++++++++
 MAINTAINERS                                        |   2 +
 .../clock/tenstorrent,atlantis-prcm-rcpu.h         | 103 +++++++++++++++++++++
 3 files changed, 159 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/tenstorrent,atlantis-prcm-rcpu.yaml b/Documentation/devicetree/bindings/clock/tenstorrent,atlantis-prcm-rcpu.yaml
new file mode 100644
index 000000000000..7fa16526efce
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/tenstorrent,atlantis-prcm-rcpu.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/tenstorrent,atlantis-prcm-rcpu.yaml#
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
+      See <dt-bindings/clock/tenstorrent,atlantis-prcm-rcpu.h> for valid indices.
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
index 55af015174a5..40c179c8de1e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22809,8 +22809,10 @@ M:	Joel Stanley <jms@oss.tenstorrent.com>
 L:	linux-riscv@lists.infradead.org
 S:	Maintained
 T:	git https://github.com/tenstorrent/linux.git
+F:	Documentation/devicetree/bindings/clock/tenstorrent,atlantis-prcm-rcpu.yaml
 F:	Documentation/devicetree/bindings/riscv/tenstorrent.yaml
 F:	arch/riscv/boot/dts/tenstorrent/
+F:	include/dt-bindings/clock/tenstorrent,atlantis-prcm-rcpu.h
 
 RISC-V THEAD SoC SUPPORT
 M:	Drew Fustini <fustini@kernel.org>
diff --git a/include/dt-bindings/clock/tenstorrent,atlantis-prcm-rcpu.h b/include/dt-bindings/clock/tenstorrent,atlantis-prcm-rcpu.h
new file mode 100644
index 000000000000..c1c875e016f8
--- /dev/null
+++ b/include/dt-bindings/clock/tenstorrent,atlantis-prcm-rcpu.h
@@ -0,0 +1,103 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Tenstorrent Atlantis PRCM Clock and Reset Indices
+ *
+ * Copyright (c) 2026 Tenstorrent
+ */
+
+#ifndef _DT_BINDINGS_ATLANTIS_PRCM_RCPU_H
+#define _DT_BINDINGS_ATLANTIS_PRCM_RCPU_H
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
+#endif /* _DT_BINDINGS_ATLANTIS_PRCM_RCPU_H */

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
