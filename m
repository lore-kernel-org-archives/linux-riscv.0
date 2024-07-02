Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC2C6C3064D
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jul 2024 09:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sOJ9grWD64EdSyzlgFIr5OfoIzehHWz458/4iUA+I20=; b=xRlN6fOzOgZGu/
	CmnDC0PZ03eCeDbJ3INhAIe7+CGegUP599vfCAyxKyp1JukqgrkyHrzxe6QfD2C9hw/IJdf20J4su
	kre6galQxVGaZiBZqOh9smmteGSw+9GFM5XstlPYC8iffPasqjYZUf3KRPgncnmthKpKLduHcPRf6
	Izy4CIXylgn7XOfOm7vw5nILecWAXhp5ofkXxX6HwkWjrjs2W9qsa/MT2zHvBetRcmkwGV1ZW7yqy
	ZdZaxJ3WUb3oxJ3BhxiX54bgPJn7nglsX0k2srEzr1zYdHvhMIzeuIFyAEhE0UUW8kvP/2wxISYqm
	S8sZbQkX5rpgpqSM+KnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOZrE-00000006Bn8-31k0;
	Tue, 02 Jul 2024 09:31:29 +0000
Received: from mail-tyzapc01olkn20801.outbound.protection.outlook.com ([2a01:111:f403:280c::801] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOZrB-00000006BlL-3Yp3
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jul 2024 09:31:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gkcW/iOI4hkTqDWztaUwYFrk6oVn3y816Q1dum+XAhu6LD37rm43gf35EID52deyPLz8MWUib6z6Mwb9tGL7oAg5x6qVn+j8M1G3PgqFHyXhN6nlTMXT5O4kKv0v6NwHUuSPfv3dVt9FED/WUKGQfQrl77onkLVwq+NLnPmxywtbaBkmshtXkAj5hmbwIG7ctpIjVLMLWjRoB4zNfuKr6mhHUzXolJUmN8pGaP9JWouP1c1TCNX/Y5ghTX31FcFoEVvh4AyPWvCO/Y5QsawgBvcl83Uimam4YGH4jh1dLHH+VgE4bvzqoA4ycGF4+MaO2PCtN5rRodykuohlsUgt5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pcjU6u+xZdT4at50y1D8oO1b1LKeJTwhS0qre43U55w=;
 b=JiAWqRTvsYFZVhk0fF6vewHP5WpRzg0j5EPwxGhWPfrl1gBNEIfB6SR9bjrt27758b3xu+C8Tkf+fbi3oPoy/HfrQLhQt1UEKj487LFKrm83etyNh3PPiXWTWM4qa9ObW+Zwkkk5KglR005k4RGLp/2x8+jC2JVA712zh1LotYjqcsNG2SCBgWufBYhd36Y70WF0gBjxeYC8NjGIkcvF9uorOqyOAQ5CFYI98cBGH0jkzkxMcrZzBvpeDYkPiC1fZPcPvRz2sRHJY3zu1dnEi02xIpXkvQaFj4yLF+4yH87AmTUWZFMAZGvJzfU8454b5HffGUSsIAHY0OcDYQ1NXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pcjU6u+xZdT4at50y1D8oO1b1LKeJTwhS0qre43U55w=;
 b=aMGsU3KTHFUypnAhAvnLAzRunv5MTP0a907394TG8IvD40ZtApJyC51yMZeVZ5dI/bOrmIm1kZZtiCJN2AMSg7oH9PuERs5ZFhmWWXj8qezfJ3589SvQqEE1e9H4yTxE2xOb1QxvlOn4W6vnMnK5+ZDON2BXRAb9eiZymYvp4JGL1qMgIr7Dku2eqdNsK2junS6ZtqZ0eDZfGbOj/E8KIP3EsG04FUFi68DYYmBA99PoloheyXiptXtvjs5irVBcPQZLFi8AlN4bHlSvC4LwN4GAIcMk1CHZfE0GIS1Tott6WMAqeb0DRlHVM5xzlW5HX6VTlLghg+29YH3binliLQ==
Received: from SEYPR01MB4221.apcprd01.prod.exchangelabs.com
 (2603:1096:101:56::12) by SEZPR01MB4613.apcprd01.prod.exchangelabs.com
 (2603:1096:101:91::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.34; Tue, 2 Jul
 2024 09:31:15 +0000
Received: from SEYPR01MB4221.apcprd01.prod.exchangelabs.com
 ([fe80::b674:8f70:6e29:3756]) by SEYPR01MB4221.apcprd01.prod.exchangelabs.com
 ([fe80::b674:8f70:6e29:3756%4]) with mapi id 15.20.7719.029; Tue, 2 Jul 2024
 09:31:15 +0000
From: Haylen Chu <heylenay@outlook.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>
Cc: linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Haylen Chu <heylenay@outlook.com>
Subject: [PATCH v3 2/3] riscv: dts: sophgo: cv18xx: Add sensor device and thermal zone
Date: Tue,  2 Jul 2024 09:30:25 +0000
Message-ID: <SEYPR01MB4221AC78D8664EEB73A3275FD7DC2@SEYPR01MB4221.apcprd01.prod.exchangelabs.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <SEYPR01MB42213F3A032C60C6AF5EB677D7DC2@SEYPR01MB4221.apcprd01.prod.exchangelabs.com>
References: <SEYPR01MB42213F3A032C60C6AF5EB677D7DC2@SEYPR01MB4221.apcprd01.prod.exchangelabs.com>
X-TMN: [eTVp44+Iv9pt6qvtNrU/Ev3cxWHcXEFV]
X-ClientProxiedBy: SI2P153CA0006.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::22) To SEYPR01MB4221.apcprd01.prod.exchangelabs.com
 (2603:1096:101:56::12)
X-Microsoft-Original-Message-ID: <20240702093025.449-3-heylenay@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR01MB4221:EE_|SEZPR01MB4613:EE_
X-MS-Office365-Filtering-Correlation-Id: c2b8f059-1091-4a10-cee7-08dc9a79b84b
X-Microsoft-Antispam: BCL:0;ARA:14566002|461199028|8060799006|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info: WPBqLqkBIINcAvMTM94dkeG4H53OL3xd/XV0PBSGHsnY9XihA03OTuyfaNzXQ3Vv3Ej8/pfAeVmi7M7W0twEXvZSbpwAk5k+jKPrx9Kszb/vpWUvKuNCMc3fKnCXQ4AZQ5HGCmmmhH6qc1Uul75+YUHhyOgXMjddSk7C/rRvWieQFVSP3gYs63frUKdvZB7+8g+b2jQ9HtHyePQ3375OnuTB1nxCItP45INOcU4j7ximcw5FhoVJzSBWwlDMLI+7A3UrAtLI/r0ng41OWxSVWbn4Mik3ov663OGwGuu0YuHMFXqy29LZ3cAAuCvsCFUeddr6wWMUxBgOSnA0X6fxJp1CMd5Re1CIe3rpf2nQK65oH8/bWyrmpGFNxtZwjj1Ny0oj84dvBY1UdPJawfVrTotg3ecDJQ2sX3FsdUY7ySxlXbzHUziABv2AKIc5zJ0eX4wPszVHKm6qwPRHNYFo3ADrUL6T0xkK0q5Q92Dz+/sZXKVCGT4oeOzYeB+3KZJaSjB6l/I3UKOF1KPOypzLlrduphsVynjWGvmTyXvmK/RAcawIntX9cU5u4dBEwV4lJRgkBqHWAR5XoAhI1aSmeXdtqJGqdY/dQNR91H00+MmGEri/SB6TIKg3ltPGZSzPFk9l32lSngZyvXmHksaZAQ==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XrPt3rehJZd7uNMEvE/c/+KqE779qM2qZtrmzleCdSjqXJ/dzHH9xrPzT7r/?=
 =?us-ascii?Q?DzVWW+cJb4x6vAwDa3nwOXoS93SNmqkYxxPkKf94vjOy/94jZKD9iBTHyFnY?=
 =?us-ascii?Q?IegsvuP/yHHKQ3ynQuOLkn2zoTwVGu2ipXF+6UuFHlzjeE6Xdd4TzOXOP9iX?=
 =?us-ascii?Q?GdG3dnthaRWEztolpfpLwCMMo9SVWjQ93fjorLUx1GAeKFrouhlQfFahxPnu?=
 =?us-ascii?Q?LXNiSCEFtloVphuwMSJB8Z+lJRzjkCHzZ9Vz0hMe738NmugojzP94zAsf8sY?=
 =?us-ascii?Q?hnjcq50uPrkZVFi452JTG4LLEX4suWJpeVFLuFENhRVrWWOzcGndhH1qTCll?=
 =?us-ascii?Q?G4S0x1o24+IcZCCDJcSI/+m1aQEiwYgS6NvRr4hmXlsIq6+5nrb8baHBliWy?=
 =?us-ascii?Q?PPMUcRwtG4ppnMe+iN3CJU5aCNn9fUuaEBuTdHUCWr3SyGa4h/pSDeZ4LfE6?=
 =?us-ascii?Q?6wu/Cs9lp3k/IhxiMh4aJPJKOt3Ht0PIprjgVLzuAKY9lqcGPXkONRBZjlEF?=
 =?us-ascii?Q?IeMIzswJl6bXh6uFdqGDUNUvv4c0um6GAyovraJ+1p3v1nRxqGGC4nJc3TqW?=
 =?us-ascii?Q?gU+mT9WcIkOq2dJoFliua5dm8X9yfYgxnFHI0lOo8WLSx3mCp9k6cZy4z6D+?=
 =?us-ascii?Q?T3g7/CMZ+cCr7qQdwivULypo6LI1XmYH2zmD54kSLKiMf4rnVfWWwNayp6gR?=
 =?us-ascii?Q?E+ieCNwzAYkyoXU5fMFXqNjKct0R0ENfHamVph09wJIWYeVUFaI8AFhzuLZQ?=
 =?us-ascii?Q?AcuGfRDr5hIY6DNGS1CicaTU2e+VFrvwsNWCfFM5kwtudg7PoFaGoKk0Kmm0?=
 =?us-ascii?Q?2Z6/BOwYlCvNb1d/H4B9s+MFnTE2WokJXzUi3X9f7SP5kOGSF8z7dK9zLjBo?=
 =?us-ascii?Q?ufu2FwmMlrZNdkjq0Tav+09qe1cIi4C2F8LhS0RU4XEBvWQa1aRhr9JhbIzx?=
 =?us-ascii?Q?4bKZeVck2DhLlVfzv14SA9NIfGUWuVSobokeHcNBNJKnXj/1JgALsoH1Hni5?=
 =?us-ascii?Q?YBeCvJCr/WVlVPdfP/62YJMFNSbaumxDvFUTfyGxG+7BaU54Ap56aUWogkxR?=
 =?us-ascii?Q?lTRPNmn2vOiHTb2EFBfu/EdP7lJPuUX+sSGqjwWb0gsoKHFaKuV/nwcNCOTS?=
 =?us-ascii?Q?D4037SqNMzDOwtysu9GfNXk64sJIQwKL+Yv6cHrNJWsVhe3YUdsrTCpEpAkO?=
 =?us-ascii?Q?9CJBg+L3uPCQiVr/f1dzl4woLfONicM9uBtAMGrXPXf2FopKIZ9CMKMIhHg?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2b8f059-1091-4a10-cee7-08dc9a79b84b
X-MS-Exchange-CrossTenant-AuthSource: SEYPR01MB4221.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2024 09:31:15.6079
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR01MB4613
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240702_023125_925360_85362D90 
X-CRM114-Status: UNSURE (   8.30  )
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

Add common sensor device Sophgo CV18xx SoCs and thermal zone for
CV1800b SoCs.

Signed-off-by: Haylen Chu <heylenay@outlook.com>
---
 arch/riscv/boot/dts/sophgo/cv1800b.dtsi | 30 +++++++++++++++++++++++++
 arch/riscv/boot/dts/sophgo/cv18xx.dtsi  |  8 +++++++
 2 files changed, 38 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
index ec9530972ae2..0b5c7bc94b05 100644
--- a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
@@ -12,6 +12,34 @@ memory@80000000 {
 		device_type = "memory";
 		reg = <0x80000000 0x4000000>;
 	};
+
+	thermal-zones {
+		soc-thermal {
+			polling-delay-passive   = <1000>;
+			polling-delay           = <1000>;
+			thermal-sensors         = <&soc_temp>;
+
+			trips {
+				soc_passive: soc-passive {
+					temperature     = <75000>;
+					hysteresis      = <5000>;
+					type            = "passive";
+				};
+
+				soc_hot: soc-hot {
+					temperature     = <85000>;
+					hysteresis      = <5000>;
+					type            = "hot";
+				};
+
+				soc_critical: soc-critical {
+					temperature     = <100000>;
+					hysteresis      = <0>;
+					type            = "critical";
+				};
+			};
+		};
+	};
 };
 
 &plic {
@@ -25,3 +53,5 @@ &clint {
 &clk {
 	compatible = "sophgo,cv1800-clk";
 };
+
+
diff --git a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
index 891932ae470f..76b02cc279aa 100644
--- a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
@@ -310,5 +310,13 @@ clint: timer@74000000 {
 			reg = <0x74000000 0x10000>;
 			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>;
 		};
+
+		soc_temp: thermal-sensor@30e0000 {
+			compatible = "sophgo,cv1800-thermal";
+			reg = <0x30e0000 0x100>;
+			clocks = <&clk CLK_TEMPSEN>;
+			interrupts = <16 IRQ_TYPE_LEVEL_HIGH>;
+			#thermal-sensor-cells = <0>;
+		};
 	};
 };
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
