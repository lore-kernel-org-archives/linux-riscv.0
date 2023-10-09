Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F636E95A91
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 11:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O/p1ejA/s9Q88tA/u7OboprUlb9+J86/SS+DF/3ubcM=; b=BaaYpn5jFbxiWL
	e57/4bqWA/fHklKUo1IbtEzn5bDFwAsuMqVia5u52WV8lumyJumu6ZPG2Yc/xM0JOVXcTo5NmzV18
	cGUtG3lJnPWLOAbLrBXY3+BPyLEVSpxJ3wT5SnujJlP79TO5N+v3DZQMB4ABMSIlcVVZC4GegeXa6
	S23w4SsRLXXdzmJDgZIsq1Enw3kWYAwOL/SUmBjCc15TuHECFMx6rkrdG0iRIVB8BrXmHTIThVmyV
	K+xn0yWDYiUuLw4hNku+28lhku0aAuUcRa1ZV0RKGrTOIeydZbOzN/HXgLjmbUNRhSrnag7a1CjiB
	ctp+sOzTJkIJNVViwrPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpoQ7-00ASQ0-2h;
	Mon, 09 Oct 2023 11:27:31 +0000
Received: from mail-bn1nam02olkn2082a.outbound.protection.outlook.com ([2a01:111:f400:7eb2::82a] helo=NAM02-BN1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpoQ4-00ASOL-2f
	for linux-riscv@lists.infradead.org;
	Mon, 09 Oct 2023 11:27:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jd4mhS2kTWW5mTXCOmwGUYA45O6Xm9vt457/2naqHHi0Q6ztsRSft6DBXF4RwIVN1CPHr8MMK+vxVYKLXH2JFJs55XHAwp6PaIXMF68UFhohe14CzG+dgy/Ib4PwwYN2OVQshFb0TcCzkEHOkJAQ8z/0LuTkyMY5esaL9e+8GtaLQvGWJ6tOjnmUfCFC4p2KwJDFFy9lDjwx9lSmJ5hg8NGlE0I4dK044bBLmZM1k8d7W5PCOMT+Z9IUCXwZI87r9NUVY5gkIF6MqQ65pFPUGJklrrG3BAqYA6YMdKaMOzbbDqj/sda7cnx1I0Qi72vlOh+lphXgHQjOEQ+bg/U/Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jl6q8EOE+QklzaGMm/oPqAWsf3LDO5ZIFVK02dU5XuE=;
 b=WeEAjs2gbY/ljTutxgBcxHYBytqJ1XV1Qvsn4Ngj6iCpAmuvhy8zIBHyZ3/xrcauh2hVEus0l05iJeAtq51d5M/pHYogN3weqehB1RUthQh6RFPvM4LxCovcjOo/uotrV1ag8zCsOHhWurhwr5lk1Zd8g/qf5A4LLvk5/VEvv7Yd+QoGUmOYg7CTAp3uS7Dsv4NYW831pJSpF4ma/Kt+r+8ikBSMZgvOqQQ4Who+aWgPKiecsSLETluW7OzJp1oQOAkGBXuWFf4UGcDC3foBGDJGubA9WNGPuQ9SyXKhMW1tG+KjopxpIRXQipZ32d2oSPGHcRZ8UyxnajC4lDIL0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jl6q8EOE+QklzaGMm/oPqAWsf3LDO5ZIFVK02dU5XuE=;
 b=gTr25GUTYKZtWr/4Va6hCHIy1fzYP0WY3bv2UDYiKyq4WO/eM+AJg/T/EIFiXNIyr4I3UqXLUHHYvW/kzN5SSdnMfrMWPdjxBupbRwotuGpzSXP5US10xsVOqpLMsK1wQo5+gbosDtS9A//IlZYdhoyb3Rx7Q2ljQjXwhTY9Wr932WdSjsVGB6X749ve3OaLGp/u+ckIVBv2sEwJyUA8v5yvUkDqz+TJeG/IqtF4YouBSKUJZW1bZldqmZptVCwiGDh5uWrnOE+mhD206hyASeyMym4ssPWG0xHBDm0jUTyPy5FmPGav8RlfuncaXYnG/rOGh/FrWIWOmyC+m2aQVQ==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by PH0PR20MB6129.namprd20.prod.outlook.com (2603:10b6:510:2a2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.37; Mon, 9 Oct
 2023 11:27:20 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::d050:882f:a8a7:8263]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::d050:882f:a8a7:8263%5]) with mapi id 15.20.6838.040; Mon, 9 Oct 2023
 11:27:20 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Chao Wei <chao.wei@sophgo.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Jisheng Zhang <jszhang@kernel.org>,
	Inochi Amaoto <inochiama@outlook.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 7/7] riscv: dts: sophgo: add Huashan Pi board device tree
Date: Mon,  9 Oct 2023 19:26:38 +0800
Message-ID: <IA1PR20MB4953857AA6B541C1C3218F66BBCEA@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231009112642.477337-1-inochiama@outlook.com>
References: <IA1PR20MB49531C1C34C3E972DBBA4151BBCEA@IA1PR20MB4953.namprd20.prod.outlook.com>
 <20231009112642.477337-1-inochiama@outlook.com>
X-TMN: [JrogtGcL1oKHfA62cN+wiAZbhjowZcaXHIEsqEIyb/I=]
X-ClientProxiedBy: TY2PR04CA0010.apcprd04.prod.outlook.com
 (2603:1096:404:f6::22) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20231009112642.477337-7-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|PH0PR20MB6129:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d7a42d5-8e81-434f-5b71-08dbc8bab2dc
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aVwncFc/Qlrzb/dKawwHzNNu0riIdJU3e5uo49a3KgFYondXJSArljEK7Fk4o7wsPf1xEEooaaKpl2+vpaLUvxiNAFJlseWEc+zYSpBJ1uaj8aFwCR7MdkUbnNpJAwiV6KK5kPdIjN9AmcUeLozM2l8zzdnOkT9y/zWhI2CVQgMtWdnNPR4EM8omrxabMornDG8vxVIMt57ZNAnM4caaU2rnRzKq5zmUWQZRt3YfJUjv00HOKiSYHj3lzRuaapjkhhpyhY2a+8nxhA5q9hmgPFxV8KvovYlz2ia4Dg7BEObup3p7xO2VyUWLtSW92RgKFQtYy2EveMmyEOO+5IulIFj7K53HnX096PEnCGYQclqmvlGW2JodK496DCqxCZ2b2qfzZvdq0H8S5HxlaBN6dvXuaS+Umjb87e3BGd9oMyQDRw29vSq2OBhVZ3A4BhG/m/uo3VZ+4Wsbv+5nKTjaEvjb+gJgnAdJViBU0cjRBNN0NNu5Ldl0AKADpgQCJnrK5qIntUUNqlH2vtkkQrBwK8W7bVmbPywUMdMdLrNUknTlOUUnrLrVw3Tszn/UN/xCmQxQMIw9wTkMiZFz9l2psyGBZvvopy/CmzCBbDf1bKfuuEnz1KBCj0fT1qxAxQm8vWQLHm3klAx4l6QMfRagqCTuADae/p0TfiHgC+2nMXo=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fhtuuURLyUGAH6PHbB/vtwDMiJdqu9cuGUcdwkJyEXjXFDFUKW/d0R/4Ghky?=
 =?us-ascii?Q?3HYXuEX3hJrSu3BOHlFC2gnI3h5Cf+ni+SNkC0EbSfZ5NSaBo1BNXqGjlkce?=
 =?us-ascii?Q?pakjxRcL1E/FrSfT8hJHjmmiNGrWdTeA4dbh2w4CF2UMyswldjudytpTF++i?=
 =?us-ascii?Q?NfypT17MxxyXdddDbOIE5x809LkCH1bzxLWr37fAGM1BTsN53lnWyQHhOrqs?=
 =?us-ascii?Q?pFCTmXXwNg1BbLj+rv59jZur0WYeuURHCs3D5ZWQdWd6H+uAMDQ5T2UQdFqn?=
 =?us-ascii?Q?HDt0bRHVdAS5BDFzVHcvvBqu8AGe37LPQLN29PFfxsHN3oF/+P1YjYCaG94X?=
 =?us-ascii?Q?Ao39aAO+sDwjQ8l+99JS7lgAdzEHU+98ZDGpoOM7YimlP1vl/xgcj9D8utwB?=
 =?us-ascii?Q?tG1FRy/KCPteIUofmhnqRqiHVCJqIyDkw/+ta9szBD9Ls9dK+d74iFEwHAEt?=
 =?us-ascii?Q?R3PTFJNS5RgRT7SBnDxrfSjFxC2U8d3UD5AgjcCfg1W3oYi/ltcqCH6pwIqW?=
 =?us-ascii?Q?AkozvzoYI+ovP+BpxsuZPaxV4Jy4n17sRrsW3osrg3fIH6Y93Mvj1XMbOCGP?=
 =?us-ascii?Q?ScuEj17PEgHI69nHtbq0/hyLpQp4yZoLfFyPI428/wqRfmt5WWEdLs2D5BRq?=
 =?us-ascii?Q?HeaTlGOejheVUhMmT9BS+viiGlh65ZP7tmxxHVwepyRMUmqfjNkiOXClxGi/?=
 =?us-ascii?Q?P8UvaC/bfnKYDk04qyV8TAZRPp10olVgVE6oMWZU1eipo/fpiXJd/psmgz5F?=
 =?us-ascii?Q?zaeYARbcZHCOyheyo55DqS7rR+ArDd0wuZyLZxxEphkdvsMLXaFYtZhGkHKk?=
 =?us-ascii?Q?UtUfWI0DqHPBxhijbl5VP0Q4gA8nWszQdy44KfFuLY19wW8lJ1rK7+IgmQj3?=
 =?us-ascii?Q?OXAw/Mo3y8mBF9CgVTRfTKiCQouVMtyBBFQ7+mr56WC9MXp+hzU/z4gnxab+?=
 =?us-ascii?Q?tqkqxvyElv7vD0S4BXtEu9RAnRWt1KcSejS3wCoTnLrZCIXTtXA1PJCnCLC5?=
 =?us-ascii?Q?4mZNbZ/DKCL9ZlfNNG8mGVFO95yqRAOgAn3KlUMXcowkXNkxU7FZZgwj1vfm?=
 =?us-ascii?Q?jOWkI5JoBCIYfM8iAuxJxrqciTap253SwaXjnAyJITme/yuly9kcYf/jkxgn?=
 =?us-ascii?Q?i2Gg/4jw9Hx7K/Zr5o39Gs09QyKZlYk7NtxEr5OHLApu0Vwh2c7wsCTfGCVj?=
 =?us-ascii?Q?YDRJBhqZ/BOYb1YNi9G35EKlFXcphOL1+lhmH5rC7jIdWtQCHKkUDxJlXQ4?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d7a42d5-8e81-434f-5b71-08dbc8bab2dc
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2023 11:27:20.3369
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR20MB6129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_042728_871029_B6F87E39 
X-CRM114-Status: GOOD (  12.57  )
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
