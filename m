Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D96BCA5FD4
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Oct 2026 13:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References:Message-ID
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ThOK1wNqVuuUDQ6yBFpwJoeGbAfnyDDcqhrU9+yFzUU=; b=fRiEoA5WfkOMUO
	+PpqcUULb6SY9M0Fwmsz8gem9ydbNs5eKdh4wjoXooK0wT1xCdqXzZp+ZNGL6jf+KuFwbxwTKfD7t
	qPpQgw85Od13EPltw9q1TyXLIENzi4L5Lc0hrcuBGlDuQ4412tjdKg7dYsyt/b2o1Y0q9uVKdTDQ2
	6Iqj15ynO4X4TSQjWujruN6+rjpyuWHN/KuKfHdBQTSyDuYjepgVwYKrznTNBCf2CLzLXujqDKhdc
	SJiBb1O7dxX8QPSAIaU0tWKd+3wbVKKi5zZihl9uovX0nRUJuKlMdGXI+FdEwAz78qEWbvBakebsn
	u9/W93EcakM1CyXucsKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCdYS-0000000Bgfc-2TKr;
	Fri, 02 Oct 2026 13:44:04 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCdYP-0000000Bgei-3REy
	for linux-riscv@lists.infradead.org;
	Fri, 02 Oct 2026 13:44:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X8rljYKSRGcdFNUaQiwaphRp8vSReOiU06C1ore1u9mhArqgjFuHMaHPbCSxg8DXeUhoM2BROLCrJ9sAQ8ehup6bxcTq5bh/se84VilnmSFfc8HWV6ZH/vaScUa15Bjj1s5UyDtEfRudRG8HgCIFOaa2mf8HkAP1HjtGC6j7uk3U0dUbfGFTV0dSx4iCNQNxBm15NBLktHDRIEQkhuGyPJvbCP6oB2eeZQdkQtxCq3m/F/4f0RAhN4fhm45+fIs+OvV5w8nyffiKFzcKA2tZ0F9ybUpRF1erGNzAntmFxeaxwZdlTRRJenOUOaESVWIiIR+/s3SbeUz+q/qF/rgbtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W8RDwjdOthjHoE0gFm8BinXkxIUTrgANmZ4fsMHadRY=;
 b=g2zMJT43Klkl2mTED80fHhzjACdBPNQlW5Z+tBmgbpCYLMDrVVZtGL4MXJsjs7HKEkd38hSWD8FHvSlzbse+7UaC7TP2lSV2jP4NyxKtJJzoqnNMMpRGcQCFIq2zfV/XOVP/vvh58Dyc1KDkzCwGPid+US2XVjXUSmb+D7Vn2ajQIf6Xqo86gWeHt25bztMrsWFmekkIqOEMhEvnkamafiQRlcT8cUUoiUKyVxmYRJ+D0P96a1ex8oXPrhkHtPdKV+gmJZY80r4aV/oTKVamPaIsY0GE1GSiGuBH5iCjcnirhw1qYHGJwdLHOiAdve+uXO0G3yR4ICEspS7If+kEjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=dabbelt.com smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W8RDwjdOthjHoE0gFm8BinXkxIUTrgANmZ4fsMHadRY=;
 b=O16K07Qy005FXWhOQtHG+lP5uhdk72qAoIWr1TdKKG0gAhZNv7JCgCXYNsguNi1gVrBvXqCQBvtvi3hkNXTp39OERfBFC4OO09DFNK6tE2fbLYG7rsyiMgc9jXUvosjavSD0Ogl+043ay46LO7ZeUF6MKpGw0ljK+VBprsl9erI=
Received: from OS6P279CA0156.NORP279.PROD.OUTLOOK.COM (2603:10a6:e10:39::19)
 by DU7PPF713CCFF32.eurprd02.prod.outlook.com (2603:10a6:18:3::cd3) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Fri, 2 Oct
 2026 13:43:51 +0000
Received: from CPH1EPF0000051F.eurprd04.prod.outlook.com
 (2603:10a6:e10:39:cafe::a) by OS6P279CA0156.outlook.office365.com
 (2603:10a6:e10:39::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.19 via Frontend Transport; Fri, 2
 Oct 2026 13:43:51 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 CPH1EPF0000051F.mail.protection.outlook.com (10.167.241.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Fri, 2 Oct 2026 13:43:51 +0000
Received: from se-mail11w.axis.com (10.20.40.11) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Fri, 2 Oct
 2026 15:43:51 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Fri, 2 Oct 2026 15:43:51 +0200
Received: from pc66231-2602.sto.se.axis.com (pc66231-2602.sto.se.axis.com [10.133.4.42])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 236F94AB1;
	Fri,  2 Oct 2026 15:43:51 +0200 (CEST)
Received: by pc66231-2602.sto.se.axis.com (Postfix, from userid 21940)
	id 0E5E1305CE17; Fri,  2 Oct 2026 15:43:51 +0200 (CEST)
From: Kanak Shilledar <kanak.shilledar@axis.com>
Date: Fri, 2 Oct 2026 15:43:35 +0200
Subject: [PATCH 3/4] riscv: dts: th1520-lichee-module-4a: Cleanup with
 dt-check-style
MIME-Version: 1.0
Message-ID: <20261002-fix-dts-th1520-v1-3-9a8810091d47@axis.com>
References: <20261002-fix-dts-th1520-v1-0-9a8810091d47@axis.com>
In-Reply-To: <20261002-fix-dts-th1520-v1-0-9a8810091d47@axis.com>
To: Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei
	<wefu@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley
	<pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
CC: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Kanak Shilledar <kanak.shilledar@axis.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3640;
 i=kanak.shilledar@axis.com; h=from:subject:message-id;
 bh=gxBOMp+ONneIe/dFTo5JuU10CsWVtwtyDLvVnijcPW0=;
 b=owGbwMvMwCV2JPnG7+2HZqUznlZLYsjav1UsdO0e/W+zuRM9Mp9F7MpX+MNWz/ZcyEx+57yLD
 Td3fr7V0VHKwiDGxSArpshyzmh79P7kf7pzpJ0uwcxhZQIZwsDFKQAT2ZTNyLCn5JGuy6N/vnWx
 CZ/bXjQFCr8Rec1dyXuD8WzZxQ0mVpwMf6VVnbTtDwTK+FkcrfEs2LrW15Hr/MnMeaf8PHLnGTn
 t4QAA
X-Developer-Key: i=kanak.shilledar@axis.com; a=openpgp;
 fpr=CDB0F1C8EAD5B522C7B3A77928221FF065DB55F9
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CPH1EPF0000051F:EE_|DU7PPF713CCFF32:EE_
X-MS-Office365-Filtering-Correlation-Id: 322aa469-ef7f-40b3-df5c-08df208b3195
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|36860700016|82310400026|376014|7416014|1800799024|10067099003|56012099006|921020|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: au5fFNTDad5RD3bBVl+BwooaLrTh4hoZ6PNCJ4LuG61f1sCiDJf2Iz66W3xgyHQSTThdZn1V8dblbo1nAJXPWFq32JfadLyX2AEEADwS4WiPiuFDVd7xOrKNNUJgnnJj6fFBgcEI/b6HWVDrmkCZmF4CbAkT0aLGtr9tpOksD3dUYoQSQU7hnFHV8ko+focuVFOhizYrwaQRbW9lW/23J/1oQ2UTp7yuXfhuIZ81PTeUiwpjH46LDuT7inAg2Lh4Y0psW8/xHPPQbv/GiaDvHmtDd6lInNZviJIms1Ni4YU7SdgqdKyM5rL6thuTeHNVmbsfe51otHA8Uja6Jx61/Cy2A6JTfzDYU2o1RdvKdixpYT95S3+iJrh85MDZAY64Rcv8eIFanP7cS75BDxDrVzlFf5NFH0pf+U4UupbMkskftwi9Jr5ffoj0EJtFRNxWUgnraObww0wArAVPfo3ybn5m9SmETPmh+2YA8iQCnz7vSjhiJSnxsATXXI+InrJimmEnFZ6oHlwj9m4fGWeZmFgmv4N+T85FnwAy39QKM5i+9QTSyTtpTolctjIp/MjJ4di1aENit4xPJGo8b9L2HKwkZgjI7KGs/rVTWKZjZfQIVR75ZOo+hrUXXyeIq1Y53rLpCsmpIB/dv4otEP03VgeptWQ4gKd3STqTbS4i3pnv/PnJZG8O0QaM5vZatkSL76njL1+Uyr03y4sJGREpdnVmUss9RT1TQbE5Q49vOa48KsNMZuuqYirIkPaVgIUY
X-Forefront-Antispam-Report: CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(376014)(7416014)(1800799024)(10067099003)(56012099006)(921020)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: kTet5FP1zvAt6E1sHlep2SYcxPCjcQ6wvX0uvUAxYzDqFKYXNxQ2J12P8osWfWdUsU9hiw5GTsjMSWcnXCazxrduD794fDgfUi+xFXroPFX/6Z4IiLGcStGfmH2HQv1IGEqo5JAPyc/Km8y9HBkmCHyqKzqr7IR9Fzkjd+8kMwi5bxsrbedHdm0AWyTOogL47iJbsMsULr7Q2s9F4UpprVlITYTdvwnCu8q2RMj1GDsF311Tw2hga9f88rJhAWZ4T7idyNw5nry0hVeBjv7hgxZmL8xQ2tY4LukGRbKwHc32MXrSPWMzQRxrqvPA/jMQFV1D9r0jIIQDIPUS8vVmgjlmyDvBTb0BevG+Ept3MNQEpQWSYhIW/DToZhK6hk+V2N1/CNZni4qI9zWs2Y+iSb+blD9uqxQn/4dfrLXAIVQOpqut4TT5iydugitOXYNN
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 13:43:51.4138
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 322aa469-ef7f-40b3-df5c-08df208b3195
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: CPH1EPF0000051F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PPF713CCFF32
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_064401_890834_69631BCE 
X-CRM114-Status: GOOD (  11.88  )
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

Fix warnings thrown by krzk's recent updates to the dt-check-style
tool when run with strict mode. Fix the following warnings:

	thead/th1520-lichee-module-4a.dtsi:62: [property-order] property 'pinctrl-names' must be placed after 'pinctrl-0'
	thead/th1520-lichee-module-4a.dtsi:66: [required-blank-lines] "status" must be preceded by a blank line
	thead/th1520-lichee-module-4a.dtsi:129: [child-name-order] child node 'rx-pins' out of name order

After this patch, there are no more warnings left. Fix these warnings
to make the file more readable and maintainable along with that to
make it more compliant with the devicetree specifications.

Signed-off-by: Kanak Shilledar <kanak.shilledar@axis.com>
---
 .../boot/dts/thead/th1520-lichee-module-4a.dtsi    | 56 ++++++++++++----------
 1 file changed, 30 insertions(+), 26 deletions(-)

diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
index 8e76b63e0100a..e8930e994e91a 100644
--- a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
@@ -47,22 +47,25 @@ &emmc {
 	non-removable;
 	no-sdio;
 	no-sd;
+
 	status = "okay";
 };
 
 &gmac0 {
-	pinctrl-names = "default";
 	pinctrl-0 = <&gmac0_pins>, <&mdio0_pins>;
+	pinctrl-names = "default";
 	phy-handle = <&phy0>;
 	phy-mode = "rgmii-id";
+
 	status = "okay";
 };
 
 &gmac1 {
-	pinctrl-names = "default";
 	pinctrl-0 = <&gmac1_pins>;
+	pinctrl-names = "default";
 	phy-handle = <&phy1>;
 	phy-mode = "rgmii-id";
+
 	status = "okay";
 };
 
@@ -111,21 +114,6 @@ phy1: ethernet-phy@2 {
 
 &padctrl0_apsys {
 	gmac0_pins: gmac0-0 {
-		tx-pins {
-			pins = "GMAC0_TX_CLK",
-			       "GMAC0_TXEN",
-			       "GMAC0_TXD0",
-			       "GMAC0_TXD1",
-			       "GMAC0_TXD2",
-			       "GMAC0_TXD3";
-			function = "gmac0";
-			bias-disable;
-			drive-strength = <25>;
-			input-disable;
-			input-schmitt-disable;
-			slew-rate = <0>;
-		};
-
 		rx-pins {
 			pins = "GMAC0_RX_CLK",
 			       "GMAC0_RXDV",
@@ -140,24 +128,24 @@ rx-pins {
 			input-schmitt-disable;
 			slew-rate = <0>;
 		};
-	};
 
-	gmac1_pins: gmac1-0 {
 		tx-pins {
-			pins = "GPIO2_18", /* GMAC1_TX_CLK */
-			       "GPIO2_20", /* GMAC1_TXEN */
-			       "GPIO2_21", /* GMAC1_TXD0 */
-			       "GPIO2_22", /* GMAC1_TXD1 */
-			       "GPIO2_23", /* GMAC1_TXD2 */
-			       "GPIO2_24"; /* GMAC1_TXD3 */
-			function = "gmac1";
+			pins = "GMAC0_TX_CLK",
+			       "GMAC0_TXEN",
+			       "GMAC0_TXD0",
+			       "GMAC0_TXD1",
+			       "GMAC0_TXD2",
+			       "GMAC0_TXD3";
+			function = "gmac0";
 			bias-disable;
 			drive-strength = <25>;
 			input-disable;
 			input-schmitt-disable;
 			slew-rate = <0>;
 		};
+	};
 
+	gmac1_pins: gmac1-0 {
 		rx-pins {
 			pins = "GPIO2_19", /* GMAC1_RX_CLK */
 			       "GPIO2_25", /* GMAC1_RXDV */
@@ -172,6 +160,21 @@ rx-pins {
 			input-schmitt-disable;
 			slew-rate = <0>;
 		};
+
+		tx-pins {
+			pins = "GPIO2_18", /* GMAC1_TX_CLK */
+			       "GPIO2_20", /* GMAC1_TXEN */
+			       "GPIO2_21", /* GMAC1_TXD0 */
+			       "GPIO2_22", /* GMAC1_TXD1 */
+			       "GPIO2_23", /* GMAC1_TXD2 */
+			       "GPIO2_24"; /* GMAC1_TXD3 */
+			function = "gmac1";
+			bias-disable;
+			drive-strength = <25>;
+			input-disable;
+			input-schmitt-disable;
+			slew-rate = <0>;
+		};
 	};
 
 	mdio0_pins: mdio0-0 {
@@ -200,5 +203,6 @@ mdio-pins {
 &sdio0 {
 	bus-width = <4>;
 	max-frequency = <198000000>;
+
 	status = "okay";
 };

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
