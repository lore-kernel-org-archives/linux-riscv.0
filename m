Return-Path: <SRS0=uYfr=A2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0925FC433ED
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jul 2020 07:15:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0AC52065E
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jul 2020 07:15:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CMvyNk1o";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="eN8GxbtX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="noqD27Qi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0AC52065E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xLevdqdsVqkGB/QotbUWUDE8BEfCfhoE8xzqZqq3x0E=; b=CMvyNk1odyfiuWHVDcEZaLgpC
	OYK09r12gQo32TcqV75GB8yftW6Tb6FBWbWYYKpWBC7yuW+aX750K5zjLZOKyGBMqbfveQsBj6iKt
	4tmiSUucLeecktSRV8bnFmuyTrWp7tnORQB4pbFJcDQftz+Z4NiXcyuC3VNnSUgsCkMBPTQWdtF2D
	wRXEjQNd2p08GVv7SKxa3Q685Zo29XlwDg731oRzoRrxy/ZdRubtCRgVmiimDY0TavGy7wxdUKNTk
	WlQLCQuE/5LBk4uOo3DsmyiztTNRF9T54V1LuFJY5+s0O/3hia3iS9UeeGSodQ4cFOredhdfcbvrb
	6QPwa0p1A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvbdu-0001yM-LD; Wed, 15 Jul 2020 07:15:50 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvbdr-0001xX-OO
 for linux-riscv@lists.infradead.org; Wed, 15 Jul 2020 07:15:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1594797347; x=1626333347;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=lHKKzfGZ13Ylw17iqMw4Ux5kMXbUjMmk98TInMLGk+0=;
 b=eN8GxbtXtWv8jxWzodCsFtPToCifrI/prV9s9xN4io9pxsaJBNbSWRwF
 63tXXwGAid/wShIa4nbRo109e5LpZZJ43NHWGp3UCVaMu0w4EJlSRG6T7
 mqD7aVGn0ypmA1hTMMnYlUeX5NT04y6XVY59MX7wzgouQjs+p4NmHrfH0
 pNI7uLDudM0Hqe32wENxJ72Xi2m4cTLCEZ93Q0TsuR0otBW/w1yN3Yhhj
 oT7uI4aChrMmvBGRWCPhvSUSYV7uZHy1yuGy52N8YH90g7Parv6PekqyA
 WYD5POx7tTEAnHMqN43Hd0uOqoYhcLMQHw4PMzehotpiOg/ycyanzRhgK Q==;
IronPort-SDR: +Fn6rkoi5dZXNiVEqSO0DGeCxt3ac3P9fDtH0WRNowKkM1et85p8/o4VjObKNagUzdhGbrhH3i
 0+qFshZT1kP2U2zrIRyuAojhxdN5ehEY+qgNpoZzFiifju0waAuZHuyhig+Rxw1cdkzmAFZy0K
 LXJj88x4IOAiguB+gP7fvHRPht3im+PtCZ1REvCa6GVNHcvC11qEje7gLp84GGWYAsWZDdpzSB
 r1JctanansraBSIuyqp5DxXYSga+wEv8MF+qh6kO9ZMWhY7VmA03rDJL7RM7l8kBQzwqaW8D5r
 ov8=
X-IronPort-AV: E=Sophos;i="5.75,354,1589212800"; d="scan'208";a="142495412"
Received: from mail-sn1nam04lp2050.outbound.protection.outlook.com (HELO
 NAM04-SN1-obe.outbound.protection.outlook.com) ([104.47.44.50])
 by ob1.hgst.iphmx.com with ESMTP; 15 Jul 2020 15:15:46 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fdyQlt7NMugNIDxzGIyeqwjvArFcLGAkhgDG6ssZlk1XfngifZVfFpJH5Drp+r+CffK6NQhWuVPxcg+nwD5hlfzJCS2RllzW+UkUlwVrJ5uPDAQF7QBkw/MMOwW00oVVntCIAM11osp5AQ3M1f2s29hkbFudWqmz8+ek1O8pBR5cSwALfrWf57zi0YzaBwu3EbcfSvhJa4FmVl9cL/hQ0v92beHc31rHxs5rzPyRY02zJI2h9h3h81VykE53ZbltToIsajn1jNZ1qGYZnHnpaWkUD+Ott9Sb2iV2o9CansTMJgd1l4HReipwwDQ3en0978byYRXTkyN94qnHUjFklg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5oMYwwkEPF3TfDpXlG0bzFgeIyEXqYkX+a8sXf/ZBRM=;
 b=S6pBfxeWTc35CFeURyECfFvqk/k+0G+A652skR7FAsPFNMSPCzhK27umdUxvhnLd6ftZBCHD23tOQxRrlR3B1gTUBiDEvkLj03+WJEuIbSyo+Idd8uGrBNlPOggDdKtS9RrmuaF6gvABCUUAJ8fwzyA9w+pU4VMZ+RY9xcjQqKcJCqX+ANTTMWFfTZETGQartdeOYPZnfG4SldFDUDITqP5PMhf2qCNPitZnkFzkO7JjfzSqanrbP9IwQVfpiV0Kaf5RoyNzWLbVYgG4zugR6g9tIG0epANHLU25NCnIFpPY8d59GGNFPzk7BVWYKantzR/6N6gSdmhMOXu10lvzaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5oMYwwkEPF3TfDpXlG0bzFgeIyEXqYkX+a8sXf/ZBRM=;
 b=noqD27QiiOpqkVTgfm1iFNKssh+c9832IGhwDrdQVl3Z9R+CS/sN7XD/+TZYsBjbz50z4vmhOOr3Wz/Mz+qfrcvPHgJHDyW4fJ0iWTBiyaRyjzBMbeGB5Mrdd3FlN0H0yhUU12dGd8kewlGfLhh5JgiNq7HqUp5o6G/q/g8tuwY=
Authentication-Results: dabbelt.com; dkim=none (message not signed)
 header.d=none;dabbelt.com; dmarc=none action=none header.from=wdc.com;
Received: from DM6PR04MB6201.namprd04.prod.outlook.com (2603:10b6:5:127::32)
 by DM6PR04MB4329.namprd04.prod.outlook.com (2603:10b6:5:9a::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.17; Wed, 15 Jul
 2020 07:15:45 +0000
Received: from DM6PR04MB6201.namprd04.prod.outlook.com
 ([fe80::e0a4:aa82:1847:dea5]) by DM6PR04MB6201.namprd04.prod.outlook.com
 ([fe80::e0a4:aa82:1847:dea5%7]) with mapi id 15.20.3174.026; Wed, 15 Jul 2020
 07:15:45 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh+dt@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH v3 2/4] clocksource/drivers: Add CLINT timer driver
Date: Wed, 15 Jul 2020 12:45:03 +0530
Message-Id: <20200715071506.10994-3-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200715071506.10994-1-anup.patel@wdc.com>
References: <20200715071506.10994-1-anup.patel@wdc.com>
X-ClientProxiedBy: PN1PR0101CA0047.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c00:c::33) To DM6PR04MB6201.namprd04.prod.outlook.com
 (2603:10b6:5:127::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wdc.com (103.15.57.135) by
 PN1PR0101CA0047.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00:c::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.18 via Frontend
 Transport; Wed, 15 Jul 2020 07:15:39 +0000
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [103.15.57.135]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3cd8e6e2-06c1-42dd-a388-08d8288ee3f2
X-MS-TrafficTypeDiagnostic: DM6PR04MB4329:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR04MB4329DE1E8257819440B6DA718D7E0@DM6PR04MB4329.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PqVyq3TOYerfdeFbSXVXar11novz8d6l/tzZW/SFnuG2UPX+QaBqiKv0cLezzhKk4PXslxV5VfvAN1TCpegZCd1gDP1oqrOW7hEvWBpZuj5yBL/xElMqxmoUZWxotLOSZtep5QDEN1WY6erNOW1LEIW7mw1vD3gF5WUvE+NYI7540xiOIL2gD9ukScesdB6+MEbWBvL9qYMfRCJL9p76WBP5LyWxJhmRa1XTBCV8wI7360LLm9K8Yb21Bp3nSJgMX6I+EnxUr2Dl48FnQyYdGGSpcjBGZi7Hpnxu+EryPdYugr19QJW/aSrjf11iEwllawzcQTNaScbSQIAY2AY/yg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB6201.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(366004)(396003)(39860400002)(376002)(136003)(8936002)(16526019)(8886007)(186003)(44832011)(36756003)(7696005)(478600001)(26005)(66476007)(7416002)(66556008)(66946007)(54906003)(110136005)(52116002)(2616005)(316002)(956004)(6666004)(2906002)(86362001)(55016002)(1076003)(8676002)(83380400001)(4326008)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: aCh7NM/gs1bOnQDRVhHShBXhDO3/dwLCweoO7m8QnGRY/1Avi/ac4VmKC8FzUmtNy2NcSpAwXk4vsE40g7S5LhX4idkvuot0OqZLBog3e9g89ItvddNjDfjIRZkoTcnbAH7HF1a+5btvW+eOS5sxlAmljKBzyD8TgTxfuROdCBKeq7ohOPrEaBTLBjB5HIQvogqVkw3CDcCau0uzn6YlD6fzkpMqcHHJ76e3mAH+OEuhDGgI1VkttKEGrC+JzMSdPqv0ODPa2tm0wRP/BpGVRoKEYkcEZGb8ShPaKwshLb14o/DOilzxDtDutwPAK/eB5twZJwaDQQC7E/V7Wti+b3kbvzKBK4gkltcPtokgm74YT8hSLxyQrF7MnAZxB6Gnm57lk/TUs84tvTMOKpNKHBJumtDPUE02o3UbinOqPO2MkxfjTDlwnekowBktsYKQORe//Bt3rBddYOggwrcgIzUbzJxoZxHfIEe1cLv8xlk=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cd8e6e2-06c1-42dd-a388-08d8288ee3f2
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB6201.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2020 07:15:45.1469 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: msgcnxdjbJekJr+O0YrjHtn3AKzCG/QPAGdUI9wYX4ZleEJVr68OiRC905afYLUBexFm7zuGL0PSwUASngKXvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB4329
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200715_031547_983232_BBB64A34 
X-CRM114-Status: GOOD (  26.09  )
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
 Anup Patel <anup@brainfault.org>, Anup Patel <anup.patel@wdc.com>,
 linux-kernel@vger.kernel.org, Atish Patra <atish.patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The TIME CSR and SBI calls are not available in RISC-V M-mode so we
separate add CLINT driver for Linux RISC-V M-mode (i.e. RISC-V NoMMU
kernel).

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 drivers/clocksource/Kconfig       |  10 ++
 drivers/clocksource/Makefile      |   1 +
 drivers/clocksource/timer-clint.c | 229 ++++++++++++++++++++++++++++++
 include/linux/cpuhotplug.h        |   1 +
 4 files changed, 241 insertions(+)
 create mode 100644 drivers/clocksource/timer-clint.c

diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index 91418381fcd4..eabcf1cfb0c0 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -658,6 +658,16 @@ config RISCV_TIMER
 	  is accessed via both the SBI and the rdcycle instruction.  This is
 	  required for all RISC-V systems.
 
+config CLINT_TIMER
+	bool "Timer for the RISC-V platform"
+	depends on GENERIC_SCHED_CLOCK && RISCV_M_MODE
+	default y
+	select TIMER_PROBE
+	select TIMER_OF
+	help
+	  This option enables the CLINT timer for RISC-V systems. The CLINT
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
index 000000000000..bfc38bb5a589
--- /dev/null
+++ b/drivers/clocksource/timer-clint.c
@@ -0,0 +1,229 @@
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
+static u64 clint_get_cycles64(void)
+{
+	return clint_get_cycles();
+}
+#else /* CONFIG_64BIT */
+static u64 clint_get_cycles64(void)
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
+	.name			= "clint_clockevent",
+	.features		= CLOCK_EVT_FEAT_ONESHOT,
+	.rating		= 100,
+	.set_next_event	= clint_clock_next_event,
+};
+
+static u64 clint_rdtime(struct clocksource *cs)
+{
+	return readq_relaxed(clint_timer_val);
+}
+
+static u64 notrace clint_sched_clock(void)
+{
+	return readq_relaxed(clint_timer_val);
+}
+
+static struct clocksource clint_clocksource = {
+	.name		= "clint_clocksource",
+	.rating	= 300,
+	.mask		= CLOCKSOURCE_MASK(64),
+	.flags		= CLOCK_SOURCE_IS_CONTINUOUS,
+	.read		= clint_rdtime,
+};
+
+static int clint_timer_starting_cpu(unsigned int cpu)
+{
+	struct clock_event_device *ce = per_cpu_ptr(&clint_clock_event, cpu);
+
+	ce->cpumask = cpumask_of(cpu);
+	clockevents_config_and_register(ce, clint_timer_freq, 200, ULONG_MAX);
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
+		iounmap(base);
+		pr_err("%pOFP: clocksource register failed [%d]\n", np, rc);
+		return rc;
+	}
+
+	sched_clock_register(clint_sched_clock, 64, clint_timer_freq);
+
+	rc = request_percpu_irq(clint_timer_irq, clint_timer_interrupt,
+				 "clint-timer", &clint_clock_event);
+	if (rc) {
+		iounmap(base);
+		pr_err("registering percpu irq failed [%d]\n", rc);
+		return rc;
+	}
+
+	rc = cpuhp_setup_state(CPUHP_AP_CLINT_TIMER_STARTING,
+				"clockevents/clint/timer:starting",
+				clint_timer_starting_cpu,
+				clint_timer_dying_cpu);
+	if (rc) {
+		free_irq(clint_timer_irq, &clint_clock_event);
+		iounmap(base);
+		pr_err("%pOFP: cpuhp setup state failed [%d]\n", np, rc);
+		return rc;
+	}
+
+	riscv_set_ipi_ops(&clint_ipi_ops);
+	clint_clear_ipi();
+
+	return 0;
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
