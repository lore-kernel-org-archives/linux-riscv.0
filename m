Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42563C4332F
	for <linux-riscv@archiver.kernel.org>; Sun,  5 Nov 2023 20:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=30JNU0eFmw2THWj3gedLNDsX0mh9mK5viZiTWVEU90k=; b=p8ggb6drBC3pUJ
	DE0ky8vW6w16WHv+vo073Je1tLqI7sRk4DRSlBH0wLg83W9ZjvNWswbeDt825g/yVKt12nbitYKdK
	+RWlmdzy4OejV6/PvB9ilzqBaFOHP1TPY2udwbBg0264ylnWOp/SL/RbxnNIf8irf12yLpFwdw0Rh
	u60rYa+2lJOFHvFoX0W9vcj2kt/OEdh6DIre755yRNnaBoBCax8tq3f+dpKc7LzeRzJZIn/QOaiWh
	KjT5AWIClTXsybOERoQrLH12bdHd9LDuaxFnvIXCoDhg57KAUGb/x3N329fLcI9GPi8AAn1FbH+2R
	+68JqgGFp4yau8tKvjgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qzkCD-00FWFA-0Q;
	Sun, 05 Nov 2023 20:58:13 +0000
Received: from mail-bn1nam02olkn2081e.outbound.protection.outlook.com ([2a01:111:f400:7eb2::81e] helo=NAM02-BN1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qzkC9-00FWDi-0s
	for linux-riscv@lists.infradead.org;
	Sun, 05 Nov 2023 20:58:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FjLb/GIFOMvJdEUc60+qGetnMz3gWAraIBdbxtdyIyag+3OcrNTsoY6dMa7OccvM+mzMEST5EntYCrU5pBrP9u1ne6fmr05EIGYzHWQg9vG4ThDsBp1Yw3y9PtPYRzb7Iqtr4ao32t76UwqmAnJai1WnVcIoiRC3PwJL14FIrNdY6jvbMxc050mekf7nWQsViTCFqOYEaY52I2hcPPRJZEc2ayYsJoEGX5fD7+JdPm3GIsKF6jEoX71KDG4EsmJy3JnbLlw0KYZoVe6omDSM+ZzoWycyOm5PPV3w/5JROew3wa/STAYItqK1KjamupmbH58zXSeQBtPeA9gG1IKeHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1KYVQB2VfyPF40H62lUjWWyS3mvhU50Fftcie/KgfEQ=;
 b=kcvFnyyoMjE3g420uTqod6x6snI2ASBZttCO9uGKeEM1OXw5XoJyhzdJBskKYeD2rKVqv3XPRkK42Oo8ComAWexvUm95kM+Vc7+8LOT5MoPkHOMXuwNPs7te3bQ4xycpuhT2OnxtpjZ6TolSRG7hs/Q1TGm0mfJ/okBteyrEIklFgQ2kMuolQkX54q8pV281/ssDOzvi4hh//93D8K8ASQvP7h0RiLM+vNbVgUSDBFXF8IoW+d5/T+iYOKagN7fskMQxLf/3GxxtoVcbnbTODf+k9njDTYS9RR6foa1s6VYY93DEJHEQXIJd7bhn0oG+Ae5Sg0YxQwNxPp57qPet3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from DS7PR12MB5765.namprd12.prod.outlook.com (2603:10b6:8:74::19) by
 DS0PR12MB8573.namprd12.prod.outlook.com (2603:10b6:8:162::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6954.27; Sun, 5 Nov 2023 20:57:57 +0000
Received: from DS7PR12MB5765.namprd12.prod.outlook.com
 ([fe80::2493:49ba:b06b:fa80]) by DS7PR12MB5765.namprd12.prod.outlook.com
 ([fe80::2493:49ba:b06b:fa80%6]) with mapi id 15.20.6954.021; Sun, 5 Nov 2023
 20:57:57 +0000
X-Gm-Message-State: AOJu0YyHtfRfcy4FSHevZIneudPI/5K15NTwYn9qdXQ87iDRDRGSGbSg
	DFcBKXWPCDregAzCyc9F+05ZRTL+/yXpNLUHqns=
X-Google-Smtp-Source: AGHT+IEzuxrMuN8YgXkTOVWv8T59R4NMUqD/WDSbk9yk+8F1zvYAsdxF10Q0NBk24bXWK+X8NxyQDvPs3MM6AJVAJ4k=
X-Received: by 2002:a1f:da81:0:b0:4ac:2561:db3a with SMTP id
 r123-20020a1fda81000000b004ac2561db3amr2472746vkg.3.1699217427243; Sun, 05
 Nov 2023 12:50:27 -0800 (PST)
References: <cover.1699025537.git.tanyuan@tinylab.org> <7807078d4612beaa3f450df9f3f3cf70b2bccb4a.1699025537.git.tanyuan@tinylab.org>
In-Reply-To: <7807078d4612beaa3f450df9f3f3cf70b2bccb4a.1699025537.git.tanyuan@tinylab.org>
From: Fangrui Song <i@maskray.me>
Date: Sun, 5 Nov 2023 12:50:16 -0800
X-Gmail-Original-Message-ID: <CAN30aBF8NjwcMqPxWtzk9oJufY4SiqKFqAJNpNifJxGywTeD5g@mail.gmail.com>
Message-ID: <DS7PR12MB576577A041D370B99DCE0B78CBABA@DS7PR12MB5765.namprd12.prod.outlook.com>
Subject: Re: [PATCH v1 09/14] DCE/DSE: inhibit .size directive for SHF_GROUP
To: Yuan Tan <tanyuan@tinylab.org>
Cc: falcon@tinylab.org, arnd@arndb.de, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org, 
	luc.vanoostenryck@gmail.com, linux-sparse@vger.kernel.org, 
	linux@weissschuh.net, palmer@rivosinc.com, paul.walmsley@sifive.com, 
	paulburton@kernel.org, paulmck@kernel.org, tim.bird@sony.com, 
	tsbogend@alpha.franken.de, w@1wt.eu
X-TMN: [/EiW44kEHhveMJM23ImsT2ptpUyqH9/C]
X-ClientProxiedBy: MN2PR01CA0024.prod.exchangelabs.com (2603:10b6:208:10c::37)
 To DS7PR12MB5765.namprd12.prod.outlook.com (2603:10b6:8:74::19)
X-Microsoft-Original-Message-ID: <CAN30aBF8NjwcMqPxWtzk9oJufY4SiqKFqAJNpNifJxGywTeD5g@mail.gmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB5765:EE_|DS0PR12MB8573:EE_
X-MS-Office365-Filtering-Correlation-Id: ba017e96-f8f2-45bc-377c-08dbde41e3a6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bEdA2YQP+wq50jb9pLbxevWKrXVxaWQbmTRJPSVD9Ehp9EkYsBcHNLoUt43cIyiKGFIo6MkdJdOFZWSK4zlakZI8mBZX+FIwg6YOpP7qwkhNH2bNGsbmF7cPPU3viKD8Kc+o4GDL50DRwjuN/CT3ZRQOfuBeXb6Sii5Nuy/GeoCfmSrtOZuK/1Wi2QjN0UdCB79Hu2nDve/L46DTGLm1VfyApCSBiF2hQQWIP4BmA57FjVy63WGpf39RWrasALbvkR+oRX3SQdOmTl6QPmDo/bf/9KVYBsxPT+Wv6HcPWkq7FD2DXdebwqrPjLvpS3FyyRHyQzvEdLYkEckOdCwsF8AObPcMcz4evn/x9H/WglzFTzRXrxRBy8CaCY+t2CA+mwg9iUv7Kt0Ysj3wFx/icF0SvxvK5+VHKo/4kKvh5uocr5G990RHzGpd+Tig2ISeIZKtbwpEwz024OzHXykBj3W/2m4AAVbtU8e/R/IE79X9sBg4nE2WQsRNtQbCZ3KChqfF6eHcOTo5QH62qV7x24hKVUPOUH+LScEk84twlPCYe7lo5+CvBkZYc7sFSJ8gPvvsAvGPwE4u75Zw8zxzKVI7RP9q/t7oWbAJoDfFoSs=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dXNic0hTRGd1Z0dlSXV5MGllMUZDOEtObmthVEZSb3IraEVqYWlPZXBtUXBr?=
 =?utf-8?B?aFRvSU1sekJ2L2tneDBmY2w4QjlUekx0UUJSRG8vdjV4NEZnbVlDaWhBWHpG?=
 =?utf-8?B?TEdZdVpKaUprS2dkeTJFdk1FcnFVYml3MmlWckEzNmExTG1iWmhOKzlxOTkz?=
 =?utf-8?B?WTl4SmQ3VXd4Y0VZdTBpSmVlZDY0OXFGNy8zdGxNS1NSc2JqMFN3bGxRczdx?=
 =?utf-8?B?dHlhNHlpTWxReFp2MXJ6UTgvZVlhM1hkR1FPbm1BMERUaFJ0RW9oNFRTSWMw?=
 =?utf-8?B?TlAzTmNheHl3NEVrQk1JMldZNVIvTHp2Q1dYdC9hVkNsN0tDYUEzWEdYVTkx?=
 =?utf-8?B?ajRmYUpPM0Y4ZXpjM0RKRkVrWGRQL3pJWHBIQ0NHcnVEZEd5QUN4M0hPNUFh?=
 =?utf-8?B?YlFLOUhTS2dIcWQyUEpBZlpOTEZoK1habEtZNGlqMFc5ak5sMjlBd2ZTcXBP?=
 =?utf-8?B?bVV1eElLY3J3N2M3aGphK0k3Z3YzODJjcXA2Sk9XOFZqTkZnanlIVTlaL3dZ?=
 =?utf-8?B?a0Yzd003SEd2eVZmWlpqSUsxY2IzMUZUYVhvSUh2MUpLVmFnZUtNQU41Vm1M?=
 =?utf-8?B?VW54NVVCUGM0SUJzTy83ZHRpQXVMMDZNWXM3Y3grbURmZ0hSbE5vRmdmbXBy?=
 =?utf-8?B?WlBMMzZyd0ZrTXFvTDduY3NDelgrdkluT0dhNHZhb2hLMFU3ekpza1hkSFNm?=
 =?utf-8?B?QU1NNWc4MTYxVldDQkhSdGowWEd0OGZJdlZtSzhPWXdMakxVWExsNnNGTC9l?=
 =?utf-8?B?cmFUQ1VKYTRGWjQrU2JyRmwwbnVwSFM3S2w3UTJieHdYYjdHN2pqM21QM3Zz?=
 =?utf-8?B?dUxBS0lrUTBQSTNJVUJyV0pGWERaT1FtY1hmOGVTald4VkFnQmtmOU5LWWJp?=
 =?utf-8?B?a0c0bUk3bm5FdlhMWDRJN083VjRqQllyRDU1WTdLMHRxVytIdGM2OWQ1RzBR?=
 =?utf-8?B?eTZZZEZtN1RmRjBIUTAvQzRCQmx5MzlLVHJ0VjJLS0lGbVRIMVFGY1lrVUZR?=
 =?utf-8?B?a2o3RkRqZmNnRjRuWWovNitOZERDQW1pcHZRUkROQ3F1Snpjdyswek1uWXVX?=
 =?utf-8?B?TEZlWHVqd081SFVIbFQ1V1h0NTV0Ty9oNjF1ZXBRZmJoNDRBWVgrREdCb29X?=
 =?utf-8?B?Nm80Vi9sWktzMStCbExQUGNuWjdCV1RxWi9hTmt3RTA5NkgxMUY2V2ZGN2xl?=
 =?utf-8?B?K2J6T05kTXZZWXU4eGt5dG9IMHpTcGxpOU1aUzY3ZjArT2hyZkN0bzVrYUdn?=
 =?utf-8?B?ZlpLUk81NTM0Qi8vQWhXTTk4RzRjcTNyc2NSSnA4SzBSa2xia2ZvNXRnaW5z?=
 =?utf-8?B?NjhzRzlyUkt6Zkk5TWd6bmh6LzMzUUJaYzlLb2djUEhvZlZLZTl3WEJXeHdx?=
 =?utf-8?B?eW11djB5YVU2OGpERWdqRTNRbkhHdmY5aWpJYUFIM2dMTzlNN3VCQWpoZ3pw?=
 =?utf-8?B?QjVwK0hXS0hKczZqRHltaUh3b1l0NEFkTVR4WXp4aVFiSlZrRHZjV1htNXFm?=
 =?utf-8?B?MTdPYXhOWUhUbzdUNUsxbTVHWTZEWW01Y0tFZFhEd05uUWNOZzlzUlhmSlV6?=
 =?utf-8?Q?j0AYKvsTYpZdokUByJKpWqqydOV3+dUgQrOS12nzQfY9Oy?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-5183d.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: ba017e96-f8f2-45bc-377c-08dbde41e3a6
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB5765.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2023 20:57:57.9019
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8573
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231105_125809_307210_BB0D25DF 
X-CRM114-Status: GOOD (  13.16  )
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

T24gRnJpLCBOb3YgMywgMjAyMyBhdCA5OjAx4oCvQU0gWXVhbiBUYW4gPHRhbnl1YW5AdGlueWxh
Yi5vcmc+IHdyb3RlOgo+Cj4gLnNpemUgZGlyZWN0aXZlIGZhaWxzIGluIHNvbWUgZnVuY3Rpb25z
IHdpdGggU0hGX0dST1VQLCB0aGlzIGlzIG5vdAo+IHJlYWxseSByZXF1aXJlZCBmb3Igbm9ybWFs
IGJ1aWxkaW5nLCBpbmhpYml0IGl0IHRvIHNpbGVuY2UgdGhlIGNvbXBpbGluZwo+IGZhaWx1cmVz
IHdpdGggU0hGX0dST1VQLgo+Cj4gU2lnbmVkLW9mZi1ieTogWXVhbiBUYW4gPHRhbnl1YW5AdGlu
eWxhYi5vcmc+Cj4gU2lnbmVkLW9mZi1ieTogWmhhbmdqaW4gV3UgPGZhbGNvbkB0aW55bGFiLm9y
Zz4KPiAtLS0KPiAgTWFrZWZpbGUgfCAzICsrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRp
b25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvTWFrZWZpbGUgYi9NYWtlZmlsZQo+IGluZGV4IGE0ZTUy
MmI3NDdjYi4uZjY3YjZlOGQyYzQ1IDEwMDY0NAo+IC0tLSBhL01ha2VmaWxlCj4gKysrIGIvTWFr
ZWZpbGUKPiBAQCAtOTM2LDYgKzkzNiw5IEBAIGVuZGlmCj4gICMgYHJ1c3RjYCdzIGAtWmZ1bmN0
aW9uLXNlY3Rpb25zYCBhcHBsaWVzIHRvIGRhdGEgdG9vIChhcyBvZiAxLjU5LjApLgo+ICBpZmRl
ZiBDT05GSUdfTERfREVBRF9DT0RFX0RBVEFfRUxJTUlOQVRJT04KPiAgS0JVSUxEX0NGTEFHU19L
RVJORUwgKz0gLWZmdW5jdGlvbi1zZWN0aW9ucyAtZmRhdGEtc2VjdGlvbnMKPiAraWZkZWYgQ09O
RklHX1NFQ1RJT05fU0hGX0dST1VQX1NVUFBPUlQKPiArS0JVSUxEX0NGTEFHU19LRVJORUwgKz0g
LWZpbmhpYml0LXNpemUtZGlyZWN0aXZlCj4gK2VuZGlmCj4gIEtCVUlMRF9SVVNURkxBR1NfS0VS
TkVMICs9IC1aZnVuY3Rpb24tc2VjdGlvbnM9eQo+ICBMREZMQUdTX3ZtbGludXggKz0gLS1nYy1z
ZWN0aW9ucwo+ICBpZmRlZiBDT05GSUdfTERfREVBRF9DT0RFX0RBVEFfRUxJTUlOQVRJT05fREVC
VUcKPiAtLQo+IDIuMzQuMQo+CgpDbGFuZyBkb2Vzbid0IHN1cHBvcnQgLWZpbmhpYml0LXNpemUt
ZGlyZWN0aXZlLCBzbyB0aGlzIHdvdWxkIGJyZWFrCkNsYW5nIGJ1aWxkcy4KCkdDQyBoYXMgaGFk
IHRoaXMgb3B0aW9uIHNpbmNlIDE5OTIsIGJ1dCBpdCBpcyBub3QgdXNlZCBpbiB0aGUgd2lsZC4K
aHR0cHM6Ly9nY2MuZ251Lm9yZy9vbmxpbmVkb2NzL2djYy9Db2RlLUdlbi1PcHRpb25zLmh0bWwj
aW5kZXgtZmluaGliaXQtc2l6ZS1kaXJlY3RpdmUKc2F5cwoKPiAuLi4gVGhpcyBvcHRpb24gaXMg
dXNlZCB3aGVuIGNvbXBpbGluZyBjcnRzdHVmZi5jOyB5b3Ugc2hvdWxkIG5vdCBuZWVkIHRvIHVz
ZSBpdCBmb3IgYW55dGhpbmcgZWxzZS4KCldoYXQgcHJvYmxlbSBoYXZlIHlvdSBzZWVuIHdpdGgg
LnNpemUgZGlyZWN0aXZlcyAoc3Rfc2l6ZSBmaWVsZCBpbgpzeW1ib2wgdGFibGUgZW50cmllcyk/
CgolIGNhdCBhLmMKaW50IHY7CnZvaWQgZigpIHt9CiUgZGlmZiAtdTAgPChnY2MgLVMgYS5jIC1v
IC0pIDwoZ2NjIC1TIC1maW5oaWJpdC1zaXplLWRpcmVjdGl2ZSBhLmMgLW8gLSkKLS0tIC9wcm9j
L3NlbGYvZmQvMTEgICAgMjAyMy0xMS0wNSAxMjo0Mjo1MS4yOTg2MTg0NzUgLTA4MDAKKysrIC9w
cm9jL3NlbGYvZmQvMTUgICAgMjAyMy0xMS0wNSAxMjo0Mjo1MS4yOTg2MTg0NzUgLTA4MDAKQEAg
LTcgKzYsMCBAQAotICAgICAgIC5zaXplICAgdiwgNApAQCAtMjcgKzI1LDAgQEAKLSAgICAgICAu
c2l6ZSAgIGYsIC4tZgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
