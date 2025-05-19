Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F328C3ABD8
	for <linux-riscv@archiver.kernel.org>; Mon, 19 May 2025 00:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:From:Cc:To:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Go14IvOpZ3qWeT2ZTcvQf7iuaqD486sGz094Z5BLQYc=; b=08vwHJzluEa3byfwJwQabsO/8E
	9ZSTsJjbMkXu5f28DJXkyqR47eA3RdEO9mZAEuH64nAyuqr1EGNUyykKgSczXKyhk2X5uKIn22Ebr
	OaBXbyQT2XrSNP6cE/IYgGMYB9kmCgYvMfua2whmVz8TAyJsRPz2EJ3L6UafUbfpO+CeTEMHw5/GQ
	N49UjOlPgeo2axD12A+G2+dJaq5x2VdSFya5+xAaNTVCna2FUVA23mYVBT3sOFj7OnTKkWXeVdj+B
	wl4xN125oGWCJy9XmFiWA8l39355Xs1Sr+4wrmncHvqog6QFS62gMYy/AIEdRJtY8gtXCoczv3Gla
	gDo3Zx/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGomj-00000007kXo-3BGy;
	Mon, 19 May 2025 00:55:17 +0000
Received: from mail-southindiaazolkn190100000.outbound.protection.outlook.com ([2a01:111:f403:d408::] helo=MA0PR01CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGomd-00000007kX9-08l6
	for linux-riscv@lists.infradead.org;
	Mon, 19 May 2025 00:55:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vc54DV4kqO0dX0toeDKYtEikDcNd+/QByU/U9Wm+cld01RP88NCS9xor7CPvH6r+b/WmjSp5XfTdqllh6t6KGkTSnvmpufZghZYo8eDLPVhWRB9BvA/CEjjuLK5pNR6nixEvxQuXOm9sbhBQWG9jtSAQvbeGj89RVtClZKwI0OIJ78FXTxTgf5x3p2y+C+mdFM6JtJD+mCkSuKOPGYGIx4RbFC5HEdr0sDh2L2qEzBHsBGaMnOnQgbDRpafOqEaqzU4beXSCHSjsctJTnYL6k3eY6iwS4H3/LS4upzb5IV5dYW/Q3BhTMiHovFKkQ64EjKbaZaAZSCWptpx9XWxCrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eAV/zqeDPhxSCTmiYmc/DSEoVU5AfflZ3eVl1wSmBFs=;
 b=GRPzObxY9MNWEWqRr4kLwaIw0Hp2rFf2aFCgv3VaOKg39c7HTuVCe8DKyWWM4r6QHWqZ0Wxr89c90FwpkKMzsZ/YGG7TYgMHarYjddQNBRa+JjXLIfxiwCjm2nPriWlzIbwCN8IbLaaeabTWIOL2O5J36pDciYvXVfdc+cbK8gsfMDxpwssZV0aK0PMzlUUB8D/gpr3L1h7GObnwC9G4F0rKGiZmLKq6upSuqkwlSIJcPCs65a+8GbkHeKQfVYFGeLaeK3jPPCDdFShQA2S9tpI08WzlNhsh6LZN0BT7b4gA7kWLbdJ9Ywzyu90iVtRzagffQZgyw+KjOXhHZaTZhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eAV/zqeDPhxSCTmiYmc/DSEoVU5AfflZ3eVl1wSmBFs=;
 b=d4GcZeLRAhDv3fZYJyZCFKUAhtSgnvze7+wYpvSg7PY7Owp8fkSFXjDIXhcFFPHeWznLuUEA+HESNv5O6WZqEqtgOhCVOojMc/PaSEagnH2VnGV8FHLKYMQM0mDBEuRGYM9c0JLMOoyBX6JK1m7aIENOG8oNW3+D1+65xxRe1KvRe2WgoiTYderG42WE9bq4l4PpjETZ7L7K4U7pjGgneUX8ZZmSzzvrPUexnYNUG4sKdCbf42OKj1IFZjwxDO/3qyxeHHyxGZoRmReLPrvAt4/OwjP9pROT5NkIvr3czM5eT4cWVHBsNF6lvulxUhTQe3j2zYoaVGDRxZQUZ8JGXQ==
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:100::6)
 by PN3P287MB1400.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:193::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Mon, 19 May
 2025 00:54:54 +0000
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4]) by MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4%5]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 00:54:54 +0000
Message-ID: <MA0P287MB22622FA23ECF9B9216735FA0FE9CA@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Date: Mon, 19 May 2025 08:54:42 +0800
User-Agent: Mozilla Thunderbird
To: soc@kernel.org, Arnd Bergmann <arnd@arndb.de>
Cc: Conor Dooley <conor+dt@kernel.org>, Inochi Amaoto <inochiama@gmail.com>,
 sophgo@lists.linux.dev, linux-riscv <linux-riscv@lists.infradead.org>
From: Chen Wang <unicorn_wang@outlook.com>
Subject: [GIT PULL] RISC-V Sophgo Devicetrees for v6.16
X-ClientProxiedBy: TYAPR01CA0025.jpnprd01.prod.outlook.com
 (2603:1096:404:28::13) To MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:100::6)
X-Microsoft-Original-Message-ID: <eb8ac423-7314-4e30-9486-7b0870fe803d@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2262:EE_|PN3P287MB1400:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ef9ccab-c55c-4f34-18bc-08dd966fc302
X-Microsoft-Antispam: BCL:0;ARA:14566002|15080799009|19110799006|8022599003|7092599006|8060799009|5062599005|5072599009|6090799003|461199028|440099028|4302099013|3412199025|34005399003|10035399007|1602099012;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bm5PU21GUG5QdnlzUzF3eHhyektBSmMzU1drV1N0MVZPTCtGSDFhY2Y2Mkx4?=
 =?utf-8?B?SHdrbEdmaUtYT3V1NHpYazVESjYyQlhwY2lyc3dLd2RWTEdxMjdGa3dyN2FP?=
 =?utf-8?B?SHIrdzhEcDBOT3dEaldTSWxrSE5keFBUNmdDY0ZJL3R0NWh0aCs0b2FsdE1a?=
 =?utf-8?B?TUFGUXgrRmlza1RHQ1g1SW5mWFlHYWZRbzhEQ1lYYTFBQlpmQ3djU3F5MCtX?=
 =?utf-8?B?Rkt2aWt1dEVPdXFSN1FlWm5Hb1U4UVZpRkhPZUlDQytlbEdsODlqbEJsT0po?=
 =?utf-8?B?cGpZSVlVekhEQTEwYmdLUWx0QUVXRnpRbTFIOEtNNGxrV0hrYm9QODlrZWZn?=
 =?utf-8?B?TFc3TnpuOVlUT2dPZlRqQnRGZjFURXRMbUhidjVjbjc3ZXBLQUt0ZkRwMGlD?=
 =?utf-8?B?NGs4aHRjTjRLNnZEQ0U4Znk0dUg4WGJheGgxYm1vUUIrYmVFY0lJR1Bja3gy?=
 =?utf-8?B?TGFCeTk2RjlNTWlUaEJZZnlHUjUzc005WmpQM2dwZGJ5MmprMkdSUFRNMkJs?=
 =?utf-8?B?d1hxaVBVR3kwc05xOEY5RzIxVFZSYm1va3Fkbk0rZnliK1RTVEt6TkhyMlVG?=
 =?utf-8?B?UGx5YVJDUmJBbHBVbUtmc3Q1aTFhV05HUCsxUWt5SmcxSUZDa1BpbTlXSHMz?=
 =?utf-8?B?N3ZVZDRPNUtCK2dTakRidERGb1VQeDZnM3VJMUVBZmRqcTR6UFNDZXJEQlkv?=
 =?utf-8?B?R1B2bDR2cFFVWFgrZjM3VVNLREZzekEzOEg5TlZqN1ZFWEdRY01uWUJYRGhH?=
 =?utf-8?B?OUZEREo2bS9rVHNHQkN4elZSZmVDMUFOODhWaUFwOGZEWW9MNmJ4U3BzZTVa?=
 =?utf-8?B?eDQrVmF6UTk0WVlTZ3FIYTBmQUljcFJSQ1FXMmptbnh0d00xVXp1ZnRmZjNo?=
 =?utf-8?B?blp2V1NacVhGc2hENERMSnQxNTZ4b0ovT0lISjJhZmYxSzFQbUVoUXV1YzY5?=
 =?utf-8?B?aWcwclJqQzdiWkt3aWNmanRmcXA2dmhyM3BWdlFsMjlSRHA5b0FLSmM3N3hB?=
 =?utf-8?B?ZGRkZ3RhMEdGb3l5ZkpJd29WK2wveE5rTHhGNk83T2VKWEl5RzVuanlZeEY0?=
 =?utf-8?B?M0ZKYzY5Ny9ZM2lxZFByOU1hVUtNTnlVMmlROHBVaktGaEk1WkMrYjhGampE?=
 =?utf-8?B?Z3NrN0ZwRyt0d3VteHY2anBkbjlEcm1EYkRpWUxGTHd2MGdoaUUxY21jY05p?=
 =?utf-8?B?Q3dNVnVxY0tnWDZYR1lJSlpmVnVSMGErTmZnSWxBRWdkdXpJcmlqcDVLdTJm?=
 =?utf-8?B?Q2QydnNSMzdOakVWd0JOV2JmaVFlSVpmeVNpNklxRmNZR1JHWSs1S3JoK2My?=
 =?utf-8?B?VDZDMzBCUThuSFpRdis2RWZIbDVHNElSYVBRR3ZpRkRuRUdXMWk0WUgxN3lw?=
 =?utf-8?B?cEhpRWZRdDR6c09yUEl4T3l0NVpTNFFKcFZueWtleWUxZGNIdGVKRHN1WE9a?=
 =?utf-8?B?alNpRk0reEtKM3BBUWM2blZ6bFdhdnVmVkNYOXE4NnYzUUh2ZUpFWThudEV6?=
 =?utf-8?B?N2htbEVnMFRTaHRsbHZDSldYV0hpTEZkYU9vNUhOeUxldTJHNURjMnFOR2ND?=
 =?utf-8?B?RVhxWHdLczVlVXNPSFNQTEYwNG5obDBTSWhlemlvRkFVakc2RVFXd0ovWmZs?=
 =?utf-8?B?d1poc1NQS3VUaW95dWNDZjB5cnppTjFWS0dFTjRnQ252ZFVKcFRXc3VUeTh1?=
 =?utf-8?B?dVdBbXhhUGlUMGNVVCtOaEh0K2poTXJJbThLbUxGeG9YeExJZkZ3Q0svWU4w?=
 =?utf-8?B?VzZWcmlJWk5GWlVTT1MxVUZ1TjROSU1hZ25oRy80OWEzVXRaeE4xNmtSbTNo?=
 =?utf-8?Q?Gf17l9zxMxWmsFSsy/YRX2oTzoTOXoA+uxGKI=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUt2YUJ0cXBONTJMb05wYk1VVW5SWlN3bjZTbm8zVlloQ09uVTBIeU9jZkp0?=
 =?utf-8?B?Nnlrd0ZBbkhwSi9DT0dxZ2FDTWxvakYzSjMxTTN5NGlLZTZINWpMRi9pNWR5?=
 =?utf-8?B?NEw3RW10bFFFOEp5ZlBKZUx6Sm0vZE5RU0FaNExxYVpGWHVJK2VDbTlBVmRz?=
 =?utf-8?B?cTI3WEJjRDRnMGEwVlpvcDZWYmtEcVdvYTRSaEpMSXlsYllKSGg0U2xvbTlH?=
 =?utf-8?B?SjFqNXhZcTJEWGFzOGNVdHI0K2lEOWIrRUpNNC9aYmZicm1vTHVZK1p0cVBG?=
 =?utf-8?B?dWZUQXR2L3NsRHQxUUpLaXhJcHlxMGx6L3RFQU53Rk1kY2pweFFrY1d1dktz?=
 =?utf-8?B?MCs2TWRKbHdRdmZ1UVp4dEQzVUhEaXdneENqcjhxaXN5RDJpNnVxbkpURHJ6?=
 =?utf-8?B?U0poQzVubWZ6dldOQUtRSzVlZVBmaUJZMnk1SG91c01IWHc3RU51d3ZRa0tF?=
 =?utf-8?B?amprZmpxK3dFeDJyK0dOanlRYkg4aHBYdmRIN3ErWkttMWZ3b2p3aDUwUGNE?=
 =?utf-8?B?V0hkQW1PUFpIMnhJTU5ITjVYRklId05FeHFReTRRVkc2d0QvckVGRzhEOUYw?=
 =?utf-8?B?SitTZzhBZVlMMXVWZy9rWCt2d1NQbHZseDUvb3hLN1ZVVXEwY0JyS3VDQ0tM?=
 =?utf-8?B?enpxZVhXcUtmMVh4dlpsTU1pdUR5MGVLRG5Wa1dzMkZYK0dYMFJORXR6bi8y?=
 =?utf-8?B?V0JrUSsvclFxZnkrUkpZQlZmR0NlMDVIVzJZMGYzRXlsVW1JT1R6emtRR0gz?=
 =?utf-8?B?empCYkwwV0c3V25Fcjl3U2VGaS9rRzZkOXM3Y3lPNjQrVDRiL3dZR3p0WHJ2?=
 =?utf-8?B?alAvMlFEUnh6VWpKZEpLYmNMV0pQN1o0QkpSQTh5NVlSZTBDOVFnQVNtaVYy?=
 =?utf-8?B?VlBVSzFBc2ZWUTdHcHA3azZUckNJVlhkQ3RMNlBKRWkxbld0TjJsMjUwRjVR?=
 =?utf-8?B?NkhqSGQzb3diZSthdGppY3R6Tkl2MTN5U0dPcldEemlheTFxbFFoZjJ0Mmh4?=
 =?utf-8?B?dm43OHdLVkYyTGNmQk1KMmY5NHBSV085NEE1OTZYN1NNVkoyQUdzcHJUZVpX?=
 =?utf-8?B?dHFDNnZKSDJkcGRPNEprUzhDOUJ1UTlLWHU4NXU1a2VvMHA3N0hWbXRuenRr?=
 =?utf-8?B?a05EK3BiWE5xUnRBcGVuMDNPejQ3Y2lxdHN2Z1lQZURQRjYxajFkbmVRNWJh?=
 =?utf-8?B?Z3N4NTRqdUhDNncxOGEvNDB4QTQ0ZUYzODNCWXZCdElVSFBRLzk0WVlLR1BY?=
 =?utf-8?B?d0RVM1hsRlNTZjZudWVvc2FHWEZrbXN5YjV5Qnl0QXBzUW1aYXdZODJkemJB?=
 =?utf-8?B?dEkreU9VUmJKWTcwcWtsaExsMExhYVdndkhRVFlTYlZ3TlQ0cjlDcS9TaFZw?=
 =?utf-8?B?WE1zY0pYR0twa0h5OEtYOFBjRFNRSWxmQzIwOTh2V0dwS1NXaVV4NGN3M0ls?=
 =?utf-8?B?eGNOK0RhOFNpSFdPTTNDd0IzWkNVUTNYTTdaZVM4NnZQMlYxMnVnQjNRMDNO?=
 =?utf-8?B?UWVkdW1kcSs4ZzhsenVXM29ReVg2ZE5pTENPRFh1eDhPZjVuNW5qSVRxdWdx?=
 =?utf-8?B?d1dRbHkwVGtUcjExdXBJZm9CbkY0cDREbUFzVUp4aUJJY1RNV1lYVHdVelNH?=
 =?utf-8?B?WC8xeEZxYUlqMEhkcm5QSURpamZpWm01TlFRRlBCd1Ayb1NqN01KUk02SGx5?=
 =?utf-8?B?QXlwZ0ZrT0JzZ3BOTzNrQ1dpRndBSTltMzRyZHBMZHJ5VkpOMmU1cHo4dVFk?=
 =?utf-8?Q?0ozU9mogKJbPfLEaVv0OwBCeUVgKyp49fn2lu2z?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ef9ccab-c55c-4f34-18bc-08dd966fc302
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 00:54:53.5572
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB1400
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250518_175511_113365_DB0DFF9D 
X-CRM114-Status: UNSURE (   9.59  )
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

SGV5IEFybmQsCgpQbGVhc2UgcHVsbCBkdCBjaGFuZ2VzIGZvciBSSVNDLVYvU29waGdvLsKgIEhv
cGUgdGhpcyBQUiBpcyBub3QgdG9vIGxhdGUgCmZvciB5b3UuCgpJbiBhZGRpdGlvbiwgSSBhbHNv
IHNlbnQgYSBQUiBmb3Igc29waGdvL3NvYyBsYXN0IHdlZWssIGxpc3RlZCBoZXJlIGZvciAKeW91
ciBxdWljayByZWZlcmVuY2U6CgpodHRwczovL2xvcmUua2VybmVsLm9yZy9zb2MvTUEwUDI4N01C
MjI2MkIwNDFBMjZBMEY1RUFEMUUyOTZDRkU5MUFATUEwUDI4N01CMjI2Mi5JTkRQMjg3LlBST0Qu
T1VUTE9PSy5DT00vCgoKVGhhbmtzLAoKQ2hlbgoKVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNl
IGNvbW1pdCBhNTgwNmNkNTA2YWY1YTdjMTliY2Q1OTZlNDcwOGI1YzQ2NGJmZDIxOgoKIMKgIExp
bnV4IDYuMTUtcmM3ICgyMDI1LTA1LTE4IDEzOjU3OjI5IC0wNzAwKQoKYXJlIGF2YWlsYWJsZSBp
biB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6CgogwqAgaHR0cHM6Ly9naXRodWIuY29tL3NvcGhnby9s
aW51eC5naXQgdGFncy9yaXNjdi1zb3BoZ28tZHQtZm9yLXY2LjE2Cgpmb3IgeW91IHRvIGZldGNo
IGNoYW5nZXMgdXAgdG8gMTA4YTc2Nzc5ODI5YTVlODAwMWIxMDUxMDgwYWFhOTNlN2ZjMDJlYToK
CiDCoCByaXNjdjogZHRzOiBzb3BoZ286IHN3aXRjaCBwcmVjaXNlIGNvbXBhdGlibGUgZm9yIGV4
aXN0ZWQgY2xvY2sgCmRldmljZSBmb3IgQ1YxOFhYICgyMDI1LTA1LTE5IDA2OjIzOjI2ICswODAw
KQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQpSSVNDLVYgRGV2aWNldHJlZXMgZm9yIHY2LjE2CgpTb3BoZ286CkFkZCBQaW5j
dHJsICYgU1BJIHN1cHBvcnQgZm9yIFNHMjA0MiBTb0MsIGFuZApyZWZhY3RvciB0aGUgZHRzIG9m
IGN2MTh4eCB0byBmYWNpbGl0YXRlIGFkZGluZwpzdXBwb3J0IGZvciBhcm0gY29yZSBsYXRlciAo
U0cyMDBYIGhhcyB0d28gY29yZXMsCm9uZSBpcyBSSVNDLVYgYW5kIGFub3RoZXIgaXMgQVJNNjQp
LgpBbHNvIGFkZCBpbml0aWFsIHN1cHBvcnQgZm9yIFNvcGhnbyBTRzIwNDQvU1JEMy0xMC4KU1JE
My0xMCBib2FyZCBiYXNlcyBvbiBTb3BoZ28gU0cyMDQ0IFNvQyBhbmQKaW5pdGlhbCBzdXBwb3J0
IGluY2x1ZGVzIHVhcnQgb25seS4gVGhpcyBwYXJ0IG9mCnRoZSBjaGFuZ2VzIGludm9sdmVzIHNv
bWUgbW9kaWZpY2F0aW9ucyB0byBkdHMKYW5kIGJpbmRpbmdzLgoKU2lnbmVkLW9mZi1ieTogQ2hl
biBXYW5nIDx1bmljb3JuX3dhbmdAb3V0bG9vay5jb20+CgotLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCklub2NoaSBBbWFvdG8g
KDEwKToKIMKgwqDCoMKgwqAgcmlzY3Y6IGR0czogc29waGdvOiBzZzIwNDI6IGFkZCBwaW5jdHJs
IHN1cHBvcnQKIMKgwqDCoMKgwqAgcmlzY3Y6IGR0czogc29waGdvOiBNb3ZlIGFsbCBzb2Mgc3Bl
Y2lmaWMgZGV2aWNlIGludG8gc29jIGR0c2kgZmlsZQogwqDCoMKgwqDCoCByaXNjdjogZHRzOiBz
b3BoZ286IE1vdmUgcmlzY3YgY3B1IGRlZmluaXRpb24gdG8gYSBzZXBhcmF0ZSBmaWxlCiDCoMKg
wqDCoMKgIHJpc2N2OiBkdHM6IHNvcGhnbzogcmVuYW1lIGhlYWRlciBmaWxlIGN2MTh4eC5kdHNp
IHRvIGN2MTgweC5kdHNpCiDCoMKgwqDCoMKgIHJpc2N2OiBkdHM6IHNvcGdobzogdXNlIFNPQ19Q
RVJJUEhFUkFMX0lSUSB0byBjYWxjdWxhdGUgaW50ZXJydXB0IApudW1iZXIKIMKgwqDCoMKgwqAg
ZHQtYmluZGluZ3M6IGludGVycnVwdC1jb250cm9sbGVyOiBBZGQgU29waGdvIFNHMjA0NCBDTElO
VCBtc3dpCiDCoMKgwqDCoMKgIGR0LWJpbmRpbmdzOiBpbnRlcnJ1cHQtY29udHJvbGxlcjogQWRk
IFNvcGhnbyBTRzIwNDQgUExJQwogwqDCoMKgwqDCoCBkdC1iaW5kaW5nczogcmlzY3Y6IHNvcGhn
bzogQWRkIFNHMjA0NCBjb21wYXRpYmxlIHN0cmluZwogwqDCoMKgwqDCoCByaXNjdjogZHRzOiBz
b3BoZ286IEFkZCBpbml0aWFsIGRldmljZSB0cmVlIG9mIFNvcGhnbyBTUkQzLTEwCiDCoMKgwqDC
oMKgIHJpc2N2OiBkdHM6IHNvcGhnbzogc3dpdGNoIHByZWNpc2UgY29tcGF0aWJsZSBmb3IgZXhp
c3RlZCBjbG9jayAKZGV2aWNlIGZvciBDVjE4WFgKClppeGlhbiBaZW5nICgxKToKIMKgwqDCoMKg
wqAgcmlzY3Y6IHNvcGhnbzogZHRzOiBBZGQgc3BpIGNvbnRyb2xsZXIgZm9yIFNHMjA0MgoKIMKg
Li4uL2ludGVycnVwdC1jb250cm9sbGVyL3NpZml2ZSxwbGljLTEuMC4wLnlhbWzCoMKgwqAgfMKg
wqDCoCAxICsKIMKgLi4uL3RoZWFkLGM5MDAtYWNsaW50LW1zd2kueWFtbMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgwqAgMSArCiDCoC4uLi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3Jpc2N2L3NvcGhnby55YW1swqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgwqAgNCArCiDC
oGFyY2gvcmlzY3YvYm9vdC9kdHMvc29waGdvL01ha2VmaWxlwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHzCoMKgwqAgMSArCiDCoGFyY2gvcmlzY3YvYm9vdC9kdHMvc29waGdvL2N2MTgw
MGIuZHRzacKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgMzkgKy0KIMKgYXJjaC9yaXNjdi9i
b290L2R0cy9zb3BoZ28vY3YxODB4LWNwdXMuZHRzacKgwqDCoMKgwqDCoMKgIHzCoMKgIDM2ICsK
IMKgLi4uL2Jvb3QvZHRzL3NvcGhnby97Y3YxOHh4LmR0c2kgPT4gY3YxODB4LmR0c2l9wqDCoCB8
wqDCoCA5NSArLQogwqBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9jdjE4MTJoLmR0c2nCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDM5ICstCiDCoGFyY2gvcmlzY3YvYm9vdC9kdHMvc29w
aGdvL2N2MTgxeC5kdHNpwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgwqAgMiArLQogwqBh
cmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9zZzIwMDIuZHRzacKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB8wqDCoCAzOSArLQogwqAuLi4vcmlzY3YvYm9vdC9kdHMvc29waGdvL3NnMjA0Mi1taWxr
di1waW9uZWVyLmR0cyB8wqDCoCA3MiArCiDCoGFyY2gvcmlzY3YvYm9vdC9kdHMvc29waGdvL3Nn
MjA0Mi5kdHNpwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDMyICsKIMKgYXJjaC9yaXNj
di9ib290L2R0cy9zb3BoZ28vc2cyMDQ0LWNwdXMuZHRzacKgwqDCoMKgwqDCoMKgIHwgMzAwMiAK
KysrKysrKysrKysrKysrKysrKysKIMKgYXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vc2cyMDQ0
LXJlc2V0LmjCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDEyOCArCiDCoC4uLi9ib290L2R0cy9zb3Bo
Z28vc2cyMDQ0LXNvcGhnby1zcmQzLTEwLmR0c8KgwqDCoMKgwqAgfMKgwqAgMzIgKwogwqBhcmNo
L3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9zZzIwNDQuZHRzacKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB8wqDCoCA4NiArCiDCoDE2IGZpbGVzIGNoYW5nZWQsIDM1MDIgaW5zZXJ0aW9ucygrKSwgMTA3
IGRlbGV0aW9ucygtKQogwqBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9ib290L2R0cy9z
b3BoZ28vY3YxODB4LWNwdXMuZHRzaQogwqByZW5hbWUgYXJjaC9yaXNjdi9ib290L2R0cy9zb3Bo
Z28ve2N2MTh4eC5kdHNpID0+IGN2MTgweC5kdHNpfSAoNzUlKQogwqBjcmVhdGUgbW9kZSAxMDA2
NDQgYXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vc2cyMDQ0LWNwdXMuZHRzaQogwqBjcmVhdGUg
bW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vc2cyMDQ0LXJlc2V0LmgKIMKg
Y3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3YvYm9vdC9kdHMvc29waGdvL3NnMjA0NC1zb3Bo
Z28tc3JkMy0xMC5kdHMKIMKgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3YvYm9vdC9kdHMv
c29waGdvL3NnMjA0NC5kdHNpCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
