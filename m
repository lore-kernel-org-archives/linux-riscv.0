Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D339C4167B
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Dec 2023 05:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9FGXTnnN+NbL4OG5nucmsCEJhpYeIRPcNGq1Fr1tMMA=; b=tlQKTIo91NoTMANItIma7eXKcs
	C7NhbGfkbprg2XsmdyAEU4ffoq6Sgk59GNsiFtiFMpTNLaRoINkeMAIFboI3u75TTCqamHS5MO9ND
	KEWfCoizm7CMQN9PuDWn+BknopMwdRwzjpBWoIXoyqJXI84TuTEKHmSQiXRbT2kDsmHOr0zhetU3U
	yMa5GHLnOuJVuKpvXkZjhqAZ+miEYrP7EiI51kMuEmbNWLQPokk9CtrPD7CZ73gDE3V2m+uoLH0/H
	qlcEsqvY4ESH+7bUK44q5UcFKZ27R25DaPemtu3fpKaKYlTWgr7j9mL6qYU8Doix0Vs0cxCjuIQMP
	3l4GNlTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAO6Y-006Jvu-0F;
	Tue, 05 Dec 2023 05:36:22 +0000
Received: from mail-bmxind01olkn20801.outbound.protection.outlook.com ([2a01:111:f403:281c::801] helo=IND01-BMX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAO6R-006JuV-1P
	for linux-riscv@lists.infradead.org;
	Tue, 05 Dec 2023 05:36:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qn2+G48cjt2Wa9O3TmkfWCiBDTtwSMtGqv76WfKA6PSHbFbqqqvJyi23J47EPxkEkGfEpOP0EwGrEFpG30nhL++VQ+DzRPbLwpp1QNgF98MJf9SXjPgDETxDNuWjITd5GVeXXZpF27TRfDUtcLXvI6/Pr2ebQ/221ClUgQOS/bzmrxppHVt7WCY4vELDY6q+bonB8iMZGiBmVa9y3Tz5OScRsb1FmtIvymS01DhQVtXh4WDK0tkQKHBkK0LvLCmzaod1LTPdfmrF4kJmZ1qb3xjknCc2DTBNfxKfUWtIfnlbeDQ6KfSW/8ccJRRz+fPgzGdK04aZ1ysjBL3FDCP2ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9LyD8TxeK9QC4uvDhMRO4bEj18VIqFR+zp5cNEbI+Q8=;
 b=Sgk4FcGQ3k+Dd5N8eOpQ2TLf+tXt4rI86S18VSnETZaurEdLnD6TPMScl2cU6DMp5hQbkHU5IMO0ksPTvnIvOsps9qfpToOhH50/Ssi/xOjZlTrz6voijLR/sLOCGS45Qyz4chGTNAFPbwskDYDPLZLuG2tmOJvJORiVJB00Ol/0aFCkt2iG0oyBCQ5VdnlcCkCyhPFgH8IF21O/9oceoYOnLcF1TQBL/Ng+lM8dNHwpCVHJ13K3l5spmBcmSo7Xx63OGVwXTXR23yH642I8rtT7+K0P8J5qyxYHwTDfkH2FKFjhzLQkJhNYb49JRDQggNiC3EMUFicAWT5X6cma5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9LyD8TxeK9QC4uvDhMRO4bEj18VIqFR+zp5cNEbI+Q8=;
 b=Tz8jVGk9wMztuHjpvUfSSHG1gE6IjvWb/3wGKxU1kDY/N366gBzHavdWMS4HkHK+WcqDi5ESZJe1Z7N3OJMkJ+xfeLOHIInm3pCgIJCsribAiRJ6T50GtJKZoIMTgf1kuyNVONTLe+e/1kCcoLqHydhbrYs+U8BQ8hg+YR8mxX9qz/NuHwdGx4U1zhiEC/mYL8fgz5iocp/3W8//1caEkxI+FftnqntjFoNChLi5Jck27w2c4kxoadrHqu9Rkwck7im5aLeLB6p6GIN8lPJ8xBhdALQjyiqoT/3cugeXZ3kWHUZLQm6zPryNjq8TT373jjShD37GRBBwUAnKie1WPg==
Received: from MA0P287MB0332.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:ab::5) by
 PN3P287MB1847.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:19d::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7046.34; Tue, 5 Dec 2023 05:35:54 +0000
Received: from MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
 ([fe80::b1a7:eee7:e903:9ef3]) by MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
 ([fe80::b1a7:eee7:e903:9ef3%7]) with mapi id 15.20.7046.034; Tue, 5 Dec 2023
 05:35:54 +0000
Message-ID: <MA0P287MB033276574107F5031C153DDDFE85A@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
Date: Tue, 5 Dec 2023 13:35:48 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] clk: sophgo: Add SG2042 clock generator driver
To: Inochi Amaoto <inochiama@outlook.com>, Chen Wang <unicornxw@gmail.com>
Cc: aou@eecs.berkeley.edu, chao.wei@sophgo.com, conor@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
 palmer@dabbelt.com, paul.walmsley@sifive.com, richardcochran@gmail.com,
 robh+dt@kernel.org, sboyd@kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, haijiao.liu@sophgo.com,
 xiaoguang.xing@sophgo.com, guoren@kernel.org, jszhang@kernel.org,
 samuel.holland@sifive.com
References: <50302e6035a9a83b002d51e21d39d3890d27290c.1701734442.git.unicorn_wang@outlook.com>
 <IA1PR20MB4953C3278ABEA3B840C11712BB85A@IA1PR20MB4953.namprd20.prod.outlook.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <IA1PR20MB4953C3278ABEA3B840C11712BB85A@IA1PR20MB4953.namprd20.prod.outlook.com>
X-TMN: [AI7Q7sUt81d4CL8FPu6XmIuNP8cthvfj]
X-ClientProxiedBy: SGXP274CA0013.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::25)
 To MA0P287MB0332.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:ab::5)
X-Microsoft-Original-Message-ID: <eb7b3717-8d23-4d25-bce1-6e3e060cbf7f@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB0332:EE_|PN3P287MB1847:EE_
X-MS-Office365-Filtering-Correlation-Id: ab432cbb-313b-4065-198e-08dbf5540c61
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AkBQ9iaSb4asw3QX0eTWiv5i6QSIvwET5/1kDZTSPGrVZ1iagSZD7IvWy+5G4Dlum59bCA423GDmeonFao6jvT6eEGRE2bFuCxs74TK7BALW7zvGy2wPfDUHBPVvxI1NM8s3kx39hvIl6rON5RCf72ZPmX5y4l3UWfMqBfigG2Avq0k29/z1MQKFUNmRHqE7x/hgnNbRiVbAtiXBSy9cPf1XIuvJWJIC8Xy66EoCqoUbt73pdhgLvg7OnubU85BSIIC4JMrMSBL+9bQ89so9+V1UsvPsGKg6zIZe7ldpY8zsPlWwCuKR/CcmUfA5xZe1WUEWrdNteV8BEI6Q+GgdXStsCiTz6fEVQvY1qiRdtlGXWGg6sqP8Kfb4nWDcGy/1RjYtItdKFqz5slC8UKq4/5z9PKcQSKcNJwKd0gIGHfIqqREUgiAqeQENqqP1y+CUQ7G+CPxIzwgp0MISmuvzI//GEVVwua67djw5O9UskLSjJtD0o3MtFLf7o77jW5LLwSHta7/9qdjRaAnVp6chdOMX9UY4jp2Bx2bQGr+lUg5c6c5l+qNWjm+D+J9OKVyD
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a2RjcVd4SEpjUkFaTUFBVmlrZVg2L0JiSlFqMWdRQ0Fac01PNEJvMXUzSmp5?=
 =?utf-8?B?OTBjaXpnUTJEdStNam5tRW90VmZ2a1cwZFo1elYxR1pBS3l6Q200am52ZWZl?=
 =?utf-8?B?RWdPR2gvWXJqMzJBOXYvZkRmczZNL1JnY3VRRkRMYXlZNUx4VFRhZTZTbDlW?=
 =?utf-8?B?UXdnM0tSVlM4M1M2aFVOMHYyZm5iaS9oN2FlZHpkZ0hFRUpaTVpzYUdRMUs2?=
 =?utf-8?B?cWQzVFdmMTRDdjNOczlqZU9tTHNvQmt2c21QRnRES1o0cnJFbi9WNzVjek85?=
 =?utf-8?B?RnYxL0FFdndGY2hZYkdWQ282SVRxL1ZPRURwaGVtd3BYd3UyeEJIbW5wYXdk?=
 =?utf-8?B?dkgwWStjWm9HNFlmM3NVdnFIbWROOStIbWRGTWs5aG1FNHFhNmtIVjYxRHFZ?=
 =?utf-8?B?aG1UekxXV2lUWFA4eGxaRDhQbUg3YXh0VTRuZzZlUjRDK3UwZEU5VEh1cWls?=
 =?utf-8?B?QUo1bXZwWUdWdmJaOGwvL056bXZmTkRVbWRsQi9pVWdxVUdTV1NnWHNreC9Y?=
 =?utf-8?B?MVgySGszZ0xlaVpWWmJ4MGlab1dURlozdTRMeEhKZFYzT0FGc09vUDNJQ3ly?=
 =?utf-8?B?TDRSb0lmNngzQTJkeTlZRXlMMVZ1YjF1WGpSak45L25kcmhucFZLbEEyZ0ZN?=
 =?utf-8?B?Tm5NS0tnNVArUC9tWUZrckdkS3k5ZkJ1ay9Tb3hOeXhNWmlSZGl6cG92dHA5?=
 =?utf-8?B?NlhNaGdUUGZtS0NyRnVSR1VzcGtCREtFbnNUVWJJbjhSNUhpa0x5dURiakJt?=
 =?utf-8?B?OWhGMFVhZFAzcWtEaGJTa1Rwbmo0cHl4R2lac3ZNcTlwR2lNQ0FiQmJIb0hq?=
 =?utf-8?B?c1dQaXMvN1poV2dKbVlBMStiSnprTU9hTTdiTHBla2lSV3dSNHZYMFVxU3E0?=
 =?utf-8?B?S1BHaGxLd0hDV1ZRTkNMV3VueGR3NUJIckdBbWt5L1Rtd2k2a1FxdWtwZERp?=
 =?utf-8?B?Nk1KYklEdGh5V2QySzhReGw1Zkh3N282V21NQ3hMQklmYVljbzRhSmJTQW84?=
 =?utf-8?B?RGRhZ25xcUpMbU5ZNG1aUWZKQlMzcHA3NWpLUlNKZWtVNnlPWCtpWC9VZTgw?=
 =?utf-8?B?YW9rYXJXdzF1ZHFTQjRuZ0tJeXNQM21mY2hzM0ZMUjFJbmtTaGtCZklEdTVT?=
 =?utf-8?B?dUIyTEpVWUZ5dEpWa0JDR0tvWDBnWnpJY3JnUDFFNEVlKzFiSWRCYThvYkxi?=
 =?utf-8?B?QkRYcm5TRnlkNFdLTERxVW1xa3F1dFp1MlhJYUpiZktFZWxwWUpqaTBueWVX?=
 =?utf-8?B?WERMZlJkQktlR2ZXMWUyZmlZakZsUVJVenByZGZBcnRMYzhSL2tZRkJyM0FG?=
 =?utf-8?B?SVVpdUJKUWpnbHpTc3krYzdGeHRLeGZoMk53WVRDbDlBVjdGeG4zejdMejVP?=
 =?utf-8?B?ek8zS0FXTi9hWTQ0NERXTUhSL1JDQ1c5YjlhNzN3S003QW1OTUtlUW5kN1dU?=
 =?utf-8?B?SEs1eVVhM3dzUStaRytoZFVLb2hXZEZKTVRWOHV3T0gwcGlhNHF4b0ZtUThU?=
 =?utf-8?B?TDR0OWJ0cnVIVkJRVjNWY2xNcEdoVzNWbklUZHB1QU0vQ3Izbk94OUZtQ0ls?=
 =?utf-8?B?WGxBcStVYk54S2IzcG16UU52V0JJTjNhS01rYklWOVNjdFJ5dlpYQlJBR2Zw?=
 =?utf-8?Q?6Z1VmTdYoCjAIK3uhnSZMha7ZSuCgY9+Sg8XewSx+hC0=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab432cbb-313b-4065-198e-08dbf5540c61
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2023 05:35:54.4483
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB1847
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_213615_705747_C5ECBA8E 
X-CRM114-Status: GOOD (  16.50  )
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

Ck9uIDIwMjMvMTIvNSA5OjEzLCBJbm9jaGkgQW1hb3RvIHdyb3RlOgo+PiBGcm9tOiBDaGVuIFdh
bmcgPHVuaWNvcm5fd2FuZ0BvdXRsb29rLmNvbT4KPj4KPj4gQWRkIGEgZHJpdmVyIGZvciB0aGUg
U09QSEdPIFNHMjA0MiBjbG9jayBnZW5lcmF0b3IuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IENoZW4g
V2FuZyA8dW5pY29ybl93YW5nQG91dGxvb2suY29tPgo+PiAtLS0KPj4gTUFJTlRBSU5FUlMgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAgICA3ICsKPj4gZHJpdmVycy9jbGsvS2NvbmZpZyAg
ICAgICAgICAgICAgICAgICAgfCAgICAxICsKPj4gZHJpdmVycy9jbGsvTWFrZWZpbGUgICAgICAg
ICAgICAgICAgICAgfCAgICAxICsKPj4gZHJpdmVycy9jbGsvc29waGdvL0tjb25maWcgICAgICAg
ICAgICAgfCAgICA4ICsKPj4gZHJpdmVycy9jbGsvc29waGdvL01ha2VmaWxlICAgICAgICAgICAg
fCAgICAyICsKPj4gZHJpdmVycy9jbGsvc29waGdvL2Nsay1zb3BoZ28tc2cyMDQyLmMgfCAxMzcx
ICsrKysrKysrKysrKysrKysrKysrKysrKwo+PiBkcml2ZXJzL2Nsay9zb3BoZ28vY2xrLXNvcGhn
by1zZzIwNDIuaCB8ICAyMjYgKysrKwo+PiA3IGZpbGVzIGNoYW5nZWQsIDE2MTYgaW5zZXJ0aW9u
cygrKQo+PiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9jbGsvc29waGdvL0tjb25maWcKPj4g
Y3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvY2xrL3NvcGhnby9NYWtlZmlsZQo+PiBjcmVhdGUg
bW9kZSAxMDA2NDQgZHJpdmVycy9jbGsvc29waGdvL2Nsay1zb3BoZ28tc2cyMDQyLmMKPj4gY3Jl
YXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvY2xrL3NvcGhnby9jbGstc29waGdvLXNnMjA0Mi5oCj4+
Cj4+IGRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTCj4+IGluZGV4IDk3ZjUx
ZDVlYzFjZi4uYzljNzU0NjhmMmNiIDEwMDY0NAo+PiAtLS0gYS9NQUlOVEFJTkVSUwo+PiArKysg
Yi9NQUlOVEFJTkVSUwo+PiBAQCAtMjAyNjksNiArMjAyNjksMTMgQEAgUzoJTWFpbnRhaW5lZAo+
PiBGOglhcmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby8KPj4gRjoJRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3Jpc2N2L3NvcGhnby55YW1sCj4+Cj4+ICtTT1BIR08gQ0xPQ0sgRFJJ
VkVSCj4+ICtNOglDaGVuIFdhbmcgPHVuaWNvcm5fd2FuZ0BvdXRsb29rLmNvbT4KPj4gK1M6CU1h
aW50YWluZWQKPj4gK0Y6CURvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jbG9jay9z
b3BoZ28vCj4+ICtGOglkcml2ZXJzL2Nsay9zb3BoZ28vCj4+ICtGOglpbmNsdWRlL2R0LWJpbmRp
bmdzL2Nsb2NrL3NvcGhnbyxzZzIwNDItY2xrZ2VuLmgKPj4gKwo+PiBTT1VORAo+PiBNOglKYXJv
c2xhdiBLeXNlbGEgPHBlcmV4QHBlcmV4LmN6Pgo+PiBNOglUYWthc2hpIEl3YWkgPHRpd2FpQHN1
c2UuY29tPgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvS2NvbmZpZyBiL2RyaXZlcnMvY2xr
L0tjb25maWcKPj4gaW5kZXggYzMwZDBkMzk2ZjdhLi41MTQzNDM5MzRmZGEgMTAwNjQ0Cj4+IC0t
LSBhL2RyaXZlcnMvY2xrL0tjb25maWcKPj4gKysrIGIvZHJpdmVycy9jbGsvS2NvbmZpZwo+PiBA
QCAtNDk5LDYgKzQ5OSw3IEBAIHNvdXJjZSAiZHJpdmVycy9jbGsvcm9ja2NoaXAvS2NvbmZpZyIK
Pj4gc291cmNlICJkcml2ZXJzL2Nsay9zYW1zdW5nL0tjb25maWciCj4+IHNvdXJjZSAiZHJpdmVy
cy9jbGsvc2lmaXZlL0tjb25maWciCj4+IHNvdXJjZSAiZHJpdmVycy9jbGsvc29jZnBnYS9LY29u
ZmlnIgo+PiArc291cmNlICJkcml2ZXJzL2Nsay9zb3BoZ28vS2NvbmZpZyIKPj4gc291cmNlICJk
cml2ZXJzL2Nsay9zcHJkL0tjb25maWciCj4+IHNvdXJjZSAiZHJpdmVycy9jbGsvc3RhcmZpdmUv
S2NvbmZpZyIKPj4gc291cmNlICJkcml2ZXJzL2Nsay9zdW54aS9LY29uZmlnIgo+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9jbGsvTWFrZWZpbGUgYi9kcml2ZXJzL2Nsay9NYWtlZmlsZQo+PiBpbmRl
eCBlZDcxZjJlMGVlMzYuLmFhNWQyY2YwYjZhNiAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9jbGsv
TWFrZWZpbGUKPj4gKysrIGIvZHJpdmVycy9jbGsvTWFrZWZpbGUKPj4gQEAgLTExOSw2ICsxMTks
NyBAQCBvYmotJChDT05GSUdfQVJDSF9ST0NLQ0hJUCkJCSs9IHJvY2tjaGlwLwo+PiBvYmotJChD
T05GSUdfQ09NTU9OX0NMS19TQU1TVU5HKQkrPSBzYW1zdW5nLwo+PiBvYmotJChDT05GSUdfQ0xL
X1NJRklWRSkJCSs9IHNpZml2ZS8KPj4gb2JqLXkJCQkJCSs9IHNvY2ZwZ2EvCj4+ICtvYmotJChD
T05GSUdfQVJDSF9TT1BIR08pCQkrPSBzb3BoZ28vCj4+IG9iai0kKENPTkZJR19QTEFUX1NQRUFS
KQkJKz0gc3BlYXIvCj4+IG9iai15CQkJCQkrPSBzcHJkLwo+PiBvYmotJChDT05GSUdfQVJDSF9T
VEkpCQkJKz0gc3QvCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9zb3BoZ28vS2NvbmZpZyBi
L2RyaXZlcnMvY2xrL3NvcGhnby9LY29uZmlnCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+IGlu
ZGV4IDAwMDAwMDAwMDAwMC4uYjBmYmU0NDk5ODcwCj4+IC0tLSAvZGV2L251bGwKPj4gKysrIGIv
ZHJpdmVycy9jbGsvc29waGdvL0tjb25maWcKPj4gQEAgLTAsMCArMSw4IEBACj4+ICsjIFNQRFgt
TGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCj4+ICsKPj4gK2NvbmZpZyBDTEtfU09QSEdPX1NH
MjA0Mgo+PiArCWJvb2wgIlNvcGhnbyBTRzIwNDIgY2xvY2sgc3VwcG9ydCIKPj4gKwlkZXBlbmRz
IG9uIEFSQ0hfU09QSEdPIHx8IENPTVBJTEVfVEVTVAo+PiArCWRlZmF1bHQgQVJDSF9TT1BIR08K
Pj4gKwloZWxwCj4+ICsJICBTYXkgeWVzIGhlcmUgdG8gc3VwcG9ydCB0aGUgY2xvY2sgY29udHJv
bGxlciBvbiB0aGUgU29waGdvIFNHMjA0MiBTb0MuCj4gUGxlYXNlIGFkZCBSSVNDViB0byBpdHMg
ZGVwZW5kcy4gTm90IGFsbCB0aGUgc29waGdvIFNvQ3MgYXJlIGluIHRoZSBSSVNDLVYKPiBwbGF0
Zm9ybSwgU29tZSBhcmUgYXJtIGNoaXBzLiBJdCBpcyBub3QgZ29vZCB0byBidWlsZCB0aGlzIGRy
aXZlcgo+IGluIHRoYXQgYXJjaC4KQVJDSF9TT1BIR08gaXMgb25seSBkZWZpbmVkIGluIFJJU0Mt
ViBhcmNoLCBzbyBJIHRoaW5rIFJJU0NWIHNob3VsZCBub3QgCmJlIG5lZWRlZCBhcyBkZXBlbmRz
Lgo+Cj4gQWxzbywgdGhlIGNvbmRpdGlvbiBBUkNIX1NPUEhHTyBpcyBkdXBsaWNhdGUgaW4gdGhl
IE1ha2VmaWxlLiBQbGVhc2UKPiByZW1vdmUgb25lIG9mIHRoZW0uCgpEb24ndCB1bmRlc3RhbmQg
eW91ciBxdWVzdGlvbiAidGhlIGNvbmRpdGlvbiBBUkNIX1NPUEhHTyBpcyBkdXBsaWNhdGUgaW4g
CnRoZSBNYWtlZmlsZSAiLMKgIEkgdGhpbmsgeW91IGFyZSB0YWxraW5nIGFib3V0IEtjb25pZmcs
IHdoYXQgTWFrZWZpbGUgCmFyZSB5b3UgdGFsa2luZyBhYm91dD8KCj4+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2Nsay9zb3BoZ28vTWFrZWZpbGUgYi9kcml2ZXJzL2Nsay9zb3BoZ28vTWFrZWZpbGUK
Pj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4gaW5kZXggMDAwMDAwMDAwMDAwLi4xMzgzNGNjZTI2
MGMKPj4gLS0tIC9kZXYvbnVsbAo+PiArKysgYi9kcml2ZXJzL2Nsay9zb3BoZ28vTWFrZWZpbGUK
Pj4gQEAgLTAsMCArMSwyIEBACj4+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4w
Cj4+ICtvYmotJChDT05GSUdfQ0xLX1NPUEhHT19TRzIwNDIpCSs9IGNsay1zb3BoZ28tc2cyMDQy
Lm8KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xrL3NvcGhnby9jbGstc29waGdvLXNnMjA0Mi5j
IGIvZHJpdmVycy9jbGsvc29waGdvL2Nsay1zb3BoZ28tc2cyMDQyLmMKPj4gbmV3IGZpbGUgbW9k
ZSAxMDA2NDQKPj4gaW5kZXggMDAwMDAwMDAwMDAwLi40MjFlYmNjNzE5MmIKPj4gLi4uLi4uCj4+
ICsJCX0KPj4gKwo+PiArI2lmIGRlZmluZWQoREVCVUcpCj4+ICsJCXByX2luZm8oInJlZ2lzdGVy
ZWQgWyVkIDogJXNdXG4iLCBnYXRlLT5pZCwgZ2F0ZS0+bmFtZSk7Cj4+ICsjZW5kaWYKPiBEcm9w
LCBubyBuZWVkIGZvciB0aGlzLgoKT0ssIHRoaXMgbG9nIHNob3VsZCBub3QgYmUgbmVlZGVkLCBJ
IHdpbGwgcmVtb3ZlIGl0IGluIG5leHQgdmVyc2lvbi4KCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
