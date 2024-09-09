Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E27EECE577
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Sep 2024 00:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cwyE7npYpoDp3AryTLtYOBdvGsIPEdp7CjaWJE4R+Ng=; b=Rlpocz1/aL/Sw+si1A3BI3TXdo
	LlNpHiU7PVAeYiSxEaBLUt+Yrv+WL7KbgoX4BixmU83mNqF1/cOIuUpYFbtob7DjKChFXXLxgpThu
	Oddkq8GCipWFK7YqqPvX+atUxN61ti5ZnVtGZ8aAKw96qZaQ0zIgkr6gMQC82DUFCfHX9mSPxmsxq
	KogiJm5C3cvYxB0DH56WdUr7q/MZaw4CifsmlzvKsGmlGTcsC2V74UOHhaeBmZDhM5zR9M/yOJNZO
	/Y9a7lByWdgGAVjfKIn7BJMkhYHtt6+CqVw8eqI2DVUbKxbaTyiGO6eCXNXB4HPtySiBY4jospGD9
	hh0qnS+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snSWG-0000000081x-3RYR;
	Mon, 09 Sep 2024 00:44:40 +0000
Received: from [2a01:111:f403:281b::809] (helo=IND01-MAX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snSWD-0000000080s-2Z0O
	for linux-riscv@lists.infradead.org;
	Mon, 09 Sep 2024 00:44:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mUBzOSRX5zPW4FwWEogWuofsfxTZ7FMbkyHKSu4lvbuOrIIGqjepkjZeuGZC6wAKUdX6oKI5iz+oVTPtSmfEm0UNBzyXwDjpyzTjlmpCGFS8ktiWlbA0kIWA/FmxlcMWQCuJOHdQp8Btj4xrjqXz64+NxVpNhVgY0+UvC02WkkaN5Qzpkc8EPYSnmiDF7aziuW15sqkCjBpuZmcB9OvnXLs+p8fgLfkA3utj2+uu1o/Z3IbfrhlSnZ4Mg0W0VJ7i1eLL6VrYrojC9Gy8JutvzNLZLA2Zas6XxNQspaBVB+R2AOZzLqPZOkcWMzuuLEud8PxW0Z9tXPtyKRFuIvrP9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XBDF3ze7Cj4nScaXHZ6M8qtl688MJuVP0rCq2nuw8yM=;
 b=FJ3jzQlLwXkHYIJaLCU2F6LKS1DEFZAYBgMcfIr1tcQ25n367Pyrb027k/8kK+CJfrfJhMXRyq0WDF+P056HaTRnuefbSUIaJ4ROndlz4rK6mkv148bKsbGeYZlmeOaox14paLAu8KxTnGHfHj/NgboZ/Me3MhHwN0yhbErtqwqnFSEkjJ4nb4va080p4fjCCh1dqdMz2OGM9ezu3AQ+PlwlG6o6JAp9z00tJlXkofwyeFqUrCYzwvGXWWPtjdoUZZF8pBG6NPTC/HjQOeqSH6xEGnywvcCh60H0XBwYEpo3JBBh9X0nWUtk2XkZxFKoqbmFfQeBu2CJHVQLi5f/XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XBDF3ze7Cj4nScaXHZ6M8qtl688MJuVP0rCq2nuw8yM=;
 b=K4Od1vjgNm5gdaSaB2/tRS2h2pChAYBXNnF0gbZTAEYWWgZUl5kguUunISD03lrMUXidPZ/v2xwdZt4oWWKweJccfHdRWJpMXG22v9ERaK9I0xAjN2TRuNq6WW4FC++e4gYQSSQ5nh7L4uqroRhWURJjjyxcN3OyTDm6EGCT6vn4Gor9tCEtsXajhySHIZ8jsPyYEIt3uZUNqRObQVM+v5Fbxd++lm2DibNQExIChVAJam76v1mbLMYhtQtugUoeKEyI2Db399sD1vT6dLwRxnyBMfb4H1Js5mvi6AtNuEF3PWiwzxxFdu//46UzRdiDq90aXU2LV/aVZzgsoNPOkw==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by PN3P287MB0354.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:d8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.22; Mon, 9 Sep
 2024 00:29:24 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c%4]) with mapi id 15.20.7939.022; Mon, 9 Sep 2024
 00:29:24 +0000
Message-ID: <MA0P287MB28227F2A65ADCC493499B7CEFE992@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Mon, 9 Sep 2024 08:29:15 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: pwm: sophgo: add bindings for sg2042
To: Yixun Lan <dlan@gentoo.org>, Chen Wang <unicornxw@gmail.com>
Cc: ukleinek@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, inochiama@outlook.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-riscv@lists.infradead.org, chao.wei@sophgo.com,
 haijiao.liu@sophgo.com, xiaoguang.xing@sophgo.com, chunzhi.lin@sophgo.com
References: <cover.1725536870.git.unicorn_wang@outlook.com>
 <6e5fb37472b916cb9d9abfbe3bea702d8d0d9737.1725536870.git.unicorn_wang@outlook.com>
 <20240906024435-GYA153340@gentoo>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20240906024435-GYA153340@gentoo>
X-TMN: [r69EZut5XYbg2Gpv33Dmwx4k7CGMkBGp]
X-ClientProxiedBy: TYBP286CA0007.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:ce::19) To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID: <6fc9c5b7-a69e-48f7-9a88-d416bcc15791@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|PN3P287MB0354:EE_
X-MS-Office365-Filtering-Correlation-Id: 68b058eb-6ad0-45c9-691a-08dcd06673eb
X-Microsoft-Antispam: BCL:0;ARA:14566002|6090799003|19110799003|5072599009|8060799006|8022599003|15080799006|461199028|1602099012|4302099013|3412199025|440099028;
X-Microsoft-Antispam-Message-Info: jrasYkjBdX39CibHSftUQZF44M5+mMCMcD7UM7ydTOnzOi0DqFD0XQh4ZyylHHi/wBQvZkHC/fYz1rIuOhx5Mgx3Tu6ysxBcuHQwAs+KRqRpV6yvEcFhoQovmQSUiYgQ9vOUmW+Lrxa5sbTHbToSzUxkzykIM+CrMvCUeQYwL8VULSSFkouBEYhRbBmGxblypUo6dNfAUfhrBPfAIK3nG73/HJJK+zTuzejDBrdV0VMYrF1/fyWynxSfpBdymIcgyZAKEHWRDkomTQL0D9gmpH73pE43Yv0lQdgkkvCAYxo2DklK2OzfAkixdgrqdOYs/yc1Fm2B6Lc7405Dpj0jtKdFJ6qcEptY6sftg6vkzJY56Q07RWNJCH8ceH9PVqN4FxkRK9OTgLryyCGjbX0V03Fp5w66qwQl2doV999uPCYVvM/L9ErgkcS1X3AaYjvdSJX880FyLX649W8lIJhENsEqA485a9FXHeLzn5w2z6fBApy3Q3z3Oas7rsXuwu1yXtht3gNU2lyvft12B7s4ZwjemTJfhWnsGSLQpl53LB7SdRXkuV2GXC6h6fOvqXIpCCqb9SNl2VDNfKnKjvUwEYlZN5H8DLCr7LGlkz5f4LxGdAtUZ55Pn+/MyocktTcBVO/9ErJ5M2OmVLztLrk7I7qKgq56L6gDHLETpV6TvGdpDZ9JK4RvkK6MSCgJngFpotDuAXjArirTvKZuTyLUwvleVtcqtKz6gbTmSlLt9qcIqxKN1bSxlTxpFxddnrHyK2Ag2es3vxEdMmbG8bRZTOh2y/5LXg0M6fKOSmArEynrJuaKM4x8DTncSP2Qk+IDLjqaclh+NibRhzpnwLbOWT1CORlDA810MxyLqBX8hxdBAoqq2ta0ZEZkF/d1FPR4
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NlNJbmtNMEgxcGwveVJ3RElUREtFZHpxTWNTcm9OYWQwSElVVzE1UjVvbUY2?=
 =?utf-8?B?ZVk4TTJLbWhIbnF3eERCSjBHemhhTmNFQjZGdVhiTFNkRDkrV1BLNEJTV0E3?=
 =?utf-8?B?WDhza1lIQXQvazVCTGpLMFU3NEVUYzRvblNMdENNTkUyTXMxKzRMN2hqeUY0?=
 =?utf-8?B?a2EvczlsZmNma1AwWDZvSVBvOVY3OVJZYVFZcTdWREIrTW4zNlZrVjY5YkNp?=
 =?utf-8?B?czFlbllNWCs2MkNZRGY4UzNZZ2FjR0hJdUhSOTZvR3M2Y1VEVkNsTGg4TFJx?=
 =?utf-8?B?b1ZiQXRZcFdPRE9oaDFLbzhUVFhVVTRnY2VEMkRoSlZ6Y1BBMlc2WmFJTlBE?=
 =?utf-8?B?b0N1M1F6TmJ6L0VYNmdJeUxrcnBBQzNKck9jbEFwVTVET3VuTlE2dHFERE1i?=
 =?utf-8?B?dG1OWnIyMkpBTGFjcmRHNXVLR0YwQ3NSbjdMdVRJZHBuMkRTMlVDazVNaGgy?=
 =?utf-8?B?WXRja0FZVDRxUnhjckdaQlZJbHhVcDlFd1F2MkNUS29iMXdoVzFLWjcrNHd3?=
 =?utf-8?B?MVloVHkzay9uOCtaY2tNVkVMLzFXYVg3bDVaOTJoRlpLYStObkpCYXNWdEFj?=
 =?utf-8?B?VG9OL05KMktJckdOSWxXTjFKY0NMUDIvb1M0MjZRNEJ0d1hZZ0FwL2lOL3pa?=
 =?utf-8?B?V2lXcm14VTNYUzE1VXY0VXNsQnU2ekVwSHRsbFd3bmxwR0tiZUZCZm5vTHZt?=
 =?utf-8?B?QkNjOE1EQjRtdHBld3hwU2RjUENVVUc4UFJDbUJ0UnIxZXpobFppS1JNajl5?=
 =?utf-8?B?R3NubkpDenlFT05aUGpzc2U1enpOS2VNdThSSERnY1JsdmhFTXR4WkNUS3Bu?=
 =?utf-8?B?ZmloZ2tIRnFmWVZFdWhpSVMyaDJNSDJtcnRvMy8vUFl5d29DZXFLL3BDTnNI?=
 =?utf-8?B?Nmx5a2dFWGg4bW9CVENNcTVvNkJ4UHprUzhrWkVrelg5MzJiWUpxSHlFbUh1?=
 =?utf-8?B?QWQ0dWd3eGw1azM4QjdSeDFleUQwM1gram50SjE3L3hRUnVsQjM4S2lTR056?=
 =?utf-8?B?UW5DUUR4dUJPRXdyODNLUnY3MUJ3ZVpxczlFNjJ1S0lwOUQ5RTVrSlU3b3hW?=
 =?utf-8?B?S0xkMlVVUjNieTJiVG8wTGxoQnc5Smh6aFBJa0hjaktUU3VISkJFcXZVR1Jq?=
 =?utf-8?B?MjVWUmJPUHc2Y2RhTnhRU09PRkZvYmpPeTBZekY0MUY0M1I1R2JSRTU0bkNJ?=
 =?utf-8?B?MVUxdm1mOHpyZHZqaDhjcHpqZUpicEZic09WcDlEQXc1aTA0bkk1Mk4zM2NE?=
 =?utf-8?B?ZTVjN051OHpnU00vKzJSSzFtSkZYNHVpK3JmVXF1OUxsNTZMem5Za1BUalNW?=
 =?utf-8?B?NFMvQk83UHUzdlFQZjBiS2pUblJ6WExRbGVFMldSc2JZcTlTL05mY2w5bXVm?=
 =?utf-8?B?cS9rOHYvSjlUR0grK3ByTHQydHJ5VlM4MWRVSytJc0NBRUVBdE43dVFCVlZi?=
 =?utf-8?B?bW4veXVXNWg5SVczUWZsZnljMHJTLzNtYUdaOHdjL2Fnc2x0Q243TStRNmx4?=
 =?utf-8?B?Y3RIQWxyaXZjVzdjWENuZUs5SFg3TDN2Y1l3TXp5MEplWEVpL08ycExFdEI2?=
 =?utf-8?B?UHdhOGRoNG9BNi94UHlsNy9sVDFzbnNodXdxblBmTHBhdXNvb1FFNzAzL096?=
 =?utf-8?B?czlhTktraTZhYjBXTFR6WUl4V3Rxem5ka2o1cHhnQ1MxaHI0bkd2L1JZa1NS?=
 =?utf-8?Q?+/NewZ4M9Kl5PCM2x1dz?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68b058eb-6ad0-45c9-691a-08dcd06673eb
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2024 00:29:24.7576
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB0354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240908_174437_678894_F28CF4AB 
X-CRM114-Status: GOOD (  13.75  )
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

Ck9uIDIwMjQvOS82IDEwOjQ0LCBZaXh1biBMYW4gd3JvdGU6Cj4gT24gMjA6MTAgVGh1IDA1IFNl
cCAgICAgLCBDaGVuIFdhbmcgd3JvdGU6Cj4+IEZyb206IENoZW4gV2FuZyA8dW5pY29ybl93YW5n
QG91dGxvb2suY29tPgo+Pgo+PiBBZGQgYmluZGluZyBkb2N1bWVudCBmb3Igc29waGdvLHNnMjA0
Mi1wd20uCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IENoZW4gV2FuZyA8dW5pY29ybl93YW5nQG91dGxv
b2suY29tPgo+PiAtLS0KPj4gICAuLi4vYmluZGluZ3MvcHdtL3NvcGhnbyxzZzIwNDItcHdtLnlh
bWwgICAgICAgfCA1MiArKysrKysrKysrKysrKysrKysrCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDUy
IGluc2VydGlvbnMoKykKPj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3B3bS9zb3BoZ28sc2cyMDQyLXB3bS55YW1sCj4+Cj4+IGRpZmYgLS1n
aXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcHdtL3NvcGhnbyxzZzIwNDIt
cHdtLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcHdtL3NvcGhnbyxz
ZzIwNDItcHdtLnlhbWwKPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4gaW5kZXggMDAwMDAwMDAw
MDAwLi4xMDIxMjY5NGRkNDEKPj4gLS0tIC9kZXYvbnVsbAo+PiArKysgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvcHdtL3NvcGhnbyxzZzIwNDItcHdtLnlhbWwKPj4gQEAgLTAs
MCArMSw1MiBAQAo+PiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAgT1IgQlNE
LTItQ2xhdXNlKQo+PiArJVlBTUwgMS4yCj4+ICstLS0KPj4gKyRpZDogaHR0cDovL2RldmljZXRy
ZWUub3JnL3NjaGVtYXMvcHdtL3NvcGhnbyxzZzIwNDItcHdtLnlhbWwjCj4+ICskc2NoZW1hOiBo
dHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKPj4gKwo+PiArdGl0
bGU6IFNvcGhnbyBTRzIwNDIgUFdNIGNvbnRyb2xsZXIKPj4gKwo+PiArbWFpbnRhaW5lcnM6Cj4+
ICsgIC0gQ2hlbiBXYW5nIDx1bmljb3JuX3dhbmdAb3V0bG9vay5jb20+Cj4+ICsKPj4gK2Rlc2Ny
aXB0aW9uOiB8Cj4geW91IGNhbiBkcm9wIHwgaGVyZQpBY2sgYW5kIHRoYW5rcy4KPj4gKyAgVGhp
cyBjb250cm9sbGVyIGNvbnRhaW5zIDQgY2hhbm5lbHMgd2hpY2ggY2FuIGdlbmVyYXRlIFBXTSB3
YXZlZm9ybXMuCj4+ICsKPj4gK2FsbE9mOgo+PiArICAtICRyZWY6IHB3bS55YW1sIwo+PiArCj4+
ICtwcm9wZXJ0aWVzOgo+PiArICBjb21wYXRpYmxlOgo+PiArICAgIGNvbnN0OiBzb3BoZ28sc2cy
MDQyLXB3bQo+PiArCj4+ICsgIHJlZzoKPj4gKyAgICBtYXhJdGVtczogMQo+PiArCj4+ICsgIGNs
b2NrczoKPj4gKyAgICBtYXhJdGVtczogMQo+PiArCj4+ICsgIGNsb2NrLW5hbWVzOgo+PiArICAg
IGl0ZW1zOgo+PiArICAgICAgLSBjb25zdDogYXBiCj4+ICsKPj4gKyAgIiNwd20tY2VsbHMiOgo+
IC4uCj4+ICsgICAgIyBTZWUgcHdtLnlhbWwgaW4gdGhpcyBkaXJlY3RvcnkgZm9yIGEgZGVzY3Jp
cHRpb24gb2YgdGhlIGNlbGxzIGZvcm1hdC4KPiBJIHRoaW5rIHlvdSBjYW4gZHJvcCB0aGlzIGNv
bW1lbnQsIHNpbmNlIG5vIHVzZWZ1bCBpbmZvcm1hdGlvbiBhZGRlZAo+IGFsc28gaXQncyBhbHJl
YWR5IHJlZmVyZWQgdG8gc3RhbmRhcmQgcHdtLnlhbWwKSSBhZGQgdGhpcyBjb21tZW50IGp1c3Qg
d2FudCB0byByZW1pbmRlci7CoCBPaywgYW55d2F5LCBpdCBjYW4gYmUgcmVtb3ZlZCAKdG8gbWFr
ZSBkb2MgY2xlYXIuCj4+ICsgICAgY29uc3Q6IDIKPj4gKwo+PiArcmVxdWlyZWQ6Cj4+ICsgIC0g
Y29tcGF0aWJsZQo+PiArICAtIHJlZwo+PiArICAtIGNsb2Nrcwo+PiArICAtIGNsb2NrLW5hbWVz
Cj4gYWxzbyAiI3B3bS1jZWxscyI/CkkgdGhpbmsgaXQgaGFzIGJlZW4gcmVxdWlyZWQgaW4gcHdt
LnlhbWwsIHNvIG5vIG5lZWQgdG8gcmVxdWlyZWQgaXQgCmFnYWluIGhlcmUuCj4+ICsKPj4gK2Fk
ZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQo+PiArCj4+ICtleGFtcGxlczoKPj4gKyAgLSB8Cj4+
ICsgICAgcHdtQDdmMDA2MDAwIHsKPj4gKyAgICAgICAgY29tcGF0aWJsZSA9ICJzb3BoZ28sc2cy
MDQyLXB3bSI7Cj4+ICsgICAgICAgIHJlZyA9IDwweDdmMDA2MDAwIDB4MTAwMD47Cj4+ICsgICAg
ICAgICNwd20tY2VsbHMgPSA8Mj47Cj4+ICsgICAgICAgIGNsb2NrcyA9IDwmY2xvY2sgNjc+Owo+
PiArICAgICAgICBjbG9jay1uYW1lcyA9ICJhcGIiOwo+PiArICAgIH07Cj4+IC0tIAo+PiAyLjM0
LjEKPj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
