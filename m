Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0912EC19776
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Feb 2025 07:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xgIDQNfBL/rAsfQKsoihjP+8HQhK91yD6AVUi8zOaI0=; b=GedkvKNOirta2efxfbw8O6UMXj
	TPJsVD6+8aoiMZPz/eBVCJPl9agh/T67xwokk1ha94FMX1sYKfvXxh+QXINu4O8gK9ECsLCLbtOPR
	xKqymJ6GyqneWBC/5YckKD4XTuPHuEqLANpM4WLBNDLX0OIf8NVxh6K41pYaQEqgZXTCLCi1ymVZx
	ufOhzRD5W/CU/Ewmo5iPw6AnaMvA3B/LMblSU+igbA/n7DHnJQVf9I1I8AEKyMnfcF7/N5SkFBfWZ
	P6cpN2ZAQwSlJrdo50iNUb+wrexCAclqW5AJEKLsPiwGCr6cgqL6BcBxLmoI5FkDhBq9UQy0ooJ8N
	bT/GkE0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnusF-0000000A0Wt-2Cl4;
	Fri, 28 Feb 2025 07:33:31 +0000
Received: from mail-centralindiaazolkn190100000.outbound.protection.outlook.com ([2a01:111:f403:d409::] helo=PNYPR01CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnurp-0000000A0RO-0xPz
	for linux-riscv@lists.infradead.org;
	Fri, 28 Feb 2025 07:33:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JFGlyBFllGIfO3ym91lo8y1cJfmHvp8UhxM2Ac+W/pBUT5fa3eg36HWJ7cfMCWqRUgoZIXrxbDIPWtw0cD6PlYpnEZECu19Z0Tk91up6vl8si+WH7Hd5FkxlWtB6B9HYfOR+LAC6KkGE7UjTDFbAejmP5/Csw2oVnXEDa+FeL0way20RXkHM2xu4gSseGRMt5d08J1+iwvaeVMrG2v3j1Z81C9VoGRxiv+uwNF5uTGLWf4PZCtpbLNLZrpNzlShhjgodHa8NTB5I3qTcTAky6C0uRLC15GQNNFihZOtmSXg6QnUViEGDQx8YGnTy/ihi3TIH2yvYScm5YBEv/Yapsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uB99H3iWLaBE9lg3YvwK7oaB6E3CfEEEQ5+UTkWmrYk=;
 b=WvUvyDXV7TszeHWDE7VR3nS7y5x9PvO7X6lTGFD9wGil414OU+OwEgOJuBoKJiHTQKAZm7b2ZsmCBgC8RVb6d7sZ4vjglM5R8SVhw9Qfdc2YJZFceMT9cCHmp6j8Bz36FnUfVx6r0z+rWh5OPiJDll0u0Wgvu5U8EWhCmN3P9py0Cc3Gz6MsynvYkhhJG4+u1QVxA40zZk/OOCrrkkYllWrwFzVgMy7pCJHunUerISlONaZ8uU1ZrQtvrIoebFv0zziXOOX7b6+evTkim79UL0M9gBvvXG7hdSfRAWU4ZnZMlXr1qhzoYelduU//E5jYXm+Su5d+5UbvxS2ClJbfuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uB99H3iWLaBE9lg3YvwK7oaB6E3CfEEEQ5+UTkWmrYk=;
 b=apzUy/XyDsogaC9I42FcHAQNV1PI0TyjOkhEY3IXHrFAbQEK/p0JC5KoaiMg3H/zNps4p8DLdbS4U5062FHeJ3NCFGXxmVpAMX6NPmeh1Qyv9UezlzCIFCoRVFClQOQfH7KL9d1WxsNZ+pVCvV6Bm7thu/bMjKrQKdTz4BD3KCqwRHH/yLb1OZZZPNSAeMTyCiQNSpkO0ppDBhFPzGrfJGptifxugj5Dtd14FSNKBY0rrz8QKhS9PENfLe7/oZsjTwgY1swNpSPBNEDOnya410yBd7Nx+3OhYb4y2ZBMFCVbh9IVXGLWDIGI1wv0/qHxu/vD077bVlw8r9dOMUSUOA==
Received: from PN0PR01MB9166.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:165::9)
 by MA0PR01MB8698.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:b6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.22; Fri, 28 Feb
 2025 07:32:43 +0000
Received: from PN0PR01MB9166.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::42b2:a8b0:90c6:201e]) by PN0PR01MB9166.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::42b2:a8b0:90c6:201e%5]) with mapi id 15.20.8489.021; Fri, 28 Feb 2025
 07:32:43 +0000
Message-ID: <PN0PR01MB91667A6458D213413AB64E91FECC2@PN0PR01MB9166.INDPRD01.PROD.OUTLOOK.COM>
Date: Fri, 28 Feb 2025 15:32:38 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: dts: sophgo: sg2042: Add spi devices
To: Yixun Lan <dlan@gentoo.org>, Zixian Zeng <sycamoremoon376@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Inochi Amaoto <inochiama@outlook.com>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, sophgo@lists.linux.dev
References: <20250228-sfg-spi-v1-1-b989aed94911@gmail.com>
 <20250228035507-GYA52348@gentoo>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20250228035507-GYA52348@gentoo>
X-ClientProxiedBy: SG2PR02CA0129.apcprd02.prod.outlook.com
 (2603:1096:4:188::19) To PN0PR01MB9166.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:165::9)
X-Microsoft-Original-Message-ID: <2b47b0e7-190f-4307-b662-02c94d9235e6@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0PR01MB9166:EE_|MA0PR01MB8698:EE_
X-MS-Office365-Filtering-Correlation-Id: 558f637c-ffe7-4e08-e6f4-08dd57ca1679
X-Microsoft-Antispam: BCL:0;ARA:14566002|19110799003|5072599009|8060799006|461199028|15080799006|7092599003|6090799003|1602099012|3412199025|4302099013|10035399004|440099028|41001999003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cERUTWhaRlg3M0d2YmRMNGdBYnR5YjVISkNLWlhiNXp0ekZtZy9Vd0hteHVx?=
 =?utf-8?B?NUFiR1Q4TTJOQURBc0ZLVTZYTGw4ZWNxNmZsaWNEd0c1WW5Ka1VnTFJJRmlt?=
 =?utf-8?B?MG02Q0gyM3hYOGFkenpPdmJvMTdUdTY4aXVrUm05d0RMbktISUlkR0Z2eVlD?=
 =?utf-8?B?VnprbzlaNGJqZnZ4VFloaFR0RGdoa3JHcnhhd3R2Njk1RGIveU5kSGpSMDZL?=
 =?utf-8?B?dTZlWkZLVm4wN05RU1VOOURyUlJHaG0rMEVxK0FtTGhhNGtXNHFpQnA0L1Fl?=
 =?utf-8?B?bFNSemF4Mjd1YkswZGVBaGFuWUJJS0ZVYW5GZUIwWHgzR2VNQTBQUWNOZEFn?=
 =?utf-8?B?NExpNTZ1Tk8xQ0gzd3BqbGp1M2J5c0xMMW1LZXJTWHdZd3ZtTlJrNy9FMmE2?=
 =?utf-8?B?MWd0RUEzQWR1OTQrMW11UldGekhYU01FTjZqNTQ0UFBac2d3RDhTRHZ0RGlN?=
 =?utf-8?B?RFNQeERLTlpub0U5Qmw3TW4xYW5Uc2RWWUVtMzFndTRrWS8zdFNwZUlHQVNB?=
 =?utf-8?B?cGx2KzJwM20xcTVVQ0h6Y0hRRXNFcUpzVWRBZlBHUGRYKzF0Nlk1VXVwNGpX?=
 =?utf-8?B?bnZ4MUJHU3c1aGhHcVg0QXJ3RUNXOGhDUTZxNFdDNVdnVmRYaG1iSXpUN25Q?=
 =?utf-8?B?aDQ5aEY0ZllIblpwcjlIdGF6SEs0NTdONm9kWWsxZUllNTJnZnMwK2NKMTFp?=
 =?utf-8?B?U2YwWktjQTVlRjdxbCtnNGpHRGVZRWtUWG52VTZYQ1M1TVJpa0I2RjBuNzZK?=
 =?utf-8?B?eVlJMTFQOUlpMUhBcCs1WGRTZ0trdnJWU3prMXdrZ1hUeHkwVEdaQ0lINmJP?=
 =?utf-8?B?ZUNvQXJEWWdkRmVMSmFGSncxaGFNRHJ5S1pnbUhmaDErYThWU1hIVGlPSkxD?=
 =?utf-8?B?Sm90Y3NCTG5tYlhFMk80OUozK1JVVkxybnVscnBvdUdaTlZwZGZvWXJTaDAy?=
 =?utf-8?B?Y1B2VVdVQ1RNSytWam9DeUI4Rm5DREhkTHlwWUxCeWppWlE4K3ZGZ1BBODZi?=
 =?utf-8?B?Sll4TkJHUW9ZMmVHUnA0NmhZL1BUNUJqVk83cjB6bkw1aVhjdHQrK3hlRmFF?=
 =?utf-8?B?eVk0ZkFUSHo4dktkWWU5UzcxV3pta0k5Z1E3VUhEMUVmTUtxZHJHZEJidEhz?=
 =?utf-8?B?dHZURFAxOGhudlV5cUMrS0l5dW5oRW5BSWNBM1JJNUFDalRPcGpINURHTXpw?=
 =?utf-8?B?c0M5MGZ4YVNLUFN3dTlieER4TzJnVnJmQjVHdGQ2QTVkY28yUzhWTkU4RW9W?=
 =?utf-8?B?QitENHo2clFWYWdjODZ6ODYwTlM5dlJkWXM0OTJEUG10V3VRWU9QTUNkMHA1?=
 =?utf-8?B?VGNIWS9XNjdSSGlIQkdMRHlPU3R5M1djei9waHU3c1RRdGZ4c0s2YVNaMXhm?=
 =?utf-8?B?U09IWG5QbmF2TC8zUEYxdGY5TzF3OCtwOVJ5Ym9RdHRYSzNtTms4Yzc1YkRE?=
 =?utf-8?B?ZUNkT1lnWW5kK3NSaGJTNXhwVmRWbGt3UC96S0RsR2NyMzZValJwV1I5bWkr?=
 =?utf-8?B?YmxvanJvK2VOMWxuSkRzQWhRNDc5T3hCbk1MeVF0aytFVHJ3VHRNTzV4UHdE?=
 =?utf-8?B?YmVwcWV4dW80NG1mSFNoU21MaVFIQmUwaktjR0luQktqdnVuZ0tCNS9teWFt?=
 =?utf-8?Q?EDvCfqFixlzrS9Cxx63egTB6kszaCWu0Qe2hJRDFeNPk=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q3hsZm52TXg0RGwrNkVzU0xyd1JwdWJvbXVyOFZ5L21pcm1XUTJSVjBpdHZo?=
 =?utf-8?B?bUg1NVpQSG8wQ0JEZXpXRmlxd2owWGRDNnRQdkFFcGh5MjQ4ekwxOHpJWWEr?=
 =?utf-8?B?b0c0Ty9WN2c5QlQyVVM5OTVVYVBzVWdjZW5aWkpZZkFCbHJqZmRUVlFFR09V?=
 =?utf-8?B?VnBOeVV4VTh2MytWYmJFU2JRSE14cTIxaWVUeU12eFFSRnI5dXpMZWJqRGNT?=
 =?utf-8?B?UmVmaElTNEFjdmlSbUpET0VOQ0I5REo5c2dJeDJwK0FvdzNlZnF1UTJIRGZO?=
 =?utf-8?B?bnV2enBvbkR3cEgzL2hYK0k2UE9KbU1NQjFuUUVDc0ljZXVyNXdjNFJ5TnNv?=
 =?utf-8?B?bHRkVE9DYW0wK2E0SzAzOE9xNnZLZGUrNlFBUUcvaEZHbEVaZmRaczlmVjJr?=
 =?utf-8?B?YW4wck9PN3JWbU1JZm5FU2dCL01hZTNXd1hKNTBhRVo0WFA0QlhvUkswNnJi?=
 =?utf-8?B?dFU5c0N1Wm9ocm02VUpJdE5abURldXlmQk9OS3BTMU5taTdpRjNNcmNic05o?=
 =?utf-8?B?aGtnb0ZtRnU4S2Y4TnFLOTI3aEQ5SUNTMFhodExEMjA5TEpodmFodUg4R1ph?=
 =?utf-8?B?TzZ4c0hCdHNNZVRaNGZiWE5rbmhJRnVzRkFqRFdwcnhwa05tSEFYYi9EZnMz?=
 =?utf-8?B?YjRhcnN6MGc0NEdsc0MwZlZaNVh4L3JFQWthK1Bxa1ZPWHFYTm1IMFhaTVRZ?=
 =?utf-8?B?VDl5dnIrckk2TURWb1RFWWZqeis3citmQnptZTRNVUx6K2hJalY5ODJpSWtF?=
 =?utf-8?B?bThjNDlRcUVTNTNCQmdoUTJJWkJEY2FMcm1TY29UMy8yZ0NtaE9lOTYzZTRS?=
 =?utf-8?B?dUl2elkrSnk1SHUrNmFKcjd3WTRmTVp3dVZ3bFR0YlIzeSt4bURXS2loV2Vx?=
 =?utf-8?B?Mk5DRFNKaDJGTEQ1VVE4eHpwREVYcXJHMzBiWC9OVDIrMXI0bnBSRWJncUNR?=
 =?utf-8?B?ZnhBNWc4cjgxUU52dVhvMzhXUnFEWForQjROOTF1RnpDS0Y4TCtsTjAvNzMx?=
 =?utf-8?B?bm4xeFRWK25SR0dhcVY2b3VFRkk5KzNBbmxESjVLOXJ1L3c1ams2d1I0cVZw?=
 =?utf-8?B?aUFhcmNxWnkxb0IxTGgxRERldlo2ZW9pdWc2TEJCdUtkWFE0WXhnT1E0Wmht?=
 =?utf-8?B?czRUSllaQmQ4OVJzRUZsb0thTVlNS25lUVZhbVdOVzM2Y1pKTGpqdFJIbXgx?=
 =?utf-8?B?R01GdEF2ckVFRTloMEtNVHBFSmRVM0JxUUV6elZESlVQQUs2ZTZsUTdvaUhU?=
 =?utf-8?B?NTF3Skg0N2RndmV3OHVKcXdGa1JjUlBsYWJPVVAzbGc1eUdtVFFKanpEeWNu?=
 =?utf-8?B?ZDIvdGF4Rm8vYWpEVGF4WmZobnlvNUs0TTV2SC9VbWF6SlJMa0x3NFlFNm5W?=
 =?utf-8?B?Q3E1aDMyUEkzSThHakFMZks2S242MmVjT29TUHpKVnZmQVk0SUx6eisyZWF3?=
 =?utf-8?B?TlUwMFJxZVhCNHFQbFZ2TklKaGFvQmNxUTJzcmhJMlZpdENxbFdzUGExaktq?=
 =?utf-8?B?YmV1WngzTnVhdHhxNlV2V0llMmpwZUN0ZXJHTGtQbkJXbEZQV1R2SWE1bXVo?=
 =?utf-8?B?MGsvL01IWElrUFhiMjIvcTF0cUpPMHo2MU0rT2pJQzFJbVFZOUg1b0tTb2RO?=
 =?utf-8?B?YlNYQjMySm9Jbm9PN0E3c0tvQzNlQ3Q1eTNJRDZqZjZIRnRPRi8wMjJZN243?=
 =?utf-8?B?cm1MSmpxenJ1RUcwdzhCbFNvdlJTT0JzclFhRkZ0U0hqVjE4VlZnSkY5Q2R0?=
 =?utf-8?Q?Zd7Rm55pUATux+1CkdtoI7d0iR5Mp3IJ/iuTn0v?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 558f637c-ffe7-4e08-e6f4-08dd57ca1679
X-MS-Exchange-CrossTenant-AuthSource: PN0PR01MB9166.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2025 07:32:43.1714
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB8698
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_233305_279405_CD258490 
X-CRM114-Status: GOOD (  13.64  )
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

QXNpZGUgY29tbWVudHMgZnJvbSBZaXh1YW4sIGFwcGVuZGluZyBtb3JlIC4uLgoKQ2hhbmdlIHRp
dGxlIHRvOiAiW1BBVENIXcKgcmlzY3Y6IHNvcGhnbzogZHRzOiBBZGQgc3BpIGNvbnRyb2xsZXIg
Zm9yIFNHMjA0MiIKClRoZSBwcmVmaXggc2VxdWVuY2UgaXMgcmVxdWlyZWQgZnJvbSBteSBwcmV2
aW91cyByZXZpZXcgZXhwZXJpZW5jZSwgYW5kIAp3ZSBhcmUgYWRkaW5nIGNvbnRyb2xsZXIgbm9k
ZS4KCk9uIDIwMjUvMi8yOCAxMTo1NSwgWWl4dW4gTGFuIHdyb3RlOgo+IEhpIFppeGlhbjoKPgo+
IE9uIDEwOjQ3IEZyaSAyOCBGZWIgICAgICwgWml4aWFuIFplbmcgd3JvdGU6Cj4+IEFkZCBzcGkg
ZGV2aWNlcyBmb3IgdGhlIHNnMjA0MiBzb2MuCkNoYW5nZSB0bzoKCmBgYApBZGQgc3BpIGNvbnRy
b2xsZXJzIGZvciBTRzIwNDIuCgoKU0cyMDQyIHVzZXMgdGhlIHVwc3RyZWFtZWQgU3lub3BzeXMg
RFcgU1BJIElQLgoKYGBgCgpUaGlzIHdheSwgZXZlcnlvbmUgY2FuIGJldHRlciB1bmRlcnN0YW5k
IHdoeSAic25wcyxkdy1hcGItc3NpIiBpcyB1c2VkIAppbiB0aGUgY29kZS4KPj4KPj4gU2lnbmVk
LW9mZi1ieTogWml4aWFuIFplbmcgPHN5Y2Ftb3JlbW9vbjM3NkBnbWFpbC5jb20+Cj4+IC0tLQo+
PiAgIGFyY2gvcmlzY3YvYm9vdC9kdHMvc29waGdvL3NnMjA0Mi5kdHNpIHwgMzAgKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDMwIGluc2VydGlvbnMo
KykKPj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvc29waGdvL3NnMjA0Mi5k
dHNpIGIvYXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vc2cyMDQyLmR0c2kKPj4gaW5kZXggMGZj
YTE2YzQ2OWNjOTVhYTg5N2I2YjU3ZTBhMjg3YTY4N2I0ZDI1MS4uZDQxM2RhYTQ3Y2YwODFmMjMy
ODQ4NTFkYjFlZWNlYjNhMTU3ZTljMCAxMDA2NDQKPj4gLS0tIGEvYXJjaC9yaXNjdi9ib290L2R0
cy9zb3BoZ28vc2cyMDQyLmR0c2kKPj4gKysrIGIvYXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28v
c2cyMDQyLmR0c2kKPj4gQEAgLTgwMCw1ICs4MDAsMzUgQEAgZmxhc2hAMCB7Cj4+ICAgCQkJCWNv
bXBhdGlibGUgPSAiamVkZWMsc3BpLW5vciI7Cj4+ICAgCQkJfTsKPj4gICAJCX07Cj4+ICsKPj4g
KwkJc3BpMDogc3BpQDcwNDAwMDQwMDAgewpPcmRlciB0aGUgbm9kZXMgcGxlYXNlLCBzZWUgCmh0
dHBzOi8vZG9jcy5rZXJuZWwub3JnL2RldmljZXRyZWUvYmluZGluZ3MvZHRzLWNvZGluZy1zdHls
ZS5odG1sI29yZGVyLW9mLW5vZGVzLgo+PiArCQkJY29tcGF0aWJsZSA9ICJzbnBzLGR3LWFwYi1z
c2kiOwo+PiArCQkJI2FkZHJlc3MtY2VsbHMgPSA8MHgwMT47Cj4+ICsJCQkjc2l6ZS1jZWxscyA9
IDwweDAwPjsKPj4gKwkJCXJlZyA9IDwweDcwIDB4NDAwMDQwMDAgMHgwMCAweDEwMDA+Owo+IGZv
ciBjb25zaXN0ZW5jeSwgSSdkIHN1Z2dlc3QgbW92aW5nICdyZWcnIGluZm8gYWJvdmUgJyNhZGRy
ZXNzLWNlbGxzJwo+Cj4+ICsJCQlpbnRlcnJ1cHQtcGFyZW50ID0gPCZpbnRjPjsKPj4gKwkJCWlu
dGVycnVwdHMgPSA8MTEwIElSUV9UWVBFX0xFVkVMX0hJR0g+Owo+PiArCQkJY2xvY2tzID0gPCZj
bGtnZW4gR0FURV9DTEtfQVBCX1NQST4sCj4+ICsJCQkJCTwmY2xrZ2VuIEdBVEVfQ0xLX1NZU0RN
QV9BWEk+Owo+PiArCQkJY2xvY2stZnJlcXVlbmN5ID0gPDI1MDAwMDAwMD47CgpIYXZlIHlvdSBy
dW4gZHRiIGNoZWNrIGF0IHlvdXIgc2lkZSBiZWZvcmUgc2VuZGluZyBvdXQgdGhlIHBhdGNoPyBJ
IHJhbiAKYW5kIGdvdCBmb2xsb3dpbmcgZXJyb3JzOgoKYGBgCgovaG9tZS91L3dzL2Rldi1saW51
eC9vdXQtbGludXgvYXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vc2cyMDQyLW1pbGt2LXBpb25l
ZXIuZHRiOiAKc3BpQDcwNDAwMDQwMDA6IFVuZXZhbHVhdGVkIHByb3BlcnRpZXMgYXJlIG5vdCBh
bGxvd2VkIAooJ2Nsb2NrLWZyZXF1ZW5jeScgd2FzIHVuZXhwZWN0ZWQpCiDCoMKgwqAgZnJvbSBz
Y2hlbWEgJGlkOiAKaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvc3BpL3NucHMsZHctYXBi
LXNzaS55YW1sIwovaG9tZS91L3dzL2Rldi1saW51eC9vdXQtbGludXgvYXJjaC9yaXNjdi9ib290
L2R0cy9zb3BoZ28vc2cyMDQyLW1pbGt2LXBpb25lZXIuZHRiOiAKc3BpQDcwNDAwMDUwMDA6IFVu
ZXZhbHVhdGVkIHByb3BlcnRpZXMgYXJlIG5vdCBhbGxvd2VkIAooJ2Nsb2NrLWZyZXF1ZW5jeScg
d2FzIHVuZXhwZWN0ZWQpCiDCoMKgwqAgZnJvbSBzY2hlbWEgJGlkOiAKaHR0cDovL2RldmljZXRy
ZWUub3JnL3NjaGVtYXMvc3BpL3NucHMsZHctYXBiLXNzaS55YW1sIwoKYGBgCgpZb3UgY2FuIHJ1
biBgbWFrZSBDSEVDS19EVEJTPXkgVz0xIHNvcGhnby9zZzIwNDItbWlsa3YtcGlvbmVlci5kdGJg
LgoKCj4gZGl0dG8sIG1vdmUgY2xvY2sgYWJvdmUgaW50ZXJydXB0Cj4KPj4gKwkJCXJlc2V0cyA9
IDwmcnN0Z2VuIFJTVF9TUEkwPjsKPj4gKwkJCW51bS1jcyA9IDwweDAyPjsKPj4gKwkJCXN0YXR1
cyA9ICJva2F5IjsKPiBpbiBkdHNpIGZpbGUsIHBsZWFzZSBtYWtlIHN0YXR1cyBkaXNhYmxlZCBi
eSBkZWZhdWx0LCB0aGVuIGVuYWJsZSBpdCBhdCBib2FyZCBmaWxlCj4KPj4gKwkJfTsKPj4gKwo+
PiArCQlzcGkxOiBzcGlANzA0MDAwNTAwMCB7Cj4+ICsJCQljb21wYXRpYmxlID0gInNucHMsZHct
YXBiLXNzaSI7Cj4+ICsJCQkjYWRkcmVzcy1jZWxscyA9IDwweDAxPjsKPj4gKwkJCSNzaXplLWNl
bGxzID0gPDB4MDA+Owo+PiArCQkJcmVnID0gPDB4NzAgMHg0MDAwNTAwMCAweDAwIDB4MTAwMD47
Cj4+ICsJCQlpbnRlcnJ1cHQtcGFyZW50ID0gPCZpbnRjPjsKPj4gKwkJCWludGVycnVwdHMgPSA8
MTExIElSUV9UWVBFX0xFVkVMX0hJR0g+Owo+PiArCQkJY2xvY2tzID0gPCZjbGtnZW4gR0FURV9D
TEtfQVBCX1NQST4sCj4+ICsJCQkJCTwmY2xrZ2VuIEdBVEVfQ0xLX1NZU0RNQV9BWEk+Owo+PiAr
CQkJY2xvY2stZnJlcXVlbmN5ID0gPDI1MDAwMDAwMD47Cj4+ICsJCQlyZXNldHMgPSA8JnJzdGdl
biBSU1RfU1BJMT47Cj4+ICsJCQludW0tY3MgPSA8MHgwMj47Cj4+ICsJCQlzdGF0dXMgPSAib2th
eSI7Cj4+ICsJCX07Cj4+ICAgCX07Cj4+ICAgfTsKPj4KPj4gLS0tCj4+IGJhc2UtY29tbWl0OiA5
ZWY1ZDMyMzVkNDFhNmY1MjMwZDNkZGY1ZWI5OTQ0ODM4NTNiM2U4CldoYXQncyB0aGlzIGJhc2U/
IEkgY2FuIG5vdCBzZWUgaXQgaW4gbGFzdGVzdCBtYXN0ZXIuIE1ha2Ugc3VyZSB5b3VyIApwYXRj
aCBpcyBiYXNlZCBvbiB0aGUgbGFzdGVzdCBtYXN0ZXIgb3IgYXQgbGVhc3QgYW4gb2ZmaWNpYWwg
UkMgdGFnIHN1Y2ggCmFzIHY2LjE0LXJjWC4KPj4gY2hhbmdlLWlkOiAyMDI1MDIyOC1zZmctc3Bp
LWUzZjJhZWNhMDlhYgo+Pgo+PiBCZXN0IHJlZ2FyZHMsCj4+IC0tIAo+PiBaaXhpYW4gWmVuZyA8
c3ljYW1vcmVtb29uMzc2QGdtYWlsLmNvbT4KPj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
