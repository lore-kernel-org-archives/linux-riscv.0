Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60E9BC433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Apr 2022 08:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WO5cmixTskMFt150nxq5cP8iZCbPG0YXJHYCPW4F4qQ=; b=mv+EbAORq74//o
	RakuRrcHVJ+GysO+yPFchGyev0j869DKnZzBDdTtY2EXJJuZon41OHa9ZdgYQLrGe6oAVJiiCd1uq
	zVzVnJhHYT2+GaBpBeYutBA1ydDD6eFpT7XeTYuF7YjqQa1ElfZU2vCg19uXMYDw10JG298ipcaK1
	qjantqPyulHojAm5CJDQDb9b29Ryj64pvv/VsoGSulpg3CWE99AqU12RSQYbFlRQyBYUnDEajy9yT
	AsIbtxEJB9BaEtGq6DFxF2Cx6pEmSNrguYYRpzfs/w4zFG+xyBPi9zMbsyHQmJLAQ25danzt2nDXG
	ML+khCmyZUFU0v+z2lcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nck1c-00Ft3X-B8; Fri, 08 Apr 2022 08:31:24 +0000
Received: from mail-sgaapc01on2071d.outbound.protection.outlook.com
 ([2a01:111:f400:feab::71d]
 helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nck0z-00FsVR-W2
 for linux-riscv@lists.infradead.org; Fri, 08 Apr 2022 08:30:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SC9FW1Jblr27ZuUkylE6a8znNe43PQfQ2cAf/UVRHnGxrwqqZttcXZDTQ7LuZVVEJq0UXu6fgvSsoDH+H7WRn6q39AFHoZBWtz/9Duj3aVRKhudsqAeLF7u78r4ABIKJlEXwUAZsqLJZ8GqjsEgIs07hQFtlOteNb4G4WJq4WjJ//rDB1pv/aR+LkWXay99pHerba7CFKwOTKmb1s3u9kT1ky/Mv7UwIX/dP9X0ZH4XD8sEGwnAxTlVMK4jo+pSsRtPGIcRf4YCXihZTOr6PidIRF9+/Q+Lll0V3jjP0l9yTdht8/g0g7ZdkhWOXOdCjoTlXya8bMEGVqb3spWQIiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EMqtZfCNaXj9pgBly/AccvT6sl6GXJl/C3HVADh6MRo=;
 b=T45AUm5TJTm3hhxq7CtJ/IW1vwAYWI6o+bNm1FHqjroI+Z/WVSmLIcIl+jNx1MjagWkT/itAT9cHVuMw0T3lGhru+XWBnmqV5em77azW0mopTwyMLZQIWIkrVuEt1XUsJQNbRGUr29vIxDzDGkN719uG4mMsrg2iTvZsvvjd6U5w9n8qWxjz2CA8rtSjUKk/zM+E4QCM0q1mvsRa8wpGAli+o32L5Pe1uXU3um1e0RDZghyQCeI+ijPd1vmwRv1eMOt/Q6D5Po062l28yYjWWWLKypWNtdrW+fbX+tYDGgIB4jWVXnfbycRcSP3j3pGJ+cIzde16sLRCksIqtVaHfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EMqtZfCNaXj9pgBly/AccvT6sl6GXJl/C3HVADh6MRo=;
 b=ITRMbLObvAKbAK6imT4MEzqvkKKaCyRMiJfpTER4jFhggYVBpaNsJiqCZ0DMCZ5u2kjjWj+j4jDTTtX0xwQYugl3ajoy7GJmr5jXZ1bfN1jTeVPJe+f1Ggv5qhreuwBBZGQTIDkMVYVP6IJB3zBLx3ojzwywXhOtDNWpreQorVk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SG2PR06MB3367.apcprd06.prod.outlook.com (2603:1096:4:78::19) by
 KL1PR0601MB4966.apcprd06.prod.outlook.com (2603:1096:820:95::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Fri, 8 Apr
 2022 08:30:37 +0000
Received: from SG2PR06MB3367.apcprd06.prod.outlook.com
 ([fe80::74ea:8357:f542:4881]) by SG2PR06MB3367.apcprd06.prod.outlook.com
 ([fe80::74ea:8357:f542:4881%4]) with mapi id 15.20.5144.022; Fri, 8 Apr 2022
 08:30:37 +0000
From: Wan Jiabing <wanjiabing@vivo.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Lee Jones <lee.jones@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-pwm@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Wan Jiabing <wanjiabing@vivo.com>
Subject: [PATCH] pwm: sifive: simplify if-if to if-else
Date: Fri,  8 Apr 2022 16:30:07 +0800
Message-Id: <20220408083007.41538-1-wanjiabing@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: HKAPR04CA0015.apcprd04.prod.outlook.com
 (2603:1096:203:d0::25) To SG2PR06MB3367.apcprd06.prod.outlook.com
 (2603:1096:4:78::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 49a604e0-245c-4632-d783-08da193a0e39
X-MS-TrafficTypeDiagnostic: KL1PR0601MB4966:EE_
X-Microsoft-Antispam-PRVS: <KL1PR0601MB49664CED1C8F21BA1C26BB79ABE99@KL1PR0601MB4966.apcprd06.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5LxpflR5H6YAwOQgTrWzY39SbRhDh4DO4jzZRyiWCCAiOGnKDVWAALy3GfXVisQkB3hc9ou087dnPQlFD502RQ5qqj11hueMQh5MLCRXuhCNq0+eF9Na57s8mKhU0vT0ijrJTlfySbRIzgfIndLlx7rUQSccXpixkcxohENNbFryM3Mh9IPTkj/ffctZ/SXFDkhm7DBHtgP+rLJ2CO4C0rRyW6bZWuDCPhLn8amaoWlbwXgF5QBBf5aeG0yrIDPF4YX073Sp3u9VdQqQ9L0Krm7fGO8b8hudrgYsIc6DSrppVIkofGYINyGmuJKm0cfUm3H+dH0CC1B0vgoBRwoxH+kcqFYjJc1vLGjVCuDXpGQ/2/c3FGMCB4MDD/aUk58vfl7f7CQpPuzNQVDqyYY4z9TaOrszgVmWpeFe6qc9UoRhG50yiETC6ygbXedPKb15fp3wInBl2n+CfslblDJhrhdbh863qt2ftrp/MOeCotXbyIlzX4gfmpomycKpPUgNXvaJXNGLh0zrq5A2iD4XeyF49TE44qgtfCjeY0lwFkSeRq48BojqKW+KmKL900YnGB3YDibBWtjH6V70uOAqqxAGxNP05EOmfDElPQIvsCVxCwY+hfFybeqOcqLoDXPBJka/rH6IWB4z4eoGSV+NPMUG6qqt+FcFG7w6nDtgQBGjg/zgV7H9qof6wVdHUmwVLXIIw0ihKXdG2V6CuAfE6Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SG2PR06MB3367.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2906002)(5660300002)(6506007)(186003)(38350700002)(36756003)(52116002)(6512007)(316002)(4744005)(38100700002)(107886003)(26005)(8936002)(86362001)(8676002)(4326008)(66946007)(83380400001)(66556008)(1076003)(66476007)(110136005)(6666004)(6486002)(508600001)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9bP6K7fbbJ8DkBRkqrR+UjkKFPW/NI7TH5YU08C7fIX2c7VRO+Lq6tj1fLsS?=
 =?us-ascii?Q?5AP2uhFbZ4dH97HQs2YFj949mFmmfKAVnX1DT0TyFvPhiLkke5PuQJzyEEbv?=
 =?us-ascii?Q?+EXjl3R1ur5K0XaJ5RjvnoelaXs2cdxIDOpG31qKlZlinGLWb7G4msv833x7?=
 =?us-ascii?Q?bzK6W6pbXASUW7FEoew46UD1S5RHxMhKkPN8aBUEQoE085Sg3waFa/zCSK+K?=
 =?us-ascii?Q?G4kvGN9srvt059j8jWrJjHxrL1fytSGZKh5Nn6TVzC/F7fk0ENC45OgvRdww?=
 =?us-ascii?Q?AGzPpJIpEwRAwkDDi0aSnBFya4YT/eliet3zAFA1dI4D/Pi0Fu02kfJjVmC1?=
 =?us-ascii?Q?xYsgQHNzhVx0NZAOqqZJg6eMSGnCKiicshVTQU+BD5W8hESFczLceAQbxgn7?=
 =?us-ascii?Q?OLfSPRte0M1kc1DF4TN58TMU5odNQlqTlqp2KdoZ+k8deFeCiID5dmTG3khw?=
 =?us-ascii?Q?h6HdDrS2qSUvCc/o6euSUq4TkQeCUuuA+gMgl31q45fgo2DHsOdFE0WuwSGl?=
 =?us-ascii?Q?VR4kFSvlpnB2D1OlAM+3XtjuHoBTMeXjGL7/jbnGwg1mipQOvvBDj59UJh+c?=
 =?us-ascii?Q?eZm/xiQmi+yB1fBHj66N69t62ODqxqf5YvBRlG+vC/+DMwmXh83+ggwar2if?=
 =?us-ascii?Q?0TPZERZTRaQHWz7+9ul88TyfFS6pT5kHzK63WmtmUNt723Bu6MWq2ul2eilh?=
 =?us-ascii?Q?3hYa4fJiSZxLPeheEadbrQoKlUoffrG8WJyD4tNdKKm7zVqm8NfdFUESlOsE?=
 =?us-ascii?Q?An2Eff1u1nIr5W62cbQc1evE/dHy+ebQxoAZVS1Sd+G03xW6IJlOZZhdNr+G?=
 =?us-ascii?Q?ZTHSsnHvflhR74XrFdUCiU6wEbn6t5KhrHkF0YCm6EjISbxgEFXWZBGVEF7e?=
 =?us-ascii?Q?y35SiLRJXaQbAQt5VM8diOjElsB6fXuarGYh0iItyUOL/6cQLCWpPlcV9Qc/?=
 =?us-ascii?Q?V9ANjKsWATojIO78H+QG4drND/XqRG00IDoPXvc5THMsYK/CSVtvg3XUkRcm?=
 =?us-ascii?Q?0k+RImSR8vzFkGtKacz3HTs+mnUFJN3Wz07UMNQtAR3T3WhND8WJoZEmqJTo?=
 =?us-ascii?Q?FlubqKHJgaZNgEZpGtYNlK8ubHklUnOKEeE4moxtAM1vr4n8e4GkhtRZ8TAO?=
 =?us-ascii?Q?GlCYzG+HhUAViPiehG4Qd/k89xrgZAhGw8Xcns9z7ZmJLcBOxPmf+xs0+SIw?=
 =?us-ascii?Q?Hn+Pc9XDliRYxSe/v5zTB0YmnEj6ZiyS+xhwk1oUW7IRUAJ/GU5K4TqIDRJ0?=
 =?us-ascii?Q?btGgKxbx3cUJulVkJyvQ5rxH/5nCbhAwfr0SBmkOyYrgr74yM0HBFZezpxnP?=
 =?us-ascii?Q?6g4Ja19IDZBPd4gWdQkw/okrqFDVJqPZz0PQgbi12jqg8zdx7egqz9gFZzA9?=
 =?us-ascii?Q?3zZDWE9ZXh+/qboSCwX38Ikbk6uo8dBS/8wEdBjhfzmpEKQQcTeu258YiYZ/?=
 =?us-ascii?Q?VCHQMeF+9h/SfwhLgUjgymd+zDB5b/FVKV2u0LdxVHBkodLX/sQnicOT+wN6?=
 =?us-ascii?Q?dhGlPJT+c7S+8Pb9sfX7GI2E53BOzWV+ffuYP+84NiY7cXC6Zzm44Nr9gT99?=
 =?us-ascii?Q?a6jEuFwT7EfP4qKVnVh7MtLZSPl7UiF8A6DgLXDoXSHFX/WPqrNcwKkzKJQN?=
 =?us-ascii?Q?5yDBe1YTtFvgu2lTA61zzWhUIp25Oq2KlcIzuPT5VLmzkcaEt4GJeCKoYyn9?=
 =?us-ascii?Q?VOYuynudgmKM11yJW8sum/uHVRWwpjHCv5hbrEcPSlacyImdEGdPfs6Yj3Wk?=
 =?us-ascii?Q?u0cm+ABn5A=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49a604e0-245c-4632-d783-08da193a0e39
X-MS-Exchange-CrossTenant-AuthSource: SG2PR06MB3367.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 08:30:36.7878 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0fzTMbEZ9sZ+1bDofz7Cj+SsapSYRGG6Sn5hOV9vgtNRVFiPWkmnGJau9LcLzgQhO/nl7c3iTEiQ6CnfQkXcGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB4966
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_013046_078064_D6F8176F 
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

use if and else instead of if(A) and if (!A).

Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
---
 drivers/pwm/pwm-sifive.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/pwm/pwm-sifive.c b/drivers/pwm/pwm-sifive.c
index 253c4a17d255..e6d05a329002 100644
--- a/drivers/pwm/pwm-sifive.c
+++ b/drivers/pwm/pwm-sifive.c
@@ -138,10 +138,9 @@ static int pwm_sifive_enable(struct pwm_chip *chip, bool enable)
 			dev_err(ddata->chip.dev, "Enable clk failed\n");
 			return ret;
 		}
-	}
-
-	if (!enable)
+	} else {
 		clk_disable(ddata->clk);
+	}
 
 	return 0;
 }
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
