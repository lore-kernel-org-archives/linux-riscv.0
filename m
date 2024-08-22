Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86ABCC3DA4A
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Aug 2024 04:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ScKTH3iMgceffsbnYUd92GIOKn2toPL+Pw1jUZAst+Q=; b=N4UN2Jn82z2L+T
	a7/wOrOc+2KiWT7nNBQyw2Hz6rfLdIEEFuuHlgcUv8giDT7xLiUMHpEIpYYFJyQs53yqzc4tsn3yn
	kiEKwq1GZK/Z1rRVegNjWEpDmKYrQ+L/o41hHgP7j0Tj0FvRJrK9LIgnyhUi0Adk0bJAMBNLqPfDX
	Sric+w4wkMNlpDntqJdHu2kb7g387EAZPF6Z1sgVqSE+oc5mRJ52rkX0LmRDcoZD4Q9vl/gZCItZq
	FStdpP5XNLPG9n7woNB9P7s0nb+XdDGrZxrcnTkEL8JgVARSWn1Ub8inA8NoFcOX0qWHFDzM6LlLr
	WNj1DOrX6Axqp+isW7cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgz9X-0000000BKWT-2Dx7;
	Thu, 22 Aug 2024 04:10:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgz7W-0000000BJuP-3Eqt;
	Thu, 22 Aug 2024 04:08:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Sender:Reply-To:Content-ID:Content-Description;
	bh=s2jmReZ0SVaFSOaq1iGOKgSIdyPKBAlggmN10PJDCGo=; b=NNymwoGcqZOt7BNwM1vGp9eJdY
	xMxkA2Txaxajx7XV8zlJhrzDIy7THGB8zaWN28k7RDwszcdGMc2IUM4Mfp+IuWXvuz7zsrAlgxdDZ
	q4p+cmFlUO9bd89Wx6GByePEoaM12cxLAEt2k7GSwnLoeDsO0hu9Nfii12oX855Xt9/w6+k/4/xqo
	dsLsdQQks5N8aPWmK+/ezEPpdYod1uBDmDh/Rs8nM8s5aii0q0k63pNj4UAuwWTYuE50t8+RPTXYz
	yaBxt1hYgpgd8jenc3yaNZ7QZNa/r7EPyg13Ire9UTGbohXCBRfQ+Rxv1+km/HfFqeGZo1hHl/BHd
	iKpTz7+Q==;
Received: from mail-sgaapc01on20609.outbound.protection.outlook.com ([2a01:111:f400:feab::609] helo=APC01-SG2-obe.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgz7T-00000009pJO-01oj;
	Thu, 22 Aug 2024 04:08:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vbD9Ioi9AVg5WRGPAF/TBYuqeQ4+jFLTFBYBol64IStS5nj+GI2MIMmVzAUkecQ7d7gGyC9frXl6k3JdjW0d+WZ7Cff7tYpZO9dUnR61nOJ8iWJVavCq2Hwbh1Q+tgZzqWecJvuacHEpvyRXCCfwxIRmL/z05OxiJ6yeHLp3gsCT4Sl9CWZWgzZTSaiiv3HyAK9vHKySrQeWp3aDIMBD8d5QH1waG4AGp5Ud0N+EidrE+We5DQEu5RUrab4/dGDjGRBRbcjONdCdi9xCF6E6ofXVhXRzdYPdXtwzErx8GXRPyAhUqhQ+GIJdn2tgX/N8wKJtQst+5sRvHMrQrm9jEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s2jmReZ0SVaFSOaq1iGOKgSIdyPKBAlggmN10PJDCGo=;
 b=XHzWjvJuYTlHS9CsShwz8+0be4jSQZhY7ia8Z4v1PM67k/KGRbQ0nKFPBfjUrBfep5ZNnRqMkcl3OdLR8mb+MlyL5cagsLQhpdVkUdUwwIhLcZ/iiVIXrSXCM/Az1bcf/bgDTsAG2C8A0/fqBmWoM9vSlPEXHyv8e+9/nJRrL1Ylxdi9O/C5s1X8GCk2jnpVHwRWdzN9J6rlk74qjdv+oMCR+flXsd+eDZS7g2uG6dWs0y5O3JNuYwgZ2EQU8JkogWZ9v/w81gWaQ9dNZGeLasHykyHys5ShM+IFmKd2ObUYDKPh/YlwCLQAwar9L/Le3urmf8njycHchkDBMntwvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s2jmReZ0SVaFSOaq1iGOKgSIdyPKBAlggmN10PJDCGo=;
 b=hPD+pq2o7zfu8kdhddySFwmem9Z+qtSDms7TnlLKgtGqrZ4TKFdFGgoxtVEnK9DofvS4DgaDcgwXfsi2miGZDKQhXCqQ31dkDG2e6gDIWv6S0k9tueSqG4waoXQOvqPS1ZbJTwt8CCGsOHVCLDj/MUtCw3BnJOxvyF6TDN57rCDhowSxB+evkC6I2uOKLrZO3Ek/JIxjWWSX3u9sEo4KdTy6/XuU/aBMkwMTr6+w/wFvAHw218+N38f7y0U82DzQG7tzQuRY30cJVTKTqogwe8LCYnFsEsELZ1vvN4XbGU+6RKF+EbqtWoctLyjEmW17idKgZ71KFi51nh69zlex+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5620.apcprd06.prod.outlook.com (2603:1096:301:ee::9)
 by TYSPR06MB7134.apcprd06.prod.outlook.com (2603:1096:405:8b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Thu, 22 Aug
 2024 04:08:02 +0000
Received: from PUZPR06MB5620.apcprd06.prod.outlook.com
 ([fe80::b771:8e9f:2fb:ee83]) by PUZPR06MB5620.apcprd06.prod.outlook.com
 ([fe80::b771:8e9f:2fb:ee83%7]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 04:08:02 +0000
From: Lei Liu <liulei.rjpt@vivo.com>
To: Neal Liu <neal_liu@aspeedtech.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Bin Liu <b-liu@ti.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-aspeed@lists.ozlabs.org,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: opensource.kernel@vivo.com,
	Lei Liu <liulei.rjpt@vivo.com>
Subject: [PATCH v1 2/5] usb: pxa27x_udc: Use devm_clk_get_enabled() helpers
Date: Thu, 22 Aug 2024 12:07:27 +0800
Message-Id: <20240822040734.29412-3-liulei.rjpt@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240822040734.29412-1-liulei.rjpt@vivo.com>
References: <20240822040734.29412-1-liulei.rjpt@vivo.com>
X-ClientProxiedBy: TYAPR04CA0012.apcprd04.prod.outlook.com
 (2603:1096:404:15::24) To PUZPR06MB5620.apcprd06.prod.outlook.com
 (2603:1096:301:ee::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5620:EE_|TYSPR06MB7134:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d1047ed-bdb1-4904-140d-08dcc2600431
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|921020|38350700014|41080700001;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XinCLQw+IROYIR7Z00ZeYTbcx7B4giwk3xD9Susie3FQdDJLWQdubBkIJb1o?=
 =?us-ascii?Q?1c7J8EmuZVCK0yqxfXP/Lv1S4BSWY2VOlH6pqf0THyJsqaIM1+jMD/Ex1pOC?=
 =?us-ascii?Q?guYdvIcn1zp4BfniSCMkoUsOCx+WJrh0s68je/zIN98aQqMgDH73N4X/Ata8?=
 =?us-ascii?Q?dYMyH7qTQvrsYKuAZOeD6GEvqcmBHGOr16BAbSQYf5sKyeA7OwbAyOpeBQBr?=
 =?us-ascii?Q?vIhoQsB/qwftYa0t282zRXiYH9icy03hNkyjk0jRAKtJCaygHYLpr2VZfMlu?=
 =?us-ascii?Q?vl4iJQtFdX1R75UoMqkHy6+BFQRXrM4SsZWnbPNe8MW3CcTFkeWlNzACHw3b?=
 =?us-ascii?Q?bjCPV3JymFnO+0g1RafFib5jQeF4W7nCObCktCIrto7xHmEyn1aHf/joDfXX?=
 =?us-ascii?Q?ypwZIZxxziJuLxyi4XBv2Fvz5ovkW7/a4JR8gM8BwtQ+1XUxCwXVyr4XStTs?=
 =?us-ascii?Q?aWdUh3DLUKp+bHwvuSWXxQU2mIDlb2AnZ8d6lYakudEEv/I+if9Ts/EPSO13?=
 =?us-ascii?Q?J9PGiEhny2Ct5pePqrayQ1cAvR/ib+HMfBzUKwA2UixKFZapAp+SOgSuQksl?=
 =?us-ascii?Q?F6W1xNjdxx/GbGeVWK+KsxochSQOuXrGJv9+saHKkzYbjJNajKd1hqqdErcF?=
 =?us-ascii?Q?BU1dkBKMOVAWFgIEsZo5MmdI/cxxvuEPpzfBfXp8qToGmmI7oWtZcGw9EfcK?=
 =?us-ascii?Q?or/XuuPAxqBeATUvO5CR2/jZY5vv5ZXevWm43y5zNrjofUb9i3dz06ZO+Q0z?=
 =?us-ascii?Q?y3TFNApIWqVz1b6ZtQiVUF29n6/Ug6Df8NmyrA1ye3dAD5Tgd/xgi7PY9mYF?=
 =?us-ascii?Q?1C1L3Qs5x9HxOKLYOxpklKnb8OezD2NNJUAxqDDizGdpT6AcLHXy2rYoj50g?=
 =?us-ascii?Q?HZhfVGKRTzDG+uTXgfjiysPNBLXEr6m/H/oPy/nfMgY8PF/bE2ye3329N7f9?=
 =?us-ascii?Q?1qfBMQaC7p5UVJr7/QDGynaMw5gza6VDeDzA4BlMayoIX1W9bOZSMMveQFoz?=
 =?us-ascii?Q?Syw2aWobyaCFttGzs/VSx1l73B0HR+cYdbWxm0F55LHqmH/Ef/UhG9lXJiY+?=
 =?us-ascii?Q?TKT5wwfA2djjRq+Y+BDwV9Cc58im5loiGOVFUmw8Ercoo3ggIz4TVzi9Vv3N?=
 =?us-ascii?Q?oNcUjEUWDVcr8ApQgWFdwKGGm3tZ/L34G7hUVedaqK8bTRdUh3UAlTLT6IKx?=
 =?us-ascii?Q?whQXiFPP888HZ2Dj+I7Z8HEZCNTPkiSAiC/xvo1QCeu+nUkczXN8oZ0w+ZIy?=
 =?us-ascii?Q?ZuJMvH4y8YkQ0ma3I9FAwH3ivw4L3sy8sdniqIUEQfxXmLpmbAy1S7w26/OD?=
 =?us-ascii?Q?lQYTmPfiRF9VNiulcxNAqfVYEaLKo4HOrqCfnneHazz/x6G/TxG0+xC931/i?=
 =?us-ascii?Q?27E3gre5H1UqFMpWJj7T4dWWy5yj2gnMhVwxLy8YVO37xF5GFW/Pgcz6MP30?=
 =?us-ascii?Q?SIQ0Nxlx1Oee5d+p9RdlStarpWNnHElr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR06MB5620.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(921020)(38350700014)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?A2g6wj+BU7wSFceAb6pvWY0ilT+5NL4J39kDGvxYu87Eo/sKvBid2QneAtGC?=
 =?us-ascii?Q?I/XdTdUuG73J+UgD0+SLKBDQapu3OmqCty0oT3fZFDPYK/roRJ3qHYjGgPof?=
 =?us-ascii?Q?K8qIOFtxCdgraBWU9pLJdimJhcURfW6DUbQTWvlbNBu+4ytXmbesU5Bc0fTa?=
 =?us-ascii?Q?EolYVzwYAZmpmBMYNIrCP932sVKCz5blAF5s9rerUB22FxW5fK7T9FQxOR+9?=
 =?us-ascii?Q?hrQwboEkYHtrIm4p7PCEPMIZk9JIJZQ26UTxDbnI/oVxeyglgscreALl+4LV?=
 =?us-ascii?Q?JTzPWRFy9hvdSqdAfo7RFyQse4pRxdmiCoaVyQ/qN4qxRMEUf0rHTi5YeyHH?=
 =?us-ascii?Q?JrrSqE9vOZGE4ZXhPSet6PNvNpBlWgpr8Z/tGUC4zugQG9EZxwRXr50mH3f4?=
 =?us-ascii?Q?T3ruJTB2pSHq85ATQ7uC8kmktndL4+aoMlhIBN0y4gwxVNsNspgMCdvWHvK1?=
 =?us-ascii?Q?g5X3U7qALj1M7Rmrd2g243UEMFAKMdmsjQ7dGgATQQZtTgiATqmlfNlqr1ON?=
 =?us-ascii?Q?/EiZA8EREEzPZl0UNH1fZmhWqMpZc6BCe+VMWOK6nbOKvsoqgnjsJ0NBnEUx?=
 =?us-ascii?Q?y7dNaTvZYeGDwj0lp/OWjctamr+2uCU8m954Pay4z+RtrVRCTEYp3mnDTjDg?=
 =?us-ascii?Q?MMbrwTYH/LvISoEri2bgh/5Anz0A/3DxZ4sbEI7/OTEM/coBm5CaX/MO/DIa?=
 =?us-ascii?Q?Hus6n9XddKQxcPwCsHV6Qn2gKlb7EFikBjMdD8dnFDCtEhKpE0im2MY09CF8?=
 =?us-ascii?Q?Bm+zywr1EDSxbWyzSVqZmRgx7lQdaEwJCZ0wKfZlJ5C66hbs/VqosIUy0Ss9?=
 =?us-ascii?Q?/4B39t9nAGYf/FvxKM+TeLboudm6vOvgKTFU++MasjFUeq0pTzZZrsfIUwN1?=
 =?us-ascii?Q?VsgK/aazJmRGctEAdqzbNeRqHfpiqYyoUE8G/DifHfuM3lxoDDuy3Bh1giF3?=
 =?us-ascii?Q?cSstJp4JabeXk72dSVZlMUZQ2q0JBl6aJJTcRAqQ2Hf6V+2HgIjaWcXpezeb?=
 =?us-ascii?Q?DVGLewIhzcifS3bUMmEMCWhTXBXkRDhjMmPs6v2/lTi48lR0rB9E6iNBoQf/?=
 =?us-ascii?Q?cvhFSy8yK8kGrdG+qP4ip7Ke4HkFBkyVgdWW9LmuOJdfwkZYr00wFs3yAGjv?=
 =?us-ascii?Q?Hnvo1gBtWjw6lm4TyPEktA8eMR7OyhU83QeqI9QpnF8PzBiqWZ73P5pt2YYO?=
 =?us-ascii?Q?kxPi9iBTBga2dsGPXHhPYa2rXHdzyCnu6COfRCKCfdE+K8pRlJmeaJhZslrq?=
 =?us-ascii?Q?wQJzSSE1KFsp/gYCHsUfoiWXl2Zq8gJF+GlfjKTBfMpHw6qw9zUmdx1yLtCc?=
 =?us-ascii?Q?/DADFD2r0A3QyXDPmyJfMKcPP2oL6x9eXNJHz0rxlsQwhDdBdj20y5goio9W?=
 =?us-ascii?Q?teMMhkPAFhZkOwk9i5seAA/jza1dpPXrvaAunnbYVayY/x/xwe/wzMcgDa1z?=
 =?us-ascii?Q?eA9O9/l1v3FdVvS17D6rHLyPbIWE2O5Lu+b2YLrVTpNJYOZxnJmk0Xi2b6GL?=
 =?us-ascii?Q?xyKtp/ltUfNk4kOVAsVWS4jWbjw+LpuYifMq4PwERdp6VLQXVAA52samcfOq?=
 =?us-ascii?Q?P+G6F2IyndkY9imbn04M3psFtmU241Ew7su+7HFj?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d1047ed-bdb1-4904-140d-08dcc2600431
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5620.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 04:08:02.4950
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xv7AtCRpPsh4myX9Zud3BZA3kzxA6aHfQLesc5TP8Ah08+ItvO/9z+8VoegBJCcjhNqqv1eIDj4cJaaEwmQ+DQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB7134
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240822_050819_446241_0F33FD9B 
X-CRM114-Status: GOOD (  11.40  )
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

The devm_clk_get_enabled() helpers:
    - call devm_clk_get()
    - call clk_prepare_enable() and register what is needed in order to
     call clk_disable_unprepare() when needed, as a managed resource.

This simplifies the code and avoids calls to clk_disable_unprepare().

---
v0 -> v1
Incorrect usage of clk_prepare_enable() should be 
corrected to devm_clk_get_enabled().

Signed-off-by: Lei Liu <liulei.rjpt@vivo.com>
---
 drivers/usb/gadget/udc/pxa27x_udc.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/usb/gadget/udc/pxa27x_udc.c b/drivers/usb/gadget/udc/pxa27x_udc.c
index 1a6317e4b2a3..6e99e75f1acb 100644
--- a/drivers/usb/gadget/udc/pxa27x_udc.c
+++ b/drivers/usb/gadget/udc/pxa27x_udc.c
@@ -2398,14 +2398,10 @@ static int pxa_udc_probe(struct platform_device *pdev)
 	if (udc->gpiod)
 		gpiod_direction_output(udc->gpiod, 0);
 
-	udc->clk = devm_clk_get(&pdev->dev, NULL);
+	udc->clk = devm_clk_get_enabled(&pdev->dev, NULL);
 	if (IS_ERR(udc->clk))
 		return PTR_ERR(udc->clk);
 
-	retval = clk_prepare(udc->clk);
-	if (retval)
-		return retval;
-
 	udc->vbus_sensed = 0;
 
 	the_controller = udc;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
