Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52C8CCD37B0
	for <linux-riscv@archiver.kernel.org>; Fri,  8 May 2026 05:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D7Z7cxcgwM9VWTtFX6q1OidhGxGQGR1GlbnC6iaNN5U=; b=Hq0xM5h/1nk7QA
	4tx41CAxDNgbgxW/lMX+q+rv5Bz//0RQ3eTzyc1hdYRS7T6l+PhrLtlfEH7K2xW5PFWV8NelFFJcB
	g3b9s4m7TfHYFIO04/BjbQ18KOfflpHevAFmq/UMNmzgiRPrY+vEGQD0qtOD2DGfog+NlGSAwQG3q
	PjNTX02OPJYZiZrwXgDlYx+oGHp07e3zJsc4517AP51mA59ONnua0zYZ2GrsPA1nW38kqlY04hxnH
	HmTS6yxkzKnodlcy8c4O9pogi2cvRMyK0zXjgACDzsL5tLd2mWSheVBerVRrBm+7hZGRocTOathFX
	GWCwBTY/xyADbfSElP8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLDtn-00000005cWk-0uSX;
	Fri, 08 May 2026 05:37:19 +0000
Received: from mail-sh0chn02on2099.outbound.protection.partner.outlook.cn ([139.219.146.99] helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLDth-00000005cUH-1KjG
	for linux-riscv@lists.infradead.org;
	Fri, 08 May 2026 05:37:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KPbRi7++V+oqZUImxguXiHuremuKY5iqtScT90tr624enpgHTcKGYrBEEKTGwVSljgymuidS+H4+Y9EqFjd8XDUEA7WOzMLLin+6btwOWpRxbwbhfP/HfgzlMu7seyaXACxl/aaa/WYigCFw/mzFWwnJGjSytQF3qCDMWnFd/6FXZcslrGdFZLbBCkNp6LI7YHrILX0Inogj+u9n4X/6QXqMsZJyw9taQmE0kMKOU9RP2XaLTM5lC93CS1U/FeoXgGkrJ4g93giX7W1sbg8LfdbJ1RiPx2nlAHdriHG5g27hu0MjZywUyNdlKu/oT76HwCP++YP1n0Zn4KX31tfKaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DKYhONsjjCPjvcgI9a6Eumr+0laaJvIfwRXxF+oP7TI=;
 b=DKwrTXYd7jQapudsz8ediQFzlg7MJsuXFhs2q8IHKTsMK5AF/1/Jmhpki+5aLglccOJyy9EBmi7KBpSvDLfywFwtIS3dQvYVIeGmt40q8k9BN8Lxx7a+hood800uoz89YXDtr5dBMYcxmrl+mX/GIu84Y1o9D2xrBzUKT+WiJDSZJyPUIuGf+AjTe+aYcFeMHRUwR9GImuall7ejjsWn0JWVjfx9yliF0IUww4pRtcLmRECyJuOqu4xF+ddqiAFs6aJxb56PTC8w2STbEPc4ZB9wxSrictXTacytKsfPqB4lmtqcl41YD3J8DK9CDlFiJw8d0uNt+U1AJNjWYLtLvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1236.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:14::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.17; Fri, 8 May
 2026 05:36:42 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9891.019; Fri, 8 May 2026 05:36:42 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	netdev@vger.kernel.org,
	Sia Jee Heng <jeeheng.sia@starfivetech.com>,
	Hal Feng <hal.feng@starfivetech.com>,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v2 01/22] reset: starfive: Rename file name "jh71x0" to "common"
Date: Thu,  7 May 2026 22:36:11 -0700
Message-Id: <20260508053632.818548-2-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260508053632.818548-1-changhuang.liang@starfivetech.com>
References: <20260508053632.818548-1-changhuang.liang@starfivetech.com>
X-ClientProxiedBy: NT0PR01CA0035.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:c::12) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1236:EE_
X-MS-Office365-Filtering-Correlation-Id: c8ed4dfa-3d6f-46b3-5f2d-08deacc3c90b
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|38350700014|921020|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: BNSoQttCuOdyGtB4dxOGHlLWuzrWsa4/it/DFcEiTLZ/yo/ja3lzHk1aFWENP2N6dJl10LhnQ/dCkGBEbZU64vsTX9pO5sv4lee9Xoj4nkQbVsjOYxIGozg5B67E0SHJ3AXbBQkh3NJzAzAclD9VpgRjtA9SZ03fRn+1VB6f1ecPjGl+gvvKLK1cPjpEkX53yYfetLlWNlQRopz6VtXf95BN3688cYqp7Sg4EdMX9DlholSq9M3lUb52gQjHCvgYKHDFg1qNhccdW9/lnn4kiaDmYd4FsRXmMcSBDnEpeeX/DClHkqMLQiQc697HPfkGIppO9eJUt8BL3DJv2v0SkPpxF//ci1aYQM5ovE3PjvGXvYtJ3KAG0ZpTAtpH2yiPIUc+1x0MHk+kcAYqIuTJwio6eS7b0x8+dMzpOFyr3DOr2JwLUdyD27cI4X2H+VgxNHX1ETF5dHaZKFb2knxL0lD9DL+vAZ0HpXk54UzL6bwu8nC95Wmk1C69ck95eMUO7lVocHa8wkn9J4v79RwRv4EePtJNQboXPhgvSHX0Oq0pRienDi1PSoEc0/1dO2ueH2ZFnbsubehOE+ITelEz/g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(38350700014)(921020)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?akNbNHpqRfk1Z9dbJrhh68VBmD/71FOi04OfF5bJm6s7hVsaVrd4zELTnzml?=
 =?us-ascii?Q?dOfXeOPxIQUt90v05pHxjSp1Tk1AWn3lY/1S4aAV3GKjwWM1aIccJcbNczni?=
 =?us-ascii?Q?+gn8LQtG1xSdt9zQVt0wWzTz2Qa21iaEuDtE/8IycDJzFeuaUSsurHe7qVXq?=
 =?us-ascii?Q?WR+prDDHrDuc/saM5K1lqXO6n9hAXd+f7cVnb6VwiqorUvezu0OFlCycewfp?=
 =?us-ascii?Q?HT8yB/54kAz4iLKwabPd9aLI+aM+Bz5xp0eElTV91qDkNGxA5iMAtHkyAMAB?=
 =?us-ascii?Q?YmGMGpYJCQCiYj7yC0Xy5gJjOvtYJOL4sRE27Ue2CmlyRSy1vwrTggtGDyfS?=
 =?us-ascii?Q?YTvoscO5J3Q4xD+3cSvA7NG2Y6lVf1anvT5QJ6KZEtmJahjVZdbqtzTLiApf?=
 =?us-ascii?Q?tVEjj/fKkXMYXBAuepxNarIWGdp82ds3Gy5Jh6+aUVP9lP/sQtUePV2TVild?=
 =?us-ascii?Q?ewiRmnGKU4blYXq8QXpYCFjfxyqd0OZLkuy+L00t00tblJjjR0nFm4pJ6m/a?=
 =?us-ascii?Q?WdeMNxaneXXRNmZJ4lYszC6hdoQaIgtFXpvyaHxjoO4ErjCL5APX2QAoKwwS?=
 =?us-ascii?Q?FMjtJh0HAWOk1jvC5sLgZNVaZTZaeDO1YC8mnVsoFQrUm1gbWpsUEu2o2VGP?=
 =?us-ascii?Q?b7sdNv9Ukks5eWDW0Bi2IXdoLHT6DZCEanzEaW98O7mAmlv0ha45UCOoxyEO?=
 =?us-ascii?Q?deG5r6ESvl1n0IxQpJyU4samn/4+XsSgZFDHau7vvK5LY2gVeICUcfqP/kJL?=
 =?us-ascii?Q?TZX0u1ES06tarylxkIZ5Q9T7D31NcmP2vAvacBDs7KrFRIsIIYoe94f8VONz?=
 =?us-ascii?Q?z8XKEDIVkut/uRUF7iDKdS3wmNl/8wIYs5NWOmtBFb/9wZhDowHQXJLgxvNX?=
 =?us-ascii?Q?n/7oc5MOYYh5fyXiUlN8YSHd0XzqVV151tAj3s4tEbugQpDqsQd3BhsffK9L?=
 =?us-ascii?Q?noCt0mta3gLAxZ4CkMDlLzvlr1lF0+8MV7yWgsk+ymLkeSkUzRDK8KhisEnI?=
 =?us-ascii?Q?G1lgqzZNgSWxFe18P2Q86wPWgCx1Ldt0P8BsyDKuhq9JwRPPE7Dul191xVdo?=
 =?us-ascii?Q?Hq7K/Otqm7vzo9ghLZaIa318Go2p+ibf7053VnXrkRG6BmXSNKJCdKefTcR6?=
 =?us-ascii?Q?mWeIDGPofV1LHjaX5LiCRcmTd1IOSNzZ9+O45KErwic1ToW7supxe+sCATYN?=
 =?us-ascii?Q?2a7BE46SoW7d1Z3j6a2UrTyO1ZvPlyQ/ty1kHeZ0Oe8hCI0l3nMZvjMTzzid?=
 =?us-ascii?Q?KiARh+hxJC1rac6+J/p98WwB9ia7GeuR6AWC7H5ZHhWsaUrbFwpyHAJoMN9g?=
 =?us-ascii?Q?TrH2NVV7M21Lefm26T/v7cFEhjPk1WqSEGwUEY+sd66ohOon8djfDNvi6IBm?=
 =?us-ascii?Q?pTm7k8ZwEwUgycvj/CEIEttlaNCR1HeajNV+MRdeu6yDhcU4arBIQy26H7kA?=
 =?us-ascii?Q?FONqp2rRwlSxNKmT5D5STqA+5Aw65PyunLX13u6ZhhzQDRDUrPwlzkW3eRCj?=
 =?us-ascii?Q?Xy6GfnDKt2Km1yJD8ck2DZRsA4rizUpirZgnU6ZSP88mzOlFHcFhmLFr9fEg?=
 =?us-ascii?Q?GZLO40EsegxQxSZEtYqCc29UEeqLQcxgvnVtlFnvhi/ht1g5aECRBg5eNbfD?=
 =?us-ascii?Q?GMpUwQj/6/ENJV5tUhCZkmM7cEDsdQ9Xdp70QZ+BBjShlSKq7qNMuWzHsK7J?=
 =?us-ascii?Q?pTs6hhLO+sWyLSZmzce+Lf5dxT0zqAVufmqnMGFGeJl9a1G0Wp9T4K8OxDQC?=
 =?us-ascii?Q?HJ0MQpQfbhpZwdnjQ85Z4QfyLf2DWNclXLU9arGvV+2ufs3JVEOG?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8ed4dfa-3d6f-46b3-5f2d-08deacc3c90b
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 05:36:42.5873
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uLnapLeGOUCUokHPiGhtSzZTA5m0pdRKC3hYpkXfqOLbYzvZj1V5TWTaOdQUWwyZeyCea3otN8enuoa2rAtRELeLhef8Eu3IwQiNqBKNBbRhR9Qq02Ur2KZrJbZOs3vd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1236
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_223713_403499_0BCD1DDA 
X-CRM114-Status: GOOD (  12.18  )
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

From: Sia Jee Heng <jeeheng.sia@starfivetech.com>

StarFive JHB100 shares a similar clock and reset design with JH7110.
To facilitate the reuse of the file and its functionalities, files
containing the "jh71x0" naming convention are renamed to use the
"common" wording.

Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/clk/starfive/clk-starfive-jh7110-sys.c              | 2 +-
 drivers/reset/starfive/Kconfig                              | 6 +++---
 drivers/reset/starfive/Makefile                             | 2 +-
 .../{reset-starfive-jh71x0.c => reset-starfive-common.c}    | 4 ++--
 .../{reset-starfive-jh71x0.h => reset-starfive-common.h}    | 6 +++---
 drivers/reset/starfive/reset-starfive-jh7100.c              | 2 +-
 drivers/reset/starfive/reset-starfive-jh7110.c              | 4 ++--
 .../{reset-starfive-jh71x0.h => reset-starfive-common.h}    | 4 ++--
 8 files changed, 15 insertions(+), 15 deletions(-)
 rename drivers/reset/starfive/{reset-starfive-jh71x0.c => reset-starfive-common.c} (97%)
 rename drivers/reset/starfive/{reset-starfive-jh71x0.h => reset-starfive-common.h} (75%)
 rename include/soc/starfive/{reset-starfive-jh71x0.h => reset-starfive-common.h} (81%)

diff --git a/drivers/clk/starfive/clk-starfive-jh7110-sys.c b/drivers/clk/starfive/clk-starfive-jh7110-sys.c
index 03c17cd2032f..edf4c45e6ff0 100644
--- a/drivers/clk/starfive/clk-starfive-jh7110-sys.c
+++ b/drivers/clk/starfive/clk-starfive-jh7110-sys.c
@@ -14,7 +14,7 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 
-#include <soc/starfive/reset-starfive-jh71x0.h>
+#include <soc/starfive/reset-starfive-common.h>
 
 #include <dt-bindings/clock/starfive,jh7110-crg.h>
 
diff --git a/drivers/reset/starfive/Kconfig b/drivers/reset/starfive/Kconfig
index d832339f61bc..29fbcf1a7d83 100644
--- a/drivers/reset/starfive/Kconfig
+++ b/drivers/reset/starfive/Kconfig
@@ -1,12 +1,12 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
-config RESET_STARFIVE_JH71X0
+config RESET_STARFIVE_COMMON
 	bool
 
 config RESET_STARFIVE_JH7100
 	bool "StarFive JH7100 Reset Driver"
 	depends on ARCH_STARFIVE || COMPILE_TEST
-	select RESET_STARFIVE_JH71X0
+	select RESET_STARFIVE_COMMON
 	default ARCH_STARFIVE
 	help
 	  This enables the reset controller driver for the StarFive JH7100 SoC.
@@ -15,7 +15,7 @@ config RESET_STARFIVE_JH7110
 	bool "StarFive JH7110 Reset Driver"
 	depends on CLK_STARFIVE_JH7110_SYS
 	select AUXILIARY_BUS
-	select RESET_STARFIVE_JH71X0
+	select RESET_STARFIVE_COMMON
 	default ARCH_STARFIVE
 	help
 	  This enables the reset controller driver for the StarFive JH7110 SoC.
diff --git a/drivers/reset/starfive/Makefile b/drivers/reset/starfive/Makefile
index 7a44b66fb9d5..582e4c160bd4 100644
--- a/drivers/reset/starfive/Makefile
+++ b/drivers/reset/starfive/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
-obj-$(CONFIG_RESET_STARFIVE_JH71X0)		+= reset-starfive-jh71x0.o
+obj-$(CONFIG_RESET_STARFIVE_COMMON)		+= reset-starfive-common.o
 
 obj-$(CONFIG_RESET_STARFIVE_JH7100)		+= reset-starfive-jh7100.o
 obj-$(CONFIG_RESET_STARFIVE_JH7110)		+= reset-starfive-jh7110.o
diff --git a/drivers/reset/starfive/reset-starfive-jh71x0.c b/drivers/reset/starfive/reset-starfive-common.c
similarity index 97%
rename from drivers/reset/starfive/reset-starfive-jh71x0.c
rename to drivers/reset/starfive/reset-starfive-common.c
index 29ce3486752f..d615c4a68cc0 100644
--- a/drivers/reset/starfive/reset-starfive-jh71x0.c
+++ b/drivers/reset/starfive/reset-starfive-common.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * Reset driver for the StarFive JH71X0 SoCs
+ * Reset driver for the StarFive SoCs
  *
  * Copyright (C) 2021 Emil Renner Berthing <kernel@esmil.dk>
  */
@@ -12,7 +12,7 @@
 #include <linux/reset-controller.h>
 #include <linux/spinlock.h>
 
-#include "reset-starfive-jh71x0.h"
+#include "reset-starfive-common.h"
 
 struct jh71x0_reset {
 	struct reset_controller_dev rcdev;
diff --git a/drivers/reset/starfive/reset-starfive-jh71x0.h b/drivers/reset/starfive/reset-starfive-common.h
similarity index 75%
rename from drivers/reset/starfive/reset-starfive-jh71x0.h
rename to drivers/reset/starfive/reset-starfive-common.h
index db7d39a87f87..266acc4b2caf 100644
--- a/drivers/reset/starfive/reset-starfive-jh71x0.h
+++ b/drivers/reset/starfive/reset-starfive-common.h
@@ -3,12 +3,12 @@
  * Copyright (C) 2021 Emil Renner Berthing <kernel@esmil.dk>
  */
 
-#ifndef __RESET_STARFIVE_JH71X0_H
-#define __RESET_STARFIVE_JH71X0_H
+#ifndef __RESET_STARFIVE_COMMON_H
+#define __RESET_STARFIVE_COMMON_H
 
 int reset_starfive_jh71x0_register(struct device *dev, struct device_node *of_node,
 				   void __iomem *assert, void __iomem *status,
 				   const u32 *asserted, unsigned int nr_resets,
 				   struct module *owner);
 
-#endif /* __RESET_STARFIVE_JH71X0_H */
+#endif /* __RESET_STARFIVE_COMMON_H */
diff --git a/drivers/reset/starfive/reset-starfive-jh7100.c b/drivers/reset/starfive/reset-starfive-jh7100.c
index 2a56f7fd4ba7..546dea2e5811 100644
--- a/drivers/reset/starfive/reset-starfive-jh7100.c
+++ b/drivers/reset/starfive/reset-starfive-jh7100.c
@@ -8,7 +8,7 @@
 #include <linux/mod_devicetable.h>
 #include <linux/platform_device.h>
 
-#include "reset-starfive-jh71x0.h"
+#include "reset-starfive-common.h"
 
 #include <dt-bindings/reset/starfive-jh7100.h>
 
diff --git a/drivers/reset/starfive/reset-starfive-jh7110.c b/drivers/reset/starfive/reset-starfive-jh7110.c
index 29a43f0f2ad6..87dba01491ae 100644
--- a/drivers/reset/starfive/reset-starfive-jh7110.c
+++ b/drivers/reset/starfive/reset-starfive-jh7110.c
@@ -7,9 +7,9 @@
 
 #include <linux/auxiliary_bus.h>
 
-#include <soc/starfive/reset-starfive-jh71x0.h>
+#include <soc/starfive/reset-starfive-common.h>
 
-#include "reset-starfive-jh71x0.h"
+#include "reset-starfive-common.h"
 
 #include <dt-bindings/reset/starfive,jh7110-crg.h>
 
diff --git a/include/soc/starfive/reset-starfive-jh71x0.h b/include/soc/starfive/reset-starfive-common.h
similarity index 81%
rename from include/soc/starfive/reset-starfive-jh71x0.h
rename to include/soc/starfive/reset-starfive-common.h
index 47b486ececc5..56d8f413cf18 100644
--- a/include/soc/starfive/reset-starfive-jh71x0.h
+++ b/include/soc/starfive/reset-starfive-common.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __SOC_STARFIVE_RESET_JH71X0_H
-#define __SOC_STARFIVE_RESET_JH71X0_H
+#ifndef __SOC_STARFIVE_RESET_COMMON_H
+#define __SOC_STARFIVE_RESET_COMMON_H
 
 #include <linux/auxiliary_bus.h>
 #include <linux/compiler_types.h>
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
