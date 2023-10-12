Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A85ECCDB47E
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Oct 2023 11:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nPbpkh5Cvz3UD0DNX7mQzVbffqwoojzS2OyFVLEJjFc=; b=HPjcqbPE1+D6ONfrp1fG84PeUQ
	DfElDrdRLmDms6+0x5Ar9hYY+ok04wcndsSSNPfWl/uQ1fxFjEbSVvPcyXRKv4NFxWRy/xlSKdgwF
	+F3S5SeS/JtGd2UulOqh9v4t1tJlt2UcY+QkVdBSivdRWOJzNM+YLUuIkJLVfg4LJw0YYABHmn0Ka
	7pdScN3ONFZhL5NNLIROTLQAm8qAuDOcXVJFm4eOu+UngUdzVqkLdySoeULuVH8r2svr5xO7iIxWr
	uqJseV+m9uimaqW92APBftVNF+PE2wDvupXgMnELRVZgGU44bMKkChkQ9/89qmep5rVpqjqlexUyj
	acoQv7cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqtRm-000iwB-1w;
	Thu, 12 Oct 2023 11:01:42 +0000
Received: from mail-bmxind01olkn2080f.outbound.protection.outlook.com ([2a01:111:f403:7011::80f] helo=IND01-BMX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqtRk-000ivl-0r
	for linux-riscv@lists.infradead.org;
	Thu, 12 Oct 2023 11:01:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JZXvHqoAb/IwM+m8dnPSwkbq+sgrD2utMX5sFSO6HCPHyTJZAQWgPW/pP2FQ/EK18Sl3f9uCapKvWObMUeP2mClgGBgZtEiuItdFPpQsbTVZJeMoZdI1G9rXgJXssLOK9G49idBijAQ7vR1jx5M1nDg30S7mYGw8TGo9uyQ2Zf0QA/F4z3NgN5BwbnVFjCaFUyClN8GLKUnZ2DkquTKIr4S3+4GrqIp3rhEaYcrmJVjAZnmx+mFoG4qFmS24MlKDdhanf/iFoxxUgBDsWxjRnOlDdMcTZgDdkfOkHA8ry8Uo1X5tzRjsg4T0/4Oq8BFDeDj7362JopFZUZ5nVSq2cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tpJoUGUd6x+Ych9wRM/uPeZlbQX5FHuBXZEtLbZhPyk=;
 b=aQ0SVPeLsKEIbLRUxjFXmRF8ICgN1XS4qFmqwBLFj8xV0K8wxpHvjCfFJkKOk6kPNKn2r/02ayImDpvslAcmnbAb9vLsIWVi9saKOhIAvP/JZvsmKZdQKAvUUz2FBXMojpnzTFTQ/Kei+BglbGhA7XCDABwrILtB3mswvRZyhTfoi9AqvYESQrv2bSx9MZPZbs6hOz8a5sXQPShQEUYjzPRG9Y11xiJYaWgjGqqwfAi6URVjjzxjw1UFN+1P7KTKYlHpKqqqrmEhuPIsz1Nu3YpsDzJwIF710XLlb5S78wXAyrZlkRBLovqSjPJh91CrIFhb5lR980hG+qHlY/QZug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tpJoUGUd6x+Ych9wRM/uPeZlbQX5FHuBXZEtLbZhPyk=;
 b=Vi1oWOYORwCrDUl/yBkb0Cmp3qnrViyzG9/KJ0AlmT4d5215Yn8H8pKm8MA/+FWqTvJUdPlwtZXIfwg1zRwbYBxiAFuHvu9XN4z8GDxn5yr6pFqppVzCqYdRVgHfHbZ+jiul1zwluKQWEkMibfKrZ8O6FlcUd0NJhCRArzvWZpANZ77c03u0WV1kKGZDyuc1H21NN8cEBFSPZTRTwq4y93CVw0u7Qvo9vYolQ9I+bstjsuinZWkaIgTEUk76SqvJLcHN9hQEqH7A9fqT/yW9Csw/qd+udilyurApApI3xKyz4vIpvZchFDRiZJ/opKNIjNRXoxRKALKOgHh+TxRzWA==
Received: from MA0P287MB0332.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:ab::5) by
 PN3P287MB1071.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:178::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.45; Thu, 12 Oct 2023 10:46:51 +0000
Received: from MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
 ([fe80::efe9:8d54:281b:23f7]) by MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
 ([fe80::efe9:8d54:281b:23f7%3]) with mapi id 15.20.6863.043; Thu, 12 Oct 2023
 10:46:51 +0000
Message-ID: <MA0P287MB0332A5A99911CC90948CDF44FED3A@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
Date: Thu, 12 Oct 2023 18:46:45 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] riscv: dts: sophgo: Separate common devices from
 cv1800b soc
To: Inochi Amaoto <inochiama@outlook.com>, Chao Wei <chao.wei@sophgo.com>,
 Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jisheng Zhang <jszhang@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <IA1PR20MB49531C1C34C3E972DBBA4151BBCEA@IA1PR20MB4953.namprd20.prod.outlook.com>
 <20231009112642.477337-1-inochiama@outlook.com>
 <IA1PR20MB49532560A3CA2670A0EAB846BBCEA@IA1PR20MB4953.namprd20.prod.outlook.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <IA1PR20MB49532560A3CA2670A0EAB846BBCEA@IA1PR20MB4953.namprd20.prod.outlook.com>
X-TMN: [5B6K+2bwd/fpWzi7UBnG1bSZT7iFNQ41]
X-ClientProxiedBy: SI1PR02CA0057.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::10) To MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:ab::5)
X-Microsoft-Original-Message-ID: <d2d5d921-8392-4e9c-aef6-3d73fc45f092@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB0332:EE_|PN3P287MB1071:EE_
X-MS-Office365-Filtering-Correlation-Id: 4dfee05e-c9a1-4838-3a07-08dbcb1089fb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8RfgYfIY3AZ3lQ8qU14rUrEonhEFoIJDaueIY3Gk9XHgRSIkXOlJdUu6ZvWMc8k3oynX8iRQIVYcj6Su4EsDemmnC0WSXXFOXwA9pgDmLDdBFisA6iypUj7O5a1204v8E583+MpEd6nfSKMLQcUtQwX8YXMnca3e6nuVP6YahMGdwAHNoW5Eyi0mRSLCt6HfchXmZNIxOUCUlW3qDNGSb5fBuIZtHuHKOywvlXQhzL2NPxgQwHtWvgsGTeffL+YRuM/NIi7Tw0mSe8lnJVELQrzL0+ZarIge5UKbL6gwA5HPTIvJEaVSNyZxaK3C792fCT9YdoESgRvtixARhnIygFNDr1a1uHy+CCGdiMywApwzbbIUEB4En1NFxSCdmdOO04/bf+RzE8rawl58rw6GJGF+1y7QTAm2j2f9tSQCUD070lRidxHbsg3cd8s4RqYAUdourNEf8HsK2TbYoYk+hSSkxq5P/dppU5DpwCtX91LkwNV/Bb9RywJN++DbMNB8m5PJi2/ZJX6GElAj1CmsiJWkYRrO2E/BpFmkI+nkG9+ap3EzRZU9H0JxeW7VJbma
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WVlRbXZaa1NFT2FxRWtIcERqeWtLR2V3OUVSOGZUZmhiZW5zNm1RR3J1TWxQ?=
 =?utf-8?B?T1d3Q1ZsU1Y2UkNpc3VvclFCLzRYQXlRekN2L3NGZ0ZnZHlVZTdRODNueU1k?=
 =?utf-8?B?OUhWQXEvYThyTnRMS2ZzQXFVWXRSUHJaeXR5cEdPN1dPWDVSSnZ6bnYxUWpN?=
 =?utf-8?B?TGErYmM2MWtSTXQyZHB3VzNSTWpnTThMV3FHSVM3OEpUVllHRWdqdmFMSlRV?=
 =?utf-8?B?c1ArV0FrM3ZSZ3pTK1FXU2RXcW5DckFFZ3dreEVFNStnNmEwWDNmc3NOM0Z2?=
 =?utf-8?B?U3U3VVF3bzVNbXJNUnRmS0RCVUticDY5L2V6SmlvUW1McXhQbmZIVGNINWlP?=
 =?utf-8?B?c3QrNTh6bnZqNVRGajMvaDhMTm9yNnNDK3dCK25LOUx3UGVvTUZyQnU4YkF1?=
 =?utf-8?B?dWRUZUdQdGJBRDFJb3llbGNiNkwwanJLM1g3Y2Q3dkJ1UFkxaFYzWDc3UDFK?=
 =?utf-8?B?dzRVNnRrdSsvaWcyTXZjVWVMdFJyS1BtK1lCTkhNV0c5NWJtQzJ4Mit3c3Vo?=
 =?utf-8?B?cys5cU1YK3VlM2F2cVdEY2o2MXQxOXhVOG8yRy90WCtub3RFcllaUG5FZlQ0?=
 =?utf-8?B?YkRsTHo0R1QyTlBydmJueU5DODJ3cHZuWEppNmRZUUlSQXZNNHpuQ2NlRFVv?=
 =?utf-8?B?QW9tOC9pY1BObHRYdW94RjdkaEhhWnRtREVKY0J5am1JeTRsV2lmT0tkYXly?=
 =?utf-8?B?WXJ1U3NVdG9xK25VYXFJQjRyR3hxTFQ2ckJ3R01RQUo3aTUyWllHclIzOGNC?=
 =?utf-8?B?bGhKc21sZ3NKbHVEdjBSejBMNDQ3MnBuRk1PY1lNcUR4S1N0OHltTUxSQUNO?=
 =?utf-8?B?bzJ0N015MmFUTHU3ZTBLMStKV3psOUJEaEx4ZW0vMHFRVTVsbzQyemdjTW1O?=
 =?utf-8?B?RDYxdlM2dEFXbUVUL0xQVWw2SG9ueC80UzRhcFk1UHpDMzEzTTl2ek1jdG02?=
 =?utf-8?B?NFFaZURNOFdFZmoraGFmMUJvTlZBNndxQUpaTjBaUllPQUpwNjg3cS80bG51?=
 =?utf-8?B?YzJlOVpUVjZ6VjBEUGQzNFRzZ1JVSFNTTXZnRFZ0RTl1bU1JVmhucklGWnZx?=
 =?utf-8?B?L2Q1bXhLWmVpbWNxZkpIRzhIZy9vTEhFL0tMNUZYeWh3R2t0Vm81cUxuV0hB?=
 =?utf-8?B?Y2t0V3F6K0JXYXZBNXNkR3hOaU1xc2JiZWgrLzVYOVVYd2VEUkdSVHFja1J6?=
 =?utf-8?B?VzJBRnM1aUhwbGZ4QVRRK3Z5WGk4Z2hXd2xlY0tNMCtySkd5TnJTRmQyVHpF?=
 =?utf-8?B?ZzhOMllkeUM4QUo5alZiTkJJZi9yZm13d1lRMU9SekhSN05TeDN4QVlOVnZz?=
 =?utf-8?B?cnRaZ2w1NVV2bXRXWTJlZXFrWUxSbTdzSGhPWGR6bWxzNUV1cUdhNlRwRXgx?=
 =?utf-8?B?T2dFY3BvWjhyQkVpK1hyQzJTelZwZ3Y5THUzODdyd2xWeEcvVUdBN2lzeUw1?=
 =?utf-8?B?LzFWSngrUU1PTHMvcFhQSEtaM0ZoYnd4KzV4N0dLWTRUazM2clZjNHVRMjNu?=
 =?utf-8?B?QzYwRHFheWp5MGJFNHkzNnpEZXNWNlhKcDhTUytZZWVvakVnSXJscGp5Ylpj?=
 =?utf-8?B?TzRRd0JTeG1FSjh5aytVNlpWVW5oSTV1bmV6Mko1Kzd4Z29DMVVhUzZZR2Rs?=
 =?utf-8?Q?8se68AJsAuslJdWlh4u+TIJAsWEa783H3m3INH/rAmMw=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dfee05e-c9a1-4838-3a07-08dbcb1089fb
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2023 10:46:51.1100
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB1071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_040140_341314_1F2B410D 
X-CRM114-Status: GOOD (  13.97  )
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

Ck9uIDIwMjMvMTAvOSAxOToyNiwgSW5vY2hpIEFtYW90byB3cm90ZToKPiBNb3ZlIHRoZSBjcHUg
YW5kIHRoZSBjb21tb24gcGVyaXBoZXJhbHMgb2YgQ1YxODF4IGFuZCBDVjE4MHggdG8gbmV3IGZp
bGUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBJbm9jaGkgQW1hb3RvIDxpbm9jaGlhbWFAb3V0bG9vay5j
b20+Cj4gLS0tCj4gICBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9jdjE4MDBiLmR0c2kgICAg
ICAgfCA5NSArLS0tLS0tLS0tLS0tLS0tLS0tCj4gICAuLi4vZHRzL3NvcGhnby97Y3YxODAwYi5k
dHNpID0+IGN2MTgweC5kdHNpfSAgfCAxOSArLS0tCj4gICAyIGZpbGVzIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgMTEyIGRlbGV0aW9ucygtKQo+ICAgY29weSBhcmNoL3Jpc2N2L2Jvb3QvZHRz
L3NvcGhnby97Y3YxODAwYi5kdHNpID0+IGN2MTgweC5kdHNpfSAoODAlKQo+Cj4gZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvc29waGdvL2N2MTgwMGIuZHRzaSBiL2FyY2gvcmlzY3Yv
Ym9vdC9kdHMvc29waGdvL2N2MTgwMGIuZHRzaQo+IGluZGV4IGRmNDBlODdlZTA2My4uMDkwNDE1
NGY5ODI5IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvc29waGdvL2N2MTgwMGIu
ZHRzaQo+ICsrKyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvc29waGdvL2N2MTgwMGIuZHRzaQoKSGnv
vIxKaXNoZW5nCgpEbyB5b3UgaGF2ZSBhbnkgbW9yZSBjb21tZW50IG9uIHRoaXMgY2hhbmdlIHJl
bGF0ZWQgdG8gY3YxODAwYj8KCj4gQEAgLTMsMTA2ICszLDEzIEBACj4gICAgKiBDb3B5cmlnaHQg
KEMpIDIwMjMgSmlzaGVuZyBaaGFuZyA8anN6aGFuZ0BrZXJuZWwub3JnPgo+ICAgICovCj4KPiAt
I2luY2x1ZGUgPGR0LWJpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL2lycS5oPgo+ICsjaW5j
bHVkZSAiY3YxODB4LmR0c2kiCj4KPiAgIC8gewo+ICAgCWNvbXBhdGlibGUgPSAic29waGdvLGN2
MTgwMGIiOwo+IC0JI2FkZHJlc3MtY2VsbHMgPSA8MT47Cj4gLQkjc2l6ZS1jZWxscyA9IDwxPjsK
PiAtCj4gLQljcHVzOiBjcHVzIHsKPiAtCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKPiAtCQkjc2l6
ZS1jZWxscyA9IDwwPjsKPiAtCQl0aW1lYmFzZS1mcmVxdWVuY3kgPSA8MjUwMDAwMDA+Owo+IC0K
PiAtCQljcHUwOiBjcHVAMCB7Cj4gLQkJCWNvbXBhdGlibGUgPSAidGhlYWQsYzkwNiIsICJyaXNj
diI7Cj4gLQkJCWRldmljZV90eXBlID0gImNwdSI7Cj4gLQkJCXJlZyA9IDwwPjsKPiAtCQkJZC1j
YWNoZS1ibG9jay1zaXplID0gPDY0PjsKPiAtCQkJZC1jYWNoZS1zZXRzID0gPDUxMj47Cj4gLQkJ
CWQtY2FjaGUtc2l6ZSA9IDw2NTUzNj47Cj4gLQkJCWktY2FjaGUtYmxvY2stc2l6ZSA9IDw2ND47
Cj4gLQkJCWktY2FjaGUtc2V0cyA9IDwxMjg+Owo+IC0JCQlpLWNhY2hlLXNpemUgPSA8MzI3Njg+
Owo+IC0JCQltbXUtdHlwZSA9ICJyaXNjdixzdjM5IjsKPiAtCQkJcmlzY3YsaXNhID0gInJ2NjRp
bWFmZGMiOwo+IC0JCQlyaXNjdixpc2EtYmFzZSA9ICJydjY0aSI7Cj4gLQkJCXJpc2N2LGlzYS1l
eHRlbnNpb25zID0gImkiLCAibSIsICJhIiwgImYiLCAiZCIsICJjIiwgInppY250ciIsICJ6aWNz
ciIsCj4gLQkJCQkJICAgICAgICJ6aWZlbmNlaSIsICJ6aWhwbSI7Cj4gLQo+IC0JCQljcHUwX2lu
dGM6IGludGVycnVwdC1jb250cm9sbGVyIHsKPiAtCQkJCWNvbXBhdGlibGUgPSAicmlzY3YsY3B1
LWludGMiOwo+IC0JCQkJaW50ZXJydXB0LWNvbnRyb2xsZXI7Cj4gLQkJCQkjYWRkcmVzcy1jZWxs
cyA9IDwwPjsKPiAtCQkJCSNpbnRlcnJ1cHQtY2VsbHMgPSA8MT47Cj4gLQkJCX07Cj4gLQkJfTsK
PiAtCX07Cj4gLQo+IC0Jb3NjOiBvc2NpbGxhdG9yIHsKPiAtCQljb21wYXRpYmxlID0gImZpeGVk
LWNsb2NrIjsKPiAtCQljbG9jay1vdXRwdXQtbmFtZXMgPSAib3NjXzI1bSI7Cj4gLQkJI2Nsb2Nr
LWNlbGxzID0gPDA+Owo+IC0JfTsKPgo+ICAgCXNvYyB7Cj4gLQkJY29tcGF0aWJsZSA9ICJzaW1w
bGUtYnVzIjsKPiAgIAkJaW50ZXJydXB0LXBhcmVudCA9IDwmcGxpYz47Cj4gLQkJI2FkZHJlc3Mt
Y2VsbHMgPSA8MT47Cj4gLQkJI3NpemUtY2VsbHMgPSA8MT47Cj4gLQkJZG1hLW5vbmNvaGVyZW50
Owo+IC0JCXJhbmdlczsKPiAtCj4gLQkJdWFydDA6IHNlcmlhbEA0MTQwMDAwIHsKPiAtCQkJY29t
cGF0aWJsZSA9ICJzbnBzLGR3LWFwYi11YXJ0IjsKPiAtCQkJcmVnID0gPDB4MDQxNDAwMDAgMHgx
MDA+Owo+IC0JCQlpbnRlcnJ1cHRzID0gPDQ0IElSUV9UWVBFX0xFVkVMX0hJR0g+Owo+IC0JCQlj
bG9ja3MgPSA8Jm9zYz47Cj4gLQkJCXJlZy1zaGlmdCA9IDwyPjsKPiAtCQkJcmVnLWlvLXdpZHRo
ID0gPDQ+Owo+IC0JCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwo+IC0JCX07Cj4gLQo+IC0JCXVhcnQx
OiBzZXJpYWxANDE1MDAwMCB7Cj4gLQkJCWNvbXBhdGlibGUgPSAic25wcyxkdy1hcGItdWFydCI7
Cj4gLQkJCXJlZyA9IDwweDA0MTUwMDAwIDB4MTAwPjsKPiAtCQkJaW50ZXJydXB0cyA9IDw0NSBJ
UlFfVFlQRV9MRVZFTF9ISUdIPjsKPiAtCQkJY2xvY2tzID0gPCZvc2M+Owo+IC0JCQlyZWctc2hp
ZnQgPSA8Mj47Cj4gLQkJCXJlZy1pby13aWR0aCA9IDw0PjsKPiAtCQkJc3RhdHVzID0gImRpc2Fi
bGVkIjsKPiAtCQl9Owo+IC0KPiAtCQl1YXJ0Mjogc2VyaWFsQDQxNjAwMDAgewo+IC0JCQljb21w
YXRpYmxlID0gInNucHMsZHctYXBiLXVhcnQiOwo+IC0JCQlyZWcgPSA8MHgwNDE2MDAwMCAweDEw
MD47Cj4gLQkJCWludGVycnVwdHMgPSA8NDYgSVJRX1RZUEVfTEVWRUxfSElHSD47Cj4gLQkJCWNs
b2NrcyA9IDwmb3NjPjsKPiAtCQkJcmVnLXNoaWZ0ID0gPDI+Owo+IC0JCQlyZWctaW8td2lkdGgg
PSA8ND47Cj4gLQkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7Cj4gLQkJfTsKPiAtCj4gLQkJdWFydDM6
IHNlcmlhbEA0MTcwMDAwIHsKPiAtCQkJY29tcGF0aWJsZSA9ICJzbnBzLGR3LWFwYi11YXJ0IjsK
PiAtCQkJcmVnID0gPDB4MDQxNzAwMDAgMHgxMDA+Owo+IC0JCQlpbnRlcnJ1cHRzID0gPDQ3IElS
UV9UWVBFX0xFVkVMX0hJR0g+Owo+IC0JCQljbG9ja3MgPSA8Jm9zYz47Cj4gLQkJCXJlZy1zaGlm
dCA9IDwyPjsKPiAtCQkJcmVnLWlvLXdpZHRoID0gPDQ+Owo+IC0JCQlzdGF0dXMgPSAiZGlzYWJs
ZWQiOwo+IC0JCX07Cj4gLQo+IC0JCXVhcnQ0OiBzZXJpYWxANDFjMDAwMCB7Cj4gLQkJCWNvbXBh
dGlibGUgPSAic25wcyxkdy1hcGItdWFydCI7Cj4gLQkJCXJlZyA9IDwweDA0MWMwMDAwIDB4MTAw
PjsKPiAtCQkJaW50ZXJydXB0cyA9IDw0OCBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKPiAtCQkJY2xv
Y2tzID0gPCZvc2M+Owo+IC0JCQlyZWctc2hpZnQgPSA8Mj47Cj4gLQkJCXJlZy1pby13aWR0aCA9
IDw0PjsKPiAtCQkJc3RhdHVzID0gImRpc2FibGVkIjsKPiAtCQl9Owo+Cj4gICAJCXBsaWM6IGlu
dGVycnVwdC1jb250cm9sbGVyQDcwMDAwMDAwIHsKPiAgIAkJCWNvbXBhdGlibGUgPSAic29waGdv
LGN2MTgwMGItcGxpYyIsICJ0aGVhZCxjOTAwLXBsaWMiOwo+IGRpZmYgLS1naXQgYS9hcmNoL3Jp
c2N2L2Jvb3QvZHRzL3NvcGhnby9jdjE4MDBiLmR0c2kgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3Nv
cGhnby9jdjE4MHguZHRzaQo+IHNpbWlsYXJpdHkgaW5kZXggODAlCj4gY29weSBmcm9tIGFyY2gv
cmlzY3YvYm9vdC9kdHMvc29waGdvL2N2MTgwMGIuZHRzaQo+IGNvcHkgdG8gYXJjaC9yaXNjdi9i
b290L2R0cy9zb3BoZ28vY3YxODB4LmR0c2kKPiBpbmRleCBkZjQwZTg3ZWUwNjMuLmZmYWY1MTcy
NGM5OCAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9jdjE4MDBiLmR0
c2kKPiArKysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9jdjE4MHguZHRzaQo+IEBAIC0x
LDEyICsxLDEyIEBACj4gICAvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAgT1Ig
TUlUKQo+ICAgLyoKPiAgICAqIENvcHlyaWdodCAoQykgMjAyMyBKaXNoZW5nIFpoYW5nIDxqc3po
YW5nQGtlcm5lbC5vcmc+Cj4gKyAqIENvcHlyaWdodCAoQykgMjAyMyBJbm9jaGkgQW1hb3RvIDxp
bm9jaGlhbWFAb3V0bG9vay5jb20+Cj4gICAgKi8KPgo+ICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdz
L2ludGVycnVwdC1jb250cm9sbGVyL2lycS5oPgo+Cj4gICAvIHsKPiAtCWNvbXBhdGlibGUgPSAi
c29waGdvLGN2MTgwMGIiOwo+ICAgCSNhZGRyZXNzLWNlbGxzID0gPDE+Owo+ICAgCSNzaXplLWNl
bGxzID0gPDE+Owo+Cj4gQEAgLTQ4LDcgKzQ4LDYgQEAgb3NjOiBvc2NpbGxhdG9yIHsKPgo+ICAg
CXNvYyB7Cj4gICAJCWNvbXBhdGlibGUgPSAic2ltcGxlLWJ1cyI7Cj4gLQkJaW50ZXJydXB0LXBh
cmVudCA9IDwmcGxpYz47Cj4gICAJCSNhZGRyZXNzLWNlbGxzID0gPDE+Owo+ICAgCQkjc2l6ZS1j
ZWxscyA9IDwxPjsKPiAgIAkJZG1hLW5vbmNvaGVyZW50Owo+IEBAIC0xMDMsMjEgKzEwMiw1IEBA
IHVhcnQ0OiBzZXJpYWxANDFjMDAwMCB7Cj4gICAJCQlyZWctaW8td2lkdGggPSA8ND47Cj4gICAJ
CQlzdGF0dXMgPSAiZGlzYWJsZWQiOwo+ICAgCQl9Owo+IC0KPiAtCQlwbGljOiBpbnRlcnJ1cHQt
Y29udHJvbGxlckA3MDAwMDAwMCB7Cj4gLQkJCWNvbXBhdGlibGUgPSAic29waGdvLGN2MTgwMGIt
cGxpYyIsICJ0aGVhZCxjOTAwLXBsaWMiOwo+IC0JCQlyZWcgPSA8MHg3MDAwMDAwMCAweDQwMDAw
MDA+Owo+IC0JCQlpbnRlcnJ1cHRzLWV4dGVuZGVkID0gPCZjcHUwX2ludGMgMTE+LCA8JmNwdTBf
aW50YyA5PjsKPiAtCQkJaW50ZXJydXB0LWNvbnRyb2xsZXI7Cj4gLQkJCSNhZGRyZXNzLWNlbGxz
ID0gPDA+Owo+IC0JCQkjaW50ZXJydXB0LWNlbGxzID0gPDI+Owo+IC0JCQlyaXNjdixuZGV2ID0g
PDEwMT47Cj4gLQkJfTsKPiAtCj4gLQkJY2xpbnQ6IHRpbWVyQDc0MDAwMDAwIHsKPiAtCQkJY29t
cGF0aWJsZSA9ICJzb3BoZ28sY3YxODAwYi1jbGludCIsICJ0aGVhZCxjOTAwLWNsaW50IjsKPiAt
CQkJcmVnID0gPDB4NzQwMDAwMDAgMHgxMDAwMD47Cj4gLQkJCWludGVycnVwdHMtZXh0ZW5kZWQg
PSA8JmNwdTBfaW50YyAzPiwgPCZjcHUwX2ludGMgNz47Cj4gLQkJfTsKPiAgIAl9Owo+ICAgfTsK
PiAtLQo+IDIuNDIuMAo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
