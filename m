Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 436BDC369CB
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Apr 2025 05:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w5DjIqoH8N2AzYseaLA7egam7LTbNEe29gC+kr7/P7M=; b=mNunam8RymKs1JtCFXdGIq6TuK
	/GNbSG5CBsjUdRQcqRtqTeaEMxlIwahaG9k5ZKfAEsw97zDu0ZN7Qb7JR20ogieEzcLQtMlP3dukN
	XRh09Yyx3Z+y/q5wAhxmSaSlyX1lP7flqi/fMNEwUwno52lQVS+7RgnfMP7sf/7LdMgH4FGI1FZwm
	rN9qN24r5eQnd35Muxo+nUyAKUeHeJpw2Hyn4x/LsxSD95UfcCpPfokdUeqyuYH3P7w8XXPU4tW/M
	ZVzBcl+86ppUbkMku12xhJrzzwSaAn6qLT253KFjy7jndl7eAGkcbsmog4D4uwnUuHUNb+9LqBJxM
	Z+Zw269Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7T5H-00000009Gyr-3CuS;
	Wed, 23 Apr 2025 05:55:47 +0000
Received: from mail-centralindiaazolkn190100000.outbound.protection.outlook.com ([2a01:111:f403:d409::] helo=PNYPR01CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7T5F-00000009Gx5-0UIu
	for linux-riscv@lists.infradead.org;
	Wed, 23 Apr 2025 05:55:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ax7lafvtA5Xg6qtuWyWc+apqMo7Q68NQGAwIqEeVSB/vK7IlVEGH5q+TEQegLE3IjF8UfpLH9+6jQDKCUV3FE3c+MaFHHPVmZYCFed3kczecTbv2VSaulOkO9f9ZpKMfdya0PVEmu2viUsBN4npTwNtyo/I9oaGQrKXND++ZecOyO+NIYc4DRqdwRcUg60Dht4EH4nV2eAIXqeED8xJdwhvjkZ0YXqphNY5dATlHITvQbupHwqqJp48+LzFuh7uPM4R2lAvLctmWua7tYL2bhXh9vXwdYOrsAZ4AtD7Xl0mB0mwjrY4NIh9CaGQRpz1bqv3uVPBvmeS8nhmN6DcS9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0fFb3UpJkHLozct4ZQPQiNCI9Fl5TlfOenc0DLB7iso=;
 b=Uff9NKKl9J5hbw2V/Zz0mFityrs1xgS4qlCN6lPjyHdeKJI7yGNGxcEB9fv001P1wLXZUblS86T/dxdIfUIDXnQvoeHHq612rjMJsFfw8WE1sIadW/7zhoKgfw7e8C+mhZJoBUWjQK7oAqD+hpWkUULxFu6P6DcTlgg14nPF7Nt3FHWzOrnYt0rCSodrA+l2trqIkk8xUTlAuWUPxdzpJ/i0PLrMbB4T824G0HjR/P3z8r+f6Al3EIYOw6EifwrsNxxVTSx3f6JLAY+t81d9UYt6oyoUQKOgFHU9QCyiHrdOC5LyCwaJeIZRX2JZ55VHAVMGxVDOSJNlu6fckYd8kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0fFb3UpJkHLozct4ZQPQiNCI9Fl5TlfOenc0DLB7iso=;
 b=JVkuvcMzATRATa1pYBCGlYIp4ESJzIXzjlVoOcfQbvRtBYpDwAAeze2qJSByGmVVst7Q+9a83ZUwTV6QXUuxooaCEqqOExGz9NubpN5waXgVnCpZ+FXL3C40jSG2Gt+McxACTduCfATdquaC6NlZ9X4yo9PrKKPLz+/3IVbO6L1Wkur6LuO0UkUvZUvluNQJYDrHYLb3zqcI8pMeB2DEAu+9sgojvIkuwGLkj94Lt8eLPmoMcowrS5UNoRtkiz3aYwLV/nrOFE9o3UdIK9XWOz5mVtInWOup4Hpa3dRF9lvOOuoA/TZYaHN94oDlnPZsOrlBRfwKmEllfM5GhbnG+A==
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:100::6)
 by MA0P287MB1771.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:f9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Wed, 23 Apr
 2025 05:55:18 +0000
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4]) by MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4%5]) with mapi id 15.20.8678.021; Wed, 23 Apr 2025
 05:55:18 +0000
Message-ID: <MA0P287MB226255035355E9F97F0A9486FEBA2@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Date: Wed, 23 Apr 2025 13:55:12 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] reset: canaan: add reset driver for Kendryte K230
To: Junhui Liu <junhui.liu@pigmoral.tech>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <1838dbd48ec5bec8.2608aebcdac475bc.43d59215091781cc@Jude-Air.local>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <1838dbd48ec5bec8.2608aebcdac475bc.43d59215091781cc@Jude-Air.local>
X-ClientProxiedBy: TYCP286CA0227.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::14) To MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:100::6)
X-Microsoft-Original-Message-ID: <9be4b47e-fd79-4232-a2d0-c6251610d55e@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2262:EE_|MA0P287MB1771:EE_
X-MS-Office365-Filtering-Correlation-Id: a92f67c5-7355-47d8-9caa-08dd822b6bfe
X-Microsoft-Antispam: BCL:0;ARA:14566002|19110799003|15080799006|5072599009|461199028|7092599003|8060799006|6090799003|1602099012|440099028|4302099013|3412199025|10035399004|12071999003|12091999003|21061999003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SUhzSnF3MmFhQnJpNFFJYmFEaVlkckdVYXozL1R2Y0YveHJyU1hpTGVHRjUw?=
 =?utf-8?B?SDBkUElNazMzYmtOblZ6OHRveXRTM1FZRmhIYnl3N1JLRFJVd0crM1ptblhx?=
 =?utf-8?B?a1ZEbDQwemMwRWd1TlZxR0tETGpaRmF5UlRwdWF2VTNPTitFY1FHWHFYbyto?=
 =?utf-8?B?aWVPY2dhSHVUcVVZU0RTUE16Q0g5NG42TEtubS9MSHNXNlJNTk5zdDRvTTA3?=
 =?utf-8?B?V0R0cHgwNURqTDVqS2NVakN1L1lPWHVEZ0xwVWJGRC9ISndBQ1M1VEhnTXVj?=
 =?utf-8?B?bXh5RXRNaVdSVmJJZ0I5OGtOUXUrOWZFd0pZZzRvOVg2Ym91ZHhIVmwwU1V3?=
 =?utf-8?B?Q2lyWnkyRzBjc2dMUHBYRjRra3hIY0NqeGh6MjAxbzJwRElZT2diZ3FGK2Fz?=
 =?utf-8?B?cGtWL1EzNTVJcDNGSlZoNXNCVnhjNmpTd1NzM21WcWR5YUZCMklBU0JaSU1G?=
 =?utf-8?B?aFhwQW5tcHEwL2UrOWlhNWZEamptRGExMEFTSjR3dWZ3NjZiRmNINklpZyt0?=
 =?utf-8?B?cTd1amV1M0xhVDF5N0E2cDZIQ0ZGVjRORWJhSWxuc1pEc1dLdXNyU2l2MnFn?=
 =?utf-8?B?WjF0elRlRGtMRUZFbndZcEQ4UXZaMjAvaTBXY3VxSE8rSHFmQUlicTh1disx?=
 =?utf-8?B?eXZCVzBla3U0T3d2cDAwWVhuRnRJRjNuK2NCUlhVYkw0QlhZcnBia0pUblg2?=
 =?utf-8?B?SVhiUmYwWWYzclhtYzArYzlGamx2cW56VEhUZGhIZ1A4cTY1MEFlOGhCWE9M?=
 =?utf-8?B?aktiZWc4am9oUmVWZ2FxQng0eld2NE1SYkxaVUgwRjlxMmo0bE1UVXMwV1Jz?=
 =?utf-8?B?QUlVYVlxakVlemlSK1FOeHltd3FtUk1vWSt2U2tjdHp6VG5jQjdEbGVZdVRl?=
 =?utf-8?B?d3pTVVo3bURDOUdUOVpQOVlYNW5ReUZPclcyaDIwUVpGT2ZON2MyY05wbStL?=
 =?utf-8?B?Qm14UGd4NHEzWG9hdEJoT1BNbnRKSllQdlRwalM1NVpZaXlta2FZbkZrZ0FL?=
 =?utf-8?B?M1YwVXJhbjNtS3NvbERhbDU2SVhYN0xIVXk5YzJpNTVmUzFmYXJNY2dLaTNE?=
 =?utf-8?B?K3lwUDU4UjgrUW9WMkFsU1k0U1R5Mk8rUElEUVZwWUU0Mm8zWDJOSExyZnJl?=
 =?utf-8?B?YzI4K1Z3TU9ZZzZ1aWxtRGdvQ001UVpPUVNjOE53dEM3TVNEMHhiVHlOSDlF?=
 =?utf-8?B?enJLY2xFd0UzWFJSVk5vS0Znam9VR25qMGZkSFZMMnUxeGF4dGpYUjlvcE14?=
 =?utf-8?B?bUd2OUp6WElZaVVTRlZqY2tZNWY0N1ZsNjBmYlc1VFlucUNuV1E1NXVaQVZa?=
 =?utf-8?B?N0xWVWVMTlhJdzFsZktIeFhUU1BPaGpNVEpjbE0yTGpPT01JRHZKMWJiWExO?=
 =?utf-8?B?bUdYTUJQMFBkVWZQUCsxaUhsejNkTDBQS3pGOGVBeXhrc0IyMzc4YXR6VDJj?=
 =?utf-8?B?Um5WY2ZzMzN4eGZPY2dUZTF5WkIyRG9XcFRXNFU4OFF4Ty9RMjRDYytIM3d3?=
 =?utf-8?B?U2tYN2Vuck1OU04vaVFodldsTFlqaUJuQjlQb0xlaVhXak1Ic1RsM00xVmVi?=
 =?utf-8?B?UFJkQitRbzNOeGkyVWJHR092UUhKeGlrM1hta2FIOC8yNWpzd3B5Ymx0dEZz?=
 =?utf-8?B?TDFYTGtjUFRxOHk0aE5TNFNlUUIzS3BrbFNxM2lUY0F3MEp5SktKemlMWUE2?=
 =?utf-8?B?YzJ0a3QzWGVlYVFFWDdiNUpuZWFvcjBHdDZmRmZEeUt0TGM5Y3VXQ1RoR0V4?=
 =?utf-8?B?dGVWNTlCWCtLb3k3L1pLN0xOdkFsUjlJU2JPcG5VMk5kRVVUTkxlY2lWYXVm?=
 =?utf-8?Q?Ubzr2bTL5wWJWIJP5lCBO9nHYwiiXLVSZ78iU=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bEhkaitWUll3Q2RQTnR3eCswSzZrM0tTeGVwWXRSRTdlMDRKaTJkOXdZSXdG?=
 =?utf-8?B?Mm5wTFJiYi9CVHkzYkZIZ2VlM1BMTlpDeEhOMjhFdHVtcVlEMDhmRHF2dytm?=
 =?utf-8?B?UzRIRHZydTA4bHRscTBPbTV0TW5rYVJ2b1RuZ2NjNk5GdUpQakUrRU95ejJI?=
 =?utf-8?B?N29qTFkyR0t4dGpCUUtZanFPT1BTUkJUQkViVU54c2hHL3dVUFV6ZFJzZGNj?=
 =?utf-8?B?Y2Vha1pWbE1DdGN6MVVCS3hkRTJjZUVxNXQ3YkxvRWtna2h4cGQ4UXlRcTRm?=
 =?utf-8?B?M2VWSGcwTEc0YUEyZHZ0Q3dFT2g3bmxhYWV1K1dVSzdLaXlXTjRSUktGQkJ1?=
 =?utf-8?B?VFU3alBVYzRxYzdjbjdkRHIxdzh4RVlSbHNyWGdFenQzU01lbXdlYUdxRnJH?=
 =?utf-8?B?a3p5Nm43bWFqbGl2UnhENUh6dVQ4NzVMdjJUR3k2UDdlM1JEM2ZoQlZiN1pm?=
 =?utf-8?B?aHoyQ0ZWWFp1Vm5kTi9tb1JXZWZyMGVTRmZLZUJVZnJVamxIOEora3Y2K0Fa?=
 =?utf-8?B?TCtaU2NPYThaTWIwQ3JSL1pkTWRJdVd5OWx2RTE5UFJHYkhpMlV5OTZ0akVp?=
 =?utf-8?B?THc0U1QzL0tVQkwzUkhNSlgzSjhQeHNOTXR2WlBpY3hjMFVIejhKZ2M1VDRJ?=
 =?utf-8?B?NzlrenJVbVp3SjFaZGpWSURVd2dVcUcwdkFOTElBa2lPZXg0OFJUb2JXMklW?=
 =?utf-8?B?ZGtkQnZrN0hHUEhaUlloTDB0K3IvWU91ZnkwK1ozRzd4MWtlMFFHcjhKWVZn?=
 =?utf-8?B?TElPbCsxRmJOZkNxWGRBOUR0NmdGd0wveE51VklkZks0cHpMU1p6dHVuU2JK?=
 =?utf-8?B?RjlqT2dFYWVTV2FSZVVyWW5mRnBCaWEyQlluRzZydzN3VVJRclNpVFc5Y2lj?=
 =?utf-8?B?MG1HNTFvdHk4VFB1K2N2Uk1xUGNJMUpjZGdlT0tRMk82Y1pLUXFBTGNBSjRU?=
 =?utf-8?B?YmIrdUVFdGE3cG9uVzNwdXEzYXEwVm5VK0JxWTNTQjRCdTlLR3FZMktGUVFv?=
 =?utf-8?B?NlNIVERvTmVzQmFRYUI0YkZzaXpjbEtXbDR4YXA3YzJDQlBZRWlHaWtNVWtv?=
 =?utf-8?B?VjlKK0djMlNrSU40UHdFYThTQ1JHbUxRRklrYk9RZGtOcnI4UHMyWjQvRmo3?=
 =?utf-8?B?U0dWVVg5ZFNkc1FEUGVrUVNqQWJSWE5tdUFOcFhVL0NnbWZxOHZhQnJ1c0lN?=
 =?utf-8?B?a3d1cTVlU3A3YUp4U1hzdTZHaFZjWGR2K2gxemlVR0JlNitWTG5rYXFCMHN4?=
 =?utf-8?B?WDBNVHlKRmw1RTFqUTFsRjg1dnduR1VrM2tvV1IwNXNqSVVXTTZXWkwvekgz?=
 =?utf-8?B?K01RRG1Wbzhqd3BYZFNlKzQzazhXWGpLYmhscXR1ZTNBM0hDOXp4bHZJb2FT?=
 =?utf-8?B?NDVMYWo2Y1F2bk51dE5yVVVWMTdETDlqcG5iM21oVzNPSFVGUTdzb0d5YXA0?=
 =?utf-8?B?N0xUbnpQdTcvdTV6SXF0VStqbitpRWJWYWhkaW5OSHdKenZVZEhCTUxkanhJ?=
 =?utf-8?B?c0xaMmszTm9VVzJQNmdPN29PV3l4R0drdlZjODYxeUppMitDOVlmKy83bkxT?=
 =?utf-8?B?UmhwbGpyL3lHY1pVTURiZEF1L1F4elVza1g2blJ5RlRPTk9FcXZjeFlDVXBk?=
 =?utf-8?B?SWNxTmJQUGl4Q09aemtkNkJUZXgzSGRUekhtWisvL3NNdW5NcmlzUmhZODZn?=
 =?utf-8?B?bjF4T0lyelRHOC9KNHhNTlFaTlVPRkxFbEdmSUJYR1ROUWtZSmR2ZFFtdW1y?=
 =?utf-8?Q?KYc+tYUM3WHAnr1e7+hA4JylnkxRyLZYcfF8sS6?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a92f67c5-7355-47d8-9caa-08dd822b6bfe
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 05:55:16.6162
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB1771
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_225545_375626_6050D7F7 
X-CRM114-Status: GOOD (  21.64  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On 2025/4/23 13:36, Junhui Liu wrote:
> Hi Chen,
>
> Thanks for your review.
>
> On 23/04/2025 11:21, Chen Wang wrote:
>> Hi, Junhui,
>>
>>
>> On 2025/4/20 1:09, Junhui Liu wrote:
>>> Add support for the resets on Canaan Kendryte K230 SoC. The driver
>>> support CPU0, CPU1, L2 cache flush, hardware auto clear and software
>>> clear resets.
>>>
>>> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
>>>
>>> ---
>>> The reset management module in the K230 SoC also provides reset time
>>> control registers. For RST_TYPE_CPU0, RST_TYPE_CPU1 and RST_TYPE_SW_DONE,
>>> the time period when reset is applyed/removed but the clock is stopped
>>> can be set up to 15*0.25 = 3.75 us. For some RST_TYPE_HW_DONE cases, the
>>> time period can be set up to 255*0.25 = 63.75 us. For RST_TYPE_FLUSH,
>>> the reset bit will automatically cleared by hardware when flush done.
>>>
>>> Although the current reset driver does not support configuration of
>>> reset time registers, delay has been added to the assert, deassert and
>>> reset functions to accommodate the longest reset time.
>>>
>>> Besides, although some reset types have done bits, the reference manual
>>> does not explicitly indicate whether the hardware removes reset or the
>>> clock stop time period has passed when done bits toggle. Therefore, I
>>> think it is a safer way to keep delay for reset types with done bits.
>>>
>>> link: https://kendryte-download.canaan-creative.com/developer/k230/HDK/K230%E7%A1%AC%E4%BB%B6%E6%96%87%E6%A1%A3/K230_Technical_Reference_Manual_V0.3.1_20241118.pdf
>> Regards these notes, please move it to the beginning of source code, see
>> example: drivers/pwm/pwm-sophgo-sg2042.c
>>> ---
>>>    drivers/reset/Kconfig      |   9 ++
>>>    drivers/reset/Makefile     |   1 +
>>>    drivers/reset/reset-k230.c | 355 +++++++++++++++++++++++++++++++++++++++++++++
>>>    3 files changed, 365 insertions(+)
>>>
>>> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
>>> index 99f6f9784e6865faddf8621ccfca095778c4dc47..248138ffba3bfbf859c74ba1aed7ba2f72819f7a 100644
>>> --- a/drivers/reset/Kconfig
>>> +++ b/drivers/reset/Kconfig
>>> @@ -140,6 +140,15 @@ config RESET_K210
>>>    	  Say Y if you want to control reset signals provided by this
>>>    	  controller.
>>>    
>>> +config RESET_K230
>>> +	tristate "Reset controller driver for Canaan Kendryte K230 SoC"
>>> +	depends on ARCH_CANAAN || COMPILE_TEST
>>> +	depends on OF
>>> +	help
>>> +	  Support for the Canaan Kendryte K230 RISC-V SoC reset controller.
>>> +	  Say Y if you want to control reset signals provided by this
>>> +	  controller.
>>> +
>>>    config RESET_LANTIQ
>>>    	bool "Lantiq XWAY Reset Driver" if COMPILE_TEST
>>>    	default SOC_TYPE_XWAY
>>> diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
>>> index 31f9904d13f9c3a107fc1ee1ec9f9baba016d101..13fe94531bea1eb91268b1804e1321b167815a4b 100644
>>> --- a/drivers/reset/Makefile
>>> +++ b/drivers/reset/Makefile
>>> @@ -20,6 +20,7 @@ obj-$(CONFIG_RESET_IMX7) += reset-imx7.o
>>>    obj-$(CONFIG_RESET_IMX8MP_AUDIOMIX) += reset-imx8mp-audiomix.o
>>>    obj-$(CONFIG_RESET_INTEL_GW) += reset-intel-gw.o
>>>    obj-$(CONFIG_RESET_K210) += reset-k210.o
>>> +obj-$(CONFIG_RESET_K230) += reset-k230.o
>>>    obj-$(CONFIG_RESET_LANTIQ) += reset-lantiq.o
>>>    obj-$(CONFIG_RESET_LPC18XX) += reset-lpc18xx.o
>>>    obj-$(CONFIG_RESET_MCHP_SPARX5) += reset-microchip-sparx5.o
>>> diff --git a/drivers/reset/reset-k230.c b/drivers/reset/reset-k230.c
>>> new file mode 100644
>>> index 0000000000000000000000000000000000000000..492d2274893675b0ff1967426c8fa9e75aed1791
>>> --- /dev/null
>>> +++ b/drivers/reset/reset-k230.c
>>> @@ -0,0 +1,355 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only
>>> +/*
>>> + * Copyright (C) 2016-2017 Linaro Ltd.
>> Linaro? Are you sure?
> Actually, I kept this from vendor's code.
>
> link: https://github.com/kendryte/k230_sdk/blob/v1.9/src/little/linux/drivers/reset/canaan/reset-k230.c#L19
No reason to keep this, I suggest dropping this line.
>
>>> + * Copyright (C) 2022-2024 Canaan Bright Sight Co., Ltd
>>> + * Copyright (C) 2024-2025 Junhui Liu <junhui.liu@pigmoral.tech>
>>> + */
>>> +
>>> +#include <linux/cleanup.h>
>>> +#include <linux/delay.h>
>>> +#include <linux/io.h>
>>> +#include <linux/iopoll.h>
>>> +#include <linux/of.h>
>>> +#include <linux/platform_device.h>
>>> +#include <linux/reset-controller.h>
>>> +#include <linux/spinlock.h>
>>> +
>>> +#include <dt-bindings/reset/canaan,k230-rst.h>
>>> +
>>> +/**
>>> + * enum k230_rst_type - K230 reset types
>>> + * @RST_TYPE_CPU0: Reset type for CPU0
>>> + *	Automatically clears, has write enable and done bit, active high
>>> + * @RST_TYPE_CPU1: Reset type for CPU1
>>> + *	Manually clears, has write enable and done bit, active high
>>> + * @RST_TYPE_FLUSH: Reset type for CPU L2 cache flush
>>> + *	Automatically clears, has write enable, no done bit, active high
>>> + * @RST_TYPE_HW_DONE: Reset type for hardware auto clear
>>> + *	Automatically clears, no write enable, has done bit, active high
>>> + * @RST_TYPE_SW_DONE: Reset type for software manual clear
>>> + *	Manually clears, no write enable and done bit,
>>> + *	active high if ID is RST_SPI2AXI, otherwise active low
>>> + */
>>> +enum k230_rst_type {
>>> +	RST_TYPE_CPU0,
>>> +	RST_TYPE_CPU1,
>>> +	RST_TYPE_FLUSH,
>>> +	RST_TYPE_HW_DONE,
>>> +	RST_TYPE_SW_DONE,
>>> +};
>>> +
>>> +struct k230_rst_map {
>>> +	u32			offset;
>>> +	enum k230_rst_type	type;
>>> +	u32			done;
>>> +	u32			reset;
>>> +};
>>> +
>>> +struct k230_rst {
>>> +	struct reset_controller_dev	rcdev;
>>> +	struct device			*dev;
>> Why don't usercdev.dev to store the dev, so we can save a pointer.
> Thanks for your reminder, I will store it in rcdev.dev.
>
>>> +	void __iomem			*base;
>>> +	spinlock_t			lock;
>>> +};
>> [......]
>>
>> Thanks,
>>
>> Chen

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
