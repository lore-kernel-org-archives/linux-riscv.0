Return-Path: <SRS0=J7tQ=FR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D08CC4361B
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Dec 2020 13:51:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED34C222B6
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Dec 2020 13:51:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED34C222B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sHYIfoGRpz4H1AuIabEuNXkLNm8IgQghLAtxO2zfPdY=; b=Y5Z2nKRYLy2eirdL8J+pvTlkq
	sW2hh1CqRxJCV4pF7RwCtuICf9HrEUvfI90JI3a6DCzoYyly6oIAVbEA87p15geclwyoaS0YB2a8T
	F5ifBivPkJmCcSqGEpcVoT3byIKIhAjIy6CibPRl3Y4tvFHWg05TXuBoI83OKcxonEvVSkhlfs2RW
	XyznkiKT8wMHEnhWRQ3x1RmkG5UFAQdLQ9gRZQ0FFCaj8wZrugsZ+q4KOJNLXfDIdAmsYpgD+KCg6
	uXUlxLk0Qt2IHlwhOfKHWrBz69uLzBJjHifK1b+RRgZGPx4/w+MKpjqZTEnpjKZA6eML4XBH2JN/O
	asnrxTs8w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1koRmW-0000Ho-KQ; Sun, 13 Dec 2020 13:51:25 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1koRmT-0000F8-2A
 for linux-riscv@lists.infradead.org; Sun, 13 Dec 2020 13:51:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607867481; x=1639403481;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=O5a5XMfXL/EMdhk8PWFeJMOXMqu3c4qCzL2yRbbsrpo=;
 b=i+oNzbBG85s2HQ1TvKNfLZiCyHU2c51yCL1qr/RcR5f9y+JEUtijJnDL
 2dVT40Y+qTG/nShCgm7aWF1TcHp++mjDd1TKJTtkfYT+JZJaRSDtCg+vQ
 P6SUzOFaRvbaXrVBok0lImiygalbXB0AegH6KP8VAexGcNRvn19KbfvN1
 k49y3mUe7hx2XtEU+6Tzti3WQ5KZw8p9oW/PzPESs+ptT7jUyJRBX1cMX
 bAtPAMuSGjC0gK+/H/QfyPIrjrEbj5KCerweL21jjVK95RLZn3tjocXjp
 ZlLbGDDYBuLqKwOuqXJ4FfHg0R4XstabNMQkJdoIHmUpQzWdeyjEQ3B0G g==;
IronPort-SDR: tCO6afhYIuw/D+u6cXJERPikeDSPfeBhHK5gUWHJZ/be0vf+GWaZJCQCHpOQwtWqYnjgFdLMrJ
 Z9hyrSgV4LPADbjdRHFiCsfcjvJlwyoPPPdBzMJ6rYKnyk52Gdqx35Nx3r8x9kePVelz071Bxb
 6Tbpa/opfo4Bz5wG+o9Kgj5yituBPRTelbayrAysXUsBoPgZwOAq3dOrxtdpXyh3Ja8+1EIO98
 kaPhPWBgLuFUNWs4XmDiIeHFNuTdW29yj2Q4EeKzRNxCQdiAqQUl3dBbzh08exL/ii2NSsAT0a
 GHw=
X-IronPort-AV: E=Sophos;i="5.78,416,1599494400"; d="scan'208";a="156242574"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 13 Dec 2020 21:51:21 +0800
IronPort-SDR: aj2iHRBlrrfBrhY9cRZD0+ygMRiAWyVVwTW02Iw7eYGf6/rHYoRef/gkUSDQNculhQqnQDVj6b
 7YhCElC3sP7HEFFzoXvedDXgbPljZhLE5nKZj8ebqTx+DIKPv7IWtWi4W4EzG6FvxQv9TlFhlu
 vmZkAJui1YMnGsipcbGe70o6MCiPniMDpW17fmUc4MBuxc8F1baTU3tfKHS0BFfAAJ05tJhtg6
 BqQQmQJUavgOhFiRSgQfk1NOwnYFuPu6JXGkPmXx0REWE6dd5exf4XJFVTdAk4XEPfRWbApD9B
 +Hps4jR4QS4L9w3m8PstMb0M
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2020 05:35:06 -0800
IronPort-SDR: owmm+ip6FrVtrDCKHr9XRw5yf+y+HQPxDArbvq4hjcjQgBVNSuWNvOQUoatanC35iLmJlqRIVf
 Z1TYJGQVyoW1UIJYGM1Xlgnw5mCYZMvDsSb7DytrzqHy/xX+wXjP37bKKQwq7Ds5KWBpA+ECRR
 sNGYDDjoemVguEPuWk1lG7aEIkzYQQ8d9HMxq8pfTsvmpXQuEt8Lkokj7Obo+uNEKPKv+wmT/6
 AueR5cJ7/dU+ZPDGT+zCnrZaVJTzn0+alCqSCIVqbt+SltoV6v3EZrb+S/NJoPvWihXGw4Vam3
 h1E=
WDCIronportException: Internal
Received: from phd004806.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.197])
 by uls-op-cesaip01.wdc.com with ESMTP; 13 Dec 2020 05:51:18 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v10 10/23] dt-bindings: reset: Document canaan,
 k210-rst bindings
Date: Sun, 13 Dec 2020 22:50:43 +0900
Message-Id: <20201213135056.24446-11-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201213135056.24446-1-damien.lemoal@wdc.com>
References: <20201213135056.24446-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201213_085121_272908_34CE95E5 
X-CRM114-Status: GOOD (  17.06  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Sean Anderson <seanga2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Document the device tree bindings for the Canaan Kendryte K210 SoC
reset controller driver in
Documentation/devicetree/bindings/reset/canaan,k210-rst.yaml. The header
file include/dt-bindings/reset/k210-rst.h is added to define all
possible reset lines of the SoC.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/reset/canaan,k210-rst.yaml       | 40 ++++++++++++++++++
 include/dt-bindings/reset/k210-rst.h          | 42 +++++++++++++++++++
 2 files changed, 82 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/canaan,k210-rst.yaml
 create mode 100644 include/dt-bindings/reset/k210-rst.h

diff --git a/Documentation/devicetree/bindings/reset/canaan,k210-rst.yaml b/Documentation/devicetree/bindings/reset/canaan,k210-rst.yaml
new file mode 100644
index 000000000000..53e4ede9c0bd
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/canaan,k210-rst.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reset/canaan,k210-rst.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Canaan Kendryte K210 Reset Controller Device Tree Bindings
+
+maintainers:
+  - Damien Le Moal <damien.lemoal@wdc.com>
+
+description: |
+  Canaan Kendryte K210 reset controller driver which supports the SoC
+  system controller supplied reset registers for the various peripherals
+  of the SoC. The K210 reset controller node must be defined as a child
+  node of the K210 system controller node.
+
+  See also:
+  - dt-bindings/reset/k210-rst.h
+
+properties:
+  compatible:
+    const: canaan,k210-rst
+
+  '#reset-cells':
+    const: 1
+
+required:
+  - '#reset-cells'
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/reset/k210-rst.h>
+    sysrst: reset-controller {
+      compatible = "canaan,k210-rst";
+      #reset-cells = <1>;
+    };
diff --git a/include/dt-bindings/reset/k210-rst.h b/include/dt-bindings/reset/k210-rst.h
new file mode 100644
index 000000000000..883c1aed50e8
--- /dev/null
+++ b/include/dt-bindings/reset/k210-rst.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright (C) 2019 Sean Anderson <seanga2@gmail.com>
+ * Copyright (c) 2020 Western Digital Corporation or its affiliates.
+ */
+#ifndef RESET_K210_SYSCTL_H
+#define RESET_K210_SYSCTL_H
+
+/*
+ * Kendryte K210 SoC system controller K210_SYSCTL_SOFT_RESET register bits.
+ * Taken from Kendryte SDK (kendryte-standalone-sdk).
+ */
+#define K210_RST_ROM	0
+#define K210_RST_DMA	1
+#define K210_RST_AI	2
+#define K210_RST_DVP	3
+#define K210_RST_FFT	4
+#define K210_RST_GPIO	5
+#define K210_RST_SPI0	6
+#define K210_RST_SPI1	7
+#define K210_RST_SPI2	8
+#define K210_RST_SPI3	9
+#define K210_RST_I2S0	10
+#define K210_RST_I2S1	11
+#define K210_RST_I2S2	12
+#define K210_RST_I2C0	13
+#define K210_RST_I2C1	14
+#define K210_RST_I2C2	15
+#define K210_RST_UART1	16
+#define K210_RST_UART2	17
+#define K210_RST_UART3	18
+#define K210_RST_AES	19
+#define K210_RST_FPIOA	20
+#define K210_RST_TIMER0	21
+#define K210_RST_TIMER1	22
+#define K210_RST_TIMER2	23
+#define K210_RST_WDT0	24
+#define K210_RST_WDT1	25
+#define K210_RST_SHA	26
+#define K210_RST_RTC	29
+
+#endif /* RESET_K210_SYSCTL_H */
-- 
2.29.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
