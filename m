Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F14BAE776F0
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Oct 2023 02:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wGti/GRJa66djj4+myylBmWlpHvoD3hv5Lh6o3RKu8E=; b=dyYdwl2mUvpuIqlqAi3p6D0vSc
	iRqGN6odj+J971Xdtu2Al13h9hoAz3kq7PYvPBkkX6Fc9T5A7Rt4YylJB9T/lfjV6Z/BVDtm6PGid
	n5bre7qDmfQ6cay3IYHkDZM5f5qg+FLFNBGduExsO+6Mnk6tKDTpICqGGq3AcJWGOav432AW4Y3wD
	bKZ+BSUR5ffymR+smIEdCUWaFsTz9cZN+GVsJazujfmob3I0xlYZNooEIa+iuJlOnPD/gCUa76g/X
	aSnNGBDc7XSmPtQbtogoQ0hRtBBSt8029dwkX/qZ1xU2bD/hY/yFe3TUWviHaJs2AqcBBRmwOTOpL
	qT8VkQUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnVRw-00Dgq4-13;
	Tue, 03 Oct 2023 02:47:52 +0000
Received: from mail-bmxind01olkn2080f.outbound.protection.outlook.com ([2a01:111:f403:7011::80f] helo=IND01-BMX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnVRr-00Dgoa-1X
	for linux-riscv@lists.infradead.org;
	Tue, 03 Oct 2023 02:47:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hOWkXhdOYL1SpcMiv8wZxR2tHtiSrE6GPm/67LkCOE5tG7cNwbBNwsMXEcTwhKbzWfftp+v07IlcbQvQBRf2VG4XHFLCWfd/+nKRO+4wx57/LyqTMIvUR05wLhIFDnneZ2GQv+AkFgRZ5G6Rs8arBk98AVaWZvmPCGekSjd1y6aXB+HaIa/WCKN5JKp+YKlzQfluCCqYt1YY5H0QKpl9xj1y7mXnYzbrunSJcexYtEI+wRDeN5PWds7Us2QsSt07EPwmo1IKftBQKI1gUODaA6nKPszNkJECYYz0YDoB+LLc+sDXd3aTW9dQk4XvAdTSZAqGAP+p/tp6hqZu5jJE9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=srtYqI5fxWdxWnt69NGrVgg9OFCl1KuDtkCOprzXcyU=;
 b=jHj8bxsPsNGw6MO4W6vhXoxALtBbe34rgE7J5Z5ri9UL1Tsea/y2DR7PDHDuEI7ISrmx0qum6kGucCTDKHpZrPjuyanE6ztjIxAkLs/iqS3xgmJTvrUC5/Z2baUTqKrU81F1aBfB37zV3ccUcRzmMzYcKlQpWB4IN/JxzNxH1ZD3neTcPs+sRA5VfmKvft7MyP2YTisOUjlKcfMfLeimmwypPXKiQriDfSKTnZnbN76VUZNq0nPHzUfHz1d9upK5O95DFLZKXy1LTgdOi+VK+3KJ0ilO4pUXsbpN5NlAs9it4SEU3BzHo3sHlqex9uAld7ytHI9ngcjte9SQRoIyug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=srtYqI5fxWdxWnt69NGrVgg9OFCl1KuDtkCOprzXcyU=;
 b=E/4cq891jW+dV/owec4JNTu018eZfBbrnI2boo4ysez7zY8g2v3p9zMirwjKj5EqpqvsYlH1uvVmnwl5nbFywLVhniy1NyvzKGZ9eG7EkskYvT1XM777Xw04N7Qujpg6UNDuV5CCw9fVxgFVhJcymu8G5jyiFN4tCDpkaU6cTtIbAnaT4GKjXNJRmMQTKjxppl6F0LRoSXsSwiB9yNoJqllzVh7ywDNvtfk0waB6YL5yCk+JhN9Iv9P/4WuJeTT7jpkM3zQzeleW9IuMOLaA3ACGoIxzbdNBQOyEJKljQJuDGaiUoWzncSrYTBAgkvNmIHiIfiKuRnKIQSQv21yURQ==
Received: from MA0P287MB0332.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:ab::5) by
 PN2P287MB1631.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1a9::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.29; Tue, 3 Oct 2023 02:32:27 +0000
Received: from MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
 ([fe80::efe9:8d54:281b:23f7]) by MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
 ([fe80::efe9:8d54:281b:23f7%3]) with mapi id 15.20.6838.028; Tue, 3 Oct 2023
 02:32:27 +0000
Message-ID: <MA0P287MB03323A58B068D400E8225E80FEC4A@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
Date: Tue, 3 Oct 2023 10:32:20 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] Add Milk-V Duo board support
To: Conor Dooley <conor@kernel.org>, Jisheng Zhang <jszhang@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Anup Patel
 <anup@brainfault.org>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 Inochi Amaoto <inochiama@outlook.com>, chao.wei@sophgo.com,
 xiaoguang.xing@sophgo.com
References: <20230930123937.1551-1-jszhang@kernel.org>
 <20231002-slurp-anime-a2308245174e@spud>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20231002-slurp-anime-a2308245174e@spud>
X-TMN: [k3J3NN7BTkwyO6A6E6lh92Npy4x5GQFV]
X-ClientProxiedBy: SI2PR06CA0010.apcprd06.prod.outlook.com
 (2603:1096:4:186::6) To MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:ab::5)
X-Microsoft-Original-Message-ID: <caacf3ab-1391-44ef-b023-95ac5c01a981@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB0332:EE_|PN2P287MB1631:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bb12ee6-6bdb-4bf5-2063-08dbc3b8fbf2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GeJ8FwXjxZXWE46Xmgg7HItErrs5T1RJ1Y6/jhlGY8duiV8VKkcR0MnoRCDxoHibOX7/a476gfttLfCnqGiLKL2Ei3v28NN43MJrkpsKQ0FtkYNBFW0++A3moSYkKv+QnUWKBSUE7GfLZ1k/+bcp4WCoWGJ/b9xlCq8Ltls1MMB2qDQkPCSDVXxbG7uldUkkSYumR3IpHJvzFFtKiZS+JTqKVkMmG0SPYpA12NihoT6dQv3AK15CnPVYi6p9zWZRkB/BwzvL6VN8ohjIR5PqPEsklwzGCw6AFSkhbE9jpwV8BX0aQly5ZW8UxpWjibzzPKlZC7oL9ZQ+tLIe43hzJgJ8LyD+iOPlSTerHN0gvL18ck0U09kkSaTijp1pTmErs1ZMq6IAT4of7u6U+uiZT1O973nTuX5jv2E71zFOIh1Vz054rDtSDiYfNsLg+4pdFVH8imeTtBRK035yZ04zUnHnvqgho4Vapa4D0UObekXS35CpAcbrBzehqCHiKfhXOtuAQemypStSkg93kZF5QE6Qx7Tb4RBE4C+Ru+Mgoc4bxcHe8V9wQhv/P/qjy7udfuuhdMElcY3D3J3xerCzsDvq+VHamX7QOaY94LK4YPI=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVUrM3laM3B1bXlkaE5tQ0Rud2QrMTRXV0hzR3gyeUlQU3V2Qk5lS2JOcVpE?=
 =?utf-8?B?RmV5b21QYkxzdE1mSUhFY1U2VWJVaVphblRzU1FvZW1oOEdudlY2d2VHc1l1?=
 =?utf-8?B?Y3hjNEtZZWMzYmsyVU1LWFhtbVMzeUkzcU1tR3JySmlZRk1oZTJPT2wwVG80?=
 =?utf-8?B?RTYrOTVkaXg3d0JkalU0eTBJQlpyeXJyWUUxOVBNOTBFNlNJOFlUZFZmTEhL?=
 =?utf-8?B?Wlc5ZnA3NkNscloyaS9QTU94VXRZb1pjQ3dyRTdSWFVtL0grQyt2VjZQVkZD?=
 =?utf-8?B?Y0k1L3RVS1FKeUlKV0Q5cC81cFZJL2hjbWdMM1lHM2pGTGZuSDU1WkRNczVj?=
 =?utf-8?B?NHFROEhYSmE5ekhSV3BWQ3N4dnZ1VytGSXFHb3M3UWxBMjd2VER4RU1WaHRB?=
 =?utf-8?B?U2pMd1Q3Nmh1RWk0c1l5NzJENXo1YkVqWjNpTVpDOTR6aDFmMjRxSks2YnBR?=
 =?utf-8?B?YSsvMk1zUFdxdlJLUlRWM3BUS3RRTUsxUGxJN0V3N0hDSEt0SHBKRTFmYWR2?=
 =?utf-8?B?RWs1aGtqeXlneEFMSVZmQWFDVjJDem9MVktuZldhTFR5S3QvVEdjSVZUbmdF?=
 =?utf-8?B?YTdVMGsrS1pURUg4c3BCOUJJOGVTTU5yazNQTE9HSXcvL3JBS0RtU1Q0Y0xy?=
 =?utf-8?B?WmI0NTRINVI0eHY1UDFsbHlWdVlpOXNOVzAwdGVuQm9PdjFiN3kwVE14VTNm?=
 =?utf-8?B?Rm52L2VwZTJkbnZCYW43SDlRdHZJaUorYmgrV2xudG1LalBhUXRzTGJsRm90?=
 =?utf-8?B?SFpWclg0WUlyZWJPZ3ZWTTBteitKb1VQcFVhL2Q3bktLMmJIR2VQdnBQWnN1?=
 =?utf-8?B?dTJGbkhsSGIyY1VjTnhObWp5YjVPRjM3V3YrSmJESFpFTUM5a2pFakkvaXkr?=
 =?utf-8?B?cEM4WVRvdWUvWjJGV2dUSjhIZ0g5ZHo5eGsrbU13aExOQmtKdExWNm9IWnh6?=
 =?utf-8?B?Tk81N0xPQlN4eG1QT2pyMmlwN01RU2dxOE1ZNXEzSmp4Y1NsN3JJODJaRUJH?=
 =?utf-8?B?NTdRSDRBa2poYThSeW9vS1M3dElXMGxaK1J1TFBqaE91Q0JMaXdvbGRCc29v?=
 =?utf-8?B?Q25LN2x0UEtPam41M1RRY3Y1WC9laCtkd1NIMnJXTEpSakltUDdVeFNKN2VQ?=
 =?utf-8?B?VHJWV29HNnIvbU1CNFQ3KzZiRzFWS1RjMW9ZMDhrSDE5YUNSZGs2aGxuK3RU?=
 =?utf-8?B?YjVJaXNPSXVjWXFrcDJpNytrVWxQWWNobi9jMFhncDhTaEhQd2FtV2VZWDN0?=
 =?utf-8?B?cnEvMXIwa0JQR3VPRFVlai9qZkhOM2VvTDJZMERGeUVCWnJPc0k3cmV3bWhD?=
 =?utf-8?B?bG04MjdUQXp6Rm1LT09ibjU3TmRrbFVKbkh0U2VVM2NUczl6QmR2QVJmSjFw?=
 =?utf-8?B?dkJqVVhqOEtnZWZQdjZkYktmUDlQcWV1OTRlcmx0M3AyM3dpTUl1WWZIb08w?=
 =?utf-8?B?WS9DcHNRYmN3RWFRUEVvL2RjY1F3bWJQQnBjR29EVzNvTDFTNFptb3M5bEJh?=
 =?utf-8?B?QTVZT2pKcm15RmdoeWNZSHJ4S0VnMFdRSUdYUEp2djVmT1hlNUdRWlVPY1BY?=
 =?utf-8?B?SE5FMXI5djhlWXFvaVJnRkhjcERka20rOTRpOFFvK3VnQmRZdUkzVHBOcHR6?=
 =?utf-8?Q?mUifHyW+sCHRaXOUYI/tKOsZ8VzT4kHgjS/hDDWoV4Ws=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bb12ee6-6bdb-4bf5-2063-08dbc3b8fbf2
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2023 02:32:27.5737
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB1631
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_194747_523639_12DF12CE 
X-CRM114-Status: GOOD (  13.53  )
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

CuWcqCAyMDIzLzEwLzIgMjA6MjIsIENvbm9yIERvb2xleSDlhpnpgZM6Cj4gSGV5LAo+Cj4gT24g
U2F0LCBTZXAgMzAsIDIwMjMgYXQgMDg6Mzk6MzJQTSArMDgwMCwgSmlzaGVuZyBaaGFuZyB3cm90
ZToKPj4gTWlsay1WIER1b1sxXSBib2FyZCBpcyBhbiBlbWJlZGRlZCBkZXZlbG9wbWVudCBwbGF0
Zm9ybSBiYXNlZCBvbiB0aGUKPj4gQ1YxODAwQlsyXSBjaGlwLiBBZGQgbWluaW1hbCBkZXZpY2Ug
dHJlZSBmaWxlcyBmb3IgdGhlIGRldmVsb3BtZW50IGJvYXJkLgo+PiBDdXJyZW50bHksIG5vdyBp
dCdzIHN1cHBvcnRlZCB0byBib290IHRvIGEgYmFzaWMgc2hlbGwuCj4+Cj4+IE5PVEU6IHRoaXMg
c2VyaWVzIGlzIGJhc2VkIG9uIHRoZSBTRzIwNDIgdXBzdHJlYW0gc2VyaWVzIGZvciB0aGUgdmVu
ZG9yCj4+IHByZWZpeCBhbmQgQVJDSF9TT1BIR08gb3B0aW9uLgo+Pgo+PiBMaW5rOiBodHRwczov
L21pbGt2LmlvL2R1byBbMV0KPj4gTGluazogaHR0cHM6Ly9lbi5zb3BoZ28uY29tL3Byb2R1Y3Qv
aW50cm9kdWNlL2N2MTgweEIuaHRtbCBbMl0KPj4gTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvbGludXgtcmlzY3YvY292ZXIuMTY5NTgwNDQxOC5naXQudW5pY29ybnh3QGdtYWlsLmNvbS8g
WzNdCj4gT3RoZXIgdGhhbiB0aGUgY29tbWVudCBJIGxlZnQsIHRoaXMgc2VlbXMgZmluZSB0byBt
ZS4gSSdkIGJlIGhhcHB5Cj4gZW5vdWdoIHRvIHBpY2sgdXAgdGhlIHByZS1yZXFzIGZyb20gdGhl
IG90aGVyIHNlcmllcyAmIHRoaXMgb25lIGlmIG9uZQo+IG9mIHRoZSBTb3BoZ28gbWFpbnRhaW5l
cnMgYWNrZWQgdGhlc2UgcGF0Y2hlcy4KCkNvbm9yLCBqdXN0IEZZSSwgc29waGdvIG1haW50YWlu
ZXJzIGFyZSBsb2NhdGVkIGluIENoaW5hLCBhbmQgdGhleSBhcmUgCmluIE5hdGlvbmFsIGhvbGlk
YXkgdmFjYXRpb24gdGhlc2UgZGF5cy4gSSB0aGluayB0aGV5IG1heSByZXBseSB0byAKZW1haWxz
IGxhdGVyIHRoaXMgd2Vla2VuZC4KClRoYW5rcywKCkNoZW4KCj4KPiBUaGFua3MsCj4gQ29ub3Iu
Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
