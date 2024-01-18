Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9845C4707B
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jan 2024 05:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:To:From:Subject:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ABghusfSYNWspYjhEErPuvvQRDJluHpzyX1b+VcAVUY=; b=XChdA+um+BiJLQdMX0SrdXHV/s
	axbPU29f6xi2swdj65arLSnWV35CS7mlU/ea9qeg8SDo/dORnZtoeU40NHQKk0ckLh1CVnlJYnMg/
	re5Mw+1ukc4QiqGhA8Os4qYSOF5mOdOKo4lJWtxz/JFzT2DCiNJhStzZJQDpCx2bKzZMoGW7cMr1H
	d1KerKEPDArlm9cjO4pUO1izxT8b9fMMrI8C/JMwFLaDO1Botb/R/P3WWNi9N50EtxBdCKXd2LvB8
	Jm9Kk3z3AjqtaEreLQHgyPUmz1/7is6C65UrB5ePUZhJ+tQqSnVYvPvhmzJp12WEqJqiMM25kVA22
	j1UzhDlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQKyB-001hsH-2V;
	Thu, 18 Jan 2024 05:29:39 +0000
Received: from mail-bmxind01olkn20801.outbound.protection.outlook.com ([2a01:111:f403:281c::801] helo=IND01-BMX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQKy8-001hrj-2W
	for linux-riscv@lists.infradead.org;
	Thu, 18 Jan 2024 05:29:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fV/t1/S/HItXqiltrsMad4aIzkbqRv7fT8kjsufVknFemwQGo59NfLnSYz5w1/IZRc0gPuIuJS2SIqGanxsFgm7X6XGs+lgS1czYahgt6tB9S/PFvX4j8Qvtf2otswQ6BfOj1SMVIcHLNSr6FG/9yjeQ32tewis4vqoSYbcy93+YpwPeevts2/6U3JY37hTbyL/4QwjToyiyfhBsHh0241pCBn+iSd7RT8ShOHFpoTKs/2x6y91Bu+qlx0TYLuNUWuWfQnrVu4Ef6hgdyZqV9ITpqgubVW+2wuHdshrKZsVZAn6nELBx++Hpj6Y/k+INiBb0XrC0olrIZfbtfpI+6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e2h4G8xrbvBgaMO4F82y9JQEUJGPPo0y5alIn7i3Upc=;
 b=nQsPm7RT4OrFYJB82D6VADoRbe40oq61UvcCzp9vUyQv5aiwll4MW8MDYrSS8hZk5WkeI7BqecZsJnlAFe/OZ7/jzHW1rgg1s9HumJYw23Vm09PuxLGczcckFL1Vz+mweQ9IlBj2XKDg6CLCdQhFVVE8PpLUckZrtzalrq+q2BUPoi802HnpwRFrXvveVst7IO7UT0N6v9RDltJPHC5z98vMJKn+9dLKt1G7L7x13lSScrJG8U3xZx7LJ+ppXb61jWjvL73P5bOtMOnY6KD+Jxqvi0g4riy8sdIJLc7JCSVs10oT67hDZl7jEA8/7xgLKvmJjX0ai/CRdN80ybubOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e2h4G8xrbvBgaMO4F82y9JQEUJGPPo0y5alIn7i3Upc=;
 b=ivzVvRFIdAtw3EGaH9wNbz3p2jXUoRniKBralhG5YY5H+N4ACweuAm7mQBTMoHT4l5g10GVpcRPCpvQPklbKPI6EIDaL4Y4uJxmag05h16NyJknbbv9tbsv3NnV9uQml/3RLMv61SVqKvWmsgxGCPrGccnD/C5ZcwcMDVpkm6nb9DMlGCZlLSlfEkL0b/7tKcjk0BosFUFj78C8LnkzXEhCjIGimpHJaNMOoGPJmUvRkT/kJPfqtgRI2+AyxcMvr0kEG/RRVxQnKImeq7ronjhjpXC/Nw+/A0kz3bFnthYtQpnGgtqJllzMg2vQsbWHMJxsnqNYTAMhwvt3iD3iQQw==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by PN3P287MB2138.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1d4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Thu, 18 Jan
 2024 05:29:18 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::6e80:69e1:f2e7:d70d]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::6e80:69e1:f2e7:d70d%3]) with mapi id 15.20.7202.024; Thu, 18 Jan 2024
 05:29:18 +0000
Message-ID: <MA0P287MB2822FBA18674540BA85035BDFE712@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Thu, 18 Jan 2024 13:29:09 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/5] dt-bindings: soc: sophgo: Add Sophgo system
 control module
From: Chen Wang <unicorn_wang@outlook.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Chen Wang <unicornxw@gmail.com>, aou@eecs.berkeley.edu, chao.wei@sophgo.com,
 conor@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 mturquette@baylibre.com, palmer@dabbelt.com, paul.walmsley@sifive.com,
 richardcochran@gmail.com, robh+dt@kernel.org, sboyd@kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 haijiao.liu@sophgo.com, xiaoguang.xing@sophgo.com, guoren@kernel.org,
 jszhang@kernel.org, inochiama@outlook.com, samuel.holland@sifive.com
References: <cover.1705388518.git.unicorn_wang@outlook.com>
 <598b1026fdf9989bc48e5e10d1034b37947d3b80.1705388518.git.unicorn_wang@outlook.com>
 <f4a46311-2e12-458b-98a8-d3caa2c95517@linaro.org>
 <MA0P287MB282232DC6DF6290F5520BA89FE732@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
In-Reply-To: <MA0P287MB282232DC6DF6290F5520BA89FE732@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
X-TMN: [QWUKPSKxFwTw2iValkzxG5JyU4cffBhb]
X-ClientProxiedBy: SI2P153CA0009.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::18) To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID: <285064b2-e5de-48a1-aef1-26d9e5cdcd72@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|PN3P287MB2138:EE_
X-MS-Office365-Filtering-Correlation-Id: fc58cddb-7249-424d-0a83-08dc17e66966
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2GG1alpgk52Msh+GtGFo2X4bCTPJmiMMivNv6Ddhi6HDMy2zgmXQHpEh0m+csBUUNgcH+d7MxR7ot5G1FnTCLhvAKL86oVIqYFjueBGQm594JnPtQlm8F8C/mtMvZxrDn2q7TcMVYx765EFqdaALNPf61m0NiPT6VURWhJOlXUHERAgk8O4MnIkSGkKAOECavRhmqDscX6x5my3jHFHVXO49e4Vr/10fzoAJr6hVtdiAWKcuWPBYYivoGzJaIUHe8f+wxkPfY/YXvHUKUUgCB9tTMMkGUZVsFPwDmuZgWE2a2TjWQDw0GLHu0z/xR5jntNVHIEdBGhww8JI2BFj4PhSTSUCvLYxpxmHBSWke6QOsab7C5fGDp4SbQgLTPQ/7x2UoWf8/MUVDQaNNQ+EiLn09mWjqPb3z59t55oywSZYsKwbyk5jwRqWmzGePI7TnBU37ot9gd1+R7IHcJe+O6dYccEWXBQAKdr6L5xL+77SyahxrzAkMPct6w919n1OkWdWDbMcaW3DQ9fhXLnaI3VDgeiEpcV1+BXYkQUIrNlrmdmWQRBFUOJtfesimkoSBqqN7H6cgQg4BONYzzc3hyUwU8HppSTK75amUvlKc1XWVbAkCSy5Lk5OS/nWg+5PZBd5JSuJYQ1cV1gQijE34SQ==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVFvNWNVclhDaTNWcEpvdERZbjAxSzc4aXFxZmFxdTJJb0QrazBUSE5lL0Uy?=
 =?utf-8?B?TVdOVG1Ga08rcHRKZW45RHFLd0pSN2NteWZtb1hYQnF2VzJ4OGRyajFnd0ZT?=
 =?utf-8?B?aDAvbzRibm14dkYwUzYrRE1TeDNlcCtrYzBKMmZxQjBwdnlSelFIUjMyL2J6?=
 =?utf-8?B?Z1dvK2RQUWdJTksyZ2w0MkI2bDBBWGNPcDJYbjlVUGxzWVIwWlJkUStpOXlj?=
 =?utf-8?B?cVl3aWUvZU9OOE14Vk9JM241Q2hVdVBLb0RtMmVVd09xZXB6Z0JyOWl6Wnc1?=
 =?utf-8?B?Y0pYTUtPVnpyUitPYjRsUWtrZnhhR2E4UHVWdXloci9kTFFGallhUlpoVjhJ?=
 =?utf-8?B?TmNWWEFpNmo3cW1RaEg0SVBIR0Z3RWpndkxSbzVVdHRtY3Fsc0RxdUlZRXJo?=
 =?utf-8?B?L2NvNFJmd2NoMWs0SkZlZXBzOHZkMW5yMmhGNnQzYnhvNWxieXBBUGlUczlQ?=
 =?utf-8?B?d0lNU05zOFVWVnkwYnpTLzVsRC9KUHV0cVVkSHF0WGFWdXBOTkdaUDZoVzdp?=
 =?utf-8?B?K1kvMjlZWXdVL2JxbHNCRnYzdHhHS3VuUmNHZnBjNVVIbXMyakV5bVNvbGc1?=
 =?utf-8?B?aXRVemdVc3ZQSW5RMUdieGJEcXFMV2ViQnV1UWJmemN4M0hybk1UdDgzbjR1?=
 =?utf-8?B?b0YzUW81SEpQV2xDbjh3UWc1N1I0ZG84bFdSOVdPV0oxcFExeGZTdFhhVDFU?=
 =?utf-8?B?R3pIc3BlSGlSVG5Va0NtMEc5TUJmRFdlc3lMWWdBZE0yUmtGTHBON3I1WVJK?=
 =?utf-8?B?NXp6U1l4ZTErR3BZdUR5OXFJU0wrc1lYVkFNUFdNbjNTL28rV0k1S2NxUmZ0?=
 =?utf-8?B?Vno4MTVlc1pUWTZnRHoxcnVjSVZ5c3hLT3Z0T0tBRzJGeFFsZXYwQ3pFcC8z?=
 =?utf-8?B?aEl3dTZlbytEdDl3UHFSa3RuVmFWTGd5YlV3ZGlZZWF5L21iaGF3R0hSV2V0?=
 =?utf-8?B?TFBnV2hhejU5SGN1bURLVmIvaWhITCsxeFMydm9BT29kNkQrNnhmalJxNi9B?=
 =?utf-8?B?a2Z6V1lpYjc1dDgycjBkT0Y2SGxDbTFBa2lBS2piYVN3b21WaFV5VU1mcHRm?=
 =?utf-8?B?M0dVOUM3TVlQdllNQWFHMDAxY1Z2dUxtck9HcGFicCtTMmh5MDM4TVFHQlZ3?=
 =?utf-8?B?VDZzU3ZQUmMrK1FLc09vWVhQd05LNjl4Y3FOV3lSSkxpK1drOEt1MXExRkYr?=
 =?utf-8?B?K1hoajV3NWhOMDdEL1pFczlST1pDU0lNaStwd1N4cDZTcWpHLytHbHo1L0Jt?=
 =?utf-8?B?a0lGQWpFYWtMdUIxK3BSOHd5RFVIUXJldy9WT016cUlGMitzNE9vYzFXdUh3?=
 =?utf-8?B?SWhKUE1iYkxvOXkrQlNIK3RwTWlpTTloUU42emFoR2luZXZnVjlJY2pVTTZL?=
 =?utf-8?B?bHRWSHUyNlZyekM5RHR3K0t0cWp2N214dTBUWXJOV1RsVXlZTUNuSnV5RkxC?=
 =?utf-8?B?TDN2a3l5VVZ2VFk0c0N2NzZZbC9Rc3JHSDkyb21sRjBaZFNhRTBPVmoreXpM?=
 =?utf-8?B?b3pub3RhS0F3Lzc5RWV2K0NCRTlLRkt3TWRlZWlyblN1dWxLOHJlb1E5RXhY?=
 =?utf-8?B?L0dvNHNpcS93VElPK1ZlQ3B0aWhOek0vajNuWkFJRjhXTzNlWk5sQnI0YUo1?=
 =?utf-8?Q?PtNo4IvvrZCwAZQucovlx56cnK4/ugAO23uA+0UtDFTw=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc58cddb-7249-424d-0a83-08dc17e66966
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2024 05:29:17.9188
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB2138
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240117_212936_850049_19E7FA4F 
X-CRM114-Status: GOOD (  13.11  )
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

Ck9uIDIwMjQvMS8xNiAxOTozNywgQ2hlbiBXYW5nIHdyb3RlOgo+Cj4gT24gMjAyNC8xLzE2IDE4
OjA2LCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOgo+PiBPbiAxNi8wMS8yMDI0IDA4OjIxLCBD
aGVuIFdhbmcgd3JvdGU6Cj4+PiBGcm9tOiBDaGVuIFdhbmcgPHVuaWNvcm5fd2FuZ0BvdXRsb29r
LmNvbT4KPj4+Cj4+PiBBZGQgZG9jdW1lbnRhdGlvbiB0byBkZXNjcmliZSBTb3BoZ28gU3lzdGVt
IENvbnRyb2wgZm9yIFNHMjA0Mi4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBDaGVuIFdhbmcgPHVu
aWNvcm5fd2FuZ0BvdXRsb29rLmNvbT4KPj4+IC0tLQo+Pj4gwqAgLi4uL3NvYy9zb3BoZ28vc29w
aGdvLHNnMjA0Mi1zeXNjdHJsLnlhbWzCoMKgwqDCoCB8IDQ2IAo+Pj4gKysrKysrKysrKysrKysr
KysrKwo+Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDQ2IGluc2VydGlvbnMoKykKPj4+IMKgIGNyZWF0
ZSBtb2RlIDEwMDY0NCAKPj4+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb2Mv
c29waGdvL3NvcGhnbyxzZzIwNDItc3lzY3RybC55YW1sCj4+Pgo+Pj4gZGlmZiAtLWdpdCAKPj4+
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvYy9zb3BoZ28vc29waGdvLHNn
MjA0Mi1zeXNjdHJsLnlhbWwgCj4+PiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9zb2Mvc29waGdvL3NvcGhnbyxzZzIwNDItc3lzY3RybC55YW1sIAo+Pj4KPj4+IG5ldyBmaWxl
IG1vZGUgMTAwNjQ0Cj4+PiBpbmRleCAwMDAwMDAwMDAwMDAuLjdiNTBiYjU2YjRjZgo+Pj4gLS0t
IC9kZXYvbnVsbAo+Pj4gKysrIAo+Pj4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3Mvc29jL3NvcGhnby9zb3BoZ28sc2cyMDQyLXN5c2N0cmwueWFtbAo+Pj4gQEAgLTAsMCArMSw0
NiBAQAo+Pj4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wIE9SIEJTRC0yLUNs
YXVzZSkKPj4+ICslWUFNTCAxLjIKPj4+ICstLS0KPj4+ICskaWQ6IAo+Pj4gaHR0cDovL2Rldmlj
ZXRyZWUub3JnL3NjaGVtYXMvc29jL3NvcGhnby9zb3BoZ28sc2cyMDQyLXN5c2N0cmwueWFtbCMK
Pj4+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFt
bCMKPj4+ICsKPj4+ICt0aXRsZTogU29waGdvIFNHMjA0MiBTb0Mgc3lzdGVtIGNvbnRyb2wKPj4+
ICsKPj4+ICttYWludGFpbmVyczoKPj4+ICvCoCAtIENoZW4gV2FuZyA8dW5pY29ybl93YW5nQG91
dGxvb2suY29tPgo+Pj4gKwo+Pj4gK2Rlc2NyaXB0aW9uOgo+Pj4gK8KgIFRoZSBTb3BoZ28gc3lz
dGVtIGNvbnRyb2wgaXMgYSByZWdpc3RlcnMgYmxvY2sgKFNZU19DVFJMKSwgCj4+PiBwcm92aWRp
bmcgbXVsdGlwbGUKPj4+ICvCoCBsb3cgbGV2ZWwgcGxhdGZvcm0gZnVuY3Rpb25zIGxpa2UgY2hp
cCBjb25maWd1cmF0aW9uLCBjbG9jayAKPj4+IGNvbnRyb2wsIGV0Yy4KPj4+ICsKPj4+ICtwcm9w
ZXJ0aWVzOgo+Pj4gK8KgIGNvbXBhdGlibGU6Cj4+PiArwqDCoMKgIGNvbnN0OiBzb3BoZ28sc2cy
MDQyLXN5c2N0cmwKPj4+ICsKPj4+ICvCoCByZWc6Cj4+PiArwqDCoMKgIG1heEl0ZW1zOiAxCj4+
PiArCj4+PiArwqAgY2xvY2stY29udHJvbGxlcjoKPj4+ICvCoMKgwqAgIyBDaGlsZCBub2RlCj4+
IERyb3AgdGhlIGNvbW1lbnQsIGl0IGlzIG9idmlvdXMuIEl0IGNhbm5vdCBiZSBhbnl0aGluZyBl
bHNlLgo+Pgo+Pj4gK8KgwqDCoCAkcmVmOiAvc2NoZW1hcy9jbG9jay9zb3BoZ28sc2cyMDQyLXN5
c2Nsay55YW1sIwo+Pj4gK8KgwqDCoCB0eXBlOiBvYmplY3QKPj4gV2h5IGlzbid0IHRoaXMgbWVy
Z2VkIGhlcmU/IFlvdSBkbyBub3QgbmVlZCB0aGUgY2hpbGQgbm9kZSByZWFsbHkuLi4KPj4gdW5s
ZXNzIHRoZSBjbG9jayBpbnB1dHMgYXJlIHNwZWNpZmljIHRvIHRoYXQgY2xvY2sgY29udHJvbGxl
ciBhbmQgeW91Cj4+IHdpbGwgaGF2ZSBoZXJlIG1vcmUgZGV2aWNlcz8gQnV0IHdoZXJlIGFyZSB0
aGV5IGluIHN1Y2ggY2FzZT8KPiBJIGRvbid0IHNlZSBtb3JlIGRldmljZXMgd2lsbCBiZSBpbmNs
dWRlZCBsYXRlci4gSXQgc2hvdWxkIGJlIG9rIHRvIAo+IG1lcmdlIHRoZW0gaW50byBvbmUuCgpo
aSwgS3J6eXN6dG9mLAoKQWZ0ZXIgc29tZSBkb3VibGUgY2hlY2ssIEkgZmluZCB3ZSB3aWxsIGhh
dmUgbW9yZSBkZXZpY2VzIGluIApzeXN0ZW0tY29udHJvbC4gRm9yIGV4YW1wbGUsIGluIHRoZSBT
WVNfQ1RSTCBhcmVhLCB0aGVyZSBpcyBhbHNvIGEgCnNlY3Rpb24gb2YgcmVnaXN0ZXJzIHVzZWQg
dG8gY29udHJvbCB0aGUgIkdlbmVyYWwgUHVycG9zZSBJbnRlcnJ1cHQiLiAKVGhlIHBjaWUgY29u
dHJvbGxlciBvZiBzZzIwNDIgd2lsbCB1c2UgdGhpcyBpbnRlcnJ1cHQgY29udHJvbGxlciB3aGlj
aCAKaXMgZGVmaW5lZCBpbiBTWVNfQ1RSTCwgd2Ugd2lsbCBhZGQgaXQgaW4gbGF0ZXIgd29yay4K
ClNwZWNpZmljYWxseSwgdGhlIGRpc3RyaWJ1dGlvbiAob2Zmc2V0KSBvZiByZWdpc3RlcnMgaW4g
U1lTX0NUUkwgaXMgYXMgCmZvbGxvd3M6CgotIDB4MEMwIH4gMHgwRkM6IGZvciBzb21lIFBMTCBj
bG9ja3MgOgoKLSAuLi4uLi4KCi0gMHgyRTAgfiAweDMwQzogZm9yIEdlbmVyYWwgUHVycG9zZSBJ
bnRlcnJ1cHQ6CgotIC4uLi4uLgoKLSAweDM2OCB+IDB4M0ZDOiBGb3Igc29tZSBnYXRlIGNsb2Nr
cwoKU28gaXQgc2VlbXMgdGhhdCBpdCBpcyBzdGlsbCBuZWNlc3NhcnkgdG8ga2VlcCB0aGUgY3Vy
cmVudCBjaGlsZCBub2RlIAptZXRob2QsIGFuZCBpdCB3aWxsIGFsc28gZmFjaWxpdGF0ZSBmdXR1
cmUgZXhwYW5zaW9uLgoKV2hhdCBkbyB5b3UgdGhpbmssIHBsZWFzZSBmZWVsIGZyZWUgbGV0IG1l
IGtub3cuCgpUaGFua3MsCgpDaGVuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
