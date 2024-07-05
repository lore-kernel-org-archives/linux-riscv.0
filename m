Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55898C30658
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jul 2024 11:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mh0BI3ErIuGdbvVc96s+jLEnZVaNuFdB9vg2h6Z3iTQ=; b=uvEP2vCeA27vde
	H78+GG0/of0oJtp/C+QgbDXSyI9C0gMfVjCfUZ1jnDDcnUnN0/K4Mi+TNjLfBeoKv1E39KkDxatKs
	lvq7aU2F/yQe5/qlZNB1U9GkGczNpB9z39lFhWgg97xpMA6eAQP5uapM8O62JX+iZKwRDrZaeAlYv
	JRMeNmeKOkGPk8wLRaOor+tNlXF+77QsgoJaCqnp95qWAMMztl509BuoN454g2wwqr+1E6cUmknvh
	4A4GoawVrnYdSelVistocK6BiYFludEdKTA8kyDU0mtxB3pCQR4DhvBOp+a+DcoLbMH6ZIrUy2Rnd
	nBS07lWX4PrAzOxyLKuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPh1Q-0000000FmUx-1SfJ;
	Fri, 05 Jul 2024 11:22:36 +0000
Received: from mail-bn7nam10olkn2082a.outbound.protection.outlook.com ([2a01:111:f403:2804::82a] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPh1N-0000000FmTg-1XON
	for linux-riscv@lists.infradead.org;
	Fri, 05 Jul 2024 11:22:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n/2QQMrfuR92FxLuWDT2goJWqW+1qtPTFqe53q7STqeaesDMPz/O0erJ4jLUZLLJOTyWpvds7SZfhZz9WJKuPB5PIu49TKHusBzXLIcciNWkQLvpC+UJ/6suDrW6JbANniMv5LBv5jMUcydI1tPxPMMXnVKKq/7PPphVxUJgt5P+7wbE77jsjT7c3QTTs9nZC1hK02agJED+flTcYfVlMw3QnCM5rm0KfdrOoYKE2XYj4H2GRkxwHc22bNOlXIbOuKCpAGvfIYW/vWqgljA8MgDnUZNfOpFTfNF8Dq070FbUxVhRLLVp3Zrd7/FeDQG7qrxiWbmvXV8njGHmr8WBww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XqYVOcuTF6v7r3lIvkfqSTmPsLsBw/D0Pf4Nb4Da0XE=;
 b=UoMdaY+bSkHLosA7VH8POtVqMhbxvp6UAt6cpebEjlWKNPtvBxPSe94NoSH85sHyUxpqU+GnTyuGUbR4tDlrrXC1vcorymQpPrOygUNPTi7LHjr1l1V2JqVf6v6axCT5wDR69WhUL29I9mciyPNT6gBtaise4pirNCM3yO6x8+/9bSRZ0jQ+LXFI8ytFNFZcuAxYthyj7UnWLzhQKXAtBZDNeKr7pOYOD1h8zbcgF1tGMx3DP34i/NE7yZOw3QALxDDemwLjnH2V9iq5N6c+4U49hlbj6Jx68NfVmgN/Ac5JT0tGEtK7HUY8NJYlYSWjxVUpK0jdDYnccWh3Imcz3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XqYVOcuTF6v7r3lIvkfqSTmPsLsBw/D0Pf4Nb4Da0XE=;
 b=D6kfg5cdO9Ao0eOVBqbavMyZNPv9T1OHSnfxXPvtQI/uMhDDkdjlb30prdflK7D+02VxqRf/Sy44kStHIdptSOhjzGXChHX7lLDQZlw8sIK9iISzJmCl+y2ZGM+ME3KJ+3WlUhkBR/CJ4FEcR5+yTS2uZU/L0EJOBcZX6AvIf6gqqPf2JivrDJs7vg6991dNHOlrgPvoVSDR7rKlN7bzhSB1ZvkrJJsb8sru9UlCMiUt6jYmLFesQGYNIUToJ7vHxvKCKr3anTJiGaP5ULay5NLmIGo7pvzaQtMw7J/0qSqPX0XQRq5s2XYULUDapVetP2/u8GrZRuw0PFFEHedgyA==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by LV8PR20MB7299.namprd20.prod.outlook.com (2603:10b6:408:221::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.28; Fri, 5 Jul
 2024 11:22:18 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%6]) with mapi id 15.20.7741.017; Fri, 5 Jul 2024
 11:22:18 +0000
Date: Fri, 5 Jul 2024 19:21:43 +0800
From: Inochi Amaoto <inochiama@outlook.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
	Inochi Amaoto <inochiama@outlook.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, Haylen Chu <heylenay@outlook.com>, 
	Drew Fustini <dfustini@baylibre.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/7] dt-bindings: pinctrl: Add pinctrl for Sophgo CV1800
 series SoC.
Message-ID: <IA1PR20MB49538A4568AA698C41F6E734BBDF2@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB49530F0476B98DBB835B344FBBDE2@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB49530D9BC6C8011B730433C2BBDE2@IA1PR20MB4953.namprd20.prod.outlook.com>
 <CACRpkdajN7RjE5LOdv_SP6rR8U-vwXHXn=kZZo7thodeMem72Q@mail.gmail.com>
Content-Disposition: inline
In-Reply-To: <CACRpkdajN7RjE5LOdv_SP6rR8U-vwXHXn=kZZo7thodeMem72Q@mail.gmail.com>
X-TMN: [F1ox0bYhhLxo6kYEUJStpRaaFAlLdCrq8lukaZHwHaY=]
X-ClientProxiedBy: TYAPR04CA0005.apcprd04.prod.outlook.com
 (2603:1096:404:15::17) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <uepk3ys6fa6zgplzv2t2qevgvgpsxeqtkry53a4ftbwktlnmp2@gunkagnts2um>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|LV8PR20MB7299:EE_
X-MS-Office365-Filtering-Correlation-Id: fd325d58-821c-401a-e6d2-08dc9ce4badc
X-Microsoft-Antispam: BCL:0;ARA:14566002|19110799003|461199028|8060799006|440099028|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info: os/1Qf2IqadKoQX5cXiIF5BQBg8esqPD/X1VZUAR/GpD57zicigq3/kVJa5IydbXTvcRXulk4dCrYDo2TkAN4DC6kE4CkM3JPfjj/HBeQc+FDVwR7qR1LhWBlds1qxon3eagMO8YbbzvjcGJOKh5RmaCAwLN+YVypPvMScSps0OwTGsxdzCI5YKB6SKVvRx+RpbduKJdSXXa1w5+No42DRnQSuFgH8ckLYw/9ljHae7sD7IvlSeqUlrny2Gn2N4lJj4zBXX1nz3nIg/rnQYiBTaTS9neZjVvQ/8VTwbiQ+cwcSjcumCZqDKQ/UkLNU8myu9aLmAjrtcmbNRSO0DCHFR13qAN0Sgwvig8jOsGhQgurqfykpp9OHjYkIEAljG86/96aqkljR9Y04mlUL1OPBcDfWfe8co5RH/RxNSXP3FiIrgGf2wnR0cSGAhuLU32oYoiZK/LvWc342AXsr7mztMDLzsJhR0A2SoeN8bsd9s0A1pZ2zEZm8xwmQbfAiTWI62kn46yD2wGJoew/jsNti1zCDtWkjt71WPbLjW18wFtlJT5poJaXpGOmxAFz6H9fOb4Qky/kiTPoEs1J29C5bR4ZwzQknCkeWS4wLmnV2AFBvxH0loD+FUtfEBKk4rB8KAnSrhqlRHqXMcc64CplEUaecRBwaRuSgXrGfWfh78kJAMBPppz/Q35QtxVjsXT
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cGExLzhiNmgyREhRUXdaT1Y1VlJLMVFXdmJCZUFSd2VuY21SaHpwMEZvVTlj?=
 =?utf-8?B?ajllL1RZSTJPVnU5ZWJ3dy9LeFMybGJidDJBWnpmT1YxdFpwOEVUWWRJS0lJ?=
 =?utf-8?B?ZHh5RVg1MTlYWGd4YVdYWUFVZEZma0lSUy83S2JjUHRFS3N2V1Y3bjlacDdU?=
 =?utf-8?B?NHJlZEsrY3hOWStQVWpoQ1BpSTIyaTJSNG5LRDJrdE55V3ZJK0tqdWRQeFhz?=
 =?utf-8?B?U0JoOVpGL2ZPUUZncWNUVkxBZE5vbjl4MUdhMTh4bUpaVEV3Y3BlczV1cFFH?=
 =?utf-8?B?TW9WMGZ6bXVYUlRzYy9lRlhiQ2VEb2lDMnV2aWxWRXdwaUhDU0MxckhwVm1l?=
 =?utf-8?B?TE9FN2dpMHNZUmFXeGxPOHl3UmNBNzdPZ1hXYU9pOUhlcWl6cDliMGVhMUhI?=
 =?utf-8?B?U1BicXBOUXR6UDdQQ2dwT1VNbExGdktnYWMyemZwSk1PbTEwakg2MWxiZys1?=
 =?utf-8?B?T1gyMXNxSDFla3ZwWHpPUVRISjVNMVRITkI4Um1LSkVwemt5UDNxWlBFREsy?=
 =?utf-8?B?L2hveEhQMVNqREl6Uk9uL0NKTDIxcStzL0taSmxXVEV0aVBNSkVrR1ByelNT?=
 =?utf-8?B?azVYcTFRNVpKZklIcENOTXJpd1hmRi9ISmhNaFUzODdkMmNEeUlVTGtFTGh5?=
 =?utf-8?B?RjVjcUtublZUQ2xWRVZNaXBoY2kzL0tOK1ZMR1VPMEptZ3N4TUV0T2JldmQ5?=
 =?utf-8?B?eUMvYnkxNTJjc0tUeGpYSkdoVWx3czVDRmZZbWJnbytjU01leXh5WFdLQVpK?=
 =?utf-8?B?TlV1VEkzRG5MWVZNcVd1Wlo2WWs5Ymh0RWF2QUxMTUl1OXFXa3puWTFvK0NC?=
 =?utf-8?B?Mld0TDQ0WmI1OW1reHQ4KzBHYmtmRWNGQktIQ1B3aGxzbnhDVUgwK1dLdUlS?=
 =?utf-8?B?TUZFbEZycklONTNlWFBydVczWGZtWDduSXNIQlNVL1huciszS1FIYUdkc3hO?=
 =?utf-8?B?VW9aRjRQOEFRMVZjY3NxV0psTWlLTUZod0VHUFQ2c2ZNQkpGRERCOThGNnFy?=
 =?utf-8?B?TFlRS05EWHVibjdCRFFSS0VmVVBtSWl4WE1jbzhwWjUxVkxQZzFDbVZjWnh6?=
 =?utf-8?B?WEJKeDYxUC8rTVhXUEhKQjVueUQrK1ZMMFljS3JCMjJneW9Ua2ZvNXBaSzQ5?=
 =?utf-8?B?VEU3VFNXNlpnT2o5S2dHMGNYZlpnNzBLZk91alllM0h4TEZGbFBFUktiaEor?=
 =?utf-8?B?SlJIZGxKcTUwVWdac3BkQ2JVaGtHSStBTDFSQWx3VmY2RU5MS0NOMVM4dzE5?=
 =?utf-8?B?YzB4ZmJmcXdOcHdyMFR3V0JLT3FOdFNYRnV3dzF6T3FrMHdYeTk3MkFVZEtI?=
 =?utf-8?B?SnZ5MTd6RENoRzhyTEVEM05oR2UzdVFsU0gxcXVLWlVKYkpBeGloWktGblNw?=
 =?utf-8?B?aFR5YkRBY2dCMHRNZ3l1NWloT0YwVlFKVmRGK0lyRFB5djhPQTZwNzNVQm5a?=
 =?utf-8?B?NE5sbHBRR2JOdkVKYTQrbFVJblMwKzBwL2l3Z2hQUGppdGthOEZEQkZ6NmlS?=
 =?utf-8?B?SlVQL1d5NFFVY0VDRkpaamdJa3ZpQWxkaW9QWEZ0ZkxOa29KOEpBQmpWTVRG?=
 =?utf-8?B?RER4YWZKbkpEU0J5VzhoMGhMOWhrLytVRXdndWFCeENYRXNOeDkvZUtTQ3Zs?=
 =?utf-8?B?NnFSUnpqTTVEUi83MWVoQ3BmSDY0OGlxL0RpcnZEM2xGczJSVlVpMG5Weito?=
 =?utf-8?Q?IDL5yLeTmzBRi06ATxVp?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd325d58-821c-401a-e6d2-08dc9ce4badc
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2024 11:22:18.4030
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR20MB7299
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240705_042233_442527_A357A736 
X-CRM114-Status: GOOD (  26.38  )
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

T24gRnJpLCBKdWwgMDUsIDIwMjQgYXQgMTE6NTA6MDlBTSBHTVQsIExpbnVzIFdhbGxlaWogd3Jv
dGU6Cj4gSGkgSW5vY2hpLAo+IAo+IHRoYW5rcyBmb3IgeW91ciBwYXRjaCEKPiAKPiBTb21lIGNv
bW1lbnRzIGJlbG93Ogo+IAo+IE9uIFRodSwgSnVsIDQsIDIwMjQgYXQgNzo0N+KAr0FNIElub2No
aSBBbWFvdG8gPGlub2NoaWFtYUBvdXRsb29rLmNvbT4gd3JvdGU6Cj4gCj4gPiBBZGQgcGluY3Ry
bCBzdXBwb3J0IGZvciBTb3BoZ28gQ1YxODAwIHNlcmllcyBTb0MuCj4gPgo+ID4gU2lnbmVkLW9m
Zi1ieTogSW5vY2hpIEFtYW90byA8aW5vY2hpYW1hQG91dGxvb2suY29tPgo+ICguLi4pCj4gPiAr
ICAgICAgICAgIGJpYXMtcHVsbC11cDoKPiA+ICsgICAgICAgICAgICB0eXBlOiBib29sZWFuCj4g
Cj4gZGVzY3JpcHRpb246IFNldHRpbmcgdGhpcyB0cnVlIHdpbGwgcmVzdWx0IGluIGhvdyBtYW55
IE9obXMgb2YgcHVsbCB1cAo+IGFuZCB0byB3aGF0IHZvbHRhZ2U/Cj4gCj4gPiArICAgICAgICAg
IGJpYXMtcHVsbC1kb3duOgo+ID4gKyAgICAgICAgICAgIHR5cGU6IGJvb2xlYW4KPiAKPiBIb3cg
bWFueSBPaG1zIGJ5IGRlZmF1bHQ/IEl0J3MgdmVyeSBoZWxwZnVsIGZvciBkZXNpZ25lcnMgd3Jp
dGluZyB0aGUKPiBkZXZpY2UgdHJlZSB0byBrbm93IHRoaXMuCj4gCgpQdWxsdXAgaW4gNzlrIGFu
ZCBwdWxsZG93biBpcyA4N2suIEkgd2lsbCBhZGQgdGhlc2UgdG8gdGhlIGRlc2NyaXB0aW9uLgoK
PiA+ICsgICAgICAgICAgZHJpdmUtc3RyZW5ndGg6Cj4gPiArICAgICAgICAgICAgJHJlZjogL3Nj
aGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyCj4gPiArICAgICAgICAgICAgbWlu
aW11bTogMAo+ID4gKyAgICAgICAgICAgIG1heGltdW06IDcKPiAKPiAwLDEsICAuLi4gNyAuLi4g
dW5pdHMgb2Ygd2hhdD8gV2hhdCBkb2VzIHRoZSB2YWx1ZXMgcmVwcmVzZW50Pwo+IDcgbUE/IEkg
dGhpbmsgbm90LiBUaGlzIHNob3VsZCBiZSBpbiBtQSBhbmQgcGFyc2VkIHRvIGFueSBjdXN0b20K
PiB2YWx1ZXMuCj4gCj4gSWYgeW91IG5lZWQgbW9yZSByZXNvbHV0aW9uLCBjb25zaWRlciB1c2lu
ZyBkcml2ZXItc3RyZW5ndGgtbWljcm9hbXAgYW5kCj4gcGFyc2UgdGhhdCB2YWx1ZSBpbnN0ZWFk
Lgo+IAoKVGhpcyB2YWx1ZSBkZXBlbmRzIG9uIHRoZSB0eXBlIG9mIHRoZSBwaW4uIERpZmZlcmVu
dCBwaW4gaGF2ZSBkaWZmZXJlbnQKdHlwaWNhbCBkcml2ZSBzdHJlbmd0aC4gSSB3aWxsIHN3aXRj
aCB0byB0aGUgcmVhbCB2YWx1ZSBhbmQgY2hlY2sgaXQgaW4KdGhlIGRyaXZlci4KCj4gPiArICAg
ICAgICAgIGlucHV0LXNjaG1pdHQ6Cj4gPiArICAgICAgICAgICAgJHJlZjogL3NjaGVtYXMvdHlw
ZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyCj4gPiArICAgICAgICAgICAgbWluaW11bTogMAo+
ID4gKyAgICAgICAgICAgIG1heGltdW06IDcKPiAKPiBXaGF0IGlzIHRoaXMgY3VzdG9tIHByb3Bl
cnR5PyBXZSBzdXBwb3J0IGlucHV0LXNjaG1pdHQtZW5hYmxlCj4gYW5kIGlucHV0LXNjaG1pdHQt
ZGlzYWJsZSwgaWYgeW91IHdhbnQgdG8gYWRkIGEgbmV3IHN0YW5kYXJkIHByb3BlcnR5Cj4gaW5w
dXQtc2NobWl0dCwgdGhlbiBzZW5kIGEgc2VwYXJhdGUgcGF0Y2ggdG8KPiBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvcGluY3RybC9waW5jZmctbm9kZS55YW1sCj4gYW5kIGV4cGxh
aW4gd2hhdCB0aGUgYXJndW1lbnQgbWVhbnMsIGl0IHNob3VsZCBiZSBpbiBTSSB1bml0cy4KPiAK
PiBGb3IgYSBmdWxsIGN1c3RvbSBwcm9wZXJ0eSwgdXNlIHNvcGhnbywgcHJlZml4ZXMuCj4gCgpU
aGFua3MgZm9yIHRoZSByZW1pbmRlci4gSSBoYXZlIHNlZW4gYGlucHV0LXNjaG1pdHRgIGluIHRo
ZSBnZW5lcmljIApwaW5jb25mIHRhYmxlLiBJIHdpbGwgc3VtYml0IGEgbmV3IHBhdGNoIGFuZCBh
ZGQgdGhpcyB0byB0aGUgCnBpbmNmZy1ub2RlLgoKPiA+ICsgICAgICAgICAgc2xldy1yYXRlOgo+
ID4gKyAgICAgICAgICAgIGVudW06IFsgMCwgMSBdCj4gCj4gV2hhdCBpcyBzbGV3IHJhdGUgMCBh
bmQgMT8gV2hhdCBkb2VzIGl0IHJlcHJlc2VudD8KPiAKPiBtaWNyb3ZvbHRzIHBlciBzZWNvbmQg
aG93IG11Y2ggKEkgZG9uJ3Qga25vdywganVzdCBndWVzc2luZykKPiAKCkFjY29yZGluZyB0byB0
aGUgZG9jdW1lbnQgZnJvbSBzb3BoZ28sIDAgaXMgZmFzdCByYXRlIGFuZCAxIGlzIHNsb3cuCgo+
ID4gKyAgICAgICAgICBzb3BoZ28sYnVzLWhvbGRlcjoKPiA+ICsgICAgICAgICAgICBkZXNjcmlw
dGlvbjogZW5hYmxlIGJ1cyBob2xkZXIKPiAKPiBUaGlzIGRlc2NyaXB0aW9uIGlzIGEgYml0IHRv
byBsaXR0bGUsIHdlIG5lZWQgdG8ga25vdyB3aGF0IHRoaXMgdGhpbmcKPiBpcyBhbmQgd2hhdCBp
dCBpcwo+IHVzZWQgZm9yLiBJZiBpdCBpcyBkZWZpbmllZCBpbiBzb21lIG90aGVyIERUIGJpbmRp
bmcgdGhlbiByZWZlcmVuY2UgdGhhdCBmaWxlLgo+IAo+IFlvdXJzLAo+IExpbnVzIFdhbGxlaWoK
ClRoYW5rcyBJIHdpbGwgaW1wcm92ZSBpdC4KClJlZ2FyZHMsCklub2NoaQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
