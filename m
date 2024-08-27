Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FAE9C54734
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Aug 2024 11:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/IefWVC/LjjYyOoK7BCV40EiIbyVS0FGbBr6pazDWCk=; b=VE8ksU6kTcQJfc
	DqoR2ntuA88ZQI3oB1j0Jzvh/IgqBKVgbgM4O1FpAkfVTQGmqLRaVqEABQzbZcsvEaoKCIjXWkTg5
	Bl6s660UFPbyJ98bJwDHY7wRNcUDUm5GQN23GvILWuc+64EFOwn0VOTTLV0dEyNNFz6Robxbk7GKO
	2sUg5myHoeqKF+62Ku14j5eyMn8s8WhCt2GzDMinuJWf/G4ustFXB5T8lw8VN4/x+83qm3nR1M6y1
	xvmV2WV3vyn/QleguB2zdlsQIF75zzyQmrWuPiwfc6ycxZO/mZ5yG8M+VxMoBEgme8hTIVn9Hb3zq
	wMMyaxuyW2CwIv8NNdlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siuUV-0000000B23C-0LTj;
	Tue, 27 Aug 2024 11:36:03 +0000
Received: from mail-bn8nam11olkn20829.outbound.protection.outlook.com ([2a01:111:f403:2c14::829] helo=NAM11-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siuUS-0000000B228-1ERQ
	for linux-riscv@lists.infradead.org;
	Tue, 27 Aug 2024 11:36:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XpyoVkY2/Qcgry2QLHoadZrDBzQ9uFg94i7mxY4pmB8oqsTBvwZSdsINYp0wcCeLMvRRE+uEtOjBd+e2btQKfFByb43PALEJnPCrtzjnopXnioiveOCf8XXo3fXUNtEhi8BaTwgNu0Fm+QQRoaOphQEJi/qiBWup/FKHjqSCqz+7BA/vOcOi2zgTDGCQaU2OJwJflFJeNlg5WRo+LGcfEUM0TLIc+JgdwkIzsJwH36BWiPrUjon0z2twuc6k1aSc+92oFOsmUHUv5bBmz0oogHZVRfkQVOGnl9G03ZJsa9A9d1xZuZZz5ahMcEEWWmyHakANyToH+rvx4u887c2f2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FL9ALtdsHqGaO1a09Y1TAsJGYWHUl7rROAIise8KV/I=;
 b=Ye6d/gzk8j2z+HG+Wh63zsyBpV3slO/QXmHriiW1BM0G6isTq6Vk3MATppmA8PfXdenc82UyJbO+CWUauDuQJy9+TvOm7ZRAMnJzHgIOPAfNe3fhFi4p/jmiGqYIFqhPkbehZh5fiQpMF3YFuA167ay0cywcRa5e/nes1A+j/OTT+SHJEd7+YZGXFx1LMKFtUgxdrx05GgIAuwZOd0AzWnwExuTBSt2+IBxoz5a+qDzmJChEsasO1exhPV3ug4RttqjIsXz2X8noBQMPnkC0skr5U3MP2TwoQKcZPZRum9y1pr+vEk/M1e5u3xmkQZNVPnMLbhrrkA7+aRKOQbqNhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FL9ALtdsHqGaO1a09Y1TAsJGYWHUl7rROAIise8KV/I=;
 b=sf/CuY+SbNd2kAiba3spPmTj19Sezo56OamQP0mz+f6ZaA8UKRqdWByihjEY4wL9B1JMKic4jYCGylZs6m8x0U/VoB2vOYTpR1leh2BGaqC9iOqoVJQfRNlRJ/30Ldf8iVV04cFL917gFxRCVgy9xGRP0hx/k/VOtE+h+bxD9Yeetn+P3lUcix6PxxnAQKuC+HXhS1u1WNjXxYj/Rjwhs/PoMCSI2IV6lowu7tJH06gsuQLvzdgyqZ8/rtOTV59AVHsacqxtW/lgeRgAZDC6gtSwOIX1p3eJDqz4b6dXDAhFoYTQMwfvChfeN0sMdITZ84o0c4KrQ6kN1vtJ7PytYw==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by CH3PR20MB7037.namprd20.prod.outlook.com (2603:10b6:610:1b8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Tue, 27 Aug
 2024 11:35:50 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%4]) with mapi id 15.20.7897.021; Tue, 27 Aug 2024
 11:35:44 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>,
	Yangyu Chen <cyy@cyyself.name>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Hal Feng <hal.feng@starfivetech.com>,
	Inochi Amaoto <inochiama@outlook.com>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: (subset) [PATCH v11 0/4] riscv: sophgo: Add SG2042 external hardware monitor support
Date: Tue, 27 Aug 2024 19:34:45 +0800
Message-ID: <IA1PR20MB4953A509BE6FB7E05590E3FBBB942@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <IA1PR20MB4953DF0AE7210A6D74162952BB822@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB4953DF0AE7210A6D74162952BB822@IA1PR20MB4953.namprd20.prod.outlook.com>
X-TMN: [U7DgGyrQalc7TTsTG8pMr5l5QTyi56JY88DcGqbfdh8=]
X-ClientProxiedBy: TYCP286CA0109.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::6) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <172475845236.1309337.9432886632005176363.b4-ty@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|CH3PR20MB7037:EE_
X-MS-Office365-Filtering-Correlation-Id: b4aa3f51-e042-4799-2b06-08dcc68c62e0
X-Microsoft-Antispam: BCL:0;ARA:14566002|461199028|6090799003|15080799006|8060799006|5072599009|19110799003|1602099012|440099028|3412199025|4302099013|1710799026;
X-Microsoft-Antispam-Message-Info: THuzMoXZXz6t+Np69sKKuHvHXO4mpIOhwizpEfygBVJKOD2QMlAF3ZX6f/nyp7PGNHuALyktKrHmy/w+tQp+OLyDMdu0o1eWkYtFFf2ErQJ+2m2suhhIKQa5Q8cSMjiTzqL8ZwvTxcedmuiCKkVvFxEOvQefw5p4yvortS2xK9233PDuiotjxPG5jf32lsvDHtTsihK1qQsrAgDUNfcpD9xW1ONdwnSxwSbKv5rwAhiqwLLWz1vMHhlceHi0dKVpZ3jkvosINOzr4qLoMdGzSY2thoxLK17x+glfevWUXQerV3oh5U1J+5uL8HbpIXELGiiKgI1wLqT3Ece265gGEX48ZJ0BRoy/iFvq5F+kgcArxm5VHsDEepSjIFU8yhWPjGCHPjvVaghzTJ4hoIJ0sIquVGX/HKnczOaKlkJoUqLplNFkHV06sI8gMv0AAYQrbklBqHdV1OODSNSX+3XMQSEYNAfuj8Xl2nIRESoyZtKtXvh8IWQms38VEbIMQ0/ihm4NSS4FiK6Q5FYof1S8Dp31pZ9vHX4HE/XdBf0U+LC2bRIra9RlbcTwuAINOaKpZFCUOgLI7c3I0nvEmH4otyYO8kCce3x+JpvvgCpSInWi1flaUUIZZvMPmxa+j+elQBaubyJPh2O3JtjmuQUVWyPE0NoDJhfsmYb3QPMEEbaMZQxQvS6ZDSIGhB13No8tYMf13YiGbr2UN1Y66nxCrY5tKnvortTqZoGIRwfnpt5JQBJ6iUeGciIwjMfFhNP3HtlOp0/64P2yzNkdP5PLuqQbyqxQGnAN7hvl8Wm5c24yxe0WwzrBwLRmihHseHDY+20EgUDcLyQexcSdxzfL9O6y6fhpKWz3zI6LyLnGVWhMQHIIvLeyMOxwIbiuwLtu
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0FPU2ZzWklFKzE3Uk9HQzhiZFd6eXZORTV4d3o2WFFIUlZHM3lqbmZzM1c3?=
 =?utf-8?B?RTFOQW9pcVZIVzhYL1RwTXhVaHlIVDJ1YzllV1RaMDVsWEMySCtRNGpXTlVi?=
 =?utf-8?B?cXY0TjR4RDJJZ01rdkRjVTV2LzBYbDUzNVYrSlFtSmRnUE03YktIaGt5U3Zk?=
 =?utf-8?B?bUhUdG95NzluZzY2WUZLZ0c0TjdoTCtYOEdmNUthWmVPVEdJYUIrR2kvelBF?=
 =?utf-8?B?NSt0U0hSS2pDT0Z5bDNuczd3TFA1MzZjY29rUkRwTldGT2g5OHc5MkpiWTJS?=
 =?utf-8?B?UVJKSFhoMDRzM2F6VzhrTGxMOC9wMWtocThIUVdUNVRNMFJFTlZ6aHFoWXVN?=
 =?utf-8?B?ekw2WDl3WVJjK04zaWdtZEJtenVQa1JCZ1h6aFVxSTRBSllqcUFTU1RHMERw?=
 =?utf-8?B?QkpRaTBPeHplK0paYy95aWFEYk9Kck1lQWpmUTFPSXZFTm9ha0p3TGdLVGY5?=
 =?utf-8?B?dXR0WkhGVDJGSXo1cnc0RWJPcytmTlUwQXhmY1MrU3BaQjJvZjFwT1REL29r?=
 =?utf-8?B?elp3Wm1IZXN1RnZ6N3VuSmtTWmx5ODFMRlFaOHFoUE5iZUdSeDVYT0pTRTFZ?=
 =?utf-8?B?QWUvcGpHU0VGUXFqd1dXN01MeTdBaCtvdmVYWlVvWGhTNERmWEw1dzhHK1BC?=
 =?utf-8?B?eGViOVFpbTEvWGZFY1NDMjhuU0NXbStrZ1dNQXN6UTQ1N0Q3cjJiOS9MYUdr?=
 =?utf-8?B?Mk5GbkY5ZWlmaFRwVUF6ZGFaRGtsTUpUZ0JKZHRkY3I4RmdtaHljb0x3amlX?=
 =?utf-8?B?c0YyU0M2YXlGMHBidzhTeG1HN2UrKyttd2Q5ZzkxMG5yb3FCQVdHWGJ6c2d4?=
 =?utf-8?B?VWNSQTdHek1jTTc4WXI3a0RlQ1grb01HRVpJc3JvMHpqcVY5Y1RKcUNPQ2ZZ?=
 =?utf-8?B?Zk54akVRY1lRTEpEWVYzZDd4Q0MxNUpXend4Q0FxNy9IVnFOUmhXN2FFVjMw?=
 =?utf-8?B?QjVTbzY2Z2NFT1Bzd2hDYlNFK29OandscnRzVitUYVhWd1B1Tm9TempOcDZF?=
 =?utf-8?B?cU96d2FHSy9kQ043Zm42RThsUTVpZUx4Q2RHRFZ5amE1MnlvMnI4WlI0blV4?=
 =?utf-8?B?aitGWmNjcnV3TG5tQThKV1Jld09pd01TbUt2anpueWFHNFV4SnRyblJHMito?=
 =?utf-8?B?dyt0dFhpTEd2RllCSmkvSEkrVkJYRXlKbkUrZlV4bXAxblBIN1BVeFVRa3Bn?=
 =?utf-8?B?OTNBVnZONEpHTjIwcEUxNXkwL2ZETXc3ZWQxUTlyQnZLdWN4dlp6N1ZPY0Z6?=
 =?utf-8?B?ckFCMjRZYzdJQ21LVEhqalhleWlTZm1zeURJSUMrN2NjaXIzYmdTMGJDY1FG?=
 =?utf-8?B?K3RxYXBTZ3J0YmpITVYraE54a0hIdWdQU2pKcXZaSUtFVk04cSt0d2tscm9w?=
 =?utf-8?B?YnVMRGlYKzhRcGF6TkQ2TXJMZ0wwNDBwUEoxYWE0TERUeEVucCsrQ1paV255?=
 =?utf-8?B?ODBIRXY1RVVNTWN3U0lJbkp5MUdSZWNYMDJNRkhXNk8zck1pL284MWQrY1FI?=
 =?utf-8?B?Rm05UGtUMWt4a0RDOUJGQW5hNVMwNkhtMFc1eVNsYTRSYndIbDFaSXJ4ZnJP?=
 =?utf-8?B?QXhjVG9sWU1VK0M0MnJweW1KQ0VkT2NKK2d2NzByVFhzd0JDRm5zdk1lbmlo?=
 =?utf-8?B?Zm5tejBaQ3NHTlIxMkFvdUdvbnlqV0E1dHZzUTd5OEJYSnpTd1F4Tm1UczhH?=
 =?utf-8?Q?rm2sCZT6fXqNek4MwlNH?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4aa3f51-e042-4799-2b06-08dcc68c62e0
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2024 11:35:43.9152
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR20MB7037
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240827_043600_344044_D485519A 
X-CRM114-Status: UNSURE (   9.49  )
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

On Sat, 17 Aug 2024 10:21:59 +0800, Inochi Amaoto wrote:
> Add support for the onboard hardware monitor for SG2042.
> Can be tested with OpenSBI v1.5.
> 
> This patch is based on sophgo/for-next:
> https://github.com/sophgo/linux/tree/sg2000/for-next
> 
> Changed from v10:
> 1. fix the hwmon entry permission.
> 2. remention the extra entry postion in the document.
> 
> [...]

Applied to sg2042/for-next, thanks!

[3/4] riscv: dts: sophgo: Add mcu device for Milk-V Pioneer
      https://github.com/sophgo/linux/commit/cec3f1940b60b057142bd11f7bd421e13d198f75

Thanks,
Inochi


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
