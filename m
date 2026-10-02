Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E65ECA5FDD
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Oct 2026 13:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References:Message-ID
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mURQZ80x40W5PWcA2qfTHRinDNLikjPRAZe714gdgYc=; b=A3uABGD8DrvtSF
	Vku+sbpn576JwQbq7lMgyKKDzC/BU0AzdD23KWaUJp2Skla2T9MLs77p1mNt0Y43+6tHQOL2vSAHC
	LHTJWmpRUJ3d+eA4sK2G8zp2HqlIqpVMlUZbVKgPZNkrCXM9zAaO2HbNqOMSHlun/aynLod0rDvyH
	hr5geW69biMfFn9w9n1++UtsR+JFvKd3yMT0z1u7TajMpSiO2DUHp7DRsINOVOdswoE62s2+rLuOo
	lcfXrDemxtgtIW8H1oPY9+v0JnLbj3BaglCZvjtaXCvNw1CvMaTOqNcsDrz9RALIQT069j/8UOlOQ
	rYLw1QVvLc0pPjYEeHRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCdYb-0000000BgiZ-0eOp;
	Fri, 02 Oct 2026 13:44:13 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCdYY-0000000BghT-16ii
	for linux-riscv@lists.infradead.org;
	Fri, 02 Oct 2026 13:44:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OtsDrmupZFI4EU8VICxC8Axg0u6/ZbT/I0YtYCsfnNCoVHxlsY/mHCZd9bYncdhg1aUFXtQnuFvXJoQQTFmlBrG4zSVU4WwjIsCzYl/l6ivqhW+C7On1M70ekjrmFOakjpWfBKLuB4+ltWb0LFwXrDqKqzh8sbaGpcSEoc/Bfn+G13MsCcleYyazHHxIIsPmANRyxoRah4WsCzex54B3jPW1Xz6qjWVkrTN1aRIM4e4wEC1jQMfWrYH6wjx9fszxyyfhHhctmIRyGX9cmBdDcyi7sjoyiLWFLY0MxPWk6TtgxMOVG1YAJl09V0lnBrpnSxymIb394ti09jRWhPzvEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IGuZyval7v7OKoEMxmpU0gKE/DN1qFR1xcgnuIuawd4=;
 b=biU234inntaz+EUCc3VMo7bacDVY/qb3wmBRlvvsmXEaQGMxt0iG+G8UFr4sj6hqkq5kSoGKxfYPBeMCyrolFmJCx0awQlqzkV9//4AsNRAWa1L20GMBE4syz+80IWHfFzS/FBOCag3qrcyDEXe8YTb3gmIFX7ulGbM5AOC1pzlEBsKk9+M36AVfVCDtgz6jXf0Gh3PuySBAIKcj7/5Tls9D6qfscWLJKnus5DQXgEFJu0AmbDFTi8kf50SG400kvFx9vNcKSoL/cF7Dt+PReUP15mAMrvMh9+nIw0kD0+vLMsIFRlFsL3G4u2KVeEdXtGlK6g/dqgW0085Xfm86fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=dabbelt.com smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IGuZyval7v7OKoEMxmpU0gKE/DN1qFR1xcgnuIuawd4=;
 b=Zt0+DC56DRtE7EdQAejH1Lv+UE7za8J2vHKQEEyLDAXOTihxiWUe/pErCqGRMW4nYN4pYWPG2bNyYUaLdbcqaTud1r/l5bcGuUXPdMSXXI0U0LybNi3RPklOJDcR6tEYnpiThZ7VtPqE91wM2LHHKSDaPOVohTidCDHwPXLIGSo=
Received: from MM0P280CA0079.SWEP280.PROD.OUTLOOK.COM (2603:10a6:190:8::12) by
 DU0PR02MB8013.eurprd02.prod.outlook.com (2603:10a6:10:350::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.18; Fri, 2 Oct 2026 13:43:58 +0000
Received: from CPH1EPF0000051D.eurprd04.prod.outlook.com
 (2603:10a6:190:8:cafe::5f) by MM0P280CA0079.outlook.office365.com
 (2603:10a6:190:8::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.18 via Frontend Transport; Fri, 2
 Oct 2026 13:43:58 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 CPH1EPF0000051D.mail.protection.outlook.com (10.167.241.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Fri, 2 Oct 2026 13:43:58 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.39; Fri, 2 Oct
 2026 15:43:51 +0200
Received: from se-mail10w.axis.com (10.20.40.10) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Fri, 2 Oct
 2026 15:43:51 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Fri, 2 Oct 2026 15:43:51 +0200
Received: from pc66231-2602.sto.se.axis.com (pc66231-2602.sto.se.axis.com [10.133.4.42])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 1F62B1009;
	Fri,  2 Oct 2026 15:43:51 +0200 (CEST)
Received: by pc66231-2602.sto.se.axis.com (Postfix, from userid 21940)
	id 0C111305D600; Fri,  2 Oct 2026 15:43:51 +0200 (CEST)
From: Kanak Shilledar <kanak.shilledar@axis.com>
Date: Fri, 2 Oct 2026 15:43:33 +0200
Subject: [PATCH 1/4] riscv: dts: thead: beaglev-ahead: Cleanup with
 dt-check-style
MIME-Version: 1.0
Message-ID: <20261002-fix-dts-th1520-v1-1-9a8810091d47@axis.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5649;
 i=kanak.shilledar@axis.com; h=from:subject:message-id;
 bh=lPrLouAjzXXTiuswFBgm8Bnlx3nTcbUBhuPHDe3fx2E=;
 b=owGbwMvMwCV2JPnG7+2HZqUznlZLYsjav1Xs9XVZF6V+zht2qc68inI+9ROntv+6lu5vql9TG
 uS3zi+6o5SFQYyLQVZMkeWc0fbo/cn/dOdIO12CmcPKBDKEgYtTACZyxYOR4b5YcO4JnZwd2+M4
 /GpSq59N/BPm86uLafnsqUdTNG6dqGD47/jXtCjyT67VjpS77xRfZ8b3Gdz7n2Bo9792T9kpefF
 6TgA=
X-Developer-Key: i=kanak.shilledar@axis.com; a=openpgp;
 fpr=CDB0F1C8EAD5B522C7B3A77928221FF065DB55F9
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CPH1EPF0000051D:EE_|DU0PR02MB8013:EE_
X-MS-Office365-Filtering-Correlation-Id: e6182ce9-e399-435a-7ec5-08df208b35cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|7416014|23010399003|1800799024|82310400026|18002099003|22082099003|921020|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: Ie9h2YyqEVgjgc+k45AZexiBtU3HobghfXFynLXZ5r1SA+TdhOOOwhPDO8tdLBcd/NweFH6DPa7S92H2D20Ll64dx7XrHuh1Dpa1I7+/hqq1Sr9w+pjhTGOcTvnZ4KVxKdIwwAZ6TeZtdb+dFmNb9vNYmS2uP+EO3Ac8IHe6rl7H1kz3l0ylA2CnTaa15O7cosPMfqxqJLx5D9t4A3UGGVSPs693KTGhjmnxnfxQvWDvS00KIdeTK8hCPIFThIAHeNs2/x2OP4de91gdd7Hk/RgHn+9xtxRBluxV+cEyYd9oPK27dE5daRpfyokhgcFTx0Hybo3hPwb8gEKnLitsTd1FFQJE/LWcF6EZ9BaHYKgtBfBjxyK2cdCxpZan37JwVbR/UkstuMNcSyGYMoxCrrIiObUXn9lEUr+ztKvX2p3onc4F4ZKYWywjmGhUjCSxl8nSEKPpvC1ATnQgvAcAaQIb2iK0rNey74SajMlsjy/+8GWunwOcbOeEa31z/9gtJ/p/K567xsfQp7ye23iJY2SkOhxRk9CY9NizmVBxyYjWgD3WLS64zUym3T1K01YgbUSJpVPb8V7vnBKDO22E6BOcmMqZYE3ViZdLkU39SVK2o2wIQ9dUuLn8Hd42q7t4ESps35U4U29JMAqaNhb35TfT6DSR0ZLZ+ZShxZybwDlvfFMnk4EjKr0DzMyH2tKYNzyjsvY2V6QG9+IMErUDtJ5cNx8V9NN3zMQBZkMgymgFKgnEp9wwTDdsmbM7vMUw
X-Forefront-Antispam-Report: CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(7416014)(23010399003)(1800799024)(82310400026)(18002099003)(22082099003)(921020)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: b07JvqJmN1vIC6673hSc1ls1CHv1/dRyptL/H90ShXscd74PxWy57nouXcWSpC1V51uSC3R3wesFqpwAyAJBQF2CgDGjwt6tG2Y9Hv3RDpnI0UdPAZG+OXS48PHnfYzdjJ3IExacBGmIFjAw5vhAy8T6mv1pcoFVDEx273FaPv+sWTeFw0Iz2+qHo+N304l1t8B6BI15DMhckg6jOLGwAvp7TxusgP/KhJ+aiuBocwaw0rtAYLWsZCL9hdjkQlCrkHJzyhPAbKNe1/2lDbQYSgAdjjPvTjjhzAJdenzfE4RVB7eBzMFQL5lHV/MZ6BG6BfqqV+dkDfHfzifAz6LuxOa5GGmADIBJIvzmgS377DBsucDLFWIWpyXfKGeTftXJwfBdH+TLWKJgnsIVJzsHeFSVHLld6Z2FsDwAFXn2sVtJpM68cBfFKexM6QJO6t3/
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 13:43:58.4816
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6182ce9-e399-435a-7ec5-08df208b35cb
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: CPH1EPF0000051D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB8013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_064410_318898_4470E511 
X-CRM114-Status: GOOD (  11.79  )
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

A lot of warnings were thrown via krzk's updates to the dt-check-style
tool. These were observed when running the tool in strict mode. Most
of the issues were related to missing blank lines and out of order
properties and nodes such as:

	thead/th1520-beaglev-ahead.dts:43: [child-name-order] child node 'leds' out of name order
	thead/th1520-beaglev-ahead.dts:46: [property-order] property 'compatible' out of canonical order (should sort before 'pinctrl-0')
	thead/th1520-beaglev-ahead.dts:79: [child-name-order] child node 'hdmi-connector' out of name order
	thead/th1520-beaglev-ahead.dts:115: [required-blank-lines] "status" must be preceded by a blank line
	[...]

Fix these warnings to make the file more readable and maintainable
along with that to make it more compliant with the devicetree
specifications.

Signed-off-by: Kanak Shilledar <kanak.shilledar@axis.com>
---
 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts | 119 +++++++++++----------
 1 file changed, 62 insertions(+), 57 deletions(-)

diff --git a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
index e16484a476534..426890f812745 100644
--- a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
+++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
@@ -35,15 +35,21 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
-	memory@0 {
-		device_type = "memory";
-		reg = <0x0  0x00000000  0x1 0x00000000>;
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		type = "d";
+
+		port {
+			hdmi_con_in: endpoint {
+				remote-endpoint = <&hdmi_out_con>;
+			};
+		};
 	};
 
 	leds {
-		pinctrl-names = "default";
-		pinctrl-0 = <&led_pins>;
 		compatible = "gpio-leds";
+		pinctrl-0 = <&led_pins>;
+		pinctrl-names = "default";
 
 		led-1 {
 			gpios = <&gpio4 8 GPIO_ACTIVE_HIGH>;
@@ -76,15 +82,9 @@ led-5 {
 		};
 	};
 
-	hdmi-connector {
-		compatible = "hdmi-connector";
-		type = "d";
-
-		port {
-			hdmi_con_in: endpoint {
-				remote-endpoint = <&hdmi_out_con>;
-			};
-		};
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0  0x00000000  0x1 0x00000000>;
 	};
 
 	wifi_pwrseq: wifi-pwrseq {
@@ -112,14 +112,16 @@ &emmc {
 	non-removable;
 	no-sdio;
 	no-sd;
+
 	status = "okay";
 };
 
 &gmac0 {
-	pinctrl-names = "default";
 	pinctrl-0 = <&gmac0_pins>;
+	pinctrl-names = "default";
 	phy-handle = <&phy0>;
 	phy-mode = "rgmii-id";
+
 	status = "okay";
 };
 
@@ -153,36 +155,6 @@ led-pins {
 
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
-		rx-pins {
-			pins = "GMAC0_RX_CLK",
-			       "GMAC0_RXDV",
-			       "GMAC0_RXD0",
-			       "GMAC0_RXD1",
-			       "GMAC0_RXD2",
-			       "GMAC0_RXD3";
-			function = "gmac0";
-			bias-disable;
-			drive-strength = <1>;
-			input-enable;
-			input-schmitt-disable;
-			slew-rate = <0>;
-		};
-
 		mdc-pins {
 			pins = "GMAC0_MDC";
 			function = "gmac0";
@@ -203,6 +175,16 @@ mdio-pins {
 			slew-rate = <0>;
 		};
 
+		phy-interrupt-pins {
+			pins = "GMAC0_CRS"; /* GPIO3_22 */
+			function = "gpio";
+			bias-pull-up;
+			drive-strength = <1>;
+			input-enable;
+			input-schmitt-enable;
+			slew-rate = <0>;
+		};
+
 		phy-reset-pins {
 			pins = "GMAC0_COL"; /* GPIO3_21 */
 			bias-disable;
@@ -212,28 +194,38 @@ phy-reset-pins {
 			slew-rate = <0>;
 		};
 
-		phy-interrupt-pins {
-			pins = "GMAC0_CRS"; /* GPIO3_22 */
-			function = "gpio";
-			bias-pull-up;
+		rx-pins {
+			pins = "GMAC0_RX_CLK",
+			       "GMAC0_RXDV",
+			       "GMAC0_RXD0",
+			       "GMAC0_RXD1",
+			       "GMAC0_RXD2",
+			       "GMAC0_RXD3";
+			function = "gmac0";
+			bias-disable;
 			drive-strength = <1>;
 			input-enable;
-			input-schmitt-enable;
+			input-schmitt-disable;
 			slew-rate = <0>;
 		};
-	};
 
-	uart0_pins: uart0-0 {
 		tx-pins {
-			pins = "UART0_TXD";
-			function = "uart";
+			pins = "GMAC0_TX_CLK",
+			       "GMAC0_TXEN",
+			       "GMAC0_TXD0",
+			       "GMAC0_TXD1",
+			       "GMAC0_TXD2",
+			       "GMAC0_TXD3";
+			function = "gmac0";
 			bias-disable;
-			drive-strength = <3>;
+			drive-strength = <25>;
 			input-disable;
 			input-schmitt-disable;
 			slew-rate = <0>;
 		};
+	};
 
+	uart0_pins: uart0-0 {
 		rx-pins {
 			pins = "UART0_RXD";
 			function = "uart";
@@ -243,6 +235,16 @@ rx-pins {
 			input-schmitt-enable;
 			slew-rate = <0>;
 		};
+
+		tx-pins {
+			pins = "UART0_TXD";
+			function = "uart";
+			bias-disable;
+			drive-strength = <3>;
+			input-disable;
+			input-schmitt-disable;
+			slew-rate = <0>;
+		};
 	};
 
 	wifi_pins: wifi-0 {
@@ -271,19 +273,21 @@ reg-on-pins {
 &sdio0 {
 	bus-width = <4>;
 	max-frequency = <198000000>;
+
 	status = "okay";
 };
 
 &sdio1 {
 	bus-width = <4>;
 	max-frequency = <198000000>;
-	pinctrl-names = "default";
 	pinctrl-0 = <&wifi_pins>;
+	pinctrl-names = "default";
 	#address-cells = <1>;
 	#size-cells = <0>;
 	non-removable;
 	keep-power-in-suspend;
 	mmc-pwrseq = <&wifi_pwrseq>;
+
 	status = "okay";
 
 	wifi@1 {
@@ -310,7 +314,8 @@ hdmi_out_con: endpoint {
 };
 
 &uart0 {
-	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_pins>;
+	pinctrl-names = "default";
+
 	status = "okay";
 };

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
