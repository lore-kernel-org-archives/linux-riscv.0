Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF35AC4706C
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Jan 2024 11:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:To:Subject:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8lm/vWMcrRGqY4i6KhW8M/P4A9yPpIf8gBa0uKa2W7M=; b=klbu1LAWTw4gOZun8F+5uCfODm
	FhN/pVnZcTyNC7f8I13Cjikd3QZqsCnV/9xee/4Pg+x0wXkC5ZZ8lYl/5wSTyAoHic2Yz+1/o+YtS
	YqU2CkYm32Op5ZDj9ukuMhH3JVQdN9O7Pw6xYBbXml/C2VhCfgYWG/ONJ7mr62j9hI4qNMVvdb8pY
	00QnSoioxxBPmveFFn17wLcK2N/7aXPAGBpX16eu6jX2qo7Q7puDtftGXd23Wq5BPGfQJQuefQEEh
	NcrTK64LB2jeFX3PuNmv+n8lfl2S9MvgXGB19KIJITKzlN92En4gBeTe5pfSyemsZk0GK5tCuvWTC
	rZ4VwLkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPhlQ-00BxE1-27;
	Tue, 16 Jan 2024 11:37:52 +0000
Received: from mail-bmxind01olkn20800.outbound.protection.outlook.com ([2a01:111:f403:281c::800] helo=IND01-BMX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPhlN-00BxAp-1y
	for linux-riscv@lists.infradead.org;
	Tue, 16 Jan 2024 11:37:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hjn5upMuYRX+g7sEHDZyl2uRNAWvCSpem4YOSVhzbXh5gf2spF2qzglKKfG4UtbB4rFvq0OqIAMRQPHj9C//DiP9IF5dPae0sxWEJ+y7edXLN0s0sfuOMXJN+KVxlwMtEZkjgRj2TV7T262VO5TmGekygZuqPkWBiMnjZLbdQ820tA69bvZsnnxLiqYS9N0I/bTS+HpiSLxhIEujiAMlGiDGNURAebQqJfcRL6ZSUWTrmmlXI99mZTAAvOnJyebwbm6x9Su5+y1Abizgxrt6/gqVr4WfEujiWdaCL8LHg8vLkltx+2vMyQzY1Bl7eBYw8X+NJoSzREYG3L05q2X+ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cIdNgyuuBvjR5UX/UXVruTVaatPQSHNgeUC/msUMZV4=;
 b=ZkdhfjhgkZ/0Dtfycwdn/fUGx3PcV8tt7syXrK44jswaBtUaU86ESaCY4mzH6T/9c2NefODSwK4PHYeDBt+6MQMV6tXiJLkRzve9bhUrz2cXGIFaM4aXM70ew+kodmRy4G0tOqaS6sl3g3mbh8eTsjGs4Sp3rUGHCP7LovD1h3MTrjA7cbyp4cTNb8r3jS9YMBCm2gJCqLAH+Cvz2I1ShsFSQDR6VzxSc13m5XCQjT3ZOalqa4xD6LnPAEHX+hp0QGRfwIPbDbkwy0ZnunLsSk8GoY6Gun1Jth7hE6rYkQuufu0W7/7aBGuQWb0j+kTWpGLrlN0Ij/4jBavtkl+lug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cIdNgyuuBvjR5UX/UXVruTVaatPQSHNgeUC/msUMZV4=;
 b=N1xEAh+twTpj1QOVMv845VWMgSN9vViiTGGqUJ0VnDkULWJmFcXAQl3g3DEDEIn86Mvss9yzThEMBxL3dXhEG6lAzAiYGpewZAtCXwbMeOwoJJ5S3zqrPkOajBu0Zv+CwEVheh8aGcPl6EMmxqjEJmtl2waeJQvxBQVEtYhGlsHckV0HPxc0b64f5PdxrPAQXj/VDDoUrx414AS17Nc63MYKcgon/QaGDP1e5gThkHB1+EYFEqrC9Qqelwp/ENzrtnVhI7zxO2Hbp4nVIvr6WZjEkAKPU3VMdqxJMaSMeUMHVpix9KLzdW5ob5oWl45oqJre681JxXJJcX9+RImxbQ==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by PN3P287MB1847.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:19d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.29; Tue, 16 Jan
 2024 11:37:29 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::6e80:69e1:f2e7:d70d]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::6e80:69e1:f2e7:d70d%3]) with mapi id 15.20.7181.027; Tue, 16 Jan 2024
 11:37:29 +0000
Message-ID: <MA0P287MB282232DC6DF6290F5520BA89FE732@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Tue, 16 Jan 2024 19:37:22 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/5] dt-bindings: soc: sophgo: Add Sophgo system
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
References: <cover.1705388518.git.unicorn_wang@outlook.com>
 <598b1026fdf9989bc48e5e10d1034b37947d3b80.1705388518.git.unicorn_wang@outlook.com>
 <f4a46311-2e12-458b-98a8-d3caa2c95517@linaro.org>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <f4a46311-2e12-458b-98a8-d3caa2c95517@linaro.org>
X-TMN: [tX1rqsDlj7PmSqjGin9SmCxk76bAGxUn]
X-ClientProxiedBy: SG2PR02CA0099.apcprd02.prod.outlook.com
 (2603:1096:4:92::15) To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID: <6a4d5b98-dced-4cad-b346-b285ea303707@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|PN3P287MB1847:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d51ef08-5cec-4424-f6f8-08dc16878448
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IGsZifcfUoQCzyJa2Y8otupbeDQ4wbh9LZHVNjJe+IjqZF5hOcL9jNUk0WiXceXex968zMdqQCsu45bXouyBvAxVOUL/73I3CsyFuWl3eFgMvLhjsWhc2QQoM5c1kTufU/UpGF00wUaEwxKyXS8+MpP/eUG6/DLxcRCaSnsjdj5QzIzddkH/e+mn/zBchz8pvPQywdm9WmbMZPmlA3Nl4pywYle3LuIdsNhNuFuXY59G7idlSPKm75J3Kfs0ZrmSF80+KVye4SBzjnJsZhZP7CAKWF26SFTrnD7Wh5frbm9n/GdsbKk6pzk21c+N7BJDlpAH2YKowvEP/5cgNYlUpi/D69cMJQzpNsVBK2mg1uFwkCHMe4mEGflev6wVhLTk49+f8I8jJuumsRT1K5WI92D8YoOrBQAvA0We9b+AaqT2TuDoJBVF1wslv4d3QXLUtaqNvqPWdGX/m8N3gsnjWhBCgxxQ4lLUg2zCv/Btypz1ipwRFMf/2edra1GEfhtaNIa2YBU9U2KW5A0ymU0mOuemASR9DvPq6SHSIJXwc5zyjLOm1mIdZe6mt8s8RBCa5KntmxygDuXDGpFKIU9oWNBebd89L+p6603v/MTkjPDYzFy3aqA+T4G2df1AWi1/ykny85v+xxZL5yaxrXZ+Kw==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmFnSlRRR0FaL3N5WWVFNmNMcUptVXM5YzdmOEVneUVFZ0FwbUZhQmFxb1pa?=
 =?utf-8?B?djRwK0daTGxVY1FaZUtHNElJbnhqcGxsQXJwTzlSNjdRNnhRSHF1YW9OSjM5?=
 =?utf-8?B?enBPbDlwd0dPWnZMNTNONlpYNXBHN3ZNOGZxbEM4ampxaWhMeE42aUtsQjdp?=
 =?utf-8?B?RW9velBYUXpYK21PYUtjQVNLNUVFVGVDcU84SnF3bHVLb2ovVXVlNWMvL3RW?=
 =?utf-8?B?NU5xbTVKZm9PRmdhYnVSMG14Nks5T05pbVpxWTlIU0RHb3dzWld5WWJuL09E?=
 =?utf-8?B?OFRTc2RLY1d0S3BNeldjRldqdjNkdDVOS2RyM1ZPaFFsanhZZlJqUUNoYWt3?=
 =?utf-8?B?M0VrRHE2VDNub3RLSndGcGZ3eitUTldFeGVoM2lNT1JPVVlQNnNjS3FTektI?=
 =?utf-8?B?U2w4SnBqMTJMTllEYWxPY01BOG53ZklOQSs3TUZXbjU4RkU2ZC9zTmtnK2NP?=
 =?utf-8?B?Y0VEamNyZ0JJRjRtVG9nekhYeHYyajhBZmhHZW41VDJGcEp3SXVBa3ZBNlFI?=
 =?utf-8?B?MkFGNFYycXpwaVNpQW53TVF4bWJsNTZicjMxcHh6ekROT2s1UGpqNHJsSVlv?=
 =?utf-8?B?VklxODgxK09KdFp5WEV2WUhBdHN4am8xbEVxTHc4RWo5VGxyT3pIN1E1UWpx?=
 =?utf-8?B?MVA4Sng4djYyM1ViTk5VVVJsRnhmVytLdVdJNXl4VWRTbFduTVk1MExOWmxU?=
 =?utf-8?B?WjEzY2NxQ1AwWThHVlNqTGJSVUF6cWRCZ0NDMjVob1BIakJDcy94a2poZFl1?=
 =?utf-8?B?anlvaER1d1RjTEJibU9HdmI4OW9RR0Mvek5qdlJLZitlcEppWDdZbitudC81?=
 =?utf-8?B?VDZDTVJNQ1FVbXNyMVowYit5ajltd1Z6LzRzWW14VVIycUllZU1QYms4SjFn?=
 =?utf-8?B?czNJY3RGeU5mQkNHV2NEVjlvcVQ2TzRacVFwYUw5My9ndkY3bFJwQ2JNQWRm?=
 =?utf-8?B?RFRPK2NwS1hIL0RSTjduSVE4NXN5ejVJU3dwQmUxWUt5aUVYayt3dFFFQmRU?=
 =?utf-8?B?ak5YTTdCbWVZaDhDc0lGSHg4Z05DWjl0eklMdHkwaUhwSVlGYy9kQ01mdEYr?=
 =?utf-8?B?SFV0anFJdXVTK1MxbnJkSmswZXMvYjEvS2JDRFdNYnVpVjZYU3ZFV2JseTF2?=
 =?utf-8?B?WWI3MnlhT0J0R1VVNWh0VzlXQWIrWmU1RkF2QW83SDBta0cwcUlHWk5sQ3Fo?=
 =?utf-8?B?UEpyVlpGZFVRNVNsNnF5WFFramc2c1dqWTVUKzN5Q29kN3ZMRnVDRmRnMnpt?=
 =?utf-8?B?T0dCNW9WTlJETmpPQTZicG9LN3FZTWNlQVdWOVl6VXpOZmViN00vcXg2cE1j?=
 =?utf-8?B?MGVnTGJaTmxObXJkTDZIR2wzamZETEVFRmZrSWR4eStJRUlmbHNvY09rNGZ1?=
 =?utf-8?B?Ym9FSjdMQjh4dEhUeTBxUjk0NDJXU3VCVXFkbUpJYXltRmZyVGtDR0Y1K3A3?=
 =?utf-8?B?ZjNFR1RNSzU1bnZlRTlIY0t4cGY0bDkrRC8vSkd1QUFLakVtZXlJMUsrQklz?=
 =?utf-8?B?aDZYOGIvd3FhZnY0T2JoSkEwdHRzYklvMXlMUmpXWXVUa1F0a1ZJdU9PN0FR?=
 =?utf-8?B?MFBRbXRpVzBDb05iNFdXVUJIN3pxa0RuUkFNUjNRbE0zN2E4WjVUYnk1VDJr?=
 =?utf-8?Q?TPEUPKPmBZhvQmxI+XO6x9PloOVf4TI3yTshoSTOy8qY=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d51ef08-5cec-4424-f6f8-08dc16878448
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2024 11:37:29.5676
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB1847
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240116_033749_677779_5FC26F84 
X-CRM114-Status: GOOD (  15.50  )
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

Ck9uIDIwMjQvMS8xNiAxODowNiwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiBPbiAxNi8w
MS8yMDI0IDA4OjIxLCBDaGVuIFdhbmcgd3JvdGU6Cj4+IEZyb206IENoZW4gV2FuZyA8dW5pY29y
bl93YW5nQG91dGxvb2suY29tPgo+Pgo+PiBBZGQgZG9jdW1lbnRhdGlvbiB0byBkZXNjcmliZSBT
b3BoZ28gU3lzdGVtIENvbnRyb2wgZm9yIFNHMjA0Mi4KPj4KPj4gU2lnbmVkLW9mZi1ieTogQ2hl
biBXYW5nIDx1bmljb3JuX3dhbmdAb3V0bG9vay5jb20+Cj4+IC0tLQo+PiAgIC4uLi9zb2Mvc29w
aGdvL3NvcGhnbyxzZzIwNDItc3lzY3RybC55YW1sICAgICB8IDQ2ICsrKysrKysrKysrKysrKysr
KysKPj4gICAxIGZpbGUgY2hhbmdlZCwgNDYgaW5zZXJ0aW9ucygrKQo+PiAgIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc29jL3NvcGhnby9zb3Bo
Z28sc2cyMDQyLXN5c2N0cmwueWFtbAo+Pgo+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3NvYy9zb3BoZ28vc29waGdvLHNnMjA0Mi1zeXNjdHJsLnlhbWwg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc29jL3NvcGhnby9zb3BoZ28sc2cy
MDQyLXN5c2N0cmwueWFtbAo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+PiBpbmRleCAwMDAwMDAw
MDAwMDAuLjdiNTBiYjU2YjRjZgo+PiAtLS0gL2Rldi9udWxsCj4+ICsrKyBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb2Mvc29waGdvL3NvcGhnbyxzZzIwNDItc3lzY3RybC55
YW1sCj4+IEBAIC0wLDAgKzEsNDYgQEAKPj4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChH
UEwtMi4wIE9SIEJTRC0yLUNsYXVzZSkKPj4gKyVZQU1MIDEuMgo+PiArLS0tCj4+ICskaWQ6IGh0
dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL3NvYy9zb3BoZ28vc29waGdvLHNnMjA0Mi1zeXNj
dHJsLnlhbWwjCj4+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFz
L2NvcmUueWFtbCMKPj4gKwo+PiArdGl0bGU6IFNvcGhnbyBTRzIwNDIgU29DIHN5c3RlbSBjb250
cm9sCj4+ICsKPj4gK21haW50YWluZXJzOgo+PiArICAtIENoZW4gV2FuZyA8dW5pY29ybl93YW5n
QG91dGxvb2suY29tPgo+PiArCj4+ICtkZXNjcmlwdGlvbjoKPj4gKyAgVGhlIFNvcGhnbyBzeXN0
ZW0gY29udHJvbCBpcyBhIHJlZ2lzdGVycyBibG9jayAoU1lTX0NUUkwpLCBwcm92aWRpbmcgbXVs
dGlwbGUKPj4gKyAgbG93IGxldmVsIHBsYXRmb3JtIGZ1bmN0aW9ucyBsaWtlIGNoaXAgY29uZmln
dXJhdGlvbiwgY2xvY2sgY29udHJvbCwgZXRjLgo+PiArCj4+ICtwcm9wZXJ0aWVzOgo+PiArICBj
b21wYXRpYmxlOgo+PiArICAgIGNvbnN0OiBzb3BoZ28sc2cyMDQyLXN5c2N0cmwKPj4gKwo+PiAr
ICByZWc6Cj4+ICsgICAgbWF4SXRlbXM6IDEKPj4gKwo+PiArICBjbG9jay1jb250cm9sbGVyOgo+
PiArICAgICMgQ2hpbGQgbm9kZQo+IERyb3AgdGhlIGNvbW1lbnQsIGl0IGlzIG9idmlvdXMuIEl0
IGNhbm5vdCBiZSBhbnl0aGluZyBlbHNlLgo+Cj4+ICsgICAgJHJlZjogL3NjaGVtYXMvY2xvY2sv
c29waGdvLHNnMjA0Mi1zeXNjbGsueWFtbCMKPj4gKyAgICB0eXBlOiBvYmplY3QKPiBXaHkgaXNu
J3QgdGhpcyBtZXJnZWQgaGVyZT8gWW91IGRvIG5vdCBuZWVkIHRoZSBjaGlsZCBub2RlIHJlYWxs
eS4uLgo+IHVubGVzcyB0aGUgY2xvY2sgaW5wdXRzIGFyZSBzcGVjaWZpYyB0byB0aGF0IGNsb2Nr
IGNvbnRyb2xsZXIgYW5kIHlvdQo+IHdpbGwgaGF2ZSBoZXJlIG1vcmUgZGV2aWNlcz8gQnV0IHdo
ZXJlIGFyZSB0aGV5IGluIHN1Y2ggY2FzZT8KSSBkb24ndCBzZWUgbW9yZSBkZXZpY2VzIHdpbGwg
YmUgaW5jbHVkZWQgbGF0ZXIuIEl0IHNob3VsZCBiZSBvayB0byAKbWVyZ2UgdGhlbSBpbnRvIG9u
ZS4KPj4gKwo+PiArcmVxdWlyZWQ6Cj4+ICsgIC0gY29tcGF0aWJsZQo+PiArICAtIHJlZwo+PiAr
ICAtIGNsb2NrLWNvbnRyb2xsZXIKPj4gKwo+PiArYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNl
Cj4+ICsKPj4gK2V4YW1wbGVzOgo+PiArICAtIHwKPj4gKyAgICBzeXN0ZW0tY29udHJvbEAzMDAx
MDAwMCB7Cj4gV2h5IGRpZCB5b3UgY2hhbmdlIHRoZSBuYW1lPyBQbGVhc2UgcHJvdmlkZSBkZXRh
aWxlZCBjaGFuZ2Vsb2cgd2l0aAo+IGV4cGxhbmF0aW9uIG9mIHN1Y2ggY2hhbmdlcy4KCkkgY2hh
bmdlZCB0aGUgbmFtZSBkdWUgdG8gSSBmaW5kIHRoZSAKVFJNKGh0dHBzOi8vZ2l0aHViLmNvbS9z
b3BoZ28vc29waGdvLWRvYy9ibG9iL21haW4vU0cyMDQyL1RSTS9zb3VyY2Uvc3lzdGVtLWNvbnRy
b2wucnN0KSAKY2FsbCBpdCAic3lzdGVtIGNvbnRyb2wiLMKgIHNvIEkgY2hhbmdlZCBpdCBpbiB2
OC4KCldoaWNoIG9uZSBkbyB5b3UgcHJlZmVyPyBJJ20gbm90IHN1cmUgaWYgdGhlcmUgYXJlIGFu
eSByZXF1aXJlbWVudHMgZm9yIAp0aGlzPwoKPj4gKyAgICAgICAgY29tcGF0aWJsZSA9ICJzb3Bo
Z28sc2cyMDQyLXN5c2N0cmwiOwo+PiArICAgICAgICByZWcgPSA8MHgzMDAxMDAwMCAweDEwMDA+
Owo+PiArCj4gQmVzdCByZWdhcmRzLAo+IEtyenlzenRvZgo+CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
