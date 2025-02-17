Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3E1AC021A0
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Feb 2025 08:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Cc:To:From:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2fhtq3vs1BO/9KnhFLOKcwmnDkNHBnZ+Gvy8zgykIxc=; b=sL4TivVli1uFmQdxODQG8D9sZP
	Ke3B8a78gn2z5Kj/pcRGMI9MF/LArmjgdO85TLV/GOm/e3z8NHym9UFibqI8FmvNTcTAlup7OTfUD
	0caFpxXxtYmybziVYhCsaf3tJ5Lvw9H/hYAJZ+JUmP980qhwAS0RNfCXMCGbLqTjVRXZKurFGiuTZ
	Y10t6TS1dAM0Nyi/hnPPL3pjp4z0IILkqBcaAN3brclCKF7jWgJKA1zvtDSCimCbx3m3kEHZ83pNY
	Mxqq6uFd8eWmpjRkl+K/SzpnHuIdVls6WDzWho1G12gbubfD04LDZEsMSOVMDFNLcdbnAWNk7r8wI
	nxxiMCYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjwg8-00000003mv4-1INN;
	Mon, 17 Feb 2025 08:40:36 +0000
Received: from mail-southindiaazolkn190100000.outbound.protection.outlook.com ([2a01:111:f403:d408::] helo=MA0PR01CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjwg6-00000003muh-0tNG
	for linux-riscv@lists.infradead.org;
	Mon, 17 Feb 2025 08:40:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A5mAKotDG8JPzlEZIH0kUxsOqX+g/jOVpMz3Pzduoz+30g1hDER7ogiTGSQXYzEExyilcr/48lWpPQ+q4BYp+m24llfeEMWPwDI8fGpuncqImr4aE5mI8GzrUZ2ZnRhmRexCNaCtEt8j48HiXrJnUZbOeeO7m5W017P/hLmUl+PEEBFmMRupHxXz1RWZ7CCYg4CczK1nXURS3A5uQmFdNhRjeBKS1bQZ5GmzTwa7YDqq/eoFPa+tk+U9CxpA1uVoq9v9Hf/r8w51I3DMkfITIQxOkyl5/eyiVMWrU2mln+8qsQ5fsvIuOoKXKQ/ahCmVk+aJyFTX6Z3znvO9x68xYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hd0cYfsnko93qDtnuMqztH+OfHtlJ+/v/cT0euvUNYM=;
 b=OjLMlaC1yR2TLc1VUdXBbNfeeBHJG7b9axLG0+ObV75zIENbINS5pRZtItDkB4yZaYZd1SnZbCNdDVz3J4FoU4HoPvD90jWokzlthRZ+3DYW4I1MHelm/rU73DiZ6qbcmOo+cUbAq/UJZW2rlyAzcyIl7yQj0YFB2C/D83suy5A3qSgh/1aIc+UUcDaFOUkRtr+G8ZCTSHr454jqvC4RVejF4CDMrDyCSJlc+ybMKsgWx/cM79c1pbAlqY144UOkLuJPY5cQA0/cs8ogI9+b+WlClL6RBnWZv80z2+s1f+hJKtS5ceFLhZwMzJQYEMEgejLSkeWiDPf+LklidGNLoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hd0cYfsnko93qDtnuMqztH+OfHtlJ+/v/cT0euvUNYM=;
 b=RDDYytDDabl664vkcBQcUEgt0v/jFp3AK0WQ0H6xz+8qEEb2E338NrJKUsAWrX0fhLiSObAa5t5shJYjpYw5yEOCePt1FfRBaCwe1fDEbKdePQscvOrE/RLwvCE5QHYEVlVS2Z0144SsMzNKpD0WHDrxp9S3sQBF333LPCQTjtOpY733YIZZtDfv+Aq6FCRmWrdw4c3CFcJQFYSKBz9e/TIrBbkuvhxo5+fdTNc6k/PDNZMVuLsdflwCpQEnMDPA3Gehw1bnTHxiRQJd8bLcw9Ejht8HXUP3bqnbEx/auCBVlYFvbs8jzAyZ+z6NyMrmVd8Pqxi9BBCOYPDyhqqD6A==
Received: from MA0PR01MB5671.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:6e::9)
 by PN2PR01MB9058.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:15d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Mon, 17 Feb
 2025 08:40:21 +0000
Received: from MA0PR01MB5671.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::6e06:bc2e:85c0:c2ee]) by MA0PR01MB5671.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::6e06:bc2e:85c0:c2ee%2]) with mapi id 15.20.8445.017; Mon, 17 Feb 2025
 08:40:21 +0000
Message-ID: <MA0PR01MB5671F42DEE2C5491A65E3975FEFB2@MA0PR01MB5671.INDPRD01.PROD.OUTLOOK.COM>
Date: Mon, 17 Feb 2025 16:40:16 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] dt-bindings: pci: Add Sophgo SG2042 PCIe host
From: Chen Wang <unicorn_wang@outlook.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Chen Wang <unicornxw@gmail.com>, kw@linux.com,
 u.kleine-koenig@baylibre.com, aou@eecs.berkeley.edu, arnd@arndb.de,
 bhelgaas@google.com, conor+dt@kernel.org, guoren@kernel.org,
 inochiama@outlook.com, krzk+dt@kernel.org, lee@kernel.org,
 lpieralisi@kernel.org, manivannan.sadhasivam@linaro.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, pbrobinson@gmail.com, robh@kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org,
 chao.wei@sophgo.com, xiaoguang.xing@sophgo.com, fengchun.li@sophgo.com
References: <20250212042504.GA66848@bhelgaas>
 <BMXPR01MB24403F8CD6BF5D4D2DDC57A4FEFC2@BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <BMXPR01MB24403F8CD6BF5D4D2DDC57A4FEFC2@BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM>
X-ClientProxiedBy: SG2PR01CA0147.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::27) To MA0PR01MB5671.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:6e::9)
X-Microsoft-Original-Message-ID: <67a810b4-ac33-45ee-ace7-73ba097e81f2@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0PR01MB5671:EE_|PN2PR01MB9058:EE_
X-MS-Office365-Filtering-Correlation-Id: 92d9620a-9d17-4ccb-e998-08dd4f2eb6e2
X-Microsoft-Antispam: BCL:0;ARA:14566002|7092599003|19110799003|15080799006|8060799006|461199028|6090799003|5072599009|440099028|10035399004|3412199025;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R05kYks2b3NZWlFpdnZZelVEbENuQ3RXOTNrdDFhVkY5RXlLaDgxZS9pWU9E?=
 =?utf-8?B?b0poZW5QZFB6Wm1DMzhsSFFXUWlMNmNHTWErSm1sd3EzMElOVS9UTkdOaG5P?=
 =?utf-8?B?YTV6RWRFMVFRMWVrTzdXY1JWb1dhdzdsWEJScS9rZUo0NER6RDgvR1lTcEhm?=
 =?utf-8?B?WEFoRE1YWWhySFBUTlA2ZkRHdHBYRjAwUTRJU08ySnd2bDVNK2FJNGhNRmJ3?=
 =?utf-8?B?MGFRVEpycWxuNGtYd0RJR29pSHkzNkFCbFpMcXNhNVpPS0dXcUEyQS9QYy9z?=
 =?utf-8?B?K2hmSUpsb1czTHYrZVBaVkN4NTZEbWwxTDl6ZkZKYmxSajZSTGdqUkw3dVow?=
 =?utf-8?B?eHU0NmVPRnRWaDdaZHhvUGxRTzBaMnpsMEUxajc1T01LVXM2Q0VmajV6MzhG?=
 =?utf-8?B?L0t4VTdHdFBaM29OYWM1QklORC9FR21OR3VLVWtSSEMycjlmMC9XazNzWmdE?=
 =?utf-8?B?Q3dmSmhaL3JYbzBIVFdQUG00YUJKSHJrenJlYk8zUWF0WXRwUFU1SHFCTkp6?=
 =?utf-8?B?K202S3gzNHlOSUx1c0dzUG9NK3N3V0xsRFhHOW5zWjNsZTRaZjdHa1Q5UXJv?=
 =?utf-8?B?WlNEM1lLbldZVGJCNkJQSjNPeG9kcHFkeWhZR0IxalEzQUd3NzJGTXRyemlM?=
 =?utf-8?B?RW9UdFZ3K2g5U3ZWQjhFMjdDK3JOc1VHOVRrS0lEcDNoSTVZOEdGSmN3bzBH?=
 =?utf-8?B?QUtkRzFtbFBjb2lmT3ZnVEFOcW15NlRZY1V5Vy8zU1N2MFJqNjNKL1h3a0ls?=
 =?utf-8?B?VnltREo4U0ZTYkdFZkFnSGZMTXkxMGdLaG00b2F3OU0zRGFyRi9kUHpWZlJ3?=
 =?utf-8?B?Y2hlL2xwQnlpMm1RUGMwTXNBSERoRWpyWnFMSjVQTEY1WjhHMmx0R3UzdFkw?=
 =?utf-8?B?M3QrVHdXMG11T0k1ZVI4c0dDVXpZdzgwTThuZllTWFVIcUFueWxYbHREV0VH?=
 =?utf-8?B?TlczWXFCaE1BK1RyU3ZzcFdwVjlRd2ErdHJQRTZBUGFYTXJsdWg0YmFOd3ZT?=
 =?utf-8?B?aDdZTXZIdGg2K0Ixd3hhcmQzcHRRcXJuakFnZnVZM0lRSk5WaFZpNHIwMUZz?=
 =?utf-8?B?YkJabW1LZVkzSVhhK2lKdlQzNVByZUZpY1BJYTBCVC9PQkdkQTRsOHNrWENv?=
 =?utf-8?B?VHZmZGQ2TDZOTFFUNFNNSDlLTk1nVmdtcEtYMHhhcDBrNHlFSlVuSHVGSEtr?=
 =?utf-8?B?cTBoa0JYR09DRUpMUjdGRGthenNpa3dTWXREOVN2b2toWDREUjZDQk1tc0dk?=
 =?utf-8?B?UmY3dnE4cVBqeUFIZGhVM2ZqRjZSQlozVkR4MXBueW5zL09HS0FmT2FveDMz?=
 =?utf-8?B?WWZHRHVMYTJrNHFnakZSZ1ZrbUVkVTVPVUI3MzVzVndNS200RzNSRS91RmlB?=
 =?utf-8?B?Wmp4dGNlUzRzTi9tTjlEVW5jNE1vazFGRUFJUUdKNE1MYjJmdmlkdFlIUmhq?=
 =?utf-8?B?bjZHcnJzOTU1NlhTTGZZeGVGYUoxbGo0UDB3Q1NOYk8xd2RicklOVVkxakxz?=
 =?utf-8?B?NzBGM1cybjNHbEEwciszYWh5NEFpT0cweFJaUWtuanpKbFN1U2JyWDBDbHVx?=
 =?utf-8?Q?wq9P5cglW69JQ5k3R3VIxtGnw=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cnJhUjJLbnNxR0ZKckxuaEwwazV5NTBWM0U1OFpFblUvM3RGWjJ3UXhqZ3ZV?=
 =?utf-8?B?YmhsM25XRXM2U2tCd1RrVWI0TkhvZTM5TjFSRnEySmoxM1daU2toMWZkTzZR?=
 =?utf-8?B?WTlJRVR4S1dJQ3N5aWlJU3dEdkhpQ1lnNlhFT1pDYkdhcUZNWlRBbmtCRWJS?=
 =?utf-8?B?czNkMDhBSDFkZzZzT3h6ZU1LYW50VVRyTm9PN01obU1tZDFPWTRzV2hJVys3?=
 =?utf-8?B?TTJVdjAwbVRVS1VZcXFyYVNLK3pOS1QvUVRReE5HTnQ2cVJsNDEwMUhSY2VC?=
 =?utf-8?B?TlRqRXhhZnBtb1d6ckxPaXFBelh6ZUhPaHU2ZzlHUDh6cjZ3NHVkeXRLOXR5?=
 =?utf-8?B?NGc3L1NjeXExM2UrcDdNRElLeXE4MGVSU0kwbUlwZ2dCZ2RPa3ZjaU4vdzFw?=
 =?utf-8?B?VWdBbjBabys0dTlVcVdZVXU4WG5ianE4WnZsdVBkS0J3VVg4V2F6MkYyM2tB?=
 =?utf-8?B?MEVNbkY5Y1J4M0ZncnpLVm5sMmZGaTZYVXJwN3hRRk5DeFhyZUg3dk11akpK?=
 =?utf-8?B?MTdqY0MyVGVBUWlhMTlqR0RxZllXbzNFd1pKdmtJU0ZvYWNPODFTQTZuY2lm?=
 =?utf-8?B?UTl5eFRsUlhPNitiQWhKRmc1UUtsVWFUcmFOcjRyaG1xQkZwVnc3UFcxQnRR?=
 =?utf-8?B?V3ZJUjNWOHZJSlFTbzZRN3NCK2MrRHRyT3FXSHJSV0dLeTk1MytVam03a3dt?=
 =?utf-8?B?clhleTVaNDhMTDBsSGYyRmRjYkl5RFNaeElOY3NSMDZKRVcvS2hKTjNJM2ZU?=
 =?utf-8?B?aXNsWG5HRHlzdHFmOXBxeE05ZHVFQ0Fod1RlcEpMODZHWnIyOXo2ZkVSUjB3?=
 =?utf-8?B?RURzZjdsTlRnb29pTWloWXJUNVRHeW9IV1EzMEtuWnpieHJ5TnZXL1dKbTJk?=
 =?utf-8?B?dXlpZ28wZXJwTzhyNVNEaGJUc0VpRC9jVmo3STRidUtIaGppVmdGYjBVMkZm?=
 =?utf-8?B?WW1FbklZWnVZcHVydzQ2KzExNXNYUS9RSDF3VWl2UmJqLzA0Zk9MTDlvRVFF?=
 =?utf-8?B?M29xOHJzS1ZwUWpiWU14YkVNT2I3Rm15bjI2RVpRWWpHSWEyT1ZMODhRVDNy?=
 =?utf-8?B?TG9zMzd3WUV5YnNTY0kyUjk0MDAvdFNjdGE0bGsxRU1IcWh4b2NwdFUzaTJk?=
 =?utf-8?B?OEZmN0k5UE5BblpteWNlajZrWnVXOFlZMnRFSEVoRi82YkpSL0R1RnAycFh4?=
 =?utf-8?B?U3NUZTAwTS9SblQ4Z3VGeUZtWWFXbWlrKzRwUStDL2NJT3cyQlB4U01DNlBX?=
 =?utf-8?B?czd0SElPakwyOGowTmdxMExxYUplWEVjMzZKdTdiVGE4bEVkWVpNV0I1SWlS?=
 =?utf-8?B?VC92VWljUjJZKzRzTUh6LzdXNjR6QjU2S1dVRldlNDlETFVaTDcyTDEwWk03?=
 =?utf-8?B?MjBOYzliR3V2Z1o1QVhiazAzcnlaOUkxT3JjQmtJQ3orZCsrVmdReEJ2NjRQ?=
 =?utf-8?B?dUcxd25GT0tVbmFjMmd3L3B4TjBQVlQwMGZlNERqdXg3ZHRKN0dQMWFabXFT?=
 =?utf-8?B?VWlNUGI4bVRhaG1udGpMazNhbkJMZ3lVUGpzcUN1RHJkSnYxSnlWRitaZGlT?=
 =?utf-8?B?ZDV3UzkzL3F6S3o4eW5QTTFDYWdxbFlsWUpVS0VobG82amxJWkRBSFNYUkhv?=
 =?utf-8?B?QVNxQUJtelZHYng5OWtzN1ZoOWRDazQ0bHJjSTNNd0FraldpeHlBdnRwcG80?=
 =?utf-8?B?aTBTdk5zekV1VWc3UnRSWVhHb1FXR0o4WVhZZjVCNVJtdi9HT1NaVnRacm92?=
 =?utf-8?Q?MJhZAdQdvRjfhtxMjFXmFB1vDjuFX/yM2n9omzD?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92d9620a-9d17-4ccb-e998-08dd4f2eb6e2
X-MS-Exchange-CrossTenant-AuthSource: MA0PR01MB5671.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2025 08:40:21.4061
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PR01MB9058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_004034_258800_22ECFDD4 
X-CRM114-Status: UNSURE (   9.61  )
X-CRM114-Notice: Please train this message.
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

SGVsbG8sIEJqb3JuLCB3aGF0IGRvIHlvdSB0aGluayBvZiBteSBpbnB1dD8KClJlZ2FyZHMsCgpD
aGVuCgpPbiAyMDI1LzIvMTIgMTM6NTQsIENoZW4gV2FuZyB3cm90ZToKPgo+IE9uIDIwMjUvMi8x
MiAxMjoyNSwgQmpvcm4gSGVsZ2FhcyB3cm90ZToKPiBbLi4uLi4uXQo+Pj4gcGNpZV9yYzEgYW5k
IHBjaWVfcmMyIHNoYXJlIHJlZ2lzdGVycyBpbiBjZG5zX3BjaWUxX2N0cmwuIEJ5IHVzaW5nCj4+
PiBkaWZmZXJlbnQgInNvcGhnbyxjb3JlLWlkIiB2YWx1ZXMsIHRoZXkgY2FuIGRpc3Rpbmd1aXNo
IGFuZCBhY2Nlc3MKPj4+IHRoZSByZWdpc3RlcnMgdGhleSBuZWVkIGluIGNkbnNfcGNpZTFfY3Ry
bC4KPj4gV2hlcmUgZG9lcyBjZG5zX3BjaWUxX2N0cmwgZml0IGluIHRoaXMgZXhhbXBsZT/CoCBE
b2VzIHRoYXQgZW5jbG9zZQo+PiBib3RoIHBjaWVfcmMxIGFuZCBwY2llX3JjMj8KPgo+IGNkbnNf
cGNpZTFfY3RybCBpcyBkZWZpbmVkIGFzIGEgc3lzY29uIG5vZGUswqAgd2hpY2ggY29udGFpbnMg
cmVnaXN0ZXJzIAo+IHNoYXJlZCBieSBwY2llX3JjMSBhbmQgcGNpZV9yYzIuIEluIHRoZSBiaW5k
aW5nIHlhbWwgZmlsZSwgSSBkcmV3IGEgCj4gZGlhZ3JhbSB0byBkZXNjcmliZSB0aGUgcmVsYXRp
b25zaGlwIGJldHdlZW4gdGhlbSwgY29weSBoZXJlIGZvciB5b3VyIAo+IHF1aWNrIHJlZmVyZW5j
ZToKPgo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICstLSBDb3Jl
IChMaW5rMCkgPC0tLT4gcGNpZV9yYzEgKy0tLS0tLS0tLS0tLS0tLS0tKwo+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgfMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHwKPiArwqDCoMKgwqDCoCBDYWRlbmNlIElQIDIgLS0rwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAKPiBjZG5z
X3BjaWUxX2N0cmwgfAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHwgfMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwKPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCArLS0gQ29yZSAoTGluazEpIDwtLS0+IHBjaWVfcmMy
ICstLS0tLS0tLS0tLS0tLS0tLSsKPgo+IFRoZSBmb2xsb3dpbmcgaXMgYW4gZXhhbXBsZSB3aXRo
IGNkbnNfcGNpZTFfY3RybCBhZGRlZC4gRm9yIAo+IHNpbXBsaWNpdHksIEkgZGVsZXRlZCBwY2ll
X3JjMC4KPgo+IHBjaWVfcmMxOiBwY2llQDcwNjIwMDAwMDAgewo+IMKgwqDCoCBjb21wYXRpYmxl
ID0gInNvcGhnbyxzZzIwNDItcGNpZS1ob3N0IjsKPiDCoMKgwqAgLi4uLi4uIC8vIGhvc3QgYnJp
ZGUgbGV2ZWwgcHJvcGVydGllcwo+IMKgwqDCoCBsaW51eCxwY2ktZG9tYWluID0gPDE+Owo+IMKg
wqDCoCBzb3BoZ28sY29yZS1pZCA9IDwwPjsKPiDCoMKgwqAgc29waGdvLHN5c2Nvbi1wY2llLWN0
cmwgPSA8JmNkbnNfcGNpZTFfY3RybD47Cj4gwqDCoMKgIHBvcnQgewo+IMKgwqDCoMKgwqDCoMKg
IC8vIHBvcnQgbGV2ZWwgcHJvcGVydGllcwo+IMKgwqDCoMKgwqDCoMKgIHZlbmRvci1pZCA9IDww
eDFmMWM+Owo+IMKgwqDCoMKgwqDCoMKgIGRldmljZS1pZCA9IDwweDIwNDI+Owo+IMKgwqDCoMKg
wqDCoMKgIG51bS1sYW5lcyA9IDwyPjsKPiDCoMKgwqAgfTsKPiB9Owo+Cj4gcGNpZV9yYzI6IHBj
aWVANzA2MjgwMDAwMCB7Cj4gwqDCoMKgIGNvbXBhdGlibGUgPSAic29waGdvLHNnMjA0Mi1wY2ll
LWhvc3QiOwo+IMKgwqDCoCAuLi4uLi4gLy8gaG9zdCBicmlkZSBsZXZlbCBwcm9wZXJ0aWVzCj4g
wqDCoMKgIGxpbnV4LHBjaS1kb21haW4gPSA8Mj47Cj4gwqDCoMKgIHNvcGhnbyxjb3JlLWlkID0g
PDE+Owo+IMKgwqDCoCBzb3BoZ28sc3lzY29uLXBjaWUtY3RybCA9IDwmY2Ruc19wY2llMV9jdHJs
PjsKPiDCoMKgwqAgcG9ydCB7Cj4gwqDCoMKgwqDCoMKgwqAgLy8gcG9ydCBsZXZlbCBwcm9wZXJ0
aWVzCj4gwqDCoMKgwqDCoMKgwqAgdmVuZG9yLWlkID0gPDB4MWYxYz47Cj4gwqDCoMKgwqDCoMKg
wqAgZGV2aWNlLWlkID0gPDB4MjA0Mj47Cj4gwqDCoMKgwqDCoMKgwqAgbnVtLWxhbmVzID0gPDI+
Owo+IMKgwqDCoCB9Cj4KPiB9Owo+Cj4gY2Ruc19wY2llMV9jdHJsOiBzeXNjb25ANzA2MzgwMDAw
MCB7Cj4gwqDCoMKgIGNvbXBhdGlibGUgPSAic29waGdvLHNnMjA0Mi1wY2llLWN0cmwiLCAic3lz
Y29uIjsKPiDCoMKgwqAgcmVnID0gPDB4NzAgMHg2MzgwMDAwMCAweDAgMHg4MDAwMDA+Owo+IH07
Cj4KPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4g
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
Zwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
