Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99B6FC021AA
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Feb 2025 03:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HmVh5llWbRn8k/hDRroFwJs5lQHBr1WgIvwBqjUulM8=; b=XwIdtW6MRDnDO6hvTdCDlz/4gL
	1e7cKGVn8gYVMe55cFC2JRcfjWP+SQq3NCduNDzHZ9+YLG/fMqtxjPrBeoqOV1gLiw8QXYfjAojj8
	sZgBRB5VE44ltmiSxliyyRbaJqYt7oxLycLc4MAJYRfblBdjSzJ6YOckbs/Ys9VvmgfsMnMgMnsUh
	8b+Tf/cHuQG8GPf1niTlGlTPcG4nV57jtMbRzBvZ/zpsDlCAFuPKdhhNXUY09bP7sVRo6+DJ/M86a
	nrW+DMoEB/VDBw7FYHd1cIlDo8G9tptUkXsdDBlL2AYMEhxvPA8eJt+Eh58oEbfhP1fzFJ6RQV+rS
	Gv6bI6oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlJjX-00000003zEx-16mf;
	Fri, 21 Feb 2025 03:29:47 +0000
Received: from mail-centralindiaazolkn190100000.outbound.protection.outlook.com ([2a01:111:f403:d409::] helo=PNYPR01CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlJjV-00000003zDm-1rBq
	for linux-riscv@lists.infradead.org;
	Fri, 21 Feb 2025 03:29:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qvmiuQuZRdPQrb08CjMK9JmKKo21XlwqSHH82w4QX04AFDYz6cY7gFZr5aNZHygPv8lwmDO4JsDnQpc6lB0GUOJcM3LYxIlU4vlbY1sqJbkYHQAykPCigogS15oJV7GdWF8q3gQpMMgdxOCA0cCOYuiqh4/lDx8DAF04+MCL8uzIquJWwWGPxHP6j0fXoqWXvb22lLaAsEg98wML0mFkAimZZTLgtINlwS4VpHOy1WPNYBerBO01PXu3voMF0Jfeqe4/gRjvIpOyAmw2tFpjVJcu0fjhUKOJefEInf/vwymjS/IrSVrdDhTh7PZRJoOOuR9Dp+6abXku5RkPLLFmKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sFxW24W6Tr0+8ACc81E82PLmMKGz2AOg9O5lB1jX5QE=;
 b=XKLyeuIabMFoEzkpYl/Jo6MabdOXxFgYgJC9KwCCTkf0FjULyYV0n3qWaDKEP/R0kKeTTW0eRjtQ2nL0tSljQ7SkOWmSg0VPpxsRoUrlZzcbnVI7Rz6xuEjvnhhiXceigCfRLvGqcKj+iRKt4ADzGDa/9DqJBvKq1gnwuprOPkLr2k5+IhV9cRsiDlwOCeIGus4aOr4BLxMHsxB+mYcADnMbN1XxOcYsbuzV/KYiylKIy8gveRW4weFrjLcGRRAOknyfsSYhXDWeulSHPxfm2vttI9Whb/MJfB4PK3L5+JWURUhxx3qvvrNEqSm5DZMBLzJiP1+fQ6HmIAw2TJcNpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sFxW24W6Tr0+8ACc81E82PLmMKGz2AOg9O5lB1jX5QE=;
 b=X49n3dxZQND88N5HyEdBLN4G9iTZ5fIN8TWOMsYNftM7mG3FB7u8jirdq6kDW7s0ZfHGkoBdkvkXJCXsOvmlZC1FLRiOimq29DHv29tF2i4Me5tWQGRAb0kkCQYHDGyLvi+oGL9/nLZPZDOILV+Lq/hR6qHvZbAmmlO45SG6V2N3Ki7+nfXxQQfNYWnQ/mxXDgdM3SQdWottY5KXxhm6q2RwL9JxVZ8u7A4BmdOlFQp3L1TRLikSdxk+O8HpyqV5wjcSJ+sp8AKz7JW6soOGNBCL4lLE+5jWc5YNnQg4fLSCfgZdQcH1oZb1bKt63OoEIZ8laYihuJJKik86UeHttA==
Received: from PN0PR01MB5662.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:62::12)
 by MA0PR01MB8801.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:cb::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.17; Fri, 21 Feb
 2025 03:29:28 +0000
Received: from PN0PR01MB5662.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::da87:15b3:46a4:7fba]) by PN0PR01MB5662.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::da87:15b3:46a4:7fba%6]) with mapi id 15.20.8466.015; Fri, 21 Feb 2025
 03:29:28 +0000
Message-ID: <PN0PR01MB5662DF3C3D71A274A2E5B9C2FEC72@PN0PR01MB5662.INDPRD01.PROD.OUTLOOK.COM>
Date: Fri, 21 Feb 2025 11:29:20 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] dt-bindings: pci: Add Sophgo SG2042 PCIe host
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Chen Wang <unicornxw@gmail.com>, kw@linux.com,
 u.kleine-koenig@baylibre.com, aou@eecs.berkeley.edu, arnd@arndb.de,
 bhelgaas@google.com, conor+dt@kernel.org, guoren@kernel.org,
 inochiama@outlook.com, krzk+dt@kernel.org, lee@kernel.org,
 lpieralisi@kernel.org, manivannan.sadhasivam@linaro.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, pbrobinson@gmail.com, robh@kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org,
 chao.wei@sophgo.com, xiaoguang.xing@sophgo.com, fengchun.li@sophgo.com
References: <20250219182247.GA225989@bhelgaas>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20250219182247.GA225989@bhelgaas>
X-ClientProxiedBy: TY2PR02CA0009.apcprd02.prod.outlook.com
 (2603:1096:404:56::21) To PN0PR01MB5662.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:62::12)
X-Microsoft-Original-Message-ID: <f5ea288e-697f-433b-95a9-f0b4d926d56b@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0PR01MB5662:EE_|MA0PR01MB8801:EE_
X-MS-Office365-Filtering-Correlation-Id: 29cc7881-c914-460c-29ec-08dd5227f1b8
X-Microsoft-Antispam: BCL:0;ARA:14566002|5072599009|19110799003|15080799006|461199028|7092599003|6090799003|8060799006|440099028|3412199025;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dk9hemxHZWhpWlVQWmhRSCtMZjg1TjdiT2ZET000YitjeVlMc1ptQXJyYTd2?=
 =?utf-8?B?S0tySVRqa1BDMHhqUGlYbmg4R2g1ZnZtVnBBVG16MHZXM1NRRDVWKytJUldF?=
 =?utf-8?B?Nlg2aUpiaFZEclJPVDg3NnhBZkJhMlN3Y2tZSTQzYU9HRldDWmNkZm5wWmUr?=
 =?utf-8?B?WGdneXU3RWxXUkhsQTREYU53VHVpQm9hNk1lMENwdlpnZ04yTFVSLzAwRnFx?=
 =?utf-8?B?Mi81VHhtQmFoVFhIU2dYL2VDc1c1b0Fxd1I0TmpTek5jYkhJRU81UXFONnhX?=
 =?utf-8?B?bjJkcXNERGhncmw0Tmc3OFgrN0RxcGxuWkVBTlVEWmI5NE1CTk55aGpjWS94?=
 =?utf-8?B?U1REUnVlaGw1K1JGeVl2Rm9CWDBnL3B1czArZTJwRzA1bHhXMDI0dHRjRnVh?=
 =?utf-8?B?RXZ0UStqNUdrSWY4andXYjVMazlLMmlMWWlnZ2R6NUVwU1FIeHdVV2hMSGt0?=
 =?utf-8?B?eFVjeVhGS3Q4R0I4TVI4cWFxU0g1UmVVR0hSUzlSUEpOWFR1RU1FNWsxUGY2?=
 =?utf-8?B?bUYyd2loWDhycUN4Nkg0dXluNkRKSjJzRHBPa0NSa2ZRTHRTM1NhYXU3cGpW?=
 =?utf-8?B?U3lleEFhRVllUUgyUklvaXFDUEI5QXg0bDNINXN6YmlldDNlZUtmRFo4SWdV?=
 =?utf-8?B?N0lvRFc0VnF5a05LZlRoc0k0T3JPdjZkeWhxQnVSME1nbkZKRjlGUVV0dkZw?=
 =?utf-8?B?SVdCZFlWN2lmMVpkU3hxTXFjbXMrdkF6K3dUYUdMRU9mbU51cjV2S1l2VkJC?=
 =?utf-8?B?WUV5UGgrVFRDV25RMk9iN3NrQzFmdlhkRDJlZGV1bzVXdzI4YzFqVEpHUkVw?=
 =?utf-8?B?Q3dRS2NYK2hJbktBTko0enRCWnFDb1owczc1djNsb3BkemovMzYwNThQVW5D?=
 =?utf-8?B?dnJ4MlhzVmlma0xSbW9EREI2bUZ5OGhDRlFqUmp1TEFQc1Y4YkdIbUxiZnJF?=
 =?utf-8?B?RStLMUFxYWh2N3h2OHljL1dia25uV0htYk5RZW1RUHhDMlZUc1F4c0hXbFhE?=
 =?utf-8?B?a2tMUSt1aWt2RisyblV1TG5XSGVqbWk5WXN1U29PaGJ3VUpJeTlLMmlDYTRj?=
 =?utf-8?B?ZEpNOWVHa21YMG1BakM0dnZheGNKWHZ1cmNaSzFaLzdmbkRzMHVJL3pIZHhY?=
 =?utf-8?B?VElnTWxCdG15YjAwZTl6bVZEUG44UEY3ZkdYY29ZdHlnZ3BjYjFuY2Yrbm5j?=
 =?utf-8?B?UlFPN1F0a2ZBc2xDNURSeWxhdzgvay9uUlBKbndpZUdtOThGcTNJMW1ZK053?=
 =?utf-8?B?aTZFekpLZU1PRkNjUCtTTEtzOUFPVTVycnY1UVlHUnphVk1DZk5KQVovVkg4?=
 =?utf-8?B?YU5wZ3pZb0R2UWN4ZHdaZzIwSko5WnN0aXh0TnhZcXc3Nmg0QWNDNDNWOTZF?=
 =?utf-8?B?TkVOalQ3Sjczb2J6THZuOVpkMExyRk9ZeGF3emc5ZzAyZHdiQmtjTEQ1VEk2?=
 =?utf-8?B?RUJSd1dDd3VNL0pNWkh0Qk9pYVhzY3NhKzFOLzZsb3RRT1ZsOU1zRVVMOUls?=
 =?utf-8?Q?s+HaO4=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a1htRUFFdWdBWk9vZ0ZkeHF4NHl4T2phMWcrUDhrRUtBOFd3bzR3TXNEMUZZ?=
 =?utf-8?B?M3NtMGJVY2RtUlVXeHJ6eFlMU3E4RXErekhNcG9KcG5kWGV3ekl1SjNGQ3Ey?=
 =?utf-8?B?YitJL3dtSEZwUDJIYnJVVXdOeFBuUUN4ODVNeklMNkV1emxkNUlnbnB3NGpZ?=
 =?utf-8?B?SmVGMEdiSENlS0t3QzYyZDVzb28xNmtkTi95ZWRKSzlQVXJjaXg2NWYrRzgw?=
 =?utf-8?B?WjhsREpYK1BaUW14Rm9aMVlXQ0lERUxSRHBQQWpVbzdna3RYY0x5RkYwZ0ll?=
 =?utf-8?B?KzI2Umt5bUZmc29ZbE9WZ2p3Uk14UjJFeVd6Qlk4dDhIZTJjbEo5Y2FsU3E2?=
 =?utf-8?B?ajBDVkVjaWl6Y25nYkxXQno3S2pIZjhxdllLZjdPNDdEazlONmhIcVcvZE1n?=
 =?utf-8?B?Ulp1aUV6eGtES3dyQmUwSU5jZVo2VmJjcFVJOHRKTCtGd3piUlRpaEQzSFI1?=
 =?utf-8?B?TlVFbDFRNm15eGdoWFZHbGpjN0tQQVQxckpJelU2SXpDemdkaEdBUXdXZkYx?=
 =?utf-8?B?MUdvMkF0Q3lIcy94bGVEdGRzODJGOEZySzB1QnA1VHR6a0xTK2laZ29IYVNB?=
 =?utf-8?B?VW9sSThEdG1yTFVDb1g1WlJnbmNqOFVtNkJtWFh6NFZVa05OdEFiRWZINmRl?=
 =?utf-8?B?ZEMwOHV5VjQ4WGhnMUVoVU83UHFZeFpNTEUrREtvOUVCcU9zWG5pM0JRQ1Vt?=
 =?utf-8?B?amY1MURTM3c0ZWY0YTB4ZHgzVVBjTzJMWnNIaWlHWXpoTkRQYWQrUXpQVTVv?=
 =?utf-8?B?dmQ1Y2lrckdiRXlkZFRkWFBpSXhuYXdlYTQwZVloQjA0SkZUczUzMFhQRGth?=
 =?utf-8?B?aUF2ZzZjL1MzdUhtTy93QTEwcHhPYXQxVEFEM2FrYm14TVNEektTbHF2ZjFV?=
 =?utf-8?B?dnRJdDh0WXJvVWFpdklJaTJNL1BDdzcyK0syNW1RZXR1N1J0bitMaElUa1ky?=
 =?utf-8?B?d3doQ3lPVGtNZDlGL2MxUnBkQ2dsY1ZsdmRiYjJubzMxZlQvYnJzZU5HZ0lh?=
 =?utf-8?B?eUhXQ3VPVGdpMm16Wk5sWWdteno3Yi9EOXNBek1naDhaak8vV0tZZkhQWHlG?=
 =?utf-8?B?TVBtN1d2WllCOVpITXVnaFB5UjRkZnQrY3dFeTZvYUJNeVRaR0dldTRsU09K?=
 =?utf-8?B?blptUWtCZmkyc1h6bm1xa3BEK09IUHpLODE5ZWE2aG5zZUJmRGp4U3NBNEZw?=
 =?utf-8?B?dzNxWTdEQWFNdjhtWkVIYjdoWWRiTDR0TCtrSzgzRFRyR0RBcFZsaEMrR1VW?=
 =?utf-8?B?bmJ5aHpYYU11b0NxOUhpYlV2QTlVUTEycjMxcWc2ZFVJV2NHUE13bEhzSmZQ?=
 =?utf-8?B?dHlEQjRiY05GaFEyMHZFT2VrdFJobUJXLytTT29sSUdoTkV5TlVoVlFmbWRo?=
 =?utf-8?B?UVk4MVcvRGkyRG1wMHlFNzBYS0tDYzNCejZkWVdQZXA2UXUvZE1KRGh1QnV5?=
 =?utf-8?B?czA5UGZsRDZlMXpmTGtrMCt2VkliNjZnSTdiTGN1YlNVK0ZTb1N2THV4NjlY?=
 =?utf-8?B?WGVzbXFLM2NreS9tU2JlVzVVdjkycXhIakJYakJxaGRKKzhNMEVSZFo1eGVu?=
 =?utf-8?B?YTdCZWJ0SmJxcUJuRUxvdjdDaThzQmRtNU9OeGtaakVZNE96SU84RFFFUzdi?=
 =?utf-8?B?cHZnbS9Sd1ovaVEzZ2lubzIzcFpwRnAwaEQ0M0NIUENaT3pWSzROWkpQLzBz?=
 =?utf-8?B?QlVkRFpVcEZRbUlGQWZYdE04UmhTVEJBa0pid2VWbFlIL2YrTSswYkRhdU1K?=
 =?utf-8?Q?xk1IfXNyuwGd5BdGjVacXGmYNMMNi4iUCjzrV3v?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29cc7881-c914-460c-29ec-08dd5227f1b8
X-MS-Exchange-CrossTenant-AuthSource: PN0PR01MB5662.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 03:29:27.7723
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB8801
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_192945_502254_82ABF478 
X-CRM114-Status: GOOD (  11.24  )
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

Ck9uIDIwMjUvMi8yMCAyOjIyLCBCam9ybiBIZWxnYWFzIHdyb3RlOgo+IE9uIFdlZCwgRmViIDEy
LCAyMDI1IGF0IDAxOjU0OjExUE0gKzA4MDAsIENoZW4gV2FuZyB3cm90ZToKPj4gT24gMjAyNS8y
LzEyIDEyOjI1LCBCam9ybiBIZWxnYWFzIHdyb3RlOgo+PiBbLi4uLi4uXQo+Pj4+IHBjaWVfcmMx
IGFuZCBwY2llX3JjMiBzaGFyZSByZWdpc3RlcnMgaW4gY2Ruc19wY2llMV9jdHJsLiBCeSB1c2lu
Zwo+Pj4+IGRpZmZlcmVudCAic29waGdvLGNvcmUtaWQiIHZhbHVlcywgdGhleSBjYW4gZGlzdGlu
Z3Vpc2ggYW5kIGFjY2Vzcwo+Pj4+IHRoZSByZWdpc3RlcnMgdGhleSBuZWVkIGluIGNkbnNfcGNp
ZTFfY3RybC4KPj4+IFdoZXJlIGRvZXMgY2Ruc19wY2llMV9jdHJsIGZpdCBpbiB0aGlzIGV4YW1w
bGU/ICBEb2VzIHRoYXQgZW5jbG9zZQo+Pj4gYm90aCBwY2llX3JjMSBhbmQgcGNpZV9yYzI/Cj4+
IGNkbnNfcGNpZTFfY3RybCBpcyBkZWZpbmVkIGFzIGEgc3lzY29uIG5vZGUswqAgd2hpY2ggY29u
dGFpbnMgcmVnaXN0ZXJzCj4+IHNoYXJlZCBieSBwY2llX3JjMSBhbmQgcGNpZV9yYzIuIEluIHRo
ZSBiaW5kaW5nIHlhbWwgZmlsZSwgSSBkcmV3IGEgZGlhZ3JhbQo+PiB0byBkZXNjcmliZSB0aGUg
cmVsYXRpb25zaGlwIGJldHdlZW4gdGhlbSwgY29weSBoZXJlIGZvciB5b3VyIHF1aWNrCj4+IHJl
ZmVyZW5jZToKPj4KPj4gKyAgICAgICAgICAgICAgICAgICAgICstLSBDb3JlIChMaW5rMCkgPC0t
LT4gcGNpZV9yYzEgICstLS0tLS0tLS0tLS0tLS0tLSsKPj4gKyAgICAgICAgICAgICAgICAgICAg
IHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgICAgICAgICAgICAgIHwKPj4g
KyAgICAgIENhZGVuY2UgSVAgMiAtLSsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwg
Y2Ruc19wY2llMV9jdHJsIHwKPj4gKyAgICAgICAgICAgICAgICAgICAgIHwgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgICAgICAgICAgICAgICAgIHwKPj4gKyAgICAgICAgICAgICAg
ICAgICAgICstLSBDb3JlIChMaW5rMSkgPC0tLT4gcGNpZV9yYzIgICstLS0tLS0tLS0tLS0tLS0t
LSsKPj4KPj4gVGhlIGZvbGxvd2luZyBpcyBhbiBleGFtcGxlIHdpdGggY2Ruc19wY2llMV9jdHJs
IGFkZGVkLiBGb3Igc2ltcGxpY2l0eSwgSQo+PiBkZWxldGVkIHBjaWVfcmMwLgo+IExvb2tzIGdv
b2QuICBJdCB3b3VsZCBiZSBuaWNlIGlmIHRoZXJlIHdlcmUgc29tZSBuYW1pbmcgc2ltaWxhcml0
eSBvcgo+IGNvbW1lbnQgb3Igb3RoZXIgaGludCB0byBjb25uZWN0IHNvcGhnbyxjb3JlLWlkIHdp
dGggdGhlIHN5c2NvbiBub2RlLgo+Cj4+IHBjaWVfcmMxOiBwY2llQDcwNjIwMDAwMDAgewo+PiAg
wqDCoMKgIGNvbXBhdGlibGUgPSAic29waGdvLHNnMjA0Mi1wY2llLWhvc3QiOwo+PiAgwqDCoMKg
IC4uLi4uLiAvLyBob3N0IGJyaWRlIGxldmVsIHByb3BlcnRpZXMKPj4gIMKgwqDCoCBsaW51eCxw
Y2ktZG9tYWluID0gPDE+Owo+PiAgwqDCoMKgIHNvcGhnbyxjb3JlLWlkID0gPDA+Owo+PiAgwqDC
oMKgIHNvcGhnbyxzeXNjb24tcGNpZS1jdHJsID0gPCZjZG5zX3BjaWUxX2N0cmw+Owo+PiAgwqDC
oMKgIHBvcnQgewo+PiAgwqDCoMKgwqDCoMKgwqAgLy8gcG9ydCBsZXZlbCBwcm9wZXJ0aWVzCj4+
ICDCoMKgwqDCoMKgwqDCoCB2ZW5kb3ItaWQgPSA8MHgxZjFjPjsKPj4gIMKgwqDCoMKgwqDCoMKg
IGRldmljZS1pZCA9IDwweDIwNDI+Owo+PiAgwqDCoMKgwqDCoMKgwqAgbnVtLWxhbmVzID0gPDI+
Owo+PiAgwqDCoMKgIH07Cj4+IH07Cj4+Cj4+IHBjaWVfcmMyOiBwY2llQDcwNjI4MDAwMDAgewo+
PiAgwqDCoMKgIGNvbXBhdGlibGUgPSAic29waGdvLHNnMjA0Mi1wY2llLWhvc3QiOwo+PiAgwqDC
oMKgIC4uLi4uLiAvLyBob3N0IGJyaWRlIGxldmVsIHByb3BlcnRpZXMKPj4gIMKgwqDCoCBsaW51
eCxwY2ktZG9tYWluID0gPDI+Owo+PiAgwqDCoMKgIHNvcGhnbyxjb3JlLWlkID0gPDE+Owo+PiAg
wqDCoMKgIHNvcGhnbyxzeXNjb24tcGNpZS1jdHJsID0gPCZjZG5zX3BjaWUxX2N0cmw+Owo+PiAg
wqDCoMKgIHBvcnQgewo+PiAgwqDCoMKgwqDCoMKgwqAgLy8gcG9ydCBsZXZlbCBwcm9wZXJ0aWVz
Cj4+ICDCoMKgwqDCoMKgwqDCoCB2ZW5kb3ItaWQgPSA8MHgxZjFjPjsKPj4gIMKgwqDCoMKgwqDC
oMKgIGRldmljZS1pZCA9IDwweDIwNDI+Owo+PiAgwqDCoMKgwqDCoMKgwqAgbnVtLWxhbmVzID0g
PDI+Owo+PiAgwqDCoMKgIH0KPj4KPj4gfTsKPj4KPj4gY2Ruc19wY2llMV9jdHJsOiBzeXNjb25A
NzA2MzgwMDAwMCB7Cj4+ICDCoMKgwqAgY29tcGF0aWJsZSA9ICJzb3BoZ28sc2cyMDQyLXBjaWUt
Y3RybCIsICJzeXNjb24iOwo+PiAgwqDCoMKgIHJlZyA9IDwweDcwIDB4NjM4MDAwMDAgMHgwIDB4
ODAwMDAwPjsKPj4gfTsKCkhpLCBCam9ybiAsCgpJIGZpbmQgZHRiIGNoZWNrIHdpbGwgcmVwb3J0
IGVycm9yIGR1ZSB0byAicG9ydCIgaXMgbm90IGEgZXZhdWxhdGVkIApwcm9wZXJ0eSBmb3IgcGNp
ZSBob3N0LiBTaG91bGQgd2UgYWRkIGEgdmVuZHJvciBzcGVjaWZpYyBwcm9wZXJ0eSBmb3IgdGhp
cz8KCk9yIGRvIHlvdSBoYXZlIGFueSBleGFtcGxlIGZvciByZWZlcmVuY2U/CgpUaGFua3MsCgpD
aGVuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
