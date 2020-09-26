Return-Path: <SRS0=MS/g=DD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB7A4C2D0A8
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Sep 2020 10:22:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9368C238E2
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Sep 2020 10:22:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zqRloPCH";
	dkim=permerror (0-bit key) header.d=wdc.com header.i=@wdc.com header.b="WTHjeI70";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="UpHbrRxZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9368C238E2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=We7obWlJVDliT3RlVsdUFYpEFZefPkkA7rxrIlvB36w=; b=zqRloPCH1/x8hMN5KqLwo2cP39
	v6lMdM5QQrRv8g3Fmh6MouI05H+dSxYCJzNttRF6fEX1jdJDG41M6APUK4O4UbZt7gdXbMUV22Bey
	ZzdYjD8s3Na6Xar+2nxOVMGkdomkZL8OBJoKsTdLp0Y/dh+hLNm2e0vClQS+YVEDr2TT4uyt54vMV
	rKaWnkd2bD3ZExGIy8NFRAg2eTP8RBwLkcnwks7LuHxZetkQOHVlaknlGBVn8w1LenUzof2qgtNCl
	VQJbPj2DuCKnANfqQqyqEzXTd4VP/kyNDoO8DHJb82qajvT9uUfxD84Wu8xUHim5A1piJthV5/Pa0
	2b83hutg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kM7Lm-0007O7-JG; Sat, 26 Sep 2020 10:22:42 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kM7Lj-0007Nj-Q0
 for linux-riscv@lists.infradead.org; Sat, 26 Sep 2020 10:22:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1601116391; x=1632652391;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=yxm7CksDC7RAhimb/lDBFHxvgD8VeaFnoVlO5Aslok8=;
 b=WTHjeI70JyT5i46M/gwTBbi8DYgZp04t19jVMcnEWvE0NIu9IpEsNI+6
 W1ChxMec1UJyfhrWeDoXvHGXzlJIFrM/dJrm0MGjhKnPILvMFx2fUX7+J
 Mh/I2tgd/R7WAU4cPP/BV3B5pIcmJD4SLHbpwyeI01tsXkLkKtEVM1Hbt
 Q993mInB1jzTw8wlTUlCiXdLO9r575fBRLj2SLi2GebyRnxgSMFTkV2T1
 JDtCnGv/6UAhwu+yX1qJ3ZjOWSe2XT4RWILNhiTTLP64MTHh/Niy+QPaX
 ldeHUqnZX41kcQDJXb2K3kN7lywEIsOypI+aeC3uHBYOpizWChugyPAnq g==;
IronPort-SDR: kLCgm4+Qb91vvDjVYbS0dH/MW+oAaZQSHxHGe3XC98b1no6iC8yYMy6+g2if7WwkqLu43dJyyt
 EOOtm/jTWOpYJrkvlqjddSDofORvIkttjBrOdr2poQgtjZKwYH8dVafQEva6TqotdD5lGcVFH+
 ChQ+hZVLrQIuBu3gL7HMsprz1Tr7KwW3ce18nfG+VASe5xrpErm1gBgKZUGSqJYV+Q169XvpnR
 70/PMAd+kHsr6378cbuWg3FI+FID3JlTi7ghnGkNawENZuZ9CdqbFgAsB/lbr6aAOTScGCff0w
 duA=
X-IronPort-AV: E=Sophos;i="5.77,305,1596470400"; d="scan'208";a="251723337"
Received: from mail-dm6nam12lp2170.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.170])
 by ob1.hgst.iphmx.com with ESMTP; 26 Sep 2020 18:33:09 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WQPVwI6G1vpK0rWqR8wD0J9AjYPeVZAu9UJ5fP3in6v+MYzvI0V7/Rt3fzajTpj/F6hsRvGKOvaicIyHemEtDFtNcBFhsxXHsGrL+0fdCLfn2z02tkgwXqdfh6rYGMCMJ44lr1Sa2NiGvPt5HhswwslJCv8l4o526zA/WUCKBK9JdE19BSI1U3z4TYw4Pzb4ETIQ50Mk+5KiyeTfnhQkVtRYtSSKJMpqjmuLkavXudC5AtyXr22z68xowOA1MIWu9OMK/Fy7+ymY3YRDJ8WxDWe3JgSKOjkAHWu1mZAxWdFO2CidF57Z+V/KWyph39IcMxebEQ18UwvEcfHs6Z3BvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IeQd0st6BfhKndCzH1TEV6nn8Q3dDozmbCq226zTHm0=;
 b=hqkJ0JXlVmxec0sotYMs3yKfwWhLvpJW1og7lWtIPiA/lC10lONaYTJtTD92nffGmX8tKa8MtO6uPG898WbxvPoR13zjDRdwFcYSeITI8fpubIKLjUpnuJOZ1E4XsebIoUWk4unvgQ6Mw/oe98+JILs5JzITwY0FO7k6+6nXarjG+dVeYKjfq/gwmeqGTtplsYZG1cGi1VGvIrck08L31P5BpdT6ZNa/F9Epsag28O08/v3Suxt0ILfIkjmKj6O5OzZFMeUqAqPPT95PXe3bacaQIEsq3HTyiV+M0SqKlGJpLERdhwRhhO3pfFnd0Zia//fLe3U4uOVvXNeciDCvOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IeQd0st6BfhKndCzH1TEV6nn8Q3dDozmbCq226zTHm0=;
 b=UpHbrRxZ4kY5pnd+q/3slFZLobPY+vvk5W6ATmUvJLsGGQs86InBLAj+cJ/XyPq3Ae8nOKTaDElQ4Rt6yFMRTFEkopLNiuTDysB3rhF+UO6c500v/iUtzGoj1AXZdlQFrRtL9dgRp1KohRAXtIWo6NxOuBWsif4M4OzIXtrVVgA=
Authentication-Results: dabbelt.com; dkim=none (message not signed)
 header.d=none;dabbelt.com; dmarc=none action=none header.from=wdc.com;
Received: from DM6PR04MB6201.namprd04.prod.outlook.com (2603:10b6:5:127::32)
 by DM6PR04MB6297.namprd04.prod.outlook.com (2603:10b6:5:1f0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20; Sat, 26 Sep
 2020 10:22:37 +0000
Received: from DM6PR04MB6201.namprd04.prod.outlook.com
 ([fe80::607a:44ed:1477:83e]) by DM6PR04MB6201.namprd04.prod.outlook.com
 ([fe80::607a:44ed:1477:83e%7]) with mapi id 15.20.3391.020; Sat, 26 Sep 2020
 10:22:37 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH v2] RISC-V: Check clint_time_val before use
Date: Sat, 26 Sep 2020 15:51:58 +0530
Message-Id: <20200926102158.828461-1-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: MA1PR0101CA0060.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:20::22) To DM6PR04MB6201.namprd04.prod.outlook.com
 (2603:10b6:5:127::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wdc.com (122.179.126.16) by
 MA1PR0101CA0060.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:20::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.21 via Frontend
 Transport; Sat, 26 Sep 2020 10:22:32 +0000
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [122.179.126.16]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 666612e3-e055-41c4-6202-08d862061713
X-MS-TrafficTypeDiagnostic: DM6PR04MB6297:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR04MB62977339746E2E184559CF9F8D370@DM6PR04MB6297.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DcYq/ehoMbfQWHb0NViamPQ5IIvojK5wgDpWOxlva2S5c8u9Ujax3n7HOZ5qdacZLFW7jLVPVPOHsIokkBgvdVTGcxAb7G/rekDHvY0i06jImoJoEiQluKYGRbQ4wu4i5dkWYC/Gdd9akZ+50uKBGqoDYf23qZVyCUhgZX2mh/rxDP8EqWEW+H7ZP6XOYmB1pPuYE1ZZ3GrmMxKWtEYMD1sNF7TfbuYuzEfD1g0/PP8+fR/Uj/ZawY59NXieL879OnekQg5PTp1beSig3NvZpX8yWGwcAx0rrsd3eq1NfQlTBMaPQ3TAWQF58M0E0LqC7W9QsLLOS3/H2YJ6lFjMkkrdi38s+DEiT2giYu8biQ/5L82ALlzYh3+10bytI60L
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB6201.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(366004)(346002)(136003)(376002)(54906003)(5660300002)(478600001)(8676002)(8936002)(83380400001)(86362001)(66946007)(66476007)(66556008)(4326008)(52116002)(7696005)(36756003)(2906002)(55016002)(6666004)(44832011)(2616005)(110136005)(16526019)(186003)(956004)(316002)(8886007)(26005)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: NcHaV29+p6J+FSDN8u2AuEDC0dPjlaMRKH9LAuuFvvOpkrKmFpUgeNfzyEa+tMVFUzJh3kWfINQ/vDJcFGDsc45CaWMTSQvmTusCcHlj4xQZy2ZRNoi/I6Kdd7lWQvUDh3mZH3oZVmx5tTYIJQQ9L3uyOzK8DBEUNDdB/4nYtASaB16rhnRs5qliwSLKX2sGlOrl57juQzIJgao5fn1nFcEWwpDSz/+bXe2bhNrNqnyBlVCl0vskVRjrAyzvzlIgtIqAWvtD62OjyXBubk11ZyTQLiJIYMAssQbB1KOapku8VCoFTSuz/su105JOU94Je8vkfTbglq2Yy3RrtizNOsynnUWH+9iA2pkbe3J+edd5Y6dp2w6m/hKnn21KG1xKRFEKowBuQv+BqbVS7SAMG4ODURMNAjfrRIQLwxeV56ATuNLlsF4cId7MZrwjAjkmvnU1NjZRY4/cv6p14JHb7vPd3GYcGBmcCIzMkxKlR1WRZIE2xoMDnbkWyfpe8iUuUR0t3gd4m+0ZlXsB69+92tTTqrC/VyKdO+hPLdZQ1zKIu5Z3xnBgagpxydRO1USeeqojINoviRKPnlElfyDDolW+XbawYQPoBKHvSgW0nmOHoNjWbaWUmgh/hObWIm+5vrCpp2TmiXTMNoUMT5bsNw==
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 666612e3-e055-41c4-6202-08d862061713
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB6201.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2020 10:22:37.0666 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dRML9KlNGJgQmzGAet+BIklLo7EHYX82Wn36YFuzVoz3ccLw6QFqDUmGcjhSWY06sjza4OoxF7DqV3LiJkGBUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB6297
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200926_062240_036829_2FA5C439 
X-CRM114-Status: GOOD (  16.78  )
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
Cc: Damien Le Moal <damien.lemoal@wdc.com>, Anup Patel <anup@brainfault.org>,
 Anup Patel <anup.patel@wdc.com>, linux-kernel@vger.kernel.org,
 Atish Patra <atish.patra@wdc.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The NoMMU kernel is broken for QEMU virt machine from Linux-5.9-rc6
because the get_cycles() and friends are called very early from
rand_initialize() before CLINT driver is probed. To fix this, we
should check clint_time_val before use in get_cycles() and friends.

Fixes: d5be89a8d118 ("RISC-V: Resurrect the MMIO timer implementation
for M-mode systems")
Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
Changes since v1:
 - Explicitly initialize clint_time_val to NULL in CLINT driver to
   avoid hang on Kendryte K210
---
 arch/riscv/include/asm/timex.h    | 12 +++++++++---
 drivers/clocksource/timer-clint.c |  2 +-
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/asm/timex.h b/arch/riscv/include/asm/timex.h
index 7f659dda0032..6e7b04874755 100644
--- a/arch/riscv/include/asm/timex.h
+++ b/arch/riscv/include/asm/timex.h
@@ -17,18 +17,24 @@ typedef unsigned long cycles_t;
 #ifdef CONFIG_64BIT
 static inline cycles_t get_cycles(void)
 {
-	return readq_relaxed(clint_time_val);
+	if (clint_time_val)
+		return readq_relaxed(clint_time_val);
+	return 0;
 }
 #else /* !CONFIG_64BIT */
 static inline u32 get_cycles(void)
 {
-	return readl_relaxed(((u32 *)clint_time_val));
+	if (clint_time_val)
+		return readl_relaxed(((u32 *)clint_time_val));
+	return 0;
 }
 #define get_cycles get_cycles
 
 static inline u32 get_cycles_hi(void)
 {
-	return readl_relaxed(((u32 *)clint_time_val) + 1);
+	if (clint_time_val)
+		return readl_relaxed(((u32 *)clint_time_val) + 1);
+	return 0;
 }
 #define get_cycles_hi get_cycles_hi
 #endif /* CONFIG_64BIT */
diff --git a/drivers/clocksource/timer-clint.c b/drivers/clocksource/timer-clint.c
index d17367dee02c..8dbec85979fd 100644
--- a/drivers/clocksource/timer-clint.c
+++ b/drivers/clocksource/timer-clint.c
@@ -37,7 +37,7 @@ static unsigned long clint_timer_freq;
 static unsigned int clint_timer_irq;
 
 #ifdef CONFIG_RISCV_M_MODE
-u64 __iomem *clint_time_val;
+u64 __iomem *clint_time_val = NULL;
 #endif
 
 static void clint_send_ipi(const struct cpumask *target)
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
