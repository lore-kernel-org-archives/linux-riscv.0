Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE473C35274
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Dec 2023 04:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lq5IjhrTAgmW/zVEeNz/q18jTECzJZ1WAp0PEOvuL24=; b=ZqMowVgxjmvFhw
	2oBuC7U07CNEbgkXWJBsDnbmrMhj8Nk0D47lTDQ0JR4MO2FBDplOoirDk/YDCCf5mFQf/IuaMyc5M
	CNhiiyDz9hZMzVyFYKfqmYDUi/xf/4OUWQmAJD0QuYeJ98zUptcyLp/S2dFja4ZKrI0M9k53H4O4o
	eZ9VNRSEeNQXbUv7pyoI79lkHdtCTehNhLRqzh34yUmPpO9nErdhGd/AAy6LJLKXiA11kcm9/AVaf
	BBKO0QmKBO7bhjs84k1kbenUvjjIrNtMl2+JWT+8Bd5AXaHh3MN2ZjKAYk84MMfq3FI8VzPGFDvmu
	Wspq0w0FQp7GAZ+/8Itg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rF4s4-0090tT-1K;
	Mon, 18 Dec 2023 04:04:48 +0000
Received: from mail-bn1nam02acsn2080b.outbound.protection.outlook.com ([2a01:111:f400:7eb2::80b] helo=NAM02-BN1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rF4s1-0090op-0u
	for linux-riscv@lists.infradead.org;
	Mon, 18 Dec 2023 04:04:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RjH2G30iJq19pRwxDnvSnAL92MLVv5E7A6zCxIpA8twY4rvlms6g310hY/0rAOzdF/kReFqHb/hmvj5uKwpzZz+e/6GXZUNcwYlj58fE+KJqA32jYRsIgNxmI3vh70sGXaSp+ZsqLVsg3odrgKnMRFTpCQGXVJwXSefVpw7U2rGW9dHO8CtkirG1yDmqIUene2FAZO9s/2PhH5UFixZKmUYusNDQvEJfUg1jguNZagnOIEb4TtrU+9sVcfduPqbNl6QD0EyQpVD8h32Q48OT8cgVo82pmpJmTTsQrtkuVdRp/MmiSuymph817dLgvzIrrlRIj4chu0j+DkEHNPDacQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cor42z0n//rFJE8KJb9aLxI19y8bM26Khqn4WDnZiok=;
 b=P+yMY6NMzjHAn3YFu7ZmWza1kRQJ7ZOcUMooaLt9qP9tuSIUM+gKAe/gOGo/SM6H4OMx9csXFHtE3nMHHCIrCIRZr7PAMKK/ltm5/JmZiKdG06r+gWl/VvdKpJuwXftUbE/8fwQcQu1tXhFm1gZ9JnBH7M0Ib7mI11DylSMDzJASHT9Kic3q3oTdHB+JoOaaKB7frHiuF0LYNPuk8jpNUx6hm9Rxu+sOObF60Es3OxpGHxcocakWb/cdGPq+VF9laW35eI96uqRFK/fhWDlOXXWo0V2We+Uimieo4YuZy25KY17E8OyxHctmwxzE9a02LVdZwcrC9LwmPtDc6lmH0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cor42z0n//rFJE8KJb9aLxI19y8bM26Khqn4WDnZiok=;
 b=dpLQgvrOzo+KdM774o7S8ilY+K/k/yTqt11dpYEBn5y6mMbyEljLlBF+jl71qlfPbxjjljchX90iDQaCoqS1RuVxa40NQOZ2xgLO//QwYXDwdQ95pYGcJ1GGzGbxudztLLRTM79sMwf3d3wGyepBQw1dbVQOW1ntJ4DJZ1RkPyz/tJVYjp2yHcXjAuHLPtvHFLvTVPWbK6iAvFIMf5R81rzXvp8sZOybjGfDISTnjaHMKm1xGHEZNbElEiszOZXBwGQ5fudIco46w1s/biCVqVqqihEEs2m67QfTigwV0EOZcNTKkjR+fawk2gexf2KXEMPB0SaKpq8pKJBi2JOHbQ==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by BN0PR20MB3976.namprd20.prod.outlook.com (2603:10b6:408:127::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.37; Mon, 18 Dec
 2023 04:04:41 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::55b:c350:980:ad8]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::55b:c350:980:ad8%6]) with mapi id 15.20.7091.034; Mon, 18 Dec 2023
 04:04:41 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Inochi Amaoto <inochiama@outlook.com>
Cc: Jisheng Zhang <jszhang@kernel.org>,
	Liu Gui <kenneth.liu@sophgo.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Jingbao Qiu <qiujingbao.dlmu@gmail.com>,
	dlan@gentoo.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v4 4/4] riscv: dts: sophgo: add uart clock for Sophgo CV1800 series SoC
Date: Mon, 18 Dec 2023 12:04:06 +0800
Message-ID: <IA1PR20MB495348CF6F79C85204D23E86BB90A@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <IA1PR20MB495354167CE560FC18E28DC5BB90A@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB495354167CE560FC18E28DC5BB90A@IA1PR20MB4953.namprd20.prod.outlook.com>
X-TMN: [Rzc4djImMWk2AB8iGhGrshWJaQ6HRFGliWIGiFSZ28c=]
X-ClientProxiedBy: BY5PR13CA0005.namprd13.prod.outlook.com
 (2603:10b6:a03:180::18) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20231218040407.574287-4-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|BN0PR20MB3976:EE_
X-MS-Office365-Filtering-Correlation-Id: aec4b7a2-a5ea-4094-2db4-08dbff7e75a2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qsWWfEbzSQu5LjoKRpI+mdiyGqgetyt49vi4HYxx5puErmkuE7nsd8zJXeIyaz9gGeueD+Wz03Trp7QLfbcOCAyKHriJ1sThX9sL22A0TbzLBE6ZH6KU6ITxozT/1KMIt+VZwxVZ+GR48rj8+mr7i3XZ3N87sCyPRx9O6qKY/WcmgGd1UFVHmZj1dqX0wcyiPVR7pVw3EGsPEPr0EbW4il4Fc6f8YBgNDv34dInbS8mW0D0/9JxkB9bnfWvSFxuWcg1xhsBQDVN+CWXX72Fr1zUJTq1/0GHaIIx7CN0Ls0oYYvzo3gGLDfxEelGNQzDtD2XzNTxkaDTKnSivd4qCVHK51hqFqwBt+fkXUUcz3iWhMRhp5fIRhGTkz7aEUmD0lXJqMnmwcWqn7Cu2QNguV7av8NwuKRaNS+gDdi+xdhEwbdNIyh9Qitaym1E8/CMhcnffifWf/EqpLe9niRZ/mgkDBjwV0OttV1xLjjjXuvHeGksCrejHl9jqvYW6GL6MMfAdw8ucLpGEe3dFQ74rmUYzu8VF7Rr1KFIZ+d/Yi2IxTWtuDxmHy0DOVY58OdHVhESWrMBMG1SABUuZtrX0jyiR0H86y+12aO1K6gAUW1bmEoPxRO48pTC9FdcDQ6RW
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WC9huxsJqU/BuVhHVQGVsanN//2+3qPLR4soBg86dyZjqgsIbLh/WdaJq+HD?=
 =?us-ascii?Q?RVxdSqcrX1rfwAw9ZTA8hkoFP8Q2dD3UQht5sZK4CHxMDPGdFr045M08zzrw?=
 =?us-ascii?Q?HafejK0yECkGkFmbclLU0an/W44uUQvOyJKyo13PaFS9QkFTEY+90pk/9ZuJ?=
 =?us-ascii?Q?oh5Ry5aU0ZPhcBZLPA6W6jPQ0iQXAYx48+q43Yri1qrxtJmLCvWCd88IDpmq?=
 =?us-ascii?Q?M+eY8OvCnvjD6Ij3E5YtM0OqPg0RbTshZLeTrHAGUJiXh07FysvFrOwZ4vde?=
 =?us-ascii?Q?Lkxf5aPnUNI7yDuTVNx82MuSw+B+K9LsRX8zM0DqrrX+PDxwA4lpMHrh/kHg?=
 =?us-ascii?Q?peP0EMYpahcYT11Y6I5MuLg9WlHia6BPlhpvYGsCj+Xp4e/oTtqMSlleHY3l?=
 =?us-ascii?Q?8X74JBHYz3XDEnOopyvIq07rh0EKhvOjXNEUAiFvj+nhdGClPUYyg7KDckpD?=
 =?us-ascii?Q?xkIkIe7CM9Tz/fnWEEiyP5uSyf2JJxnOx8ClLfhot9hFbTLSWwu7niI4jlxa?=
 =?us-ascii?Q?rPsHBsNz2dzuJTR5WzT1fSUtLGuqfvLyQNDqk8f1NWfpLd/vnYhfmumZFYy4?=
 =?us-ascii?Q?lEtHuMDznR0hULCW5oNDjBgTm2pnaKRJNFCdZ4qtnyDAFodrrQidoYOL+pr9?=
 =?us-ascii?Q?IZUisG1uO/MblfWfPtt06BZ/gfyahOLHd/0S1X1oqvD95WbblWA18dI4JHxP?=
 =?us-ascii?Q?QgZC5HnHYkNC6y7rDzxHdX/wfsutA+xZiK9YcqOwPJxlu6HS3H13PXXtp3LH?=
 =?us-ascii?Q?305usGqPgYzbC5PiRHPdVAK6IZNsBrOYjQW/ZPSOtlqdKDl42Nuo4pGPK3FM?=
 =?us-ascii?Q?wLgDusPSnlt9nZSv9bzv+bWS3Ls+EPv86URmO+srAKZOZg3plStxjQrlwUHd?=
 =?us-ascii?Q?+bi2wdSJdcUdL84pIeQZgcpxCdQ1M8/jjoauxhfxeHHl5qiNlYe3LNIB25wy?=
 =?us-ascii?Q?QYrTOcsbFhXNnEe7FiFOWAdI+orcWteB9FBmXJuh82khEIk71P088A7uxbDY?=
 =?us-ascii?Q?oU5VszSSlheO4jhE+koIotUUn/79m41vLfwEccGldiVRTE76w23iU3VSNnPq?=
 =?us-ascii?Q?lh5suH6A42oEi8Whj6m6rZ8l/HcZ2A+gJ+Dlowi25VagDG0htU+APM5aWyvJ?=
 =?us-ascii?Q?5rZzJc+ctY22qxtezTVT2NSP2TN2Wu0usoyHOaz6B1U32bbx01CRMoiXZEDR?=
 =?us-ascii?Q?73yZUWhNgM93WTtoaAA7adTbqMbHcpWTJKT+s8PEebLXRCU1X8U2gvZCHns?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aec4b7a2-a5ea-4094-2db4-08dbff7e75a2
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2023 04:04:41.0642
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR20MB3976
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231217_200445_324311_8AD284E3 
X-CRM114-Status: UNSURE (   7.98  )
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

Add missing clocks of uart node for CV1800B and CV1812H.

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
---
 arch/riscv/boot/dts/sophgo/cv18xx.dtsi | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
index 6ea1b2784db9..7c88cbe8e91d 100644
--- a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
@@ -5,6 +5,7 @@
  */

 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/clock/sophgo,cv1800.h>

 / {
 	#address-cells = <1>;
@@ -135,7 +136,8 @@ uart0: serial@4140000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x04140000 0x100>;
 			interrupts = <44 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&osc>;
+			clocks = <&clk CLK_UART0>, <&clk CLK_APB_UART0>;
+			clock-names = "baudclk", "apb_pclk";
 			reg-shift = <2>;
 			reg-io-width = <4>;
 			status = "disabled";
@@ -145,7 +147,8 @@ uart1: serial@4150000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x04150000 0x100>;
 			interrupts = <45 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&osc>;
+			clocks = <&clk CLK_UART1>, <&clk CLK_APB_UART1>;
+			clock-names = "baudclk", "apb_pclk";
 			reg-shift = <2>;
 			reg-io-width = <4>;
 			status = "disabled";
@@ -155,7 +158,8 @@ uart2: serial@4160000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x04160000 0x100>;
 			interrupts = <46 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&osc>;
+			clocks = <&clk CLK_UART2>, <&clk CLK_APB_UART2>;
+			clock-names = "baudclk", "apb_pclk";
 			reg-shift = <2>;
 			reg-io-width = <4>;
 			status = "disabled";
@@ -165,7 +169,8 @@ uart3: serial@4170000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x04170000 0x100>;
 			interrupts = <47 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&osc>;
+			clocks = <&clk CLK_UART3>, <&clk CLK_APB_UART3>;
+			clock-names = "baudclk", "apb_pclk";
 			reg-shift = <2>;
 			reg-io-width = <4>;
 			status = "disabled";
@@ -175,7 +180,8 @@ uart4: serial@41c0000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x041c0000 0x100>;
 			interrupts = <48 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&osc>;
+			clocks = <&clk CLK_UART4>, <&clk CLK_APB_UART4>;
+			clock-names = "baudclk", "apb_pclk";
 			reg-shift = <2>;
 			reg-io-width = <4>;
 			status = "disabled";
--
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
