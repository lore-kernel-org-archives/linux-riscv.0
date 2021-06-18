Return-Path: <SRS0=UO3w=LM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6183DC49361
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Jun 2021 12:40:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30C6C613ED
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Jun 2021 12:40:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30C6C613ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wN6D+o84jaa+H34cS9cCzKGTesP7NBowDngyVEOvI/I=; b=ycObuFTfAszaTk
	MQN/9n6uwwyyQC4FhvEfAwnQlIMYuuMtuX9b0KVXo1T0zxUkyJbfBhXfXbl5SKdGsHGuwgiy/smOu
	uUfAuBqt4grWE2+VzchfF4a3ljmXcmG/1N+OR/w08cE7PNLnqSnXwRtspV/IjPYfhPYr92Da/c1fp
	RuObDfGB5Ho5aH/8SHC0kEWD7RAamiVTT75Ed7WUoezcpEiHz2TyPVxqJs55zDiemNHFtAONX4eyH
	5Geh/PIXgVOUySNLVpuDuu4ihW936D2S0yvJ2Dfeh/wk8/rntpg9GBgULw7qbyDFS9Ix2XfEA1/F5
	jvSlqHX79tP219/n48Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1luDml-00E2xo-W8; Fri, 18 Jun 2021 12:39:48 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1luDmf-00E2t8-D3
 for linux-riscv@lists.infradead.org; Fri, 18 Jun 2021 12:39:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1624019981; x=1655555981;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=jkbKSZvRwwjsXmYu1Ws9MweMMyO4gkhzwEKijSyT1hU=;
 b=q1Zfk/8CAd3CUleJwXJ3tWiL0sSM4Vz9psXejSocMHSHUNLf2xKSEgvI
 LgZSXzXFXlMemYOg7UOlqSz2+xUFac373mOesS7/BS+4Q1cKOc1KS4Z4m
 PmrG1hY/91zzSRh1IiDCpScStxy1ifoaBnharTdT7sOGECIqRmkSr32Oh
 pAs37C1gRl67B3M50/V8JOEycx1VPbAs0ZQtJUthhK1wkwYR+cbTegd4S
 QWxogbC5oq3ghGawGNA29zurm9Vu/Wd+1MwdvYoNTlTRxT+5hdCRRN//3
 QmmLJchIBsUK4+7gPiZTkh6LiRtu7OcpXxq885Jv1qxuhWHOnmsj+ULpq g==;
IronPort-SDR: 8847SGLHPkENKLL64S0l0Uq5JsOU1FFYfmwVcnLxsIbI9uIBxRoS7xftW9wp33k6Zoi3HClFgG
 fK6503rFwVbrx964Zu1q8XXlNt5Vaqm6ILH6xxtdE4EOKTr1vlmfLXAZEZ8hzMNcg5ODtA827F
 R4xBnApb27iKAsaZaXtcZpr1Gn2/EoEgshMs5/gzu9PYqXWrqc+1GtF56VDL+VQ8SYOt4uX4a2
 qVN+PVUBo0WB25MDJ33qsJQmqTnro4iLQkI5Bm0A0kFA+MA11/c/cM70lU+vNe19galoUq5XZe
 ysU=
X-IronPort-AV: E=Sophos;i="5.83,283,1616428800"; d="scan'208";a="283779313"
Received: from mail-mw2nam12lp2045.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.45])
 by ob1.hgst.iphmx.com with ESMTP; 18 Jun 2021 20:39:40 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ScKLZaQnEp5d87os23dCl2qpwbHNHOooaQaBVBVQUp/iptZiDoWEVVaOE/reh5WrEv80qzO6WZVSKen6k4L+I7plU3LXuCdHMng3RL9AuhkokqGBlNu9S07jRbnaLcokpwnXaDuwY5XQaDPFYAW9Z81XL8v52oPX9W2WEg1+Uvu4eICzVobkr33vPn7DYdFh5/qzYfjZH++Jgsgy8Iv02unez2BDAgtOYcVTcnRtlmZPvdWMPZSDiUUDHFcJif8WWEoZiqIGHpC23RiixY+fkl+Ddyo5HsRY8UW2OvRgTPjCy+cTnfxm5wZY4mn/o8Ig5C64fraJyCwTmMw/z95BAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Jtqet2fuPqM7Ms6NUR+wXwwQts7PJjG2T9FblTTEjs=;
 b=DkQSLuxiTz1JX4fFz5yBtQmR0y4FAcs2Uk0xfPhWIrIRzJjkXggcUTKBPf1YCpE8L51SD9YOpWZC8MpVvr9WzxT+KAWaPbllljLe6h2smE4wIS3oWTxroD1c6cPr54FqniNooB0BHJ+lp7JtP0vK6L65wY5qVTNlWH/nInLDP38nKrGMKqjzWmyXvM+bKKUFl4tQ4HXvelRAZF+7R5nFeM354ulYrxYUmjyYfAdkjSZ5zG+zAJy6zpQTPWGd2wOnB2+Ipwi+2ZEyKB1PsAVZbo2x3HnkXzZnQQJbKJ7u3bw6ZQoP9dTlhvYlctBWCqQn/QXN8pG6NyXAyTYJxG01Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Jtqet2fuPqM7Ms6NUR+wXwwQts7PJjG2T9FblTTEjs=;
 b=gCKpNfl0bJjmwKX2e1Ez98jpYdv07tNG2FBqqZtMRxbJA4RSirgnBbSG2pqYS+dm7oJ42kAWNmH+kYvM0Od9Tl9ACeUiXWv2i9wKHn/A7khQRD/81HMOMy8KBBmSkCElV+A7YJ+75NtOwms+TCpaSuweQ6VdLBT8EUWu8eEZ+ds=
Authentication-Results: dabbelt.com; dkim=none (message not signed)
 header.d=none;dabbelt.com; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB7843.namprd04.prod.outlook.com (2603:10b6:5:35f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Fri, 18 Jun
 2021 12:39:40 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::a153:b7f8:c87f:89f8]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::a153:b7f8:c87f:89f8%9]) with mapi id 15.20.4242.021; Fri, 18 Jun 2021
 12:39:40 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Rob Herring <robh+dt@kernel.org>
Cc: Atish Patra <atish.patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Anup Patel <anup.patel@wdc.com>
Subject: [RFC PATCH v2 05/11] RISC-V: Use IPIs for remote TLB flush when
 possible
Date: Fri, 18 Jun 2021 18:08:45 +0530
Message-Id: <20210618123851.1344518-6-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210618123851.1344518-1-anup.patel@wdc.com>
References: <20210618123851.1344518-1-anup.patel@wdc.com>
X-Originating-IP: [122.171.164.186]
X-ClientProxiedBy: MA1PR0101CA0025.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:22::11) To CO6PR04MB7812.namprd04.prod.outlook.com
 (2603:10b6:303:138::6)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wdc.com (122.171.164.186) by
 MA1PR0101CA0025.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:22::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.15 via Frontend
 Transport; Fri, 18 Jun 2021 12:39:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 39a25055-3193-434c-c26e-08d9325623e6
X-MS-TrafficTypeDiagnostic: CO6PR04MB7843:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR04MB7843F2ED83EF4E564498721C8D0D9@CO6PR04MB7843.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OhZbIarndPcvfNjL0T4K4c9f2+GsDckg/fUENjD7kUxloZosBYXFJ2y7nZZnBDka6LfWpre9395tzWgATt7g0iCFc9UTMjfsawT486C9a7mcvVveGp0SFfuUTaOhiSkajPgnaxp0dlfuxdotCYEQPkZEoDLyoG4Xy5G5/x9ZusaVYxAyi6ZZgYFcSnAsfVNHBgkaJdi1AzmMHyL+H+Avase9/USKkr8P5cq1bPoAKqP4UQNMW2kkW6R5FKdoQPb4b2wMLUNPmltC65+vWc2MBV0nHCej4epxlfkIQPqKoeErl408GUQM/Uux4IAnM72+PI5aWGX6oQb9FIQEhIhV7RrM5VbIGbBRYc59HC1sV9Xl66BAahtoI2e6Sh95rJV5xYoSt1Aa6u3yyUiQUvGa94z8RvKdOb4EfVT+Xs8RDbpuNKJk1dcwJb2vOB3emODHv9SSd6zqtN2FbvwIChq/UDK8LhC4q6Ab9m1t0OnBWeuOmppdnWdEu6+SnNlO95Zvvy6oT3FXivoTlR9+WFhEflUVsyGZ1BkVpYM88yXUpyUQIEHYnubwqEjVymgguqUe6aaTv1csIvRVDewqqNzBkQorpr/+uUfKEACahEt+hSKrSpCy2nr7evJJRDri6DQ4N1dXan1jQXxJ9I7hZ3ECLg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(346002)(376002)(136003)(39850400004)(83380400001)(316002)(4326008)(16526019)(186003)(110136005)(54906003)(52116002)(26005)(55016002)(2616005)(956004)(2906002)(5660300002)(7416002)(478600001)(38100700002)(38350700002)(8676002)(66556008)(8886007)(44832011)(86362001)(8936002)(36756003)(1076003)(66476007)(66946007)(6666004)(7696005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hxp6OB7BGKiMHA2Y7buI68gQ0LPeF8rIJzZX3QkFvHcmV32Kll/9KMK4XS+/?=
 =?us-ascii?Q?R/jZhcOTRFzXFVGGEdHUV8s/tQkg3NUCujfKQ5EmC6rA+r6ZIWXvUa7O0K0U?=
 =?us-ascii?Q?QVcjy4t9eJFDMmso9vAlYofcVcrP2yoGxe/EhOGOXdIdFyHAlRYIHLmapj54?=
 =?us-ascii?Q?MP09oIXpEzk81Zxp1nRqeXgU8QOk6Ifv4i1oqlieQKa2wKux9XsPCQnLHVFG?=
 =?us-ascii?Q?zJP0/A74x0niCn35DuRRhnzpQUjNEYpMPrer/SGGWJuyF7oKfEZ+hv2Rqtge?=
 =?us-ascii?Q?YnOrSHHzYFEszdKUVE4HNJADDG2etLSq4jMDf7w9/Fcxnfeb6NCKuer090Z/?=
 =?us-ascii?Q?UV3crvmvOk1nbWpl6Gj4OSmPCt2/OeSRJkXhgx049KVCr5njmQSGFvAV97Oy?=
 =?us-ascii?Q?CPAB/MTuEuoMbdBtRGQnn3o36qxLwNzVGn3NQH0ZxZ5VHaxtP7e0J/lGpkYi?=
 =?us-ascii?Q?uDhJMvDdoUFQgwN61C01eQOXx7Pc6ikpb5hWjvdAooEUboxtreHCqCQ+YNOV?=
 =?us-ascii?Q?3I5cAgJuAIuTHUKXNCgd3gDvexOlnGmnBcxVgZGYxn2k9/GbVqXgh3SuOacb?=
 =?us-ascii?Q?JE+LEGIueIED6DZyy1XVtP8FTRGtdZ3DLJIF5hVMDx32ovom5BcYP5JVkBS2?=
 =?us-ascii?Q?/GkSldKTE/48oT/3GfzKs7BrlnDQBP9KddpkbdovAtUnb4MXJUgHdsEP8t24?=
 =?us-ascii?Q?uVBZVdJqDj+SVGeu3ziEclsDXAm4IMYQ3ryfnUFnxlOY7C5t/Z7NywA5jKIy?=
 =?us-ascii?Q?CImEo8y2+Jdw9MHUB3GN45r4FwUNhEYie2q5jpXEYXN1E6JN3jFBw2P4yGcN?=
 =?us-ascii?Q?6iYwWnkbeS+1oqkG30mEZEOXQEUpdyRm4QE5ba7XZNtZD11bd3XFT4emp7lH?=
 =?us-ascii?Q?WKBitTDmafeWeQ27siZu1j6p5eodZzCPQVaGnvZzN/c1xc3EEVyXielkwxB0?=
 =?us-ascii?Q?lW1SYYAi9awnQAHpNHe8BLCv7BMqKt21cX6FQZTSS2ffdyCF87rXv3+lME5n?=
 =?us-ascii?Q?v8wTllz92l60wGQAFAjj62EkkrU2d2FyRYmSqpq5YpbGElzrhl5jGcgFO5/L?=
 =?us-ascii?Q?5YUB4HKA0g+/B0nCa2SfYXQ8YUZYI6btCrQ8eWze+SHTWDUP46aQy3+1/xwE?=
 =?us-ascii?Q?zEyMEQBft8RIaV30o7mWbu8xeZ1UnPBFlbsDVr+tjQbnwp2LrXKeYEH0+4FA?=
 =?us-ascii?Q?jtR5zvFh5CqBPYcECaCWegVMzPja9h73Pw9HwJ9/IsifZQQt1g5uQ2YjYnBv?=
 =?us-ascii?Q?0Ga3NMIbH1oGlTNSdbD+nyYRWrDxnZT4BFle8uKcYrVWrKDwq5XQ8WeNRF30?=
 =?us-ascii?Q?6w+7QDJIY1KGUlOMKL0g9stz?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39a25055-3193-434c-c26e-08d9325623e6
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2021 12:39:40.1573 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: smPtT+AnXekOmDx6naCgizKfXxfJFwBwenKhym2t7FXPNvOB7yPqp0lu0CoZ+Lu7UrDqAhDQe/p/ssBLSgQcvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB7843
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210618_053941_498056_9E18AD0B 
X-CRM114-Status: GOOD (  19.19  )
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

If IPI calls are injected using SBI IPI calls then remote TLB flush
using SBI RFENCE calls is much faster because using IPIs for remote
TLB flush would still endup as SBI IPI calls with extra processing
on kernel side.

It is now possible to have specialized hardware (such as RISC-V AIA)
which allows S-mode software to directly inject IPIs without any
assistance from M-mode runtime firmware.

This patch extends remote TLB flush functions to use IPIs whenever
underlying IPI operations are suitable for remote FENCEs.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 arch/riscv/mm/tlbflush.c | 62 +++++++++++++++++++++++++++++++---------
 1 file changed, 48 insertions(+), 14 deletions(-)

diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index 720b443c4528..009c56fa102d 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -1,39 +1,73 @@
 // SPDX-License-Identifier: GPL-2.0
+/*
+ * TLB flush implementation.
+ *
+ * Copyright (c) 2021 Western Digital Corporation or its affiliates.
+ */
 
 #include <linux/mm.h>
 #include <linux/smp.h>
 #include <linux/sched.h>
 #include <asm/sbi.h>
 
+static void ipi_flush_tlb_all(void *info)
+{
+	local_flush_tlb_all();
+}
+
 void flush_tlb_all(void)
 {
-	sbi_remote_sfence_vma(NULL, 0, -1);
+	if (!riscv_use_ipi_for_rfence())
+		sbi_remote_sfence_vma(NULL, 0, -1);
+	else
+		on_each_cpu(ipi_flush_tlb_all, NULL, 1);
+}
+
+struct flush_range_data {
+	unsigned long start;
+	unsigned long size;
+};
+
+static void ipi_flush_range(void *info)
+{
+	struct flush_range_data *data = info;
+
+	/* local cpu is the only cpu present in cpumask */
+	if (data->size <= PAGE_SIZE)
+		local_flush_tlb_page(data->start);
+	else
+		local_flush_tlb_all();
 }
 
 /*
- * This function must not be called with cmask being null.
+ * This function must not be called with NULL cpumask.
  * Kernel may panic if cmask is NULL.
  */
-static void __sbi_tlb_flush_range(struct cpumask *cmask, unsigned long start,
-				  unsigned long size)
+static void flush_range(struct cpumask *cmask, unsigned long start,
+			unsigned long size)
 {
+	struct flush_range_data info;
 	struct cpumask hmask;
 	unsigned int cpuid;
 
 	if (cpumask_empty(cmask))
 		return;
 
+	info.start = start;
+	info.size = size;
+
 	cpuid = get_cpu();
 
 	if (cpumask_any_but(cmask, cpuid) >= nr_cpu_ids) {
-		/* local cpu is the only cpu present in cpumask */
-		if (size <= PAGE_SIZE)
-			local_flush_tlb_page(start);
-		else
-			local_flush_tlb_all();
+		ipi_flush_range(&info);
 	} else {
-		riscv_cpuid_to_hartid_mask(cmask, &hmask);
-		sbi_remote_sfence_vma(cpumask_bits(&hmask), start, size);
+		if (!riscv_use_ipi_for_rfence()) {
+			riscv_cpuid_to_hartid_mask(cmask, &hmask);
+			sbi_remote_sfence_vma(cpumask_bits(&hmask),
+					      start, size);
+		} else {
+			on_each_cpu_mask(cmask, ipi_flush_range, &info, 1);
+		}
 	}
 
 	put_cpu();
@@ -41,16 +75,16 @@ static void __sbi_tlb_flush_range(struct cpumask *cmask, unsigned long start,
 
 void flush_tlb_mm(struct mm_struct *mm)
 {
-	__sbi_tlb_flush_range(mm_cpumask(mm), 0, -1);
+	flush_range(mm_cpumask(mm), 0, -1);
 }
 
 void flush_tlb_page(struct vm_area_struct *vma, unsigned long addr)
 {
-	__sbi_tlb_flush_range(mm_cpumask(vma->vm_mm), addr, PAGE_SIZE);
+	flush_range(mm_cpumask(vma->vm_mm), addr, PAGE_SIZE);
 }
 
 void flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
 		     unsigned long end)
 {
-	__sbi_tlb_flush_range(mm_cpumask(vma->vm_mm), start, end - start);
+	flush_range(mm_cpumask(vma->vm_mm), start, end - start);
 }
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
