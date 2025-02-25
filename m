Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8265C021A4
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Feb 2025 00:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TPIHOjKCVhnUXf8ln8kHxYm9j3tNg7CVCRxJNeFJglE=; b=nqbzDLLW53JkAurx8SWglok9Q/
	YB0E32dQ0MNEmSJ6gA1+A+J25gg8JeHVcwRjABGhJDPbn8XHvOWh8f7UKyQKHi8nMDuoQUPvTLyg0
	pm/deVJLdtH/+eJkRoXRvQiwKiZJ1iMFeUVv4cBZcDORpqLqZ2QnLc9JPJgeeYmx+C3zGkKRuSteE
	3jbySAYBf4iihaoWNYR9KzFAIJN3FNQqHumBokCklzmp3GIG7xsEhKiVChayqbyadXPdsT23NhC8L
	MOFGZ4nRHkZn7ZWz5UwkRq4HUWhB5Mi4z0/A5MIVNCpYG94+PUmxVoTraTSXJCTR/QPjHcOt6/Wwt
	Mwox+JBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmj3i-0000000Fdl2-30yN;
	Tue, 25 Feb 2025 00:44:26 +0000
Received: from mail-centralindiaazolkn190100000.outbound.protection.outlook.com ([2a01:111:f403:d409::] helo=PNYPR01CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmj3g-0000000Fdjb-0k05
	for linux-riscv@lists.infradead.org;
	Tue, 25 Feb 2025 00:44:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x8EEn5GnqrXp6d/MmQawgEAYiO0TzyrgOmMxmVem5iUP34VAOmLKj8ld4j4LFQOujNsPgiG0/Wf8AGj4Wd0Ft9E/Fq9JjYfw+dkEGzCc3VwT/1FhMHXpmib+mlR2DyXuRpD1jBfKaWtD0lHRaq6gjbm15KyQDsuYXeWldZ8pHO/3CeBzLVc+rFNG7zLDrV/7rQM6AhdLBArcZdqr9PmeSpZFQPl7GjTJTjdlk+5Mx0JtyQBSoQgOzZXuh3v/15uV6jBypWG9KZi9LLKzvnHUOg0drtyvSCOZWX760q+mXGCtsSWdf6MuV+5q3OmY2kBahjboFezwvkpHlqGbdB4BKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rzuEI/28QrV/m3ZzYDpzeECMS/VA9nlI/FEe5XNWt2k=;
 b=EyQXJoSjJEQdAGQKKllMN+oLoY5GpgS2rf21e/Wo5hfcwn0/Q2KHYHMYTpP3Et8Wc2annDx51kYnDv5oNNNh8aCvTVZe+4FoXuhRRmqCVfnZv140YLRA7q1/HUDLLzhS7eU+2qnTCqqd2aeiPNV6JUpT4aNh9NDYsnF0FeswL76wvL2BdlOzu1U3iM3gCtfvPjIP9R+RYy028SzAyp84Ap6pae213MDMSywfppgm8oxiy8YM7CclE7Jz6oT8Xlra3JdLYvu1TBt3f5pC2X2k2MKsKk4LOA7V68bVfvfnBb4KAtz+IQ2OVSpqT9C2682Y5fE7OsYCyCWQyzyEF0O92g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rzuEI/28QrV/m3ZzYDpzeECMS/VA9nlI/FEe5XNWt2k=;
 b=t66Sjj5fkEQoMo2ZCXqj7rZ3Wk50UMjLE2JVTgwGVukyrCBcEkkHuyGt26pl+EJ7Z6/yRktqojBV6ZQ1Yl+ypRwLaWqY7AF3sDzkGR8BRwJvtPsv5Nil+40VKjJgkB3kC0tBDtaofP6jLFSDeUtOmq1lo37KKUgpSwyruvHiwKWX3ySYI5VwWxemeFtS4BJpsbwhnGsygDrdCNWU1TjwZZSEDw6qBhOtMEoWakzpApRiEy3zkBRIgeqYM3T15l288t46e/IcrDL6UDR4bQ2LoIJlE3lYgOx6OSkboHSQvXacrLYO3LYbWpjghGHVpd3N0ponNiv5R8HLtEJKCH/BEQ==
Received: from MAZPR01MB9162.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:10a::5)
 by PN3PR01MB6628.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:88::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Tue, 25 Feb
 2025 00:44:08 +0000
Received: from MAZPR01MB9162.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::207c:c76a:271:28b]) by MAZPR01MB9162.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::207c:c76a:271:28b%5]) with mapi id 15.20.8466.020; Tue, 25 Feb 2025
 00:44:08 +0000
Message-ID: <MAZPR01MB9162FA24821C3E02472CF028FEC32@MAZPR01MB9162.INDPRD01.PROD.OUTLOOK.COM>
Date: Tue, 25 Feb 2025 08:44:04 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] riscv: dts: sophgo: add Sophgo SPI NOR controller
 driver
To: Inochi Amaoto <inochiama@gmail.com>, Longbin Li <looong.bin@gmail.com>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>
References: <20250224101213.26003-1-looong.bin@gmail.com>
 <20250224101213.26003-4-looong.bin@gmail.com>
 <PN0PR01MB91662EB902D8B337A0526458FEC32@PN0PR01MB9166.INDPRD01.PROD.OUTLOOK.COM>
 <nni37727545uwmq5uizihptcyq435wopjurdjcqufsfvfq3lc3@aq4zpb2l3nw7>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <nni37727545uwmq5uizihptcyq435wopjurdjcqufsfvfq3lc3@aq4zpb2l3nw7>
X-ClientProxiedBy: TYCP286CA0122.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::8) To MAZPR01MB9162.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:10a::5)
X-Microsoft-Original-Message-ID: <d168eeb8-0075-46a0-af1a-f3dc11d7a1a3@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAZPR01MB9162:EE_|PN3PR01MB6628:EE_
X-MS-Office365-Filtering-Correlation-Id: b5615474-86fa-45d5-d732-08dd5535831e
X-Microsoft-Antispam: BCL:0;ARA:14566002|5072599009|15080799006|7092599003|461199028|8060799006|6090799003|19110799003|3412199025|440099028;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bkIwbjZBVDl4Y1pZM0cwc0pIVk5lVXJDejVHTHI2WUpicGl6NjFkOHVwK2FJ?=
 =?utf-8?B?c3o1OTRJTThvZnhkSnN2VWEwL3JETDRKcTQyY0pSQWZVbFMwU1BlQm9jd21O?=
 =?utf-8?B?NFZoZXAycVhoRXNJSjFha1krVmZHOFgzUVRsSzVpdGF5Q0NqU1MwNmFVL2JW?=
 =?utf-8?B?ZWMwUUZWdk9FS25KS2dXTE5pd0tYZi9JZmd1dmhacThpV0d5V1RUM3p4TWZR?=
 =?utf-8?B?NkRhN0hReUttdm9BeEU1VUF4bjI2N09xS2VWc09nZmZtaUtoUTZvNmU2Lzhy?=
 =?utf-8?B?TE9FdU9NcHBLa1dlL0FtakJOaW93ZzQwYkVmeWRlMWVjbW9sYjVRT3l0OCtF?=
 =?utf-8?B?SVJZZFFhN2U4NFJya25GejRGSldzdzdZdEVoOVFYdjQyZ1k4ZTFBUnlKdE1L?=
 =?utf-8?B?ZzNKODJiUGJWenF4Z2VzeUZPK1RUbnIyWm9nM1ZWeXUrdFUza0NLaU5yR0Mv?=
 =?utf-8?B?Z1BmQkp4cXVBVlNRekp6T2hqVGJrYmxVZHhjZHNDQVdzM2V2NUhZdktWUUxn?=
 =?utf-8?B?Zy93aHoyVkVsWlZqSFgvVnNCSEhYeU1mK3MwekhIbHMwSm44Njl6RUUvOWd5?=
 =?utf-8?B?NVhFTC9UTkY0R3Q4dlQ1U1lSZENObXN5RktvUHJ4QUZnWVJSVjFIUHl3bDkv?=
 =?utf-8?B?K0dnUnMyS21sT2c5b2lybHJTS3lmZEpzYUJkK3NvVHU4TDNwNGE5a09aSkZq?=
 =?utf-8?B?aU9KYldiM0psbHNYTDhKSDRYNW1JQ3l0clJ5MFVNc0hCbUNhcVkrNCsrenc0?=
 =?utf-8?B?NDNrLzNrYXJUUWxWR1RWUFF2QWNtbFRiZG1SK1l6OUtLWUxSRDdUVTBjZFMw?=
 =?utf-8?B?VCsrV09jVTJJeW5WeWpNdTJzbng4NGhtOUpWQ3RDM2xDeFowdGh6ak4yaWI5?=
 =?utf-8?B?MlYzNnpFUWpHUFM0L1JERGdPdWpxTTdyYmNUeW0zK3VXbEdneitTTWcyTjBO?=
 =?utf-8?B?Tll4c3l3U3VzRVpXQ3ZqYWNNdll4Mk0wUU1hMHdlV3FjMTZCc2VDODFnQ3hq?=
 =?utf-8?B?VXovMWIra1lIdnFORWJyUVpOSGp5OHhzbEVZdWwxNjMwVjhRNmFTL0MvTmY5?=
 =?utf-8?B?ajVWemhJWWF3SUYwUStqWEFQRDVNR0NRcnZhOWxXTEdrdFVUMk51d0djb3I0?=
 =?utf-8?B?YnAzY3REU1dXZGNzM3ZNVFZJa1ZKemttbCs0STlGcnNhWjFQY1VWMTRzRnlN?=
 =?utf-8?B?SXY2OFhWTWNxbEk5YzRNNnBneE9MTmRYMXRaUGduWEUwcXNVMDdZc0pmc3VW?=
 =?utf-8?B?UXM0V1lMTi9uekQzWnNNYWxZOXhERWZ3ZFlhUHh0SC82ZEFjWGNPTzlFUG5k?=
 =?utf-8?B?OVBCQ1VZYzFIR0p3NEIwMCtxSGFyZVE1RTl2a0p4Ty82NzhWaHFkUENvUUJK?=
 =?utf-8?B?TGpCVE9kSlVOOWpZU0RnSmhBanNUaHBOOEZwcDJsa1hobXhzSXdBOTk0WUNm?=
 =?utf-8?B?dStJMjdOOWNjZUMxTmJCbERVOGVRRlhlM3VHNDNtb0xZVnQrS3JXQVppbVhD?=
 =?utf-8?Q?+zfGKw=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L0VwUlFIdHo1MGZ4VGd2K25xR1ZXNytWVkhOdFl1elpIdTZWUnl0TWVIdmkv?=
 =?utf-8?B?bFVPUlBTZkF1OU8wRmFCZFVRdXd6djVIZ2Z1NllIMnNDUkVZdUM1dkt5TjRh?=
 =?utf-8?B?TUl1WmV2ZjMxWTNRMXAvWU92RWo5NGtHRUcwU3VIUlFrVDBJVnJQRzdIMXh4?=
 =?utf-8?B?UFdoUGRrcHRwdmNCV2RTY1pzQ1dxOElaK3NQSGVPaFhBT2RwSk4yaGdzVG5N?=
 =?utf-8?B?c1ZtMGlkV3ArNzBGUFM5ZEFUQXhzd25iM1hDdEd2ems2ZzFhWGh0U2xsMmFE?=
 =?utf-8?B?eVFjWXdCcFhwcjF3ZElsOE1tM0RLNG1iV0VSVmJ0a0dwTG5pRFI0OE9HN1ho?=
 =?utf-8?B?ZFBHcjl1Skw0OFNGd2dISFVoZ3ZCeEdwWHJ5b2V0Wk8vUHhPMVBiWDJhZEdF?=
 =?utf-8?B?eDl5QWhFZ1lOd0hSZ3VqNk40YWErTjllUk1JUE9vTjlNRG4rdG5oZzNQNERC?=
 =?utf-8?B?a2tzM1lUa3d5OFQ5SSsyRjh2bGZQdHlacmQ5ZjFaNGF1TDJsQXQvNy9RR0lR?=
 =?utf-8?B?MTJoNlJGRm9RNEIwL1Y4Si9mdzNkRzRVSGJiZGlvVUNoWWlnMWs3cW5rL0Jy?=
 =?utf-8?B?WGI3WUFrbU1XSVNFMHNmcm5vQnBlU3kzdXYzZjRLcjhOYzAzbzdxQWpBK2J2?=
 =?utf-8?B?NkV6dDE3b2RqNlZMQmxQYksxZTMzaU5lYTlqTFFkWnNDM0FFZFNyZ0YxTjFD?=
 =?utf-8?B?NGxiTWxIUDNiSXZMaytSV1p2TUtLVE8wTUtiYU0yWVBQYklNQi9PMDRXN2tk?=
 =?utf-8?B?SDZ5SEZ2MjF5WDYzZkhJU1UvN1l3dFFwdHV2UDZhclFZcW9zTVpOdlpPMjZR?=
 =?utf-8?B?YXJXWjc0SkVhSGptc2xaQ1Jxa0dwOXlFb01sMWRpdTRtSkVnOTBDcVRyeGlB?=
 =?utf-8?B?YVhrVlJJbnhJTTllUTVlRXdQZG9POVNKWTFlQU9Gc1UyVDZacmYrVURySGd0?=
 =?utf-8?B?L3E1SFVlM3g4TEZHYUwzUE5oSUFtd09Jb3huMzJKU3VPTFBvUHNRTmJiV3Rr?=
 =?utf-8?B?ZUpMbVJUeVR5dHRxdnNYc0syUjFGSzk3ZktiL0NXWnhMNnVVMFluZmVrbmE1?=
 =?utf-8?B?UFl5STVoNnpDN3AyVEtSRm5QZGROOUhJeEIzZGYvKy85NnlZc1N2ZTI3U3VS?=
 =?utf-8?B?UW8rTWhtZWFRQXgzRXp3aVJHbjBjV2hmMmJJeXdlR0g2R2xvMVo5akxDT0to?=
 =?utf-8?B?cjlrUk5vN0hGTi80N3JDYU9FWk40cnR3eFo0eFc5eVhFaHh6Skg4bU8vTWpH?=
 =?utf-8?B?cUVKVXJMUWJLYnpvMzI5L0JaUWwrUm00M21ocFIxQnlNNXcwV0RiRWRiZHVh?=
 =?utf-8?B?MUZTQ2hWaTZDSmFhWFR2aHRkeCtINXIrQno1R3UweUxzaldJSG4xYXVvZlY3?=
 =?utf-8?B?ZktjRCtnTllPdUtlQ1VieUEza3FzV3A5Y0xieWExeEVkaHNSMXdyL0NDYUVi?=
 =?utf-8?B?Nm5sU1pMcTdsK1hTby9Ka013cVZ6QzJaeEZpcUpMNzF1U0lWNXdCbmJjQ1VU?=
 =?utf-8?B?YkhsTy9XbmpiTFdWaVQ1ZzViQ1N3bjN1bXBTYmpMd3hqMjhwOS9sS3NrZm5j?=
 =?utf-8?B?WHMrWEJLUVJqYVd1bzltdzQwZFlPaDlsWEU2SklLc3VqeFhRTE95aXVnQ0VD?=
 =?utf-8?B?S21QSStUeFRpS3AraE5qWWNaaWMvQ2VWUlVHbVZNOGJwWUxnNGxoZHFhWnhG?=
 =?utf-8?B?YUVkT1FmV0prVXZ2S3RDSDhJaEFoUjloRkhScms5d0VCcWdjUUd2eVd3aTF2?=
 =?utf-8?Q?W5up+qz9elDxYN7ip/QPVhiUbq17RvUFCn1Idb8?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5615474-86fa-45d5-d732-08dd5535831e
X-MS-Exchange-CrossTenant-AuthSource: MAZPR01MB9162.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 00:44:08.3124
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB6628
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_164424_216861_E0207912 
X-CRM114-Status: GOOD (  14.35  )
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

Ck9uIDIwMjUvMi8yNSA4OjM4LCBJbm9jaGkgQW1hb3RvIHdyb3RlOgo+IE9uIFR1ZSwgRmViIDI1
LCAyMDI1IGF0IDA4OjIzOjM2QU0gKzA4MDAsIENoZW4gV2FuZyB3cm90ZToKPj4gT24gMjAyNS8y
LzI0IDE4OjEyLCBMb25nYmluIExpIHdyb3RlOgo+Pj4gQWRkIFNQSSBOT1IgZGV2aWNlIG5vZGUg
Zm9yIFNvcGhnby4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBMb25nYmluIExpIDxsb29vbmcuYmlu
QGdtYWlsLmNvbT4KPj4+IC0tLQo+Pj4gICAgLi4uL2Jvb3QvZHRzL3NvcGhnby9zZzIwNDQtc29w
aGdvLXNkMy0xMC5kdHMgIHwgMTggKysrKysrKysrKysrKysKPj4+ICAgIGFyY2gvcmlzY3YvYm9v
dC9kdHMvc29waGdvL3NnMjA0NC5kdHNpICAgICAgICB8IDI0ICsrKysrKysrKysrKysrKysrKysK
Pj4+ICAgIDIgZmlsZXMgY2hhbmdlZCwgNDIgaW5zZXJ0aW9ucygrKQo+Pj4KPj4+IGRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9zZzIwNDQtc29waGdvLXNkMy0xMC5kdHMg
Yi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9zZzIwNDQtc29waGdvLXNkMy0xMC5kdHMKPj4+
IGluZGV4IGM1MGU2MWE1MDAxMy4uOWM2MzQ5MjBmMzdlIDEwMDY0NAo+Pj4gLS0tIGEvYXJjaC9y
aXNjdi9ib290L2R0cy9zb3BoZ28vc2cyMDQ0LXNvcGhnby1zZDMtMTAuZHRzCj4+PiArKysgYi9h
cmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9zZzIwNDQtc29waGdvLXNkMy0xMC5kdHMKPj4+IEBA
IC04MCw2ICs4MCwyNCBAQCAmc2Qgewo+Pj4gICAgCXN0YXR1cyA9ICJva2F5IjsKPj4+ICAgIH07
Cj4+Pgo+Pj4gKyZzcGlmbWMwIHsKPj4+ICsJc3RhdHVzID0gIm9rYXkiOwo+Pj4gKwo+Pj4gKwlm
bGFzaEAwIHsKPj4+ICsJCWNvbXBhdGlibGUgPSAiamVkZWMsc3BpLW5vciI7Cj4+PiArCQlyZWcg
PSA8MD47Cj4+PiArCX07Cj4+PiArfTsKPj4+ICsKPj4+ICsmc3BpZm1jMSB7Cj4+PiArCXN0YXR1
cyA9ICJva2F5IjsKPj4+ICsKPj4+ICsJZmxhc2hAMCB7Cj4+PiArCQljb21wYXRpYmxlID0gImpl
ZGVjLHNwaS1ub3IiOwo+Pj4gKwkJcmVnID0gPDA+Owo+Pj4gKwl9Owo+Pj4gK307Cj4+PiArCj4+
PiAgICAmdWFydDEgewo+Pj4gICAgCXN0YXR1cyA9ICJva2F5IjsKPj4+ICAgIH07Cj4+IFdoYXQg
aXMgeW91ciBiYXNlbGluZT8gSSBjYW4ndCBzZWUgInNnMjA0NC1zb3BoZ28tc2QzLTEwLmR0cyAi
IG9uIHRoZSBsYXRlc3QKPj4gbWFpbmxpbmUgeWV0Lgo+Pgo+IEl0IHNlZW1zIGxpa2UgaGUgZm9y
Z290IHRvIHJlbW92ZSB0aGlzIHBhdGNoIGFzIHRoZSBiYXNlbGluZSBpcyBub3QKPiBzdWJtaXR0
ZWQuCj4KPj4gQlRXLMKgIHRoZSBuYW1lICJzZzIwNDQtc29waGdvLXNkMy0xMCIgc2VlbXMgYSBi
aXQgcmVkdW5kYW50LiBXb3VsZG4ndAo+PiAic2cyMDQ0LXNkMy0xMCIgYmUgYmV0dGVyPwo+Pgo+
IEkgZG8gbm90IHRoaW5rIHNvLiB3ZSB3YW50IDxzb2MtdmVuZG9yLWJvYXJkPiBmb3JtYXQuIElu
IHRoaXMgZm9ybWF0Lgo+IHNvcGhnbyBpcyBhIG11c3QuCgpBbGwgdGhlc2UgZHRzKiBmaWxlcyBh
cmUgdW5kZXIgInNvcGhnbyIgZm9sZGVyLCB0aGF0J3Mgd2h5IEkgdGhpbmsgCiJzb3BoZ28iIGlz
IHJlZHVuZGFudCBmb3IgZmlsZSBuYW1lLgoKQW55d2F5LCBpZiB5b3UgZG8gV0FOVCB0aGUgZm9y
bWF0LCBJIHdvbid0IG9iamVjdCBzdHJvbmdseS4KCj4KPiBSZWdhcmRzLAo+IElub2NoaQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
