Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4623FCF855C
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Nov 2025 08:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PHJjGu4rPr1aokKbHQMJUq4QL94fr4iMpOcwZ5JJgcI=; b=VzOUw2TXK/UYqG
	YGy9lAQaq6L9E8cG35/zLFM3D2I64St4sZfHS91moBiiDOz85Q54wp2ml8096mPMlTE1yjh4dSYO2
	Jf5D33UZLaeARjDb9yqwa87mo94xJyKMj2umOd26dWonqX2tJ+P6oMJOm+B9WJoUfUr05P06lor/v
	FzlW4xncS8kOxVfpARmQaKcbgCS0mBtHoXAUO4DB+xTVPId1tslXclnaDA1AutNDUYf325KC0HLFJ
	CdZK3WXOCwDtkc4+3CyswDB/wbNWCmRKRP+HpdJ0k4TxdUCnyE14H/NWAr19bblDdeanq8L9UhS1w
	A5vnKkt40tg4gESIFEUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM03Q-00000006M1b-40g2;
	Thu, 20 Nov 2025 08:30:12 +0000
Received: from mail-bjschn02on2093.outbound.protection.partner.outlook.cn ([139.219.17.93] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM03M-00000006LzI-2SmT
	for linux-riscv@lists.infradead.org;
	Thu, 20 Nov 2025 08:30:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FK7vxj6abb/3/ceuDyH3yq+MkbsnDMDbdha+Q/j0VlXVy52S2DUsToDklIA/JdEf9R1kfc9Hgv+M45wBWXzh8igWvJOAEWjfu5CNzDEMBKZCHMvVZwf1iW/GTrHMI3ZkdQ0YuX81wYD4AplWK3D3a+whDKhizUThypUbEDjN5z1ZEDbLx6+oC6LkSHVf+2qocRuLgCrKb7GHslAmq+u15bpTBv6Yz5R9FMy+U7S3wLXI4KL+s2j/WgGMKp84m9NveHi+WTvEMKcKuXuy83sX6Uu8BI/PCOGGICRcDvsmWeMZJL8sn/vJM6ecPpaQ3tD53ZpwPb1fiySxI7vJeioI1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MmrGoNeghDrD3f24Hq/M0Vt1VkGEM5paQ8a870qOb+c=;
 b=X36JM//wPRQguup7KfT7PN//spoRHdwqJE8pRVTjChdxox2rzcn/iqSMcZ9iA52MPPIQTJ8jdVsZz640jTz3QC5BdQKWLKdaTJdVmabyWIbxL12ezpONLNFj3FsnjBtIkfFRnF2yBcu42cFWEpw0ufw6bmBzgEMQSt0gn/Ypvosn/fB4locyQwmvlDiGOjknCdi8Kms7EBtrQxjxxzDSkT/X5fzfRHVIw9YSrPZpFZrznaj4075Z3RX8BVvhDUg1iturqGokUZmS77C+p9RgwQAVPC/3svAtjGn5vkaGIj8bix7Q7sUc60/N36jorvKuk73637RbqOSQLt4tOIK0Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:7::14) by ZQ2PR01MB1275.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:10::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.24; Thu, 20 Nov
 2025 08:29:58 +0000
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::2595:ef4d:fae:37d7]) by ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::2595:ef4d:fae:37d7%6]) with mapi id 15.20.9320.021; Thu, 20 Nov 2025
 08:29:58 +0000
From: Hal Feng <hal.feng@starfivetech.com>
To: Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	E Shattow <e@freeshell.de>
Cc: Hal Feng <hal.feng@starfivetech.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/5] riscv: dts: starfive: Add common board dtsi for VisionFive 2 Lite variants
Date: Thu, 20 Nov 2025 16:29:44 +0800
Message-ID: <20251120082946.109378-4-hal.feng@starfivetech.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20251120082946.109378-1-hal.feng@starfivetech.com>
References: <20251120082946.109378-1-hal.feng@starfivetech.com>
X-ClientProxiedBy: SH0PR01CA0008.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:5::20) To ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ2PR01MB1307:EE_|ZQ2PR01MB1275:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c860237-c65e-4908-6383-08de280efdd8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|52116014|366016|41320700013|38350700014|921020;
X-Microsoft-Antispam-Message-Info: 2XWLCG+grhQNxwAgGxDA9DJyik8t+Ce4PwE/DrWIxJQR8HPzHde7b2Ye9epzLqRCZ029gmCV0JW/8JNNNtuYFWInOMxLezXBA40u9WfkASNCDank64Eqyio73pXz1Wm169OrFHHCVN4OZTK0WhZwHOxK8IA5/AfjLW1i0OEJD9gkcOS2OB0oQ05R9EQEMqOeyGVb9ifCL8/5tuZy0GbFrSSgxd9yh7ll+vCxpBX6qATXG/gwkRbXlkpiGHw3oCLPJUE51aCIrGTjkpVVwbHXEuSlST502Ec0kUA17P6UQWDYDV+e2xmHeTnFy6q6jcqidQYLy8C+mewk4LRiIr9nTSpmiv9v3N72DbTnFrVmvJNf0AVyx0O6WhdLWn7z42zytliavzbnLseHskdqT+DEYIEkaD3VbTGCsmQNuGrE8saEe36YSCYVAYyaKWcCZFV0iYcFYpNEKqZ6ESzZoZB+2lY59zvbNoDS0BE98VBXj5qmW5oYvKLWoS49XJJRWJAVbQw2m+D4KWc5sSjwgerVrUWAT90fKWTAQazmG/D/1E/LbnFNd1ASkxv5hLlYThf7RVN/q/8rJq7X81xOSGJ66XoqSH48NbSOpi8ACo7ISgY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(366016)(41320700013)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3CIX8j5Phb6JdMpkk+P1ngUQK42x+c/rZPXUuDEgzmp6uHY6hoQBNBxIvERv?=
 =?us-ascii?Q?Qr3WZiqcb39lpmikHzZlZppIP1XN4S8bS4Poyo8ryPnz/6oIHVZVosO8okih?=
 =?us-ascii?Q?zH19vZRoZnbjsM73uUw02DgkokToOCr/IHGA/48YSxdMAkVne5aI8mqhmDRF?=
 =?us-ascii?Q?RQwxJfPNC8cihCciGoTrWxh164rWqv7/ecANsmed10379lpwIhZFGtCLtoEh?=
 =?us-ascii?Q?TZWiBbvlvtj9CDF3rgKm5+qbHAvCpR+Z3VEuzX8GNnjJE0y+Fxqpx52kXSSn?=
 =?us-ascii?Q?9BJgFaF1lLkGDMPk35dRnHEeEGLmWBMGn9GD4WRjHuv02T+vXs6CO7CVsBww?=
 =?us-ascii?Q?H2CZCG9TrIbgVDMwHxDxMOsgqlnc7n50ilYUe/kJ97tLVQPAX760xzQww3NR?=
 =?us-ascii?Q?XxQk5MWT8v+suHmGYROM1P45fw/lcIqIm4eX8HqC684UB357PB94u+05qATm?=
 =?us-ascii?Q?Z39uX0QXWPHPNb8I0D/ae8YfSBy25o7JwpUeSzqRcOz9NLIf7OmhQWfYcyDW?=
 =?us-ascii?Q?nsiRP8jAs+gHRlSTpStiWX7/ueEUT6syZPaZLy9hz4O7C9lTcy7epo8gqh9N?=
 =?us-ascii?Q?lf3uCH9kjxhVwqpZxr/VITkCsB2amJucgay74y1SUNelMsCGaYcqB2PvpGnL?=
 =?us-ascii?Q?eq7flTpZRRBBCKxBj1XXu4Parj1rYPgTiWsLDhdBWL/m/X5vIVC5zGTahrc2?=
 =?us-ascii?Q?O5ZIESdXI4MFyj9qTj80NiuMaI4eCNu3x5zuaoxbRkEL5osacZOiLrF+BF9i?=
 =?us-ascii?Q?/Jwd8UZoUg5/WKdSb2e8Jm6gLnLLW3iIju0orPQbzLrncm7xrtHgzC7JH1JW?=
 =?us-ascii?Q?MJcBYI4UuJhOOCW2/peSj4u2rKPXGmz2M56It5JL7Ymnd5q9qv1WFNBxcf0a?=
 =?us-ascii?Q?whAAbINpk9xJVnLkgM9uQ6F2GubXz5zhBeVWOou6kYx1FexxtIwprgzNV/Ib?=
 =?us-ascii?Q?3Nq5CHk5o1Bf41IUu5t7HN8jMyisVQOr5Y8EcJs3kYKho/Nwv1n8UXo7O8IX?=
 =?us-ascii?Q?crOyJEq2P2ZFFaEVRJKv+LmW6ZpmMhNLMJjhU/EYWxMClQEpPlgAhaECZDtr?=
 =?us-ascii?Q?uB+nD4efNedPS0iIgBglTLYD3nznnQ//EXeVxCFnmg9OHv1hcJ9/pwzT4DLD?=
 =?us-ascii?Q?namUhcxmoEyJ4zs4Pyzz3vAWATCa22ncHGXK3ZsO0JUfELKXP9B1Khut4hqf?=
 =?us-ascii?Q?Nc/fy0Sm/14Y2msL4mXnZdfTd34DsU78DJxKpXXBJdl7WnJFC8n7mnF7q5ah?=
 =?us-ascii?Q?JN0dnneG+X7hO957UWN/n6KTKgytO3X0Fbw5JUnXf4KAmYvIVGBIzTWrsCJa?=
 =?us-ascii?Q?q5SkfHalyMGz7F8nZiJ+fN9PbyPx5mGBXSLTzjGUFw66v7SPI8JpcQpDiEDp?=
 =?us-ascii?Q?B/kbkjUqrJ4sAZTXYrxtfayle3kH65HXpNoHzLWY+4V8TRkEiw3jJc+V84U0?=
 =?us-ascii?Q?0o+CZqcvR/+rFN5sVia6Z+ShpYCKclfZPCcr3VL2fSeS/MhQM6myp7gSGhd8?=
 =?us-ascii?Q?fB4+k/dAZY/gC+kHU0xDgYPmCTmPL9MQl8hosTL8Cz92qjy0817xryT28aiG?=
 =?us-ascii?Q?AqPPvVe/Vaigqi8DeYoewHJ50ElQ4P3kpwCj4E7qOULuqvzZHqjIIKOsTPA1?=
 =?us-ascii?Q?bg=3D=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c860237-c65e-4908-6383-08de280efdd8
X-MS-Exchange-CrossTenant-AuthSource: ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 08:29:58.7732
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W7nVODLoOv7aiT1Egb8r3CGGWYQfxAF65bkcE0Z6SQQBG/KXFQQ/uC6ERLPg0EUWBWe//ISWfKW0hmEGqYS/O1yeSZy8AV0GP7QofSug36w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ2PR01MB1275
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_003008_632437_AE77333E 
X-CRM114-Status: GOOD (  10.59  )
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

Add common board dtsi for use by VisionFive 2 Lite variants.

Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
---
 .../jh7110s-starfive-visionfive-2-lite.dtsi   | 691 ++++++++++++++++++
 1 file changed, 691 insertions(+)
 create mode 100644 arch/riscv/boot/dts/starfive/jh7110s-starfive-visionfive-2-lite.dtsi

diff --git a/arch/riscv/boot/dts/starfive/jh7110s-starfive-visionfive-2-lite.dtsi b/arch/riscv/boot/dts/starfive/jh7110s-starfive-visionfive-2-lite.dtsi
new file mode 100644
index 000000000000..aa375c4a3fa3
--- /dev/null
+++ b/arch/riscv/boot/dts/starfive/jh7110s-starfive-visionfive-2-lite.dtsi
@@ -0,0 +1,691 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Copyright (C) 2025 StarFive Technology Co., Ltd.
+ * Copyright (C) 2025 Hal Feng <hal.feng@starfivetech.com>
+ */
+
+/dts-v1/;
+#include "jh7110.dtsi"
+#include "jh7110-pinfunc.h"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/pinctrl/starfive,jh7110-pinctrl.h>
+
+/ {
+	aliases {
+		ethernet0 = &gmac0;
+		i2c0 = &i2c0;
+		i2c2 = &i2c2;
+		i2c5 = &i2c5;
+		i2c6 = &i2c6;
+		mmc0 = &mmc0;
+		mmc1 = &mmc1;
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@40000000 {
+		device_type = "memory";
+		reg = <0x0 0x40000000 0x1 0x0>;
+		bootph-pre-ram;
+	};
+
+	gpio-restart {
+		compatible = "gpio-restart";
+		gpios = <&sysgpio 35 GPIO_ACTIVE_HIGH>;
+		priority = <224>;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led_status_power: led-0 {
+			gpios = <&aongpio 3 GPIO_ACTIVE_HIGH>;
+		};
+	};
+};
+
+&cpu_opp {
+	/delete-node/ opp-375000000;
+	/delete-node/ opp-500000000;
+	/delete-node/ opp-750000000;
+	/delete-node/ opp-1500000000;
+
+	opp-312500000 {
+		opp-hz = /bits/ 64 <312500000>;
+		opp-microvolt = <800000>;
+	};
+	opp-417000000 {
+		opp-hz = /bits/ 64 <417000000>;
+		opp-microvolt = <800000>;
+	};
+	opp-625000000 {
+		opp-hz = /bits/ 64 <625000000>;
+		opp-microvolt = <800000>;
+	};
+	opp-1250000000 {
+		opp-hz = /bits/ 64 <1250000000>;
+		opp-microvolt = <1000000>;
+	};
+};
+
+&cpus {
+	timebase-frequency = <4000000>;
+};
+
+&dvp_clk {
+	clock-frequency = <74250000>;
+};
+
+&gmac0_rgmii_rxin {
+	clock-frequency = <125000000>;
+};
+
+&gmac0_rmii_refin {
+	clock-frequency = <50000000>;
+};
+
+&gmac1_rgmii_rxin {
+	clock-frequency = <125000000>;
+};
+
+&gmac1_rmii_refin {
+	clock-frequency = <50000000>;
+};
+
+&hdmitx0_pixelclk {
+	clock-frequency = <297000000>;
+};
+
+&i2srx_bclk_ext {
+	clock-frequency = <12288000>;
+};
+
+&i2srx_lrck_ext {
+	clock-frequency = <192000>;
+};
+
+&i2stx_bclk_ext {
+	clock-frequency = <12288000>;
+};
+
+&i2stx_lrck_ext {
+	clock-frequency = <192000>;
+};
+
+&mclk_ext {
+	clock-frequency = <12288000>;
+};
+
+&osc {
+	clock-frequency = <24000000>;
+};
+
+&rtc_osc {
+	clock-frequency = <32768>;
+};
+
+&tdm_ext {
+	clock-frequency = <49152000>;
+};
+
+&camss {
+	assigned-clocks = <&ispcrg JH7110_ISPCLK_DOM4_APB_FUNC>,
+			  <&ispcrg JH7110_ISPCLK_MIPI_RX0_PXL>;
+	assigned-clock-rates = <49500000>, <198000000>;
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+		};
+
+		port@1 {
+			reg = <1>;
+
+			camss_from_csi2rx: endpoint {
+				remote-endpoint = <&csi2rx_to_camss>;
+			};
+		};
+	};
+};
+
+&csi2rx {
+	assigned-clocks = <&ispcrg JH7110_ISPCLK_VIN_SYS>;
+	assigned-clock-rates = <297000000>;
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			/* remote MIPI sensor endpoint */
+		};
+
+		port@1 {
+			reg = <1>;
+
+			csi2rx_to_camss: endpoint {
+				remote-endpoint = <&camss_from_csi2rx>;
+			};
+		};
+	};
+};
+
+&gmac0 {
+	phy-handle = <&phy0>;
+	phy-mode = "rgmii-id";
+	starfive,tx-use-rgmii-clk;
+	assigned-clocks = <&aoncrg JH7110_AONCLK_GMAC0_TX>;
+	assigned-clock-parents = <&aoncrg JH7110_AONCLK_GMAC0_RMII_RTX>;
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "snps,dwmac-mdio";
+
+		phy0: ethernet-phy@0 {
+			reg = <0>;
+			motorcomm,tx-clk-adj-enabled;
+			motorcomm,tx-clk-100-inverted;
+			motorcomm,tx-clk-1000-inverted;
+			motorcomm,rx-clk-drv-microamp = <3970>;
+			motorcomm,rx-data-drv-microamp = <2910>;
+			rx-internal-delay-ps = <1500>;
+			tx-internal-delay-ps = <1500>;
+		};
+	};
+};
+
+&i2c0 {
+	clock-frequency = <100000>;
+	i2c-sda-hold-time-ns = <300>;
+	i2c-sda-falling-time-ns = <510>;
+	i2c-scl-falling-time-ns = <510>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c0_pins>;
+	status = "okay";
+};
+
+&i2c2 {
+	clock-frequency = <100000>;
+	i2c-sda-hold-time-ns = <300>;
+	i2c-sda-falling-time-ns = <510>;
+	i2c-scl-falling-time-ns = <510>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c2_pins>;
+	status = "okay";
+};
+
+&i2c5 {
+	clock-frequency = <100000>;
+	i2c-sda-hold-time-ns = <300>;
+	i2c-sda-falling-time-ns = <510>;
+	i2c-scl-falling-time-ns = <510>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c5_pins>;
+	status = "okay";
+
+	axp15060: pmic@36 {
+		compatible = "x-powers,axp15060";
+		reg = <0x36>;
+		interrupt-controller;
+		#interrupt-cells = <1>;
+
+		regulators {
+			vcc_3v3: dcdc1 {
+				regulator-boot-on;
+				regulator-always-on;
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-name = "vcc_3v3";
+			};
+
+			vdd_cpu: dcdc2 {
+				regulator-always-on;
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <1540000>;
+				regulator-name = "vdd_cpu";
+			};
+
+			emmc_vdd: aldo4 {
+				regulator-boot-on;
+				regulator-always-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-name = "emmc_vdd";
+			};
+		};
+	};
+
+	eeprom@50 {
+		compatible = "atmel,24c04";
+		reg = <0x50>;
+		bootph-pre-ram;
+		pagesize = <16>;
+	};
+};
+
+&i2c6 {
+	clock-frequency = <100000>;
+	i2c-sda-hold-time-ns = <300>;
+	i2c-sda-falling-time-ns = <510>;
+	i2c-scl-falling-time-ns = <510>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c6_pins>;
+	status = "okay";
+};
+
+&mmc0 {
+	max-frequency = <100000000>;
+	assigned-clocks = <&syscrg JH7110_SYSCLK_SDIO0_SDCARD>;
+	assigned-clock-rates = <50000000>;
+	bus-width = <8>;
+	bootph-pre-ram;
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc0_pins>;
+	status = "okay";
+};
+
+&mmc1 {
+	max-frequency = <50000000>;
+	assigned-clocks = <&syscrg JH7110_SYSCLK_SDIO1_SDCARD>;
+	assigned-clock-rates = <50000000>;
+	bus-width = <4>;
+	bootph-pre-ram;
+	cap-sd-highspeed;
+	keep-power-in-suspend;
+	non-removable;
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc1_pins>;
+	status = "okay";
+};
+
+&pcie1 {
+	enable-gpios = <&sysgpio 27 GPIO_ACTIVE_HIGH>;
+	perst-gpios = <&sysgpio 28 GPIO_ACTIVE_LOW>;
+	phys = <&pciephy1>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie1_pins>;
+	status = "okay";
+};
+
+&pwm {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pwm_pins>;
+	status = "okay";
+};
+
+&qspi {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	nor_flash: flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		bootph-pre-ram;
+		cdns,read-delay = <2>;
+		spi-max-frequency = <100000000>;
+		cdns,tshsl-ns = <1>;
+		cdns,tsd2d-ns = <1>;
+		cdns,tchsh-ns = <1>;
+		cdns,tslch-ns = <1>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			spl@0 {
+				reg = <0x0 0xf0000>;
+			};
+			uboot-env@f0000 {
+				reg = <0xf0000 0x10000>;
+			};
+			uboot@100000 {
+				reg = <0x100000 0xf00000>;
+			};
+		};
+	};
+};
+
+&spi0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&spi0_pins>;
+	status = "okay";
+};
+
+&syscrg {
+	assigned-clocks = <&syscrg JH7110_SYSCLK_CPU_ROOT>,
+			  <&syscrg JH7110_SYSCLK_BUS_ROOT>,
+			  <&syscrg JH7110_SYSCLK_PERH_ROOT>,
+			  <&syscrg JH7110_SYSCLK_QSPI_REF>,
+			  <&syscrg JH7110_SYSCLK_CPU_CORE>,
+			  <&pllclk JH7110_PLLCLK_PLL0_OUT>;
+	assigned-clock-parents = <&pllclk JH7110_PLLCLK_PLL0_OUT>,
+				 <&pllclk JH7110_PLLCLK_PLL2_OUT>,
+				 <&pllclk JH7110_PLLCLK_PLL2_OUT>,
+				 <&syscrg JH7110_SYSCLK_QSPI_REF_SRC>;
+	assigned-clock-rates = <0>, <0>, <0>, <0>, <500000000>, <1250000000>;
+};
+
+&sysgpio {
+	i2c0_pins: i2c0-0 {
+		i2c-pins {
+			pinmux = <GPIOMUX(57, GPOUT_LOW,
+					      GPOEN_SYS_I2C0_CLK,
+					      GPI_SYS_I2C0_CLK)>,
+				 <GPIOMUX(58, GPOUT_LOW,
+					      GPOEN_SYS_I2C0_DATA,
+					      GPI_SYS_I2C0_DATA)>;
+			bias-disable; /* external pull-up */
+			input-enable;
+			input-schmitt-enable;
+		};
+	};
+
+	i2c2_pins: i2c2-0 {
+		i2c-pins {
+			pinmux = <GPIOMUX(3, GPOUT_LOW,
+					     GPOEN_SYS_I2C2_CLK,
+					     GPI_SYS_I2C2_CLK)>,
+				 <GPIOMUX(2, GPOUT_LOW,
+					     GPOEN_SYS_I2C2_DATA,
+					     GPI_SYS_I2C2_DATA)>;
+			bias-disable; /* external pull-up */
+			input-enable;
+			input-schmitt-enable;
+		};
+	};
+
+	i2c5_pins: i2c5-0 {
+		bootph-pre-ram;
+
+		i2c-pins {
+			pinmux = <GPIOMUX(19, GPOUT_LOW,
+					      GPOEN_SYS_I2C5_CLK,
+					      GPI_SYS_I2C5_CLK)>,
+				 <GPIOMUX(20, GPOUT_LOW,
+					      GPOEN_SYS_I2C5_DATA,
+					      GPI_SYS_I2C5_DATA)>;
+			bias-disable; /* external pull-up */
+			bootph-pre-ram;
+			input-enable;
+			input-schmitt-enable;
+		};
+	};
+
+	i2c6_pins: i2c6-0 {
+		i2c-pins {
+			pinmux = <GPIOMUX(16, GPOUT_LOW,
+					      GPOEN_SYS_I2C6_CLK,
+					      GPI_SYS_I2C6_CLK)>,
+				 <GPIOMUX(17, GPOUT_LOW,
+					      GPOEN_SYS_I2C6_DATA,
+					      GPI_SYS_I2C6_DATA)>;
+			bias-disable; /* external pull-up */
+			input-enable;
+			input-schmitt-enable;
+		};
+	};
+
+	mmc0_pins: mmc0-0 {
+		mmc-pins {
+			pinmux = <PINMUX(PAD_SD0_CLK, 0)>,
+				 <PINMUX(PAD_SD0_CMD, 0)>,
+				 <PINMUX(PAD_SD0_DATA0, 0)>,
+				 <PINMUX(PAD_SD0_DATA1, 0)>,
+				 <PINMUX(PAD_SD0_DATA2, 0)>,
+				 <PINMUX(PAD_SD0_DATA3, 0)>,
+				 <PINMUX(PAD_SD0_DATA4, 0)>,
+				 <PINMUX(PAD_SD0_DATA5, 0)>,
+				 <PINMUX(PAD_SD0_DATA6, 0)>,
+				 <PINMUX(PAD_SD0_DATA7, 0)>;
+			bias-pull-up;
+			drive-strength = <12>;
+			input-enable;
+		};
+	};
+
+	mmc1_pins: mmc1-0 {
+		clk-pins {
+			pinmux = <GPIOMUX(10, GPOUT_SYS_SDIO1_CLK,
+					      GPOEN_ENABLE,
+					      GPI_NONE)>;
+			bias-pull-up;
+			drive-strength = <12>;
+			input-disable;
+			input-schmitt-disable;
+			slew-rate = <0>;
+		};
+
+		mmc-pins {
+			pinmux = <GPIOMUX(9, GPOUT_SYS_SDIO1_CMD,
+					     GPOEN_SYS_SDIO1_CMD,
+					     GPI_SYS_SDIO1_CMD)>,
+				 <GPIOMUX(11, GPOUT_SYS_SDIO1_DATA0,
+					      GPOEN_SYS_SDIO1_DATA0,
+					      GPI_SYS_SDIO1_DATA0)>,
+				 <GPIOMUX(12, GPOUT_SYS_SDIO1_DATA1,
+					      GPOEN_SYS_SDIO1_DATA1,
+					      GPI_SYS_SDIO1_DATA1)>,
+				 <GPIOMUX(7, GPOUT_SYS_SDIO1_DATA2,
+					     GPOEN_SYS_SDIO1_DATA2,
+					     GPI_SYS_SDIO1_DATA2)>,
+				 <GPIOMUX(8, GPOUT_SYS_SDIO1_DATA3,
+					     GPOEN_SYS_SDIO1_DATA3,
+					     GPI_SYS_SDIO1_DATA3)>;
+			bias-pull-up;
+			drive-strength = <12>;
+			input-enable;
+			input-schmitt-enable;
+			slew-rate = <0>;
+		};
+	};
+
+	pcie1_pins: pcie1-0 {
+		clkreq-pins {
+			pinmux = <GPIOMUX(29, GPOUT_LOW,
+					      GPOEN_DISABLE,
+					      GPI_NONE)>;
+			bias-pull-down;
+			drive-strength = <2>;
+			input-enable;
+			input-schmitt-disable;
+			slew-rate = <0>;
+		};
+
+		wake-pins {
+			pinmux = <GPIOMUX(21, GPOUT_LOW,
+				      GPOEN_DISABLE,
+					      GPI_NONE)>;
+			bias-pull-up;
+			drive-strength = <2>;
+			input-enable;
+			input-schmitt-disable;
+			slew-rate = <0>;
+		};
+	};
+
+	pwm_pins: pwm-0 {
+		pwm-pins {
+			pinmux = <GPIOMUX(46, GPOUT_SYS_PWM_CHANNEL0,
+					      GPOEN_SYS_PWM0_CHANNEL0,
+					      GPI_NONE)>,
+				 <GPIOMUX(59, GPOUT_SYS_PWM_CHANNEL1,
+					      GPOEN_SYS_PWM0_CHANNEL1,
+					      GPI_NONE)>;
+			bias-disable;
+			drive-strength = <12>;
+			input-disable;
+			input-schmitt-disable;
+			slew-rate = <0>;
+		};
+	};
+
+	spi0_pins: spi0-0 {
+		mosi-pins {
+			pinmux = <GPIOMUX(52, GPOUT_SYS_SPI0_TXD,
+					      GPOEN_ENABLE,
+					      GPI_NONE)>;
+			bias-disable;
+			input-disable;
+			input-schmitt-disable;
+		};
+
+		miso-pins {
+			pinmux = <GPIOMUX(53, GPOUT_LOW,
+					      GPOEN_DISABLE,
+					      GPI_SYS_SPI0_RXD)>;
+			bias-pull-up;
+			input-enable;
+			input-schmitt-enable;
+		};
+
+		sck-pins {
+			pinmux = <GPIOMUX(48, GPOUT_SYS_SPI0_CLK,
+					      GPOEN_ENABLE,
+					      GPI_SYS_SPI0_CLK)>;
+			bias-disable;
+			input-disable;
+			input-schmitt-disable;
+		};
+
+		ss-pins {
+			pinmux = <GPIOMUX(49, GPOUT_SYS_SPI0_FSS,
+					      GPOEN_ENABLE,
+					      GPI_SYS_SPI0_FSS)>;
+			bias-disable;
+			input-disable;
+			input-schmitt-disable;
+		};
+	};
+
+	uart0_pins: uart0-0 {
+		tx-pins {
+			pinmux = <GPIOMUX(5, GPOUT_SYS_UART0_TX,
+					     GPOEN_ENABLE,
+					     GPI_NONE)>;
+			bias-disable;
+			drive-strength = <12>;
+			input-disable;
+			input-schmitt-disable;
+			slew-rate = <0>;
+		};
+
+		rx-pins {
+			pinmux = <GPIOMUX(6, GPOUT_LOW,
+					     GPOEN_DISABLE,
+					     GPI_SYS_UART0_RX)>;
+			bias-disable; /* external pull-up */
+			drive-strength = <2>;
+			input-enable;
+			input-schmitt-enable;
+			slew-rate = <0>;
+		};
+	};
+
+	uart1_pins: uart1-0 {
+		tx-pins {
+			pinmux = <GPIOMUX(22, GPOUT_SYS_UART1_TX,
+					      GPOEN_ENABLE,
+					      GPI_NONE)>;
+			bias-disable;
+			drive-strength = <12>;
+			input-disable;
+			input-schmitt-disable;
+			slew-rate = <0>;
+		};
+
+		rx-pins {
+			pinmux = <GPIOMUX(23, GPOUT_LOW,
+					      GPOEN_DISABLE,
+					      GPI_SYS_UART1_RX)>;
+			bias-pull-up;
+			drive-strength = <2>;
+			input-enable;
+			input-schmitt-enable;
+			slew-rate = <0>;
+		};
+
+		cts-pins {
+			pinmux = <GPIOMUX(24, GPOUT_LOW,
+					      GPOEN_DISABLE,
+					      GPI_SYS_UART1_CTS)>;
+			input-enable;
+		};
+
+		rts-pins {
+			pinmux = <GPIOMUX(25, GPOUT_SYS_UART1_RTS,
+					      GPOEN_ENABLE,
+					      GPI_NONE)>;
+			input-enable;
+		};
+	};
+
+	usb0_pins: usb0-0 {
+		power-pins {
+			pinmux = <GPIOMUX(26, GPOUT_HIGH,
+					      GPOEN_ENABLE,
+					      GPI_NONE)>;
+			input-disable;
+		};
+
+		switch-pins {
+			pinmux = <GPIOMUX(62, GPOUT_LOW,
+					      GPOEN_ENABLE,
+					      GPI_NONE)>;
+			input-disable;
+		};
+	};
+};
+
+&uart0 {
+	bootph-pre-ram;
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_pins>;
+	status = "okay";
+};
+
+&uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart1_pins>;
+	status = "okay";
+};
+
+&usb0 {
+	dr_mode = "host";
+	pinctrl-names = "default";
+	pinctrl-0 = <&usb0_pins>;
+	status = "okay";
+};
+
+&usb_cdns3 {
+	phys = <&usbphy0>, <&pciephy0>;
+	phy-names = "cdns3,usb2-phy", "cdns3,usb3-phy";
+};
+
+&U74_1 {
+	cpu-supply = <&vdd_cpu>;
+};
+
+&U74_2 {
+	cpu-supply = <&vdd_cpu>;
+};
+
+&U74_3 {
+	cpu-supply = <&vdd_cpu>;
+};
+
+&U74_4 {
+	cpu-supply = <&vdd_cpu>;
+};
-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
