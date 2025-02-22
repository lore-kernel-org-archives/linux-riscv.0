Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37865C021B2
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Feb 2025 13:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UDJavXPwdmX3RYOYIMxJRV9w8Lk2hzmou1pssJI+CrY=; b=s/UPBEarBzuBUIrokeZJ+v4QK4
	XnhUhiDu614YVDYtnxpWDFNSPdyzKsuj6kxJV2KYdtVlFlwsLXyzZ3XvYaL3ric91LKVGwQ2A4ZoI
	GhGjh99xNxNKe/Mn/+rRXlDtyx/XjkNay9RSiKleVpoE+jzw13R9tGtLTh3J3pSwLFN4kEDiYW2Rc
	ZXhBo/uvXHosrcZzXDwdsrpq1HognKsHTlVn+WwfS1ERl3hO9SXLrKZvGkpLsjKBPs3tTEOSwSRIy
	AgQCCmNwVG5IS+WVVyoNJKTmlxWXtgXNyyZI3vxMKS3la3Nam2GoJE/VQDt0N8AxCDEaHOSbe2wNw
	UI+7ek7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlppe-000000086fE-3Wfo;
	Sat, 22 Feb 2025 13:46:14 +0000
Received: from mail-dbaeur03olkn20823.outbound.protection.outlook.com ([2a01:111:f403:2e0d::823] helo=EUR03-DBA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlplJ-000000086Ic-0BDM
	for linux-riscv@lists.infradead.org;
	Sat, 22 Feb 2025 13:41:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xBtq4eyxthx3GoGOHi5/ZPL8yIztJnr56KBwKELlcRXuVdc5R5qjV738XvwnIc3seZNAbRuntJlb7y66BOvbp4j/oKgso0O0weLYt8mlnsjgBhl+o+EuP+WTF0uiF2YvxTOg4KEA93rEHFh0/YENC/14LedmqgVhR8ea11TY5NoOKPQf0eDHAgGNxX4zVzQu5FNQ9lqhwyMw8jA8GwugjiKRpQNqYTNM8H5ZHipoAZMIE9leMyHctlDY5GgH7cS9C6d/bWYRllXss2lKgGrdTCKE7kNmoFQx8RfTkZx5Ia9MKUKeKloKd0zczF+rlx/ffmno7Pkrw++xksSJK+byUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jgd/wtUZFvAHysLGOijed2FkaBkk1R9UpWPoPw8blO0=;
 b=Ft/Q5o1qDhd4FRbwapDm5aILxDLLYg26LpkEUPzX9xaBaySAMHOnWXdfU68wEaU7laSv3HMbg/TGwrBKa2LClwuLx/ysUkmiiT3oc4MXFVwSeHSYRrJwJ5/IjQhGKyaWyGnpYk9lZovbe59z3b3/FEOoXJPBvLz23L1UOL8pwvWdl1kNMjUa2ZXtxVa6ok1Nhb3ww8NDUHs41UMA4tML/Tah1STMMG1v6LfkqMGV6LXEYtR8isTX8eXzqdd7NTwKasxkaR6BVDXSg3CQCaTXhn/56KcBzjfQBrc592Bq6ch8iuO9fDrdEcGuWQ07YOO76YH/YXDeQxv6VBMqhQFdOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jgd/wtUZFvAHysLGOijed2FkaBkk1R9UpWPoPw8blO0=;
 b=W+LgyJl+MNMjVskcRNyt9HIWb/McC6tIvt4hwT30oQ8a8Msu4gGwVgAHJXBhRFrQV1/tRhoFxUZyudxvM708OLE4rWevlowUYqCWQkOkOVBceU9Si1hwIjZ+6vIsKE7ZkRidIFYHybqu/Wt9yVazbN7anIMrlu0uLTtnIQNdQZ2+OE9oQ5Q6eWGf/IAoHKzDhS3vKkAQQUbdM6GVaxJRTFi72b5xYFAFn+gMi3FlVwvsxo52kX9+sdmqnoRwXuX0vrBEaz5hD42NMuEhzdlvkYRvJfZhvIXpO795Zp2i6cHmb3d8ooOIgrd00ERZTncN8Awx9tHNE9YbBMEguZRv0A==
Received: from AM7P189MB1009.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:175::17)
 by DU0P189MB1958.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:34d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.17; Sat, 22 Feb
 2025 13:41:39 +0000
Received: from AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
 ([fe80::e9f1:a878:e797:ee1a]) by AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
 ([fe80::e9f1:a878:e797:ee1a%2]) with mapi id 15.20.8466.016; Sat, 22 Feb 2025
 13:41:39 +0000
Message-ID: <AM7P189MB10099904382702C0B00D4D74E3C62@AM7P189MB1009.EURP189.PROD.OUTLOOK.COM>
Date: Sat, 22 Feb 2025 14:41:38 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: dts: starfive: fml13v01: increase eMMC bus speed
To: Shengyu Qu <wiagn233@outlook.com>, Conor Dooley <conor@kernel.org>,
 Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250215-fml13v01_emmc_speed-v1-1-e3bd224ae0e8@hotmail.com>
 <TYCPR01MB84379C13A329703421086FF298C62@TYCPR01MB8437.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Maud Spierings <maud_spierings@hotmail.com>
In-Reply-To: <TYCPR01MB84379C13A329703421086FF298C62@TYCPR01MB8437.jpnprd01.prod.outlook.com>
X-ClientProxiedBy: AS4P192CA0035.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:658::18) To AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:175::17)
X-Microsoft-Original-Message-ID: <6c1be790-2fc8-4e9a-b5de-3dc4e5600ebd@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7P189MB1009:EE_|DU0P189MB1958:EE_
X-MS-Office365-Filtering-Correlation-Id: aebe3219-8a46-459b-b363-08dd5346a227
X-Microsoft-Antispam: BCL:0;ARA:14566002|19110799003|6090799003|8060799006|5072599009|461199028|15080799006|4302099013|3412199025|440099028|10035399004|1602099012;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RHRnVERFYTdXOWx0RDB6WVVVOFptV1VkUU50ZGk2OU9hV3JpZjNoOW5CREZO?=
 =?utf-8?B?VjlsWHo1K2J1azhaZWk1SkJIVElnSnA0TVNzandiOXhkTEQvaW5udlpFSEZi?=
 =?utf-8?B?ZWYzNXBCWVpTS0pYYTk3WWtCUk9TeHVza2E5eFptdXNBa3V0N0hSUzZNMjNU?=
 =?utf-8?B?bjFZamdhZE96aXpuVlhRV3FmSHZLWVRvZHUrOWloZlJRRmdKVHMzL05GYkUw?=
 =?utf-8?B?RW01eHU2V0labGxBaG96OWNSczZMck5TV3BJT0NtQzl6bmlSRUtpQ1B6N0ts?=
 =?utf-8?B?cTFEU0ZNZWlEVkpjUjl5VmNhb1UrelpRdFVHTTVIY3ViY1dPWkY5Ly8rVTMw?=
 =?utf-8?B?bWpDckc4L2NsQUMxOHFXSGJCV2piQmprRHN6YTRQYUJScURtZGVDME1hT1Vi?=
 =?utf-8?B?c2h4RDdzdUdqN0VWZUg2MlBMQ1RuOUZEcmJlQWR2d0h5YVMycExjY1lVc3p4?=
 =?utf-8?B?Q1VuTk1XT2VjT2RqWUo0dUZaRHpyM3JGOU1VbHRGSFZPOHJ2bFJmTllBcFli?=
 =?utf-8?B?UllFcWgzL0htVU1MeEx3S0k4UldSNXJQNU1LOW9HSFNFWmtQcG9EL25VczY3?=
 =?utf-8?B?YWRXckxnZHlscTB3Mmk2Rzg1dkNvUlZnMEtleDhRVi9BQlpxSFFTdUxuWEd3?=
 =?utf-8?B?dDYrVVNKRkMwa29NMFpJRm1hclJJeWYrT2t0MVVWTCtwL1ViSFV0RWRpZ3RZ?=
 =?utf-8?B?ZzdkendqRVBQdExId09WN2NWTDlvTnZDeDRlSjA1N0NlcEpCdDcxRWROaW0x?=
 =?utf-8?B?UDlGaDE0dXNleEtpOU9NTmhHdi9rTDA1MUZBKzd5cWNpYW9aRFJxNlN0QytH?=
 =?utf-8?B?SDlIeU1KR2xCZVdYSzVvdmZXOVhQaWxRK01ObTRjZ0dWdDREMHVyWHhDLzRR?=
 =?utf-8?B?ZU5pSEkrUlZJblpVVVk2TkMwTmNxQ2tDM2NIRVY4TWo5OElQTE5CTmdLbVNr?=
 =?utf-8?B?K3dHMGdwbjgrZzBkclkyUFpRQTljaEdISzk1R3BRU2t2ZVU5VzdENVlOZlJZ?=
 =?utf-8?B?SGNrQTU5aE00K1NoOTZiZDV6dURxSjlpemJtV0wrWWhjN0lndWthL1Y5aWVl?=
 =?utf-8?B?L0oxcnEzUnRaUUZwbjlzZUpFKzR2eGNQeW5VZjhwSEtiUHN1bnhmT1hiaVV3?=
 =?utf-8?B?OE9VM090WTIwaW45Q3QzQ09QRTVDYkJ2K01BaVpZeW9xNERUbXhCUzJ1ekVr?=
 =?utf-8?B?OGxYY1RPRGZudFpLRWdodDNGNjRvT0FwVUhidmlSM3BaWUpBNFpqTmxyVExH?=
 =?utf-8?B?Tm1xSHdzOVBnMlVjWUtPUlpxQVRSam50R1FpcCtWMmV4UGVGK2dDUHBuMDdr?=
 =?utf-8?B?MkdPTEtXWFdFaHpDZFptNHAvM2M2Z3djZGFrNk1ZdkN6UU1HRkp2UDc0WXl6?=
 =?utf-8?B?SWpyWXdWenRRbmtLQTFzVzNRQVlQdzVQR0k5Zysxa2tCZm4zZjNHeTdtMGxr?=
 =?utf-8?B?TXl3ZURFY3lpNWJBdkZxRzNKa2lLQTZ6T3pCSlNOYm1BZ2w2aHJ3UXRoVFhr?=
 =?utf-8?B?cE0vMmtCYktBVmJBaGEveUdwZGFBaENPejZXZDY3RE8rQ1IxZE9IcUxkWW1o?=
 =?utf-8?Q?ot11Cp49P0bW1/bRvh4PYihF5QwSRqn58V4chsIoM9W0at?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dElBb01UNTNLRW50Ly93SWh5eVBTNjhVNTJjMVl6K242S3JKdlVZR3k5VXdp?=
 =?utf-8?B?MlZxZi9vN05Sa3Q2VWJKZzNLOEhBUFBQek1yTFVhRnppTkxnQy9VSzYzRWpx?=
 =?utf-8?B?SGNoWWtpc1FFVGlxOHVRcXVRWi9XVVIzbmlGeWYxdDBid0tZSVRmWlRnYy85?=
 =?utf-8?B?c3N0VWpXQjFQL1RIdEhGUnZMaHcrQytSaDQzd0pvQWVBRStHS0FsMTAyRmxQ?=
 =?utf-8?B?QlMyRFVRU0o2akVuV1gzcHFIRkZWMHlWVVljVDZiUWJCeUVhU0lSclVHVkwz?=
 =?utf-8?B?elRXdlc1UFFOdUpJN2NvQlR0c0FiRFRwQVBENlVSakwxUnBNNSt6RnBzWEZw?=
 =?utf-8?B?LzJicXZGNFVrNm9UdlVPaVBUaFQxTklMU0wrUFVpUC92bDZzNFhOUWl5ZXc0?=
 =?utf-8?B?SkdyZ3pCNXVBZG0vOFUxVXkvVXg3cHBKRkFNa2dGb2ZqUCtUNVkzRE5RMEp2?=
 =?utf-8?B?REdRM0VLUnlyTFZIekZlLzhmNnhaWWJ0R254RWh2QWhFdjdPWTA2OU91VVRP?=
 =?utf-8?B?d1B1bEduU3Y1UlBuWGJ2NEp4cUhsRUZSTWQ1bkJ0dWo2djFNSTVQNTVDL3Jt?=
 =?utf-8?B?VUNFZWFHL3FYSitoQVh2bnVCaVUrTWw3QWtSTDhEVlN1VFdBK3hrZmRNOFd1?=
 =?utf-8?B?WHVDM1VIRGlLZWFhNXV3a0pzVGxXVURNUDdtcjhmb3dXcmZZN1JQQ1RKaUpM?=
 =?utf-8?B?emRnb2pjdmQ2MTlsa1hDNFprdlBWMCtqWUhsSnVIbmdSNFBjMEFBZEk0TTJk?=
 =?utf-8?B?V05sNmF3N0JMU2pjb29jc0p4ZkVoOE12MnJTd3FGQXdyQ1RweVJUbmw0MUZP?=
 =?utf-8?B?WkpQNmVHVDhLYU9UYnlFVU1uZ3NxRmcxcUk1cm5IU2tnOEFZbnZTN3ZEMlUr?=
 =?utf-8?B?eUJ5ZjI0MlM3dnJEdW1mbTRVSnU0ZHdaK091bHprYXM2M0RXNXZuUjBDSjZ5?=
 =?utf-8?B?bUtYY2kvdUExWmNvWFl6VHhuZXZjYTNQbUJ4cGE5Z1poQU9RN0ptNTJCOS9Y?=
 =?utf-8?B?OG1qTEVtcWlPd3FHSEgvKzhidmpkVjRrM1NyeTdkUHpVMXZJWUVvQ0VyeTgr?=
 =?utf-8?B?VlB2UnVBMnNPMW9mek5TSjhob3ZzS0VmZlpNNlp6UkpLaDBUTDgzOVdWbGtE?=
 =?utf-8?B?anZpQXhDTy8vRmdIMzNWMW5OeVN0RmQrTHlHVVNPL2ZoMkZMNnBHNi9NY2JC?=
 =?utf-8?B?M1BiMXAydnhhYUtCcFRJeG5ZTm81bTEyeG0xamZ4YzRmY2d5VkFHSy9zSXYx?=
 =?utf-8?B?dlFGL1RhUGlTU3BmclN3NVF2dlFUTFM3UHFOSmdBY3ZPNzE3UXFlREZCeW4r?=
 =?utf-8?B?WG45NlY0QjN5NitjeEh2eDhIajkvSGpvUnF0NXpjUWpReHIrMGxmazdLMENO?=
 =?utf-8?B?Yk9iZkVWdFBnR3hDMXlUVjExNi9ZMXViWlZpV0l5ZDNtMFlZc2hnYU1yMmYy?=
 =?utf-8?B?VzczeWpHTjEydjFsL0s0NjNKUnRybzVFcXJWRjlKTzRuY3NjZzNPOXhNb2ZO?=
 =?utf-8?B?UUhOdlRUZXp4Ylc1NXQ0ZDEvcFVFL0NRa1FCWnRGbEhpajFyYTkvM3pVSE9w?=
 =?utf-8?B?a0FxRitmaFkxc2VwSzRCVVJUUHllOWkzUE1tNW9PK25QRy9KTXRoSUpFRGw5?=
 =?utf-8?B?VFJQd1NHZzhrWGQyellJc3VVVi8vSDBiTGNoSkwzTEdyMDhMOVB2cFRLSnM1?=
 =?utf-8?B?aEt0bWlvM1ZSVzN6ak92VmNMNTJqMytsTUkyQzVpM2cvcjhxMitsa3lmZDVy?=
 =?utf-8?Q?JoBy4qU+xJEGb5JFMtiKD6Sxm8jGSc+nonBnOzN?=
X-OriginatorOrg: sct-15-20-7719-19-msonline-outlook-3b3e0.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: aebe3219-8a46-459b-b363-08dd5346a227
X-MS-Exchange-CrossTenant-AuthSource: AM7P189MB1009.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2025 13:41:39.1791
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P189MB1958
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_054145_095512_62B9C6A7 
X-CRM114-Status: GOOD (  17.57  )
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

SnVzdCBzZW50IG91dCB2MiBiZWZvcmUgSSBzYXcgdGhpcwoKT24gMi8yMi8yNSAxOjU0IFBNLCBT
aGVuZ3l1IFF1IHdyb3RlOgo+IEhpLAo+Cj4gVGhlIGNsb2NrIHNwZWVkIGxpbWl0IGhlcmUgc2Vl
bXMgYmVjYXVzZSBvZiBzb21lIGNsb2NrIEhXIGlzc3VlczoKPiBodHRwczovL2dpdGh1Yi5jb20v
dG9ydmFsZHMvbGludXgvY29tbWl0L2FmNTcxMTMzZjdhZTAyOGVjOWI1ZmRhYjc4ZjQ4M2FmMTNi
ZjI4ZDMgCj4KCkhtbSBJIGRvbid0IHF1aXRlIHVuZGVyc3RhbmQgdGhlIGlzc3VlIGZyb20gdGhh
dCBjb21taXQgbWVzc2FnZSwgYnV0IAp5ZWFoIGlmIHRoZXJlIGlzIHNvbWUgaGFyZHdhcmUgaXNz
dWUgd2Ugc2hvdWxkIHByb2JhYmx5IHNlZSBpZiB3ZSBjYW4gCmdldCBzb21lIGlucHV0IG9uIHRo
aXMuIEl0IHNlZW1zIGZpbmUgc28gZmFyIG9uIG15IGVuZC4KCgo+IE1heWJlIHdlIG5lZWQgc29t
ZSBhc3Npc3QgZnJvbSBTdGFyZml2ZSBndXlzPwo+Cj4gQmVzdCByZWdhcmRzLAo+IFNoZW5neXUK
Pgo+Cj4g5ZyoIDIwMjUvMi8xNSAxNzo0NiwgTWF1ZCBTcGllcmluZ3MgdmlhIEI0IFJlbGF5IOWG
memBkzoKPj4gRnJvbTogTWF1ZCBTcGllcmluZ3MgPG1hdWRfc3BpZXJpbmdzQGhvdG1haWwuY29t
Pgo+Pgo+PiBUaGUgYXNzaWduZWQgY2xvY2sgc3BlZWQgb2YgNTAgTUh6IGlzIGFuZCBtYXgtZnJl
cXVlbmN5IG9mIDEwME1IeiBhcmUKPj4gbGltaXR0aW5nIHRoaXMgaW50ZXJmYWNlIHdoaWNoIGlz
IFNESU8gNS4wIGNhcGFibGUuIFNhZGx5IGF0IDIwME1IeiBpdAo+PiBmYWlscyB0byBtb3VudCBh
biBlTU1DIGRyaXZlLCAxNTBNSHogKHJlYWxseSAxMzIgTUh6KSBpcyB0aGUgaGlnaGVzdCBpdAo+
PiB3YXMgYWJsZSB0byBnZXQuCj4+Cj4+IFRoaXMgaW1wcm92ZXMgdGhlIHNlcSByZWFkL3dyaXRl
IHBlcmZvcm1hbmNlIGJ5IDJ4fgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBNYXVkIFNwaWVyaW5ncyA8
bWF1ZF9zcGllcmluZ3NAaG90bWFpbC5jb20+Cj4+IC0tLQo+PiBJIHB1dCB0aGlzIGluIHRoaXMg
c3BlY2lmaWMgZHRzIGluc3RlYWQgb2YgdGhlIGNvbW1vbiBvbmUgYXMgSSBjYW5ub3QKPj4gdGVz
dCBpZiBvdGhlciBib2FyZHMgYXJlIGFsc28gYWJsZSB0byBoYW5kbGUgdGhlc2Ugc3BlZWRzLgo+
Pgo+PiBUaGlzIHBhdGNoIGRlcGVuZHMgb24gWzFdCj4+Cj4+IFsxXTogCj4+IGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2FsbC8yMDI1MDIwNzA5MzYxOC4xMjY2MzYtMS1zYW5kaWUuY2FvQGRlZXBj
b21wdXRpbmcuaW8vCj4+IC0tLQo+PiDCoCBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3N0YXJmaXZlL2po
NzExMC1kZWVwY29tcHV0aW5nLWZtbDEzdjAxLmR0cyB8IDUgCj4+ICsrKysrCj4+IMKgIDEgZmls
ZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKPj4KPj4KPj4gLS0tCj4+IGJhc2UtY29tbWl0OiAw
YmMwOGVjMWZmNWEzMjQ0OWQyYjA0NzA0MTczZGJmM2ViZDZiMDE0Cj4+IGNoYW5nZS1pZDogMjAy
NTAyMTUtZm1sMTN2MDFfZW1tY19zcGVlZC02NzgxMmJkOWI0MDQKPj4KPj4gQmVzdCByZWdhcmRz
LAo+Pgo+PiBkaWZmIC0tZ2l0IAo+PiBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3RhcmZpdmUvamg3
MTEwLWRlZXBjb21wdXRpbmctZm1sMTN2MDEuZHRzIAo+PiBiL2FyY2gvcmlzY3YvYm9vdC9kdHMv
c3RhcmZpdmUvamg3MTEwLWRlZXBjb21wdXRpbmctZm1sMTN2MDEuZHRzCj4+IGluZGV4IAo+PiA4
ZDljZThiNjlhNzFiZTc4Y2E1NzYxOGFlODQyYzlmNDE1NjQ4NDUwLi4xZjRiYWM5Zjg5NDYzYTZh
Zjg0NGI4ZjE3NDNiZGZhNjU5ZTYxMmFiIAo+PiAxMDA2NDQKPj4gLS0tIGEvYXJjaC9yaXNjdi9i
b290L2R0cy9zdGFyZml2ZS9qaDcxMTAtZGVlcGNvbXB1dGluZy1mbWwxM3YwMS5kdHMKPj4gKysr
IGIvYXJjaC9yaXNjdi9ib290L2R0cy9zdGFyZml2ZS9qaDcxMTAtZGVlcGNvbXB1dGluZy1mbWwx
M3YwMS5kdHMKPj4gQEAgLTExLDYgKzExLDExIEBAIC8gewo+PiDCoMKgwqDCoMKgIGNvbXBhdGli
bGUgPSAiZGVlcGNvbXB1dGluZyxmbWwxM3YwMSIsICJzdGFyZml2ZSxqaDcxMTAiOwo+PiDCoCB9
Owo+PiDCoCArJm1tYzAgewo+PiArwqDCoMKgIG1heC1mcmVxdWVuY3kgPSA8MjAwMDAwMDAwPjsK
Pj4gK8KgwqDCoCBhc3NpZ25lZC1jbG9jay1yYXRlcyA9IDwxNTAwMDAwMDA+Owo+PiArfTsKPj4g
Kwo+PiDCoCAmcGNpZTEgewo+PiDCoMKgwqDCoMKgIHBlcnN0LWdwaW9zID0gPCZzeXNncGlvIDIx
IEdQSU9fQUNUSVZFX0xPVz47Cj4+IMKgwqDCoMKgwqAgcGh5cyA9IDwmcGNpZXBoeTE+Owo+Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
