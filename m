Return-Path: <SRS0=ZPlh=HX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AB57C433E6
	for <linux-riscv@archiver.kernel.org>; Sun, 21 Feb 2021 09:39:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 490DC64E5C
	for <linux-riscv@archiver.kernel.org>; Sun, 21 Feb 2021 09:39:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 490DC64E5C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RtYmUx/MOUcmZxbs26enOwAMcv0Kt9Ug1Czk1ufFcNE=; b=SVyfxbstvMAfjSUvSYgzPgsjM
	WIQHfirAWxFNFEB5mGyZBnSDAYgjxPw0tx70KmltJngqfHTIl9yhePNB3a76mfy8sbnHud+9PoDHL
	LcMDBJQc4zyH9rYK6xqHd9mYVXHx66GYUAUcRsadVPb51ku8YyezUSRLlOx5AJ+vfEc5oUAXy7lnL
	gua5huOhAFfSbD+zhaZRoxT5YIlIkfaD2LsepwGe5sGFUxd+mypDsgEY3fmv4IZcMeuxtVka/ZPzu
	ExynwuCNPudp+vP6wrGKYI3NTgN0mM/XMVL2UWUGXPJYjg3uDyIfM+4j0B3i51NRCRd5FD2lmWB5T
	igtjNW8UA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lDlCU-00054V-GG; Sun, 21 Feb 2021 09:38:50 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lDlCQ-00051V-EF; Sun, 21 Feb 2021 09:38:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1613900326; x=1645436326;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=GBHNYLFSgHrPHgAP9qAEtDddLOQrpHzftD5Z6q08w7M=;
 b=X4mKIXmYvl38QbPQ/vJ1snqDwaHvHODe6Ym1tV9WqVT7WK+Q7zfM4R5m
 7vq3wQMpLcaqNgRAq2hs8KvqJ9IzofMIOu4fwJ1vuOS9KxMBnrhW9uC6x
 E2HwvH1doHCzUf9WO7fvOzKh/4yDm3BYFza43UiZ35EM3YkuzeNv1yjm7
 hSmU2Qmjuu1J/GwqNixaTmnWZEL7jsZiQQZmwmWbtVCaXarWyJRT+bAKP
 aAWtbCI8Lm31Ri1/Snj8pKVKb8lJ9VsQOKsDl7e2RKBDkmYtRBqzkD02n
 9367SvJA1RFlN7wQvhDt1kp0eOikwo6b3pMG+Ufqgg5L24qkDbNs8++gi Q==;
IronPort-SDR: eKO9BAFVI3opodv4dzvHpU/gYNchp10g33TXRy77UE5TZdzWp5bpZKZAUSFWYwdZwg/NprzR9n
 RrdKnJUbs+mWIn99iew9xT3s7+EkkVRmC3PrjC/3ZbbD+cjcbHViDUQDUczSjRG5Q/zohc6YZi
 lQ5LLbUaekSvEKZdYFhN4/8QyMdAIj1fbLXmggfTB0hGkcNlY5LpyMYDtTw1wYZDBXdHyluoJ+
 RJ+LBB2TFroXBEdYFUsEdDIUkCT32dlg6NOiIzYctlajWX15DyA5hUmcMMv+LQSfxB+u9AizK2
 4Zs=
X-IronPort-AV: E=Sophos;i="5.81,194,1610380800"; d="scan'208";a="161607383"
Received: from mail-mw2nam10lp2109.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.109])
 by ob1.hgst.iphmx.com with ESMTP; 21 Feb 2021 17:38:44 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QJmAk6NiiXLw86CbO8aQmf2nXmHZcfffFTsP/4KvcStu86z9KQzWinstozzYKO9bC+PW8Z2hzdUXxg8njnuPtrgEIJ9lrhdKyc5MtHhm49jmaI30Mb9Nkd0c3b5RRE8AOyzwqhen3W72rB9dZUaZ//5Yw/VQzkKIvXgID3hdYMEmzgCn5gSCX9Yt4V2ea3yDkUOh7lZMVWBTokYbxbe3+2FJzFgA3z8p8OchpSuNm1ck4FOnByHA4GQb6PuiIPwdOkp2ykVzOCh8VvNvnHPQdo68IWZtE/Gn29uiVHP09EMT9vLiwYgcEUTW2e0St4krpQ5cxbtYStrmszeVSTmMvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YB6mekUajIexQv/P0cRJODxHHP6BBibTXdbXt19jT9Y=;
 b=MV9La7BV42W+ze7O3iCVkNQ6e8dztX90nf+oRgnXLxFCgQK/XBMCOKlihPg1DuTeM8tXG17SnzaPdyaIJ61ghhQv9kvUEP1Txm+6hsELS/4C1GA8KuYMb5HXLFbHUbmb3VD4qPU9SzgOOlcHVRoIbQqbqcfEETRH9KscUYV7fYYPoOWVrkGi7+1pzTdvzv2gzXn/pbvowfC6ciDToqtDrCV1nbipD20DrziXgd+Tn4nk14uLz4iVu3d3tF9uhVOIHIRmoCl2QHTtBf14eUib+/vsXyjKECyhr+bBwwUPJL3cXLYMIoj8mQsgNqaRY6qH0jE6082y6pJD8R6s3r0yVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YB6mekUajIexQv/P0cRJODxHHP6BBibTXdbXt19jT9Y=;
 b=ZT8uD2MiwYXJ2xhPydGnvqZwzlDzT9S4ynzZQk5to38w6ePCjBJ5MKzaOz32mxAwqsyzktyKl1tOrW9226Ot5rF/oa2UzQMCMzd+MxQXkrrUxxeAH2hQfOWfYQ69iZAtv3fCSrcrbFo8lLlDxDo9e3l0tg63extYf+emcDuR0L4=
Authentication-Results: dabbelt.com; dkim=none (message not signed)
 header.d=none;dabbelt.com; dmarc=none action=none header.from=wdc.com;
Received: from DM6PR04MB6201.namprd04.prod.outlook.com (2603:10b6:5:127::32)
 by DM5PR04MB0459.namprd04.prod.outlook.com (2603:10b6:3:9d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25; Sun, 21 Feb
 2021 09:38:42 +0000
Received: from DM6PR04MB6201.namprd04.prod.outlook.com
 ([fe80::38c0:cc46:192b:1868]) by DM6PR04MB6201.namprd04.prod.outlook.com
 ([fe80::38c0:cc46:192b:1868%7]) with mapi id 15.20.3868.029; Sun, 21 Feb 2021
 09:38:42 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh+dt@kernel.org>
Subject: [RFC PATCH 2/8] RISC-V: Rename relocate() and make it global
Date: Sun, 21 Feb 2021 15:07:52 +0530
Message-Id: <20210221093758.210981-3-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210221093758.210981-1-anup.patel@wdc.com>
References: <20210221093758.210981-1-anup.patel@wdc.com>
X-Originating-IP: [122.171.171.12]
X-ClientProxiedBy: MA1PR0101CA0009.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:21::19) To DM6PR04MB6201.namprd04.prod.outlook.com
 (2603:10b6:5:127::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wdc.com (122.171.171.12) by
 MA1PR0101CA0009.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:21::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27 via Frontend
 Transport; Sun, 21 Feb 2021 09:38:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c361fe70-97ca-4ad6-1423-08d8d64c79b6
X-MS-TrafficTypeDiagnostic: DM5PR04MB0459:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR04MB0459624CDC7C2193930173A08D829@DM5PR04MB0459.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nKoL4Fy4uw2LW2LJHkImi70uve6kp0RGBC6f24mUXBgNUaKUBdPXnD8f6NQijaUiTknq9wdrj1NfgPX1jHKHvyFndbODNarBgOrVL0tnzxBkh3JW0/IJ+xxw4s8a5o8l48xfZP78tbK0VlHIfGWcy7P565g7tAmgAKYaP2Ilqv6ViTce1DByzSW7OBul8ZjkC0Nnkr7FkiAK/R1TR7nIu2MzuzaHV51K71pI398rMsdsOBjWNk2ryUiFiQR0DkXs1aYip8jWb2LdgcQ6akawoQHvB0G7Al3RLaa83gULfwa338iJceLsgSJokQ3kQqawRquRlUeGWmSIPh2gt0oSMdLXZpZB+8YitZd6vA8tQrmRKGHe9vIhqA54uq1++7mKhGvh3g5BctxH/BdEXayVe66Jls7r2R4YJxi3Sr7l0huOl547rAKwF1WZot82v6CS6zcRPPA8gxekqQgvebDxe+KWuQBdSdECrOXkMgpCrDdiZoE8hoAedVyauoKED2smFL7rcRtN1K6Mw2yzOz6t4Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB6201.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(396003)(346002)(39860400002)(136003)(55016002)(44832011)(66556008)(8676002)(2616005)(6666004)(16526019)(7696005)(5660300002)(54906003)(110136005)(4326008)(66476007)(36756003)(83380400001)(478600001)(1076003)(956004)(8886007)(316002)(2906002)(66946007)(86362001)(52116002)(7416002)(8936002)(26005)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?R7Hsp9XJ4IwdR3HQJKoay7z0bKBDNi3SyAbcg9Nelmb9MLK4vJV/ilsbLIrY?=
 =?us-ascii?Q?KrMoagjOl3IRJ2l/wDJqBox4NxV0j1DpmvEpLeKwZIazAmhDiGoeukoDObDq?=
 =?us-ascii?Q?05SDipXbcm5jnrwqEoHE7ZxxPZKpvVqltgUaHjwYafIQkdHHzxsN4XJCj8PY?=
 =?us-ascii?Q?WOJNLu3uF9ldywcrCmkkXKgcj0uZhkGoUbmmQT/iOuMjv1J5EfSHzd8aLFDb?=
 =?us-ascii?Q?hd3oCbnZaKFQR9/YHVdI5Q0/OHskD0Ny3cyx80t1uwDO3s17dRxpuKvJJ+7G?=
 =?us-ascii?Q?1QQZLqVU86q7prwa6ZmPpQf/Apl9UFxNKhc/6gS9q32dzAwcIIe48+w+ETLM?=
 =?us-ascii?Q?OjU7eIxNUUbjLeX5t6wsc9ALwiUysHlYZNyZcJnda5q7k5azgFjQydfuhFGa?=
 =?us-ascii?Q?gl0VwASmmlI8h3gRvdoSPYR/+YYKSVtQm0DZc/w2frg5cYrsgnelhxj1DY78?=
 =?us-ascii?Q?WbPkyeRLS+POFrNS/NehyU1dX1tR11zEiHryuGFpetAI4vl2vq53ac3FnI+N?=
 =?us-ascii?Q?jiluJzU6Xnv9dyzZiZCbQq37GessBIoIzJoLXzR5Xn8dlHKvfznWJW5MbXUG?=
 =?us-ascii?Q?vvgOc1/YMFIHtgYrKbGzuqM86N1TSCwnTXRNctaj1kJM9eKYuQi76iB+pAAd?=
 =?us-ascii?Q?74ax+VTCuFWSDRy9AZNj22QE58G/cTK2OkN8k3aWDDxWqM2s0QIZ+j9Kuxci?=
 =?us-ascii?Q?7etGcjkR0lG86o2evKfuLrlsd5nM0QFKLwRso7UIo0qRj3HSatijth7f7qVo?=
 =?us-ascii?Q?idLeiFLz8KLiFxTjr8v+TCDDIEIWddmUEq1xpRO4JYUrsKSJHTRVilVhu93U?=
 =?us-ascii?Q?S97+M7u45eV7VnJYZBcnzpns7Ive1uMHKcgcHdCa9r8jjiPha/FBN9l9Or9y?=
 =?us-ascii?Q?qF6CmPLlJDTPUWFXrRg8HzclobTP8iGJOGFoteSno/LIYU2E04T9DP9pTG5C?=
 =?us-ascii?Q?awDgGJJRrIX4EaMSZHrv9bGpOoPdEuaIOpgCH37GNUEVgmsC4lYN6nkOXZRY?=
 =?us-ascii?Q?yAxW1VS9RVPQw9FN7F6SPSXep67Pd2DI1CA9l9Br5H44nKi9z1OPZCWfofG+?=
 =?us-ascii?Q?quaoKFCYFfvy1lA5zERtoBljC7NDg+Z23XhxKfZf6iJbL9jJZP04p03fX7Sm?=
 =?us-ascii?Q?ok36a6Bu8eL6KBqlaBqWITAjaMx8w3/H/2DMTny2sF8ljzwVBKY+A2OAVnaO?=
 =?us-ascii?Q?5wE6uAoFaH0kW+L2Yz2AYjdzlRytEhdKI6ASi4KAC2iwILq5eHstZN7Q2p03?=
 =?us-ascii?Q?2EVc1Ug35V7kvqekkjShqsYZJSc/5HeDXcxHFvzwcUeh7nRsirY5J0ogKW00?=
 =?us-ascii?Q?MDPyx7NpAkW/l5iuMPCqJv8g?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c361fe70-97ca-4ad6-1423-08d8d64c79b6
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB6201.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2021 09:38:42.4856 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1i9RUUV8wbeGn0Z6PfVttWmLVFP7MTzQ7WD+nyETz8I6OTgXx1Umsa7a/GbwipcwJQG138QnicjCOqjBuuRnlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR04MB0459
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210221_043846_726692_0F370701 
X-CRM114-Status: GOOD (  14.34  )
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
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 Anup Patel <anup@brainfault.org>, Anup Patel <anup.patel@wdc.com>,
 linux-kernel@vger.kernel.org, Atish Patra <atish.patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Liush <liush@allwinnertech.com>,
 linux-riscv@lists.infradead.org, Sandeep Tripathy <milun.tripathy@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The low-level relocate() function enables mmu and relocates
execution to link-time addresses. We rename relocate() function
to relocate_enable_mmu() function which is more informative.

Also, the relocate_enable_mmu() function will be used in the
resume path when a CPU wakes-up from a non-retentive suspend
so we make it global symbol.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 arch/riscv/kernel/head.S | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 16e9941900c4..a8aca43929d8 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -67,7 +67,8 @@ pe_head_start:
 
 .align 2
 #ifdef CONFIG_MMU
-relocate:
+	.global relocate_enable_mmu
+relocate_enable_mmu:
 	/* Relocate return address */
 	li a1, PAGE_OFFSET
 	la a2, _start
@@ -156,7 +157,7 @@ secondary_start_common:
 #ifdef CONFIG_MMU
 	/* Enable virtual memory and relocate to virtual address */
 	la a0, swapper_pg_dir
-	call relocate
+	call relocate_enable_mmu
 #endif
 	call setup_trap_vector
 	tail smp_callin
@@ -264,7 +265,7 @@ clear_bss_done:
 	call setup_vm
 #ifdef CONFIG_MMU
 	la a0, early_pg_dir
-	call relocate
+	call relocate_enable_mmu
 #endif /* CONFIG_MMU */
 
 	call setup_trap_vector
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
