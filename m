Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8214C3DA4A
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Aug 2024 02:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6vUMtlfDjRqedZ+3crUKuSJB8bBs1NvYAcJy+Pnx/uw=; b=D0CroebEQDUjw8
	VFdyWqbcmy5TTUuB96eGmDv5e5rffKQtH5oBN5DxHbEFw3JImAeL3kTZD83Yr/ZmCCPkDr9vLqCG7
	ZR4zeIEn55zlg/Dw0FdbD+zyxVRSWrFgIZAeTHS7GPngDg9xsb/f+JAPQrURLnBmpyACX17HdW6Ay
	g9hFdwuASFNSrkVrM0eQmZdWf9ov35VP6ipy9g9p9lsYSgFPQxrGDUbwHbTKOc10UnD7vWaVWGOHm
	rz5PdAcpMOMZoSK/pWi4PrVjjt9hQUQJ0b0HnXh2kiIqdTsP2V/XPB6RCIDOpFk6X6YJzopBUskhQ
	0b6DPftcd1nLNUKg2u+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sf96m-0000000EV4e-0lvN;
	Sat, 17 Aug 2024 02:24:00 +0000
Received: from mail-mw2nam10olkn20812.outbound.protection.outlook.com ([2a01:111:f403:2c12::812] helo=NAM10-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sf96i-0000000EV11-17vv
	for linux-riscv@lists.infradead.org;
	Sat, 17 Aug 2024 02:23:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nx0iJVZISCdh8R2jO9rOTzk/JANNZeZe52u+srKIPL7Nop3IGvh5fuMDFKDEnYpeEqF2xT386emv+/qoHROnB+8alf4mqhk7LT3WJJRfVujMkwM49hmi5VhfxzYYXc4cObUeebFQ8j/hJsTqy+vugFZUdDqC3eLIqJW8kti6Nvs4hhsHw0pTAkvSa8Z6W/yC4H7+meW8lz+YHw5ZbONtN/H7lUnDj0kx2OmgAVfaz2e8hVAKpSX7dxr1iMeU3TLzgPN2IQmIwL3G286zk1S0SkKCaogYFYoA93akFGGJP5P8BJj009sgIsdnpoCKXtyULemyQ6W2l0XTKcG1Xfl55A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FHEUQngGJDx0vOokAPvghmYJe9j03nCnYapbJwhGE3s=;
 b=gg76BOOYeSTttXSWWvKRdmeMKPpvdsRAY/tjid18ranXoC4WCXWUJR2fA4pNjGU4yfK1hBcJAnW731VCXqlcTm5aJ/mlSoyukskOBe/prk9hotDTHBVQvYMfaI/a3UMv1cnO2oxVXDMDRRBTUm5FiAt0oqrMAc0uwuPhsdu2kmIf6Sa3A6eKgxXV4GR58j9vlfwpmqL3Oa4D1y/qCGk2rGIzzZ/w7+D2w/h0ZMouGoHUrR8UeNYSBlRX9KHX+g6RLnJA6Qth0KDJ78OoQ+wqNFxgvPyEW1qHiykK7uwGLhzdhg/+VRiwaYM3dWlkbLG7DM/4oIQ2DpTZvD2w2as2vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FHEUQngGJDx0vOokAPvghmYJe9j03nCnYapbJwhGE3s=;
 b=EY0W3MHwI5fsWnYHKNJ9NzTyeSZzmZPK1G1kvCizdb1oUl0ZQ/DSlTGCr2kxcgNCCa6j1D11xgMysdAMeVjvUmeJ7pyP6nypl4xxCSxnJyiHj9wk5BYef/92ax7A4NREoKVOzmdixF6SXZGjOi8/FaR3B2lFwk4krmvM2cRXkOGGr2lr4GbYsKBWUhCyQztFX3223ElxlWBMo9uJo9o9KGvSKOcZcPU9MNygc0IxpN9ImPboDH9yT96gDqYivNkDaawlW5dryTn5+XJnFA5p2jSgpu3NWnOVafTzmKZY/I9U02LRVleCZOZWKBux5iefnALc1GkdSSX+0GKeX3v4og==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by PH8PR20MB5337.namprd20.prod.outlook.com (2603:10b6:510:1bc::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Sat, 17 Aug
 2024 02:23:53 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%4]) with mapi id 15.20.7875.019; Sat, 17 Aug 2024
 02:23:53 +0000
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
	Yangyu Chen <cyy@cyyself.name>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Hal Feng <hal.feng@starfivetech.com>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v11 3/4] riscv: dts: sophgo: Add mcu device for Milk-V Pioneer
Date: Sat, 17 Aug 2024 10:22:58 +0800
Message-ID: <IA1PR20MB4953C675C28B35723E87A36BBB822@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <IA1PR20MB4953DF0AE7210A6D74162952BB822@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB4953DF0AE7210A6D74162952BB822@IA1PR20MB4953.namprd20.prod.outlook.com>
X-TMN: [7UTbJOnCX9xbqYuGyIDWpnboqLlFs9AIh6hoXEFos2k=]
X-ClientProxiedBy: TYAPR01CA0167.jpnprd01.prod.outlook.com
 (2603:1096:404:7e::35) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20240817022300.360949-3-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|PH8PR20MB5337:EE_
X-MS-Office365-Filtering-Correlation-Id: e1e7041f-3041-4004-5cd2-08dcbe63a377
X-Microsoft-Antispam: BCL:0;ARA:14566002|461199028|19110799003|15080799003|8060799006|5072599009|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info: ft0hdUAXVmOqK6TW/ewNuthT8Srr6+YBe043s6zWwFiCT/J5vUW8ED1iI9CNtT5NotstU1UHN+pBbzuyIdH70/mvyV1DFoQFNAdAfxuVvdNGSACZRU54dXMqr8wYxRU50ZrDys5yjxjDriJDQz/izgHVoatNgUkza1oqwIs0KC5oiGdxEY+AwKnJJf5dg7zuvD3NSPq2HIds+k7qDAHjPI1PKAN8NsLZWS3igOuodXltJqBXlR3qHiSZrDbww4hripPN8AxPZ/A0ah7TOLaQZ6dTf7yS7aNgNK1Os7rJf/pecn3Byp0rka1Uz64RVYo9DI/7qBIYdwtLoP5/UXi7U1pQjQNh8x4zBIA6it892/u6kCyQKoVLHo8j60Nzhj2V9WuDPHoZNgkalt2AwLo02Y9BMHneO+4Vq0fvlooTMvAMYREbmABV9EPsbY6cz1uApRYRKYbRIz6K16psGtrAbh9Dc/gjD8AsY2lmw7RrdsZE21W2ELcY8Pl7QmYZz2MT3D8lI+4+5utZ3qvJgm4czbFxdNAVcQxaOkin4MM0joHyltUv09d4+3I1OYE8f4gP4AseBTktV4hPYMn1100gcomgtrIYSFzp2m1KdY+cixhNcNclTGXxevhcPErOmJqDOxNHXqyp70qkg4OyppwAZY6Zsvv5MXMjR/ZEhCtZBk4Ee5r6y80pe6s/HqbGvGl9DxxNVaDURJpk9/wagC8jHfmSMkiw7MzgelSnPZwMojM=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oMMwvkGy6IJoK9isW85rQbywTxvIHqgsqWXgC0jOvjN1mX3Tm1O2BlkPPBH3?=
 =?us-ascii?Q?JhWIqV74J6MnbKECASe4qaegNXEhlAuziTzeMHFU0pWe3yJqgHtIGzjdtZz/?=
 =?us-ascii?Q?7HdsjWvOLZfDu1VNmJog/2cgAzwrFsKU1ALBFBsPRxg3Ai1JiE1ZESyWyRF4?=
 =?us-ascii?Q?x4mJ06x6OLMNwH/Ua0RTrtlDTn5btuc00UAVes5PgvdknLf5PCUGhkQZSZCu?=
 =?us-ascii?Q?8jW2e7btirhhiE6Rs2s9te9JNesvRmVXeR1hztBAqlwYQajw62SxHQYfC6rA?=
 =?us-ascii?Q?Utbin66qgm/EiSVDM2W7wAIkBmkBk08e6wmvrn4I9I7oUcdgHWdVPg3mEiNh?=
 =?us-ascii?Q?sfv1fkxRdRLNFw+rF6h6x1JMVW5jPzsNy7JA41Ea6byb89EbCLz7S1rpyACZ?=
 =?us-ascii?Q?/iTiJiOHcNPcMGWcQycylXXi8uvoaVGVYngnYdIdF/VqHiSF/lZ/g6MmSmPj?=
 =?us-ascii?Q?tFZWBVzp2LNU5hqOtUZzFFFTA6Bdz0Rji2EdfpJoC9+QpGRiP+kvlWMyUKyV?=
 =?us-ascii?Q?5TPiEHXsTXHy/Z0CN8b4vWQc8QWUMJQI1TtaQZq35p4Vf65sPNLPkG+TMwj2?=
 =?us-ascii?Q?htVkiYogvKeb1hIuCnckRX83A0XxI4M0fXvoQf8S3Ela35DtdP/JPkoIzij7?=
 =?us-ascii?Q?EQMjNX4hudDuSGgHmy7QJUXUEt1S9kqDJ99wmtVTkzLEtHKen2j93tLiP96B?=
 =?us-ascii?Q?RblQx4w32yEJ1+VJlepAibWDts6Mf3xI4waNtrDi2UJbTcAIYs2zMr61YLbj?=
 =?us-ascii?Q?gD/BBQ3nqE523h2Usd+7fGqIDQDXw2IRlDMK2UTNpoaaSufNH/xtNJjtq1/e?=
 =?us-ascii?Q?cQvPStT+YtOBvewiddDz/0twUEm9lvAMvAuiPHUbSiJv7yRuO6d+iggBfaa8?=
 =?us-ascii?Q?D61VtmLpoNRCI/LOTcHzl0Xgp/IORcJWur4JR4edP5hL9RWgqlOc2modYOLI?=
 =?us-ascii?Q?PVceX+rxJ5O3go1FU1aicEyLhggrYFDWOdWB0KKGukdSCAwtwgpskBAwWvOO?=
 =?us-ascii?Q?fZiYhO1ThbVEZtlJ7yLRQr5p4uCCpS2BJPmgi/iciLBGiYGUkIoUNIVAvM5Y?=
 =?us-ascii?Q?QvJ/fLhiyWEEukT5HqJUzdR2s21LC0Ef2Q94IJndTqv+30bmhAw8etWRV1fV?=
 =?us-ascii?Q?lnf0ZHuPaiSDTyKY+y5W5C3/zlnHwK7ecrgyZ066h3WFEB1rYuOxgNZ8RLIP?=
 =?us-ascii?Q?yZrE6RQXDMwB1JEot0THbEMltG1LV3rp5LdlrVaurGfXpvlUvzajfvewYxr+?=
 =?us-ascii?Q?hzy8Tjg4+KCp0Igj1bHc?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1e7041f-3041-4004-5cd2-08dcbe63a377
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2024 02:23:53.4782
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR20MB5337
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240816_192356_366341_A2950429 
X-CRM114-Status: UNSURE (   7.80  )
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

Add mcu device and thermal zones node for Milk-V Pioneer.

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
Tested-by: Chen Wang <unicorn_wang@outlook.com>
Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
---
 .../boot/dts/sophgo/sg2042-milkv-pioneer.dts  | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
index 80cb017974d8..76375e25a495 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
@@ -26,6 +26,66 @@ &cgi_dpll1 {
 	clock-frequency = <25000000>;
 };
 
+&i2c1 {
+	status = "okay";
+
+	mcu: syscon@17 {
+		compatible = "sophgo,sg2042-hwmon-mcu";
+		reg = <0x17>;
+		#thermal-sensor-cells = <1>;
+	};
+};
+
 &uart0 {
 	status = "okay";
 };
+
+/ {
+	thermal-zones {
+		soc-thermal {
+			polling-delay-passive = <1000>;
+			polling-delay = <1000>;
+			thermal-sensors = <&mcu 0>;
+
+			trips {
+				soc_active1: soc-active1 {
+					temperature = <30000>;
+					hysteresis = <8000>;
+					type = "active";
+				};
+
+				soc_active2: soc-active2 {
+					temperature = <58000>;
+					hysteresis = <12000>;
+					type = "active";
+				};
+
+				soc_active3: soc-active3 {
+					temperature = <70000>;
+					hysteresis = <10000>;
+					type = "active";
+				};
+
+				soc_hot: soc-hot {
+					temperature = <80000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+			};
+		};
+
+		board-thermal {
+			polling-delay-passive = <1000>;
+			polling-delay = <1000>;
+			thermal-sensors = <&mcu 1>;
+
+			trips {
+				board_active: board-active {
+					temperature = <75000>;
+					hysteresis = <8000>;
+					type = "active";
+				};
+			};
+		};
+	};
+};
-- 
2.46.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
