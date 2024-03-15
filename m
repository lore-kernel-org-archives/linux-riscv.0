Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DF46C54E66
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Mar 2024 05:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ty6QGm9y7R6bLG/Jeci1LNIIZMPlEmJikbdEyk0jkqk=; b=aMgHJWvU90Zz9a
	fJ6wZDfYlZcgEDSvG9Tb3P3IL2ZFlWSDNnMblmUvS2u+bDOQ22/8d4Hx8/89hXTvgzNVEkgClNQ1I
	EGeyt4fsB4w2r0jrxxgNFCLqgOIBEPUflIDeSsj3Nr406UzQQXrBE9/vi+JZ1rDLcz0rUcng/qaiG
	hpivarYUKIMKPr45TXUrioye/K3LBOBM8B1fUaTAFTWWsb6HQjLQY9oEJwn4vn1aqoUXoWF/aW3ew
	N14i+ehpDGvqKV683MpQ/z2bYbaBzI6ZtyAbYEBCvJkjJbkdBixRfXyR/yL7cUhGK7O++oHdMdsE5
	cH9/s0ccyjLQjiBTTomA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl038-0000000Gj2H-0mCk;
	Fri, 15 Mar 2024 05:24:10 +0000
Received: from mail-dm6nam11olkn20801.outbound.protection.outlook.com ([2a01:111:f403:2c15::801] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl033-0000000Gj0H-3fgd;
	Fri, 15 Mar 2024 05:24:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EwD6I63RU5XziMKq+h0L2Y2/R7TxgFbH+V3fJDxPwVfOP7Jk/Rei7uLCCLdnWpNH70Z0OfgJSbRDMSOh4DrvTR/TodRvBVmWfnq9vsXqVwAX53ol7cuq61EXkvyOYjXHtXMoZrHn/LXq9aKpfcX8//2YGdqmP60t2gRsXWBrMsovBw/N3gXOC+bpAf4zsBwVu3UumYzqSPmMK725xbkkpWEiKArKjA8sr2o5j9qTYSwncsdpgLc11XWyZ764EMwj3VEnNcy/P05iyyfMoVWAvz5G7/+EQWb9UP3QOxuaLYZHl49dsHYYlXdrJdTPJojCCIo30N4TSQs10uXHo6VCDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HSmghy40RwD+jsVCUi21yn7xFThOULYBU9kYUAVYmfE=;
 b=iqSoxG5qs5870tvUIUv8IinbgWpqWrdSqZInQ3wqsmhKSqKNOCImIIcOi0BFoxYPCgzp1X196gWiS83aAK1KczD863HxhsfJKgyQb0dt52KnfP/8lgDkZ0MT2CYqJFjAvgNOcDwmKI9h6oiX1Xs993cZY/43mapnSovqVbJwQAf7t2NpRZFZ709mxgOaA+Mxbw39rGh2tT6ImV+9clnNWr9vBSDXWYxRCMYyA9aC+GbizvQkNKXBvvSyQQElKMUFeU0P6v9jC7kpiexXsC4LIVjm6ceDTHFE3GAutn+gbksEmYMD2lY4NfuHNaOnT8m5qZmIoFaBLmEiNaYny54I9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HSmghy40RwD+jsVCUi21yn7xFThOULYBU9kYUAVYmfE=;
 b=r2qDQy7UThvu083s6wShahyTM17f8CM5kWJnTtMZak5DKf3SdiZ7IQlcInWdxLhpPjoZmc3keFbKOo0UTXcL7xYsiVZ38pF5gXj0sD1dUVk+QlYcJQWA9E/f6U8ETaa96Sq/33MQn9DK0T1KmfqiKTa0hlii7+dtgS/gIM678lItlSazFMSXdRY8oVJ1TrBOlmGXSHGPwAk/kn32i57AJvJOZRVac2gYs2SZ1u0FqpwMtwedNY54RJ67GK841e6GDVMK6gEnt4RR8X/5jr/uszLKDy1Ii6TSzD0HzDvdqdbXX1w1SyAX8Wq1O12GiLOPki61E1xa/rgXnuyAxpRSfg==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by IA1PR20MB5051.namprd20.prod.outlook.com (2603:10b6:208:3a5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.19; Fri, 15 Mar
 2024 05:24:01 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::8615:efe2:7c8e:2041]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::8615:efe2:7c8e:2041%3]) with mapi id 15.20.7386.021; Fri, 15 Mar 2024
 05:24:01 +0000
Date: Fri, 15 Mar 2024 13:23:58 +0800
From: Inochi Amaoto <inochiama@outlook.com>
To: Conor Dooley <conor@kernel.org>, Inochi Amaoto <inochiama@outlook.com>
Cc: Qingfang Deng <dqfext@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atishp@atishpatra.org>, 
	Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Heiko Stuebner <heiko@sntech.de>, Guo Ren <guoren@kernel.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] perf: RISC-V: fix IRQ detection on T-Head C908
Message-ID: <IA1PR20MB4953E86537D28A85CDBBCCD3BB282@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <20240311063018.1886757-1-dqfext@gmail.com>
 <IA1PR20MB4953ECC3E32E95303872CD14BB242@IA1PR20MB4953.namprd20.prod.outlook.com>
 <CALW65jZ+q8sDiRKgsRL9n+939HNUCnkKuO=YJjHB5Js=WYQeOg@mail.gmail.com>
 <20240312-evil-resource-66370b68b9b4@spud>
 <IA1PR20MB4953CE8999960BA71B46DE6CBB2A2@IA1PR20MB4953.namprd20.prod.outlook.com>
 <20240314-pep-announcer-2d7f10ff8b65@spud>
Content-Disposition: inline
In-Reply-To: <20240314-pep-announcer-2d7f10ff8b65@spud>
X-TMN: [oANGyXNYNYS7fOWJuVtylvEeYErvB+MiX7nycat9orU=]
X-ClientProxiedBy: TYWPR01CA0012.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::17) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <qlqld4qdji4k7aunxbpbv2mc5p4agugrzv2ry5ptefobowzetx@iocokpomijz4>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|IA1PR20MB5051:EE_
X-MS-Office365-Filtering-Correlation-Id: 957d24a9-ce3c-4c95-2cd0-08dc44b01f16
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MLmNGuIFd+7BRSuh6xOKvt/M8O76gJmN1iUUIRMqVcq4KMZJxm5nn5+G4dW6zD14uQBQGtJgRHNndU4RCybjEorm78BDZ8wZxEwLg4WuqGWHtth47uuE3rkgF+YHGOgu8KEIPHVSCZw+xU3SOpJy73Y5vnjybLsAyTl6v3X03JvZcoqS3lYprZDaBWeWmyyH6XTN0kQ0QeiE/JLtklq+g01SkJGzcCiiHl88lV6Kpkl5MpXBxkTE/5svX2DGRdS7S3ay7UZjep1WFldHqsShnUtP6uul4sXLk7kRsLbfbDy2Vx6IcepRCCqxC/mkij1jqOzTt3l/JxdRbOWXIJEwWZK8mQEv6IRoRGeSGEvIaOc3RYug8WN0nSlXta52U0gRhC1yxOkjI7rnaaanT5Kh2w0Xe976k15x46UdnkpoJ8C31ayFyZwR+CIgOdZSAUtMXjTcwxmu2lmq7z0bfqxOEog8Xnz4jn6W5y3DXdvNKs4dLHLs81XTlMDULP/OzGSwUq+9Va0nlbqgfm82qJIp8n+Nm47RYy+89uQofutxNZo+JhJz7rB+T9tsNSTr9ZcvMCdCv7pMcrwXid1p8HqSrezcvQbPfR8a4XS5LIod0aNI+i06j5mwpnxiFK/GPgTpuvVN+12qs4kVn9OjqhEVGDy7pnxDdyFAzEUXa73//7+mMBrOIV22U4RkAwuQwLmj
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UzJtWm9jZ1I1MEhuREZZakdSbU1idUJXSFJjcjR4aEd2aktubjgzdW50UDln?=
 =?utf-8?B?Z0ZTOW5vTEtFNFJHdzgySnBEdUtOeFlFeW5oaEd1VUI1WnJ6ZUFrMVcvMDls?=
 =?utf-8?B?OHlCMnNTTDZkbGRBbzNHOHEvSEV0MDBMR2MyMlFGa3VrcDNCVlA5blVWRnBL?=
 =?utf-8?B?VUk3WnlXVW9DM2htaWlRdENsNytwM2cxZktrMm9IaTBwZjdqbytoTUdjK3JG?=
 =?utf-8?B?bEZFYWNQL0VvSElmOURITkJmd2FPck9rZWwwL0JzY0N1cloyYzJlUTU4YnpB?=
 =?utf-8?B?R09qRzYvcVBMOE51TmwzREdueWllMktxMmNkeHE5aXRCSllNV25FeGVpTkRT?=
 =?utf-8?B?OXp4M1hueWNkY3k4TUp5b25lZGduYUpQQUEvZElnU0R4V2lCdmJmUThkUnpq?=
 =?utf-8?B?L05rQ0lUTWIza05ERzhvSlhtcWludEFPY0xjTFhzQUZjZS8wcnhEY0Jsci8r?=
 =?utf-8?B?OWF1RENtZmc5cm15eFE0M1FBclR4R1ZZTXlBSXhpWkllMmhDZmN0eGVZaEha?=
 =?utf-8?B?NmFQVk9zZEN3dWlTcHJYSlh4amx4T0hMWnkrVzZtYUt4UzBXeHJtcWFPZGZo?=
 =?utf-8?B?amlyUldmVEFJdHJvVXJTRzlqb1NjZVNXK3FVQmtGbitucW1xdFpsWlRDenM2?=
 =?utf-8?B?Sk5vZnJaSkNyOWIvd2VONUpjN1RrdHhNZ1V1cy9yR2RqTEFYUFJwVUpvUStl?=
 =?utf-8?B?bjdUZjY5eXNQYUhWUmpUWDBQbm5LSmI0Z00wRU0xZUN3NWw1ZnJWMk04NHF6?=
 =?utf-8?B?Q1ZqclJsbnlEM1J0MHp4bmo5Zm5XdmNjSU53OXhkMkpCWWFhSk9EL20rNFNr?=
 =?utf-8?B?Z1RrWFp5S3VFMDgwdzNHSTd4dlN5U3lSVTJkSjVEYjNXaVJ0Mkx6ZzZqNjJr?=
 =?utf-8?B?ZDVYMi9QZ29zVHd5TVloTWpLVE91V3c2RmJ4ZmhTeWFBRGpxSnRIU3dqWWJL?=
 =?utf-8?B?RGZXR3d1WHdzSUV4RlpwV1RPSlEyajFab01PMkhVMU16eWczbi9KWEZrN21y?=
 =?utf-8?B?TG5iMC9vbER4V2Yya3FEUTBpNmNvVldUZ2o2ejVQTjBpWUsxSGk5MjJERGZ0?=
 =?utf-8?B?LzFsdTd6bytqbG90NVFQM3BSMnNScU5XZjUzUnpENWg2Z1dZQjl6WmtiWC9D?=
 =?utf-8?B?OTdkZk1qMklyajFmYXI5WVhnV29oTjc3UDdLNTZ1MHRaM2lRU29Oa1NPbXJV?=
 =?utf-8?B?VXhWNjhJeE9ieXhaMkh0bWRpSUhjZjNNTFJxNmd2M09lNFdqTHUyZFZUTTFm?=
 =?utf-8?B?NFNVS29GeUJPWWRhREpCazB3N0FtZ21vWDlFMTMzNS9NVDZqVXczbEkvM0Zl?=
 =?utf-8?B?WkpwdTIvNUNDcGV2ejh1aFdjbUQ2Tk9tSVdacitxYjlvUmRpbHpwOGxmZTEy?=
 =?utf-8?B?cm1JVjUzMitQelNFWTV0Z05CUWdjdHNXMlhSNUx4NS85TVJkRnR4b3RSd3lO?=
 =?utf-8?B?N2gyTzdIdjBRSlZkTGJLZXFqZmFuOG8wYUdldDlORURvdElTV1lJSDR0a1FP?=
 =?utf-8?B?cFZVQzdjLzBTWi9GV0tjQTBIcGJwcVRKSEpWbjBIRkpXdUFXaCsrZ1BJdFZi?=
 =?utf-8?B?bUF4K2hBNE16NFNzZjZXOG1zUWU4Q3BGMEtieUFpclh4bjRmMjBSSlZ3WDFi?=
 =?utf-8?B?bUhYNmJIdUhONEVMSHplVyttRnlsWVI2UEN4OWkvOTMwaXUxQzhodkN4ejlL?=
 =?utf-8?Q?//xqOeXenPbaB1eqtesT?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 957d24a9-ce3c-4c95-2cd0-08dc44b01f16
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2024 05:24:00.8138
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR20MB5051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_222406_030092_8DEE6C3E 
X-CRM114-Status: GOOD (  53.51  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBNYXIgMTQsIDIwMjQgYXQgMDg6NDE6MTVQTSArMDAwMCwgQ29ub3IgRG9vbGV5IHdy
b3RlOgo+IE9uIFdlZCwgTWFyIDEzLCAyMDI0IGF0IDA5OjMxOjI2QU0gKzA4MDAsIElub2NoaSBB
bWFvdG8gd3JvdGU6Cj4gPiBPbiBUdWUsIE1hciAxMiwgMjAyNCBhdCAwMjowNzozMVBNICswMDAw
LCBDb25vciBEb29sZXkgd3JvdGU6Cj4gPiA+IE9uIE1vbiwgTWFyIDExLCAyMDI0IGF0IDAzOjU2
OjI5UE0gKzA4MDAsIFFpbmdmYW5nIERlbmcgd3JvdGU6Cj4gPiA+ID4gSGkgSW5vY2hpLAo+ID4g
PiA+IAo+ID4gPiA+IE9uIE1vbiwgTWFyIDExLCAyMDI0IGF0IDM6MTPigK9QTSBJbm9jaGkgQW1h
b3RvIDxpbm9jaGlhbWFAb3V0bG9vay5jb20+IHdyb3RlOgo+ID4gPiA+ID4KPiA+ID4gPiA+IE9u
IE1vbiwgTWFyIDExLCAyMDI0IGF0IDAyOjMwOjE4UE0gKzA4MDAsIFFpbmdmYW5nIERlbmcgd3Jv
dGU6Cj4gPiA+ID4gPiA+IFQtSGVhZCBDOTA4IGhhcyB0aGUgc2FtZSBJUlEgbnVtIGFuZCBDU1Ig
YXMgcHJldmlvdXMgQzl4eCBjb3JlcywgYnV0Cj4gPiA+ID4gPiA+IHJlcG9ydHMgbm9uLXplcm8g
bWFyY2hpZCBhbmQgbWltcGlkLiBSZW1vdmUgdGhlIElEIGNoZWNrcy4KPiA+ID4gPiA+ID4KPiA+
ID4gPiA+Cj4gPiA+ID4gPiBIaSwgUWluZ2ZhbmcsCj4gPiA+ID4gPgo+ID4gPiA+ID4gSUlSQywg
dGhlIGV4aXN0ZWQgQzkwOCBTb0MgKHN1Y2ggYXMgSzIzMCkgaGF2ZSBhbiBlYXJseSB2ZXJzaW9u
Cj4gPiA+ID4gPiBvZiBDOTA4IGNvcmUuIEJ1dCBDOTA4IGNvcmUgaXRzZWxmIG1heSBzdXBwb3J0
IFNzY29mcG1mLgo+ID4gPiA+ID4gU28gSSBkbyBub3QgdGhpbmsgcmVtb3ZpbmcgdGhlIElEIGNo
ZWNrcyBpcyBhIGdvb2QgaWRlYS4gSW5zdGVhZCwKPiA+ID4gPiA+IEkgc3VnZ2VzdCBhZGRpbmcg
Q1BVSUQgb2YgeW91ciBTb0MgdG8gdGhpcyBjaGVjay4KPiA+ID4gPiAKPiA+ID4gPiBBcyBvZiBG
ZWIgMjAyNCwgdGhlIGxhdGVzdCBDOTA4IHJldmlzaW9uIGRvZXMgbm90IHN1cHBvcnQgU3Njb2Zw
bWYuCj4gPiA+ID4gWW91IG1heSBHb29nbGUgIkM5MDhSMVMwIiB0byBzZWUgaXRzIHVzZXIgbWFu
dWFsLgo+ID4gPiA+IEJ1dCBJIHRoaW5rIHlvdSdyZSByaWdodC4gRXZlbiB0aG91Z2ggQzkwOCBk
b2VzIG5vdCBoYXZlIFNzY29mcG1mLAo+ID4gPiA+IFQtSGVhZCBtYXkgcmVsZWFzZSBuZXcgU29D
cyB3aGljaCBkbyBoYXZlIFNzY29mcG1mLCBhbmQgdGhlIGNoZWNrIHdpbGwKPiA+ID4gPiBicmVh
ay4gSSB3aWxsIHN1Ym1pdCBhIG5ldyBwYXRjaCB3aXRoIHlvdXIgc3VnZ2VzdGVkIGNoYW5nZXMu
Cj4gPiA+IAo+ID4gPiBJZiBvbiBhbiBTb0Mgd2hlcmUgdGhleSBoYXZlIHVwZGF0ZWQgdmVjdG9y
IHRvIDEuMCBhbmQgaW1wbGVtZW50ZWQgYm90aAo+ID4gPiBaaWNib20gYW5kIFN2cGJtdCBpbnN0
ZWFkIG9mIHRoZWlyIGN1c3RvbSBzdHVmZiB0aGV5IGRpZCBub3QgaW1wbGVtZW50Cj4gPiA+IFNz
Y29mcG1mIEkgdGhpbmsgd2UgY2FuIGV4cGVjdCB0aGV5IHdvbid0IG1vdmUgYXdheSBmcm9tIHRo
ZWlyIGN1c3RvbQo+ID4gPiBpbXBsZW1lbnRhdGlvbiBzb29uLgo+ID4gPiBJIGRvIGFncmVlIHRo
YXQgd2Ugc2hvdWxkIG5vdCByZW1vdmUgdGhlIElEIGNoZWNrcyBlbnRpcmVseSwgYnV0IEkgYWxz
bwo+ID4gPiBkbyBub3Qgd2FudCB0byBiZSBhZGRpbmcgYW4gSUQgZm9yIGV2ZXJ5IFNvQyB0aGF0
IG5lZWRzIHRoaXMuIEkgdGhpbmsgd2UKPiA+ID4gc2hvdWxkIGJlIGdldHRpbmcgdGhpcyBpbmZv
cm1hdGlvbiBmcm9tIERUIGdvaW5nIGZvcndhcmQuCj4gPiA+IFRoZSBEVCBwYXJzaW5nIGlzIGRv
bmUgcHJpb3IgdG8gdGhlIGFwcGxpY2F0aW9uIG9mIGJvb3QgdGltZQo+ID4gPiBhbHRlcm5hdGl2
ZXMsIHNvIEkgdGhpbmsgd2UgY291bGQgYXBwbHkgdGhlICJlcnJhdHVtIiBiYXNlZCBvbiB0aGUg
RFQuCj4gPiA+IAo+ID4gPiBJJ20gYWxzbyBwcmV0dHkgc3VyZSB0aGF0IHdlIGNhbiBhbHNvIG1v
ZGlmeSB0aGUgZXhpc3RpbmcgY29kZSBmb3IgdGhlCj4gPiA+IGFyY2hpZCA9PSBpbXBpZCA9PSAw
eDAgY2FzZSB0byBzZXQgYSBwc2V1ZG8gaXNhIGV4dGVuc2lvbiBzbyB0aGF0IHRoZQo+ID4gPiBw
ZXJmIGRyaXZlciBjb3VsZCBkbyBjYWxsIHJpc2N2X2lzYV9lZXh0ZW5zaW9uX2F2YWlsYWJsZSgp
IGFuZCBub3Qgd29ycnkKPiA+ID4gYWJvdXQgdGhlIHNwZWNmaWMgY29uZGl0aW9ucyBpbiB3aGlj
aCB0aGF0IGlzIHRydWUuIEl0J2QgYmUgc29tZXRoaW5nCj4gPiA+IGxpa2UgdGhpcyBwYXRjaDoK
PiA+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvMjAyNDAxMTAwNzM5MTcu
MjM5ODgyNi04LXBldGVybGluQGFuZGVzdGVjaC5jb20vCj4gPiA+IEp1c3Qgd2l0aG91dCByZW1v
dmluZyB0aGUgYXJjaGlkID09IGltcGlkID09IDB4MCBjYXNlIGZyb20gdGhlIGVycmF0YQo+ID4g
PiBjb2RlLiBJZiB5b3UncmUgbG9zdCBhZnRlciByZWFkaW5nIHRoYXQsIEkgY2FuIHByb2JhYmx5
IHRocm93IHRvZ2V0aGVyCj4gPiA+IHNvbWUgdW50ZXN0ZWQgY29kZSBmb3IgaXQuCj4gPiAKPiA+
IEkgYWdyZWUgdG8gdXNlIHNvbWV0aGluZyB0byByZXBsYWNlIHRoZSBleGlzdGluZyBjaGVjaywg
YnV0IHVzaW5nIGEgcHNldWRvCj4gPiBpc2EgZXh0ZW5zaW9uIGlzIG5vdCBhIGdvb2QgaWRlYS4g
VGhlcmUgYXJlIHR3byByZWFzb25zOiAKPiA+IAo+ID4gMS4gUHNldWRvIGlzYSBpcyBtaXNsZWFk
aW5nLiBBcyBpdCBpcyBub3QgdGhlIHJlYWwgaXNhLCBzZXR0aW5nIHRoaXMgaW4gaXNhCj4gPiBs
aXN0IG1heSBtYWtlIHVzZXJzcGFjZSB0aGluayBlcnJhdGEgYSBmZWF0aGVyLgo+IAo+IElmIHdl
IHdhbnRlZCB0byBzdXBwcmVzcyBzaGFyaW5nIHRoaXMgaW5mb3JtYXRpb24gdG8gdXNlcnNwYWNl
IHdlIGNvdWxkLAo+IGJ1dCBJIGRvbid0IGV2ZW4gc2VlIHdoYXQgdGhlIGhhcm0gaXMgaW4gdXNl
cnNwYWNlIGtub3dpbmcuCj4gSSBhbHNvIGRpc2FncmVlIHdpdGggdGhpcyBldmVuIHJlYWxseSBi
ZWluZyBhbiBlcnJhdHVtIGluIHRoZSBmaXJzdCBwbGFjZQo+IGFzIHRoZXkgaW1wbGVtZW50ZWQg
c29tZXRoaW5nIGJlZm9yZSBhIHNwZWMgd2FzIGNyZWF0ZWQuIEl0J3Mgbm90IGFuCj4gaW1wbGVt
ZW50YXRpb24gb2YgU3Njb2ZwbWYgd2l0aCBhIGJ1Zy4gSSBkb24ndCB0aGluayB0aGF0IGNhbGxp
bmcgaXQgYQo+ICJyZWFsIiB2ZW5kb3IgZXh0ZW5zaW9uIGlzIHByb2JsZW1hdGljIGVpdGhlciwg
anVzdCBJIGFtIHRoZSBvbmUgY2FsbGluZwo+IGl0IHRoYXQsIG5vdCBULUhlYWQgdGhlbXNlbHZl
cy4KPiAKCkkgYWdyZWUgd2l0aCB0aGF0IG5vdCBpbXBsZW1lbnQgc3RhbmRhcmQgZXh0ZW5zaW9u
IGlzIG5vdCBhIGJ1Zy4gCkFuZCBpdCBpcyBuZWNlc3NhcnkgdG8gbGV0IHVzZXJzcGFjZSBrbm93
IGlmIHRoZSBjb3JlIGhhdmUgYmVoYXZpb3IgCnRoYXQgaXMgZGlmZmVyZW50IGZyb20gdGhlIHN0
YW5kYXJkLiBJbiBmYWN0LCBJIHRoaW5rIGl0IG1heSBuZWVkIAphIGRpZmZlcmVudCBuYW1lIHRv
IGRlc2NyaWJlIHRoaXMgZGlmZmVyZW5jZSwgImVycmF0YSIgaXMga2luZCBvZiAKdW5zdWl0YWJs
ZS4KCj4gPiAyLiBVc2luZyBwc2V1ZG8gaXNhIGlzIG1vcmUgbGlrZSBhbiBhYnVzZSBvZiByZXNl
cnZlZCBpc2EgYml0cywgd2hpY2ggbWVhbnMKPiA+IGtlcm5lbCBtYXkgbmVlZCBpbmZpbml0ZSBi
aXRzIHRvIGhhbmRsZSB0aGUgZXJyYXRhLgo+IAo+IFdoYXQgbWFrZXMgaXQgYW4gYWJ1c2Ugb2Yg
YSAicmVzZXJ2ZWQiIGJpdD8gVGhlcmUncyBubyBydWxlIG9uCj4gZGlzYWxsb3dpbmcgc29tZXRo
aW5nIHZlbmRvci1zcGVjaWZpYyB0aGVyZS4gR2l2ZW4gdGhlIGFtb3VudCBvZiBzdGFuZGFyZAo+
IElTQSBleHRlbnNpb25zIHRoYXQgYXJlIGJlaW5nIGNyZWF0ZWQgY29tcGFyZWQgdG8gQ1BVIGVy
cmF0YSwgSSBkb24ndAo+IHRoaW5rIHRoYXQgSSdtIHBhcnRpY3VsYXJseSB3b3JyaWVkIGFib3V0
IHZlbmRvciBzcGVjaWZpYyBzdHVmZiBiZWluZwo+IHRoZSByZWFzb24gZm9yIGluZmluaXRlIGJp
dHMgYmVpbmcgbmVlZGVkIGVpdGhlci4KCkFzIHRoZSBjcHVzIGV2b2x2ZSwgaXQgbWF5IGhhdmUg
c28gbWFueSBkaWZmZXJlbnQgYnVnLiBUaGlzIGlzIHdoeSBJIHNheQppdCBtYXkgbmVlZCBpbmZp
bml0ZSBiaXRzLiBJbiBmYWN0LCBpdCBpcyBqdXN0IGEgZXh0cmVtZSBjYXNlLgoKPiAKPiBJZiB0
aGVyZSBkbyBjb21lIHRvIGJlIGlzc3VlcyB3aXRoIHRoZSBudW1iZXIgb2YgZXh0ZW5zaW9ucyB3
ZSBjYXJlCj4gYWJvdXQsIHdlIGNvdWxkIHNwbGl0IHRoaW5ncyBwZXIgdmVuZG9yIEkgc3VwcG9z
ZS4KPiAKCkluc3RlYWQgb2YgcmV1c2luZywgaXQgbWF5IGJlIGJldHRlciB0byBzdG9yZSB0aGVt
IHNlcGFyYXRlbHkuIEJ1dCBpZgp3ZSBzdG9yZSB0aGVtIHNlcGFyYXRlbHksIHdoeSBub3QgdG8g
dXNlIGEgZGlmZmVyZW50IERUIHByb3BlcnR5IHRvIApkZXNjcmliZSB0aGVtPyBUaGlzIGlzIHdo
YXQgSSB3YW50IHRvIHNheS4KCj4gPiBJTUhPLCBpdCBtYXkgYmUgYmV0dGVyIHRvIHVzZSBhIG5l
dyBEVCBwcm9wZXJ0eSBsaWtlICJyaXNjdixjcHUtZXJyYXRhIiBvcgo+ID4gIjx2ZW5kb3I+LGNw
dS1lcnJhdGEiLiBJdCBjYW4gYWNoaWV2ZSBhbG1vc3QgZXZlcnl0aGluZyBsaWtlIHVzaW5nIHBz
ZXVkbwo+ID4gaXNhLiBBbmQgdGhlIG9ubHkgY29zdCBJIHRoaW5rIGlzIGEgc21hbGwgYW1vdW50
IGNvZGUgdG8gcGFyc2UgdGhpcy4KPiAKPiBJIHN1cHBvc2Ugd2UgY291bGQgZG8gdGhhdCwgYnV0
IGFjY291bnRpbmcgZm9yIHZlbmRvciBzcGVjaWZpY3Mgd2FzIG9uZQo+IG9mIHRoZSBnb2FscyBm
b3IgdGhlIHByb3BlcnR5IEkgb25seSBqdXN0IGFkZGVkIGFuZCB0aGF0IEkgYW0gc3VnZ2VzdGlu
Zwo+IHRvIHVzZSBoZXJlLgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
