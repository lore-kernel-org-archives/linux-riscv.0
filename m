Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93F8BC83F1A
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Jul 2025 02:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G/G6cW9sy4CDnNF5gmV68T52zu7FxvxHcURrSWRXhgo=; b=WDZJc7JF2LjmgsnyQJKmPYKRHd
	dgywruoxHvm7nywA3SiMM21AZVS3Bfyhf6pTosGVl4NVMAO96zT4zffKgaf/Kd3cF0X5zitqxFARV
	Ajs9mqKiMjD8e9zdND5JiixTnhwpJrN8GKmS/duBPjroUlI15EhSne+SJqvC9IGNLStYzKYdIhKNw
	dBGHuiCvo/B3OBr3EFBdPMF8OojmQJhLywEFtgLsBnxKpvkQ0sMnmUj6symdqoIjUfzqq/809+6Zu
	fXpcki4X3Fyo4yk07TUrnd44yXEhuNBGLjhNFkolu1YYF3NwzigJpV60ynP36jlLwdpXNAuUIkLS1
	2/Wf7UPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uePBN-00000003qVt-2tva;
	Wed, 23 Jul 2025 02:26:13 +0000
Received: from mail-southindiaazolkn190110001.outbound.protection.outlook.com ([2a01:111:f403:d408::1] helo=MA0PR01CU012.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uePBJ-00000003qVT-2WLi
	for linux-riscv@lists.infradead.org;
	Wed, 23 Jul 2025 02:26:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gmnpHhg75l49pDdJBQiDczvZwQr16a0tgTzdTu6oYQpeug30sh2KT4nrBoSKksCs7Q7magmasO3YtNKu/WMYSjVzRRfxSHyrq1dr5wkXZ6hTn1fKDTumWgUPrE6UXGd3QNCQB9bGyNjZWpvwCYq6pNLmMgsdzn5r2gGv/C6xFeQNa2LB0mBG25Ugqi4kWhpDHMUIpMnTRDXFRI0csXVa1xQk4zf6wrE0M9yC41kGmuB1XOrzXcD1JnNGIHGiLO7nc+1fUlNyTxfW8SnAPx7c5Z3aQCADHJNiLM8fcriX/pFv7vDSOC9JHR9Kj6619mO+z7LAEYs9UO6gPT8P0VdmRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gsjxxB0HaHVI9cXe09xUJrSEB7vBUXSyIHW3sWKRoI0=;
 b=OZFLBAronG9vavJArV+4DPHw5wJjE92o86Hhp551tjBGdO+w5gWkvz/Lin3EobEwu2PEJZVks8ef1aMh0TXiEdjN3+6c7rUgAoaIA7EYBZlaH3R+CpG49nBnaKtx3Hw3nsfi8iPKp15wcvZNKoh/wJgJhfW/y/UIc8ljpFEmPdsrN829/Dx9BtVQvu/wKlt5mzBJBlEI6/eNqXtpiTOzWmoH0L6y4kRseDb1f33C7o78JLR8uebMC76g90fahn61oxUP9jzfS4G5F0MOXuB6hxyd119gZS5Q9Xtx91APOJOV4J2ChWeE6ZHbNdsJZ04KqRMv9W7EYQjCNHgAOkJcSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gsjxxB0HaHVI9cXe09xUJrSEB7vBUXSyIHW3sWKRoI0=;
 b=njPQ7k/pLLjxp0CfiQR7lh1xqrZIBITI+nubq6XwJIsngVpOBCn2ziiS9X0bhL3cMVXPx8+pVP3ZjPdZSrMqf5phUKGnINa1zy/YSdTLwHWotfvn2HTwafp6kOw5MNIE6lVggkixLB5HNghmDCpxTZxON15OToW/cQxjiedLW7ds4gbrfrZlf3rkEwJE7WgNlaz9lX4uEKIPhp99X3v6tm9PiElfnNjb5umpTEmScbWe69U0bAZckBUxx8Xyltuqs8Ex+tjv48yQy/VG97a/FlMD8f5WEw+TPQfWyaVjyvsHJJyELQBXjaCIb7R1NiKqFJHUGAnJta/GVd5GLGKC4Q==
Received: from MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:16f::16) by MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:16f::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Wed, 23 Jul
 2025 02:25:59 +0000
Received: from MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5dff:3ee7:86ee:6e4b]) by MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5dff:3ee7:86ee:6e4b%4]) with mapi id 15.20.8964.019; Wed, 23 Jul 2025
 02:25:59 +0000
Message-ID: <MAUPR01MB110720B28DEDC03E9E9585833FE5FA@MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM>
Date: Wed, 23 Jul 2025 10:25:55 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] RISC-V Sophgo Devicetrees for v6.17 (v2)
To: Arnd Bergmann <arnd@arndb.de>, soc@kernel.org
Cc: Conor Dooley <conor+dt@kernel.org>, Inochi Amaoto <inochiama@gmail.com>,
 "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Han Gao <rabenda.cn@gmail.com>, Longbin Li <looong.bin@gmail.com>
References: <MAUPR01MB11072115B8D6E3F2354840F5EFE56A@MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM>
 <217fec10-55f4-4a1b-a4a5-d498c42073a2@app.fastmail.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <217fec10-55f4-4a1b-a4a5-d498c42073a2@app.fastmail.com>
X-ClientProxiedBy: SG2PR03CA0103.apcprd03.prod.outlook.com
 (2603:1096:4:7c::31) To MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:16f::16)
X-Microsoft-Original-Message-ID: <3ee90af6-85e0-44a8-ac86-e67fd40643e1@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAUPR01MB11072:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e5f7695-4321-4dee-bddd-08ddc99042e2
X-Microsoft-Antispam: BCL:0;ARA:14566002|6090799003|461199028|8060799015|19110799012|5072599009|15080799012|51005399003|440099028|40105399003|3412199025|10035399007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OC9UMHd0NFQrVXE0WDFGVkxnT1VyeXF4OHAwdGlWS25mSE1ia0lYZ0FmSFVB?=
 =?utf-8?B?MHlhUFFQbXFiMjYwQTVETmgraGZRcm1MYktvWW50cmwwaU5nS054VklSTnFR?=
 =?utf-8?B?QWxUTlhYL0VmU1NPK1VUQ0oydTlOT3MvalJOd0QxcWZJSTdPU2xrZVRYaTdH?=
 =?utf-8?B?WEo5Uk5jZ3RIVndEb01BRVlhS1dkNE5VN3hTRUx5TUp5YklhUVptbnBJblg5?=
 =?utf-8?B?WDFEZWUreGlIMnE3dGxtaThqdDA1WmdNZlFpalA1OWpvZ1luWW9sNGkrdExr?=
 =?utf-8?B?Ri85ZkdvaG9vMkY2WFU2OUNiOGJhZjhuN0EvcXJkckZ4QjBQQ2QxeCszekVX?=
 =?utf-8?B?RkM5YncrTTEweFZZdXc0U0hmcFRvNk01OHpqa1paekdxZ1ZYYWFZOE1WcHlz?=
 =?utf-8?B?NWJLV2VIbk9Bb2ZJbDNHYVFyUnNzUjUrNy9jZ2cyRVRtWHF3MStnelh4TFQ3?=
 =?utf-8?B?T1BqbmxUQUI0UEZ5WFVsSEl2eTlpRmFheHhweVBMZjltRmVVVDVvQlErdUVZ?=
 =?utf-8?B?Ukswem4xREo5SnIrMEpHdjNuRVVLVFIvSnJYczVNamttRENGQnhPVzlVMTdV?=
 =?utf-8?B?SkxGazBkY010UThrNHVjMjdoUE5MbW0wMVB6UmxKOVZuMDZBOWVUY2FnS2Fm?=
 =?utf-8?B?RjFTcXJsNEIyMWN5MWJoNU9BeVUzWC8wNFRTL3FuRVhvSHV3N1lULzZMR2hM?=
 =?utf-8?B?SDl0enBlTDFvZ0p2UFZMMGhudzdqNEFDb0JsQ1I0ZTM2OWVJWXZpZTNwbnEr?=
 =?utf-8?B?NE5tRDJXZSsycFJndXVDYlpVZjRtMGxvVkkxaHZubmVBajMzTnZWWXZ5TS9s?=
 =?utf-8?B?R1dYYUxQWVZ1aWhJSC8vYVhUbkQ3c29BSVBmT2NsTkpxRVlHZEMvMWRYaStS?=
 =?utf-8?B?cEZyaTY1alh6WDZDS3Vta1Fqb3NtTEpzNkZTZndPMDcxVjZTUFc4TXJCU1R5?=
 =?utf-8?B?dFhVVXpuSm9IL2h6QXNhVWYxUXU5NEgrM2F3OGFkL3AydjFIVHVUNllRVm9G?=
 =?utf-8?B?THAvaWJKUWZQVm5lUFNrZDBBYXdnMGthcXgwUFFXWkRQeC9tRHVobk5ZQVI1?=
 =?utf-8?B?eTQyNUQzNTRoaUNUcHY1K0YwczlFc09IQlF6c0dObFV3MGJmYW9FS1BuZXFJ?=
 =?utf-8?B?UkRnRmI2VTNGazhlVWcvM2tOMDBWS08rWEM4WE5ncjlkNHRoYnVKMHlONWYr?=
 =?utf-8?B?NUlSYVhIYjFQNUNWTkFrNUxYNjNHNk4rbml0WHlOeTZJenBOYnJBWksxN2RD?=
 =?utf-8?B?OFlUV3FoQ1NsZFNpNmxFbWFJYkRSb0Q3QVNFTHdwRHJvcEtjQUZkL3U1VTRl?=
 =?utf-8?B?K1lIRTF4Qzk4Y3N2cHNxUmpsSDYzVTVyM2h5NExrU1c0M1Z2SmtpV1daTTVJ?=
 =?utf-8?B?SmtKWU1aY0RFWU5jZFAyL1BGQ0c5NnNQVlBOQTZoWVhIMkZwdnVEQlhBbDF1?=
 =?utf-8?B?K1dtdVh4UzlTVFc3QlFzczVJcGNXVFhEclgwZW10cDBtRUNNMlpKTGxaNEpu?=
 =?utf-8?B?RlMwVFhqTEV4UWVwVUFKWUEvT2Y2TkM5dnF6bHZoR05hZDJZNTZkNlZweGRZ?=
 =?utf-8?Q?mZsq6LSaah7s+FrAZB4K8TjsLfQ/9/gLm7g8dm7k9gnlkd?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R1NQUUNCb3VwcVRvRFJVRzFHNkFPbnJpMmNZOEo2UkJDd1NSUmlXeTdEaTFS?=
 =?utf-8?B?TS8rZ21ob3dXS2IrRXA0ajFzcm1qdFV4SDRJWHZ4WkxDcE9XWmxWNGFRbGJU?=
 =?utf-8?B?blF0RmN0U2FvTFpMRWZPclB2ZC9aT1Z6MlMxUmxVK2UrMU1JWE0xazYrL3JU?=
 =?utf-8?B?M0xyY0hDT0gvcHd1Q1RvbjhhUGgzVGYxY0tRdmE3dkxFU0E2U2JVNzIyWFVi?=
 =?utf-8?B?bFJLUkYzMkltaEJJelJuS0hhS096UzlCUFdCb3FXQlJuVjNpVU03VDIrZVpm?=
 =?utf-8?B?aG1hUStsRUxqTDlYQlB4cEF5cEhnTTFJTXM4azgwRWZNd1Y1Wm95dVFqY0hO?=
 =?utf-8?B?UlJ3Zm1GU3UraG5NdGNkd1d1Z09SYW5OUjk3VWxNbnZHaW1POWIrdHR4VEY4?=
 =?utf-8?B?cjAxOWZqWlY3dU9lQlBXU3JQVkpac1p5bHRpQ1pZd2R5SGhNNmRmeS9WZDBD?=
 =?utf-8?B?aWxITkVzNTRpZUl4YUpzWTN6MjRBeFIxWG5vTEtneVRGd00yTGVpQmM4U1BJ?=
 =?utf-8?B?azVsN0FMbjJwUmFDcG85eExCWDVkVnFYdDhGSDR3b1lnYzVvWHR3cGN3bjRH?=
 =?utf-8?B?R3ZSc0pkSStkR2NqeEVNODBkbS9kQ01YNjYxbFk4Z0FsQnhhalZ0NVNQc1Zv?=
 =?utf-8?B?a1V2c3ZNVjhQdllHaEJhRDVDRythRVo2Tzl3MERKWVo2ZFdYaWRyS2pvQllI?=
 =?utf-8?B?cC9wYjB0V0o2ejhWSkY1UFFMSmJaZDh2SXRTT05qZGFSNlkyZUQ5amR2U0lx?=
 =?utf-8?B?d2lmMi9yMC8wZnNyZFRIN1ZkRE1RSUg5SGNlMVBUam5vS1c5WGVWQWF3V3Bn?=
 =?utf-8?B?eTBXQi91TFlVWEs1bmRWSUlNaFBLZ084T1VjRWYyb2NTZCtweENqNTZMSUFS?=
 =?utf-8?B?TFd6U0lWNmRkMHZhMXJyRndmanNKWTBocFJaS1hEVjl4ZHdaV2E3YlJxUU1U?=
 =?utf-8?B?NEZXWHZlR0dZK0pTb2V4dUY2dTVuVWhxWlhaTStXQjBoNTBPb3dnbnNVb1dH?=
 =?utf-8?B?MXFrSWlaM2FzVThSNzI4TDJVQ0p5KytKUzh1a0c1eTBQN1Nud3BWZ1pjOE90?=
 =?utf-8?B?MUxpcWdBYmt3UFlnOTdQWlo1N2ZvZVVpN3R4OFRLNTczTVNlRm5Md1dLN2lO?=
 =?utf-8?B?aldlNE9EbExaWGV3OU1IYXFsV3RNZFd1RERXUnBQbGJCdTFuZVFEamJrS1NB?=
 =?utf-8?B?cFVKTmI0UVVVSkdXWXF5dXZpN0xQUSt0ckxNU00wVjdJcGloMnNhOUxtc1dM?=
 =?utf-8?B?ZEFNektrYnZ3UWRwZjZHVDJZK3ZLdG00RlZ3amJraE9MZXpXTmduVm1OUEFW?=
 =?utf-8?B?S1dDZGtaM3A0QXB5UjBzYlQvTjNyVU5ac3BDN083TzNYbXNmSk1YeHp6L0x5?=
 =?utf-8?B?aWxaU2hJcm9pZ3NGcXQzeHAwS3Jod1lKRXFCcDFSQWZRYXdLT0hXY0xBNXJB?=
 =?utf-8?B?dmJ3akxzNnVqK1dkQlNORUsxNGZSWTJtVi9LYXhlNlRES1F2dUw2YUsrZEJm?=
 =?utf-8?B?VEZKTzVsbjhNRDFuR1FjWGxQMjh4V2JucnU1alBTbGp1b0dwNjlIUG4wb0VE?=
 =?utf-8?B?MmlVZkRGOEREOWljNlJ2Y0xNZzQzTm5RUWVocE5rczJmYmtwMXZtbC9JRXBw?=
 =?utf-8?B?ZkdIYVpuQjQzcUQxNUM4NzZKald5UmEyazFpeFVLNjRaMUJ1eXRFeGUyM2Nk?=
 =?utf-8?B?SDRxK1V0SWQ5N1k1N3ROWTRuU3FGdE9VcXArSFhqSGF3azg0ejJ5QUQ2Zzgz?=
 =?utf-8?Q?HYVeK0Aeh+uAPtNPorufc5o754MZUFg93yNRCfR?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e5f7695-4321-4dee-bddd-08ddc99042e2
X-MS-Exchange-CrossTenant-AuthSource: MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 02:25:59.4774
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAUPR01MB11072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_192609_654585_6F69388F 
X-CRM114-Status: GOOD (  25.56  )
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

Ck9uIDIwMjUvNy8yMyA0OjE3LCBBcm5kIEJlcmdtYW5uIHdyb3RlOgo+IE9uIFdlZCwgSnVsIDE2
LCAyMDI1LCBhdCAwMjozMSwgQ2hlbiBXYW5nIHdyb3RlOgo+PiBIZXkgQXJuZCwKPj4KPj4gUGxl
YXNlIHB1bGwgdGhpcyBkdCBjaGFuZ2VzIGZvciBSSVNDLVYvU29waGdvLiBUaGlzIFBSIGlzIHRo
ZQo+PiByZXBsYWNlbWVudCBvZiB0aGUgb2xkIG9uZSBbMV0uCj4+Cj4gSGkgQ2hlbiwKPgo+IEkg
anVzdCB0cmllZCB0byBwdWxsIHRoaXMgYnV0IHN0aWxsIHNlZSBhIGZldyBpc3N1ZXMgdGhhdCBJ
IGhvcGUKPiB5b3UgY2FuIGltcHJvdmUgZmlyc3Q6Cj4KPj4gVGhlIGZvbGxvd2luZyBjaGFuZ2Vz
IHNpbmNlIGNvbW1pdCAzNDdlOWY1MDQzYzg5Njk1YjAxZTY2YjNlZDExMTc1NWFmY2YxOTExOgo+
Pgo+PiAgIMKgIExpbnV4IDYuMTYtcmM2ICgyMDI1LTA3LTEzIDE0OjI1OjU4IC0wNzAwKQo+Pgo+
PiBhcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKPj4KPj4gICDCoCBodHRw
czovL2dpdGh1Yi5jb20vc29waGdvL2xpbnV4LmdpdCB0YWdzL3Jpc2N2LXNvcGhnby1kdC1mb3It
djYuMTcKPiBZb3UgaGF2ZSBiYXNlZCB0aGUgYnJhbmNoIG9uIGxpbnV4LTYuMTYtcmM2LCBidXQg
bXkgb3duIGJyYW5jaCBpcwo+IGJhc2VkIG9uIC1yYzMsIHNvIHB1bGxpbmcgdGhpcyBpbnRyb2R1
Y2VzIGEgYmFja21lcmdlIG9mIGh1bmRyZWRzCj4gb2YgdXBzdHJlYW0gY29tbWl0cywgd2hpY2gg
SSB3b3VsZCBsaWtlIHRvIGF2b2lkLgo+Cj4gUGxlYXNlIHJlYmFzZSBvbiB0b3Agb2YgLXJjMSBp
ZiBwb3NzaWJsZS4KPgo+PiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4+IFJJU0MtViBEZXZpY2V0cmVlcyBmb3IgdjYuMTcK
Pj4KPj4gU29waGdvOgo+Pgo+PiBGb3IgQ1YxOHh4IHNlcmlhbHM6Cj4+IC0gQWRkIHJ0Y3N5cyBk
ZXZpY2Ugbm9kZS4KPj4gLSBBZGQgcmVzZXQgZGV2aWNlIG5vZGUuCj4+IC0gQWRkIGV0aGVybmV0
IGRldmljZSBub2RlLgo+PiAtIEFkZCBzdXBwb3J0IGZvciBEdW8gTW9kdWxlIDAxIEV2YWx1YXRp
b24gQm9hcmQuCj4+ICAgwqAgVGhpcyBib2FyZCB1c2VzIFNHMjAwMChvbGQgY29kZW5hbWUgQ1Yx
ODF4SCksCj4+ICAgwqAgd2hpY2ggaXMgZHVhbC1hcmNoLCBSSVNDLVYgYW5kIEFSTTY0LiBUaGlz
Cj4+ICAgwqAgcGF0Y2ggYWRkIHRoZSBzdXBwb3J0IGZvciBBUk02NC4KPj4gLSBFbmFibGUgZXRo
ZXJuZXQgZGV2aWNlIGZvciBIdWFzaGFuIFBpLgo+PiAtIFJlbW92ZSB3YXJuaW5nIGZvciBtZGlv
IG5vZGUuCj4gRm9yIHRoZSBjb21taXQgbG9nLCBJIGRvbid0IGxpa2UgbGlzdHMgdGhhdCBzaW1w
bHkgcmVwZWF0Cj4gdGhlIG9uZS1saW5lIG1lc3NhZ2VzIGZyb20gdGhlIHNob3J0bG9nLiBZb3Ug
Y2FuIGxlYXZlIHRoaXMKPiBwYXJ0IGZvciBub3cgaWYgaXQgdGFrZXMgdG9vIGxvbmcgdG8gcmV3
cml0ZSwgYnV0IG5leHQgdGltZQo+IHRyeSB0byB3cml0ZSBmdWxsIHNlbnRlbmNlcyBkZXNjcmli
aW5nIHRoZSBjb250ZW50cyBvdmVyYWxsCj4gYXMgeW91IGRpZCB3aXRoIHRoZSBEdW8gTW9kdWxl
LCBidXQgZG9uJ3QgbGlzdCBlYWNoCj4gYWRkZWQgZGV2aWNlIG5vZGUgc2VwYXJhdGVseS4KPgo+
PiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCj4+IEFsZXhhbmRlciBTdmVyZGxpbiAoNyk6Cj4+ICAgwqDCoMKgwqDCoCByaXNj
djogZHRzOiBzb3BoZ286IGN2MTh4eDogQWRkIFJUQ1NZUyBkZXZpY2Ugbm9kZQo+PiAgIMKgwqDC
oMKgwqAgZHQtYmluZGluZ3M6IHNvYzogc29waGdvOiBNb3ZlIFNvQ3MvYm9hcmRzIGZyb20gcmlz
Y3YgaW50byBzb2MsCj4+IGFkZCBTRzIwMDAKPj4gICDCoMKgwqDCoMKgIGFybTY0OiBkdHM6IHNv
cGhnbzogQWRkIGluaXRpYWwgU0cyMDAwIFNvQyBkZXZpY2UgdHJlZQo+PiAgIMKgwqDCoMKgwqAg
YXJtNjQ6IGR0czogc29waGdvOiBBZGQgRHVvIE1vZHVsZSAwMQo+PiAgIMKgwqDCoMKgwqAgYXJt
NjQ6IGR0czogc29waGdvOiBBZGQgRHVvIE1vZHVsZSAwMSBFdmFsdWF0aW9uIEJvYXJkCj4+ICAg
wqDCoMKgwqDCoCBhcm02NDogQWRkIFNPUEhHTyBTT0MgZmFtaWx5IEtjb25maWcgc3VwcG9ydAo+
PiAgIMKgwqDCoMKgwqAgYXJtNjQ6IGRlZmNvbmZpZzogRW5hYmxlIHJ1ZGltZW50YXJ5IFNvcGhn
byBTRzIwMDAgc3VwcG9ydAo+IEl0J3Mgb2sgdG8gbWl4IHJpc2N2IGFuZCBhcm02NCBjb21taXRz
IGluIG9uZSBicmFuY2gsIGJ1dCB0aGUgU0cyMDAwCj4gc2VyaWVzIGZyb20gQWxleGFuZGVyIHNo
b3VsZCByZWFsbHkgYmUgYSBzZXBhcmF0ZSBicmFuY2guIFRoZSB3YXkKPiBJIG9yZ2FuaXplIHRo
ZSBzb2MgdHJlZSwgSSBoYXZlIG9uZSBicmFuY2ggZm9yIGR0cyAoYW5kIGJpbmRpbmcpCj4gY2hh
bmdlcyBvbiBleGlzdGluZyBTb0NzLCBidXQgc2VwYXJhdGUgYnJhbmNoZXMgZm9yIGRlZmNvbmZp
ZyBjaGFuZ2VzLAo+IGRyaXZlcnMve3NvYyxmaXJtd2FyZSxyZXNldCwuLi59IGV0Yy4KPgo+IFNp
bmNlIHRoZSBhcm02NCBjb250ZW50cyB0b3VjaCBib3RoIEtjb25maWcgYW5kIGRlZmNvbmZpZyBm
aWxlcywKPiBJIHdvdWxkIGxpa2UgdG8gc2VlIHRoZW0gaW4gb25lIGJyYW5jaCB0aGF0IGNvbWJp
bmVzIHRoZSBzZzIwMDAKPiBkdHMvZGVmY29uZmlnL0tjb25maWcgY2hhbmdlcyBhbmQgdGhlaXIg
cHJlcmVxdWlzaXRlcywgc28gSQo+IGNhbiBhZGQgdGhhdCB0byBteSBzcGVjaWFsICJuZXdzb2Mi
IGJyYW5jaCB0aGF0IGNvbnRhaW5zIHNpbWlsYXIKPiBjb21taXRzIGZvciB0aGUgbmV3bHkgYWRk
ZWQgcHhhMTkwOCwgY2l4LXAxIGFuZCBhbmRlcy1xaWxhaSBTb0NzLgo+Cj4gICAgICAgIEFybmQK
CkhpLCBBcm5kLAoKQWNjb3JkaW5nIHRvIHlvdXIgcmVxdWVzdCwgSSBoYXZlIHJlYnVpbHQgdHdv
IGJyYW5jaGVzIGZvciBQUiAodGVtcG9yYXJ5KToKaHR0cHM6Ly9naXRodWIuY29tL3NvcGhnby9s
aW51eC90cmVlL3RlbXAtcmlzY3Ytc29waGdvLWR0LWZvci1uZXh0Cmh0dHBzOi8vZ2l0aHViLmNv
bS9zb3BoZ28vbGludXgvdHJlZS90ZW1wLWFybS1zb3BoZ28tZHQtZm9yLW5leHQKClBsZWFzZSBj
aGVjayB3aGV0aGVyIGl0IG1lZXRzIHlvdXIgcmVxdWlyZW1lbnRzLiBCb3RoIGJyYW5jaGVzIGFy
ZSBiYXNlZCAKb24gdjYuMTYtcmMxLiBJZiB0aGVyZSBpcyBubyBwcm9ibGVtLCBJIHdpbGwgc3Vi
bWl0IFBScyB1c2luZyB0aGVzZSB0d28gCmJyYW5jaGVzIHJlc3BlY3RpdmVseS4KCkl0IHNob3Vs
ZCBiZSBub3RlZCB0aGF0IGFib3V0IHRoZSBjb21taXQgIjYxMGY5NDNhNjZiZSBkdC1iaW5kaW5n
czogc29jOiAKc29waGdvOiBNb3ZlIFNvQ3MvYm9hcmRzIGZyb20gcmlzY3YgaW50byBzb2MsIGFk
ZCBTRzIwMDAiIG9uIAp0ZW1wLXJpc2N2LXNvcGhnby1kdC1mb3ItbmV4dC4gVGhpcyBjaGFuZ2Ug
d2FzIG9yaWdpbmFsbHkgbWFkZSBmb3IgClNHMjAwMC9BUk0sIG1vdmluZyBzb3BoZ28ueWFtbCBm
cm9tIHRoZSByaXNjdiBkaXJlY3RvcnkgdG8gc29jL3NvcGhnbyAKZm9yIHNoYXJpbmcgYmV0d2Vl
biByaXNjdiBhbmQgYXJtLiBCZWNhdXNlIHRoaXMgZmlsZSB3aWxsIGFsc28gYmUgCmludm9sdmVk
IGluIHN1YnNlcXVlbnQgY2hhbmdlcyBmb3IgcmlzY3YsIEkgcGxhY2VkIGl0IGluIAp0ZW1wLXJp
c2N2LXNvcGhnby1kdC1mb3ItbmV4dC4KClJlZ2FyZHMsCgpDaGVuCgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
