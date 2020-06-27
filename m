Return-Path: <SRS0=1V8E=AI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE323C433E2
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jun 2020 16:21:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E02A20720
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jun 2020 16:21:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d5rvusU4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="IgsRG0pv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="e4AQ/GwH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E02A20720
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IrE/k3pbjfLIZnv/xB2jHk4YJ/z+91gNtHwldWTrQeU=; b=d5rvusU4YiwqxM9WfUUrY3sC5
	54IpsSUffrkpsb1+SPlLg4HrDXed6ztC3OFmqV+Xo6K4WKwomuVvS8rAc9szxHkx86XxImyZBiM97
	JS01AjwGyiAjSHuUyKJztQ51QHr7OwnVtOB3EQbtH1sRDY2r90/KpADiBVqXda/Jpu/LmE2PjsJzs
	ptvkF0qbhQQeqCbbkIeg2fYfzDVnIsT4FgjoyNwndmPd2ybcbYZ/6pyb4mlG+zFKhnjnX+yLO2puI
	t3Hauhd/ndcqn83m66UErthQyFjN5XOq3wQHbpqWgF+YCsAfL4KJl7zq+BARhICr/XTySY4I31FDH
	1mRsx+lRQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpDZk-0005rL-I6; Sat, 27 Jun 2020 16:21:08 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpDZh-0005qZ-Eg
 for linux-riscv@lists.infradead.org; Sat, 27 Jun 2020 16:21:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1593274865; x=1624810865;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=iHbtAhYJQsR1I6m1HrEoA+bmLAN3h104ziV0BZfDKlI=;
 b=IgsRG0pvbIrvI62y6crr57OHisM1OoygHTQWW4S6AN+zWgdE6sSyHJdF
 7Cg6q/+NdPfW6cH7NbZ0AsAwNLTFwqgTLXHOntT1+AzPkY55Xl8wUwyyZ
 0QjXF0faQGnCUdoNjRFln5XIvuiSi8owpr9IQFKOhcqRClHoxDlvvkOqi
 QSFzoHT8B4bivqFBmsl0RFtrgZyFnZa+UX3+voH8lQ6F54hgJTUWE7jOL
 p9/NmQKel+foIaTbs1rvRN7zCdxFxkKUx14gPjUN6NL2w639E4Xb5HlTe
 MnNf4TPdWsf+uEOlpnp5nmP+5DtDK0+ffjxcPl5wkR+ZohjyxLpKH6Vsk g==;
IronPort-SDR: 2qHTPwPSd+y79t3yilgVualTuO+BY1rzKghPkwxP7BCH5bU0ghorx7goshKvKHN7G28hMss7SS
 6LCKK6tNdFwwH0DSvjjdky2rrrvXJVdTMeRhaI6a8EruGolkyX1creBtPlkafRFjr/4riuikwQ
 OA851cVoOLWQa8Bw6o1XlfiPGMMGPkOIZ4ovEnsezTBfDr6IYR2W5I9ikovDpWNvwqu7EVeBei
 jgplUT8BYZ3FdSgTCIjy29X4dsvtnxJ2cYr8tDtfoGYJP9ZXMfdCkUE/u6PwkGYwK4gtPw408o
 Z6U=
X-IronPort-AV: E=Sophos;i="5.75,287,1589212800"; d="scan'208";a="250304531"
Received: from mail-bn8nam12lp2175.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.175])
 by ob1.hgst.iphmx.com with ESMTP; 28 Jun 2020 00:20:59 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n7SLG2+qH3lGQm6eUydAirHDnqqWmIA/TXWwogkBeLGl+8UcxmjMTGdFfpp+2N0FBOFXB50GN4d4XJUlCE0R7BcCC1IwZK+2wqYfQkb7EecHpa3hQXApwvVQsqPt3Z4l8ISSd4kBkYObSbz54DBSbcNKt1xHMNLYwXzRoVvlwrCvM1umnM9mc9B+WH4OFgreZ4zjUZdNAZHYT/7kRPhZlDrH6fnNFf1BR/Np1f1xyD6wjiSz78oAU1zl/Kk0K89TA8F0Qyk4pH2peYMdpQBcFbJGOE7YfDfedPXOGhE2Hl9kNlIbLoahOpD7YPMuvLJm6hddOhuiPU4DyIUqRJtC5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NXO6/Ml+4QoRipL83FXkEzvgldcs4Pe3bR5xg20zgv0=;
 b=gRcDHGzBftqTJfhRF2usmazzNw+aboAzSlpo89srTi6yPPm5v7V+JB+OH1D70g0NWUEILDtbiEIKkir2YZ3XohbwX9U0HASk5nJR50Y0l1PpX7HMNf0mpxmNZCDms1YY+LrKgR9K4PS2qmtAI7Ehmpi916SQcC8X+t+eBDwkGnZyN7tldBM9U+KxECtPMQPJe0MQuokUr+LixgIZkKEKwU3hu6MM6SixcpZsn0KauNEBE4Q7OOIqGRBevymB0dqccYJhUz36SjMgBbdHAP9t7+oOZq/lYpNz9W1+5P3WxwzLNODbfQRTtheNTl/Cl9wySo+gaUwd3JGWI2i4DSCNQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NXO6/Ml+4QoRipL83FXkEzvgldcs4Pe3bR5xg20zgv0=;
 b=e4AQ/GwHg+NmjBQV73LtdJZQZ3lu52znavUamnWTngaYJQ57QZX1p6yjNBDgaF9YEGBwJDhjcPesgQmB1p729HhE85FZtslYLsEwmGna0BIsSD4Q/BjiWHSLyZtYI+D93cHs3h4VRqr+23XSAbWGeDfljhGCwxt2N05BSpX4S90=
Authentication-Results: dabbelt.com; dkim=none (message not signed)
 header.d=none;dabbelt.com; dmarc=none action=none header.from=wdc.com;
Received: from MN2PR04MB6207.namprd04.prod.outlook.com (2603:10b6:208:de::32)
 by MN2PR04MB5725.namprd04.prod.outlook.com (2603:10b6:208:a2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.24; Sat, 27 Jun
 2020 16:20:57 +0000
Received: from MN2PR04MB6207.namprd04.prod.outlook.com
 ([fe80::e0ef:7fce:ff0d:f580]) by MN2PR04MB6207.namprd04.prod.outlook.com
 ([fe80::e0ef:7fce:ff0d:f580%7]) with mapi id 15.20.3131.026; Sat, 27 Jun 2020
 16:20:57 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh+dt@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH v2 2/5] RISC-V: Remove CLINT related code
Date: Sat, 27 Jun 2020 21:49:54 +0530
Message-Id: <20200627161957.134376-3-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200627161957.134376-1-anup.patel@wdc.com>
References: <20200627161957.134376-1-anup.patel@wdc.com>
X-ClientProxiedBy: MAXPR0101CA0029.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:d::15) To MN2PR04MB6207.namprd04.prod.outlook.com
 (2603:10b6:208:de::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wdc.com (42.109.128.251) by
 MAXPR0101CA0029.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21 via Frontend
 Transport; Sat, 27 Jun 2020 16:20:48 +0000
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [42.109.128.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9c37d784-a1e5-4c12-6a43-08d81ab61234
X-MS-TrafficTypeDiagnostic: MN2PR04MB5725:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR04MB5725C9B2D55F4E8D567D98C18D900@MN2PR04MB5725.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-Forefront-PRVS: 0447DB1C71
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pwPdm4elaMKYk2o6jx5/1eO1tSZF0Mbnnam9e0PQ/6vsL3ROM7r4fv3Rvwami2pKAVvsap+GURuUM4EQGymmHeD8JcN8F7FwIrz8zYa6LVTGKpdSQa2BzKgkqLh1bM5kUYU8O39AMtTOU41mFD4tIr+CPDi447UtvVSWQUU0htEixwWWKbLl+fD77Jkh5O9PzSHjZOdvE27yiAtJs961xHpckdQUWHr7oqPXZADlWnInt/7DwpKW9u+Fa7JEatXtcs9Fec/yWn47KtPmPa52gK8Kn9S0uORE+06GpKlviKGVWkJ/GawSyb+P7MotITr8G74HTrhyGLy9xYSPgsk72A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR04MB6207.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(136003)(346002)(376002)(396003)(366004)(1076003)(8886007)(186003)(16526019)(52116002)(86362001)(55016002)(6666004)(1006002)(36756003)(7696005)(66946007)(5660300002)(83380400001)(26005)(66556008)(66476007)(110136005)(2616005)(4326008)(54906003)(478600001)(44832011)(8676002)(8936002)(2906002)(316002)(7416002)(956004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: 3q/+IVxPQNc6wCuYIDKRX2qd8iDXAHjb8VCCygu9RbELuHVk/UtiZTNFFPwI1mfgPJmw+gicfNFQl2cbDC5q+cgvjKOiczoexZwb3EI53IXK7RzSaPfdVnLxm/Cpr+YAn94nlCsy3IxQD2LEj9wsmp3DdkE2NBMvxcn1PteRJ04erD8WakEujm1bjpQP/TG70lhKmq8YokMGFn7wHGCeA/sP0iaRuauLMLsHgCD2fKgvSZZFr/tbKrclyfgYwzhBSJ9gQMikGozSke35wbMmd4fymQlNaD19++Kc+5/o0BFdNvs6CDfRsprCU1Fl/3SsvFRdcN6X9KdFeTEf6nHPc6SC/fykf4cTb+aeEsK7FH32L6mzOHNmruHAIThabwP41RqMd8UxdHheGJldhj0gRXwASeVhi63a3+kAwv5B7gGq37ojGujhQPCiL2gwU6xSt3uJnA17Z0KTF0xEuvsrga2J8oUuBgiAqOM0vh9iuDTmPvLKmH5i10LiiVhoj9/V
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c37d784-a1e5-4c12-6a43-08d81ab61234
X-MS-Exchange-CrossTenant-AuthSource: MN2PR04MB6207.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2020 16:20:57.2295 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UwYJgLNbqACptmZWhoz62QXhvImdeXFXbqjBJTyqFBJz46YtetNtygbHJR+GbuJXbjSycqcq/wX75Zc3Ro0S/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB5725
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

We will be having separate CLINT timer driver which will also
provide CLINT based IPI operations so let's remove CLINT related
code from arch/riscv directory.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 arch/riscv/include/asm/clint.h | 39 ------------------------------
 arch/riscv/kernel/Makefile     |  2 +-
 arch/riscv/kernel/clint.c      | 44 ----------------------------------
 arch/riscv/kernel/setup.c      |  2 --
 arch/riscv/kernel/smp.c        |  1 -
 arch/riscv/kernel/smpboot.c    |  1 -
 6 files changed, 1 insertion(+), 88 deletions(-)
 delete mode 100644 arch/riscv/include/asm/clint.h
 delete mode 100644 arch/riscv/kernel/clint.c

diff --git a/arch/riscv/include/asm/clint.h b/arch/riscv/include/asm/clint.h
deleted file mode 100644
index a279b17a6aad..000000000000
--- a/arch/riscv/include/asm/clint.h
+++ /dev/null
@@ -1,39 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _ASM_RISCV_CLINT_H
-#define _ASM_RISCV_CLINT_H 1
-
-#include <linux/io.h>
-#include <linux/smp.h>
-
-#ifdef CONFIG_RISCV_M_MODE
-extern u32 __iomem *clint_ipi_base;
-
-void clint_init_boot_cpu(void);
-
-static inline void clint_send_ipi_single(unsigned long hartid)
-{
-	writel(1, clint_ipi_base + hartid);
-}
-
-static inline void clint_send_ipi_mask(const struct cpumask *mask)
-{
-	int cpu;
-
-	for_each_cpu(cpu, mask)
-		clint_send_ipi_single(cpuid_to_hartid_map(cpu));
-}
-
-static inline void clint_clear_ipi(unsigned long hartid)
-{
-	writel(0, clint_ipi_base + hartid);
-}
-#else /* CONFIG_RISCV_M_MODE */
-#define clint_init_boot_cpu()	do { } while (0)
-
-/* stubs to for code is only reachable under IS_ENABLED(CONFIG_RISCV_M_MODE): */
-void clint_send_ipi_single(unsigned long hartid);
-void clint_send_ipi_mask(const struct cpumask *hartid_mask);
-void clint_clear_ipi(unsigned long hartid);
-#endif /* CONFIG_RISCV_M_MODE */
-
-#endif /* _ASM_RISCV_CLINT_H */
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index b355cf485671..7edf15643146 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -31,7 +31,7 @@ obj-y	+= cacheinfo.o
 obj-y	+= patch.o
 obj-$(CONFIG_MMU) += vdso.o vdso/
 
-obj-$(CONFIG_RISCV_M_MODE)	+= clint.o traps_misaligned.o
+obj-$(CONFIG_RISCV_M_MODE)	+= traps_misaligned.o
 obj-$(CONFIG_FPU)		+= fpu.o
 obj-$(CONFIG_SMP)		+= smpboot.o
 obj-$(CONFIG_SMP)		+= smp.o
diff --git a/arch/riscv/kernel/clint.c b/arch/riscv/kernel/clint.c
deleted file mode 100644
index 3647980d14c3..000000000000
--- a/arch/riscv/kernel/clint.c
+++ /dev/null
@@ -1,44 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Copyright (c) 2019 Christoph Hellwig.
- */
-
-#include <linux/io.h>
-#include <linux/of_address.h>
-#include <linux/types.h>
-#include <asm/clint.h>
-#include <asm/csr.h>
-#include <asm/timex.h>
-#include <asm/smp.h>
-
-/*
- * This is the layout used by the SiFive clint, which is also shared by the qemu
- * virt platform, and the Kendryte KD210 at least.
- */
-#define CLINT_IPI_OFF		0
-#define CLINT_TIME_CMP_OFF	0x4000
-#define CLINT_TIME_VAL_OFF	0xbff8
-
-u32 __iomem *clint_ipi_base;
-
-void clint_init_boot_cpu(void)
-{
-	struct device_node *np;
-	void __iomem *base;
-
-	np = of_find_compatible_node(NULL, NULL, "riscv,clint0");
-	if (!np) {
-		panic("clint not found");
-		return;
-	}
-
-	base = of_iomap(np, 0);
-	if (!base)
-		panic("could not map CLINT");
-
-	clint_ipi_base = base + CLINT_IPI_OFF;
-	riscv_time_cmp = base + CLINT_TIME_CMP_OFF;
-	riscv_time_val = base + CLINT_TIME_VAL_OFF;
-
-	clint_clear_ipi(boot_cpu_hartid);
-}
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index f04373be54a6..2c6dd329312b 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -18,7 +18,6 @@
 #include <linux/swiotlb.h>
 #include <linux/smp.h>
 
-#include <asm/clint.h>
 #include <asm/cpu_ops.h>
 #include <asm/setup.h>
 #include <asm/sections.h>
@@ -79,7 +78,6 @@ void __init setup_arch(char **cmdline_p)
 #else
 	unflatten_device_tree();
 #endif
-	clint_init_boot_cpu();
 
 #ifdef CONFIG_SWIOTLB
 	swiotlb_init(1);
diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
index 8b85683ce203..07626be78c23 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -17,7 +17,6 @@
 #include <linux/seq_file.h>
 #include <linux/delay.h>
 
-#include <asm/clint.h>
 #include <asm/sbi.h>
 #include <asm/tlbflush.h>
 #include <asm/cacheflush.h>
diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index 5fe849791bf0..a6cfa9842d4b 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -24,7 +24,6 @@
 #include <linux/of.h>
 #include <linux/sched/task_stack.h>
 #include <linux/sched/mm.h>
-#include <asm/clint.h>
 #include <asm/cpu_ops.h>
 #include <asm/irq.h>
 #include <asm/mmu_context.h>
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
