Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADC5CC3DA49
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Aug 2024 08:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zPaSh1RZpM8O1ld1bq33yu8Tql+jstYiNzn5+JVFde8=; b=T9L1+RGhgkF3KF
	MXbzcMF9/c/oq2jAosWdNWLej8UbmBWEjB5FHX9oel3Bl/xZDwcxb6cghelDiOu9usPKpxTrF5XII
	ljwmg9K6Pb6zPyEjEmIEbqi+sKvvA6cDYgsVtlD3BQvryfo+Z52QJHgu11yadylWRnklFU43NJ90v
	ph1zZ/JI4+dc1TGkScE4eMr8TJZwcwGdqB9mDPsUVIc/KSakUJ4Lc0ZhFDQ7hLq/lEYM+MfJUwwkx
	/7z0InDjhKTjcdBEyNu8rabg2G1rRkl28WmSKy3Gq95ZsFXXFPIh1Ahn9TXbaMcU+a0R6D7kLQ4mF
	iT5z6n9Dq1LnVcEGBAaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZnj7-000000087Cy-2SJV;
	Fri, 02 Aug 2024 08:33:29 +0000
Received: from mail-co1nam11olkn20800.outbound.protection.outlook.com ([2a01:111:f403:2c16::800] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZnj4-000000087C1-3h0X
	for linux-riscv@lists.infradead.org;
	Fri, 02 Aug 2024 08:33:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O/Gg6whb8jM7MjAEzpuibgypIIPjzYoV5jjNVPuLdZlitD5Cki0xYSeHBiF3WcdZ+IH6JPgwKSBwq1ZsECnv7aL2kVOp67pJnyEArHaPiw4BIi8mfsxvK4BXL1eBIqFbKYqFMsaqf/+Uj3Gh/fE5LVGEcrYiFVvJRlfPbLBG5QbCNSfAoNkGB4FqJJQYQM2eAGk58rHbiygswb6CeI3jngO/uwFkKQsDgvK+Da/ZycYdbVv+VaUMDz762mdI6RExxWY0rWiqc8+3oiG+J+KUVaH9l4m1z2Top/Ri3hxhSDk3a2NED6bnm8oRt8hnFVTBLuFzeWcovoZc0lgP82ULFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ZtwLfEAIwX5DWr6vytg9ubmmdOMsaDag4kdisGTopI=;
 b=EAiWYFAeAtki0XkaqXa9u5e58pGajK5sXlFEDkK+fr3qZiEjy3yxWOZV/E451gqhY2dJPSOJyfKPR/nQqA9KK5lQ2yx2y/Rel2KW+OuUSsrTBuFq3ibA2C2exikPG0KpU/dqob44I+Fb5yw9NFv4X1//JI8ok5cpyYH3bJ/LBVTTecmBw8+iBtYYyE6goLyxYyOS/FfUlnQ/DKDx82rKbA31UFxYsZY5979rcwi3X6IMmYwW2tWj2X15kraquOuPQ9WfX8wm1vzLZ48YKyENelMKT4znpv1o2deU0H2H2+t3LrmrJjEfywLxF8AXWFZ/neaYbSl4+P5dLUCN9OLrFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ZtwLfEAIwX5DWr6vytg9ubmmdOMsaDag4kdisGTopI=;
 b=Aca8uXbGb5idyIYv2MgsamQN9VhSLF8GDV+lPvdDQGqhAENUq0QHecKONxO8asHO07s+BbedKwU2SrNZfuGX/IQiEocRyVQzhPfX+h8rLUZaGrFBns9MXoo0b8JPLPPcgF57aZZ7ywSqWVUYcbh36TFMtYhvwiiL3OitbVEGrA8T6e4v+zwgkfzUEwkO4SJDsl9CDsbjbRP5EOOPvixb3/73fPRLCOxWopN1rfyOinlI/vB7sVzyUe9jWFvqhVeiYsk1AlX1QRui94FMnvh6alGcrv4MQ9e4iFOmCz1eCtHn83TYpQxElm6I08sgk7dvJ2eH6CyxRM6dZe3CzC0HyA==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by CH3PR20MB7441.namprd20.prod.outlook.com (2603:10b6:610:1e5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23; Fri, 2 Aug
 2024 08:33:20 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%4]) with mapi id 15.20.7828.023; Fri, 2 Aug 2024
 08:33:20 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v9 1/3] dt-bindings: dmaengine: Add dma multiplexer for CV18XX/SG200X series SoC
Date: Fri,  2 Aug 2024 16:32:47 +0800
Message-ID: <IA1PR20MB495360B076BE4DA4E66B48BABBB32@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <IA1PR20MB495332ACF71E3E8D631508B2BBB32@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB495332ACF71E3E8D631508B2BBB32@IA1PR20MB4953.namprd20.prod.outlook.com>
X-TMN: [kHe9WPqGnajXVyxl2gDOnIbPzlbgtgD5rty97HWOwEc=]
X-ClientProxiedBy: TYWPR01CA0049.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::20) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20240802083252.1286244-1-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|CH3PR20MB7441:EE_
X-MS-Office365-Filtering-Correlation-Id: ca88e89a-c136-45c8-806c-08dcb2cdc386
X-Microsoft-Antispam: BCL:0;ARA:14566002|461199028|5072599009|8060799006|19110799003|3412199025|4302099013|440099028|1602099012|1710799026;
X-Microsoft-Antispam-Message-Info: okCd0o1X6w2NRq839hG9xtf6gxTpltWLW6ffjf1JFa932d6Dgwka5IjVRTMnY6BrA31OByvBzLv8x7ibftiYQyt9vBKFK9JJ9WB9gt7rbRcZf4vaNfQKFS0BjKRCT/cHCMviagjnVaMGLbvFC7FFva9uXoEeu+eXGRXCRnkXtlH74v453gX1jX4lnFmtwsgwWg6/LbTYr1H/zTUcHAza7RRmhnSqAUi3E8TGRvRceDXE98LEDBPJCrS4oTsRlutyHVsAafCNDL7lBNS4Nzr4zEE3JxaEqhutLfZaHeGMoiVQqXD00GbP8opZvNTzOQD4xopIHKK8RHhIonDrRRcJ/qxdyiDnbrGmSRm/sQ0uRBwKr3fyq8alTsYPt4zu6w/Q2B3VxQwJGL6IxbKOsmGbNXWsGbM/sGG90/NaUsSp511pDDn6XUneMt2IMua6SM97SnCi4TXWc9L4SDBFizkl4YXVriMpWOkb3fDEUqLjTpZW3Cv21gCZu4T+FMxI4C/ksfIpGl2jkt3rXk76h7nSj+4MepLmobH8ECfRleSOpqidtRbwiSAsm5osGndOmmQwZdWnbq6mbKUPV1RGjeXH/XNESFR7wWvH9fq3fU4dj6oKeDxV/So72WfxXAPtqlkzf4fJxRL/CqNzZv6wp8kWEBepqA5qZnWuHC7iXrA9ay2MX30Fhj9Vz5RHWFC/LhkoDC2XgDEp3lIX4ADfr0nAMIwYsdzWYfF/wx+9q2Fksa0ot9rDoWxrvvxiJO0z4rJ8+6kYKLLZqzzvW7NpBFqVhr7XCgix0nkpMFYHjCS8wiHAgNVgVDtZ3fjV8idCb0yd
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fPP2HKmBmVn3Vm2dby3oFbrWX5mI2GRsBdqICExgEVDPHIB0MAA5QNS32ZDX?=
 =?us-ascii?Q?5+wHreDkMNVGXxPzKpDnOSiKTsT0Ac2GN/6F3JRnDx0wGwgUi3miq7gLAMzc?=
 =?us-ascii?Q?I11DYBa1BTyN75XADWKfkaIhhGeyy+FxdKQDoDE+GJ94feMq/3MfflhASvOf?=
 =?us-ascii?Q?HuGe4EkM2T3DocXRCC6ndxQF4WIR9PLYKO/Xl2GRf7NG33+fzH1BtiXI4dOR?=
 =?us-ascii?Q?ikD6KEE7fonJgFOtZ5cFOhynyBnDBkdSMjoXhg/24j82whS56Q6mcA38FdTD?=
 =?us-ascii?Q?ml9sFgCbL+Dnp9cM2UWb/jzuwPI/8Y3kVvivXbLCwicb5FqclRgDkpPS9JgR?=
 =?us-ascii?Q?pHmcqMFs+fByJ+qCCDeCZC4Ilap+kQDGOYyjXnW4UXcvEu8EZuDS3eeJFp6Z?=
 =?us-ascii?Q?ilkfDHMiBcR+zrInjRIpfdA3IX5ySuX9JnrvpLEaW2aUYR3ECKcbs+WVG8MB?=
 =?us-ascii?Q?nDAGFHd8282FSkF6vHETHf+zTnFrfc845Ey/BV0a6WfxLWiG8L5XoJG7AopZ?=
 =?us-ascii?Q?epQzpX1PoQBKM+/DJHO5Tut9rn7DqCazvm8JGYdwy4CYsYlBRDTOPWZHVIZj?=
 =?us-ascii?Q?PNeq8UGaQJA+XWMeb57Y2uIh2ZG4+SZ/k9POTGO1cRLSZW2dHf/9W5mDSA/S?=
 =?us-ascii?Q?1TCEJozDsV8NuxGnYvOl24eHy5tXnVceUT2YnQNv/9+9mhrxdUR0fmrjQ8l4?=
 =?us-ascii?Q?2MHNszONyDhzsmWSgha8JBu8XYJNbAGgY+k14PoW7KRz1puU/dCtN1MuOIpj?=
 =?us-ascii?Q?+k1vw/57im6n2++gG7SdRtDEOerI4alCpQMpTiOZSRgFvaM1ohDYZxECWo8s?=
 =?us-ascii?Q?cib1TF0Hzpe4QFsjjUBuPTZZyraZThSsW7atX0cmdUWcs2egUQaKBU0YKM5r?=
 =?us-ascii?Q?QWdqs4YiIWheHWH4JKsFbMsUhLBd46Mzh2/ctcCEcXPxlS5ZL8eqq3sHK491?=
 =?us-ascii?Q?ILzOlxqkXm3sbq2e+Gno/qa2WYfwmpS9FSIkN72vLqgSRrIS9bKfIhMUqenC?=
 =?us-ascii?Q?vXBOCnnVoPSV9eu4frEBiiKIw8Vxs8ztxFpzsEitX6eWI5UFFpRZ/u8ZX500?=
 =?us-ascii?Q?YocFWzNbqO4w41JrFUKuUhhmULxw5fRwnGhHMPQA3ZI6nOMR/yjAxRooBxsm?=
 =?us-ascii?Q?octjop/oQQ/ds9SCHyfKbSsCacELesgVhfXJYz0AnuEWMT0UFMwBQ87kg51Z?=
 =?us-ascii?Q?cFS75TO5SrmnkvPGyMDD3SoSv5C059natjjZEYkCd5dQtB9ZGW8JaqCLtTyt?=
 =?us-ascii?Q?zTRZUyjis7bZu0FxxDg7?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca88e89a-c136-45c8-806c-08dcb2cdc386
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 08:33:20.0107
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR20MB7441
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240802_013326_943531_3D2F18CC 
X-CRM114-Status: GOOD (  12.39  )
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

The DMA IP of Sophgo CV18XX/SG200X is based on a DW AXI CORE, with
an additional channel remap register located in the top system control
area. The DMA channel is exclusive to each core.

In addition, the DMA multiplexer is a subdevice of system controller,
so this binding only contains necessary properties for the multiplexer
itself.

Add the dmamux binding for CV18XX/SG200X series SoC.

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
---
 .../bindings/dma/sophgo,cv1800-dmamux.yaml    | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/sophgo,cv1800-dmamux.yaml

diff --git a/Documentation/devicetree/bindings/dma/sophgo,cv1800-dmamux.yaml b/Documentation/devicetree/bindings/dma/sophgo,cv1800-dmamux.yaml
new file mode 100644
index 000000000000..11a098ed138a
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/sophgo,cv1800-dmamux.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dma/sophgo,cv1800-dmamux.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo CV1800/SG200 Series DMA multiplexer
+
+maintainers:
+  - Inochi Amaoto <inochiama@outlook.com>
+
+description: |
+  The DMA multiplexer of CV1800 is a subdevice of the system
+  controller. It support mapping 8 channels, but each channel
+  can be mapped only once.
+
+allOf:
+  - $ref: dma-router.yaml#
+
+properties:
+  compatible:
+    const: sophgo,cv1800b-dmamux
+
+  reg:
+    items:
+      - description: DMA channal remapping register
+      - description: DMA channel interrupt mapping register
+
+  '#dma-cells':
+    const: 2
+    description:
+      The first cells is device id. The second one is the cpu id.
+
+  dma-masters:
+    maxItems: 1
+
+required:
+  - reg
+  - '#dma-cells'
+  - dma-masters
+
+additionalProperties: false
+
+examples:
+  - |
+    dma-router@154 {
+      compatible = "sophgo,cv1800b-dmamux";
+      reg = <0x154 0x8>, <0x298 0x4>;
+      #dma-cells = <2>;
+      dma-masters = <&dmac>;
+    };
--
2.46.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
