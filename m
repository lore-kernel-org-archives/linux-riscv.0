Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CEBCE8FDD1
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 07:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KkMkWzgRSVmJ8PB6fTleWQ6eYYjFZdYAA/7dJKqrsQ0=; b=45AuHUV2EZfJPBikr7TUF7M71o
	7jNf1loa3/efvOyJrbo7KZWjV/5RKUvGb15SpkDW/FwI5S6QvETs/3KpDRpF8Ex0UHo7Lmr+R3wd4
	bdbHxm2gyI9c4DeHhBbD7+6+eWfWqbT7CKAgUuRiYejRHBz24GBbFyv7X9ThM1nCTOPNwhJ1wkGCX
	LqXGBbSIuiC4mIP34tmK1Qkutza3HPS4tHIqq9e+0BDxpHg4HnJJPZToCwLWRD4YY//zmG0J1ddA3
	nUCiutQx91Lnb1dp0wLLzTwW9uNp9kZH9JHhKf/IShxHh32Ier6cyds1DDuWEtk15ojI30uJMVqA0
	QC7x9ZIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnwTF-00GdYK-1v;
	Wed, 04 Oct 2023 07:39:01 +0000
Received: from mail-maxind01olkn20800.outbound.protection.outlook.com ([2a01:111:f403:700f::800] helo=IND01-MAX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnwTC-00GdX7-2J
	for linux-riscv@lists.infradead.org;
	Wed, 04 Oct 2023 07:39:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QyFnSppb1ahuD2VBoyR9lThNl0bM34Zm3PX7jr0retaWs7tva6KH+RDCFezmWmq0iALml8b/n9Kd+IzUZNrTWuK/8Qh3f4JeShHfT8MoUbjFdhHK82Dk2SBz695lsWBtO1bGW7R6grPOvxc9DJaYg6FrlUHgogLYM80S8tGIft+a2NpX+gdrdpGouIdFWG+2wyXOCiDglmntqNI5EgqU29Nd/NbU0DmitRxIUiJ3RExGGLSaBt6uruIgcG8NCmkaHJZEGLzGKCpKbswsFWqxh4V5b1/4rQ47s674j96GkMmVYGrtYJYXVdIBs/SW/ePzccCkKMRMSG2wbVfHoGVWEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Od5DAXaAGYhsHoFqRXoMyOUCBjUtrqtgWFXubq9hH7A=;
 b=ZvZipvlyHhz2TNG6JGiNwsJd7xZ2tnNHujBR3ka6duZCH14A28Wb6e5MpnDS9+0/2xYYsOb8/LsquF0hXdEzbO5Nqx01eA8Wga9k2uCCmJVdQp4E+nMguI6AMTgfsI8jD4yDblal6meku0Z/OFwJn10cpTlZYOHz4Z2dpaFdwKBNP6yFn1KeX8S0I4dsTF8TWHlvm05R/g304sVUVJjMifgRILXYJ58ACy8HqBqgT9k7akoxp2AgXHHXPrfWLa5/DuSeL1XVAPn9N8WH37jQuXGEH4jt772qt44GVpnXaf7T9nCKi0ECuDk5drFgp1eACaiWEkw3Skem/nUkbIDLKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Od5DAXaAGYhsHoFqRXoMyOUCBjUtrqtgWFXubq9hH7A=;
 b=KaYZDbiLy3+n2b/iBJtSo5vtE58xY7zh29/hBo9Y04+UcbKMhYiiP3SdnPIHHkLFCNZfOzrz05mdn7EEWGVD/SjzUTQiRFHC6txyhGmuK5bbyYBMDEKf/4RZB8z5vP0IXHqqw8DeLljQMLCTpMWaEmwFboWnzxMc7ezGRDie0uqkboDNPTDqvAfOZ5OKdi0XSGrvG6D3QK7Y0jsdXvT6un3bfT4MDmXfaLrKXD5GYsBHHQNTcywuY6nmFrDozdK+rs8AHhYs3/u51JWhzt5hf9oXU0NOH7xvwKFi5qA9BJobyas3Hj0AsVazUulAMUYcndvrSxbx5XSwZ3MOqVJ/Jw==
Received: from MA0P287MB0332.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:ab::5) by
 PN3P287MB1848.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1a2::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.35; Wed, 4 Oct 2023 07:23:59 +0000
Received: from MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
 ([fe80::efe9:8d54:281b:23f7]) by MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
 ([fe80::efe9:8d54:281b:23f7%3]) with mapi id 15.20.6838.028; Wed, 4 Oct 2023
 07:23:59 +0000
Message-ID: <MA0P287MB033277186E21A09127407452FECBA@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
Date: Wed, 4 Oct 2023 15:23:54 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] riscv: dts: sophgo: add initial CV1800B SoC device
 tree
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
 <20230930123937.1551-5-jszhang@kernel.org>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20230930123937.1551-5-jszhang@kernel.org>
X-TMN: [es5SnY2jD3jNz/solUs2BPXbk+GIgyxJ]
X-ClientProxiedBy: SI2PR02CA0040.apcprd02.prod.outlook.com
 (2603:1096:4:196::6) To MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:ab::5)
X-Microsoft-Original-Message-ID: <b26077d2-0db6-42f8-95d3-2c5a50caba6a@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB0332:EE_|PN3P287MB1848:EE_
X-MS-Office365-Filtering-Correlation-Id: 290731ac-6c5d-4ad5-c45c-08dbc4aae049
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UF/vmHjvrnBmk1pC85p20SCincox0GAvohhG3BqAAyx5tbqEv6s45+juWR4wpCbnll3dpXqJwqv0MiUgHLkmeQM98O8vZnWSozQeYABBs3DiLZ8KdyeVzAgb/0zJmKyokmNg896Ix9lo/TUBPgnQ0FG8taI0erJqEUH5NvuD0a294ccKrUZ3a8WDRCJEhLmnmevBkdjPMf1/RKF+G7VHJUPncbdmLoL7fyQPICyOeg7AW7x4xarI8LrsDn1WC+oV9Y7ootvzkH8wVAg//RNYIi5Rl/A89jXWEjtRQ5RPnRLtR1pzlOvMa3RGX+VOGuClCsWweB8eBqJcTd3vqckgwTOD5phEqPa/XXkPnG6UsK3l8CKnGhC/k/IYhby2e6T3ygRDW2fShq3m5AcnejbYSMm1rbUptW0X5kkfFabBeExLVthiiBGMdJP/I/wskTmE/jC6so6th37DsSZ9iUPBFg+dI+ylU4u3WZHbbpibwkBQ0hvw9vFBt6+hBJzMghHi1Os1MPsjT+RTPci3aYjeGFn97En+nUhlrfn0Iq9XQ7r55Vz3SsD61CIi7QNn1Vk+
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWJlNGp0SXVDdXN0UWdLK2I5QXlDWWt1QzR5RnFSS0dJVVdLYXl5d1lUenoy?=
 =?utf-8?B?a2FxZWdrbFUzSDNLRVFTRkVMd05jQ2grZ0U2OUI1QUdWMXZTRnJVcmw1dHdv?=
 =?utf-8?B?RDkySkNMWjVNaVlrbVZzSm5keGUvZ1pjZkZyOHAxNzc2YUd1YWE3QllrQUUw?=
 =?utf-8?B?VVozaitXbmxKc3ZvZkNVNUhQMnZ2OG9JbEhDZjZxTUlTUitOL21pR1JqTXl3?=
 =?utf-8?B?c0xrVDRzSlA1VSt4bVpnc2RLWGtYV01Tak5BTFJzVHRxT3RsMVhhT2Z2Tm4w?=
 =?utf-8?B?RlpXaHBRZE5RZkt3NXh1eEwra2dNa2xLVEsyV2g1ZGVsZjlRZHNmdkdrVVdV?=
 =?utf-8?B?RjVRckVQMnBtUHVRajdYN1FVbmdGTkdhSU9aalJnVjFKLzlUc3pmU1Z0aFg1?=
 =?utf-8?B?K1BZYVRmcUNVSXNISk9NYytrUnVWQkwwVXF2aXJyMmRqdHp1QTBGZGNaK2lt?=
 =?utf-8?B?T1NxZFdvTk54VnB3eUQ3Zzk2aWxXVDNJczFNU2plKzZpLzFDOTB3TVFvUk51?=
 =?utf-8?B?R2JHeFcxUEpZc0FCQlRaWTNVc1ZldlpJcWtLMkE3eTdyb3FTVENkb0lxYktS?=
 =?utf-8?B?TDJuUmttZm1pcktTampWTzdRSi9NWElGODYxa3h2NHRkVmlqV0lNclpaREJO?=
 =?utf-8?B?MTVFU21JU013ZWJjRTBhTjQ5SXZ0bklBamdnMktmUkN4SzhzaGdqQWs1ZUMv?=
 =?utf-8?B?RzZEbzJOWm1sT0ZYZC9rMURQVDQ5dUc4VlA5KzBjaTk4U0ZqQ0I0MDlWU0w1?=
 =?utf-8?B?RG5ENlU0TmxlZklYaVBYRWJDdVZTMW9IM1RlWjVEQVVvcmRFK3VWaUptWWpU?=
 =?utf-8?B?eXk0M1VOU1gvSDRWcTI1ZHFTQnhzMkp5a0J6RnhReExEWXhUN3BaU1dtWDhs?=
 =?utf-8?B?OEUxelArSWlqYy84UmxqVkUvd294cWdKY25LZWJrSFl6MmFOSFczZUNHV1pl?=
 =?utf-8?B?cmlJdHNsMEk4YjNnaXNKck1kWnB5Zi9IVXBpS0VtNUpZbUo0K25Uakh4S0JN?=
 =?utf-8?B?N1NpbGRnRGxRZVFqYlhTbzJSRHZSQ09aVzBoYSs1cTZJMFpjcWVMcDZ1bEh5?=
 =?utf-8?B?LzhUcVZWdlhMU0hZWTVJKzYvbGRnWXk3UUlrdERvWUU0VlJwS1FxWm5GRklS?=
 =?utf-8?B?V0pMaExCRDRBUDlvbmhvaWUzNkVXeEsxV21GK0gra2VDVmRzTGlSYUQzaFRj?=
 =?utf-8?B?aVY4YXhHVFZjOFZYTjA2QU1NSkxqY28rNjRuZmw1L0FJaXM5bzNNcVkrVjFx?=
 =?utf-8?B?SlI4RTViWmxPSysxNlF2TktuU1VybVR0MDJYVm1KeWR0Szhhcjk0V3VSM0Q1?=
 =?utf-8?B?S1hsYWVzeWZGcFdLMG41V0R5WVNnLzFrQ3RocDBSU0IrRmwwUjc2M091R21v?=
 =?utf-8?B?OEVJV0xPM01yUDlmaGMxT1UrZWZuMnZCUGtnZ1NsaDFVU0MrWCtXT0M1V0Zm?=
 =?utf-8?B?Y2sybTVqUFhxbHl2cDh0Mk1HUER1NXpIanZ6c25Eai9uc0YrUUI3MjU1Rnk0?=
 =?utf-8?B?TGQ2WU84QktBUUo3c1J5YzBJdE9Ma1ZGM21OZ280V3A3T2FuVi9VZHhBRzA2?=
 =?utf-8?B?MUcvaHNmL0ZPcmFIaTBoMkJKR2J4a2o5NnY5QXJnNEpycWhBbkdZQ2hrZkJN?=
 =?utf-8?Q?WROO9UhUTYZtstxXggOHvzZMTq9qmLd80aQpyMji4Qr4=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 290731ac-6c5d-4ad5-c45c-08dbc4aae049
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 07:23:59.3822
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB1848
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_003858_770503_7D59F73F 
X-CRM114-Status: GOOD (  14.11  )
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

CuWcqCAyMDIzLzkvMzAgMjA6MzksIEppc2hlbmcgWmhhbmcg5YaZ6YGTOgo+IEFkZCBpbml0aWFs
IGRldmljZSB0cmVlIGZvciB0aGUgQ1YxODAwQiBSSVNDLVYgU29DIGJ5IFNPUEhHTy4KPgo+IFNp
Z25lZC1vZmYtYnk6IEppc2hlbmcgWmhhbmcgPGpzemhhbmdAa2VybmVsLm9yZz4KPiAtLS0KPiAg
IGFyY2gvcmlzY3YvYm9vdC9kdHMvc29waGdvL2N2MTgwMGIuZHRzaSB8IDExNyArKysrKysrKysr
KysrKysrKysrKysrKysKPiAgIDEgZmlsZSBjaGFuZ2VkLCAxMTcgaW5zZXJ0aW9ucygrKQo+ICAg
Y3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3YvYm9vdC9kdHMvc29waGdvL2N2MTgwMGIuZHRz
aQoKSGksIEppc2hlbmcsIGFzIGZhciBhcyBJIGtub3csIHNnMjA0MiBhbmQgY3YxODB4IGFyZSBu
b3cgdHJhY2tlZCBieSAKZGlmZmVyZW50IHBlb3BsZSBhbmQgZXZlbiBpbiBzb3BoZ28sIHRoZXkg
YXJlIHR3byBpbmRlcGVuZGVudCAKcHJvamVjdHMoc2cyMDQyIGlzIHRhcmdldCBmb3IgSFBDIGFu
ZCBjdjE4MHggaXMgdGFyZ2V0IGZvciBlbWJlZGVkIApkZXZpY2UpLiBUbyBmYWNpbGl0YXRlIGZ1
dHVyZSBtYW5hZ2VtZW50IGFuZCByZXZpZXcsIEkgcmVjb21tZW5kIApyZWdpc3RlcmluZyB0aGUg
bWFpbnRhaW5lciBpbmZvcm1hdGlvbiBpbiB0d28gZW50cmllcyBpbiBNQUlOVEFJTkVSUy4gClRo
ZSBleGFtcGxlIGlzIGFzIGZvbGxvd3M6CgpgYGAKClNPUEhHTyBDVjE4MFggREVWSUNFVFJFRVMK
TTrCoCBKaXNoZW5nIFpoYW5nIDxqc3poYW5nQGtlcm5lbC5vcmc+CkY6wqAgYXJjaC9yaXNjdi9i
b290L2R0cy9zb3BoZ28vY3YxODAwYi1taWxrdi1kdW8uZHRzCkY6wqAgYXJjaC9yaXNjdi9ib290
L2R0cy9zb3BoZ28vY3YxODAwYi5kdHNpCgpTT1BIR08gU0cyMDQyIERFVklDRVRSRUVTCk06wqAg
Q2hhbyBXZWkgPGNoYW8ud2VpQHNvcGhnby5jb20+Ck06wqAgQ2hlbiBXYW5nIDx1bmljb3JueHdA
Z21haWwuY29tPgpTOsKgIE1haW50YWluZWQKRjrCoCBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhn
by9NYWtlZmlsZQpGOsKgIGFyY2gvcmlzY3YvYm9vdC9kdHMvc29waGdvL3NnMjA0Mi1jcHVzLmR0
c2kKRjrCoCBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9zZzIwNDItbWlsa3YtcGlvbmVlci5k
dHMKRjrCoCBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9zZzIwNDIuZHRzaQpGOsKgIERvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9zb3BoZ28ueWFtbApgYGAKCkZvciBN
YWtlZmlsZSBhbmQgc29waGdvLnlhbWwgc3VjaCBjb21tb24gZmlsZXMsIGp1c3Qga2VlcCBpbiBz
ZzIwNDIgCmVudHJ5IHNob3VsZCBiZSBmaW5lLgoKQENvbm9yLCB3aGF0IGRvIHlvdSB0aGluaz8K
ClRoYW5rcywKCkNoZW4KCgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhn
by9jdjE4MDBiLmR0c2kgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9jdjE4MDBiLmR0c2kK
PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAwMC4uODgyOWJlYmFhMDE3
Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvc29waGdvL2N2MTgw
MGIuZHRzaQo+IEBAIC0wLDAgKzEsMTE3IEBACj4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVy
OiAoR1BMLTIuMCBPUiBNSVQpCj4gKy8qCj4gKyAqIENvcHlyaWdodCAoQykgMjAyMyBKaXNoZW5n
IFpoYW5nIDxqc3poYW5nQGtlcm5lbC5vcmc+Cj4gKyAqLwo+ICsKPiArI2luY2x1ZGUgPGR0LWJp
bmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL2lycS5oPgo+ICsKPiArLyB7Cj4gKwljb21wYXRp
YmxlID0gInNvcGhnbyxjdjE4MDBiIjsKPiArCSNhZGRyZXNzLWNlbGxzID0gPDE+Owo+ICsJI3Np
emUtY2VsbHMgPSA8MT47Cj4gKwo+ICsJY3B1czogY3B1cyB7Cj4gKwkJI2FkZHJlc3MtY2VsbHMg
PSA8MT47Cj4gKwkJI3NpemUtY2VsbHMgPSA8MD47Cj4gKwkJdGltZWJhc2UtZnJlcXVlbmN5ID0g
PDI1MDAwMDAwPjsKPiArCj4gKwkJY3B1MDogY3B1QDAgewo+ICsJCQljb21wYXRpYmxlID0gInRo
ZWFkLGM5MDYiLCAicmlzY3YiOwo+ICsJCQlkZXZpY2VfdHlwZSA9ICJjcHUiOwo+ICsJCQlyZWcg
PSA8MD47Cj4gKwkJCWQtY2FjaGUtYmxvY2stc2l6ZSA9IDw2ND47Cj4gKwkJCWQtY2FjaGUtc2V0
cyA9IDw1MTI+Owo+ICsJCQlkLWNhY2hlLXNpemUgPSA8NjU1MzY+Owo+ICsJCQlpLWNhY2hlLWJs
b2NrLXNpemUgPSA8NjQ+Owo+ICsJCQlpLWNhY2hlLXNldHMgPSA8MTI4PjsKPiArCQkJaS1jYWNo
ZS1zaXplID0gPDMyNzY4PjsKPiArCQkJbW11LXR5cGUgPSAicmlzY3Ysc3YzOSI7Cj4gKwkJCXJp
c2N2LGlzYSA9ICJydjY0aW1hZmRjIjsKPiArCQkJcmlzY3YsaXNhLWJhc2UgPSAicnY2NGkiOwo+
ICsJCQlyaXNjdixpc2EtZXh0ZW5zaW9ucyA9ICJpIiwgIm0iLCAiYSIsICJmIiwgImQiLCAiYyIs
ICJ6aWNudHIiLCAiemljc3IiLAo+ICsJCQkJCSAgICAgICAiemlmZW5jZWkiLCAiemlocG0iOwo+
ICsKPiArCQkJY3B1MF9pbnRjOiBpbnRlcnJ1cHQtY29udHJvbGxlciB7Cj4gKwkJCQljb21wYXRp
YmxlID0gInJpc2N2LGNwdS1pbnRjIjsKPiArCQkJCWludGVycnVwdC1jb250cm9sbGVyOwo+ICsJ
CQkJI2FkZHJlc3MtY2VsbHMgPSA8MD47Cj4gKwkJCQkjaW50ZXJydXB0LWNlbGxzID0gPDE+Owo+
ICsJCQl9Owo+ICsJCX07Cj4gKwl9Owo+ICsKPiArCW9zYzogb3NjaWxsYXRvciB7Cj4gKwkJY29t
cGF0aWJsZSA9ICJmaXhlZC1jbG9jayI7Cj4gKwkJY2xvY2stb3V0cHV0LW5hbWVzID0gIm9zY18y
NW0iOwo+ICsJCSNjbG9jay1jZWxscyA9IDwwPjsKPiArCX07Cj4gKwo+ICsJc29jIHsKPiArCQlj
b21wYXRpYmxlID0gInNpbXBsZS1idXMiOwo+ICsJCWludGVycnVwdC1wYXJlbnQgPSA8JnBsaWM+
Owo+ICsJCSNhZGRyZXNzLWNlbGxzID0gPDE+Owo+ICsJCSNzaXplLWNlbGxzID0gPDE+Owo+ICsJ
CWRtYS1ub25jb2hlcmVudDsKPiArCQlyYW5nZXM7Cj4gKwo+ICsJCXVhcnQwOiBzZXJpYWxAMDQx
NDAwMDAgewo+ICsJCQljb21wYXRpYmxlID0gInNucHMsZHctYXBiLXVhcnQiOwo+ICsJCQlyZWcg
PSA8MHgwNDE0MDAwMCAweDEwMD47Cj4gKwkJCWludGVycnVwdHMgPSA8NDQgSVJRX1RZUEVfTEVW
RUxfSElHSD47Cj4gKwkJCWNsb2NrcyA9IDwmb3NjPjsKPiArCQkJcmVnLXNoaWZ0ID0gPDI+Owo+
ICsJCQlyZWctaW8td2lkdGggPSA8ND47Cj4gKwkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7Cj4gKwkJ
fTsKPiArCj4gKwkJdWFydDE6IHNlcmlhbEAwNDE1MDAwMCB7Cj4gKwkJCWNvbXBhdGlibGUgPSAi
c25wcyxkdy1hcGItdWFydCI7Cj4gKwkJCXJlZyA9IDwweDA0MTUwMDAwIDB4MTAwPjsKPiArCQkJ
aW50ZXJydXB0cyA9IDw0NSBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKPiArCQkJY2xvY2tzID0gPCZv
c2M+Owo+ICsJCQlyZWctc2hpZnQgPSA8Mj47Cj4gKwkJCXJlZy1pby13aWR0aCA9IDw0PjsKPiAr
CQkJc3RhdHVzID0gImRpc2FibGVkIjsKPiArCQl9Owo+ICsKPiArCQl1YXJ0Mjogc2VyaWFsQDA0
MTYwMDAwIHsKPiArCQkJY29tcGF0aWJsZSA9ICJzbnBzLGR3LWFwYi11YXJ0IjsKPiArCQkJcmVn
ID0gPDB4MDQxNjAwMDAgMHgxMDA+Owo+ICsJCQlpbnRlcnJ1cHRzID0gPDQ2IElSUV9UWVBFX0xF
VkVMX0hJR0g+Owo+ICsJCQljbG9ja3MgPSA8Jm9zYz47Cj4gKwkJCXJlZy1zaGlmdCA9IDwyPjsK
PiArCQkJcmVnLWlvLXdpZHRoID0gPDQ+Owo+ICsJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwo+ICsJ
CX07Cj4gKwo+ICsJCXVhcnQzOiBzZXJpYWxAMDQxNzAwMDAgewo+ICsJCQljb21wYXRpYmxlID0g
InNucHMsZHctYXBiLXVhcnQiOwo+ICsJCQlyZWcgPSA8MHgwNDE3MDAwMCAweDEwMD47Cj4gKwkJ
CWludGVycnVwdHMgPSA8NDcgSVJRX1RZUEVfTEVWRUxfSElHSD47Cj4gKwkJCWNsb2NrcyA9IDwm
b3NjPjsKPiArCQkJcmVnLXNoaWZ0ID0gPDI+Owo+ICsJCQlyZWctaW8td2lkdGggPSA8ND47Cj4g
KwkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7Cj4gKwkJfTsKPiArCj4gKwkJdWFydDQ6IHNlcmlhbEAw
NDFjMDAwMCB7Cj4gKwkJCWNvbXBhdGlibGUgPSAic25wcyxkdy1hcGItdWFydCI7Cj4gKwkJCXJl
ZyA9IDwweDA0MWMwMDAwIDB4MTAwPjsKPiArCQkJaW50ZXJydXB0cyA9IDw0OCBJUlFfVFlQRV9M
RVZFTF9ISUdIPjsKPiArCQkJY2xvY2tzID0gPCZvc2M+Owo+ICsJCQlyZWctc2hpZnQgPSA8Mj47
Cj4gKwkJCXJlZy1pby13aWR0aCA9IDw0PjsKPiArCQkJc3RhdHVzID0gImRpc2FibGVkIjsKPiAr
CQl9Owo+ICsKPiArCQlwbGljOiBpbnRlcnJ1cHQtY29udHJvbGxlckA3MDAwMDAwMCB7Cj4gKwkJ
CWNvbXBhdGlibGUgPSAic29waGdvLGN2MTgwMGItcGxpYyIsICJ0aGVhZCxjOTAwLXBsaWMiOwo+
ICsJCQlyZWcgPSA8MHg3MDAwMDAwMCAweDQwMDAwMDA+Owo+ICsJCQlpbnRlcnJ1cHRzLWV4dGVu
ZGVkID0gPCZjcHUwX2ludGMgMTE+LCA8JmNwdTBfaW50YyA5PjsKPiArCQkJaW50ZXJydXB0LWNv
bnRyb2xsZXI7Cj4gKwkJCSNhZGRyZXNzLWNlbGxzID0gPDA+Owo+ICsJCQkjaW50ZXJydXB0LWNl
bGxzID0gPDI+Owo+ICsJCQlyaXNjdixuZGV2ID0gPDEwMT47Cj4gKwkJfTsKPiArCX07Cj4gK307
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
