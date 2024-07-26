Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 579E6C3DA64
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jul 2024 01:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DfE7gkpsNRLyOuwS6MeqB4lfC01HWOWnD0AixmlkWHs=; b=HUhUWecfkPcHzg
	TuM4dQZEeVMFN/9wL3TfrLAuVgV6G8DMMhBGj81YK8LG26ZWCeT7XuzGJJZg1/GcRpaiw/xjBsoTe
	eZw+X82KJvYuEwyU64cPPsC4WDAHsmh2gmv8MLZaElE9jAKyVzNCfxMCY4KFywWxrJVPSOUX8zOwU
	MvsallQOPKl7T17BB2C4u1Br6LPIzrKTHUPRJvnWX4VB2G0a1a2or2Zc1xWP200AbrMGp9wlJOp6M
	YdCevziKaxErUqrSvCzpqXNy4mEDHeEhs04vhw66eJ770mEd3RF/AQ/lc3Od95QBTE1dhDBW6Kv0q
	WziHEU3qeFpgChr9bu1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sX9RX-00000002a1c-2KmH;
	Fri, 26 Jul 2024 01:08:23 +0000
Received: from mail-dm6nam12olkn20800.outbound.protection.outlook.com ([2a01:111:f403:2c17::800] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sX9RU-00000002a0x-1b5m
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 01:08:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WfmuHWW8JOSzwFBd63H7CuF5Ng3v6v4VAxirBhuffcNPwsEi6l287aofkDIgB//b6tBkxWAP+lZgTdMxrgfXnmDzVsXGm7dbhFMPhhpaJGBacpd2mINED9Ngm4beO2mob0lbniuP09eL3JMJI/wXH4nG4i6nuJegEreVzhDBpWMH77vILqxhWGSD1JiV/bkx8Bk8ozbtJ3wby4P9PiRZU7nGIFWKyfcO/ZPnGkXaSkBZj/ExxudoPxcPslg0FxZA/sXXz33bDPwzXc5hqgoUGGCd6YyOVPdYnMf8n5PO3Cbog7RnNd7YolgNAUVBqsbTTdCBYbUFDxuyTLY6JOQ8Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=otMk6kF4zyBWyfKSfCJ2iXpjQMTGZoKuwD1+uxKZC58=;
 b=A+w/pZ+byT5sc/5fb92OKwoyEdT1FlWaAlRbYjnMjOaHy3de1GEqfDnIkshr/vduJIkLW3nIFrWwjAq+HKAx8pmLaRfsqiEroBLRJO6olvrIloHykzUA+E8RGF6a6cexSN8p6z/0iJoJeYRTdJ01IxpYNwjNv9PHubr+wh1OxmJ5eaZpDMRVrEqhfi9G6TFEV8bosCQW09kWF83eAYhdiXGWAhC8BnZkphvaHzaTnpqkEHVohxfkxJFDg4hOSoPZbBhnl6HrkC0mKKRtu6pqr9ZynoNCLFF4abgA9Vv2C8mF9Avtj8TRmuKJOjT0G35vxUNMJV+PpQ6PI/3ucI5wxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=otMk6kF4zyBWyfKSfCJ2iXpjQMTGZoKuwD1+uxKZC58=;
 b=CkfCVHPqwqiQawgx6Ma6Tstl9RdI54qMw2ofiQnCQGBalLLO7FJdVBdfFle/VxDquwyT0gD6b9hvMqgnPEBhyO4mzGNdKI2JTCXsWGi0S4bBq1GRLpTjAqcTkwjC659VPsDssSuqHHqO+ag93jn53lfu3iRtaF0g5VlQ9ILyI6lR4fymKOBsptKrH7bi/W+gwJF+okYp+d2ZJ1ELvpSFpCn21yQ/sNcv/FMb2MmcEiQOHUq7NIOuV1OrV61bk6RUwn0CsN0OG+VgLJoU6kLK3Dc6WO4B54yn2WqbBdPZ9VlnweZx0tpp4VUeThO60esds5PXToiQ4WCRyoACWztUKQ==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by LV2PR20MB4680.namprd20.prod.outlook.com (2603:10b6:408:175::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20; Fri, 26 Jul
 2024 01:08:11 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%5]) with mapi id 15.20.7784.016; Fri, 26 Jul 2024
 01:08:10 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	Xiaoguang Xing <xiaoguang.xing@sophgo.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: dts: sophgo: Add i2c device support for sg2042
Date: Fri, 26 Jul 2024 09:07:50 +0800
Message-ID: <IA1PR20MB49531864C828FE90C4C25D1BBBB42@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.45.2
X-TMN: [wALZoNdTFZGbahKChd41BroSwG+umQPX1+9US3aSbJY=]
X-ClientProxiedBy: TYCPR01CA0193.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::12) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20240726010751.289537-1-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|LV2PR20MB4680:EE_
X-MS-Office365-Filtering-Correlation-Id: 39689e55-31dc-4e8e-5dea-08dcad0f6ab2
X-Microsoft-Antispam: BCL:0;ARA:14566002|461199028|19110799003|5072599006|8060799006|440099028|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info: qffzTnonRMPsZMw0c1pkW2yjKdi7qy/6pYvjiyl5tIqAfJZsDNeShcragvXsdbyb4fqdcimKYbGyflfC4eBjpYHtG2OrVwJYSejwjzs5LNrqMfDf1ice+Ig1ArIudSFdJsSw4ewwSACW9w3bxwrx/3aR8ClgjTqoLGlhd6lwGAvHCLNvYOPyCwmg8isSOIygjQEviX+r5ytEiG3UgEqfc32f74pYLP0GKtQ/JDjIj+A7czW3Xo9LTyMDnFzRdd+i7nj14c1/kZBFLyAM4q5fZWfSM3ZNizsOGYSCJksoMZBEI4li4XtNyB7axxbmyfpFVvzU0sElnKYo5iNs/DzHE9Izc5rQ2P5FkT9RT9YJ3goTBIaSgihs/SRLsIsuMjeiu7uTGip2QgP6xA+jfvfTVhEjtfQXDItSVY2oJPL36vkRu0avo+sFbAahMaO/mvvXmbMfgrTtkOgeZj4w+w5MOfuEoX1+vK36Cvs9AVpcIQnnGCDwniLgY0JtBPgPtvG57XaqkGPD13wDTfqde0Q4I+D0Iqd2VoV8GlEqJcwraXMD+c08nnpvALPg4YI/Hw5bj1rdPVw0mitGSxUeIm1wBpHBUGm7JT3crltft7k/y6Fsgr098OtH7bV8gFsIzr8qlyChI1flVbe5GEu/zAyYuSsQOXhcVHWrTj9IcGicqOlo4SDGKVzUXC5qX/JpFG27q3Dk1nV6RWNCFoxt5lNsww==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?msj9DfXAm7D6RNRiybfPRC/ZYL5ps22krHL9Y27J6JJLfPzOhTDfnQRMKKq5?=
 =?us-ascii?Q?+2XRsfOO4XJKKWrLtKVDS5T0/EDZWtDSDrANwibVMTaGNRLaeF5PJKue9tMr?=
 =?us-ascii?Q?Fi1M0H3Wg3xJwlwjYoKzjZxcc6i+Fy3d9lgCmRVBKQH6HD+3C1PlL9itb1Qa?=
 =?us-ascii?Q?/4ttDaBpK9CHtLUkksGDNXBrqKHYLxOCTH/42GRyyLywcusVKf+GqZwjhSDe?=
 =?us-ascii?Q?VXJDo40AJ4yeq9RzDY4awbOfCdHac3XxbfmPXZKheot8tMMGJebaeylG8E1u?=
 =?us-ascii?Q?kX8d12v3cZq9mri3i5Hj/ZATv83cgEBkvzvz7YAGjAklEQFU4ZfVxZc6WSNn?=
 =?us-ascii?Q?0K9GdXQtga7bMhJUJZQCZTMKRSCz14/pA8VYg4CYDOENcepke+2HmRJbymVy?=
 =?us-ascii?Q?cYYeMdErspevlxHVC1i4EdGilBrXe1nz4mVxq54zLpUkLgFzDbFf+MMMvzfP?=
 =?us-ascii?Q?biv+T6NQPHjMTS6DBZhnnA8WkhzKMxdWAYZuXEeeeJ/XbO9rULEAII7Coa/r?=
 =?us-ascii?Q?eIRqAA+JoKo7XJlgbO0+LekkBpIrbfFVoIGjoBNGzXIHQsIGELjpuRpCbAmg?=
 =?us-ascii?Q?ff4BXdYfCg58N2A6Izg1N5ZQTE/RyrYSQTOCDzjdop2BnxfXEeNWB33MtkRH?=
 =?us-ascii?Q?mfmDTfE60nHGb3X7EBtyU4EPIsNPy7dIWPuVNaM3w4B805Gm2dGgn5PkrpTY?=
 =?us-ascii?Q?5XHXk83/VSNoEBgGf9CD3yXVUWMFmFreqFG+dzXbkzmD8YQyncasCCwFOu+f?=
 =?us-ascii?Q?4Oxv2r2SkZqVIZp/am9Um4VVKuUPlHVsxhCSINsnWFTDxFE0q0MNTxjN7oU5?=
 =?us-ascii?Q?lh9xGFG0dK73cNJs4bCHBRa6iK6Ef9pxHJIimHpOAUOSJV9fN5FmrdVrZuVP?=
 =?us-ascii?Q?mjw38FoGdmIhzUOhSk7IBR/WzKJoKiAD5+xBvpQVjtIgnNeTYiBXi80vWG5v?=
 =?us-ascii?Q?d/TXJo2F0yeE96xeQ3eJevE75VAlEGj10kp2DAM6HWtrbJSvJcB6TbykUB/5?=
 =?us-ascii?Q?SzDDtdrfVXHojMzKbMP2OZnDrVXa42R/EnXLg/RLSlCsqlnUBVFtFxJ7E97O?=
 =?us-ascii?Q?Shr3CPSmD+oh6Gb9rFWJwX4UVaDaiHjiOOqz8CPRaUBz+gzQMYqsbvg25+Bv?=
 =?us-ascii?Q?RtXGZcD5PxMR/wilsp40X8Lwl9MBIJP9MKuyhYiVGGrWk6U6Ub65cqRCQ3wk?=
 =?us-ascii?Q?KvS/xKiZytfgn68I5kmIQZynkRzLzVEACDXMetvBvyDHpXaxBuz6kwaLLX1K?=
 =?us-ascii?Q?oyaPy/16cN1HGseGhrkK?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39689e55-31dc-4e8e-5dea-08dcad0f6ab2
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 01:08:10.9340
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR20MB4680
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240725_180820_464308_EE9EFBDA 
X-CRM114-Status: UNSURE (   8.99  )
X-CRM114-Notice: Please train this message.
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

The i2c ip of sg2042 is a standard Synopsys i2c ip, which is already
supported by the mainline kernel.

Add i2c device node for sg2042.

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
---
 arch/riscv/boot/dts/sophgo/sg2042.dtsi | 54 +++++++++++++++++++++++++-
 1 file changed, 53 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
index 34c802bd3f9b..eebd6817520e 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
@@ -44,8 +44,61 @@ soc: soc {
 		compatible = "simple-bus";
 		#address-cells = <2>;
 		#size-cells = <2>;
+		interrupt-parent = <&intc>;
 		ranges;

+		i2c0: i2c@7030005000 {
+			compatible = "snps,designware-i2c";
+			reg = <0x70 0x30005000 0x0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clkgen GATE_CLK_APB_I2C>;
+			clock-names = "ref";
+			clock-frequency = <100000>;
+			interrupts = <101 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rstgen RST_I2C0>;
+			status = "disabled";
+		};
+
+		i2c1: i2c@7030006000 {
+			compatible = "snps,designware-i2c";
+			reg = <0x70 0x30006000 0x0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clkgen GATE_CLK_APB_I2C>;
+			clock-names = "ref";
+			clock-frequency = <100000>;
+			interrupts = <102 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rstgen RST_I2C1>;
+			status = "disabled";
+		};
+
+		i2c2: i2c@7030007000 {
+			compatible = "snps,designware-i2c";
+			reg = <0x70 0x30007000 0x0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clkgen GATE_CLK_APB_I2C>;
+			clock-names = "ref";
+			clock-frequency = <100000>;
+			interrupts = <103 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rstgen RST_I2C2>;
+			status = "disabled";
+		};
+
+		i2c3: i2c@7030008000 {
+			compatible = "snps,designware-i2c";
+			reg = <0x70 0x30008000 0x0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clkgen GATE_CLK_APB_I2C>;
+			clock-names = "ref";
+			clock-frequency = <100000>;
+			interrupts = <104 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rstgen RST_I2C3>;
+			status = "disabled";
+		};
+
 		pllclk: clock-controller@70300100c0 {
 			compatible = "sophgo,sg2042-pll";
 			reg = <0x70 0x300100c0 0x0 0x40>;
@@ -388,7 +441,6 @@ rstgen: reset-controller@7030013000 {
 		uart0: serial@7040000000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x00000070 0x40000000 0x00000000 0x00001000>;
-			interrupt-parent = <&intc>;
 			interrupts = <112 IRQ_TYPE_LEVEL_HIGH>;
 			clock-frequency = <500000000>;
 			clocks = <&clkgen GATE_CLK_UART_500M>,
--
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
