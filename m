Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0FE5C3DA64
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jul 2024 06:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/ZW7ChMNPpWfUs9j3fnikKryrV1Lk/13MD11CBAeTCA=; b=QPfV8q9jBEuCHowunLw/2H4uPv
	vTQgzFC9aSk+3iNflKS8flg1asA4+rqmmPVg78wekwM1ibNrsWH7u6KvybbsWW1I9nUdn4D4vStFV
	xUNqCyja8z+FjfrgSVaCaJewqlGUFhJqt4esFrgss9aDKtFKBZyAwLLCOOTwQ/ODBtxcrtTTK3UvU
	zHBA97zSAGzcqGFMPG8Hxo8Sh1xAkYcS57hID2kPA0pOjtNCPNCYkL3+Xls/kH4F0upxEpd/Q7elZ
	7s0g8U6jUd3+AVkTGFm0i9E0qKc1SrowyPMFwUrcgn1ACI84oohyQDGbxCxrtDOZ2dN/HT1RPYZQF
	TSdfCg5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ2cW-0000000HUSV-3fhI;
	Wed, 31 Jul 2024 06:15:32 +0000
Received: from mail-maxind01olkn20800.outbound.protection.outlook.com ([2a01:111:f403:281b::800] helo=IND01-MAX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ2ak-0000000HTlm-2o5J
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jul 2024 06:13:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P4Ve/n60bnVcoKwAroeJNeyjry/YvU2ALvAiWsdOvrHqU6BViZU48YGYzHe8TigHRTI+oQ1247nMB5cD3x+J/dg5Ay03swSN9jE7dsUprNK6bam6oHf3Lwccf+CPhqcR2Yot/MWFUjFCm6IBEM4ZzvKlxoHmTvoWcAA05CAlmVhysjCv4xaW8xpXcueYpJrC43nO/e3dXNzXwEeFEXe4lxVfuwC3wqXN3k7BoPJv42/OHwqRllDhYbxMIqg4Thw/xrI9L4cGclrQ7Pi3V/7AcPQv2QFTNSbxx2/iyO3By9eJXYeVVy7OCVAxlmlsqWfelRvi+/A4h7jy7xKsRBotjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kygkSvs6m/sZslXaJuT5HOBMHHCKaOo1XT4KYtC2+4Q=;
 b=kxiWEfEarORnA7x0bohI8xUm6Ht5gPsc0U5j5dD18DV6UFuqStqxY/w6f0nkqKPd0cxRN6c9BZIWzaFpfOcw6h/Pjmttm8RI2ouhCahaFKR7QX1hIncYOCAJ+88jcCuZmxADibbaGIcPsmeR1WfEHXRV1kb2ZuiNTPCd+1VO3/fvi9xwXz6Pa6uxHLV5AIVr7I9z1p73q/y1jaYkJMbW3STRte7k8MRPZMIjnl9qskwksQOHv1yUBmDBm54fy4KHy5Bpw1L/7t09+NeSbPBynZJvOtxpYNSWE5qHYhfcf84saD7eGCqytpkbmKQ42fRr6kdLtAyD4/JyHMWU2jcE5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kygkSvs6m/sZslXaJuT5HOBMHHCKaOo1XT4KYtC2+4Q=;
 b=lzgPcmg4mQQQQsXVPSVeHwIAqPMnY3nOTbNcILwGbkjHW8KKewLSiDMwe6XJge/hVHvxr+dcmNsZAVtZnOaYY2UTJd95qykWk+NexrdgxzKO0iX/CIwW3+U9VGLC8GVG7yS0/8CtOOs77oPYj08lVnaQfpHD2DvxYMbiipH3ESYozaLJCvvMsKJtKTS++sy8aEX6xOO1U/5+rQaQ0bOEg9S0sdT35B0ubRyX2/8EMQDwqX8tbpFcEC92+xgwU6eKWweBZaDFt5EwSaPVGpvPy4HhdGKSdxScwsUC+sSHzJ7zdAAipdFxz9AH/uCWG6Nr8AUwAxpZGze4i/gMD0Z0sw==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by MA0P287MB1790.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:f5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21; Wed, 31 Jul
 2024 06:13:29 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c%6]) with mapi id 15.20.7828.016; Wed, 31 Jul 2024
 06:13:29 +0000
Message-ID: <MA0P287MB2822D0C770667CFE484EBC95FEB12@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Wed, 31 Jul 2024 14:13:20 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/4] drivers: hwmon: sophgo: Add SG2042 external
 hardware monitor support
To: Inochi Amaoto <inochiama@outlook.com>, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Guo Ren <guoren@kernel.org>, Chao Wei <chao.wei@sophgo.com>,
 Hal Feng <hal.feng@starfivetech.com>, Jinyu Tang <tangjinyu@tinylab.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 chunzhi.lin@sophgo.com, haijiao.liu@sophgo.com
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <IA1PR20MB49538C09E94D90F07B7B2562BBB02@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB4953DE89C56AB3F328954131BBB02@IA1PR20MB4953.namprd20.prod.outlook.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <IA1PR20MB4953DE89C56AB3F328954131BBB02@IA1PR20MB4953.namprd20.prod.outlook.com>
X-TMN: [eXLlfhgaDTS9O329B2nx2E9V9PleYzF/]
X-ClientProxiedBy: SG2PR06CA0240.apcprd06.prod.outlook.com
 (2603:1096:4:ac::24) To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID: <0de3f417-8127-489b-b31f-2d7cd450387f@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|MA0P287MB1790:EE_
X-MS-Office365-Filtering-Correlation-Id: a8326ab5-fb41-4106-3d86-08dcb127e4cf
X-Microsoft-Antispam: BCL:0;ARA:14566002|461199028|19110799003|8060799006|5072599009|3412199025|440099028;
X-Microsoft-Antispam-Message-Info: /H4AG1Y91CJcaAAf6+RWRcDt9i0b3/4VhTYAqfq30UeXfbsOFNjNwpOzf1tDWI8szslmTcQaoOScZxMYEAoQbbqxf/Pw5xuRdXBffgvLKQK/6uJi/+8i7PutAUvoLOdtY4Ge5fA13UPCfBJ5Ulqfpw5NXU37RhzOB08LtJBToSwu7smnjvBH4fCmYah85ZL6O9su44EAQ6TIW43leNYCQ37Iorvp+3SrJmPIt2j3hCA3WZHbFRTu/xgmCt6P90268+AH+yK9hZyjeVcNQ9IO6u/lcUMiBlcJjeIJ5AMZHa7o3vYtcms9ad0ToiNqPv1bJtvL+D7oqNzXaPbByQAf0wNmlTbm/0Ij598LM+tA1ECxyEN/9qjUHbdwFsN1u4K258aQPUWeOHpze5hF935ipU286LTRCDpqxJ5L328lFw9Q9ae+uSrdfWkO3swjqkiM9/sMn6jJf+4WzVTaLL97XQMcCCF945B1dYqmsDW65bRS/5XafeeYkGUaOJUEoh6Q8/mAx1c/rjOv/ZQPZ/lhJeLzE4nwLJA8jLSLqt9+Fd2W+XJEZSKiHOYX2xA1cX6JQLWCqmxrrW1I5e0WzrFoyKi0c1LhpHUtC0o+Raao/9KV2Ju8OqySKqKOt2+rJBcWc7LemI9c5nC5iaYpLpF3CzLryJXsqhpeald+EiTxK6vMh9n0IuQZP0TLWt5yyi64
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHlmMUFXeFN5V2RyTnM4SzhDS0ZLQTZqQzMzSzdBeXZEdUdqdGtGNDBKVlpP?=
 =?utf-8?B?eGNNUzZwV25xeWRiREt2WUNtVzFNS2xLaEh2dFRNWFFqN2hqT0xoMXNQNHQx?=
 =?utf-8?B?K2dSSjlPMjJ5UXJOZTZOWVBEeWw1VzY3TU1rUUNEK0kwYUgyM0pvYlR0YnA2?=
 =?utf-8?B?OGFGZTF3NSs5TzhnVXd3eXVBMzJWdTA0bVpCR1FINGZncVdlbDV5QlNBYWNr?=
 =?utf-8?B?aGpjZ3hrSlVxVlRndzBiQWZZVGdhaFB2MEYwRUVNTENJMnlpWFJBYklJaUVI?=
 =?utf-8?B?ZFJ3UHAvSU5vdEVmZnZVYnNBSjlsSEpSVk1qT1gzRWNYOUk0VVA3RWdsRGJ6?=
 =?utf-8?B?TVI5TVh2STJXYldOSW5CNm50cmRkQmxEakZFVnR0OXZXMk9PLzJtZkh0SUNo?=
 =?utf-8?B?ZjJvdWp3QS9UOUhoUzBHdHh6QWc4YkZEd0kzVDJBb08yUXdRR2JVSjcrd29j?=
 =?utf-8?B?VmlDWXlDYzhJc05hN051TUowTG9hM1NaRGpmenNMaHBLL1hPSzd1SmRVVkpz?=
 =?utf-8?B?V2VVMmlkTGx6c25xNnFOMjFTeGwwUTRNM1Y2djlKTGhvUHptWEkvdzV5bmdR?=
 =?utf-8?B?VjI1UHFqMlNyUjMrZDZuK1Z1TkFXcERKMldwMVJJNmdWc1M3cVpMRDVtdnh4?=
 =?utf-8?B?d3pIdHF1NWhIbERzZnRGOWF2QUFVL2I0ZHFkVFNpeWFQVElsTDVjSHhJa0JM?=
 =?utf-8?B?KzFtYjg1QTFsb3B6eGdzeURoRmFWWDFTZ3JoM0tiTUxZRHNVY3Z1Z0NpYUhP?=
 =?utf-8?B?SWpWTXFQREJpQk9ZYSs1N1NKYzV6WVRZekxNa3kzUCtjNEtFZXdrTFhobzVu?=
 =?utf-8?B?clJ5cm1QNWRXNmZyVnRXemROMU56ek4wdGRsTzQ1L3VpQktsRTJLVWV0a1FZ?=
 =?utf-8?B?OUxuZVdiRFdtMnZwU2FqYXZmbXEzemZQKzh1N2l4RkNNazlDRzFycTZHQkt3?=
 =?utf-8?B?ZkdJb01IZ0s3V0xvc1NKTldtQ245WnFrVUxyaURhdU9XLzJteHl2SHJLWXlQ?=
 =?utf-8?B?VDJBaDJpWmhVSy9RRWZYaXdqYVZUSEZ3NWgrL1VVUEQyQ3JMM2ZyQzdGNlpw?=
 =?utf-8?B?bm82M2c5VXlhek9OQ2oyVXpiU1JNYXBuR3dCempBMHNoZ1NuNzMyZFRUdUMw?=
 =?utf-8?B?U2k4dDdJc3ZFcDlTME5QTDhtLzdSbExZWHBpUU5ycGhKaUUycUltZE54SFRp?=
 =?utf-8?B?MEl2Qm0rd3Z5NlVsN1dWQ1RYcVNBaFdEaHlYek4xL2tGSnViQlFxLzdwUmlQ?=
 =?utf-8?B?ZGRNM2tyZkN5U01WWkU2OUpHYUY2Y1NtZTRpSkNGaUcrNjZFc0VTMWsxYng4?=
 =?utf-8?B?TTlGMlI1L2VYb2RqdzlwR3FjeE5VNmg3Zmpqc1Qrazl1TWM1NmZRNi9zSjVn?=
 =?utf-8?B?R2c2WmdmVzQrMDhjenk5VzhKcXc3T25kSlN3THc4enYvTC84UFdKYVhoTzNU?=
 =?utf-8?B?K2pIVTBzd2tEeHllWHJOd0NYUDhxbzVFd3ZiTk9pRUplQ2RmU0R2bkF6WDBo?=
 =?utf-8?B?ZlRzUXhSdSsvL3pKWkI0dmowT3B2Q0x1dnByaFBLOHpRYkFjenVqNktzYnhY?=
 =?utf-8?B?aVZlMDFNR2NvbWlXeXBkM2JoVjlKYmNGSUJyREpXNS95MnVLYURqNktPeHE2?=
 =?utf-8?B?YzFEbVZvbzRwa3pveFRhNFlVSFlkbndvdmpaYWFnVlpzQ0Q2UFplZktlSDBR?=
 =?utf-8?Q?rW2P0dUuXrI66mVxeJGa?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8326ab5-fb41-4106-3d86-08dcb127e4cf
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 06:13:29.4340
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB1790
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_231342_754598_BE07803E 
X-CRM114-Status: GOOD (  18.76  )
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

Ck9uIDIwMjQvNy8zMCAxNTo1MCwgSW5vY2hpIEFtYW90byB3cm90ZToKWy4uLi4uLl0KPiArI2Rl
ZmluZSBSRUdfQ1JJVElDQUxfQUNUSU9OUwkJCTB4NjUKVGhlIG5hbWUgIlJFR19DUklUSUNBTF9B
Q1RJT05TIiBpcyBhbWJpZ3VvdXMuIEkgaGF2ZSBjb25maXJtZWQgd2l0aCAKc29waGdvIGVuZ2lu
ZWVycyB0aGF0IHRoZSBjb21wbGV0ZSBwcm9jZXNzIGlzOiB3aGVuIHRoZSBtZWFzdXJlZCAKdGVt
cGVyYXR1cmUgZXhjZWVkcyB0aGUgdGVtcGVyYXR1cmUgc2V0IGJ5IFJFR19DUklUSUNBTF9URU1Q
LCB0aGUgCnByb2Nlc3NvciBpcyBwb3dlcmVkIG9mZiBhbmQgc2h1dCBkb3duLCBhbmQgdGhlbiBh
ZnRlciB0aGUgdGVtcGVyYXR1cmUgCnJldHVybnMgdG8gdGhlIHRlbXBlcmF0dXJlIHNldCBieSBS
RUdfUkVQT1dFUl9URU1QLCBpdCBpcyBkZWNpZGVkIAp3aGV0aGVyIHRvIHBvd2VyIG9uIGFnYWlu
IG9yIHJlbWFpbiBpbiB0aGUgc2h1dGRvd24gc3RhdGUgYmFzZWQgb24gdGhlIAphY3Rpb24gc2V0
IGJ5IFJFR19DUklUSUNBTF9BQ1RJT05TLCB3aGV0aGVyIGl0IGlzIHJlYm9vdCBvciBwb3dlcm9m
Zi4KClNvIGJhc2VkIG9uIHRoZSBhYm92ZSBkZXNjcmlwdGlvbiwgSSB0aGluayBpdCB3b3VsZCBi
ZSBiZXR0ZXIgdG8gCmNhbGzCoCJSRUdfQ1JJVElDQUxfQUNUSU9OUyIgYXMgIlJFR19SRVBPV0VS
X0FDVElPTlMiLiAKIlJFR19DUklUSUNBTF9BQ1RJT05TIiBnaXZlcyBwZW9wbGUgdGhlIGZpcnN0
IGltcHJlc3Npb24gdGhhdCBpdCBpcyB1c2VkIAp0byBzZXQgYWN0aW9ucyByZWxhdGVkIHRvIFJF
R19DUklUSUNBTF9URU1QLgoKSXQgaXMgYWxzbyByZWNvbW1lbmRlZCB0byBhZGQgdGhlIGFib3Zl
IGRlc2NyaXB0aW9uIG9mIHRlbXBlcmF0dXJlIApjb250cm9sIGFuZCBhY3Rpb24gc2V0dGluZ3Mg
aW4gdGhlIGNvZGUuIEN1cnJlbnRseSwgc29waGdvIGRvZXMgbm90IGhhdmUgCmEgY2xlYXIgZG9j
dW1lbnQgZGVzY3JpcHRpb24gZm9yIHRoaXMgcGFydCwgYW5kIGFkZGluZyBpdCB3aWxsIGhlbHAg
dXMgCnVuZGVyc3RhbmQgaXRzIGZ1bmN0aW9ucy4KCkFkZGluZyBzb3BoZ28gZW5naW5lZXJzIENo
dW56aGkgYW5kIEhhaWppYW8sIEZZSS4KCj4gKyNkZWZpbmUgUkVHX0NSSVRJQ0FMX1RFTVAJCQkw
eDY2Cj4gKyNkZWZpbmUgUkVHX1JFUE9XRVJfVEVNUAkJCTB4NjcKPiArCj4gKyNkZWZpbmUgQ1JJ
VElDQUxfQUNUSU9OX1JFQk9PVAkJCTEKPiArI2RlZmluZSBDUklUSUNBTF9BQ1RJT05fUE9XRVJP
RkYJCTIKCkFzIEkgc2FpZCB1cG9uLCBhY3Rpb25zIGFyZSBub3QgcmVsYXRlZCB0byBjcml0aWNh
bCwgYnV0IGlzIGZvciAKcmVzdG9yaW5nIGZyb20gY3JpdGljYWwsIHN1Z2dlc3QgdG8gZ2l2ZSBh
IGJldHRlciBuYW1lLgoKWy4uLi4uLl0KCj4gK3N0YXRpYyBzc2l6ZV90IGNyaXRpY2FsX2FjdGlv
bl9zaG93KHN0cnVjdCBkZXZpY2UgKmRldiwKWy4uLi4uLl0KPiArc3RhdGljIHNzaXplX3QgY3Jp
dGljYWxfYWN0aW9uX3N0b3JlKHN0cnVjdCBkZXZpY2UgKmRldiwKClsuLi4uLi5dCgpUaGUgc2Ft
ZSByZWFzb24gYXMgdXBvbiwgImNyaXRpY2FsX2FjdGlvbl94eHgiIGlzIG1pc2xlYWRpbmcuCgpb
Li4uLi4uXQoKPiArc3RhdGljIGludCBzZzIwNDJfbWN1X3JlYWRfdGVtcChzdHJ1Y3QgZGV2aWNl
ICpkZXYsCj4gKwkJCQl1MzIgYXR0ciwgaW50IGNoYW5uZWwsCj4gKwkJCQlsb25nICp2YWwpCj4g
K3sKPiArCXN0cnVjdCBzZzIwNDJfbWN1X2RhdGEgKm1jdSA9IGRldl9nZXRfZHJ2ZGF0YShkZXYp
Owo+ICsJaW50IHRtcDsKPiArCXU4IHJlZzsKPiArCj4gKwlzd2l0Y2ggKGF0dHIpIHsKPiArCWNh
c2UgaHdtb25fdGVtcF9pbnB1dDoKPiArCQlyZWcgPSBjaGFubmVsID8gUkVHX0JPQVJEX1RFTVAg
OiBSRUdfU09DX1RFTVA7Cj4gKwkJYnJlYWs7Cj4gKwljYXNlIGh3bW9uX3RlbXBfY3JpdDoKPiAr
CQlyZWcgPSBSRUdfQ1JJVElDQUxfVEVNUDsKPiArCQlicmVhazsKPiArCWNhc2UgaHdtb25fdGVt
cF9jcml0X2h5c3Q6Cj4gKwkJcmVnID0gUkVHX1JFUE9XRVJfVEVNUDsKPiArCQlicmVhazsKPiAr
CWRlZmF1bHQ6Cj4gKwkJcmV0dXJuIC1FT1BOT1RTVVBQOwo+ICsJfQo+ICsKPiArCXRtcCA9IGky
Y19zbWJ1c19yZWFkX2J5dGVfZGF0YShtY3UtPmNsaWVudCwgcmVnKTsKPiArCWlmICh0bXAgPCAw
KQo+ICsJCXJldHVybiB0bXA7Cj4gKwkqdmFsID0gdG1wICogMTAwMDsKPiArCj4gKwlyZXR1cm4g
MDsKPiArfQo+ICsKPiArc3RhdGljIGludCBzZzIwNDJfbWN1X3JlYWQoc3RydWN0IGRldmljZSAq
ZGV2LAo+ICsJCQkgICBlbnVtIGh3bW9uX3NlbnNvcl90eXBlcyB0eXBlLAo+ICsJCQkgICB1MzIg
YXR0ciwgaW50IGNoYW5uZWwsIGxvbmcgKnZhbCkKPiArewo+ICsJcmV0dXJuIHNnMjA0Ml9tY3Vf
cmVhZF90ZW1wKGRldiwgYXR0ciwgY2hhbm5lbCwgdmFsKTsKPiArfQpDYW4gd2UgbWVyZ2Ugc2cy
MDQyX21jdV9yZWFkIGFuZCBzZzIwNDJfbWN1X3JlYWRfdGVtcO+8nwo+ICsKPiArc3RhdGljIGlu
dCBzZzIwNDJfbWN1X3dyaXRlKHN0cnVjdCBkZXZpY2UgKmRldiwKPiArCQkJICAgIGVudW0gaHdt
b25fc2Vuc29yX3R5cGVzIHR5cGUsCj4gKwkJCSAgICB1MzIgYXR0ciwgaW50IGNoYW5uZWwsIGxv
bmcgdmFsKQo+ICt7Cj4gKwlzdHJ1Y3Qgc2cyMDQyX21jdV9kYXRhICptY3UgPSBkZXZfZ2V0X2Ry
dmRhdGEoZGV2KTsKPiArCWludCB0ZW1wID0gdmFsIC8gMTAwMDsKPiArCWludCBoeXN0X3RlbXAs
IGNyaXRfdGVtcDsKPiArCWludCByZXQ7Cj4gKwl1OCByZWc7Cj4gKwo+ICsJaWYgKHRlbXAgPiBN
Q1VfUE9XRVJfTUFYKQo+ICsJCXRlbXAgPSBNQ1VfUE9XRVJfTUFYOwo+ICsKPiArCW11dGV4X2xv
Y2soJm1jdS0+bXV0ZXgpOwo+ICsKPiArCXN3aXRjaCAoYXR0cikgewo+ICsJY2FzZSBod21vbl90
ZW1wX2NyaXQ6Cj4gKwkJaHlzdF90ZW1wID0gaTJjX3NtYnVzX3JlYWRfYnl0ZV9kYXRhKG1jdS0+
Y2xpZW50LAo+ICsJCQkJCQkgICAgIFJFR19SRVBPV0VSX1RFTVApOwo+ICsJCWlmIChoeXN0X3Rl
bXAgPCAwKSB7Cj4gKwkJCXJldCA9IC1FTk9ERVY7Cj4gKwkJCWdvdG8gZmFpbGVkOwo+ICsJCX0K
PiArCj4gKwkJY3JpdF90ZW1wID0gdGVtcDsKPiArCQlyZWcgPSBSRUdfQ1JJVElDQUxfVEVNUDsK
PiArCQlicmVhazsKPiArCWNhc2UgaHdtb25fdGVtcF9jcml0X2h5c3Q6Cj4gKwkJY3JpdF90ZW1w
ID0gaTJjX3NtYnVzX3JlYWRfYnl0ZV9kYXRhKG1jdS0+Y2xpZW50LAo+ICsJCQkJCQkgICAgIFJF
R19DUklUSUNBTF9URU1QKTsKPiArCQlpZiAoY3JpdF90ZW1wIDwgMCkgewo+ICsJCQlyZXQgPSAt
RU5PREVWOwo+ICsJCQlnb3RvIGZhaWxlZDsKPiArCQl9Cj4gKwo+ICsJCWh5c3RfdGVtcCA9IHRl
bXA7Cj4gKwkJcmVnID0gUkVHX1JFUE9XRVJfVEVNUDsKPiArCQlicmVhazsKPiArCWRlZmF1bHQ6
Cj4gKwkJbXV0ZXhfdW5sb2NrKCZtY3UtPm11dGV4KTsKPiArCQlyZXR1cm4gLUVPUE5PVFNVUFA7
Cj4gKwl9Cj4gKwpJdCBpcyByZWNvbW1lbmRlZCB0byBhZGQgc29tZSBjb21tZW50cyB0byBleHBs
YWluIHdoeSB3ZSBuZWVkIHRvIGVuc3VyZSAKdGhhdCBjcml0X3RlbXAgaXMgZ3JlYXRlciB0aGFu
IG9yIGVxdWFsIHRvIGh5c3RfdGVtcC4gVGhpcyBpcyBlbnRpcmVseSAKYmVjYXVzZSB0aGUgY3Vy
cmVudCBNQ1UgZG9lcyBub3QgbGltaXQgdGhlIGlucHV0LCB3aGljaCBtYXkgY2F1c2UgdXNlciAK
dG8gc2V0IGluY29ycmVjdCBjcml0X3RlbXAgYW5kIGh5c3RfdGVtcC4KPiArCWlmIChjcml0X3Rl
bXAgPCBoeXN0X3RlbXApIHsKPiArCQlyZXQgPSAtRUlOVkFMOwo+ICsJCWdvdG8gZmFpbGVkOwo+
ICsJfQo+ICsKPiArCXJldCA9IGkyY19zbWJ1c193cml0ZV9ieXRlX2RhdGEobWN1LT5jbGllbnQs
IHJlZywgdGVtcCk7Cj4gKwo+ICtmYWlsZWQ6Cj4gKwltdXRleF91bmxvY2soJm1jdS0+bXV0ZXgp
Owo+ICsJcmV0dXJuIHJldDsKPiArfQo+ICsKWy4uLi4uLl0KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
