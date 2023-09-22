Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4592DE7D0B4
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Sep 2023 05:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/TMtYhx+k9imrW/MHL+aFQMLxcj+Lij/+FI8wgikZLw=; b=N72IgbbLzhP+Av
	g8tkf9UmBtheFthzFy0dGkWfMdKuwPa+rVqwEMGyZd9CetXF7x7lYpcwmgYxoXi7Xit9sS5Bb9Xza
	BYncF4zK/qmEL4cJOLKqjKuNlqtM7KSrN7FlzSAxo9M+mL0eIRysVpSRvXDv6l5q7MKMOf03/52H3
	5vPm1JiJ/bEQ41FWMUYqjFOirkhep/ihnLl7/EHgO8SHB9Vhxj8ok+XB5ns0s+DhNMGuINEDzbwb3
	miqXphJ3GLfjjzD5vcMWXD7RSjBR68chLdnwJl1YLbWnNmffcbOy09R3vCp6uCX6Z+yYls4fHkGvV
	jCsaqhTVO2XvMbkpRWcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjYXX-007tz8-05;
	Fri, 22 Sep 2023 05:17:19 +0000
Received: from mail-bn7nam10olkn2082e.outbound.protection.outlook.com ([2a01:111:f400:7e8a::82e] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjYXT-007txQ-0f
	for linux-riscv@lists.infradead.org;
	Fri, 22 Sep 2023 05:17:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MUB5slVhuME6g9EaHTBkDBiJSyg7a29FC4N3kgK2STFqDNbGUaa7o3rDAJKLiK1wfiAB/uvyPDldgg1JbZuvUjW+iH+QUQhokVrSRrUx8EJ2f6W86uv3MCja7I5IWXlnSyUTpDm27/kSlVKY5GSj/skOP8Bg1H56qMmhq2VmmQT3gBUGdMLOtP9cNv6+Cg/0vOv+0Q/1vaLQYbV5ITJ4hkl9vj5VR4ESAs5wcfckjRxIeaNxXcAlNSwDAHUVH/dgUJ48+Kdqn/4Yr9Iu/c0/iRSGI/OH46wDHtDCXbW2YQnzm5IGIsQpAnfyqf7Fi09DMCgpQz+TS9hHpKk5BgC/CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nD4BLs26vobSSri7AQGCY2GUyFMyL8gjki2dHbJ/pKw=;
 b=kpdQsoSwh6MgLMCyjI7NvpdNokWLVD6weadmIOaQ2eXJMek0LpH1X7/IbLA3lCWgvzx4X9NUQEag0c+d1klARnBxQxFB/uyqGMwQJbCmrenBVoncqf6mOR6U5h+UYqndsKMNTA3dTZ7BtOzQZZ5WmbnQ4itXymStGTmeby6pJp0soqshUvTsrLNWdXmsTieCsDYYQegPkANXWqH6A73mgasGr+K/RYD8PWeaxFMdN5KcdEJmMlm4ApekBxGuV6N5Oed29QvCeJwQOjH5vxdCtmZEdFhDgdwAZp64x5jJjFknn7U+giWxePW++mDH7+ZpXfys9NtpQw/lsajGQTz61Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nD4BLs26vobSSri7AQGCY2GUyFMyL8gjki2dHbJ/pKw=;
 b=eXJSFv5r0IzjiVEKFIV6BefhAxPGvUtdLg961yefPuYxWwchXzL2hd4OTDkdSYGl6Brwh6g9VxPnTEG5tensDVw+q5XbrioIHH8Zupv0+YplwLW+RU/d52NBN0wzDYj/NuzVoCpyJHccf16jJNimY4IZZ5sybYx5WSX7QHBQJTkXPWl17otB/zOxJxnC5PAOPWHK8zxNeVCk/Ims2qMZghQeH8JhdiTuH/YuUifA7KuivuHfPqmt7X9yGyLOo752YBLFmLtnVPOxrh8W+KonB/340mjBBBJrsmBO/4zxKPO40vMYU6b/Szmxhh5/CEXVE/WVpo7Yh6NuIqOwdpg4Ew==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by DS0PR20MB5664.namprd20.prod.outlook.com (2603:10b6:8:13b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Fri, 22 Sep
 2023 05:17:01 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::d050:882f:a8a7:8263]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::d050:882f:a8a7:8263%5]) with mapi id 15.20.6813.017; Fri, 22 Sep 2023
 05:17:01 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Conor Dooley <conor@kernel.org>
Cc: Anup Patel <apatel@ventanamicro.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	aou@eecs.berkeley.edu,
	chao.wei@sophgo.com,
	evicetree@vger.kernel.org,
	emil.renner.berthing@canonical.com,
	guoren@kernel.org,
	jszhang@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh+dt@kernel.org,
	xiaoguang.xing@sophgo.com,
	Chen Wang <wangchen20@iscas.ac.cn>,
	Inochi Amaoto <inochiama@outlook.com>
Subject: Re: [PATCH v2 06/11] dt-bindings: timer: Add Sophgo sg2042 clint
Date: Fri, 22 Sep 2023 13:16:35 +0800
Message-ID: <IA1PR20MB4953D983915AD8E35FD3E51FBBFFA@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230920-992a56b66366f3c0591a6a94@fedora>
References: <20230920-992a56b66366f3c0591a6a94@fedora>
X-TMN: [2pN40UUBm1/G+N940wNCYJE6oncjwZUc3/+mEEEgvzk=]
X-ClientProxiedBy: TYCPR01CA0056.jpnprd01.prod.outlook.com
 (2603:1096:405:2::20) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20230922051636.30743-1-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|DS0PR20MB5664:EE_
X-MS-Office365-Filtering-Correlation-Id: 01267ccb-7f6d-410b-8045-08dbbb2b248a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yujMIR3hYweCWQLNscOY1aU6zILYRML1ZHBV3cF1ZxKXkVn/iOYf0PaT90uHB7qsOWvXXwWa9YHTU62rH3o7ocZab0knJRm4VDijy8TNwNuuWyK9vx8/26z4JxXScgBSGLpbIwrX+hHx2PLQRJYRG9JVrX4ne/fwAolSBn7PwTlMtrx4N60zGn4Df/Fqi97UCYYafIYUKyhZ/8QuGuzIakAxFL+Rj8brTsPOIyotsXDw/ivUK5r1ZBvVYuE5b38ODhI7BIJCY79p3WNSpQj0v7kodrGndTSE2EgUwM/QYblss7Ucup+0gXMF8sn7rBQtzy1ZEy4dnVcaNooej5fZFdi5Zwq65DUh/BZZhSs7OpCGTGWa0T98i2gJk/tAIeFImIGzUcN2B0Xaa/aPsvTv/PeN7UYn+RvjunyAwRhTjH+bBrBREIM4TRZNwtR70ppY+se5gRo8FeOWELpQL+jgflvhHQQl6LlOE99B7Nvd3f1duJ2P4qv80GYSmmKRrBTte5tlNFVkr6lRBqp1THUyNW6Xcqj9HqDE2/5J9ZnXlaDsCzgPtwKNqyaaIX8SCLfZ3o7vN9/iNglzizE+4TUEguCPJ9NJF0iBiIeJFzSWxmx3jpq15RwqgGM+Xtl7gZCmYHZsn3Nr9f+gAZ+Gw7ec76r3LRpA/Up4mqtQsyi0794=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmR4dVRmNzZUMlF5dm1tRjNSMXJtMVBQb2dad1lRZlRycXBHM0ZHdzN1MkFa?=
 =?utf-8?B?ZjNLcGtYWFBLL1pGUStlTGJvek1VWlNzd2had1ZERUx6ck1zOTBXT1ZCa2dP?=
 =?utf-8?B?WkgyeHhkSnpQRTBOU1pzVEZxUlU2S0pkR3A4cXRkMGVMSUN0a1R6L0h0eFM3?=
 =?utf-8?B?NE1nRktER0RxVFh2MzViN3VqYTdGZUxRQ1FtemN1ZmtsMlhBQjVzQmdvRVUy?=
 =?utf-8?B?QnVsOGI1ZmVJYVp6MWFUdTQ3MmRCTlVJaldQQzNNM013cGhEZkF3cUMrcisw?=
 =?utf-8?B?SGJBNStCa3diVysxNEpXYjRTK1dKWVNIMk8zdVNrd1o0QzJyRWhEL2tydW5r?=
 =?utf-8?B?VTlvdDVlOEp2VnUrZG9ZcmZ5bEQxS093aXVzblVuT3lMVko4Mk40bUFncEFC?=
 =?utf-8?B?YXZIRDFoSzV2TENIM3k2SVZyUjR6dHRGMjA2OUdoL011RWdQNW5nVm85d1dM?=
 =?utf-8?B?eE9tSHdpMWh3TGdtajhsdW5tTUhVdm4rZ29RY1U0a1JYL25RbCtVZlRaL1Bl?=
 =?utf-8?B?aGM0dFhJRVFncW5zS25iU2tXZy95ZmYyV3N1bFBPdlgwMzZVWGh6VjNTVWJK?=
 =?utf-8?B?bkYzZ1I4VGs1WEkrZk1YRmpaWFJ5OXVTNWtIQVNscXFhSzN4cEhmZm9oc2Ji?=
 =?utf-8?B?RlZSa0d5ZXhDMEdYSTNJanAvNmR5U0Q0WVFpQms2OGJ6R3d5am9GenhTOHpV?=
 =?utf-8?B?ZFlxajlUTTlGaE84czk4N1FOU0kzSUc2a0RnYlY2OHZlSU5YRWFUeE5MZHJn?=
 =?utf-8?B?aVJZL0N2emliVFFoRzhlOEJENHMveGZYUjNjbGZDSjF5TWVzcmFxVkxTVk5P?=
 =?utf-8?B?ajFNZ2VkdnBmMEZIcjROV3IwSFZvc3pVZFNVb0NUVFlLWGVRbW5HbHJQWnFq?=
 =?utf-8?B?dzhNZmhJWUFveFZsRnU4Y2NLSTU3WUJZMVlLaTRRcVErbnJ5TThRRXdSSm91?=
 =?utf-8?B?M3RKWVNTVGdHN1plUXBPVkFSeDQ3VFh5NlFKNzhNd2RNOXBDSmNFSXBIelNC?=
 =?utf-8?B?ZHEzUFJaQjVlUEN2YVVuaU9ZVFQ5ckFUc0VXVnJTREt2T0dCOVNLYWg4VXpH?=
 =?utf-8?B?ZGlrUC9sR2NWV2RDRE1xUUdzcnpNdWZQZGRyeVRFMWFQRkUrQ1VxYXNlUjJ6?=
 =?utf-8?B?LzYzdGsvTGNYWUdyOWhGTTdmMjNTTG1KQXNyUHlKRXEweENxd29TakpOSUI5?=
 =?utf-8?B?ejBmUUdHbXhZK1VvUjluT3FxVVRMV1lFMDZwN1BBRHRvT0YrTTQ3a1pQQzRO?=
 =?utf-8?B?VnU1dnV6ZTNwRGZGU3BYVkswZzJvbTlMVGpTNHhTWjQzR1FGUS80UWkzR2Np?=
 =?utf-8?B?RXFRSXZuOFhZOEFHK3FINWNPdWtuSVpZdjhoWnlLZURWTmhEQkhNeXZ6ZnBL?=
 =?utf-8?B?YjkwQnRxR0JFZW5TUHM3dTQ3dDM1NVJxSGlnTy96MGtmV0JqOUZCdWN6dVJ3?=
 =?utf-8?B?bVdacllXZHhYZEZqa3pkZnpqMldaWVEvTG9HeThjeXByWG90VlE5b1kxYm10?=
 =?utf-8?B?MEV3cGkvdnFBUlRKN0JaQWsxbFJJTEszeldVMlRKTm11QzhzK2sySUxBRWNv?=
 =?utf-8?B?K2VkK0ptcGo3NHNhZFNId3JOKzEyUWJjb2orNHZoL3Vsbk1pZW9RemQzazlL?=
 =?utf-8?Q?qDi06AVIOucZNQl8Q5NKY3UypmHfCJy4kJlnA1d1T+o0=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01267ccb-7f6d-410b-8045-08dbbb2b248a
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2023 05:17:01.8034
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR20MB5664
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_221715_250371_82128993 
X-CRM114-Status: GOOD (  22.08  )
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

Pgo+T24gV2VkLCBTZXAgMjAsIDIwMjMgYXQgMDg6MDg6NDlQTSArMDUzMCwgQW51cCBQYXRlbCB3
cm90ZToKPj4gT24gV2VkLCBTZXAgMjAsIDIwMjMgYXQgNjoyOOKAr1BNIENvbm9yIERvb2xleSA8
Y29ub3JAa2VybmVsLm9yZz4gd3JvdGU6Cj4+Pgo+Pj4gT24gV2VkLCBTZXAgMjAsIDIwMjMgYXQg
MDg6NDA6MDdQTSArMDgwMCwgSW5vY2hpIEFtYW90byB3cm90ZToKPj4+Pj4gT24gMjAvMDkvMjAy
MyAxNDoxNSwgSW5vY2hpIEFtYW90byB3cm90ZToKPj4+Pj4+PiBPbiAyMC8wOS8yMDIzIDA4OjM5
LCBDaGVuIFdhbmcgd3JvdGU6Cj4+Pj4+Pj4+IEZyb206IElub2NoaSBBbWFvdG8gPGlub2NoaWFt
YUBvdXRsb29rLmNvbT4KPj4+Pj4+Pj4KPj4+Pj4+Pj4gQWRkIHR3byBuZXcgY29tcGF0aWJsZSBz
dHJpbmcgZm9ybWF0dGVkIGxpa2UgYEM5eHgtY2xpbnQteHh4YCB0byBpZGVudGlmeQo+Pj4+Pj4+
PiB0aGUgdGltZXIgYW5kIGlwaSBkZXZpY2Ugc2VwYXJhdGVseSwgYW5kIGRvIG5vdCBhbGxvdyBj
OTAwLWNsaW50IGFzIHRoZQo+Pj4+Pj4+Cj4+Pj4+Pj4gV2h5Pwo+Pj4+Pj4+Cj4+Pj4+Pgo+Pj4+
Pj4gSWYgdXNlIHRoZSBzYW1lIGNvbXBhdGlibGUsIFNCSSB3aWxsIHByb2Nlc3MgdGhpcyB0d2lj
ZSBpbiBib3RoIGlwaSBhbmQKPj4+Pj4+IHRpbWVyLCB1c2UgZGlmZmVyZW50IGNvbXBhdGlibGUg
d2lsbCBhbGxvdyBTQkkgdG8gdHJlYXQgdGhlc2UgYXMgZGlmZmVyZW50Lgo+Pj4+Pj4gQUZBSUss
IHRoZSBhY2xpbnQgaW4gU0JJIHVzZSB0aGUgc2FtZSBjb25jZXB0cywgd2hpY2ggbWFrZSBoYXJk
IHRvIHVzZSB0aGUKPj4+Pj4+IHNlY29uZCByZWdpc3RlciByYW5nZS4gSSBoYXZlIGV4cGxhaW5l
ZCBpbiBhbm90aGVyIHJlc3BvbnNlLgo+Pj4+Pgo+Pj4+PiBXaGF0IGlzIGEgU0JJPyBMaW51eCBk
cml2ZXI/IElmIHNvLCB3aHkgc29tZSBpbnRlcm1lZGlhdGUgTGludXggZHJpdmVyCj4+Pj4+IGNo
b2ljZSBzaG91bGQgYWZmZWN0IGJpbmRpbmdzPwo+Pj4+PiBCZXN0IHJlZ2FyZHMsCj4+Pj4+IEty
enlzenRvZgo+Pj4+Pgo+Pj4+Cj4+Pj4gU0JJIChTdXBlcnZpc29yIEJpbmFyeSBJbnRlcmZhY2Up
IGlzIGRlZmluZWQgYnkgcmlzY3YsIHdoaWNoIGlzIGFuIGludGVyZmFjZQo+Pj4+IGJldHdlZW4g
dGhlIFN1cGVydmlzb3IgRXhlY3V0aW9uIEVudmlyb25tZW50IChTRUUpIGFuZCB0aGUgc3VwZXJ2
aXNvci4gVGhlCj4+Pj4gZGV0YWlsZWQgZG9jdW1lbnRhdGlvbiBjYW4gYmUgZm91bmQgaW4gWzFd
Lgo+Pj4+Cj4+Pj4gVGhlIGltcGxlbWVudCBvZiBTQkkgbmVlZHMgZmR0IGluZm8gb2YgdGhlIHBs
YXRmb3JtLCB3aGljaCBpcyBwcm92aWRlZCBieQo+Pj4+IGtlcm5lbC4gU28gd2UgbmVlZCBhIGR0
LWJpbmRpbmdzIGZvciB0aGVzZSBkZXZpY2VzLCBhbmQgdGhlc2Ugd2lsbCBiZQo+Pj4+IHByb2Nl
c3NlZCBieSBTQkkuCj4+Pj4KPj4+PiBbMV0gaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2LW5vbi1p
c2EvcmlzY3Ytc2JpLWRvYwo+Pj4KPj4+IFllYWgsIHRoaXMgaXMgdGhlIHVuZm9ydHVuYXRlIHBy
b2JsZW0gb2YgaGFsZi1iYWtlZCBiaW5kaW5ncyAoSU1PKQo+Pj4gZW5kaW5nIHVwIGluIE9wZW5T
QkkgKHdoaWNoIGxpa2VseSBtZWFucyB0aGV5IGFsc28gZW5kZWQgdXAgaW4gUUVNVSkuCj4+PiBU
aGlzIFQtSGVhZCBzdHVmZiBpcyBjb21pbmcgYWNyb3NzIG91ciAobWV0YXBob3JpY2FsKSBkZXNr
cywgc28gd2UgYXJlCj4+PiBvYnZpb3VzbHkgZ29pbmcgdG8gdHJ5IHRvIGRvIHRoaW5ncyBjb3Jy
ZWN0bHkuIEkgbWF5IGVuZCB1cCBzcGVha2luZyB0bwo+Pj4gQW51cCBsYXRlciB0b2RheSwgaWYg
SSBkbyBJIHdpbGwgcG9pbnQgaGltIGF0IHRoaXMgdGhyZWFkIChpZiBoZSBoYXNuJ3QKPj4+IHNl
ZW4gaXQgYWxyZWFkeSkuCj4+Cj4+IFJJU0MtViBBQ0xJTlQgaXMgb25lIG9mIHRob3NlIHVuZm9y
dHVuYXRlIG5vbi1JU0Egc3BlY3MgKGxpa2UKPj4gU2lGaXZlIFBMSUMpIHdoaWNoIGlzIGltcGxl
bWVudGVkIGJ5IHZhcmlvdXMgb3JnYW5pemF0aW9ucyBidXQKPj4gbm90IG9mZmljaWFsbHkgcmF0
aWZpZWQgYnkgUlZJLgo+Cj5ZZWFoLCBJIGJyb3VnaHQgdGhpcyBzdHVmZiB1cCBhdCB0aGUgd2Vl
a2x5IHB3IHN5bmMgY2FsbCwgYW5kIFBhdWwKPnBvaW50ZWQgdGhhdCBvdXQuCj4KPj4gVGhlIFNp
Rml2ZSBDTElOVCBoYXMgZmxleGliaWxpdHkgcmVsYXRlZCBsaW1pdGF0aW9ucyB3aGljaCBtYWtl
cyBpdAo+PiBub3QgdXNlZnVsIGZvciBtdWx0aS1zb2NrZXQgYW5kIG11bHQtZGllIHN5c3RlbXMu
IFRoZSBTaUZpdmUgQ0xJTlQKPj4gaXMgYWxzbyBub3QgdXNlZnVsIGZvciBzeXN0ZW1zIHdpdGgg
QUlBIGJlY2F1c2Ugd2l0aCBBSUEgTS1tb2RlIGhhcwo+PiBhIG5ldyB3YXkgb2YgZG9pbmcgTS1t
b2RlIElQSXMuIER1ZSB0byB0aGlzIHJlYXNvbnMsIHRoZSBSSVNDLVYKPj4gQUNMSU5UIHNwZWMg
YnJlYWtzIGRvd24gdHJhZGl0aW9uYWwgU2lGaXZlIENMSU5UIGludG8gdHdvIHNlcGFyYXRlCj4+
IGRldmljZXMgbmFtZWx5IG10aW1lciBhbmQgbXN3aS4gVGhpcyBhbGxvd3MgcGxhdGZvcm1zIHRv
IGltcGxlbWVudAo+PiBvbmx5IHRoZSByZXF1aXJlZCBzZXQgb2YgZGV2aWNlcy4gVGhlIG10aW1l
ciBhcyBkZWZpbmVkIGJ5IHRoZSBBQ0xJTlQKPj4gc3BlY2lmaWNhdGlvbnMgYWxzbyBhbGxvd3Mg
cGxhdGZvcm1zIHRvIHBsYWNlIG10aW1lIGFuZCBtdGltZWNtcAo+PiByZWdpc3RlcnMgYXQgZGlm
ZmVyZW50IGxvY2F0aW9ucy4KPj4KPj4gUmVmZXIsIGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi9y
aXNjdi1hY2xpbnQvYmxvYi9tYWluL3Jpc2N2LWFjbGludC5hZG9jCj4+Cj4+IFdlIG5lZWQgYSBz
ZXBhcmF0ZSBEVCBiaW5kaW5ncyBkb2N1bWVudCBmb3IgQUNMSU5UIE1USU1FUgo+PiBhbmQgQUNM
SU5UIE1TV0kgYmVjYXVzZSB0aGVzZSBhcmUgc2VwYXJhdGUgZGV2aWNlcy4gVGhlCj4+IFNvcGhn
byBzZzIwNDIgU29DIHNob3VsZCBhZGQgdGhlaXIgaW1wbGVtZW50YXRpb24gc3BlY2lmaWMKPj4g
Y29tcGF0aWJsZSBzdHJpbmdzIGluIHRoaXMgZG9jdW1lbnQuCj4KPklmIHRoZSBzcGVjIGlzbid0
IGZyb3plbiwgSSdtIG5vdCBhY2NlcHRpbmcgYSBiaW5kaW5nIGZvciB0aGUgImdlbmVyaWMiCj52
ZXJzaW9uIG9mIGl0LiBCaW5kaW5ncyBmb3IgdGhpcyBzcGVjaWZpYyBpbXBsZW10bmF0aW9uIGFy
ZSBva2F5Lgo+Rm9yIHN1cmUgdGhvdWdoLCBzcXVlZXppbmcgdGhpcyBpbnRvIHRoZSBzaWZpdmUs
cGxpYyBiaW5kaW5nIGlzbid0Cj5hcHByb3ByaWF0ZS4KPgoKSXQgc2VlbXMgSSBoYXZlIG1pc3Nl
ZCBhIHBvaW50LiBJIHdvbmRlciB3aGV0aGVyIGl0IGlzIGJldHRlciB0byBhZGQgYQoiYWNsaW50
IiBiaW5kaW5nIGZpcnN0bHkgYW5kIHRoZW4gYWRkIHNnMjA0MiB0byBpdCwgb3IganVzdCB1c2Ug
c2cyMDQyCnNwZWNpZmljIGJpbmRpbmc/IElmIHVzZSAiYWNsaW50IiBiaW5kaW5nLCBJIHdvbmRl
ciBpdCBpcyBPSyB0byBhZGQKdGhlYWQgcXVpcmtzIGFzIGNvbXBhdGlibGUgc3BlY2lmaWMgcHJv
cGVydGllcywgb3IgbGVmdCB0aGlzIHRvIHRoZSBTQkkgdG8KaGFuZGxlPyBlLmcuIFQtSEVBRCB0
aW1lciBpcyBub3QgNjRiaXQgdGltZXIsIGFuZCB3ZSBzaG91bGQgaWRlbnRpZnkgdGhpcy4KCj5X
aGF0IHdhcyBwb2ludGVkIG91dCwgSSB0aGluayBieSBTYW11ZWwsIHRoYXQgdGhlIHJlYXNvbiB0
aGF0IHRoaXMgbWF5Cj5uZWVkIHRvIGJlIHNwbGl0IGlzIHRoZSBmYWN0IHRoYXQgdGhlcmUgYXJl
IG1hbnkgcG9zc2libGUgTVRJTUVSCj5yZWdpc3RlciByYW5nZXMgJiBwb3NzaWJseSBzc3dpIHN0
dWZmIHRvbyB0aGF0IHdvdWxkIG5lZWQgdG8gYmUKPmRpZmZlcmVudGlhdGVkLgo+Cj4+Cj4+IFJl
Z2FyZHMsCj4+IEFudXAKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
