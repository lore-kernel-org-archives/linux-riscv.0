Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 013A1C5B549
	for <linux-riscv@archiver.kernel.org>; Sat, 31 May 2025 02:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TSuhOckXzaUQncqGpnQ3RFH/sLiHxV1h6386WC8ut3A=; b=SA4HaFwx3rsFYtWiBnRSJrFBJf
	W+ePemgvO+euQ9wJSABULl/g7yhAsWdGKjQuWZKeH7ckMGzvaCATAPCIdGy4JU7BauWOrvntWqCE+
	z2aLz5O3beZWTIeMfi0V2g7aojSCeSLClw59GWyrUNekUrcUKQfWvvARgy9Vr8ngMmMSWaId2ubeb
	uMD+bPM6empYSQLJrVweGERZJMud7q79wsD2VUmZ/pxcX9pR72VHE8GH7+EIovOYTS/TQmk3WVYd8
	8Cvqw2dBEq4hnJT4byjZy9/D9xzJZVZMkWAYeb+jFsQfoyBz+vE+3OxVPctJelsSwniD+IcN2LEsX
	RgQX48UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLCPV-00000003BBK-1haX;
	Sat, 31 May 2025 02:57:25 +0000
Received: from mail-southindiaazolkn190100000.outbound.protection.outlook.com ([2a01:111:f403:d408::] helo=MA0PR01CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLCIg-000000039q5-2UDh
	for linux-riscv@lists.infradead.org;
	Sat, 31 May 2025 02:50:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fkLL6+9y+ZioJyIpeoGGtY9YyflRdhg2bnjtZuDNku03YviX518jXbj2Oir7wUxQnPfwZBcd8LwVXqv3jbxmXnWT8BTDZCbTO3iPzw9tXmXuj+NXRkw08kzz6WAVVfMuW57rS9/vhPHq4ilywpkcwE9LIbUw0LS4iVy9PY+JQXSOW+C8Dj3VNwYhbISdywn2RGWJcnUMMrspLQy8x4xXzR+bP1/ra7Dhj3UDUKkdN68sVv2Hu0T4f0tBO8J1/PXVltc74l3AnRWLhjjsAOn2VZAotYhB/v++oyyi8oDvdEDqTeTkMVHLgF+BzTkQv5/EGFwtFGSpaxJkSs65y30Cqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ucgg4cKgP7e8iXvxtmSJcx6Z3CitFhsVwp6QTRyuVWo=;
 b=gcSqrLnsV+bg9jbyvFkzODv1pBi7CvLryhsc1sKwqhrbeHaFSKNT36744VDixWJg30q7kuHJuuDV57cJvZkMpDP46Eb7QOIWV5TVIR2PO22p6KDUGjLqPNDQg2cQbW05FZi/tMpYD2KgS9Olp4+V9S4Y7VlTGfSf5FMXQKNtpzLsf9iz5Q5cdtHyGUPAjggxGXzCL2SwUHnQiKUo9MDb2B/vcdyut4fX5wRraSSYtOrurO4WBFse8xEIEEWn08sy6OfhlJ/9LykdzeRqKECCFvlcaoYejDkfYE9zu6Eb84rHBlLxQ40Wo7/Z4SRVsCy6axABLlFGErtnjfb6vJ1APw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ucgg4cKgP7e8iXvxtmSJcx6Z3CitFhsVwp6QTRyuVWo=;
 b=Dw1rDYfsrFQUZHacPOEaWLCRf9uuGuFjrrh8BOINOK/ebHw7PLB+RdueejRZ2wf+I9CAct3s5qDaZ2pbCxExyuVih4QfF9c4PFZ3ZMg6CRkTAM7Sgu0kh3RFM5HqKRkhkFBgwHaElQcuTmaxt/vQY8v9HD6beyoLDmbZQS6RXi8vrheDGdYKENIDuROvpb/q8sfo0TK1TYq6eG5O+ZzWj5Ptpu4jFiXYaBZiWTR5X8phHeS+7BR86B02ebouzvC0UnYh8k3zj0SGn4ruLUbYBUj3Zs6BnQ2+0Cb9mmyy2wGOHMlFcwFUOCk5H1rWS+CtVYh5nimWXCihLTuLqPQDfw==
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:100::6)
 by PN3PPFD6B622E24.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::d6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.35; Sat, 31 May
 2025 02:50:02 +0000
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4]) by MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4%5]) with mapi id 15.20.8769.033; Sat, 31 May 2025
 02:50:02 +0000
Message-ID: <MA0P287MB226230791E82A7A4D566C224FE60A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Date: Sat, 31 May 2025 10:49:58 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] riscv: dts: sophgo: add zfh for sg2042
To: Inochi Amaoto <inochiama@gmail.com>, Han Gao <rabenda.cn@gmail.com>
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org
References: <cover.1747235487.git.rabenda.cn@gmail.com>
 <104dde6002c268a39fab6fcf469adc26d49ba364.1747235487.git.rabenda.cn@gmail.com>
 <MA0P287MB226290B908D3209E5C890BFAFE90A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
 <CAAT7Ki-33DcA7xeBzzv1hm0wR_ebcVdux5fQxGVrLs45RbGM9A@mail.gmail.com>
 <MA0P287MB226265FFA15A808221629848FE64A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
 <4vuneynwhmsyokkuw3wlabxij6kobl6j7bbbcymlcmsdc2hhb7@u5mhb7je74km>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <4vuneynwhmsyokkuw3wlabxij6kobl6j7bbbcymlcmsdc2hhb7@u5mhb7je74km>
X-ClientProxiedBy: TYAPR01CA0215.jpnprd01.prod.outlook.com
 (2603:1096:404:29::35) To MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:100::6)
X-Microsoft-Original-Message-ID: <da4385b0-4c32-4c4f-9b35-fe6f5442fcd2@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2262:EE_|PN3PPFD6B622E24:EE_
X-MS-Office365-Filtering-Correlation-Id: 79c4c5c1-e98d-45b7-e3c6-08dd9fedd6eb
X-Microsoft-Antispam: BCL:0;ARA:14566002|8060799009|7092599006|15080799009|19110799006|5072599009|6090799003|461199028|3412199025|440099028|10035399007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bkpHa2hKSUx1eXZwWGEyTGV5b1I1Y256WHJPTlZTOWJrT1gySTFXOWtxN2pr?=
 =?utf-8?B?SWlWR3luK2Z4YXRidmhucFVyb2VHM01PellNM0VxWUl6RUhoNWRCMUoxN1Bs?=
 =?utf-8?B?WG5zbWVxTWNYZnFhWlFCcExQaXc1cmlUbTB4ajFoNkVWY2hZei9PYUh2U3E4?=
 =?utf-8?B?M1U3TVYxUTA4MnJJUGdJdDdDNERnTFlBdVUvaWEvZG1vTVh2ai80RzZXeU84?=
 =?utf-8?B?bHdUVzcySndJK1Q5S1lsR3FsV3ZwSmxzcDk1eTMyanUwSms0YkoxZFdPRWQx?=
 =?utf-8?B?bXB5MEMrWWlJTmZ1TGp6L2xkN0JPWmx0dEE2T0xuQittbld0YUxjc05MdmF6?=
 =?utf-8?B?allkenBaeFRJN05FVVBrVHhScEFpejNPaUE0TXFObmlLdGRrdFUvZWlBR2E2?=
 =?utf-8?B?Mk1CZDkvMVZQS0Rxa0xkRFNqRC9keGJKSVJmTXovT0FvYTNNRlRlWk9ncUUy?=
 =?utf-8?B?dytZZFpkRktvK3ZIaXpWQzBCS3FQYXFkSklVSTl0Tlh5RVVhcHAyVk4xMnlp?=
 =?utf-8?B?OFBIalYvenU2SGQxeTNXdWlPVlltV1YyeUVjYnYvaWVKeEJ3RVhhTmQ1UGlt?=
 =?utf-8?B?MlB0eE05WWhGVmVIKy9CYWFybVZyY2d6Z2h1c1R2Z1NlTEhKUmhob25OS2h5?=
 =?utf-8?B?NUNIcG8vTWhRZFBURFh5cERoU0xqaVRqRUcxdWltNkgzdGxieUMwV1BxZWdB?=
 =?utf-8?B?TFUvQjQxc2dLeHQ2RVJzSThVOWNKVGhZUjFIOVo0Z2k4RzMvWFNCUXYrT0h0?=
 =?utf-8?B?cEc4Ly83RVlCSnpWK1B2SlpvMWZhV01FNnFPM1REMGovbjZ4S0Y1N1RwcUFi?=
 =?utf-8?B?Z1RDUVRuTFdScmw5LzZqRTkwdExXNXovZXEyaWN1eDZZU3loK0ROSEhFYjgr?=
 =?utf-8?B?V0xGTzE5RFMxOWFJZTFub2twdkpaYmZDSDFsdDRXYkFUSkYrMXp2WFdtVzRj?=
 =?utf-8?B?cDVmdGkrWnFJWWFLeUQyWGJ0SDRMdVlzbXlGVHc4bUlNRGtINVYyY1llOGtC?=
 =?utf-8?B?bUxwbDVwdmxmbUNCRTkxaWxtNGc5Nk9Nb2I5VVFzL0JKMWR6cm5wejZaMHdx?=
 =?utf-8?B?TUQ5TTNlclkvV0tsZmdVWmV3Ymw5b2dxMkdlUDNMemQzaVMvT1FQU0MrWFNG?=
 =?utf-8?B?cGovVU9STlgxSmhLQUhPTk5Yck11bVJ5YVFNR3ZQVDlJdjNUL1ozR2RveHBh?=
 =?utf-8?B?QzZGTnozVjloZloyQloralFjbXBjQ1dYZDhsU1NOZm9rbjBYYWtuMzZlVzFp?=
 =?utf-8?B?ZFZZWWdTcjdOM0swK3Evdy8xUVZaS1JmZ3RjM3FYc1pmZ3BnejNrcVdhS3h3?=
 =?utf-8?B?b3ZnN2kxa2sxWmxJU2RYYnJ0eTlHL3dPbHRsNEgyY0Ria0hrQ1FzWFFxSkhy?=
 =?utf-8?B?V0RiVWR3M1RueGdiellqWlUvUk1LVjlZQlFJdE53VWE0QnlXR2dwQ2tVQmRK?=
 =?utf-8?B?K2hBZ1Y4TUpyWjJlTm1qS3dzd3hEdnhIWU92bHl0eEtvaEtsbHRWRUl5MmRt?=
 =?utf-8?B?RkZRWnRPRnprbkRFQVZmNEkvenhkL0o0UVFyWlVDcWN0TS9uZ1B4aTNOSXcr?=
 =?utf-8?Q?lDtAU5/mhzCqn2ODTHJ+6jOJF8o9WC8e0HigXjOW+sUXO0?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QVFsTWxJamNhUTBEa21zakRHUUpIaHpSU0ZmZEl3KzZtNnF4M1lVbTV1dzgv?=
 =?utf-8?B?Q2dGR3M0c3Z4Q2VheHZTSEpmV3dSd242VGsxc3hxTWJGV0xZRVBpZGlKWVB3?=
 =?utf-8?B?ME5NL1FiZE83NUdoeE1EWTVSM0phcmtaQlhWUGtxYmR5bjJNUGpUY3dnOVM4?=
 =?utf-8?B?d1E2eWQwQk5pUDlIa1ZaY0ZnVHlZYkJjUzFHaExhMjBIOFhCSmdaYVgwUmJC?=
 =?utf-8?B?ZHRUcnBFRlllMnNSdUF5OUczUitxUVNjdFQxTnhJSVArbUZBdjFXMjJYMjVH?=
 =?utf-8?B?ZGs2Y1VHTFA4VTZNbVVHRXFnSVZKYWgzZDYxSHVCOEhFdGxYWi9lRXZ2ZXBi?=
 =?utf-8?B?ZHh3NWhxYnQ3VFRvMlZPWUs0eHVKYzhuTG92QUdkM0JvdVhMWmVuUzFLRnhp?=
 =?utf-8?B?ZytVbDZHM1J4bjNmWGpxLzBZK1FSRFROQ2I1ZnhCc1k4b09GeHJ3azlvbkh0?=
 =?utf-8?B?ZTNBYTdrNzFwUW53UUlCaWNhU3R5U2dJb0MxVHJLUHBXNkdKeWJtei94Wm5k?=
 =?utf-8?B?YzUxSDJvb2xUSTVyNUVuNHpOMEtFUmoxQ3U2TFpYdkJTU243cCsxbFBjajVi?=
 =?utf-8?B?L084aENCZXJ3cEZhV0ViZUFabFgrT1d5NjVHZFgyMm5JNW53Y2VDd2NzT3Q1?=
 =?utf-8?B?TWEyeGhVcDlMd0dCOTYya0hDNXBLbCtZaVBmM00zbDZwTU1kbmFXQ2F4VmVF?=
 =?utf-8?B?TnhrV25XYlJPUjREZGtFQ0o5NGJYeTdxM0dNQVZCMUkySzFMWHpMMXNXNFpw?=
 =?utf-8?B?OENiVDFYTUhxVC9OUzFpM1NNNWJzVFNudXdDeVhGcHY3U0lwM25KTUpROGV6?=
 =?utf-8?B?aDFaSGtNYTFiSk5WMTlwOTZFYVB2dEgvbFhuWFF3OW12ZVdVaEFXTDhNNEJL?=
 =?utf-8?B?aGd6TmxIQ0RBaVZHbmNDRzYzb1g5TXhUZ3BDQ2VYVWdaUFJ2MWF3bVpaNzlJ?=
 =?utf-8?B?NWZlRUJIMGZLS0RYMU50aytjUnlscjhYRlJCVHUvM05lVVp3UzdTRFJ6VnJX?=
 =?utf-8?B?Nk1SNVBGcjBSWEd6U1ljUkJJdHBFYTYwTVRDKzhWc2hicjdpZHZITVlHMkVK?=
 =?utf-8?B?WmFxbHp1M0NoR3FKbEh4OUdzMXVpc3cwRkxtNVlVNHlkU3Q5WVFKOEg5ZXB1?=
 =?utf-8?B?QVhoK0svcTZ4OVIrRDd5bXVQRU1CSkZIbEVtNVBpNlkzTXZoQzdxU0s3dTBv?=
 =?utf-8?B?ck1pM1RsbHdYSm1jUjJ6Vi9lUytZZjZITWZFREJ5SmYxcXZZc05NZDdBcW5a?=
 =?utf-8?B?ZkRyUGtWdTFsVHh5QTF1cldrUDBTSW9KNVVScUp5OTFQZHhxdFgxVS9vTkVZ?=
 =?utf-8?B?SVRXU3JlTFFNYkdCbkM3cXdSdk1KQnZpb20wc2lEMjIwamR1NXpUNGk4T0M4?=
 =?utf-8?B?QlA2OWRpRHlGZDhnaklmU1pwUHdXVEZWY0hzakNvMUt6dEdOa0tHOWg1TG5C?=
 =?utf-8?B?bXk4cHNNOGxudGJYazFISVBFSmtOVW43NzFXWDNOTysxNzIxRzN1MDBDNWw2?=
 =?utf-8?B?bnBHWHZxajNmbk9Kb0xJUHhUT2duVk1IVjlucHNwUS9CVTJEWUVvb1djSTVQ?=
 =?utf-8?B?MmVBNzgzT0tENUtPZkk1aklJQ2tpcG5NVE1ROUJzUzJWMkdYMURGM0NmREJL?=
 =?utf-8?B?WWtmaUhkYU0zeGU4N0RpbE5hOTBOTThvZWViNU56Wms2aE4rNUZwdHArNWlD?=
 =?utf-8?B?QTNXWlN3ZmN2UXN2SDJGSDZMcWYwTXFnRzE1TXFKcWwzczdmeE5YQ2tQTVN1?=
 =?utf-8?Q?En2jMeo5Oj+SVrx6bahq6b7HCl35s2vVVsKUmUn?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79c4c5c1-e98d-45b7-e3c6-08dd9fedd6eb
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2025 02:50:02.1295
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PPFD6B622E24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_195022_626361_5306580A 
X-CRM114-Status: GOOD (  14.36  )
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

Ck9uIDIwMjUvNS8zMSA5OjM0LCBJbm9jaGkgQW1hb3RvIHdyb3RlOgo+IE9uIFR1ZSwgTWF5IDI3
LCAyMDI1IGF0IDA2OjIyOjA1UE0gKzA4MDAsIENoZW4gV2FuZyB3cm90ZToKPj4gT24gMjAyNS81
LzI3IDE3OjM0LCBIYW4gR2FvIHdyb3RlOgo+Pj4gT24gVGh1LCBNYXkgMTUsIDIwMjUgYXQgOToz
M+KAr0FNIENoZW4gV2FuZyA8dW5pY29ybl93YW5nQG91dGxvb2suY29tPiB3cm90ZToKPj4+PiBP
biAyMDI1LzUvMTQgMjM6MTUsIEhhbiBHYW8gd3JvdGU6Cj4+Pj4+IHNnMjA0MiBzdXBwb3J0IFpm
aCBJU0EgZXh0ZW5zaW9uIFsxXS4KPj4+Pj4KPj4+Pj4gTGluazogaHR0cHM6Ly9vY2Mtb3NzLXBy
b2Qub3NzLWNuLWhhbmd6aG91LmFsaXl1bmNzLmNvbS9yZXNvdXJjZS8vMTczNzcyMTg2OTQ3Mi8l
RTclOEUlODQlRTklOTMlODFDOTEwJUU0JUI4JThFQzkyMFIxUzYlRTclOTQlQTglRTYlODglQjcl
RTYlODklOEIlRTUlODYlOEMlMjh4cnZtJTI5XzIwMjUwMTI0LnBkZiBbMV0KPj4+Pj4KPj4+Pj4g
U2lnbmVkLW9mZi1ieTogSGFuIEdhbyA8cmFiZW5kYS5jbkBnbWFpbC5jb20+Cj4+Pj4+IC0tLQo+
Pj4+PiAgICAgYXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vc2cyMDQyLWNwdXMuZHRzaSB8IDI1
NiArKysrKysrKysrLS0tLS0tLS0tLQo+Pj4+PiAgICAgMSBmaWxlIGNoYW5nZWQsIDEyOCBpbnNl
cnRpb25zKCspLCAxMjggZGVsZXRpb25zKC0pCj4+Pj4+Cj4+Pj4+IGRpZmYgLS1naXQgYS9hcmNo
L3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9zZzIwNDItY3B1cy5kdHNpIGIvYXJjaC9yaXNjdi9ib290
L2R0cy9zb3BoZ28vc2cyMDQyLWNwdXMuZHRzaQo+Pj4+PiBpbmRleCBmNDgzZjYyYWIwYzQuLjhk
ZDFhM2M2MGJjNCAxMDA2NDQKPj4+Pj4gLS0tIGEvYXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28v
c2cyMDQyLWNwdXMuZHRzaQo+Pj4+PiArKysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9z
ZzIwNDItY3B1cy5kdHNpCj4+Pj4+IEBAIC0yNTYsMTEgKzI1NiwxMSBAQCBjb3JlMyB7Cj4+Pj4+
ICAgICAgICAgICAgICAgICBjcHUwOiBjcHVAMCB7Cj4+Pj4+ICAgICAgICAgICAgICAgICAgICAg
ICAgIGNvbXBhdGlibGUgPSAidGhlYWQsYzkyMCIsICJyaXNjdiI7Cj4+Pj4+ICAgICAgICAgICAg
ICAgICAgICAgICAgIGRldmljZV90eXBlID0gImNwdSI7Cj4+Pj4+IC0gICAgICAgICAgICAgICAg
ICAgICByaXNjdixpc2EgPSAicnY2NGltYWZkYyI7Cj4+Pj4+ICsgICAgICAgICAgICAgICAgICAg
ICByaXNjdixpc2EgPSAicnY2NGltYWZkY196ZmgiOwo+Pj4+IE5lZWQgbm90IHRvdWNoIHRoaXMu
ICJyaXNjdixpc2EiIGlzIGRlcHJlY2F0ZWQgYW5kIHJlcGxhY2VkIGJ5Cj4+Pj4gInJpc2N2LGlz
YS1iYXNlIiAmICJyaXNjdixpc2EtZXh0ZW5zaW9ucyIuCj4+Pj4KPj4+PiBBbmQgb25seSBhZGRp
bmcgemZoIGZvciB0aGlzIGxvb2tzIGEgYml0IHdlcmlkLgo+Pj4+Cj4+Pj4gQWN0dWFsbHksIEkg
cGxhbiB0byByZW1vdmUgInJpc2N2LGlzYSIgbGF0ZXIsIHNvIHBsZWFzZSBkb24ndCB0b3VjaCB0
aGlzCj4+Pj4gZnJvbSBub3cgb24uCj4+PiBJIHRoaW5rIHRoYXQgc2luY2UgdGhlIGxpbnV4IGtl
cm5lbCBpcyB0aGUgdXBzdHJlYW0gZm9yIGRldmljZXRyZWUsIGl0Cj4+PiBjYW5ub3QgeWV0IHJl
bW92ZSByaXNjdiwgaXNhIG5lZWRzIHRvIG1haW50YWluIGNvbXBhdGliaWxpdHkuCj4+IE9LLCBt
YXliZSBpdCdzIG5vdCBnb29kIHRvIHJlbW92ZSAicmlzY3YsaXNhIi4KPj4KPj4gQ2FuIHRoaXMg
cGF0Y2ggbm90IG1vZGlmeSAicmlzY3YsaXNhIiwgYnV0IG9ubHkgYWRkIHNvbWV0aGluZyBmb3IK
Pj4gInJpc2N2LGlzYS1leHRlbnNpb25zIj8KPj4KPiBJIGNhbiByZW1vdmUgdGhpcyB3aGlsZSBt
ZXJnaW5nIHRoZSBwYXRjaCwgaXMgaXQgT0sgZm9yIHlvdT8KPgo+IFJlZ2FyZHMsCj4gSW5vY2hp
CgpASW5vY2hpLAoKSGFuIGRvZXMgbm90IHdhbnQgdG8gcmVtb3ZlIHRoaXMgInJpc2N2LGlzYSLv
vIxoZSBzYWlkIHNvbWUgb3RoZXIgCmNvbXBvbmVudHMsIHN1Y2ggYXMgdS1ib290IG1heSBoYXZl
IGRlcGVuZGVuY3kgb24gdGhpcy4KCkBIYW4sIHBsZWFzZSBwcm92aWRlIG1vcmUgaW5mbyBpZiBu
ZWVkZWQuCgpUaGFua3MsCgpDaGVuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
