Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CDAEC61DFD
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Aug 2026 11:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JNoO7hAQQzo/HFtcnQsODWbW8lRAQSJXIZOFCkaEohs=; b=1WuJXBAaSFGay2
	AiWKLnxoxREU4jh2EismpDvWau6yhi4u7JJsV6O5Pg/43webhFq4/fYQ10WivW/GeCme6b/pPtzYv
	hkOoasbDJ0Hpc4W2wUX/OUcxiL4XAvyM7HR7wEjmkTciiakROnx2CsB4/2JHoS97EdtC4+pOx14CH
	8JeKcgY7ZDZ4PiRgTHmN8A/iTnV6ujXDZAqffy/yVT5ISleHby14mxmTg27MLd9f24E5pC5tjoWrF
	DiEiQusizVdghv5+lEL0HZGpsKXfvYOSeqRV/1sKmMalMqd81oP+hm2W+oYrfLrSASoXe/fP4gZo2
	zS1nqMLfZkuoJDMdVNww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x10Ik-00000009BwD-42So;
	Mon, 31 Aug 2026 11:35:46 +0000
Received: from mail-bjschn02on2132.outbound.protection.partner.outlook.cn ([139.219.17.132] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x10Ih-00000009Bs8-2afz
	for linux-riscv@lists.infradead.org;
	Mon, 31 Aug 2026 11:35:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MvVOVhwF8aTiKLjB8DA6pSV5GCrrErFajFPBLnX7o33hrvdijrP8DMA4+Fq8hHsPJhRktrQvo9UIFAhTyvlEQJ6NbbRrSazG26w8BmrPLUN/Xt08dh8lQVqGD0nzqxMrG3B/dgWgP3LEWn+wBRLEdKKcNnqUNBUeWLsJu4rDgkmOdKubXfyPn8C1TCjTuIratLNvOlOcXiUGiuQ+GL4nGYykgLE1W3Q+R1lizav/oCbC8qDKhBkCdzuAEMKhZecyuDuWBAqEEyXDASMgCHDCt3YcGEoNFAGm6WSmb0OmbR8IeQST/XVB20GXui+2VtUbMcoanxuw23LWH1IzJI8F0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z2BXP1y+ypC5LvfUhrjCEltJQHhur4wc7+L3mJFjkB8=;
 b=R2yNoiB8FQyTkV44u6RxIUraLOMZttFMRvcJ8F1+Cbkae4XAs63v48GZsikgvePyV98hAJVxrzkq8NHfeLc0xOyfF2+dl2qvHRFhZH1MhYIcKxIva5Dgv0Ya/mMjPX6q5ZpjTr6cMI4WSRgtPFUFw+9W1H1mz+wVSl0Fw/f/gbNQAb30poIMpTqWlyZ0GxlUDjvj4TYTxkY1Phavbpej86vs29oaOx2PQa4jSioSu3kHLy5AR1ILJC/vX7fu0aYtkUfSBRTvo2Ip83BFRh2HmokleonJ/PxuYIS6h8P9+mYrIeHejwpKTQixcXFgSEZW+jt72ONHJ8yfp7Atewkieg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1332.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 31 Aug
 2026 11:35:33 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0315.011; Mon, 31 Aug 2026 11:35:33 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <pjw@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v7 07/21] dt-bindings: pinctrl: Add starfive,jhb100-sys1-pinctrl
Date: Mon, 31 Aug 2026 04:35:00 -0700
Message-Id: <20260831113514.66382-8-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260831113514.66382-1-changhuang.liang@starfivetech.com>
References: <20260831113514.66382-1-changhuang.liang@starfivetech.com>
X-ClientProxiedBy: ZQ0PR01CA0013.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:5::8) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1332:EE_
X-MS-Office365-Filtering-Correlation-Id: c6b579ec-0bed-48b6-5148-08df0753f7b2
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|52116014|366016|1800799024|376014|7416014|18002099003|38350700014|22082099003|56012099006|3023799007|921020|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info: naEmKpn07NzBTZF2Wtz2eY33TjiAm4lqUCrFdbpEKl1wVHYsl46+rD3EidBncsIA1dLQkGwsfeF2Zz56qevgO+AfZWpTnrSiSbdubhxVvhwh6ZBNFmnen37G67kKLkoVc5I51GFT/x9A/nyTeXmO6RjuGWlHJT79UmpZTlMeaSTCdrA1qzuT5MLwa+wYaNSYbtfUh9j5lqq6LruaportXsygTd+PHG7Ea0gUHpAos+VuUwUJfz5rkJUfM+L0g9Ft0hysFpqD4SWLkKQZz5exX8+GSUs4N7bpZEoh55cEj60U+KJ3ZkqFpfegsYbja1RBS7r2YsYbujX+8793M/82Dc5ZFd8LQExO6syr8m8AGRd23TYc8CQo2cJTiqLDK5SwAHNS+dDUZToQ9CDiR4BTm7mgApMj5K9WKFpLDmOV2dwUOuzwlo8d2nvCO9d2lkQGKCyPNDwmdax8/ZrFKtlEQjC173OaoHljG7ZQd1qfZSOsDPpGfvd5SNFGA0nIvUkMQwdcyFXQRAaUjqLp8uApTXAWQ1raZJabVHDtJJqVrGtic17w4dlafjg/13JvVx6QKEAykdfxMd7qf/YVlUHDNg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(366016)(1800799024)(376014)(7416014)(18002099003)(38350700014)(22082099003)(56012099006)(3023799007)(921020)(10067099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+8Kw5OXUXoKcqeE2uKyyyMIiKWcNrhA8Il3rMNJEoxt//162uUX9l//VgIwN?=
 =?us-ascii?Q?qkwzKkkYD4AR18kQlMnOvW9gkhsNBYuWQbkc/EyZaZv7e7i0Ho+x8csi+Vjk?=
 =?us-ascii?Q?4KgoEzTHaDCHo+YnMdY5B7eKKqwAzaPSHiki8GZuyed5uSerXlPn+B+CswFc?=
 =?us-ascii?Q?nrOr7FdlvM2fx+y48arTUJBA7sK2rQdx4daR0cyXkbWPwYJpgYMJKTvFZdR1?=
 =?us-ascii?Q?c/nV9L0yWu1OaFoHFgzzITeSR4UFbeQmzHjq31fanuFU2dL14IE76R8QR0uQ?=
 =?us-ascii?Q?YrKF1UZbyN8Xgwm4RE40q7H/EG58EkjMHJT4S+wUS2Ui3ULLdxpSy3m/Q5vN?=
 =?us-ascii?Q?VTeMkzsuAXkAhtc3aMA43FcZU7x3M8oCSBxKo97sSmjgonC3gE3OmmU/Q4OY?=
 =?us-ascii?Q?RVrd0f6oHsGi9IpWwz3TME0SIaFCm2EX5813eLRKpbhU02zqL5+MDKY0FOaa?=
 =?us-ascii?Q?o+HmyEvVMqnSdcA4/VjqqVqrJDGU4zXmJkrSmgurL2jHuA1ZrWvPyiV/UH3Y?=
 =?us-ascii?Q?Y4Yz+O9xImKc05bsUzev/IOjkidiJpxnzmDBvCifpvPmd8Zui83/hDbU2IV4?=
 =?us-ascii?Q?8OCxbRUF+t0Rgd/JfePaI0I9JUKbpFTvvL89DnTUF0NwFF8z0eeRK0J/4YRy?=
 =?us-ascii?Q?mdBXh9BC2rPcqHGAkrMd7+tglW6FWg1faVH+ksK1cQwgw4W6scyO2xYGqKX3?=
 =?us-ascii?Q?KZEx84xcB69C9Ae/f6sRvGMmTWrg+je+yMJhHkhZOUDX2Bq5wZox1o9NGC4z?=
 =?us-ascii?Q?kM/wS69yry4SbdMNJuL9UHgnh+h1WdkMDsCvM8l6BfcfEIdHPaO43gfFi0y0?=
 =?us-ascii?Q?8zu2qrDlX3jdlObLOqA5FH7q8dPL8DhBUb03/+se8d4SNy3jb4FVAnzTkywK?=
 =?us-ascii?Q?IyESrv3yVnsDLRERru+Oh1IBbkeGbccpIp2FK895V64AHblOs3rzCRZhI+Up?=
 =?us-ascii?Q?H+TdQBL3Gogo6usupFfGJ3Fykx7gQE9VbA5B13lJPHuIF6eOQF38r3icdTXG?=
 =?us-ascii?Q?rEaL1j0V8/Z5zJ5s4b2b1Wq3rVd09cXsh+pH3NBKJfk/rtGjo/e7GhQgD/kZ?=
 =?us-ascii?Q?SknvQ5pf+wMAy4wiAdx80Q/q5yQHRluhObr2ntwQRiiaE7DaxzHJU85UQ/AW?=
 =?us-ascii?Q?Gh5/iU5taRFjYCKSsP6JXQHGL7WxB68DSpzZY8ZGqMSWelzyc6BG5pzLcfJF?=
 =?us-ascii?Q?xezUem9RD4IzrnscC5/lMJE3Ks5/VoC64D2BMHdD/IYTxhZVoh4/SmnqsXdx?=
 =?us-ascii?Q?QsVJo0l82uhUiHevmRA75QPytF58XtjK5YzmXeuzvfRPqkHIhLYObPVx8X7C?=
 =?us-ascii?Q?FttZGaQhvnrgxl9KBxBfsN7M9fA3s2ATqqpdxx1mNzUBuuK/MpZ0jqWALmll?=
 =?us-ascii?Q?+yJStNji2axy+cCWHB96xaot2ECrwlm0lFmFPdXqXTAH0HY3P8YPYyG5fi21?=
 =?us-ascii?Q?0cQEG7jd5UaFXTLdWDCbLtPPnIigK0TqyZlateE4UT6Wcj/EupWfPbAukeAi?=
 =?us-ascii?Q?96j5QOk2B76FBlByUXAsi105Mc729NnLGSSHUKl8VICZfCgtB8aAuvg5XCbM?=
 =?us-ascii?Q?lVTb16DYzEwWtoBJIwHDwxu2TqM4DLoaQQuUNtdiNKJc+Tm2JDegHx2D6XAu?=
 =?us-ascii?Q?3kI1sCcNQtGI7U6bam8t0SKGIDho3j1v9r2dpXY/AdvdxrCVuabD1J/DNO3r?=
 =?us-ascii?Q?ANYzTdTVBmiATm+mcqANEmHHYGpF1BiUtrXAdTQqS7e2TrrZXZ4yZM1LWgxc?=
 =?us-ascii?Q?HK8MeNTmOx+HYQpiCmnqW3euZkVoovE8vYsrXnDEpRt+aequE7qf?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6b579ec-0bed-48b6-5148-08df0753f7b2
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 11:35:33.0632
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NnaTr/KgE1aoKVsAEmlVjN1w/Cozcrb7dDt4Q6i4B3gzWwPqDOeD1d/nBuj05SVzWloPbVQRy54qjbNpjotCI1ME76beGn4ewBwE+MG9vL4cstv1ON2bbYIkV9zptYIR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1332
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_043543_661347_71FAD0FE 
X-CRM114-Status: GOOD (  17.65  )
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

Add pinctrl bindings for StarFive JHB100 SoC System-1(sys1) pinctrl
controller.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../pinctrl/starfive,jhb100-sys1-pinctrl.yaml | 164 ++++++++++++++++++
 .../pinctrl/starfive,jhb100-pinctrl.h         |  10 ++
 2 files changed, 174 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys1-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys1-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys1-pinctrl.yaml
new file mode 100644
index 000000000000..55e111117ea0
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys1-pinctrl.yaml
@@ -0,0 +1,164 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/starfive,jhb100-sys1-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JHB100 System-1 Pin Controller
+
+description: |
+  Pinctrl bindings for JHB100 RISC-V SoC from StarFive Technology Ltd.
+
+  The JHB100 SoC has 13 pinctrl domains - sys0, sys0h, sys1, sys2, per0, per1,
+  per2, per2pok, per3, adc0, adc1, emmc, and vga.
+  This document provides an overview of the "sys1" pinctrl domain.
+
+  The "sys1" domain has a pin controller which provides
+  - function selection for GPIO pads.
+  - GPIO pad configuration.
+  - GPIO interrupt handling.
+
+  In the SYS1 Pin Controller, there are 8 multi-function GPIO_PADs. Each of
+  them can be multiplexed to different hardware blocks through function
+  selection. Each iopad has a maximum of up to 4 functions - 0, 1, 2, and 3.
+  Function 0 is the default function which is generally the GPIO function
+  (or occasionally, it can be a peripheral signal).
+  Function 1, 2, and 3 are the alternate functions or peripheral signals that
+  can be routed to the iopad. The function selection can be carried out by
+  writing the function number to the iopad function select register.
+
+  Each iopad is configurable with parameters such as input-enable, internal
+  pull-up/pull-down bias, drive strength, schmitt trigger, slew rate, input
+  debounce nanoseconds.
+
+maintainers:
+  - Changhuang Liang <changhuang.liang@starfivetech.com>
+
+properties:
+  compatible:
+    items:
+      - const: starfive,jhb100-sys1-pinctrl
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 2
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+  gpio-ranges: true
+
+  gpio-line-names: true
+
+patternProperties:
+  '-grp$':
+    type: object
+    additionalProperties: false
+    patternProperties:
+      '-pins$':
+        type: object
+        description: |
+          A pinctrl node should contain at least one subnode representing the
+          pinctrl groups available in the domain. Each subnode will list the
+          pins it needs, and how they should be configured, with regard to
+          function selection, bias, input enable/disable, input schmitt
+          trigger enable/disable, slew-rate, input debounce nanoseconds
+          and drive-strength.
+        allOf:
+          - $ref: /schemas/pinctrl/pincfg-node.yaml
+          - $ref: /schemas/pinctrl/pinmux-node.yaml
+        additionalProperties: false
+
+        properties:
+          pins:
+            description:
+              The list of IOs that properties in the pincfg node apply to.
+
+          function:
+            description:
+              A string containing the name of the function to mux for these
+              pins.
+            enum: [ espi, espi_reset, gpio, host0_port80, host1_port80 ]
+
+          bias-disable: true
+
+          bias-pull-down:
+            type: boolean
+
+          bias-pull-up:
+            type: boolean
+
+          drive-strength:
+            enum: [ 2, 4, 8, 12 ]
+
+          drive-strength-microamp:
+            enum: [ 2000, 4000, 8000, 12000 ]
+
+          input-debounce-ns:
+            minimum: 0
+            maximum: 10485680
+            description:
+              Debounce time in nanoseconds. The hardware counts in 80 ns
+              stages with a 17-bit counter, so the maximum is 10485680 ns.
+
+          input-disable: true
+
+          input-enable: true
+
+          input-schmitt-enable: true
+
+          input-schmitt-disable: true
+
+          slew-rate:
+            enum: [ 0, 1 ]
+            default: 0
+            description: |
+                0: slow
+                1: fast
+
+required:
+  - compatible
+  - reg
+  - resets
+  - interrupts
+  - interrupt-controller
+  - '#interrupt-cells'
+  - gpio-controller
+  - '#gpio-cells'
+  - gpio-ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        pinctrl_sys1: pinctrl@13081000 {
+            compatible = "starfive,jhb100-sys1-pinctrl";
+            reg = <0x0 0x13081000 0x0 0x1000>;
+            resets = <&sys1crg 2>;
+            interrupts = <58>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            gpio-ranges = <&pinctrl_sys1 0 0 8>;
+        };
+    };
diff --git a/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
index 38d5a94e92e3..30704a5a3418 100644
--- a/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
+++ b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
@@ -28,4 +28,14 @@
 #define PADNUM_SYS0H_GPIO_A14				10
 #define PADNUM_SYS0H_GPIO_A15				11
 
+/* sys1 pad numbers */
+#define PADNUM_SYS1_GPIO_A16				0
+#define PADNUM_SYS1_GPIO_A17				1
+#define PADNUM_SYS1_GPIO_A18				2
+#define PADNUM_SYS1_GPIO_A19				3
+#define PADNUM_SYS1_GPIO_A20				4
+#define PADNUM_SYS1_GPIO_A21				5
+#define PADNUM_SYS1_GPIO_A22				6
+#define PADNUM_SYS1_GPIO_A23				7
+
 #endif
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
