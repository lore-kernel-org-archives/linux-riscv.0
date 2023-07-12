Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C917EB64D9
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jul 2023 06:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zHqtd/tGh2Fu7Y51B6p40Hc/BXQ+mGKhPIJcelB0R1I=; b=iPWRfHS834NU+M
	aeZq2ONllgtEs+LmFhiTTAZ81+EtQKn9WYG03kCxyAMQXHK1Eg+woMJYhlD5oMCBX7dJDIcja7OeO
	Xb95RzgnWSpAt8NwSQnhf0D2GsfoiPONymjW2lsBxF8RJ1rSeEk9wwCDZ2V/giFwffI2UcWFGq4vz
	OhZrLuv2rQLfU/TRG3a1BnX/FaNGpUE4feIIoyYLsvvkMYZdSzsSlawShI25IeEi5qZf8Prs83k5u
	5La7b/jTa5imgVC33RPYpb4BMwQBngn5gHxWnnkeW5ypVmdjKjNAOMNIApsnvyZ00xHDgQOfexVbJ
	xnD2XYisgAhJYQCslbMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJTM3-00Gftp-1H;
	Wed, 12 Jul 2023 06:29:39 +0000
Received: from mail-tyzapc01on2072b.outbound.protection.outlook.com ([2a01:111:f403:704b::72b] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJTLz-00GfpI-0g
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jul 2023 06:29:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xse7XN3ZPhLfQHz+NKnE1la8u6IYBo2TtaaPEKPTx8Ndl1r8jP49lLStXEiM9jYSyGxEOAHBLjBAvmPtoEM/jbip1oaC6/6xXH6Gm+RXhfJ8Gi0mjKUdB+LPSlKUtp055pwv6hwL66dfvnoLMGvxk9Qz9iuUV3kRQh5FIUmHeULB9S9sTTPhJi33dDRcNs/MrkZp86jD1aLmC1es1udHl5NK9b5HEUj7VypoWnOTwRejEO6VbLj4bXyNVsIHpGMZy4Ha2qzkHLfGMkX/a030R+PF87k8kIS5ePcH1Q/+UIOvE7FycLkOd2ogN0GdmalwYJbmy2CJmp5LHUSmJ/qGKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QcARCYjsWAzt22qEJ8ZBSVNr6oXB59g7J8n4S498Feg=;
 b=E0ehb0L9EEsEkdrCGGBRr2yffFa6rrYFte6PHork0AqbXZ4c0dnm0xh9AMhNWGN3P7zk+WbpA1vd6dSzkgREDg1m17skbpK/wZ0Sy2KNKPffVwVylOBiqja3QnyEh03Ks71zCuR2LQpb46kkpCPJ7gwmAstdhk3PccRSgSVugocNvF2b8Xi0VlpwtTCD5aim3mviRCn1ub/62YRSIdyc+Smf+fS2mgVq6xVSBGKFNz/uf0gDnN14rd3o28Y4L7wHpA8rBIaMxRsXe5hjeurrodCoRT3/egi/xrZpbggl1nfC5Sua6Fc4Qe6OzXgOAOOoYR4awFHlhTVDByKPxAFeyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QcARCYjsWAzt22qEJ8ZBSVNr6oXB59g7J8n4S498Feg=;
 b=cBCbmZOFNyfbl7Qy9fovoKMEaa220oeyDyhdcwpcWH/ZryCKO5Gd6RlBLAvu1XjsjmeDbrDUSPjrHLEjEy+QQaBlB1rWFE8JUL+4THMvNyjzdYe5dpnRI2fIcK9MGpcFzSGgbOSnS39drQyKmcOSO0vxCQPDd9va5C7ZAnX5tY24+fh9lZXw15fpAdoKXuuTldfzHrLCkok7mULgXDnJmJJK6Bv5wbQ0IRRC5etpko50OZdHGnoZ0tJAHh9tRbEqoWmWfzC5yvAIysAjpEQjAV5wAUhQfRcfhL5ARIjQ7dI2jasdtRgb7uhhLzw3ahlfcST6j5LFqPqqzU2fHuhN7g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SI2PR06MB3963.apcprd06.prod.outlook.com (2603:1096:4:f2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32; Wed, 12 Jul
 2023 06:29:33 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6565.028; Wed, 12 Jul 2023
 06:29:33 +0000
From: Yangtao Li <frank.li@vivo.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Cc: Yangtao Li <frank.li@vivo.com>,
	linux-serial@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 13/15] serial: sifive: Use devm_platform_get_and_ioremap_resource()
Date: Wed, 12 Jul 2023 14:28:51 +0800
Message-Id: <20230712062853.11007-13-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230712062853.11007-1-frank.li@vivo.com>
References: <20230712062853.11007-1-frank.li@vivo.com>
X-ClientProxiedBy: SI2PR01CA0024.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::20) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SI2PR06MB3963:EE_
X-MS-Office365-Filtering-Correlation-Id: ceaf386c-4f9c-470b-77c5-08db82a15b1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oYldZnDEIVqEoW2mVMwHSrkRx4Us+YgDQZxZ5u3xkUkaCrNk+KB815CZ2a7HdjTn6iIHWfsdNRDKvjDsCFnboGWrUtrhx3SSPk019Yx8J3Q5fhTyCjSLbl10SToSsbFn7fUwXnnoPrwxMpMvB+BIirk//ZAPh+s66kLrq/76zCjEWS3WtpndPvxLSg2w6jXFrWK7f1liQ8kbL30IESyBPpX7AcI0/ZwEHghx2lCQy6asqobbQPsovGtPa8myjtJeawiE9v3+0tnry5vw9hqE39gdAgiS9EMW58lGWjB0gl4gPGTYR84dhCrOBKW998SB1y3qjkLVWY9UH1RvraqNPVkQgeyoyeXvY9UUdUkFM0Xgx/QhMdtIQzo74xvLVDzmvIoEGB8D6hwdjEr5GqJbjreS+kw0G4nUo3VghKBmblsMSuqDQZR11hlQTYPEfdYLADqM3Klsf2s+WET7VR2PHMIQ3h/1Zrjl4zBUrcFFstVrxKZw9euWd7+XpxfYZsuCl3cxnnmfg6u6kWgL30dePI5Gs5I7GsHvaZu0qSK/acahlgAgI9ELYP8P9hBY+xrEPL/KRAjLGt9B7pZ9VUjliEjDNMwV0XTLv3wa+xcVSwfdaGN/eIVSRug0JruiyxDC
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(376002)(136003)(366004)(396003)(451199021)(41300700001)(316002)(8676002)(8936002)(6512007)(478600001)(110136005)(52116002)(66476007)(66556008)(6486002)(4326008)(66946007)(83380400001)(1076003)(6506007)(6666004)(38100700002)(38350700002)(86362001)(36756003)(2906002)(26005)(5660300002)(2616005)(186003)(4744005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?k2/D+aimpvP96QLCaOwOz6nNbAiT78ZOtBK22pBI7u+ONblJtdUnlZD2lYJZ?=
 =?us-ascii?Q?yG7rX9B59NNQTV3VUsnlgeO+cPrUJZuOupR6qYxSOonG9X+Kv4LcMG0x3u19?=
 =?us-ascii?Q?tC/bDsX6PFd0AoqmnLkx5UPFm6bO7t9t7g56dbxmLWMTg8zYZx7HkuN0qiEy?=
 =?us-ascii?Q?OTj0Y2gm1z2hgyMQDEYqWjFhHjofgECFQBXlfWnhZ/ywRC1kPkH5o3DtExn7?=
 =?us-ascii?Q?Qs8a40AjPfrcbtdVzw3S4JT6LhjPCyTAR+qGBJdqnJjVo9x9EB5r/1s9CZ3K?=
 =?us-ascii?Q?Xx//ZGufkkwBlfvjn7u4rlNjfP+SbhpKH6y6Keiyelqw6uS1KLXULKUIoGmm?=
 =?us-ascii?Q?StHty8LZpgDpM4ldKOw98iIKZ+Ux7niIl7J0qSDskYJ8Nt0ZNsCxxefAV3iC?=
 =?us-ascii?Q?tg5g7Nk0mx/Fs3SyzGgtScNOeV9AwJUCtm9qFRcXseUIcHI1m2bhoA+7Qklu?=
 =?us-ascii?Q?5vP4LLNgrgptffPwBmW/VwgT8dkBjxZomI7MqfKtQKs000DBT/uwTRmF3Pcj?=
 =?us-ascii?Q?XfFvHfn9JUDJHMtG70jbGXq9C8kg9bIPL2WwbpjnG+8dYMVWWLXqii+YmKW9?=
 =?us-ascii?Q?0k4Ea3AMFUNfe+EcMMs0OeGo10DeGnaPabYAoOvOoBnMU/RwvcT8YqjSpud0?=
 =?us-ascii?Q?xPWwGkkfFfge8u4LYMDgfK5BKl1eUMgdsnV7LuF2a7T/YP+GQMK3j4fsFcCF?=
 =?us-ascii?Q?BwuFbyhcm4ov0FW3WfzQ42uJtOKKfwQ3kCbC+da5ARymcDn3BG3TsH4CFF8J?=
 =?us-ascii?Q?E0VSoBOrQ6ozBtCCtxK2l5s7xn4HoGZgSXq53HaHGLLEjyyAVmAprz+zhErw?=
 =?us-ascii?Q?hwbNM6c/zxGfDfbnedVkA+L+qiXbE5LRZ4IdgYulWRtT7f1J9ODB+I9yDjvI?=
 =?us-ascii?Q?VY/aAwkFNK/cFxJaidAz7dCyaasaWcAYz7anL+KvJoZo40SUHPH3N/xE2jBm?=
 =?us-ascii?Q?ENQo5zSdnVgH7hwiVUZwEjNb7mAr10+ZR0snGwSoEzrkdEBhHq6TUYbrtxyk?=
 =?us-ascii?Q?5PXGwQpGNPxeaHFRDejcrfw+bVjNcxHak6wCUb4x64NboOBP4HXAI7WDi4JP?=
 =?us-ascii?Q?WOKsx7Jyi/Cbk1w/JT+Dl8msTa5736tLPuOjSGd7/oPFmXyqcDddMlMUSIk2?=
 =?us-ascii?Q?0liulz8jn0SGBjoyrGdB5XAb/47Xraku7Q5UrSrLl5IN9PbhjitGTQX3kbsK?=
 =?us-ascii?Q?EEdm7XefUlf4and7XDhc5LLKHZiGW6FNmH6q/tD1zGeRZd534zF5+RolG3xh?=
 =?us-ascii?Q?j7LPvMT2qJmvb2RPTd0bFxhTPQKwrT4BVCGGOdV3qhvd19aejblyO7PU++/L?=
 =?us-ascii?Q?GMmoFh+jq8FvgyveYm9+kyCoVAL+L5Dh6GLseS7leve4FATg6Rj+36NZZfDD?=
 =?us-ascii?Q?ERmRl5VNrVbiET9fg5rSKnwGOkP5+EmwRDdP2jY3tZoNyeUwu9PIGQdi4ASq?=
 =?us-ascii?Q?JdS9aIStPJIZypr0kjgmN2D7aq5N0FHL4D6mDKSenquzTFmruC2M/1RuQDxw?=
 =?us-ascii?Q?egTK8yiaSwjHVuu9Z6BA062kAi1OgvUGXyCE6mG7t3X5LETYa4iy4S7LHMPN?=
 =?us-ascii?Q?HAUK/Y2s3b0jJ1+97fSMG6jX4AvRlmACK4+wLvO2?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ceaf386c-4f9c-470b-77c5-08db82a15b1e
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 06:29:33.5349
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y5NcnwOAROXxsGgfWP7c8ZMdEfBO9GZLdSde2mFESBB4FfmqOuHO1nB3ZMqvu+fX+B8pmhobdL3Ly6RRzcRPAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB3963
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_232935_253954_202AD71C 
X-CRM114-Status: GOOD (  10.63  )
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

Convert platform_get_resource(), devm_ioremap_resource() to a single
call to devm_platform_get_and_ioremap_resource(), as this is exactly
what this function does.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 drivers/tty/serial/sifive.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/tty/serial/sifive.c b/drivers/tty/serial/sifive.c
index 1f565a216e74..684933f5504c 100644
--- a/drivers/tty/serial/sifive.c
+++ b/drivers/tty/serial/sifive.c
@@ -917,12 +917,9 @@ static int sifive_serial_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return -EPROBE_DEFER;
 
-	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	base = devm_ioremap_resource(&pdev->dev, mem);
-	if (IS_ERR(base)) {
-		dev_err(&pdev->dev, "could not acquire device memory\n");
+	base = devm_platform_get_and_ioremap_resource(pdev, 0, &mem);
+	if (IS_ERR(base))
 		return PTR_ERR(base);
-	}
 
 	clk = devm_clk_get_enabled(&pdev->dev, NULL);
 	if (IS_ERR(clk)) {
-- 
2.39.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
