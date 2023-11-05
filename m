Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26888C4332F
	for <linux-riscv@archiver.kernel.org>; Sun,  5 Nov 2023 21:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eoPX7L/rJUj2rN5WOTuqQyNTJ5RBOp95IhZX6Y8DZfo=; b=HsOEwelZLbjcBt
	uzE/ojDCF3itc6t6oQZD25FeTkswZdg3jkp9g3vYz1T9dvK+Ifi25eylEJR634M5MbGEa1P9eSMsh
	mhhkB++pIXnjiYd3TN0XorWTGC0r4gjF73OW5Y+Qo9r7oVuKXD1Vt7BvsAW2HSGxKjhFa1H4kU35g
	szz5H3r3x+ReaQQTMAHtcYvZy8MCKPowA0tHqLfJ/i0ojFENHhTDeB3cQpztudHYFbdxJoo+n8tGJ
	yG9KzqlonfxFYJf8NZZBE7akLlUQcen9LMzg9M17sD0Y0PJI5J3O4IddklZZri+JEJcdGX3dB1jf7
	NamldSIyZ6nPp5och25w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qzkYq-00FXQH-2m;
	Sun, 05 Nov 2023 21:21:36 +0000
Received: from mail-mw2nam04olkn20817.outbound.protection.outlook.com ([2a01:111:f400:7e8c::817] helo=NAM04-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qzkYn-00FXPr-1K
	for linux-riscv@lists.infradead.org;
	Sun, 05 Nov 2023 21:21:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y/rqFcpSgZ6MVZ7suo0PqDLC4NK2VsFJ+/5KErgZtF4rrKbcGKnFEEhNNk6wxbSdRRT7P9AhczNf7jS7113imRwUFP+ZMlMAWyNLrOHUN2Y2r8ZXgwXRT4XPiJEbbgkA7WgfratsAmQJHKveGbQQcLyo1wrerQFACARUP+rGz0IwPQ8lZRRkZRAtizG/6nzUvhAegG5JnGJGe8bFsuU3vmGtf2WlE/ANOhcluhrO6wKl0q8zqUEniSMZZ7mY922gKiBN0HU7UF2BxUOsqF0e2ydOXj40AC78ZYLN9R94tqCYI75pMbiy60nEhr2UUdc7jeFLlb1k/MNvp5FxGdNRkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hj8oBW5Z1WV883J45tm10/a58Q2NBnepuFlqRvVxPdA=;
 b=EjmLbkwRAf+kl5ERanptJeEkAotoyYBYaTi3mZoAEih8941ga8VD8D+nY/6D63PDPMHNgWgHuGKHsoMwFjink2GRA7fYPWNxy2udNz4OFszgqOyLT7RSywCL1w4MP0yval1gQZHcDIBkcFS8dunhUAXNUeKQD0zo+ZYh1NLcv+GmEGqggiBuUY1vk/L+5Ay0cFHzq2Oki2tmY9g3nyZSADzYC1cdB5BiiB+yoMNOilM2dB+ANIwfJb7SNl08jJf9Cp0RigXHaP3a+jiQBGaLJ3cVFs35Yi5Yad7mkQaWIgxQb/qiM//iz7/WeitjEwhlTcWYLR6l07O6Jni2iwfcDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from DS7PR12MB5765.namprd12.prod.outlook.com (2603:10b6:8:74::19) by
 BN9PR12MB5066.namprd12.prod.outlook.com (2603:10b6:408:133::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.27; Sun, 5 Nov
 2023 21:21:24 +0000
Received: from DS7PR12MB5765.namprd12.prod.outlook.com
 ([fe80::2493:49ba:b06b:fa80]) by DS7PR12MB5765.namprd12.prod.outlook.com
 ([fe80::2493:49ba:b06b:fa80%6]) with mapi id 15.20.6954.021; Sun, 5 Nov 2023
 21:21:24 +0000
X-Gm-Message-State: AOJu0YwoDG173YUSzjwUmCJA3uun5hs2THrCHpCBrs7q3ZQ8qjoBjPB5
	5bsaFAs93gV42lB0QmEcUAILmQTCI6AV2g5fvXc=
X-Google-Smtp-Source: AGHT+IG3nECb0gKMLk6bcCTgg5JIOEKs3Po2EY/hacYzyJwwhvoK4rtrquC8P+WzETEvftr6+CYdZgiF+4eHdGDlhvQ=
X-Received: by 2002:a1f:a754:0:b0:49d:fab:fa37 with SMTP id
 q81-20020a1fa754000000b0049d0fabfa37mr22304751vke.4.1699218838480; Sun, 05
 Nov 2023 13:13:58 -0800 (PST)
References: <cover.1699025537.git.tanyuan@tinylab.org> <f0ee9abfd8d7b27489a4efe3196813225ce5680f.1699025537.git.tanyuan@tinylab.org>
In-Reply-To: <f0ee9abfd8d7b27489a4efe3196813225ce5680f.1699025537.git.tanyuan@tinylab.org>
From: Fangrui Song <i@maskray.me>
Date: Sun, 5 Nov 2023 13:13:47 -0800
X-Gmail-Original-Message-ID: <CAN30aBER3MnxPztEGDO2NCg3FzGwf3-2jmE51timpcxwEiOORQ@mail.gmail.com>
Message-ID: <DS7PR12MB576515185280BB7E69C5E9D3CBABA@DS7PR12MB5765.namprd12.prod.outlook.com>
Subject: Re: [PATCH v1 10/14] DCE/DSE: riscv: make every ex_table's name unique
To: Yuan Tan <tanyuan@tinylab.org>
Cc: falcon@tinylab.org, arnd@arndb.de, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org, 
	luc.vanoostenryck@gmail.com, linux-sparse@vger.kernel.org, 
	linux@weissschuh.net, palmer@rivosinc.com, paul.walmsley@sifive.com, 
	paulburton@kernel.org, paulmck@kernel.org, tim.bird@sony.com, 
	tsbogend@alpha.franken.de, w@1wt.eu
X-TMN: [R1FV919UNix7Dim/PJPWAi6Jw6mCbpQr]
X-ClientProxiedBy: SN7PR04CA0023.namprd04.prod.outlook.com
 (2603:10b6:806:f2::28) To DS7PR12MB5765.namprd12.prod.outlook.com
 (2603:10b6:8:74::19)
X-Microsoft-Original-Message-ID: <CAN30aBER3MnxPztEGDO2NCg3FzGwf3-2jmE51timpcxwEiOORQ@mail.gmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB5765:EE_|BN9PR12MB5066:EE_
X-MS-Office365-Filtering-Correlation-Id: 518ece0b-e3b7-4945-7b3a-08dbde4529f0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Eow5Yq+hmsv/IHyNenG6EPcVYws4idYRKkVI3MjlKzxQXF0Cw5GZrk38OV4yEruzOQSiadIccFwINBYJYF7TSCTwegjHphOwHaJbXeL/u/sTZnh3gXYGLkwAObYUj1k5qAHXvZRGth0TOzdS5HUYvQYI2fIpwBzFQhUCUiIrETuemv2wofWuVydDY7cjPFM4VdF0CY/fX342zr0pGS2J4jG1XiUNp/D6/rn+UZdvR9jz+z38ojKxBiz5K01E1xM0Yfh0cf1kxsjv4+3nzJQtV1/NiIU0xzvPT966yaca6jyCzMJ3jkrOvijJ01vc/7QuE1qywAwvtNnuCMqcD5N+hMLk3qp2/eUgFGi/3MCzleHIvMwM3bC8rKBhN3bltcVknAXpGMZ7K5dAOyBuHO2ZpjThbEQCRmY7c5wSVNhdFhAf242DPk4B7cOzyTUvaGLm6OaXCERCqQZA2fBJtgc6Cqd0Sfx+UHwFgbRxxAyT4Rr69btmawTMNCd5isE7dIlrSzgh4Dterokf4WqnrVaGaPmX+sp0HhN9hOP4WIsTg5A2hyOMj83QF3eEzEjKnb7/PlcgvMn063Ml/3LT8E9sBE3r0CzBRHb6tDPV3IYGL80=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UTBhaE9zc0Z5R0hxd1dVVmV2aTd6eHk1MWlFSjkxQmlpK0U4akh4SWFYUDMx?=
 =?utf-8?B?UU03ay9nQUpxWks4ZkdtZ3NVb25zdmZ5ZDBJT0xhdlFyR3pDQ1BOVitGenEz?=
 =?utf-8?B?MWNYRU81RWRhSmloR1dqMkVNOEc4RWswVHpibEFEWU52N1lmdkl4cWdqNytl?=
 =?utf-8?B?TmN4M0p5UmF5TlVLSjQ3MU40S3UyMlFVdEx0OEpVOUpsam8zSXFqZlJZaUo4?=
 =?utf-8?B?eHR0MGJ3MC9LUHBoa0tLTXpVdFVPY3k4K1FFZ3VFNzdXMUs0ekFyaDA2SUNC?=
 =?utf-8?B?WlNhb3V6Ylo3VkV4WHkwNkd5aVV5aTQvZzE0NE9pSnVFN1VBcExSMGQ1RWtP?=
 =?utf-8?B?SStiRUl1Wis2bXhyQkxOeGE1aUlWanRrZ0d4U0RoTnVZQTc2bVF5RjBzZVNZ?=
 =?utf-8?B?bVZnSXhjQU9BVEhOZzlQY3gzbFB6SjBQT0NqWUpjS3FET1dYSm12eVNqUXdq?=
 =?utf-8?B?U0sydjVIZ1o2azh0QWppTm4zWURiVktvYWdoWmdwdm5oRXE3Z3NHQzhGNkdj?=
 =?utf-8?B?eEsxWXgwcjBONDV0cUZmZ3VURWZnWTFuVkdBcnBVU3BhNjVaMlVLa2R5KzZp?=
 =?utf-8?B?cnpabUlBa3JHcW8xaUoycEU3ZElKaSt4RWwvN3R3SEpLbk1MSktiQkJQU2ha?=
 =?utf-8?B?am92RmRvcjRYTWJsREIzWHhuYzFPVVVsUU5hZ2VQMTNKNFZlb0JDbUFyenlp?=
 =?utf-8?B?RFMvZHJmSmV6dHNGNEdpQ09LYldHTkhGRlV4U0dyV3hrSHBoTm90Y0VTRnZw?=
 =?utf-8?B?ZisrN2g1N0hrYUZoUE1qdWZSdVV5TlQ4ZFF4dHpkbDZJYWJSSldHT29UUklu?=
 =?utf-8?B?Ny9pN3VMWnE2M1R3UWsrWVhiQnNNaE44T1FxUWFCYW80cHdDem5Dd0txUzhr?=
 =?utf-8?B?elBhblgxK3BZSDU2aXlWbC95ZG90R2lxSERER1FsOUpMTVF3UkVnOE9XemI3?=
 =?utf-8?B?QjZyMkNJbmw0OXFNSncxZFN0anBZK3lqVkdNeVZadXE2SFgvdWl3OXJWZnFE?=
 =?utf-8?B?a3hwa1JoeUJPTXNMS3RkejBTeE11dVRNWllFWjEvQm5uNGs5L1ZZZk05Z3dv?=
 =?utf-8?B?TngrVjFPdGRyZld1V2ZWM0l5MW1UM2gyd2V2MzZTcU85cmlXbHBiTStvN3Rl?=
 =?utf-8?B?L3gvekU3bjFPMzJqa1QzdGRJMkdOQzkwTXdFS0xrZmxxOUVsSWo1ZjlkdTlW?=
 =?utf-8?B?Snc2NU85RERsQTNUTU4wVSsrclZUQm1iNU5jTmh0ZGNZbFh3SGpBN0srTjQr?=
 =?utf-8?B?Z0RoVWRzbHI0K3ltcVRXYnJOYVo3bUxSTVRqZFpBQUd6em5BbXh5MjZHcTI3?=
 =?utf-8?B?TmhERGd2bnFZa3NhU2JyMkFMMDYyUkgySkw5S0htVWxyeVdhQnhiREp1THZx?=
 =?utf-8?B?bzlSMTVzb05oSzUxakhPYm83eENEUFplTkhIeTIzQVRsbkROdEhjWW1xVU9P?=
 =?utf-8?B?S1kxUWIySFRVS0tNWEtBK3RqSTBTVkZ5NzVTd1ZsRkxnSWxjSFVpTkx2bGpv?=
 =?utf-8?B?TFdJeUdsT1RIRXNXV0M4OUhQNk5JQ0Q5UzZyUlgwQ09xRE16enBKdTVjWkFm?=
 =?utf-8?Q?rL/dfu2EoxNcC7RABPBnS1CDwkGgUmvPpRyg83TkHlgz24?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-5183d.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 518ece0b-e3b7-4945-7b3a-08dbde4529f0
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB5765.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2023 21:21:24.3511
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231105_132133_478570_1A00F376 
X-CRM114-Status: GOOD (  11.02  )
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

T24gRnJpLCBOb3YgMywgMjAyMyBhdCA5OjAy4oCvQU0gWXVhbiBUYW4gPHRhbnl1YW5AdGlueWxh
Yi5vcmc+IHdyb3RlOgo+Cj4gZ2Mtc2VjdGlvbnMgcmVxdWlyZSBzZWN0aW9uIG5hbWVzIHRvIGJl
IHVuaXF1ZS4KClRoaXMgaXMgbm90IHByZWNpc2UsIHNpbmNlIGEgbW9ub2xpdGhpYyBzZWN0aW9u
IGNhbiBiZSBnYXJiYWdlCmNvbGxlY3RlZCBhcyB3ZWxsLgoKaHR0cHM6Ly9tYXNrcmF5Lm1lL2Js
b2cvMjAyMS0wMi0yOC1saW5rZXItZ2FyYmFnZS1jb2xsZWN0aW9uCgoiV2l0aG91dCB0aGUgb3B0
aW9ucywgdGhlIGNvbXBpbGVyIHRlbmRzIHRvIHByb2R1Y2UgbW9ub2xpdGhpYyB0ZXh0CmFuZCBk
YXRhIHNlY3Rpb25zLiBUaGUgbGFyZ2Ugc2VjdGlvbnMgbWFrZSB0aGUgR0MgY29hcnNlLWdyYWlu
ZWQgYW5kCnRoZXkgd2lsbCBsaWtlbHkgYmUgcmV0YWluZWQgYXMgYSB3aG9sZS4gbGQgLS1nYy1z
ZWN0aW9ucyBjYW4gc3RpbGwKZGlzY2FyZCBzb21lIHNlY3Rpb25zLCBidXQgdGhlIGVmZmVjdCBp
cyBsaWtlbHkgdmVyeSBwb29yLiIKCgo+IFNpZ25lZC1vZmYtYnk6IFl1YW4gVGFuIDx0YW55dWFu
QHRpbnlsYWIub3JnPgo+IFNpZ25lZC1vZmYtYnk6IFpoYW5namluIFd1IDxmYWxjb25AdGlueWxh
Yi5vcmc+Cj4gLS0tCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vYXNtLWV4dGFibGUuaCB8IDYg
KysrKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
Cj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9hc20tZXh0YWJsZS5oIGIv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9hc20tZXh0YWJsZS5oCj4gaW5kZXggMDBhOTZlN2E5NjY0
Li5kMGJlNWE4MzgyNDIgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9hc20t
ZXh0YWJsZS5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9hc20tZXh0YWJsZS5oCj4g
QEAgLTksMTAgKzksMTIgQEAKPgo+ICAjaWZkZWYgQ09ORklHX01NVQo+Cj4gKyNpbmNsdWRlIDxs
aW51eC9jb21waWxlci5oPgo+ICsKPiAgI2lmZGVmIF9fQVNTRU1CTFlfXwo+Cj4gICNkZWZpbmUg
X19BU01fRVhUQUJMRV9SQVcoaW5zbiwgZml4dXAsIHR5cGUsIGRhdGEpICAgICBcCj4gLSAgICAg
ICAucHVzaHNlY3Rpb24gICAgX19leF90YWJsZSwgImEiOyAgICAgICAgICAgICAgICBcCj4gKyAg
ICAgICAucHVzaHNlY3Rpb24gICAgX19TRUNUSU9OX05BTUUoX19leF90YWJsZSksICJhIjsgICAg
ICAgICAgICAgICAgXAo+ICAgICAgICAgLmJhbGlnbiAgICAgICAgIDQ7ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgXAo+ICAgICAgICAgLmxvbmcgICAgICAgICAgICgoaW5zbikgLSAuKTsg
ICAgICAgICAgICAgICAgICAgXAo+ICAgICAgICAgLmxvbmcgICAgICAgICAgICgoZml4dXApIC0g
Lik7ICAgICAgICAgICAgICAgICAgXAo+IEBAIC0zMSw3ICszMyw3IEBACj4gICNpbmNsdWRlIDxh
c20vZ3ByLW51bS5oPgoKX19TRUNUSU9OX05BTUUgaXMgcHJvYmFibHkgYWRkZWQgYnkgYSBwcmV2
aW91cyBwYXRjaC4KQW4gYWx0ZXJuYXRpdmUgaXMgdG8gdXNlIHRoZSAuc2VjdGlvbiBkaXJlY3Rp
dmUncyBgdW5pcXVlYCBmZWF0dXJlCihiaW51dGlscz49Mi4zNSkuCgo+ICAjZGVmaW5lIF9fQVNN
X0VYVEFCTEVfUkFXKGluc24sIGZpeHVwLCB0eXBlLCBkYXRhKSAgICAgXAo+IC0gICAgICAgIi5w
dXNoc2VjdGlvbiAgIF9fZXhfdGFibGUsIFwiYVwiXG4iICAgICAgICAgICAgXAo+ICsgICAgICAg
Ii5wdXNoc2VjdGlvbiAiIF9fU0VDVElPTl9OQU1FKF9fZXhfdGFibGUpICIsIFwiYVwiXG4iICAg
ICAgICAgIFwKPiAgICAgICAgICIuYmFsaWduICAgICAgICA0XG4iICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIFwKPiAgICAgICAgICIubG9uZyAgICAgICAgICAoKCIgaW5zbiAiKSAtIC4pXG4i
ICAgICAgICAgICAgIFwKPiAgICAgICAgICIubG9uZyAgICAgICAgICAoKCIgZml4dXAgIikgLSAu
KVxuIiAgICAgICAgICAgIFwKPiAtLQo+IDIuMzQuMQo+CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
