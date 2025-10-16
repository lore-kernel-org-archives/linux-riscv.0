Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDB5DCCD19E
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Oct 2025 08:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ejlLmpyl58H+rR0dsoMYDqc9KrjarVtJ0zBiuvcDyVk=; b=bITNS+wd+fP5Cq
	7YQBirgA0C+Pj0DJBUsb7ALS85j1n4usoECZBChgjLXerXLrcEX0WfBeqvf0pdrFerLNrS/pNB//i
	ixqcXyQfD/toAmhdiSRSkZ4NYI2rL22Ed+su4HLEbs6nIGfyGVEVmUm1A9QOcltVwrfHrvEVL2/yU
	od0YNlMBqxEn3ioKavy49XbY0NdcN0p8t+7qi6nMFQd2Uohn4OJOftIBcDVMXpO7ksLrjw7fa6QaX
	eQfhZGr2/3hNd0aocDKqEdBarXDXV6dd5DEjvAyL5K8b6qjvv5HW6dU9pyzCoEeFMgF/VqJxSn1EA
	b14J0sqBjEXOgH65D32A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9IvQ-00000003pu9-14qI;
	Thu, 16 Oct 2025 08:01:28 +0000
Received: from mail-sh0chn02on2071c.outbound.protection.partner.outlook.cn ([2406:e500:4420:2::71c] helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9IvM-00000003ppW-3LPd
	for linux-riscv@lists.infradead.org;
	Thu, 16 Oct 2025 08:01:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RhlMT9p211YDIjH4ThWb8JNzkMReNJsPP+8zG/m+tgtgg3ed/QfW87WCC5kVZa9j835EXrbPkmYX1uCcACDERxbWkKqiM41E/bGPZuvJlFT8VDgiC6c4KS9fiSiCtkMXeQQibtwEglCbwKcpr017mOCs46uD/pLo4O5rIkNaSvSKPHZp9azQWPgnv7x2J67Bx7HMwhm7g93/Mw5NvUBdGyzWA7lFcc0ADELQgUugWgJwMjpl3Gtc2fcQIKRFbhOCMzIUivccLN03bRrVdRdVLjZwJDP45o3MDXG9GdUXQUc1/XPLaD7QLuhWL0Ie2QW+83bp7LYebgn488h83S326Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gmjvyblM8gmyLwAntwxuJTqHQpkW7+7EydoY82Y5IVg=;
 b=ThZNsq25WiOoiImjvwbc5gOeXHzLGvII3pzr/+UoB5Xr9XnbTth3D5eiBbW185hjeeKvJHXE4Qib/UvI3vFBF94lZ2Lybhq8/nji5ebvByWcQrrDGOgYIxzBR2JQFo64GYTMdzcqGhdZfqQ6TzQvfyK7BhcLg7BmZxybqOd61BVcMLuMPHrSIcu3wvDjGYr0ufvZ+VGqp4vYP3e/8VfwOLdIdrHtj4b0y0Q7QVwODgwAGckg9b8ZqLHEJP+CEoxZ/DPdr/d3w5mwGuycVGphz1k1voRkuTGFPd1evDRpRdtTdz+Sgt8SdUBqKdpoPO1TWJjJD1OyBnYcxNhS0undng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:7::14) by ZQ2PR01MB1308.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:12::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.23; Thu, 16 Oct
 2025 08:01:07 +0000
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::2595:ef4d:fae:37d7]) by ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::2595:ef4d:fae:37d7%4]) with mapi id 15.20.9182.020; Thu, 16 Oct 2025
 08:01:07 +0000
From: Hal Feng <hal.feng@starfivetech.com>
To: Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	E Shattow <e@freeshell.de>,
	Paul Walmsley <pjw@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Hal Feng <hal.feng@starfivetech.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 4/7] riscv: dts: starfive: jh7110-common: Move out some nodes to the board dts
Date: Thu, 16 Oct 2025 16:00:51 +0800
Message-ID: <20251016080054.12484-5-hal.feng@starfivetech.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20251016080054.12484-1-hal.feng@starfivetech.com>
References: <20251016080054.12484-1-hal.feng@starfivetech.com>
X-ClientProxiedBy: NT0PR01CA0020.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:c::16) To ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ2PR01MB1307:EE_|ZQ2PR01MB1308:EE_
X-MS-Office365-Filtering-Correlation-Id: b24d2b3e-3be8-4df6-183e-08de0c8a2958
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|41320700013|1800799024|7416014|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info: T61D3MHQlL/DhtmMe6go+iOcbKcUARzI3BiBqeesVxqS+09y8aNtEDajaRXIjY2Ip9j+qE2JCBFB6mTWjrypOIDgeMFY9ulIsmSajwKIxNHJLkq9J+aGue5VE0vpMYAkCNsdtn+7xWTfoyEPhiS3FksTsjxg3oVlOdLFzul7aQK/L+R1oYQStAbb16pN6MNAO5OFpX1OEzfbOAV8AjhLMHL0AUJP6OGjRQbh0t+7feSjsXM1znyOL5CNPOObFC3EGXtJT9RDiLX3IHx0hVlko5J/0a93ZPhaQUiOvC1CcNsRiYjn3HHKEFejwpta/m/4OmC2tbzTDy1fLz9vbPPMhmNADgQHXn3BSlMXgWqzIfFD6MHdkFQ7qbf4V2CDc5v5yWLZF3/gbz8cQQ74397EVBw+6IYnbIH+Usx+14RYvZUhdYpjyqP2Q0b+lhm6UzFKH30ooS3o60bDHxi4xq58JCl6rOGd/d4OaHTpgapvdFNsJdNv5Q9cevZ7j+c29uCeMP10XD3sZQXI5OAyEVIO0EPHbnf45Gdz4/7koRLlWodhdQYmNVJMXfebwqBCdJDt2gVk9QUC2HLGSFqHrgTTs85JaR4T60RaFEmG0W7EdfU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(52116014)(41320700013)(1800799024)(7416014)(366016)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KxAdZo4y8uDQEfFI4E3ji4klBS9XjaRDQUdHaGUYnXogYS+OBTZ10C8usNJ2?=
 =?us-ascii?Q?/687SBlgtIkiy/GKflN4cQQlJkTjBQ4OifHq8lfxaXe7M6BOiy1ySCOYo5PZ?=
 =?us-ascii?Q?99GgXdNz9OzhaY/zPkCJ9Ao6LMQm+3pRt2oX/EHgrX18H2yX1ZDzm0ccai+N?=
 =?us-ascii?Q?e2OKDmgkirf6T8hWvz0HayhDGe9cFkwfMgo2YmHnXjvKkoaZtp4+cXdm1lug?=
 =?us-ascii?Q?h3naZ9MbxltyTQwVk/wfR6SLpWf+OFeBjSDSwvV2xl82zo/EDNfTe6v42eXE?=
 =?us-ascii?Q?LXgm5Mowvzkm39/kbPdG3t77UznCKFLtPBBjB19aLqdJXaX+G32jFXpQW28o?=
 =?us-ascii?Q?1AdqjnI1bP0CzloG6P1l424pY6/P0p0vQjJQUMRzFRBcOfTUDfPIsRh6N2Gw?=
 =?us-ascii?Q?7zI40RWdefheCN4SWri2wWOqKMuRIQnVLGCkZXM3x9a4+2eqHBowGqhNF3oM?=
 =?us-ascii?Q?l5oLYFAbigRWTNqjIrO0uQuAhWPiZIHS3uWg7fAC6BOewYHkRLHZtD0JYQWB?=
 =?us-ascii?Q?lT+Ij/d9B7vOu7cWKSg8L40kU44Dym/Az06RHhYsf7FHFx0FSBF+KiThO/9d?=
 =?us-ascii?Q?LrL2Ygw7otFh0C2r6xpFLyU3h4EJxqSnnydb4isjlcJcTpCE3B5GTlSrfdep?=
 =?us-ascii?Q?nW2NO5r8GX1XfDJAF4KbV6zC/H6ZNgQP64YI+nDTvHKvYrnCk2iMJiEDjYsW?=
 =?us-ascii?Q?UCUUFgSsJ0uiLrH7Aw+HjM4H1k58kY3ZCS4sd1t+JSxzk/6OfCL5qLHkzhUV?=
 =?us-ascii?Q?hMRGOpawwSMpFuLUe4LsbrpXu8rufAo9gpoDLet0MsF/1Qd21oTtXtIoZRrL?=
 =?us-ascii?Q?cYKrIGUhR9UXNqWzBWG8CDO6vES/duCJVmELIPnnO4b/LMaRD38iVL4X/IwR?=
 =?us-ascii?Q?2VxrMdfoSiGK6fhTXYIHZyGwJiiWvedF25A9GSks3j7ZT4zAfk72d7ofOLEF?=
 =?us-ascii?Q?HRwXUJ2mK+ldxVjKoyMKpVwP0G4+RWIIrKqc30i2LVyK/fRc1T3irwVwoteo?=
 =?us-ascii?Q?3SdCVsbHA6u+2M36f2uCdKvsZYDf/mIHxGIjpkpNR/dLBoauVejYJtCdArZK?=
 =?us-ascii?Q?jUhymd8EAMiZkYb2OqyvhMjc5PKufdOrKyoFZuDxI1qUdMMZ03IDe//vXNSV?=
 =?us-ascii?Q?hxtxGlvrZgtFI5IdHn2oOqcTUxbyv5jp3ZptYUfUnQNW4JJaLtZrxdeevPwk?=
 =?us-ascii?Q?RATgTWkKU2I6kZhXg5yxv+3BaCgI6KtHQgBI4pGtlUvVmxz2oED5HpYOyZEx?=
 =?us-ascii?Q?xB9XH9BKeCjVNcCYWTU/rxR04oRlP3ZCifMs4U4e75FjogIuWdTZLyAlMCy/?=
 =?us-ascii?Q?Ea5wcwdsIC2ro38oKRkBjQB65TMR7f3RQljAMrocx9ix7ZDnqt0pylhQdCSg?=
 =?us-ascii?Q?aCW/txYqUak0qINemIabfMc5ypG3JGOrOCVFrR8RYrEkrD9g1zkwQFhT3E5z?=
 =?us-ascii?Q?DeRYdrJMh0lInZ/T8i1N0a9GmWogTGrMU5GvNH4B0Fugd/y/mADCT8Vfg2CU?=
 =?us-ascii?Q?owbjaylyVBnjBNzhKbPTxT16y3oeaDawKEFjf4QFOaFvBgQvW5NwU0JoPu0T?=
 =?us-ascii?Q?6HD6czuno0ZdzWGb/dm5ajheGtfte81xB91WdNsGe60MXkRziQdeECv8FxOW?=
 =?us-ascii?Q?sw=3D=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b24d2b3e-3be8-4df6-183e-08de0c8a2958
X-MS-Exchange-CrossTenant-AuthSource: ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 08:01:07.3090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sqjAN0dyEtcm0KDUNOoNG5Huk6OztRgF+KMfqX30a32MoRE8W5KMkzwDGWfP+pq+1ToboK66q8vPO2WNRIq0LxtdARZETCCI80FMfKmv09A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ2PR01MB1308
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_010124_841320_C42E509C 
X-CRM114-Status: GOOD (  10.54  )
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

Some node in this file are not used by the upcoming VisionFive 2 Lite
board. Move them to the board dts to prepare for adding the new
VisionFive 2 Lite device tree.

Reviewed-by: E Shattow <e@freeshell.de>
Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
---
 .../boot/dts/starfive/jh7110-common.dtsi      | 19 --------
 .../jh7110-deepcomputing-fml13v01.dts         | 46 +++++++++++++++++++
 .../boot/dts/starfive/jh7110-milkv-mars.dts   | 46 +++++++++++++++++++
 .../dts/starfive/jh7110-milkv-marscm-emmc.dts |  9 ++++
 .../dts/starfive/jh7110-milkv-marscm-lite.dts |  1 +
 .../dts/starfive/jh7110-milkv-marscm.dtsi     | 32 +++++++++++++
 .../dts/starfive/jh7110-pine64-star64.dts     | 46 +++++++++++++++++++
 .../jh7110-starfive-visionfive-2.dtsi         | 43 +++++++++++++++++
 arch/riscv/boot/dts/starfive/jh7110.dtsi      | 16 -------
 9 files changed, 223 insertions(+), 35 deletions(-)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
index 5dc15e48b74b..8cfe8033305d 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
@@ -281,14 +281,8 @@ &mmc0 {
 	assigned-clock-rates = <50000000>;
 	bus-width = <8>;
 	bootph-pre-ram;
-	cap-mmc-highspeed;
-	mmc-ddr-1_8v;
-	mmc-hs200-1_8v;
-	cap-mmc-hw-reset;
 	pinctrl-names = "default";
 	pinctrl-0 = <&mmc0_pins>;
-	vmmc-supply = <&vcc_3v3>;
-	vqmmc-supply = <&emmc_vdd>;
 	status = "okay";
 };
 
@@ -298,8 +292,6 @@ &mmc1 {
 	assigned-clock-rates = <50000000>;
 	bus-width = <4>;
 	bootph-pre-ram;
-	cd-gpios = <&sysgpio 41 GPIO_ACTIVE_LOW>;
-	disable-wp;
 	cap-sd-highspeed;
 	pinctrl-names = "default";
 	pinctrl-0 = <&mmc1_pins>;
@@ -444,17 +436,6 @@ GPOEN_SYS_I2C6_DATA,
 	};
 
 	mmc0_pins: mmc0-0 {
-		 rst-pins {
-			pinmux = <GPIOMUX(62, GPOUT_SYS_SDIO0_RST,
-					      GPOEN_ENABLE,
-					      GPI_NONE)>;
-			bias-pull-up;
-			drive-strength = <12>;
-			input-disable;
-			input-schmitt-disable;
-			slew-rate = <0>;
-		};
-
 		mmc-pins {
 			pinmux = <PINMUX(PAD_SD0_CLK, 0)>,
 				 <PINMUX(PAD_SD0_CMD, 0)>,
diff --git a/arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts b/arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts
index f2857d021d68..7535d62201f1 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts
+++ b/arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts
@@ -11,6 +11,52 @@ / {
 	compatible = "deepcomputing,fml13v01", "starfive,jh7110";
 };
 
+&cpu_opp {
+	opp-375000000 {
+		opp-hz = /bits/ 64 <375000000>;
+		opp-microvolt = <800000>;
+	};
+	opp-500000000 {
+		opp-hz = /bits/ 64 <500000000>;
+		opp-microvolt = <800000>;
+	};
+	opp-750000000 {
+		opp-hz = /bits/ 64 <750000000>;
+		opp-microvolt = <800000>;
+	};
+	opp-1500000000 {
+		opp-hz = /bits/ 64 <1500000000>;
+		opp-microvolt = <1040000>;
+	};
+};
+
+&mmc0 {
+	cap-mmc-highspeed;
+	cap-mmc-hw-reset;
+	mmc-ddr-1_8v;
+	mmc-hs200-1_8v;
+	vmmc-supply = <&vcc_3v3>;
+	vqmmc-supply = <&emmc_vdd>;
+};
+
+&mmc0_pins {
+	rst-pins {
+		pinmux = <GPIOMUX(62, GPOUT_SYS_SDIO0_RST,
+				      GPOEN_ENABLE,
+				      GPI_NONE)>;
+		bias-pull-up;
+		drive-strength = <12>;
+		input-disable;
+		input-schmitt-disable;
+		slew-rate = <0>;
+	};
+};
+
+&mmc1 {
+	cd-gpios = <&sysgpio 41 GPIO_ACTIVE_LOW>;
+	disable-wp;
+};
+
 &pcie1 {
 	perst-gpios = <&sysgpio 21 GPIO_ACTIVE_LOW>;
 	phys = <&pciephy1>;
diff --git a/arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts b/arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts
index fdaf6b4557da..c2e7a91e460a 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts
+++ b/arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts
@@ -11,6 +11,25 @@ / {
 	compatible = "milkv,mars", "starfive,jh7110";
 };
 
+&cpu_opp {
+	opp-375000000 {
+		opp-hz = /bits/ 64 <375000000>;
+		opp-microvolt = <800000>;
+	};
+	opp-500000000 {
+		opp-hz = /bits/ 64 <500000000>;
+		opp-microvolt = <800000>;
+	};
+	opp-750000000 {
+		opp-hz = /bits/ 64 <750000000>;
+		opp-microvolt = <800000>;
+	};
+	opp-1500000000 {
+		opp-hz = /bits/ 64 <1500000000>;
+		opp-microvolt = <1040000>;
+	};
+};
+
 &gmac0 {
 	assigned-clocks = <&aoncrg JH7110_AONCLK_GMAC0_TX>;
 	assigned-clock-parents = <&aoncrg JH7110_AONCLK_GMAC0_RMII_RTX>;
@@ -22,6 +41,33 @@ &i2c0 {
 	status = "okay";
 };
 
+&mmc0 {
+	cap-mmc-highspeed;
+	cap-mmc-hw-reset;
+	mmc-ddr-1_8v;
+	mmc-hs200-1_8v;
+	vmmc-supply = <&vcc_3v3>;
+	vqmmc-supply = <&emmc_vdd>;
+};
+
+&mmc0_pins {
+	rst-pins {
+		pinmux = <GPIOMUX(62, GPOUT_SYS_SDIO0_RST,
+				      GPOEN_ENABLE,
+				      GPI_NONE)>;
+		bias-pull-up;
+		drive-strength = <12>;
+		input-disable;
+		input-schmitt-disable;
+		slew-rate = <0>;
+	};
+};
+
+&mmc1 {
+	cd-gpios = <&sysgpio 41 GPIO_ACTIVE_LOW>;
+	disable-wp;
+};
+
 &pcie0 {
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/starfive/jh7110-milkv-marscm-emmc.dts b/arch/riscv/boot/dts/starfive/jh7110-milkv-marscm-emmc.dts
index e568537af2c4..ce95496263af 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-milkv-marscm-emmc.dts
+++ b/arch/riscv/boot/dts/starfive/jh7110-milkv-marscm-emmc.dts
@@ -10,3 +10,12 @@ / {
 	model = "Milk-V Mars CM";
 	compatible = "milkv,marscm-emmc", "starfive,jh7110";
 };
+
+&mmc0 {
+	cap-mmc-highspeed;
+	cap-mmc-hw-reset;
+	mmc-ddr-1_8v;
+	mmc-hs200-1_8v;
+	vmmc-supply = <&vcc_3v3>;
+	vqmmc-supply = <&emmc_vdd>;
+};
diff --git a/arch/riscv/boot/dts/starfive/jh7110-milkv-marscm-lite.dts b/arch/riscv/boot/dts/starfive/jh7110-milkv-marscm-lite.dts
index 6c40d0ec4011..63aa94d65ab5 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-milkv-marscm-lite.dts
+++ b/arch/riscv/boot/dts/starfive/jh7110-milkv-marscm-lite.dts
@@ -14,6 +14,7 @@ / {
 &mmc0 {
 	bus-width = <4>;
 	cd-gpios = <&sysgpio 41 GPIO_ACTIVE_LOW>;
+	disable-wp;
 };
 
 &mmc0_pins {
diff --git a/arch/riscv/boot/dts/starfive/jh7110-milkv-marscm.dtsi b/arch/riscv/boot/dts/starfive/jh7110-milkv-marscm.dtsi
index 25b70af564ee..af01d3abde2f 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-milkv-marscm.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110-milkv-marscm.dtsi
@@ -21,6 +21,25 @@ sdio_pwrseq: sdio-pwrseq {
 	};
 };
 
+&cpu_opp {
+	opp-375000000 {
+		opp-hz = /bits/ 64 <375000000>;
+		opp-microvolt = <800000>;
+	};
+	opp-500000000 {
+		opp-hz = /bits/ 64 <500000000>;
+		opp-microvolt = <800000>;
+	};
+	opp-750000000 {
+		opp-hz = /bits/ 64 <750000000>;
+		opp-microvolt = <800000>;
+	};
+	opp-1500000000 {
+		opp-hz = /bits/ 64 <1500000000>;
+		opp-microvolt = <1040000>;
+	};
+};
+
 &gmac0 {
 	assigned-clocks = <&aoncrg JH7110_AONCLK_GMAC0_TX>;
 	assigned-clock-parents = <&aoncrg JH7110_AONCLK_GMAC0_RMII_RTX>;
@@ -40,6 +59,19 @@ &i2c6 {
 	status = "disabled";
 };
 
+&mmc0_pins {
+	rst-pins {
+		pinmux = <GPIOMUX(62, GPOUT_SYS_SDIO0_RST,
+				      GPOEN_ENABLE,
+				      GPI_NONE)>;
+		bias-pull-up;
+		drive-strength = <12>;
+		input-disable;
+		input-schmitt-disable;
+		slew-rate = <0>;
+	};
+};
+
 &mmc1 {
 	#address-cells = <1>;
 	#size-cells = <0>;
diff --git a/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts b/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts
index 31e825be2065..6faf3826c5c3 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts
+++ b/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts
@@ -14,6 +14,25 @@ aliases {
 	};
 };
 
+&cpu_opp {
+	opp-375000000 {
+		opp-hz = /bits/ 64 <375000000>;
+		opp-microvolt = <800000>;
+	};
+	opp-500000000 {
+		opp-hz = /bits/ 64 <500000000>;
+		opp-microvolt = <800000>;
+	};
+	opp-750000000 {
+		opp-hz = /bits/ 64 <750000000>;
+		opp-microvolt = <800000>;
+	};
+	opp-1500000000 {
+		opp-hz = /bits/ 64 <1500000000>;
+		opp-microvolt = <1040000>;
+	};
+};
+
 &gmac0 {
 	starfive,tx-use-rgmii-clk;
 	assigned-clocks = <&aoncrg JH7110_AONCLK_GMAC0_TX>;
@@ -44,6 +63,33 @@ &i2c0 {
 	status = "okay";
 };
 
+&mmc0 {
+	cap-mmc-highspeed;
+	cap-mmc-hw-reset;
+	mmc-ddr-1_8v;
+	mmc-hs200-1_8v;
+	vmmc-supply = <&vcc_3v3>;
+	vqmmc-supply = <&emmc_vdd>;
+};
+
+&mmc0_pins {
+	rst-pins {
+		pinmux = <GPIOMUX(62, GPOUT_SYS_SDIO0_RST,
+				      GPOEN_ENABLE,
+				      GPI_NONE)>;
+		bias-pull-up;
+		drive-strength = <12>;
+		input-disable;
+		input-schmitt-disable;
+		slew-rate = <0>;
+	};
+};
+
+&mmc1 {
+	cd-gpios = <&sysgpio 41 GPIO_ACTIVE_LOW>;
+	disable-wp;
+};
+
 &pcie1 {
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
index 5f14afb2c24d..9cd79fe30d19 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
@@ -13,6 +13,25 @@ aliases {
 	};
 };
 
+&cpu_opp {
+	opp-375000000 {
+		opp-hz = /bits/ 64 <375000000>;
+		opp-microvolt = <800000>;
+	};
+	opp-500000000 {
+		opp-hz = /bits/ 64 <500000000>;
+		opp-microvolt = <800000>;
+	};
+	opp-750000000 {
+		opp-hz = /bits/ 64 <750000000>;
+		opp-microvolt = <800000>;
+	};
+	opp-1500000000 {
+		opp-hz = /bits/ 64 <1500000000>;
+		opp-microvolt = <1040000>;
+	};
+};
+
 &gmac0 {
 	status = "okay";
 };
@@ -38,9 +57,33 @@ &i2c0 {
 };
 
 &mmc0 {
+	cap-mmc-highspeed;
+	cap-mmc-hw-reset;
+	mmc-ddr-1_8v;
+	mmc-hs200-1_8v;
+	vmmc-supply = <&vcc_3v3>;
+	vqmmc-supply = <&emmc_vdd>;
 	non-removable;
 };
 
+&mmc0_pins {
+	rst-pins {
+		pinmux = <GPIOMUX(62, GPOUT_SYS_SDIO0_RST,
+				      GPOEN_ENABLE,
+				      GPI_NONE)>;
+		bias-pull-up;
+		drive-strength = <12>;
+		input-disable;
+		input-schmitt-disable;
+		slew-rate = <0>;
+	};
+};
+
+&mmc1 {
+	cd-gpios = <&sysgpio 41 GPIO_ACTIVE_LOW>;
+	disable-wp;
+};
+
 &pcie0 {
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
index 6e56e9d20bb0..a380d3dabedd 100644
--- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
@@ -205,22 +205,6 @@ core4 {
 	cpu_opp: opp-table-0 {
 			compatible = "operating-points-v2";
 			opp-shared;
-			opp-375000000 {
-					opp-hz = /bits/ 64 <375000000>;
-					opp-microvolt = <800000>;
-			};
-			opp-500000000 {
-					opp-hz = /bits/ 64 <500000000>;
-					opp-microvolt = <800000>;
-			};
-			opp-750000000 {
-					opp-hz = /bits/ 64 <750000000>;
-					opp-microvolt = <800000>;
-			};
-			opp-1500000000 {
-					opp-hz = /bits/ 64 <1500000000>;
-					opp-microvolt = <1040000>;
-			};
 	};
 
 	thermal-zones {
-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
