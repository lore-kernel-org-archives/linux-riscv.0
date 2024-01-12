Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF8CDC47077
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Jan 2024 00:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/eW0nc/P2z3WjOBelY7cXYn6a5eMw1baFq3qjZstBho=; b=J2/0dLZ+UqxG5bVMSECTX/v6P2
	5BhDTLORDYPQ/oWMn2mCYw0tOqlZr3OOJeuXnwVL8F8qkNDOsZ4GHeAHL/gUHD9x85/c8EfcjDGB1
	aLMguAP0Yb8/pvQ2Up6tq2FmEb2i4SO4aaMEKcs4iKU7R7PG8xT/HfUMq1SIjEqhhWv09lItCBaSV
	Ci3OZLNdkeTTgIOpYJ4gM9jmvkTCX0JVAm4sdb+VJDyl3KDMZA46xJzqbAiJkUjzr2XP9067c7VhD
	eG7rqKp/Nj5VmlgtGPm90MHXXUCtqMpfIx4gtbNuI6xOpj0X5RJUt0BnopURYt1XKyrg/4kcs0mpD
	zkhNqYyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rO56P-001Wr6-2f;
	Fri, 12 Jan 2024 00:08:49 +0000
Received: from mail-maxind01olkn20800.outbound.protection.outlook.com ([2a01:111:f403:281b::800] helo=IND01-MAX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rO56N-001Wpo-1P
	for linux-riscv@lists.infradead.org;
	Fri, 12 Jan 2024 00:08:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UNe7P51xiotUYISj5QbJm7cf7PrgWATpDO9UqnAQZF7EH+JebSgY0Fral9RhCOL/A+wJ2ONCcEbDKmESJbVo1TYluDYUenLLdxadhJhLPpp61qN5RO9hIOa7UzfL9ciXGbbDfCSthxXnYk1eN8jUG+jpFZPNAbzn1L8/rvmARw0ueUq9odKpMvUQj61y/1Ebh2M3keEt5xqYit2AoumLcc0A94MU/BeHdDF/dGflFzta4gm41vLV2fXuJt5Nyz9so+K+aQUUtd2rvmu2+qFQPreOz22nCjtchM7c8x8HoYfZj0Bp7RTmabynMwTk1HBo0CTBBSQFjl23JPI+bpLIJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S9kVQZnXE/uUOfQbQSwcJbg26xZPeHWzcal4YdTT9Ro=;
 b=OpSPJRiwnrcigUwK72d/xxRu6V+aFR9eIyJZ5DzDVtNFniJ7F7qu8Pwn1cdafp/HBBcZ15Tm/b4n09ntJhX/T15MqeHLSx7gwvAma3r/RdjAj8Z7SOElnh6oqmd+TduoZrabh+l11VyQ7LY82IBB10C57yAibGfitcstiaPpevdHrB3zbz/usgZNdT47ijVrc0tyudF3dWBfrLuvhqVnbHdgkKfy7if6ofIXgEMlFtjim4yjm9Kn3dahKXWl/hlEY+vURqv28mhjXcAQpfdgc3Fsh9VSSfZSVUgu1WIyae0JoXWMuB7Kyixp4TxrBH4La56D/3KuCztxO8xMqhFeVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S9kVQZnXE/uUOfQbQSwcJbg26xZPeHWzcal4YdTT9Ro=;
 b=U8+Sx7ovNLzKwQX1lY9cji3dA3Rg58O2d4uDWZuXu+DIh4zBrzfHJ3SvLc97WyfAU82HI8M/EMQfUhwHFci5MhI5MspnyGop+loHmJHgmUVeEQu1eLZMm+PKWAL15sKirfjH2LQP6qxWahUQuBmF947qE17jeblt/W2deQgOMu7saOqC8uLiRSOlTOuFPr06mcvhOWLnyPqESOdCa6839miCiGSOL8OJoS2WZH7hX/z7vOSSqqPWBhqN/T5feNgASc1aYUhCMva6QDvzKjW5tUtmuMChTCUoac7/ltggFvLthLhKTfKUHPYs3UU1BmXOFXyW7BgQeo2RwFCLnoXcWg==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by MA0P287MB0436.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:cc::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.21; Fri, 12 Jan
 2024 00:08:20 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::6e80:69e1:f2e7:d70d]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::6e80:69e1:f2e7:d70d%3]) with mapi id 15.20.7181.020; Fri, 12 Jan 2024
 00:08:20 +0000
Message-ID: <MA0P287MB28229BCC9EA83507B99A9F3BFE6F2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Fri, 12 Jan 2024 08:08:15 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/4] dt-bindings: clock: sophgo: support SG2042
To: Conor Dooley <conor@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Chen Wang <unicornxw@gmail.com>, aou@eecs.berkeley.edu, chao.wei@sophgo.com,
 krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
 palmer@dabbelt.com, paul.walmsley@sifive.com, richardcochran@gmail.com,
 robh+dt@kernel.org, sboyd@kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, haijiao.liu@sophgo.com,
 xiaoguang.xing@sophgo.com, guoren@kernel.org, jszhang@kernel.org,
 inochiama@outlook.com, samuel.holland@sifive.com,
 Conor Dooley <conor.dooley@microchip.com>
References: <cover.1704694903.git.unicorn_wang@outlook.com>
 <925d99d5b4ece01337cb3389aaea4b631894dd1d.1704694903.git.unicorn_wang@outlook.com>
 <f88b79c3-e44b-4136-ae56-10e1f2502e2d@linaro.org>
 <MA0P287MB2822C7A3C1DC7786708E860BFE692@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
 <20240110-untoasted-underfed-fe81479506f6@spud>
 <MA0P287MB282224A6097B4FCCF721C89AFE682@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
 <20240111-jolly-prize-930931cc648a@spud>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20240111-jolly-prize-930931cc648a@spud>
X-TMN: [7Ro8edSJX28TDvykVjkNY3YOxshrW1Y9]
X-ClientProxiedBy: SG2PR03CA0091.apcprd03.prod.outlook.com
 (2603:1096:4:7c::19) To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID: <e4a18848-4f1d-456a-8eaa-dc5b2168ad13@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|MA0P287MB0436:EE_
X-MS-Office365-Filtering-Correlation-Id: 16127ebf-f67b-42bd-39fa-08dc13029493
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VR9SD13ptM95FuVFBHrHCKrYdwNzUATsuRLslMOJk2yaCDuKPHuXLzmRsgVaQXP50ec0LTmaFycERw9hM2ofaBZ8u4A9uUZ6UEsuvY64uycfglL+omuKVYqYNA5WqxXJf16A6v4tC0vlvaM/ebEvNqkSMN8Dq5Ov00CkUpoR8AoMfS1sSF/WI0CW3IBJ9ohB0fw6/7K7MgDq6faDNwUC4QuWJ1lDdqRjJbYPFWhHBHTxViP6bTE3qG2dYsaVtIDoV5dJICK0xm/XE0b2ue5rZwCBXt3Y96PTV8MGN0Mv5uFqvI4PaAC9LxWgDL1NYPtsaZHIJACXLpoi1Kcii+wqtWxw+nOkVkVh4kcM7GYUsicbA/IahM/TLFRJBA0ZBYXQY6qwmPT0Nv+4rxEFDCm6jsRruAxusxR3PLm91IWMb+YbjMmeiDKY+mLDhgG3vb49NGEgoavM56aj3EuNA1QrtQ+BhMWH+VX/PgJbyS8fGGRkirsEXLENezbaBScIX73siVTcR+exLq1bYcnuUiUgWVxQP/h5izPdqgktjdYa2PCl5LpqKelI6WlNDpLz/zUB
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?REFHS0NEdXpGT0xrK2NGem04WDRKYXNSUngydXdEVU1QZUFrYUVlYmJIczd2?=
 =?utf-8?B?VnZSNkRIKytnMFlXM1hXK29rY29FSnNKODlUZS9xb29vNXZVb3kzbUlIOFdX?=
 =?utf-8?B?R1ZEWWpxQWtsSmRrYkRsVHlHY3RoeUdybmp1ZjRNc0ZnYVJaS0t1dGgzZmVK?=
 =?utf-8?B?K1JjL0xYU2tLOCt2MDZLTG9WWFB3QmlsU2NjVTZqR1J5VXdLWXdsZm1zejkx?=
 =?utf-8?B?KzF5eDVzR3doMTN4c1crMm5RNUZ5cTNMd29RSTNVMkJsNTdUL2FLYkVNelh6?=
 =?utf-8?B?YlFDVmZuWTR5WFdPcFdKTHNNbzVQbDB1TUxlQk8yeEF3TTlvZnJZZjB5SzV4?=
 =?utf-8?B?dEl0OVplM0VCdEU1dThnMlltR2pLeTY4Ui83Uy9ycTQ1MGlaaTNnaktRUHJQ?=
 =?utf-8?B?VkZhRmtDbFdSNlNMcFB6bmJkekFRR3BudkIwWTRKc3JFZEtWdnBwRTdhTEN4?=
 =?utf-8?B?OExHa2lPaUt3SkRGcU1idnZtTi9UczVIQnFNcHhYQk01ZGdOOWJmRWg5Vlow?=
 =?utf-8?B?c3Y3MHFmcjZ3eFpTZlZEeEs4cEozSDhGeEtKTjl6NGpjV2FaYXJkR1pqTjNU?=
 =?utf-8?B?QzdIbm42aVdySkFkK3gyVERLa2pFWHBXM1dGa0lGQ1Z4OWROSVNpZzZOSjd1?=
 =?utf-8?B?QmlmL25oeHZrWkZ6SlJWeFUxVjlJU3FGSmFqME1OZkhjWnpqQ3FpV2o4SE1t?=
 =?utf-8?B?bmYxMmpwUStRVng3Wnk2cEU0UnREVHpJUTFRd1pSY1kwcjQrRUV4WGc4blAw?=
 =?utf-8?B?S0duU0NDTDBrL0ZZeE9hWE81d2ZSVFllRlUyM0hFWi90VGZQYUtTcUJQN3B2?=
 =?utf-8?B?SU10MkFYOFVaM3M4MmI0Z0pWVjdJR3NNYVJRbk02MmhheGR0dzZMTzJoc0ZK?=
 =?utf-8?B?R2wzbkpEb1BVRTlyKytCbysweDJzUmpWZVNTVVRocHA5S2FaakcrTDQ2R0Ja?=
 =?utf-8?B?MVpxeXNydkZ6NFB0cUpFc1o1aUVmeTdHb0VBejliZEZscGFLR0k2SGhIcThK?=
 =?utf-8?B?OTRrR3VsVWtPZWliaUFOaEE2Yk95eVlIeS9Fb3d5YnJpdW5odlFRQkg0QkxM?=
 =?utf-8?B?b2t6TElzNDI0bDV2VmxDekJnYkg4MU1wanNuOUptZHBlc3Y3V2xIZTMwd0oz?=
 =?utf-8?B?bGFkYUlRandHSms2a2VNVHpRandwaXFkVGs5ODRIeXRqQkV4TkRjYno4QjdF?=
 =?utf-8?B?YlczVTBaUlBkTTh0RW91UlVIdDRvVkl5UVVidE1FRk9HRE0xUEl0M3RTYSth?=
 =?utf-8?B?bWcrUVJVeVdFZnAyU3dkOG5ETFNJUlFna0tLQ1FQZFRBRUV4ekpvcDVvdjFv?=
 =?utf-8?B?aWZ1N0RxNkp1YUNsY3pNZndDVFQzblFxcWtORjQvRzNYTHZyYUNpMlNGUy9T?=
 =?utf-8?B?eWNXR01oYUhhdGs0Mk5JRVJiZ3pYZ0VRdXJMTXZ6UlVXdzd6eVFsYmFzaitl?=
 =?utf-8?B?WElqSTZyUjlNUmo5dHRxMU1lYVBFaDA3N3JmbjVKYUZPQjFNVGc1cEtiM3pi?=
 =?utf-8?B?Q3JuZDlhck9ISVdQc0crOUtRSFF5Tms1TURaeUsxejQzd3hMeVM2QU4wT2Vx?=
 =?utf-8?B?VlpDMUpPUFJEcHJVODZ3bGl1NGszTXp3THZNbm5BVTZvUmFZMTg1WVZJVk5U?=
 =?utf-8?Q?ZvsZkVajzQ9FQHxbdRcq/uY3Rc+5y9dw36MDhkSOH4ok=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16127ebf-f67b-42bd-39fa-08dc13029493
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2024 00:08:20.3171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB0436
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_160847_512766_42098743 
X-CRM114-Status: UNSURE (   6.82  )
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

Ck9uIDIwMjQvMS8xMiAwOjU4LCBDb25vciBEb29sZXkgd3JvdGU6Cj4gT24gVGh1LCBKYW4gMTEs
IDIwMjQgYXQgMDQ6MDA6MDRQTSArMDgwMCwgQ2hlbiBXYW5nIHdyb3RlOgo+PiBoae+8jENvbm9y
77yMCj4+Cj4+IFRoZXJlIGFyZSBmb3VyIHR5cGVzIG9mIGNsb2NrcyBmb3IgU0cyMDQyIGFuZCBm
b2xsb3dpbmcgYXJlIHdoZXJlIHRoZWlyCj4+IGNvbnRyb2wgcmVnaXN0ZXJzIGFyZSBkZWZpbmVk
IGluOgo+Pgo+PiBQTEzvvJphbGwgaW4gU1lTX0NUUkwKPj4gRElWOiBhbGwgaW4gQ0xPQ0sKPj4g
R0FURTogc29tZSBhcmUgaW4gU1lTX0NUUkwsIHNvbWUgb3RoZXJzIGFyZSBpbiBDTE9DSwo+IFdo
ZW4geW91IHNheSAic29tZSIsIGRvIHlvdSBtZWFudCBzb21lIGVudGlyZSBjbG9ja3MgYXJlIGlu
IFNZU19DVFJMIGFuZAo+IHNvbWUgZW50aXJlIGNsb2NrcyBhcmUgaW4gdGhlIENMT0NLUz8gT3Ig
ZG8geW91IG1lYW50IHRoYXQgZm9yIGEgZ2l2ZW4KPiBjbG9jaywgc29tZSByZWdpc3RlcnMgYXJl
IGluIFNZU19DVFJMIGFuZCBzb21lIGFyZSBpbiBDTE9DSz8gSXQncyB0aGUKPiBmaXJzdCBvcHRp
b24sIHJpZ2h0PwoKSXQncyB0aGUgZmlyc3Qgb3B0aW9uLgoKPj4gTVVYOiBhbGwgaW4gQ0xPQ0sK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
