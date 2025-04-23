Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45D3AC369C2
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Apr 2025 02:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5uvzQdM2K9liNB9J7Jq+pOMEXn26HD71Ot+LlPlpcDA=; b=Mao/4BRDb4MSIn05rBfeRH4CVS
	xTaxj2Y5MJb3kJ1PaH4ZAb0CDGmJSvqGEueB+iLCqhcLPkSG+mtHVB4R4TxikHhU5Ym4NhIpGVL4A
	UBwZkHuvDSiQTPT3qe/XKIdY2hdHn2G2rs/bKBrVoT6Vu3qiJuy/67/fXB7HfJXCHdyg8XOplGO6v
	P3F7Xti0cQCBPaYAp5KNdiv/BcWAgk4c8g06M37MrSP70DNseLkx6wa0yRteY4qxa5rS6xA5MbQuO
	6kuA5fTzgKMJcawiQBoIoawieb7LmaQwanpExpozEU7fZD6Uz8oq+FldlfCFd1o4oYqYpaD7b9YyC
	Nd5k/VQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7PkF-000000092Mf-0uxA;
	Wed, 23 Apr 2025 02:21:51 +0000
Received: from mail-centralindiaazolkn190110001.outbound.protection.outlook.com ([2a01:111:f403:d409::1] helo=PNZPR01CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7PkC-000000092KV-2x9w
	for linux-riscv@lists.infradead.org;
	Wed, 23 Apr 2025 02:21:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JXIQkD5sidbu6ml3DzAWY1fRlRm23NKndMR5FnULeFjmlsDxSqV51zhHW1Uz5UKQM2r9QomkNU94iHIidZ5SkNflrHZw5sfFjzu3GJrqUYACrBTWnoJ6ijJMJWr7ZLDBANYEYgzuZ9hq20qM/CF0YkmyIdmj8YkskgZ6vojjpRxggAe/ZNh7JE3kbPgJFWUfuon9d6t8K1r9QLRV7ePcMUSZuzN+6nw8Ifwkh2BGObGspSz1F/79kiqE73JPLNazCDm73P3S8ZseCM9cGxXIN3SLMcT9gHNzNONn73jNOyuMwpDlwHgT68ribTIqi4DMbSbgTIoQ6LfgY/L/fzL/gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5cgCRukgHhpCT2SOk8EUtaVmdd5zQdn7SZ2qJgY7ybw=;
 b=lHb+M4eGdbm1ww8ZTAhNuM0OCuWgIuBwM6HBcaiGQxJ6aJfmtq01N9I6kOTh+vA/bJMk7c+Fi6kjix6cz2oXOu3r126Ul0RDrc+JGxzmZilZMNOpH28MFHsxNHK0bWJXRsx6EMoOzrAlSCFcjYe4BxBkZ87ipzYQ7Lh56/oFdSLNJ1mQgCmCTHBuE2vfFdb5VBTaccy5Ynm8fOWPCog7qDdIJOZddlsvJrvaiWfIQ/rp14QFIo2qTV0Ml7g1iabqNB9dtbudFv8urqy4Qv9RXofHpR+jbkQBgkrdN1AHQB983YAVv86ekEysCMCOEEdo4mD319I2HVkpfPcpgTeT/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5cgCRukgHhpCT2SOk8EUtaVmdd5zQdn7SZ2qJgY7ybw=;
 b=RfWpz6vC3zV2T0QF9PpPhWIH4Q8wcUlP+xqDBJ+zmxkiKkJJd3ztGl8hqLVseYp7jHM0I8E4xjRwxmtoAocfDaf7pJNmNBqNxvsEbpfVFOb3SjfEzRMpzFl286clAAylD3cIj28AZhBGI1fhErQhCzy+cSnEsRpavFguQrx9nwzzj3PqWoAPAX55a+673kDWse1har6g8XQLPM/r1iPTSgBq14KQtDn9o99IVTYpzc3NT+h6UXo6YkcQcAiKe+HkIhPQ5nm6Deq3x0Jgwq58A7mGLdqM9r8NPHepvKrinHT4KzEN3Fe7ZsO4vnte7oAF3zz3DJJJAto7J1claRS44Q==
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:100::6)
 by MAYP287MB3788.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:148::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Wed, 23 Apr
 2025 02:21:32 +0000
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4]) by MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4%5]) with mapi id 15.20.8678.021; Wed, 23 Apr 2025
 02:21:31 +0000
Message-ID: <MA0P287MB22620E425A4AC72E5C32D325FEBA2@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Date: Wed, 23 Apr 2025 10:21:21 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: reset: add support for
 canaan,k230-rst
To: Junhui Liu <junhui.liu@pigmoral.tech>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>
References: <20250420-k230-reset-v2-0-f1b4a016e438@pigmoral.tech>
 <20250420-k230-reset-v2-1-f1b4a016e438@pigmoral.tech>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20250420-k230-reset-v2-1-f1b4a016e438@pigmoral.tech>
X-ClientProxiedBy: TYWP286CA0012.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::14) To MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:100::6)
X-Microsoft-Original-Message-ID: <dcb14542-2094-4b29-8181-62b589c0ef70@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2262:EE_|MAYP287MB3788:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bb4526a-1d01-4f4c-8e59-08dd820d8e2f
X-Microsoft-Antispam: BCL:0;ARA:14566002|8060799006|5072599009|15080799006|19110799003|461199028|7092599003|8022599003|12121999004|6090799003|440099028|3412199025|12071999003|21061999003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WnpucGZpbzQ4ekdvY3YxcktrTjRyTjQ2cmJhZ0djeFJ6aXJNOVAycWZrVzZp?=
 =?utf-8?B?MElVVnA1Z0ZBNTdRVDFMdEdsb1g2bzYyNi9uamRneTFkdUdhMzlaYndZMENG?=
 =?utf-8?B?endrNExaeDNWV3hZSW9jRGhqcDFIU0F3YURxZ2pMKzhyK09KdzBkTXlLZzZj?=
 =?utf-8?B?VmxRZityNlcyTWY0UjJ4NFA1c0s4cDNvRk1HS3M2K05LT3dRQUR6KzlWOUY2?=
 =?utf-8?B?WjkzWnh3U0JUN24xRWdZOWVUNWJaeTBHL2c0a1BqWWExNCtzbURDMWZLTE5H?=
 =?utf-8?B?VjArTmVlS0V3OVJZc0pQc1ZxbXozTmNBVFFGYk5NOExuQ2Yrd0xuWmw1MkFP?=
 =?utf-8?B?eTNOdE54KzJKTXk3ZFRjU3hwM3RGVWZvRkhlZjZqMjVoSFIvOXdpbnZsL2Y0?=
 =?utf-8?B?WkQzaEpyWkRHWWlnWGhyRUVxczFobzlYRXoyZm45cElvTFBOSE1SSTNkMk9k?=
 =?utf-8?B?MGtyVEdxczdFNWJPUG9sVTVxdTQvWDN5YUZTNEQ4Zi9zYUlmNERnd29kTUdo?=
 =?utf-8?B?T1paOFNjaUR4ZHRKMStGdy9ML1IvcE0zN0FPejJVWjNFNlBubGlrWDFBMzI1?=
 =?utf-8?B?VWkxSHgxNFh2NGQ5bFdiR2NoK0lUOVlndnFleWh0Mm9GRlJXWHdBeGFjTTFF?=
 =?utf-8?B?UmplRm1CT25HUWI1bDZUVjdhbW5RVXA1dFRCdHJWMVdET0pZWWRaVFdYV3h1?=
 =?utf-8?B?Z0JZMjdFLzNWT3BleHIyWFZUUklYSDl5ZE55YjhqYm80M1BHN1hVNGVxY3hM?=
 =?utf-8?B?Z1dmNk82TlUxQkp6a1VvOVBma1diUURQbGhGNEN4azVxTzVha0tBbEl2b3pW?=
 =?utf-8?B?UjdoK2dqdzZRaHRkUlNxZnhQNWd3UEkyUnZ0Y2Q5MTNvdldwTDl1TTgreEZl?=
 =?utf-8?B?bmQ4VS9wMi9SOXRkZHA0TndUZEZUUnJBeENtL1g3YmNCNEI1Y0pSWm8zaUh4?=
 =?utf-8?B?VTJDcXZHWHRHVk56R0FhN1l2YXRRSGoxRXc3K3ZTMzFKaFQyTVQ2OHhzcnM4?=
 =?utf-8?B?Z1pMNUNJTFdyQ2JBMzRDbVRJRjBaSXR1bldUOGpVd1pjNS9hbXZkeWV1ZEQ2?=
 =?utf-8?B?S0VQVUxRTlJEK1ZlRkhNQ2lyVzYzbDhVOXVoYXdaOENOL0ZlZ080MGQ2SXZ2?=
 =?utf-8?B?bW00OEtnRTFESzJTWTZueGc4b2Ntc29ZSll3bEdBT0lEWjRuOXhjaytOVEVB?=
 =?utf-8?B?UXRZVzVQRzRWVnpBUEdWZHpMcmp3MGJHWkNjMFB4TXY4MHRzaTJhKytsT1By?=
 =?utf-8?B?b0NxY012ZTBsaVhZYXhhVWFkQ1FWOVNpbE5neGhIVFMxalFvWDJWVWZTSkJk?=
 =?utf-8?B?NlFkbktBQnJYQ0NIN0dxWmk4VW51L2VKNVRRRjM1T21FeHN0eisrMlFmWFBt?=
 =?utf-8?B?U3dTZFh3MUJiOGxzalN3RUFGOGhXMzZNN2lSNE1PN3ptdyt1NlNGd2VJM25y?=
 =?utf-8?B?aEJLUTVpdDQ5ZFBFalEzMllqQzJNazdRVFBUZ08vUVViOUJyeWxKWFlQVVQ0?=
 =?utf-8?B?VFdhZ3pDaHQxUXNVenFIb3ZSdlNFYlcrSXJrbmRyZjhiQlRjNjBFS3JZdWFa?=
 =?utf-8?B?RnRCNDFlQmtrejFUbDZoa0NGemtGWVFRRER0TUJLajZ5UVZndnNtQkVDT0FY?=
 =?utf-8?B?QTN3S3FYUEcxem1FQTFQNFFRcjg2OXJ0N1pEVUNKNkh6bTVzVFA1NFUxQ25T?=
 =?utf-8?B?a0g3WkJWQ3lMbERwLzA0TE5WRmFPNks4K25DMnpjUDhGaFlnWmZjUjNRPT0=?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UmJ0N1lLWTlJTUx2dHNsaGJ0bVJDdjlJdTZ2cTU0RkRVY0tybUlqeEcxbEs4?=
 =?utf-8?B?RU8yWmJuQzJIUTlCRVhvQmZzOTdwUlJQS2oyc3VVdHFrcjg2ekJxdGZxM0dP?=
 =?utf-8?B?VWQvNytYbkg0V2Y3bkcrRnhrSjFyT1B5b3RkeWpLOVpRUzQ1b1gxT3RoMTR1?=
 =?utf-8?B?UkZBMHp5Y0Z6WU9vbTdleTZkZ3BJWkd1dEM2UjRIQTlEeWZiWC91ZnV0dXNX?=
 =?utf-8?B?S1VaRGhFdTRRVGZFM2hiKy9zY2g5eSs0cHNJVmViYUZXOXNENnpiUWswbUpr?=
 =?utf-8?B?YjJUWWhtc3FGRXd3UlQyVFR5NGlpeXpjZXJ2WXJnWXJ3eG00MjNYajRITklu?=
 =?utf-8?B?L3FMNEh2Rndud3BDQjNuMXQyZTltWkNnalVRNWIxeGpoTlpBVm0rRXN4S2x0?=
 =?utf-8?B?OWl2TTV4TEdjRWJIeVo1L2p5eTJpeDFmTnZXN29ibHZ3SUJjcFROVTBlTkZm?=
 =?utf-8?B?VVpzT2dPM2lING5saGhnL2ZmcG5JOVo5azVxUUdzRjF3cnFxczBqNDJXN2M1?=
 =?utf-8?B?aUt3QmZ4cjk5bndodWZSMkR0VTFleHJocEQrSm1oTkFnTWwzYUpwZ0l1Qk4x?=
 =?utf-8?B?UTBMOFZFVE56OTdBZlV6SDl1RDdNTGcwaHhySGxJRWd5WVREV3d6bm5FRzlF?=
 =?utf-8?B?VVozT1pEU2cwUkdLbWlPRmJVdE5UZkwrNnk5bnZUUStUeWd3RGhnQXdEZHB3?=
 =?utf-8?B?dFFvU2REMUFuOUduZjFONk9waU16RE16YjRMSlp1bmtTR09OemxhdCsrOUxL?=
 =?utf-8?B?b0FVM2hSdGRoT0hyeXhHZ1ZFMWptcy9ZSmpLaXZLT1Bub05PcG42RUQzSlBj?=
 =?utf-8?B?aWJFVjJvSkxpU0RaVlRzWWdLMzlsb1hkaXY3N2RQNlVnaUxNUlA2aXpTRWFX?=
 =?utf-8?B?OGtEVFVLYWdiK1JVTTlWSjlBMjkyaWg0RFNvMVlLSnNDaDhZblpiNGdQa2h6?=
 =?utf-8?B?c2hLaTZVSnBwL1BCZkZ6VTVvL1lEYjZ6TmJLYlBUaTVlT0R1SFJnL2NVOEVD?=
 =?utf-8?B?VG92Z1hIUXRUZ3dDeHRXVEltcDF2dmFvMFY0cjFRYWtad3NrM2g1TTV5ZGdP?=
 =?utf-8?B?RXEzdEJrM3MzMktyQWlORm9FcTFPU3U4RlNDaGFLMFRnWXpzOFdwZS9uN1Bj?=
 =?utf-8?B?dTFQd0svN0Y2ckFobVljRE9UQU1zeldiVWVoMXRXUE9MMyszYWFZa0kyN1Ft?=
 =?utf-8?B?Z2lFMFFIT3V5UWQ2anhlWVhyVFNpTEl6QlQzOFNDUFJqTTJQSGM2Q0hUMFR6?=
 =?utf-8?B?LzBpbWNoNnliUFVWc3hGRjVkNm1zdUZwSXNaOFFuTlM2Y1g4dmY0WWZvdEFG?=
 =?utf-8?B?WEJMZHB1cVpvbGV3TkRDdUZSZ2ZpMkNDL2FvNCs3RHRvK3ozT3FDQ0tCZVJD?=
 =?utf-8?B?aXNuN2ZzV2RtRE9KTFhoSkhJZzVTUk14TzQ4S2FCZnJoZUN2Mk84YWtXOUZP?=
 =?utf-8?B?aGF2K3lGRnl3UmluZjZvNVNNMFU0YW1FSitpT1pKOUQyblpIcS85ZllYcTF5?=
 =?utf-8?B?bmVLNUFQOGNTVUpBMFpMaXAyQzlXeVRmMEI1Mm9LYWdmYnc0bDNWSks0MHBE?=
 =?utf-8?B?VlgwZnREeVJYcjdtLzFvWkpGSC9RdlFZbHZtOGdIUUtGVlpERUxvWkhkdGp3?=
 =?utf-8?B?anBWOHdsZ05yck1VaDQ1VGNGUE1VMUNFZGM0cFVqODRNRlA5bEcrMytOb29O?=
 =?utf-8?B?eTdGYkRObERPK1hUU3VNWGhYSGw5RTEyMkxVSzgxdHhlL0hYV3NJQjVIR3Rw?=
 =?utf-8?Q?aNNhP9qWcNELVUlTC3CtCjC9dU6y6NiAf5BoNAt?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bb4526a-1d01-4f4c-8e59-08dd820d8e2f
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 02:21:31.1496
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAYP287MB3788
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_192148_744306_CA1A9322 
X-CRM114-Status: GOOD (  12.85  )
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

aGnvvIxKdW5odWnvvIwKCk9uIDIwMjUvNC8yMCAxOjA5LCBKdW5odWkgTGl1IHdyb3RlOgo+IElu
dHJvZHVjZXMgYSByZXNldCBjb250cm9sbGVyIGRyaXZlciBmb3IgdGhlIEtlbmRyeXRlIEsyMzAg
U29DLAo+IHJlc3Bvc2libGUgZm9yIG1hbmFnaW5nIHRoZSByZXNldCBmdW5jdGlvbmFsaXR5IG9m
IHRoZSBDUFVzIGFuZAo+IHZhcmlvdXMgc3ViLW1vZHVsZXMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBK
dW5odWkgTGl1IDxqdW5odWkubGl1QHBpZ21vcmFsLnRlY2g+Cj4gUmV2aWV3ZWQtYnk6IENvbm9y
IERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+Cj4gLS0tCj4gICAuLi4vZGV2aWNl
dHJlZS9iaW5kaW5ncy9yZXNldC9jYW5hYW4sazIzMC1yc3QueWFtbCB8IDM5ICsrKysrKysrKysK
PiAgIGluY2x1ZGUvZHQtYmluZGluZ3MvcmVzZXQvY2FuYWFuLGsyMzAtcnN0LmggICAgICAgIHwg
OTAgKysrKysrKysrKysrKysrKysrKysrKwo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAxMjkgaW5zZXJ0
aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9yZXNldC9jYW5hYW4sazIzMC1yc3QueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9yZXNldC9jYW5hYW4sazIzMC1yc3QueWFtbAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0
Cj4gaW5kZXggMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMC4uZDM1MmQw
ZTEyZDgxMDZhMjMyYmI1ZTZkN2UxMzg2OTdkMjEwNjkzNwo+IC0tLSAvZGV2L251bGwKPiArKysg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmVzZXQvY2FuYWFuLGsyMzAtcnN0
LnlhbWwKPiBAQCAtMCwwICsxLDM5IEBACj4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChH
UEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlKQoKVGhlIGNvcHlyaWdodCBzdGF0ZW1lbnQgaW4g
eWFtbCBhbmQgaGVhZGVyIGZpbGVzIHNob3VsZCBiZSBjb25zaXN0ZW50LgoKT3RocmVzIExHVE0u
CgpSZXZpZXdlZC1ieTogQ2hlbiBXYW5nIDx1bmljb3JuX3dhbmdAb3V0bG9vay5jb20+CgpUaGFu
a3MsCgpDaGVuCgpbLi4uLi4uXQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2R0LWJpbmRpbmdzL3Jl
c2V0L2NhbmFhbixrMjMwLXJzdC5oIGIvaW5jbHVkZS9kdC1iaW5kaW5ncy9yZXNldC9jYW5hYW4s
azIzMC1yc3QuaAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMC4uNTNlM2ZkODE3NzA3MWFlZjg5ODNjNjMxNzA2ZDY3
YWM4NmFiNjQ1Ygo+IC0tLSAvZGV2L251bGwKPiArKysgYi9pbmNsdWRlL2R0LWJpbmRpbmdzL3Jl
c2V0L2NhbmFhbixrMjMwLXJzdC5oCj4gQEAgLTAsMCArMSw5MCBAQAo+ICsvKiBTUERYLUxpY2Vu
c2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5ICovCgpIZXJlLgoKWy4uLi5dCgoKPiArLyoKPiAr
ICogQ29weXJpZ2h0IChDKSAyMDIzLTIwMjQgQ2FuYWFuIEJyaWdodCBTaWdodCBDby4sIEx0ZAo+
ICsgKiBDb3B5cmlnaHQgKEMpIDIwMjQtMjAyNSBKdW5odWkgTGl1IDxqdW5odWkubGl1QHBpZ21v
cmFsLnRlY2g+Cj4gKyAqLwo+ICsjaWZuZGVmIF9EVF9CSU5ESU5HU19DQU5BQU5fSzIzMF9SU1Rf
SF8KPiArI2RlZmluZSBfRFRfQklORElOR1NfQ0FOQUFOX0syMzBfUlNUX0hfCj4gKwo+ICsjZGVm
aW5lIFJTVF9DUFUwCQkwCj4gKyNkZWZpbmUgUlNUX0NQVTEJCTEKPiArI2RlZmluZSBSU1RfQ1BV
MF9GTFVTSAkJMgo+ICsjZGVmaW5lIFJTVF9DUFUxX0ZMVVNICQkzCj4gKyNkZWZpbmUgUlNUX0FJ
CQkJNAo+ICsjZGVmaW5lIFJTVF9WUFUJCQk1Cj4gKyNkZWZpbmUgUlNUX0hTCQkJNgo+ICsjZGVm
aW5lIFJTVF9IU19BSEIJCTcKPiArI2RlZmluZSBSU1RfU0RJTzAJCTgKPiArI2RlZmluZSBSU1Rf
U0RJTzEJCTkKPiArI2RlZmluZSBSU1RfU0RJT19BWEkJCTEwCj4gKyNkZWZpbmUgUlNUX1VTQjAJ
CTExCj4gKyNkZWZpbmUgUlNUX1VTQjEJCTEyCj4gKyNkZWZpbmUgUlNUX1VTQjBfQUhCCQkxMwo+
ICsjZGVmaW5lIFJTVF9VU0IxX0FIQgkJMTQKPiArI2RlZmluZSBSU1RfU1BJMAkJMTUKPiArI2Rl
ZmluZSBSU1RfU1BJMQkJMTYKPiArI2RlZmluZSBSU1RfU1BJMgkJMTcKPiArI2RlZmluZSBSU1Rf
U0VDCQkJMTgKPiArI2RlZmluZSBSU1RfUERNQQkJMTkKPiArI2RlZmluZSBSU1RfU0RNQQkJMjAK
PiArI2RlZmluZSBSU1RfREVDT01QUkVTUwkJMjEKPiArI2RlZmluZSBSU1RfU1JBTQkJMjIKPiAr
I2RlZmluZSBSU1RfU0hSTV9BWElNCQkyMwo+ICsjZGVmaW5lIFJTVF9TSFJNX0FYSVMJCTI0Cj4g
KyNkZWZpbmUgUlNUX05PTkFJMkQJCTI1Cj4gKyNkZWZpbmUgUlNUX01DVEwJCTI2Cj4gKyNkZWZp
bmUgUlNUX0lTUAkJCTI3Cj4gKyNkZWZpbmUgUlNUX0lTUF9EVwkJMjgKPiArI2RlZmluZSBSU1Rf
RFBVCQkJMjkKPiArI2RlZmluZSBSU1RfRElTUAkJMzAKPiArI2RlZmluZSBSU1RfR1BVCQkJMzEK
PiArI2RlZmluZSBSU1RfQVVESU8JCTMyCj4gKyNkZWZpbmUgUlNUX1RJTUVSMAkJMzMKPiArI2Rl
ZmluZSBSU1RfVElNRVIxCQkzNAo+ICsjZGVmaW5lIFJTVF9USU1FUjIJCTM1Cj4gKyNkZWZpbmUg
UlNUX1RJTUVSMwkJMzYKPiArI2RlZmluZSBSU1RfVElNRVI0CQkzNwo+ICsjZGVmaW5lIFJTVF9U
SU1FUjUJCTM4Cj4gKyNkZWZpbmUgUlNUX1RJTUVSX0FQQgkJMzkKPiArI2RlZmluZSBSU1RfSERJ
CQkJNDAKPiArI2RlZmluZSBSU1RfV0RUMAkJNDEKPiArI2RlZmluZSBSU1RfV0RUMQkJNDIKPiAr
I2RlZmluZSBSU1RfV0RUMF9BUEIJCTQzCj4gKyNkZWZpbmUgUlNUX1dEVDFfQVBCCQk0NAo+ICsj
ZGVmaW5lIFJTVF9UU19BUEIJCTQ1Cj4gKyNkZWZpbmUgUlNUX01BSUxCT1gJCTQ2Cj4gKyNkZWZp
bmUgUlNUX1NUQwkJCTQ3Cj4gKyNkZWZpbmUgUlNUX1BNVQkJCTQ4Cj4gKyNkZWZpbmUgUlNUX0xT
X0FQQgkJNDkKPiArI2RlZmluZSBSU1RfVUFSVDAJCTUwCj4gKyNkZWZpbmUgUlNUX1VBUlQxCQk1
MQo+ICsjZGVmaW5lIFJTVF9VQVJUMgkJNTIKPiArI2RlZmluZSBSU1RfVUFSVDMJCTUzCj4gKyNk
ZWZpbmUgUlNUX1VBUlQ0CQk1NAo+ICsjZGVmaW5lIFJTVF9JMkMwCQk1NQo+ICsjZGVmaW5lIFJT
VF9JMkMxCQk1Ngo+ICsjZGVmaW5lIFJTVF9JMkMyCQk1Nwo+ICsjZGVmaW5lIFJTVF9JMkMzCQk1
OAo+ICsjZGVmaW5lIFJTVF9JMkM0CQk1OQo+ICsjZGVmaW5lIFJTVF9KQU1MSU5LMF9BUEIJNjAK
PiArI2RlZmluZSBSU1RfSkFNTElOSzFfQVBCCTYxCj4gKyNkZWZpbmUgUlNUX0pBTUxJTksyX0FQ
Qgk2Mgo+ICsjZGVmaW5lIFJTVF9KQU1MSU5LM19BUEIJNjMKPiArI2RlZmluZSBSU1RfQ09ERUNf
QVBCCQk2NAo+ICsjZGVmaW5lIFJTVF9HUElPX0RCCQk2NQo+ICsjZGVmaW5lIFJTVF9HUElPX0FQ
QgkJNjYKPiArI2RlZmluZSBSU1RfQURDCQkJNjcKPiArI2RlZmluZSBSU1RfQURDX0FQQgkJNjgK
PiArI2RlZmluZSBSU1RfUFdNX0FQQgkJNjkKPiArI2RlZmluZSBSU1RfU0hSTV9BUEIJCTcwCj4g
KyNkZWZpbmUgUlNUX0NTSTAJCTcxCj4gKyNkZWZpbmUgUlNUX0NTSTEJCTcyCj4gKyNkZWZpbmUg
UlNUX0NTSTIJCTczCj4gKyNkZWZpbmUgUlNUX0NTSV9EUEhZCQk3NAo+ICsjZGVmaW5lIFJTVF9J
U1BfQUhCCQk3NQo+ICsjZGVmaW5lIFJTVF9NMAkJCTc2Cj4gKyNkZWZpbmUgUlNUX00xCQkJNzcK
PiArI2RlZmluZSBSU1RfTTIJCQk3OAo+ICsjZGVmaW5lIFJTVF9TUEkyQVhJCQk3OQo+ICsKPiAr
I2VuZGlmCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
