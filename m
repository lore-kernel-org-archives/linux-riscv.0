Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65AECC55179
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Aug 2026 07:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c16XURxDz20YXQlngezNtzJZhPjNGA60rN6v5VGEgGs=; b=Dbu9tzkejFbkRS
	7onmK8s5BVYH53Xvu2nTIg+pQHneX2fDADx30bYvEtKJgc7Fh8aGWpDewKztxxCC3I9fvm9ANu8ND
	naajq45bpvM+P6VzFqdHuoYisLIOCmqmabfFFrNAtZz8/2PD7DZKnQEIIHjyJEQAtVLLjM06EvqrK
	LrO1JHFCfg+oyLmMCt0bhwd5tDSC78Nr8gzdeQZfjBYXEjQ7t8SFAFWNgdpqzwwk8glcBh0vqEs/1
	jUCYUzBOwQRvE8CfLw5bE0kTdlIJMWN+kC34TGyY4gtswE4Kvecs7MH39jgskgPHbWHt3z6EnkZxH
	cN6NZ0lUGoWJzfLSaESg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq48i-0000000DyXM-1387;
	Sat, 01 Aug 2026 07:28:12 +0000
Received: from mail-bjschn02on2111.outbound.protection.partner.outlook.cn ([139.219.17.111] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq48g-0000000DyTO-0F0l
	for linux-riscv@lists.infradead.org;
	Sat, 01 Aug 2026 07:28:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kn0JF9wRNMCuQUMaCiLfSj2khmVYcxL/c+8Rtih2yXIYDobClnz+YheC6h5LnFjkLA0LNQv8QGbY4gU9QVqx2ds8XYJbaBtZWTzTFUbf53eH4ZEIsPfoJY9+TcR7643nn7or4QAoB/4JOG+k6vl4BQ4BmjrBkZVdeY/+oS0ZoZXojw1v2WkqxK6xq4MaTyY5yWYQYRmslrjgqdv0RO7YXtoqTofJR92NHQYEzxBZBMKVWnYkl/2DlwVoz7q9QlSK8oqU3jF8dbVZllpXiT/EUZ5N2PVv1T/GrHBsCMyXl+OqCWhoQ4wkXx9H4280adCgFgnrOcXCcS/yLo8UWW3k8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xZKWD1kCSKh2t6rbhNeXtHYBgK6X7EZ/3SAbhJ4pbhg=;
 b=mcpbB5o/eyZEKzmP8AJ8EYgf/Mkt0JH6qq3ptWgtt0FseDs0ti4mLck1TG9evQP6qSRBqHdVDTJ5mReSPcaWVA/0kP25L+iyqB23l+AmwoUnnGEkOfk369n7IXKWWKZo1GNxP2SKw9/y+qR4wMliy4T5Li9KwMX3r+mKG4QMLzN9ssvyr9jVSwH6JHzDwAMZA5APJzm1nxC8C7jU8P7X3x0EAP0TGgU4d2I2HkMg3e/CTzi0jf00ppyzcBcEqrk5w7Nf2Frgn2/bQH4ZICeO7fqMuIVutJltS2n1Y7Y5zTsyrP8iqeqxaSTwGgI2OnvRlXzc8XEfY9ONODOS1nU/pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1138.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.16; Sat, 1 Aug
 2026 07:27:34 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0270.015; Sat, 1 Aug 2026 07:27:34 +0000
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
Subject: [PATCH v4 11/21] dt-bindings: pinctrl: Add starfive,jhb100-per0-pinctrl
Date: Sat,  1 Aug 2026 00:27:01 -0700
Message-Id: <20260801072711.153217-12-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260801072711.153217-1-changhuang.liang@starfivetech.com>
References: <20260801072711.153217-1-changhuang.liang@starfivetech.com>
X-ClientProxiedBy: NT0PR01CA0027.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:c::20) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1138:EE_
X-MS-Office365-Filtering-Correlation-Id: 2130bfaa-6e46-4abe-c0dc-08deef9e5b3c
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|52116014|376014|366016|23010399003|1800799024|6133799003|56012099006|3023799007|18002099003|22082099003|10067099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info: JVRZE+73Fb0sK50wYBAAMuktZKqdof+SnYvCIMqX4icQ3A5sY5JDr63Tgao9MGhPaEIfvIL1sHu/O0NwrABA0io6ViWdqNKUv7oOpL77Hc6zwHYA14qv+Sl6/3QyhNR5wYLTaAJ5+W9OTFYOKHdptD48503phjTT+yyIBqAVQ0hIbAkuRkdgT/0J59DzWUnL2fpWRb039pjbSoSWnxAOXyX3XGgY2MED/7W07sOf7G1kFEC5uoPT2ylw5QJp+iMrFoMI4/HqhdWNiOLmKwRIXb8doyOMZgNg73ghOh5joVGSkElWUeLRlFrgcKw6c1VmyVmmBLPx+XkxRnEX/6T5GZGI60n2BV6rtSmVLRjStZ4a45RD4n+hu980BdE++g+2mkBWV8jQZoE02Ld2iWMKrdgoXbSLQn1nPwlzfWAjypMkMLVD44gtmGGYzjiDMKXcK5oKuFCcaCWKzylehjFQLBaryxryDQqZzWo/nWXypP4XEMtuV6wXed8GPBEPU0S7wWXC14bieSxRKEQaltiGAM73VcWxRHHHAet4KQqg8aHmRIA+jT7TxQKcqJ3wgmWtujQB531+y8lHQ1C77B7I4A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(23010399003)(1800799024)(6133799003)(56012099006)(3023799007)(18002099003)(22082099003)(10067099003)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ofLl+gY7ZynJFfSV+eB4SWekQZJCAqWNm+YDNAXwfsTM96zBT6uk8wD/oUMP?=
 =?us-ascii?Q?T9qph+67fh9o7TEs+Za2jtc2mliTDxQ/nmG51A88WD1JvZzdpzhrI7APiWcr?=
 =?us-ascii?Q?uQtBcoE+Y+RrIDuuCHgSx8j5TdZFNjtXt7IoOWThWx99LsqS6wLTz4FcDaLi?=
 =?us-ascii?Q?HIsw4Q6r9EK7cmkyghtBQ4Q2Ws1IMDMmPyFcay76CxCHrbriEa+wSManGDxv?=
 =?us-ascii?Q?L1QjrIUsFeYAktmhp3fCYqW22nxEckxf66b2wxQS+T6Zta+QzKVL8tV8tE05?=
 =?us-ascii?Q?RRIKD9MFyNT06LyuBlTPt7O1Ha8+og5Wmf5VOpw8kXjywGafce2Nj45XjHtZ?=
 =?us-ascii?Q?Xgn3lAONUApQypZV8WoKKrIqFhYwqIEss6dvG53b+yYQINhkLxtWrJH/vEYs?=
 =?us-ascii?Q?Y3KP95vTN7Cu+IiuecqdHple7aVHGYzzS3UtzOwrH0eEQv9W0yya45BwSDl9?=
 =?us-ascii?Q?ioyv+2A9vfukRZ3LKfRKqoRHCO7jntHl+i5aW9g4NEbzPqNOfhECVu2r27+z?=
 =?us-ascii?Q?fLQ97GlkKY1+84zkVb59trFrAAEgvp5x0QB1lFCsWMTF8avoLh+QpPV8Q5Tp?=
 =?us-ascii?Q?9myGh4MCtjiPHWF3rOTJ+ka40/zOYcMuGeGBVowRFqlE3KJkEs+riV/iq9c1?=
 =?us-ascii?Q?KIGbYq0igc6MjpuR1xX1a1PtpqCJ35/igUOX2+gJeHdXrBV6tRpxhQHBNb4w?=
 =?us-ascii?Q?5wLjyZeeq522w7I0M4EKK7cOvEZg77PxWTFQNpBZRClF/Tc9TpKFyF6K/Qj2?=
 =?us-ascii?Q?WiZzvpH5Cs2rWXJxM3xe6uenXtsVtogCBoR2CxG710JVX6ux79aZqLu7s0ai?=
 =?us-ascii?Q?+skfQqhZHCA9wwiCZOrPLSdFW6ls2Pw44F9w2ZHSzE1WpZffBcYN4p18Rbuj?=
 =?us-ascii?Q?i9lNnvBSnSDl2Xwg7A95BVmhL8hwXaZPaTmJG02XkVHIOyJlfM0WG0+grkk4?=
 =?us-ascii?Q?omcQofqJARqAfllZwQtaKnDHWWgnxmUMjZrGIZOgnJy8aHV6WkDyHqxxPSnu?=
 =?us-ascii?Q?vd81ZvdrSkud5rrIsEkVsuCJW1glq6VpWA70GdUOEBUjUqj+Ul6WQxjUVBqf?=
 =?us-ascii?Q?o0yD+XGppP1VTAwypwFs1+UywbX5GHq7WF8RKlkPnh95d319LvvEZrcegzOi?=
 =?us-ascii?Q?r2LLfKoCOFSduozgAWO2VN9oyLSjrGsIDrpM41dKBUEtKg0f3vDO3bIQPKyO?=
 =?us-ascii?Q?HpC3uIfL3nWkmoqnrWWpxDHN8vkrRxX9qarQ0vNOmHst0sRUV3cfEhBXpx6g?=
 =?us-ascii?Q?99XBccUhp4SU72chjL7bYznpZgMX1GaCw9v21ufGkPrcyXSPLGrJ+IXZP+yM?=
 =?us-ascii?Q?jFMDKtj8QLHj6PDrlN/g9c6rtOq161e6bHCn0BZ65zcwBX5RHbrn4LwVkBjM?=
 =?us-ascii?Q?Z5GtCcbEBx8IMo4DEL5QSk3u3THc8Bxkznh3+KdHGdk20BS24cxP/ckNi1Tk?=
 =?us-ascii?Q?+1Ge4aL3xUszUgvl1h1sAmHnOChMUnB+3hWhqN5p9GeYAjzmrgvRUtYV94lr?=
 =?us-ascii?Q?3DaXsRE+QRVwBhA91OaTW/duplI27EjnMGv2/EmX1DbChnc7Db+bbF0OHsvb?=
 =?us-ascii?Q?1DFFYio/EJtbhUUR+9dQwKa0dBJlzgjIe8sYYokObDV/mNFRzEZv0enD/8yv?=
 =?us-ascii?Q?l/ZtAA0WSG8BVfzcD7KfdxKHpt1B1XpX2LX7t/zYKSIkYD/hSPzT5VIui9WO?=
 =?us-ascii?Q?07N9DAKHthQoXOMB22kG2AvE3L+yHLzIlm+F8o0NXA7s/dmACYLm/BobQ0OY?=
 =?us-ascii?Q?5YCVMg3XjDzVj3vWe9rZaJEoww7RNP1XwoKEceVromUVJoQVAgsv?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2130bfaa-6e46-4abe-c0dc-08deef9e5b3c
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2026 07:27:34.8576
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mrPmtsO+2mAS0jX6tkTPS7RZ6zN6y8+QnDLv9wRITvJFzae29BO0Hw1Zi7WjaT0DM5MV/Anmxx5+qVtZrvPfSloNH+npZML8n0PyNYAF5h2zqn3VTju7KlckgxORSM82
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1138
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_002810_277801_A36B290D 
X-CRM114-Status: GOOD (  18.35  )
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

Add pinctrl bindings for StarFive JHB100 SoC Peripheral-0(per0) pinctrl
controller.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../pinctrl/starfive,jhb100-per0-pinctrl.yaml | 180 ++++++++++++++++++
 .../pinctrl/starfive,jhb100-pinctrl.h         |  62 ++++++
 2 files changed, 242 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per0-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per0-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per0-pinctrl.yaml
new file mode 100644
index 000000000000..ab8c070b59d1
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per0-pinctrl.yaml
@@ -0,0 +1,180 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/starfive,jhb100-per0-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JHB100 Peripheral-0 Pin Controller
+
+description: |
+  Pinctrl bindings for JHB100 RISC-V SoC from StarFive Technology Ltd.
+
+  The JHB100 SoC has 13 pinctrl domains - sys0, sys0h, sys1, sys2, per0, per1,
+  per2, per2pok, per3, adc0, adc1, emmc, and vga.
+  This document provides an overview of the "per0" pinctrl domain.
+
+  The "per0" domain has a pin controller which provides
+  - function selection for GPIO pads.
+  - GPIO pad configuration.
+  - GPIO interrupt handling.
+
+  In the Peripheral-0  Pin Controller, there are 60 multi-function GPIO_PADs.
+  Each of them can be multiplexed to several hardware blocks through function
+  selection. Each iopad has a maximum of up to 3 functions - 0, 1, and 2.
+  Function 0 is the default function which is generally the GPIO function.
+  Function 1 and 2 are the alternate function or signal of an iopad.  The
+  function 1 and function 2 are other optional functions or peripheral
+  signals that can be routed to an iopad. The function selection can be carried
+  out by writing the function number to the iopad function select register.
+
+  Each iopad is configurable with parameters such as input-enable, internal
+  pull-up/pull-down bias, drive strength, schmitt trigger, slew rate, input
+  debounce nanoseconds, power source and drive type (open-drain or push-pull).
+
+maintainers:
+  - Changhuang Liang <changhuang.liang@starfivetech.com>
+
+properties:
+  compatible:
+    items:
+      - const: starfive,jhb100-per0-pinctrl
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
+          trigger enable/disable, slew-rate, input debounce nanoseconds,
+          drive-open-drain, drive-push-pull, power-source and drive-strength.
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
+            enum: [ gmac_mdio, gpio, i2c, i3c, smbalert, wdt ]
+
+          bias-disable: true
+
+          bias-pull-down:
+            type: boolean
+
+          bias-pull-up:
+            oneOf:
+              - type: boolean
+              - enum: [ 600, 900, 1200, 2000 ]
+                description: Pull up RSEL type resistance values (in ohms)
+            description:
+              For normal pull up type there is no need to specify a resistance
+              value, hence this can be specified as a boolean property.
+              For RSEL pull up type a resistance value (in ohms) can be added.
+
+          drive-open-drain: true
+
+          drive-push-pull: true
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
+          power-source:
+            enum: [ 1800, 3300 ]
+            description: I/O voltage in millivolt.
+
+          slew-rate:
+            enum: [ 0, 1 ]
+            default: 0
+            description: |
+                0: slow (half frequency)
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
+        pinctrl_per0: pinctrl@11a0a000 {
+            compatible = "starfive,jhb100-per0-pinctrl";
+            reg = <0x0 0x11a0a000 0x0 0x1000>;
+            resets = <&per0crg 0>;
+            interrupts = <60>;
+            interrupt-controller;
+            #interrupt-cells = <3>;
+            gpio-controller;
+            #gpio-cells = <3>;
+            gpio-ranges = <&pinctrl_per0 0 0 0 32>,
+                          <&pinctrl_per0 1 0 32 28>;
+        };
+    };
diff --git a/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
index e701c30913ce..e0ad453d6884 100644
--- a/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
+++ b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
@@ -77,4 +77,66 @@
 #define PADNUM_SYS2_GPIO_A59				35
 #define PADNUM_SYS2_GPIO_A60				36
 
+/* per0 pad numbers */
+#define PADNUM_PER0_GPIO_B0				0
+#define PADNUM_PER0_GPIO_B1				1
+#define PADNUM_PER0_GPIO_B2				2
+#define PADNUM_PER0_GPIO_B3				3
+#define PADNUM_PER0_GPIO_B4				4
+#define PADNUM_PER0_GPIO_B5				5
+#define PADNUM_PER0_GPIO_B6				6
+#define PADNUM_PER0_GPIO_B7				7
+#define PADNUM_PER0_GPIO_B8				8
+#define PADNUM_PER0_GPIO_B9				9
+#define PADNUM_PER0_GPIO_B10				10
+#define PADNUM_PER0_GPIO_B11				11
+#define PADNUM_PER0_GPIO_B12				12
+#define PADNUM_PER0_GPIO_B13				13
+#define PADNUM_PER0_GPIO_B14				14
+#define PADNUM_PER0_GPIO_B15				15
+#define PADNUM_PER0_GPIO_B16				16
+#define PADNUM_PER0_GPIO_B17				17
+#define PADNUM_PER0_GPIO_B18				18
+#define PADNUM_PER0_GPIO_B19				19
+#define PADNUM_PER0_GPIO_B20				20
+#define PADNUM_PER0_GPIO_B21				21
+#define PADNUM_PER0_GPIO_B22				22
+#define PADNUM_PER0_GPIO_B23				23
+#define PADNUM_PER0_GPIO_B24				24
+#define PADNUM_PER0_GPIO_B25				25
+#define PADNUM_PER0_GPIO_B26				26
+#define PADNUM_PER0_GPIO_B27				27
+#define PADNUM_PER0_GPIO_B28				28
+#define PADNUM_PER0_GPIO_B29				29
+#define PADNUM_PER0_GPIO_B30				30
+#define PADNUM_PER0_GPIO_B31				31
+#define PADNUM_PER0_GPIO_B32				32
+#define PADNUM_PER0_GPIO_B33				33
+#define PADNUM_PER0_GPIO_B34				34
+#define PADNUM_PER0_GPIO_B35				35
+#define PADNUM_PER0_GPIO_B36				36
+#define PADNUM_PER0_GPIO_B37				37
+#define PADNUM_PER0_GPIO_B38				38
+#define PADNUM_PER0_GPIO_B39				39
+#define PADNUM_PER0_GPIO_B40				40
+#define PADNUM_PER0_GPIO_B41				41
+#define PADNUM_PER0_GPIO_B42				42
+#define PADNUM_PER0_GPIO_B43				43
+#define PADNUM_PER0_GPIO_B44				44
+#define PADNUM_PER0_GPIO_B45				45
+#define PADNUM_PER0_GPIO_B46				46
+#define PADNUM_PER0_GPIO_B47				47
+#define PADNUM_PER0_GPIO_B48				48
+#define PADNUM_PER0_GPIO_B49				49
+#define PADNUM_PER0_GPIO_B50				50
+#define PADNUM_PER0_GPIO_B51				51
+#define PADNUM_PER0_GPIO_B52				52
+#define PADNUM_PER0_GPIO_B53				53
+#define PADNUM_PER0_GPIO_B54				54
+#define PADNUM_PER0_GPIO_B55				55
+#define PADNUM_PER0_GPIO_B56				56
+#define PADNUM_PER0_GPIO_B57				57
+#define PADNUM_PER0_GPIO_B58				58
+#define PADNUM_PER0_GPIO_B59				59
+
 #endif
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
