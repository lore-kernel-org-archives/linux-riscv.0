Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AB38CA101B
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Aug 2024 22:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WBeIKAZhu89zA1dUCyZc9Nap1xSfRjFXvdIBU6HpHTY=; b=JXf93LVRYatpSI
	ypWg0U9Ud88j2EhUYQV/4952SYw9+fjL2tH4Ti0CMigot2C/uh2tZEIIKCnWBONf8aD/YuxqsdUKa
	kPR0cgYiJNoUQPA9qiTaWa332HeZ1+jZfQzIBTfPFvm72Uoqj+m6NNvXFji5frWZPF7SyUSYepeL8
	QPvfe7767kQEKNLedvM/wh7vOlcyGQ3gHnHgbNpB4UfzzvdJisu1ivDR02nzJnoTH+44lsm1i5hmp
	6NnPD54ZfMseOJawMRtmRul9/pt+aqGkVREk/zVZ0MbhMP9NtuLWE0TrOrnPRxjF3NP+RpzmBJgVu
	1TLiBbl9KRu9yRdsOp8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1skANP-00000007wXq-1eO7;
	Fri, 30 Aug 2024 22:45:55 +0000
Received: from mail-co1nam11olkn20825.outbound.protection.outlook.com ([2a01:111:f403:2c16::825] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1skAIW-00000007vtg-3RRk
	for linux-riscv@lists.infradead.org;
	Fri, 30 Aug 2024 22:40:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WxXCT7zuSpat3IDcx9k9xeYK4bohfr0uzX0vRjBMjov1iV4rqSguxyKJvF9zOGmA15BeVtRswY7/jBxAeooO0vjlypUkHejYm8yDX4XdmjoID/T3aupD3875nSXNW/vOthGVMFeE224/xrqsktPXaH2lelNTrATIfxEqM5mrcHIfsxrZp6rrCTC0pHfPM2YzPJ/N3Chd11z9BeNZ6A4lLbhHfYBRMS78R4KRhlWyRoWCUCkLY4Ce5o5ZlDKKaLec12CRU91g0gr7t3aVlrrHZ1nnzX0OHhNOp+fBQlao3SB6LlYtmNlv0sNjF8uQkxM6emzbxSadLISXTMBoEQj78A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5tMdoJKUcFhW9N16PjBtXK4Yy/yKi0NCQNR05/20ius=;
 b=IsEA7Ux6MbA+nwqIfpUyoRC/qzg21VEzSK24cQLbivEfWZrvIBEXCO7Sm0cp2FW6GShTxz5pO0F2eJfMgMlWWCJRTTiUYoHBK+52ALGfeME6+IYDjn59ubEbbW82MFx6v6BisUo/gQbV7G7Elt/Gx4rVqAJOe3A40bGi8Nds6lBtvsUSdwO6Ka5XQQ0YyniNU/i+6ui68hcGaclN4dU1nNsbdBxO5x8ApRy+KwRivl6akURv9g9NWQSecSOhX8xR5KeM7qZKGZsAeCM8+ID4yRw1wh3xMYALnKem7XJnb4aV11KloUsD2PPkWnRWd3cMQP5nJcF9nfHLtA1cph9zLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5tMdoJKUcFhW9N16PjBtXK4Yy/yKi0NCQNR05/20ius=;
 b=KMlINEnZNeLIdH3gYoC/mTwg+Va0doei7buRS7TzQAFZ9PetdOtIovPlk2YuKIjc/OiJSYwNVI0SCdbbiqIJ8dowZrIdWUyAbEdTwAYHyWTh4Ch5aBoL6ebWRF0DEpWHByJoTydfAvA3EoeVrfVy2TeaWWmlM+scfZrhkgic6ahK+4GpuLWzBcC74e9JYepf+Ufqc7Qf3I8MD9HoX/Sz2rWwmf66p/UsNTtRAQNhfDtUb614hZjH4JRgE9T2U9qprXrmdrx+CKX/t3kNO8WL2+22aPOEfBGZvXhS6g0pkROVYgXY3yN3zW1fa3Yqq2IhrKYzgS4HUkUaoEX9Z5QvmQ==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by LV8PR20MB7473.namprd20.prod.outlook.com (2603:10b6:408:227::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.26; Fri, 30 Aug
 2024 22:40:46 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%4]) with mapi id 15.20.7897.021; Fri, 30 Aug 2024
 22:40:46 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>,
	Haylen Chu <heylenay@outlook.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/2] riscv: dts: sophgo: cv1800b: add pinctrl support
Date: Sat, 31 Aug 2024 06:39:40 +0800
Message-ID: <IA1PR20MB4953F9D378DF2C3E739319BABB972@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <IA1PR20MB495374DB8C4208575AAC9675BB972@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB495374DB8C4208575AAC9675BB972@IA1PR20MB4953.namprd20.prod.outlook.com>
X-TMN: [mFE10AW4YCpZq8EOi07DjUdtbmaHpuor3X15D6PtoRk=]
X-ClientProxiedBy: TYCP286CA0060.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::15) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20240830223942.27776-1-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|LV8PR20MB7473:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d2996c4-fcc1-4a43-4485-08dcc944ca17
X-Microsoft-Antispam: BCL:0;ARA:14566002|15080799006|19110799003|5072599009|461199028|8060799006|440099028|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info: /gn30HGspPujjtT4BTzWRVwBuHGzMzWES1trX1beEQR9MO1Xt5QVwy3wqKpv+ikWRs0yYy4vr/YQ97KEZM2thNKDbCsPXCHBeApPiqTSsU9YyrOvFlHmjHHgehAUXnxUlTOMyiysXzLdGZDOuyDX/juRPz4SSaK7GoEFLcO4cQcle8W6B3CBs31/9b2hsEECvLmOma3blGnHdGcfUraILAjlQRxF22HPQhnzBaBenEX+QwGgpX78EkOOtBqRNpezxJJZWbUglpb0WGxSmMpviCZfb/L8Ob8Ms5MtL3BplAmqWnKRVm42l50TvpAhQMSLxw3RHX2mjzKUYCjDCFsTgaiMqvGeIUR2yvw+PUvXwfQVjlo/9p96C6/uj5D9oam43SO4Z9mlKTvdjip37d98pKnP5S9j1glzMzIHqG4ofBxjepp9oRVvlOEX7KyWMqH5GtnQtrhnVz4hOwO8kws9Zy0Bpj+v6aDof90hTQKcp92aHMIOiq48S/Z496NqFLuVNHQAx8uGWL30bp3oOGPsQuVCHAsK6c13pPZP7NAU7snzG/vf+4NYsIkvW2rHu24r5uyBD0/QxR8c5FPkajaXoGMEqi07CYR6vrWDeJ6KD7Oa8PsGpufJW8V6yt3nixRaiiOoAR6B1tczBL2m7tZRSKDV31ca4dkHaK2exlhv2RAmKvYV1oVnfIwdr97gV4d+G3cTa7VGvglRNT5SXMV9YBWy4FDCnl3/52nv7w/SU/Q=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Kb6+6rRvqiY3imlnTX3wkbFJdiIxxHXUfIWo7M05X00WpZk/l+kPGN/0uCuO?=
 =?us-ascii?Q?J2MnRJAVNePx6iWgqIFgC/WjyC51W99axbYrM9O80LZzIcZEU4V8LPq+/iKm?=
 =?us-ascii?Q?KqWqkjv4r1N41k4pLHJXysotKCo80IZYDKkHzeusdBZ7M8G08bpt6twfLtQK?=
 =?us-ascii?Q?cdJnVgAwvYdnJysbYQBAXnSqtI3w4dc0uLc9sTxG4ra7XQJuzbQ3eRCDvNWA?=
 =?us-ascii?Q?j97r857Rtl0OLdr2xT73sfMvsqCQkzOCFPF6sQXCtLols7TTfenJxyBVq44N?=
 =?us-ascii?Q?JiF3O9I4xa6KoBXUXVFdKhlYH2+fiihLPdRjDM+g35x0GsWexTgxXag65WLZ?=
 =?us-ascii?Q?ENpL6PksmpkSD9yR/KYDkeMXuB6kAaoGnSind5+p/9dIBJFdrMhITLLzVc7S?=
 =?us-ascii?Q?e+ebhvrNk/M5u/nwmqDDNkJKfNVFSmQD3yz7kvfwuWVXeedORTU1TWYjefiG?=
 =?us-ascii?Q?TFkXI29QedKIKOook1DxF7w4RpwnlzqqgY+ve4HzPcfxCz58NT9v6vaWB9D9?=
 =?us-ascii?Q?exkinhdS4IIlzsVWHUmkXKeqOK0u7rnT7F4OQMw+n92eVAB4fGqGwGqP2sEt?=
 =?us-ascii?Q?TN503g8F6ZHZsy3toP/fpQ3qcCH1sVEkPvj0M0jPFYFAwS3HZEtYU82lSzI7?=
 =?us-ascii?Q?/60dDRV1XqtQv8U6utCp67cpmguHXqlHzWggGdfvd2RXr8LsXvUlYv+hQKw5?=
 =?us-ascii?Q?alkNVipdMePbx34mXR79/83tLMrRCxfb54xhcN9d6hOf8NtWTGmXetvN85IR?=
 =?us-ascii?Q?RTg00jJFrGvj/I0NvsqKHCCoIkBq7LptqeRVkEhDlpC++qMGwr2a8kDXNgnJ?=
 =?us-ascii?Q?RLh5wl/4Gy87h+sHkyGngwE5lKUHjh8iECYW0mE7NKmrIYHOyQgYwNTD85RK?=
 =?us-ascii?Q?r8dFaudwcQzv5i0ja5zFog7W8cCB4qCza4uZncKbwG+mB54Xe1Xs5jR6lwG8?=
 =?us-ascii?Q?rSC/9kfp/NizD07gwPk8SVq5W1oG6IHDqfk9RsfDLRo9qOGMWvOloSvIK8mQ?=
 =?us-ascii?Q?TQGibTasCuMR7CWcmRYwY800ELvuPK1ukj0ne2AtU/yV8nxaoaG3h7dIN/5d?=
 =?us-ascii?Q?8VyphfBddZ2+L3oj09yyBZfHtSs6Lpmvu4B4gFJanJPCr4e0qwPIU+AMAhB6?=
 =?us-ascii?Q?TgtQ36i/ru3xB1wAz3CeXsQzQwRCiuL8p0XYGAf6aCxQs8GuuLkVLoUkanyu?=
 =?us-ascii?Q?hV9K4tqZt/NMDYnd1/0RZ2dz/zSqu9fKxtVBYus+fMQF7kb/i3kGNKB/5WH4?=
 =?us-ascii?Q?c6sCquEyxnw6JI9ExaeZ?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d2996c4-fcc1-4a43-4485-08dcc944ca17
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2024 22:40:46.8035
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR20MB7473
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_154052_892718_8DB8537F 
X-CRM114-Status: UNSURE (   8.29  )
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

Add pinctrl node and related pin configuration for CV1800B SoC.

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
---
 .../boot/dts/sophgo/cv1800b-milkv-duo.dts     | 49 +++++++++++++++++++
 arch/riscv/boot/dts/sophgo/cv1800b.dtsi       | 10 ++++
 2 files changed, 59 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts b/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts
index 375ff2661b6e..9feb520eaec4 100644
--- a/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts
+++ b/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts
@@ -39,7 +39,54 @@ &osc {
 	clock-frequency = <25000000>;
 };
 
+&pinctrl {
+	uart0_cfg: uart0-cfg {
+		uart0-pins {
+			pinmux = <PINMUX(PIN_UART0_TX, 0)>,
+				 <PINMUX(PIN_UART0_RX, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <10800>;
+			power-source = <3300>;
+		};
+	};
+
+	sdhci0_cfg: sdhci0-cfg {
+		sdhci0-clk-pins {
+			pinmux = <PINMUX(PIN_SD0_CLK, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <16100>;
+			power-source = <3300>;
+		};
+
+		sdhci0-cmd-pins {
+			pinmux = <PINMUX(PIN_SD0_CMD, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <10800>;
+			power-source = <3300>;
+		};
+
+		sdhci0-data-pins {
+			pinmux = <PINMUX(PIN_SD0_D0, 0)>,
+				 <PINMUX(PIN_SD0_D1, 0)>,
+				 <PINMUX(PIN_SD0_D2, 0)>,
+				 <PINMUX(PIN_SD0_D3, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <10800>;
+			power-source = <3300>;
+		};
+
+		sdhci0-cd-pins {
+			pinmux = <PINMUX(PIN_SD0_CD, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <10800>;
+			power-source = <3300>;
+		};
+	};
+};
+
 &sdhci0 {
+	pinctrl-0 = <&sdhci0_cfg>;
+	pinctrl-names = "default";
 	status = "okay";
 	bus-width = <4>;
 	no-1-8-v;
@@ -49,5 +96,7 @@ &sdhci0 {
 };
 
 &uart0 {
+	pinctrl-0 = <&uart0_cfg>;
+	pinctrl-names = "default";
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
index ec9530972ae2..6a958b822097 100644
--- a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
@@ -3,6 +3,7 @@
  * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
  */
 
+#include <dt-bindings/pinctrl/pinctrl-cv1800b.h>
 #include "cv18xx.dtsi"
 
 / {
@@ -12,6 +13,15 @@ memory@80000000 {
 		device_type = "memory";
 		reg = <0x80000000 0x4000000>;
 	};
+
+	soc {
+		pinctrl: pinctrl@3008000 {
+			compatible = "sophgo,cv1800b-pinctrl";
+			reg = <0x03001000 0x1000>,
+			      <0x05027000 0x1000>;
+			reg-names = "sys", "rtc";
+		};
+	};
 };
 
 &plic {
-- 
2.46.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
