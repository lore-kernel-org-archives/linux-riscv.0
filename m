Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F6E1C27C75
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jun 2024 10:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:To:Subject:Cc:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=/OEEO8jvMD3gSH4w+rIBUMV8LnEGwcm2/EVCMQqseeI=; b=ZTZsi49iWFq8Lhq5kdlsA5O/Kn
	Rv/ub6muLratS12nSRaysOoOp9SJV6umo2BkGm7S+YJ3XfqaFaucNdiC3FBEzuEm10EMh7uTzhq7u
	17Tr4r010Vk/xLyID/3hjnAe3G2eV2pj4hjJ28bz66EKeqBy1EkeUOQb3g0lA4tDGaWw+imnLWxqw
	6NcCBgZmQQ474T+uOisFMpnu5/kJUmKeL3tDxuXmbwSMtE2m6ENtWF1LS8CZK2hdLq9mKj501vK9d
	QKLI4x46N2YoLT5Y+6EjGpMthVSG73vapDL2G5wdxrx8qPXKFw/urtuyR/5nPjE2QlYLsJ3b8IJb4
	35fjkhTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHLPI-0000000CHRq-3XMv;
	Wed, 12 Jun 2024 10:40:44 +0000
Received: from mail-tycjpn01olkn20800.outbound.protection.outlook.com ([2a01:111:f403:2814::800] helo=JPN01-TYC-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHLPG-0000000CHOv-3jq5
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jun 2024 10:40:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ElEmR9nerz6GKlxSylY7eNgyjpTJ5qlfyMP5X2CdgTtMmBXgOMuwIDpXuuzVe2GTZe0tNFCSnsdjT8sOqV9s/bIucJjfvPwhMvjafYvXhUhz3mBno/+MysVG05c0626NhkfKxtUamrOPRaGR8Gnv08/6LArjx2yCDitBOFUz1bbCUQIz0j85OfzwZ6sEnN9tIwuhrUTEtXHf19BQnGDlALcMBtme25pE0QokO8WYeGuGWccr2zbjDOgVSMFmOizD1tS62pWdhBG0/4ulF01oh4s6P1NRj6688epFtfR/FUgAVtLKEsikFwfVGUQcBtvi6m0EPwuq6zXIGmrU6w5AhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HS90WMbKj3O4Rpx+fXhdV42ZMTXxSY/H7fUmoQsQbU4=;
 b=BqTLXZC4Zhx/hSB4+P/pEdyLAvS29MLqpnqfpPeBgY9FkzfuBTnbeSjQKa7PcNPj354/iX49CT/+PnEkCRf6xQ1MvR+n9qDg3zJtqn2hScZUGcLNxHp5yeaGY8OZ4udsXOliwht14EnCv5qx8IYsLFqyNWnqd4M6xCTbezu+mEjLJYy2ylO/p/8NPWVRIO76b20JBNxI5WWZaqnbT1eIwfeY5TkNJ0w5lP5n1H/4sEW1nweZd3h1m2HeQIlHYImzapRo8dDUqDAEmRGn4PT4SGrgyI7nNFASDS5hyDALir+pF6g3/suSbLByJMxWQaTfgCAmftznruauGC6c+lyTVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HS90WMbKj3O4Rpx+fXhdV42ZMTXxSY/H7fUmoQsQbU4=;
 b=sLbUUBv667WyQeMSJIson+NDXVwseILoRBykWJ9XRIP7tJMbUaPRtloUBN3dbPm2jp9r7lImF5pAF43p8Ac6S1YBPp6fhk0hC9az8DAao9yhBuAmcJ6Ehj6mNjkCNwW/E3wFPXwQk6nirKdkYIf9ohI7uQZZh9RXLS6iWPlVZO2/mnew+xxz4OQm92qwzci+WcRrbZT/C3aSTi6Lvfp+Ii5rRMr8jBcr8l5lE/iRIyQIWmQ2kkTVHWlcu2Ll++vG3T3D8qZjF/DLlDwftlHkbCMuIgX2hArEBZhVSZvZc6n4wqPoIYDTuyOjDobIxUE2VH/Ejx+mk0l3ED2Jf5IwYw==
Received: from TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:23e::10)
 by TYWP286MB3208.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:2d7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Wed, 12 Jun
 2024 10:40:34 +0000
Received: from TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM
 ([fe80::85b8:3d49:3d3e:2b3]) by TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM
 ([fe80::85b8:3d49:3d3e:2b3%5]) with mapi id 15.20.7677.019; Wed, 12 Jun 2024
 10:40:33 +0000
Message-ID: <TY3P286MB2611C1FA44AD40E4DC538A3498C02@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
Date: Wed, 12 Jun 2024 18:36:19 +0800
User-Agent: Mozilla Thunderbird
Cc: wiagn233@outlook.com, stable@vger.kernel.org
Subject: Re: [PATCH v2] riscv: dts: starfive: Set EMMC vqmmc maximum voltage
 to 3.3V on JH7110 boards
To: kernel@esmil.dk, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, william.qiu@starfivetech.com,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
References: <TY3P286MB261189B5D946BDE69398EE3A98C02@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
From: Shengyu Qu <wiagn233@outlook.com>
Autocrypt: addr=wiagn233@outlook.com; keydata=
 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
In-Reply-To: <TY3P286MB261189B5D946BDE69398EE3A98C02@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
X-TMN: [MwI1/qrMKi66k2BsSTI2zBWgnyDkuUdExlASzLdW4YKYnMAJ9MS7tS4VuE5EGZT3]
X-ClientProxiedBy: TYCP286CA0169.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::12) To TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:23e::10)
X-Microsoft-Original-Message-ID: <f3dcbc98-a7fe-4bc1-86b8-515e24d1a369@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3P286MB2611:EE_|TYWP286MB3208:EE_
X-MS-Office365-Filtering-Correlation-Id: c64b2346-bd23-46fd-154d-08dc8acc16af
X-Microsoft-Antispam: BCL:0;ARA:14566002|461199020|440099020|3412199017|1710799020;
X-Microsoft-Antispam-Message-Info: uL9+yrtboyXIoRwBea/pDbHViEhI2mMAlm/kASJ4Rw/mhKyH+MY5ijShhgOFZlpYcbgixRmFwCL338I9AXxL5gT19DLWBo5oyJuFrE+F/39kXldVE4UntLJysMT21pFojcDBUfnoqLG4eVlJshPFfZi4LZEhJEBeiexEmt6AjfBgeujbs8nKg1nvRSvpU0ftqJafJUcx6LMO0IptYJkxrzzrsqQGZV1ftDP8FF2/z6QVerFonmG42LA3bI4ixxmF+b8bfgQj8Gc0c69mDL7lcGmBipWl4BoFyIbkudX4GuWEcbf/QkPQNDVn/UboRmpBjLriH/IOv2qFLDOF3Hw+OuCS4xgCVGsPKfIlOJiTtGhnhNNBDib6VB9Dc/8T1OfzEUWOIfmaCsNZCN4ouuhPyWti3TSTTgkdfMBZOni10oeFCK/O0GtTyt0uduZE9gnTShAb61W5Oh5UtIas4z44BachEhInkzrbRZMrbQnmZjJwIY31Ih1eQTQNWybXBITFdtynY4tGyD04hOxUQ/n1ScOWZGGpuw52pAsYLyQsxP84sUDiABhqolrzO5B3CokO4ETLgUICCNA9Nc6jlcOVW4qXLF5SyeV585pif2BXEe4TKb1LJ8/2Cs3hU4/54mi9
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cHcxQlZsQzVwL0tkTnRXblE4Rm9HM2tONlhyOWdtRG41aG8xcGFQQU9UcXNP?=
 =?utf-8?B?MVhSdElFcGl1dVY4NkxKZ3NZVkxFbjVwTmtNUERYSjFHZ05qTVkyUFBtL2R2?=
 =?utf-8?B?T2dHMW9iL0hDNWFqVmEyczJROW9DbGROb3Z3QnQyMi9CdSt4eFdCVUFPdlU1?=
 =?utf-8?B?TDYrNmtxSTNmdWNuTGVyMUFEOVNVT2Y1S1MydUhpYit1QWx1R1VOZ2w3bVRr?=
 =?utf-8?B?NUVWbWZoZnIxWFlaRVBKaDBBbUdIVDdnMWNaM29hUFR1QmdlVnV0ekZMWTl3?=
 =?utf-8?B?VUlJUkorelpJQ2RYRExSdGhvTSs3bnNqSExjVzk5SFgvSGVvU3ZaVVFYdzVn?=
 =?utf-8?B?Mm5lYmtKd0Q2cEczNTRsczlDR3p1U2dITU1oeWx3blY3WEozamFCVS80c040?=
 =?utf-8?B?QVdBZlNKaW8ySit0aWx0ekZaaHk4Yi8rRnBvSi9lKzU2bFU2WTlWYkYzRm9I?=
 =?utf-8?B?dlBZb1dIaG1XM0crMFAyT2pveEpkcEIwM25QaEordjE1emtCZ0FZYWZQcWp5?=
 =?utf-8?B?dmxXTnF1azZ6amYyL0M3WFg0amJaK2ZPaVJZMHNFdGEzdlVuRWdqc2I3K0Rl?=
 =?utf-8?B?dmZzc0xXTUZyQzJHSkRTMitIOVd4em9vM2tFcmw0R2tLZ0JzUHo3VDFQNDNq?=
 =?utf-8?B?U2ZyTjg4UTl1VVU2anVlVGZxTWhDRUxvSUJhbU1vVFhxNXFGS0RXdXZlM2tr?=
 =?utf-8?B?ajVWQVN5YVJkTTFua3g3SVV3YkQ0RHRoRVl5L3p6RFZNemxNTkhmS2wvelll?=
 =?utf-8?B?STRCTHN4d0ZJbEx5YnQwUzdEZjhGdWZldzlzc2c1RkZuWW5xQWtVKzdRbEVa?=
 =?utf-8?B?OGdZQUxhNUdodTV0cWU3TEpWenU2OUN0TDNaMkhkb0UvTFpCaGhrbEo0ajhB?=
 =?utf-8?B?d0lVYWNuaFRnc2ZZRXZSSDFUS2p4UUxSTmVwVFRXZ1hhVDV2YzR5TXlEOU5Z?=
 =?utf-8?B?UzZNWjdlYzJtbG1PM0lrV3l2aU82S0o1MzlzeldzQktYUThQRkE2c3U0clBG?=
 =?utf-8?B?TFZkRTJZUENRQzFHVmZXeFhoVmpRVWFnT1JMZUtaQ0hLNEc5cUd1M3FVVm5m?=
 =?utf-8?B?T3hrMElUV3dMVmFUVWNtYklYU0ZYdzNRYU1Fc0NWbTVCcFpLK1FKOTRWVDBs?=
 =?utf-8?B?UFgzNllGM3hTM2lTbk1ybjUyd3FTdXM2MzQ4azZsWmpnaFFza3Z6NHJ0WFRE?=
 =?utf-8?B?N2R1ZkZxL25jTDJobGI3aHEwTUE2Njk4NkI5a0hOVDVGLzJMM2tjcWlXa1g4?=
 =?utf-8?B?VlFRNThCdjFZODlneXNjcytEYlhibUhKRnpkMm5EQmd2aU9TcHdoUUlFbE1a?=
 =?utf-8?B?ZmpIYXluZGhLM2ErbWVTM3laV0Jmbnd4NFJrcStzSGhuZkpNVTEwSHBoWkx3?=
 =?utf-8?B?OUJVSUNTUW9VWE1pMWdUTzNlZFVmM3dickhrQktMY095VU5xWkVBanNGUHVm?=
 =?utf-8?B?UnRTb2hyaGNoMW1LeGt6eXFZRzZqdGUyNTRpcENqY2EzR0pPK0lMdFFkYmFp?=
 =?utf-8?B?SUl0S3RFTkg1YTlTaCt2ZEtYSmk2dnNZdTV0MjY4bm9DQVF2NVBzMUVvaDcz?=
 =?utf-8?B?RXcwbFB0Wm1OOWJoa3VaRVh2SnlCK2FxdmRVUFZ6VVhPQWZFaVhORzQ2VU5z?=
 =?utf-8?B?V284R2FObkVJbms0V0ZPNDhhMWo1ekgxUTkrZ29oVnlvNXY3allwTWhmLzFh?=
 =?utf-8?B?TTQ1V1VlNzJFbmJrRGxKdjNqZkM3czQxMk1wS1liajF6MW10QXIwK1JkRkhX?=
 =?utf-8?Q?czdcSck9UkOB5yKrtg=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c64b2346-bd23-46fd-154d-08dc8acc16af
X-MS-Exchange-CrossTenant-AuthSource: TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2024 10:40:33.9624
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWP286MB3208
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_034042_962062_7C06DBAC 
X-CRM114-Status: GOOD (  14.90  )
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

SSBmb3Jnb3QgdG8gYWRkIGNoYW5nZSBub3RlLiBUaGlzIHZlcnNpb24gb2YgcGF0Y2ggb25seSBj
aGFuZ2VkIGZpeGVzCmluZm8gdG8gdGhlIGNvbW1pdCBDb25vciBhZHZpc2VkLgoKQmVzdCByZWdh
cmRzLApTaGVuZ3l1CgrlnKggMjAyNC82LzEyIDE4OjMzLCBTaGVuZ3l1IFF1IOWGmemBkzoKPiBD
dXJyZW50bHksIGZvciBKSDcxMTAgYm9hcmRzIHdpdGggRU1NQyBzbG90LCB2cW1tYyB2b2x0YWdl
IGZvciBFTU1DIGlzCj4gZml4ZWQgdG8gMS44Viwgd2hpbGUgdGhlIHNwZWMgbmVlZHMgaXQgdG8g
YmUgMy4zViBvbiBsb3cgc3BlZWQgbW9kZSBhbmQKPiBzaG91bGQgc3VwcG9ydCBzd2l0Y2hpbmcg
dG8gMS44ViB3aGVuIHVzaW5nIGhpZ2hlciBzcGVlZCBtb2RlLiBTaW5jZQo+IHRoZXJlIGFyZSBu
byBvdGhlciBwZXJpcGhlcmFscyB1c2luZyB0aGUgc2FtZSB2b2x0YWdlIHNvdXJjZSBvZiBFTU1D
J3MKPiB2cW1tYyhBTERPNCkgb24gZXZlcnkgYm9hcmQgY3VycmVudGx5IHN1cHBvcnRlZCBieSBt
YWlubGluZSBrZXJuZWwsCj4gcmVndWxhdG9yLW1heC1taWNyb3ZvbHQgb2YgQUxETzQgc2hvdWxk
IGJlIHNldCB0byAzLjNWLgo+IAo+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4gU2lnbmVk
LW9mZi1ieTogU2hlbmd5dSBRdSA8d2lhZ24yMzNAb3V0bG9vay5jb20+Cj4gRml4ZXM6IDdkYWZj
ZmE3OWNjOSAoInJpc2N2OiBkdHM6IHN0YXJmaXZlOiBlbmFibGUgRENEQzEmQUxETzQgbm9kZSBp
biBheHAxNTA2MCIpCj4gLS0tCj4gIGFyY2gvcmlzY3YvYm9vdC9kdHMvc3RhcmZpdmUvamg3MTEw
LWNvbW1vbi5kdHNpIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9ib290L2R0cy9zdGFyZml2
ZS9qaDcxMTAtY29tbW9uLmR0c2kgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3N0YXJmaXZlL2poNzEx
MC1jb21tb24uZHRzaQo+IGluZGV4IDM3YjRjMjk0ZmZjYy4uYzdhNTQ5ZWM3NDUyIDEwMDY0NAo+
IC0tLSBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3RhcmZpdmUvamg3MTEwLWNvbW1vbi5kdHNpCj4g
KysrIGIvYXJjaC9yaXNjdi9ib290L2R0cy9zdGFyZml2ZS9qaDcxMTAtY29tbW9uLmR0c2kKPiBA
QCAtMjQ0LDcgKzI0NCw3IEBAIGVtbWNfdmRkOiBhbGRvNCB7Cj4gIAkJCQlyZWd1bGF0b3ItYm9v
dC1vbjsKPiAgCQkJCXJlZ3VsYXRvci1hbHdheXMtb247Cj4gIAkJCQlyZWd1bGF0b3ItbWluLW1p
Y3Jvdm9sdCA9IDwxODAwMDAwPjsKPiAtCQkJCXJlZ3VsYXRvci1tYXgtbWljcm92b2x0ID0gPDE4
MDAwMDA+Owo+ICsJCQkJcmVndWxhdG9yLW1heC1taWNyb3ZvbHQgPSA8MzMwMDAwMD47Cj4gIAkJ
CQlyZWd1bGF0b3ItbmFtZSA9ICJlbW1jX3ZkZCI7Cj4gIAkJCX07Cj4gIAkJfTsKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
