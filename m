Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8038BC41513
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Oct 2023 11:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8AG38To4+LNjXw3knoUFUB55yekYCc07nvjFtUxXvlQ=; b=3qWo8UdZILelQz
	r0SWGv5O7h/Sn14U5KxOYQJufdNMb/+w5jPuLS97uSBbc9ygFHq5DcDoUxsrga6IuTIDsfm5YcMUa
	62ZL1/8zL48b2rEP872P2pvTpx8Hd0tSPsSCmvjs2ax8rozBD2H5O8sbfqCqBI+nXlFBGapbwUFxo
	5x7Q1nOmu8LqVWMqTG0ycal6TpDeorJAc7fHvVzydglOgbXiBVKWBhpsJdVbkdHOEtLuxRZd1LrTS
	P4q9xccstOBVELOI2regnOUqwTIgtnSb3tmSne1Im6N/EH9wCYpjcILyWMOM00en68LtZ9bBv1QuJ
	0YNPQ84vRLqqc6F/Pmkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt4mw-00EYrw-2V;
	Wed, 18 Oct 2023 11:32:34 +0000
Received: from mail-dm6nam11olkn2081c.outbound.protection.outlook.com ([2a01:111:f400:7eaa::81c] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qt4mt-00EYpd-0l
	for linux-riscv@lists.infradead.org;
	Wed, 18 Oct 2023 11:32:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gsUowIHhULSqJt6rSN+TC9NmkXxrhgFliM1Dcp145LQzyWvgBYiIUrr97WxYZhfqEBpvn5+Z+lvppXra72jyc410IDz5uMXue7u1qNPmDJpjcnh8nBYOuleKYVQGq9vJJbNJwMcmn0dMgBsGYlDyljUvBMNvjEziECdw6Qh1RU34lBuSkEdOqVDEjE8gGvAMFiveg6NxTwTN21k8QJe2ypqimxJWwef1E/IRTnKnyAEeaZI6F/NjndSyDHB8/gyLSZVSzWuwRmgMYERzVBvPgQZlFWls2RtaYSqWs87NR5kdsZyhmvYpWxqf6SFUNVxct4sW2FXrUZqBZqVK2iNOUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gx7xPx26Mq3kzCKC4EipZZimta+A0D9rZ+GtCJMX9+Y=;
 b=Ay/KvuanBx/aeVH6tpwROK7tN4Oi9lT9UQbG0hRn19Y8r5o+AtX4bjukgyR9jhFPHwln+xm/WcTjW/E4oE4U3CrR/AL6HNWjyUaS8IMZbQwiszgPBvVC/nJY+zKESRmCv2mcHApYwlqKCmsbjXEiNV8KZRSCeR/VigVunJaiyuoZUsOVbFQLE0OsXHNEHKLnSspUSAs0b/pc0P+Sin8KAS3NVFAtGuvmQKEN03vF5foWCEEmU61hL2qt1CLw1TSqQ+oAC0HhwMz8EDz0htvFxPGomC9fhNIo8eX4hskkYuUOz+1aglrYAL4c8TzUryZUJJ2obou38K3pUO1Up8cGwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gx7xPx26Mq3kzCKC4EipZZimta+A0D9rZ+GtCJMX9+Y=;
 b=hSEJ57jW01qvr/zZMHK3yR9XqYInswp//HPxUPFocrcnoBJwqhqUoNzdfeces0FQx9AH9oxXfui4B9LQALlflgkZ1x2n0iIf7QUt1WUHTiziV25+0s9ZKuRlph0XGjppYcXR41mtvauuRT9wSxdtceo2pzJJ8DEd7oEHpLr4/18/VKAHab819jcnb6iHihWFVKgKvS/v5a5++a3t5NonI73Ab4akXz9u5e+1cTgYAVg47r2cZz50+bE9nFxb1BKujJknmBqkkRIwK64/xtkcXvEbxBt+MVM2owhVoK6JbT+lQKMlv+0q/Sz2tx3ofj7iGxaQ7knlizsUqUqWHcHyxQ==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by CH0PR20MB4059.namprd20.prod.outlook.com (2603:10b6:610:c5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.23; Wed, 18 Oct
 2023 11:32:28 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::d050:882f:a8a7:8263]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::d050:882f:a8a7:8263%5]) with mapi id 15.20.6907.021; Wed, 18 Oct 2023
 11:32:28 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Chao Wei <chao.wei@sophgo.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Inochi Amaoto <inochiama@outlook.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jisheng Zhang <jszhang@kernel.org>
Subject: [PATCH v3 6/8] riscv: dts: sophgo: cv18xx: Add gpio devices
Date: Wed, 18 Oct 2023 19:31:51 +0800
Message-ID: <IA1PR20MB495328C16387A1246E82FE3DBBD5A@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <IA1PR20MB49538F60A390CA74EF1D16A2BBD5A@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB49538F60A390CA74EF1D16A2BBD5A@IA1PR20MB4953.namprd20.prod.outlook.com>
X-TMN: [kbszRdjXBQ3TueDq7Qvpy8wHOHXo2F6GyawFuR8F4a8=]
X-ClientProxiedBy: SG2PR04CA0156.apcprd04.prod.outlook.com (2603:1096:4::18)
 To IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20231018113155.1605537-6-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|CH0PR20MB4059:EE_
X-MS-Office365-Filtering-Correlation-Id: 766c74a6-4bd3-48d7-89bf-08dbcfcde8b1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C+IBk7P5rVNhbZoqAD11HThfAyCbMO+vOalclAsEZLrCU1IBPkHHKA1VRozeIQxmpPL5hVQ+7ISvFCcRZgCKBXL/wftTVE8Z6/weHTVI9RGTJmdwGJ1kUoczDC5wTFROebghk6vQreCPoAijzOnMEADFC9PCdOsVEQ5GSstBbfNWS3r1AgdOw+r68RaJvuK4StFDDxaTENryMtYgPK1V/eIfPjp90uQYIJwJ4oDc6AWzA6NgZEe8/SmwILOQ3Bgg7ZjixvBa1C3ql3QVY6A7v4z2FtuwQMDDzWLyr1u3AbaOsm75DvGuDamp6M+nfRTgxy+vQKimB95ePUY/P94GhgPtI8Boriu11Nz7BF7/2kEonxpU4qxOTQud9fyPUU1IBjK35QneCz6CwxCEgHcKrjLOxZBLlD59k9/FVigfVZPthrB883XV9QdXY8MF9s1+ODwG89U1v2wg+EWN10a//1AD2faUxQJApEz52zCHFOpz0zfZRI///WrtNnvT6ywxPCjur74eiXW6modRDN8MxiGoO2aqYsxy0V1KM9GSzsoMoFwcK/RWzrIat8Cd5CuNQrbGFbgqSMN6w1HQO/MV/oRo+/FV7qssrNKuDZFZBf4=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?D9a8nxiq0OTKpOEipz/ZZrdWAGNXmEoBqtToSbVAFshiXvC1N6tqlWCtlLlN?=
 =?us-ascii?Q?KLIK84dnpTn4/HGNU5WsjfLnSkl/G0agUm7TFdEQDjvLnR0nB6LeBzWKxBk9?=
 =?us-ascii?Q?6pb/oYB2FaTnvx5mctbc0R1loWaUnKQlLDDlwO/zPv3NOnYmvNsVjSGba9G+?=
 =?us-ascii?Q?1KXTN7ZTxHdL9gK7WsxWBxrHacYDm6RZb/Q4Bj4Pac2g+33GmHTdMtP4jQoW?=
 =?us-ascii?Q?wYQweHxdwHNy0i8PpZlFTFPR4mvQ9Hx6HOpaL2qb/f22nUGORfHsjsJnFYyo?=
 =?us-ascii?Q?erfZhk+KhFTGNcsUNF6GkiI0kQ6Ld0/xjtpxRQMwIW2UmGeSLuN3EsQyiCt7?=
 =?us-ascii?Q?Trw6MgxzZvwOQ65Z7Y5FjltABc7Uc9WoT0gPveVccnOysXE9rf2atVkdMNHt?=
 =?us-ascii?Q?Mbywi9t/fGujYsURyMQ+pJzXPch/DZa8W8/tNX0hMPLUXyeLu+Nmk4aHqt7Z?=
 =?us-ascii?Q?uLeXQ06J68wXn4CCDLsneZ6F01xN3YvDO1/dq/n02se5aonPi4GSaMkIAefO?=
 =?us-ascii?Q?58jhlLjtNKZj9PP5gOknOhrMe1Gi30x7XfzhAzUxPtvcVA5wV5BvMyY83PoD?=
 =?us-ascii?Q?qNgYOLzLXq/CwxMxoZNowePV5kWumZdDn0UErG10DdXAvKLMH9jtdEKKpS6g?=
 =?us-ascii?Q?dM041O1OSuQ9wmqoTnIu4YeAXvITZohUcr1DqKLYLcO6XqpNi5yebD9qRhXh?=
 =?us-ascii?Q?8UAuTHPcuWKPDkoRFge6XolAfTZkE3bH6xS5MS15iqIjTYifCy0bfJ+M6nta?=
 =?us-ascii?Q?bQPGuKejp2i6HKxmAXtSWTJG5jNMtVctMffvvzy/S1sRobd6BoUiniy9Lo8k?=
 =?us-ascii?Q?/aSd4ViW6EqsC5H9KkUvVmKAZtTu5xiEyA0Z5SfA1jf5M3ikpdVjRD50dD5L?=
 =?us-ascii?Q?O0nj1vQAldmUBmWadl2R1J2hvSkRtuIT9b5mq8UOGYoDpsitgRGZN7d0o/bb?=
 =?us-ascii?Q?ajsBsm/BjXADXTlWe5lfSCs1YlixNjbQ/QOBBQnMS29LLf6vcdsh+FdDC1PO?=
 =?us-ascii?Q?kpmfDfK5wNYSDYOm9XoQkC4knFyAXbGYeZK2ckOHHo981fSpCYGBk7sOS8AC?=
 =?us-ascii?Q?7nrBnqh4/pIBy0KrNICwV0tTbOcg6WTGCkKewUHOGYqOVS+Q87h1PSbclWy1?=
 =?us-ascii?Q?Xp5EhJ6/FjLSq1tNNY/mGb/EZ0hsOx5Mwuxo2IhDjGrx+6MDeBs9C7sHj2VM?=
 =?us-ascii?Q?QQS7ArzG0YSA0w2KcOUmMrN/PIokHXvyCebhQy1oSNJ6M0gc3XsXl8g2FwE?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 766c74a6-4bd3-48d7-89bf-08dbcfcde8b1
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 11:32:28.6116
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR20MB4059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_043231_275458_4F9F58A2 
X-CRM114-Status: UNSURE (   7.41  )
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

Add common GPIO devices for the CV180x and CV181x soc.

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
Reviewed-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/boot/dts/sophgo/cv18xx.dtsi | 73 ++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
index 55d4bc84faa0..d415cc758def 100644
--- a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: (GPL-2.0 OR MIT)
 /*
  * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
+ * Copyright (C) 2023 Inochi Amaoto <inochiama@outlook.com>
  */

 #include <dt-bindings/interrupt-controller/irq.h>
@@ -53,6 +54,78 @@ soc {
 		dma-noncoherent;
 		ranges;

+		gpio0: gpio@3020000 {
+			compatible = "snps,dw-apb-gpio";
+			reg = <0x3020000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			porta: gpio-controller@0 {
+				compatible = "snps,dw-apb-gpio-port";
+				gpio-controller;
+				#gpio-cells = <2>;
+				ngpios = <32>;
+				reg = <0>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				interrupts = <60 IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+
+		gpio1: gpio@3021000 {
+			compatible = "snps,dw-apb-gpio";
+			reg = <0x3021000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			portb: gpio-controller@0 {
+				compatible = "snps,dw-apb-gpio-port";
+				gpio-controller;
+				#gpio-cells = <2>;
+				ngpios = <32>;
+				reg = <0>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				interrupts = <61 IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+
+		gpio2: gpio@3022000 {
+			compatible = "snps,dw-apb-gpio";
+			reg = <0x3022000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			portc: gpio-controller@0 {
+				compatible = "snps,dw-apb-gpio-port";
+				gpio-controller;
+				#gpio-cells = <2>;
+				ngpios = <32>;
+				reg = <0>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				interrupts = <62 IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+
+		gpio3: gpio@3023000 {
+			compatible = "snps,dw-apb-gpio";
+			reg = <0x3023000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			portd: gpio-controller@0 {
+				compatible = "snps,dw-apb-gpio-port";
+				gpio-controller;
+				#gpio-cells = <2>;
+				ngpios = <32>;
+				reg = <0>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				interrupts = <63 IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+
 		uart0: serial@4140000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x04140000 0x100>;
--
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
