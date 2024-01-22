Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B48A4C4725D
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 10:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:To:Subject:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZyabyuRO2VlZnlO7OkuUVY1mohJ74XlM8lE+4yqtow0=; b=TKCBw84ZlsEWdieM5XR0vlaJGG
	UQDP9S/TVop/ogYxwKbWGgoLiLnS97iZ5RB1FsEGydybUdwSPBqDnmzYJF5VIbYnOqPisAWoAYjH6
	iTIMDT+Q+VvrOquMVsWkEWVubR8MRXaG3Qf5jW8eZogtN1ephz1ATlyNTuUmHMZKQCvJb1NcvBEia
	bbXHZdgM9S32aLSp0eI7dRVL3itPT+xQj7L+UtVKtkSxWL1sJvA3chlUrYD7IbW1edlbF6euSq6MY
	shHgTFEVEVp+hn36qnEsJKo3zZsrCC7xJNhSzg428ueqD1OABaFWDK0trU6fuYWW3XPdyK2Awia5u
	JCS+55hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRrHP-00BSOA-0S;
	Mon, 22 Jan 2024 10:11:47 +0000
Received: from mail-bmxind01olkn20800.outbound.protection.outlook.com ([2a01:111:f403:281c::800] helo=IND01-BMX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRrHJ-00BSMj-1E
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jan 2024 10:11:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mSQ8FXApYv5tXkn+mvPY/mM2tcioQXdIXOl7Tdpwr/O7liW4grBw82dTRhKCc/dbG73/DOv56tG8nn0bE5tAN7PiGHIQeO12awHXMSzGWPbVGgGqHCwOe2nwOsunugUnIJXXy21MYjqTwnw33vHq94D34FZ9FteBtXWGH6mPg9Q5Qd5mFWRN1xIwwiBHlUUgonsy8FlSwT9b52Tbgkzh8OYidylrxI9OxYkTLKi9X/OhDb82tau0BQnxG15Jr9vhkgcFFp4GpjVy+uNTgY1dHGOvx2cSTjxRB11WiQonYpqNuc1u7/aX7fZ6AZ08XCVm13LvmAdPGAgKBmUIJSUusw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iTokLvTji4opG+w33J4WtYo7phhifYrfwZVWc2XLfYQ=;
 b=UvjcUnFOD6q2mww2f3McOw7af/PXHL0v2QRn8uKojPvu4YGNOwNUpQiEwpU5RvVoHMr1AdCOAWBfSpOy0Lb94JMGtIiIOOdxzg5a9N9VTtKge8DcN/N2GuVRRiS4kHb8ceuf0yrWGlOCpz56hilcdpFRUzn4OgwRLJPvyHgHS6Y9qJra4YLmxwLKxW0N2vf58EanzYCQLaZ+bGqMmCu/+3kPts9L/5Tqt1PTEEaS7T0lVd/psLUq8kC6HSHmGrorbw7VgGYsy5ZqHS43RfVAO4A7VmFu5Nk0z3D+nQ8+SBwWDZecoZPGLCGkCOC95Q/4RdISnv0BdcbrqkU+TRP/HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iTokLvTji4opG+w33J4WtYo7phhifYrfwZVWc2XLfYQ=;
 b=GMUS63JJXhSRGZohAjaJWBqw1mUdHyN+n+ZkoZre4OFAqtwRoiQjza+M/WJKUITs8AzG4DpSpMKHLIgQtTSPN7v1qBKXZmVVM79hdR2Qa6YxNYg0f0pl3VPHpnBQqUriZiNDqJwZTqZ3KRCzjKhigacC6M41LIXfQ/f+zOpGzQTjyCoqkiqDFv8/+tLDmDFuHHGqNsEFwy4kyI3nbrcvGmXubvMP9ENyqOvaUvERRFqYOXI3zAbTPC4ZWKX7iw/q5RMu/hjp2ePt0+beoDSpH+K85Tt/QcE1npilQZ06haleQOo+pzR8u6BIQMYrThxEnTe1b7P29nEGMY4JcsEv9g==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by PN0P287MB2152.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.32; Mon, 22 Jan
 2024 10:11:28 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::6e80:69e1:f2e7:d70d]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::6e80:69e1:f2e7:d70d%3]) with mapi id 15.20.7202.031; Mon, 22 Jan 2024
 10:11:28 +0000
Message-ID: <MA0P287MB2822BCB4E43BCB495FCF9069FE752@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Mon, 22 Jan 2024 18:11:20 +0800
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
 <MA0P287MB282232DC6DF6290F5520BA89FE732@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
 <MA0P287MB2822FBA18674540BA85035BDFE712@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
 <c9feb32f-1efb-4613-94c9-9d6bb0f45366@linaro.org>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <c9feb32f-1efb-4613-94c9-9d6bb0f45366@linaro.org>
X-TMN: [n3fkDQygIzdUiN28vMEsfXKhKBijUAwV]
X-ClientProxiedBy: SG2PR01CA0197.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::8) To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID: <06dac627-f144-4ae0-a8df-fbb494aec2d2@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|PN0P287MB2152:EE_
X-MS-Office365-Filtering-Correlation-Id: a3195ace-9d73-462d-5c6e-08dc1b327e57
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Toi/Y6h3G7mQdQiMSEBZy8diE/K/CAs5CpGBXepi0GDTG/ZVhsN6tuhT2lStXx+9XE/C1ExnHc7RuSnM+nBZHgH+8Bho4Sd5UnYGXLoyHPyZ5dj1LEUTc9NBGaeGNS7hWNwMocc707O7zncMDr2vWJkB5fO/C1pE9A21OoiIglPg6dqs0HcrEe1O17wtBjTY6UwFBS5L297bkAtT+3iPVidOhzjQj7cRQoQ4KBsMysCkvCJOoi9pNoG/B6xCflCaQbMgIfjO3OC22aWCHJRsccGXp28IphX8Bh+/8dmpOpSzufbSS0Nu6qx9NSkcJHRNZgYzlEFAIFW88jPDZ6SBELhb7xmOiyTkM3os6xdn80XQWqfEX9zF4O/HNQukEXHXtIvDVk/EmkttyiPRHyu4cxXDknY6eFUwkngyxIhxjeQzvihb6CX6kI0lKGehhAZ3bXaWnnjI6DoKUEzh1JIq9rmrAx1/ZId/NysujmiL5Ie37DlSkDnHS/76BCozpLYqkQvvrEvk5+P2C6ib0qouR3HpRjHPZ/pQqXM0rLkrciD3B8KcKWfckhCb2LaAwUNs6QPYLUgruEo0NvioWi3mYJ/lKIrQLK+CoP2rrtzOye64U6WbVwNiEi7TVwzLYRmfe912QP3OKsn/iBX7VLjnbQ==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UGxkM0R4bkNxUnB6N1hEMjBvMy9rcEovd1NCZ0xtNERHalZ4dmhtc09IZ2lW?=
 =?utf-8?B?OHZHQTM1THJMMXd5cjJaeW1iYlVTbzZIa1h0MzJWN0w0WEVSVCtFd0FzK0kw?=
 =?utf-8?B?clZicE56ZHExV1hvbnBLblhCL2ZGZnlxc1dZNW1XQ2Vwc1dIeGhyK3AvMjdO?=
 =?utf-8?B?UVF4WHBnb3pBaUdlS3RZM2pXRmVpdjJqZmRNQjJpdzBVbFZEZzBHT1Y3OUw2?=
 =?utf-8?B?cVpWM244T3dhNGpJVXJGaDhteXg4ZXJrNm5UQ2xZZTBRMkU0UnFUY0hoWXQw?=
 =?utf-8?B?RDF2bFBpMzkram1remRDM0djbGxJMXNFQUs3NGVxLzlCa05kWVNVNHd6Rk00?=
 =?utf-8?B?WC9PbktKYVF1bTUxcjZ3V0Y2RzYyWWp4OUFyRXNmL2lzdGVxdGFmcjhQNlNq?=
 =?utf-8?B?MEpvQ2Q3U29xY0h3bEl3Q21GWFBObnJ4WjdkYU5ja0h3ZjVjWEFpaFFDamFN?=
 =?utf-8?B?TndEZ2c1RUxHR0ZlVUZuWVFUV05ZSm9ORVlmM1UzZ0U3OGx5TlBSSkt6dWE2?=
 =?utf-8?B?NFVVYVMzOGR6enpvS3ZCUzNteFArWFR0ZjdBUmY0MTQ1QzhyY2tWOXVFaUZM?=
 =?utf-8?B?bi84QUJRbGV0V21NbkljbksyUEplTW9wZ3JLUHJUUlpVaE91SWVFaGV6dkNh?=
 =?utf-8?B?U1dialVrL1dSUjdpZ1RNL3pEc2xXNS96bzR0NW5LQ0VLMk9GRHJZbERJT04x?=
 =?utf-8?B?ZTBnbnZTaWhHaVVxdVMxSXZVakhwWFBLdzdUdWdpLzQxQ0FlYlFZRkJkZ2Vu?=
 =?utf-8?B?OTNXcXBxVXgyUUZnN1VqN2FtcC9zSTZoODJMYjBmU0c5K2JSZ1BGd2k5eDVk?=
 =?utf-8?B?TEprOUdvRGdQWTJBMVdJWGhHMW4vdWNyekk5Q3BpQ3JzRFVMdkJHOStya1BY?=
 =?utf-8?B?VW1BWTVVRWhUOVpyNXA1SEkvSE9wanVtcnludm04RHBHMUV0MFpVaWZqQTFI?=
 =?utf-8?B?eGFrTVpRUjV5NEUvU0o3bFNJbSs1RFdaZXg0dEQ5TjZmRHRHMUlQYTg0aWFI?=
 =?utf-8?B?WVZhV2p1d21yVkx2dEVGZkhCWXBWdTl1dlZTbldWVHVkNWdFVUQ2TkFwQ0oz?=
 =?utf-8?B?WkZ6SEcwNjF5YjNoekZQS3Q5QWV5ZUwvbTdDV2Fwc2xsV0lQcTdvNlJhTzBo?=
 =?utf-8?B?YkRsZkIwUVRWdVZXUlZRUFI0a2w2cVc0eFR1NUtjT1cwbFJTOHdKZGpWcmxJ?=
 =?utf-8?B?UTBtMXc1ems5b00vN2ZjMWdyNG96aGZMOU1OU1F1K1ZTazNXcW9teVJQOWts?=
 =?utf-8?B?RnZXdlJzSS9OUnlQWEplRE0vZUlIYnowb3pjNndrVGtRT1lRYWRuNFJoMndm?=
 =?utf-8?B?VG4vWWZieVpzVlFVLzJML2wrZllCdS9pYWozdEQ2YkhYcmtWU1lPb3hiYitE?=
 =?utf-8?B?bk9tR3hNdHB0cXpMUzZnNjVmODZzVTNtUjM1ci82SmpsQko4SDhVaHcyUmJZ?=
 =?utf-8?B?OVhTWkFKRWdDQW9vMys2VzF5TlpWRkpWSmhWYUJhblJTYURJWjcvTlN1NWRi?=
 =?utf-8?B?SUZBWjdUbnRaZm9TSnNsdmEySy9tT3VBekYzNVhkYi9Fd3BKRGpXSGRHZXNy?=
 =?utf-8?B?ZzVhUmhTLzVuZjJMcUs3bEkrcHoyUW5KckVlYWZxd2FEVmFWaTZOMWcxMU15?=
 =?utf-8?Q?VorCjY4D7XFoVn5R0e+HZCNWswde5f07NZ+OWGbOOvHU=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3195ace-9d73-462d-5c6e-08dc1b327e57
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2024 10:11:28.4067
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB2152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_021141_429360_66E2EC23 
X-CRM114-Status: GOOD (  15.46  )
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

Ck9uIDIwMjQvMS8yMiAxNjoxMCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiBPbiAxOC8w
MS8yMDI0IDA2OjI5LCBDaGVuIFdhbmcgd3JvdGU6Cj4+IE9uIDIwMjQvMS8xNiAxOTozNywgQ2hl
biBXYW5nIHdyb3RlOgo+Pj4gT24gMjAyNC8xLzE2IDE4OjA2LCBLcnp5c3p0b2YgS296bG93c2tp
IHdyb3RlOgo+Pj4+IE9uIDE2LzAxLzIwMjQgMDg6MjEsIENoZW4gV2FuZyB3cm90ZToKPj4+Pj4g
RnJvbTogQ2hlbiBXYW5nIDx1bmljb3JuX3dhbmdAb3V0bG9vay5jb20+Cj4+Pj4+Cj4+Pj4+IEFk
ZCBkb2N1bWVudGF0aW9uIHRvIGRlc2NyaWJlIFNvcGhnbyBTeXN0ZW0gQ29udHJvbCBmb3IgU0cy
MDQyLgo+Pj4+Pgo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBDaGVuIFdhbmcgPHVuaWNvcm5fd2FuZ0Bv
dXRsb29rLmNvbT4KPj4+Pj4gLS0tCj4+Pj4+ICDCoCAuLi4vc29jL3NvcGhnby9zb3BoZ28sc2cy
MDQyLXN5c2N0cmwueWFtbMKgwqDCoMKgIHwgNDYKPj4+Pj4gKysrKysrKysrKysrKysrKysrKwo+
Pj4+PiAgwqAgMSBmaWxlIGNoYW5nZWQsIDQ2IGluc2VydGlvbnMoKykKPj4+Pj4gIMKgIGNyZWF0
ZSBtb2RlIDEwMDY0NAo+Pj4+PiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc29j
L3NvcGhnby9zb3BoZ28sc2cyMDQyLXN5c2N0cmwueWFtbAo+Pj4+Pgo+Pj4+PiBkaWZmIC0tZ2l0
Cj4+Pj4+IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvYy9zb3BoZ28vc29w
aGdvLHNnMjA0Mi1zeXNjdHJsLnlhbWwKPj4+Pj4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3Mvc29jL3NvcGhnby9zb3BoZ28sc2cyMDQyLXN5c2N0cmwueWFtbAo+Pj4+Pgo+Pj4+
PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+Pj4+PiBpbmRleCAwMDAwMDAwMDAwMDAuLjdiNTBiYjU2
YjRjZgo+Pj4+PiAtLS0gL2Rldi9udWxsCj4+Pj4+ICsrKwo+Pj4+PiBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9zb2Mvc29waGdvL3NvcGhnbyxzZzIwNDItc3lzY3RybC55YW1s
Cj4+Pj4+IEBAIC0wLDAgKzEsNDYgQEAKPj4+Pj4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IChHUEwtMi4wIE9SIEJTRC0yLUNsYXVzZSkKPj4+Pj4gKyVZQU1MIDEuMgo+Pj4+PiArLS0tCj4+
Pj4+ICskaWQ6Cj4+Pj4+IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL3NvYy9zb3BoZ28v
c29waGdvLHNnMjA0Mi1zeXNjdHJsLnlhbWwjCj4+Pj4+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNl
dHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKPj4+Pj4gKwo+Pj4+PiArdGl0bGU6IFNv
cGhnbyBTRzIwNDIgU29DIHN5c3RlbSBjb250cm9sCj4+Pj4+ICsKPj4+Pj4gK21haW50YWluZXJz
Ogo+Pj4+PiArwqAgLSBDaGVuIFdhbmcgPHVuaWNvcm5fd2FuZ0BvdXRsb29rLmNvbT4KPj4+Pj4g
Kwo+Pj4+PiArZGVzY3JpcHRpb246Cj4+Pj4+ICvCoCBUaGUgU29waGdvIHN5c3RlbSBjb250cm9s
IGlzIGEgcmVnaXN0ZXJzIGJsb2NrIChTWVNfQ1RSTCksCj4+Pj4+IHByb3ZpZGluZyBtdWx0aXBs
ZQo+Pj4+PiArwqAgbG93IGxldmVsIHBsYXRmb3JtIGZ1bmN0aW9ucyBsaWtlIGNoaXAgY29uZmln
dXJhdGlvbiwgY2xvY2sKPj4+Pj4gY29udHJvbCwgZXRjLgo+Pj4+PiArCj4+Pj4+ICtwcm9wZXJ0
aWVzOgo+Pj4+PiArwqAgY29tcGF0aWJsZToKPj4+Pj4gK8KgwqDCoCBjb25zdDogc29waGdvLHNn
MjA0Mi1zeXNjdHJsCj4+Pj4+ICsKPj4+Pj4gK8KgIHJlZzoKPj4+Pj4gK8KgwqDCoCBtYXhJdGVt
czogMQo+Pj4+PiArCj4+Pj4+ICvCoCBjbG9jay1jb250cm9sbGVyOgo+Pj4+PiArwqDCoMKgICMg
Q2hpbGQgbm9kZQo+Pj4+IERyb3AgdGhlIGNvbW1lbnQsIGl0IGlzIG9idmlvdXMuIEl0IGNhbm5v
dCBiZSBhbnl0aGluZyBlbHNlLgo+Pj4+Cj4+Pj4+ICvCoMKgwqAgJHJlZjogL3NjaGVtYXMvY2xv
Y2svc29waGdvLHNnMjA0Mi1zeXNjbGsueWFtbCMKPj4+Pj4gK8KgwqDCoCB0eXBlOiBvYmplY3QK
Pj4+PiBXaHkgaXNuJ3QgdGhpcyBtZXJnZWQgaGVyZT8gWW91IGRvIG5vdCBuZWVkIHRoZSBjaGls
ZCBub2RlIHJlYWxseS4uLgo+Pj4+IHVubGVzcyB0aGUgY2xvY2sgaW5wdXRzIGFyZSBzcGVjaWZp
YyB0byB0aGF0IGNsb2NrIGNvbnRyb2xsZXIgYW5kIHlvdQo+Pj4+IHdpbGwgaGF2ZSBoZXJlIG1v
cmUgZGV2aWNlcz8gQnV0IHdoZXJlIGFyZSB0aGV5IGluIHN1Y2ggY2FzZT8KPj4+IEkgZG9uJ3Qg
c2VlIG1vcmUgZGV2aWNlcyB3aWxsIGJlIGluY2x1ZGVkIGxhdGVyLiBJdCBzaG91bGQgYmUgb2sg
dG8KPj4+IG1lcmdlIHRoZW0gaW50byBvbmUuCj4+IGhpLCBLcnp5c3p0b2YsCj4+Cj4+IEFmdGVy
IHNvbWUgZG91YmxlIGNoZWNrLCBJIGZpbmQgd2Ugd2lsbCBoYXZlIG1vcmUgZGV2aWNlcyBpbgo+
PiBzeXN0ZW0tY29udHJvbC4gRm9yIGV4YW1wbGUsIGluIHRoZSBTWVNfQ1RSTCBhcmVhLCB0aGVy
ZSBpcyBhbHNvIGEKPj4gc2VjdGlvbiBvZiByZWdpc3RlcnMgdXNlZCB0byBjb250cm9sIHRoZSAi
R2VuZXJhbCBQdXJwb3NlIEludGVycnVwdCIuCj4+IFRoZSBwY2llIGNvbnRyb2xsZXIgb2Ygc2cy
MDQyIHdpbGwgdXNlIHRoaXMgaW50ZXJydXB0IGNvbnRyb2xsZXIgd2hpY2gKPj4gaXMgZGVmaW5l
ZCBpbiBTWVNfQ1RSTCwgd2Ugd2lsbCBhZGQgaXQgaW4gbGF0ZXIgd29yay4KPj4KPiBJIGV4cGVj
dCB0aGVuIGFsbCBkZXZpY2VzIHRvIGJlIGRvY3VtZW50ZWQuCgpoaSwgS3J6eXN6dG9mLgoKRmly
c3QsIEknbSB2ZXJ5IHNvcnJ5IGZvciBoYXZpbmcgZG91YmxlLWNoZWNrZWQgd2l0aCB5b3UgZm9y
IHRoaXMgc3lzdGVtIApjb250cm9sbGVyIGFuZCBjaGlsZCBub2RlIGlzc3VlLCBidXQgdGhpcyB0
aW1lIEknbSBzdXJlIHRoZXJlIHNob3VsZCBiZSAKbm8gbW9yZSBjaGlsZCBub2RlcyBleGNlcHQg
dGhlIGNsb2NrIGFuZCBpbnRlcnJ1cHQgY29udHJvbGxlcnMsIHRob3VnaCAKdGhlcmUgYXJlIHNv
bWUgb3RoZXIgcmVnaXN0ZXJzIGluIFNZU19DVFJMIHNlY3Rpb24sIGJ1dCB3ZSB3aWxsIG5vdCB1
c2UgCnRoZW0gdGlsbCBub3cuCgpPbmUgcXVlc3Rpb24sIHdoZW4geW91IHNheSAidG8gYmUgZG9j
dW1lbnRlZCIsIGRvIHlvdSBtZWFuIEkgbmVlZCB3cml0ZSAKYmluZGluZy95YW1sIGZpbGVzIGZv
ciBvdGhlciBjaGlsZCBub2RlPyBCdXQgdGhleSBleGNlZWQgdGhlIHNjb3BlIG9mIAp0aGlzIHBh
dGNoc2V0ICh0aGlzIHBhdGNoc2V0IGlzIGZvciBjbG9jayBzdXBwb3J0IG9ubHkpLiBUaGF0J3Mg
d2h5IEkgCnN1Z2dlc3QganVzdCBhZGQgY2xvY2stY29udHJvbGxlciBpbiB0aGlzIHBhdGNoc2V0
IGFuZCB0byBhZGQgdGhlIAppbnRlcnJ1cHQgY29udHJvbGxlciBpbiBhbm90aGVyIHBhdGNoc2V0
IGZvciBwY2llIHN1cHBvcnQuIFRoaXMgCm1lY2hhbmlzbSBzaG91bGQgYmUgc3VpdGFibGUgZm9y
IG91ciBleHBhbnNpb24uCgpUaGFua3MsCgpDaGVuCgo+Cj4gQmVzdCByZWdhcmRzLAo+IEtyenlz
enRvZgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
