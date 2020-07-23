Return-Path: <SRS0=QO1u=BC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C77A3C433EA
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jul 2020 14:25:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86D0C2086A
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jul 2020 14:25:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wzeVuXmz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="JGIL1AKe";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="LrTkHck1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86D0C2086A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4sfAxaZ15az8LdogREG0oTFAcp9UHfZK4vGcSEPfHB8=; b=wzeVuXmzm17fYQvURCVwDbbNG
	GE/4AnL/rNt9GSUHQGcJEE6aWizbvr2N82HDMtqmakAlaU+KlD1IZizCor9SvaSdp4POTY4Sn2TaO
	WizF+ANkcXL3+KAA6mzgNB4Mb3u+FW63hlQFHX0eVDN8nl6ShVj/lcVZfb0Fcvaqo9F2ortrldf7D
	92MG4kxdxWJP3L4xiLA7v7W3Ey0H/aQpqBVfNLvOv8s8Rn4UPp2Sxkrjfy11p15xWx8ltD0v0D182
	sxAPZonUdL8x4rnYUgX8DMp8wL49G02kqLViofXYLhn8HH1iAJOrGOw/y/XrL4xdh4fOcb9D5X6K6
	M9eXqBLmA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyc9Y-00066C-QA; Thu, 23 Jul 2020 14:24:56 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyc9W-00065D-8Q
 for linux-riscv@lists.infradead.org; Thu, 23 Jul 2020 14:24:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1595514322; x=1627050322;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=sXIPgUI0rGpZLMQZeNYq2dx2oESq5mwU+HQjk2Hau0Q=;
 b=JGIL1AKem9w4DZevA7apOOAizn8ymWwALVg/lgdp1oM81Tzxa+J3D0Kd
 LEktqabBqbDvQdaOuP0O7ztf3Oe2VPx89hIDQUJZO4VN14Ko9Wfkk4gGz
 AwqvhXq1QIGI8c4jkzXXPa2R3+03wxOXczjbAEHju90v9sOuAxXCUnoUR
 aygoCU9TOSCWZh6Zt197459rWlcQlfFMYxR75f58NutUniYIutlEf7WzR
 MeUmIgmI5U+Sa1fCt0wG0L0OqF0y6l8y0OP5XTWbxxr0sfBPjzzRRgsUZ
 38R7uSb/GRQSrMyqdId0QA09jQ0onHDcNRVJIO1g2nO0VB5DofH0yvpkz Q==;
IronPort-SDR: /EVTmbqwzp9Qb90HpOyEZkobVca/iNKYm82UPaPfLrlTHB2T3DEeBoN7V9ef+7Ry76FdO1YLhD
 wlWJ+OeIPyofgsnfMcfpAFwuz0lJ7pZYHA5wWxnAXnbA7lqSnIrIJGniXgbn5yhoxdzXrzcd+0
 jIk0i1W38iRFwUI4SDdDVJOQtmGsnETVJRtWLEQjMzPols1akBbRaQNMpbefLaN/Okb0Is2Y76
 SeYBgGYgogfyYxwbw85UXobQT08orrUOjb5JG65uPoAWShWS1p9eDXHVwFFAQVZJU9dYhx1Xvp
 /+Y=
X-IronPort-AV: E=Sophos;i="5.75,386,1589212800"; d="scan'208";a="246265175"
Received: from mail-dm6nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.101])
 by ob1.hgst.iphmx.com with ESMTP; 23 Jul 2020 22:25:17 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O+HpzFcZPJWy56I7gyPpgBCiPkbBrshF4b2ejONMnOJDCrd+XEpLSr7jAT2cphD4QDEBdkYa8zyDM6aHrqCR9g6s3PiwH3m+W7kWlSjF3ldzLAJRggmUWq96eTU3EHVuHIrwWPS4xGABrO9PYTMnlBlb0FPltumYf2iufAsJ57Sh6K2HwfpJIzYP5eHOnRsf/W8cAQoqgvVaC9ZRyxaiR11Cj4siO6EETkZeq8FBHbn6X5ZNl5ZMB11J55/6IhJp3rLpJA+GSzkGy2vZd6KNzcQ4MrqwMkF9MHxdojt7EbiDOPDJsptqiFoFdRXL01LLk/MI5HxsK4Dfq4xbEdxxpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O4ZlLT2dsVfvaaOju4LYfSRARqGQYKiIgxKwfKNi6W4=;
 b=gpiGh8HuPiIAM840sTZ0WHYgIGSOlyHc11TfhERzHHhEuOKniEZjkwVUiuYjHL3apXIU0eD8FYJuFzm2KCDZSCB0M3a45hcw0TSb/RFkxkI92K/rk4dQpiilC0V0FFAv5sfQvPPfqmEQvdW37K7uUclueSYc0AuvRBYSeVi6j7T2yGJ/5oSSCCNnXFaIXk9TsUQNNEIK/3e4RnxZw5uon0T91MqB50M6YXRYI1ZCCC1zQfrKQmnWnpQE1rrnJsUqCQUAQDUaIRIsPTV8RbdT3z1s0mZokXKTrTTAkYKL2Ey0h8toq1LoqxZQeOl+w4N5/mpiVLqE/2nyGCl+FUW+7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O4ZlLT2dsVfvaaOju4LYfSRARqGQYKiIgxKwfKNi6W4=;
 b=LrTkHck1aGllaNofpofGS/ZWyfTrd3sIkFtma0yHBIBpckcoW5SRRKDjByAx+SnLbeBpspvNOaypgPE9lWGciGnSm7PJqI3IptcWjBd5jHGlO6jjzhf31R9ZqY5lPiFmpV86qj8v97j4DKLzRYhDjYvLAgsK/RVRvnQa8YhS9T4=
Authentication-Results: dabbelt.com; dkim=none (message not signed)
 header.d=none;dabbelt.com; dmarc=none action=none header.from=wdc.com;
Received: from DM6PR04MB6201.namprd04.prod.outlook.com (2603:10b6:5:127::32)
 by DM6PR04MB6682.namprd04.prod.outlook.com (2603:10b6:5:247::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.23; Thu, 23 Jul
 2020 14:24:49 +0000
Received: from DM6PR04MB6201.namprd04.prod.outlook.com
 ([fe80::e0a4:aa82:1847:dea5]) by DM6PR04MB6201.namprd04.prod.outlook.com
 ([fe80::e0a4:aa82:1847:dea5%7]) with mapi id 15.20.3216.023; Thu, 23 Jul 2020
 14:24:49 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh+dt@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH v5 2/4] clocksource/drivers: Add CLINT timer driver
Date: Thu, 23 Jul 2020 19:54:07 +0530
Message-Id: <20200723142409.47057-3-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200723142409.47057-1-anup.patel@wdc.com>
References: <20200723142409.47057-1-anup.patel@wdc.com>
X-ClientProxiedBy: BMXPR01CA0068.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:2c::32) To DM6PR04MB6201.namprd04.prod.outlook.com
 (2603:10b6:5:127::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wdc.com (103.56.183.159) by
 BMXPR01CA0068.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:2c::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.22 via Frontend Transport; Thu, 23 Jul 2020 14:24:44 +0000
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [103.56.183.159]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: fde459c8-8f36-42ec-e400-08d82f14285a
X-MS-TrafficTypeDiagnostic: DM6PR04MB6682:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR04MB6682D65F3FD973B75E3CBD308D760@DM6PR04MB6682.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rSzUVABaIYWR5SniF2zmbei4GWmDgm4gr4ClZLOyMqQl8sKOrnneSp2lGIFso9qiXmLerfBG/svPawFERI90/xr30YODIHBySwDyqj1jVO9/+ip+/Mf2XZgYtONG88NEt0Yl4Icx9bnQ20n97HAymvnO9r7gCus+0t5bJacH6opm9SP+jMTEfU/yMUC0YtRv37kYFi4j6awoBq2ha+GcFS7/Ua7FjGoRqcqOOb34ahUwxrJ8eRrdYy6K6//XswHE8BcaKKTm7jl11pRzHSDB+qttMF4olJYms7jRThhdgKFzZ4V5MtuSebQEHiGxMDZWLPk/xlhOT3bMODFg5qLpMQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB6201.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(39860400002)(376002)(346002)(366004)(136003)(4326008)(5660300002)(36756003)(478600001)(7416002)(83380400001)(44832011)(55016002)(956004)(2616005)(2906002)(316002)(16526019)(8886007)(6666004)(52116002)(7696005)(66556008)(66946007)(66476007)(26005)(8676002)(54906003)(86362001)(186003)(8936002)(1076003)(110136005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: s3REmqDhegyCqTOndfAiWG3uX27KuOID0EYtb1l/CjrvzS5mPaEKPKVmquC5CAT+07Kw4R7BUOtD13MWhm/aakkQ2l99+gehqsAV2Th2BZVZfQeF28OM6cz8DlB/uR/l5s94TIhWULubWiZxUWqKPqHBTOx0YHfB1/lG4TIL+kgt0kDNgZrETrLhary9JR9amGTzMoRQObxTEpa4VBk55j/bgUHosHN1zYmCbnRTE9jgRL+iDXOZutyW9Crz+E8mRoUNqQ5BBR12qDxtJiTeqqzi5mD8Jn8ncmkh1QhhO+hHRhWdZiIWBrM8sdDtUing7riV8i0nRnSgnimFXy09+cQyxRLP653bMMCyVuZ5SF9lHahL9PRwuHTVeMk0J1C1JchZ8wxt7jv5CjnhqxH6a5UBcnSFXKsP1xCvVLPoiqOU53/qwv2VPZTRUvAkrADuElPKsjH9v1LpNF+Qnnl5GwSBLr4opVcDiSNoTyD/Wdk=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fde459c8-8f36-42ec-e400-08d82f14285a
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB6201.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2020 14:24:49.7580 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xt7miCPi98B/ql6cyWz+Aby6bQT8UCYDmiHvFvrN++2Lg2moctyPzGgvPc1Lce+Yy0M9rykjUT0SFL9oLl28ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB6682
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_102454_518350_90767B41 
X-CRM114-Status: GOOD (  26.02  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Damien Le Moal <damien.lemoal@wdc.com>,
 Emil Renner Berhing <kernel@esmil.dk>, Anup Patel <anup@brainfault.org>,
 Anup Patel <anup.patel@wdc.com>, linux-kernel@vger.kernel.org,
 Atish Patra <atish.patra@wdc.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

We add a separate CLINT timer driver for Linux RISC-V M-mode (i.e.
RISC-V NoMMU kernel).

The CLINT MMIO device provides three things:
1. 64bit free running counter register
2. 64bit per-CPU time compare registers
3. 32bit per-CPU inter-processor interrupt registers

Unlike other timer devices, CLINT provides IPI registers along with
timer registers. To use CLINT IPI registers, the CLINT timer driver
provides IPI related callbacks to arch/riscv.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Tested-by: Emil Renner Berhing <kernel@esmil.dk>
---
 drivers/clocksource/Kconfig       |   9 ++
 drivers/clocksource/Makefile      |   1 +
 drivers/clocksource/timer-clint.c | 226 ++++++++++++++++++++++++++++++
 include/linux/cpuhotplug.h        |   1 +
 4 files changed, 237 insertions(+)
 create mode 100644 drivers/clocksource/timer-clint.c

diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index 91418381fcd4..41f1c147c178 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -658,6 +658,15 @@ config RISCV_TIMER
 	  is accessed via both the SBI and the rdcycle instruction.  This is
 	  required for all RISC-V systems.
 
+config CLINT_TIMER
+	bool "CLINT Timer for the RISC-V platform" if COMPILE_TEST
+	depends on GENERIC_SCHED_CLOCK && RISCV
+	select TIMER_PROBE
+	select TIMER_OF
+	help
+	  This option enables the CLINT timer for RISC-V systems.  The CLINT
+	  driver is usually used for NoMMU RISC-V systems.
+
 config CSKY_MP_TIMER
 	bool "SMP Timer for the C-SKY platform" if COMPILE_TEST
 	depends on CSKY
diff --git a/drivers/clocksource/Makefile b/drivers/clocksource/Makefile
index bdda1a2e4097..18e700e703a0 100644
--- a/drivers/clocksource/Makefile
+++ b/drivers/clocksource/Makefile
@@ -87,6 +87,7 @@ obj-$(CONFIG_CLKSRC_ST_LPC)		+= clksrc_st_lpc.o
 obj-$(CONFIG_X86_NUMACHIP)		+= numachip.o
 obj-$(CONFIG_ATCPIT100_TIMER)		+= timer-atcpit100.o
 obj-$(CONFIG_RISCV_TIMER)		+= timer-riscv.o
+obj-$(CONFIG_CLINT_TIMER)		+= timer-clint.o
 obj-$(CONFIG_CSKY_MP_TIMER)		+= timer-mp-csky.o
 obj-$(CONFIG_GX6605S_TIMER)		+= timer-gx6605s.o
 obj-$(CONFIG_HYPERV_TIMER)		+= hyperv_timer.o
diff --git a/drivers/clocksource/timer-clint.c b/drivers/clocksource/timer-clint.c
new file mode 100644
index 000000000000..8eeafa82c03d
--- /dev/null
+++ b/drivers/clocksource/timer-clint.c
@@ -0,0 +1,226 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2020 Western Digital Corporation or its affiliates.
+ *
+ * Most of the M-mode (i.e. NoMMU) RISC-V systems usually have a
+ * CLINT MMIO timer device.
+ */
+
+#define pr_fmt(fmt) "clint: " fmt
+#include <linux/bitops.h>
+#include <linux/clocksource.h>
+#include <linux/clockchips.h>
+#include <linux/cpu.h>
+#include <linux/delay.h>
+#include <linux/module.h>
+#include <linux/of_address.h>
+#include <linux/sched_clock.h>
+#include <linux/io-64-nonatomic-lo-hi.h>
+#include <linux/interrupt.h>
+#include <linux/of_irq.h>
+#include <linux/smp.h>
+
+#define CLINT_IPI_OFF		0
+#define CLINT_TIMER_CMP_OFF	0x4000
+#define CLINT_TIMER_VAL_OFF	0xbff8
+
+/* CLINT manages IPI and Timer for RISC-V M-mode  */
+static u32 __iomem *clint_ipi_base;
+static u64 __iomem *clint_timer_cmp;
+static u64 __iomem *clint_timer_val;
+static unsigned long clint_timer_freq;
+static unsigned int clint_timer_irq;
+
+static void clint_send_ipi(const struct cpumask *target)
+{
+	unsigned int cpu;
+
+	for_each_cpu(cpu, target)
+		writel(1, clint_ipi_base + cpuid_to_hartid_map(cpu));
+}
+
+static void clint_clear_ipi(void)
+{
+	writel(0, clint_ipi_base + cpuid_to_hartid_map(smp_processor_id()));
+}
+
+static struct riscv_ipi_ops clint_ipi_ops = {
+	.ipi_inject = clint_send_ipi,
+	.ipi_clear = clint_clear_ipi,
+};
+
+#ifdef CONFIG_64BIT
+#define clint_get_cycles()	readq_relaxed(clint_timer_val)
+#else
+#define clint_get_cycles()	readl_relaxed(clint_timer_val)
+#define clint_get_cycles_hi()	readl_relaxed(((u32 *)clint_timer_val) + 1)
+#endif
+
+#ifdef CONFIG_64BIT
+static u64 notrace clint_get_cycles64(void)
+{
+	return clint_get_cycles();
+}
+#else /* CONFIG_64BIT */
+static u64 notrace clint_get_cycles64(void)
+{
+	u32 hi, lo;
+
+	do {
+		hi = clint_get_cycles_hi();
+		lo = clint_get_cycles();
+	} while (hi != clint_get_cycles_hi());
+
+	return ((u64)hi << 32) | lo;
+}
+#endif /* CONFIG_64BIT */
+
+static u64 clint_rdtime(struct clocksource *cs)
+{
+	return clint_get_cycles64();
+}
+
+static struct clocksource clint_clocksource = {
+	.name		= "clint_clocksource",
+	.rating		= 300,
+	.mask		= CLOCKSOURCE_MASK(64),
+	.flags		= CLOCK_SOURCE_IS_CONTINUOUS,
+	.read		= clint_rdtime,
+};
+
+static int clint_clock_next_event(unsigned long delta,
+				   struct clock_event_device *ce)
+{
+	void __iomem *r = clint_timer_cmp +
+			  cpuid_to_hartid_map(smp_processor_id());
+
+	csr_set(CSR_IE, IE_TIE);
+	writeq_relaxed(clint_get_cycles64() + delta, r);
+	return 0;
+}
+
+static DEFINE_PER_CPU(struct clock_event_device, clint_clock_event) = {
+	.name		= "clint_clockevent",
+	.features	= CLOCK_EVT_FEAT_ONESHOT,
+	.rating		= 100,
+	.set_next_event	= clint_clock_next_event,
+};
+
+static int clint_timer_starting_cpu(unsigned int cpu)
+{
+	struct clock_event_device *ce = per_cpu_ptr(&clint_clock_event, cpu);
+
+	ce->cpumask = cpumask_of(cpu);
+	clockevents_config_and_register(ce, clint_timer_freq, 100, 0x7fffffff);
+
+	enable_percpu_irq(clint_timer_irq,
+			  irq_get_trigger_type(clint_timer_irq));
+	return 0;
+}
+
+static int clint_timer_dying_cpu(unsigned int cpu)
+{
+	disable_percpu_irq(clint_timer_irq);
+	return 0;
+}
+
+static irqreturn_t clint_timer_interrupt(int irq, void *dev_id)
+{
+	struct clock_event_device *evdev = this_cpu_ptr(&clint_clock_event);
+
+	csr_clear(CSR_IE, IE_TIE);
+	evdev->event_handler(evdev);
+
+	return IRQ_HANDLED;
+}
+
+static int __init clint_timer_init_dt(struct device_node *np)
+{
+	int rc;
+	u32 i, nr_irqs;
+	void __iomem *base;
+	struct of_phandle_args oirq;
+
+	/*
+	 * Ensure that CLINT device interrupts are either RV_IRQ_TIMER or
+	 * RV_IRQ_SOFT. If it's anything else then we ignore the device.
+	 */
+	nr_irqs = of_irq_count(np);
+	for (i = 0; i < nr_irqs; i++) {
+		if (of_irq_parse_one(np, i, &oirq)) {
+			pr_err("%pOFP: failed to parse irq %d.\n", np, i);
+			continue;
+		}
+
+		if ((oirq.args_count != 1) ||
+		    (oirq.args[0] != RV_IRQ_TIMER &&
+		     oirq.args[0] != RV_IRQ_SOFT)) {
+			pr_err("%pOFP: invalid irq %d (hwirq %d)\n",
+			       np, i, oirq.args[0]);
+			return -ENODEV;
+		}
+
+		/* Find parent irq domain and map timer irq */
+		if (!clint_timer_irq &&
+		    oirq.args[0] == RV_IRQ_TIMER &&
+		    irq_find_host(oirq.np))
+			clint_timer_irq = irq_of_parse_and_map(np, i);
+	}
+
+	/* If CLINT timer irq not found then fail */
+	if (!clint_timer_irq) {
+		pr_err("%pOFP: timer irq not found\n", np);
+		return -ENODEV;
+	}
+
+	base = of_iomap(np, 0);
+	if (!base) {
+		pr_err("%pOFP: could not map registers\n", np);
+		return -ENODEV;
+	}
+
+	clint_ipi_base = base + CLINT_IPI_OFF;
+	clint_timer_cmp = base + CLINT_TIMER_CMP_OFF;
+	clint_timer_val = base + CLINT_TIMER_VAL_OFF;
+	clint_timer_freq = riscv_timebase;
+
+	pr_info("%pOFP: timer running at %ld Hz\n", np, clint_timer_freq);
+
+	rc = clocksource_register_hz(&clint_clocksource, clint_timer_freq);
+	if (rc) {
+		pr_err("%pOFP: clocksource register failed [%d]\n", np, rc);
+		goto fail_iounmap;
+	}
+
+	sched_clock_register(clint_get_cycles64, 64, clint_timer_freq);
+
+	rc = request_percpu_irq(clint_timer_irq, clint_timer_interrupt,
+				 "clint-timer", &clint_clock_event);
+	if (rc) {
+		pr_err("registering percpu irq failed [%d]\n", rc);
+		goto fail_iounmap;
+	}
+
+	rc = cpuhp_setup_state(CPUHP_AP_CLINT_TIMER_STARTING,
+				"clockevents/clint/timer:starting",
+				clint_timer_starting_cpu,
+				clint_timer_dying_cpu);
+	if (rc) {
+		pr_err("%pOFP: cpuhp setup state failed [%d]\n", np, rc);
+		goto fail_free_irq;
+	}
+
+	riscv_set_ipi_ops(&clint_ipi_ops);
+	clint_clear_ipi();
+
+	return 0;
+
+fail_free_irq:
+	free_irq(clint_timer_irq, &clint_clock_event);
+fail_iounmap:
+	iounmap(base);
+	return rc;
+}
+
+TIMER_OF_DECLARE(clint_timer, "riscv,clint0", clint_timer_init_dt);
+TIMER_OF_DECLARE(clint_timer1, "sifive,clint0", clint_timer_init_dt);
diff --git a/include/linux/cpuhotplug.h b/include/linux/cpuhotplug.h
index 191772d4a4d7..1451f4625833 100644
--- a/include/linux/cpuhotplug.h
+++ b/include/linux/cpuhotplug.h
@@ -132,6 +132,7 @@ enum cpuhp_state {
 	CPUHP_AP_MIPS_GIC_TIMER_STARTING,
 	CPUHP_AP_ARC_TIMER_STARTING,
 	CPUHP_AP_RISCV_TIMER_STARTING,
+	CPUHP_AP_CLINT_TIMER_STARTING,
 	CPUHP_AP_CSKY_TIMER_STARTING,
 	CPUHP_AP_HYPERV_TIMER_STARTING,
 	CPUHP_AP_KVM_STARTING,
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
