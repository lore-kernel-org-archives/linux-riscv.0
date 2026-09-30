Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B6ABCA5FBA
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 12:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cGCdfc6ilDE1ftqMewme/R+WSmvSyy6U+Ocoqsu6jJM=; b=QDGgvS4QqpdOA3
	tpaXPZ7hmm2fg3yycR15iCAxqDSuCt9qCJCCiwLmdAhqqwEo0/KpPhi3LVjQnFL1xmMmhd4V731TE
	3cCV+2vk4ZmEbjwM82R1S/r5db8PKNjkbWPRARAYidXt+/pCM6I/T6nqNffx9OPcaZmIUvztGUfWt
	I795rmUUOqo9hFyUaWQT9XiR/RHnwgPOGoXSKt+Vg9lSy5+iarxxHuj39VwErpaTduJgN1rYRwz71
	sC+BnvrvJHSLVJNFXp9X+dkMKK7tdR38fXgYtlz7fnNr4aKwdkpYFoGrG+mputAjMV9ncw2KgZQ+j
	Ki91g55/e17XCQSv8IXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBtfQ-000000061Mc-34kd;
	Wed, 30 Sep 2026 12:44:12 +0000
Received: from mail-bjschn02on2071b.outbound.protection.partner.outlook.cn ([2406:e500:4440:2::71b] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBtfL-000000061J6-4Ak7
	for linux-riscv@lists.infradead.org;
	Wed, 30 Sep 2026 12:44:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N+l9e1eJsS64z3oeHt1nnXMDdLjyVgAW9LLc+bP3pRUSWgYiOvvbVgK27i0pTBRL+uhiSWp7EcgVrc/05KKKc464u+bo2F7SA1m4Rw7O5YhZLEuWr7EVTsj55IBlOUP052hXPH4GvPO/fUbgGi633oghxArRTA45s7vaqj3l+fy8/3PyAg2hRr9SbWoCnqAnxTGPVyRQpT1H8RyShJ0RF0qdnngcJRT6DTfUZ5ehErckHlfwrBulpSqwssNDnUZOlcSdfM1PtiIMuEnAvHj0EJ6zDxBgBN0PUtCQHohcszR+ohCEM+aoi8ozyfYqQVeOBdJxw3yuep4gTtbSTdZThg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lgQJzqNzMNQKSUJiz/5fjNJ3DzvoNFpu5AquOA3Mohw=;
 b=FRSXE5CZk+QzK+5TYBIyYwIZXNqAJaMljWjql6ATsfyLiHFajqTeUubB1Oh0VZMhfIpTzfCRA2sMUjClO0nRPHdydLCkDEFZa96PGMjZNy+2i6onSyf3VFw8EvYTKzy7Qy18q+uBuMnP7vBPLkARO6WXTKI1GtRw7CsQoE5te7/uY3xZHjc6RomeKsBCBgE+UUTcW4EHUHyv6z8UexBMatO3o9MofzCRbRhoAvPajv25b8wPUMXzzD7REqQ6B48KuWvT34YBBHX1gC0y/Tffqq6cfTOZIoM1msc9cWR4B5TZ76zHNVbh9DFU8Yetag+32wkGo1kIxanbuVA3Cn5vDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1297.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.16; Wed, 30 Sep
 2026 12:43:37 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0451.026; Wed, 30 Sep 2026 12:43:37 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Brian Masney <bmasney@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	netdev@vger.kernel.org,
	Hal Feng <hal.feng@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v5 03/23] reset: starfive: jh7110: Match auxiliary device names to jh71x0 clk driver
Date: Wed, 30 Sep 2026 05:42:57 -0700
Message-Id: <20260930124317.5648-4-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260930124317.5648-1-changhuang.liang@starfivetech.com>
References: <20260930124317.5648-1-changhuang.liang@starfivetech.com>
X-ClientProxiedBy: BJSPR01CA0006.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:c::18) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1297:EE_
X-MS-Office365-Filtering-Correlation-Id: f843e187-6435-4470-d37b-08df1ef072a7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|52116014|10067099003|56012099006|22082099003|18002099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info: PuFyydwfcYBd3NHqubw89DkrZd4/o6tS9uo4UZp8RRNLYbp/1Cu7l6xSwTEHocJ+U4kaRNUHCGVVmssLgdTI7OzOovicLTg7PMzLpphx2NLRw7mWKjpaKrvfuTBj2dUNFRimhmkHJiiUWNYniej+4Gqc45XrBjGW/fAp1q00cit2UDNXmRofLRqQ6dEeHGhc5qB5awVSzVU1PrPtPTU3bTmQqx2pNHFu2PFF4Tz8yc0GwAEPXBBf6vDRw9wSb5rX5rj9bl8EFYfYyTcUUru9cJbAu95h1wLRK9f0z3X9ErN4my3Kmz5AMoJiBpddfm1V3t+OVtAgribOtkNDpJtj5Xonlv/yprdpmEvHNPbRGkHL3vwWDI63aS2j3EoD5AdfrUZbDDqX6kolnRW3uXYrsuRnEWmPcqL0FNJNQTuhYz1G4lYPbMv6hq3+FiFYe0Gbz355vQHOGV0Inc3SMffkVBDm9AdY4XlPy4rrqfL+vOsN6csT0zYCtp8HiVpWOaDV+H5Z4/a+jH7jkUTMCDtc3HHyaw+dPyh2Y/BiUUiY07jweDpwPaGY/4r0aha+N//1T7dIqOLts8KGTV7kc+ROIQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(52116014)(10067099003)(56012099006)(22082099003)(18002099003)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?evWE7HFveXqZ66ELPdd2MG6DI7U0tC5ePmct3tFpv43nVsORd23a1fKHXAK4?=
 =?us-ascii?Q?TrMynua1wyzRqlQFQOBy30dw9kXBqcysUFnbgBLUs2/euxWxfD3CSmz/smPP?=
 =?us-ascii?Q?V6/zVQlFwPldHbiYmtGt+e7R7ZpfvqDUezDQo5I9to96UVb710M9tONnYOIF?=
 =?us-ascii?Q?BcESOweBPY9F/1C9t0jobnCWqiOrmmGS4QNpbooOjq3bJoH/AFKWKb+cDKX5?=
 =?us-ascii?Q?zifP/c9G/KIrz9ny4NZGG3uK0MtxVcPetdIVbUL9gsN0MIgPChtO+nwTlGSL?=
 =?us-ascii?Q?BZalb5NUOFTtuVhSFyLGA0lLlwu6fqfEh8HeYovpj9WLPb3ChnaVVBgmuRHy?=
 =?us-ascii?Q?nnujcm4IQYy/AE/JtAShHx28RabF9AK6ld7eNADZoGLhH99WX7Ri2Vde5wjO?=
 =?us-ascii?Q?C7FdQWkfWLqZiHZMikHpwE/eYu2zWq13u3lK+3u9fnO9Hhl13iX/ZnZiF35L?=
 =?us-ascii?Q?jLb+YwWlBi/9yZ6G1jK4on5avsC9AACffjpcBNStNtehRpP7xvi9CYHZJoE0?=
 =?us-ascii?Q?kC1fx/I3179DNAxuzHYb5cGKq/REH69lAMzWGrkcSu0RJOJlSvd64J2TtAm6?=
 =?us-ascii?Q?Uc4c4gH+PaszbtFyLL62CxOSKDxefs5zbSlpbSQ9YV9gm3TVQsIws8Ev4VJt?=
 =?us-ascii?Q?Of/xg90V0R97M8HlGjEBdWdO5/dOFdJytlpTNf1JhQ4Tq03irrySgoodOiUs?=
 =?us-ascii?Q?IpH6a7Or1YLFRuyi2OZ6pHPosw0a5jGF967ncHeabV+jw4bcNJoiLmPl9cLd?=
 =?us-ascii?Q?0jHCMDGcX9UWXUSrpJkP2Ct9o8Hkn5rzrdVnMk/CX1zrFL17Ni228be9Iuej?=
 =?us-ascii?Q?E/QfX5RJ5Y5B9LzhAsuTVY48gradXYjrBDrusl5deSseqdck3+6wKDlhUwc/?=
 =?us-ascii?Q?mT8OXUQ5dD3dbOSQu+pGdXdSDBtZAmQIeIDHsW1Ay4hs4Xm97VW8UZx/gF0+?=
 =?us-ascii?Q?B+bVTpblm5Erv6ppVzUp42NbYFGpyyA5bXJVHJL0xX57SOTDMWC9De21qe7F?=
 =?us-ascii?Q?rq39vJNFlmiv7QoPqwL5TeKJQkhAy9D2iNQZh9gFIRotSkh/QYbtTZnascYs?=
 =?us-ascii?Q?+L0a4xVSCPoZe1bcUiVGYOqOCZACDyD7WlNpBDMlHKELvxglJ6iEPjbWMGhV?=
 =?us-ascii?Q?xLUAoowALQwGtiijBufIiIkTCl0SiS0qoRyHDO2Nyly31DR6RUf8Fa1JUHC/?=
 =?us-ascii?Q?haB3kl7BnUNWoqgkFLkCbrTmINIzHhC1WT1a56nuaLhc+qw8ZuJ4ydEv/6MO?=
 =?us-ascii?Q?MROExzas3K6HC/FiG2d+NJW05/vc3e+BvnaL4mtArd9Ln1kP209G2xeOqPCB?=
 =?us-ascii?Q?OJoSgxN3YcKQVxvO7wd9jjCV5CbI0K4fqWd0LOmfdnUHUP9LUzkufOIvDMTz?=
 =?us-ascii?Q?+IozKklzNE5sXoXYtEnfZzoyVB//KA5fcLJFCPvozDhbGyDxQ3/HGPgCN7p3?=
 =?us-ascii?Q?EizlOMYy4LtWIi/e/G0OTVtxENYif+1Kfo6zTfkCnUlJou5W14YJcWnbq6RE?=
 =?us-ascii?Q?2h1zwWKXEVuBhtt5wleyNOvRpZc07QG4nmD361o611x/Zcg7JBvYsqximGUq?=
 =?us-ascii?Q?nrVdkQOgJRtGwFXG555lYsHM17CMLOw4Hy3eS+es1LnAI8eLkidHIM1KDJNO?=
 =?us-ascii?Q?kR+vtnkRiEpq2u/gZQfyz8buRnNn3sPJmFBFCnA25AdiSRIAeXQ4X1qHpxqI?=
 =?us-ascii?Q?8JE5slwkx5iOWujSpjE07OsBvxy9wfqQzOjJ7WGvvYVHHhLcahYI00254Ayr?=
 =?us-ascii?Q?0V8e+nDEYX9jNvTEbhpbo22Mky1U0cbur22lHSgKjf+s4k3DQWfL?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f843e187-6435-4470-d37b-08df1ef072a7
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 12:43:37.7537
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fLT//1ZqYIzGMr5taLtj8vibTyKYD4qZyCKHZS/5lSoSnqEaP9jIzw5UsbR37+oIVajFghMx1VilbWCyCYJ9Cf7XjGnt29CANcK/tiPlaaCwaQOZHvXgyB5zrtLAjA++
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1297
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_054408_053415_3CB7DF2A 
X-CRM114-Status: GOOD (  13.00  )
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

The JH7110 reset driver binds to auxiliary devices created by the
StarFive clock driver. As part of moving the reset controller registration
helper into clk-starfive-jh71x0.c so that it can be shared by other
StarFive SoCs, the auxiliary device names are now prefixed with
"clk_starfive_jh71x0" instead of "clk_starfive_jh7110_sys".

Update the auxiliary_device_id table accordingly, otherwise the reset
driver fails to probe.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/reset/starfive/reset-starfive-jh7110.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/reset/starfive/reset-starfive-jh7110.c b/drivers/reset/starfive/reset-starfive-jh7110.c
index 29a43f0f2ad6..c936e61156a2 100644
--- a/drivers/reset/starfive/reset-starfive-jh7110.c
+++ b/drivers/reset/starfive/reset-starfive-jh7110.c
@@ -69,23 +69,23 @@ static int jh7110_reset_probe(struct auxiliary_device *adev,
 
 static const struct auxiliary_device_id jh7110_reset_ids[] = {
 	{
-		.name = "clk_starfive_jh7110_sys.rst-sys",
+		.name = "clk_starfive_jh71x0.rst-sys",
 		.driver_data = (kernel_ulong_t)&jh7110_sys_info,
 	},
 	{
-		.name = "clk_starfive_jh7110_sys.rst-aon",
+		.name = "clk_starfive_jh71x0.rst-aon",
 		.driver_data = (kernel_ulong_t)&jh7110_aon_info,
 	},
 	{
-		.name = "clk_starfive_jh7110_sys.rst-stg",
+		.name = "clk_starfive_jh71x0.rst-stg",
 		.driver_data = (kernel_ulong_t)&jh7110_stg_info,
 	},
 	{
-		.name = "clk_starfive_jh7110_sys.rst-isp",
+		.name = "clk_starfive_jh71x0.rst-isp",
 		.driver_data = (kernel_ulong_t)&jh7110_isp_info,
 	},
 	{
-		.name = "clk_starfive_jh7110_sys.rst-vo",
+		.name = "clk_starfive_jh71x0.rst-vo",
 		.driver_data = (kernel_ulong_t)&jh7110_vout_info,
 	},
 	{ /* sentinel */ }
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
