Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9B5DCF9C71
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Sep 2024 06:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JDgVu0S3KpgF6G2y6r1RDhiJ+Zc1nEyzzpAOlfCJA1E=; b=W0VIzVCH3AjUXI
	QiDkpRHCgGPkO5r3/o+onY/bJhZp+bxASvGWQWBeAbbhufhKezAMfDmvuwnGNiletwAFIZXM1t1mJ
	re9KUL1NH9NroimOVPa1O/dDyZN8z6Tvl+xKWDd31h/Ixshk68nrdMoC9w5DSH5kcDTaMitQYUBsX
	bceBOMtTrQYqSpEMWgAkJ5JvdT4OV2Q4MnAvb+qT9rq867f+dnyHZS7qa3jq+rzGLGwwZ+iKrnuDp
	RFRH2b1l/f8vSA1613dnrO6TWx6wWzmfbQLdjjWDDjwU/qEIXuMzqZs1Lg0xc7Rmyaga6EbztlR0j
	arar/pAoRbddji3mgw7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ssyfh-00000001AdV-4103;
	Tue, 24 Sep 2024 06:05:13 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ssyff-00000001Acb-29Rb
	for linux-riscv@lists.infradead.org;
	Tue, 24 Sep 2024 06:05:13 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-2dee71e47c5so1806916a91.0
        for <linux-riscv@lists.infradead.org>; Mon, 23 Sep 2024 23:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727157910; x=1727762710; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mz3nKts0utmgs04ieZ/p598fLVtnPylqw2MjQFSirMk=;
        b=R+C6QgnUZxhi5KD0rwafHOEsYifxBjcbIQRSz9E4fjlkMWPfrcNkyRbKE45mpIUKJU
         oyixmiGCVtThf0eKXKiNRAIiwg1QfZjlzG9l+I0KpvDigRXGG9p9YaNcSUMcwqMyBlye
         nQXHYxX7sV8Z1gFZu51q5466OwTQTqGh35AiesupOkMlVmCUFXJG113ySwoY7pcqPnSi
         RyWOZ+evwo3sLqFVF2MxECcA040v9+Zx9sLkwykpXby8wUcn9GRw03VKy9vU06VH0RQy
         tFEaJzCH7SlP8lb9Jbn0/sKQMahI1D/fh2/rxU4YRlfW5fGjVYGbKRbSP52oot14qoXo
         eFLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727157910; x=1727762710;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mz3nKts0utmgs04ieZ/p598fLVtnPylqw2MjQFSirMk=;
        b=p4zEIwuTc91jReWicdoxE7CME4iZBilD1Ja/z17tEX4gAY1bc+Im2tWEwV5VTxvNhy
         M7K0ZL13bCfWw3Y1GJp5EdVq47QNQyxKjjPQoqMHqSCkvO8sbh1My/dr/tKHbchi/jGA
         gEFKohzgSNb8J5jghs8D1cAw8sz72hQyDhTyxzCglOJt8bpej3u1ubcZy/UiHKsRxCXo
         5bN49HKGQuvh3brAb9aaIEAFtZkQNe7Tlzqc0Dc89Lc1lFELHpoVzBCFPWRGfIade4R1
         3HWv2NTzl+61aniqkJD2CmF/iHHEQKNJIwnyvRxGEGVxoUg7ktK2adOEjHVTvtUNlBa7
         6qwA==
X-Forwarded-Encrypted: i=1; AJvYcCW+68b0cXYwH4mqZbAa6Hm21PW9L0kk/6dC9gwiMu/+zrGbPr1EOSHEIGGzRPXjsnysVDtbrHcNZkyPMw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwCQ0qmm6eEgNf5nvKNaR/+vj0mD6LRcv3aIFS/RvTEXuZGbGtX
	PZAUHlQCJAd97VmPkmejtvQHD3794WA2LbCxTF/wJB+vAhXrB648Rb6xScZ5
X-Google-Smtp-Source: AGHT+IHEs5JTbd4Uy1AB7v5TYcvGJHt0D51ZNLLFLBKASZdOZKuuLvZv6oT6qTCDrvsfz5Vq/NGhBw==
X-Received: by 2002:a17:90a:fe8b:b0:2cf:f3e9:d5c8 with SMTP id 98e67ed59e1d1-2dd80c9662dmr17655048a91.31.1727157909895;
        Mon, 23 Sep 2024 23:05:09 -0700 (PDT)
Received: from localhost ([188.253.115.253])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e05904a314sm632095a91.54.2024.09.23.23.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2024 23:05:09 -0700 (PDT)
From: Junhui Liu <liujh2818@gmail.com>
X-Google-Original-From: Junhui Liu <liujh2818@outlook.com>
Date: Tue, 24 Sep 2024 14:00:40 +0800
Subject: [PATCH 1/2] dt-bindings: reset: Add support for canaan,k230-rst
MIME-Version: 1.0
Message-Id: <20240924-k230-reset-v1-1-d0cdc11989eb@outlook.com>
References: <20240924-k230-reset-v1-0-d0cdc11989eb@outlook.com>
In-Reply-To: <20240924-k230-reset-v1-0-d0cdc11989eb@outlook.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Junhui Liu <liujh2818@outlook.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727157904; l=4188;
 i=liujh2818@outlook.com; s=20240831; h=from:subject:message-id;
 bh=7fBWxyB98XXovcKl78F8c4WOs4siCf6giYXUMRNF5yk=;
 b=RkZHstqExAXr2yLqjQiqAiWnrpe7I3Nnyar3ZPDYw2XZRAGTcqJluSjV83DbzF0RZ9jYbjkIi
 durMfCI1CCNB5tUlv/+aJPseRabHn0bhBnbeoJz4D0W/MRzsFrpJhTz
X-Developer-Key: i=liujh2818@outlook.com; a=ed25519;
 pk=UPJ4WEhX1Oe+1ABSe4UlisQyfljdECO+XeTLv1VxTuY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240923_230511_598674_335D75C4 
X-CRM114-Status: GOOD (  13.24  )
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

From: Junhui Liu <liujh2818@outlook.com>

Introduces a reset controller driver for the Kendryte K230 SoC,
resposible for managing the reset functionality of the CPUs and
various sub-modules.

Signed-off-by: Junhui Liu <liujh2818@outlook.com>
---
 .../devicetree/bindings/reset/canaan,k230-rst.yaml | 39 ++++++++++
 include/dt-bindings/reset/canaan,k230-rst.h        | 90 ++++++++++++++++++++++
 2 files changed, 129 insertions(+)

diff --git a/Documentation/devicetree/bindings/reset/canaan,k230-rst.yaml b/Documentation/devicetree/bindings/reset/canaan,k230-rst.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..ede02dd01ee53a6e20e3387dec51a34e685aa0e1
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/canaan,k230-rst.yaml
@@ -0,0 +1,39 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reset/canaan,k230-rst.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Canaan Kendryte K230 Reset Controller
+
+maintainers:
+  - Junhui Liu <liujh2818@outlook.com>
+
+description:
+  The Canaan Kendryte K230 reset controller is part of the SoC's system
+  controller and controls the reset registers for CPUs and various peripherals.
+
+properties:
+  compatible:
+    const: canaan,k230-rst
+
+  reg:
+    maxItems: 1
+
+  '#reset-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - '#reset-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    reset-controller@91101000 {
+      compatible = "canaan,k230-rst";
+      reg = <0x91101000 0x1000>;
+      #reset-cells = <1>;
+    };
diff --git a/include/dt-bindings/reset/canaan,k230-rst.h b/include/dt-bindings/reset/canaan,k230-rst.h
new file mode 100644
index 0000000000000000000000000000000000000000..5960705636fbab70859624437862bf06d7fb65cd
--- /dev/null
+++ b/include/dt-bindings/reset/canaan,k230-rst.h
@@ -0,0 +1,90 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2023-2024 Canaan Bright Sight Co., Ltd
+ * Copyright (C) 2024 Junhui Liu <liujh2818@outlook.com>
+ */
+#ifndef _DT_BINDINGS_CANAAN_K230_RST_H_
+#define _DT_BINDINGS_CANAAN_K230_RST_H_
+
+#define RST_CPU0		0
+#define RST_CPU1		1
+#define RST_CPU0_FLUSH		2
+#define RST_CPU1_FLUSH		3
+#define RST_AI			4
+#define RST_VPU			5
+#define RST_HS			6
+#define RST_HS_AHB		7
+#define RST_SDIO0		8
+#define RST_SDIO1		9
+#define RST_SDIO_AXI		10
+#define RST_USB0		11
+#define RST_USB1		12
+#define RST_USB0_AHB		13
+#define RST_USB1_AHB		14
+#define RST_SPI0		15
+#define RST_SPI1		16
+#define RST_SPI2		17
+#define RST_SEC			18
+#define RST_PDMA		19
+#define RST_SDMA		20
+#define RST_DECOMPRESS		21
+#define RST_SRAM		22
+#define RST_SHRM_AXIM		23
+#define RST_SHRM_AXIS		24
+#define RST_NONAI2D		25
+#define RST_MCTL		26
+#define RST_ISP			27
+#define RST_ISP_DW		28
+#define RST_DPU			29
+#define RST_DISP		30
+#define RST_GPU			31
+#define RST_AUDIO		32
+#define RST_TIMER0		33
+#define RST_TIMER1		34
+#define RST_TIMER2		35
+#define RST_TIMER3		36
+#define RST_TIMER4		37
+#define RST_TIMER5		38
+#define RST_TIMER_APB		39
+#define RST_HDI			40
+#define RST_WDT0		41
+#define RST_WDT1		42
+#define RST_WDT0_APB		43
+#define RST_WDT1_APB		44
+#define RST_TS_APB		45
+#define RST_MAILBOX		46
+#define RST_STC			47
+#define RST_PMU			48
+#define RST_LS_APB		49
+#define RST_UART0		50
+#define RST_UART1		51
+#define RST_UART2		52
+#define RST_UART3		53
+#define RST_UART4		54
+#define RST_I2C0		55
+#define RST_I2C1		56
+#define RST_I2C2		57
+#define RST_I2C3		58
+#define RST_I2C4		59
+#define RST_JAMLINK0_APB	60
+#define RST_JAMLINK1_APB	61
+#define RST_JAMLINK2_APB	62
+#define RST_JAMLINK3_APB	63
+#define RST_CODEC_APB		64
+#define RST_GPIO_DB		65
+#define RST_GPIO_APB		66
+#define RST_ADC			67
+#define RST_ADC_APB		68
+#define RST_PWM_APB		69
+#define RST_SHRM_APB		70
+#define RST_CSI0		71
+#define RST_CSI1		72
+#define RST_CSI2		73
+#define RST_CSI_DPHY		74
+#define RST_ISP_AHB		75
+#define RST_M0			76
+#define RST_M1			77
+#define RST_M2			78
+#define RST_SPI2AXI		79
+
+#endif

-- 
2.46.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
