Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BB8EC4345F
	for <linux-riscv@archiver.kernel.org>; Wed,  1 May 2024 01:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:From:Cc:To:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Lo0bSP9YNjCyvEhGS9Eg88HufPlrNSpiAXnHHu5HoJM=; b=GYususCXOCoJAVgH0EzyuMXc66
	hrVC8O3Ddschyfn1+sx6FR4UAAx5hZfPTBcgVjg0TL8b/WYzoqISS+avP1WzCdNQaOlCKH2yV1Nuk
	HWi7BrO+mHFJrKr5YHPaX/eamfglN4hc7OSr+Z+lVFlKVQgogh9Osm4QXAJuUPrs+HVWqX0cZoUw5
	b3muM9+urNrpKBVxxENf9e9BP4lzpmwDYHF5NllO7rH9HUPI+tJiTmiZ74ZDpBEd5Uum/oGSW1F5N
	MquZQTgEISthVXe56Mba8rJbW9CPQW30RDsEl4pRtXDfCM9LkjJbcAju/72uoKXvvtIeK0T1xdAmo
	pZT4IJGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1ypB-00000008KVh-2gK4;
	Wed, 01 May 2024 01:31:57 +0000
Received: from mail-maxind01olkn20800.outbound.protection.outlook.com ([2a01:111:f403:281b::800] helo=IND01-MAX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1yp8-00000008KUY-0XvF
	for linux-riscv@lists.infradead.org;
	Wed, 01 May 2024 01:31:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gFZ4gYj/X7qUKWRSIWbMsA/Pq5uBIjfrQ1zQBgvkebcWUM/PYv5sJVZE6RUOCbvd1+q7ZBHVVD2y6nQtY19566aK+2gsnHU2HXa9NKF0xJVWHQ0x7cFS/0aPvNfx/YQo+6B2cVXN9B6lUwxhnCws+w0EAENb5e3X9MtcyEl80yiHRArcxQX6CxJ+HTJTcvPoemuu8ECZ4iRDDE4oZeCEQZdEzht4aMT2sn598syRxfkXcjA9pNz5FzIW/ovd6r+r4ZB6TffLrhV2JTm+zH7iWAv7NhhI2vt8Ny8WFGyBYddyVhYlxAM6kVYNK4EI6K3gsP9TqoXFG9JXaUAxk/nAHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=alvjw9KL/T5GgEmRBdQMmxinaeSv24nXXncZPQFpX7I=;
 b=hvSbpFrhgwvTCqiAmZqziRlTj/Jd8x4XAeCXc/IHhSM6D3z8N/LfENcLMP6+vuWg5TWw9CXUuMHXIwRmc5Ikn6OON2KMSRUdYYctJzyFqqFytFB4GBeoaTYV3lUvV256cTYWn/LY2zquIbDPzPUFy/46Xi01KhdwSxAoOjod3CxTp1OUUDMsBh7aNGBiec2mwh4umvue0PjX7TQpkCTHDM7gGSkFmRJjrnRUux8C99UzCjn5u9dDEAD481o7Pldp4HyQW56QawJtv2ot7Ixt1N+hWzMPonFD2rYIAqHccQlswd0e9ry7QA3WxPru9BJ3KR0PkjfGkoQF43Q4ButCdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=alvjw9KL/T5GgEmRBdQMmxinaeSv24nXXncZPQFpX7I=;
 b=dvnPYwjj3RGVm7N4+aXDFdoRKF++6RdeUBoWxlymHE1Q2i2vs8B3nSVhTxXy1ivH3F2szOfD43ZkO+tnk3evdKb9NMPWIxLSwBUdFgCsPMDMEaElk7dsO1FwLRczwNBVMBSwI/wKz3fj3bJSlD1Cqsgw1asGiDbThAhRX8WGSs0mCjwwPzYQJEKtpJqngNXcChaqjtCf5bVLixLHQGhfzgNrqHUu5fbTNtU0B5KC8/otZwqqERpg9wDOANiJG6eaS/imHHHgCUWbKTwvEEeon04SPPNJj3id+6uY14r2LgO3CUUZyHDfNnkNuGTLSUAXHQfI6mjPPZjtfaxe9GIp9Q==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by PN2P287MB1987.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1c2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.25; Wed, 1 May
 2024 01:31:30 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::664:2ecc:c36:1f2c]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::664:2ecc:c36:1f2c%3]) with mapi id 15.20.7519.035; Wed, 1 May 2024
 01:31:30 +0000
Message-ID: <MA0P287MB2822CA2DE757787D6EA3B1F8FE192@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Wed, 1 May 2024 09:31:27 +0800
User-Agent: Mozilla Thunderbird
To: soc@kernel.org
Cc: "conor@kernel.org >> Conor Dooley" <conor@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-riscv
 <linux-riscv@lists.infradead.org>, Inochi Amaoto <inochiama@outlook.com>,
 Xiaoguang Xing <xiaoguang.xing@sophgo.com>, haijiao.liu@sophgo.com,
 Chao Wei <chao.wei@sophgo.com>, Liu Gui <kenneth.liu@sophgo.com>,
 unicorn_wang@outlook.com, Jisheng Zhang <jszhang@kernel.org>
From: Chen Wang <unicorn_wang@outlook.com>
Subject: [GIT PULL] RISC-V Sophgo Devicetrees for v6.10
X-TMN: [+eMMbRyzxATB1wdUfMf6ue22vGJVPS8T]
X-ClientProxiedBy: SG2PR03CA0097.apcprd03.prod.outlook.com
 (2603:1096:4:7c::25) To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID: <2a228454-7d12-4ab5-8bc6-d307e4a9b9a3@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|PN2P287MB1987:EE_
X-MS-Office365-Filtering-Correlation-Id: 854ab0e0-2032-48bf-ef94-08dc697e6d4e
X-Microsoft-Antispam: BCL:0;ARA:14566002|461199019|3412199016|440099019|1602099003|1710799017;
X-Microsoft-Antispam-Message-Info: bMx4bBH3VeU1SVXlCDyAAhC92y3gm+/AFvt4/XUaeAcB0xu6eX7CIpT/uz5jZk+WVZn9GbcDk2IkALxO6u32ol/feMYRx+31jwxDEevau68xjdII61xgirN0VMnWD2T0VZdI+72dh5XRN2Uox+cKVOWsub/sFTK0EPwGgrqbUhydWhWMB12OzGBv1cFrSNEku9T/kKEFoPs/2AId8rN6sr6bVbZirmnbiqj4CVsydRmaXUYDnqqCjwH6dq0vIUd4zfWb+3u+R/AYT58U+NukMV4t0NkKuQVixO1pmWInvbqed+mxgwHuOI0okddzrvO+rcdk2mPlm7EOgfRfG7ajAYVPxiCGJvUeE3pHNi66vyYmsvahlsj3MIWn7MVyDIQJzaBhQ0w2YZnHJYahuysDdshePOg83keGWV9TbW1dFGI5vDa6Slien1Y6VMHzmkOE45y6eiK03aVJjHdac6UnWCREvyXtZcJvaVNZ37dQg1lRxyEJmRYEntiaEWoyiy8PHh41rcSyUqg8cPQOIxvIFjTmrzV2GtS0mMvNiSS4aW/dIqVr8pis8JNgzmXFo/FgAfKIZmnoUCQjriRojV4SKXz1LvQoDkPyXpKbPfQR/7II7YH/mCTtL7259YonEREMP1HXsOyBlXyzRV1YTjTUpPSjNu8NMjunKFTtKVmeGM3n1MbA3nowU2cmgjiehtdr
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWFaNHFxdkhuNkV1UFN0VWREY1VEcnUyRmNOWXAyTjk0eHRDRGlQRzd0bFZ1?=
 =?utf-8?B?TmxnVU5QbERFNWF1TVhvQ2pLTG9YTHBuRlBLWHhqc2VTdE5ydlRQdzJseFMv?=
 =?utf-8?B?RWJpZ2IrcG1NTG01TFBKTnZlcyswZXlmRkpZUXlVNitKSUZUUE1pNzF6VXc5?=
 =?utf-8?B?NDRza3pqSjNkV21VU2xpcWl2K0E3Um1QWWpGcGhLTXE5U0lDREZIYkljYlFN?=
 =?utf-8?B?VlF0Mllnb2hGazJ4bTdNNnh5cVBMYzNrdDVyb29lUnBzTHNleHRyaEhaNUZR?=
 =?utf-8?B?QkJSZzhjczBMTEd5SW56ZHA1YXFxZWlaSlRrTDRvYmt1RVRLTG1kNXhVZ252?=
 =?utf-8?B?NHlzSFpTZUFXNWhSeWY5eHJyYlpQL3puRG5HR0hMbERheVJ5Q0x5MXU4V1pG?=
 =?utf-8?B?YzM2d3BCNVp6MEM4SVhvVnc0U003enh2SmE4dFFGWkRGZWlnQXJmbjhnanNy?=
 =?utf-8?B?aHFTQlN5dWVIeWRJeVhHdkRBVkduQVRwb3V6cDlOOWV1RXRxTzV2RWVSeWdO?=
 =?utf-8?B?SjRKQWNrR0huVjJBUjZ6QlVzcE9WbW5vKzc1Rk5tcW5MNnhVdEdJNmZSUk1l?=
 =?utf-8?B?dXVHdDFzTUlwSGI2UkxhSGhKN2FOV0g4QWNSTSttY3k3VDluNWRZR0xDVUdS?=
 =?utf-8?B?bXdJaDZlSnNLRm1jUVcrZUZ0djdzWUpIRmZ2Y044NHZyUGJKM2RhMWdGRkZi?=
 =?utf-8?B?aS9YVUZMNjZmQ1dYYUt0aWg3c3hVdXpVaDJFa2xqUmRESytHbUd0RjFKQTF1?=
 =?utf-8?B?MHlBTFdEMFIyVmdzU0t1TFZoakJ2MEsvek5qaEJySmxFcGtWTnBkUHgrd0Uz?=
 =?utf-8?B?M1FvdXpwSVU5YmQveEdPQy85dlJXempJZkdlZTdRRFA5R21iNXJCMkZpN0pz?=
 =?utf-8?B?TllFaHlkaG94dDk0dUxsd0Vsb2xQVS9JcU0yMFN1amtyNkQ5dU1CanU3MEU3?=
 =?utf-8?B?U1hqNjNGSFZCdldBb3hFb2RlMEphU1FnQ0czdWlqQjErU2lkSmZuSXIrUDJn?=
 =?utf-8?B?SWVWamZvL3FiY3RINTZMVDVtY29qSEpaQVZNSmZuSm10WDYrM3p6ZTJzdkhk?=
 =?utf-8?B?ZXE1cVIySExNRit3aDRodzFITnh4U1dVSm5yUmxpRlJwdWRldXlxV2JiMzda?=
 =?utf-8?B?YWY3ejJRSHQxRStHc1Y2dk1wRzFicVpDN2NWeTVTUVNEcVdqdTR1VjE0djFC?=
 =?utf-8?B?eFB4d2hMZFhJRTJVMW9OeUxLK1V4TC8wS1JGcE11aDRCSldEWlYzbS80Tkhq?=
 =?utf-8?B?alVUTGY3ZFJoYUhLQUxoNlRFWnVhajZ6OHZ5aFZoWUd1enR0QVRGc0Y3dVZw?=
 =?utf-8?B?SnhDbmpRWWE4VTB3YTFIVEptMFZPemUzVCs2L3JReG1oNytBTDdJYWMwVFFS?=
 =?utf-8?B?Z0ZKdlRZWDlEV1NDNzY1TytCeUFWS280ZDNqckpnMG5lK3N2cmEzR1BVNUJQ?=
 =?utf-8?B?cTMvdjFscmc2NytMVkdQeTBEaHZxWkpseENtaUJVbUN2MEt4TVowSDM4VWwy?=
 =?utf-8?B?Rkd1NjJOMzRJOFd1YndJcGtmK1V2Ymc2dlExNXJ4VC9sWVJacUVZdFQ4TEd5?=
 =?utf-8?B?UFRNaHpqdXhhdDNlOWltb01wTVJZbURBYXVtejVqaGxqY1AxQzhDb3RoV3pn?=
 =?utf-8?B?dHRBeVg1OUFUYTlFY0FEdXF2TCttVVgwSER4Y04yd1pJR0dQS0hwVWNQbUFX?=
 =?utf-8?Q?nRClX0SkvLb+nA15UbK0?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 854ab0e0-2032-48bf-ef94-08dc697e6d4e
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2024 01:31:30.2204
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB1987
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_183154_212711_5CD6438C 
X-CRM114-Status: UNSURE (   5.40  )
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

SGV5IEFybmQsCgpQbGVhc2UgcHVsbCBkdCBjaGFuZ2VzIGZvciBSSVNDLVYvU29waGdvLgoKVGhh
bmtzLApDaGVuLgoKVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCA0Y2VjZTc2NDk2
NTAyMGMyMmNmZjc2NjViMThhMDEyMDA2MzU5MDk1OgoKIMKgIExpbnV4IDYuOS1yYzEgKDIwMjQt
MDMtMjQgMTQ6MTA6MDUgLTA3MDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9y
eSBhdDoKCiDCoCBodHRwczovL2dpdGh1Yi5jb20vc29waGdvL2xpbnV4LmdpdCB0YWdzL3Jpc2N2
LXNvcGhnby1kdC1mb3ItdjYuMTAKCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byAxZWJh
MGI2MWJlNzI1MDY1NDllNzlkZDExYTEzMmI1ZDczYWVkMDk0OgoKIMKgIHJpc2N2OiBkdHM6IHNv
cGhnbzogYWRkIHJlc2VydmVkIG1lbW9yeSBub2RlIGZvciBDVjE4MDBCICgyMDI0LTA0LTIzIAox
NjozODowOSArMDgwMCkKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KUklTQy1WIERldmljZXRyZWVzIGZvciB2Ni4xMAoKU29w
aGdvOgpBZGRlZCBzZGhjaSBzdXBwb3J0IGZvciBjdjE4eHgvZHVvLgpBZGRlZCBjbG9jayBzdXBw
b3J0IGZvciBjdjE4eHguCkFkZGVkIGNsb2NrIGZvciB1YXJ0L3NkaGNpLgpBZGRlZCBzcGkgc3Vw
cG9ydCBmb3IgY3YxOHh4LgpBZGRlZCBpMmMgc3VwcG9ydCBmb3IgY3YxOHh4LgpBZGRlZCByZXNl
cnZlZCBtZW1vcnkgbm9kZSBmb3IgY3YxODAwYi9kdW8uCgpTaWduZWQtb2ZmLWJ5OiBDaGVuIFdh
bmcgPHVuaWNvcm5fd2FuZ0BvdXRsb29rLmNvbT4KCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KSW5vY2hpIEFtYW90byAoNik6
CiDCoMKgwqDCoMKgIHJpc2N2OiBkdHM6IHNvcGhnbzogYWRkIGNsb2NrIGdlbmVyYXRvciBmb3Ig
U29waGdvIENWMTgwMCBzZXJpZXMgU29DCiDCoMKgwqDCoMKgIHJpc2N2OiBkdHM6IHNvcGhnbzog
YWRkIHVhcnQgY2xvY2sgZm9yIFNvcGhnbyBDVjE4MDAgc2VyaWVzIFNvQwogwqDCoMKgwqDCoCBy
aXNjdjogZHRzOiBzb3BoZ286IGN2MTh4eDogQWRkIHNwaSBkZXZpY2VzCiDCoMKgwqDCoMKgIHJp
c2N2OiBkdHM6IHNvcGhnbzogY3YxOHh4OiBBZGQgaTJjIGRldmljZXMKIMKgwqDCoMKgwqAgcmlz
Y3Y6IGR0czogc29waGdvOiB1c2UgcmVhbCBjbG9jayBmb3Igc2RoY2kKIMKgwqDCoMKgwqAgcmlz
Y3Y6IGR0czogc29waGdvOiBhZGQgcmVzZXJ2ZWQgbWVtb3J5IG5vZGUgZm9yIENWMTgwMEIKCkpp
c2hlbmcgWmhhbmcgKDEpOgogwqDCoMKgwqDCoCByaXNjdjogZHRzOiBzb3BoZ286IGFkZCBzZGNh
cmQgc3VwcG9ydCBmb3IgbWlsa3YgZHVvCgogwqBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9j
djE4MDBiLW1pbGt2LWR1by5kdHMgfMKgIDIwICsrKysrKysrKysrKystLS0KIMKgYXJjaC9yaXNj
di9ib290L2R0cy9zb3BoZ28vY3YxODAwYi5kdHNpwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDkg
KysrKysrKwogwqBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9jdjE4MTJoLmR0c2nCoMKgwqDC
oMKgwqDCoMKgwqAgfMKgwqAgNCArKysrCiDCoGFyY2gvcmlzY3YvYm9vdC9kdHMvc29waGdvL2N2
MTh4eC5kdHNpwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAxMzIgCisrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrLS0tLQogwqA0IGZpbGVzIGNoYW5nZWQsIDE1NyBpbnNlcnRp
b25zKCspLCA4IGRlbGV0aW9ucygtKQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
