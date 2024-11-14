Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AD22D637D8
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Nov 2024 02:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YPcFIGOIO9VCuZ9LqZOnZAox47q0b1zRaStVQiIbzYA=; b=UDbtXxKqQ9RP55anlwMH+U6zIm
	ypJV3H5ogKOU63m4waxKzBGrSXIb2O2Lwrcv864dwGiA1xivk7MC42XAFAjSPfsVzzwZf9zR8/XtY
	77RKEXvQ6Bl0MI6ogS4mtecN6bOkuFueFQC/xeptckS/Ehl18EQvFBB3WdLlqADyNSYpfZIBERwkV
	WhcSD7Ix+C2OevtCxuyxOMKG23+oLyzuH4r7NfUK8jRDiPw28AGhNQqgq4p1x99jIanMxUN4SSsmn
	75fvEFGerTIy3RMkZwJWlNBslg3ULdJJwL8WeQgzKfvRXQeJ6RWlZhI3fUNNDEQzceZNXpYJz0Xs1
	9bPaqIaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBQ0U-00000008cB8-3d0k;
	Thu, 14 Nov 2024 02:54:54 +0000
Received: from mail-centralindiaazolkn190110001.outbound.protection.outlook.com ([2a01:111:f403:d409::1] helo=PNZPR01CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBPxQ-00000008bY3-3wLV
	for linux-riscv@lists.infradead.org;
	Thu, 14 Nov 2024 02:51:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d4+G8ZuaR6i/1YejgV6SkwapNFzP5Hz3lzWav/c7KYCtorBB+wsCwK1h8UzQscv8A1RM37bQ82+jWa6yOGCPAi4ss+xv7bZ+sVbzjzUToBQj9ia9iz0B0TmPpKHAZ7FLOd41ZFZV3jeFWHP3g5xBEJeYpPr9bT3FX/nmT9O0EU+Dla0yJHMf6iHYK5Fp4mEOd2aBzKl3UPxOjxIeD1Znb8vMtBPO9tYSKY3O37s9nDRV4ARq4hbJcdinyqMY2Aw+IN+bEYAET0VgoOhyjrzO32B6ispjFgYWES+l2q8xTeW0z+Jn+YDjc+HAQc9mPYy6idrNXE8TdFEgHUptwfFEZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6QmyrSexW1QmE6ipi3xh1tasNCzXUR0ei8apF5brOLg=;
 b=xHfjLIcpV2dzaEkZRA284ABsyxagVy80agvig3EXlVzhp/cfi/c4w1yokPjwvAoGtp0ttId4cotQ6gWyssmZX1jNHgbORc7U+zNHz0IDyP7yJw4Ck29B/ZVKtEgXNJgtBin0/XkL7bqiH9YeB8rSrqwOXZXnva8hy7Yy8zJcjf1eHNtpOHBKXcFnMGjTcJ/y7R8ws1XONaLquAvtD6g9GRGEmKEj5yqMb5ST6PJv+6oVopj2y7YetECLQqbHSBo8O1e/fNixh+tirdqhCjvQE0mWF1MuMW99C7KAGPms742yMFDsZK0vCUw59pAhhJ35fZo0dLfdVJEYwsvlFVJ6oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6QmyrSexW1QmE6ipi3xh1tasNCzXUR0ei8apF5brOLg=;
 b=U5RadFiyYMIjtpq8k1pMPYfSZeBswri7ywT4YCMqaUwOgt1dmjQEVfSAI38LzrRuY+ZvuU+5k1LAXcP3E1EZcBgr4EMG1g7MGy6C+iL+a0JYuJ2W1svB1Z5AIe00Plhfkmw8JNZsFS5EB4WCcDXONftN9aBqG0XcT8mFKRdCaKjSB2K5jksyiN9N+eNm+K93Afr2CQcPM1t46g3RH8M55m13x5eJ5gbFZKwJEZnNIcQTsJkxk80pL2RNm3biGQyctigtOEytbLDoHwewr+9ZH058Nr/qckQxw5EiKDTbeKVnPaOVLt7uO1JP1Pa++p1VUq9d4C5BHJZjAAqhI1Dl9Q==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by PN3P287MB2000.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1d2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Thu, 14 Nov
 2024 02:51:27 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c%3]) with mapi id 15.20.8158.013; Thu, 14 Nov 2024
 02:51:26 +0000
Message-ID: <MA0P287MB2822642BE6F4B448410A28FAFE5B2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Thu, 14 Nov 2024 10:51:23 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: pci: Add Sophgo SG2042 PCIe host
To: Rob Herring <robh@kernel.org>, Chen Wang <unicornxw@gmail.com>
Cc: kw@linux.com, u.kleine-koenig@baylibre.com, aou@eecs.berkeley.edu,
 arnd@arndb.de, bhelgaas@google.com, conor+dt@kernel.org, guoren@kernel.org,
 inochiama@outlook.com, krzk+dt@kernel.org, lee@kernel.org,
 lpieralisi@kernel.org, manivannan.sadhasivam@linaro.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, pbrobinson@gmail.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-riscv@lists.infradead.org, chao.wei@sophgo.com,
 xiaoguang.xing@sophgo.com, fengchun.li@sophgo.com
References: <cover.1731303328.git.unicorn_wang@outlook.com>
 <1edbed1276a459a144f0cb0815859a1eb40bfcbf.1731303328.git.unicorn_wang@outlook.com>
 <20241112155913.GA973575-robh@kernel.org>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20241112155913.GA973575-robh@kernel.org>
X-ClientProxiedBy: SG2PR04CA0157.apcprd04.prod.outlook.com (2603:1096:4::19)
 To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID: <7cb6a172-33ea-414b-b105-40c3609327bb@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|PN3P287MB2000:EE_
X-MS-Office365-Filtering-Correlation-Id: b0027114-1a80-4966-022a-08dd04573b9b
X-Microsoft-Antispam: BCL:0;ARA:14566002|6090799003|19110799003|461199028|5072599009|15080799006|8060799006|7092599003|4302099013|10035399004|3412199025|440099028|1602099012;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cE1CZys4RTNuQVQwcU9XZ1pHU1NndXkwTUFLb0QrdmJoM002aWMwVUVycUw1?=
 =?utf-8?B?SXJWY1VtaVdHRzVqbVlORXZYRUdFcHlCaWZhRTYydmM2cHB4a0JoZjNuTmdk?=
 =?utf-8?B?anE3Z3Jabmw1d3UxTURQNXV0NmsxWHN4U3RkdTk3dkpHZ1VpTXEzazJncUph?=
 =?utf-8?B?S0JzdVhxN0o3TjVTaVErUTBtR3VyemszVzUxc2lWRmdCYm1iVS9RQkg2c2N6?=
 =?utf-8?B?RHNBRUlpdkVWY00rcWVVM0dacGdJVDFjYzZnZDdoTmFTcmp4ZW5YeWQ3UEY0?=
 =?utf-8?B?R1R4MThENU1Oa040OGkwN1lyd0w1enpRT1pIczJHQlpkU0tKNFByY01vQ0NP?=
 =?utf-8?B?RWRNN1puM2dKMnpqVzM3UXRMZnFoMlhPZWtvQlUxV0I1ZjdDWml5UytVTVk3?=
 =?utf-8?B?alpGdGlrY0hSeXVKcFdZZTBpWnJPcFlKZDREZWhkWUI1bkhBVHdPdEw3eTc0?=
 =?utf-8?B?N3VMVTl0bWNNU0ZKbUY0ZlhnMlkxcUx2cFd0Ym51SUNoRjJNWHdBT1lqQWxM?=
 =?utf-8?B?VnB0V3NmbTUxK0VCYnAxUDArQU4xcFZlRFY2ZGJ0ZUNDeStoMmlrT002VzRE?=
 =?utf-8?B?aDhQY1JYbWVOZmNkdURpVE96M2kvNjVNd20waFZBemNkZTlRcFNoSmFBOFhw?=
 =?utf-8?B?elJXVEh6cmlQSHdMVi9KRXZab1NXaVBwSFhsR0Z6dm90TEQ3VU5RaG52M21F?=
 =?utf-8?B?RUdla3oybHVQN2NiMDkvOHI5a0N3dEdJNXdHZ3ZaaFhrbUlqWUZURlZicHdG?=
 =?utf-8?B?b2ltTnpaVzhrdW1ZNmhRRDJCanRERkd4N1ZGMGx3R2V5QTdYdDlCSTcxZ3lP?=
 =?utf-8?B?QWRzZzg0VFllV3ZhTHRWOTkrY2dmaE1RYlRDWnhHRi9YYzZZQlV1VGJUOW5K?=
 =?utf-8?B?SWFWVXZPWWk4WTYwaTRrbzJ4MTB6SjV4VHVKK2k1ZERvTnV3NzdFdFZBZ3R5?=
 =?utf-8?B?UzRrSHllMzVjeVhYUlRnMXZETEJ3RVltYng1WFN6VnlYMlhsWmJCRmRGbi9t?=
 =?utf-8?B?a0JSZnVYdUFZRkZLbXBITEIvUlhLd0YyV1ZPNzNzTEg3WnFHZ1c1azliaHIy?=
 =?utf-8?B?bUpJQjk0aFZYdmdPVFhRVkd0N3YzeGRyRFpjUWptUGxmb3ZPQS9wdk9IU3JK?=
 =?utf-8?B?elp3MDVxQ2VRSXRBSjM5R1BibzQrRkVtU1FtTHdOSFJmQWFsNWtJVGFmekQ4?=
 =?utf-8?B?S1cyTk8xU0pCV2NjQm5sK0ovRy9PMUV2SFNQNjBWN2tCVE0veEtaY3hCelFJ?=
 =?utf-8?B?Z2gxeExkRHRtaklwV0FqOENTbm0wR3RoRnFLMWl1NW0razZ4Njh3ZkpWWHp0?=
 =?utf-8?B?aGJQR1gvRGxyMXUrQ2xLNzE1MW5LZ1B5U0NNaE9xMUZ5aDFUQUQyL0djVDZW?=
 =?utf-8?B?Y2IyN0J3anBCOUZPUmExUDhCSTNhRlh0UCs5NTVqcGd1UFh1YjE2K2dJenhw?=
 =?utf-8?B?UURzMjBTOXpsWmx4VHlMaS9MMWFJNnE1SDVQMFNpc1U0eW54eXViOURjT3F1?=
 =?utf-8?B?S0lrckZ4UDhjUG9BSzhhZ2hXUEZjdllHRnY5NXY0STZSUVA2bS9zbUFjbHdu?=
 =?utf-8?Q?9mBj5HLqJXRKWBwbS2zmCl3eKlFLoyiIMgfBwL2QnAZmFL?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGFTbGt0UlNML2NuZlZZWWFiZGJyZzczcENqZmQwSU1rRUIrMEVSU2JhcG1v?=
 =?utf-8?B?bis1TWZtZllxR1lHV3ZESVlmbXhEZ0VXYzBtK21HMnNlNyt0S2F5djlKSTQx?=
 =?utf-8?B?T3l1YVM4TW9Sb2JJQW9BZEg0a012b3pDVWVNRldYQWJqWHBzVitma2c1SEVB?=
 =?utf-8?B?TUtGc2tJbGhzTGx3NElKV0RtQUJqMXhzZ2h5bzdXdklSeHIvOWRMREppbUx0?=
 =?utf-8?B?cjd2eEttbE1yUFcxZ3BuS1lDd2ZxS0NMNHNsZTZuTXBaNHRnODlWdUprTkVV?=
 =?utf-8?B?SnZKR3pNdHhNR1lmZGRheFNKc3lOZW93OUxKUS8yd3RRM2prV3JiR1NmVGNN?=
 =?utf-8?B?dlZHQVpvS0FsTTBNT3RTVUdvbU1iWWtmb3p0M1NnNFpBZXM0Rmd3cTVnZ1pG?=
 =?utf-8?B?dUxxR0xHTTRPdGwyOW5SVFc1M25Na1VDRmg1dE51ZENDY004RG9YdlNwV0xk?=
 =?utf-8?B?NE8zQXBaTTRuTnVCUjUrRjd0ZW5hVjl4V2NjcjVlb0hURit5MFVrbzdVWi9p?=
 =?utf-8?B?Z1krVTA2bUZQWW1IZ3dURXd1dEVIUStiL3lmQjU4V0Q2aGlsVUlsWGxINWtO?=
 =?utf-8?B?U09zTjREZTY3VG9PVnk1eTN5M01HRVY1OGFnQVdpbTNmWTgzdG4vRGsxZkE5?=
 =?utf-8?B?cVJ5cllkTXJEd1dMU0R6N21ZbzJJemRLUWJhVmZ2U3pKTHlTQUNqekpFVU1W?=
 =?utf-8?B?djdmb2FsTEpZNGczclBoZlZiRGsybjJvUUNrWVlCR0xXanUrd0xXQ2xhSGdv?=
 =?utf-8?B?WjNvbUJNSDVEdFBRWlY0UVNub29ES0g0bjZLSTN5ZzIrblk0N3dOZnJhcStW?=
 =?utf-8?B?My9zVG1CaHVTM3hEcU9zR0lRbTBDTmFlbEM5ankrd2E0UnROTnExdmpwczM1?=
 =?utf-8?B?R3I1YlNwcWpFMnF5LzB1K0lIakt5WTc2TXRFOXdHdXZQWmlBakhlL21CRkp6?=
 =?utf-8?B?WHAyUWcxalVXRVpBMXBiSS9zVVRjbGZSQ2xFRmF1cTdMcktKMFI1NGdvNHM1?=
 =?utf-8?B?dzk0QVpHTXhVLzgwN3NvWkQyaTJjTXNRbU12VWd3eDBsVlhna002bWNyNG1j?=
 =?utf-8?B?UnRLbXZzSU9XNW5qQ0l0eXEvckowNExEdTlYblh0K0diTkg3SGQ1OGdtckc2?=
 =?utf-8?B?VVRzRTBjY0llUFp6YmJ2NDdLMFRWL2RHQzYyWmROaXQ5bXMzWEpVaXhCSit4?=
 =?utf-8?B?aWd1Qm9PYWlHdTdFYW8wa01rR2lvVTBtMDI4TmJkQXZNT2QvSG1QNnA3SWRh?=
 =?utf-8?B?VndBMUF3ZCt3MXhMVTVvTURDSzBqTGlTbXBwNG1IejdKTHpQaENqYytFVURW?=
 =?utf-8?B?MHJOZGlhRm5KaGtvOW1RL0dvVndCWktDSUJUM2RhMW5DL3JZWTVBMjJEOGdJ?=
 =?utf-8?B?c2VvbXN4MjBZMXZaMzdxTEMydUluVU11eGl6UHFqaDNJbCt1aUhtSDVFQ1ZW?=
 =?utf-8?B?NFA0Rnk5RFg4TkJLQkpaMjB5VmtrSXhVRUxXSVl0RVF4REtFMmlUdm8rTCsz?=
 =?utf-8?B?WHd3dWNTcEVFdGkzZlZQc0dHK2NrRGVDR1Z5WTlpOU1ZUFVHRTBFeXpaMXpS?=
 =?utf-8?B?UWVVVDVtYWVzZEMySm4ycG9DV2RXMVo5ZXpPTlE5OW9wa1hLT3BCRXRDdlFv?=
 =?utf-8?B?RHZ2dXg4YWorVDlTVWZuRVEybkVjQTRqVEF2MU8rcFE2dUhlS2J3WTBZMGo0?=
 =?utf-8?Q?5xGOzFu3r4Xrn6VUpmll?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0027114-1a80-4966-022a-08dd04573b9b
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 02:51:26.7226
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB2000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_185145_239134_E7DBC213 
X-CRM114-Status: GOOD (  16.79  )
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

Ck9uIDIwMjQvMTEvMTIgMjM6NTksIFJvYiBIZXJyaW5nIHdyb3RlOgo+IE9uIE1vbiwgTm92IDEx
LCAyMDI0IGF0IDAxOjU5OjM3UE0gKzA4MDAsIENoZW4gV2FuZyB3cm90ZToKPj4gRnJvbTogQ2hl
biBXYW5nIDx1bmljb3JuX3dhbmdAb3V0bG9vay5jb20+Cj4+Cj4+IEFkZCBiaW5kaW5nIGZvciBT
b3BoZ28gU0cyMDQyIFBDSWUgaG9zdCBjb250cm9sbGVyLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBD
aGVuIFdhbmcgPHVuaWNvcm5fd2FuZ0BvdXRsb29rLmNvbT4KPj4gLS0tCj4+ICAgLi4uL2JpbmRp
bmdzL3BjaS9zb3BoZ28sc2cyMDQyLXBjaWUtaG9zdC55YW1sIHwgODggKysrKysrKysrKysrKysr
KysrKwo+PiAgIDEgZmlsZSBjaGFuZ2VkLCA4OCBpbnNlcnRpb25zKCspCj4+ICAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wY2kvc29waGdvLHNn
MjA0Mi1wY2llLWhvc3QueWFtbAo+Pgo+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3BjaS9zb3BoZ28sc2cyMDQyLXBjaWUtaG9zdC55YW1sIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BjaS9zb3BoZ28sc2cyMDQyLXBjaWUtaG9zdC55
YW1sCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uZDRkMjIz
MmYzNTRmCj4+IC0tLSAvZGV2L251bGwKPj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3BjaS9zb3BoZ28sc2cyMDQyLXBjaWUtaG9zdC55YW1sCj4+IEBAIC0wLDAgKzEs
ODggQEAKPj4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wIE9SIEJTRC0yLUNs
YXVzZSkKPj4gKyVZQU1MIDEuMgo+PiArLS0tCj4+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9y
Zy9zY2hlbWFzL3BjaS9zb3BoZ28sc2cyMDQyLXBjaWUtaG9zdC55YW1sIwo+PiArJHNjaGVtYTog
aHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCj4+ICsKPj4gK3Rp
dGxlOiBTb3BoZ28gU0cyMDQyIFBDSWUgSG9zdCAoQ2FkZW5jZSBQQ0llIFdyYXBwZXIpCj4+ICsK
Pj4gK2Rlc2NyaXB0aW9uOiB8Kwo+IERvbid0IG5lZWQgJ3wrJwpHb3QsIHRoYW5rcy4KPgo+PiAr
ICBTb3BoZ28gU0cyMDQyIFBDSWUgaG9zdCBjb250cm9sbGVyIGlzIGJhc2VkIG9uIHRoZSBDYWRl
bmNlIFBDSWUgY29yZS4KPj4gKyAgSXQgc2hhcmVzIGNvbW1vbiBmZWF0dXJlcyB3aXRoIHRoZSBQ
Q0llIGNvcmUgYW5kIGluaGVyaXRzIGNvbW1vbiBwcm9wZXJ0aWVzCj4+ICsgIGRlZmluZWQgaW4g
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BjaS9jZG5zLXBjaWUtaG9zdC55YW1s
Lgo+IFRoYXQncyBjbGVhciBmcm9tIHRoZSAkcmVmLiBObyBuZWVkIHRvIHNheSB0aGF0IGluIHBy
b3NlLgpHb3QsIHRoYW5rcy4KPgo+PiArCj4+ICttYWludGFpbmVyczoKPj4gKyAgLSBDaGVuIFdh
bmcgPHVuaWNvcm5fd2FuZ0BvdXRsb29rLmNvbT4KPj4gKwo+PiArcHJvcGVydGllczoKPj4gKyAg
Y29tcGF0aWJsZToKPj4gKyAgICBjb25zdDogc29waGdvLHNnMjA0Mi1wY2llLWhvc3QKPj4gKwo+
PiArICByZWc6Cj4+ICsgICAgbWF4SXRlbXM6IDIKPj4gKwo+PiArICByZWctbmFtZXM6Cj4+ICsg
ICAgaXRlbXM6Cj4+ICsgICAgICAtIGNvbnN0OiByZWcKPj4gKyAgICAgIC0gY29uc3Q6IGNmZwo+
PiArCj4+ICsgIHNvcGhnbyxzeXNjb24tcGNpZS1jdHJsOgo+PiArICAgICRyZWY6IC9zY2hlbWFz
L3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3BoYW5kbGUKPj4gKyAgICBkZXNjcmlwdGlvbjogUGhh
bmRsZSB0byB0aGUgU1lTQ09OIGVudHJ5Cj4gUGxlYXNlIGRlc2NyaWJlIHdoYXQgeW91IG5lZWQg
dG8gYWNjZXNzLgo+Cj4+ICsKPj4gKyAgc29waGdvLGxpbmstaWQ6Cj4+ICsgICAgJHJlZjogL3Nj
aGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyCj4+ICsgICAgZGVzY3JpcHRpb246
IENhZGVuY2UgSVAgbGluayBJRC4KPiBJcyB0aGlzIGFuIGluZGV4IG9yIHJlbGF0ZWQgdG8gdGhl
IHN5c2Nvbj8gTmFrIGZvciB0aGUgZm9ybWVyLCB1c2UKPiBsaW51eCxwY2ktZG9tYWluLiBGb3Ig
dGhlIGxhdHRlciwgYWRkIGFuIGFyZyB0byBzb3BoZ28sc3lzY29uLXBjaWUtY3RybC4KTGV0IG1l
IGdpdmUgeW91IHNvbWUgYmFja2dyb3VuZCBpbmZvLgoKU0cyMDQyIHVzZXMgQ2FkZW5jZSBJUCwg
ZXZlcnkgSVAgaXMgY29tcG9zZWQgb2YgMiBjb3JlcyhjYWxsZWQgbGluazAgJiAKbGluazEgYXMg
Q2FkZW5jZSdzIHRlcm0pLiBUaGUgQ2FkZW5jZSBJUCBoYXMgdHdvIG1vZGVzIG9mIG9wZXJhdGlv
biwgCnNlbGVjdGVkIGJ5IGEgc3RyYXAgcGluLgoKSW4gdGhlIHNpbmdsZS1saW5rIG1vZGUsIHRo
ZSBDYWRlbmNlIFBDSWUgY29yZSBpbnN0YW5jZSBhc3NvY2lhdGVkIHdpdGggCkxpbmswIGlzIGNv
bm5lY3RlZCB0byBhbGwgdGhlIGxhbmVzIGFuZCB0aGUgQ2FkZW5jZSBQQ0llIGNvcmUgaW5zdGFu
Y2UgCmFzc29jaWF0ZWQgd2l0aCBMaW5rMSBpcyBpbmFjdGl2ZS4KCkluIHRoZSBkdWFsLWxpbmsg
bW9kZSwgdGhlIENhZGVuY2UgUENJZSBjb3JlIGluc3RhbmNlIGFzc29jaWF0ZWQgd2l0aCAKTGlu
azAgaXMgY29ubmVjdGVkIHRvIHRoZSBsb3dlciBoYWxmIG9mIHRoZSBsYW5lcyBhbmQgdGhlIENh
ZGVuY2UgUENJZSAKY29yZSBpbnN0YW5jZSBhc3NvY2lhdGVkIHdpdGggTGluazEgaXMgY29ubmVj
dGVkIHRvIHRoZSB1cHBlciBoYWxmIG9mIAp0aGUgbGFuZXMuCgpTRzIwNDIgY29udGFpbnMgMiBD
YWRlbmNlIElQcyBhbmQgY29uZmlndXJlcyB0aGUgQ29yZXMgYXMgYmVsb3c6CgpgYGAKIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgKy0tIENvcmUoTGluazApIDwtLS0+IHBjaWVfcmMwIMKgICstLS0t
LS0tLS0tLS0tLS0tLSsKQ2FkZW5jZSBJUCAxIC0tKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoHwgY2Ruc19wY2llMF9jdHJsIHwKIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgKy0tIENvcmUoTGluazEpIDwtLS0+IGRpc2FibGVkIMKgICstLS0tLS0tLS0tLS0t
LS0tLSsKIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgKy0tIENvcmUoTGluazApIDwtLS0+IHBjaWVf
cmMxIMKgICstLS0tLS0tLS0tLS0tLS0tLSsKQ2FkZW5jZSBJUCAyIC0tKyDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHwgY2Ruc19wY2llMV9jdHJsIHwKIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgKy0tIENvcmUoTGluazEpIDwtLS0+IHBjaWVfcmMyIMKgICst
LS0tLS0tLS0tLS0tLS0tLSsKYGBgCgoKcGNpZV9yY1ggaXMgcGNpZSBub2RlICgic29waGdvLHNn
MjA0Mi1wY2llLWhvc3QiKSBkZWZpbmVkIGluIERUUy4KY2Ruc19wY2llMF9jdHJsIGlzIHN5c2Nv
biBub2RlICgic29waGdvLHNnMjA0Mi1wY2llLWN0cmwiKSBkZWZpbmVkIGluIERUUwoKY2Ruc19w
Y2llWF9jdHJsIGNvbnRhaW5zIHNvbWUgcmVnaXN0ZXJzIHNoYXJlZCBieSBwY2llX3JjWCwgZXZl
biB0d28gClJDKExpbmspcyBtYXkgc2hhcmUgZGlmZmVyZW50IGJpdHMgb2YgdGhlIHNhbWUgcmVn
aXN0ZXIuIEZvciAKZXhhbXBsZe+8jGNkbnNfcGNpZTFfY3RybCBjb250YWlucyByZWdpc3RlcnMg
c2hhcmVkIGJ5IGxpbmswICYgbGluazEgZm9yIApDYWRlbmNlIElQIDIuCgpTbyB3ZSBkZWZpbmVk
ICJzb3BoZ28sbGluay1pZCIgdG8gZmxhZyB3aGljaCBjb3JlKGxpbmspIHRoZSByYyBtYXBzIHRv
LCAKd2l0aCB0aGlzIHdlIGNhbiBrbm93IHdoYXQgcmVnaXN0ZXJzKGJpdHMpIHdlIHNob3VsZCB1
c2UuCgpUaGF0J3Mgd2h5IEkgZG9uJ3QgdXNlICJsaW51eCxwY2ktZG9tYWluIiBhbmQgYWxzbyBp
dCdzIG5vdCBwcm9wZXIgdG8gCmRlZmluZSBpdCBhcyBhcmcgdG8gInNvcGhnbyxzeXNjb24tcGNp
ZS1jdHJsIi4KCgo+PiArCj4+ICsgIHNvcGhnbyxpbnRlcm5hbC1tc2k6Cj4+ICsgICAgJHJlZjog
L3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvZmxhZwo+PiArICAgIGRlc2NyaXB0aW9u
OiBJZGVudGlmaWVzIHdoZXRoZXIgdGhlIFBDSUUgbm9kZSB1c2VzIGludGVybmFsIE1TSSBjb250
cm9sbGVyLgo+IFdvdWxkbid0ICdtc2ktcGFyZW50JyB3b3JrIGZvciB0aGlzIHB1cnBvc2U/Ckkg
d2lsbCBjaGVjayBpdCBvdXQsIHRoYW5rcy4KPgo+PiArCj4+ICsgIHZlbmRvci1pZDoKPj4gKyAg
ICBjb25zdDogMHgxZjFjCj4+ICsKPj4gKyAgZGV2aWNlLWlkOgo+PiArICAgIGNvbnN0OiAweDIw
NDIKPj4gKwo+PiArICBpbnRlcnJ1cHRzOgo+PiArICAgIG1heEl0ZW1zOiAxCj4+ICsKPj4gKyAg
aW50ZXJydXB0LW5hbWVzOgo+PiArICAgIGNvbnN0OiBtc2kKPj4gKwo+PiArYWxsT2Y6Cj4+ICsg
IC0gJHJlZjogY2Rucy1wY2llLWhvc3QueWFtbCMKPj4gKwo+PiArcmVxdWlyZWQ6Cj4+ICsgIC0g
Y29tcGF0aWJsZQo+PiArICAtIHJlZwo+PiArICAtIHJlZy1uYW1lcwo+PiArICAtIHNvcGhnbyxz
eXNjb24tcGNpZS1jdHJsCj4+ICsgIC0gc29waGdvLGxpbmstaWQKPj4gKyAgLSB2ZW5kb3ItaWQK
Pj4gKyAgLSBkZXZpY2UtaWQKPj4gKyAgLSByYW5nZXMKPiByYW5nZXMgaXMgYWxyZWFkeSByZXF1
aXJlZCBpbiB0aGUgY29tbW9uIHNjaGVtYXMuCkdvdC4KPj4gKwo+PiArYWRkaXRpb25hbFByb3Bl
cnRpZXM6IHRydWUKPj4gKwo+PiArZXhhbXBsZXM6Cj4+ICsgIC0gfAo+PiArICAgIHBjaWVANjIw
MDAwMDAgewo+PiArICAgICAgY29tcGF0aWJsZSA9ICJzb3BoZ28sc2cyMDQyLXBjaWUtaG9zdCI7
Cj4+ICsgICAgICBkZXZpY2VfdHlwZSA9ICJwY2kiOwo+PiArICAgICAgcmVnID0gPDB4NjIwMDAw
MDAgIDB4MDA4MDAwMDA+LAo+PiArICAgICAgICAgICAgPDB4NDgwMDAwMDAgIDB4MDAwMDEwMDA+
Owo+PiArICAgICAgcmVnLW5hbWVzID0gInJlZyIsICJjZmciOwo+PiArICAgICAgI2FkZHJlc3Mt
Y2VsbHMgPSA8Mz47Cj4+ICsgICAgICAjc2l6ZS1jZWxscyA9IDwyPjsKPj4gKyAgICAgIHJhbmdl
cyA9IDwweDgxMDAwMDAwIDAgMHgwMDAwMDAwMCAweGRlMDAwMDAwIDAgMHgwMDAxMDAwMD4sCj4+
ICsgICAgICAgICAgICAgICA8MHg4MjAwMDAwMCAwIDB4ZDA0MDAwMDAgMHhkMDQwMDAwMCAwIDB4
MGQwMDAwMDA+Owo+PiArICAgICAgYnVzLXJhbmdlID0gPDB4ODAgMHhiZj47Cj4+ICsgICAgICB2
ZW5kb3ItaWQgPSA8MHgxZjFjPjsKPj4gKyAgICAgIGRldmljZS1pZCA9IDwweDIwNDI+Owo+PiAr
ICAgICAgY2Rucyxuby1iYXItbWF0Y2gtbmJpdHMgPSA8NDg+Owo+PiArICAgICAgc29waGdvLGxp
bmstaWQgPSA8MD47Cj4+ICsgICAgICBzb3BoZ28sc3lzY29uLXBjaWUtY3RybCA9IDwmY2Ruc19w
Y2llMV9jdHJsPjsKPj4gKyAgICAgIHNvcGhnbyxpbnRlcm5hbC1tc2k7Cj4+ICsgICAgICBpbnRl
cnJ1cHQtcGFyZW50ID0gPCZpbnRjPjsKPj4gKyAgICB9Owo+PiAtLSAKPj4gMi4zNC4xCj4+Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
