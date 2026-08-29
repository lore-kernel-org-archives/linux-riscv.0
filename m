Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D269C61DD9
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Aug 2026 02:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/yNFQsEGYb5QBEEh5kx+y0kRhqBXugpzbVQEfR5hWq8=; b=ADbKBTOhGk8Kzu
	ioYp/iu/QcVsBjiAUyVt+ja/Bimd24twYQgx95s+bkA8YzNkq8OeT2kzTP8ty62pjKMba2+cgEGaz
	CNykZ5KkgltcOtieOk9xjDSgfw6QRaKnftz61isj4OdXtUkJPw3wWp3yPegjFWXw1tHGzplmeLwvz
	ELbe5Kw8EAyQ/cK+GiFAAH+Hq3jY9AumXLa44EworxfADPEQ2a+3DrxoAPbt67jHchnv/TGzSKn7z
	8PaphBzDmOEXLZlr8bR6zyOlOdwOzV24yaBCGK0SioZUq0KYl3psfNODrgYar1pmxSrlm0q5lIMny
	WYtICg8IeIafuvD/gaMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x09Gk-00000006cbn-1tTR;
	Sat, 29 Aug 2026 02:58:10 +0000
Received: from mail-sh0chn02on2117.outbound.protection.partner.outlook.cn ([139.219.146.117] helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x09Gi-00000006cYg-03Eq
	for linux-riscv@lists.infradead.org;
	Sat, 29 Aug 2026 02:58:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZehYWOnOBBJ7AgF4Glz4L6C3fHLinlmjzBLeecBhjruo+2Bgbk7weFpJ++gmALchLhmL4/8XjCAHD9TSYWQEIqRAv4ykr1XxojHnzWyvAgEJuzqvPJxZq/e14d2rhR42mVjGqwAs79jDJrCxlA4Hog1ctxeL/B5hWw/t+9vhLyaIoPj4oeClGNSJ8YpMKL0wGGkfqVkFsTAzJk8WGZAXuSf0e0LtqjPJled3usxbbs6+3inNy95qizBLVcq94aiCb1icxPVwbwUkGKVWgdNH7IyrrCny7meW1Xt+Uj0NhuXdndP3azVkrUmBeja2Dn3Rsw3o1LNbwxTcMlizhjy87A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MiEHBWzjAo6t/M6Vns8FlxXx0fGOtypR38ARsQ/VRs8=;
 b=YH8JzOWv2g1r4E4tNxaZsEcS2Q6PGRwt4ogBNi0ux12kl2EEHF4w59WFRO0PofWMZAAQ6aNWeM96qOSZLVFIIvStHifXMAIksicecBfae/kPUhW9us+Y06CRR094hURrAQ84KRqpDN8CBlj51bjmODWiIaaAv+vvIdeYgVLMK5iJKldyjseeshmneCnoYTJJIikwLnZCAQXFd2bGwXQAxb3QO3qlkPGMTMBGGbUQjdM8n2b6MycgDjLYCADqRF+ZfubzXGChcLRWjo/gOAuD+8D6ku30COIVqbAOfeuHc3JrnMArBPWOnv67f5m4Rhbpa3Yf+HNs10QGUZQyaOazjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1153.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.19; Sat, 29 Aug
 2026 02:57:40 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0315.011; Sat, 29 Aug 2026 02:57:40 +0000
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
Subject: [PATCH v6 05/21] dt-bindings: pinctrl: Add starfive,jhb100-sys0h-pinctrl
Date: Fri, 28 Aug 2026 19:57:04 -0700
Message-Id: <20260829025720.23915-6-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260829025720.23915-1-changhuang.liang@starfivetech.com>
References: <20260829025720.23915-1-changhuang.liang@starfivetech.com>
X-ClientProxiedBy: NT0PR01CA0020.CHNPR01.prod.partner.outlook.cn (10.2.8.16)
 To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn (10.2.3.102)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1153:EE_
X-MS-Office365-Filtering-Correlation-Id: 0566480d-d860-4a8e-f1a2-08df05794a23
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|376014|52116014|3023799007|18002099003|22082099003|56012099006|6133799003|10067099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info: 3xdDUs+fcMqVNjAW6N9D6CpnJaAT2uo4O2iMHcnrXePi3YZBzVivb1JMn8xjmW+sdg5hIQ2UxrlbvPY6EfGAei3yW6wY7L5H2Cwg0lfSqaJNbvuJ1Fp15kLRGWgzPdhvyqSE2tol8P/a9ySCaSgrxXkQ2GKWPPX5PxQvOw6wf7s+0RukWriumSVRNdE2dKcIXg5zd5b2EQKz3OoWbv6BFTUgIgTGq8oVHbxOoBXwT9vTemy8ewf58AU/ype0PBiuND4YIldlORg2pKxu1ATHyrHCGqZtEp1sC1aQemBX+0ivPtui89+urysUt1yoqrstmptYVBY+aKisKjjpG9tInig1Jb6p50I38ZNpoi5LNMDxIHb8o3OQQOHUefqUPZ3MvOH7lBsAQWC/YqyjyGJaWxzUbTcaiNKcUkPu4K9rFioG1MvEqHlKaFKgm18FxNUox7+/PtEkgyEaX8JeRbqpfbxRU9Y8KtzbnTIudQ46pArDV/6pItUQMeB1RnCi6BVqZLwoK5RZgfnyUrgCdOPh2yTp1tGc0IcbximxxrDFi7xWRWVzyrVh1UOUJgVeLivsQR3xfQdA4GiC8dNe/l5LUQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(376014)(52116014)(3023799007)(18002099003)(22082099003)(56012099006)(6133799003)(10067099003)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?liZaLNMhEtA9NC9OUCEx5Vrtge1b508p7UlRHb8DfW5Wtduf/kROezq74WF+?=
 =?us-ascii?Q?AQViJDSy6OYhrfBQe4dUXZKdEVqSyb/W7kOaMHThUuGN/Za1ZK0V8DbeQBCB?=
 =?us-ascii?Q?1DXcdu6BiRso21nJgczfOaT+QJC8dCHjkC3jjwEN55aJfZUK7BywoklUznkI?=
 =?us-ascii?Q?GiL48rDtrF3wPFmCbnQD/hPYG0ZkvrZ1bRV6/BO2VxQaKkNtumll5b3RZysJ?=
 =?us-ascii?Q?ich7Pv6/FRCsFjCd2Ee0bvtVA4V6zRwRIAcFR1NtfsjpiL+5j5v6n/TKdj0i?=
 =?us-ascii?Q?EGo37anYObblIT3+Ca/vzZocWFDxnC5bRkmbBWZtLdVFB07t5f0ETVSoYiY3?=
 =?us-ascii?Q?fQS0+66tgoxN7GaZNrlAbfVb1jq9gTBmwtXjKCByVQyQgGQgdhUELRlSbP3D?=
 =?us-ascii?Q?VARQIvt2pThHtXvTkksyH9C4aEN75K+K6gzE+FnaK8g0tklfxZNXRJk+1Fek?=
 =?us-ascii?Q?p0Vyzn/cpNc0GqhA60mhXBLYtRll293gFD0t5GlSLTf3CI8JWAeEQj37KR0o?=
 =?us-ascii?Q?aOyAQePK4DZF3Bkj9447tipG0UYpjH0bSl8g8qot1+tR1VzD/xGL2+0FEaJi?=
 =?us-ascii?Q?HmXIkMtAqZBydPaZl8e4A1tzwH4wFXVgdO8rA177LAjFSUnl7vfosBYC2pS9?=
 =?us-ascii?Q?y+ukyu6gsXiJ02jmaIKj9imlzC9wAdWG+8HaZoRH9WtGAYHwZv8+VXBq5Hyo?=
 =?us-ascii?Q?+j+HVyOMoXLlW33kPVUidq2B3+MZFuz+dTd7D5CAWt8I2kIu8a7xsqYQM9sX?=
 =?us-ascii?Q?J+cGft8UpleYrFWqqb8v3yMSTRvfV3UY8Lnfd6KkGHolX/8nOJj1j/mhIbaT?=
 =?us-ascii?Q?9tKhbQtEdOJfVjGNiPREuz78lBUP4Scup0hHU3GdZHoVfbzudLhg3QmjRDhn?=
 =?us-ascii?Q?u0zDDjZ3zsFAg2UX8+yMTgiMTrzquIym0rQBp0F1xM+kS0Dew+BkHdhFNPSX?=
 =?us-ascii?Q?q6b0ljukOBp/GEU23Zc4ZFASygLIiq61hBg/mNNyoo8y1/o8LZU50u58dYYO?=
 =?us-ascii?Q?QVsSXu4/ea2twxna7f85UAz0s23RcfJqhG/iQgGqNf20qHMW6pMbRUQPRCYj?=
 =?us-ascii?Q?Dr7tNMI5n9KRfbflAyi/U3pDv9/cZehRFXaYabHP5goFS7mpkCiRrj7RAteu?=
 =?us-ascii?Q?ONsMH2KOcBfGREWjCAa5lVtgnkZ4iQj2r6fN8Z02kGy+VvAT6MFXc6oXl9h8?=
 =?us-ascii?Q?9reS0kuJ/gdcj6Wx48Vn7+C0z+/yGuDLLpwyHnvRD5byRioO32oZegqG59i3?=
 =?us-ascii?Q?qWVrxX/cfKc0OPvaSTZLDyb7tVnm0VnnjlpmJsXZfU4wNGhHpmTFhErRcThs?=
 =?us-ascii?Q?SZe2mLpQYrcDf63kxzRn8dLCI118gEA5K2kbpoY4Dkh3f3NKt59vRjNWnjbc?=
 =?us-ascii?Q?J4xUcPV9TZHtGvbrXtojKoG0rUNtbFOJiLN2SbKTw/paxSz5JIW7xxhZXQJt?=
 =?us-ascii?Q?kFQq0r05bVfbsmxki4cl5xsOeDphVhjnzn6ayAEQPRP2HFvTYdb1lENTE25Z?=
 =?us-ascii?Q?TYiyCuhMSfQ40fwnF+Ym0x2aKdQqWsRdMRvCt1z6g+AJZMUfps5bkZO7fyaM?=
 =?us-ascii?Q?p/sjK2QbYszQ5k+p3sW5O85akr20UlV5+Fq/o/3maytlcNfb5NHa55pQFC4C?=
 =?us-ascii?Q?a/bUMvu/64u3AL+poQX3dKhp66iXvnWmvnmEs2SRXe1Ei8kYSohwKZOJAzsb?=
 =?us-ascii?Q?ggxu5GxmXrVraPPgQ0ixtGpR4f208MSJZ44LX+/M4lE4I19kDKczI8GSqiFH?=
 =?us-ascii?Q?FVTZwLyVjr1ZIhieo2c9+uu17RX5GqmiGLEvtRm5rjRmtehyaHog?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0566480d-d860-4a8e-f1a2-08df05794a23
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2026 02:57:40.3922
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kiysfKthbA1FrtT0wywzFfdQoJGnoworx4CXPfZmahcQVm/j0+jufyEL6yyRSL2ANTPPx7uX42FETDru0WwW5X0IyzjhWMLVOOjW3RG7VlEtFE/ACGAOyoMbFOCMtN4D
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1153
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_195808_058813_29D9B0FC 
X-CRM114-Status: GOOD (  18.91  )
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

Add pinctrl bindings for StarFive JHB100 SoC System-0 host(sys0h) pinctrl
controller.

On the StarFive JHB100 SoC, every 32 GPIOs correspond to one register
address. Therefore, under this model, every 32 GPIOs can be regarded
as one GPIO instance. In this case, the following new approach can be
used to represent this model:

gpios = <&gpio [instance] offset flags>;
gpio-ranges = <&pinctrl [gpio_instance] gpio_offset pin_offset count>;

At the same time, this model also reduces the /32 and %32 operations
in the driver.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../starfive,jhb100-sys0h-pinctrl.yaml        | 162 ++++++++++++++++++
 .../pinctrl/starfive,jhb100-pinctrl.h         |  14 ++
 2 files changed, 176 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0h-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0h-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0h-pinctrl.yaml
new file mode 100644
index 000000000000..92b82eb285d5
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0h-pinctrl.yaml
@@ -0,0 +1,162 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/starfive,jhb100-sys0h-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JHB100 System-0 Host Pin Controller
+
+description: |
+  Pinctrl bindings for JHB100 RISC-V SoC from StarFive Technology Ltd.
+
+  The JHB100 SoC has 13 pinctrl domains - sys0, sys0h, sys1, sys2, per0, per1,
+  per2, per2pok, per3, adc0, adc1, emmc, and vga.
+  This document provides an overview of the "sys0h" pinctrl domain.
+
+  The "sys0h" domain has a pin controller which provides
+  - function selection for GPIO pads.
+  - GPIO pad configuration.
+  - GPIO interrupt handling.
+
+  In the SYS0H Pin Controller, there are 12 multi-function GPIO_PADs. Each of
+  them can be multiplexed to different hardware blocks through function
+  selection. Each iopad has a maximum of up to 3 functions - 0, 1, 2, and 3.
+  Function 0 is the default function which is generally the GPIO function
+  (or occasionally, it can be a peripheral signal).
+  Functions 1, 2, and 3 are the alternate functions or peripheral signals that
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
+      - const: starfive,jhb100-sys0h-pinctrl
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
+    const: 3
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 3
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
+          trigger enable/disable, slew-rate, input debounce nanoseconds and
+          drive-strength.
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
+            enum: [ espi, espi_reset, espi0_vw, espi1_vw, gpio, scap_trigger ]
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
+        pinctrl_sys0h: pinctrl@13080800 {
+            compatible = "starfive,jhb100-sys0h-pinctrl";
+            reg = <0x0 0x13080800 0x0 0x800>;
+            resets = <&sys0crg 3>;
+            interrupts = <57>;
+            interrupt-controller;
+            #interrupt-cells = <3>;
+            gpio-controller;
+            #gpio-cells = <3>;
+            gpio-ranges = <&pinctrl_sys0h 0 0 0 12>;
+        };
+    };
diff --git a/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
index 6d8f5516a178..38d5a94e92e3 100644
--- a/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
+++ b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
@@ -14,4 +14,18 @@
 #define PADNUM_SYS0_GPIO_A2				2
 #define PADNUM_SYS0_GPIO_A3				3
 
+/* sys0h pad numbers */
+#define PADNUM_SYS0H_GPIO_A4				0
+#define PADNUM_SYS0H_GPIO_A5				1
+#define PADNUM_SYS0H_GPIO_A6				2
+#define PADNUM_SYS0H_GPIO_A7				3
+#define PADNUM_SYS0H_GPIO_A8				4
+#define PADNUM_SYS0H_GPIO_A9				5
+#define PADNUM_SYS0H_GPIO_A10				6
+#define PADNUM_SYS0H_GPIO_A11				7
+#define PADNUM_SYS0H_GPIO_A12				8
+#define PADNUM_SYS0H_GPIO_A13				9
+#define PADNUM_SYS0H_GPIO_A14				10
+#define PADNUM_SYS0H_GPIO_A15				11
+
 #endif
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
