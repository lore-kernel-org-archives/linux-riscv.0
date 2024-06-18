Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9485C2BA15
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Jun 2024 09:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1+B4SZ++BUuMIsXl2GcX1CpRriYs2ZE9khQ4khLrILY=; b=YtiSel5NePElbb
	gSz5Xgcsq9qDe2uCHOlcz3s01myyLBeYSW+fA29QGsU7D+StWu+VEw2ndKfQ65t7DizRlO0tGton0
	AB3mvM8NZP0OMSAEZkdDLfIkPiTrJ7gK9q+1IllhNMac0G/QdZKNNBtkB8utewqdrpZfn6zVUyNwy
	FMKiBHBbabC+d+bRdk+SWkx2BeVvlJ+KmhjCoQJY5ZDsOXUP0HD4JELpepIJ/og5R8M+uUW22skRl
	sCuLOt/xROnxCBIbraKe3/nNDhiYqRnbV38uVf4tnZJh06S8BTdlgx3CHHnLgipvzMV6zFe6pvn/9
	lZYQ/JNGj9o/b5TLWgDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJUxw-0000000EA9R-2ysQ;
	Tue, 18 Jun 2024 09:17:24 +0000
Received: from mail-tyzapc01olkn20801.outbound.protection.outlook.com ([2a01:111:f403:280c::801] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJUxs-0000000EA8J-021t
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jun 2024 09:17:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZOGxTsngQDZ8k9IYk+BiDybgQfq8e0rtiQqeEtQ+p/y/PvkNohDwoVZ3K9FF5nIjmCVnh6rnV5ptlUf9+l758QihhECGCJ8bBDvYhRnqhFbpwOxJsEr/q7AUvafHuIeG9tLYkXvPZe3OFdCIXHgqmj1vgqBXoCNan657DZaQkT9iYFASKl7iZp8N41QsNZwx8e3UUAdamuy1dbHiOeuMjpQo7wWA+7OCs2ZNrRX0GZPQSHgpHj9M4/wntL8nHXdtwSZ5bXxhKC8DJ2ikTG+Uzr4zABDhzIFZDKiF5YHa5q/H/AiePiDKeUasHOvln8lifi2d/165BBnE9/4NRkFIYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L9gFX9PH8ymN0VhgCGvJdAp6CGOs9TymHUHRfKVkU8k=;
 b=dyM2MpK1qn7o/g2KulfNUCW7HFApycJTpqfhkNXiC7KqNlNYNdYKBXzLdJNYPHsnWz6L7zjN7CKkpjYDFx3K4ZZJjHATTMtLLo8ZALN+pQjC12gtNybFq/XiV73ys88iTAC23liPRrNYliFm/vkoWMXZB4in3dBYiSUGZnf0PgX+ViqzTpLUUjjajCB1oum6f6WCIMmkND7kwahblA6xLic8ZW9p0aVuQKKrfKXAE4peZ/BAM1/zixx6fgIhAWzIxAS3qi1sKqLhjPL9BVqfjuXjsAXJY3g621HhO4hQtia8mH4TV61e0+6lYXqct8K4JLTqLuPv8CeedCwG9Eb8Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L9gFX9PH8ymN0VhgCGvJdAp6CGOs9TymHUHRfKVkU8k=;
 b=ugTD0KnEAQwU/K1ohw2g2z16rO+m/dm/+maGBVp3hMFzc5Za8fF2LbofULW1v28snfx5cDhst9hUJaQreY5Uw4JWkMWY3oceSoHvZpYun486ZjWu450ozRBlhsm1DRcrnWBIMfIafqfY8UldIxcJmzVnnyFWQD9oxL2RjYvs7mUjGVZPBsoOuFM2lO2Z3XWcn2rtifop0fq1kdRO4vR0i5Jxdjrn3ejEGzsS1gY//4klmHHF/aveB/bODsdbGDpGCGblumGxE4pRfsakCxa6rBGii4EOCI9NZGiic7qucwCeTQG6/B1/FGArgAUgF/FJPh6/QIjFgPuIhrFqzI3lfQ==
Received: from SEYPR01MB4221.apcprd01.prod.exchangelabs.com
 (2603:1096:101:56::12) by PUZPR01MB5211.apcprd01.prod.exchangelabs.com
 (2603:1096:301:11e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Tue, 18 Jun
 2024 09:17:04 +0000
Received: from SEYPR01MB4221.apcprd01.prod.exchangelabs.com
 ([fe80::b674:8f70:6e29:3756]) by SEYPR01MB4221.apcprd01.prod.exchangelabs.com
 ([fe80::b674:8f70:6e29:3756%4]) with mapi id 15.20.7677.030; Tue, 18 Jun 2024
 09:17:04 +0000
From: Haylen Chu <heylenay@outlook.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Haylen Chu <heylenay@outlook.com>,
	Drew Fustini <dfustini@baylibre.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: dts: sophgo: disable write-protection for milkv duo
Date: Tue, 18 Jun 2024 09:16:14 +0000
Message-ID: <SEYPR01MB4221943C7B101DD2318DA0D3D7CE2@SEYPR01MB4221.apcprd01.prod.exchangelabs.com>
X-Mailer: git-send-email 2.45.2
X-TMN: [jkxzcdSKutfol9wnu4B+aRkhLwJkKbPd]
X-ClientProxiedBy: TYXPR01CA0064.jpnprd01.prod.outlook.com
 (2603:1096:403:a::34) To SEYPR01MB4221.apcprd01.prod.exchangelabs.com
 (2603:1096:101:56::12)
X-Microsoft-Original-Message-ID: <20240618091613.6221-2-heylenay@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR01MB4221:EE_|PUZPR01MB5211:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cabb948-67a8-4f1d-b9d0-08dc8f776af0
X-Microsoft-Antispam: BCL:0;ARA:14566002|461199025|440099025|3412199022|1710799023;
X-Microsoft-Antispam-Message-Info: IatyqEZaUFZGSm1cSGenRXyQzZkV6sy1Ti8eOzj1l2mmPQafyxwXshd370Y0GiZkVq19ZdLModyInwLmc6KtOK7toLhw0Z+wdQi4PtU1GRbS/tDhAyEZgLjyXPnyNqy6gDW58bf0I9Pp0wt4VtQI+i3deUhHO3V13LpP5dLOgkYQrXciJMCZGtMIT+W2ZbNg6QeS19UYV7o1fSXTkBsieS7YCZ7E7l9wE2i1+921Kl0PfLOSYBcOvfrIac0mGceNAuuGDhxb6/b96dVwyBQ7fXbVbkQkFfHhhFWlxKoOh1hnfrTlGUs0FTpS8ksX/u3jls+1hDTfftE9xuqQp4O5Syb7wrcbK6F/ZTTVrk6kNJDKZrfbHbBcvsv0+5ygEJAIFIM+eZy7BMs9PI6ADV+0ctr6/GpWJgnLg/nh9kU79ggjoF7G0AgooKICvwE1JwuZ1O3oLtEDIu4o60l/qsJ1HkQel16LEv8Y+rS/SbnNJwIpxMaH564e4OVvP+IapM/3hhQvXI9Z0g5r1UEq/iotLq3Z3Rjbczbjcf9dVk803szcVbo5xez0lJjsANQpJ/n+tPMN8b5imenL2DOnq5xM2AuYiwEwlBpB3RYr7y/hZGg=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rNhztLSCu/ecAGaA5mtlH6/u2ITUndf82z6iHD8CMYbiSJmiDoZBT9xs7PNR?=
 =?us-ascii?Q?HeDquWhkkwHMaUUFbdA8e8qPYYhNW1tqvg+pdaz+g/6Wss1JqKLpfRksl1Gy?=
 =?us-ascii?Q?m6XeU69DpRcPAKA1aKiK3JB5zy8obYLAWkvxiGHJ9Cjlj2VLM3ZLJ3sL5Duf?=
 =?us-ascii?Q?t0e6Z3yw0wIqQJx88e5InSfkKTnlQMwuKlJF5x1/Mq3N6/m2iaFT0dWXBrwF?=
 =?us-ascii?Q?Lb91CC6J2WOk9+1o6e+pYh/Qd6cE3TAXrAKiGGOYxRzBJ9lk2SXhUd44BTAx?=
 =?us-ascii?Q?+7zUjQ8cLmyR/ak6DkeQ4L/FvbxC0E1tYKPj/GT08cv+5oBQ5AXwrG674DLO?=
 =?us-ascii?Q?OKhD/S7OWfHQnF/r7Ot1COD3AQb7O/AEi0nrBFER0+1H9asMhHERxSVOGDf2?=
 =?us-ascii?Q?DoTSeKLfFuRMhM2dB4YIK86n3xu3cLU09kHFyeTuxPA+hHrA4RknZ4KzzlvE?=
 =?us-ascii?Q?BMuqLLzdKR45ji9DrdIrUmmG7qQJE0f9AC9YBOUMDi+iFjEu18BQ83uLUloy?=
 =?us-ascii?Q?1nj6EotUsCaMHIu2gb3/G7WFVxff/884FS48zj5VKQpM14rcZsO1kKcx7rTz?=
 =?us-ascii?Q?BEk4/KdeJSibvsJQ8EapWdCFDWJjdn51XO+6m17jArcTPPrlljCgs4NMlhRP?=
 =?us-ascii?Q?MSwdVGH5yyiUfJoSQUgrUbxGpz7aAeX90AJTFRwRmZ8Dwz6bwT6H85N/raBP?=
 =?us-ascii?Q?Qm2nCRAxz7FAiELYS3uwOSEZrqBM+NFWI5s8Jd43odGkJoMWViLoHYfLNxW0?=
 =?us-ascii?Q?45lZEzN/PhOT22NOoVtJetCm3WOCNkEJhh7Rd3BvtiDRAUqsVm2OPr/XXsdH?=
 =?us-ascii?Q?9wL7YCrq9HxnVSAFNQ/mDs1TfjuCJHBkG971Y0M3jhHyH0ySAHCtr+idZtZt?=
 =?us-ascii?Q?3cj3JUBUSJIDLa5iyVX6EiX2FYC3D0lRZ0yvi+Bo3G3xJHgNzHtO1FeAwqqh?=
 =?us-ascii?Q?N6LDpOGlAEvb4W87aY/tf3iP/a7xGgdRGe5abodaQhZFfqeBnwoFVfx2+O77?=
 =?us-ascii?Q?bLIPrDN7ZSrBYPrr9Rww/oVyNleItuI19sOND9pvp+xSQaIMWi0VDp/rD1B2?=
 =?us-ascii?Q?8qbhsgD0XIcBouRCoL1bY/XaqVNpmcg4/vgpvR8USdvx43HaQn85UH2SevBa?=
 =?us-ascii?Q?2jq+t2Xr9+iPka1pAelLuBL3lk/MiQayFC3ioDLvIlUTdLx/NsYDTe0oG33n?=
 =?us-ascii?Q?JSf3e/LH0TqPMLYRxJTQAVutdeHnZcpMRNNl4T2J8SUw1R7en1+HmtnE5t0?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cabb948-67a8-4f1d-b9d0-08dc8f776af0
X-MS-Exchange-CrossTenant-AuthSource: SEYPR01MB4221.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2024 09:17:04.1521
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR01MB5211
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_021721_262860_4B1673B3 
X-CRM114-Status: UNSURE (   6.48  )
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

Milkv Duo does not have a write-protect pin, so disable write protect
to prevent SDcards misdetected as read-only.

Fixes: 89a7056ed4f7 ("riscv: dts: sophgo: add sdcard support for milkv duo")
Signed-off-by: Haylen Chu <heylenay@outlook.com>
---
 arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts b/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts
index cd013588adc0..375ff2661b6e 100644
--- a/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts
+++ b/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts
@@ -45,6 +45,7 @@ &sdhci0 {
 	no-1-8-v;
 	no-mmc;
 	no-sdio;
+	disable-wp;
 };
 
 &uart0 {
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
