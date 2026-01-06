Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFF0CC47BCF
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jan 2026 09:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ja9Ehekalek9LpgFvZOpudroga5nRJpkuIt6WBcOEOY=; b=Rv9Sk/yOBad4v2
	TLYZnqgaD7toGdCESA5UxXaHPdE3uR674FiHA7PklSkoCHdccYB8xiSobaz1muwdhSaBAcJiMzrF9
	0Z0cA2TqXCU4j4rOT1S7vu5LRwwdImqstxealoLAC2szAuBfApcKAK7qxvi5w4Kr3RWsK7upD6Z77
	nc63AjK1Td64cMoEZd044l9g4dXHEr1v8shFdvbY8Ze7gCtaSTZyhWeFcZgZklK95ZHxO9fDqxKOV
	GascGC6JlD1jA7Sggk2O53STQJ8ziKDf00bJlF8VmfQqw6116pAsAtsSUarLZOEYNnCWMFOX5iS3c
	UrxYM3/QmnxDPvGNtFgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd3H9-0000000ChXQ-2bqp;
	Tue, 06 Jan 2026 09:22:51 +0000
Received: from mail-sh0chn02on2108.outbound.protection.partner.outlook.cn ([139.219.146.108] helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd3H7-0000000ChVV-23yw
	for linux-riscv@lists.infradead.org;
	Tue, 06 Jan 2026 09:22:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D8bYIrqGe/9tj+I/02JeFwgbIht/VTONxgveTrUDPF2HjEtM+9TuVvGn5NyDmsb62bZxRbyzegdFIfC6tHQ/23UNlV6kSvRu8B1TiPgl2WYgmnIf8YjID+fCeRB1d+aQK/Z/I7apR5lES8s2KvL06IjZBcw9EgGhM86XENiW2qgQNCbAtniu1FpuHXp8j3ghmakcDz3Wxhy3bNdek0vCzjkqTRYMDCTWF0F1BH+tSRMOONykY1+W5pZCsP6ApqCvcVuXSuHihkow22WAt9aDivWMG0RaMIZfdgJTxdqljuVET/BwSmo5K9PbN404Y7tRm9AKg4vYk6Jr/Zh3D3IMZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ur0Zu1ZfgULTGPHXoJkZKxzKzahgPq68u4jKhcp7Jk=;
 b=ZCYLa8FZHF6HV7a3dc/jc9NYAFF/Y2VvFD0VKA8MV6RQL4o1cf03aE4Wh1AfXbF9LAvTzAm9ShhQ5dgPVHjkSvVZg6OAQFrXxARld+NxJzq/LmxqIUCvGlqhx6TLzoQw6a6bgRg48Mx4jqrH1FK2VnkBQGFwzWvXDVe9/X41JWOdHJoMGHHTSidV9KDFq1fEw47jdfRrigpquLAmTfJNFmpmWhz5bpqdUsLCglO9j8jcXYw09tajpq65JLeC45ZaA8i9A33zi6ycEFTmml6VPS0ebDZllv8/sTNUz4Dco0mdIKtCwue7Shl9D/g6cFUMN6UqAVFZa2kM0thRJS5lLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:20::14) by SH0PR01MB0730.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:22::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 6 Jan
 2026 09:22:36 +0000
Received: from SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 ([fe80::81c4:2724:6a48:a18]) by SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 ([fe80::81c4:2724:6a48:a18%4]) with mapi id 15.20.9388.011; Tue, 6 Jan 2026
 09:22:35 +0000
From: Joshua Yeong <joshua.yeong@starfivetech.com>
To: rahul@summations.net,
	anup@brainfault.org,
	joshua.yeong@starfivetech.com,
	leyfoon.tan@starfivetech.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	sboyd@kernel.org,
	jms@oss.tenstorrent.com,
	darshan.prajapati@einfochips.com,
	charlie@rivosinc.com,
	dfustini@oss.tenstorrent.com,
	michal.simek@amd.com,
	cyy@cyyself.name,
	jassisinghbrar@gmail.com,
	andriy.shevchenko@linux.intel.com
Cc: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH 5/5] MAINTAINERS: Add RISC-V RPMI performance service group
Date: Tue,  6 Jan 2026 17:21:16 +0800
Message-ID: <20260106092117.3727152-6-joshua.yeong@starfivetech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260106092117.3727152-1-joshua.yeong@starfivetech.com>
References: <20260106092117.3727152-1-joshua.yeong@starfivetech.com>
X-ClientProxiedBy: ZQ0PR01CA0035.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:2::21) To SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:20::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SH0PR01MB0841:EE_|SH0PR01MB0730:EE_
X-MS-Office365-Filtering-Correlation-Id: 130d56d1-3fff-48f8-9faa-08de4d0520bc
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|52116014|41320700013|38350700014|7053199007|921020;
X-Microsoft-Antispam-Message-Info: kbrSbf8ooNIykpWGeNs+rku2zPZQ1ha1c+yRHZ2/h3y5iEdAMz2ZOlEPDbuaNKtNyOuqgnZUWq6dvefOdRKJPpqz0+NJT699j43ag5vp4eFoFc3Kr20cAOTNwRu8aCZbSTdWuZn+9snddUhXLRvf1EHTE8z6ofsAQpCyU5b4VChGXT9zzrDbTQJ4nP/v6A5U0er6h93FdwJQnIMEjygBvoNGh+7viSlGZBZOgTtSftnPLOnRcZpOnt2R5SmIGe220mFHesla5vlfdPnRBIXC+vaXLpP1pOq+nXM/maeY4OUhmyoHxPuyf7ClMiMC8TyBL7SK4VQCtW9Mv3ue0thahO5G2kgCYmenNZraHQsgu0mTJzpglMgJvxwcLdvHAC5LWz0k+MoEzkLoRGZMRkervj74iaCI7/rCF9El/X4kqvG8FidVPM6axR9nTYjYDQTgNWyKy72SCMi9H98SMhvOfwn45JyUq/e+OaL16SaMZWlTkiGORGxEK5y0FuJdCAm4LGqKjxWzBCavi2VzFAb0yKAPbYY/M4Fm2hDeu95z8gKkbcXhmwLUgrgj7eRkx81+peylhg47p+y4Qv1if1ZOBThZ+KyQ6mkFOZx4fMG4gVM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(52116014)(41320700013)(38350700014)(7053199007)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ogz8QKKL7Rl5XP1dfaoFpYlk0nsCdIer+YNGT5jtZ4G0nzJfg93I/7H47snt?=
 =?us-ascii?Q?VhAkQmT73006F8tbgUoC9FUqaeFRjE3Y/wt/pwnQXn+YcGEvqLH20Nv7ajci?=
 =?us-ascii?Q?0Gl+1M47h9yZ8/cmMnd6Jo+2SGDrhRWhN7TMjnFhwy9sOHRw9fG7heUjjOzc?=
 =?us-ascii?Q?rQqiROMCCKiosEI4zM6WerROfw7zv9Pg1X4mmL98af5AbzpK3UEpdhKLiyDX?=
 =?us-ascii?Q?F71AhmZbEkUKCKjLGJojadI9ZQ4RZLiWXm/0c5fZbZix6327O+6Xnjyk/w3W?=
 =?us-ascii?Q?xTxjJ/GJUF0+OjUmybFw/FUpUIvD8uYEwo4nLG6HZ1U5AgHau3it1PeXKU5d?=
 =?us-ascii?Q?cOPKcUoCmND0zhzYY4U+KQZCExErPUoG8jodvgUWGpUK26gmko/eXZX2dEj7?=
 =?us-ascii?Q?MUXWR+rs+9iBwbLB9ePslQ+F1+KPEYA/fTb0wG3onNXggZKi/ewbBZIG9yfF?=
 =?us-ascii?Q?BZM0B+UmiMlUR+qYjpMOCJDjZkHNLIWM/jhuCv2wiqdhUuiGUmuq9sJF3BoG?=
 =?us-ascii?Q?bb5kTNtiKk0RQ3L480nkU5daCi8h31obGMghytZfJci1zw+TQYYZuPeRkI/F?=
 =?us-ascii?Q?d5bo/cXAcSNBxfGaxOuK9OkBGjraDdvmHrmLCyObxCKK8zTRcr+emtRqN0Gr?=
 =?us-ascii?Q?XHANfzPwWKy/DpC3U9+2Zwt9NQRtcnSrZ5OiE9ynx9zSdYI8h+Z02/nVE9JT?=
 =?us-ascii?Q?4h6Ndvykp3QK5qUL9NpTfbjim1erkNvagkZn+P+cIZt40+CPddROUuPSABD9?=
 =?us-ascii?Q?GtBTkElsgDG4p6hjPmdRPK+Ym7Ps/ncgxq+BC7lKS139S6411IFdw6WMB+RS?=
 =?us-ascii?Q?/nHXdbLTg+7v6OjaFh2K/glqOmmtXTnkrFtDddiFMNf4EqlclLQFb227kLsX?=
 =?us-ascii?Q?yDGaXF6PHKNju7AONdlec0s4obqIghRnfL24Zg2pbeiPc56ZP/1JB/xowr4g?=
 =?us-ascii?Q?/KtqY8E40A3Dsg1vVT1O1gO3zcJE30CMlAlROcEb83+Dkc24dPfytyNkWZen?=
 =?us-ascii?Q?kd6csIBEToUg29WdryL66hdvODIULheOun0MoYd75D7UAngZeswUoExXEruT?=
 =?us-ascii?Q?rWlRlb51tJdVb+o4BHevACTSzfoUtWpCJFQAEvvMriYF7Dm+cFLIqVOGKXlH?=
 =?us-ascii?Q?7KT3fhzqrigmM7yy/9CRacJkJ2Wiu07gejvUYfMnk7Sw9dvYZhsX1TqIUuWs?=
 =?us-ascii?Q?6tcHm2pr+J9Qjrgsl6TA1gJiYxAyrAjmNb/yL9YRDxyL4L/TNdNmIx9U15np?=
 =?us-ascii?Q?RPlVfXhe8A6LBrETl8l/cw8GcTcwq+sK32XquemaQn9QW7bypICEFUJ8yeYv?=
 =?us-ascii?Q?DD0CYsOl6Z6vpWtPz5U21/VtkWg+KNFl/u2jO3NdF2RZWATHUddj7S44Rajk?=
 =?us-ascii?Q?DM+7Ibs84AOCZL2ZfwnS0BwtOasyb3LZx/ucA8awE75HI5ppavCdJxhIEAZJ?=
 =?us-ascii?Q?yiY8zF+ZWx07Vim6JQMRXEmVp3+nu76UZpKez0+60o/qFP5Q1Ks52eJvCx+0?=
 =?us-ascii?Q?05xWYhgGQS3c+hLUfCasvj4jDAOlZxq082NdsUC0Trx9VocJVOZYe8j51ZW3?=
 =?us-ascii?Q?zBLY155yPS4kNH0zclA9FsCBYGC5GizBNWqdBc6RIwXP7WLN26qsbKv88deY?=
 =?us-ascii?Q?IlM/toiQ1XXL0I93yyt+jpQ=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 130d56d1-3fff-48f8-9faa-08de4d0520bc
X-MS-Exchange-CrossTenant-AuthSource: SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 09:22:35.8492
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f5OtLeW+gXqIZyt2s6RAzl5c7/6Yhf222wQq/b/gOwwv8Z8FEsZ7dFoW8DjlW/Fqkv/16YKnE5wQ87HFF9ueNCOz4tA765AuUqzjnil76+M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SH0PR01MB0730
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_012249_527994_6F5ECB01 
X-CRM114-Status: UNSURE (   7.35  )
X-CRM114-Notice: Please train this message.
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

Add myself into mail to list for RISC-V RPMI.

Signed-off-by: Joshua Yeong <joshua.yeong@starfivetech.com>
---
 MAINTAINERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 765ad2daa218..fa47e94446cb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22508,14 +22508,18 @@ F:	drivers/perf/riscv_pmu_sbi.c
 RISC-V RPMI AND MPXY DRIVERS
 M:	Rahul Pathak <rahul@summations.net>
 M:	Anup Patel <anup@brainfault.org>
+M:	Joshua Yeong <joshua.yeong@starfivetech.com>
 L:	linux-riscv@lists.infradead.org
 F:	Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml
 F:	Documentation/devicetree/bindings/clock/riscv,rpmi-mpxy-clock.yaml
+F:	Documentation/devicetree/bindings/firmware/riscv,rpmi-performance.yaml
+F:	Documentation/devicetree/bindings/firmware/riscv,rpmi-mpxy-performance.yaml
 F:	Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-mpxy-system-msi.yaml
 F:	Documentation/devicetree/bindings/interrupt-controller/riscv,rpmi-system-msi.yaml
 F:	Documentation/devicetree/bindings/mailbox/riscv,rpmi-shmem-mbox.yaml
 F:	Documentation/devicetree/bindings/mailbox/riscv,sbi-mpxy-mbox.yaml
 F:	drivers/clk/clk-rpmi.c
+F:	drivers/cpufreq/riscv-rpmi-cpufreq.c
 F:	drivers/irqchip/irq-riscv-rpmi-sysmsi.c
 F:	drivers/mailbox/riscv-sbi-mpxy-mbox.c
 F:	include/linux/mailbox/riscv-rpmi-message.h
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
