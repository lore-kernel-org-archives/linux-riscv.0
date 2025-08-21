Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5504ACA0FE1
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Aug 2025 13:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ss8X6UKbgH9d/TEXgREc3r+n94eOMUILTrAWdx48KQI=; b=J4ga5LcMLAlVf4
	jBSThUUbVHl2LMGIt05LYuQKAE6M7RWZXlIfhmEEHhBwgMjL0DS8RC7uhoWJ39zbY1ygM8mejymq/
	AK6PgkS3qgCtqc88jTmtXrrYEATRd6muJBhS0lSgIuqMD1f3cbHPcY1FdeNIrRhKKCPTAztNj/s2A
	d1r8nIflY+STcgJwq3bvCF6C+dY/upfCWa4nHcOWLrC9U1mPNgPyUI6Iibe9S45zAX8ivqeI6C63L
	W5lH/qWnoXYRKTXmmJWts4dFcUp17QD5HmXZdwJtLcaeF8nkJ5czbGbKowYirG8LPuNCSnvFskePe
	J99JOqSzikyYLDnhXKbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up5QY-0000000H47e-0vP1;
	Thu, 21 Aug 2025 13:34:02 +0000
Received: from mail-bjschn02on20714.outbound.protection.partner.outlook.cn ([2406:e500:4440:2::714] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up2Fj-0000000GYAK-0jWG
	for linux-riscv@lists.infradead.org;
	Thu, 21 Aug 2025 10:10:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OIUAqDvuoPFdMxMZiLDloymZkYsiyuZeiM3Xn767Udxsx/9VtiekU+8S0Zjnalc1vdNUekvwxJsxbTb/bBliwP1ozJ+jG/buenu/Nh8iepaAYiAyPy3pOjuxMpTaGoeOGPctLEA0bss6/zcC5OWCOIiCvyRvrmH1OCTHUiAw2ZIDGkkj6wzZEShnL533bwUa/xxI8qNkt7TZul0tbiTwMpaMNIkmrJQdpItFLfZGKUOa7sbPW3DovMMSxJdNwTjpknqtXYeq8XhmX2yLn3UdekcDaxueLUj6G9bVOyIDU/eNDWJTStwAslip1y1knqxqmEgGEtpsh4rq8QSYoe9U4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tZQOGhEjxcvd92by1b2UFyqdE+RNHbUq7uEC9RxRPqs=;
 b=kvTQzH2bEbEI5FJBSD+OVP65wzofe+IPmXsdoXAs5kcSHaYJsBWE0fJ+M1iDRbycIwT+PaAWH06DcUgw9RXZctsh1jDK/OM8QUAmoiIMOInNnXQRDYq9JF5vRSQ1n0JRbiUbV+zXBujG7sTRBHlFSIOAc0MIfEtZ7MBtcJszYv6DYt8OKzFhtFDRl0bHS9/PzZTm4lBmLkpFtxrI1S2/SnPuz/9I1FTlc4ZiSWhkrWkRsAewznQo6/KoUscYh7f5B0RrACs3PYBQ/mFIPyhvNt4KoU/6b31TmDkrHUqM4cinNDBmTtl2xxB3TACI6hgQxZMu7zyj34hDg5a00P1AWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:7::14) by ZQ2PR01MB1241.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:6::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.25; Thu, 21 Aug
 2025 10:10:29 +0000
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::2595:ef4d:fae:37d7]) by ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::2595:ef4d:fae:37d7%6]) with mapi id 15.20.9031.024; Thu, 21 Aug 2025
 10:10:29 +0000
From: Hal Feng <hal.feng@starfivetech.com>
To: Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Hal Feng <hal.feng@starfivetech.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC 2/3] riscv: dts: starfive: jh7110-common: Move out some nodes to the board dts
Date: Thu, 21 Aug 2025 18:09:29 +0800
Message-ID: <20250821100930.71404-3-hal.feng@starfivetech.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20250821100930.71404-1-hal.feng@starfivetech.com>
References: <20250821100930.71404-1-hal.feng@starfivetech.com>
X-ClientProxiedBy: BJXPR01CA0057.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:12::24) To ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ2PR01MB1307:EE_|ZQ2PR01MB1241:EE_
X-MS-Office365-Filtering-Correlation-Id: a59bcdec-5827-4ac0-e76d-08dde09af4d7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|52116014|366016|41320700013|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 6mmBT8dUD2qcnwUJqOTalhZuLuU7iG3CjzxQyTMjXvtjHyuGVskBVFiXOsGCJAvVbF40eeuRysUoO6j6qnDaWXqrAYplt8c10kSLV4cxg1dHvOiHrD8OD44Y6NH7bvxDPWsUpuzz7xY0l49n2DELZa0oya7bJ1CYY3HQTyEOo/ejY1W4xhO/mNbS/hWeTgAvR03ckQkPgcQ1fvtULVSveWb4wSUvGwH8ISQiwK7oxwVzYait6DwOKaXUe5UCWg/EvB6dbu7Oh/eA9GXpHz6CS4s8rwp6VA+/m3BUvbKFHZl7muK0zOs2umT+XiOW9YIj+/51x5WMipqBpJ2kaAtvqubiNYrYG6rNyrynipIvbhWWe2BYUUaeyFrtuCRyJTtIxntH3wQEGWkzDgF9en4CmB6fsodZ07X2ApXDv47SoiSPnMjJHKohRXoau0q/pKNBr1r5l6Z+7gLykVmuTbKXlMywsI2uIlJ/iDdtApRD71pezvvdYK+cYVxm254vJ2Ipc5A1YOL4BWeBGIQhM3eD657o+hSpqS2b7NnmaSlZ+3hl/l5sf7CRgKnuNRtwel17n6Qgn66f8XNEWX/31zOooA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(366016)(41320700013)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OkbV7iPlV+HD8EgF1CfbeshIQX2ZxEStGB7uwlm71xd6XrwlSm81jJvDTb6S?=
 =?us-ascii?Q?JItCySktTt6St9MWr0j1csf+iR8jJtwYpTIysQcIICPYESvjIXuy9Pp4IoYO?=
 =?us-ascii?Q?gLzyJs27iiIonjQlqXXMl80YfMx0NFnQrMjDKLTa55ctGU+OfZTH88vE4iyy?=
 =?us-ascii?Q?fJhp4lUk2651G3fFtMVLkABFA6GFASU53ISAuz8CpsromMIpXde63HHuvSBC?=
 =?us-ascii?Q?4nNxqt7U7rkvuu67gG8B7+6PnsSlGJiRSHrbRJgO5tE2RvvWZUuzhBY5lZR/?=
 =?us-ascii?Q?fiIl8tVhKmJGJHMhgZy21sTpcuuXJVBQilyCPbDG/830Rb2XE2NFawm1yWEj?=
 =?us-ascii?Q?f+bxTqS3EL9nE3dZCT/zH/qMuNI2RcxajKn0cUTa99NL+i//zo5O73EkOQ9x?=
 =?us-ascii?Q?xOsBx74JPxtQaYFhRt9mjEqXbBCG7vaBrTfU4jX1Wmduh5XUgU/buacdoTtL?=
 =?us-ascii?Q?nJJC/2s3aAQe7br4XM962W3/g2oteRiAVfm7E+fM70PJg0jqJ7cT0V6yuShl?=
 =?us-ascii?Q?3EOwfkTUveyItWnyNN/D0sgxy0k7zgmjM0HfZ1bD0MxI/ieaohBSZWlfCH8o?=
 =?us-ascii?Q?U/OuPX7fw5oczt49lIA5o3+66w01pb/gQIOgZK/h/No9bQkZprrEeOMHsTes?=
 =?us-ascii?Q?J/+jcWilVi60hnO15CQ7xynLqmON5fc1HJxR6moQOdM8NMTf9lr0kurvO9kV?=
 =?us-ascii?Q?wla3/lIIV6t6bkSInGhTd4su76A82CpokYrBVgQ0W9o+h4oGmzOHQDgX4eJi?=
 =?us-ascii?Q?EJH9stme28p4SEK890qmRQBELBmQPfj1dBuisdMjEcQlPaNGIXxqYMuQ4xv4?=
 =?us-ascii?Q?baR2KUxfnlfYEWCeoZ9p+lsw4lnqdch42yUtfuvlENhzGxuzxhpLwt9MsAUm?=
 =?us-ascii?Q?DLCBM64F0GSdlqBSlZ81NV4Vukcghq5cejqbyeyqij3fm1WF6cbPgAYxtSAI?=
 =?us-ascii?Q?KTeCz9Byz3gkuNoz39crDT6uYm/bW75T1TCPHGMGo3jqqPRn6mlE0vVSuwV3?=
 =?us-ascii?Q?WUnmaaQK8xf8uZkht13WRmkEspVXNvz3aUowc3/mzSI7y8NhokGhr9i6/6QR?=
 =?us-ascii?Q?7drqNs+l5tsSCyNfgzaiXSu6O95Saete1C9tAtbxXG3buOYLVNesSrcFbrvx?=
 =?us-ascii?Q?/i3MqoKle9/wR4xM9Fw1GBluSoKNzpRrg2HP1gqWRj/9XZYHrQ3Wsd5jfNd6?=
 =?us-ascii?Q?XjORU2lFoShti117DziCLIqHlGJyAEjMTdsvurP/hWzc5EJ5X2E4IqcVuuF7?=
 =?us-ascii?Q?sXcrHtFY+e3c2zTA4PqMyL4hNrbeXpb9QUcxwQzOc5cIdZuugu3uw6A1Aw25?=
 =?us-ascii?Q?+B7t1386kASb2tvgwzJ2EaEKkHXrPrKHHogTK50GXOHB4xYk5/2QRFWWqCxg?=
 =?us-ascii?Q?2A1udrJxunz8h2Q7bPOA61boxr6DhGmgEx5fPU80IcVsYAODYVFWCQsxU/JN?=
 =?us-ascii?Q?zCAFw9uAgEEDvcZ3z30M5l7HBlqA3Y4RU5vAnmIh/gY6/tVr8ITZ60ZBRe09?=
 =?us-ascii?Q?cBWdofLNUKFVaTVCmyGuuZ+76p/9Tb7TiQFTDeRP8xXsBtwz/ZhmYZrE5Fxa?=
 =?us-ascii?Q?J94QeU4NVDdhLrVW3qUXvAyCc9a431HmXzQpZtZw+jYdo+EY2hhQSHg02++I?=
 =?us-ascii?Q?DA=3D=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a59bcdec-5827-4ac0-e76d-08dde09af4d7
X-MS-Exchange-CrossTenant-AuthSource: ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 10:10:29.5083
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LxOsPeS1Qs9rM5pzgj4asy1pWpR4mxOWLXnkqEAkyKqPiQ6JbUMXxRG3JdqZPrVPCZf/2Kw0hPIfsWDlL4f1x3gJLlswXf7NNHh64XpxWkk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ2PR01MB1241
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_031039_223253_1B614779 
X-CRM114-Status: GOOD (  10.21  )
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

Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
---
 .../boot/dts/starfive/jh7110-common.dtsi      | 22 ---------
 .../jh7110-deepcomputing-fml13v01.dts         | 49 +++++++++++++++++++
 .../boot/dts/starfive/jh7110-milkv-mars.dts   | 49 +++++++++++++++++++
 .../dts/starfive/jh7110-pine64-star64.dts     | 49 +++++++++++++++++++
 .../jh7110-starfive-visionfive-2.dtsi         | 46 +++++++++++++++++
 arch/riscv/boot/dts/starfive/jh7110.dtsi      | 16 ------
 6 files changed, 193 insertions(+), 38 deletions(-)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
index 2eaf01775ef5..8332622420ca 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
@@ -281,15 +281,9 @@ &mmc0 {
 	assigned-clock-rates = <50000000>;
 	bus-width = <8>;
 	bootph-pre-ram;
-	cap-mmc-highspeed;
-	mmc-ddr-1_8v;
-	mmc-hs200-1_8v;
-	cap-mmc-hw-reset;
 	post-power-on-delay-ms = <200>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&mmc0_pins>;
-	vmmc-supply = <&vcc_3v3>;
-	vqmmc-supply = <&emmc_vdd>;
 	status = "okay";
 };
 
@@ -299,12 +293,7 @@ &mmc1 {
 	assigned-clock-rates = <50000000>;
 	bus-width = <4>;
 	bootph-pre-ram;
-	no-sdio;
-	no-mmc;
-	cd-gpios = <&sysgpio 41 GPIO_ACTIVE_LOW>;
-	disable-wp;
 	cap-sd-highspeed;
-	post-power-on-delay-ms = <200>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&mmc1_pins>;
 	status = "okay";
@@ -448,17 +437,6 @@ GPOEN_SYS_I2C6_DATA,
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
index f2857d021d68..5a2a41a7e8c3 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts
+++ b/arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts
@@ -11,6 +11,55 @@ / {
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
+	no-sdio;
+	no-mmc;
+	cd-gpios = <&sysgpio 41 GPIO_ACTIVE_LOW>;
+	disable-wp;
+	post-power-on-delay-ms = <200>;
+};
+
 &pcie1 {
 	perst-gpios = <&sysgpio 21 GPIO_ACTIVE_LOW>;
 	phys = <&pciephy1>;
diff --git a/arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts b/arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts
index fdaf6b4557da..96f6b2f072d4 100644
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
@@ -22,6 +41,36 @@ &i2c0 {
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
+	no-sdio;
+	no-mmc;
+	cd-gpios = <&sysgpio 41 GPIO_ACTIVE_LOW>;
+	disable-wp;
+	post-power-on-delay-ms = <200>;
+};
+
 &pcie0 {
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts b/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts
index 31e825be2065..c9677aef9ff0 100644
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
@@ -44,6 +63,36 @@ &i2c0 {
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
+	no-sdio;
+	no-mmc;
+	cd-gpios = <&sysgpio 41 GPIO_ACTIVE_LOW>;
+	disable-wp;
+	post-power-on-delay-ms = <200>;
+};
+
 &pcie1 {
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
index 5f14afb2c24d..d1e4206f1251 100644
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
@@ -38,9 +57,36 @@ &i2c0 {
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
+	no-sdio;
+	no-mmc;
+	cd-gpios = <&sysgpio 41 GPIO_ACTIVE_LOW>;
+	disable-wp;
+	post-power-on-delay-ms = <200>;
+};
+
 &pcie0 {
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
index 0ba74ef04679..d2463399b959 100644
--- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
@@ -200,22 +200,6 @@ core4 {
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
