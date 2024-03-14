Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4601DC54E5D
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Mar 2024 06:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CuFxzCkBS+hAmW3W/rNGK9HDVlQfJZ57SPAWworihn0=; b=aK+WdYmBja9YRa
	ehDRqJTfIJOMBNPcuyY6F5bqiZ3z0jVWMM2VS91Ee2iJaR/SCjd2o77qDqE3+YpV6/qgDz1yp7ycW
	CfPfXeFYLcYimto+MjfSuXM7wjqyzH4y8du3ZeEFw4Z2W38ZeFiOHerjU4cbbC90PHfX9etcTQP1Q
	9Q4OEy7ma0AKmRMhWtedXAOeQXbg3aI9NvF5QGomJ/F9ErRKk6sQodf3R13OVulJQpNGDDuog0Nad
	2oV53eAC0PkuI9s6gQbDHejrrUr/SfAhIsY45xe3SFpzR4AMkpIKGvrVERTojs2TbNFrLSFhQbUdM
	TYViEQQU+f5wZLYhLr9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkeKd-0000000DBfG-1ANG;
	Thu, 14 Mar 2024 06:12:47 +0000
Received: from mail-bjschn02on2071a.outbound.protection.partner.outlook.cn ([2406:e500:4440:2::71a] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkeKa-0000000DBct-2mlT
	for linux-riscv@lists.infradead.org;
	Thu, 14 Mar 2024 06:12:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dV9ulM+H+1YE45mgeHZNFvUIQV2w++n03G8Bf8weCrEDC9ssrtvVLwjMo4MA/dQTK1H5WS8uFhmH4P06ADx9UXGOAXfsXI+jXMfE3sO/ZYQ8shb9BJ+qgoNQesMdN2pQ3715fY0pSHDq1hjprHowcpsYelNCrbon3wal1RZREKf0/1BJO203DsWI32oRI/GxFaUkKnIDspzNAsLRZIKaTArhnYamntIrn6tCiATzVPaO7Ed0/kfMqdMzYWErnJ/NAtF2IWmXkVl4Ry+mnn7y9rAuG38EB5ryiW+lJiXQGd+ArZ1FZ4ZJ9vXdiodqFAiRPERcciIQm4cvBqzJfoILIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tCp8ZsGmMS+EoPESOEX1901ZFRhlU7sve5h9K5kYCAg=;
 b=gLDJ7Q0rsWE55mY3z4zOd095WVhI8Fb08VIEs8Rj6oSSryOTVvv8Ytez0Uc703wNLX6z9tpI3Oxpvu4LrfA0CGk/HcHwrM6LMlt8agFJd2W1xz4q8CjJ0CgTweL5jLCL26GsEXH0YBNczIGZLfA/n+XF2bzDI+VK9ND9Rw9MmLuwelrOO3GA75dc1pIUGnW8blWHzjPDWblPwtvDzw5VqqQY7voTn1a6xZLNtVSJmq9yCBDFB18JGodGP3hF+nsJWjfddmOQ8KFni+OxIAyoJ0VfiG250zrkhTOCl+ZDASqyoIPYrX39IH11Mtr0yr8VYQRmaQiPTk39rmXjXyhoJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from BJXPR01MB0838.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:1b::23) by BJXPR01MB0711.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:18::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.34; Thu, 14 Mar
 2024 06:12:31 +0000
Received: from BJXPR01MB0838.CHNPR01.prod.partner.outlook.cn
 ([fe80::a038:3f49:b470:9207]) by
 BJXPR01MB0838.CHNPR01.prod.partner.outlook.cn ([fe80::a038:3f49:b470:9207%4])
 with mapi id 15.20.7386.017; Thu, 14 Mar 2024 06:12:31 +0000
From: Joshua Yeong <joshua.yeong@starfivetech.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	geert+renesas@glider.be,
	joshua.yeong@starfivetech.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	conor.dooley@microchip.com,
	alexghiti@rivosinc.com,
	evan@rivosinc.com,
	ajones@ventanamicro.com,
	heiko@sntech.de,
	guoren@kernel.org,
	uwu@icenowy.me,
	jszhang@kernel.org,
	conor@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	leyfoon.tan@starfivetech.com,
	jeeheng.sia@starfivetech.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 2/4] riscv: errata: Add StarFive alternative ports
Date: Thu, 14 Mar 2024 14:12:03 +0800
Message-Id: <20240314061205.26143-3-joshua.yeong@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240314061205.26143-1-joshua.yeong@starfivetech.com>
References: <20240314061205.26143-1-joshua.yeong@starfivetech.com>
X-ClientProxiedBy: NT0PR01CA0015.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510::9) To BJXPR01MB0838.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:1b::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BJXPR01MB0838:EE_|BJXPR01MB0711:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ae60e8c-ccdc-4ee9-3c21-08dc43edbb5e
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jRv/wUwZUR3VZ/aUWcrGXT8mgjVTa3y2ylOogt0WKIDOaCW4BTw6RUiPpD5lpRm8IC71kgMCertMIv59m3gZahcNs1l81otMRCrD4+rYSe+rc7lLj+31xmJ64Isit0AKk3LIrEa53d1fKl1c9SaWCAS1FMaG+tXuvdKQUlT4zpdyWqs1FHHc6wzEUhXnT01Mc5l53ICGaRPZ++XzF+HskRWKCkC7+bf6m5fPObwAPzZRmSn7ieIbmQcikO/GKvwG1BSlXKTxSM1v3q88DO/2hnhbI5wUNdgEfTD3m02LJcxtX7+FgVG20aNu0HCi9kK/9KZIS2IAfwpBzgys0HB/BCCwU9pDk6uAIwanp4xEbv03rdDxEk/8JcgW8rtQuE9+bUUHgPZm+Zwz9NC8UTnxLPVhyY5zitHadsvs/q50NSaSG1MQ/dwWLKhCC/NuDivNGV9rQSWYa5+KX9ljwfuiF3wvYn4TvCnC6+kiIVEYaMxlle6Wr9shq00bzk1UBrEB4zlSy7pEq2UXkrw7DYGKtdZr0j0OF4E+WhfzqAwshWsvAsUvMilEgTiaHRAzeqLKYO4+h3KfQTmU7Gh1wBGT3nxVL+MjmbIVIPvk0qN69YYyzJFobAZ/25UG/E57Mo2AmKO3FnJsrHUZXzbmKb18tw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BJXPR01MB0838.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230031)(7416005)(41320700004)(1800799015)(52116005)(921011)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?P6YfhrDAL4SS63zKqrpMmt0hq6azCqEvBA2f17af37EsotOWbOc7a1rLW1eT?=
 =?us-ascii?Q?wkDTzigX0kWB/01RotB55B6l2UeBM6/EieccYldu5AB36wcJ4c/HyCamW/8d?=
 =?us-ascii?Q?a+tUG5qNfe0R9zZCC/NRGD3ugtWVETsXfGa+bGT/gsbA6DZzjca9OJ3Gll6R?=
 =?us-ascii?Q?qwEZxgcaKmlqxmsBQ+LFnviqxOFcIS5afuaBQnYIiayGsetwD/FMQHvW3nRx?=
 =?us-ascii?Q?XQNLGsnmNfuL6kyBL4kOmXwRlj9Y3IcLGoqUOlA8meUlVEPWyf0oRa1ZrEG8?=
 =?us-ascii?Q?Hw0DZJyMTbQVxl2TmmF0QCt6KiAbSHQ6wGbPfFY81dt6lXeGzeKbj6Yh1pfM?=
 =?us-ascii?Q?nim8c13tMlFYLs2Xrke0VAgY38Z7uPWtPRWf5P/TYU00yK+MDLKGW6o8ZygQ?=
 =?us-ascii?Q?Zr0/yqKZP+ZzGdl8BWXZYSQorzL6geKesu2vJpI+Y8Rq0T9Wo1voTDC9vXN2?=
 =?us-ascii?Q?tp4m7x3eAI3aG3/2Iyz6vlA7P+9rAyxeADGAGlYf5mrnBwUY5gTnryo9NQaw?=
 =?us-ascii?Q?A+r6ZLASuy7XrjnAxTG14y28eSG0Jm7ep18A/YwQk5sraHCLb3pk8Fd3CC1B?=
 =?us-ascii?Q?iv8lY8qDyNeTcNUZNOPgfK6QBPGbQJ6d3tHpDltv3ljjjiwJZvFYnbceY9LU?=
 =?us-ascii?Q?gS0lpsQdq1JmbWUYFsOa0e6P2GwwWmi2DPxOjrrRf0YoqcllUzNtmecJvAUh?=
 =?us-ascii?Q?zu5o869toiAEtL0EEWnSMKngG00prrxpOT0S2EqCxD7DcCtNDBta75JY1FxZ?=
 =?us-ascii?Q?g/UA2nyJNn/WmvzKtTxUzM8Bn7WkDEDTNkuVTIvYYajLypwXjjdRoQ1iJTxw?=
 =?us-ascii?Q?QJbTKRgPdAM0oqEiojpf72AFB8iHV0QftNUVIN5o6gmrvXOIAQnLndawvE5m?=
 =?us-ascii?Q?MbC4dzqdZ4g2ObvaKpYlFs3fcOIdwY297oBq2W4xzFhvKPwNJLx3kZyL0PQ3?=
 =?us-ascii?Q?DjhUx940mGiJmI6cC1/s2nCjB8opvwIUKp9MO3KTq2TxUlQjLEyxiznv/XiW?=
 =?us-ascii?Q?xKMQtEYvSyBxX/D524ruhuOxJrv03RuzAJq8Acuo9RHG3O+YLAokao8baQA7?=
 =?us-ascii?Q?E805dSq/IsooZBUBu1TFmtwBu93roCW4hftpqmQpoAJXKORncaj24Qc9CHpD?=
 =?us-ascii?Q?+D1K1ZdVPHSQwAZAC5VfnCovs94142eEPODTO6hc/ZAr/m5EtM8nNAXiEzNO?=
 =?us-ascii?Q?jQDqoCkwczwTOCi5KjlbhrCczRzrc1WfVYFqAov6KMIssk3DS3BWMA4i7s0M?=
 =?us-ascii?Q?Nz72nG7CQryn84LI1XzYVqB1DaD+NzGAAhHRc9n1531a18thS29QVyckIcii?=
 =?us-ascii?Q?LLFynypGPC5xkSLRsN7HUx+QzZHGcW523L+X1o7vx8drYgYKiUqLccicF4bt?=
 =?us-ascii?Q?sEb8Whqxzc5HjM7kBPcoHfjteQ86Oh5vbDwAAPBlKCKuFn40bikCq7TyWlWz?=
 =?us-ascii?Q?47hjuc97C1Ipv/OBmUX2Uhj5uD9M0EbEHqpTb2nUKgIam43mIF+BgPXMw6mF?=
 =?us-ascii?Q?MRVZ0FyxnF9/NDFrrt1tI9vZY0s9tuGRfs7JgqNcRBoYFEC8fEBS1X3VT/qa?=
 =?us-ascii?Q?YLrDC3eCk25qMQCDjvHw1RoHo8YagrXiY6WI60UlzZkQLa9L/bi5uMA26xLm?=
 =?us-ascii?Q?6k4gDIRmpjJ9tt2GLyt+1M8=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ae60e8c-ccdc-4ee9-3c21-08dc43edbb5e
X-MS-Exchange-CrossTenant-AuthSource: BJXPR01MB0838.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2024 06:12:31.0650
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r2IisVnHXORhUc9vwcZhqZ9DdtqRB0Oxfh6bPMVKvPX5EIbonT8BwvOqlSFSHhxmty9/eq2caYdkiPk1RlkF/EDe/kjlnEfjnCCBV1BmiD0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BJXPR01MB0711
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240313_231244_734441_60FC60D4 
X-CRM114-Status: GOOD (  18.50  )
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

Add required ports of the Alternative scheme for
StarFive CPU cores.

Signed-off-by: Joshua Yeong <joshua.yeong@starfivetech.com>
---
 arch/riscv/Kconfig.errata            | 21 ++++++
 arch/riscv/errata/Makefile           |  1 +
 arch/riscv/errata/starfive/Makefile  |  1 +
 arch/riscv/errata/starfive/errata.c  | 95 ++++++++++++++++++++++++++++
 arch/riscv/include/asm/alternative.h |  3 +
 arch/riscv/include/asm/errata_list.h |  5 ++
 arch/riscv/kernel/alternative.c      |  5 ++
 7 files changed, 131 insertions(+)
 create mode 100644 arch/riscv/errata/starfive/Makefile
 create mode 100644 arch/riscv/errata/starfive/errata.c

diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
index 910ba8837add..1438dd09533b 100644
--- a/arch/riscv/Kconfig.errata
+++ b/arch/riscv/Kconfig.errata
@@ -53,6 +53,16 @@ config ERRATA_SIFIVE_CIP_1200
 
 	  If you don't know what to do here, say "Y".
 
+config ERRATA_STARFIVE
+	bool "StarFive errata"
+	depends on RISCV_ALTERNATIVE
+	help
+	  All StarFive errata Kconfig depend on this Kconfig. Disabling
+	  this Kconfig will disable all StarFive errata. Please say "Y"
+	  here if your platform uses StarFive CPU cores.
+
+	  Otherwise, please say "N" here to avoid unnecessary overhead.
+
 config ERRATA_STARFIVE_JH7100
 	bool "StarFive JH7100 support"
 	depends on ARCH_STARFIVE
@@ -72,6 +82,17 @@ config ERRATA_STARFIVE_JH7100
 	  Say "Y" if you want to support the BeagleV Starlight and/or
 	  StarFive VisionFive V1 boards.
 
+config ERRATA_STARFIVE_CMO
+	bool "Apply StarFive cache management errata"
+	depends on ERRATA_STARFIVE && MMU
+	select RISCV_DMA_NONCOHERENT
+	default y
+	help
+	  This will apply the cache management errata to handle the
+	  non-standard handling on non-coherent operations on StarFive cores.
+
+	  If you don't know what to do here, say "Y".
+
 config ERRATA_THEAD
 	bool "T-HEAD errata"
 	depends on RISCV_ALTERNATIVE
diff --git a/arch/riscv/errata/Makefile b/arch/riscv/errata/Makefile
index 8a2739485123..4713a686b9f7 100644
--- a/arch/riscv/errata/Makefile
+++ b/arch/riscv/errata/Makefile
@@ -4,4 +4,5 @@ endif
 
 obj-$(CONFIG_ERRATA_ANDES) += andes/
 obj-$(CONFIG_ERRATA_SIFIVE) += sifive/
+obj-$(CONFIG_ERRATA_STARFIVE) += starfive/
 obj-$(CONFIG_ERRATA_THEAD) += thead/
diff --git a/arch/riscv/errata/starfive/Makefile b/arch/riscv/errata/starfive/Makefile
new file mode 100644
index 000000000000..2d644e19caef
--- /dev/null
+++ b/arch/riscv/errata/starfive/Makefile
@@ -0,0 +1 @@
+obj-y += errata.o
diff --git a/arch/riscv/errata/starfive/errata.c b/arch/riscv/errata/starfive/errata.c
new file mode 100644
index 000000000000..3ee360cd5e81
--- /dev/null
+++ b/arch/riscv/errata/starfive/errata.c
@@ -0,0 +1,95 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Erratas to be applied for StarFive CPU cores
+ *
+ * Copyright (C) 2024 Shanghai StarFive Technology Co., Ltd.
+ *
+ * Author: Joshua Yeong <joshua.yeong@starfivetech.com>
+ */
+
+#include <linux/memory.h>
+#include <linux/module.h>
+
+#include <asm/alternative.h>
+#include <asm/cacheflush.h>
+#include <asm/errata_list.h>
+#include <asm/patch.h>
+#include <asm/processor.h>
+#include <asm/sbi.h>
+#include <asm/vendorid_list.h>
+
+#define STARFIVE_JH8100_DUBHE90_MARCHID	0x80000000DB000090UL
+#define STARFIVE_JH8100_DUBHE90_MIMPID	0x0000000020230930UL
+#define STARFIVE_JH8100_DUBHE80_MARCHID	0x80000000DB000080UL
+#define STARFIVE_JH8100_DUBHE80_MIMPID	0x0000000020230831UL
+#define STARFIVE_JH8100_L3		0x40
+
+static bool errata_probe_cmo(unsigned int stage, unsigned long arch_id,
+			      unsigned long impid)
+{
+	if (!IS_ENABLED(CONFIG_ERRATA_STARFIVE_CMO))
+		return false;
+
+	if ((arch_id != STARFIVE_JH8100_DUBHE90_MARCHID ||
+	    impid != STARFIVE_JH8100_DUBHE90_MIMPID) &&
+	    (arch_id != STARFIVE_JH8100_DUBHE80_MARCHID ||
+	    impid != STARFIVE_JH8100_DUBHE80_MIMPID))
+		return false;
+
+	if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
+		return false;
+
+	riscv_cbom_block_size = STARFIVE_JH8100_L3;
+	riscv_noncoherent_supported();
+
+	return true;
+}
+
+static u32 starfive_errata_probe(unsigned int stage,
+			      unsigned long archid, unsigned long impid)
+{
+	u32 cpu_req_errata = 0;
+
+	if (errata_probe_cmo(stage, archid, impid))
+		cpu_req_errata |= BIT(ERRATA_STARFIVE_CMO);
+
+	return cpu_req_errata;
+}
+
+void __init_or_module starfive_errata_patch_func(struct alt_entry *begin,
+					         struct alt_entry *end,
+					         unsigned long archid,
+						 unsigned long impid,
+						 unsigned int stage)
+{
+	struct alt_entry *alt;
+	u32 cpu_apply_errata = 0;
+	u32 tmp;
+	u32 cpu_req_errata;
+
+	if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
+		return;
+
+	cpu_req_errata = starfive_errata_probe(stage, archid, impid);
+
+	for (alt = begin; alt < end; alt++) {
+		if (alt->vendor_id != STARFIVE_VENDOR_ID)
+			continue;
+		if (alt->patch_id >= ERRATA_STARFIVE_NUMBER)
+			continue;
+
+		tmp = (1U << alt->patch_id);
+		if (cpu_req_errata & tmp) {
+			mutex_lock(&text_mutex);
+			patch_text_nosync(ALT_OLD_PTR(alt), ALT_ALT_PTR(alt),
+					  alt->alt_len);
+			mutex_unlock(&text_mutex);
+			cpu_apply_errata |= tmp;
+		}
+	}
+
+	if (stage != RISCV_ALTERNATIVES_MODULE &&
+	    cpu_apply_errata != cpu_req_errata) {
+		pr_warn("WARNING: Missing StarFive errata patches! \n");
+	    }
+}
diff --git a/arch/riscv/include/asm/alternative.h b/arch/riscv/include/asm/alternative.h
index 3c2b59b25017..8f5e6883db97 100644
--- a/arch/riscv/include/asm/alternative.h
+++ b/arch/riscv/include/asm/alternative.h
@@ -51,6 +51,9 @@ void andes_errata_patch_func(struct alt_entry *begin, struct alt_entry *end,
 void sifive_errata_patch_func(struct alt_entry *begin, struct alt_entry *end,
 			      unsigned long archid, unsigned long impid,
 			      unsigned int stage);
+void starfive_errata_patch_func(struct alt_entry *begin, struct alt_entry *end,
+			     unsigned long archid, unsigned long impid,
+			     unsigned int stage);
 void thead_errata_patch_func(struct alt_entry *begin, struct alt_entry *end,
 			     unsigned long archid, unsigned long impid,
 			     unsigned int stage);
diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
index ea33288f8a25..1cd5ba3a1466 100644
--- a/arch/riscv/include/asm/errata_list.h
+++ b/arch/riscv/include/asm/errata_list.h
@@ -22,6 +22,11 @@
 #define	ERRATA_SIFIVE_NUMBER 2
 #endif
 
+#ifdef CONFIG_ERRATA_STARFIVE
+#define	ERRATA_STARFIVE_CMO 0
+#define	ERRATA_STARFIVE_NUMBER 1
+#endif
+
 #ifdef CONFIG_ERRATA_THEAD
 #define	ERRATA_THEAD_PBMT 0
 #define	ERRATA_THEAD_PMU 1
diff --git a/arch/riscv/kernel/alternative.c b/arch/riscv/kernel/alternative.c
index 319a1da0358b..deedd4b76472 100644
--- a/arch/riscv/kernel/alternative.c
+++ b/arch/riscv/kernel/alternative.c
@@ -52,6 +52,11 @@ static void riscv_fill_cpu_mfr_info(struct cpu_manufacturer_info_t *cpu_mfr_info
 		cpu_mfr_info->patch_func = sifive_errata_patch_func;
 		break;
 #endif
+#ifdef CONFIG_ERRATA_STARFIVE
+	case STARFIVE_VENDOR_ID:
+		cpu_mfr_info->patch_func = starfive_errata_patch_func;
+		break;
+#endif
 #ifdef CONFIG_ERRATA_THEAD
 	case THEAD_VENDOR_ID:
 		cpu_mfr_info->patch_func = thead_errata_patch_func;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
