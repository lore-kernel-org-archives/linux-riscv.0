Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC11CC54798
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Mar 2024 09:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sD607NotvKtQs68yyaL9Mt8BhWyDOrKatcUmVyNrQt0=; b=2P6o7pKbj1rjUR
	bv4CUNft4fCPw3N09t8DBze1DE/ACT+0w6CdjFq6tWixhpwvOXRa7/q/21cmTLJoDqKFkXIJRMEXZ
	+oWSHR1DKIKmy6HgqpytgkyOM2i2e7Md4VoAl0dPoA9JUhNDFm6uGDcmI7KM3ntC40sMRQSlqgJk8
	knRraetyPezgzg06hcvw9VlyrNCs/7IVWKqvXaQnvfgEJz6ik851b2LoiO8XEY49SvgSYHKDO/yjT
	8mJlDUcX0lcnPOLelZPpcu2iE/hX1QDruWmqSVljXD26NT/2h9f4IV/6AGPTXrMuF3fhxNqu7QEJK
	/aviA3hJqBlf2GYuWJpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1risce-0000000Cx8H-2IRO;
	Sat, 09 Mar 2024 09:04:04 +0000
Received: from mail-sn1nam02acsn20800.outbound.protection.outlook.com ([2a01:111:f400:7ea9::800] helo=NAM02-SN1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riscb-0000000Cwzk-02Nu
	for linux-riscv@lists.infradead.org;
	Sat, 09 Mar 2024 09:04:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M15tSgPNzWecBYjtI/WNfHc/oT/mA5dZZ7rN7cFiEyivUC8VxV/bkO71+tT662qddelA7emmHIs6qLCSdnn5FunUcnIhOloZ4x1sstMnm2u9bRXl+8jzt1BguJgZ7xRRARc6wL9yokvnwSgFUAt4ZgU6E1LbKIdEgHphathp0bTEf2LpqLwXPHkm5rT52PkYsOWRaD4cE1kKXFrFD2a6xuI7SgTpY33YFyIelzNNkYwMkaCX2QVk8Noyn3GuaUK3OS36xi/4JSi4OpsbcUV7GELioSBWJKtmaTFKJa/nHM/xFAs0j82uYLffM8Jof37Wag1bOpVESRlpDjwQEdUqzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PcbKUs4tjwPfmtoQHjJEtEOH870JPI5UD2IQCwte1Ag=;
 b=EGznzzHlVguge2LSiER+xFtUL9a2fQ2PFAidlcGure1f1ccy0xn7iJ9YuIPtILDt6Tvc1p8zYVDmOnZ03LPjAjfKNl3lmbgKUBzJ8tX3Y1rAuK7Xstu2fPUF71mJk90/WtPwEbY2uXcj541j1MTILBj+awqR71ufrKSFz/tV/v/piP/jWNQr+jmBNWcAKhK8mwDXKZ6WA51rcsJ9nna4a6F5WfXA7ydhLx2koXC7/KmthqnOKomY24Q6mIqWwboHMip+MWyqwFDMt2M4iwaWeP4sPzIdHEWjUqUee+ApZ7oQYmfqlLW08t2thOtlZeAje9aDndOZ7g+6tGBbEvXbLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PcbKUs4tjwPfmtoQHjJEtEOH870JPI5UD2IQCwte1Ag=;
 b=j8Td3y7k3qDi0qwOHKXcSOZDoZ6PfUa4zYeVILLsIjooyZIOO1xG4jEvC+Z5jErLhpkFTtkPPB0xTAGPZwrh5Jpqy2ocvRTWME2CmyMZ1dPiJNu6A4qU9WojfiSFzLSnG7vWAy0S+8kv0BPSIuR9ayFyyLFz3I4Ri4DdVAl95xxA/s1pMz8HgqhLOf8QnAUyusKmcGo4eNy/W6abQgpXBUy8yqALBox2Ma85nneRST4KzOfclrgc/6pWE4FESKcMiMplK/LajS1LXLsd9qcbR1p0g8U9rIOw+0G+OXFLyMqNZ+UfSrZP7tHZmTia8CzQUTJZHMOUTAE+MiHRuSwkJg==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by MW5PR20MB4260.namprd20.prod.outlook.com (2603:10b6:303:191::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.33; Sat, 9 Mar
 2024 09:03:51 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::8615:efe2:7c8e:2041]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::8615:efe2:7c8e:2041%3]) with mapi id 15.20.7362.030; Sat, 9 Mar 2024
 09:03:50 +0000
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
	Jingbao Qiu <qiujingbao.dlmu@gmail.com>,
	dlan@gentoo.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v9 6/6] riscv: dts: sophgo: add uart clock for Sophgo CV1800 series SoC
Date: Sat,  9 Mar 2024 17:02:56 +0800
Message-ID: <IA1PR20MB4953198222C3ABC2A2B6DE21BB262@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <IA1PR20MB4953512A4DCAF293D7B1CBC2BB262@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB4953512A4DCAF293D7B1CBC2BB262@IA1PR20MB4953.namprd20.prod.outlook.com>
X-TMN: [kOBpM/sz/uf1MNbDh/P5gclDBZEdpCu8SQWp2FtcV8o=]
X-ClientProxiedBy: TYCP286CA0347.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::7) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20240309090257.927623-6-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|MW5PR20MB4260:EE_
X-MS-Office365-Filtering-Correlation-Id: cb95b0a0-d08e-4cf9-9a8a-08dc4017d682
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qK3HtK2pRHDet5tYICA67wXoayHMIMMKR7jDC0OSRz4qfB6/kkXQePqzeTmRMLa4jkYDyMRzci4WdzzNuJai0KhkYgmcgEjxwtl4sO3fMJnt7yTTapuUt78Fwq8FTX5ugt9GLV8D1kQ6MMK9c3aPlNzGJkRNcznw2v/DI71048KYqrEShat1lU5PWbi0N6GZgQMp/Ci6uiX02hMQNRgll04veQuWgtMsokpw9SoQqAb9kjAXv4s7NIUqq7idV2+JE2bTbF0AUFNOXPDZKg0rtzusE9hTArP+mBA2nFaAxfh/ntJiAOWyQ/Tb6+YwAgDV9zjMKB1+SKWjJE8chnKSsI7zt4TwJsUPUFCzR+vsxa8ycrSTsav57BpR9Zg4W/yY/tqS+tgm7suTjcC/RL3b5ZQp7z3bKBxCYN0txBG3IwYad8+JEuyahWV1ffaVdI3y7VeFdSyaxPUhLKThwaeehU/r+x15Q2prwH4MlTUusRpIsq1y+8dVVPwGX9l0xab8g6sAdr6uDjS4+tce8XqMMR4iJF3MLoaF/39qYT8YFyy6DF+LxCcWe9shJuDnzR9pnyA1LIAZX9svY2CuVh4HKs6UKsWp2Ky8RQjxoUA1PhqSd3b5BwRibkxR/wkS3JO4
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fUAqNnkwRPgK6jKWEp27CZYAE2SAXvrgGFoDoQ/lz1IFcyj5Us2p9J6IVG98?=
 =?us-ascii?Q?k/BS3oygKFR6bAD4oGFGL+Sw1dK8S6Nvp/TiBcFt3YrW8oTiiLxuAcA4nGBr?=
 =?us-ascii?Q?ybA8sLGqHcwwA5hKgvIm7xQaP0OzcrP4I6SV9UNgZR+v9EK9I8Mna8cCYY2d?=
 =?us-ascii?Q?Ut4hMU0il4SlIHTq/5ks1tJ42joTZEBY134xBT/aQl0JtgGAZypJuptGCdJo?=
 =?us-ascii?Q?FU2Z0EtOJiFdd5SUXOawdvBsrYFrAxH0VMdDwgMRjqOEZx6CH3vf/cfjOWJi?=
 =?us-ascii?Q?2qqUosP953oVxE6tG7B65fTLeMUdtKM7Ns5H5cCNjTofiCEpUkAmB/FY+8gq?=
 =?us-ascii?Q?WxNtcvKsiz/jc2ypg1W4gvIpsqA2Yijnf7OeVAVyt9yov05Bb389J4kA5E/D?=
 =?us-ascii?Q?O5Nes9oxCQQ08ApvSXwHsyW50oZGriUigax962orNT4DS9GSObgBdtOqTr+0?=
 =?us-ascii?Q?4gsHmttkj8PrpnTUHYhALATsCYoRiRqG2gsVoobQH1Jvg8OTBkGWZnbi0lh2?=
 =?us-ascii?Q?GULYe29QR89339lXp3o6L+bKT6TopBSWcfPP9UFPNNDgcUVQxXYhGZscVAs/?=
 =?us-ascii?Q?qzhufYH0FGXvWbnEfuz2eQoav6BaAwfY+hG5KVeJ2FMY11qLnk8jUl8QiEtF?=
 =?us-ascii?Q?N5LUPdDPE4ZGvdGNk7BBmgWZtg6wa5IZRuBCYgQKZ3LRKmKvGvuh2MQ7FlDv?=
 =?us-ascii?Q?IDsJ1W7yNXVCZeY8vOWhNVSABNuDfAjxgK6qhhmKItQw+Mab2a6GMqR297e6?=
 =?us-ascii?Q?f0zRz8HBClubzba+DeSN5Q5qiUSCzcuRNcnOCgfpNBkK2qVz4DlmA5+0xwPq?=
 =?us-ascii?Q?t7EwTvDMUK8/cRmXsj1v3gT8hQJsRzokou7wEHqfgwheFRk9lCo5eTMjhzcP?=
 =?us-ascii?Q?qXl3Kmpp0X6A5QHf1QKSQXPJVuNsnJ5fDwxPlM3IREsHUiM44Plof318UXMv?=
 =?us-ascii?Q?Q1WJQQz5U9ZcZ9QVp7CT7Do1GD2AZYSrZijhm3l9UKpvUzeFJuh35ri+bKMG?=
 =?us-ascii?Q?pBesLK26sVXHkpBhx1LG+2O9d1Qp2mfn/06rtIDYLgr9A7OoOD2xCuTV965D?=
 =?us-ascii?Q?JWf7lTVBP5IheCxCQEvi1+W/UieuNnG57yfnus/+gt6McpBQutLeiqXbojnL?=
 =?us-ascii?Q?7uW76DsJrP2nC5re4yf/NwpPIYJ6rYNQhJz/V3pVdIf9kNi51FuZ0xXDUFsq?=
 =?us-ascii?Q?zYsS0dbQ0Gk4HdRWJEByHW8YAsvJ4+zn9pZttuP5IhRHHIHoqmujvma0l89h?=
 =?us-ascii?Q?I8UcDMiJXspVK5ARmgsz?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb95b0a0-d08e-4cf9-9a8a-08dc4017d682
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2024 09:03:50.8557
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR20MB4260
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240309_010401_088325_0DE26D84 
X-CRM114-Status: UNSURE (   8.28  )
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

Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
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
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
