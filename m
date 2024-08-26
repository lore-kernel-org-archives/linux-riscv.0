Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A932AC5321E
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Aug 2024 03:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZPE7Ra6GLl/pPJHCBaAIYOOglJnS5oiRlkhqzp0XHiQ=; b=E+0R2pFbz4Ywpm
	qtsHskgav90f2Gbwtwbp4I8hUiVep3k4S/eCaWiT9QOWNnibrOfOvHKjjseDtJLLcMI+9pknuobu7
	4L1X2IfkXMo+tkl2OuvHjRKC57pKZ2aHOW/G8sbEDZhTe5/WqvXSh6Px1g45zy2pUIe4CTS4GTuYz
	Ps+G3xYZubh7VYpKzASKOOWnkMnva/aDw24JC4fx60y0l0zTKj1XJvm5r1YP0T44wEGgSTrA8jA/p
	By8A9VAKTIIl/KqlPceJN/JtmSgLt1cbjxmNgeUPlRSVo1LXjJV9WlUoGb4vHnQ4N0x7nYHxszjmL
	bQcuUKhCQVtd69ISWDpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siPz0-00000005bVj-3txK;
	Mon, 26 Aug 2024 03:01:30 +0000
Received: from mail-dm6nam10olkn2080c.outbound.protection.outlook.com ([2a01:111:f400:7e88::80c] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siPyx-00000005bVC-18Mc
	for linux-riscv@lists.infradead.org;
	Mon, 26 Aug 2024 03:01:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uwgyGKE/oKo5U/m9kduJYEWmdKtge/mzGcTPYqZwmbUZn9Bg2AdwZ7Ax1w4z6F0oX9QTzQDzPs9tMWkYR6wq1mRvKUaLpDcuezqBANuG3LZ5Zud/G9aDuTZg8tmOnrTh7bj804cTw3ZpZoONSX9d9H3Gxl9NFmG5cSZ5zxxY5Cm520ZCPejVsodjNGs1m9kaxdzTBQkyAuEVxOZQ1JA6NIAkXMzOGWIxovwF0aKEiwej7teB3eKP07XR6QfV8j+w54ZJIkXsqye57vktnwduN68P/c4ZFcI/8kRrkSdhNEeSVb0Hn6zV9QDaYmy17rQUm3PeqwSRoAfwl0ZOEycBLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MKlfbg99fqcV195mhNA3h4N1b2hCP3a1MuN7339vZPA=;
 b=ZYRxYedUdFVzz30WYKLEC7l2xNSdu8fMk0xHrtLZf0iYEcw3bV2AYVQb+LEbUiDVsDXJOv21uJG0GHxweXJhMX04qwZb+h7WUOC7bTXh7sy0Q6nCKG6JaapGr1gWja2mmqDB8B+8jziBMhYTlDAFOZ+NhU0kieuMAyXWa1V1QOsdfgx8GEE1zrSYO5F0YKhvQ+ZQetqeu0CcXLBPSHj9UE+X+yrZhuJBoFPcSH+2VAAQcfPv+ZZ+MQzfUInaRgIN0SsM7dQXUvk0JFyI88NCLnkgoGU2zGDxzH/CVQLXhUze5ZcJQNjg852IPdddUY6bZ0JyTQD5E6AY9StcFhnZTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MKlfbg99fqcV195mhNA3h4N1b2hCP3a1MuN7339vZPA=;
 b=EeRvKGYSqgsP6gKLhLRR6tqtlPjAujZYvAFmL2yfB7FAnuhWt8Z6y4Lg+mIWzcDaDEit7Yszt1t+ZddmQFT2Vu3gwX2eCK1rtP8XysaphqdP491xcXI+QC23jJSzhyE+1PgIkclrUTSlEcjNiGPcVKvDuitXGaxPnu7BsUvbP3SsUfOCGQVEyEVhGBBlf2nqB+uuPF3KRQ4hfsoAaOJp18+Qq1EvTraq0BmwCx4Dv0dpgAgtakqJSCIISIkFwKe8/NAmpr1zXLRq781zhj0/AE+rXP4krpKPe/SjXQYvvqP9MpDyzNSXFTR/+LJFxZToujxvKoaMCrKT9CtF/CrX7A==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by MN0PR20MB4815.namprd20.prod.outlook.com (2603:10b6:208:3c5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22; Mon, 26 Aug
 2024 03:01:20 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%4]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 03:01:20 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: adrian.hunter@intel.com,
	aou@eecs.berkeley.edu,
	conor+dt@kernel.org,
	guoren@kernel.org,
	jszhang@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh@kernel.org,
	ulf.hansson@linaro.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	chao.wei@sophgo.com,
	haijiao.liu@sophgo.com,
	xiaoguang.xing@sophgo.com,
	tingzhu.wang@sophgo.com,
	Chen Wang <unicornxw@gmail.com>
Cc: Inochi Amaoto <inochiama@outlook.com>,
	Chen Wang <unicorn_wang@outlook.com>
Subject: Re: (subset) [PATCH v6 0/8] mmc: sdhci-of-dwcmshc: Add Sophgo SG2042 support
Date: Mon, 26 Aug 2024 10:59:55 +0800
Message-ID: <IA1PR20MB4953203989C56A5C98382192BB8B2@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1722847198.git.unicorn_wang@outlook.com>
References: <cover.1722847198.git.unicorn_wang@outlook.com>
X-TMN: [wcO1Nd59xEVUY9F1T8mJN4GjA4Usd42h9epYzcrCLqI=]
X-ClientProxiedBy: TYCP286CA0110.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::17) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <172464118436.44458.2712433242169119862.b4-ty@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|MN0PR20MB4815:EE_
X-MS-Office365-Filtering-Correlation-Id: 9999be61-d72d-45bd-021f-08dcc57b5c5c
X-Microsoft-Antispam: BCL:0;ARA:14566002|8060799006|461199028|19110799003|15080799006|5072599009|4302099013|440099028|3412199025|1602099012|1710799026;
X-Microsoft-Antispam-Message-Info: V5NXpUWIF0RTzwJJxRqdHXXh/3V0DMRro0dpxOpVCj48s0QehMlKKPHxtto9VePbMeaLxI8R/6kbYoLA6jQihz14uSsSx53ATES6hwZ1OTfDT9vnUqPsGnj4yxEZrhREsYArK2dl+vcwN16FJxwZd8s2RIS5yVkT+HR76wNyfuAiIjQAwWEmQVw3HPwMTiqwC5UC4P+OznEWr8Be9eQVmsFASMwEpceB0RgWODlvhSBzvMO4qBYI8rBq3BhY98FI9+QR04VtBvvzSvdbtTb/8rTRsTiJV4eJYx4wY9jvKZcBenqcPGZln+sVkzMQRLexEvo60KjJ110+Hu+kPl+9DaElwOdVlwSA49QqrPywzEydtHPT3SXfUJqGzgN166CPeJ887x+l5ItqP6uAkbwuKaqUsc6OsAFCLPZDeMNBk5wvNGySB96BHQ4yqUSSPul2G+SrrZWt58z+TC/2uPi/NjJ/IfvZV014vPoWvbmNQMWMGyv+1KjBuaJnEBCJkz5s+DNXACCHLhidaMCQ2IHT9wsNdoffv4vj8Q+4sf9S1nC4uejx9y0Fg9fgvMUJSnLucJUnXKITBWKxVKTyqnqtDg7e3RiyBE8yTwrCm2xMRVNW+qAAIsqZv4VqQTKwkSXSD2WuLTNclaUb9qf2I9Nm6JCJ5L7C8RDvAPf6skjfp5/0Fwh2NNSjniTSj8CMmYb1s1Xs1UDCHZuC+6Zk/QEXj9pdjjz8a6bQaYkdTHfGOWyrrHLwxWzSCYzN0PIhdwsaQFMu0hIFNKV244cK70jbCh6qszjZ1ywmokflWBqblBUJnBqFMASS2gMESzrO72ghyjzGWT92vVwVKPW8bIOSiQ==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SStvNGNKNkZXUGVzWVp3d3hQczRKeWVpRG81ZmpidGtEM3dPdHg1bWljVEVM?=
 =?utf-8?B?UnpDckhmc1VGSVFLVGpqSHphMjI4RWUva3BSdmk2SWQ2elJkZTRMWTZBVzNj?=
 =?utf-8?B?R3ZELzhocGJ1c1o5M2MwZUNEVkhNUDhZdjBrNXp4TmRhaGxWV3NrTHJIR3RT?=
 =?utf-8?B?dFlRQUlySkdRcXkrMTUxWHhFVnBPWWc3eE9NY01VcTBiZjZxdGlwUmNLVXFp?=
 =?utf-8?B?MlFlSVZTVWVEdTRtRTJrQXNwNzBBM2NWN3lMcVhGUlBNZnM0L1pxSThnTTRl?=
 =?utf-8?B?alpNb2VQU1REci80TitiNUxZUTdiNFlRY3VQNnRZSDJPRno5bFJFc3JsQmlz?=
 =?utf-8?B?cjlJaUJBcmtQbDNXSi90S3pVa0hXZU9BSUh1MkVMVm45Q2NRTnRyS09SNGl5?=
 =?utf-8?B?eGVrVUNFbWxremgvb0w5M2xQUXcwY29hRTRUZTBQUEZ6OEQycTFHT2VZLzI3?=
 =?utf-8?B?SlQySmd6YzJVdlRtM0xWbHNJdHBtZmFkZGFwc0VVcllvUVN2V2NWWm43YS9W?=
 =?utf-8?B?ZnEvK2hUUjBIQTZFUFZxaEgvcGNoZzhHKzFCSm5pOVlGRkE3YjRDWVlaUEZ4?=
 =?utf-8?B?bzFxVm1BL3dvMjEvTzM5Z1NJdEFxWTBKRjdyQjBZbGpwK3Nydk5PYnFNcmdS?=
 =?utf-8?B?KytpMEVlVnlHSzd4aWNsZTM5QkhFKyt6N0Q3L3NIT1p5RmJxWDc3MlpnaDBI?=
 =?utf-8?B?cGxQM0hYczVyajM4Qnk5bmhjeTFFdTFyU0ZSeTd4UDlKWm92MVp4WHVzQVpP?=
 =?utf-8?B?TnNyTnFXcnJJOGhxMGswQ2RoZ3RvM2FrNGRPMHlJK0t0Z25VUlI2SXZHeFZH?=
 =?utf-8?B?Z2tzeS96ME1hYUJaUmcxYjJHdjM5Nng3QkFNb2xRZ2xxeTBFdUJ0QU9SSlN6?=
 =?utf-8?B?WkF1MUMzWFIzalo1T0R5ZzlicVpLMHJJRldtRSsvR25KRUFWQUVkb1U2N0Mw?=
 =?utf-8?B?YVpaLzNCaTJwdW10T0wrTmFRY1l2MTdMOG5KV0IraEVaSVd0ckdnZ2tmTWp2?=
 =?utf-8?B?M1RFU3huNFJDNSt1VW5Xam5UMnA0NjFyMTNuMFBRKy8xcjRsTmhuNDRpMXFB?=
 =?utf-8?B?RUk3NXB6bnZDQjBjYThtTXNlZ0lVQmdzZVZNNno3RGF3QXVCMlNFOUxxbVYy?=
 =?utf-8?B?VTZsNFNXUTJsS3RPSkFvWUZDQ1VTNmY1WXdQYmZlbXFUSEZiTCsvZ3RpVWlo?=
 =?utf-8?B?MFp6KzJqbGRPWVhseGhRSHliL1l6Wkx6S0hRSEhlYm05Vk9SMnQ4MHE5c3F4?=
 =?utf-8?B?b3FKWFd3S1NPWkJkbWszVmFzTVBFenZyeGYybFplbTFkZ0p2UnFYREhqdEd1?=
 =?utf-8?B?ZkMwSkNzbUZFTjJyWSt5a3lpM2t3cnJ2K2hrLzVuYUF4OE5wOTZyMGlLU0Nr?=
 =?utf-8?B?NnJVTEk4UmpyRGZHRi9HN2RGQUpQTTN3S2thbFFkd2JCcmFsVEYyd3NZaTlC?=
 =?utf-8?B?WlhuZnE2ekZaYkd0TEFBTG5PMmhWTGdNRnB3cTJ1NGFsb250cmhoQW4xWVF3?=
 =?utf-8?B?cnZZVk83TFZLNGx3U0tYUkJqOFJMN0JyL2o4a0RkYWJLV2dMYy9qVWNuUDZM?=
 =?utf-8?B?YnduZi84WnBpYmtFY0lsUzZOS0JnYUZpR0xXUkMyVGR6S2FLM21pL1NmN0lo?=
 =?utf-8?B?VVpVa21NU0p3M2swb1ZiS2VDVUVnRVZWMWpuSGJuMS9ZRFI3eGRwa044bzRj?=
 =?utf-8?Q?9P8KQ+cI+Bjn1F+lQRRC?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9999be61-d72d-45bd-021f-08dcc57b5c5c
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 03:01:20.2627
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR20MB4815
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240825_200127_334287_81716B70 
X-CRM114-Status: UNSURE (   8.07  )
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

On Mon, 5 Aug 2024 17:15:18 +0800, Chen Wang wrote:
> From: Chen Wang <unicorn_wang@outlook.com>
> 
> This patchset is composed of two parts:
> - one is the improvement of the sdhci-of-dwcmshc framework,
> - the other is the support for sg2042 based on the improvement of the
>   framework.
> The reason for merging the two parts into one patchset is mainly to
> facilitate review, especially to facilitate viewing why we need to
> improve the framework and what benefits it will bring to us.
> 
> [...]

Applied to sg2042/for-next, thanks!

[8/8] riscv: sophgo: dts: add mmc controllers for SG2042 SoC
      https://github.com/sophgo/linux/commit/06b2359ee13a0e8267c1777838ac8b66ca667237

Thanks,
Inochi


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
