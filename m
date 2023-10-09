Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2AFBE95A8E
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 11:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aeJJ5ImDSpwXwDDmVVfMJ2mPvty5mNh7h1g5XG3Ojls=; b=09gHhWW27XSFdu
	AbJ402q/xxiXB6uvpTJVgO+KIi5di/7NhqAAkzJE40QxrlekfSlxyH+Fx/FCklGAWVnzuekb2stBU
	v2VD3E0pnSf8265TurCYMHKfHEAo4SDIM5hASCvHbiPs3iWhgcR46MrpCO/28vgydCgRAQswfg/cn
	pdY7DkqXDYWnkzAFc5aEks0zRY5akV7ekSxGEs3l48LjDVFXoaFHDTXrjb+2WjEx/9Wm+J6xffoYr
	0YoFXV4rDsZHEnxX//iFICDacGsmN18sFgKdpdpzHIJHSfjmqGjoEkaVjRLGhWmapoV7WKoq3AzFD
	IFcgh/pjEb9+Ymd3t+/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpoPx-00ASMl-3A;
	Mon, 09 Oct 2023 11:27:21 +0000
Received: from mail-sn1nam02olkn20813.outbound.protection.outlook.com ([2a01:111:f400:7ea9::813] helo=NAM02-SN1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpoPv-00ASJY-2b
	for linux-riscv@lists.infradead.org;
	Mon, 09 Oct 2023 11:27:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BHhQpcLAkIDYwPu/FShq6LgvPGPf9SQmg0NVa5s2tctK0DovxozvZGJ0VQqyNFab77xIegVB1p6M7H5d2dRHmuxjaLmN5QVZHSahFETVuMf6R9yrCQSc+s3wCluHfcfBEXOxdQMUj6IaTc9wjqEaHOv1OGCj2DZEfY+9XEE2cnDZGEaoRWYzfWPTfUBrLe/ra5RUjoF1OUdu4gcMfUIiSsvguMQqlgiSGuLo2LM4WiIN10IQMnkIiMvQajWA8r6xYNFCMlb6CRGA77kLCUy56B9FT5O+ofrsQkNyZmeXdmbc6I21QO8ztYTiIionqUhVCnBQqbD8xL/18URa9m3aYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2+1BGYS35byXM3ZXqk+EWNZDHTEcSKdJczyWZtjyM8c=;
 b=W+1reOLF/lOwNSs8sgkztst6AQtIVf52vpIp58YwtYtFuLkQJkzGCG/lH+StPKpJZSGl0fAxAueExMSeaUKSJxYwML9FbFIrdF6KeeaUGK8N97e/qfA1HTbsGIeWAIrSL7O00wXr0QY9td16axBuR4sFltjfe+AgdnMVAV/4NKAeJANZFSPS9kMEDEaRrZkxSMthIWsaOaoKBx94bHBRDgjvtQRhH0GMcCYiKw2be2gktlmXJsy4UarfCk+BzDSvnDs03zwZsgeQJ6e2MNFuff+ePGGGHGgNcuenPg8nCcs+8+f5W/dQ3L1GR+7cxBfI0bMo3084aj903PG5EvkY7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2+1BGYS35byXM3ZXqk+EWNZDHTEcSKdJczyWZtjyM8c=;
 b=UOgUp/uDoL4qGPsi4sg9LugDJLQ76v868r4kmTgTTUJ6w1FrfqEzVvaprT+4denEmRWZch158NkXZ/NXvVlxQk/DSh8KMqc7IYQxHCxZWTq8cts5Zl8vE7pjqRm2CXVh3VdKD/AKqjgxvP7dJAjNPCKV7bcF3Hl4Y4VbVoo521xX5q4cF5WI7hm+RwOigAjGmbq/HSC/JuxNG5/rsPgq/I78OD0JpyV+xz2S2EDVtItDxCY2keX0r7YUVcdtG89pPrNxQribMRS6VuC0uX708roI4UgdW+Co0jkd9kGgA+BByhSBBzQ6PSxBM5QQMXZrwidDF6wtmILzPt3HChEhmA==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by PH0PR20MB6129.namprd20.prod.outlook.com (2603:10b6:510:2a2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.37; Mon, 9 Oct
 2023 11:27:12 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::d050:882f:a8a7:8263]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::d050:882f:a8a7:8263%5]) with mapi id 15.20.6838.040; Mon, 9 Oct 2023
 11:27:12 +0000
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
Subject: [PATCH v2 6/7] riscv: dts: sophgo: add initial CV1812H SoC device tree
Date: Mon,  9 Oct 2023 19:26:37 +0800
Message-ID: <IA1PR20MB4953262ABB6EFFBC4B4F932BBBCEA@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231009112642.477337-1-inochiama@outlook.com>
References: <IA1PR20MB49531C1C34C3E972DBBA4151BBCEA@IA1PR20MB4953.namprd20.prod.outlook.com>
 <20231009112642.477337-1-inochiama@outlook.com>
X-TMN: [gN82ku7+V+Gow7wpWdWNQlBBzqIBIoRIZCYd0yusia8=]
X-ClientProxiedBy: TYWP286CA0020.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::7) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20231009112642.477337-6-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|PH0PR20MB6129:EE_
X-MS-Office365-Filtering-Correlation-Id: f85887a1-2fc1-4e33-b26b-08dbc8baadf1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: foFJ4Twe8arYK17s7OUuW5rT7dR/bMR5oDAVL4ANVCjaWVS3vYDlOMVuHBBZNcl7NvHOLERMYb8Px3lD/qP6rYLnuUP4oV7xU8ryjuOTnXYbePlVkswvT3yHzdZNUcxJSRRIoogazJrgPhD9TCDCHrIOKc90ryjN4rMCJWT2nhuKXSPgbYBKeb7V8jEPBxVNAjxPwPcOm30TFD0EjmTKkXd44njn3OdiIslzbixrLEOZDtWzsP1p9PwdqrvH4dJlA/BakAQGoyb6FY/sytJVadrgpxLMP7HzUcMV/4XncypgIdDKmxnV2jZkeqo5UVt7DkRf9O6XCwjdHVbmQZKMnW2HEVyPzZmmrEK3bEF+KKZxVRAiLkKDUovUgrWZ7My4R1HrS0KpSb5kIWwO0mIXnygDpsXqAPc8uuNVSY1p57vWjzacsIoEOvJEv7WyauQ4r6/SVCL1E0Td+kkkCWh7vbk+TtIA2s2g2Lv77FsbM7OqzW3zC3cN1hGJsfUYaDDXHqju0Xxlt20Z4v3oTwojHNEcAN06BuVJ4LzG1ps0LarPnjmdF9iLjNtDsmuxX2vm8E3dBDk/BcY8dpZ741gZE103EJ7rLJHf2fGcY25sKnc3wLcZSU5Nro5GK97y/CsY
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UcFGCkOHv7s3dFGJR/CBRoArxRxd3VK3eToNWlYn6KV7MzlzEkKqDfrXyr7w?=
 =?us-ascii?Q?Afz14C1b6+hnYhJxLMSFHC2jHOUeKq1dG+fAjYMFfC8v52BHNfGBuwu5okrS?=
 =?us-ascii?Q?W+6DRH0mmKkF+CDgvkdqMdtDHnnzHYerFAQEE3eu1JlYS0q3tuRjk+syZtv+?=
 =?us-ascii?Q?Myy86VR0RG/jsRk/fomK8717tE/rCz13hFFMIS+T7q4KV8/AfLekgAmD/ecG?=
 =?us-ascii?Q?fmPmXtwtmXS8fZeYwqy2VauM3MIfShb+vO1vPnyuNKlNVta6a1SBO0UIwuTC?=
 =?us-ascii?Q?fyaL15qA164eUvXkkc0CWektm0ojNRVk9jIouRx7L5KyYTBW0d79V3jfBz5p?=
 =?us-ascii?Q?FbfV6ligloTSWciaN3liXXk12QQ1lG3TmrTgTM4IDo1uPyTnKJXJUXUlq6WN?=
 =?us-ascii?Q?ZInpUMuNgRWv4yB273/o5ubV8GBx5sQV5pmz2qvHXru+i+DzLoB0d1EDg8Ty?=
 =?us-ascii?Q?K+we8mzn1/3ucXbu3ZhIvWoxdYusm386O8bN9bhjIXMuwVhEj56qC7S6x6xN?=
 =?us-ascii?Q?z3XznnIDkqvgzqzT2tHmk+qinl/bQSiANlayvn529QhwsYiuK4anRGGqbWZK?=
 =?us-ascii?Q?xan1OG7aTJ1p4ZIjJkahuKrvdFrO/UpUhL2WcsPpir4RKeXT2XH6Lo3EJUQO?=
 =?us-ascii?Q?I9ZjrvyHeE7VJ+1HDYi9JWAALaJ0COBtBmEN3MDLDP1zu5in803wW6xUKi69?=
 =?us-ascii?Q?hLpJxfAB7GpKjg1E/Y3GxQ5cyNgKI4g1xr7AKb2hxjqGl2gOf51BAR18Igam?=
 =?us-ascii?Q?hxRPMmW4rhx8CocD5/YN9qXJ84GMqeZ+LXrIIYR5kg/VUazqJVvF3fXaWA1K?=
 =?us-ascii?Q?nOlkMwkRAMtEQWZTphQItNuu2P+jge2KS+QGmwV4qnH29nNryMRJnXuaKiN+?=
 =?us-ascii?Q?O4mRhtnh7+PH0dpWji7QJz4KcLxoL8/sNEbh29cnu4HEgS5YsnViH/vNFI8J?=
 =?us-ascii?Q?TTzPMoT7JIxhWfMqVGEuMPgU9HGBvAW9mQmE7QtLLMFSTXd7HfpBnZIA0WGw?=
 =?us-ascii?Q?yFnLtl1VLpae5MqP3fFLhtbiQoa7nNU/cDtz8t2XYnbZidQo//DHZoMXbIi9?=
 =?us-ascii?Q?2XpK5WSyBN/drHF0cwKnFt+GJ/t3jUY/worvye+a+g1nqoQlkNjm6n9hTepD?=
 =?us-ascii?Q?3X4Ojme1MCpXmd0MjWKVy8viejUgf3NsbhK9yv8KtxrwRDQRQXmyC7jQYEhS?=
 =?us-ascii?Q?f68rso70y/knpMroDdNz2Y6yGKuXporTPjCA4+5W5AS4L8/uKeBW7QVgQHs?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f85887a1-2fc1-4e33-b26b-08dbc8baadf1
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2023 11:27:12.3718
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR20MB6129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_042719_859613_303619E8 
X-CRM114-Status: GOOD (  10.36  )
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

Add initial device tree for the CV1812H RISC-V SoC by SOPHGO.

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
---
 arch/riscv/boot/dts/sophgo/cv1812h.dtsi | 36 +++++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 arch/riscv/boot/dts/sophgo/cv1812h.dtsi

diff --git a/arch/riscv/boot/dts/sophgo/cv1812h.dtsi b/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
new file mode 100644
index 000000000000..3864d34b0100
--- /dev/null
+++ b/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
@@ -0,0 +1,36 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2023 Inochi Amaoto <inochiama@outlook.com>
+ */
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include "cv180x.dtsi"
+
+/ {
+	compatible = "sophgo,cv1812h";
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x10000000>;
+	};
+
+	soc {
+		interrupt-parent = <&plic>;
+
+		plic: interrupt-controller@70000000 {
+			compatible = "sophgo,cv1812h-plic", "thead,c900-plic";
+			reg = <0x70000000 0x4000000>;
+			interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 9>;
+			interrupt-controller;
+			#address-cells = <0>;
+			#interrupt-cells = <2>;
+			riscv,ndev = <101>;
+		};
+
+		clint: timer@74000000 {
+			compatible = "sophgo,cv1812h-clint", "thead,c900-clint";
+			reg = <0x74000000 0x10000>;
+			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>;
+		};
+	};
+};
--
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
