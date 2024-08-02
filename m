Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF4ABC52D6D
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Aug 2024 12:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6l4V+tPetYj0vJDDBngn17kSfyj2OAEf8EECS1kLVeE=; b=LldyfqTawhwgg9
	ZOLSMmMMvStN+RWsNMgkdCVoFGx0o1+p3u88C8AG7rYHuM1msuxGV7RIcZD1WJSOATZ8NPTEny0k7
	yZKNfnTI6nHeMakSnx9xZ7P86rzTV/d3V4IZBBnth4nGnqweLrMwU5T7PvQjwpe/Fm7ym1usOsLud
	lEybAcGhoMNL6PQpw3uMpHCDAsGm0y+aGkGJrlALNLmVaO/9kJRtPdmipQhj5kRMyfR5oe/UPe39f
	qpMhfRC4bUttzNPDEQApuZZzTd4dY2wNzr6TZQZIxTxQggGYQgc78S9nwk4C/u3Y3wLNNX+l9GnO1
	dKWjFKs7IrdLr/iNuL3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZrZ3-00000008pL1-0FRP;
	Fri, 02 Aug 2024 12:39:21 +0000
Received: from mail-dm6nam10olkn2082d.outbound.protection.outlook.com ([2a01:111:f400:7e88::82d] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZrZ0-00000008pK9-0lsU
	for linux-riscv@lists.infradead.org;
	Fri, 02 Aug 2024 12:39:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=glgdLocOXZ3eID9KMtX/Xaf/ZjMY9yqAxZ0cWpXItz1ZvhF9Bf1BFn2bC2wikQjdCyfcFUuLKgAMLkj9xc4zZNbpuS24Vwd36BnyH/rXqC/IiczgsAktLxobJHZ2CvvPVrV9O4wC3t7bJR3GqNBlV8pPjT3kJ3k0vHnEi/0YhQ1O/yhbUOoi8yHZtY4SHwDbfoL/8cqjz1+H2La1XVLsgmadr514xBshpVN/Fay3ETpGO7wu3+RRUAEuH+oEcIT14B/FB0g9wkt+vXVB/jSR9k/+IKrs4OfXaEp9gjrYT8Gb5snEbh0jb8YAD8Zqi4ysO0hB6X3S374lwwYIav6EBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pYrG99WMMaEn/7nhZeUcYwO99UpIRAGGmfiQygB+tpI=;
 b=Sbj+4yTFSUndfwHSCF71CnBFdWTSVSXYnX65mm+FGXePVcCRMtxjjMEWn2t78g1S13R2YWZyaLfqlikfKLBDvTLLZRwoOPkETI23WS7LYht1MegvdO2LuyOzTzps9s0vJiWT4W0awpHtpOFFUAt0t6goA89ph6lxh5T0qbaAlwbXRofPzPeGwBBFtCn1ErBCdbvw0ID5MAhnIH20Tv5G/ZOXEtSaBUiladF09cEWmlW1r5MfQtdve/E8bu5688HIKbEw7p+cdS5ZJm8MSpOuan0KD289USV2qrr3j956R2GnWHJVDSLILCOG1eaR8FOQFh67tMRRW0/ilgxG2xfz9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pYrG99WMMaEn/7nhZeUcYwO99UpIRAGGmfiQygB+tpI=;
 b=mCoXO2sLlESRTx+/8gP0q5FvV3LgHG1ScxU93Gke+R1Qnsi0/2xZEU2tL99mXC74V+MZS9lOSf87sVktOUSJ+mhpWsjiPRve5EVDlbY+ROwjOFhbpAqUNjftqWPwoW9d/geBjSIsSfxJKC8N/2l0qpSTHy7flHpBU/WUwfJqDXjoUlfhlJkfiuQqAhfxWKrmIL6LU1tw1wniSFglBNqJYBNqO5o7mAKZ0amR+Xbf9LkqhB2vNewcC5iAW8uP2aXj22kX7UIC5f0iv5uR4e+Tt4xTpFHnJdMQQy9QIsKVRwW6pUC40E//4S+gjL4TVDJL9jHdQKuRXDAlfbylk0UFRg==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by CY8PR20MB5499.namprd20.prod.outlook.com (2603:10b6:930:55::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Fri, 2 Aug
 2024 12:39:13 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%4]) with mapi id 15.20.7828.023; Fri, 2 Aug 2024
 12:39:13 +0000
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
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>,
	Jinyu Tang <tangjinyu@tinylab.org>,
	Hal Feng <hal.feng@starfivetech.com>,
	Yangyu Chen <cyy@cyyself.name>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v9 1/4] dt-bindings: hwmon: Add Sophgo SG2042 external hardware monitor support
Date: Fri,  2 Aug 2024 20:38:38 +0800
Message-ID: <IA1PR20MB495302421DD95CE6BD76FBFFBBB32@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <IA1PR20MB495337877FFC8D787A045C15BBB32@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB495337877FFC8D787A045C15BBB32@IA1PR20MB4953.namprd20.prod.outlook.com>
X-TMN: [z+H1SQR6E7bOTZOmBlJx/WjDuZGComY8OSJzcZoVEIw=]
X-ClientProxiedBy: SGAP274CA0022.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::34)
 To IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20240802123842.1492286-1-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|CY8PR20MB5499:EE_
X-MS-Office365-Filtering-Correlation-Id: 9df565ba-6034-4288-fa26-08dcb2f01ced
X-Microsoft-Antispam: BCL:0;ARA:14566002|19110799003|8060799006|5072599009|461199028|1602099012|3412199025|4302099013|440099028|1710799026;
X-Microsoft-Antispam-Message-Info: Mg+RUfP6sPkO3DksIcn4TwpXUdEml5D1J25BBI1Cbz4ty1UuDBEHYpKY2JA1aZh3wsnXYVFESAuV57AJh90b30K4tqLLrCnbgbsXkIzPL2rPhO19du4uEX08PSP6wV+SQu8OD9Dgm5zn2NYVPKYIc+Lt5TvY8v2mmC0ejRsBHTWYccZehstdhcZDjNqvalC/gWYEp4BwXmHB4Km3VmithYBh8BLMxGA/FTrsWdH3NvKp0oiFnxcyKPKbjiCgA6CCkmRibdn8rFVPHUcuZftt1FK4ES6MSAYB1xPznQOAsFkb/P5AGtM9UE4oERCUCCOxaLd8hRhG8J78EOcQh0fcW24uhl2UngtEKucRV+qx5ThIFoDu5jVTxxMMRpLKRYm1XS21gIOvPFkDqR53uKoDNB/dYB9IrotD6wm4+I6ufC7lefAoKPRMmJx+UY4ban7u7u0vhUaH7hp9EuLUVGU+ZeK2V5YHpV3v/H12SDIERbCy1+09gnKHxl91NEQ3gR8MpyZWEqsufehKZfyufCf58risUOOSTVot7mgyHUQ60qPfdMubN/G8j53SoaIVupYgA9hs2ZhuEJf53Z88J4+iOfQGG2iZx2pF6A5XUzNlq9rb/r7UPyNId8Uh94KBtxCELewyggXDxXBlSE2IJK4wDEb/A5Ah1ZVUpfSUg637utMHffi4BkmmHZS95CTN2ypToBJPBW97iCyZqD/KV+vMDgpOZERfbxFjZfBXolDkxca0T7lHxpB0zgKyplaLks/ZuesTwGSFKTfcobQlGiy0vjnQajK/SpBI5yZXm4Eotm0hw4K/HuebBCBkVZ08uWFT
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XjhQ2Ah6rDHKy+02+zIvQg+B4F70ZOi9zN/+V2Uv18WPYNxCzKQlT0MQ4tPX?=
 =?us-ascii?Q?1U5fZkq9KmJhwjuvL8Q/XUBBO+np3+mLIz+Tb5E6AKZdI3VGhRxS8oMeyts/?=
 =?us-ascii?Q?13Vt9kK7rjbMk96eCuBnFOxG72zJgXr/2FnZScSTkUvARvPQmlz0viHcqx+T?=
 =?us-ascii?Q?4dz2DbBTf7HlzUTdqg7WDgY2SlCi5eOwzv6kMkLB5daNF+uZ6PZmK4zmcrCA?=
 =?us-ascii?Q?ktpBOfT3A6Ny7iKixD50ArpWheWT8vukhxRQs/UkfB4KPSMgT1oPmbGbE41V?=
 =?us-ascii?Q?FzNHa4b3j89U/WVEWj3Nnd6/ifOJ6rTdUMsLz+Hql8PSkV3iV2Uh6sOxo8/+?=
 =?us-ascii?Q?rbj2L3N8OTwktrfYtbkJJT3pKyjELmOgn1JeLzPrpSkxKuUMA6ycpkWP8yA9?=
 =?us-ascii?Q?3sO0o4E8X7MULingtpaj+Q9hkWlElYLjy3DDfS5ccNphZQTmSC+weyqwjJ03?=
 =?us-ascii?Q?T/LLA2CvaoaUWI0/eYnP7YH7ToqCemLt1xtVGWoSrKAvQoX3gRfy0Fq0nFAQ?=
 =?us-ascii?Q?bOUvYlaYuQPs1Sgo5v4Ivau2Ndh+3IZCjcknaRd0jN6YNHyvJL/gZBZfAVsH?=
 =?us-ascii?Q?EUkA/JuupbwRdBMNzOR8TR9d4J4wrkVBRJr1sY45PMwSLoULww8ZP8STmww9?=
 =?us-ascii?Q?wt8qIGbAKtaxWOVh7RXt60GW95iWjz3/gCV9DsX8oFjkh8txSrItsDYJJp0V?=
 =?us-ascii?Q?GIB5ghjLeZ+Tbx9i1bhvGhjHwsHv3icZxHSHEWdtv9H8ktUM6w8Uvh5wx1ur?=
 =?us-ascii?Q?THqqZq4driklOhaA0QsJZsbH43M+db/DYaOXZoxaEBNNcixE+uYQpsBJDsQT?=
 =?us-ascii?Q?oUPAr2dOqNi1B41uCo9Pd1mR9LafbIZ7h12Vez7FCjCxVk9DEzZ0g/zMjeau?=
 =?us-ascii?Q?WSpzosX9u99yG3CVAXCGN9rbaEOa6uJR56zjs+h7xkmx1KoHQm0GuKDaGYw6?=
 =?us-ascii?Q?hM9HUqnbVXOQB/2aaGt0QlV4awRsDGFcu5Jfs0lJ1K6AHikhtefW6FrPXgtq?=
 =?us-ascii?Q?lDB5m67mSSk95q0jsiNQbU+7kU9txClLi8WlzBZpjvEMs14LBuTW1cJPEsaB?=
 =?us-ascii?Q?k76wSTNfFMMFH06quy054OlIZxOB9yjpNBqe7gw40DxkWkf+q5kJlpctPeiB?=
 =?us-ascii?Q?PNlGCML014ieKyXnXnCDThhxe5Ep82bmKrKVtLu2/g3LJ1u+PLGDQCHEbAUn?=
 =?us-ascii?Q?zILsYPWhNw2OL1q7kQlWjXVx0+27a3q8SF7twHFQx3wA7q7Gx3RdotKcVDqz?=
 =?us-ascii?Q?BR+vB6SXfJcgV29nPZKm?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9df565ba-6034-4288-fa26-08dcb2f01ced
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 12:39:13.1469
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR20MB5499
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240802_053918_251629_E53DE3E5 
X-CRM114-Status: GOOD (  10.73  )
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
Tested-by: Chen Wang <unicorn_wang@outlook.com>
Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
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
2.46.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
