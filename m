Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77839CDB482
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Oct 2023 11:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=333i/2VLMaTtmYVk99aeEFXwFiZnnRqug2TxtA4fVrE=; b=ISEanywQNWQ9Mj
	zkAjc0LllDghJxleCrV4I6kZwa75vCG8fWrb3a6DA3eXD3XHkjaupowmhnaidZrNT40cfZmmYF+Un
	YyxdXZN8fhSNHYGScqSmZtmjq+ExX/gtfO/hwD/itFrEgxxnhcp4+/GhQIgtvrFZiIWkd5IUkMjO5
	XK8weDQU+NGZZE0EHJT0w7Cowt7w0hGzsKPeAcDC0JwZrCUjoiDryAg7KpSuVlOP6jTR4kmVzaCfy
	RsdI8mim8DXxZ9ioP/xUSWQ373AhBd+6YwzqrfDZ4Aib660xO55iBbE2N0vYn1Wf2HRh+SfpHuI60
	b6/LLXe5bW34dvCyBfmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt4mo-00EYoj-33;
	Wed, 18 Oct 2023 11:32:26 +0000
Received: from mail-dm6nam11olkn2081d.outbound.protection.outlook.com ([2a01:111:f400:7eaa::81d] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qt4mm-00EYmd-2D
	for linux-riscv@lists.infradead.org;
	Wed, 18 Oct 2023 11:32:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AqNgv+y5uxonskYJK57mUpiNdG+84g5+V9J8FECiOugv7nhX35oa6cbmLoUvJqhUBGmmR2ou5fLgDon4d6+pViXtsK6Nh0pF48v51hqaWAGa8vxA587j0zoph88NBKZBxJAHEqnuwEVkJnKiV9vho4RfjEgubzTXEaWp81ZLe2ekQUc3NjiLqpF5HQy7YQYUIfksP51ZVPIyUT/otuR/a1kbSgOF67JvKiPx2O8IoS6IAQexDwCahQIUMa2gwuCFEXXEapxVf9serkOayRBPZM8JKhfzCHYCDVdnjHSQz2bAcKzN2qNNx2mJcA+/LeFZIm9QX+5jL23cI960tbZFpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VgUELkry1UnbxEfUChA00Dxb099Tltu015gjdChFyUQ=;
 b=BtqfcjI4JNCQBdY/lSMSLrwc8bVxdKEdgUL3d3nhVASq2XlUalL65CSiJR9HUWoPUIGsYqzG2OnWT3zvxc8UhGW0KkTA0VTPMuKNoQfAYgql3lkYB4g/hL5WnKIfUzYtXXlfmVwtRncOzsSzisqzrOKvQWx2JDMDYjp0eZTrWzqUpj39GomgM2ir0Bcwc7atp/Rsqq9RO+rAcpbxJ5fZz1ptjrITUtY6u4r2YxtokeZOmvIFQScU8c/wcivl49MaePMvlhe2IN11j3bTS7vE5TJHaCNwEF+gwMbmKRI1URPdnhhw6Zh1C7m6a7fLMWWt2NZBnZ7awEF7lqX9IF8vAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VgUELkry1UnbxEfUChA00Dxb099Tltu015gjdChFyUQ=;
 b=a/IVI8RZ4Rm5lOwsL7UW/CF8BUyefvb3sV2daxNeZTGULnDbuY0oGW3x9ylWLbj9XSRrbdK/8cc2rwFrQXpUwbEsu4SaojfDqRUs9a7QRyRBxry52NnYU+oHCgh//mee2N8hjnGeDGfRPfVBV74Cf5Wqbu3OF5lho85lDtZ7+sL7RdwXp00P5LXui1dGHgM5Ea5Z6WXlkyTiFLHUnY7QlDwY0Fw/OEWJB5jDFT74OSN8LHFLYhNgD9dpdozM6Z2uKxdOB+r2r9EG6EsbNMOPjjWjnrsoxMMGDhD4i9XC+eBCnUjPrW50fnrvlxoAgANyGsGvHRmblKcyK45F3VTQlg==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by CH0PR20MB4059.namprd20.prod.outlook.com (2603:10b6:610:c5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.23; Wed, 18 Oct
 2023 11:32:22 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::d050:882f:a8a7:8263]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::d050:882f:a8a7:8263%5]) with mapi id 15.20.6907.021; Wed, 18 Oct 2023
 11:32:22 +0000
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/8] riscv: dts: sophgo: Separate compatible specific for cv1800b soc
Date: Wed, 18 Oct 2023 19:31:50 +0800
Message-ID: <IA1PR20MB49533FF6B39C2275FB8F25C4BBD5A@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <IA1PR20MB49538F60A390CA74EF1D16A2BBD5A@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB49538F60A390CA74EF1D16A2BBD5A@IA1PR20MB4953.namprd20.prod.outlook.com>
X-TMN: [EjQgZEOU/j4VUvAYZvAPKdn56N7v/XjSF7FucMAFRSQ=]
X-ClientProxiedBy: SG2PR04CA0173.apcprd04.prod.outlook.com (2603:1096:4::35)
 To IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20231018113155.1605537-5-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|CH0PR20MB4059:EE_
X-MS-Office365-Filtering-Correlation-Id: 525c3de9-ad43-43ea-9aba-08dbcfcde4f0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Xl+KulrG2Ir4qRvAPg1IM5eD4bvloBi/3MgjgCds3D3/cuEKceqpqX9u9gsBuvzls9D0VBU8ifQlfTrRNNiUnyZw9cK1GTZFnIiv9hTlNGrHdLf2c5NeJBaUTNxaHoDChGCzjBvN3Phl/HsNBq+uy7QYTOKpuzG6me4WGs3K8t6Wv2wFszurBY8IJL5V6KXJ9l+GgxU48t02W1jwsiYsPGT9l5didbVYBbAsFYJ5xb3G7KCQhPeiLtwzSSJklo7zVZ6vVsXogHxRWkaH7toWxkITgtsAhw4HSSgcVmmPvtI/A8MaaPprZXi2rmrO1zurVkfJrMwLLNZBOx9AHjvHvbsqaGsN3JFPTHK4ZeWeexEzfCRHo2lQKVZi+o9wu5U9yFD4dUQFvdWOKSmZS0Jmd5DHag24r/uBjNk0hrLu66QhzUm4m/tU9+aE4rMBhZ9k+Yo8YXr1NuKzwulSJ05NY+jCOUJoGgMnAdfNCIEhr+wv72nNgfXhuA1ZPWcb56GtedGa4CqVG+6ULHZ3ZUhylB1O1QpEoJVaitUpXgV/uERUlUQIMhf6RJk7awuY5M6I+rPeTvyVGQOZ0vbXLiIFqT3URLS+3LdFvhrIZiUYmRB9Hgrq87ClxMGI7C7joYRk
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ODzZPOSBv4pmvVMbcRsR3EOe2KGBEUJ5/8wjFYyp1JmJR9HnXOtkqQHuJE3R?=
 =?us-ascii?Q?D+NjDNKmUTkM/s4PnLTHFAATdwnGphWbz5cJX9LLj+HZhjR+tQioY4xLf4rL?=
 =?us-ascii?Q?QVMia0haRJglw74oZs30JtAFa0S5cDvs6+v1Y8UC6jJwCCZ/Xc/2x4Ue9TdV?=
 =?us-ascii?Q?mVoOUcEk1tv6kme9p0CSATEJwsec5DnzsZOedUrDZHBdKcDO8gtY56NcoaVH?=
 =?us-ascii?Q?zM5MmyDhlM2xMgj2jVgoOaWGbOZ9EjezVwk1Seq28bhJls56S7N8w3CkLMmH?=
 =?us-ascii?Q?vKenQevFc5zwDkWWIYr1dw3QVX8odi43b2ZpVPrWWoaSWOoaPFnAr8nRfaRM?=
 =?us-ascii?Q?fmgorRPac2hYglyHujlhOi3wrlJ/mjEbyI1LMRK/pUTbN+q+/e1Os3iJdoxW?=
 =?us-ascii?Q?cc6uHBVrBIfyR/Eo60y9FOU7zzoBV4iIZo6G0jO5rH1lNw5wKGkTuZn02mNt?=
 =?us-ascii?Q?kjl1h3wVSKLfBWCldt6Dz9Rm+xhrzqqoZ7oWhPvHOU3kaBWVvlXPajWTHEcX?=
 =?us-ascii?Q?hx9NVrTbkoSqUMoY3oCcSS6s1gYaqQ3+ffkoc2mTuz4UuoL2uRiDnA7XIloM?=
 =?us-ascii?Q?2M4D4D4w4GmC0LOPuuVtYUg5pP/qM9DHNRSyLoNtvq5RBBunrMAlSPxMKdlB?=
 =?us-ascii?Q?eh+fjfRIUrD41f2sJAsdniukDvaW/T+XZdkIhWibj7TAhzUWteu8FvTJg9J2?=
 =?us-ascii?Q?BVGNzCPREAV9SvKlyLXnENIEpzmEdkPL6Byh3R+P3e6KAGR5oM4v6hcBM2tP?=
 =?us-ascii?Q?6+wdUa8yK2lWO2Cuft2WUtCoGRZv+BR8eOlzRKivq762L6zlSS+7BGp5cTa+?=
 =?us-ascii?Q?KcCYRc74cyUeaL2+KcAT1IUE0d0MOcWuf+0fddCjGYFWuuWm6JkW7zeB8LYL?=
 =?us-ascii?Q?+VcEAXwoVTH/ZcIeO/Mckqa9aRIxpDTxD2u0niX1Erlpzf+6CcP0+Xxr5Xt1?=
 =?us-ascii?Q?BsdVBYTYVM1gZKyK3/wRjWeTEMQn4B4yMl5jjyMReen6fVyRJH5FjPbJ1r6d?=
 =?us-ascii?Q?cnmF9EKzuyN9EmClu7XMBfWdVuhJhiYYcFPvCzgFAw63LlmbHGUH99E5KgBb?=
 =?us-ascii?Q?SHq6VwFMfFOhaiLlTkCVItjdU7PPWfusjZ9vhSrJEU0mRUSOwQUTSE702hk3?=
 =?us-ascii?Q?gY1T3kvrLW0OZYinnfQHa6jcqAk43jcLY09P88PXscFb+ii8ml1FgtpfnSFb?=
 =?us-ascii?Q?BBXKMHLlXV+sZQ7TsNYed5xQqlS3LD47NfZumTW6tq0LDHZBeg51N6WZW2c?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 525c3de9-ad43-43ea-9aba-08dbcfcde4f0
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 11:32:22.1264
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR20MB4059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_043224_729390_7CA3ADC0 
X-CRM114-Status: GOOD (  11.82  )
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

Move the cv1800b soc specific compatible out of the common file.

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
---
 arch/riscv/boot/dts/sophgo/cv1800b.dtsi | 18 ++++++++++++++++++
 arch/riscv/boot/dts/sophgo/cv18xx.dtsi  |  3 ---
 2 files changed, 18 insertions(+), 3 deletions(-)
 create mode 100644 arch/riscv/boot/dts/sophgo/cv1800b.dtsi

diff --git a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
new file mode 100644
index 000000000000..165e9e320a8c
--- /dev/null
+++ b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
+ */
+
+#include "cv18xx.dtsi"
+
+/ {
+	compatible = "sophgo,cv1800b";
+};
+
+&plic {
+	compatible = "sophgo,cv1800b-plic", "thead,c900-plic";
+};
+
+&clint {
+	compatible = "sophgo,cv1800b-clint", "thead,c900-clint";
+};
diff --git a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
index df40e87ee063..55d4bc84faa0 100644
--- a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
@@ -6,7 +6,6 @@
 #include <dt-bindings/interrupt-controller/irq.h>

 / {
-	compatible = "sophgo,cv1800b";
 	#address-cells = <1>;
 	#size-cells = <1>;

@@ -105,7 +104,6 @@ uart4: serial@41c0000 {
 		};

 		plic: interrupt-controller@70000000 {
-			compatible = "sophgo,cv1800b-plic", "thead,c900-plic";
 			reg = <0x70000000 0x4000000>;
 			interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 9>;
 			interrupt-controller;
@@ -115,7 +113,6 @@ plic: interrupt-controller@70000000 {
 		};

 		clint: timer@74000000 {
-			compatible = "sophgo,cv1800b-clint", "thead,c900-clint";
 			reg = <0x74000000 0x10000>;
 			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>;
 		};
--
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
