Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88F81C369DC
	for <linux-riscv@archiver.kernel.org>; Wed,  7 May 2025 03:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:From:Cc:To:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aSdPOvB9oJHHGjzFtNfsilZoLkQkBWwq4o8yeei+7+8=; b=X3zatAxOXFb9h8S9/aLqYGJAIX
	P6xINyR0nwbQ4IiXi05e84q3wfu8gm4BOWZfqcTmHzl3ct2rk9S2TGbA7f0mvr6GAW1XWQKaKSpp0
	MpR8wYoHN5x6Q6Sus04QF5GZgOjLDPOq6yQ3bO5WVkUKaS4PsZNLvEg14E/IBgv9k/novbB9/gYxj
	PGpWlyFAOVpFBINgT0cWd2DeswD9PNPvaFOACFpTLutEJ4zJ09vli/4OL3AaSncZZGptuqZa29E1t
	jM+EEz3yRqQ4zvGJjpv/E6xzPgZ3n2xJIblDEoQW7ZTSfnNAyl6unIUsXYYDBbxh6NpQAbSTTOegr
	dzltly9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCVkG-0000000E7l9-1zhe;
	Wed, 07 May 2025 03:46:56 +0000
Received: from mail-southindiaazolkn190110001.outbound.protection.outlook.com ([2a01:111:f403:d408::1] helo=MA0PR01CU012.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCToI-0000000Drmk-4B61
	for linux-riscv@lists.infradead.org;
	Wed, 07 May 2025 01:43:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WJcBZwPHeMayQNAaO4eqLHIulXbIsYCdgK4nkyzSog9ICuW6rwpb/2GW1pgHnv3wKBALR0SnaXMv6QkJBu2OPjMp9UOJlDRg6NKEskJp7fZkkterEX3gVplXdwhaXJRZ3sj/4jvOwaz94wCgQ5lNqdi5oEC1cQk/neOFH3Vk1Kc25SVX7W9LEzoI954jwCEbsssDy4Js78dASPUHFJ8xl6og7eOLsX/wKFvwV68dgdvNbkiNImCbr2fV5QeSi6rJj6F9DU6Y13o2SrskgolLsly+AnkpD3zq9SOo96oaM5jdm520edPT7EIOv2+S5TMd82SV6c9JEuelBeZCB8l0RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b/iasRjX1Ye1z0wDT/jcpNk3qiBjlfh5ysr5HDdnpXg=;
 b=ZY2/Gh1IQVHTmznMEV5l7hF7QxvxLeM/JUYL5PT0VOSDf86uIiMcyhvj0VzalTOSJY/M7ByYKx1Q5TKUdKrTktnzEt1V7Y6cj9k0ofnptf96yPzYPtYsYmBnBHo9VM3fYzY7rGKNZKMIrHZdMG2iZU2t+j0k3RcA8X6HxJCKJ6LjsvcdocLAH5QwFE+4TLeRiQdC45J4sOUuP0ThnlO1YTiSDbdHrB2t5iPEsGvHZVGmd25bcEbDJsDqiwfTW0YfzTgt9EqeQiNxj5SAaEdZsaLsW+eypgBRXeE90QSAtRMGJw4qS3xPOfaTjEbeI/pfGie3m/y2ti/yAN3Hmlb/3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b/iasRjX1Ye1z0wDT/jcpNk3qiBjlfh5ysr5HDdnpXg=;
 b=E7Cy1/CxoBulmH+pQPmkqntEBLoWRvDcKYLcsH8oV4tO3ebJxT//W22bqG/wVE4+jnuMf/5Ooi8yKXYnHF0Y7CFac3TzZtgNfyERmEsW0/wUP99pKfY2j1RS054YJ7s8AdknPBjJc46bft0cx09UmO0DEhImq2OsOwksNtGSRdgpDqSFimZ0xZ5M6NTk34hOQVoDNC+iF8RnUaN3N/eTmp7p1GiFdBV1stNXvHzaMzevPrdW7blWFYDK6ytgfgim4mcVouPQv1e8k+QBtmxukPlTtWVqG1Rnh4iOlI7eLizpiyUCDIItH6Qdw0i0Hf23NgasHlxQ9gmFU1z2FFIuJA==
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:100::6)
 by PN3P287MB0322.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:d4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.20; Wed, 7 May
 2025 01:42:49 +0000
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4]) by MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4%5]) with mapi id 15.20.8722.018; Wed, 7 May 2025
 01:42:49 +0000
Message-ID: <MA0P287MB226259FA30EF915465BE2759FE88A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Date: Wed, 7 May 2025 09:42:46 +0800
User-Agent: Mozilla Thunderbird
To: Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc: linux-riscv <linux-riscv@lists.infradead.org>, sophgo@lists.linux.dev,
 Inochi Amaoto <inochiama@gmail.com>, Chen Wang <unicorn_wang@outlook.com>
From: Chen Wang <unicorn_wang@outlook.com>
Subject: [GIT PULL] RISC-V Sophgo clock drivers for v6.16
X-ClientProxiedBy: TY4PR01CA0008.jpnprd01.prod.outlook.com
 (2603:1096:405:26e::9) To MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:100::6)
X-Microsoft-Original-Message-ID: <e920648e-02d1-4350-afb4-1a4d3bb1ff98@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2262:EE_|PN3P287MB0322:EE_
X-MS-Office365-Filtering-Correlation-Id: a20784e5-76d9-406a-dafd-08dd8d08797d
X-Microsoft-Antispam: BCL:0;ARA:14566002|5072599009|5062599005|6090799003|15080799009|19110799006|8060799009|7092599006|461199028|3412199025|4302099013|440099028|10035399007|34005399003|1602099012|1710799026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YlN2Mjg0MVp5Q05zaU0ybXVLSWpaTEZSeVBHVFdEWFlZdTYzMWd5OGtWUzRP?=
 =?utf-8?B?d3YxNUZ6c2RwalhzTE1GeEY1Z1V6Z2xZcTJQbmtwRjJBVVRUN2hYYUkrTHp5?=
 =?utf-8?B?K2paSkJFalBJYlRHMG5NVkc1VmhJVS9vWWo2WWpiNDUwRGhsaUk5Z29FbHpl?=
 =?utf-8?B?MDI5V3ptTDZtOFloenlMM2F1eFpoUm93M2tXdHdTamNlQXorYmpaenVmOGRD?=
 =?utf-8?B?SGxJRjBQTnlUeGVYUWo3S2NUb1dmK2JzYkpwWUh2WFlBQnJyV2hueFM1a1Nr?=
 =?utf-8?B?WUxaUHNNaC90U1BYNjE3b0NpMXlvem5yM1NvMGN6Q29yN3dqL2lNT3NrNVdN?=
 =?utf-8?B?STlDaVA0cjE1MlYxUVJSQWdkYXNWbjZoVXB0dVpnWWhzVGVsL0VkVWY0Zmha?=
 =?utf-8?B?WlR4RDJCQmhrVno2SkdsZEQvYmxkWjNFb3VWUE10UEVYQysveWNZNVE1cThM?=
 =?utf-8?B?WUJNWDV2VkNFcmFrMXhEY1JqUnNUdS9iN3VXempQRjZ2anNGZ0EweWhuT3hy?=
 =?utf-8?B?OURtT2ZDeEROS1ZGdXlieXdSRVU4eTJiS0s0bGVZVElhcGpwT3l1S1IzOFN6?=
 =?utf-8?B?a3N4bWM5NDQ5NlFjTjAybzBYeTdzVDFWdTd4WlVvRllrY2pFc1FwcC9ZeUpB?=
 =?utf-8?B?aG1rOW1aYzcxQVczUmZocDBhY3FDTFFSaWpLNzZKRmhxVGMxYmlDOXNFMjlK?=
 =?utf-8?B?dlpXS3ZxNVFaNUZsYWdUbnVGNS9XdU1aMy81UUtyeFRzemdZSDJmdFNyWm1j?=
 =?utf-8?B?VDE2Mkd3VFd5d3ZvQVp5MjVJeHVsWXFwNTBBNDN4b21yOThURmhQV3B5YkNp?=
 =?utf-8?B?Q2VQNVNYU3puZjQza3lyaU1qVkxJZDdFZGMvTXJ2M2NDWG1GTSs4eFlzdmd3?=
 =?utf-8?B?SEhEbjBxSFFzMm9vNmMrSm5uWnFJTWcrMjA3Q3RGSjU0ZEN4Rk1DTklTOVVL?=
 =?utf-8?B?a0pCOWl6WGFHeWJZVXFPdlR4ZDhwcFVKMXMyNzBKM2syMlB0MDgvZG54Yjk3?=
 =?utf-8?B?RVZ6U1NrSTdsTTBkMDJ6MitTWkZxNHAxaFRPVGxia283SXJSV2lLRW5vTkZl?=
 =?utf-8?B?R2g1eUtGV0lFU1NidVI5RHhtT2FJVStjd1pGQ0RqWDIzamdoWWtWMTY0TXNn?=
 =?utf-8?B?WjBkNmt0Wi9mak9YZ3I1VjlVNW9GbUYyZFRySjhPZFNadjNsUlJ1MVI0Z2xy?=
 =?utf-8?B?dHZQb3F2djJLUGZUaU42Q3Y3d2NxUGVCVE51MG4xMFBRUGlFQzVDQlN3Vita?=
 =?utf-8?B?NlBXN0V1R2JvakRDb0ZnaDJYQS9KMVJ1M1BVYTQ4dFQzSGI1OFdYTkNCUXc5?=
 =?utf-8?B?UXpMdGEybEpBWDJKNFJvTXdoN0tEOVJiYkU3RS9odUxMbmFDZ05aQ2hsTDl6?=
 =?utf-8?B?OEpQcWxvNGxUaUw1SW9RT3FlZDVheU52MTh3SS9rbEVIZmw3a0xNSlRMWUxj?=
 =?utf-8?B?VFZXNGFBd0pHREZyUnVDQmNMNlp3WGlqa0lXbkUyUlZCRUd4NjU5cEQvTC85?=
 =?utf-8?B?bFg5ZFNJTTVyTTk0Yjd0dlRzZWx2WUFLSkxKbThmQTBnQ1VuSUloelB1VWd6?=
 =?utf-8?B?QnhVelNWUGhUVXRqU2xybUtISlNmK05vMG1CZDZOMEtWQWNDZmF5TEJQL0pU?=
 =?utf-8?B?QmQydWdjWTJyK01TaFN0SHdiYTh0UVBTK1VEeStDZWU2bXZkUjJFZlMrUGg0?=
 =?utf-8?B?VGQ3c0ZBT2hLQWxQQUZpOFY0Ymg5dTNLYVYySnV1RGpYSnczSCtHMXE5b3Nv?=
 =?utf-8?B?QW4rRzJzVEEzbElkcXJVL2RONzY4a216eVpBcFFhVHhFaDhtVlhyVUplMWtl?=
 =?utf-8?Q?DxWt7u4fwDath4FswWrrnqef7gRBM0hyPO7T4=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dlMvdmxUQk5uaklpMlBmbXJDY0pYVHRPeXRRa0FydVhwZzFvdXZSSkpRczNF?=
 =?utf-8?B?WnBDU0lQYVNVMW91b2RvVUYzN0pYT0FWTzdOQnJ6NjJoUCswbzBNWUkxOU9J?=
 =?utf-8?B?WWpDT0RIa1hFbzh2cERsY21jbzZGT0dJU21OMEZIc2ZtOGhwcUlzSysrZEJJ?=
 =?utf-8?B?TVUvcm9qMjhiRTZoSytITmtmTmNOY21HNnQweTNWVXNJTisySkFqcmFjSHpG?=
 =?utf-8?B?QkJXOFd6ZzVKM05RaEtJM2pDSlI2MGJkc3h3Z1NVaEJOQUI4L05uSEUzNzlk?=
 =?utf-8?B?L2pRSnB3clJRRm1USEhLZm9Rc3h3NXNYVkhBbVc0ZDRKYlU3UmIvU0svS2l5?=
 =?utf-8?B?VUZmV1hKei85NVk1R2tiUzJDbW9vaEtuaW5xeFErS01sVVhxMUM3WmQ0RzUv?=
 =?utf-8?B?YWdqUCtSK3pSWG13OWNoMTBTd25LNENhY2xBdnR2Y1FCdDQ2MlhONFdYN1gz?=
 =?utf-8?B?cmczRkhhczhieHo2cWx5WGpES1E1RStLT0lwODNVQ3RkbUVUMWp4dXBYVjRX?=
 =?utf-8?B?Q2txZndxZUozbVBWdUl4eFVzK3NLY0V4ckNiQ2RZd3kzSGsrcWh3ZVNIUWND?=
 =?utf-8?B?dG9aMDlFem00R1F0Q3JLOFl4UEU5dUFScjNBczNvb3VyTTNCK1AvbXAvbVpx?=
 =?utf-8?B?MUdBYkh3K1E4eXNyemo2Q3BJanBab3pWcHNWalhsQlY0OFZncDNiaHZ5MFJC?=
 =?utf-8?B?Nkp5VjV3bGZPdnFNNnA5TmE2STBqcU5xUEFjWmd2UGJ3Rk8xVjJyaS9TbFFs?=
 =?utf-8?B?THQwTXpsNU93Y3VTeFBGL3NneGx5UFR4V2lCMThrQTZ1U3JWS0UvclZDTXpE?=
 =?utf-8?B?WnRFTnpOTWdTK3BGNitqK1k1ZFgxV091VXdCYVBPQlZDeTBxOVlrd0RnRVN3?=
 =?utf-8?B?UTIwK3A2UVFKQ3JENE5XelhpeHZaZDVYc1BZWXA5a0dLWEtJdEREYjF4RHhj?=
 =?utf-8?B?NExMTWxKcml3Rmd1aC9kb3pXOEFyYU1JcGRvVFdJQ1NRLzkxTysyODNYLzFG?=
 =?utf-8?B?TVFBemY4MDBhVDhBd3hZeGQwblYvOEtiWG9Hc05GbHFMR2tMQjVKbE96S2tY?=
 =?utf-8?B?ZyttTElIQXVERHBJdHQ3OUFqc3NuWnJoTDVTZzMxYVpDNUdOZGVucWtOY2Va?=
 =?utf-8?B?YlJaQjdQS2I0QVNQL1BoQjR1UERHNVVOcUdWNWoycEw1QUdmOTBYaWg2dWRL?=
 =?utf-8?B?alJwQjNoUmd6RDhWMUxWMnArRGpEeWZkMDAzY21FelhSK3BQUnpmZXZIY3Ix?=
 =?utf-8?B?NEJVU0xxdyswZDRkSHZRbWZ5SUVzRVFZY0oxWmYyajF1QnpmS0s0czVnd2ky?=
 =?utf-8?B?aVloZEZxYmtIM0VlUnUrNXpidERoY2Q4NUxya0JxZFU5TjYvMm5reVFCeUZO?=
 =?utf-8?B?TU1ITy81YndVTmh4Z2RsbEhKbWM4Y0pIUFA0YmVqRHQyaDlYTTRuY0YwWTJ1?=
 =?utf-8?B?cEUyaFhtcXZjTGxiYWQ2UlJEQWJHVERXLy9aRndqRTByS0NWVmJUOW1mM2Vl?=
 =?utf-8?B?ZVFSOXZSbncwUnFqcmlSU01KUXp5K2NGb2hzOGc5ZHlNazNWT3ZCOUNrODc1?=
 =?utf-8?B?KzhHMnFmb2EzZDllZ09zN2NtSDVqWmczVnRBL0dYTTJnTDdVOWdPc2RuNjRO?=
 =?utf-8?B?bGU5eVJLWnVMNjliNGR1YWVoQk5xdzFLQjlLR05UeXpMamovZ2pmSTYyeFg3?=
 =?utf-8?B?UWphMHFSL08ycmdyVy83TmhEdUE5T1FleEZXUW1tVnFZY2djQmZDdEw1eE9K?=
 =?utf-8?Q?RbWOWdcuPVgsrALYTUW4VP7ROQi6IzpdKwogqjg?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a20784e5-76d9-406a-dafd-08dd8d08797d
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 01:42:49.7153
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB0322
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_184259_045064_B2707C5C 
X-CRM114-Status: UNSURE (   8.23  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGV5LCBTdGVwaGVuLAoKUGxlYXNlIHB1bGwgY2xvY2sgY2hhbmdlcyBmb3IgUklTQy1WL1NvcGhn
by4KCkkgc2VuZCB0aGlzIFBSIGp1c3Qgd2FudCB0byBleHBlZGl0ZSBwYXRjaGVzIGZvciB0aGVz
ZSBjbG9jayBkcml2ZXJzLiAKVGhlIHBhdGNoZXMgaGF2ZSBnb25lIHRocm91Z2ggc2V2ZXJhbCBy
b3VuZHMgb2YgcmV2aWV3LgoKQ1YxODAwIHNlcmllczogW2MtdjFdIFtjLXYyXQoKTGluazogCmh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWNsay8yMDI1MDQzMDAyMDkzMi4zMDcxOTgtMS1p
bm9jaGlhbWFAZ21haWwuY29tLyAKW2MtdjFdCgpMaW5rOiAKaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvbGludXgtY2xrLzIwMjUwNTA0MTA0NTUzLjE0NDc4MTktMS1pbm9jaGlhbWFAZ21haWwuY29t
LyAKW2MtdjJdCgpTRzIwNDQgcGFydDogW3MtdjFdLCBbcy12Ml0sIFtzLXYzXSBbcy12NF0gW3Mt
djVdCgpMaW5rOiAKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtY2xrLzIwMjQxMjA5MDgy
MTMyLjc1Mjc3NS0xLWlub2NoaWFtYUBnbWFpbC5jb20vIApbcy12MV0KCkxpbms6IApodHRwczov
L2xvcmUua2VybmVsLm9yZy9saW51eC1jbGsvMjAyNTAyMDQwODQ0MzkuMTYwMjQ0MC0xLWlub2No
aWFtYUBnbWFpbC5jb20vIApbcy12Ml0KCkxpbms6IApodHRwczovL2xvcmUua2VybmVsLm9yZy9s
aW51eC1jbGsvMjAyNTAyMjYyMzIzMjAuOTM3OTEtMS1pbm9jaGlhbWFAZ21haWwuY29tLyAKW3Mt
djNdCgpMaW5rOiAKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtY2xrLzIwMjUwNDEzMjI0
NDUwLjY3MjQ0LTEtaW5vY2hpYW1hQGdtYWlsLmNvbS8gCltzLXY0XQoKTGluazogCmh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2xpbnV4LWNsay8yMDI1MDQxODAyMDMyNS40MjEyNTctMS1pbm9jaGlh
bWFAZ21haWwuY29tLyAKW3MtdjVdCgpUaGFua3MsCgpDaGVuCgpUaGUgZm9sbG93aW5nIGNoYW5n
ZXMgc2luY2UgY29tbWl0IDBhZjJmNmJlMWI0MjgxMzg1YjYxOGNiODZhZDk0NmVkZWQwODlhYzg6
CgogwqAgTGludXggNi4xNS1yYzEgKDIwMjUtMDQtMDYgMTM6MTE6MzMgLTA3MDApCgphcmUgYXZh
aWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKCiDCoCBodHRwczovL2dpdGh1Yi5jb20v
c29waGdvL2xpbnV4LmdpdCB0YWdzL3Jpc2N2LXNvcGhnby1jbGstZm9yLXY2LjE2Cgpmb3IgeW91
IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gNDFiMDg2MTBkZDI2MmRjNGE1ZTFlZmY5OTNiMmQyMWVh
YjhiOGJhMzoKCiDCoCBjbGs6IHNvcGhnbzogQWRkIGNsb2NrIGNvbnRyb2xsZXIgc3VwcG9ydCBm
b3IgU0cyMDQ0IFNvQyAoMjAyNS0wNS0wNyAKMDg6MDA6MDkgKzA4MDApCgotLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tClJJU0Mt
ViBTb3BoZ28gY2xvY2sgZHJpdmVyIGNoYW5nZXMgZm9yIHY2LjE2CgpTb3BoZ286ClJlcGxhY2Ug
Y29tcGF0aWJsZSBmb3IgQ1YxODAwIHNlcmllcyBTb0MuCkFkZCBjbG9jayBzdXBwb3J0IGZvciBT
RzIwNDQuCgpTaWduZWQtb2ZmLWJ5OiBDaGVuIFdhbmcgPHVuaWNvcm5fd2FuZ0BvdXRsb29rLmNv
bT4KU2lnbmVkLW9mZi1ieTogSW5vY2hpIEFtYW90byA8aW5vY2hpYW1hQGdtYWlsLmNvbT4KCi0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0KSW5vY2hpIEFtYW90byAoNik6CiDCoMKgwqDCoMKgIGR0LWJpbmRpbmdzOiBjbG9jazog
c29waGdvOiBVc2UgcHJlY2lzZSBjb21wYXRpYmxlIGZvciBDVjE4MDAgCnNlcmllcyBTb0MKIMKg
wqDCoMKgwqAgY2xrOiBzb3BoZ286IEFkZCBzdXBwb3J0IGZvciBuZXdseSBhZGRlZCBwcmVjaXNl
IGNvbXBhdGlibGUKIMKgwqDCoMKgwqAgZHQtYmluZGluZ3M6IHNvYzogc29waGdvOiBBZGQgU0cy
MDQ0IHRvcCBzeXNjb24gZGV2aWNlCiDCoMKgwqDCoMKgIGR0LWJpbmRpbmdzOiBjbG9jazogc29w
aGdvOiBhZGQgY2xvY2sgY29udHJvbGxlciBmb3IgU0cyMDQ0CiDCoMKgwqDCoMKgIGNsazogc29w
aGdvOiBBZGQgUExMIGNsb2NrIGNvbnRyb2xsZXIgc3VwcG9ydCBmb3IgU0cyMDQ0IFNvQwogwqDC
oMKgwqDCoCBjbGs6IHNvcGhnbzogQWRkIGNsb2NrIGNvbnRyb2xsZXIgc3VwcG9ydCBmb3IgU0cy
MDQ0IFNvQwoKIMKgLi4uL2JpbmRpbmdzL2Nsb2NrL3NvcGhnbyxjdjE4MDAtY2xrLnlhbWzCoMKg
wqDCoMKgwqDCoMKgwqAgfMKgwqAgMTYgKy0KIMKgLi4uL2JpbmRpbmdzL2Nsb2NrL3NvcGhnbyxz
ZzIwNDQtY2xrLnlhbWzCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgOTkgKysKIMKgLi4uL3NvYy9z
b3BoZ28vc29waGdvLHNnMjA0NC10b3Atc3lzY29uLnlhbWzCoMKgwqDCoMKgwqAgfMKgwqAgNDkg
KwogwqBkcml2ZXJzL2Nsay9zb3BoZ28vS2NvbmZpZ8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAxOSArCiDCoGRyaXZlcnMvY2xrL3NvcGhnby9N
YWtlZmlsZcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKg
wqDCoCAyICsKIMKgZHJpdmVycy9jbGsvc29waGdvL2Nsay1jdjE4MDAuY8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgwqAgMiArCiDCoGRyaXZlcnMvY2xrL3NvcGhn
by9jbGstc2cyMDQ0LXBsbC5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCA2Mjgg
KysrKysrKwogwqBkcml2ZXJzL2Nsay9zb3BoZ28vY2xrLXNnMjA0NC5jwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAxODEyIAorKysrKysrKysrKysrKysrKysrKwogwqBp
bmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL3NvcGhnbyxzZzIwNDQtY2xrLmjCoMKgwqDCoMKgIHzC
oCAxNTMgKysKIMKgaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9zb3BoZ28sc2cyMDQ0LXBsbC5o
wqDCoMKgwqDCoCB8wqDCoCAyNyArCiDCoDEwIGZpbGVzIGNoYW5nZWQsIDI4MDMgaW5zZXJ0aW9u
cygrKSwgNCBkZWxldGlvbnMoLSkKIMKgY3JlYXRlIG1vZGUgMTAwNjQ0IApEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvY2xvY2svc29waGdvLHNnMjA0NC1jbGsueWFtbAogwqBjcmVh
dGUgbW9kZSAxMDA2NDQgCkRvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb2Mvc29w
aGdvL3NvcGhnbyxzZzIwNDQtdG9wLXN5c2Nvbi55YW1sCiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBk
cml2ZXJzL2Nsay9zb3BoZ28vY2xrLXNnMjA0NC1wbGwuYwogwqBjcmVhdGUgbW9kZSAxMDA2NDQg
ZHJpdmVycy9jbGsvc29waGdvL2Nsay1zZzIwNDQuYwogwqBjcmVhdGUgbW9kZSAxMDA2NDQgaW5j
bHVkZS9kdC1iaW5kaW5ncy9jbG9jay9zb3BoZ28sc2cyMDQ0LWNsay5oCiDCoGNyZWF0ZSBtb2Rl
IDEwMDY0NCBpbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL3NvcGhnbyxzZzIwNDQtcGxsLmgKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
