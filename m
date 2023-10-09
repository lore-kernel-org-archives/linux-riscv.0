Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D971FE95A91
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 11:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1Va0OEKkRD9JdIokMHcLCZLdXHFO0mmoI2yUxAdfqWI=; b=amJ1tfFPdzpos2
	d23T4kLIx9PUQF6wtZ0y8tFDlsDvA+cuy6zR5KeeNFxo8qJ5x+otzbtyODmNHuVyOVrJA+3Ylh+Cm
	OiQK0JWPszFbyzUdMDp00fnNVigJBDXAg1vtp7BrN9MIHPkm4HveivhMwN+pM1uAqTdNIyr+8GzRm
	CgWlS67luh/6AptmsHvZEYHSFVhk6qNWcPQY9I2tiHbBp2k1djYpLYOJFgyqt2zFsbDlSKk6/2LaL
	2ua95hmlArRcJjGd8ePe7BcXdu0b36ql/Wr0D6QpQV/Bk5mFc9+/QrphsdLs1KFzvPSVihfAyljGB
	6FnFF/lq2e+54Vu89HYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpoPk-00ASHX-1X;
	Mon, 09 Oct 2023 11:27:08 +0000
Received: from mail-sn1nam02olkn2080e.outbound.protection.outlook.com ([2a01:111:f400:7ea9::80e] helo=NAM02-SN1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpoPg-00ASDN-0Q
	for linux-riscv@lists.infradead.org;
	Mon, 09 Oct 2023 11:27:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mebWXH6KM0IOlwUkzPCdMd5Jlbmzvknxo2omosZ3zEUCrHLg5e83J9bPng5z3ZHqtxm6fthXXXeQ+cweEDGztLnPUO0ww4iIXK5r4Rs+LKXYmmRZlX1yjK+VuKcMtQzBtGDBbrBiQFRZTLVOvY3E5SMCY7pdhlsPhL1x+QlciHVgrmAx/Rdv0wSTQdC4cdUry45uaiXMLvAqFwo9apwq5ojgXWcxwIK0HCtN23s5GeV1wRuS8VOIZjcb+ScT+PyktHAcfe8OeEQxn8xvM0zhCQhnjAb4Cj22rTI1pv46LRv21b0n/IIYevAly7LQ29wGPxU0fckSVn+uEQwgpjohpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6IttFsZmWbuo/ioO2E6XMM0wPsbeCqH6n87b8vDr/Ho=;
 b=XukAV85qCY2arppXDn7/O/h6MBxwM0sWAzJGuZ3rNLEXQyqae3ChWHOeIIASySL2Y9jLGJWurv/yKUvLx9UhtmUY5RB46/kp6j6CjBE5mnMtYe7WrLeHBuBUzbloIxdMH0REFW2vOs23WSZkp7fr/nnbMGXgoGiGCv7evOUWumCTrxoR0Ug00va5sA2YeCiaiP5zKLRTsqwszpGstynf8Es4mE8ORjYj46IFcpPB4+wocrdt5HD19x71FjDxLgPUYTeFhHv3Jp+4OLHNmozbelI0vlRMYZfMNlzI0QrBjzQ27JqtPG8Ch7Hc50l4APrkkU46f7g56MfMOXuU93n03w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6IttFsZmWbuo/ioO2E6XMM0wPsbeCqH6n87b8vDr/Ho=;
 b=GgIHnoQRESyQxe13+CRftlzsG+yx6jwoE0QDyvNBYOYYO9ix3A+sgrTDHg1PVVhquKVGr5z+jlu3Ego6z3aXw5fKfAKSV9KOzJi26Mzm9NX+HmtqbBYgewev41OuhzmPaeZSrotfl8qrYnvj4HRyTCQW28VY9ILoLLdzniliRLsAVFbrHBUt51LwIQ4drbr/amnHhqWhmaZcJQ82bNX6e7Uu/uUQyMLS5B29uxCwMFKEDAp4Msk4BSqXuk8QMOu5bY3gsl64am1Cd9iaC7guFTLh4Mpr2dWtIYg9NnjLf9Q+3renunrVzVWXig5iNVt65QurQqyZSEb4qH6n1Esj5g==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by PH0PR20MB6129.namprd20.prod.outlook.com (2603:10b6:510:2a2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.37; Mon, 9 Oct
 2023 11:26:58 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::d050:882f:a8a7:8263]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::d050:882f:a8a7:8263%5]) with mapi id 15.20.6838.040; Mon, 9 Oct 2023
 11:26:58 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Chao Wei <chao.wei@sophgo.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Jisheng Zhang <jszhang@kernel.org>,
	Inochi Amaoto <inochiama@outlook.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 4/7] riscv: dts: sophgo: Separate common devices from cv1800b soc
Date: Mon,  9 Oct 2023 19:26:35 +0800
Message-ID: <IA1PR20MB49532560A3CA2670A0EAB846BBCEA@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231009112642.477337-1-inochiama@outlook.com>
References: <IA1PR20MB49531C1C34C3E972DBBA4151BBCEA@IA1PR20MB4953.namprd20.prod.outlook.com>
 <20231009112642.477337-1-inochiama@outlook.com>
X-TMN: [VoTnJ72mA8S040VgJxervUTWhdojVV3liCHQszPll70=]
X-ClientProxiedBy: TYCP301CA0049.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:384::13) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20231009112642.477337-4-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|PH0PR20MB6129:EE_
X-MS-Office365-Filtering-Correlation-Id: df777fea-78ed-462c-e53c-08dbc8baa61c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Yh5YgJejdk2XQeQNIqiPzTdsEEaot33VAyQhC9HbCYcAvKHtuY0ezlwVf9CHwfdJVtFXUJLiIe7LVlTM/LCPxSKsdnAhl0e0boodH6ozctoVxqB0SpGHjvRNBeyM2idGI3sqP+y9iZo/NYGhSzC6FuuoyHQuEdll/1Vxn98rJwSQps+vaUeSFSgmzk8RKAO2AT/HrekM+JDB2R9qwTv6MHudxCeiwYPe4eSXxPf7mFjHVAjaMQ7jR0IGNlqBNvEsSjwqqC5hfpEYAYTvty1Jh/QTT8eC+CoHghmdmYugeyRtM2ZJ2bw4rJo9nV82XKrQzIGJadbvpK31q4+d56pIV0HMT+HeHnYSqi0czJCd3qXmYCDWoJ98K4OXmj1h2BHPzfnOZOBT/jXF9X2z7NmIxqqemK1nGzxPrLw1fZ1Xk9jidElLjdKR5loJgy8yW5UmDRCpqVR5eCKeuPQgPDO+Vu75SI01z0a6yY+vUusB3kZbl75WFGfoTkBoxcRIc/8OFSvIk3qnPhVs7bZ4+rkaZJbKPJ4UEGrcOu9hQyh3TT2TcxdLBWlt4d1hOAdGcyDp2Ab86XUzu+Wb8V0wL9mH+Ia5NhUF7Tu6j8R4BUM1vE623xHa4Y/TtgbIoiGyV2bv
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?E2ZnhJGqZEJbDqcQz9Rh4ZLMT2VY50BjwyxrVjnQO2b5+iIuixDu496j0y58?=
 =?us-ascii?Q?JfM+2miWKSIdnCxuP3f1z/23dh97gMNMoFhAZQ/RQcbNBri3no4UAwwv4/Fm?=
 =?us-ascii?Q?cdQ56g/2f/FOEo3MY6Vu7sq4iYV0GECI6YEj2W/pm2K8BVu7G54opIp6SZyJ?=
 =?us-ascii?Q?sMnRJeKsLcIn61a2Gb8XrEljmMxTqikHk7p3HrZ1oL7I6/emGnNPS/vK5/Ug?=
 =?us-ascii?Q?9HUAga5VatHLUPNzK2iVH2vs5zEehnQtqylItz5XPjFFLb9iqp3iq73LYocx?=
 =?us-ascii?Q?Y7TjjiCjj2vkctVfOtSqdFt3iQnHIsFwn+3HLb10KxGLa9dl69g+2U9FKCcQ?=
 =?us-ascii?Q?uhVjw9agahJtnvVIzlzUJHSm1z8zmxplYJIgoO1ZG6rO9jqqTNrZh8haEXoI?=
 =?us-ascii?Q?TBVL26L5EP0zXNEUKn4aNBdPdqQa38y/WWw2hIWb94Dk4sLNd+F5Hgkaj8Li?=
 =?us-ascii?Q?W81AjwSuQxpsrz3fLtZb8wZIcCTqHUFZ0PotNqmwit5BBW1uVcw/kG4UaPyP?=
 =?us-ascii?Q?FjnOLCQ2tqAfoNlC+/9AbYDu1ErbsmJJxO8k98F9Al07FGiQ1VRpYDFmwoEG?=
 =?us-ascii?Q?/7bncrFq8CVduPqS1jtv2GFEuOxxQ5nYr1C4Kne/bHlhVlFYzvHspByCA0xE?=
 =?us-ascii?Q?NHOjj91eGsSdCfMESxObP09mZsYS0Y0QYHkjlCKpDbhu1sB8YBp4Fx9DClTV?=
 =?us-ascii?Q?ACpi8/Y75g/Xg7o10SqQNDM59nPVzw5+ijXkmbrSpmp8h/Spz2oCQLKPuJf6?=
 =?us-ascii?Q?/za3Zb6LkOEAM4FwZlPCo2UuXW37eUSdrrq4CPOf44hD0FIMHraNQdfdRegc?=
 =?us-ascii?Q?WwLtsMqsPxyerK5UPomxkNUpadYJSwxafoj7jihvcpjNcIR7wmbiUZiVCqBP?=
 =?us-ascii?Q?krupgSp29huz/VVFkU+3Z9n0c1R3YwHuxkHgwj/ccL0Skc2PD1QfD3WarPty?=
 =?us-ascii?Q?1NOBPBiU2q2jdnUg9h9SJfTlhfGLezso/yKC+tOXFaJxSZA69lzQScAPeGyN?=
 =?us-ascii?Q?AZkiA2iKBAk9h0zIx2E+Gp3goNWMeDhRqohCqQdHDS4xCx0ek10844vFHbeg?=
 =?us-ascii?Q?C8hf6EZiBt2UF3LbhARfmC4OgWeCuvjtuO2sCB/21HnWz6sbVWr+V3eql4SU?=
 =?us-ascii?Q?lam35eFZc9Hy0tUA2YrYYICDeM91tByoKyj6U5UAeoAc/EXtO+L9tM9VzcOP?=
 =?us-ascii?Q?tg0qXSElc4HzDfo53dFkEDb6u5y/ioc3/xAOoBgmgMPfmRQPBrW5c03swwA?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df777fea-78ed-462c-e53c-08dbc8baa61c
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2023 11:26:58.8555
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR20MB6129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_042704_174428_EAEA1F4D 
X-CRM114-Status: UNSURE (   8.21  )
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

Move the cpu and the common peripherals of CV181x and CV180x to new file.

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
---
 arch/riscv/boot/dts/sophgo/cv1800b.dtsi       | 95 +------------------
 .../dts/sophgo/{cv1800b.dtsi => cv180x.dtsi}  | 19 +---
 2 files changed, 2 insertions(+), 112 deletions(-)
 copy arch/riscv/boot/dts/sophgo/{cv1800b.dtsi => cv180x.dtsi} (80%)

diff --git a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
index df40e87ee063..0904154f9829 100644
--- a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
@@ -3,106 +3,13 @@
  * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
  */

-#include <dt-bindings/interrupt-controller/irq.h>
+#include "cv180x.dtsi"

 / {
 	compatible = "sophgo,cv1800b";
-	#address-cells = <1>;
-	#size-cells = <1>;
-
-	cpus: cpus {
-		#address-cells = <1>;
-		#size-cells = <0>;
-		timebase-frequency = <25000000>;
-
-		cpu0: cpu@0 {
-			compatible = "thead,c906", "riscv";
-			device_type = "cpu";
-			reg = <0>;
-			d-cache-block-size = <64>;
-			d-cache-sets = <512>;
-			d-cache-size = <65536>;
-			i-cache-block-size = <64>;
-			i-cache-sets = <128>;
-			i-cache-size = <32768>;
-			mmu-type = "riscv,sv39";
-			riscv,isa = "rv64imafdc";
-			riscv,isa-base = "rv64i";
-			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
-					       "zifencei", "zihpm";
-
-			cpu0_intc: interrupt-controller {
-				compatible = "riscv,cpu-intc";
-				interrupt-controller;
-				#address-cells = <0>;
-				#interrupt-cells = <1>;
-			};
-		};
-	};
-
-	osc: oscillator {
-		compatible = "fixed-clock";
-		clock-output-names = "osc_25m";
-		#clock-cells = <0>;
-	};

 	soc {
-		compatible = "simple-bus";
 		interrupt-parent = <&plic>;
-		#address-cells = <1>;
-		#size-cells = <1>;
-		dma-noncoherent;
-		ranges;
-
-		uart0: serial@4140000 {
-			compatible = "snps,dw-apb-uart";
-			reg = <0x04140000 0x100>;
-			interrupts = <44 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&osc>;
-			reg-shift = <2>;
-			reg-io-width = <4>;
-			status = "disabled";
-		};
-
-		uart1: serial@4150000 {
-			compatible = "snps,dw-apb-uart";
-			reg = <0x04150000 0x100>;
-			interrupts = <45 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&osc>;
-			reg-shift = <2>;
-			reg-io-width = <4>;
-			status = "disabled";
-		};
-
-		uart2: serial@4160000 {
-			compatible = "snps,dw-apb-uart";
-			reg = <0x04160000 0x100>;
-			interrupts = <46 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&osc>;
-			reg-shift = <2>;
-			reg-io-width = <4>;
-			status = "disabled";
-		};
-
-		uart3: serial@4170000 {
-			compatible = "snps,dw-apb-uart";
-			reg = <0x04170000 0x100>;
-			interrupts = <47 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&osc>;
-			reg-shift = <2>;
-			reg-io-width = <4>;
-			status = "disabled";
-		};
-
-		uart4: serial@41c0000 {
-			compatible = "snps,dw-apb-uart";
-			reg = <0x041c0000 0x100>;
-			interrupts = <48 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&osc>;
-			reg-shift = <2>;
-			reg-io-width = <4>;
-			status = "disabled";
-		};

 		plic: interrupt-controller@70000000 {
 			compatible = "sophgo,cv1800b-plic", "thead,c900-plic";
diff --git a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
similarity index 80%
copy from arch/riscv/boot/dts/sophgo/cv1800b.dtsi
copy to arch/riscv/boot/dts/sophgo/cv180x.dtsi
index df40e87ee063..ffaf51724c98 100644
--- a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
@@ -1,12 +1,12 @@
 // SPDX-License-Identifier: (GPL-2.0 OR MIT)
 /*
  * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
+ * Copyright (C) 2023 Inochi Amaoto <inochiama@outlook.com>
  */

 #include <dt-bindings/interrupt-controller/irq.h>

 / {
-	compatible = "sophgo,cv1800b";
 	#address-cells = <1>;
 	#size-cells = <1>;

@@ -48,7 +48,6 @@ osc: oscillator {

 	soc {
 		compatible = "simple-bus";
-		interrupt-parent = <&plic>;
 		#address-cells = <1>;
 		#size-cells = <1>;
 		dma-noncoherent;
@@ -103,21 +102,5 @@ uart4: serial@41c0000 {
 			reg-io-width = <4>;
 			status = "disabled";
 		};
-
-		plic: interrupt-controller@70000000 {
-			compatible = "sophgo,cv1800b-plic", "thead,c900-plic";
-			reg = <0x70000000 0x4000000>;
-			interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 9>;
-			interrupt-controller;
-			#address-cells = <0>;
-			#interrupt-cells = <2>;
-			riscv,ndev = <101>;
-		};
-
-		clint: timer@74000000 {
-			compatible = "sophgo,cv1800b-clint", "thead,c900-clint";
-			reg = <0x74000000 0x10000>;
-			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>;
-		};
 	};
 };
--
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
