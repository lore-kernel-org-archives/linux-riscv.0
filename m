Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F3D2C61DD3
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Aug 2026 11:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x8qOgFZ571lWXepLV4XireSE3dbXTDIR4hIuXmRrFps=; b=fVTVoU5pBAfHM8
	SxoOq/glnf2lQfpW/NfgPkXt9ZmC4TgZo1w6MiWJEO9GLftDqLzyYsdEc5A6Mp5+hijPcFucFRYpB
	hglFxYCTCGXgTEeGhdkzXFXfRL07O3+KO92Paf0oq1RxDJiTW0XeVyRnCtAZ49TAe5bTGM7zDTIDT
	n1LAFrY83XNAlQxzeQ8JX8V7M9j2b9wu8BuGfru8JeMwP0P2+75/a08B93yV+K7WNWQaKpeUZYB5i
	mYu3Lp9KiI896P3pHVsK+7aNvBwrA0Y7jGpX0XjVQDOEJEO5T0j90uC8KO8e9PgU+GlVjSdDWEDNW
	NTUBDBgajMy/qDtc2CAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x10Ir-00000009C2O-0tEW;
	Mon, 31 Aug 2026 11:35:53 +0000
Received: from mail-sh0chn02on2072c.outbound.protection.partner.outlook.cn ([2406:e500:4420:2::72c] helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x10Io-00000009Btg-1C3b
	for linux-riscv@lists.infradead.org;
	Mon, 31 Aug 2026 11:35:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YYADMj9RmJWLOsX2fUBO/59QJMO0tuDpDcwVFaXSQnskxs8ZtL1siUiSPNgHe2Hw8tONIQom/klC80ZIWsXwokxSQu14rB8aRYEsBVPi7vPc6Eyp9l00Znfbt28nJ1Yv5E3tT2XV1V/DZwlTEFUPXMDUu3n+TUqszfiZ25ke1rkAf+j1JWDf8KUMQWdzW23o5/6PgCM8RKyplajYYjRzFPLwfT00qPfcEmBSKKLvQYXx7ZJut0fGL0Fdwoi1aveuNiShY6djr0IMk+DB4RAu7GuGr0wbPQoNgXvsYXxdDsWCMLCKJZIBJj54lwnPV7cS+cHiMx+5LctV175duketWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f+pdCJQr7+FVb2ZqUJ13twKcJMaYpm1y8wHifhsaXNg=;
 b=S8kEs7HAWFtwVm7rv8EylxZtl/WATX4s/L0lHB52W5RyXcWi7PsDqnvfBw1uHKJGGArumZw2/AnzgV6l35f9/F6gxicKiM/RCQVODt1+ouRwsmnL8mMxZv9GiM4+iyLThZxoxojwIiua1o6M4Hz1xxwHsLW/mAB4reoGZZ6cDYVvjBjXOGIs1q6tIXygt1FK7CIDu6S8c8HTrR4kV+QTuNRFPIbbG9aNCs5NWI+FWyly7h79ao2W+NmRrTkD8pxsLzRFnrHPLRoEfMAKAoaen5mLyJGNgsvAdht4/pseOGK2iu2BvtxvwuYoG+F+5qGG75lpIMC4YpmJHrSxrmhfKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1252.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.19; Mon, 31 Aug
 2026 11:35:28 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0315.011; Mon, 31 Aug 2026 11:35:28 +0000
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
Subject: [PATCH v7 03/21] dt-bindings: pinctrl: Add starfive,jhb100-sys0-pinctrl
Date: Mon, 31 Aug 2026 04:34:56 -0700
Message-Id: <20260831113514.66382-4-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260831113514.66382-1-changhuang.liang@starfivetech.com>
References: <20260831113514.66382-1-changhuang.liang@starfivetech.com>
X-ClientProxiedBy: ZQ0PR01CA0013.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:5::8) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1252:EE_
X-MS-Office365-Filtering-Correlation-Id: 1de445e2-f22c-46ec-0c3b-08df0753f4dd
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|1800799024|7416014|52116014|376014|38350700014|921020|6133799003|10067099003|56012099006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: RfuRgXDr3YTnaGtePFl3yvr3Z5z/LvOhYwF0UPg0VZ7BYxc7I3yHjUm5MqwPPL1CmFTAmUpy4OK/Y3W5qKl6ofB0mP00zUUpicodxYplhO8t1G70sZJXfUSgzItS3J6T9vfk6tYqysU2YG6FkQl2MHBzXLuj6SHhOhGHZj8BKMjVLRXNJOdWaZ+YoQ2MPtEAPoB5fyu6MzHUvN1HGbEndTG2LgDamVjXgZjw4B0rD+keg4SrKKO9wFFFcna9ATyUDWffeCeU/st7BGYLbU02BZj4I3QF+MPAwwADF2rMHaHzFG5CiuIiH7ELeqM9RQYLBpS+juvROj5ZSAeioPMg6TyiyIEnPMOzA4v4K985IswgEx3UtVqmVHuP0RnUWdSxOewUP9XKonKL7PKuvZ+jgTepjW5c3IA5dvEzFiADDuwNg7n9NhY2A8xEc9WlDcmVFNQWYlxIEo5sxG7nNLxswAAqKhOoQW6o/bAfuvju0ceIidim3GzSsodKIOrVnyeuFDrP6oEAwIVSBivXqx7wHITsMxJjKQuI4+0Jnd3bSbz2/hwDdfKPjzY7VT5Q+/5D2XmQ9xstMrKYj0NjMrCZFA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(7416014)(52116014)(376014)(38350700014)(921020)(6133799003)(10067099003)(56012099006)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XeghJMcEutn/pi4y1iEsuMj49MTIA0mrAMYlqOk6kYFC3zqFb7Kjj98xWE9E?=
 =?us-ascii?Q?z/FBJEor2Xo7IGBqpLPP2S38qgbLrWhHhY4OfAktZNrDOxXWtrqB80HZMK3Z?=
 =?us-ascii?Q?2bRfuO8a3ChArcGXZZRZ9V6snbiMr/wCt5B/mYB1ev6GucwrrSdS4IcF0TGm?=
 =?us-ascii?Q?KNfliW3j0Orn9IXQ5RWPT+7eJjykYbf+DzI6gUU9epS3xzaaMsUkzF2IMt5y?=
 =?us-ascii?Q?DVM5pcen4UkPliukrXS0fX3hR20giYxp9TqULGOUyHAkXW21r5iaMn8pVPcI?=
 =?us-ascii?Q?nqF81GVh1F1hkO9+ooQR+C0iCvSPysr3vDJaFksM5ieg9no2AWH7z2Kgh1jp?=
 =?us-ascii?Q?djwXcyqb9Ns3Ob1Z1eEj0FaLeaVb+FsYkL5vIZPA0cWu8L51GH1b1oinvaww?=
 =?us-ascii?Q?C+QMlAvoj40CfVl8hBccm53MFFXVRXb3fqogtaDyRtQ4AhlPblhE9Oz2XCe2?=
 =?us-ascii?Q?QCc26bJFwrlMyKLiU45MUxw1i934wOUiJoMPShS9u8tAuJfAXrXUQad7jbN6?=
 =?us-ascii?Q?byZp5oqdoNAb2gkC7AUgfRLzzQIE5U/+9tjI2HxIWGXMWZO57vMr3OYsb2Fv?=
 =?us-ascii?Q?0npCwuYLXb8bHAeTi+Ru0/cdfD2+iRmQ80qObUy5mCZVR24xawFc9znLMuCi?=
 =?us-ascii?Q?UtkL9Z6WeIwYl1l5yhLWj5C+r73CmfJScRqBXAN4QUhW4ltYjrk/PR1u+OwF?=
 =?us-ascii?Q?V7VXm80HGoGLUe0Hbcc21t4G2pfCiPEdayfsMigET29ZcNmJvJgXwtwakv/I?=
 =?us-ascii?Q?gu+h5A7xEZwAUK50vhCpEjqWFwMDmPrgqmZYpwm9crZaKmjb39DYpNd65A/1?=
 =?us-ascii?Q?Awll5yqioc/onxfkiqKF3fqmVKfzl1crfnPLiQXTwQnlhnqknygCMzbbIaqd?=
 =?us-ascii?Q?KTPCppPJ9fjzwr3U95/EuZmw+mg1Cz89A1VyHsm756HnBHxSRZ5xHcyNqtEZ?=
 =?us-ascii?Q?2ppfmgOijfXGecQoF4EfzwPe0PKK5iLKSMEk5ckQomlvy5tUnduBKTfp/mpk?=
 =?us-ascii?Q?UmWemvY4G3frGN/94vZop710zP5+UWi8Jq1u/B4N5lWz7cW05l1rV4y3Qpwn?=
 =?us-ascii?Q?zkMkhbjWZ/ke5qEHFad2jYefYK6WkNdlByQi6raKpgRYkhkJLKRz1MawvI3t?=
 =?us-ascii?Q?J3OaHxEVGNT7xAMPxoDXNhcdffBPpSdec7z4TohNrUatpcFoPxdUlv2iDoZJ?=
 =?us-ascii?Q?eUE/hdAZowCu0JtFkfTB9xAfBO1JcBwaux2wCAOXrzpHtXjsKE70Ko+YEVBf?=
 =?us-ascii?Q?b3Sqr6hu9N602PLbUFhAmVA9bJGG9SXsGjKpeWAk+hT0fNVkhzQHyRKXG7qj?=
 =?us-ascii?Q?0nlX14L9qUENfkbfseUTZ76qo2rFT+ktUOYm8sWzNk7nBt763eF6nVhCX5sv?=
 =?us-ascii?Q?UmPoTFbfz0eszCm+TCvWEcYPZD+54mS891KgPIEV2zkKeRl6cc1Te5VSr4Dj?=
 =?us-ascii?Q?szO23rWlcE+ZWar0KNQsAbSGvTXgiXgIu803GX9CxIBnb4Bzc6p2FbwFHlv4?=
 =?us-ascii?Q?cOkB40HoDHKBzau02sMQu7zsQuNKzbGK3zQsSmw7A/nRmW6AQolyjlHcOpFA?=
 =?us-ascii?Q?B5zZpru4JblCRGY5wN6eY43mLFsB5UADWYAxnTrq6LaiBcHa51vjJzLVF4je?=
 =?us-ascii?Q?eKgRRQk20QquqOi/qBl+cH/O8z+7oNKzZj95qsX9tnQLVY0UhuceVFkfhfH8?=
 =?us-ascii?Q?+lpixeB6/duha/3ppzOMPm8MhRwsoYQAiw9dpkaL/tLGEXP95xTAQv3rGOmN?=
 =?us-ascii?Q?Fyu6S6ZFFLCnJ+ENzK0OjqrVU77C1brXFcJMmaK4Qj6r4NAZ4omO?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1de445e2-f22c-46ec-0c3b-08df0753f4dd
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 11:35:28.2904
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PJsa2DZ6I0q93toHFBViu5XofLnICx8YgznZ3gzxXu898lZZfW3caFaTKjCruLS7+Q3T0s/9Klwgwm/j1PquE7mU5gcBfPob+eY4JOI4fn1BBelhr1Kni8qBJ113mwFS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1252
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_043550_361340_4FE4A936 
X-CRM114-Status: GOOD (  18.02  )
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

Add pinctrl bindings for StarFive JHB100 SoC System-0(sys0) pinctrl
controller.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../pinctrl/starfive,jhb100-sys0-pinctrl.yaml | 164 ++++++++++++++++++
 .../pinctrl/starfive,jhb100-pinctrl.h         |  17 ++
 2 files changed, 181 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0-pinctrl.yaml
 create mode 100644 include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h

diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0-pinctrl.yaml
new file mode 100644
index 000000000000..a6f8d1b5c459
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0-pinctrl.yaml
@@ -0,0 +1,164 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/starfive,jhb100-sys0-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JHB100 System-0 Pin Controller
+
+description: |
+  Pinctrl bindings for JHB100 RISC-V SoC from StarFive Technology Ltd.
+
+  The JHB100 SoC has 13 pinctrl domains - sys0, sys0h, sys1, sys2, per0, per1,
+  per2, per2pok, per3, adc0, adc1, emmc, and vga.
+  This document provides an overview of the "sys0" pinctrl domain.
+
+  The "sys0" domain has a pin controller which provides
+  - function selection for GPIO pads.
+  - GPIO pad configuration.
+  - GPIO interrupt handling.
+
+  In the SYS0 Pin Controller, there are 4 multi-function GPIO_PADs. Each of
+  them can be multiplexed to different hardware blocks through function
+  selection and each iopad has a maximum of up to 2 functions - 0 and 1.
+  Function 0 is the default function which is generally the GPIO function
+  (or occasionally, it can be a peripheral signal).
+  Function 1 is the alternate function or peripheral signal that can be
+  routed to the iopad. The function selection is carried out by writing
+  the function number to the iopad function select register.
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
+      - const: starfive,jhb100-sys0-pinctrl
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
+          trigger enable/disable, slew-rate, input debounce and
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
+            enum: [ auxpwrgood, gpio, hbled, pe2rst_out ]
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
+        pinctrl_sys0: pinctrl@13080000 {
+            compatible = "starfive,jhb100-sys0-pinctrl";
+            reg = <0x0 0x13080000 0x0 0x800>;
+            resets = <&sys0crg 2>;
+            interrupts = <56>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            gpio-ranges = <&pinctrl_sys0 0 0 4>;
+        };
+    };
diff --git a/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
new file mode 100644
index 000000000000..6d8f5516a178
--- /dev/null
+++ b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/*
+ * Copyright (C) 2022 StarFive Technology Co., Ltd.
+ *
+ * Author: Changhuang Liang <changhuang.liang@starfivetech.com>
+ */
+
+#ifndef __DT_BINDINGS_PINCTRL_STARFIVE_JHB100_H__
+#define __DT_BINDINGS_PINCTRL_STARFIVE_JHB100_H__
+
+/* sys0 pad numbers */
+#define PADNUM_SYS0_GPIO_A0				0
+#define PADNUM_SYS0_GPIO_A1				1
+#define PADNUM_SYS0_GPIO_A2				2
+#define PADNUM_SYS0_GPIO_A3				3
+
+#endif
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
