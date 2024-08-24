Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A536C5320E
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Aug 2024 11:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qFkjtdZf4+9GA/UqkImMwcPW8ox1u4YJhBxtzOXATfg=; b=ClLrau+MVLfF2h
	vn6TGmb4m2CYTafsKpvJemMwRbkKS3S0Srget4pbAxTscrefgRrqFFaCx/meooaMX6rHmyA7Kvq5W
	ZyLh8ZGOybvC0k7mhI4uXfhXeYZO/rBzWcZfYb1Vnd3Gom7szwQuAtHAIu6+yUrmBr+nODZcRGFGW
	LSf+scgoGG6v6OGcJi147X7rWb1f89pahyw2WnylBQGiMMvSebs4eN8svUIbk0oLDhFHv36J7BDrt
	XQ2hvjUPZBDRugcuuEQBxxg9P08pPBef5oFmi62In9mYd8Fa9GUmeZsjq5XTn4ouI0QD9wGwoASs9
	5mkXaGLdJo6Jk/jSC9WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shov4-000000027Kz-3G1a;
	Sat, 24 Aug 2024 11:26:58 +0000
Received: from mail-dm6nam04olkn2081d.outbound.protection.outlook.com ([2a01:111:f403:2c09::81d] helo=NAM04-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shov1-000000027KJ-0fOu
	for linux-riscv@lists.infradead.org;
	Sat, 24 Aug 2024 11:26:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=inOZLpNPTF3+6CsJ6w7oW+NE1sEqKL8VMXMgCkJaWrigZd+ZOy5BLZr2U5EC3DeXyom6JgSKjrYFVxRLMS5+Q7TXXSB2hLoZLHoTnguQ7oGZ/HOVpySgUCt/wXBcgbXePiy3TGewgB3wkGn/Xrn2p4ejEFVxpAbJvqaBYGqVmQB4qcLUJBMmOK3G3nQnk4lsNEtQgS5IeIa8Gs65yeLbz+vcZvtdZZrPkxsoAIZ2ONVb6fPRx08KENGaM7KJsFcWS7Z1oQRlOaDGkjR3YSucBhPOlxM1irk7Q9HsYss8iBuug1RWxiGeBkGxUFv5axZ5c54fScnS3iBDjbHdm3ibRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FBLuGQyrA0UiV3q1qvXYkxmO40l1w1qrUJWVC3GFFls=;
 b=seweTF0bU7/0P0A2oChpmDkzbFuxnZU/lyT5JhHviozEDzOvsLIPHZ0NwAG31ouF4/vU9bEclCF3G/vTwvgGpAfYJQU7x7fDDhoNgCJyiXTrz2O58+t4Hg9YLY/1yJOvbpgmOMoH6szYpufMWRT71jXtyuQ305OkXxiR4xZfmFICDOKoDZcW6VrIPPyx7sJZHOGZdtPLoK7mchk4NQ5jw7jmhkM/yGhXuviqdIewVjHlNglOU03KaVGIUBTim99FrmXVWcwHp6E62n7QQEsjlqI+AsQFODM/Gas8bJIY1OWnXI315evLFbxtiHoz38pgeaBIhhCfdhk1K9zRSUy4fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FBLuGQyrA0UiV3q1qvXYkxmO40l1w1qrUJWVC3GFFls=;
 b=RH+rHcQTVIezu4Z/mlXJDumRUkOaDGptTOr7qfr/KI6RhvxGSjONMNUMix6/YhIG+haDWq95dpwtAcISpbfyqzqMrUmmuel6bOhuHeoGhEM3m2JI38pw3kLD2aybDw5CkqhjcYIIH42nYRwPITKZ9v6uBLKPuv0Y4yxRqgVqxRgJfCyXT3b9WfBWLDUOEdUHin9FuDK98W1zy/1qxBM1Jp/KLc+sy0OZng4BrKG2GxAuSrLhLm9MBxnIJnuAT7IUQr8Huy1aUpdYSFGbAHX/R9jrGeaMiQhxJCL3+yxy51KrQsh30GVH65ac5x30w7lYTq6cBlysQHdBFefPa03QJQ==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by DS7PR20MB4623.namprd20.prod.outlook.com (2603:10b6:8:76::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7897.23; Sat, 24 Aug 2024 11:26:47 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%4]) with mapi id 15.20.7897.014; Sat, 24 Aug 2024
 11:26:45 +0000
Date: Sat, 24 Aug 2024 19:25:39 +0800
From: Inochi Amaoto <inochiama@outlook.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
	Inochi Amaoto <inochiama@outlook.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Drew Fustini <dfustini@baylibre.com>, Haylen Chu <heylenay@outlook.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 0/7] riscv: sophgo: Add pinctrl support for CV1800
 series SoC
Message-ID: <IA1PR20MB495368D784BE3F977617BF39BB892@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB4953DC78BB0FE0C57EA94F91BBB32@IA1PR20MB4953.namprd20.prod.outlook.com>
 <CACRpkdbaDW2=R881G9C=r1iW4YNdYpRZ2kHaN63T7EX1A0xVrA@mail.gmail.com>
Content-Disposition: inline
In-Reply-To: <CACRpkdbaDW2=R881G9C=r1iW4YNdYpRZ2kHaN63T7EX1A0xVrA@mail.gmail.com>
X-TMN: [kmkp2C/EmnCmC7Jcgvw1pcjR0fK7SgW9QqOiXh5ATfk=]
X-ClientProxiedBy: OSAPR01CA0263.jpnprd01.prod.outlook.com
 (2603:1096:604:29::35) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <k3xyfjzfslqae44rdsv5dfw3ybfphfzkfkv5vvmtruykxuqbnw@z2c3yqlvtsyx>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|DS7PR20MB4623:EE_
X-MS-Office365-Filtering-Correlation-Id: 19c4338c-d834-4167-b889-08dcc42fa2cb
X-Microsoft-Antispam: BCL:0;ARA:14566002|8060799006|461199028|19110799003|5072599009|15080799006|4302099013|3412199025|440099028|1602099012|1710799026;
X-Microsoft-Antispam-Message-Info: mZ4GQTeAgAJYWgPffbSILmpVEnEghBLryoiyCnFFnFso9zwbHkXwWnvkA6CDhUmfbfHT7NlFcdecSelVzB4jO0hrzIuliM8MpACauDD67AlZf6npxwxPnAIyZQ1dJ+jlwQRhyd+yYpBga1TFClPekHm4nHJJt3um8pTzqbpTbxY0w10RRsSEoVP44ezJW7ANCIbmqDT0Mw0j60qJsNhojlZqt2iePaWfHv6/d8bVnPN0ijl1z83asx0S7OyFWOeFKqCy0Dmcpy93Ds5EQjuU/i03TjnlecHqgzIEYJGvoBK8Yy2/uln2BZ34zbprZYjeKGSfu6Mh39OWxvyr+g/zJ6vgO2nAuMB06NrTd8+YMLMyNoYWBG5nRGQJ7ZO8WygZ5DZSDfhNRwjpG0ulvEjX8+WG1pIQe+dHjgVp9WuZBs8Y8tPrh4llKs2IDQnRz9ZCmdC5xZkQAsEYcZmBIGvC0PWCTR1vl3C0xMWIuJyy4OhSKV13SXbV9jJ537xXqD0bVvQJ2l0NZ2h9M14he4MhkmaD7MtlUDwDuiL00R3qycIKn6zbn7C5JeiJVdPttPvjNUva9+j8/RYc6cB4TPk7WZ4E4BPpiuiv/Yuc/Or2ZzGxwZ1HER0PFZBysbl3eDwvoDEjHCZ+ws8b6jZkSzz0FN0pK4wBwNmf8tV+zQW5Ier+XTunRC58D2wIB2AmbBEvtD4LAhgz7Ntj2jkS78w+DXEFCd/h28Ht+Lhkj6akS9FyXrVyOy6qkyq1qAaIbf2UhxtnI67Z0pC/GMBcq9e13XOxGFbNhOGzIqK3NygKX29Txt3ZJXjn3eIuzzrZIiq4lvTHkYbqYuZ3ctEpINgShjneb6D7HwbLZiQMxjNfO1o=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c0JZT0pIOGZkYkxoeFBBSVlMQ3lKdmFCS08vWVN5TnZFTmZEQXhFYUxHcEd5?=
 =?utf-8?B?aTJtZ1Y5TXJjZWkwOVhiY3lmbDFidmplbXpVMWwrRGVjWGcwRWhCUFVrZ3FB?=
 =?utf-8?B?SkdSOEhId1EzWVF1R1N0WnczVzNMQWlCelFLRTdPMkpVM3NYRmFKZ2t1dE1x?=
 =?utf-8?B?dExva2JDV0J0NWZjVkpVZFNPNHFBQVdOZHhPRXI5bXE5UVJoRkRmeDdYUG9H?=
 =?utf-8?B?Y1lMTEJDT1duMURtd0ZYb2xraWNlenJWRTV3UnBBM1lpSEcvMjBZOE5uNHkr?=
 =?utf-8?B?UEJYcVAweitiSC9yTk1aVTEybmpkdnU1N2JvZXVUNVJaTTZKeURiWmZlM3lZ?=
 =?utf-8?B?dCtxMy96ajAwUjBBb2NJMVlHUUNJb3R2VGhqeTFPSDFrZm5jcVd0RTBQdFlv?=
 =?utf-8?B?T0dTaW1GTnVUcWJzRFFySnhpZDZmQjUxYVNVSjJoWTFLaG0zczRoQnA1Q2Qr?=
 =?utf-8?B?MWpseFBJOTI0ZDNpM0NFbnBBVTBQMzExc0dXekkzemxGYmk2Mi9XOW1Rd1FJ?=
 =?utf-8?B?VTJ0NWg5dVA5RkIxK1JJTW5KazBoVFczRjdmR0NjUWY5YTByUzZrbE1LVEwz?=
 =?utf-8?B?OFhnTFprT0tCQVFMUU41SkI2QmhUR0RYVXZjaEJFdFF4UW1DVHpmczZIc213?=
 =?utf-8?B?TlRVVUdpVXZnNUNia0FmSHlpRi9yRWNRYkZkSlpsZzlFRkE3SVhIZEEwdjJ6?=
 =?utf-8?B?eTByVTFRRDZFcVdNNGNNNzVyb01SNHRkbFBsdEEwakF3MWE5ejJ6U1FrSklx?=
 =?utf-8?B?RVRqQTBVWVpVY3lxRVg0R3BmRnBVMGF3bDdvZkxpeVozNUJBcHkreFErc21B?=
 =?utf-8?B?MGkzSnArZlBqcGZtajFPZEdGRWJWQ3RIQVBuNFRHekIrK3lzcFNYZldIY284?=
 =?utf-8?B?a2ZTaWNMdVZjekMyT2Jia0J1YU1xZ0g3RkgxM1NWdExNMWNqV3hDa01xRFdK?=
 =?utf-8?B?TnlFdzhPbkNSL25Qa2UrUEdIcTdzMCtJT1ErZG1zcEt2N1FDQitWcm9McTcz?=
 =?utf-8?B?Qml4czFvY0ZpS2drdFMyWithN3Jtb0FYbWNnVVpzeS9aUUtRYnJwWmFjdzVG?=
 =?utf-8?B?Z1RYYk9xMjNyYXJ6M3lQNjlRU1NDd1RwcVJnVEVXdlRUTW1MUkRmUWZSUkRt?=
 =?utf-8?B?V2xST2drdDllUlNGWnJBUDNCUXdwYXFxelNsaStPbkxKTkVKaDYxS0RJVnpq?=
 =?utf-8?B?RDJ3VWRvemk5MGVIZmNFb1JObWdtajFkSS8wTDkzVERPemx6K21nNGJIdTFX?=
 =?utf-8?B?Q1BlMlNMSmNta3VvcUVNTFJBTEVvZXNLdS90ZWFzZWlidTBCbGp5cUNJcXVm?=
 =?utf-8?B?UVpDNTdONXhOSzRxMk95SFp0YzlWenNzNW1LQkJwSE4zQVdhL0x6b0J6ejlX?=
 =?utf-8?B?ZVo1cXFONGU5Tm4yRnVwVkwxc1JmdFFJd3orRDFKaXJ6MmwxWk8rNVpaMkFj?=
 =?utf-8?B?ZExNVGdhTlJqYUw0Nnp0b1dJVTF0bDZiMnZBa2M4TXZQbldHZ2licm91S0lw?=
 =?utf-8?B?dllweGxJd01IR2dWcHdsTXhiM3ZiemU3dXBVcFdMbkJaaHhLYVliMGtXUlBY?=
 =?utf-8?B?bWxNOE1aeDhzbW0zMnVnejFIZ2JwNnZLWGhORlFJTUJCOVBTQ3BJeExJayty?=
 =?utf-8?B?VWxwcnJESmtVZVY4c0thWHZVYVdSc2JYc1J6U2FXYnVHV1gyekp1MkJ4Y0Rv?=
 =?utf-8?Q?JysRYOyPMW/GvXv/IqH8?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19c4338c-d834-4167-b889-08dcc42fa2cb
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2024 11:26:45.6147
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR20MB4623
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240824_042655_241472_85C57EDE 
X-CRM114-Status: GOOD (  19.11  )
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

T24gRnJpLCBBdWcgMjMsIDIwMjQgYXQgMDU6NDQ6MTdQTSBHTVQsIExpbnVzIFdhbGxlaWogd3Jv
dGU6Cj4gT24gRnJpLCBBdWcgMiwgMjAyNCBhdCAyOjM04oCvQU0gSW5vY2hpIEFtYW90byA8aW5v
Y2hpYW1hQG91dGxvb2suY29tPiB3cm90ZToKPiAKPiA+IEFkZCBiYXNpYyBwaW5jdHJsIGRyaXZl
ciBmb3IgU29waGdvIENWMTgwMCBzZXJpZXMgU29Dcy4KPiA+IFRoaXMgcGF0Y2ggc2VyaWVzIGFp
bXMgdG8gcmVwbGFjZSB0aGUgcHJldmlvdXMgcGF0Y2ggZnJvbSBKaXNoZW5nIFsxXS4KPiA+IFNp
bmNlIHRoZSBwaW5jdHJsIG9mIGN2MTgwMCBoYXMgbmVzdGVkIG11eCBhbmQgaXRzIHBpbiBkZWZp
bmluYXRpb24KPiA+IGlzIGRpc2NyZXRlLCBpdCBpcyBub3Qgc3VpdGFibGUgdG8gdXNlICJwaW5j
dHJsLXNpbmdsZSIgdG8gY292ZXIgdGhlCj4gPiBwaW5jdHJsIGRldmljZS4KPiA+Cj4gPiBUaGlz
IHBhdGNoIHJlcXVpcmUgYW5vdGhlciBwYXRjaCBbMl0gdGhhdCBwcm92aWRlcyBzdGFuZGFyZCBh
dHRyaWJ1dGUKPiA+ICJpbnB1dC1zY2htaXR0LW1pY3Jvdm9sdCIKPiA+Cj4gPiBOb3RlOiBBcyBj
dXJyZW50IGRvY3VtZW50YXRpb24gaXMgbm90IGVub3VnaCB0byBndWVzcyB0aGUgcGluCj4gPiBj
b25maWd1cmF0aW9uIG9mIEh1YXNoYW4gUGksIG9ubHkgdGhlIHBpbmN0cmwgbm9kZSBpcyBhZGRl
ZC4KPiA+Cj4gPiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvMjAyMzEx
MTMwMDU3MDIuMjQ2Ny0xLWpzemhhbmdAa2VybmVsLm9yZy8KPiA+IFsyXSBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9hbGwvSUExUFIyME1CNDk1MzQ2MjQ2MjQ1MDc0MjM0RDMzN0E2QkJBQzJASUEx
UFIyME1CNDk1My5uYW1wcmQyMC5wcm9kLm91dGxvb2suY29tLwo+ID4KPiA+IENoYW5nZWQgZnJv
bSB2MzoKPiA+IDEuIGJpbmRpbmc6IGRyb3AgdW5uZWNlc3NhcnkgdHlwZQo+ID4gMi4gYmluZGlu
ZzogdXNlIHJpZ2h0IHJlZiBmb3IgcGluIG5vZGUuCj4gPiAzLiBiaW5kaW5nOiByZW1vdmUgbWl4
ZWQgc3BhY2VzIGFuZCB0YWJzLgo+IAo+IFRoaXMgdjQgbG9va3MgZ29vZCB0byBtZSBhbmQgaGFz
IG5lY2Vzc2FyeSBBQ0tzLgo+IAo+IEl0IGNvbnRhaW5zIGRldmljZSB0cmVlIHBhdGNoZXMgd2hp
Y2ggSSBhbSBpY2t5IHRvIG1lcmdlIGJ1dAo+IEkgY2FuIG1lcmdlIHRoZSByZXN0IGFuZCBnaXZl
IHlvdSBhbiBpbW11dGFibGUgYnJhbmNoIGluIHRoZQo+IHBpbmN0cmwgdHJlZSB0aGF0IHRoZSBB
Uk0gU29DIG1haW50YWluZXJzIGNhbiBwdWxsIGluIHRvCj4gbWVyZ2UgdGhlIGRldmljZSB0cmVl
cywgZG9lcyB0aGlzIHdvcmsgZm9yIHlvdT8KPiAKPiBZb3VycywKPiBMaW51cyBXYWxsZWlqCgpI
aSwgTGludXMKCkl0IGlzIE9LIGZvciBtZSwgVGhhbmtzIGZvciB0YWtpbmcgaXQuCgpSZWdhcmQs
Cklub2NoaQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
