Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB87EE8FDD1
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 07:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bKXM1Na6DdCTwx6SvVUOw/85Hw+C2w3Q/a+C/h9QbrQ=; b=4OkOUxsOLA1ZLWdIL9Sn2GWp+J
	Ylwy6lPediDrK9K2Klvvh+wV/qe5OZuK3aNyMx3ljbDkAV2ggzOe6+BzxujCTQ85YD5LDKIFIhDZa
	Xl7Dn5JC8pD/w6188lgY8ng5lmux8ACixQY9J5PzKY6ekmbxkPn4UqXThkEkwJff+KtfmXGal4/Ai
	4+RRP6+wUGpDNYGbFN76V8clzX8IXiZjr5WiQ5T5dt7OgSB7uj73wAEPXX0/eBqWJN9V/uaCJo7nX
	tTpGISOaUP+SCak3oAoGNBhJQBEi9r+Ub4I661YNrpRN99rlvFe9XcQogCwAnLT6ZNItf/+BpFYvk
	3KDjizog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnvxW-00GX6X-1l;
	Wed, 04 Oct 2023 07:06:14 +0000
Received: from mail-maxind01acsn20808.outbound.protection.outlook.com ([2a01:111:f403:700f::808] helo=IND01-MAX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnvxR-00GX57-2y
	for linux-riscv@lists.infradead.org;
	Wed, 04 Oct 2023 07:06:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HhkodXDwy87hFD5VZ4Xc6Jnb0pXTrsCaCW5PXw8Ls3FVOgiVs3bWXKeFcRTEyd/+o9wA9j0vwl5tbAUlGvdrvYgswH/RKWmSiqRmQIQMjdKXx/m/xj0ONFnIooQpv6VBQpkMxgRBfKmm0SEWPC/xI2vl+l2pFrcqC6QyDH1KGJxsGWnkbg5OYjtMnb2xo6Gj659wAtszGHXlUhlE0+oQHdPh6nWPSTfwxaU5sKT2G5LbT0gYIRmoOGnQfMZ16eZsMjDezCP9LP9ezXi2lUWgNPlyXGgpcnzkmbCWBE9LniTi9Bmaogdl7QLukemMwAcrWvGF/Mt4phSPpM4tX5mjkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xEAmoCkEb3uv9hE7547pV45Hn0IwRQxY2PmeftrPutE=;
 b=FKHPL7OPPBJOu5oI17ZV6nlGH7je6PdJ8EYnlG+u9EdX1fD9zEa3J5rHJChTmjq1Frr5ZfQjLzhqia/EQ3xmnwqdHIzPkDycD7vpl8OSKPwdBQ69Qp0E7ey8277wGp+So9rQ+caDA26F6s4zpjF5FH0iU+HlbPZriVeDihsGybwNd+dLPuvXuoiq8sosPcqqCsmMF4SClpshja3ibutlEB8lKVNNboLyjUoTTIzyhQwQE/cGSAU402jXdRShjsk+nP8k6eJluP9RNyw4Ysy4TaxEmxnfclgZWSY1JN0WExjH1GpN0eRA698kHMvLRo/D2h7whRvbAh9auB+UNunfrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xEAmoCkEb3uv9hE7547pV45Hn0IwRQxY2PmeftrPutE=;
 b=WvpuEVxtRLPZY/INlMavWN+7DNW0+9eVa7MvnBeq92IBG7xd0FBtOfzCeR14WPEiQAZnr1l5xGMgntG/sM5QVQ90drPLGiNlzaQMfDGbVG4RvY9NNV/lAgSrlV4eRtBSnFna2DUfrZ9UvWRwkXZqqjEDrsK3P4uhqqCAYh49dXl5mPm3DSJzEzfB+5cqXTN/hPmIX86YpE7MMnLjwYO6kckaFgycuFdJrdxwFEQjSQeg0TamLNoU+ziURo+e8gT4I3nX3sYXZ8uk+xGfTrNRWibZ1Xlxwxi3ORGVSOjVE6ktEsBfq28DsnZp0Mw093QgyPlvQpQfWu8gt3IJBDC+xg==
Received: from MA0P287MB0332.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:ab::5) by
 PN2P287MB1529.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b6::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.35; Wed, 4 Oct 2023 06:50:16 +0000
Received: from MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
 ([fe80::efe9:8d54:281b:23f7]) by MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
 ([fe80::efe9:8d54:281b:23f7%3]) with mapi id 15.20.6838.028; Wed, 4 Oct 2023
 06:50:16 +0000
Message-ID: <MA0P287MB0332AF093C75B7712FA8AEA8FECBA@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
Date: Wed, 4 Oct 2023 14:50:12 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] riscv: dts: sophgo: add Milk-V Duo board device tree
To: Jisheng Zhang <jszhang@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Anup Patel <anup@brainfault.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, Inochi Amaoto <inochiama@outlook.com>,
 chao.wei@sophgo.com, xiaoguang.xing@sophgo.com
References: <20230930123937.1551-1-jszhang@kernel.org>
 <20230930123937.1551-6-jszhang@kernel.org>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20230930123937.1551-6-jszhang@kernel.org>
X-TMN: [dx3Ypcn0iAHjKS7PQFzamStSi/E20KCb]
X-ClientProxiedBy: SI2PR01CA0018.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::7) To MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:ab::5)
X-Microsoft-Original-Message-ID: <87effa78-7d9a-48e3-982d-e30b057f6ead@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB0332:EE_|PN2P287MB1529:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c27e667-4e23-42e7-ac83-08dbc4a62a66
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 40t5Deb3GZQZt4K2tIqM4zzMeN3Hmbx3b9ZiZMl1+41KK/eg6mXVVN09QyK81kazVs+/X9IqklrJ9PvtxEAE4uQGL1XDE7BpnbSUgKt/QyuXH4FNEOS/H2JBSfFGOKNs1gsiEwuMQwBHX10P9hEpYxpo3khcICFRR3UvBE6r388wP8ITpKuH0KwYoA0IL4mVeSexveMyxkk+8Ad2Cz88zqEik1my0ssBKItkc8V+N/RRcPRHnWEw3CAtmlnbH1CH3sfG6uVHBTujZhjJ/toNT5+EoWpC66kCMWq8jcek8oh1xqobPHhqTrGuj0skZKEtCKfTBTxZxC53Wft77d8ys1lDPK5oOOabtxqD84cS732EBA63xF0fHBGvhM91vwYEqg7FgEThkTtC123XbZCzmr1MQTGO/uVZiekhl+PDb2AuPLyOzNhovujRnayrlmIeu1Vol4rWqnj6k8lHpWpkPxlmj1+RWGyKYtlhtkjD3V/AHWOoc1eGrEeFaqh+rA/bM5VVxJBd+NyLOHXpkp+pokppE1jC88k+F1i/rwLr/ip1mHbTuSPa96D5HAI16CXOuQx0lGduP+0PlXZfSfmqsEcDGh7JzwNIj2sQ4iHYRPU=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGFLakpITmttM2grYytvd0IvTS9BQThuSFp4SHFFUVVGbTV5L3VhMnFVekNH?=
 =?utf-8?B?UkdLcjBiTnZ4UjEzU3VJVEl1UVl6bjQzQ1ZKU1RaTzZvYkZ3WVJsL3g0cFo0?=
 =?utf-8?B?c0ZWTVg0c3gzUzZQVU9Ja285SHh4SitRWElSV2lVR2xOajkzUjV6YjBIVi84?=
 =?utf-8?B?MUhiVVlzT3JpVnV6czdkSzFjUUhWa3plUmIvdDBkMHMxNk9MWHQ5dVQ5enRO?=
 =?utf-8?B?VGdGN2R4bGJHb2RXMWYxeXdiYVBUMVF4c0F0MXU3NjUxZ1ZiZnV4M0VaR0xZ?=
 =?utf-8?B?LzhuOEJZVWc2WW9TQW1FSkUvdjF0OFFGeVNZUU5CSVA3Z0owME96V3liNEdk?=
 =?utf-8?B?S3hobTFYeUJaN2pmZzdpV3hiZW85NUN0MzdwQW5Xem42cDVucnEzUjZxeFRl?=
 =?utf-8?B?ZkZ5djZyQ2pHbVJWKzZ5Ny9zUllyd2pBSnRxOWFQTkMyK3l6dmN1VzhyOTVK?=
 =?utf-8?B?eC9zWjRhZjRaR3B6ZkI4TGhkeTZPS1JlVGtLOWNTVzExalZ3ZlNra3lxOWZY?=
 =?utf-8?B?WEdUSDFTRm54cXptZ3ZWR2pZRk44QWdWQ08zMTZNV09tQW4xYVR4RFZXMTBC?=
 =?utf-8?B?RmtVN1V5MTFnaWZ1aVFkUS90cS9mam90WGlBa015bDhIYkk3WnlVNkp1bHV6?=
 =?utf-8?B?Y1ZHcXJtS1QzaGt6azFKOG90aFJldjJpaElIbVBVWWxQajZ5Vko5bmlCMWZ4?=
 =?utf-8?B?MWlsR0swWWNqSk5QOUwzK09GTk1SdUhGeFdWenQra2l6TS9weEZadWpNTlJB?=
 =?utf-8?B?bXZYRnlLVEZWM0xBUHBRbHpkM0Rvckc4TDFWbFBIM3lFVUEvbDhEaUZIVDZj?=
 =?utf-8?B?ZWYyUmtEdnZ2KzV1SmM4ajdOblBzYmZSdlV0cDlhV0JHU2daODZmT0VyVEtu?=
 =?utf-8?B?TjVPaDhPVG9HMm80SHREYmVtNWV6M2VrZHJuK2I4YVNFcDFQMi83RVdyRlpT?=
 =?utf-8?B?M2ZzTFVTRDJrTjJIbjlWU0ZjMzJaMlR4Q2w0VDllK3l3VzhHb0R3dmtkMkZi?=
 =?utf-8?B?QXlXcGplTWYycHZWOTRaWXdUVlpCL05pTDFGV0JHV1cxanJDb3d5Ukw0dmYv?=
 =?utf-8?B?dXRLeEJJemxGVFZLN3JnWklaVzNEM1hhVE16bkV4TG5iMkpLTlhiSDdjOXdF?=
 =?utf-8?B?Sk81S2NHWU1COUFaWU1CYzNSSnlCT0pxdXJzZlRNUHZuaDRtSUtKdGtOQ3dG?=
 =?utf-8?B?eFRLaHl3TWl4eW1QdlhaZGVtdnQxUCtSenlmYjZOOEVUSk05UENqKzFiNmZ1?=
 =?utf-8?B?Um1oSXFna3d3b00zY2l0MGhFQ2NzcXJ0b3h6RFNJdHNhUDgyM2MvVWlhMHFk?=
 =?utf-8?B?SnhIWEp1d1RQSjFKU1FQb01mTHpJbVpQY0VqUDdEVzMrclBFS1pLclQzS0RG?=
 =?utf-8?B?WDZ6VGw2ZGxmYWp4ckJiZFlDMjE5NDdSdG1vSElBeHRFdzZhTlo2UkREYkxP?=
 =?utf-8?B?MnFUVG5acTBScFZITnZXMmRhY0tsd01hMlEwMEVvQTJNT3pDd3J1a0UvcE90?=
 =?utf-8?B?Mkt6RWVtUXlLQ0d5ZSsvcmlDZ3VZT3Y2TUdpeGlacnVuTFZnd2puZjFZZ3Nh?=
 =?utf-8?B?OFh2V0dyeDVvbEJrU1kvWGJjV0U2amo4NjFhcnFld3gzdzVISUpWSzRsTjVy?=
 =?utf-8?Q?05jwrgq+JISHlYdOT47up0DVajlFwR4nESDjdt/urkug=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c27e667-4e23-42e7-ac83-08dbc4a62a66
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 06:50:16.2247
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB1529
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_000609_976377_BB377D86 
X-CRM114-Status: GOOD (  15.37  )
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

CuWcqCAyMDIzLzkvMzAgMjA6MzksIEppc2hlbmcgWmhhbmcg5YaZ6YGTOgo+IE1pbGstViBEdW9b
MV0gYm9hcmQgaXMgYW4gZW1iZWRkZWQgZGV2ZWxvcG1lbnQgcGxhdGZvcm0gYmFzZWQgb24gdGhl
Cj4gQ1YxODAwQiBjaGlwLiBBZGQgbWluaW1hbCBkZXZpY2UgdHJlZSBmaWxlcyBmb3IgdGhlIGRl
dmVsb3BtZW50IGJvYXJkLgo+Cj4gU3VwcG9ydCBiYXNpYyB1YXJ0IGRyaXZlcnMsIHNvIHN1cHBv
cnRzIGJvb3RpbmcgdG8gYSBiYXNpYyBzaGVsbC4KPgo+IExpbms6IGh0dHBzOi8vbWlsa3YuaW8v
ZHVvIFsxXQo+IFNpZ25lZC1vZmYtYnk6IEppc2hlbmcgWmhhbmcgPGpzemhhbmdAa2VybmVsLm9y
Zz4KPiAtLS0KPiAgIGFyY2gvcmlzY3YvYm9vdC9kdHMvc29waGdvL01ha2VmaWxlICAgICAgICAg
ICB8ICAyICstCj4gICAuLi4vYm9vdC9kdHMvc29waGdvL2N2MTgwMGItbWlsa3YtZHVvLmR0cyAg
ICAgfCAzOCArKysrKysrKysrKysrKysrKysrCj4gICAyIGZpbGVzIGNoYW5nZWQsIDM5IGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2
L2Jvb3QvZHRzL3NvcGhnby9jdjE4MDBiLW1pbGt2LWR1by5kdHMKPgo+IGRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9NYWtlZmlsZSBiL2FyY2gvcmlzY3YvYm9vdC9kdHMv
c29waGdvL01ha2VmaWxlCj4gaW5kZXggNWE0NzFiMTlkZjIyLi41ZWE5Y2UzOThmZjYgMTAwNjQ0
Cj4gLS0tIGEvYXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vTWFrZWZpbGUKPiArKysgYi9hcmNo
L3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9NYWtlZmlsZQo+IEBAIC0xLDMgKzEsMyBAQAo+ICAgIyBT
UERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAo+ICAgZHRiLSQoQ09ORklHX0FSQ0hfU09Q
SEdPKSArPSBzZzIwNDItbWlsa3YtcGlvbmVlci5kdGIKPiAtCj4gK2R0Yi0kKENPTkZJR19BUkNI
X1NPUEhHTykgKz0gY3YxODAwYi1taWxrdi1kdW8uZHRiClBsZWFzZSBhZGp1c3QgaXQgaW4gYWxw
aGFiZXRpY2FsIG9yZGVyLgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhn
by9jdjE4MDBiLW1pbGt2LWR1by5kdHMgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9jdjE4
MDBiLW1pbGt2LWR1by5kdHMKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAw
MDAwMC4uM2FmOWUzNGIzYmM3Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL2FyY2gvcmlzY3YvYm9v
dC9kdHMvc29waGdvL2N2MTgwMGItbWlsa3YtZHVvLmR0cwo+IEBAIC0wLDAgKzEsMzggQEAKPiAr
Ly8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wIE9SIE1JVCkKPiArLyoKPiArICog
Q29weXJpZ2h0IChDKSAyMDIzIEppc2hlbmcgWmhhbmcgPGpzemhhbmdAa2VybmVsLm9yZz4KPiAr
ICovCj4gKwo+ICsvZHRzLXYxLzsKPiArCj4gKyNpbmNsdWRlICJjdjE4MDBiLmR0c2kiCj4gKwo+
ICsvIHsKPiArCW1vZGVsID0gIk1pbGstViBEdW8iOwo+ICsJY29tcGF0aWJsZSA9ICJtaWxrdixk
dW8iLCAic29waGdvLGN2MTgwMGIiOwo+ICsKPiArCWFsaWFzZXMgewo+ICsJCXNlcmlhbDAgPSAm
dWFydDA7Cj4gKwkJc2VyaWFsMSA9ICZ1YXJ0MTsKPiArCQlzZXJpYWwyID0gJnVhcnQyOwo+ICsJ
CXNlcmlhbDMgPSAmdWFydDM7Cj4gKwkJc2VyaWFsNCA9ICZ1YXJ0NDsKPiArCX07Cj4gKwo+ICsJ
Y2hvc2VuIHsKPiArCQlzdGRvdXQtcGF0aCA9ICJzZXJpYWwwOjExNTIwMG44IjsKPiArCX07Cj4g
Kwo+ICsJbWVtb3J5QDgwMDAwMDAwIHsKPiArCQlkZXZpY2VfdHlwZSA9ICJtZW1vcnkiOwo+ICsJ
CXJlZyA9IDwweDgwMDAwMDAwIDB4M2Y0MDAwMD47Cj4gKwl9Owo+ICt9Owo+ICsKPiArJm9zYyB7
Cj4gKwljbG9jay1mcmVxdWVuY3kgPSA8MjUwMDAwMDA+Owo+ICt9Owo+ICsKPiArJnVhcnQwIHsK
PiArCXN0YXR1cyA9ICJva2F5IjsKPiArfTsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
