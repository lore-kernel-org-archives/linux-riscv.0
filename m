Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95920CE79AB
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 08:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v9mS/azr2lZQQE9Fei3cLvDLfj1KOJhzGNJnOrSwVBM=; b=qNVfOqBaytlR8+ay2O8K/rY3R1
	fpckeb7g3ydM31aJniXlWOcF9cXBVOhkA1aDQUCyudh8VoExG1r1vzv1VoIrauy090bO6PkyfyDT8
	GWwosXHodjIh/Ule6JxoglZHS9CwfvYVO0y2ZaLaxHnfGr/tcb5dWtum1wESRV7kPRfoM0qIRE6Y1
	T+T/2Dz27mQPU4WJXTKH1JPR3Tk8FbQgY51kl5xDq7w61LhNkxY9kwonm8mnoMDBlTEGUa5D8k1Ij
	qccIw02iidzDUB8W+xyUiFL1tPD5eaJL+59EMuUrpYlFtOOjmURgTgQ5JcZrVdYzQgNeA3pauRdNy
	+DVSBpUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qisTW-002GcE-2H;
	Wed, 20 Sep 2023 08:22:22 +0000
Received: from mail-maxind01olkn20803.outbound.protection.outlook.com ([2a01:111:f403:700f::803] helo=IND01-MAX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qisTU-002Gap-1R
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 08:22:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RIp4hNFVs6wev7tHOHDskj0fySsxhslq8dHpEOuTysfL7DXpfTflDJLxYQBc8uth47Vjzh4FEKD0Tv3nMbsJcKrtgD3HDSLYmJwxkwCvPdBYPefIzEnmSjecqPkwd/niePe5NUpCFiEoAvMEuSLMgP3HhXtfSbyrSAsXgaxeUzcm2mTRCphP+D93BVMD9+bIYfUFWcjRRreqFXb669R8DT+YSBIxc2hT7rN+CPZwJidXRUoS5Nt2/tx5RYMLr29+f7SiHtJQQm9Lx64St+c3sRgwUXAjAvvaL+taoPtdl++7NrSTxgdS9rQQ1VfKvfCd2NJQTD3rTV8+ixOFx73Z2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uwh6beZ0vfKKt1GDsnkJxAdAyCZe50c8EWO/0QUE6yE=;
 b=AIToCDbi7yUUWWqAczOE97MghwG6zp9yfYx7SXv88Y8BTfiRQgxCwuFDGc5kyIIunfaik1Kaio2JyauXIQONGryrr4QYWSf3bnTB/DHfwQscrz2g1Sa4eQW5638IL4KV9BsxAV14+pJZqUNFuQKCdsUrf52NlgN57THcEOgEVTMZk77ym8gjSWdH9lXtIEBDTX9Wp3u6+Se3svCyLZRPnsI+OrGumKLzJaP5UTFQAEYgsqlN6tLz4DapQyH4A1AH1Bg0Ugg6rbeQ79xF67CIDl/O5PnoYhuKp3KSFU0FZoYAaY6Q/Jgv6Mhq5Ah9vybWJlN5eSk1Nfr0XHu+VsDdkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uwh6beZ0vfKKt1GDsnkJxAdAyCZe50c8EWO/0QUE6yE=;
 b=dXoaqiJZAvMm/iryx1a2gmHx6i84/jbQZa9gzQu5dT/BYiDPlkqLP1/cgvIitXF7aCqIKKZ4QtYoILrwTqWW7nImZtg8taKvFYOvWr08F0oQj/rgaYJtBHDvMF/OfaohR8ubXnZQNl0eQdYa5WitGkP9qnMwPhOXgSQeRl5aP//eLj+ctgO+LlNbgmD5eZnIK2VwuIZ84GNtKqRoU0otwMXbY0U1R3hSPIi7D9mSz5v4WWn/RSJ/SLjO4eyOIes5g2gqbAWi17Yhq3K+stZMczbKf9f3MSQRlSe6tdJGeeeC5n1+eNjkgPizFTD2Xdr5fv8Ndk/TdFNHonj8gkk9lQ==
Received: from MA0P287MB0332.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:ab::5) by
 PN0P287MB1762.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:188::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6792.26; Wed, 20 Sep 2023 08:06:09 +0000
Received: from MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
 ([fe80::efe9:8d54:281b:23f7]) by MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
 ([fe80::efe9:8d54:281b:23f7%3]) with mapi id 15.20.6813.018; Wed, 20 Sep 2023
 08:06:09 +0000
Message-ID: <MA0P287MB03320173BB92D2C54FD659A7FEF9A@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
Date: Wed, 20 Sep 2023 16:05:48 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/11] serial: 8250_dw: Add Sophgo SG2042 support
To: Guo Ren <guoren@kernel.org>, Chen Wang <unicornxw@gmail.com>
Cc: aou@eecs.berkeley.edu, chao.wei@sophgo.com, conor@kernel.org,
 devicetree@vger.kernel.org, emil.renner.berthing@canonical.com,
 jszhang@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com, paul.walmsley@sifive.com, robh+dt@kernel.org,
 xiaoguang.xing@sophgo.com, Chen Wang <wangchen20@iscas.ac.cn>
References: <cover.1695189879.git.wangchen20@iscas.ac.cn>
 <888d57a2d5e62affb8e29e0098402e428facd969.1695189879.git.wangchen20@iscas.ac.cn>
 <CAJF2gTR7xzGvQeewuhRLHE2yjH8zeDMj4qfE4_W-yb71-Zx6Zg@mail.gmail.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <CAJF2gTR7xzGvQeewuhRLHE2yjH8zeDMj4qfE4_W-yb71-Zx6Zg@mail.gmail.com>
X-TMN: [VS56gddIBcbXUl6rq7ErTcSoMp+Tzily]
X-ClientProxiedBy: SI2PR02CA0018.apcprd02.prod.outlook.com
 (2603:1096:4:194::18) To MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:ab::5)
X-Microsoft-Original-Message-ID: <725586a0-cf65-4fd3-ae15-0d25f096ae1b@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB0332:EE_|PN0P287MB1762:EE_
X-MS-Office365-Filtering-Correlation-Id: 4986e25d-2017-43a3-076a-08dbb9b07286
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +Eg3YBkEkzogZggDEbFtiQC+vxk7kKT7DnJZzPgBQmunY43VUbVkAr9nxc9sE7NhK6J01LEFy/OSps9swy77Ereya5sQQ9DesR9cEGGZkubp1HFtfNnP2VEoDLgRmHs6zCU1RMDdOVA1H9SxTKuhsOR4S1KgVRAsjBalo/nGtHP+KY7ooLncy30X2S2U4ddH+zIHtSKJilZjLyo43mKW94WRqhNVF2WMaMGxHHoTanJG8NMnl8fJ04+2MJNqY6c30lQn8vu32nTeCVPnS7nN552+o8yiAHkY+TUumjmoFJacXTL3ByjIYAWeEFz9b+Ug6AKnfN/zr8bT6tO+8sc73VkjM47PzNh2XcrWq8yxQJ05tAmcOP6RUGs82L2rkfHtNLiKFr7b3CL9dpfIUn54Io0KAcTW60Z/BIBlZJL2ZWoLHY7koTJF1h0Js4g07yAJtI+0P8NEx9wt2c0n7UBfhiZzeHMwSRsdeJI5EUg3uJLaLtm3evmuzg4X6W5QXKJ3EIaElZyZFNttyz0/78pE/3FIPFvc5z/PDzDOTQJThOEhp6n9E5mbgELl5r35MiE+
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a1JTNUlwcVhKNlpxejNNU1hZb0ZMMXhKaHNVbDFCa1M1YTNmc2VXMGluVVpj?=
 =?utf-8?B?a1VPTk9tS2NraXZoRGdYNVRSQ0JGV0sxblJMRTI3dXFZTHlhMjdQa0E3Slhq?=
 =?utf-8?B?RFgxS2ZmVG9uOXhaeXBTL29UMjdmNURVTzVhdW53cW9xemdrYzYrY1UvTS9Y?=
 =?utf-8?B?WmVOSElqM1M0Tlg5RFFxSVRXcENyVzluUzNaekhYbUJxSnNmU25qWDl2N21B?=
 =?utf-8?B?RG5waGxKekFVUGUzcmw0bThvcVNVL0RiVkI1N3J2eTUxbjBXOWVKbktTTGl3?=
 =?utf-8?B?bGdZNUROYVhzZngvMk5acWJnUkx2QzNnd0FFaXBLNlB0WURzUFZZaFZmSEtZ?=
 =?utf-8?B?aEdpNzh0aDBqS0FzMHVKMHczbmhBNDNMenN5TnAwYnlteFpVUmZ1bFZkVExy?=
 =?utf-8?B?R2xxL1daRzhrOU9TaEhsc0pTQ1FicmUzSk41SjVvcFpiRDZJRjUyRCswQzRa?=
 =?utf-8?B?UEY4M0F1b0ZpbGx6bWZGVGsxYXUvZlk3UDdnalFZTTI5SHJtamk2b0ptbk5R?=
 =?utf-8?B?b2VYbzdEeENmS2Q4d1MrY3FHazhZWGREQ1Vja2Y4RjdzeEJyZWFkQ1NSQ0V6?=
 =?utf-8?B?UkJnMGIzeEwwaTVSSGNYMmhoa3l0Z3ByU0htVzh1eHZ4UkpwR3VIeXpML3RY?=
 =?utf-8?B?MXl5bWl1WmVlbTNpZ295d3RqUE14UE1TT1RnYldyRmcrd2trNUNOUWphZUFI?=
 =?utf-8?B?aDJQMTJHWDA2RTlrdkNqK2g3amlNRUZpR2x0T01MUGdsa2poTWxqTXFnVTJl?=
 =?utf-8?B?b1JsdjRMUXZCS3JqSTVNay9JL3haRXV0QW9hbnozRWNrQmhrRno0eFRDdXJ5?=
 =?utf-8?B?QnJsUmVheEo1TEh4ZndLQkUvMW1zRGRCWFU3MWNDVVE0MVRuMWZzcG55L0dN?=
 =?utf-8?B?ZjZHN0RJcHl3VGRuK1ZmTjh0Rm9JcTZ3WEFNNXYyWkxHRHJPMzZyTEN6eWhv?=
 =?utf-8?B?dURwZFNhVThTaHZzWS9sU2JWd3VrU1o5Z3JzMXRUanVJUWFMbkY2S0hmcUUz?=
 =?utf-8?B?VXl3WjRrOFBxVWEzTkw2SU9DTUhYSzNpRTBHemNDVVljUmYwOVhURndCZmdS?=
 =?utf-8?B?aTRSVTZPSmFBMk5FcDhJaUpYR29yOUs4ZFJuaHBHTWJZVjF2L3FHMzhhcjE0?=
 =?utf-8?B?U0h4Rlk5K1RXTm9iMm96cjBJamRHZGhyTmNHSW1hdldVdWQyeHNmcEtoM2Qv?=
 =?utf-8?B?UVFuZW9TMzQ3Skh0TEtXSlZFR0h1K3hvZFU4ckhMKzBhQUpLSGF1UnlnVEQ1?=
 =?utf-8?B?Z2lCZkI2QSs4TnhBQUREZjhrWEpqZVJzOVVNQjFLZDZ4eTVhQ3ZEcU4xQ3h0?=
 =?utf-8?B?SjRraDI3aTFGZ1pEUlgzV3ZEa0Y0eGdWSDFHWGE1c2VpZHBzeWQyS0hNeFEw?=
 =?utf-8?B?N3pBS28ySUVETzJWOEY0VTlha0FCRzdZeUJZUm1VL1NiejJGaDRXRmVpeGVZ?=
 =?utf-8?B?dEwrdjk0SEVRaWFoZlBkeHVVRGV3NVhzS3dwY2pLZCtDU2JJcjZDKzh4ZE9n?=
 =?utf-8?B?OTdYK1JhSXpILzNDVUZtWmtWb1ZrR01abGM1Vm9GSmhocU9sVnNtYmtQRW1T?=
 =?utf-8?B?ejYzTDlCa3F3ajNsTkkxTzczYll2aWdlZERrTjkvL240YlBVTHFOWGJ0OUdv?=
 =?utf-8?Q?v61eLJmnXR/z6JaH/q2Z3gLGYq7/X3hYY+63ewA2A8cY=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4986e25d-2017-43a3-076a-08dbb9b07286
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 08:06:09.3887
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB1762
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_012220_496373_52BAA573 
X-CRM114-Status: GOOD (  14.11  )
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

UmVuLCB0aGFua3MgZm9yIHlvdXIgcmV2aWV3LgoKc2cyMDQyIGFuZCBqaDcxMDAgdXNlIHRoZSBz
YW1lIHVhcnQgZHJpdmVyIGFuZCB3ZSBoZXJlIGp1c3Qgd2FudCB0byByZXVzZSB0aGUgbG9naWMg
ZnJvbSBqaDcxMDAuCldlIGRvbid0IHRvdWNoIGpoNzEwMCBzdHVmZiwgd2UganVzdCByZW5hbWUg
ImR3ODI1MF9zdGFyZml2ZV9qaDcxMDBfZGF0YSIgIHRvICJkdzgyNTBfc2tpcF9zZXRfcmF0ZV9k
YXRhIiBhbmQgbWFrZSBpdCBhIGNvbW1vbiBkYXRhIGZvciBib3RoIHNnMjA0MiBhbmQgamg3MTAw
LgoK5ZyoIDIwMjMvOS8yMCAxNTo1MywgR3VvIFJlbiDlhpnpgZM6Cj4gT24gV2VkLCBTZXAgMjAs
IDIwMjMgYXQgMjo0MOKAr1BNIENoZW4gV2FuZyA8dW5pY29ybnh3QGdtYWlsLmNvbT4gd3JvdGU6
Cj4+IEZyb206IEVtaWwgUmVubmVyIEJlcnRoaW5nIDxlbWlsLnJlbm5lci5iZXJ0aGluZ0BjYW5v
bmljYWwuY29tPgo+Pgo+PiBBZGQgcXVpcmsgdG8gc2tpcCBzZXR0aW5nIHRoZSBpbnB1dCBjbG9j
ayByYXRlIGZvciB0aGUgdWFydHMgb24gdGhlCj4+IFNvcGhnbyBTRzIwNDIgU29DIHNpbWlsYXIg
dG8gdGhlIFN0YXJGaXZlIEpINzEwMC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogRW1pbCBSZW5uZXIg
QmVydGhpbmcgPGVtaWwucmVubmVyLmJlcnRoaW5nQGNhbm9uaWNhbC5jb20+Cj4+IFNpZ25lZC1v
ZmYtYnk6IENoZW4gV2FuZyA8d2FuZ2NoZW4yMEBpc2Nhcy5hYy5jbj4KPj4gLS0tCj4+ICAgZHJp
dmVycy90dHkvc2VyaWFsLzgyNTAvODI1MF9kdy5jIHwgNSArKystLQo+PiAgIDEgZmlsZSBjaGFu
Z2VkLCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL3R0eS9zZXJpYWwvODI1MC84MjUwX2R3LmMgYi9kcml2ZXJzL3R0eS9zZXJpYWwvODI1
MC84MjUwX2R3LmMKPj4gaW5kZXggZjRjYWZjYTFhN2RhLi42YzM0NDg3N2EwN2YgMTAwNjQ0Cj4+
IC0tLSBhL2RyaXZlcnMvdHR5L3NlcmlhbC84MjUwLzgyNTBfZHcuYwo+PiArKysgYi9kcml2ZXJz
L3R0eS9zZXJpYWwvODI1MC84MjUwX2R3LmMKPj4gQEAgLTc3MCw3ICs3NzAsNyBAQCBzdGF0aWMg
Y29uc3Qgc3RydWN0IGR3ODI1MF9wbGF0Zm9ybV9kYXRhIGR3ODI1MF9yZW5lc2FzX3J6bjFfZGF0
YSA9IHsKPj4gICAgICAgICAgLnF1aXJrcyA9IERXX1VBUlRfUVVJUktfSVNfRE1BX0ZDLAo+PiAg
IH07Cj4+Cj4+IC1zdGF0aWMgY29uc3Qgc3RydWN0IGR3ODI1MF9wbGF0Zm9ybV9kYXRhIGR3ODI1
MF9zdGFyZml2ZV9qaDcxMDBfZGF0YSA9IHsKPj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZHc4MjUw
X3BsYXRmb3JtX2RhdGEgZHc4MjUwX3NraXBfc2V0X3JhdGVfZGF0YSA9IHsKPj4gICAgICAgICAg
LnVzcl9yZWcgPSBEV19VQVJUX1VTUiwKPj4gICAgICAgICAgLnF1aXJrcyA9IERXX1VBUlRfUVVJ
UktfU0tJUF9TRVRfUkFURSwKPj4gICB9Owo+PiBAQCAtNzgwLDcgKzc4MCw4IEBAIHN0YXRpYyBj
b25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIGR3ODI1MF9vZl9tYXRjaFtdID0gewo+PiAgICAgICAg
ICB7IC5jb21wYXRpYmxlID0gImNhdml1bSxvY3Rlb24tMzg2MC11YXJ0IiwgLmRhdGEgPSAmZHc4
MjUwX29jdGVvbl8zODYwX2RhdGEgfSwKPj4gICAgICAgICAgeyAuY29tcGF0aWJsZSA9ICJtYXJ2
ZWxsLGFybWFkYS0zOHgtdWFydCIsIC5kYXRhID0gJmR3ODI1MF9hcm1hZGFfMzh4X2RhdGEgfSwK
Pj4gICAgICAgICAgeyAuY29tcGF0aWJsZSA9ICJyZW5lc2FzLHJ6bjEtdWFydCIsIC5kYXRhID0g
JmR3ODI1MF9yZW5lc2FzX3J6bjFfZGF0YSB9LAo+PiAtICAgICAgIHsgLmNvbXBhdGlibGUgPSAi
c3RhcmZpdmUsamg3MTAwLXVhcnQiLCAuZGF0YSA9ICZkdzgyNTBfc3RhcmZpdmVfamg3MTAwX2Rh
dGEgfSwKPj4gKyAgICAgICB7IC5jb21wYXRpYmxlID0gInNvcGhnbyxzZzIwNDItdWFydCIsIC5k
YXRhID0gJmR3ODI1MF9za2lwX3NldF9yYXRlX2RhdGEgfSwKPj4gKyAgICAgICB7IC5jb21wYXRp
YmxlID0gInN0YXJmaXZlLGpoNzEwMC11YXJ0IiwgLmRhdGEgPSAmZHc4MjUwX3NraXBfc2V0X3Jh
dGVfZGF0YSB9LAo+IFdoeSBzaGFsbCB3ZSB0b3VjaCB0aGUgamg3MTAwIHN0dWZmIGluIHRoaXMg
cGF0Y2g/Cj4KPj4gICAgICAgICAgeyAvKiBTZW50aW5lbCAqLyB9Cj4+ICAgfTsKPj4gICBNT0RV
TEVfREVWSUNFX1RBQkxFKG9mLCBkdzgyNTBfb2ZfbWF0Y2gpOwo+PiAtLQo+PiAyLjI1LjEKPj4K
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
