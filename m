Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2384C61DD6
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Aug 2026 20:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZWr1ZqyweYVVfyOJCcrzsOfGszrG1Nm+joUdg1yvOAI=; b=x1C5GCGLfDe9XG
	ZjEat7qj+n56wlosmBvF35nZaAFBMhMcE7/Gk2gfB5HB0MJ0EsjggglKXaAzxBoifgzvEkH0Hol9x
	M6OsBH/Rk8wphj83V2LGDv23IN+5fAIcPhj8Zy8nv0pn5nU55aFmi91qPDQExAbG7zSRg6W5sqOB8
	TtZIbF5j6WN8PESPSbynIW2soTfPDbzrR+AJM4BiOzWqRp//lfThFHtQbEby+cjxzuecknDFtWx5V
	npLy1t4+n4RW0aNm4Wc3KVpPdjHRTKYpmdfNCY9RwWnffZLgSCo9PeFF/O+2Vb0XSrPXFY1PdmvEm
	DMrfvJseBnL0ujs2sneg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0Q6T-00000007Ju8-0Ed4;
	Sat, 29 Aug 2026 20:56:41 +0000
Received: from mail-bjschn02on2093.outbound.protection.partner.outlook.cn ([139.219.17.93] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0Q6Q-00000007JsK-1YNc
	for linux-riscv@lists.infradead.org;
	Sat, 29 Aug 2026 20:56:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VONzmYUB66gzFZVlaAt4iCKF7D2irKnbtvAnIQUiARFO96QE4RadqbW+9RtJQuUMPn07NjOJtoRokeGx0ME7OC9ubAXKDGn5q3ENMbze3o6OoAvcXNhNz62p7UidiFPn27aZz/tIUhQSgE4MHyLQdF851EWS7XTWN9W6AOsu8nS6LwcLOF9pfJsEMPZa+POXjuLRSiwwSLNpLxqSTTZF2+E6Bv+ma+EwnvNd+GWZmhwJIjw1ozo7Q1pGk6ot3ZlizoinxgNw2RmK5aSl1HWMtcIMLOP+oVEk/FBQCNJaSpVAwkIr4c47ZwcQ+3Ml//+vMQCqvFw8QCzWXaqlVOqo2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w+qoQIZIyGZLEKbZaeCztvK/3VrELEMlKlZ6iktumko=;
 b=NbeHr8x6mVyx+UrGBdkkP6ey8Xmcesam0parpLsdWsRXbeiPqvBg6/1XPx62xUrQQ1OyEb48SLhtYJqfZpyM0K5dOxjK7B0hTrdLEsRk8vsRZojbm3VH9/YoSjcWipr5sgIlY3FCPOKhmcxqSq+xB5+Jxk7P/9f4W+xadXZaZZGYJN11Mvq6jup4+1aozclMHgqYvkMyOgwRZgHo1Qn4cVZypgHwwBu/i76QzKxEBwfJZapwHqGFeUScD8wAnu/NKi2eKv/DF3WsqoIOQ7mTNe9F8947J0PGD6jrTwuGq/YNNPd/flDf89QY4wXSVyQwyM869518zL7dEUGfaivkyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from BJXPR01MB0838.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:1b::23) by BJXPR01MB0709.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:1b::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Sat, 29 Aug
 2026 20:56:26 +0000
Received: from BJXPR01MB0838.CHNPR01.prod.partner.outlook.cn
 ([fe80::e644:7bf5:5a3c:e548]) by
 BJXPR01MB0838.CHNPR01.prod.partner.outlook.cn ([fe80::e644:7bf5:5a3c:e548%3])
 with mapi id 15.21.0315.011; Sat, 29 Aug 2026 20:56:26 +0000
From: Joshua Yeong <joshua.yeong@starfivetech.com>
To: rahul@summations.net,
	anup@brainfault.org,
	lftan.linux@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ulfh@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: alex@ghiti.fr,
	joshua.yeong@starfivetech.com,
	linux-riscv@lists.infradead.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: power: Add RPMI device power service bindings
Date: Sun, 30 Aug 2026 04:55:18 +0800
Message-ID: <20260829205520.1691-2-joshua.yeong@starfivetech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260829205520.1691-1-joshua.yeong@starfivetech.com>
References: <20260829205520.1691-1-joshua.yeong@starfivetech.com>
X-ClientProxiedBy: BJXPR01CA0062.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:12::29) To BJXPR01MB0838.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:1b::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BJXPR01MB0838:EE_|BJXPR01MB0709:EE_
X-MS-Office365-Filtering-Correlation-Id: 5547727c-2f3d-47b2-850b-08df060ffd71
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|23010399003|1800799024|7416014|376014|366016|18002099003|56012099006|10067099003|3023799007|22082099003|13003099007|38350700014|6133799003|921020;
X-Microsoft-Antispam-Message-Info: bUQlGE6TgdNTZ0P/8+gF5fsVelVXzSEJMaebnHH/Qr1GLRHlIlhLMm20OF+NqcQBLkbUwuHxIhAKsy9wf3WFLThGO4ZQz8rFC8MHR2T7AHM7Fvy55Tq8WzXLtYJLL7yK57vYbTwEEkcChyNguFjhqKKeZ9Qv2BaMOz0g5auH2Xy0M9dKwHhB29pt30J8SnvtBsUPiavP8AVXJF+56WTu3z+TCrwNU/Rh5j7Bgqui2UAMeImddW/LGMXRI+Elk8frgIqFa4nKnsUJFpILfREsnOBRuMAf1Hv9Sh+Wqd3tp3rMa8QrZKIUV64lxyfXEuAmtaLLnp6RgSZ/RfebOd4AKf5gWlWhR+LqhRxTKujXty4+UbmzCMeyQZ0e3J8bWkKJ89oAOWcMuZvxzA9pivCrZd6Qlk8FXoN1qyLkfXvwwpw7pXEleQx2UjTJ8nAAcZsw6LrjWqQLM4QQw0IQQC1wkULqo8Ge3NNbc2M2ohIKdQbyRiFEaZEjVMRhPU7nk3Kgg2Nxu50Uk83MhUiXmkPyMhGt6P6yR/Hjd5q9GF25+g9HnpyQDop2vrzC9ugKaz8DSzbRVbt9K0kB0VGy9SQ76g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BJXPR01MB0838.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(52116014)(23010399003)(1800799024)(7416014)(376014)(366016)(18002099003)(56012099006)(10067099003)(3023799007)(22082099003)(13003099007)(38350700014)(6133799003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+3iCfW3Lgg1cG7cEVPG4jT0HWMJrDk6WeaJnL/i+36L8GJumXimiXzKD9mW8?=
 =?us-ascii?Q?8C0RMDXXvmYEj76984UvJME/Oqnt7aYk2YaUysZ37jXJJppiqdomjbSnzSJf?=
 =?us-ascii?Q?viPcLA4YkFvU/XqVlOaD9wr7cY4xsqJZR0RdOl0D+k4bqj2eTCkSS/tT37LN?=
 =?us-ascii?Q?QzGchngAcfch2scJlYndq2OMLhjLCw/2qYdwH6QzeL5w53b/F/7nWgZM27LA?=
 =?us-ascii?Q?e0xbiQEOL9P/8/eeVUZyKf/CAAnYs2KZHHSzBplb1OHUV0AzfF6hJWhb36qe?=
 =?us-ascii?Q?+CVnCIAl/cUP8B4wvCESm4a6op+/DTEqiKqjOSnYTS0I5fraZX/z6mNWKG/p?=
 =?us-ascii?Q?GAmN/fOzk1rYR3RIHHHJlwhj0H8cjM7flBmSMKbw/4t+t06RVo7XLtf0PILr?=
 =?us-ascii?Q?5sl3OYe52r1NYWeJDXPauKLvYLsGwElRsCLrHRPHcMb/zoj21ovEYGhe4Daa?=
 =?us-ascii?Q?N/hCSH56Sbp0kGCtKCvlqOq4nLCkRCH13uexe4ArM+JPsgUWRzhJOY3MjnXF?=
 =?us-ascii?Q?R2Kf4HmbkEJ49TfPH/50zSM1O+0ZSFOQH8dQXXfdDURI1J6074dAllfQ6/0n?=
 =?us-ascii?Q?ZbStjgY6oE1H6sVE7K/cUqJQPd5l+mMaYm9ZR26BolMr7kyEKi4mRG8INlO+?=
 =?us-ascii?Q?y+Dh4cFB2k8XnHaYRhjAiV32PxFkDop8e2nyl6FDi6w/eWtfbWOut89aLI86?=
 =?us-ascii?Q?N1L1NnnxOxBfpkgIxzA31XnIuLkA5EJQtSt65VHfC5C8TgiB+bXcRvm+ampR?=
 =?us-ascii?Q?xCsYcinZAIZm+DV9KaGymQCOFoMQL6RnLpkFvqEypO74MM07DRwx2SIfLYr0?=
 =?us-ascii?Q?FQVyEx7Xl1RMmEz5SNoRGnnGM5JEyksUBg4Z99EiDNcyEflu2EBtvJreVNaf?=
 =?us-ascii?Q?FzVoLYtAjUcWwMzVMgmSDovQqaD39tRlupbUuZNflsWeCn2r+DC3E4GdOx3g?=
 =?us-ascii?Q?LMMmcoaP10cJArj0A4XM0hIBbabjbHY6PoP07MimQXCbia05DhJY2eaej0sH?=
 =?us-ascii?Q?P9ZlYUgsPVU9UpJ/ygMdklCp+II+RgUv0y9gT9xhNre7uybHo8t8fdkLH9th?=
 =?us-ascii?Q?z4mIiLBubKQOGfEELUJwW7fAku79GW/tc12o96e9LdHppV5wIwc67QfUeFP9?=
 =?us-ascii?Q?dgTlK1fM2PmDPB5bsB5BpTETzxBDY6VVCkDAfXBPz7s8ncSnNtLD0i9WEBPG?=
 =?us-ascii?Q?0/nKwunqlh4kyPIfFM1fCUe/BMYu33s/eU+fAm4idF6ljz+KUCzzVl7XgozX?=
 =?us-ascii?Q?Nb6BKQKwVH3cUGTWaIJYfA5c1SxROhCBCQ1S6PEtshevncFQawpaoEbAS/4H?=
 =?us-ascii?Q?jgC8ypRDHJFdOLRizYBMUZkknoQETJ9gDyacyyk8B4GWoCUnLktUQo2K+uxw?=
 =?us-ascii?Q?BCYXpdyCk0/cNyk6YK2iQFyh6+hJQTp9sJBggcfRvyNWs159E6cZwSdRXWxf?=
 =?us-ascii?Q?39Wz7ANEU5CPSBKrAQpYHhT4m5qqqxz4JYE4aMWTBHcYwZ3S+HYk3ilYQdxS?=
 =?us-ascii?Q?dyRw5zVgyw4e7Wa4FBmSwiTubO/xAJJc745i+R6+5hP5pFtvpvpAEu6Ik+iV?=
 =?us-ascii?Q?ZQ+1tEsRA4kDJZLp4IoKVPyGMRD+KlXXaoup0Ko7fW/QOFYK9FKjOqInzbJY?=
 =?us-ascii?Q?zPn+sVBBz9cyvt1EZVdBbgSlrTSKRO6yKs1L5XZMrrD9wvynDURutXRXEETH?=
 =?us-ascii?Q?KbUTLLXikX56G40HoV2+qmkWUCjE+qv0BCIbzNpMtG05KNIfnVcOHkT7MoJc?=
 =?us-ascii?Q?fkAX5hKUtI3Dhpa+ljzsF6IPZCnF+Fk=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5547727c-2f3d-47b2-850b-08df060ffd71
X-MS-Exchange-CrossTenant-AuthSource: BJXPR01MB0838.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2026 20:56:25.9008
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZMFlz4+HONCVm4UtTK1sHrKwoHuo9fiWmTLNiD6aHxQcR488bu0Gwu0TziIPkHYxWNahmA7NtA0YT+znnyb9+CvuI1i4eD50Zpn8dSrwols=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BJXPR01MB0709
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260829_135638_416085_CC35ADF9 
X-CRM114-Status: GOOD (  13.37  )
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

Add device tree bindings for the RISC-V Platform Management Interface
(RPMI) device power service group, both for the supervisor-facing power
domain controller and for the SBI MPXY channel which the SBI
implementation uses to expose the service group.

Signed-off-by: Joshua Yeong <joshua.yeong@starfivetech.com>
---
 .../power/riscv,rpmi-device-power.yaml        | 65 +++++++++++++++++++
 .../power/riscv,rpmi-mpxy-device-power.yaml   | 65 +++++++++++++++++++
 2 files changed, 130 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/riscv,rpmi-device-power.yaml
 create mode 100644 Documentation/devicetree/bindings/power/riscv,rpmi-mpxy-device-power.yaml

diff --git a/Documentation/devicetree/bindings/power/riscv,rpmi-device-power.yaml b/Documentation/devicetree/bindings/power/riscv,rpmi-device-power.yaml
new file mode 100644
index 000000000000..5afdc40df7e0
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/riscv,rpmi-device-power.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/riscv,rpmi-device-power.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RISC-V RPMI device power service group based power domain controller
+
+maintainers:
+  - Joshua Yeong <joshua.yeong@starfivetech.com>
+
+description: |
+  The RISC-V Platform Management Interface (RPMI) [1] defines a
+  messaging protocol which is modular and extensible. The supervisor
+  software can send/receive RPMI messages via SBI MPXY extension [2]
+  or some dedicated supervisor-mode RPMI transport.
+
+  The RPMI specification [1] defines device power service group for
+  accessing and controlling the power state of platform devices managed
+  by a platform microcontroller. The supervisor software can access RPMI
+  device power service group via SBI MPXY channel or some dedicated
+  supervisor-mode RPMI transport.
+
+  ===========================================
+  References
+  ===========================================
+
+  [1] RISC-V Platform Management Interface (RPMI) v1.0 (or higher)
+      https://github.com/riscv-non-isa/riscv-rpmi/releases
+
+  [2] RISC-V Supervisor Binary Interface (SBI) v3.0 (or higher)
+      https://github.com/riscv-non-isa/riscv-sbi-doc/releases
+
+properties:
+  compatible:
+    description:
+      Intended for use by the supervisor software.
+    const: riscv,rpmi-device-power
+
+  mboxes:
+    maxItems: 1
+    description:
+      Mailbox channel of the underlying RPMI transport or SBI message proxy channel.
+
+  "#power-domain-cells":
+    const: 1
+    description:
+      Platform specific DOMAIN_ID as defined by the RISC-V Platform Management
+      Interface (RPMI) specification.
+
+required:
+  - compatible
+  - mboxes
+  - "#power-domain-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    power-controller {
+        compatible = "riscv,rpmi-device-power";
+        mboxes = <&mpxy_mbox 0x1002 0x0>;
+        #power-domain-cells = <1>;
+    };
+...
diff --git a/Documentation/devicetree/bindings/power/riscv,rpmi-mpxy-device-power.yaml b/Documentation/devicetree/bindings/power/riscv,rpmi-mpxy-device-power.yaml
new file mode 100644
index 000000000000..2b7df66ba172
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/riscv,rpmi-mpxy-device-power.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/riscv,rpmi-mpxy-device-power.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RISC-V RPMI device power service group based message proxy
+
+maintainers:
+  - Joshua Yeong <joshua.yeong@starfivetech.com>
+
+description: |
+  The RISC-V Platform Management Interface (RPMI) [1] defines a
+  messaging protocol which is modular and extensible. The supervisor
+  software can send/receive RPMI messages via SBI MPXY extension [2]
+  or some dedicated supervisor-mode RPMI transport.
+
+  The RPMI specification [1] defines device power service group for
+  accessing and controlling the power state of platform devices managed
+  by a platform microcontroller. The SBI implementation (machine mode
+  firmware or hypervisor) can implement an SBI MPXY channel to allow RPMI
+  device power service group access to the supervisor software.
+
+  ===========================================
+  References
+  ===========================================
+
+  [1] RISC-V Platform Management Interface (RPMI) v1.0 (or higher)
+      https://github.com/riscv-non-isa/riscv-rpmi/releases
+
+  [2] RISC-V Supervisor Binary Interface (SBI) v3.0 (or higher)
+      https://github.com/riscv-non-isa/riscv-sbi-doc/releases
+
+properties:
+  compatible:
+    description:
+      Intended for use by the SBI implementation.
+    const: riscv,rpmi-mpxy-device-power
+
+  mboxes:
+    maxItems: 1
+    description:
+      Mailbox channel of the underlying RPMI transport.
+
+  riscv,sbi-mpxy-channel-id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      The SBI MPXY channel id to be used for providing RPMI access to
+      the supervisor software.
+
+required:
+  - compatible
+  - mboxes
+  - riscv,sbi-mpxy-channel-id
+
+additionalProperties: false
+
+examples:
+  - |
+    device-power-service {
+        compatible = "riscv,rpmi-mpxy-device-power";
+        mboxes = <&rpmi_shmem_mbox 0x9>;
+        riscv,sbi-mpxy-channel-id = <0x1002>;
+    };
+...
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
