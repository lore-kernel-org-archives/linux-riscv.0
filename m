Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7374FC48292
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Feb 2024 07:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:To:Subject:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6lqsK2eWtwphVjNAXpNFWdQkxwcLbR+W5fCuN2VjNR8=; b=2b6jaen6FK3rLSzaFCHcwWMUb1
	rNQYosRKIjNUbVB4n61mX3QCx4rKW/3uT8uNOjNq/DhJiTeXsY4zBdMpY875GSh28CH0H2jftzJZa
	FHPbU97zr1Y9qE4oCVs9IGbwd8inEv0BA2UBpbVCYwkgtpt+V7f5H0tqaHdS7bM3gxR3gliO28eR2
	Zaux1u0qVVCinnQrHi3W264cB2ac9YLx4pf+vgmFV3gQezXY0djdQGPHbWxURljwZ1IBFKmMuV307
	cT8JAsZfVwFI4EsjP/qgU7sGErfgJGKpgAdYkwQK9Mfd5C2pMUiQPmb+USY8fhOHiGgzCQdAr9KP6
	3nugNvYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWtrz-00000002N6J-2q8E;
	Mon, 05 Feb 2024 07:58:23 +0000
Received: from mail-bmxind01olkn20800.outbound.protection.outlook.com ([2a01:111:f403:281c::800] helo=IND01-BMX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWtrs-00000002N38-1d0m
	for linux-riscv@lists.infradead.org;
	Mon, 05 Feb 2024 07:58:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NuIDwXyhhGVcmRY79CW8kisHkQwkFsO2hBz6fKmouL7Q1/HWCy9NHQ9StITwskZnownmzT4h0b0oqDFpyAOezaDn8LXV7nZYOYw+U8jxuS5obiotEyo0jKSJt4D75eOR0jgsbaNj3hBScgBpyNcMacMu+Ho2eYNzM08Skvg2kRJjOB9CDPpByZYrD7GOTneCEjXatyUHDvgDdCdIuOaDXjXyVgP+V/EjShwKzxgRvrmKsJ0ojO94eV+3F9ZfIvGGmI1b0KAd73GGlpDDUcSRgMKhAs2qq7m2Cm6AWHG6jYAuQA9qbLAmWKfGip0XHse3QEvFmfdf84pfCwXLnRW2kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C35Hy0xxuq0bWwI2Xy5ezxGeiUOKfMfjJ/K9TTdm+kI=;
 b=JRZys9aUYRi/TDRio0+fxcKU/Xl8vJf4ctMbqS/LzoMoMl+9N726WhdMt3hjzh3OSQIP92zuVAExXIqXACT9fcZ/byIv2Fp1SSp3H2C5ZmTnQhDNQ+IfN8S0wqXkKyZdTTnUpH0w1m405IT5oS7QEcv5wJxVh7q0dALxwOzsHbCnzOIk7egTkIU32yhUQLg526rT2Weehu5BjBn/nLa87PLdu8bzhS2Vdzp2P/aAOFy8r10sqJDieNTXVRljWQK6IlAHFh1yTrHcm53xr/IL27GcaGStFaU3ZwrXxt1vGd1E4AEuWL1F8oswhvKZCBBDOH5xd+qyHVk/9AB8cHdlAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C35Hy0xxuq0bWwI2Xy5ezxGeiUOKfMfjJ/K9TTdm+kI=;
 b=CGNtXa/EDtx1Ut4Eib+VVpPS8GR514RqXRpIGn0B0tsUpbiHL658iIMkp/v0ULs823oNFHsxWx3bXpbvY1ew+hnzaHpulnCNeDEgupOpPWfJQcOXwdlwBaZ9v0tFMKMS6BK6sBFRmdQHGKFmzsa8XqZWyQbXWFs4TAaekL03FBJSCtJWP+LzNjXURwnbAP7kDnUoIqOI1uxWA4K6wDGGTZ/kOgvwG+sLD8XXnFvp8yjmHo52R7JEKyGga/H0IQ8WS4sXGUfSvtgvYVdnUNoRd4v4SeeiN2g3FQtVRmwbeq0+Cfnjn7HqV19T1wVgk4KRW4E4Wdh5O/+N2g+ZHES/qg==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by PN3P287MB1210.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:197::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.17; Mon, 5 Feb
 2024 07:57:46 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a2d5:82f2:b6d4:f2cd]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a2d5:82f2:b6d4:f2cd%2]) with mapi id 15.20.7270.016; Mon, 5 Feb 2024
 07:57:46 +0000
Message-ID: <MA0P287MB282211AD3154AD3831F734BBFE472@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Mon, 5 Feb 2024 15:57:42 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] riscv: sophgo: add reset support for SG2042
To: Chen Wang <unicornxw@gmail.com>, aou@eecs.berkeley.edu,
 chao.wei@sophgo.com, conor@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 palmer@dabbelt.com, paul.walmsley@sifive.com, p.zabel@pengutronix.de,
 robh+dt@kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 haijiao.liu@sophgo.com, xiaoguang.xing@sophgo.com, guoren@kernel.org,
 jszhang@kernel.org, inochiama@outlook.com
References: <cover.1706577450.git.unicorn_wang@outlook.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <cover.1706577450.git.unicorn_wang@outlook.com>
X-TMN: [e40KqZqvKLXw9A0bUsaDuiy/YxquFo+4]
X-ClientProxiedBy: SG2PR02CA0122.apcprd02.prod.outlook.com
 (2603:1096:4:188::10) To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID: <eb3fa681-cf38-44b2-a65b-8be0c2691fb1@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|PN3P287MB1210:EE_
X-MS-Office365-Filtering-Correlation-Id: cd8de638-61fb-4dfd-0fd9-08dc262022bb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0/NnordNoQ5+Pb9Gq/vxj0Onbe9v/U/eEq7P+aQfdQw05ZYF7aKiOEGDlSBfQrTE7O5hNYIFf700aHg0CQeZucMhXjuBZJSpNGZN0eU4QAeU5bgZ6dl9fgsT/8NflAhDXMtcdF8TsCyr+hc5uxF2d4r7EH3Askw8yoQMVQ/qMBXXWY36YY6W7cQAtLouhkrfYtfJGmLIMdi7O2zx//8MJxbBTeK+PBtd2mM1Dd2wqEs9W6TmYaTNPU2/HhBM6MzMr7F0Qs8IH4DNH3iMGrCq6lRD2uoLfdmWi+B6LgXdjZfekZabjNCHHngzVxMSgj2tEvI6ZFU/wXZiBPHbMdo26dnH/oeebgePAESur5MReP7FdLsvXosW2Q/ub46CYcAkOfFIEfW+M8yBH1XcOX8TCnPjgxDpj+kEUGja4gZBqEltCPjTJpXgl0Knh6ak5ybzml3gCfvBLpZJPxDXVl6sbeLZbjy2VfJ45QhqLDTKuvUewqHhxOmYzsra5Rgu3pJuHX+C31hL026kZGKgdZ9hGZRUc+R0NwA6n+HlKcFavV9K8NV2/JGVZOqpMAwEncw5HLSoo2WUFRV+YzidlUW2yezojY/sStW8hutbxRmcC04=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cm1IWDFMbWxQVS9JZ0tzdmJURytxV3FkVFYwL0EyS1JNRWlRK3dzYXg1dUVN?=
 =?utf-8?B?M3NicktrS2JIM0dEb21WQXVHZVB4bTNjR1dveVIxNVVVVWVicDlzaTZjU1li?=
 =?utf-8?B?cmtNZXJhVk9KZm5MU2R4a1JBdVExdXlnNk85YnY1eUxaclVFd1B0TVZFSFVI?=
 =?utf-8?B?dE5NYTd3ZDVIalM4WFZXb0d5UVl1N1EreW5CbGdjTnVQU0RGZU1WQ05SRC84?=
 =?utf-8?B?OWt3c3pjTW00amRmc3R3ZFNXZXJWOFpSWHk3MmpsWEc5UG54V1o0ZEZhanJh?=
 =?utf-8?B?eFJzaCt6dmdpYnAyaXYzOERNeGk4OVFvYk02TVlXc0NPdFN4ZVFCR1VNZlVP?=
 =?utf-8?B?MjlWWmtMdlBxR1NGLzgvcEUwenZ2anN4aDl0RER0MEVtaGViNnBOYldOMDUw?=
 =?utf-8?B?T1phTlFhUjNHV1RKUEFRODVUTUVkTWFGOUZ4eHZxUlhvRG5oVEZWS2NBaFFo?=
 =?utf-8?B?NnZXZUNlRnlZMzhaTFZvVDJlelhxaWJ6bytGb2h5Q0pVU1N2K2x0K1V1VHJl?=
 =?utf-8?B?c1MzTk83NnJ6U3ZtUUsyNlo0bUU0a1dUd0xUL1lpTlphYXdEb2hvWlllUmZm?=
 =?utf-8?B?c1pLcE5CRkE0M1NxdWtCclgyTnV6ZVY4b2NWdmlyd0dheVBnWWtHak5MQ1Vn?=
 =?utf-8?B?VEV1LzJzRExLcGtlaWxvZzZJOUtGby8vb3AyYVJoWHdyUDZQc1ZzTTF0NktD?=
 =?utf-8?B?TjJ3cG4zcXpVQStwSHlDeWxtRWNnZTlpRzBYK29JbmZzQ1FWRnpTVnRqRnVi?=
 =?utf-8?B?NXR0S0JsdDYyYlBrM2hEcE14N2EyZW1qK2FWV2ZqVGRxcDU0T1FiM2dDZURJ?=
 =?utf-8?B?dlpQbFc4aU5nRWl4MnVDNFhjZ2JjK3lTMHkxcGlydW5tc0lRUWxLVG4rUVZK?=
 =?utf-8?B?RHN2cXBhQ1drTFhhVkZLSzA1Q1FCZWtjWitvVHBodTdjVWkxdGpJSkowZ2pp?=
 =?utf-8?B?U21NVnVvMVNMaVZ1V2Z2Z0NsYTFtWnZScWdpS3dJbi94ejFkREd2L3ZmUlpw?=
 =?utf-8?B?cnlGRmRXMXJTT2NnUTVOQ0pQdDNQbk5vNnc2UVZpU0ZRRGszbW5Ya21NaUlU?=
 =?utf-8?B?aFMzeml6OVBpcHlrWVZZTlBFOUw4QllaK3VIRHkwRGNGaEFtVW8zNUlnQUhq?=
 =?utf-8?B?WFU5N05GaXorckdqdUNHRHJUSTlGRFRqQW5oN0FkQ0t6NjZJL3ZWcndkL2JI?=
 =?utf-8?B?UHpSNXZscUV3THZhOFJleTAvNzNJOWp0OU9GVlpYUE1xT25GV2tjQy9kUjcy?=
 =?utf-8?B?SW5VQ3BKSlVaM0NpTFBRWHlTNWx2KzYwMnRTUzROR3daS0FmV2J5bG9jZmJB?=
 =?utf-8?B?dEZpWmt2bkJXOG1ZYXBTQVhXd1VSdDJyYm9SWDRCdzRqZk5WT3BNUG5HSzB2?=
 =?utf-8?B?U3YvbWQvVnhXZCs2UFN0S2lRMlZVMCtDYStsV01Sa0hhOU1aSUlXR083R0Ew?=
 =?utf-8?B?WU9XR3E1azZuYTdHU00vdzBwSU11SHV2SlU2dlp5Rm9teDhHWXl1Zm5mOHBp?=
 =?utf-8?B?Nm90aGdxSXg0NWNZYkV6dGx2V0M4WUNRRS9sVmNOb2xvS3dvK3gzTWJBR2o4?=
 =?utf-8?B?bXJJZXVJeXY2SGtld09RaWpYYUxERG9NZHZRR0U5b2Z3L1BDMGRzb2ZHTEMr?=
 =?utf-8?Q?Qi3PlsVmNGIJxQDdn94VIpMldaQ8eSib+TCRMEa4I4o0=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd8de638-61fb-4dfd-0fd9-08dc262022bb
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2024 07:57:46.2720
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB1210
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240204_235820_841134_6DABC027 
X-CRM114-Status: GOOD (  15.50  )
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

cGluZyB+fn4KCk9uIDIwMjQvMS8zMCA5OjQ5LCBDaGVuIFdhbmcgd3JvdGU6Cj4gRnJvbTogQ2hl
biBXYW5nIDx1bmljb3JuX3dhbmdAb3V0bG9vay5jb20+Cj4KPiBUaGlzIHNlcmllcyBhZGRzIHJl
c2V0IGNvbnRyb2xsZXIgc3VwcG9ydCBmb3IgU29waGdvIFNHMjA0MiB1c2luZwo+IHJlc2V0LXNp
bXBsZSBkcml2ZXIuCj4KPiBUaGFua3MsCj4gQ2hlbgo+Cj4gLS0tCj4KPiBDaGFuZ2VzIGluIHYz
Ogo+ICAgIFRoaXMgcGF0Y2ggc2VyaWVzIGlzIGJhc2VkIG9uIHY2LjgtcmMyLCB3aGljaCBoYXMg
aW5jbHVkZWQgdGhlIG1pc3NlZCBwYXRjaCBJCj4gICAgbWVudGlvbmVkIGluIHYyLgo+ICAgIC0g
QXMgc3VnZ2VzdGVkIGJ5IFBoaWxpcHAsIGRyb3AgdGhlIEtjb25maWcgZm9yIFNHMjA0MiwganVz
dCBhZGQgYSBkZWZhdWx0Cj4gICAgICB5IGlmIEFSQ0hfU09QSEdPIHRvIFJFU0VUX1NJTVBMRS4K
CmhlbGxvLMKgIFBoaWxpcHAsCgpDYW4geW91IHBsZWFzZSBoYXZlIGEgbG9vayBvZiB0aGlzLCBJ
IGhhdmUgZml4ZWQgdGhlIGlzc3VlIHlvdSByYWlzZWQgaW4gCmxhc3QgdmVyc2lvbiwgYW55IHF1
ZXN0aW9uIHBsZWFzZSBmZWVsIGZyZWUgbGV0IG1lIGtub3cuCgpUaGFua3MsCgpDaGVuCgoKPgo+
IENoYW5nZXMgaW4gdjI6Cj4gICAgVGhpcyBwYXRjaCBzZXJpZXMgaXMgYmFzZWQgb24gdjYuOC1y
YzEuIFlvdSBjYW4gc2ltcGx5IHJldmlldyBvciB0ZXN0IHRoZQo+ICAgIHBhdGNoZXMgYXQgdGhl
IGxpbmsgWzNdLgo+ICAgIC0gZml4ZWQgc29tZSBtaW5vciBmb3JtYXR0aW5nIGlzc3Vlcy4KPiAg
ICBOb3RlIHRoYXQgaWYgeW91IG5lZWQgdG8gcGFzcyBkdGIgY2hlY2ssIHlvdSBuZWVkIHRvIGFw
cGx5IGEgcGF0Y2guIFRoaXMKPiAgICBwYXRjaCBpcyBtaXNzaW5nIGluIHY2LjgtcmMxLiBGb3Ig
ZGV0YWlscywgcGxlYXNlIHNlZSBbMl0uCj4KPiBDaGFuZ2VzIGluIHYxOgo+ICAgIFRoZSBwYXRj
aCBzZXJpZXMgaXMgYmFzZWQgb24gdjYuNy4gWW91IGNhbiBzaW1wbHkgcmV2aWV3IG9yIHRlc3Qg
dGhlCj4gICAgcGF0Y2hlcyBhdCB0aGUgbGluayBbMV0uCj4KPiBMaW5rOiBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9saW51eC1yaXNjdi9jb3Zlci4xNzA0NzkwNTU4LmdpdC51bmljb3JuX3dhbmdA
b3V0bG9vay5jb20vIFsxXQo+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJp
c2N2L01BMFAyODdNQjI4MjI4NTcyQzUyNkM1MDk5QThCREEyREZFN0IyQE1BMFAyODdNQjI4MjIu
SU5EUDI4Ny5QUk9ELk9VVExPT0suQ09NL1QvI3UgWzJdCj4gTGluazogaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvbGludXgtcmlzY3YvY292ZXIuMTcwNjE2MTUzMC5naXQudW5pY29ybl93YW5nQG91
dGxvb2suY29tLyBbM10KPgo+IC0tLQo+Cj4gQ2hlbiBXYW5nICg0KToKPiAgICBkdC1iaW5kaW5n
czogcmVzZXQ6IHNvcGhnbzogc3VwcG9ydCBTRzIwNDIKPiAgICByZXNldDogc2ltcGxlOiBhZGQg
c3VwcG9ydCBmb3IgU29waGdvIFNHMjA0Mgo+ICAgIHJpc2N2OiBkdHM6IGFkZCByZXNldCBnZW5l
cmF0b3IgZm9yIFNvcGhnbyBTRzIwNDIgU29DCj4gICAgcmlzY3Y6IGR0czogYWRkIHJlc2V0cyBw
cm9wZXJ0eSBmb3IgdWFydCBub2RlCj4KPiAgIC4uLi9iaW5kaW5ncy9yZXNldC9zb3BoZ28sc2cy
MDQyLXJlc2V0LnlhbWwgICB8IDM1ICsrKysrKysrCj4gICBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3Nv
cGhnby9zZzIwNDIuZHRzaSAgICAgICAgfCAgOSArKwo+ICAgZHJpdmVycy9yZXNldC9LY29uZmln
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDMgKy0KPiAgIGRyaXZlcnMvcmVzZXQvcmVzZXQt
c2ltcGxlLmMgICAgICAgICAgICAgICAgICB8ICAyICsKPiAgIC4uLi9kdC1iaW5kaW5ncy9yZXNl
dC9zb3BoZ28sc2cyMDQyLXJlc2V0LmggICB8IDg3ICsrKysrKysrKysrKysrKysrKysKPiAgIDUg
ZmlsZXMgY2hhbmdlZCwgMTM1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAgIGNyZWF0
ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmVzZXQvc29w
aGdvLHNnMjA0Mi1yZXNldC55YW1sCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9kdC1i
aW5kaW5ncy9yZXNldC9zb3BoZ28sc2cyMDQyLXJlc2V0LmgKPgo+Cj4gYmFzZS1jb21taXQ6IDQx
YmNjYzk4ZmI3OTMxZDYzZDAzZjMyNmE3NDZhYzRkNDI5YzFkZDMKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
