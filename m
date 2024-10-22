Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B3ECD2C54C
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Oct 2024 13:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gIQkp2YihcIof6KCiQw4T52+0RceCWwIwJEaTdrqjGI=; b=H9W7KYxrpE64dHmcsz9SBUnQIk
	5Vp574ELbV76XOB/1YCeDXZBi67tbysdX2HZ3S3+cfIfGbgKZ+nLpJtmQcz4IL0Lda4dyMs7n0qYp
	rqRgadGfyRZIWEmGE3QFBvTOiu5XnUlLT6QheFf4PXsE4rVvXI/yvhVarooTak9rjLkNFKAdFYkFx
	fhSKF+/cJPaePXLiwSdId9wJapYUNLO25/fcHbENW+E59IJnq3DCvT/KFSLbpR81ElqCwnX3FM7yF
	IN+f6UcOqweL0xIWQjpbf7m4BfzZMDdOv6+YaRElVgNJGjXyxE3jUniJ8e4yTI2QiTeSbaBdD61Dw
	Les8GREQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3EZt-0000000Au9r-3Akw;
	Tue, 22 Oct 2024 13:05:37 +0000
Received: from mail-maxind01olkn2080b.outbound.protection.outlook.com ([2a01:111:f403:281b::80b] helo=IND01-MAX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3EZr-0000000Au99-0LJO
	for linux-riscv@lists.infradead.org;
	Tue, 22 Oct 2024 13:05:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D5HbanDqKI/Tp7Rhv+qK6JhQgiQuYf3754rGFHM8a4ACD8HNKIJrJHH/IqRL3rD+53TVr90L/BK7EchaU1f9CQbkDCLuauMTDpXzf/ri+14LWhvkp2/9EYZp0BfbZqwPfmdmB8XEhcr6zWrBK5UxPJGdk6Ht5j328eulyH/aiU4yBXAQm4tDDN26wAIwZMYjoB3qJDSPHn67KSfhEiVcMH5+PDZSv+5hlpD9t5dRtoELfj4BbeH9ZRWnRh6M0A2akaJqbV+SWhX0Q1cfP28H620CJFBY88xWP2UWAXeqbK8oKQcBIDRJiiPM5mMOiOHe94x2aNQcM8Pjca3hHjHCiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NhuMGTqAvXkEhjb/p0H6cU2Xb3nrwr1AF+LbZf9ORe4=;
 b=CF+XkdI5Vwwt5xSCwJRWJArRJYL62UCd5/JxRjmqZxiudgBJYJBiW2sPJ8TjMjKGpjvjdCJpjXTLulyJi7jTU47vB5KdU6qZoPi6cDipchisFiSRFdjNNxnAmCafCIdM0QWJ7lN62/Y0WDbGzFSWACM0/vVP67ASFI5qUqKeg93Cgasn5OLk/dW1z+7vVLnHPNByq6ijFIlSXnZ1OE4TpGGa6v+5E7EV2MyjBQPygragN24QtqtjN2oxRMnfNuKitXCNpBYZKNNfOfUthZrQtDHpz1VWQDUKHI9vq7f1efMEV2xH34Jrq96ZM+KGmX59CNPQb56WXdv+HpkNibIc3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NhuMGTqAvXkEhjb/p0H6cU2Xb3nrwr1AF+LbZf9ORe4=;
 b=qZNBVA57pGhNyR06UI4Mo7t8EZRQn6WXaGH4KsFV5z4/0om4+BJXh4ReJlumVlcJ0eZUVpRRBrLilAirmeMuLfwUmj3kEMZsUSEq/BFCMPYBK8in5C1pSqUnbDN6V1B6ICWBBx4hp5/ONce/2qYvhzH7cZQDS69i78H7FfkXxmCvlsPtJi1C1YVH5yVJdrgrIKly7IOk9v7dV6fRpuI6V4hL61dl7NlL7aCeN+l6/RemyihNl+LGpdxDgyTvGpB0quyIToYh8c3eMyVqMhaPK8MIPUfTEcaLiyoQdXwImd098jLNrOm6Un2dqGuuUtiq/9QywjXjK/MCQO0KaeVv2Q==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by PN0P287MB1040.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:142::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Tue, 22 Oct
 2024 13:05:18 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c%3]) with mapi id 15.20.8069.027; Tue, 22 Oct 2024
 13:05:18 +0000
Message-ID: <MA0P287MB2822F8833229C771136D0B5AFE4C2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Tue, 22 Oct 2024 21:05:14 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: dts: Replace deprecated snps,nr-gpios property for
 snps,dw-apb-gpio-port devices
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Inochi Amaoto <inochiama@outlook.com>,
 Guo Ren <guoren@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20241022091428.477697-8-u.kleine-koenig@baylibre.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20241022091428.477697-8-u.kleine-koenig@baylibre.com>
X-ClientProxiedBy: SG2PR01CA0127.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::31) To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID: <bc9e899e-4e2e-4d1f-88e2-8409c932447b@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|PN0P287MB1040:EE_
X-MS-Office365-Filtering-Correlation-Id: 05b0174d-9d3a-4fe7-1da3-08dcf29a2d67
X-Microsoft-Antispam: BCL:0;ARA:14566002|19110799003|5072599009|6090799003|8060799006|15080799006|461199028|7092599003|3412199025|440099028;
X-Microsoft-Antispam-Message-Info: RogfhdAG21SkVQ5VU2l9UxY0WHSYXCSwXW7GptCVerLRXIDqQYwp4mpY4hTeRhNKEQ5UkJi4buy/sFhBO0EzVUhqDzEBleJFYYjZcukYo69wpksDW5lxgjh3gI1EK8d/beKZlHfz9UA+vu1Cs/96qtbGjRVRAHt7z8Ud45JeYxwhzdYbzv9G13utx1LDUhDElATaXlG/IRdf1x96NkkS5zHKJ5x5ChYBAfhnjpmzW3zuknZvQ36A48sRRHOxjneOANVd8LH1ck8nSUKJohvxy9omZsHqs2E/o2iPQ5/Oj/bBYd1Mbf/6c1JiaaOuCzcbhoxvwfaM6f3yCZugVHnacfwiqiaCx84eTNpuChty/M9nJFGx/gyp988TqmCyz7EbGvJpguWcnMpkC1HczjizYb92ubXrD7iSJWC77kPOv5NgFGcdJr+KGlJvUNVueHzFJrn+lFgOnv43qmQRep3PW6XvnOlvo8POPYGDRCsgDJcSwVM4Q8vmcQEAJjLVnKtJkofMOlw/L+Hq7Lmyr7wSx+XaRQn5UbK+s+xcmmZJaqASxCQEXVN+UUI3tB/nMTogtQxgkibXeL2Z+KT0jjBwJB2g1qi+CEzpfGP1feLq4Q/hEciESmx8E1RRNxUd1Fu0QSzTaUno6A2MK3HwbZklWADQCObab4BCtHk57F9wcac3uTKrUXAxeoxKjylt/qNlbSvmkS7viPPjKiQdQxDHoj0Y1Xo2gDH4laYNKdFYzg/IRZzBCkzqUKPLXTcEagaufvhpGUPR0n8SqGQ+9sq1LA==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SWJMSEFPRXBjU1JCZkpJeHAvTi9zbi82dzZjU0llMDNsUVFVWHowQSszZk96?=
 =?utf-8?B?cElwV2U2eFlmWWNyNko3cDRUTjBQbjZDVDU3blI0dnZOeHdOV0NBamlIdC9q?=
 =?utf-8?B?WGFDWXJHaFArT1pVVW1McTZNTDFjZzUwSUpNTjNqajUxZ1JKdFlORmRuMjZ4?=
 =?utf-8?B?N2NLT2pLMitEZzhmK0ZoTisvcmc5U3VXSWNUVS9IN2ZVQk13Vkg5cTduc2Z0?=
 =?utf-8?B?aW0vM2xWOUlmRFVDQW1hRGQrU0syNWNHU080ZjJyZDZ3a0NmN1Ntd0h2RjNr?=
 =?utf-8?B?VXhwVE5EdndtbnphbzhyVkFkdm82K1g4YWZZaWR4NnNZa2lSNkhxQzdMMG11?=
 =?utf-8?B?OENrTTRlQVlzYkhSS2ZmWVdodGZyMDFvMzE5QWk0T2pMdExDeloxb3BrVlpD?=
 =?utf-8?B?Nkg1ZmhQZXdxTWtYQkFDamRxdW54SzVLRkZVOHVBamVuQnNHd2FrWlVScVBR?=
 =?utf-8?B?dXkxUmd6Q3lrYmVoaEtzcDdZNGJRQ2dBS0RZRDJBVUxnWHdTWm5tMm8vZ204?=
 =?utf-8?B?NjhFWlltcGdWM2FNSjZHQU5MSmVWbzRTL3hsOVpwemo4KzA0THdCSFhEKzNo?=
 =?utf-8?B?am5zTy9QeFhJeU12c2VOQkhMV3BxY05LUlE0bmd3Qi92NWxoSitqSnlzSDN6?=
 =?utf-8?B?RFF6T1lLMDF0Vm92WWVqOTNMUk9pam9NK2I4cVYweXVuQUVpT3RuYkhTLzFB?=
 =?utf-8?B?MmgvUitwVDlzWGV4ampTTjduaFZLdXhOUld6QWZlU3lBeEk3UTFVYnlLRkxU?=
 =?utf-8?B?cTJ4djQyaFg2dCs2ZytLNk83WEdWVWlDT1E3SmhaZWNBaGMvQUs0QkxSNWFS?=
 =?utf-8?B?T0ZlemRlY1oxZE9TbFpqT1g3cjlaMlc0VGtHSkxCNnpDeDBmbnIwNkFEdmNC?=
 =?utf-8?B?Z2N4SzVuWGN4Q2JHZFcvaWM5VUV3TjVSd3hHMlJlMlFMcXQ5MWF1WGVFN2JJ?=
 =?utf-8?B?Qkk0NzFLVXZDM1YxTENody9GNzJQK3VlMHFRa3ZqeUdielZqcEhjLzJOUHhp?=
 =?utf-8?B?Nk10bnpEdEVmSXlISWxGNlU1d3lEdFpjWTJBQm1VVGx2QTJBQisyZ3ZFeHpm?=
 =?utf-8?B?b0Yyb3NuL29HWW00Z25UMFlUY1ZwbGNXWUlMajVEdlRBLy9leDJMbjlXem9q?=
 =?utf-8?B?NTJreFkzSS9Va2JjZnVPZjVJamFLdzNkSmFSbnA0VXBKbVZ6WFU3SlNFeXo1?=
 =?utf-8?B?VHZmVW45Q3pIdmh1aWdTZDNpSnlZN1J1dW8xNWR5MThaVElPWDR6ODc4N0hK?=
 =?utf-8?B?NmswZ0g0akh0c1BSZSsyTjdDdjh0bXFLSTRsV0lDcVg2Y1lhT2ZGRmlyZHJO?=
 =?utf-8?B?Z0Q5SGU3bHhCbnppbGZ3TTZvSW15SCs5Y2VSOGtlZC9KMU1ENHJuNnpGLytW?=
 =?utf-8?B?T0dzc1c0dnV3OTkyR0V4U2cvbHIrY1k4SGtZM0lMSDZycTV5NVczeE55T3dK?=
 =?utf-8?B?MVB0YnZVUFNqVEhBY0Z3czF2d2xqRDRKMGxwWlBLZ0E0TU1mb0NKS2lIdUd4?=
 =?utf-8?B?ZG9EVm5NQjFqNmp6dktEQXloUTcxTU8vZVVSK1RNQ2MxNE9QcThta0RNTXlO?=
 =?utf-8?B?UDAxSjRDVnlPQ3pQZmJxcXJJWVBhbi9yN01rd25uVWFya01sdWkzQXpTQVhl?=
 =?utf-8?B?YlMvcGZ4VzByZ1o5UHVrUngzZFlWTzdycW9PSW1KdHF5aHBKcXdKUkZ6SkY2?=
 =?utf-8?Q?O6/ycI5L/zslpC1NXcKS?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05b0174d-9d3a-4fe7-1da3-08dcf29a2d67
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2024 13:05:18.2100
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB1040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_060535_155995_E2F35BC2 
X-CRM114-Status: GOOD (  13.23  )
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

Ck9uIDIwMjQvMTAvMjIgMTc6MTQsIFV3ZSBLbGVpbmUtS8O2bmlnIHdyb3RlOgo+IHNucHMsZHct
YXBiLWdwaW8tcG9ydCBpcyBkZXByZWNhdGVkIHNpbmNlIGNvbW1pdCBlZjQyYThkYTNjZjMKPiAo
ImR0LWJpbmRpbmdzOiBncGlvOiBkd2FwYjogQWRkIG5ncGlvcyBwcm9wZXJ0eSBzdXBwb3J0Iiku
IFRoZQo+IHJlc3BlY3RpdmUgZHJpdmVyIHN1cHBvcnRzIHRoaXMgc2luY2UgY29tbWl0IDc1Njk0
ODZkNzlhZSAoImdwaW86IGR3YXBiOgo+IEFkZCBuZ3Bpb3MgRFQtcHJvcGVydHkgc3VwcG9ydCIp
IHdoaWNoIGlzIGluY2x1ZGVkIGluIExpbnV4IHY1LjEwLXJjMS4KPgo+IFRoaXMgY2hhbmdlIHdh
cyBjcmVhdGVkIHVzaW5nCj4KPiAJZ2l0IGdyZXAgLWwgc25wcyxuci1ncGlvcyBhcmNoL3Jpc2N2
L2Jvb3QvZHRzIHwgeGFyZ3MgcGVybCAtcCAtaSAtZSAncy9cYnNucHMsbnItZ3Bpb3NcYi9uZ3Bp
b3MvCj4KPiAuCj4KPiBTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUt
a29lbmlnQGJheWxpYnJlLmNvbT4KClJldmlld2VkLWJ5OiBDaGVuIFdhbmcgPHVuaWNvcm5fd2Fu
Z0BvdXRsb29rLmNvbT4KClRoYW5rcy4KCj4gLS0tCj4gICBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3Nv
cGhnby9zZzIwNDIuZHRzaSB8IDYgKysrLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRp
b25zKCspLCAzIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvYm9vdC9k
dHMvc29waGdvL3NnMjA0Mi5kdHNpIGIvYXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vc2cyMDQy
LmR0c2kKPiBpbmRleCA0ZTVmYTY1OTE2MjMuLmU2MmFjNTFhYzU1YSAxMDA2NDQKPiAtLS0gYS9h
cmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9zZzIwNDIuZHRzaQo+ICsrKyBiL2FyY2gvcmlzY3Yv
Ym9vdC9kdHMvc29waGdvL3NnMjA0Mi5kdHNpCj4gQEAgLTExMiw3ICsxMTIsNyBAQCBwb3J0MGE6
IGdwaW8tY29udHJvbGxlckAwIHsKPiAgIAkJCQljb21wYXRpYmxlID0gInNucHMsZHctYXBiLWdw
aW8tcG9ydCI7Cj4gICAJCQkJZ3Bpby1jb250cm9sbGVyOwo+ICAgCQkJCSNncGlvLWNlbGxzID0g
PDI+Owo+IC0JCQkJc25wcyxuci1ncGlvcyA9IDwzMj47Cj4gKwkJCQluZ3Bpb3MgPSA8MzI+Owo+
ICAgCQkJCXJlZyA9IDwwPjsKPiAgIAkJCQlpbnRlcnJ1cHQtY29udHJvbGxlcjsKPiAgIAkJCQkj
aW50ZXJydXB0LWNlbGxzID0gPDI+Owo+IEBAIC0xMzQsNyArMTM0LDcgQEAgcG9ydDFhOiBncGlv
LWNvbnRyb2xsZXJAMCB7Cj4gICAJCQkJY29tcGF0aWJsZSA9ICJzbnBzLGR3LWFwYi1ncGlvLXBv
cnQiOwo+ICAgCQkJCWdwaW8tY29udHJvbGxlcjsKPiAgIAkJCQkjZ3Bpby1jZWxscyA9IDwyPjsK
PiAtCQkJCXNucHMsbnItZ3Bpb3MgPSA8MzI+Owo+ICsJCQkJbmdwaW9zID0gPDMyPjsKPiAgIAkJ
CQlyZWcgPSA8MD47Cj4gICAJCQkJaW50ZXJydXB0LWNvbnRyb2xsZXI7Cj4gICAJCQkJI2ludGVy
cnVwdC1jZWxscyA9IDwyPjsKPiBAQCAtMTU2LDcgKzE1Niw3IEBAIHBvcnQyYTogZ3Bpby1jb250
cm9sbGVyQDAgewo+ICAgCQkJCWNvbXBhdGlibGUgPSAic25wcyxkdy1hcGItZ3Bpby1wb3J0IjsK
PiAgIAkJCQlncGlvLWNvbnRyb2xsZXI7Cj4gICAJCQkJI2dwaW8tY2VsbHMgPSA8Mj47Cj4gLQkJ
CQlzbnBzLG5yLWdwaW9zID0gPDMyPjsKPiArCQkJCW5ncGlvcyA9IDwzMj47Cj4gICAJCQkJcmVn
ID0gPDA+Owo+ICAgCQkJCWludGVycnVwdC1jb250cm9sbGVyOwo+ICAgCQkJCSNpbnRlcnJ1cHQt
Y2VsbHMgPSA8Mj47Cj4KPiBiYXNlLWNvbW1pdDogNzQzNjMyNGViZDE0NzU5OGY5NDBkZGUxMzM1
Yjc5NzlkYmNjYzMzOQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
