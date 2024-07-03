Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE19EC30658
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jul 2024 02:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DvtB4KjQnPDndKdtEjjSgwCKzH5yFX7FpKuelYrTI+g=; b=Hfpc7JjFZcxSEw
	z9CKJlLi/38pzf6ZwpuOcgR5vlKG6NuEe0HDSkM6rlfKzN/ozHHmwfKs4SldAqcaBw91tcIpFVqL0
	4wTQD9dLB3iHkV9F1Kdee0W5YL+t7jHXhnNQowImaT+EjjvJak31fTI6S2ippgFjZFeEd1EV94jD2
	F4oFMSm3rR04c4r78a9OJPacx2WxwFpHzzA9CXcMjzgPbIP5bI8UR9l0ZViYrquPzx/SgRa4cDcpt
	AyST3jHQJcay/W3S7MjMWfgYr6Dy7ydTnxOuoo57SHvsK1NwxpzpHVqqHRWGVB0cIkfd2fXWD+czH
	5S8DdAYtNW+he7p8Ea8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOpmF-00000008at6-0QrH;
	Wed, 03 Jul 2024 02:31:23 +0000
Received: from mail-mw2nam10olkn20819.outbound.protection.outlook.com ([2a01:111:f403:2c12::819] helo=NAM10-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOpmD-00000008asf-0APz
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jul 2024 02:31:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H75STWHt7VSoFymBjQNZ1lKkIv/P7FVc0cn4Z/4wwtPOwsmQ2/Dv9SSLX/nDhSHeqOC5c0aNsdEtWhacFLCsV7CJRd31HiTp25qcQAYWxKnCs0syxf3psyFEMl5LwrOr+s6i1X201Vd6o7jD/Hfq9HhX9zR2of7l81ZZC6CnvWatec2+SngyeRvYilcBcN5dsksitGUb413aZ02v5n8X3ucWdLgBvARAEC6MiH//DnoG4fR0htzQNS4IxBtdwOQMhdXWR6UAl7/N2TuARLAt+hxJbOIaiR2IPX9Ra8VewxpThZAtmTN96UusvNQRYDvpWRY+PJpsC3O0WqxFzVd2vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NApx2ofCL/ZyIpaLFfQKUZ2T1qNdwWJgOd9Xy49aDag=;
 b=T/p/WFOYmtov//lPl1sZchEoPmjpJkHSC5C056SUcmrmsC5n8O3jkzKBEb5neVOQHWLAWnFDG8MbYrBxtBpnRKuPLeYVrfnaQe0vEp/Lneo2Yxu+oy2Q677m9GvL5ZKm6YeVTFxTqcUi4LtX2uWeUGmB1PSJbGkStjNri1tJ2qvDpRpOn7VMd+gilABIxEdWBCL0y6mGcTgY48flfgrfbmtYaoUtZr27vsBnI69dvwV5n+PY9RwHHSxO9quewvBUnMY8uMApuLZUAIgRWwRCTMjQ6vXUBEgUTmZgqODlgatTaRT446BuFZEPVrXIYtRyI0ptLkNBaD5xGPijCNUY4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NApx2ofCL/ZyIpaLFfQKUZ2T1qNdwWJgOd9Xy49aDag=;
 b=Y5ssXGl7eaHFWHcWrT1IJh9WzHgLOT7WtBhAaVxqzRZRRKHSu2t81GzIeA6DLSO7RzeHgiMliGbvA5ikNySPn2ETXyIeih9xhHf0sg74OkDS9SIc5U6IwWn4sx+SsYwLqsjSh9wzps7GsB+fcYsJTg3yUYJGH6WKDYXSHdGtc6JPywxyLdLYuz7Xhe76wb64I26I+Mc0ClIjV0KULNg5CUYgVC954xeAfdeyn+ZPiBd+TU5RBibbSg8D65SP2iebJlu6bOn3x9mcrqdhzAsUDv5pBkLGtPDkT4JY7lsHB6MSmtat6afKr+KE/63cDofrw46Q9oc4AqsBwj3hsKpP1Q==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by SN7PR20MB5580.namprd20.prod.outlook.com (2603:10b6:806:29b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.28; Wed, 3 Jul
 2024 02:31:15 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%6]) with mapi id 15.20.7719.028; Wed, 3 Jul 2024
 02:31:15 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v6 1/2] dt-bindings: hwmon: Add Sophgo SG2042 external hardware monitor support
Date: Wed,  3 Jul 2024 10:30:43 +0800
Message-ID: <IA1PR20MB4953F58B631D836F3863115ABBDD2@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <IA1PR20MB4953967EA6AF3A6EFAE6AB10BBDD2@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB4953967EA6AF3A6EFAE6AB10BBDD2@IA1PR20MB4953.namprd20.prod.outlook.com>
X-TMN: [b4XMdYwa+zi6fsOIOzEadg1xIScBWoO8Q6X6t4gaki4=]
X-ClientProxiedBy: TYCPR01CA0119.jpnprd01.prod.outlook.com
 (2603:1096:405:4::35) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20240703023045.272744-1-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|SN7PR20MB5580:EE_
X-MS-Office365-Filtering-Correlation-Id: de413423-4fa2-49dd-2730-08dc9b083601
X-Microsoft-Antispam: BCL:0;ARA:14566002|8060799006|461199028|3412199025|4302099013|440099028|1602099012|1710799026;
X-Microsoft-Antispam-Message-Info: oPW9S695+Q0V1sgiJ9+IrVSgeuks/XCJStIAoqrJaifdpUhqVBErx6j1Km/Uo8NYSKQLatxHiaqu7N+G4ZHrC156V9jR8Yix3HJiLNtdybDiZYw2rH0iL79coL6SMVRaJhGyfJe+R4V7c2tlAkZh57QYd5D/RIfZ0U59xPKJ4pKfLFToR09EpZZFxdDJmVEOTkuFvcSahIDti760lI6rTMBTzdDTD7QXqpCXpK9lVFnrLC9KLNAuIDSXGECu7MoflYDG0Joh9tRsFMn1N7OGUs2riUn6CNkDU9+Gbe1fowVJW3qR5ZyAXxm64wVJRU74IBjPgrxeDqFql7L1bMHG3Aql5TKEvQQdMo4YAFdJLIAXFt809YsuiVFhDpLAmzV5PhIBGJanKSpRT4pxh8YAapFHn+V9pwrgDQLBZlO53kMiZoWprOFPhgxqelmDvWPPhpp9ts5p6mwybI2GIQ9GgQX4RL5KfdjhsS7X0s718sI6ddmWpYHSAtkg6PKdG4M7gFyQ4FFXnVRfEItNu3DtY1Oimtnv9tNLxmAuQJ3eL2L96N3g2q9D7/HrQwf4wnXRqI8y1Tes6o0mFYpK6xHb1uHz4XaYSEVjZp4i05nNn8156bRPRL+XsZg39B1RqAWNcQt7VqreAnpSh0/KAhNozrCY+dtb1byVO2dP9OyDEjz4FA/ATsBu9YZrWWHM8LTEEX5/MHrgB7e75a1+hBR3eoCbN2XucBc9GstHBizQbEIR1Gozdof21ozm4xsrh7co
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?D9OvPU2bFjmxQxE1hGmStOfPlJS6XFG3Zm8CFs3/vgincu+es9GDiY/SWriK?=
 =?us-ascii?Q?bSYQEIpG7Z0VgL/duQXdhBF9HMqGuMl/uQrjXCV2ueET+CEjIlgleqIAP9dM?=
 =?us-ascii?Q?8+y+cmTjI74IxzyzmWh4nCIFUJ8pxUDmjK2jdet6id25XrDJINIyCtlqDUmO?=
 =?us-ascii?Q?aaO/kTew9ZzlkGia9BpU0DClM4xYAq+lOFlrLkbBQqJ+IOeWmVneRPzay//j?=
 =?us-ascii?Q?F8v474oRXKvmkmiwVJoX4vB7ehLFVdQj2NEquPhjbnGhMP6o56Bhn2xWAtZH?=
 =?us-ascii?Q?sHEXHIS6CHzz6MwQVkHgZITed9tqoQ+kzrfYddiyTwyTlgo3JPneRScSwnGC?=
 =?us-ascii?Q?cxP8CVhuveqp65EBJegzKFMKZf8YNVLuXzUs+XJq4LzBaUGlVaJbzOi7UfeI?=
 =?us-ascii?Q?YdDr6TiZEO8CXuqbjZTccRb5DbKkEDUoIke4aXYiTD1rz6amfFt6DRV1sBMO?=
 =?us-ascii?Q?mdHtxla1S1Q9bH11RpW51bdMS9yLkoQ07Ah7W8ykEvlb5P79pTt7cLas5l3e?=
 =?us-ascii?Q?jk7RiOIeeKRTLzi6dijnSIiPIMKntW/jJgVmsvOpbem1FIJ6raSEfWLQap4/?=
 =?us-ascii?Q?TuB7EEuF1vK6DgFvql/CNW/YjJEvSpDYX5nTFWQoUsZnTOv/FNaQwqGjTK6T?=
 =?us-ascii?Q?wX7GZgkaJA//x7CySNwPQhrU9scLyxkLA+Ui1CXUmB+9LP8O4aqSMM80XLMl?=
 =?us-ascii?Q?IH22HYNBKgil48cm9+QVmvok47OYTaFOBjIscRqR9YWc+05Wa96z5ZJ1+wcl?=
 =?us-ascii?Q?RbrTfwPFKKdcUNZuFk1+ysNSb7tG/ZyEYEfIjidASZ8QWnV86TWOanOfjhts?=
 =?us-ascii?Q?qbQcnv+UOBz4Wjtszvfb0ApUioPkQO10qMDAx5lQ2BLJjBRMiRFM+euGYA4c?=
 =?us-ascii?Q?T1MzZ2ALH7P8r1850HIf0tgQDFuY+coSvvgw+Hkf6ED6zv95G5Y1oNS7yuV6?=
 =?us-ascii?Q?o4s0J08hYfE9nvM3xnTJmLzBPhK1wbUrW/lFijR/ESCuIx9fbaOwR8j1GfAm?=
 =?us-ascii?Q?1yWqTV5TMAp2cE2JPRCr/mkrguPz3PcFTrj2PeIi6iZuTSmQ53IaaGlenIZe?=
 =?us-ascii?Q?EeUVNQ5uCZZW/D1Ve48enmVDALonLO9aN/VhcMSFkQMJ4XJYFDxDiJfXGnAz?=
 =?us-ascii?Q?pADNAXhnFwZwut5JBoEZlQFp6xpxB9VccNoaBL1w3wn5iooNMvhhQNAcMB4U?=
 =?us-ascii?Q?PAJF5/+NwIMuHRvXmPYt293cIYI3pmcvbr6NfSHANvUBsQ3lhn0DhsFhCr84?=
 =?us-ascii?Q?WFpV1ESTBxl8dT/uwv7L?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de413423-4fa2-49dd-2730-08dc9b083601
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2024 02:31:14.9201
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR20MB5580
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240702_193121_103857_B348C031 
X-CRM114-Status: GOOD (  10.45  )
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

Due to the design, Sophgo SG2042 use an external MCU to provide
hardware information, thermal information and reset control.

Add bindings for this monitor device.

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../hwmon/sophgo,sg2042-hwmon-mcu.yaml        | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/sophgo,sg2042-hwmon-mcu.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/sophgo,sg2042-hwmon-mcu.yaml b/Documentation/devicetree/bindings/hwmon/sophgo,sg2042-hwmon-mcu.yaml
new file mode 100644
index 000000000000..f0667ac41d75
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/sophgo,sg2042-hwmon-mcu.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/sophgo,sg2042-hwmon-mcu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo SG2042 onboard MCU support
+
+maintainers:
+  - Inochi Amaoto <inochiama@outlook.com>
+
+properties:
+  compatible:
+    const: sophgo,sg2042-hwmon-mcu
+
+  reg:
+    maxItems: 1
+
+  "#thermal-sensor-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - "#thermal-sensor-cells"
+
+allOf:
+  - $ref: /schemas/thermal/thermal-sensor.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        hwmon@17 {
+            compatible = "sophgo,sg2042-hwmon-mcu";
+            reg = <0x17>;
+            #thermal-sensor-cells = <1>;
+        };
+    };
--
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
