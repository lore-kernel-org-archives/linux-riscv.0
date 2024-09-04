Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37C4BCD37B5
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Sep 2024 00:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:From:Cc:To:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=M4pXYAKYVKSwEAwk/0/REPx8ogJw4GqiaNdH1Yo82QQ=; b=D+tYbSxgKbbb7e7fz55ir8OgE6
	4Xrrs0VDQ6P+GbtWKE8u38fiFBs1gupl5QxVdF1VLXI+jt4WDyDMXVSfh500+xgFc0fuoxf6DZ8WL
	Zp9WuOZ6fwIxhOqFy+QvVOeJP7gUY9UmCLQFDBz+hceocpfeDLZZ4eCWzelI2xbAtx29XPeo29aVV
	C1fb8NcIs+3zDETiJ+9jV8MczGjGY0QXqnEme6JcWzJJpAwVuv1vl/eoEIZuoBT6WxavR7vgfUorl
	Mx4eJTgnaoSi5Zxdp4Z7yQP6AIr2w0pp9pwt5KtAmYf/+XfvPUs9VMIK+d5Vamh3vexcSG3Tgyz4C
	YgPgt+Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sleGB-00000002Q9E-0nSL;
	Wed, 04 Sep 2024 00:52:35 +0000
Received: from mail-bmxind01olkn20811.outbound.protection.outlook.com ([2a01:111:f403:281c::811] helo=IND01-BMX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sleG8-00000002Q88-3NO3
	for linux-riscv@lists.infradead.org;
	Wed, 04 Sep 2024 00:52:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WOj3Q+GYFt/h1u1xCTEcfxHE1JKiwTCfvozanLCIMjo1r0GBZHAhTPvL9Pw4ScYNpmgJwDWhUL+TOkjZIONGt+V5uAJf3/UNWSy1FVtXy6TW6P82gV8SdQQvan9GPPtWFshIhxwatZa/xT2728a+EBArh0tBJ93ZsGElVL+8tyJn+GOaknJECVWIFlX/3vpJRQ/op/nWJSvuuH8ZsZHKOiG8NfYooHsugxDSCbBsq4vWBcdt8jc25x8C8x7BRmeexDUZvr4lj/aUvK59lm388+wNob/sNH6ibfIYozy8rOBp4/L1lYuKzcwpYlF8qRCjCobzQwMBsP+5T1ie4NW8BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0KewacEwaM/xLrHcbsQ4V7raXOhSgtMrth9N8xCzo78=;
 b=l2DewhGlvDT4nQ7uzNJEnYBFD2m7UBwbZ94iU31mCJvAJ/RNNJ/ipG+4qoiAdQLTp1vzuglQTWEORYUEULHzuJvCjz0/jZxailX+qNNFKm0JJp0G+qU5IezPUn0w5+T27gkJv/9cFoaxPZlDeAF4Ei+BNAybmbUWixHri6/sVo/uuBB76Svq/WJiBIytSq1T4E4aWFQBZXyPP+r1pSxjY1fK8p6KJcospvoSfB20e6Bwb8T+jRR2QNzY+W+yNb1ya6cF4tHTZhsUMSLvZhtD1huQjfhkcDSqO9atiVyFDVxh+A1FuNmV4s4xxtyLy1vksNepNQxt4SlwNax7RielNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0KewacEwaM/xLrHcbsQ4V7raXOhSgtMrth9N8xCzo78=;
 b=FoFaxr7TewyKVFt5n7/RWVkPNJmwo6wKKfQfhBM1oSRsHiPvEbVimf6awYRh1IogNybhMIUuLOtu8n6D77wOAUegD6yIvh51nqUIMOYBHl/VIwSNp/KTEpmmDHK+wP/K3y1xZyn5fS3wNreaD4SpEBmK8ZCthqMdFYdOi/hFqI8Cla8ZGFrcVnPBCbaSNY+3BB8JXJcaxPHmER3w/0utxXrY/T9ikIZq77hIhKAfSXtynDkDR1fdzxcjxJ5xHX+z2m5Gov5er4qfrRpr7n8OtiL96OiuoG6hA5gnYWp8e9hgTuDmasVGWo0jwPyNCkNdP6fr6qyj6ECPc406rLz/sw==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by PN0P287MB0962.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:16a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Wed, 4 Sep
 2024 00:52:22 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c%7]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 00:52:22 +0000
Message-ID: <MA0P287MB28228F4FC59B057DF57D9A11FE9C2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Wed, 4 Sep 2024 08:52:13 +0800
User-Agent: Mozilla Thunderbird
To: soc@kernel.org
Cc: Conor Dooley <conor@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Inochi Amaoto <inochiama@outlook.com>,
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
 Xiaoguang Xing <xiaoguang.xing@sophgo.com>, haijiao.liu@sophgo.com,
 Chao Wei <chao.wei@sophgo.com>, unicorn_wang@outlook.com,
 linux-riscv <linux-riscv@lists.infradead.org>
From: Chen Wang <unicorn_wang@outlook.com>
Subject: [GIT PULL] RISC-V Sophgo Devicetrees for v6.12
X-TMN: [23j/I9PCUnyOmCZCd01lmI8ah8RBPtl5]
X-ClientProxiedBy: SG2P153CA0047.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::16)
 To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID: <2af935e8-9d1e-4cd4-99bc-d8e70bac0c14@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|PN0P287MB0962:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bec92d8-092e-4934-0282-08dccc7bd4e7
X-Microsoft-Antispam: BCL:0;ARA:14566002|5072599009|6090799003|19110799003|8022599003|461199028|8060799006|15080799006|1602099012|3412199025|4302099013|440099028|1710799026;
X-Microsoft-Antispam-Message-Info: /f7KSi9jrTzuw1B1btApr4REtiUuStYRWDGHcZNN/gcbSaFJFZ0gveJ6QY4q8unJ9T+gDMGileXvg2uBoJRvptAhPszAr8xpqVYRvrSKWk9TtSj+vDawJ7JQuNVLjQNjbiGeuifqDodYUprER+y88RjESG5CptFAWUQFgZYV7zRtOG9xse636iqMm7/3dlCbQR4nGlHC4bVDDM1pZ7w1o6AlMxo5zgxLlkBTE8GEXTbTWVsLrfrmCwcEyGgE2RM6HjoCorl7h40/MFhsIdOqeNhDjnP+ZO8zEPM/ComFYwL62qzZuyPff7yHtUAFgS/5tgvnZaVJCPyqQQ5/WiN/FTzpygQ+NGR9hF2AZXJykS9xY0Qqlax+a0ZUQXqRxucrC0XkodYnWEG005kZOxsnBfLwsb9IuOyXY3IdbZ/A/BDUPISy4k/WYOxLdAVnN7ablh85CC+mMoC0S9+92HIJKZMwUuw1DlDR3hQMXqV3opjTMg45n7AhxnIvmVSqMSeL1c1BeQu0s0+GGQWmIp3D6YhFAegEgtA9nckOb+IXndqVAicRazto/TPMptg0kGvOiLzS51+mtfln+CTaUwF0GRd0HWehSf3O9sLULeJugTMYmUDuCukLlh+/T4FQBGR5cotmFB7fYlj1cTErFGKoH/M8bpuqSyN8NG0Pb8gaIwYa523TV3pkUZqu4JKS0NPxnV6pDDuiNDoiOT/zDQw9YRmHjxsix54Gf2hT+j4maydjSF/Z6VZZ8Da2jRhJsUalRDt45MgdkgX2zFy01AHeNUykrowlwi+ihe13S/TgvGI/pUe8uss48VqbpVNlE3gwrQDv5KMmyWvlz0OHbHrAvDRDD+L5NKd7blOeI97CTpvKs7hnHW9a7FSGUwk9M/tQv+RKEdsuRMbP8wRh2khopA==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U1dKZm8wbnBvUVFhalpsVkNRck5vb09WQW1KOWdSb3RYLzF1akhiOEQwcUFI?=
 =?utf-8?B?MmxBQmtGME9LNnhWZzRNRlAyVkRtMUJHZ1FDNkRCNER0L3pqNjJIT3dZZEUw?=
 =?utf-8?B?c0NqNHEvblJRSFlwY2wvbU9ERHErNDdoWTFuR1JYREZ1Z3ZTclptUzh0cmlu?=
 =?utf-8?B?Z0ZHWnFFNm9ZclpQangwNjBWRnJ6SXhsblNqZXlBdUpVeGo1UFRJNlFUOWgw?=
 =?utf-8?B?VU5rOWphSDhSSVZzS0YrbmR1c3ZoUmdwRVBYdWx2cnFZbzFiMW5ZeUUyenQ2?=
 =?utf-8?B?WCtEc25FS1hrT1dXdmNFZzZYbjRjZ1lGcGpQUTVWK015RWdZU0ZmVVNZQ2lE?=
 =?utf-8?B?UWY3ZlYrb3BTM3R6eHhCRGhVejY4dHhTME9xR0UvdGF0N2pZaVdnRlZPUVd6?=
 =?utf-8?B?eUtkMWJ2QTQ1aUpMdTMxanVNdDd3OFE4QmJhOWJZTU9WZEdWMm9qWnhZT1pK?=
 =?utf-8?B?dVNtc0I2Y0doMEVvMitrc2d6dHQxMEd3MkJ4RWZxVEt2Qmo0ZnRkRTFoRU84?=
 =?utf-8?B?VWk4RDRBazVxMG9pY2h3bTh6eGdVeldxTm9WQlVQVXQxYnlQb1JLcXJKVVp5?=
 =?utf-8?B?Rjc1aFFISXBwaGhiN0RhUDU4eXhkNkdRaEE2MG50ZU5vVVlVeEZDazhWSHNq?=
 =?utf-8?B?UWE1UUgwQTdXaFBMbWhaNXhOd25MbzZEaVV3eDdoSlcxU2JJYXBIZkYrTzNs?=
 =?utf-8?B?anY0VGplSEtIZmI3cFhyY0FZcG1NSkEyYWdRN0dtU05OKzRGeUVQMndXdXBE?=
 =?utf-8?B?Tk90MjNnRnNwRUhQY3ArQWxSNWgvQkFpVUhWRU5tUGVKWUkwUWhpaVp0VkFp?=
 =?utf-8?B?Y280M0cwZzl4Y3lCbXBuSFBsYnp6Y3B0dnZncDRjcUdHeWJKWHUyS3lNZkFX?=
 =?utf-8?B?T0dXbENoSnhYVDFoNEtsenJFYkZnWDlYR3RIZU5FQkhCc0VzTTRBUmJ1OXdw?=
 =?utf-8?B?d0Fmamd0R0dCYTkySW9zbzBONUl6SklqS1ZudzJaeEpocTJEZEl3OXpoUW5j?=
 =?utf-8?B?d2VYanB5bENTZjNTL1hWQlhUYUVtWHo3ZjJhMUdnQzFCSjBmaDN1YlZzb1Q0?=
 =?utf-8?B?V1dESHJJMm4vbnp1Y2xhME5QOFIzdWFnOXlyQkpHbjJNUEhLSXV4OGtSUmxt?=
 =?utf-8?B?cVlTRVo4UmRLdXFJZ3ZsUCtxNVQyNXdHbVZ5bmdRWHovRkpIOXlpQ0V0QnlJ?=
 =?utf-8?B?aUdhWkNueW5uekliNUpFdmwxZGY4d3IwV3VHK0tJSzVvTnYrWVhlTy81TGVB?=
 =?utf-8?B?SzZiVEJSSE9sTVlTRVlxa3dXMnZRL2hRTFhabFVvaUtMajNnZFhDWGxQcVpH?=
 =?utf-8?B?UStYQzVOM3FydVY2TFFXc3FGYmlQYUlWTThHcEFpc2tLTjBhY0xtNXk3TE1G?=
 =?utf-8?B?QWp3aXdtRlhQVHoreDlSNUZOWjFqRU82S3Rua2ZaQWF1ckZEZ1VWYVN1N25u?=
 =?utf-8?B?V2UwQ21hR2VDMjNRWno5bkpIMkx5V1dkMUJUNCtVVFRoOXBOemR3emZiTmYx?=
 =?utf-8?B?U0I0WXB0Uk02dTc1QXQyMUtaR3FEa0ZaV0hYdEpvQmhCUC9xcXdOUWdKZ1h3?=
 =?utf-8?B?WHRSMnA4Qis1Rlk4Ui9vMk9WMVdFODJWT295bG5JWXEvR3h2SzhDd25jcXAw?=
 =?utf-8?B?TFRreUtiWmxDb3lKYUZrTkRiUS80Mkx5cjVJK1pVUHlGSjhland6cXkrcXF2?=
 =?utf-8?Q?tRq5+wGjgqYxlnPWSfha?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bec92d8-092e-4934-0282-08dccc7bd4e7
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2024 00:52:21.7955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB0962
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240903_175232_882501_C108E68F 
X-CRM114-Status: UNSURE (   7.12  )
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

SGV5IEFybmQsCgpQbGVhc2UgcHVsbCBkdCBjaGFuZ2VzIGZvciBSSVNDLVYvU29waGdvLgoKVGhh
bmtzLApDaGVuLgoKVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCA4NDAwMjkxZTI4
OWVlNmIyYmY5Nzc5ZmYxYzgzYTI5MTUwMWYwMTdiOgoKIMKgIExpbnV4IDYuMTEtcmMxICgyMDI0
LTA3LTI4IDE0OjE5OjU1IC0wNzAwKQoKYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRv
cnkgYXQ6CgogwqAgaHR0cHM6Ly9naXRodWIuY29tL3NvcGhnby9saW51eC5naXQgdGFncy9yaXNj
di1zb3BoZ28tZHQtZm9yLTYuMTIKCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byBmYTE4
MjNkNGUyZWJmMDVmZmUwMDA4ODdjNTdjNDBkNmYwODllZTI1OgoKIMKgIGR0LWJpbmRpbmdzOiBy
aXNjdjogQWRkIFNpcGVlZCBMaWNoZWVSViBOYW5vIGJvYXJkIGNvbXBhdGlibGVzIAooMjAyNC0w
OS0wMiAwODo1NTowNyArMDgwMCkKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KUklTQy1WIERldmljZXRyZWVzIGZvciB2Ni4x
MgoKU29wZ2hvOgpBZGRlZCBETUEgY29udHJvbGxlciBmb3IgQ1YxOFhYLgpBZGRlZCBJMkMsIE1N
QywgR1BJTyBhbmQgb25ib2FyZCBNQ1UgKEhXTU9OKSBmb3IgU0cyMDQyLgpFbmFibGUgU0RIQ0kw
IGZvciBIdWFzaGFuUGkgKHVzaW5nIGN2MTgxMmgpLgpTb21lIG1pbm9yIGNoYW5nZXMgYWJvdXQg
ZHQtYmluZGluZ3MgZm9yIFNpcGVlZCBMaWNoZWVSViBOYW5vIGJvYXJkCih1c2luZyBTRzIwMDIs
IGFuZCBTRzIwMDIgaXMgdGhlIG5ldyBjb2RlbmFtZSBvZiBDVjE4MXhDKS4KClNpZ25lZC1vZmYt
Ynk6IENoZW4gV2FuZyA8dW5pY29ybl93YW5nQG91dGxvb2suY29tPgoKLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpDaGVuIFdh
bmcgKDIpOgogwqDCoMKgwqDCoCByaXNjdjogc29waGdvOiBkdHM6IGFkZCBtbWMgY29udHJvbGxl
cnMgZm9yIFNHMjA0MiBTb0MKIMKgwqDCoMKgwqAgcmlzY3Y6IHNvcGhnbzogZHRzOiBhZGQgZ3Bp
byBjb250cm9sbGVycyBmb3IgU0cyMDQyIFNvQwoKSW5vY2hpIEFtYW90byAoNSk6CiDCoMKgwqDC
oMKgIHJpc2N2OiBkdHM6IHNvcGhnbzogY3YxOHh4OiBhZGQgRE1BIGNvbnRyb2xsZXIKIMKgwqDC
oMKgwqAgcmlzY3Y6IGR0czogc29waGdvOiBBZGQgc2RoY2kwIGNvbmZpZ3VyYXRpb24gZm9yIEh1
YXNoYW4gUGkKIMKgwqDCoMKgwqAgcmlzY3Y6IGR0czogc29waGdvOiBVc2UgY29tbW9uICJpbnRl
cnJ1cHQtcGFyZW50IiBmb3IgYWxsIApwZXJpcGhlcmFscyBmb3Igc2cyMDQyCiDCoMKgwqDCoMKg
IHJpc2N2OiBkdHM6IHNvcGhnbzogQWRkIGkyYyBkZXZpY2Ugc3VwcG9ydCBmb3Igc2cyMDQyCiDC
oMKgwqDCoMKgIHJpc2N2OiBkdHM6IHNvcGhnbzogQWRkIG1jdSBkZXZpY2UgZm9yIE1pbGstViBQ
aW9uZWVyCgpUaG9tYXMgQm9ubmVmaWxsZSAoMik6CiDCoMKgwqDCoMKgIGR0LWJpbmRpbmdzOiBp
bnRlcnJ1cHQtY29udHJvbGxlcjogQWRkIFNPUEhHTyBTRzIwMDIgcGxpYwogwqDCoMKgwqDCoCBk
dC1iaW5kaW5nczogcmlzY3Y6IEFkZCBTaXBlZWQgTGljaGVlUlYgTmFubyBib2FyZCBjb21wYXRp
YmxlcwoKIMKgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2ludGVycnVwdC1jb250
cm9sbGVyL3NpZml2ZSxwbGljLTEuMC4wLnlhbWwgCnzCoMKgIDEgKwogwqBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3Yvc29waGdvLnlhbWwgfMKgwqAgNSArKysKIMKgYXJj
aC9yaXNjdi9ib290L2R0cy9zb3BoZ28vY3YxODEyaC1odWFzaGFuLXBpLmR0cyB8wqDCoCA5ICsr
KysrCiDCoGFyY2gvcmlzY3YvYm9vdC9kdHMvc29waGdvL2N2MTh4eC5kdHNpIHzCoCAxNiArKysr
KysrKwogwqBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9zZzIwNDItbWlsa3YtcGlvbmVlci5k
dHMgfMKgIDc3IAorKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogwqBhcmNo
L3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9zZzIwNDIuZHRzaSB8IDE0OCAKKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
LQogwqA2IGZpbGVzIGNoYW5nZWQsIDI1NSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
