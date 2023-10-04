Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80812E8FDD0
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 06:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eI3yJDNtDcDywuskGZGke3+5qSNNCwKxxlC31MYXO/I=; b=G3qPMpaHDbLWqMq7xuzMSq3oeW
	nNaw6t2/nheoZjX926B99z2NVApAhTPbPXrRkkEhD5H44wx+BTpJytcD0JqvN6N4iw0QthhWnR9M2
	hEGgL7sY3ipQA4swSGXKVwl7JpXhf47MY5NAnyEynZCehQV3zkYCp/AjNbBvGmdnBzganXbCedI4r
	3yhvUxgQ6vQKjCYVYIib96LQV/PXgms2X805BEMLHtI7S5v5TDpXhDmbKDJupZRnp32lVwlwoYum2
	rjaIjjZ+8JYqt9UjQB2WtPWMNqgd07+wFPhbuEXjiwJ7H9uK0KcBys5ZI3mbJfFaaIL4O4oq4R5X5
	YCWIjabA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnvYd-00GRyp-1O;
	Wed, 04 Oct 2023 06:40:31 +0000
Received: from mail-maxind01olkn20828.outbound.protection.outlook.com ([2a01:111:f403:700f::828] helo=IND01-MAX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnvYZ-00GRvp-03
	for linux-riscv@lists.infradead.org;
	Wed, 04 Oct 2023 06:40:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WQ4AameLadOLiWzafHK69ECjYnoeWzUFCOsJo9DfOZgSPGE3eRXzz/qrDJ0CsiBznXUiC1k++Z8yt41f56AbqaB4iGcnFAT5cDGjVoWzsm+GaYHNDyEhOiFEFAuKZLSdIjzJqR7sC59H5dvCi7EUlzWczxV5YfLvk/NH6uby0sZfjLWV0VXyZpD1OxDqr6w5Banb7Ht3+iYgaldzq2jJbwlsJvxdLGPvEu+selwVKjrK1VVHJPd9tGimpgbBipeiwSkSM9S8chRYRkk8AWTnIc2lqcz7L4PkDqwBlEqOMayQ4GNkOotjVJITjdV3vG0XC4ifsqVqKyVx6IIUOOGl/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FkQNKlH9KweLWDtYFWaWJPJlhMUJIAvKHRSYWoLZYbM=;
 b=CLJo15FSNxj8rz0nkMeVAJuZiPLWJJVmHYNh0tGDSHJeDYIdYvm7oMxEKKe4Rbz7o5bZ6hpVYVmzCQJYV7dxD+66iWW4QQfrVmGkMhewlTo7XIEeHzIxA6xcwhrkFiPD6TC4/pt1xB7F7PnK9oKPoyOMKZgzscV6DfAONgkAWFpduy+OKHgXw16cC+F4RdMbb+buys4QvKB5bEjhYZCuvT+q6XZr2pPihdbEMKkKZYeRF8kbYNBf37rV55R5m0aPXdUvZ8IauHt2rGuEDwmjaFArWJszVJf8wpwFZQEWQukg+39JptgNOh1G3DuJTAThwDZh/L80hroYt9GNLFDNJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FkQNKlH9KweLWDtYFWaWJPJlhMUJIAvKHRSYWoLZYbM=;
 b=TDjAqMu87GQxQkMsiYTJr8IgIfZIDdB5BPjy72vVbXXPh/fqV/psjYzfTl26l230ig7EY6Ff8vvOQipDVCiqLp3P6I7oFzqYtxnkzA+ZmrcPUNVjUW27A6BQXbz0jQewEVQ25OMB6021WgyJcLAquJF1eTXTja0CkdhAAicARAIfhv5WW+N+lznYzrzuJiGwTw2PGypQbFTzdithbqPIDfo1IQrWP6eo/JDN7+t0Cp7ZzTjEyvDNhBjlN14HLllZbi+O6lPEERUS9YI7LoaawiB+a/cMaNeB9r/Y3RE3noyUGVoo/yLeU4zGGiP6Lp38enLA3ALb85ja46ArcGXhpw==
Received: from MA0P287MB0332.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:ab::5) by
 MA0P287MB2263.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:100::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.35; Wed, 4 Oct 2023 06:40:09 +0000
Received: from MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
 ([fe80::efe9:8d54:281b:23f7]) by MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
 ([fe80::efe9:8d54:281b:23f7%3]) with mapi id 15.20.6838.028; Wed, 4 Oct 2023
 06:40:09 +0000
Message-ID: <MA0P287MB03329C86ACF8DE0610997FE0FECBA@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
Date: Wed, 4 Oct 2023 14:40:04 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] dt-bindings: riscv: Add Milk-V Duo board compatibles
To: Jisheng Zhang <jszhang@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Anup Patel <anup@brainfault.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, Inochi Amaoto <inochiama@outlook.com>,
 chao.wei@sophgo.com, xiaoguang.xing@sophgo.com
References: <20230930123937.1551-1-jszhang@kernel.org>
 <20230930123937.1551-4-jszhang@kernel.org>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20230930123937.1551-4-jszhang@kernel.org>
X-TMN: [HGqkbiE+mXm0MJZkX3+YozVKNwAWsIvp]
X-ClientProxiedBy: SG2PR06CA0247.apcprd06.prod.outlook.com
 (2603:1096:4:ac::31) To MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:ab::5)
X-Microsoft-Original-Message-ID: <55b701f8-e272-4107-8cfc-195bef51d861@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB0332:EE_|MA0P287MB2263:EE_
X-MS-Office365-Filtering-Correlation-Id: b17ced44-133f-4696-5a0f-08dbc4a4c0eb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8VjV5QIG3PQWv1HnVRB7Ts8UwaxmpnbxREMQWsrYnCc8vQh4vaq4DJ9GCM9ufJov6mkZ24UEY1Lq7JRnySiXxtxWXIRVbiEY2OXwjqaKrsUmKhPQwfPuTH1U72YFM7Je+fpQ79syhercvHxc6dAU+UZJjeboR4CCpxDVyEQ30WS8mrHpfNTsk5meefu9oo0OzL13FR4M5aUpV/k18/8Qeypi5opvGC7XgjsGZFA4LUPnxkMGGPgenhgv+oDW5MHO8rGTJJL8CNjPjA1l9T4UmrVmM5coEcpL7+RG0l6ctF/Vnvd+tkrhnsDDH8AY1fDDGV8EBZzTwM2xpOqFRNd4DteJ9M2ZSDr4PkseGbzx6An5AkQ0DZr6nXRQJhHeFE1gQjPKXhpu+cqd9UV6+Q5xP4+vul3EJi0DPSSQhILbSFFpoRb8pGGf0xnv2WXJxp/IfTR5j5Itn8VJ/fZGz1TgJWA1LE/ibcR4UE3+JmfN90gTj2DiAE4ZQU8qv7WqvQTkO0HOp/MgZh4HRAWPenu71++CbjXEXSzEq99rsqS3yZjRCB/VKw7iMxDiqp0ySOtEOsL9OrfXkoNlqOw7vgN2pDz913xsDGVrSkaGKh9ibSg=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V1VnUUNQMGplcytmK3VONVF6WG50MlQyNFcwVzcrRnp5MFBBVlRxZWdyMENl?=
 =?utf-8?B?cFVISGMrTHBoVjdWSjAzZlduWkhkS09iNjZPaTlEVW9abXZvU1VNRUE0dTdm?=
 =?utf-8?B?TEE4aDltM1VwRHo3TUg2cHRhVlVia2hPYjhodDdqdERxamFXdHVwV1RiWFh3?=
 =?utf-8?B?b1V2dm10K3dUVFJLWHh2Y01JUFRKTGJXbUVOM0d4MG5vN0VQTitEY1ZudEIz?=
 =?utf-8?B?eHpZTDlEQTNSTXhBMG1qYXY4THkrMi95WTNZMXRvM2VFclB6d1c4ZWRmaXhm?=
 =?utf-8?B?OXJ5cFFkNTh2cXRvN0p3c2NKNFhhQXlINS8wWDBJd0IwZ3JHWDVKS1FyZExU?=
 =?utf-8?B?ZzNsbVZzZEN2U1lGSFdrTWorQU80c2cwSU81blo1N2NpYysxTEhjend2Ykdl?=
 =?utf-8?B?Mk1iZjc4d3laeEZvVEV0R1hpL25pY0ExNmNBMVAwelVWWGsrQm9jUVdYRmZW?=
 =?utf-8?B?bm1QSnJHdG4xRjByOXNxVy8yM0w4Tk9lOXFObnVSMi9aYWlLbmk4d0Z5OXVY?=
 =?utf-8?B?dXhRSGNaZktFN3hsYjhPNUs4ZEdOR2VVZFZUN1llY050YmFBOVlSeTZteCtp?=
 =?utf-8?B?dlZSTlQ2QUVOaXZxRFkxYkR0Y3hyTTg4WWU2M2NPVXhqSnpseGpkV0xoVldF?=
 =?utf-8?B?dStIY0xSaXZyZHo4MVBOaFd6M1NPc0trcjU3YVFrUlFOZ3lYbkFIOTNINkpM?=
 =?utf-8?B?R2ZCVE1peVVqTU5RZW1vdW9NMDZaM09aMHRNazg0ak43bUtRTVZWNElKaitV?=
 =?utf-8?B?Q0F1eXkzWmxJL1NaUXdEeFhqditXTUpXY0Zadnl6NjJkNXArTFExcXUyQktm?=
 =?utf-8?B?YVZzOFdPTEZnTmlUTWIrZGRXbnRISHNzSjFORm1NcGJTTGMycXhQZUpUb3lk?=
 =?utf-8?B?MGJ1OEhnTzdXUzlhdzVPU1NFRzg0RGkzNDRycXpNQmg0ZEZlN2E0R2tGS0U0?=
 =?utf-8?B?cVR5VHBsMG93M0dZVXZYT2NpNVl6YTI0TUdMdCtBTkwvTUZSWUM4cDBHUjZT?=
 =?utf-8?B?Umt2ZEtER2FoUTBUcnZDdjZpSVlkemNzVVkxRWtneWkreHI2NUNnamVkcnZr?=
 =?utf-8?B?Z01Tc3Z6djRGSkcxaitIR3V0dXczWEx1NkxyMEY0cWx5dFFLK0YwakNxUk1S?=
 =?utf-8?B?NmJuc1Q4Z3pBamJheS9RUTN4VlQzUG9ONEZpOWpYdXJRbDlWNExzWlpHN25W?=
 =?utf-8?B?VEc1L3BGZjNiWEdWTk1kNERGY1Fnd0E4SlFwTEhSRE1sQndLQUp4OEExaVdm?=
 =?utf-8?B?SUQvSjU2MXhJbmdsT01ubVA2UmllN2NRR0JnSE1XQ3JEb01OREtCbEhiQ2VN?=
 =?utf-8?B?RG12bUoxQzhSTXkwa2c0bU9MSHJrK2I0VXV2Y2ZYdE80QkVZbzlyZGV0NGIw?=
 =?utf-8?B?b2d5Zm11TjhFZlVwc0xJNXNrMXJlNGswcU5zZUF2d1lCVzJ3NFpoaEtxa2xs?=
 =?utf-8?B?M1dKejRuWEYzbGpQeHZiVjc2d3NqdlZKbnBBSlA5cjl3YXBqN21pd3FQN0pT?=
 =?utf-8?B?ZXYyQzZ1eG5PcG8xMXV2TWxyMjJ0bUJoTEVjS3dVVGEwQStlNVY1YndRT1lP?=
 =?utf-8?B?aWpmSDYvNERBMkNyakJrcmZkclhidTdXM3VYVjl2YUNpd0h5ckpIdVE1Zmxx?=
 =?utf-8?Q?j4YaBVGf2S4RaYgCAXTVeokkjCnB1j3XxVXGEUIdsgHo=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b17ced44-133f-4696-5a0f-08dbc4a4c0eb
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 06:40:09.7378
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB2263
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_234027_080495_BA01130A 
X-CRM114-Status: GOOD (  10.58  )
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

CuWcqCAyMDIzLzkvMzAgMjA6MzksIEppc2hlbmcgWmhhbmcg5YaZ6YGTOgo+IERvY3VtZW50IHRo
ZSBjb21wYXRpYmxlIHN0cmluZ3MgZm9yIHRoZSBNaWxrLVYgRHVvIGJvYXJkWzFdIHdoaWNoIHVz
ZXMKPiB0aGUgU09QSEdPIENWMTgwMEIgU29DWzJdLgo+Cj4gTGluazogaHR0cHM6Ly9taWxrdi5p
by9kdW8gWzFdCj4gTGluazogaHR0cHM6Ly9lbi5zb3BoZ28uY29tL3Byb2R1Y3QvaW50cm9kdWNl
L2N2MTgweEIuaHRtbCBbMl0KPiBTaWduZWQtb2ZmLWJ5OiBKaXNoZW5nIFpoYW5nIDxqc3poYW5n
QGtlcm5lbC5vcmc+Cj4gLS0tCj4gICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
cmlzY3Yvc29waGdvLnlhbWwgfCA0ICsrKysKPiAgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlv
bnMoKykKPgo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
cmlzY3Yvc29waGdvLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvcmlz
Y3Yvc29waGdvLnlhbWwKPiBpbmRleCA0ZThmZDNjNmE2ZmYuLjZkYjI0MWM5ZDAwYyAxMDA2NDQK
PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3Yvc29waGdvLnlh
bWwKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3Yvc29waGdv
LnlhbWwKPiBAQCAtMTgsNiArMTgsMTAgQEAgcHJvcGVydGllczoKPiAgICAgICBjb25zdDogJy8n
Cj4gICAgIGNvbXBhdGlibGU6Cj4gICAgICAgb25lT2Y6Cj4gKyAgICAgIC0gaXRlbXM6Cj4gKyAg
ICAgICAgICAtIGVudW06Cj4gKyAgICAgICAgICAgICAgLSBtaWxrdixkdW8KPiArICAgICAgICAg
IC0gY29uc3Q6IHNvcGhnbyxjdjE4MDBiCj4gICAgICAgICAtIGl0ZW1zOgo+ICAgICAgICAgICAg
IC0gZW51bToKPiAgICAgICAgICAgICAgICAgLSBtaWxrdixwaW9uZWVyCkFja2VkLWJ5OiBDaGVu
IFdhbmcgPHVuaWNvcm5fd2FuZ0BvdXRsb29rLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
