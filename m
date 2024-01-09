Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82EECC46CD2
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jan 2024 08:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:To:Subject:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eqLxOo8nJYyIDwrrGrQvBY509y9Fc2f3rk6Yf+IA1nc=; b=b+zgn0Ba+xNiS5OQCeb5Yo/M1j
	JmD11Ajj+vSJSYnPggoj9vl/ZlfCa6QifYGpnLyED34O4pIqfqOFEneRr+5gF8CsFrYA7+BJHdH8J
	6SmrY9NM8yPONw4JBTErDBS1mDFe++vyburSDc6882xZH5JYfhF/HekJSD13Qts/eNf6sD0e9eoMy
	Jj3zHeu7sIDVqNrKMSVK8nOE3/qW88ZoCpSsqzUoLYTq0rPWReMcLmmFBIwZHMYEZc3UpmJzu7Rqq
	EP35JxLbAYpKuIDZh9O8qEPEC4Du2SjMEo78XTNySPmZTf6ViLqnScXjDdu45u+1S06qsyrM/kFu8
	DpwlHk2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rN7Rr-007JTn-0W;
	Tue, 09 Jan 2024 08:26:59 +0000
Received: from mail-bmxind01olkn20801.outbound.protection.outlook.com ([2a01:111:f403:281c::801] helo=IND01-BMX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rN7Rm-007JRA-2I
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jan 2024 08:26:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YNXQzIbuDvNt3yvLGeXHqRFCbmo3lKAbbD2GrP3AYFuefTDkwgsoTEe2MasZ08cTYyMflYRbp3buoYU9C+SKu7WcJQi9yL/Hoat+wuFT6lLdk5gWl3oKhpQJVYvOP8vNuksYPcV7d8iwFGKE4BybjSp2QVADQ79eLZSvJpOaI2C+/2rrnfrZBJULBQq4+7T2+gXOXThn6PRKzZ1tTdoibS+pq2deOwYpUdWku22EQe1TRNjMHx5LSI1BUFQX3+w5+3m2H/IYEn7MsLYFJ7vuPflNtryZle3wd+ihSS0+zOdPc2mpYDnR5YSjSTxCNXYP5SgNPXGdCnI6mfVOCJqcWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Kc1/acqdl4pVMo+iEYdsuQNi7GKCbRhheNIgkInaNE=;
 b=EmAQiMxoZxR2syCwa1KtemDgRy4XskEOgXonm32y8l596M+eQ2JZ4r5uYoVRkTfJCffbNOe8ULmUIkCM9Z4hVegjHGcSGGuymltg50SjAk18f38Du0eZr/TIk6HmFJKVkzF/nFfkyc0mtqA1aK0Lq2LSsTIjEfGn0fsKuTNtAmgtyyHN1xRpy4eLUtl3t5OLOvrscwldyB/s62iox3lUPtMFjBkvOUJrGsQCI57fNl4J8PosbJ6luX0gfsMf35tldzN7fQ97DxxF/pKoKZV9hUwNvrwNIfoJqpYpr23KQWdxfx/9KTUSyWmQRK9uGHgNj80qGfEC4uvd9Ktch09FeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Kc1/acqdl4pVMo+iEYdsuQNi7GKCbRhheNIgkInaNE=;
 b=i+Uls7CBCDqSs7KsK7OB1BN3T86l+DpULFZ2krsbXzohRNZYuEnFLtAldDnvEUcRuNk2PP67G3MH90x0ZQi8L+So0ZNZD+2ULSwFA2Gi06VqY86Mb8zuCWtilLQjbCW+az6Cuo3KBzgFTD23fjikQI8v16kEQf2zfnAfmTWGo9FQWHAKDSAMMfMN+8emgauXzBAxCNKrauYU4MxGAeCZ4GY7XIy4BZ7CXbdytXZe4tHMqUokmf3eS7aODvOxppKhyfU6GBCzk0LITrsnwG9WJHUH4ysRtrbWq4ZIalo67WyHss6eSL0OHLvR9ENY3OBX0KfWiL+VUCsZOHtB+tacew==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by PN0P287MB1015.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:141::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Tue, 9 Jan
 2024 08:26:39 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::6e80:69e1:f2e7:d70d]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::6e80:69e1:f2e7:d70d%3]) with mapi id 15.20.7159.020; Tue, 9 Jan 2024
 08:26:39 +0000
Message-ID: <MA0P287MB2822FD86915185F6C908ACCFFE6A2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Tue, 9 Jan 2024 16:26:31 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/4] dt-bindings: soc: sophgo: Add Sophgo system
 control module
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Chen Wang <unicornxw@gmail.com>, aou@eecs.berkeley.edu, chao.wei@sophgo.com,
 conor@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 mturquette@baylibre.com, palmer@dabbelt.com, paul.walmsley@sifive.com,
 richardcochran@gmail.com, robh+dt@kernel.org, sboyd@kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 haijiao.liu@sophgo.com, xiaoguang.xing@sophgo.com, guoren@kernel.org,
 jszhang@kernel.org, inochiama@outlook.com, samuel.holland@sifive.com
References: <cover.1704694903.git.unicorn_wang@outlook.com>
 <acebc88db3e5fcd2a2607b56842af7443a6e1289.1704694903.git.unicorn_wang@outlook.com>
 <cc7cc943-7242-4fd1-9b56-3ece0a418e05@linaro.org>
 <MA0P287MB2822E54A6DD36F914DB56E98FE6B2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
 <1e1ef0a0-6639-4a4d-9b4e-50bcee3fb3c5@linaro.org>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <1e1ef0a0-6639-4a4d-9b4e-50bcee3fb3c5@linaro.org>
X-TMN: [+mSGRKrQHKlzGy2bAV8g9Rub4dwtVboO]
X-ClientProxiedBy: SI2PR01CA0019.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::12) To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID: <25f684d2-3089-4a24-87b6-2c89cd63f5d4@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|PN0P287MB1015:EE_
X-MS-Office365-Filtering-Correlation-Id: 69017170-43c7-4b9f-93ba-08dc10ecb25d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RJM7g6Je9rcku0GgxZyaaBcl4NnOIj9Jl7726+jDMG3Tbkgd4twKToRZWGUoiotzDBrUp1Akje3UpGUCdCUR167j/ie6How7iGd2DzPE8Ts/XEPthUlb8UWc9fKO20KLhSEwua1uUksfpj9LJRUQ1nFQ/FLY447Ms8zGwhx0cDmqKqusAonB1MgA26W2U8pYeKMz6FlumkuYVnGbb/ne7VjeRynHh4WMcaC7zw5CN6wcSd5SZI+GjCvrZgxaX9a5/EI/hMqUAQ05S1MZh1/eqwADs28Gy17lKKETO/cXvIjEk7dTY47yGny+rTndlrmcAlASiuJ5rYNlg0qDGWSUT3MmCKbJGFyvBE4fpkBOg6lOFyA6/oYujXTOLTk384EEIy/kArmHIR+sMiCxghbWFCMCP9dW/0xIaxJ8i+1nj5/DrCX9S1AbBMpQJ3Rt90jxKrzin7vhLfdhF4xo3Ok6F4AOVoU+oCifsN9nB6Fr1dZ7rallrhlvBMrWNilY6CHgl4rXDJF7NW/fhxrDL10CwUG3IOMbt1eOGDMZVQ+DmhJ64O90oB7pLvkkNOABr+x660GdtoQYQ2tjYu4MQyF5H15bhrGBUOGv3+xLMM983m9vjWPY4Ww18Y61ZbzHcf3jqcVuLA6+gXfjVphFhS7Phg==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z0xueXNEUkpOWXF0cEZUS1ZId1h3N0hCbkxXclRmUWZxM0NNZS9RS2RZL2x0?=
 =?utf-8?B?TVhVV2lGcmt6UStLN1NqS1Jid2xBTENoSzM5QUExT2RQbTRjOFZEQ3JqNzNr?=
 =?utf-8?B?UHh2ZVVudVVBYVBkamFWK3c4VEhDRU9Vb2RUd3FDeDBjN1lMNGxvbm5WanBk?=
 =?utf-8?B?SC9aNi95eDhzQTU1ejMzVVNKZ1kyQjk3OHdLaGdrVERENzJFVGtvbDJ6a000?=
 =?utf-8?B?UDQ3aXFRZ2c4NXQzeFZPVlhrOXBZM1FLYnZ6MHVjVUZWNmI2UDZSbXhLWmtL?=
 =?utf-8?B?TW9sMlJWa0hoZlBQaEVkb3M1ZHY3YmF2UjIvMXM1VTRRSWVVVS9RbHhDY1NI?=
 =?utf-8?B?UTZBc2MrSlRBYnhmSDAzem54bkl1N25HVHF1VG5HdjdtME4vUGVRMUozZy8w?=
 =?utf-8?B?TjYzSU5GWWVMaHU2ZVRiZkJUaGlCSEROSVNYN0VlSUd0WDRlUlVRR2dsN3Ew?=
 =?utf-8?B?amRzSzh1K1d1YkQ5NlJEOXRmcklrNU82VnBYaERwQkVzbExrRnpmcWtoVHpB?=
 =?utf-8?B?WlNlenFUWit5QjFuNGhITE1pVCtXRHZQKzZHMFRCbUFVMG5wRm4xVDRDcXF1?=
 =?utf-8?B?VVUxTFM4Mi96a0x1NkVRSFFxTzdPWitXczRQU3VOdmJaVGY4SXVlWW9oSkho?=
 =?utf-8?B?R2k0YTVWL2NYRzZId3A0WnN3N3lEVjB5eWM5TnZod3d6aWJSZmpEbkEzK0xB?=
 =?utf-8?B?V2hGT2MwOXVzbEplRHpYUGV0K3ZsalBFd0hZMWJjR0xqYUtvMmJkQ1FHNVRt?=
 =?utf-8?B?V2hjMXRqdGd3UklDaURqaEtpOGd5alpHN2VoZ0cwcXphMGMxMXVhVjZyQlJY?=
 =?utf-8?B?Mjlhdnphb2ljOFZnT0ZsWHBVTEZBWDB4SkFkTjF4MFlEcGFLZGk4bjd5WXRG?=
 =?utf-8?B?L1hFQnFsQ0d1V0RvQVRVc3RycVpJU3J4Z0Uza05DNHVZZEpsaGo1K0FmL2pG?=
 =?utf-8?B?dS9RenQySzZicmhPdlhSRmRxMUdDbTllUDlFUHBkcnk3Q09pbExSTFQyR0Zz?=
 =?utf-8?B?OHVpS3ZZK1lTL0ErWFdaRmhiczBucW05cFlsc0xJWWpySURla3ZWTytnYnh2?=
 =?utf-8?B?Um4yc0tXZ3pvU0YxeEFwNnZubUZ5STVwc2FXWGtBaTcxa3R3Q2YrWjUvSWpa?=
 =?utf-8?B?N01LcjhUSE1tMWcrcG9VTGRzdDJQQmpZR3hhQ3d6TEVSb0VGaEtHSXFIZmVF?=
 =?utf-8?B?TXp1eXk4NEhub2NTTWNDR1VSa2VYeFUvdmFETjRaMGZOU1gyamxjd1Z6R1pz?=
 =?utf-8?B?cGZBNk1yKzJ0N3MxZENWWG12YlRYQS96dkw5YUVyM0IwcU1HRnNQYlB1UUZL?=
 =?utf-8?B?bXYzT25wMmYxdVJ0bzhDSDRoS1k4clFvaFB4c3RXU1dVdXNCTHlTUHNsVWNn?=
 =?utf-8?B?TDlkYU1BTmhvTG54N1Bua2pMTG03SGg4ZmxlN1p0ckVEZ3VpWkhvcUoyMmtF?=
 =?utf-8?B?bmhqS1RTWlFTL2JhTXhJMXJBNGtrRHNRRG1TcWFBYTQvOEQvR1pZcUNCTUZH?=
 =?utf-8?B?OGQwK1A3T3hvV2hUTGgxU2Rrb0RTbnFWVVFrc0I1S0Z2RkVZV1BIVHYva2hi?=
 =?utf-8?B?WWV0aEEybzVtZkE4WENZY3dheExzRSt0Y3dwTTd0YXpYQ2NVaWR6N25hVHFv?=
 =?utf-8?Q?/cF0Fico/DJJxRRGj17Dw5mQGDyhBeRwELHuWBm7iBdg=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69017170-43c7-4b9f-93ba-08dc10ecb25d
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2024 08:26:38.9818
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB1015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240109_002654_765630_2CB528AA 
X-CRM114-Status: GOOD (  19.15  )
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

Ck9uIDIwMjQvMS85IDM6MzYsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6Cj4gT24gMDgvMDEv
MjAyNCAwODoyMCwgQ2hlbiBXYW5nIHdyb3RlOgo+PiBPbiAyMDI0LzEvOCAxNTowMywgS3J6eXN6
dG9mIEtvemxvd3NraSB3cm90ZToKPj4+IE9uIDA4LzAxLzIwMjQgMDc6NDgsIENoZW4gV2FuZyB3
cm90ZToKPj4+PiBGcm9tOiBDaGVuIFdhbmcgPHVuaWNvcm5fd2FuZ0BvdXRsb29rLmNvbT4KPj4+
Pgo+Pj4+IEFkZCBkb2N1bWVudGF0aW9uIHRvIGRlc2NyaWJlIFNvcGhnbyBTeXN0ZW0gQ29udHJv
bGxlciBmb3IgU0cyMDQyLgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogQ2hlbiBXYW5nIDx1bmlj
b3JuX3dhbmdAb3V0bG9vay5jb20+Cj4+Pj4gUmV2aWV3ZWQtYnk6IEtyenlzenRvZiBLb3psb3dz
a2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4KPj4+PiAtLS0KPj4+PiAgICAuLi4v
c29jL3NvcGhnby9zb3BoZ28sc2cyMDQyLXN5c2N0cmwueWFtbCAgICAgfCAzNCArKysrKysrKysr
KysrKysrKysrCj4+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDM0IGluc2VydGlvbnMoKykKPj4+PiAg
ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Nv
Yy9zb3BoZ28vc29waGdvLHNnMjA0Mi1zeXNjdHJsLnlhbWwKPj4+Pgo+Pj4+IGRpZmYgLS1naXQg
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc29jL3NvcGhnby9zb3BoZ28sc2cy
MDQyLXN5c2N0cmwueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb2Mv
c29waGdvL3NvcGhnbyxzZzIwNDItc3lzY3RybC55YW1sCj4+Pj4gbmV3IGZpbGUgbW9kZSAxMDA2
NDQKPj4+PiBpbmRleCAwMDAwMDAwMDAwMDAuLjFlYzFlYWE1NTU5OAo+Pj4+IC0tLSAvZGV2L251
bGwKPj4+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc29jL3NvcGhn
by9zb3BoZ28sc2cyMDQyLXN5c2N0cmwueWFtbAo+Pj4+IEBAIC0wLDAgKzEsMzQgQEAKPj4+PiAr
IyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAgT1IgQlNELTItQ2xhdXNlKQo+Pj4+
ICslWUFNTCAxLjIKPj4+PiArLS0tCj4+Pj4gKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3Nj
aGVtYXMvc29jL3NvcGhnby9zb3BoZ28sc2cyMDQyLXN5c2N0cmwueWFtbCMKPj4+PiArJHNjaGVt
YTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCj4+Pj4gKwo+
Pj4+ICt0aXRsZTogU29waGdvIFNHMjA0MiBTb0Mgc3lzdGVtIGNvbnRyb2xsZXIKPj4+PiArCj4+
Pj4gK21haW50YWluZXJzOgo+Pj4+ICsgIC0gQ2hlbiBXYW5nIDx1bmljb3JuX3dhbmdAb3V0bG9v
ay5jb20+Cj4+Pj4gKwo+Pj4+ICtkZXNjcmlwdGlvbjoKPj4+PiArICBUaGUgU29waGdvIFNHMjA0
MiBTb0Mgc3lzdGVtIGNvbnRyb2xsZXIgcHJvdmlkZXMgcmVnaXN0ZXIgaW5mb3JtYXRpb24gc3Vj
aAo+Pj4+ICsgIGFzIG9mZnNldCwgbWFzayBhbmQgc2hpZnQgdGhhdCBjYW4gYmUgdXNlZCBieSBv
dGhlciBtb2R1bGVzLCBzdWNoIGFzIGNsb2Nrcy4KPj4+ICJvZmZzZXQsIG1hc2sgYW5kIHNoaWZ0
IiBpcyBub3QgYSByZWdpc3RlciBpbmZvcm1hdGlvbiBzdG9yZWQgaW4KPj4+IHN5c2NvbnMuIEFy
ZSB5b3UgcmVhbGx5IHN1cmUsIHRoYXQgeW91ciBzeXN0ZW0gY29udHJvbGxlciBoYXJkd2FyZQo+
Pj4gc3RvcmVzIG9mZnNldHMgb2Ygc29tZSBvdGhlciByZWdpc3RlcnM/Cj4+Pgo+Pj4gU2hvdyBh
cyBzb21lIGV4YW1wbGUgb2Ygc3VjaCBvZmZzZXRzLCBtYXNrcyBhbmQgc2hpZnRzIHByb3ZpZGVk
IGJ5IHRoaXMKPj4+IGhhcmR3YXJlLgo+PiBUaGUgc3lzdGVtIGNvbnRyb2wgbW9kdWxlIGlzIGRl
ZmluZWQgaGVyZToKPj4gaHR0cHM6Ly9naXRodWIuY29tL3NvcGhnby9zb3BoZ28tZG9jL2Jsb2Iv
bWFpbi9TRzIwNDIvVFJNL3NvdXJjZS9zeXN0ZW0tY29udHJvbC5yc3QuCj4+IEl0IGNvbnRhaW5z
IHNvbWUgcmVnaXN0ZXJzIHJlbGF0ZWQgdG8gcGxsIGFuZCBnYXRlcy4KPiBJIGRvIG5vdCBzZWUg
dGhlcmUgcmVnaXN0ZXJzIHByb3ZpZGluZyBzaGlmdHMgYW5kIG9mZnNldHMuLi4ganVzdCB2YWx1
ZXMuCgpMZXQgbWUgZmlyc3QgY2xhcmlmeSBtb3JlIHdoYXQgdGhlICJvZmZzZXQiLyJzaGlmdCIv
Im1hc2siIEkgbWVhbnQsCgpVc2UgCmh0dHBzOi8vZ2l0aHViLmNvbS9zb3BoZ28vc29waGdvLWRv
Yy9ibG9iL21haW4vU0cyMDQyL1RSTS9zb3VyY2Uvc3lzdGVtLWNvbnRyb2wucnN0I21wbGxfY29u
dHJvbC1vZmZzZXQtMHgwZTggCmFzIGV4YW1wbGUsIHRoaXMgcmVnaXN0ZXIgaXMgdXNlZCB0byBj
b250cm9sIE1haW4gUExMOgoKLSBPZmZzZXQ6wqAweDBFOCwgdG8gbXkgdW5kZXJzdGFuZCwgaXQg
aXMgdGhlIG9mZmVzdCBiZXR3ZWVuIHRoaXMgCk1QTExfQ09OVFJPTCByZWdpc3RlciBhbmQgdGhl
IHN0YXJ0IG9mIHN5c3RlbS1jb250cm9sIGJhc2UKCi0gU2hpZnQ6IHRoZSBjb25sdW1uICJMU0Ii
LCBmb3IgZXhhbXBsZSwgdG8gbG9jYXRlIHRoZSBmaWVsZCAKTVBMTF9DT05UUk9MLk1QTExfRkJE
SVYsIHdlIGNhbiBmaXJzdCB1c2Ugc3lzdGVtLWNvbnRyb2wgYmFzZSArIG9mZnNldCAKdG8gZ2V0
IHRoZSBhZGRyZXNzIG9mIE1QTExfQ09OVFJPTCwgdGhlbiB1c2UgTFNCKDE2KSBhcyBzaGlmdCB0
byBnZXQgdGhlIApzdGFydCBwb3NpdGlvbiBvZiB0aGlzIGZpZWxkLgoKLSBNYXNrOsKgIHN0aWxs
IHVzZSBNUExMX0NPTlRST0wuTVBMTF9GQkRJViBhcyBleGFtcGxlLCB1c2UgTVNCKDI3KSBhbmQg
CkxTQigxNiksIHRoaXMgbWVhbnMgdGhlIHdpZHRoIG9mIHRoaXMgZmllbGQgaXMgMTIgYW5kIHdp
dGggdGhpcyB3ZSBjYW4gCmdldCBiaXQtbWFzayBmb3IgdGhpcyBmaWVsZC4KCkZvciBTRzIwNDIs
IElDIGRlZmluZSBjbG9jayByZWxhdGVkIHJlZ2lzdGVycyBpbiB0d28gcGFydHMsIG9uZSBpcyBp
biAKaHR0cHM6Ly9naXRodWIuY29tL3NvcGhnby9zb3BoZ28tZG9jL2Jsb2IvbWFpbi9TRzIwNDIv
VFJNL3NvdXJjZS9jbG9jay5yc3QsIAphbmQgYW5vdGhlciBpbiAKaHR0cHM6Ly9naXRodWIuY29t
L3NvcGhnby9zb3BoZ28tZG9jL2Jsb2IvbWFpbi9TRzIwNDIvVFJNL3NvdXJjZS9zeXN0ZW0tY29u
dHJvbC5yc3QuIApJIGRlZmluZSB0aGUgc3lzdGVtIGNvbnRyb2wgbm9kZSBpbiBEVFMgYW5kIGp1
c3QgdHJlYXQgaXQgYXMgYSBibG9jayBvZiAKcmVnaXN0ZXJzIGFycmF5IGFuZCBhZnRlciByZWdt
YXAgSSBjYW4gZ2V0IHNvbWUgcmVnaXN0ZXJzIGFkZHJlc3Mgc3VjaCAKYXMgTVBMTF9DT05UUk9M
IHRvIGFjY2VzcyBpdCBmcm9tIG15IGRyaXZlciBjb2RlLgoKPj4gU29tZSBvdGhlciBjbG9ja3Mg
cmVnaXN0YXJzIGFyZSBkZWZpbmVkIGluCj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9zb3BoZ28vc29w
aGdvLWRvYy9ibG9iL21haW4vU0cyMDQyL1RSTS9zb3VyY2UvY2xvY2sucnN0Lgo+Pgo+PiBtZW1v
cnktbWFwIGlzIGRlZmluZWQgaW4KPj4gaHR0cHM6Ly9naXRodWIuY29tL3NvcGhnby9zb3BoZ28t
ZG9jL2Jsb2IvbWFpbi9TRzIwNDIvVFJNL3NvdXJjZS9tbWFwLnJzdAo+Cj4gUGxlYXNlIGZpeCB0
aGUgd29yZGluZyBiZWNhdXNlIGl0IGRvZXMgbm90IG1ha2Ugc2Vuc2UuIFN5c3RlbSBjb250cm9s
bGVyCj4gZG9lcyBub3QgcHJvdmlkZSByZWdpc3RlciBpbmZvcm1hdGlvbi4gWW91ciBkYXRhc2hl
ZXQgcHJvdmlkZXMgcmVnaXN0ZXIKPiBpbmZvcm1hdGlvbi4KClNvcnJ5LCBJIGRvbid0IHVuZGVy
c3RhbmQgd2h5IHlvdSBzYXkgIlN5c3RlbSBjb250cm9sbGVyIGRvZXMgbm90IApwcm92aWRlIHJl
Z2lzdGVyIGluZm9ybWF0aW9uLiI/IEFzIEkgZXhwbGFpbmVkIGFib3ZlLCBJIGRpZCBzZWUgdGhl
IAppbmZvcm1hdGlvbiBhYm91dCB0aGVzZSBjbG9jay1yZWxhdGVkIHJlZ2lzdGVycyBmcm9tIHRo
ZSBzeXN0ZW0gY29udHJvbCAKbW9kdWxlLCBzdWNoIGFzIHRoZSBvZmZzZXQvc2hpZnQvbWFzayBJ
IG1lbnRpb25lZCBhYm92ZS4gVGhhdCdzIHdoeSBJIAp3cm90ZSAidGhhdCBjYW4gYmUgdXNlZCBi
eSBvdGhlciBtb2R1bGVzLCBzdWNoIGFzIGNsb2NrcyIuwqAgSG93IHNob3VsZCBJIApleHByZXNz
LCBwbGVhc2UgZW5saWdodGVuIG1lLgoKVGhhbmtzLAoKQ2hlbgoKPiBCZXN0IHJlZ2FyZHMsCj4g
S3J6eXN6dG9mCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
