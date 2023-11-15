Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D5A9C47072
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Nov 2023 02:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3432uhzrEopYbCAdybc0+qmWyTpjA0W9NYndD6ipNr0=; b=tvlRByVQT3otafmLYxxeXh2ZJF
	anzkZptd4IR7h8rHV087CqIxFj4a5gH6uOvvYkuypHuPV3dVdfsObG4T4Y1giPwjP+aKJ00wx5bmN
	1t1NZ3xPjZ2VvvfU7g0uJDjo83+KuY24xMP6q6RqJmhM4wk99jSXVaKoaCA8/GBXc+MA0yQzYYM50
	Pv2d+ud7Lczkcdx2TQGdcqIjV9uNKfIyaZj0GfwgAS+fNghF6WPEcfCbRPtuFyQm/teFMHelt75vn
	sQfvt+FqHrO2ZBjD9HiVr5SUb9Ak2Do3ot8T/wVK60TRWB0HegvUiKrbEtxAA5YIbcKdmvczNlXAX
	dSP+axdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r35zI-00HHqM-2l;
	Wed, 15 Nov 2023 02:50:44 +0000
Received: from mail-bmxind01olkn20801.outbound.protection.outlook.com ([2a01:111:f403:281c::801] helo=IND01-BMX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r35zG-00HHpd-1O
	for linux-riscv@lists.infradead.org;
	Wed, 15 Nov 2023 02:50:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iyIG4DwOB5io7u7nTGW45kl4N4aTrwiW3Tfwz+4F3iE3jpHSv2gAPWBShmV1Hw0Cj184vYwL5ayWSS7Rvxr69rrYxSffQWXBxy7GYYqfnueV9Hvz/8kaVQuTP9PIXzsW758Rv8d+y89bgAHMZ2gTFjFW8a/LeFVYhvsB9MJI8OIPbn/wNCK+f7SEXRe6MXfBOe2Fn4AQ7aZ/iXub1kyrmtjlKtWVSF99/qx9iALdKvDDjRT+/DRK8F5dBlp2dp+a8gENGYV6hvAXP/nZByBNfBzTwN/DrItvRYEYiPOVuhBtv+xUawoDRXjgCFThhkrXw6emy4N+HIB89O5Nxxzpng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f8wRBArRDv5vFodQ7HPWe0bidS5cmtRLzhFaYJaNt10=;
 b=GrsxeI52SX9o50CWGMjgAix24oN30sARkmg68FZrgX3uAlQ+XYLsSebGFO+a9bFsBz0ZJYq2b8swYGUf9OBdb3tvENHjCrC0AozHQRMm0BfTotkhieAq23kDbk3TZq6sBgtsoNDY/8ho+azOcySV6VKjyePxrcnoVxLsB6aSelt6WuRgaBuzy3exXrst9oz3xdE1s39kj2eix8E6E3c4I6dmw9NZEb8aZX/W6uvWeGT6z33oy4zBESXW4TmU2vbpr7acni9j9yBW0cZ7smmr0/z2tnO8bd6bCAHfD1meM4MVxo0OJsbgOeLsQkhl4Dm2iMjKEocNCDJxQRT4B3ej3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f8wRBArRDv5vFodQ7HPWe0bidS5cmtRLzhFaYJaNt10=;
 b=s1HeLtOXYZit0rb8Qp+O8TAYxW1pv/MB/r2mRU/ZyY/Vl9NeTcf4Cuxua4OG7tQsC8yLRFBj6Zeuc1KLJyOv2CkSr3FX5TjZansdfvVFWYaShCLSzI5aGkHnxNb5W6YFcwx7HPEJmJMsxcooCnGA5E9Lao+3onn73Sa6AZILZL2dww2t30f2vFjz8biMmCoUm3i8iPdvM3ipubwLhGo0Lr5zs7+IbnWp/wUjZ2cpr1WxO4CxuiNgXShGxcpg8/SsbXbBNFe1azAbyItdX8HD8T2s1mJG4zBH4N7FQyAuA9rEBZDi2X+qCev4YzB24Ut2+UU4ccgRYyqfrHUOpfqTgw==
Received: from MA0P287MB0332.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:ab::5) by
 PN2P287MB0738.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:f5::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7002.18; Wed, 15 Nov 2023 02:34:39 +0000
Received: from MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
 ([fe80::b1a7:eee7:e903:9ef3]) by MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
 ([fe80::b1a7:eee7:e903:9ef3%7]) with mapi id 15.20.7002.019; Wed, 15 Nov 2023
 02:34:39 +0000
Message-ID: <MA0P287MB033267DFDA919663B01C6C57FEB1A@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
Date: Wed, 15 Nov 2023 10:34:29 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] riscv: dts: add clock generator for Sophgo SG2042 SoC
To: Samuel Holland <samuel.holland@sifive.com>,
 Conor Dooley <conor@kernel.org>, Chen Wang <unicornxw@gmail.com>
Cc: aou@eecs.berkeley.edu, chao.wei@sophgo.com,
 krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
 palmer@dabbelt.com, paul.walmsley@sifive.com, richardcochran@gmail.com,
 robh+dt@kernel.org, sboyd@kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, haijiao.liu@sophgo.com,
 xiaoguang.xing@sophgo.com
References: <cover.1699879741.git.unicorn_wang@outlook.com>
 <25fcbab4c04bcbbdc4577dc58822540829f91dc9.1699879741.git.unicorn_wang@outlook.com>
 <20231114-grumble-capably-d8f7a8eb6a8d@squawk>
 <PN3P287MB032447BC501261D47E8E3124FEB1A@PN3P287MB0324.INDP287.PROD.OUTLOOK.COM>
 <68220eb6-8a20-42d4-83e5-d0d45b2f1404@sifive.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <68220eb6-8a20-42d4-83e5-d0d45b2f1404@sifive.com>
X-TMN: [lsGd0pydk6mHAX0yLrMSNC6MGxr6tSbyKL1KG9fttLk=]
X-ClientProxiedBy: TYWP286CA0026.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::15) To MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:ab::5)
X-Microsoft-Original-Message-ID: <02ac84a4-ccca-41cd-ab95-a97cc0dfa87d@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB0332:EE_|PN2P287MB0738:EE_
X-MS-Office365-Filtering-Correlation-Id: 5231c69d-45ee-4cde-5743-08dbe58368f6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ghf91YSybHWqbYNWLBUKE++Ncp4avt/YxtSHEX0aoEJHzCLeOVzi7UTBGUtIOY7iH6mNLVjvf2rSqcfDBHtECAzmCLlKWvN35prxFnRIYOoQ6B1lNao77QuUqIrzC5Xq+art+eukZL78ui6IaE/XLhPUDuYpto/TCGlxwIIK/6vB4jc7ABEseDlFEFzFYjd5RtpFrYqq9SRMIevIJbveJk5UUY2OXbqJKBTw+kq3H47DahB4e1ti6jP3/tkEdfS5tjTFkhR3/zq4cC7/ia327NEoS2lfHZlW+pbdNHgNIe+uNWCgHbVmrvTwCMzHZQFfQ8YK7Lw86xgE470AnVUToYyzJ+tlf0tqGWTNgg8OSJ3/YP9JnbnNQNNJql6tZI7U78/rFDvvkV3nP04nuZWheOsOZ8/m/MRgpgnNViqpy7zjVZ00sXsWytzxWihcNqInDOsnUidiG0dqIUwsuLZ9xXA85rK3rhbJ3ugSd4HSFN3iXjT68AnudfWPt12yOYm4fGlkoeaBAHksqTPKDsUyxaygpfJYQqawoNTbQzbOJv9VBClrxMY7GmiSSiTm/wTsz92bW5GfHc4JpdMI1LYzKTp52dK8dLXq5wram+62Hx4=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bExMNGRkZExCRWM0SVNlYUFlcUVhTjhGWC9hNEhZbDlOckRkbjNvcGZuRitO?=
 =?utf-8?B?UjNSbkZsWmltQy9vU0pDYUNYYUpQb0FNVFdzMzVPSkpDejlERGZtZnplN05q?=
 =?utf-8?B?OVRLUGJMM3I1czdVODRZTGRDMWZPbmpTN3huZituWVlhK1JEd2xsUk9uVFJZ?=
 =?utf-8?B?TFlsM25zVi8rL3NGaDl0MFlrTkJUZGx4bEtPZUYxUzgzYTQyTWRjQmFOdnBq?=
 =?utf-8?B?NUZoUU1PRXA0SzRicnFwcFMwZjAycVBhMUFpZ2ZEZVY3aC9yck9UM2UrUkMz?=
 =?utf-8?B?eHJhMEpxY1MzVVpLMk9CMXFGZ2tRZU10MDVxV211NlZqeWxDVzA2YWNGMkZB?=
 =?utf-8?B?OVBtM2VTQU9jM3ZpRFhjVCtkQlp4Z290KzZQU0hkUVZWTjYwMnlSclBXZ25O?=
 =?utf-8?B?ak1tUnZEb1NxVXdPczd2cEp5YVVLd0hSc2kyWXU1Vy92UHVTNy9makxsNDdI?=
 =?utf-8?B?dC9HOElKMXZCT2YyMnRRbHZmTjJxNWU3QzhYZXNQVDljemI5UmQ2L0VjOTZy?=
 =?utf-8?B?eUF4UGFQdmx2eHFaOUJURzZqV0RjUEpHRUxmeitTcFJGTDNkY1RSOVVLbGNR?=
 =?utf-8?B?d1RjR0hPZ3pxbnZDOG4xemwvZHRvRnIwOW5aR1VHc09uYXBGZTZBS1I2KzBL?=
 =?utf-8?B?aWNsTWllbDhrandFTEhPbGZXcDBFRGJjYWtyNzFQdTljSnhpMCtqd1lVdm02?=
 =?utf-8?B?NDZrd0UvT3VrT0Nud1ZMaFZYOHRRbEloRVBKSzNYSTFDQnYzdTlTWFFrSFps?=
 =?utf-8?B?ci9BRkxYRkxveG05Rm1qQ3NwR3pKTWg3SlVXS3RoSTdHUlJGNmdKRHVuazBG?=
 =?utf-8?B?eFpLYW5zMTJKWTN1MHVmODE2TTJ6UzFLbmpxbGFmSzgvbmFHeE5HZFZPM0ph?=
 =?utf-8?B?cHFTTUEyanNKOWYrZUdqTnRXangvbjNtU0pUMFNkNHVZVERkTGpwWlhoT1U5?=
 =?utf-8?B?Vm1pNXA2ME1SZXhmaWJwN1dMMU9CWHhXUWpmUFlJOVNwQU80NEM3aEo0REtL?=
 =?utf-8?B?bEJoWHFiMHUrUlVjQ3I1K3R1UkUzamNUNHNEUmdWOXpiajFwNXlKSnVQbk5Q?=
 =?utf-8?B?L0tWWnBhdFZ1RXdLdzdTNHhHaEdJT1lGeTU1ZE1BTU5QWVZrU2UvWCtOaGNF?=
 =?utf-8?B?Q013T0dwOGFSVWJDaHpiRlNYVHFXRGwwcG5UN0x4VTdoalYrT3Nmclp5R0Jn?=
 =?utf-8?B?V1VaUkNqWGw5VlNxaVN6VWJ6VC9QTkNna3NFWktBaFVZbGlvSU81UGE2cEk4?=
 =?utf-8?B?dmZlbTNMSWdWMnRoTEg0TWNvVklzS2dSMWtOUTA2dHIzemt1WkFLVEFRYWF3?=
 =?utf-8?B?V2F1OEZBc0wwRFlVVlZUQ2RtVS9Rcmxmc2sxSmZMeWYrSDY1dnV0NFc5VEw4?=
 =?utf-8?B?eEV4RnlGaVB4dzcvdldycHlPT3RYMlBYaEdKSHFucS9VY1BsVGxKOGNEcU92?=
 =?utf-8?B?ai9wMTN1UWIrRTdSa28rK2IvSlFnWEc1NHlVMWJEaXRCWUJmWUZnMVhFeWdX?=
 =?utf-8?B?WHQzRCs4UXBqVlUzREg1cHRDclkzSlY1SkZOcjN5NldYNHhJOUs0M1VGRW5Y?=
 =?utf-8?B?MnlGNThDaHpZTmQzeWo2RkY3c3N6YzJmREp2N0hSSmk5WnlCNFM4ZDRnVGhM?=
 =?utf-8?Q?clTrW92W2VGDtYkokzQ1M8t7yw0LvGxJVwxys1dR3QjM=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5231c69d-45ee-4cde-5743-08dbe58368f6
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2023 02:34:39.0149
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB0738
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_185042_596865_6D1EA791 
X-CRM114-Status: GOOD (  15.22  )
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

Ck9uIDIwMjMvMTEvMTUgMTA6MTUsIFNhbXVlbCBIb2xsYW5kIHdyb3RlOgo+IE9uIDIwMjMtMTEt
MTQgNzozNCBQTSwgQ2hlbiBXYW5nIHdyb3RlOgo+PiBPbiAyMDIzLzExLzE1IDE6MzEsIENvbm9y
IERvb2xleSB3cm90ZToKPj4+IE9uIE1vbiwgTm92IDEzLCAyMDIzIGF0IDA5OjIwOjExUE0gKzA4
MDAsIENoZW4gV2FuZyB3cm90ZToKPj4+PiBGcm9tOiBDaGVuIFdhbmcgPHVuaWNvcm5fd2FuZ0Bv
dXRsb29rLmNvbT4KPj4+Pgo+Pj4+IEFkZCBjbG9jayBnZW5lcmF0b3Igbm9kZSB0byBkZXZpY2Ug
dHJlZSBmb3IgU0cyMDQyLCBhbmQgZW5hYmxlIGNsb2NrIGZvcgo+Pj4+IHVhcnQwLgo+Pj4+Cj4+
Pj4gU2lnbmVkLW9mZi1ieTogQ2hlbiBXYW5nIDx1bmljb3JuX3dhbmdAb3V0bG9vay5jb20+Cj4+
Pj4gLS0tCj4+Pj4gIMKgIGFyY2gvcmlzY3YvYm9vdC9kdHMvc29waGdvL3NnMjA0Mi1jbG9jay5k
dHNpIHwgNzYgKysrKysrKysrKysrKysrKysrKysKPj4+IFRoZXJlJ3Mgbm8gbmVlZCB0byBjcmVh
dGUgYW4gZW50aXJlbHkgbmV3IGZpbGUgZm9yIHRoaXMuCj4+IEFncmVlLCBJIHdpbGwgbWVyZ2Ug
dGhpcyBpbnRvIHNnMjA0Mi5kdHNpIGluIG5leHQgcmV2aXNpb24uCj4+Pj4gIMKgIGFyY2gvcmlz
Y3YvYm9vdC9kdHMvc29waGdvL3NnMjA0Mi5kdHNpwqDCoMKgwqDCoMKgIHwgMTAgKysrCj4+Pj4g
IMKgIDIgZmlsZXMgY2hhbmdlZCwgODYgaW5zZXJ0aW9ucygrKQo+Pj4+ICDCoCBjcmVhdGUgbW9k
ZSAxMDA2NDQgYXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vc2cyMDQyLWNsb2NrLmR0c2kKPj4+
Pgo+Pj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9zZzIwNDItY2xv
Y2suZHRzaQo+Pj4+IGIvYXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vc2cyMDQyLWNsb2NrLmR0
c2kKPj4+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+Pj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uNjZk
MjcyM2ZhYjM1Cj4+Pj4gLS0tIC9kZXYvbnVsbAo+Pj4+ICsrKyBiL2FyY2gvcmlzY3YvYm9vdC9k
dHMvc29waGdvL3NnMjA0Mi1jbG9jay5kdHNpCj4+Pj4gQEAgLTAsMCArMSw3NiBAQAo+Pj4+ICsv
LyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAgT1IgTUlUKQo+Pj4+ICsvKgo+Pj4+
ICsgKiBDb3B5cmlnaHQgKEMpIDIwMjMgU29waGdvIFRlY2hub2xvZ3kgSW5jLiBBbGwgcmlnaHRz
IHJlc2VydmVkLgo+Pj4+ICsgKi8KPj4+PiArCj4+Pj4gKy8gewo+Pj4+ICvCoMKgwqAgY2dpOiBv
c2NpbGxhdG9yIHsKPj4+PiArwqDCoMKgwqDCoMKgwqAgY29tcGF0aWJsZSA9ICJmaXhlZC1jbG9j
ayI7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGNsb2NrLWZyZXF1ZW5jeSA9IDwyNTAwMDAwMD47Cj4+
Pj4gK8KgwqDCoMKgwqDCoMKgIGNsb2NrLW91dHB1dC1uYW1lcyA9ICJjZ2kiOwo+Pj4+ICvCoMKg
wqDCoMKgwqDCoCAjY2xvY2stY2VsbHMgPSA8MD47Cj4+Pj4gK8KgwqDCoCB9Owo+Pj4gV2hhdCBh
Y3R1YWxseSBpcyB0aGlzIG9zY2lsbGF0b3I/Cj4+PiBJcyBpdCBwcm92aWRlZCBieSBhbm90aGVy
IGNsb2NrIGNvbnRyb2xsZXIgb24gdGhlIFNvQywgb3IgaXMgaXQgcHJvdmlkZWQKPj4+IGJ5IGFu
IG9zY2lsbGF0b3Igb24gdGhlIGJvYXJkPwo+PiBUaGlzIG9zY2lsbGF0b3IgaXMgYW4gaW5kaXZp
ZHVhbCBpYyBjaGlwIG91dHNpZGUgdGhlIFNvQyBvbiB0aGUgYm9hcmQsIHRoYXQncwo+PiB3aHkg
SSBsaXN0IGl0IG91dHNpZGUgc29jIG5vZGUuCj4+Cj4+IEFjdHVhbGx5IHRoZSAiY2dpIiBpcyBh
YmJyZXZhdGlvbiBmb3IgIkNsb2NrIEdlbmVyYXRpb24gSUMgY2hpcCIuCj4gU2luY2UgdGhlIG9z
Y2lsbGF0b3IgaXMgb3V0c2lkZSB0aGUgU29DLCB0aGlzIG5vZGUgKG9yIGF0IGxlYXN0IGl0cwo+
IGNsb2NrLWZyZXF1ZW5jeSBwcm9wZXJ0eSkgYmVsb25ncyBpbiB0aGUgYm9hcmQgZGV2aWNldHJl
ZSwgbm90IHRoZSBTb0MgLmR0c2kuCj4gU2VlIFsxXS4KPgo+IFJlZ2FyZHMsCj4gU2FtdWVsCj4K
PiBbMV06Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvYjU0MDEwNTItZTgw
My05Nzg4LTY0ZDYtODJiMjczNzUzM2NlQGxpbmFyby5vcmcvCgpUaGFuayB5b3UgU2FtdWVsLCBJ
IGhhdmUgbGVhcm5lZCB0aGlzIGFuZCB3aWxsIGNvcnJlY3QgdGhpcyBpbiBuZXh0IApyZXZpc2lv
bi4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
