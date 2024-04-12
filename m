Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB736C00A94
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 07:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zfctx22gUuPGBbRWoIZoZwhiJdJqo73npibfXbUmq48=; b=sHrNXZ/RyIumkz
	bFoPxjxyExoGSDmN9mfFg+MyeUBpHPUysp1mai7rgGLwNm0EthMGyevexcnpDFYnWWTEvxv1QUsTO
	k6Gpe0EORsL9PtNq5MUNjk10rc5n1+rZhRYxDLado4IP3Dnd+f/AgZ9QO3DjrNsyPJzMdM9dNRrDh
	prNamR0s/VQP6rrR+HC3zRAXcS3ONWwNkQrAOGbgNuF2OytHJIoICis04I16dc5PXV0d9F3OppE4k
	ls6Ad1c01ORpYO4NOfTF8S0Os5WngIK76Uy+2yQLouIbrHdRv9U6bxtRaDBEwE/+d/FLi37GINsiy
	NF0niQZt2LOmuJEeWfDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvBF0-0000000FolG-221A;
	Fri, 12 Apr 2024 07:22:30 +0000
Received: from mail-mw2nam10olkn20801.outbound.protection.outlook.com ([2a01:111:f403:2c12::801] helo=NAM10-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvBEx-0000000FohE-0Dtm;
	Fri, 12 Apr 2024 07:22:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YMzSeHnOfVGsvjFCLKGQVhLttbrLiO8ZH94DzEa0rMH5AMMi1wlz7c/O8Fr0ZjkVbCP5KqF9sYz7JXTfnlAhmyuqZ515dCYU+0he++Zx1GJVJhZZo06SMhpLFCRLhx625MFZRYzEkZpGE/W059SN1dMliuMBp7ftTpYucp8xtT6y82MejwDGD2Mvp7jLu2MPrqo02mgEb6e4GdNvw2qMqyHYEmvBCTcI9//Z11/NWRkw03OxtahtLHIqnYaiScYtg3QL193SkBlivw2562SsNY9C02ZcuaO8Lp53URVqEJ1c3QhbjQaufYkHuoDsjT0pZcBOVXlx9xRNairTLzH/Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9orR8NrFwt5ihPrhce3Ei6vQWvU8oXwr9Lg5EYAoQys=;
 b=WrDkVskU/8+BElA2NtmUTGmWsnfTJ9LWkLkqmxiZTHWdttyTvVigwiaZhCvP4ghucJlsfMUm0uutm0oj1f4z6i88PXvdFdOmkkDjcCNzLfOuyTEpT9E251yjOVB/NhqmwEegGzqP47jtjsg2QqX+VPI3Rkleq5l/Tq12oKwboUGJxl2ZsbRUpjaLUgZOvc7pFEcfkvaIxQVJoD0r7Z1uTV4RBJrYofa723O1JBoTf/XrTv8Da18q+gU7jjZP02yq/ZxN/xp5Gv2LKJiwpxS+ZaIRWS+efvehVswTnHheA9VNAkIb4wikXZ1z61EqaaVzVX7zkyaSzvqcX3G4y58/3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9orR8NrFwt5ihPrhce3Ei6vQWvU8oXwr9Lg5EYAoQys=;
 b=P1AWM6b6TxTAhqyPBi7TnyM7yogcS5uDPKts5cK6hriUHBGe+sUM/CVmPxcfk3luYDf9kHC0yHLeIGWNEi1adzaI3vkeKNAgaCs29HqNzsQXcXJ54TGl6tjilJc6PH+U5TELPq5fAR6dknxN3FodA15CvXkWiik3JvJUQ+aUKuCPwFPWDr4/nfL1Y3kB/iST8tDywzNXImKw0Zk8UQqwG5z0xaq6QGCOzXh6N+rISKC0T+3+AyCqA2VjWuYMRInZ2RK6/Q+45Lp0r7HRI10YeYKSBpE53nNieqjeG69ClN3RyFHDxePPLHTxvsD6rwWLJ3wnE04Adkh+9wUuKv9qTg==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by SN7PR20MB5795.namprd20.prod.outlook.com (2603:10b6:806:32b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Fri, 12 Apr
 2024 07:22:12 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::182f:841b:6e76:b819]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::182f:841b:6e76:b819%2]) with mapi id 15.20.7409.042; Fri, 12 Apr 2024
 07:22:11 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Jisheng Zhang <jszhang@kernel.org>,
	Liu Gui <kenneth.liu@sophgo.com>,
	Jingbao Qiu <qiujingbao.dlmu@gmail.com>,
	dlan@gentoo.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 1/2] dt-bindings: phy: Add Sophgo CV1800 USB phy
Date: Fri, 12 Apr 2024 15:22:24 +0800
Message-ID: <IA1PR20MB4953040232A4D41E41F2D2A9BB042@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <IA1PR20MB4953780F4617823F7173B6D6BB042@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB4953780F4617823F7173B6D6BB042@IA1PR20MB4953.namprd20.prod.outlook.com>
X-TMN: [cKHdt+g8ePVIAyxeOaBKpFAuortgQ4ByqzIMygT0oU0=]
X-ClientProxiedBy: SI2PR06CA0015.apcprd06.prod.outlook.com
 (2603:1096:4:186::7) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20240412072226.121769-1-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|SN7PR20MB5795:EE_
X-MS-Office365-Filtering-Correlation-Id: 5941c22b-5411-47df-13b7-08dc5ac14524
X-MS-Exchange-SLBlob-MailProps: iS5pQZgsAQDmFN0yKEpvbPDpAvl+/SbOPR3B5EqMNpdvaFjcuntyOEwE3y8XB9AvtEJxpjkfn0VgABu0Lq2RbDavDUvzmSQVh8Aqb0/NB5HTUnNXQOdfmeXlPGzzz9HC+qBSUNMUO29Qp5vuhrGcMJ+u/DKx4c8xdAuSmQ/8x4nCQ6U7NA6Ensb3QnrGPB0VQ2UATb/gBBqfBJw0clOF4NpFE0p3g4w+CpIe4RALtihY4Hk4kN3vwrzMpz31iLMhBEueYtjX56aR4zQKpdA5TarKjK/6S8leNF84skql7v1MAkesY5zzxfKpf5ZafSzvC0y2dj5j3UaWdnd4Q9QrUfohoEGRSQ1viQdD2yMDyTPLrX3/69UQI/ok2rajS2bRiInw/kbN+8Z5YslnRuYPj7MR/Y4ZO49Tk7rL7/cwW3Sxkt4qZ+5CrcOXBUCA0qzHhstI6yYfUUtUPchINocXtxU4r+NBo2I1cnUKg1AzX0kjtD9uikqyGee/b/4PWMeQbbk88L/X6tBM6D9IO2z+UIhI6N+K86h0fUctNErSDUr67NcPuKIV1Qs+n7Hh7WWmrZ2litD8Ixi63AdTv1hmct5bYjEn99fS8S1IG+C2Rzw4ANpcgD8BONbh+4Vg0h+QPTZcbKWB8MzbJgwtK42PJkXfgqkqFldc5Kz089vhgRUVXD2JRGp6Pa+fqLgVsxriT63lMT+w2kR7G1fieRuC4WZIU3S08tTfVN30HBKIYmnU2buSRE9zob6YQZPe7TYh5oRcQJPcPZt/4r1Pc75t1Dg2paHN1I265bIxl0GclMHiUc4N4ZsNtfMApjd+BlHB
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QXW3bLiEDSUj+EUwDOTcbLGgrA9JJxMlYlqpX5ysHR7O/QrYLndE7S9nWqTB21iEoSpIJy/zpEKwlwuaDgbPXsEjEzKN9XIRAOG5yh5FS+lHu9FQ6w3pIgzT8q46Gd4Fx6zjHtyO6Q2Yl3213xwP50dqVbPXmiwPb7LIuhAH/xQkXtSLtaTAjJMubaLXEs8IecvrdmcQ0osCD2n0/3WY9YU8fv1W5S+x+lqN63yQT1RTsG+vM0pHF47aR8maEuBpQwaVoQArNzJXSCRYcuEvm2WNJSB9G174xHoE1Hpf1GfIEYE+Cfuc40XbH2ywR/jRDQ720KejKiZsBQwuDdyHaKhRbJvVAp4+ATRAQvJWpYkWTXjJPBzcgxNA0reyzEpYrZ/4YDqKHic0fTaMR3FDnx8TUb0oto4Ej4mBP/q4ubrs5bqE6XQBL2rOYrKlyn99E6Z2ZmEjY8WqV+OsPnHDm0pOHf+2UXN3GytVxeZ1zz83UIIET5YB7XL0JwHDAlwGF4JNc5r8wrvj7AkmMcWyy5CKv9yRgPwqx3neS/zl0YNY510BnbHgWbVbdzIwjdlvtbPR0D/knlgxiFxFt6sbE2oTpo6qME2IttlCtCPxhx8eFkW7xtHCFd57+Z4rHvf5SIvNFHhBdQ1BDEkW+2tEqd2VW1mdNWHv86R7A7VxLEwK/v+XrCKu7YpzfFp2zDoN
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?e+eZXE/m1HaLa0MG9ICHO98Wk9N8zv5tXnyG3SR+uCJVMP9DdzdME10WrQQw?=
 =?us-ascii?Q?rSkf/iKkiMmhn4btZMi/YsETiR9M/qZLLUdEdpkmvLsIaL5CYTHB0NA/IGks?=
 =?us-ascii?Q?zHgZqOMo48njppmJZKpUKMS5CXFXOrFRniVLVT9dlGV3CKSd2ldDrx5yFGyo?=
 =?us-ascii?Q?x7cnOqQHlJgC/VsXj1YimYrd16z98iw1JhA77EUau644c1tXHwj8uQ6DI7Vz?=
 =?us-ascii?Q?Q3lZPkf3RhjxqJWz02nSFeuI7/GZFySfgAw9tOKyBQX4cO2sngCGpdGsd44L?=
 =?us-ascii?Q?2LGDAP7lNHbFV1Foq3EeQA45dI2da5BKSfvdFpNx4fqCCFfm1+0NHpXOd6HC?=
 =?us-ascii?Q?T85IXE57XGzOGZ3lr58Oj2kgJqzTUS3uW0h6KIRHfsceDDIqCO7aAQN84a9F?=
 =?us-ascii?Q?yVmjKwD/SpJNZPJdgJF6sABzN66hTtv+w1qthI5NcLueYShhPIoSYGx02QDQ?=
 =?us-ascii?Q?AtZ3ECroU3YgDXetfQvhzJoFJrlQLtVQUKARSRhPdndItINqzvWmiymKkBRw?=
 =?us-ascii?Q?/xSLvU8H6YTHVaef2bYa9ZQGQlPpCZT9lPdt+9PG/uecFTvwLHjRmujNuMFm?=
 =?us-ascii?Q?6kamYxtLVcIYyGnJxRoz2d6Es0ypdoKKR+CCF/8o6nxmYAWNUPt+p9AU5Az3?=
 =?us-ascii?Q?ammNtadZivOQVvNNDb4PXvvSDyCtJRe64YG+qejcOO2+Qx86jDj71ayM2IM6?=
 =?us-ascii?Q?lBCn7U0jyhqlRUpjUpqjxLVvuf6DjFGfLpOk2FnRcSZKdIkpl78twHa+X8FF?=
 =?us-ascii?Q?ybqZeponISWiPYCO08ItB5jqCsl+xfgYxVUQCTb4g41pzDHjLLqblvU1tsGW?=
 =?us-ascii?Q?L4dcRphB3ZinLCjTWmV/AKakoc+SnOwRsLX1VV9J3yqd1F4LVOvNlz1MLKQl?=
 =?us-ascii?Q?zO5eoKftr0pxYanreRPtB9tec5lIUbs1UVxJQRml4MCtud5yxRpvGfekfUVb?=
 =?us-ascii?Q?NInYXE/UJnTori21vqKnVCp0+RFpHXsIOiFxPDAga9D0Z1Ic3yjydSfYI1J6?=
 =?us-ascii?Q?6XtZg49/Mts0pqTF1jUFYUNPPn/rFxEX6gkwaJMuv99Hjcvuif0ipUdcXjoQ?=
 =?us-ascii?Q?k7O9nuPhxpu+7XipDts12InXLqP0sa1aJN/dRW1Ps0NAHW/ArVvtJjnpfije?=
 =?us-ascii?Q?VVMMDJZB2YQmlKMl4DFTt9JX2aKMeHR8w2rusArblbvhSJsI4+XpNb1CwNzp?=
 =?us-ascii?Q?uauJwEVl8r7s+5eHg0M1UEFMXUnz1P6ceMZPjhhDkgTj0NKEa9NG/DqmgRRp?=
 =?us-ascii?Q?zyK3al599YEuvOe3fix5?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5941c22b-5411-47df-13b7-08dc5ac14524
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2024 07:22:11.6444
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR20MB5795
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_002227_105129_15FC5BC9 
X-CRM114-Status: GOOD (  12.50  )
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

The USB phy of Sophgo CV18XX series SoC needs to sense a pin called
"VBUS_DET" to get the right operation mode. If this pin is not
connected, it only supports setting the mode manually.

Add USB phy bindings for Sophgo CV18XX/SG200X series SoC.

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
---
 .../bindings/phy/sophgo,cv1800-usb-phy.yaml   | 90 +++++++++++++++++++
 1 file changed, 90 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/sophgo,cv1800-usb-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/sophgo,cv1800-usb-phy.yaml b/Documentation/devicetree/bindings/phy/sophgo,cv1800-usb-phy.yaml
new file mode 100644
index 000000000000..cb394ac5d8c4
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/sophgo,cv1800-usb-phy.yaml
@@ -0,0 +1,90 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/sophgo,cv1800-usb-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo CV18XX/SG200X USB 2.0 PHY
+
+maintainers:
+  - Inochi Amaoto <inochiama@outlook.com>
+
+properties:
+  compatible:
+    const: sophgo,cv1800-usb-phy
+
+  reg:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 0
+
+  clocks:
+    items:
+      - description: PHY clock
+      - description: PHY app clock
+      - description: PHY stb clock
+      - description: PHY lpm clock
+
+  clock-names:
+    items:
+      - const: phy
+      - const: app
+      - const: stb
+      - const: lpm
+
+  dr_mode:
+    description: PHY device mode when initing.
+    enum: [host, peripheral, otg]
+
+  vbus_det-gpios:
+    description: GPIO to the USB OTG VBUS detect pin. This should not be
+      defined if vbus_det gpio and switch gpio are connected.
+    maxItems: 1
+
+  sophgo,switch-gpios:
+    description: GPIO for the phy to control connected switch.
+    maxItems: 2
+
+required:
+  - compatible
+  - "#phy-cells"
+  - clocks
+  - clock-names
+  - dr_mode
+
+allOf:
+  - if:
+      properties:
+        dr_mode:
+          const: otg
+    then:
+      required:
+        - vbus_det-gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    phy@48 {
+      compatible = "sophgo,cv1800-usb-phy";
+      reg = <0x48 0x4>;
+      #phy-cells = <0>;
+      clocks = <&clk 92>, <&clk 93>,
+               <&clk 94>, <&clk 95>;
+      clock-names = "phy", "app", "stb", "lpm";
+      dr_mode = "host";
+    };
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    phy@54 {
+      compatible = "sophgo,cv1800-usb-phy";
+      reg = <0x54 0x4>;
+      #phy-cells = <0>;
+      clocks = <&clk 92>, <&clk 93>,
+               <&clk 94>, <&clk 95>;
+      clock-names = "phy", "app", "stb", "lpm";
+      dr_mode = "otg";
+      vbus_det-gpios = <&portb 6 GPIO_ACTIVE_HIGH>;
+    };
--
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
