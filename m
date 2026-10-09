Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15594CA601E
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Oct 2026 19:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yRGdYYBP05YQkwiUuF6TdYkJ++ypbxG2fBUUsuxc9mc=; b=wWEudPqy42X6bGPKOLy8mHxTau
	019CnOyTjREZQgffe2DdsD1OG7F/IueYiH0oKlsaklPSBFEFyUv10jOQQfGRho7z7vbkAc18Ih5Cw
	un1eZ6a0IMJTJkCD56ymcvZfbDDRatrUnIlOz+R+7/2hyamHd4DGqXrZE+wzTjzlWizYeGqZWF/m/
	RzQM9uqQBoY/fpey0H85tdQTR8JzUgKitpRWjG8I7ZJkqa9/JYDy3uQsto48jWdTHAao7cZmSE05D
	PyFt7blvgpiIfoRPq96+6mQ9TSya/sysfQDrD0mxnmutLUrolMKlz5xD6Dyvv9g6d+y5pj0Q53DIn
	UomoMLew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFFxv-000000074O8-2zzE;
	Fri, 09 Oct 2026 19:09:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFFxt-000000074Nl-2Qde
	for linux-riscv@bombadil.infradead.org;
	Fri, 09 Oct 2026 19:09:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=kdvwojrQS/VRbfFitEfuffPZySJSuUdRXsq0Bl5St6w=; b=IyZjhVAX9UX4C55zEAd9RU3mth
	3AnLKlpwel1r1OP8qK8dLz4tQOTnJPXzDbvmzDzmbM1SO1HfqjmwmnpGNZXxMw3sNxzaOo0NIA8en
	SjS6ZIaVa0/G6DpbMsO0HhTHjqIhe7/gNk+xuclWTwzmHj8o7W6qasvY7jE1M7I8mNuiZaDlbF+QL
	PuJfUeFuSM6TN7KNMac/2Z3KcyloklSGac4Yykg+/3iF7AxF/tzqG8dp5BQH1edsl2NzUDrOgSPx+
	63Fh5+jeySg6Jmjh5TdfbNNQ2j3P4yKxosrlAPMkWLATREuSIJca6toqOiYMbFlDIY6hcgSuaqSy3
	5KrcM1Lw==;
Received: from mail-japaneastazolkn190110001.outbound.protection.outlook.com ([2a01:111:f403:d405::1] helo=TYVP286CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xFFxq-0000000BZYM-0NnT
	for linux-riscv@lists.infradead.org;
	Fri, 09 Oct 2026 19:09:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vGh4l9pkrnFv20ssEwjE4+Q2wOiQvdleisC4Xg0pJfbedfDy9ZvTmYH4/FHmBvt5tefiAqTRvs7/oYYoe5N7NQRS6+zNy1MOauMieO1qy7am+p+nELfceWWW1VtBy2jYwQk/GxgfEVFGcaMYroTaK2FJdlK/T2VDoYlHFJpuuNijhSuddq6eFo3Dr7d9MYl5vpYEmimIrDsWcC540MN9Idmnbkyj0/YpG1TapvPkyi7mcuoXmskdJmjLtWP/dPS+7iYS+8R0Kqpy5KRTPkN949r6Q6ZmaH3A8+MyawLD66/rNCYxXkPTVfREk1ehT02kpoxwnWUngiHi9uXBVXS2NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kdvwojrQS/VRbfFitEfuffPZySJSuUdRXsq0Bl5St6w=;
 b=Y3qUolyxl+Askmc07topKBIX4s/PKJ3toql+OrVkpQfuHJjOTKFFFqITuXB38+cjr6kru/KbS9TTFcV3Qcj8bpJakWWDTwZ2xjWfKMuDCvBtfEH+7+4H438D1uG8CrhsNF11j+qUbedx4lbY0S4FfWpJ9bJse7Dy+n1WyWVaLcwpAQ22m/ZzsBRwOvxIS14U6n96xy83mD6p4egtJivRjiDcphz3T14OHm4clNEuoXvnTm5CE9j/YEgYV1NiV8w4BkKQYpRh5BxJYLenpbwsxyaHhQ6M/KSyLgsoze83a77RGmh9xJ4EYk8JWL6O6w2dNEtP6iRpDwLeuEOG+3Km3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kdvwojrQS/VRbfFitEfuffPZySJSuUdRXsq0Bl5St6w=;
 b=iuxAU7zq+gBjHVEEQhVpN1Yw57bFl5LTGFZoGH0NfOluhAjvpGOcsNJDgOcONtaXNNgB0EuVJSn7kv1R+qNXDJDtBANXmaBmgWB2H4twWl2bE5IL+q5MsgsNZjP2XRXlm9c5J5oFUhvcp5spbv0QMaEFdnc0L43bx5cfTf8QdlYFvjJLZUUzZsWugwFBcoNofhDZp8tbyAVtGD6UrvTV32gddnvo09r/pmPhjrW7e2aKKgW/6xQ88hjjbD+vr37VlhAZEND6MAYcEhHyACElHu5KgznWzOfQY5EKvgI1kgOd3iMp4Fttb75SbGixry3ibMjVY5F8ZUi3JHkLRJGsDw==
Received: from TYWPR01MB10887.jpnprd01.prod.outlook.com
 (2603:1096:400:2a9::12) by OS9PR01MB18080.jpnprd01.prod.outlook.com
 (2603:1096:604:4ab::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.16; Fri, 9 Oct
 2026 19:08:41 +0000
Received: from TYWPR01MB10887.jpnprd01.prod.outlook.com
 ([fe80::2b9:c4db:f079:a034]) by TYWPR01MB10887.jpnprd01.prod.outlook.com
 ([fe80::2b9:c4db:f079:a034%7]) with mapi id 15.21.0496.015; Fri, 9 Oct 2026
 19:08:41 +0000
Message-ID: <TYWPR01MB10887E1A3744FD44000F89E8F98922@TYWPR01MB10887.jpnprd01.prod.outlook.com>
Date: Sat, 10 Oct 2026 03:08:35 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] riscv: dts: spacemit: k3-com260-ifx: Add rfkill nodes
To: Jennifer Berringer <jberring@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
 James Morris <jmorris@namei.org>
References: <20260928231807.1757995-1-jberring@redhat.com>
 <20260928231807.1757995-5-jberring@redhat.com>
Content-Language: en-US
From: Shengyu Qu <wiagn233@outlook.com>
In-Reply-To: <20260928231807.1757995-5-jberring@redhat.com>
X-ClientProxiedBy: SEWP216CA0154.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2be::7) To TYWPR01MB10887.jpnprd01.prod.outlook.com
 (2603:1096:400:2a9::12)
X-Microsoft-Original-Message-ID: <bd1fd769-6102-4081-ad6f-fa05fb99d512@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYWPR01MB10887:EE_|OS9PR01MB18080:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ec6a55f-5b43-4c86-3e20-08df2638bae4
X-Microsoft-Antispam: BCL:0;ARA:14566002|19110799012|4140399003|25010399006|8060799015|41001999006|24021099003|6090799003|23021999003|15080799012|5072599009|52005399003|40105399003|10035399007|2607281247196008|3412199025|440099028|26104999009;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bW84MktkM0FVWFo1M0pjMExpRi8xVlRBOVVZZjdYVjM4cmdnVGNPczM1cmVk?=
 =?utf-8?B?cGI5QVFmQ3k3K0xUL1NVdjN3VWxlUFd5NzBqM3pNeHp1SzhkOUMrSjNGU014?=
 =?utf-8?B?b0N1Z2N1aGhKaHhHbmFFZmw2c0FqdWc1THJOM1ltc3lxeVZQWlZtOTRtUG1I?=
 =?utf-8?B?L2p5NDNnVXo5aFd0UVdVOVMrQkY1ejVRaU5ZcHVCVm5FQTVnTWVORjdwS05l?=
 =?utf-8?B?NS9HYzB2YXNiSVRFUEdXUGtjamttdVd4OXRveGY2akxtME1BMlRESE0xaXJB?=
 =?utf-8?B?NlBtM2ExOERHYkwwNkRtZmh0czhITWRPY1NsRk15UnBCcGNvcnc5Szh6b214?=
 =?utf-8?B?THIrM1Jua3ROYytVTXlTWFI5S2s3TkFQT0lhU3hFRGNXTkk2QzN6dnJOdVdk?=
 =?utf-8?B?ZmM0Q1k1S1FrOXpkTmpnMmpjaGU4aU93VDdhRzdiQWk4aEs1WCtmMk55Z05k?=
 =?utf-8?B?REJ4cnh4dEZib040US91TFFQUDhoMzhYb3RVL2lXRDFCdFBoWVAyUkEvaDBt?=
 =?utf-8?B?M3NXMDE1Um1xM2pTZmVGMUtTdSs0N2sxWko4V0IvM09iZEhKR3ZEYjdxQWFp?=
 =?utf-8?B?dGkyYWU3MlZqSVlmc2hkV2dveVhoZkRYNHVSZFUwcExLeDd5cWFRdllsd0xX?=
 =?utf-8?B?ZDR4d1RteUIxZGxYdzE0dWFLU29HSStvRC9PTk5IVzVhLzJwV1dIN0tQWTRP?=
 =?utf-8?B?OFVYa3pqTU5GRXRRRmRFeDZ2V2JacHAvRjduM0tkMnl2TktjSi9yOHVOdVNP?=
 =?utf-8?B?K1hKb3pFWlBvOFhjbkowTHNVdE9CTUZSZkFtMWU1K2RmdEZoRlF5UXplajRo?=
 =?utf-8?B?bG5mNWk2cWVndnZ4MUdVV0lCUTJMRkl2cUhwQ1VCbktaUldXU2o4RG5FL3ZP?=
 =?utf-8?B?NW1lUUtHUzgwRUVYMmZUNmlQdEUyd0loTmpRMTR1c1V4YjlZZkhQd0Ivd1ZZ?=
 =?utf-8?B?NUo2cXRZRGVOVVhtd2NJNWVhNWovOUFRbVpydy9wRm1GampFdmN3UCtQN2tu?=
 =?utf-8?B?ajNYc2FpbUNxMVBIN0F2anQxRmJtYjlmVzNRVnc0aGR0WDJmb2tRalQ3Rkpn?=
 =?utf-8?B?YVViM0Y2SGQ3Y3Z6YkZ0a1NDNVYrbzFjSGMvUjRpWDBvUkdRd1AzanliRTYw?=
 =?utf-8?B?R21EZGZuZGlqNVlHOHE3ZnpQaHlxT0MyRVBncGFmUzc2eHFjck55cFk1NHlz?=
 =?utf-8?B?R0JINENmYlRnczY1RVRqUHBQajZSSUZ3Q1dPRzlhNmlNOHZXaXo4aE9XSytY?=
 =?utf-8?B?bXg4UHIwM0VacVR6bUp6SjlnNDJnbmFWYWw3M3FwNVFHZTZFS1RhU1pDdkZq?=
 =?utf-8?Q?LzbmmREk2eqek=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmZwSDZ2ek85TE9PYnFDSUtnalhldTEyUUYxK3Btd3ZwMURxR0xvVHNBWGtq?=
 =?utf-8?B?SlNKNk5MVmRRWmE4VCtibG9rWjZIL3kvNXJDVXpacWVOeVRneFRzNzdQeDVM?=
 =?utf-8?B?MTJ0MXZwbGFTbHZXdG9vdFhLcGRxNVUyUU4wS3ljTEhyMEZJVlYwQUY5b1Ry?=
 =?utf-8?B?R2dVdWtMSXk1Y0ZYSEtWTVdGdjU5MnRocVpXVTJ3M1grVmNBc0JLTytIc29T?=
 =?utf-8?B?SUVncmlwM29PdDZ1YjR2V1RlMTRzN09QMmdpemp4akR1bE1EL1JmSHNFY0lE?=
 =?utf-8?B?eEF0c3ptKzRiVVkyV05FaXF2NStvejBzRExYbG9GNk9rQkg5NUJqU2VtYnVF?=
 =?utf-8?B?TEI4WGF4WTgzd2R3Y1d0aHZ1S0NyVGk4d0pnWEpMTUZEeHlRMnUrL29PditF?=
 =?utf-8?B?TWo1T0dnckwzdUkwZ3MwWitERm1XNEx6V3k0ZTJkRGh5OWdoeCtRWDhibENR?=
 =?utf-8?B?bHpJdXpBeVNBM3NIS1FUaEVLT2hjamtjUVVrN0JCUS9pWU9KMmxoL1BKTjNJ?=
 =?utf-8?B?SFlldnBkdzR3K0dWL2FLWmowRXp4bHRYZDRoL0l3WG5rZ2RGVll6RWlnS3gw?=
 =?utf-8?B?RjFNYUNTNHhJbDhRUU03MlNuQ1B4Y1QrU091WGFlbU83UkRhdjFGQXFWL2RW?=
 =?utf-8?B?N0FXWDVTZThpQnl5Z0VxSWxCU1JpVUEvVnloSERhU3FDdkhpUnUwNlVZdi9S?=
 =?utf-8?B?WWMrWjdzMUl3MW5ZS083WTNSVFJRT3hCYkdqUmZvdUl1WTV4S1dBS09jSjk1?=
 =?utf-8?B?MTBQUXo3N3J2eTZyeS9QVU1GanVqZ0pUM01vZXYwM21US282bGpaU3RDT29B?=
 =?utf-8?B?TFRWKzlVYzUvYUpxbWVhMks1bmJCWUpzSUplMWdMMlBUVDFMdGtySmFsSDVh?=
 =?utf-8?B?TGQ1bzFmQlMyZHJuTTRJMHR6SU5JUWIvSHB4ODJCWGdsdWYwQ3RwZVZlZzVY?=
 =?utf-8?B?NDQxOG9iQmY2Z004MjNJRk9wbnNGcnA0M3d0SUxLb2dVRXdGOERzZkdnUGcw?=
 =?utf-8?B?djlSelpkZDR1eWgwRWdSUmZNc2lBSDZJNndGTXYydGtsaUZySURQeHdRT0Zr?=
 =?utf-8?B?TDFvcURmZUJib2dJaStrYWt2dlZ0Vnd0NDRFTDZzcWphUjlZeE4zTFBmcjEr?=
 =?utf-8?B?UDBCYUF5QWRqSlhHUXBINDF0UU9WUmlIMGQ5d2xyM1B6TUxlQ3ovQWpEWWxa?=
 =?utf-8?B?RVBwL2ZWZWVTR2hmZ1NOUHhlUDM4VVd0L0JLZVlLK1J6azdCc0taN0NIYzFI?=
 =?utf-8?B?MU03cjZnQUxNa1hycjNvc0NLWG5iMzAyNTlTVS9VUUdoQzJZSStYd1dBaTdK?=
 =?utf-8?B?My9NKzEzcUR3TUpJdWNFOTZlUmZraWJNQzRjeVpWaHJzSFc1Rm1YTVczQnZ4?=
 =?utf-8?B?SlRzQk1QWElTdEpjeWozVFJJVXN1TjJsSjFiSmhvMVNNSDNwa0hUU01aaFZE?=
 =?utf-8?B?VW1XaXBUckZTazZLNkc3eWVVdTh1YmhCb0pCQ25ZazMxazZZdWptaWRraXJG?=
 =?utf-8?B?cEtMWW5uRXJPWnRTZ09IbS9nU0VsNW1kMDh2OTNaaDJaWkRpZjI1dk1NTFVB?=
 =?utf-8?B?MldzVXllUXYrMmdYOFpxdFpUMWJkWnVLTDdsK1ZoWllWY1NKUjVxNStZbld3?=
 =?utf-8?B?VmswQldsc3RrY1AyWkQrV2FvcGUwdEJ3RktEaUExZVRYUjh0QzZjKytJUkl0?=
 =?utf-8?B?WmN1Ymd0Rjh5YUQxdURwUUpQMDBpbDVlRFhtTHRPb054OGxFdmhwTGQ5eWor?=
 =?utf-8?B?czA1VlBOT3d3KzhUMndLTm1UNERoSld0eVA2cGhHMzA4cjVkeVdzOW04RkxD?=
 =?utf-8?B?a2xBZEhWSDBXek5pUUlrcVZCNGovZldUY1FEMXFLbFV1VlJYbHBOL1VvM29j?=
 =?utf-8?Q?4AbVUO+SGj8vs?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ec6a55f-5b43-4c86-3e20-08df2638bae4
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB10887.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 19:08:41.2159
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB18080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_200906_424177_BF8AF3B1 
X-CRM114-Status: GOOD (  12.73  )
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

SGksCgpJIGRvbid0IHRoaW5rIGRvaW5nIGxpa2UgdGhpcyBpcyBjb3JyZWN0Li4gV2UgaGF2ZSBh
IGRlZGljYXRlZCBNLjIgRWtleQpiaW5kaW5nIGFuZCBzaG91bGQgdXNlIHRoYXQ6CgpodHRwczov
L2dpdGh1Yi5jb20vdG9ydmFsZHMvbGludXgvYmxvYi9tYXN0ZXIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2Nvbm5lY3Rvci9wY2llLW0yLWUtY29ubmVjdG9yLnlhbWwKCkJlc3Qg
cmVnYXJkcywKU2hlbmd5dQoK5ZyoIDIwMjYvOS8yOSAwNzoxOCwgSmVubmlmZXIgQmVycmluZ2Vy
IOWGmemBkzoKPiBLMyBDb00yNjAgSUZYIGhhcyBhbiBNLjIgRS1rZXkgc2xvdCBmb3Igd2lyZWxl
c3MuIEFkZCByZmtpbGwgbm9kZXMgZm9yCj4gdGhlIEdQSU9zIHRoYXQgY29udHJvbCB0aGUgc2xv
dCdzIFdfRElTQUJMRTEjIGFuZCBXX0RJU0FCTEUyIyBwaW5zIGZvcgo+IFdMQU4gYW5kIEJsdWV0
b290aC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKZW5uaWZlciBCZXJyaW5nZXIgPGpiZXJyaW5nQHJl
ZGhhdC5jb20+Cj4gLS0tCj4gICBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2szLWNvbTI2
MC1pZnguZHRzIHwgMTQgKysrKysrKysrKysrKysKPiAgIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNl
cnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQv
azMtY29tMjYwLWlmeC5kdHMgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2szLWNvbTI2
MC1pZnguZHRzCj4gaW5kZXggMDFlMjg2Y2IwNTc5Ny4uY2Q4NzgzNDBlNWFkZCAxMDA2NDQKPiAt
LS0gYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2szLWNvbTI2MC1pZnguZHRzCj4gKysr
IGIvYXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMy1jb20yNjAtaWZ4LmR0cwo+IEBAIC00
Nyw2ICs0NywyMCBAQCByZWdfYXV4X3ZjYzN2MzogcmVndWxhdG9yLWF1eC12Y2MzdjMgewo+ICAg
CQlyZWd1bGF0b3ItbWF4LW1pY3Jvdm9sdCA9IDwzMzAwMDAwPjsKPiAgIAkJcmVndWxhdG9yLWFs
d2F5cy1vbjsKPiAgIAl9Owo+ICsKPiArCXJma2lsbC1wY2llLXdsYW4gewo+ICsJCWNvbXBhdGli
bGUgPSAicmZraWxsLWdwaW8iOwo+ICsJCWxhYmVsID0gInJma2lsbC1wY2llLXdsYW4iOwo+ICsJ
CXJhZGlvLXR5cGUgPSAid2xhbiI7Cj4gKwkJc2h1dGRvd24tZ3Bpb3MgPSA8JmdwaW8gSzNfR1BJ
Tyg3MykgR1BJT19BQ1RJVkVfTE9XPjsKPiArCX07Cj4gKwo+ICsJcmZraWxsLXVzYi1idCB7Cj4g
KwkJY29tcGF0aWJsZSA9ICJyZmtpbGwtZ3BpbyI7Cj4gKwkJbGFiZWwgPSAicmZraWxsLXVzYi1i
dCI7Cj4gKwkJcmFkaW8tdHlwZSA9ICJibHVldG9vdGgiOwo+ICsJCXNodXRkb3duLWdwaW9zID0g
PCZncGlvIEszX0dQSU8oNTcpIEdQSU9fQUNUSVZFX0xPVz47Cj4gKwl9Owo+ICAgfTsKPiAgIAo+
ICAgJmNvbWJvcGh5IHsKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
