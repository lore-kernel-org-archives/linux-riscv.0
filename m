Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDF49C43458
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 11:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YFI4aX11il1GQzsxD/5m7HhCoJLW1bkIKYLGY9d5ec4=; b=Rg8SaGlvsck3ek
	brF3BVjznGbR8igk8U0xjXfWVwLFgBKHGoEKpRUMaA4NcTOGmMbW1RJ8xQ5XtNVoIo4HWeYrokxCd
	wBGsiRIn86uPHAARAgpeOK+1fvjNzysWVbr53DG7u/h0Pfx/xEH045oYe8Z/KeieI42shD+9e8N7X
	exYMgKmoWBkkYPSk4Hpyvflzs1LfpMr5N44ph2tSVKsC2+NvVfhgOiJSt2uMA3iGKqAcz664IpRzY
	6IQoaHDRvqfgDTYlPkUr1K4rsH3RuEJ7odfblfsGamhti5MKl87g1EtiTGdEnRclIolxWLpqRubJJ
	moKhG0mixk7TLFXNallg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjEra-000000090Qo-3SA9;
	Mon, 13 Jul 2026 11:30:18 +0000
Received: from mail-japaneastazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c405::5] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjErX-000000090QL-33zj
	for linux-riscv@lists.infradead.org;
	Mon, 13 Jul 2026 11:30:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qyO7/TLFeXSJJEalsnLrKS5sIO71gaHZQKlliJm08sSI5CIMjvCwE5xLbpJOq5BCosh858Y3Z1ykeowyHhqiH5SkzLiPttyrNeupPr4DVExZH2+hPoTAoLsSlB+FJiCx0kwmSOvJh8fS3h1hOI6wwnWXj0FHjk13WQSKu0qWtZhdeGG4l+3+T239NxmJSMIXbUS0TJsNPoUqk7HC67yz+132cOi4GtCAMXQ9gIlSF9RpsDBWN6KTTca9UtDWmTf9ANyndaIamvThJP8srBGwp4luYLlC17Ug1D1IsEp/IKwnNcxfQQ2/SHydO6hxobRP2xB5hhz81SAIIaBx8usYAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mVe38XhpmIi6zx4IfElJa6mVU2FGqV1jHfdFizgBYoA=;
 b=gvwhg6KgPyIpSW519diCkRs3EF+C0uZar3ETkQ6GwM4jPwflomXtT+c2vGpnhjlPoLedzlukrXmigb07XQY5NtVIVESifIfTHQBlOVDSIvc/KJexjM9/w+REE/rDqZg4aZI465UmNY+cT9EPrbb+nLo3NcdmO1Llp3FQ1BM30dQmGv0w4qD1WWEcBAe5furIb3f7rcsG67Hu5xJoaFmjU4ZyKtLAj4AEbIBlQE8gK1wEXANGs8idF8Vq3hXMkG5CdezaeLz22wOX2pRB2yVBOhv26i0IB+K0zZxE3cQyM1eaFmS9aII6qh15Un3JcV0VH1xiwZi4tVdUxy1wqzDKEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mVe38XhpmIi6zx4IfElJa6mVU2FGqV1jHfdFizgBYoA=;
 b=fkCDp1JeJog3MskvaqJVO5TXaIghvPVVT8Rq8QvcA44bwJgwNCN8W/k163fHibY+P2BcaSdZIBNA5UtmteEzfUVUlfjBPhUvtuAAEql8/8JiMFsUG+qbql6Mt8n83wxStucMJCzkybCXx+O2hf01puEklHqOzb8AjXeCV0TW4ide7tgQSt8qDxpdX13wWF7qz24UgOTg2H88Kw9TZTp0pgitnmZ1hJN6SKUFL+yM1WqmMlxCrIqGalegzzLeOfhHSN3ZOPHy1c7R+hdYy2/uba9/2i3InTpwCCi239h8Vkvlg9r+TM247StkHtp+85zvsadbFHc+lp3ZDTL4Sy+0wA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by TYZPR06MB5146.apcprd06.prod.outlook.com (2603:1096:400:1c2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Mon, 13 Jul
 2026 11:30:01 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0202.014; Mon, 13 Jul 2026
 11:30:01 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Conor Dooley <conor@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-riscv@lists.infradead.org (open list:SIFIVE DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Cc: Pan Chuang <panchuang@vivo.com>
Subject: [PATCH] cache: sifive_ccache: Remove redundant dev_err_probe()
Date: Mon, 13 Jul 2026 19:29:46 +0800
Message-Id: <20260713112946.468067-1-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: SI3PR03CA0011.apcprd03.prod.outlook.com
 (2603:1096:4:297::6) To SEZPR06MB5832.apcprd06.prod.outlook.com
 (2603:1096:101:c8::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|TYZPR06MB5146:EE_
X-MS-Office365-Filtering-Correlation-Id: e67362d5-6a85-408e-4c97-08dee0d212df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|52116014|23010399003|38350700014|18002099003|6133799003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: ZxewLBqvPxtBI5jUkwzvha5KHEqPr7n/yQcgoldkRN+oSdvujeph6KJ6WH2LDCY5PMeTvKMf7tFCHqxcnHzPgmuJRkVh579C7BXGC+Hq5mJQfcLtiCWZ0QUSwq8smD6bP5nUwwoztlP8G95kGiS680wKVQDcFoWMLIzQwa5t6OjGMxK3LmKPR5bDrdtVcs6zazX9dWh2bkOWADFofxS0gxOp3qIUV4iuyL8XEJroCy6OAExoAUc2tgXvrmmSaUXKsBrGNzd/PA25X7gXG8ZQ0+7khuFwOkfFVydsTR27gajTNN8pmblbQMe70oT/MRMZhnSfr2We7bBQjSXR01HxX4NXRLm0HboprLGX8WmNrn1yfq6Xq4HVGNpVQqPK7kGNv7Y139UDvMCyfMoFnjHdWZKZXED2rmaYD9UAhDvY1R+3H7ka1ReKEBaJ8UHFz3ghyenNHRVn6doQND+/8Imk9+BjiURnwgl6x0QGmCsEStwhQ0XaWeFkLC9x1Ctd0yvZmPyTBuMs+V7G05KAyXeGi8nGtoT8TLChVU9w7h2ynXFRfVW8ft6loyY14Tebz34vk/eo+ePHBxVsIm/FdE28UlicIoUP8LcLbbtRF4LJQBDhCfGjZ/dsVBgFhkvkGYqBCTqR2AnP4yHUFL9cVjEyWcC0JwnrcGLDchzb8ch6hepw89Auel/V1Us/PbOYqOe6ls7Tsr8jRBqggehHrqzSPIcN0amU339GEQNCLjHbvoM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(23010399003)(38350700014)(18002099003)(6133799003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6kQw4x34tZgAZZyR2YLQfXH369P15MaS6cDSs+UnD0V4fbtUhndcSN4ycPEm?=
 =?us-ascii?Q?lmeMNkOnM8p+gR9qOfTXgBPMqyfYge2sBI7POpj10gK/ncIEP9PL9Wc72H0B?=
 =?us-ascii?Q?SVMf4gPlVmLtfqv4aRVygFOVNPW84xRyGi64Qaf2t+qj9WRAuJ2CSSIxlFmu?=
 =?us-ascii?Q?FraVwC4kWT47yYYpiIVIXGo3VIeVv0Q+K7GEAmPOPZ/NR9MOa836ju5bb6S+?=
 =?us-ascii?Q?jzPPcQM0NgPYEvAHUvZJzr61ykGkyK7QQLyiJCmWH94bEbDTOhycqjPFlOHC?=
 =?us-ascii?Q?DG6JvkY5Qfbi14mzGXP1H0cu922Mc/05fs5UqEwy5YlusFGsfT3E7afcFABr?=
 =?us-ascii?Q?M4sKuHwJjKHXJRnRKgkkNQuO/xnu2CcSyFCcfLKWQCDovKBts+9kyRg240/I?=
 =?us-ascii?Q?hfTXQ8JXxPIbRB0c3PiQEN8WrnZ/MJyhqW01oGZSgEuS+vYJrZ1wL9Kp7fYv?=
 =?us-ascii?Q?YI6zrFJCyYkBSeeH1F++RgIKCt/GtQKCZhKCb0HOICrlIX9311hTcOb3S+Kl?=
 =?us-ascii?Q?62rCZyxSz65gTUbWNXCzl1HhH6a8B9Q4t47ISdxJMRh7b1y4DA5HpOAD2bow?=
 =?us-ascii?Q?YxCf/lw+QAF9dqcX/Mt/nJ2KVK+iA4RAifcYZjw+pvBM1ucvYcuR+B6QXmf4?=
 =?us-ascii?Q?KwgJxZtaIXPJLLx8ULDFc6hDc+3i46/HGkOWWMFzhKWTKlH5YQ32D5dQ7Oo7?=
 =?us-ascii?Q?7ZOFFJHaJeD+pBQhfEyPXFD0xKBh7FJANOyIGx6pfT4avSNyAd6RDsd40xRy?=
 =?us-ascii?Q?SZqllVKegzXJM2qT5HfcaG0uhRr7eZwtyHEClG/jZUltlEbqNyNEZqrnzHZd?=
 =?us-ascii?Q?wxbfAX+2SqmX8e/bIois8GnLlTrkfHTJ+GCmoUzh3evCbW/yHqcEh2bJk6xt?=
 =?us-ascii?Q?3ETZkG9/DkN/bEt/rSDYxzSMQzGplNsuZd3S6Z8XvxOE8dv9KLNQYDzwLiR4?=
 =?us-ascii?Q?pwTE1F0GQBDjt5xuSIjQuyt79Ka7obbCMrQ4rPwNOn7airUGz6EF1zZySJnk?=
 =?us-ascii?Q?LEvVuozRq6wlkVrgm5LxRrmLDL+jMREfVs4XZoXG5wuQzs602VOov8EVqSWD?=
 =?us-ascii?Q?cDJBFtVce8Bmgef9xXKnsNOWhrllo5Wasd1iZ96vTRxX1JjFqnHAJpsSkMMk?=
 =?us-ascii?Q?IYS/651QHZyTlTuOCMxHFkW730GMHqlUjEd6iyr1eSoCt5qTTAd70pqSv7Dw?=
 =?us-ascii?Q?G4I5WAPw5zk9E4sNwUDijz2wzTQYo/hvkxXAgko/+1zgPYc150kllVtFfnXJ?=
 =?us-ascii?Q?I+sXcpwtS33qfIa0IvZaIVJ3QxUErOxOk5NitEbE/hCFS+iSt49vNWV4NbFz?=
 =?us-ascii?Q?BUx1h4DiZLSW2r4RX/UsWecmN85e/VjPq8Pf42HqYvulCfvlEQqPAdYH0sNu?=
 =?us-ascii?Q?ZIHPCy3zthrKAHaO87JHTq6OXUO392OKt4WFGRfeZ5VtFRvJZha0OIz9F+5M?=
 =?us-ascii?Q?aBG67fJ2gYhbfyQ1QY7zn8X9AxSl4s30vDH/lE8Gk4RdrItTfJeWwZoJM/hn?=
 =?us-ascii?Q?r6+wBAZdWar4N4RMm+ZEp308rw9L33x8DZovfUhrsllnbVCkLMiUhuVy+fJM?=
 =?us-ascii?Q?NEQybR5tQUMHGHcf5DR1w3cKYApkmQOoqSM9fDtquKAI3LdW3EEws71KnZWt?=
 =?us-ascii?Q?7IYnCpQnE/IDHGQbc2PZXlyoNZnAtC1QnHTxVPkhCn1uSfIpiTXUa/TMxY2Y?=
 =?us-ascii?Q?3jle/plkesyS8Jaqvcd1vphGw6yu1/vjR6Fxc3ciI3ZmZCx/Yt/0PJrfGT5a?=
 =?us-ascii?Q?VYkhU6mRtQ=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e67362d5-6a85-408e-4c97-08dee0d212df
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 11:30:00.2539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KMlNoWo4KIjOGZF3Dy9H5/f6sc0SSS21ij985FnA2Gr6nb5sHWo4cKWxDFK5uUfCW3owrKFTHXra20kMkPg3dQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_043015_903334_EEC44633 
X-CRM114-Status: UNSURE (   8.88  )
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

Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
devm_request_*_irq()"), devm_request_irq() automatically logs
detailed error messages on failure. Remove the now-redundant
driver-specific dev_err_probe() calls.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
---
 drivers/cache/sifive_ccache.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cache/sifive_ccache.c b/drivers/cache/sifive_ccache.c
index 2acb8bdf06d5..71d3f94987fa 100644
--- a/drivers/cache/sifive_ccache.c
+++ b/drivers/cache/sifive_ccache.c
@@ -275,7 +275,7 @@ static int sifive_ccache_probe(struct platform_device *pdev)
 
 		rc = devm_request_irq(dev, g_irq[i], ccache_int_handler, 0, "ccache_ecc", NULL);
 		if (rc)
-			return dev_err_probe(dev, rc, "Could not request IRQ %d\n", g_irq[i]);
+			return rc;
 	}
 
 	return 0;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
