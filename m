Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01E7BE95A67
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Oct 2023 11:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O/p1ejA/s9Q88tA/u7OboprUlb9+J86/SS+DF/3ubcM=; b=VIQyQjOAop4vIw
	pfXbhJsS8X7vEppdcvOnxAvkIl3dVAH4RlPe59S1KL55SNvNuLsRLXzuDTTSbZUPPOZ2q+RtZRYZc
	r8QeJfZrak4SzyyDg8Fzb/6/9FMlzH3RRY+Iu7a3lwGbIEG0RuJTBmRP7WSSLjP2JNkmo2dkEWWtc
	BACRnfmZ9WVOvEp8R4yTgEJ3nmPGQi0auuSlLYAlgPMOp5NNI3Hyev2HDbajG4d1fTiBactHdQYkO
	jcH+l63tgcHKgqKb+uKQbaoL9KHIJTjjbHv3LnmHBu2W2CA6jPb6n8TBky0oeYOX3t8hyQB1OzuUg
	KfAxbxgg/DqISWBClYBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpRmX-008n7k-1O;
	Sun, 08 Oct 2023 11:17:09 +0000
Received: from mail-mw2nam12olkn20830.outbound.protection.outlook.com ([2a01:111:f400:fe5a::830] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpRmU-008n5r-1z
	for linux-riscv@lists.infradead.org;
	Sun, 08 Oct 2023 11:17:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j1+R2Ftq/0Qg5Bcn/xYFNbiv7Jn6pa0OR5fEjb0jVSEGHV48i5MYkEHneYX1cAqNM8PA63LLt1sTiSDanpLQg5M53mp61gWsSj6Q0jF7C5DJwtNMRVx4fbWIKcJsBkbbmgDW0JrNlgQEP433bROslVjRRa95J2l5f8xa1CLeykxgy0Ul7wmw0O9QQ5vDt1rQr+D3/fIqQ2IfVVDN4w90DF8RM3FGtmJDWMHmeT8wVRP80NSRHW1T7UNYCYOQ3EUxZ8pRXqYNXytXjHHsYv/lQ8UGhPMQHicIZOP3g5JPr1xX4zDuydCK2LrEGELxNQd2haO99GhFxhEGwTaFB46QcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jl6q8EOE+QklzaGMm/oPqAWsf3LDO5ZIFVK02dU5XuE=;
 b=Lk5KKNrXsYSjjW1BReEioqOY5shsGc7DtA18IpYmQUNwOzMBEDxvsL39B3wPy5fnoPqSRi3ef682JmLWjyITu1NvYNmmdrre5a0c4wfvUf35sZzQ8HP429tB0KZoYwLYvLBoQYdwm/z6F30XIA+SMeo24d/gWgD6d4pWkLGW32GOKXbQcNPFmtexPA5hRjnSFCuzJiZjw23WhmtoNcXEkvlSJJKk86kK0xvKFhaSN2SgRAQiZwM5UU4eYDL3X5SqxCF4StWzkHy+URlc73mqbYAbFRvQFEH+HVldqPDFB+J3KKEzFMzpXwsHtZXEJ/Tp9cfyXDjdXPn7WhBQPdk05g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jl6q8EOE+QklzaGMm/oPqAWsf3LDO5ZIFVK02dU5XuE=;
 b=ffoHpkJ3FE2B5hbtESqJwalnMXmgqKOTrCfxO7JLhFlb38DKadAInenG2AHsmSOzapmvkWVH9e1KjfORSu4DUTuYGtDwV47vb6ZT880+AcRFSxn8XZz3jYsRXKwJfHmPBmkuOZnqip5a0BjjQ3GxhDdTMHPRYC+qtFxKRGSM7DSCszRd878RrWjK1cg5amGrriJCX8QtBtWPV9V3E2IdvRkygbhmwX8/2+IcUbIX7bjkLOHKKwKJa1npjE4AGbYf/QWdok6yRapRBXB5TDya8B42OMsvjpykmy9fhcfr5FltXKJw1lRodtVYFIgBh9/HgytogtRsSYvbeoOq+RKcOQ==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by PH7PR20MB6969.namprd20.prod.outlook.com (2603:10b6:510:2fc::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.41; Sun, 8 Oct
 2023 11:17:01 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::d050:882f:a8a7:8263]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::d050:882f:a8a7:8263%5]) with mapi id 15.20.6838.040; Sun, 8 Oct 2023
 11:17:01 +0000
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
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] riscv: dts: sophgo: add Huashan Pi board device tree
Date: Sun,  8 Oct 2023 19:16:23 +0800
Message-ID: <IA1PR20MB4953CAA1872167CB745162BABBCFA@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231008111627.325468-1-inochiama@outlook.com>
References: <IA1PR20MB495337659E69ADA1A8B1596BBBCFA@IA1PR20MB4953.namprd20.prod.outlook.com>
 <20231008111627.325468-1-inochiama@outlook.com>
X-TMN: [7IG6S7c6Oj6gw1bkQ8BL7panY/F8rDCTwl5STHZS/VM=]
X-ClientProxiedBy: TYCP286CA0294.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::6) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20231008111627.325468-5-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|PH7PR20MB6969:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a9a9298-7016-4323-a1ee-08dbc7f01799
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0hJT1Q0RiikyXUIwRvJ39MhDk51z98W4VqmnRTqAmj8BnelH6Xqq3ZcyaDEkQUEGkOJBB2h0xj6IjIjH2EWUDD+2PkEM3bJVnAfeTIT7IBDOgnugeFQia60JI9OcDpyO/3u1XZjNgbIqJTZW3GjqIx2nOBqJRJg3f+HuzpVSbqkbeeRnv6a9cG9s4BpLe3tBIjTOHA8uEy+TBJNInnxKZT8UbtW7QCmZL30sqqWsPzF2vn7L3lR9I5QpJi88TH4NzQkzf9x4QasQ7hRXXA5KIQi91YOCYYCwSOX3vL0cZg23PaKVvGI3EmAKf7nZmTSvJUv7ZHAGvgslEZLASeyEpW66PqzTi02Zmkd82rkbj/sj9Cqc8UVnASkAWousQLheV6EDi6lH8CIhy7nfJlIXJecCoFKZ45Cb5J43Yx7meHtBW4D+p6M/uGBZFX3QSYy8VoxhOecVKcjqG3Yhvqgw9Peq/L+5nKmSFzVfdwmU7D0ppBateWEkuNL/ReTvBNv7MAApukJaP8AGfbrdB2q+MlFqwo+ibaFPMLVfunsBdJ9N+6wkn0qTBHwULIt1k+t8geUinhHtEHPLaN7KdDtkgFAv8GUll93+2IXvO97spPrdi4g0/ovHRfOdYEWUSQ9+JKXzNDBZb3XIFrm46MzvJJwn8WBV74vGFZ7iEfNS264=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aeMMGfwf730JIYntaiZ0Je4isOAVzYsj8k+qJHlZNK0pNWUmTaNfeiTsvuQA?=
 =?us-ascii?Q?+ih4SeYfvjrNGhFvjmDisxSptE7xjUUgogHa02wEjWvL/NSsDVTTIyH0Bu34?=
 =?us-ascii?Q?wLD19P9XU9REebFYyK7N6+8xKis+81eU0uNKrpPE4YMple+GCR+3x8IPQkHk?=
 =?us-ascii?Q?yZ0k78OiEAetz4vGlain/mMdZsn3AwApzGPrakOF+JOP92vGgpsCFvDQHXtg?=
 =?us-ascii?Q?spX1cFg7OiEzmnzYI/W7MiGDSMzRTy2OSyDoj5KCry35s81TdxTOanCcVAKb?=
 =?us-ascii?Q?zw4uQcEcCcBbA2utruWJdqnrNyF6VppO8C0+96ED6PJS2Qz+tiRoDiyDkKgy?=
 =?us-ascii?Q?j6aXUTsoVSdcTb9C3XM2IV9CTFjdVFYiy9Wek9L3z7Vl9adMMWscCZ8TcAMI?=
 =?us-ascii?Q?e92U6tE0WXTQzv2O/TsXm52c4tfsiAaotmg4ZBLgXZgadqEvS7puxhnpF6Ej?=
 =?us-ascii?Q?eh6oInuGXN6Hk7jsPVzPwd/2uQ772gb+v0T5ANkNSww4M0HDfUjre1lSIt6J?=
 =?us-ascii?Q?sNHqaeGOSr+IXecavSA9vUWKp598bRxk14WGjML9IrmONEAMC2VxyqJkl8/l?=
 =?us-ascii?Q?x3voA3CzXAyBHgZs1oO/3Xnw8Vp6FfRFW38FcSyuCTMKBEhm9mBpqjaULUMg?=
 =?us-ascii?Q?0eOzGcJnG/Tv9xUDQ2nrXbyoi4E5Q1bi0PKGgYyGpyfNuJXbuu53ukawFmE+?=
 =?us-ascii?Q?KKWyNSHYtxrovF/63qsPx0y09/3B1ooLRcEJgwZpv4G5YAudibWpgiam4Yx0?=
 =?us-ascii?Q?cLI4yGk4CFZ9Otew9WFJ8IyerOGiYM/HQnQrUfjmHXBR9zEc5A1CeEcS+Nbf?=
 =?us-ascii?Q?/XgiW/1k3lrlRglbYn/nXy97cIv71pWoBxWXng1jcQAfGbum+/SCmN2iSgEJ?=
 =?us-ascii?Q?ZMUYQ0rP7D9IYYpKZPbM49E4S4Nux89+wJUC3Dd7EAH/8tcR/+h/M3R3GBLk?=
 =?us-ascii?Q?sN0q8VRff1974WUIk0lBf0fyvpwIYFxGwAyYg96gB0GKMW7dWYLZtZyapUNw?=
 =?us-ascii?Q?pXdRmR+Bsl6rcMtvydtCIXZcsIvwlMHf7Qe/xp8HuJU0Qw3x8kFf4nya5eet?=
 =?us-ascii?Q?v+4nUBm1A7bJpi5a/clem9nBtIUT5V3DYdYXMIx/qfI2Iw1/krkKOyNqc/rG?=
 =?us-ascii?Q?9b6Nua1zMueJ2WFQgUs8klXsk3GS/NLG8Gxu3BjCEPc5qUDnh+5uqz+m2jDX?=
 =?us-ascii?Q?vvyftN4j57vXmenfwsXpxhPf+o5nki6s6cwhJheiiccyqh0AnMgiD6ugMI0?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a9a9298-7016-4323-a1ee-08dbc7f01799
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2023 11:17:01.4459
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR20MB6969
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231008_041706_660547_88124F85 
X-CRM114-Status: GOOD (  11.96  )
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

Add initial device tree files for the Huashan Pi board.

Note: The boot of CV1812H chip needs a rtos firmware for coprocessor to
function properly. To make the soc happy, reserved the last 2M memory
for the rtos firmware.

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
Link: https://en.sophgo.com/product/introduce/huashan.html
Link: https://en.sophgo.com/product/introduce/cv181xH.html
Link: https://github.com/milkv-duo/duo-buildroot-sdk/blob/develop/build/boards/cv181x/cv1812h_wevb_0007a_emmc_huashan/memmap.py#L15
---
 arch/riscv/boot/dts/sophgo/Makefile           |  1 +
 .../boot/dts/sophgo/cv1812h-huashan-pi.dts    | 48 +++++++++++++++++++
 2 files changed, 49 insertions(+)
 create mode 100644 arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts

diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dts/sophgo/Makefile
index 3fb65512c631..57ad82a61ea6 100644
--- a/arch/riscv/boot/dts/sophgo/Makefile
+++ b/arch/riscv/boot/dts/sophgo/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_SOPHGO) += cv1800b-milkv-duo.dtb
+dtb-$(CONFIG_ARCH_SOPHGO) += cv1812h-huashan-pi.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-milkv-pioneer.dtb
diff --git a/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts b/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts
new file mode 100644
index 000000000000..aa361f3a86bb
--- /dev/null
+++ b/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts
@@ -0,0 +1,48 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2023 Inochi Amaoto <inochiama@outlook.com>
+ */
+
+/dts-v1/;
+
+#include "cv1812h.dtsi"
+
+/ {
+	model = "Huashan Pi";
+	compatible = "sophgo,huashan-pi", "sophgo,cv1812h";
+
+	aliases {
+		gpio0 = &gpio0;
+		gpio1 = &gpio1;
+		gpio2 = &gpio2;
+		gpio3 = &gpio3;
+		serial0 = &uart0;
+		serial1 = &uart1;
+		serial2 = &uart2;
+		serial3 = &uart3;
+		serial4 = &uart4;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		coprocessor_rtos: region@8fe00000 {
+			reg = <0x8fe00000 0x200000>;
+			no-map;
+		};
+	};
+};
+
+&osc {
+	clock-frequency = <25000000>;
+};
+
+&uart0 {
+	status = "okay";
+};
--
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
