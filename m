Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19F64C61DB2
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jun 2025 08:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OmuhrvOQm0yPOQSX4SsEkF+4j2PFPqp8ul1l3XxIlXA=; b=cL34rbVIzh3Hh1
	aAt6gWmLGcxXABNQmQuZvvD14wLA15Mdrk4M7RQc/8hnmoWXr4Ghnu/x++qepgwB6UWd56cxKweIS
	czQisUpvrB9wu2hvvAEiW6Rzcv/evhAmn9RokJTd6av1zgSoSzt5nJ1fGHJNguEpW4hHfpXU8iiKH
	zaq7Gm6pDFpBdxM8cp0V6rS6mCz7e91niDNhnbUhfZBs3vOhMcdgu6+p4r1al52oACHfgYIRcIDTI
	YxBYKNk9L9qA3LifJt+h0gp3bgZBdULbrdtN0X4cElnD+vkVCLfi4upJXtjCw6QlVutLeC84/XznT
	UJrJjUZ/AHu24ESqd2nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ0Ai-0000000FozB-24mw;
	Fri, 13 Jun 2025 08:54:00 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ08Q-0000000FoXY-3b6E
	for linux-riscv@lists.infradead.org;
	Fri, 13 Jun 2025 08:51:40 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1749804691; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=IRyADsCjocsmxO32MUEufnQW6uSqsOtsl2G2AYpwRcHeLS1C/gUSWL+mS+bgygM5G4IoKdWvMBgvMuJamSvVZcQS9AJBxlbaVX0oIAIYvZXyeKGmh5Gem06kFrX1pH/5AUXUM3VvSh/bMBcInA8uz3/g+x5vpXqKAb2I+k2D6WE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1749804691; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=RwMP1KKbEuTPv9DVxFj/JYtXhUf6m5oOAVvM8JZb6Ck=; 
	b=Bb2c7NSEbIlrFQryQlt4zD6HHfGJFd7mWBAzu70UvqZAgUmy3RHK0xmywJN2dK3FeDBl2Hw0Cu+9aVx1At75SvD2eCYglstJqw4EK2ZQgcFuZRjrJNUnwabJkB4IKXUHomSVwdII5PwDLNofsi9CWMQ8cRrj0TCvkKdJCZAZ1BI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1749804691;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=RwMP1KKbEuTPv9DVxFj/JYtXhUf6m5oOAVvM8JZb6Ck=;
	b=UhV1sAifH4NajvibGh1Lpa1lnF448iUa14VHkyaAxbcxhEdIC21ZvErxnoaUbKrx
	2nQdI4A+JwZozxaCdqnd9tNmMkyzk5vzIbgWgHAvtxOMi6TsUkggcFXEp3sDnXxZZ5s
	NgQ6fLhb71zCQ7IBOeI26FsCUYcZAW8R0yAjuJvQ=
Received: by mx.zohomail.com with SMTPS id 1749804689622264.10032570352325;
	Fri, 13 Jun 2025 01:51:29 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Fri, 13 Jun 2025 16:49:23 +0800
Subject: [PATCH v4 1/2] dt-bindings: reset: add support for canaan,k230-rst
MIME-Version: 1.0
Message-Id: <20250613-k230-reset-v4-1-e5266d2be440@pigmoral.tech>
References: <20250613-k230-reset-v4-0-e5266d2be440@pigmoral.tech>
In-Reply-To: <20250613-k230-reset-v4-0-e5266d2be440@pigmoral.tech>
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Junhui Liu <junhui.liu@pigmoral.tech>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>, 
 Chen Wang <unicorn_wang@outlook.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749804649; l=4335;
 i=junhui.liu@pigmoral.tech; s=20250507; h=from:subject:message-id;
 bh=ODVCmynnJQ0c6rF92R6nLjsQtfRSNDqvQd+5DSy8y4U=;
 b=dJYRjQodSJIOtUGkSfqJ5/mpHV7+dR+mhp9SwSmqknZQneUWRjqLiTxLBl/7gNdiluWOK7BJV
 QZeXAaD75jrB6x061OLdhx1r9IXRfbsPypb+MTb+g6eLJvZpYOLj/oa
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=d3i4H2mg9LUn4SQemoLAjLRQy0nTcyknIv6zgKMwiBA=
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_015138_970431_FBD7D659 
X-CRM114-Status: GOOD (  11.12  )
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

Introduces a reset controller driver for the Kendryte K230 SoC,
resposible for managing the reset functionality of the CPUs and
various sub-modules.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 .../devicetree/bindings/reset/canaan,k230-rst.yaml | 39 ++++++++++
 include/dt-bindings/reset/canaan,k230-rst.h        | 90 ++++++++++++++++++++++
 2 files changed, 129 insertions(+)

diff --git a/Documentation/devicetree/bindings/reset/canaan,k230-rst.yaml b/Documentation/devicetree/bindings/reset/canaan,k230-rst.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..d352d0e12d8106a232bb5e6d7e138697d2106937
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
+  - Junhui Liu <junhui.liu@pigmoral.tech>
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
index 0000000000000000000000000000000000000000..e4f6612607fea2faf2bcaa80add0b291c3371e4b
--- /dev/null
+++ b/include/dt-bindings/reset/canaan,k230-rst.h
@@ -0,0 +1,90 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (C) 2023-2024 Canaan Bright Sight Co., Ltd
+ * Copyright (C) 2024-2025 Junhui Liu <junhui.liu@pigmoral.tech>
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
+#define RST_HISYS		6
+#define RST_HISYS_AHB		7
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
+#define RST_LOSYS_APB		49
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
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
