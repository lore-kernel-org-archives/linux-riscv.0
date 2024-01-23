Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25735C47258
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jan 2024 09:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:To:Subject:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hN15W+d0Risn/W0WSVHZuXMj9hfEWRHEn0Ml+vaCH50=; b=2NxGGECwN7i8i40yAO2B4in81m
	SqkWzgKRqKsP6hS5ez181CJ+IxYDz7cvwDAh3tCMZlWhDBhZGQrD8e7LwTa4D0QLSrx/9pLVgQyZ3
	/dJEO0MEUJmBRjXIXu8BXI1LmyAAldZWRCjLW2QDd46eaTx4HNpFEcVcJnFj9xWr7pH0ZsvQjB0jL
	hB/+ePC1T4JwhfJD0ZgdHVehN8xaSopiDGJ5PVIUv8RaY+rnb9y9pFDa80o5vmiJ5sBIryrWiImNf
	gtT8uoBqaAHhb21Klfpe56hWeYOH9N3JJxUs/34JbwAIE8YvKUR/tg5SwChP6BkbELNk0f9yR6cxk
	JsU52pAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSD5M-00Fkqs-2g;
	Tue, 23 Jan 2024 09:28:48 +0000
Received: from mail-bmxind01olkn20801.outbound.protection.outlook.com ([2a01:111:f403:281c::801] helo=IND01-BMX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSD5K-00Fkny-0x
	for linux-riscv@lists.infradead.org;
	Tue, 23 Jan 2024 09:28:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kis/VqqsCbl9kOiaxLY98Fyux7B20OhGXPr/TgNwIFGWAF7EYca4CtrPKkHqPRfX0meLIRWsK/2CiMuMKFZcjKkuMwKbnWiZ2Iq7oUrjnDyq6rlg8g5wHRQrk4cPc4dXirGBrso0HKpNTndg2zAL36jMYHqZNbSkrfiTHeFrRdhTp6e/O2L2me4FSy+vMHlU0jNxt1Jzxn1QXtRMJNi6PTpEEwq+b5c3cyueLhFJHUW/a9uck+MWHSlhll1ML1xYHL3HaOSCem/LUSUpUlwemO/e2vrtoGHZnspcSN077tjw9w+PwF6xsVN2MqXdaMI0lJlKCWklc7gPXQdntu5UCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sskf7J1wJrl8s9RWAxDv40gnUGq/qBKKChNHBefGDi4=;
 b=bLJH1Wsf5bbuyBauPe2alRnplpCgs4nH7XdI6L8b/BNUU6QnpGlOc3wmjuhNHdNATObdwxTmMx+H9cLC6BBdpavVikj2N3jHXLzCeyOSnlACGoPl9RIC+EIlX05i+JyvuRmYNsewRl2d1KwPMz7/wiDngfvyrGuUhDUQvVezqrb2ZsY/ecVlf9lFk/5YoP9YVkXEMhwwDmJVjXAUL1IpoKNr5Rau0KhbAcNNO6qV3+141Y9aVgKCVhm7BQsqUhbeETiiSRXgWpKP9r5TCZmH/Uwb2vBIIyX9vcKp6C1YKrGgjiqFDCRUoSb0H3eJ8K5yZtmxdQarJsiqjot3F1M0fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sskf7J1wJrl8s9RWAxDv40gnUGq/qBKKChNHBefGDi4=;
 b=f0ixeBDq5o6IjWO7j3fb/0swcoCjp/sImxhkAn3rHWfcxG6Sr4F7fcynlNEX8VXzkW8PeymbtAvBkkq6Q7I8km9+X/pAlQl8dICKIWpaHa8Ej0iNUGYjlqgl5faAqY7tnaEMMwb/ST6Yazsem5ESAEh6eDwpAzA4a6wo122gJCEFIJFJ0i1GVpaDlzvx8GNl6xQpWJJwODe60OrXXqsxw2baculrpJ9e8COJfWXF0GSt4/wXEkDsrUHV41zLLEf26pKCiznu4L0mLxwcPOxgfSU5XdJSuzjFu21vx/j5DzyLD+1Y+A5tE4IUixFrSRP6v8Dw0oaX7xhvoU3MDvpKDQ==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by PN3P287MB1255.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1a1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.36; Tue, 23 Jan
 2024 09:28:22 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::6e80:69e1:f2e7:d70d]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::6e80:69e1:f2e7:d70d%3]) with mapi id 15.20.7202.035; Tue, 23 Jan 2024
 09:28:22 +0000
Message-ID: <MA0P287MB2822627E67437D41C098F773FE742@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Tue, 23 Jan 2024 17:28:15 +0800
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
 <MA0P287MB2822BCB4E43BCB495FCF9069FE752@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
 <7d87c455-7af5-4339-9088-6015d5847e88@linaro.org>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <7d87c455-7af5-4339-9088-6015d5847e88@linaro.org>
X-TMN: [lxQOcf9RsahtWSokDqigeECIXkhAVyEK]
X-ClientProxiedBy: SI2PR01CA0030.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::15) To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID: <e5e58868-4c1d-4854-a938-c7bf1ba1d804@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|PN3P287MB1255:EE_
X-MS-Office365-Filtering-Correlation-Id: 22c75517-b387-4f58-d3d2-08dc1bf5a4a7
X-MS-Exchange-SLBlob-MailProps: iS5pQZgsAQBsYli3jUPtFvQ+dLrwPNuFuG67EiBC9oSGB7j60xxyOFGTIT7fETNwCGN4sr9X7g7WHLWHwQC1HY3jhuz9sp/knflewH8Z17LHqHWB7+D2OQd8OrLZCah4cJmFy3/ebXhDfK76ZHYPzQGpfhte4DilyfLgrpDYdarFsfAU/TBQdGUvCGTjQRTD3lY3w5+sh0bj0GNyAUUYd9VHkN61iPc6nj8/cX9wkBqh/FkRDJlXTJ9NHm8npvfr505FhOxESuhuuZQOASw7ttmhX/Lr8dOSURD8tsHwrSvQjxtZ2RP7lRi6t5xzqO49z4cni3FIo+GNDO7DL2pG2SUfkqs61pCCnmZ4RVpeGuWe4YKfmsSkdYt5sBKZhboVeW8NMrx+qxi3xG1J0c0KFYb2UHKKJHjWcWQSpBqo/i1o356c5il/WeQdV58qU6NyOeZ2ZRli1NDh1k6lPX66aLfb89bIw+VwBOA46ymD7b3y3YDfS+QPDSo0ltg4p8UOMUqP2eFe5jUivFr2cdIbgmWAZskz+kf4QZOBtSjYq0Gy33ZkKrvAoqTqlplrfUFg2xtgyHk6ucMAfC8AlVoCV4VeT+/Bw3McVypoHD2C5YX6W6xcX9n8kLD9L5l8iqOIJzm1KWGfV2KwJvNPRAbod/NIY4vAs6Sz1K0NjcS6Yw98RQkX2/wYw5KRCLS9PVMPB5xOHaMlqbFgAlXs33pynNFK62badyH4n+o2roVlbxgLzcIZHi1+q3lQ37cDrqSP9bwXVMFr6mCKxkWR8RtELuYx7D0qITypNCjcAFUxOVOQx5/5Sk9Mz8zMPDJ6+c8W
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W0KlYfetY9sVrIj9YtHVm3Kkli78U67+jovzIFX0SfKEtCmoz5BTZw2+sNIeyMA/E4yFodJZD/zpOuHIoIf+wvrUWpKNXpFlZEZ+HatdmccDDsz8pt5zJQxM2vk1MauZttcnmuld0Xb7X2G5qVyl1SlWBSgnd8cptN2uU+zW2rvNud1RcIwGe2UqVMNL0DyOWlfexgusxWBf9f3Xe0TsblF74BgkzB/SlS1SuSRKN73QLV0ZvPhFvKB54V0f58vbOaYdMbhZfb44Z51okyrubnJPa1BwfLgqbQn0aDtikNGIFrGHXMBlcdIJQXQyQ/4MYkLR+HNGfZS/5RJlPpre5hS9R12w4gseY5WmkF9fFrPtsC9YTX697qAGF3sTxOHPKh/4a5Q9UfMdaKXlVKSEKVJt7HyFDermgqzEiBRXtf24FaNas04C76jSxsL4qLN2UELNcVRHyHCdXhM7MgJE3EfES2yomfyZymkAabHYqxGXiCcwU4dVJ5TLQUtyhaiNpcKS4YPY68pDEXtsDNCrVvi9qtC5qsntGbVCjya139RyM3Fgp8KkLq4a2uTitTWyXIKg/0sExA1pFSYkuhhGJ9CEbkMH/w6Q9vDuor+zwdk=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cllhS1h2c2Nsd3ZJV2pZK2ZNU0VPbHZFZnFxOEVMejJUNFZjRnFmNGIxNlVV?=
 =?utf-8?B?TVNQK3RFVkF4a1lzV0xLMG1wVXFMUFNnTXR0Qm5NOHQyQURxenppdTZEelZo?=
 =?utf-8?B?MGtYcHdzQnVjUEhhZHRITGpjcVdZK1pRdU9aL1ZwdHh2VXRkRFRXV1JWWk1X?=
 =?utf-8?B?Und2ZFhTSlJCK1JaKy9QUU9SYUVDeVBuVVJRMit0bXBrdlc3ZnBJRGV1YVhh?=
 =?utf-8?B?MEJGbnlhU25pcEt6YXQvV0VpTFBPVlgvSllRUmw1YTNjU3JSdE90d1ovTm1a?=
 =?utf-8?B?eHZYV1dHbTFBSHBJcU16UEp5NmJzVlV5eVlPbldBWUltSkk4VTNFVlJmSlJk?=
 =?utf-8?B?dWdkc0s3U2RiUjBhd25BUS9ybHI2SlVtVS96UFBCT09sdU85M09jMEZyUkF6?=
 =?utf-8?B?OUM2Vzd4TXA3b0FMZEtoVFF4eFdNZ2ZSVC9MUGJFV3V3aUo2RnF4WWtkZUxF?=
 =?utf-8?B?TkdoaVN4QWlyK3AzOFVBY2NpOUVLNXZkdnlCZmphV0luY0xWeVprMU8rN3Bh?=
 =?utf-8?B?UWoxWlVzUWVaK2twSVkrTWtncHVDb1I2NWdyc1dZQkxhQW52Y1czd2FRZlFn?=
 =?utf-8?B?ZGhSZ2tiUG5weUVOSjZTOWJZNEhDVS9XWmZuRXJyZ3JndWxtWEhsS3pGMG81?=
 =?utf-8?B?blFnWkFENU1oZ2pKMmxFbjBSL3FjVnBaOGZzZWVSZ09YN1VoN1A0OGQvYm9o?=
 =?utf-8?B?TU14V1liWjVOdjhUOFlCS3BxRVlwekxZRmprQzMySUhtdVcrRzF5MjA2aWhl?=
 =?utf-8?B?cjUzTEZXdVlPQTNiNzhVU29KSEx4T2d1bmdFcE5tenJ2SHZEaFNuVDJLWVBI?=
 =?utf-8?B?QmpWUkpZdW5BUG82WVBZRTJxZDczOTFqYUE0VlBCRk5RVnEzVjZVOXk0K0Vs?=
 =?utf-8?B?b0h4OTUwV2tyVE9ic1NVNE5FZnZTNS9qWHVyMXVuc2hyM3M2VlF2MVVsazRw?=
 =?utf-8?B?cXp5c0U2ckE4MThjREZRUDhLQldvZWhaOUVBMThkWFBNVXFtbUxDMGxJMVRw?=
 =?utf-8?B?eE9uV0VGWWhOekZoc3BNT2FJWmJFTVdZYVlyYzJEM3JnaytObExGTVZTM09s?=
 =?utf-8?B?RHRMclE3MnRrcTErVnlNaTMwN05tVjB1L3Y0dFpmME9nQjdSRDNaSjlhM2hX?=
 =?utf-8?B?a2NxVjVPbWVFcUk0NWVvWVcyTm8yc2dHNnVheHV2WG1SdkZaNitFMEVoWjRj?=
 =?utf-8?B?ZFVmNC82NTFUaFNWQ2xYTXV0UE91a0Z1NUhOVElUWFVTdTRva3Bwd1pjQmR0?=
 =?utf-8?B?NHVtZlpkZlRMN0JCZXhLcWw0UWpYOUpJUWtXK0xqM0ZQSEdVaUJIb2dCNGpO?=
 =?utf-8?B?dnNoS1hmamZhbm1ZaXpWTkxXMVpMNzBzSnJKbDR4RStLNFJ4Q205L3A1MHJK?=
 =?utf-8?B?UGs5ZlBIZStqNmN6THlLamh6ZjZ5WjF2OUVwOWY1SXRrTTBmUElHT3BqbnlK?=
 =?utf-8?B?WW14dkxIb1E1NzJuQW5PWXEwVHFYd3ErZTJWZ1BYU1RPcG1XWUh6dTQ1aDdn?=
 =?utf-8?B?QmZFL2t2Z1JPRWVxaXV4aWtRNlJHd3FJTlRHckpNaWlxWE5EQWFuVUxoeThh?=
 =?utf-8?B?K2tMYXdIYWp2bW9EeDhFWVRLb090MUNOdlllK0VnckwrVXVZK2J4M0t2Q2dG?=
 =?utf-8?Q?iTjGJrcoJY/yPIW+FeJpnpdZeW0Y+AeojN+VOsxaq/eg=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22c75517-b387-4f58-d3d2-08dc1bf5a4a7
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2024 09:28:22.5366
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB1255
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_012846_423828_6BDEEE1F 
X-CRM114-Status: GOOD (  15.47  )
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

Ck9uIDIwMjQvMS8yMiAyMDo1NiwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiBPbiAyMi8w
MS8yMDI0IDExOjExLCBDaGVuIFdhbmcgd3JvdGU6Cj4+Pj4+Pj4gK8KgwqDCoCAkcmVmOiAvc2No
ZW1hcy9jbG9jay9zb3BoZ28sc2cyMDQyLXN5c2Nsay55YW1sIwo+Pj4+Pj4+ICvCoMKgwqAgdHlw
ZTogb2JqZWN0Cj4+Pj4+PiBXaHkgaXNuJ3QgdGhpcyBtZXJnZWQgaGVyZT8gWW91IGRvIG5vdCBu
ZWVkIHRoZSBjaGlsZCBub2RlIHJlYWxseS4uLgo+Pj4+Pj4gdW5sZXNzIHRoZSBjbG9jayBpbnB1
dHMgYXJlIHNwZWNpZmljIHRvIHRoYXQgY2xvY2sgY29udHJvbGxlciBhbmQgeW91Cj4+Pj4+PiB3
aWxsIGhhdmUgaGVyZSBtb3JlIGRldmljZXM/IEJ1dCB3aGVyZSBhcmUgdGhleSBpbiBzdWNoIGNh
c2U/Cj4+Pj4+IEkgZG9uJ3Qgc2VlIG1vcmUgZGV2aWNlcyB3aWxsIGJlIGluY2x1ZGVkIGxhdGVy
LiBJdCBzaG91bGQgYmUgb2sgdG8KPj4+Pj4gbWVyZ2UgdGhlbSBpbnRvIG9uZS4KPj4+PiBoaSwg
S3J6eXN6dG9mLAo+Pj4+Cj4+Pj4gQWZ0ZXIgc29tZSBkb3VibGUgY2hlY2ssIEkgZmluZCB3ZSB3
aWxsIGhhdmUgbW9yZSBkZXZpY2VzIGluCj4+Pj4gc3lzdGVtLWNvbnRyb2wuIEZvciBleGFtcGxl
LCBpbiB0aGUgU1lTX0NUUkwgYXJlYSwgdGhlcmUgaXMgYWxzbyBhCj4+Pj4gc2VjdGlvbiBvZiBy
ZWdpc3RlcnMgdXNlZCB0byBjb250cm9sIHRoZSAiR2VuZXJhbCBQdXJwb3NlIEludGVycnVwdCIu
Cj4+Pj4gVGhlIHBjaWUgY29udHJvbGxlciBvZiBzZzIwNDIgd2lsbCB1c2UgdGhpcyBpbnRlcnJ1
cHQgY29udHJvbGxlciB3aGljaAo+Pj4+IGlzIGRlZmluZWQgaW4gU1lTX0NUUkwsIHdlIHdpbGwg
YWRkIGl0IGluIGxhdGVyIHdvcmsuCj4+Pj4KPj4+IEkgZXhwZWN0IHRoZW4gYWxsIGRldmljZXMg
dG8gYmUgZG9jdW1lbnRlZC4KPj4gaGksIEtyenlzenRvZi4KPj4KPj4gRmlyc3QsIEknbSB2ZXJ5
IHNvcnJ5IGZvciBoYXZpbmcgZG91YmxlLWNoZWNrZWQgd2l0aCB5b3UgZm9yIHRoaXMgc3lzdGVt
Cj4+IGNvbnRyb2xsZXIgYW5kIGNoaWxkIG5vZGUgaXNzdWUsIGJ1dCB0aGlzIHRpbWUgSSdtIHN1
cmUgdGhlcmUgc2hvdWxkIGJlCj4+IG5vIG1vcmUgY2hpbGQgbm9kZXMgZXhjZXB0IHRoZSBjbG9j
ayBhbmQgaW50ZXJydXB0IGNvbnRyb2xsZXJzLCB0aG91Z2gKPj4gdGhlcmUgYXJlIHNvbWUgb3Ro
ZXIgcmVnaXN0ZXJzIGluIFNZU19DVFJMIHNlY3Rpb24sIGJ1dCB3ZSB3aWxsIG5vdCB1c2UKPj4g
dGhlbSB0aWxsIG5vdy4KPj4KPj4gT25lIHF1ZXN0aW9uLCB3aGVuIHlvdSBzYXkgInRvIGJlIGRv
Y3VtZW50ZWQiLCBkbyB5b3UgbWVhbiBJIG5lZWQgd3JpdGUKPj4gYmluZGluZy95YW1sIGZpbGVz
IGZvciBvdGhlciBjaGlsZCBub2RlPyBCdXQgdGhleSBleGNlZWQgdGhlIHNjb3BlIG9mCj4+IHRo
aXMgcGF0Y2hzZXQgKHRoaXMgcGF0Y2hzZXQgaXMgZm9yIGNsb2NrIHN1cHBvcnQgb25seSkuIFRo
YXQncyB3aHkgSQo+IFRoYXQncyBub3QgdHJ1ZS4gVGhlIHNjb3BlIG9mIHRoaXMgcGF0Y2ggaXMg
dG8gYWRkIERUIGJpbmRpbmcKPiBkZXNjcmlwdGlvbiBmb3IgeW91ciBkZXZpY2UuIElmIHlvdSBj
aG9vc2UgYW55IG90aGVyIHNjb3BlLCBJIGRvbid0Cj4gYWdyZWUgYW5kIEkgYW0gbm90IGdvaW5n
IHRvIHByb3ZpZGUgcG9zaXRpdmUgcmV2aWV3Lgo+Cj4+IHN1Z2dlc3QganVzdCBhZGQgY2xvY2st
Y29udHJvbGxlciBpbiB0aGlzIHBhdGNoc2V0IGFuZCB0byBhZGQgdGhlCj4+IGludGVycnVwdCBj
b250cm9sbGVyIGluIGFub3RoZXIgcGF0Y2hzZXQgZm9yIHBjaWUgc3VwcG9ydC4gVGhpcwo+PiBt
ZWNoYW5pc20gc2hvdWxkIGJlIHN1aXRhYmxlIGZvciBvdXIgZXhwYW5zaW9uLgo+IEhvdyB0aGVu
IGFyZSB5b3UgZ29pbmcgdG8gc29sdmUgdGhlIHJlcXVpcmVtZW50OiAiRE8gYXR0ZW1wdCB0byBt
YWtlCj4gYmluZGluZ3MgY29tcGxldGUgZXZlbiI/Cj4KPiBodHRwczovL2VsaXhpci5ib290bGlu
LmNvbS9saW51eC92Ni4xLXJjMS9zb3VyY2UvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3dyaXRpbmctYmluZGluZ3MucnN0I0wxNwpMZWFybmVkIGFuZCBJIHdpbGwgdHJ5IHRvIG1h
a2UgYmluZGluZ3MgZm9yIHN5c3RlbS1jb250cm9sbGVyIGRldmljZSAKY29tcGxldGUsIHRoYW5r
cy4KPgo+IEJlc3QgcmVnYXJkcywKPiBLcnp5c3p0b2YKPgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
