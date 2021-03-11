Return-Path: <SRS0=wDqN=IJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8074C43381
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Mar 2021 16:48:15 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F6D564FF5
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Mar 2021 16:48:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F6D564FF5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=a0JOpJ+Pk1kcv9iz2Uwin4q/nRiRdIb31+dBZAFmKWY=; b=WOvSVodaJwCKpjCb2gXSygYbu
	FUtGmDXLZsAargT0LeCk0x+P6OT+uEoK2OZ4wpVFimNJcahqYFc/myQ6ngXu5OW0XBkxlsc1iYS2C
	pnzb81xmvL7PZXFM4OA4L7JuD05jtIshjzgtJPYcAuFhi99M5KVHCNWHPg87DypwJsXeCl07YfFh2
	4RrZTbcrwd2qkkNY5zcTD5kHbJdIy04WpIS+qCJgqcm66rSEAqH/tFxEAeD+QfQMuDrx8wwCBBZBB
	jZzgtQmXneeZhqBkRIJ5smlB8JdiSBQeKLPZaB/dQz3Wjg/Tq7gHTHHh6VZi6LqgZ4mpToeKLHFe6
	+LvIFFXZg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKOTh-009bxY-PI; Thu, 11 Mar 2021 16:48:01 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKOTc-009bw9-Gg
 for linux-riscv@lists.infradead.org; Thu, 11 Mar 2021 16:47:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1615481277; x=1647017277;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=p49YBvRt77kHU5iHzZps3D5w/Ox7oN4yAw2RiDzYMb0=;
 b=JgHj5g3tb1hNnRjX1GimgFd5H5LixdpZdiCzjsgWwg+1n9kN6f2COJ42
 3W5bDbAVAihaVI15TVo2Nb8gymQeIKHxOOrdHnaZ/0JYKIEekpotLpeTw
 sujjeJjvnorPxJzd+A7UTzivt5yhO/E/jheBQNZz9o85Go4M0zMx1kpCb
 7KODQplXq6a6wk/bM2p1OCGG4uCJEb/P7o1lAKnR5UJEemc6QD6cRT+3R
 MgerBFtBRpLD3ahxY1qUtpqctzUDm5dOLzQURK1eS7zC07TbkDjyKxuys
 GKyKeVIK2hyj2CW4SGC9Qfl2gQmooB/oGUFGJlhoz12kWtzLuAaDsfdB4 A==;
IronPort-SDR: wW4BhPcCTCzCdjX6jnQeSXqhGr5EF5/wRY6CXj1ogy1jRO0+4rfk4x3qStMRLavjkmA0ET8wNx
 Y/xGfBMJ2k/y9h2eOzhjGVhDPFfpgG0k5ua0eTlyIeZYqm+b47ZevcWC84pWMYTKAs5s3Da7sx
 jQMYaGkLtMPhzc8KaxnvYemTHSD19vQizFjcUY5wjsOQri5Vgxt29co7zMAWepI5sF9MWnvOOE
 orfRM6Dua4f3IICfbvYVd5pEey85CSW0ZajVW0PbOaGbI3ZdBEAhIUMEj5KRfMtLBo819MdBVe
 Kpg=
X-IronPort-AV: E=Sophos;i="5.81,241,1610380800"; d="scan'208";a="163089387"
Received: from mail-bn7nam10lp2109.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.109])
 by ob1.hgst.iphmx.com with ESMTP; 12 Mar 2021 00:47:54 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ay4ERxtXFK/KM27k7sLzCjeV4U+X2rld8SHXjSIBMk4UypHqLVLqHzNU2mlh4TsObl0xxoFRLchw1QP/qfYcrM6uuH1LbLD4DGfu5EWQRDibGeVuYHNX11FO1omBHBJa+Bptao8zM3tIkhYucPNjyzCd2qUr+9IOexoCa2s5Fup0lpyMMLkCJ0iEzq42zeDOyG7VOnpWs8vJgk9xAXZKdAaRukMhcikLAAM6SktHkm15qqcU1CBMdd4/BbI1GyLxbldjGN8Nyabos7gAO0xzCjD/Efurnax9CSQBYzBrKERr+brNcE0wlBBk3hO5yH3qNzuIxDDwN44UiPjvebupqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+6BEj7b9CYeUOeXqSSGwypzpIN4o95ibgyatJHBiJ9c=;
 b=Dtdx+HU/ZHDD6V5vROqtJ8aNSaXX0s6hPrworG8AX6CkuWuH6ZvKw+UL+SRQ0b2N6nv/yIqhpSaJdtFucqtsYPUUzuGSSIn0jPBxvgBagSBFg9w5Spus+Wgw/QezgyKNwcjQSoGSd4dU3RbxWxN/9aj1WM8hgykQtJBgUdoKay0iVdRi+CICuSaAsNl1tqlNH6EcEXNHBOwuQlYaAgeDtkMkwm6LF3x1M4yrTeqd/7ZHSMMhJECVvDEgj1wECIwfRswfpZP2HncUOSikUn1Lgc/LBEIJ1oxoFPXpXbE8aTEjHKeZLHEMalJWBbIayj1SF/A1DYJ/8KQgG9JHl2aN+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+6BEj7b9CYeUOeXqSSGwypzpIN4o95ibgyatJHBiJ9c=;
 b=waFX9Sw0PBrUcLesYbwIUfe5nyUusmZsOD8qVVERQeOSw158y1tKz9KsacrYMzC4t+UiZhJTfsnj9sjceKNgMNqAp5OYkL3kaHIQhLcN33y8SPd3FmxMEfkFk6u3Qjc6EtDTuj2wjkJK2mPpjJVu6xVo1XYhAsDNBajrNbLkpRY=
Authentication-Results: dabbelt.com; dkim=none (message not signed)
 header.d=none;dabbelt.com; dmarc=none action=none header.from=wdc.com;
Received: from DM6PR04MB6201.namprd04.prod.outlook.com (2603:10b6:5:127::32)
 by DM5PR04MB0218.namprd04.prod.outlook.com (2603:10b6:3:77::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.29; Thu, 11 Mar 2021 16:47:52 +0000
Received: from DM6PR04MB6201.namprd04.prod.outlook.com
 ([fe80::38c0:cc46:192b:1868]) by DM6PR04MB6201.namprd04.prod.outlook.com
 ([fe80::38c0:cc46:192b:1868%7]) with mapi id 15.20.3912.031; Thu, 11 Mar 2021
 16:47:52 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>
Cc: Atish Patra <atish.patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Anup Patel <anup.patel@wdc.com>
Subject: [RFC PATCH v1 3/3] RISC-V: Add handle_IPI_noregs() for irqchip drivers
Date: Thu, 11 Mar 2021 22:17:12 +0530
Message-Id: <20210311164712.652608-4-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311164712.652608-1-anup.patel@wdc.com>
References: <20210311164712.652608-1-anup.patel@wdc.com>
X-Originating-IP: [171.61.72.64]
X-ClientProxiedBy: MAXPR01CA0113.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::31) To DM6PR04MB6201.namprd04.prod.outlook.com
 (2603:10b6:5:127::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wdc.com (171.61.72.64) by
 MAXPR01CA0113.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:5d::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17 via Frontend Transport; Thu, 11 Mar 2021 16:47:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2207b080-c5fb-4cfe-cd92-08d8e4ad69a1
X-MS-TrafficTypeDiagnostic: DM5PR04MB0218:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR04MB021834E165515A05F66DD10D8D909@DM5PR04MB0218.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5dBX0UqOJIykUh6gG4rj3Uv9FK/JU5+vdxhkvvrrcTO+f14RaRcVfUBXhApFzagBkCEQ+3CCf6deGDdPFbsif9CK9Ua8TE22X3NB/qyldDxTO8ieKJAZyJZYUKv9/L47a7UK1sqwR1ZwSumJGv3jxYNpoMBtBhZ1wlJ4Bn9X+Wbec7YhOlXtQplAGjhthX8PcpaTWGihexe+ph6D16rNMaDyH1Yz8+NKiFgMTuCDYm3RfLpKe9IhIx4WRdavnMSpF/nFoa2PjlBV5iAUJkXZfjb1dLq6UHE0WohgUy19IHNytZYAMPc0G9SLMphrs7WGrPSH1ntnN0VJnBa1F0OKlxnympmBj6GkU5nF/6K11TQiSU8IH6Obg42OR4ULbMEP/GyRafW+pEYP+WyVQPRrxq7nL6dpC3uUXS1mkMwOY61BxEYoKDXVT1yDuMq9VC/wt9QsvpZNxjoFRZzsntE5krphcSmLxBxu3KQVHMH4fMIuB2DEh5/o/KhOG0XkAUF6hYtAtaREX7RfEA1eR9kaRw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB6201.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(396003)(346002)(376002)(136003)(316002)(66476007)(66946007)(44832011)(36756003)(55016002)(8936002)(6666004)(110136005)(66556008)(16526019)(8886007)(2906002)(54906003)(478600001)(5660300002)(86362001)(26005)(1076003)(52116002)(7696005)(8676002)(956004)(2616005)(83380400001)(4326008)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?dqM08nYbC38V5e3o4ZA6SPM2R9TKlKcHLJCQZX/z1ESUprCsjaVE4rLYxB7f?=
 =?us-ascii?Q?hkOh1qxI7+sjqAvgDm0W/gD8FDA43LWq3wjrd/cozIYLNi6wmIOQQaVK9Mnd?=
 =?us-ascii?Q?DG5ypFMW1KIGeLi2Yd+jeAF/AgjMDV0RmRQAF8x0wQKfdDIrZdsv24itzYOq?=
 =?us-ascii?Q?oxR/05PSSRWgINmV9nm8YzNDsNmQyPLl7ts1I1J3qz23GZFBzjsB1TNUDirk?=
 =?us-ascii?Q?VMgdJVrx/uvqGvzKDX3YTLUCvToBgZqv/rX4VJryjkjkh14qJnJM2oesotyt?=
 =?us-ascii?Q?QptF2MdriEZjxP/hbOwNL23OzpoPxoA2kDzqoKAvjGwbF6fndT+6hmiRxFt4?=
 =?us-ascii?Q?4WJmONA7wt1HdKiNlzy+BPFxQ8Ym9zpx6nhSPQs6ku2Hxt3bmnQusn3EGG91?=
 =?us-ascii?Q?QTHbTZoYkLa36IRctDl+Vh0jxhzoVzqtWni4Mfp41bogHUpkQeZVLxv2CAH7?=
 =?us-ascii?Q?UM6cpT8aJDbdpIHTWA6PL+iH44/YW9oaGMkd+rvbBjHX7T3AmQLft4gReMKO?=
 =?us-ascii?Q?PHa4ugURS3OqTEU2BLysjRvAfQQFQxXJObfkmc+2uV0pPR4YSvIvar1Bcm6e?=
 =?us-ascii?Q?iYp7G1BIXA5uyLGiWjxLdclpgOhTu5TWxCI9p5zWzwfKY7IN5Pn28E/rCoTi?=
 =?us-ascii?Q?BS7/Xfdpv+eIJsdSacHpsy6wpDOxzzEdi6y8Hed8FufYjGQ8RnBQEh9yPBrC?=
 =?us-ascii?Q?whXXJueDaqyecTZZTdYlFSHcHDyQ1JFJXxhbSar6AOXVmRJRPRE/i30F+VDR?=
 =?us-ascii?Q?GE80dSH/ypYBX7X0LfFGCDeavBYVRq9Yjg8rpvfYQFf4pd4v0hKxZOFOKXw2?=
 =?us-ascii?Q?/0dN6u6WzX68fUem1lZr6DeuPoi2A30DJZ87O8SxLWwwwj2y7UH15/QnQjYL?=
 =?us-ascii?Q?JdCHXy17UxMZqOEoMkwqTH94e39WwgoEAOwR5RmktNZN5mWsHvzXmjLMyqEt?=
 =?us-ascii?Q?dPZz8p3E5MdNTXR4fG398+MFBL9J+doUjK2huu9lIGa8stfddXhwrC/L0aql?=
 =?us-ascii?Q?xVgnvCCiAuGtrsWtRyFx//1/cOsizculOt4xMFAXl9sExnBBzCxT3RZE93/7?=
 =?us-ascii?Q?xaGL4sZk7WzBRH8wlCu6cmDfKXyCHIfEads3SMtJ33IuYZMjncISvibtmm66?=
 =?us-ascii?Q?OIsTsZmgkKJwQqG9wXnWkDS5hUDMw3sNDooTb+zGNHWIJjsVzUau33JftwTO?=
 =?us-ascii?Q?/mfTpXwghU6J7JpGwEI8HRwVRGqhuOXBUz6CwGjTIw5vHKQPvyTtjYxqBZJJ?=
 =?us-ascii?Q?IMnnW0KNk3vkVlP6wjOzef8TidUG7Ub22uit7po6o3VvxqOOPhpTyDu/xwXl?=
 =?us-ascii?Q?Zx1lRQ8LLvsEAC3oaYaxvwQc?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2207b080-c5fb-4cfe-cd92-08d8e4ad69a1
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB6201.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2021 16:47:52.8000 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bkVined56BOfL06/7JsMgUHiU1+v5WlJwHbO1G05OAckF+lqBpZM+Qe/gN45pbSaIhN5rffC7TaD6g+ivc2eyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR04MB0218
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210311_164756_969322_D13FFBD2 
X-CRM114-Status: GOOD (  18.14  )
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

We will be having IPI handled through nested interrupt controllers
(such as AIA IMSIC). The irqchip driver of such nested interrupt
controller will not do irq_enter() and save pt_regs because this
would have been already done by the irqchip driver of the parent
interrupt controller.

This patch adds handle_IPI_noregs() for nested irqchip drivers.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 arch/riscv/include/asm/smp.h |  6 ++++++
 arch/riscv/kernel/smp.c      | 20 ++++++++++++++------
 2 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/include/asm/smp.h b/arch/riscv/include/asm/smp.h
index 82c23e5f22f6..b31d3ec2f71b 100644
--- a/arch/riscv/include/asm/smp.h
+++ b/arch/riscv/include/asm/smp.h
@@ -33,6 +33,12 @@ void show_ipi_stats(struct seq_file *p, int prec);
 /* SMP initialization hook for setup_arch */
 void __init setup_smp(void);
 
+/*
+ * Called from C code, this handles an IPI assuming irq_enter() and
+ * pt_regs already saved by caller.
+ */
+void handle_IPI_noregs(void);
+
 /* Called from C code, this handles an IPI. */
 void handle_IPI(struct pt_regs *regs);
 
diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
index 9258e3eaa8c6..19e102e2d5e6 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -144,14 +144,11 @@ void arch_irq_work_raise(void)
 }
 #endif
 
-void handle_IPI(struct pt_regs *regs)
+void handle_IPI_noregs(void)
 {
-	struct pt_regs *old_regs = set_irq_regs(regs);
 	unsigned long *pending_ipis = &ipi_data[smp_processor_id()].bits;
 	unsigned long *stats = ipi_data[smp_processor_id()].stats;
 
-	irq_enter();
-
 	riscv_clear_ipi();
 
 	while (true) {
@@ -162,7 +159,7 @@ void handle_IPI(struct pt_regs *regs)
 
 		ops = xchg(pending_ipis, 0);
 		if (ops == 0)
-			goto done;
+			break;
 
 		if (ops & (1 << IPI_RESCHEDULE)) {
 			stats[IPI_RESCHEDULE]++;
@@ -189,9 +186,20 @@ void handle_IPI(struct pt_regs *regs)
 		/* Order data access and bit testing. */
 		mb();
 	}
+}
+
+void handle_IPI(struct pt_regs *regs)
+{
+	struct pt_regs *old_regs = set_irq_regs(regs);
+
+	irq_enter();
+
+	handle_IPI_noregs();
+
+	riscv_clear_ipi();
 
-done:
 	irq_exit();
+
 	set_irq_regs(old_regs);
 }
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
