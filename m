Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15D53C27C6E
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Jun 2024 07:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:From:Cc:To:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ymdz5g4Dti+Zyd3zjD6jyCZj7dvqls9jsur6+kmNmFo=; b=qbFY1hlWnqJZ3d48PYQmbFm+iH
	yP0GSpneo9imley0vtDXYFLjaZOehMSFJ0ieGHKJKBxZ+uhC3VCVkjVD1/xTySmZ35JGbjL+OgXqi
	AC0B3wZBEnSouU5SRD4wS9MtR6Ah5TxiMkxvMyzTEXgvBTTFsbCE+XMnBOwfe7ZB3Jrpddvh3rDcc
	mqgaTWK/ao/2D/2L1yNyBl41KYPhP/xrxqL4LNkUT1xt4gyjFpsjh+eR6vzuuzIC/nkyTPung/Pzv
	eSa9hFdDbI3xKZ54kGYWjrwZnihSyEdeSik+wUPIaLnK9DuJi58UXDFmSPx9TAhoUF5qJJNvVfOep
	nIsL1p0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI1Oi-00000001nQJ-3Sis;
	Fri, 14 Jun 2024 07:30:56 +0000
Received: from mail-maxind01olkn20801.outbound.protection.outlook.com ([2a01:111:f403:281b::801] helo=IND01-MAX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI1MT-00000001mBh-2xBn
	for linux-riscv@lists.infradead.org;
	Fri, 14 Jun 2024 07:28:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i8ANci2O8Wi46C2vYMcATzQuGV8C9Set4YNvlKTHvb24HmmhtrEMbmDzfU1jubDvPIU4VrLL28zlstsIKMCGP7buqpG0xfSumK99+afG8pzxVpXk4QCexW5+gGWkgoq+VYYCbtpbFgWP8pti6wO0k1VJPpLmmloWynrGibBTeR3lA5cG5dCrmVwEG7PJ4EDzobd0urJRxi6cGKEuY6CI7q0+wEmhIegG49uUTVgPqArussdbXbfadF51HrpijxaHe+6fc0sbZJ2bpHtf03DJ1ph8dAG1N8CdM+Xpdn4+4UIfXM5Jp8mnWdzI+tGa6fNFXpQYqyILrnigNSHwYVWnMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FNaWefvVbNUQ9DZippYyD6DsamDuNoqw8MJ20IeKheA=;
 b=gy8MBAxNsOt2DNqNRVQk4Q/al5Tap4uVp3e3dDGiakGfhSBbLYECNW0qfdjEMsGEmx4nC41MGRESjygFdBc+MUCr9mYLjrZddipCqHgOvuk1a8mLrhcK91mJGkU67ZZsatgfn89MZu5v8kfxUzbQeRMrQd23KloFBzEWIRTjz/nQb61LG1T+5UpoZQ8O4B2ajKp7uFo0/Vwbco1i7nA4IrBThaq82CdlWitjMWEowRVfFxN4cBdmQKuKDnvAwxuwDbEH6zrdnq+WYgoJmI6HkXXs6UoV+ExKmXHmhH0ADwAf55Ux3kk0ZemU2KKRqTJ2df6MHty7HkbuwIKln4QTBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FNaWefvVbNUQ9DZippYyD6DsamDuNoqw8MJ20IeKheA=;
 b=AW5Ri04r+K3iblF0JRQPnn/cz7tgWrb47xT/9j9QzIkfxj8V8rSPoARvaY9fg+jkD+/TavszBs1VuMKD/qGHA3b66fYPpbEyLylSb8JBakQzx5P4jrDPs3imBvLzy6tNxl4c4A3DdjF7cVzw3Cutx7YE1+jNA4pEWjVzIcpjna6sWH5hrr/fmtrzRjz3SqQuwWKc8U48rD5TycsmQCWTnztdDDcxH2RQZri8IME85SpLgFexuOamJ9GerB9E4OdHjlQgLoANvTG5KsKYRftt56pB6BoYkHKTQIaAKwlD5P4XJssMQAyVaDdLFrDLCwcTjJPD4Dw2A233uK5nG2AtNg==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by MA0P287MB0678.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:11a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.25; Fri, 14 Jun
 2024 07:28:28 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c%3]) with mapi id 15.20.7677.024; Fri, 14 Jun 2024
 07:28:28 +0000
Message-ID: <MA0P287MB28221A333D852974F55E3228FEC22@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Fri, 14 Jun 2024 15:28:22 +0800
User-Agent: Mozilla Thunderbird
To: Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc: Conor Dooley <conor@kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Inochi Amaoto <inochiama@outlook.com>,
 Xiaoguang Xing <xiaoguang.xing@sophgo.com>, haijiao.liu@sophgo.com,
 Chao Wei <chao.wei@sophgo.com>, unicorn_wang@outlook.com
From: Chen Wang <unicorn_wang@outlook.com>
Subject: [GIT PULL] RISC-V Sophgo SG2042 clock drivers for v6.11
X-TMN: [V6hmKVxa+2TXGYhWZ337mj1u1hjF14KI]
X-ClientProxiedBy: SG2PR04CA0200.apcprd04.prod.outlook.com
 (2603:1096:4:187::15) To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID: <e2a72fdf-be39-483a-9992-f46338662ee2@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|MA0P287MB0678:EE_
X-MS-Office365-Filtering-Correlation-Id: 1986975e-7254-490d-aa68-08dc8c43958a
X-Microsoft-Antispam: BCL:0;ARA:14566002|461199023|3412199020|4302099008|440099023|1602099007|1710799023;
X-Microsoft-Antispam-Message-Info: PUYoOBv3ixO/wZAHwk+ofCFemmftZLXYhOrMKxVP04fq09c8rWwTXvJKWi7Kla8TBmJUMV+90ib9NrjBRpj/pSd/ukFEAjUBGGu/KF799jOOaFUz5DEmf53pZuVgEL+/vWR6PZoIjH/jGIzsqi0cOBUv0On5xEYDqRWUbzITjIF8aotMVNnDIwUyUKTJ8bZDtKG4P/RinLHOw/DjASmGFewaJc5NvATpM0ovyR3AT93Fy2DsPQa5o7PP9tSvjXTw3VyZD38bzVOzsmmAdpB1y2BIntPNFmeLACGWK6dOrd6QwJVncf1iZl56w6Cs84H0IEyYdEKm/mtL6JF8KBPiZz7/K1ObUfOG5DkDcZodHHaZ0OrXX68poamCs3o45e1r6bPI9Qmx5apB3/YaFkUYFCekuydH24cBqv27L2NzDIhozMPyy2ephuToF4Hv6hZBJVJRSfNu7y1uhvTHZkDLYIEEQAJ8oj6yfBBViryb0Rme7D2CgJRBICNCz0mtQLDMyffA/Stmy3RiWnMyWbxuU9KWA4eCggViMGXh0UGybxSUSp3/E3mIxUCyQts72Y+r91GOYkfmeP57kW4uY9a6RznN8Su44hXW6rDsbHYDKQseWeWYyhzYsHYWAkjOGMT2fbvA/l3GlS9ejFLjq2YKt6RcDM1L3WHzWb3XY46X5p8nimsB9bx+OAqByBVeuPZlEBqIK3xp2j4FVP8Z0/cFwBiDKiF7PXBewXy/G5rUsTE=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WElJV2FhNXpkdW1qdVBFS1RrQkFJQXlLSGVZMmpxR1hOYy9iRS85eXlGdEtx?=
 =?utf-8?B?Q0cvQ3dxNWZpK1FGM2VtdUZ3ZHJHaVYwWVNxWFN1VnptZVZiUkZiZm4xRGps?=
 =?utf-8?B?OGlzOXNTTDI3OVFyWldPaHRHS2tWTXorQnhTKzEwaVhoWlFubExBZUV0MDZ5?=
 =?utf-8?B?ak9CQkRaUUNNU1g2ZHFOYVl3WmhaWG5SZWpGWmp0SWduV3hVVW1pVktSMTJW?=
 =?utf-8?B?bXkwNktsbWMwR1VCV1JMd05YTldqZkQ0MjdPODdrQmxPTjkvZ0NncmxPVHRy?=
 =?utf-8?B?cnZuYWxZbkN3RmZmLytGblBFMVlONDRmRUJQZWYvY3NzM1FHREdCVWFuOW9u?=
 =?utf-8?B?bWhVa2VKdHdZV3B2cmhveW8wajVLV01BTHQ4RklqN1lrUm9RRCs4MEMvbmt4?=
 =?utf-8?B?Z1YybVI0Vm1KMDFYRTNzMXFyWXZzOXVSNDdwSGRKYmllaC8rMlN3eVF2aHMv?=
 =?utf-8?B?a1lRTjFNNHpPVDl6N3lxa2xGd2hXYXV5dm03TTlhbE5UVGl1TTlvOTNFaG55?=
 =?utf-8?B?bU1iYVRWWXAwZ2lqVkFyT3pWWkRXZ0llbVJQZUZlY0VxWDdsNDZIcDJTdjRI?=
 =?utf-8?B?MEM3RUxBWExxOXYxWlhEWHJGK0VIWXJDVlg5cmpPS0FHcDVOVTVTbHZpYSs4?=
 =?utf-8?B?Qk1MR2NBcnlwUCs4bGRESTN1N205YjcrTldubk9wZnNqaEVBVHRXdHc1ZEgv?=
 =?utf-8?B?aWpTVVVUV21jdzVOVDZUNUFNTXh4QzE5anh0RTVTbmNQL2NiZlVOMGQ5RHlO?=
 =?utf-8?B?dnJZcWIxTU9ncjF0WTdxcGc4S24yaUcyMTJSbTVqSjE1MXpiTGtRYXBjZ21j?=
 =?utf-8?B?SUtvc25icmRnUDJTWTdBNzJMeE92NDhPWG9uMjhCcnc4ODFMeTBIVHVJZ3Rm?=
 =?utf-8?B?RFZkMXZHNTRReXdqRzBlRFJjc0hKRGVqRHlLZDVPaWNYVkxxemQ5cHgxMkgr?=
 =?utf-8?B?anJJaHA5VCtzSzRzMlcrcjAzeE1sYWV6dko4ekF1QkxsSmxsVXNOYmQ4V3NT?=
 =?utf-8?B?UjJiTnBkVFZIYkd0bERhWktucjBXRTBsb2lmM1VoNFR4Rmp0UkFkWndmQzRv?=
 =?utf-8?B?elNNZ1NneXdQQytqNFpaN0c0cGpFR1NtaEVRODBCRFQwOUxCOWN2OTdJWGxL?=
 =?utf-8?B?S2NpcXk3ZWtONml5a0J0MU9uZzRWTE5tbFZFenRWbkg4Rjl1S3ZGdjNXenFa?=
 =?utf-8?B?NWNnSDRjaG1yWHBOTjJOOUsvb0FZUFZuMXZjVDBJZ0pzZFV5ZzRkMENJbS9j?=
 =?utf-8?B?YUhjSjh6SkwybVVNUVMxV3B4a2hqenFMM1Q3eWkxSzJWbFdyVXJHZEo0S1BR?=
 =?utf-8?B?QlZRTEZIWUkxandmQkRIY0tEcW9UTFFnTjRQK2MvTERuSHVJN2pQQjcreWdj?=
 =?utf-8?B?b0g5cE40SkRRVDEvTlVLSzM3QkdSUWRtVEFYYkNQTHNaMnBhRWNicXREd1NL?=
 =?utf-8?B?Rk5ob3B1OHo4Q2tKWmROY0NlaG9oUHV0cyt1QWExNmNQV3JleWV0cE1vV1J6?=
 =?utf-8?B?N0ZmYnZXTE9VMjRNZFlrWTNXcWJtdWwwclo5N0pwaW5wQmM3YzFHa3pTYW9B?=
 =?utf-8?B?VVhtcWtWamo3b241a2hLWFhpT2VhR29vK3FGN2FLUDFGdGpBQTdWcDM2N3Qw?=
 =?utf-8?B?N3JzVnJJSStoSUVUZlUvMjZPUFNEcWdFL1NSSUg1N003eVgwZENLZDRZRXFE?=
 =?utf-8?Q?VMzX9Th7Ocl7kVj3p3fY?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1986975e-7254-490d-aa68-08dc8c43958a
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2024 07:28:28.1165
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB0678
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240614_002838_005934_FE1B5D72 
X-CRM114-Status: UNSURE (   7.45  )
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

SGV5LCBTdGVwaGVuLAoKUGxlYXNlIHB1bGwgY2xvY2sgY2hhbmdlcyBmb3IgUklTQy1WL1NvcGhn
by9TRzIwNDIuCgpGb3IgZHRzIHBhcnQsIEkgd2lsbCBoYW5kbGUgaXQgYXQgbXkgc2lkZS4KCkkg
c2VuZCB0aGlzIFBSIGp1c3Qgd2FudCB0byBleHBlZGl0ZSBwYXRjaGVzIGZvciB0aGlzIGNsb2Nr
IGRyaXZlci4gVGhlIApwYXRjaGVzIGhhdmUgZ29uZSB0aHJvdWdoIDE2IHJvdW5kcyBvZiByZXZp
ZXcgWzFdLCBhbmQgSSBoYXZlIGNhcmVmdWxseSAKY2hlY2tlZCBhbmQgcmV2aXNlZCBhbGwgb2Yg
dGhlbSBiYXNlZCBvbiBldmVyeW9uZSdzIGNvbW1lbnRzLgoKTGluazogCmh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2xpbnV4LXJpc2N2L2NvdmVyLjE3MTc2NjE3OTguZ2l0LnVuaWNvcm5fd2FuZ0Bv
dXRsb29rLmNvbS8gClsxXQoKVGhhbmtzLApDaGVuLgoKVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNp
bmNlIGNvbW1pdCAxNjEzZTYwNGRmMGNkMzU5Y2YyYTdmYmQ5YmU3YTBiY2ZhY2ZhYmQwOgoKIMKg
IExpbnV4IDYuMTAtcmMxICgyMDI0LTA1LTI2IDE1OjIwOjEyIC0wNzAwKQoKYXJlIGF2YWlsYWJs
ZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6CgogwqAgaHR0cHM6Ly9naXRodWIuY29tL3NvcGhn
by9saW51eC5naXQgdGFncy9yaXNjdi1zZzIwNDItY2xrLWZvci12Ni4xMQoKZm9yIHlvdSB0byBm
ZXRjaCBjaGFuZ2VzIHVwIHRvIDQ4Y2Y3ZTAxMzg2ZTdlMzVlYTEyMjU1YmM0MDFiZGQ0ODRjMzRl
N2Q6CgogwqAgY2xrOiBzb3BoZ286IEFkZCBTRzIwNDIgY2xvY2sgZHJpdmVyICgyMDI0LTA2LTE0
IDE0OjQ5OjQwICswODAwKQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpSSVNDLVYgU0cyMDQyIGNsb2NrIGRyaXZlciBjaGFu
Z2VzIGZvciB2Ni4xMQoKU29waGdvOgpBZGRlZCBjbG9jayBzdXBwb3J0IGZvciBzZzIwNDIKClNp
Z25lZC1vZmYtYnk6IENoZW4gV2FuZyA8dW5pY29ybl93YW5nQG91dGxvb2suY29tPgoKLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQpDaGVuIFdhbmcgKDQpOgogwqDCoMKgwqDCoCBkdC1iaW5kaW5nczogY2xvY2s6IHNvcGhnbzog
YWRkIHBsbCBjbG9ja3MgZm9yIFNHMjA0MgogwqDCoMKgwqDCoCBkdC1iaW5kaW5nczogY2xvY2s6
IHNvcGhnbzogYWRkIFJQIGdhdGUgY2xvY2tzIGZvciBTRzIwNDIKIMKgwqDCoMKgwqAgZHQtYmlu
ZGluZ3M6IGNsb2NrOiBzb3BoZ286IGFkZCBjbGtnZW4gZm9yIFNHMjA0MgogwqDCoMKgwqDCoCBj
bGs6IHNvcGhnbzogQWRkIFNHMjA0MiBjbG9jayBkcml2ZXIKCiDCoERvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9jbG9jay9zb3BoZ28sc2cyMDQyLWNsa2dlbi55YW1sIHzCoMKgIAo2
MSArKysrKwogwqBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY2xvY2svc29waGdv
LHNnMjA0Mi1wbGwueWFtbCB8wqDCoCA1MyArKysrCiDCoERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9jbG9jay9zb3BoZ28sc2cyMDQyLXJwZ2F0ZS55YW1sIHzCoMKgIAo0OSArKysr
CiDCoGRyaXZlcnMvY2xrL3NvcGhnby9LY29uZmlnIHzCoMKgIDI4ICsrKwogwqBkcml2ZXJzL2Ns
ay9zb3BoZ28vTWFrZWZpbGUgfMKgwqDCoCA0ICsKIMKgZHJpdmVycy9jbGsvc29waGdvL2Nsay1z
ZzIwNDItY2xrZ2VuLmMgfCAxMTUyIAorKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIMKgZHJp
dmVycy9jbGsvc29waGdvL2Nsay1zZzIwNDItcGxsLmMgfMKgIDU3MCAKKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrCiDCoGRyaXZlcnMvY2xrL3NvcGhnby9jbGstc2cy
MDQyLXJwZ2F0ZS5jIHzCoCAyOTEgKysrKysrKysrKysrKysrKysrKysrCiDCoGRyaXZlcnMvY2xr
L3NvcGhnby9jbGstc2cyMDQyLmggfMKgwqAgMTggKysKIMKgaW5jbHVkZS9kdC1iaW5kaW5ncy9j
bG9jay9zb3BoZ28sc2cyMDQyLWNsa2dlbi5oIHzCoCAxMTEgKysrKysrKysKIMKgaW5jbHVkZS9k
dC1iaW5kaW5ncy9jbG9jay9zb3BoZ28sc2cyMDQyLXBsbC5oIHzCoMKgIDE0ICsrCiDCoGluY2x1
ZGUvZHQtYmluZGluZ3MvY2xvY2svc29waGdvLHNnMjA0Mi1ycGdhdGUuaCB8wqDCoCA1OCArKysr
KwogwqAxMiBmaWxlcyBjaGFuZ2VkLCAyNDA5IGluc2VydGlvbnMoKykKIMKgY3JlYXRlIG1vZGUg
MTAwNjQ0IApEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY2xvY2svc29waGdvLHNn
MjA0Mi1jbGtnZW4ueWFtbAogwqBjcmVhdGUgbW9kZSAxMDA2NDQgCkRvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9jbG9jay9zb3BoZ28sc2cyMDQyLXBsbC55YW1sCiDCoGNyZWF0ZSBt
b2RlIDEwMDY0NCAKRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL3NvcGhn
byxzZzIwNDItcnBnYXRlLnlhbWwKIMKgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvY2xrL3Nv
cGhnby9jbGstc2cyMDQyLWNsa2dlbi5jCiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2Ns
ay9zb3BoZ28vY2xrLXNnMjA0Mi1wbGwuYwogwqBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9j
bGsvc29waGdvL2Nsay1zZzIwNDItcnBnYXRlLmMKIMKgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZl
cnMvY2xrL3NvcGhnby9jbGstc2cyMDQyLmgKIMKgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUv
ZHQtYmluZGluZ3MvY2xvY2svc29waGdvLHNnMjA0Mi1jbGtnZW4uaAogwqBjcmVhdGUgbW9kZSAx
MDA2NDQgaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9zb3BoZ28sc2cyMDQyLXBsbC5oCiDCoGNy
ZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL3NvcGhnbyxzZzIwNDIt
cnBnYXRlLmgKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
