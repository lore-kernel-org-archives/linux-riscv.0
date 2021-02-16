Return-Path: <SRS0=wY1U=HS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFED4C433E0
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Feb 2021 22:12:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9EA4164E6B
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Feb 2021 22:12:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9EA4164E6B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=p8mme3yjbxQVXfvumSB23lfAQvnOWFOxRrf9L5R7GMk=; b=dq8qYs95JdEWyP1y4aQJXCqD96
	tG2K3Tw7tuoBjFiV97/qAahLtPSi1wzWT/HuD78Rn3d33K8zPvWCWcATjkP2+CKba0hxCFg/P62bK
	K9PhP7SuUZyck7Wp9yKuGOUWP0uPk1Ul9ijY3+U0unKOx/jRUAO6vYFZlBLo2y0FoD9nDGEq8UTUI
	JeHutu+ln6Kl/ImTh9S+5sgdUnh5HOERxWV5HW6pS8uNn8znluJt3XQip/slhulPNW+UdSVyI3xfB
	Q0h5DWs1Qf9hhkeLy2QaC4P/fYR2XZdJBH4a6G4DzkAnV+DB6zCppr3TmeToQI3qeLPx2rE7Hub4j
	no8bqeHA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lC8aP-0000yU-21; Tue, 16 Feb 2021 22:12:49 +0000
Received: from mail-eopbgr110119.outbound.protection.outlook.com
 ([40.107.11.119] helo=GBR01-CWL-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lC8aI-0000xX-Qp
 for linux-riscv@lists.infradead.org; Tue, 16 Feb 2021 22:12:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ue9YLsHIRT8xEZslGbsGl6aHT5nLEnP0+7ZU01UcumKh9SKAZNG12cbZAAKVZ5bUiz4EaoRqa8QtAxCsHeAjNbeJW5zGyjpn032KyvVau4nArACh8BYO/5T5R7Ji+wprOfpjMr+Kq/uy0r17rziM+TsVfi9nnqTyiyBEn+r/gXviYdajdvyQSq5fC9foon9jXi2SE3FJT+gdWSu7XF1DyGbuJ8kYuf2sF5XIhIqm8ffLJl1G/rLfBnw7YbdRomh9kwGhlBhGZVKCmmfFyHws8JmrXSFPYCod24vOiPCgQbNZ7AxF8fieNEtAAjLjxtv/HWf87dNMSXDVlbWNgoA8sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I89p96IM044/i5gCGLL2v2vMwqbO/eJg3k/P89bDhcI=;
 b=emqBRqwEEyT72zLJA/xIP+J9x/obfyZRJoqZfUFST+i6UUGNYuOIwNUjbMMHThv4HyZdZP15SbB4iQqFJG0xR0fJQJ9uvqz8gisEvfNZkbFbartBeNVIcUZNSD11qfZu57wU0S/2gyLdEsu9NNIVXTkdRdpF30nqi0LvIvOGT0zWdBAqHBd9BTHq2w+SPtw3x0CD9Zq5ZQT2lEuDSKz5krPgdWkHez2lUwIvczalNLEQ3FCey7jbV4i+gjAHW31+ctV2LHkEwd38iYlvAPo0c7L/a7Zw86fUkNevKqLVp8WNq8wTQC+gXOPgu+ylHaL2OLca7u8P5p2L66z6g5cPuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I89p96IM044/i5gCGLL2v2vMwqbO/eJg3k/P89bDhcI=;
 b=Ar//+1KdQptB/3aR3PHB4kkN3ndnIyMkyqDyq3VepLEhR46Fj+h4TESPKDreJ5IK5+K+VTg0rFJMSnVcZBFHlx54FlESGpp1YB4iDlGgVChGtt1YjwfsSV2bQJmbIVG7o/l5KlSSsmPmzuYg7A98KnK6NMy4LEF2nY7W81pIl4k=
Authentication-Results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=garyguo.net;
Received: from CWXP265MB0744.GBRP265.PROD.OUTLOOK.COM (2603:10a6:401:d::23) by
 CWLP265MB3891.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:108::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.35; Tue, 16 Feb 2021 22:12:31 +0000
Received: from CWXP265MB0744.GBRP265.PROD.OUTLOOK.COM
 ([fe80::d4fe:4dc4:65f1:b066]) by CWXP265MB0744.GBRP265.PROD.OUTLOOK.COM
 ([fe80::d4fe:4dc4:65f1:b066%7]) with mapi id 15.20.3825.039; Tue, 16 Feb 2021
 22:12:31 +0000
From: Gary Guo <gary@garyguo.net>
To: linux-riscv@lists.infradead.org
Subject: [PATCH] riscv: enable TIME CSR in U mode
Date: Tue, 16 Feb 2021 22:12:08 +0000
Message-Id: <20210216221208.2860-1-gary@garyguo.net>
X-Mailer: git-send-email 2.20.1
X-Originating-IP: [2.99.171.246]
X-ClientProxiedBy: LO4P123CA0261.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::14) To CWXP265MB0744.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:401:d::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Gary-PC.localdomain (2.99.171.246) by
 LO4P123CA0261.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:194::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.39 via Frontend Transport; Tue, 16 Feb 2021 22:12:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 937cdcb2-2ba4-4113-071f-08d8d2c7f422
X-MS-TrafficTypeDiagnostic: CWLP265MB3891:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CWLP265MB3891F50EF6A8BAAE0607E9FBD6879@CWLP265MB3891.GBRP265.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8Ike/FMY+V22CO52M3ZTOhSbZwoNZ3fR9rPn8Nd8aRyKLtPYy8Vbawr23005uae74naQPwWQQwAzWjXud/WhJnGBENpgeZR94O3zmkZ758skU2yX47SqQDCBVEkI6P/3N5z9hARDlwInrCasgUiY3YNSIi3W+rxTlSyWWCCCLkIoh/rsyJaxCvPCJ+3z+xUYYrzAd/NlkgohnGctJ1jCGzXR3G37C8qZ8ikvQwPCgfxeWgxJ+n9/+VGza8WnrdEH5DVDqAJUHwgNTCmrqK6M+/iAoEb+dkGFQlYqd3uwE75VOYuuVoSEY7+lA/SHBxFqRhQs5ubRHpfmu4pcZpz2V5hpSQDmYb4pvqxacd4eZX0NlxTiSwNnbGwQMjjLfsg2qHppwDdN5K/QNjNaVkgNZmjPi3yY2s3IQH6lXpUC3XKUhCWPr9xyVbmRgQ23lc134osRYyk+nKXQvqAo1pGK71kjDGjk0Al72h6mSp+HZ2FtGSS7W11r0BztuAsOaJrg7iCqXELdxsCl1cv5qaBi7eA/B07mit0cZZ73wewuBuHXHfZxBlwWUgiELdYVtzZPSz2DuevIF2KMArwPAduukA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB0744.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(346002)(136003)(376002)(39830400003)(366004)(396003)(6506007)(55236004)(66556008)(5660300002)(2906002)(16526019)(66476007)(8676002)(107886003)(6512007)(6666004)(6486002)(86362001)(66946007)(186003)(26005)(8936002)(4326008)(316002)(478600001)(36756003)(1076003)(52116002)(83380400001)(956004)(2616005)(6916009)(16060500005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Mf+G+NAhR393SdNVf2sFdRcp+UKSc/p5aSUKrzLZlgITjAPQkSbjx02JDd4Q?=
 =?us-ascii?Q?MrPWeD3/Uq95x3cQgFkEG2+BbwJV14dQ9IUhDr0ofzzHeW0Qc2uOLmVuLFm6?=
 =?us-ascii?Q?FKHv04A26hy5/dDZLstEl94Ndx3xgkIb4zUO2uUA6MTBpyxY8AbUA8YyxSJ1?=
 =?us-ascii?Q?emY6IpVyV14DMtzSM2sM/p+fyuRb7J4zrqsTXUfnHV4kshkj4xDEebSbHiMD?=
 =?us-ascii?Q?h3sWF6yzrPh47m0QxqNltPofYT6FHAzGUfw3MIIDpqFNZc7wnCKzk4lJ7LhF?=
 =?us-ascii?Q?XvwQ9sTr60aDDcTbr+8cjP5dpyMI/3KDl2IHkjS9PEYK9CSVxkDP5fFemY9R?=
 =?us-ascii?Q?ShyTRGCzUa8103q+GXp60iyC+xZtyMK6+/0olnmFy51oEuGopQSeBwVZUzwX?=
 =?us-ascii?Q?PAZrychrwInA49pvWJ2qDB8URB2iS1fo+kTjaH/lzYE1Fth7khL/Ul+lIk6x?=
 =?us-ascii?Q?xXYuky6poLkPUYKiKi4mYzgU4Ys1TiVFjYq+yvjgAfwFhoMm9+fXqy1poKwe?=
 =?us-ascii?Q?0vlHSgCEu68i44ItgHkR0ZzbPGi6vxsi4XfK3o+xkMTxklT7NP8TG9Vjc939?=
 =?us-ascii?Q?NejDt+JOyDXuA3ATsAN1Q9zXD2szBxDW+mqHI12rKv7n4OZ+j5rWhPzzXnTS?=
 =?us-ascii?Q?EZa3u3KF7QbZ151RRRMPW7uFklSyuj6ND7vP60aVPqV9sYJfZGGOKWuB8wz4?=
 =?us-ascii?Q?sduTE9f/WxTUx7DM6WX4wPSwjZ657M7WhFjGxAcUaiuPh6doXF+8jVE8zipb?=
 =?us-ascii?Q?oUoIJaZf9MUXMpmw1w+W9g2YYdTvS9aIr7SW+V2wxtbYPj9YFiHaP44zqeoy?=
 =?us-ascii?Q?z5tNzG+fVLdr2ozWn/au98TkFIWyXLcKVprodPEhvuhHmHN9z/b1PhaN1c4d?=
 =?us-ascii?Q?bWfQ2z6ZL0bWCjQ5jKLL2W1Bz7kvm0m6ysm5ZPSb0MDN31WB5SXMbUrgpNZB?=
 =?us-ascii?Q?qsc+mWVtbUO2oykLoNfB0YH6ANTFeZBucvhOrlnfaFqRvuRsBzwO0bNUg4R9?=
 =?us-ascii?Q?pWvGQQ+ab57hnXkXme/A+ZwxY1RN0aDG5qkR2Cx1ybTF1AWzKxiPr3XOyVz1?=
 =?us-ascii?Q?WpotoEtCPC+z8ybRtjO9ysgVIZJNIOKguxi3N4udbiqyvBgzU7Uf6/Jpb/vg?=
 =?us-ascii?Q?GCf3zRJiqSGPpbuRIvId5rI/owFyACQJ3hL18KbljumEnHUanZQ2mWN8BUHv?=
 =?us-ascii?Q?IwTGCuAgY8U22tSRhxLZ07NTOKcaLN5i04HfIHKQDYZw1NEvqNNVcJXJy0/n?=
 =?us-ascii?Q?7siwfeP5NY++KwyCiPSf227Ak5GD7oUPvFd626hPHlN6KQGqM4K7qmIAivsZ?=
 =?us-ascii?Q?mOT2DdQ//RVgckxCPQZfOqPU?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 937cdcb2-2ba4-4113-071f-08d8d2c7f422
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB0744.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2021 22:12:31.1069 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4t2KYv2ZqLgV5U6txTvtq8HySBn8x8i0I92hcCpbqxTczBZuoPHfyDRE6RvsxNBvSSqv1ZnalflGJf6+wOkQFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB3891
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210216_171243_099049_A4936B98 
X-CRM114-Status: GOOD (  11.62  )
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
Cc: Gary Guo <gary@garyguo.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

After ad5d112 we let the user mode to use rdtime directly for time
access. This works if the hardware does not implement the TIME CSR
and traps to the firmware. The spec however does allow a hardware
implementation to redirect the CSR access to the memory-mapped MTIME
CSR, and if this is performed it will check {M,S}COUNTEREN CSR to
see if it is allowed.

To prevent unhandled illegal instruction fault on these platforms,
we can request these CSRs to be enabled in U-mode. For platforms
that does not support the TIME CSR to MTIME CSR conversion, they
will hardwire corresponding bit in COUNTEREN to zero and this would
be a no-op.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 arch/riscv/kernel/head.S | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 0a4e81b8dc79..5a7a62190342 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -190,6 +190,9 @@ ENTRY(_start_kernel)
 .align 2
 pmp_done:
 
+	/* Allow user-mode to access time CSR */
+	csrw, CSR_MCOUNTEREN, 2
+
 	/*
 	 * The hartid in a0 is expected later on, and we have no firmware
 	 * to hand it to us.
@@ -197,6 +200,9 @@ pmp_done:
 	csrr a0, CSR_MHARTID
 #endif /* CONFIG_RISCV_M_MODE */
 
+	/* Allow user-mode to access time CSR */
+	csrw CSR_SCOUNTEREN, 2
+
 	/* Load the global pointer */
 .option push
 .option norelax
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
