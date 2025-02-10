Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E977EC0219B
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Feb 2025 01:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t52HntNKv9HCkX58+41P8mijE3DGzP0QSmE+4mpIdG4=; b=u5KlnDvby2ZildgfJu0725nz8x
	VM4xO7/I2mhl4p5fH7who2n9Fx0LaEypNErr37pFwzmVFWsvaUeaux6Hkh16Az3ODEj/v95H5BWIT
	h2BYIeL/psxpstruKpJ2mFhIFyIJBUlR504cQWkF9MpWockiiGuye4arwciD3WmiBtx9YshAkk5bp
	8Udp8l1a8ozEMniwhtNVJV6071AKo+QMDKbzxOnOBRjYCTf4DvUbfK7OVpE8WUHENNuo2hUN+bGBK
	oxpp4+7UIEcNNA6R1GiZnaoVxBVdRbrA6iWpLFiqP5Ixj6OrnftR5F8zuou5zGy1OoCXZDojEc9Tx
	/wx3jgoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thIHI-0000000Ftsp-2KyB;
	Mon, 10 Feb 2025 01:08:00 +0000
Received: from mail-centralindiaazolkn190110001.outbound.protection.outlook.com ([2a01:111:f403:d409::1] helo=PNZPR01CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thIHG-0000000FtsP-0YQh
	for linux-riscv@lists.infradead.org;
	Mon, 10 Feb 2025 01:07:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DJZ7bjpIa6AaGTFqM/NXbjQJ4uEeW2IrigWO+VFxuoTrpwuvKVPbyllZ1uoEztO2jjSoIlDKlFbzu+3ycLmNFl9GVqVpxeptr4iArT0nzKZdjHd0R21aHio+AhB0D7XIUAeage8070zF4Pa3bZxOxVpxYwluRmXc4Z7OCdGLxF/6dLUxpoXyBkGNr2KcQfUHxh9uXDDlynLeocL4s1BiwrBmX/QYEKP5VRY3cqXDo58GICnaaLP3gBwoUs4HJ7B21hpj3vFW8SEPjcVrGzKHoYyWBc5r8aevdi/Cu4a+WW3aPoyLMu78jFFzK/LTJb74zuDtPsO255s1Onxqzb5c5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WVTPEH2psno42gw4xXwLKQkjxWvOMF87txcG9fao5xA=;
 b=KB+bBQjcllBweTkG96XfdXoOokl1tcc1W11kVQ1F7eY77tvhqpmaXuB0/6IXLYHXXuiJV8nDZVs4Myja0zufuAb427PuaUFZ5NTac41by+BN5Y/v5hzftI6rHuwMv1RhXjN/8E3PoBNO8xdLAgWhSrgvulPtbMst3N3kOSLdt/k6VAGxgBuukApkxi7DELjcE/G8C2czpYoib3c4OcyQAhQG5pqdj7Gn1B1clQ6hubIftqaG2WHfWOTONELAOhsPeQtNte+C/6zcuZ/XPNIFdzDOchhsfUoHMkXJh8SHDS21YR5+cUBsklg2U/r+rGSbnNmpT8qHtkQjJAbe0c2yag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WVTPEH2psno42gw4xXwLKQkjxWvOMF87txcG9fao5xA=;
 b=QTkGdEe1u0RbYVH2OVjI1ynPcep83lJFpeZH8t3m58Aa+zIFD4F30xLpZKbf5CguFyb8Yxh8rrPO8wRR72maCFtDJk88Ufrucg72zdnMLYe29pNSBq5ntdgtOjCuJT5Ju6VdwjXZG+LzwqBs6b+7e/5PTtVX0oOZQqUMV3ENkUTDEKfV96OfrujHeFk7taZ3Ay7HH13uwD8M8DH0IlaYEJnEVgkfOt2TIwESSupx9oT+SaheNzrp18j8c0EXcSLKnH97GQWTHu/rKE5t4TLFgttUG/EdIunwkUbSSTUT1bILsmUwFCDNDs+lioUkgfFAJf2UUEhbRZsJV0A42kxV/A==
Received: from BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:3a::19)
 by PN3PR01MB6149.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:88::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Mon, 10 Feb
 2025 01:07:48 +0000
Received: from BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::2148:4778:79a3:ba71]) by BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::2148:4778:79a3:ba71%7]) with mapi id 15.20.8422.012; Mon, 10 Feb 2025
 01:07:47 +0000
Message-ID: <BMXPR01MB24405F6AD115D27D42EDB2ADFEF22@BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM>
Date: Mon, 10 Feb 2025 09:07:42 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] riscv: dts: sophgo: add reset configuration for
 Sophgo CV1800 series SoC
To: Inochi Amaoto <inochiama@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Inochi Amaoto <inochiama@outlook.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
 Jisheng Zhang <jszhang@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>,
 Longbin Li <looong.bin@gmail.com>
References: <20250209122936.2338821-1-inochiama@gmail.com>
 <20250209122936.2338821-5-inochiama@gmail.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20250209122936.2338821-5-inochiama@gmail.com>
X-ClientProxiedBy: SI2PR02CA0017.apcprd02.prod.outlook.com
 (2603:1096:4:194::17) To BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:3a::19)
X-Microsoft-Original-Message-ID: <fa6073fe-533d-4f42-b9c0-44036cc81482@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BMXPR01MB2440:EE_|PN3PR01MB6149:EE_
X-MS-Office365-Filtering-Correlation-Id: 17d4e1c1-6447-4830-9ed9-08dd496f5539
X-Microsoft-Antispam: BCL:0;ARA:14566002|5072599009|6090799003|19110799003|15080799006|461199028|8060799006|7092599003|3412199025|440099028|12071999003|21061999003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QTRUeEJLNHNOSktDYklkVEJTc0YrTHh4TWdBZm45eCtPVXcvbmsyVWZPN0Fq?=
 =?utf-8?B?QUZ5elEwU2R0SEZJT25OZXhXb2U0WFFXZVFzZHl5eGNVMXZCbk0wMDZMK2hH?=
 =?utf-8?B?TE9KdWlxNktWbEdvZ1NzMzVYYVhTQk0yaEVmdHloVFgxc0xKV05JOW9vWWhs?=
 =?utf-8?B?amc0OW1FdndnUGhYNUlUK1RmbjZ1MWNmUU1EaDJtNTB5TEJZU1kvenJ0VWti?=
 =?utf-8?B?ZTNnbDdCbTRMQUR1MnRXOE5FTitVdnJvL2JKSXlhaktXanFkYy9CSkR6RmtO?=
 =?utf-8?B?cWN1cElHTER5WHB1a2FOOU9XbVlqcFRzcXN0S1ZUb2pDR0k5dzRvT29pdVY0?=
 =?utf-8?B?U0ZDUVZPZWdaSytBNU9XTTMvb3ZkYzg5MGRFdFFuYlYxOTdnd2VFcjVVTWRO?=
 =?utf-8?B?Q21NTUJERXhYVUV5enM5K2lNZ3lXN3Z0MlBscGxsR1J0ZVZXaUJOcWtCbFly?=
 =?utf-8?B?QWhxS3N4YStHcHRtWWxjd2kza2VvVFFoUEFTdWF3dnR4b09zY09ETjNSdGN5?=
 =?utf-8?B?dFk5S2FUaitxZzI2MTJwL1pKUUNnUTN0QmlCejRVdDFwbHVkZDh1eXpacDFl?=
 =?utf-8?B?NENxSnNXc3h0ZktESEVSck9uOWNMKzcrbGpUVms1cXBvd0NSS3lTSmJTanpQ?=
 =?utf-8?B?bVJwVTM5dkNBckhMTXVyV05Va3JpOXZYeWRKdlZZWmtES0tMZ0xKbERNMi95?=
 =?utf-8?B?Y2NHNXZ2cnR2Rmozc05QS2Nrb1JRcjVKMWFtMDZROTZaS01hUmpqUk93bTBh?=
 =?utf-8?B?RVdrUi9VN3NIcXVBbzdLTnk0VU9jYitUSjh5cEE5REZxc3VLbTFkNVBaU0dp?=
 =?utf-8?B?MXNVRzlxWHhxSFltYW9rQnkxeDVsSWhZOEtQb25BcHo1VGtkUWJhWFRDeCtU?=
 =?utf-8?B?d2E5WkpEK1g1bmRPMG9BdE9KZW9jY2NwU2thbmVScm1CZ080c0YxTVN5anll?=
 =?utf-8?B?d25qUW05WHRQcVk2TFhWa28yaVRHOVpmbURjcDJaZTkxSzFtcDM0NmlXYi95?=
 =?utf-8?B?STEzS3RoampwU2ZBMEs4VCthVkVQVjlDaExzRVMxVHJtTDlWUlluZEJab2Fr?=
 =?utf-8?B?Tm5idVJmMHhRYjNsYUJMWGhoeXBlQ0YzWXlTN0VJQThOZjZKK3dVUnp1UlVK?=
 =?utf-8?B?eUZhOEJDc3FucFhSelVTb293U1VXY294S0xMWFhnQjFDZWxhWFZ3dWNteCtx?=
 =?utf-8?B?WHRqaVFFaGp3SVY3NXVqODVENFgxR1pobkFMcEYyTWNTdGxBam40dG03Zm5N?=
 =?utf-8?B?VDcvZmdSbmRhaTJtMXpuNEFaa3pQaFd2bG13U3BTTTNQSWd2TnlQS2dvelNT?=
 =?utf-8?B?VlhaN0ZXWittc09JM2NqY0RiOVNKOVI0TEZZTyttT3kzeDV2bW5DUXdVdnA3?=
 =?utf-8?B?Z2huMmNkWkgwRnlMVkFTTjBhT1UzRnNERlNtOXNmUG9SRWFmT3pPSWdTRHlU?=
 =?utf-8?B?dEhsTm5DeFNSSnVmWldjUHF4UWNESEg2MDdMVHpIbDV2NmZmcTN0ZGlvNHR6?=
 =?utf-8?B?SlkvN0o2Y0xjd0YxVjVSQXl2TG5qZkhUYmlMTFZQVTJkYTZ1bGdNWW9sNkJC?=
 =?utf-8?Q?KUE9zbP6Iw1UCnYCMnlh2KoXU=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z1dycUFYeTIyOVl4VHdFeEFpR1VUaVkrWTVXZEhIa1FNSzBQRHlYajF4a3V1?=
 =?utf-8?B?S0J5NlJKMXluL3lMVjZGQTNZTDJ4TTFaaEZ0S01LUHdEV2VheFdJMjZpcXAr?=
 =?utf-8?B?UjBydEtzWEJFZWpwcHVXQTRTcTEvZG9jdzlTNDd0YzlyRjh5ZFpkMzE3UWNW?=
 =?utf-8?B?bTQ5a3FITERmVEkvb1lTTS9neGZnYTFDRisvakNoOUxsTU5tN1VUTzVtMWM4?=
 =?utf-8?B?TWY0NDlMU1EvWUNCcnBpS01xUmZwcXJuTDFocTNONWF5ZXE0OVlqSHJLamxR?=
 =?utf-8?B?cm5IVW82aXljWndNNEhsSFp4emYxVXpyZDk5MWs5WmtQVEl3R01JRkV3a1Zn?=
 =?utf-8?B?OTVSRGVGV0hvZDFaT3pOL0RWNGdWNWxQVFBEMU9QeG9oeTcvQjRZKzlnN1Fm?=
 =?utf-8?B?WFdjQXpocStIYkUvVnA4MnBXZ05PUzBSV3dNOW1xenhONjBRRTNQQ2hVbit5?=
 =?utf-8?B?cUxtVnlESGJTTFAvcXVYV21RMGZ5ZEJhZUVVSlJkWWExQ0xTcHpQMldPdmov?=
 =?utf-8?B?cWNKZUhjNm5DMFBqMmI1TGszcDZtTnJCNjZyclU3d1piWkVvcVZtTkdOV1JR?=
 =?utf-8?B?aUltcXlYekRrQWJpV3dna2xqRjF4VlRiZ1F0aXZpTVFEM3NjQlNjRUNQQkZy?=
 =?utf-8?B?YWdLYmZjRjA1VU1DU3dmZTV6VWFKRzRncFZYUWVuVmcxVVFZT1F2L1o2UVQr?=
 =?utf-8?B?b2wrTlAxZ1htRTdiKzdsM1JIZnBrUVhhN2x1VFN5VHZTK1VHRG5xUHUrNllw?=
 =?utf-8?B?eFVZQ21ucU9Tei9QeVUvcWV4WCtpUHFJQ0hoZTdXMGZwNWgxcHMwUzEvZTZC?=
 =?utf-8?B?WUNKTXdrbUJUY2U4R2MvL0RRWWJDRzRCV1RPcmo3eFR3RTN1WENud3NveXJB?=
 =?utf-8?B?bWN1aGNmRFZZRVJaYWRCZDBiejdGOUVjOEk1ZHhRaExwOUtjd09LbytDSk14?=
 =?utf-8?B?ZmtJUUtCRjhOL09ld1lPYzZUSStLYiswdFBjMzZic3V5YzloMFpMbG5IbDdN?=
 =?utf-8?B?eXMzYXZSS0RXYnBzNGNBRkJiMkE1MjRXTTFHbmdtYnlFZGJPOTJ2cmRLNWRW?=
 =?utf-8?B?c0VaMW5XSUZPNUtJU3VFcXZlaHRlTHJSa1M3U3FreWRSTHg3Mm8rWkJCRGNB?=
 =?utf-8?B?d0JsRXFHU2M2M0dIcElTVFRwRG1lZ0g2bTZsSy9lWVAyN3JtZ0JsYm1uTGJ3?=
 =?utf-8?B?MkN0N2hEZElYOG9KNy9hUWw4S2szenJVYStpcVFUVEtOaitkNUlRcy9taDZ2?=
 =?utf-8?B?dmZMT1cxVHhwQVBXbEpLSDRRaUpTbnlFbGpQTVk4c0pwN3NCUVZQU3FvTlRT?=
 =?utf-8?B?MEVpejdIR1FxMzhZaHJnQldwRGFTY2hKRkczeWhjLzY0aUxZQSsrY1B0cGNM?=
 =?utf-8?B?QU5NR3BDdTQyUVJRcVZidklBKytpbFFFMVplUDBvM0x5MkFUbUgrYU12aUNn?=
 =?utf-8?B?RXkwTXNreW5Galhhb3piWWZLUll3U3R3eTRGNEU0WFMrajU3ek9PQ3VqN3NK?=
 =?utf-8?B?dldTTTVxQ0lVbnBJWTFaYzJUMGdobE11U0l5YkliVy9RV2VldmFCYldpbmU3?=
 =?utf-8?B?bVgyeHUyUVk2aUxWUGR6QmI0cjkrc0k5empSTUd2UnZramtwWnNmejRWWEox?=
 =?utf-8?B?Y3lkVlBlcU5OdjhLeVkwY1R2aFNwcXEvVVdKSEN5UFg5ZVhZd3dKOGQveVVY?=
 =?utf-8?B?NHhLRFhGTmVORFZqam1sSk1XSldXeDBQNnBDOWEwT3JNWHIyKzNDaTVNdjI2?=
 =?utf-8?Q?GFvLeRMcD3aJNCCZmXih4WKTPloEcgrReF2MkT2?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17d4e1c1-6447-4830-9ed9-08dd496f5539
X-MS-Exchange-CrossTenant-AuthSource: BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 01:07:47.8780
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB6149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_170758_188592_7C7F041C 
X-CRM114-Status: GOOD (  10.98  )
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

SSBmb3VuZCB0aGF0IHRoZSB0aXRsZXMgb2YgdGhlIHBhdGNoZXMgaW4gdGhpcyBwYXRjaHNldCBh
cmUgc29tZSB1c2luZyAKY3YxOHh4LCBzb21lIHVzaW5nIGN2MTgwMGIsIGFuZCBzb21lIHVzaW5n
IGN2MTgwMC4gUGxlYXNlIHVuaWZ5IHRoZW0uIApBbGwgaW7igJxjdjE4eHjigJ0/CgpPbiAyMDI1
LzIvOSAyMDoyOSwgSW5vY2hpIEFtYW90byB3cm90ZToKPiBBZGQgYWxyZWFkeSBrbm93biByZXNl
dCBjb25maWd1cmF0aW9uIGZvciBleGlzdGVkIGRldmljZS4KClBsZWFzZSBjaGFuZ2UgdGhpcyBk
ZXNjcmlwdGlvbiB0byAiQWRkIGtub3duIHJlc2V0IGNvbmZpZ3VyYXRpb25zIGZvciAKZXhpc3Rp
bmcgZGV2aWNlcy4iCgpSZWdhcmRzLAoKQ2hlbgoKPgo+IFNpZ25lZC1vZmYtYnk6IElub2NoaSBB
bWFvdG8gPGlub2NoaWFtYUBnbWFpbC5jb20+Cj4gLS0tCj4gICBhcmNoL3Jpc2N2L2Jvb3QvZHRz
L3NvcGhnby9jdjE4eHguZHRzaSB8IDE0ICsrKysrKysrKysrKysrCj4gICAxIGZpbGUgY2hhbmdl
ZCwgMTQgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvYm9vdC9kdHMv
c29waGdvL2N2MTh4eC5kdHNpIGIvYXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vY3YxOHh4LmR0
c2kKPiBpbmRleCA5YWEyOGFkZTczYTQuLjRmYWRjYjhlNDM1OSAxMDA2NDQKPiAtLS0gYS9hcmNo
L3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9jdjE4eHguZHRzaQo+ICsrKyBiL2FyY2gvcmlzY3YvYm9v
dC9kdHMvc29waGdvL2N2MTh4eC5kdHNpCj4gQEAgLTE3MCw2ICsxNzAsNyBAQCBpMmMwOiBpMmNA
NDAwMDAwMCB7Cj4gICAJCQljbG9ja3MgPSA8JmNsayBDTEtfSTJDPiwgPCZjbGsgQ0xLX0FQQl9J
MkMwPjsKPiAgIAkJCWNsb2NrLW5hbWVzID0gInJlZiIsICJwY2xrIjsKPiAgIAkJCWludGVycnVw
dHMgPSA8NDkgSVJRX1RZUEVfTEVWRUxfSElHSD47Cj4gKwkJCXJlc2V0cyA9IDwmcnN0IFJTVF9J
MkMwPjsKPiAgIAkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7Cj4gICAJCX07Cj4gICAKPiBAQCAtMTgx
LDYgKzE4Miw3IEBAIGkyYzE6IGkyY0A0MDEwMDAwIHsKPiAgIAkJCWNsb2NrcyA9IDwmY2xrIENM
S19JMkM+LCA8JmNsayBDTEtfQVBCX0kyQzE+Owo+ICAgCQkJY2xvY2stbmFtZXMgPSAicmVmIiwg
InBjbGsiOwo+ICAgCQkJaW50ZXJydXB0cyA9IDw1MCBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKPiAr
CQkJcmVzZXRzID0gPCZyc3QgUlNUX0kyQzE+Owo+ICAgCQkJc3RhdHVzID0gImRpc2FibGVkIjsK
PiAgIAkJfTsKPiAgIAo+IEBAIC0xOTIsNiArMTk0LDcgQEAgaTJjMjogaTJjQDQwMjAwMDAgewo+
ICAgCQkJY2xvY2tzID0gPCZjbGsgQ0xLX0kyQz4sIDwmY2xrIENMS19BUEJfSTJDMj47Cj4gICAJ
CQljbG9jay1uYW1lcyA9ICJyZWYiLCAicGNsayI7Cj4gICAJCQlpbnRlcnJ1cHRzID0gPDUxIElS
UV9UWVBFX0xFVkVMX0hJR0g+Owo+ICsJCQlyZXNldHMgPSA8JnJzdCBSU1RfSTJDMj47Cj4gICAJ
CQlzdGF0dXMgPSAiZGlzYWJsZWQiOwo+ICAgCQl9Owo+ICAgCj4gQEAgLTIwMyw2ICsyMDYsNyBA
QCBpMmMzOiBpMmNANDAzMDAwMCB7Cj4gICAJCQljbG9ja3MgPSA8JmNsayBDTEtfSTJDPiwgPCZj
bGsgQ0xLX0FQQl9JMkMzPjsKPiAgIAkJCWNsb2NrLW5hbWVzID0gInJlZiIsICJwY2xrIjsKPiAg
IAkJCWludGVycnVwdHMgPSA8NTIgSVJRX1RZUEVfTEVWRUxfSElHSD47Cj4gKwkJCXJlc2V0cyA9
IDwmcnN0IFJTVF9JMkMzPjsKPiAgIAkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7Cj4gICAJCX07Cj4g
ICAKPiBAQCAtMjE0LDYgKzIxOCw3IEBAIGkyYzQ6IGkyY0A0MDQwMDAwIHsKPiAgIAkJCWNsb2Nr
cyA9IDwmY2xrIENMS19JMkM+LCA8JmNsayBDTEtfQVBCX0kyQzQ+Owo+ICAgCQkJY2xvY2stbmFt
ZXMgPSAicmVmIiwgInBjbGsiOwo+ICAgCQkJaW50ZXJydXB0cyA9IDw1MyBJUlFfVFlQRV9MRVZF
TF9ISUdIPjsKPiArCQkJcmVzZXRzID0gPCZyc3QgUlNUX0kyQzQ+Owo+ICAgCQkJc3RhdHVzID0g
ImRpc2FibGVkIjsKPiAgIAkJfTsKPiAgIAo+IEBAIC0yMjUsNiArMjMwLDcgQEAgdWFydDA6IHNl
cmlhbEA0MTQwMDAwIHsKPiAgIAkJCWNsb2NrLW5hbWVzID0gImJhdWRjbGsiLCAiYXBiX3BjbGsi
Owo+ICAgCQkJcmVnLXNoaWZ0ID0gPDI+Owo+ICAgCQkJcmVnLWlvLXdpZHRoID0gPDQ+Owo+ICsJ
CQlyZXNldHMgPSA8JnJzdCBSU1RfVUFSVDA+Owo+ICAgCQkJc3RhdHVzID0gImRpc2FibGVkIjsK
PiAgIAkJfTsKPiAgIAo+IEBAIC0yMzYsNiArMjQyLDcgQEAgdWFydDE6IHNlcmlhbEA0MTUwMDAw
IHsKPiAgIAkJCWNsb2NrLW5hbWVzID0gImJhdWRjbGsiLCAiYXBiX3BjbGsiOwo+ICAgCQkJcmVn
LXNoaWZ0ID0gPDI+Owo+ICAgCQkJcmVnLWlvLXdpZHRoID0gPDQ+Owo+ICsJCQlyZXNldHMgPSA8
JnJzdCBSU1RfVUFSVDE+Owo+ICAgCQkJc3RhdHVzID0gImRpc2FibGVkIjsKPiAgIAkJfTsKPiAg
IAo+IEBAIC0yNDcsNiArMjU0LDcgQEAgdWFydDI6IHNlcmlhbEA0MTYwMDAwIHsKPiAgIAkJCWNs
b2NrLW5hbWVzID0gImJhdWRjbGsiLCAiYXBiX3BjbGsiOwo+ICAgCQkJcmVnLXNoaWZ0ID0gPDI+
Owo+ICAgCQkJcmVnLWlvLXdpZHRoID0gPDQ+Owo+ICsJCQlyZXNldHMgPSA8JnJzdCBSU1RfVUFS
VDI+Owo+ICAgCQkJc3RhdHVzID0gImRpc2FibGVkIjsKPiAgIAkJfTsKPiAgIAo+IEBAIC0yNTgs
NiArMjY2LDcgQEAgdWFydDM6IHNlcmlhbEA0MTcwMDAwIHsKPiAgIAkJCWNsb2NrLW5hbWVzID0g
ImJhdWRjbGsiLCAiYXBiX3BjbGsiOwo+ICAgCQkJcmVnLXNoaWZ0ID0gPDI+Owo+ICAgCQkJcmVn
LWlvLXdpZHRoID0gPDQ+Owo+ICsJCQlyZXNldHMgPSA8JnJzdCBSU1RfVUFSVDM+Owo+ICAgCQkJ
c3RhdHVzID0gImRpc2FibGVkIjsKPiAgIAkJfTsKPiAgIAo+IEBAIC0yNjksNiArMjc4LDcgQEAg
c3BpMDogc3BpQDQxODAwMDAgewo+ICAgCQkJY2xvY2tzID0gPCZjbGsgQ0xLX1NQST4sIDwmY2xr
IENMS19BUEJfU1BJMD47Cj4gICAJCQljbG9jay1uYW1lcyA9ICJzc2lfY2xrIiwgInBjbGsiOwo+
ICAgCQkJaW50ZXJydXB0cyA9IDw1NCBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKPiArCQkJcmVzZXRz
ID0gPCZyc3QgUlNUX1NQSTA+Owo+ICAgCQkJc3RhdHVzID0gImRpc2FibGVkIjsKPiAgIAkJfTsK
PiAgIAo+IEBAIC0yODAsNiArMjkwLDcgQEAgc3BpMTogc3BpQDQxOTAwMDAgewo+ICAgCQkJY2xv
Y2tzID0gPCZjbGsgQ0xLX1NQST4sIDwmY2xrIENMS19BUEJfU1BJMT47Cj4gICAJCQljbG9jay1u
YW1lcyA9ICJzc2lfY2xrIiwgInBjbGsiOwo+ICAgCQkJaW50ZXJydXB0cyA9IDw1NSBJUlFfVFlQ
RV9MRVZFTF9ISUdIPjsKPiArCQkJcmVzZXRzID0gPCZyc3QgUlNUX1NQSTE+Owo+ICAgCQkJc3Rh
dHVzID0gImRpc2FibGVkIjsKPiAgIAkJfTsKPiAgIAo+IEBAIC0yOTEsNiArMzAyLDcgQEAgc3Bp
Mjogc3BpQDQxYTAwMDAgewo+ICAgCQkJY2xvY2tzID0gPCZjbGsgQ0xLX1NQST4sIDwmY2xrIENM
S19BUEJfU1BJMj47Cj4gICAJCQljbG9jay1uYW1lcyA9ICJzc2lfY2xrIiwgInBjbGsiOwo+ICAg
CQkJaW50ZXJydXB0cyA9IDw1NiBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKPiArCQkJcmVzZXRzID0g
PCZyc3QgUlNUX1NQSTI+Owo+ICAgCQkJc3RhdHVzID0gImRpc2FibGVkIjsKPiAgIAkJfTsKPiAg
IAo+IEBAIC0zMDIsNiArMzE0LDcgQEAgc3BpMzogc3BpQDQxYjAwMDAgewo+ICAgCQkJY2xvY2tz
ID0gPCZjbGsgQ0xLX1NQST4sIDwmY2xrIENMS19BUEJfU1BJMz47Cj4gICAJCQljbG9jay1uYW1l
cyA9ICJzc2lfY2xrIiwgInBjbGsiOwo+ICAgCQkJaW50ZXJydXB0cyA9IDw1NyBJUlFfVFlQRV9M
RVZFTF9ISUdIPjsKPiArCQkJcmVzZXRzID0gPCZyc3QgUlNUX1NQSTM+Owo+ICAgCQkJc3RhdHVz
ID0gImRpc2FibGVkIjsKPiAgIAkJfTsKPiAgIAo+IEBAIC0zMTMsNiArMzI2LDcgQEAgdWFydDQ6
IHNlcmlhbEA0MWMwMDAwIHsKPiAgIAkJCWNsb2NrLW5hbWVzID0gImJhdWRjbGsiLCAiYXBiX3Bj
bGsiOwo+ICAgCQkJcmVnLXNoaWZ0ID0gPDI+Owo+ICAgCQkJcmVnLWlvLXdpZHRoID0gPDQ+Owo+
ICsJCQlyZXNldHMgPSA8JnJzdCBSU1RfVUFSVDQ+Owo+ICAgCQkJc3RhdHVzID0gImRpc2FibGVk
IjsKPiAgIAkJfTsKPiAgIAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
