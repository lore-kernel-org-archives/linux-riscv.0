Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6917C61DE1
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Aug 2026 08:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KmX8DbcVI5SIHQYKHT/GCXGXcYbUuDQwFaQl7qg6o6Y=; b=1nN1d/BzghbMe9
	uDJIJquwFWxnb8XS2H07cdWGd4APNahQqrhIyy3X6fEMWV4r/Ywa0TP/xXAmnW7ri6UzRD6yePHFD
	ng89DpDR4hgC5byl2Wyoxufr30XW+t9J8UFwvY4uZ20PuNCOXP0i79Joa9FJbjlNdqRMka/GRms6g
	fM25vwAzBPNGzl5dEszibShzHfo9XmDelmlg6shBaprqcL2gN7HDzpu5K4uCjbCvrUu9mXLfUYSy4
	EMiIRjAe4Z9Qd/zxKhwuW4F0hK7AaiD+b9mtaCT1CKEaodnp6QnGZCjGVJymtIYnfbWyJgB3VH3Oj
	5DdvuX9oFEcsbuD2PPsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0bMY-00000007bz8-2g1Y;
	Sun, 30 Aug 2026 08:58:02 +0000
Received: from mail-bjschn02on2113.outbound.protection.partner.outlook.cn ([139.219.17.113] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0bMT-00000007byk-3EUD
	for linux-riscv@lists.infradead.org;
	Sun, 30 Aug 2026 08:58:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nRDombBI1900FTcv6a91v70+Rz75VYk7ihUe6tksTNv18LMuLPxahreT1VQprP5BSWaLcuUnIwbkvHMypwJf1U6vfnwkJXPNfNEE/XOkuZ3v1WnwaUrmmDue0MeAYF7LLBtcsSzJ3sPSIfLNcUr5TcvPHRt17HL8tJ71/kbbGQpVbVPnvt9UaVywZ4wEu4SMmXxN6qrgZgXvP643lVLr/bQ8qUDhvpjVEkQl1Z/KWWhoI/7i9QyJTYpgfjhhQNl1kdzY/Pq93KCAHUOyHqi6cflH29UF/2yuwsHJVi1Nc94SqwTM45DFUPBf+TbjLw1HZia7HT/BI+5VwFQJr3+5aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oBcL1CQujGmASYfR018xZc0b7M2A3wvMPHUFodigz70=;
 b=VKM2l0aSv3W4ZzazqA3CPsx46k2U8gXiguRMCrWP2gWppBANZUjK3axTX9JJoUEicoRHt5qId2Q1SwiVk88q9LPOLnDIbSHiFaDiaivvwObDIo9Jungyqc00q3WY0ZRov8mdsOTswQkX8NmgYDgJKArGjnJF0GZaYunZwRzfKF0JTHBtWPC69BP5LfUX40/aU+ug76fE2tXQmN8V2v/yelROgfkAXGVeZpcTedgRuPSGFHG1PwvOOUhfhusVQW6ULlXdp8ijdSI6GB66kqWDX0N+oEo0Ev5aAKSCfGCBEloBM9e4nt5lp9Ik3aa+QMrCQEB5NOX9VP6yqJ7TuqBnzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1219.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Sun, 30 Aug
 2026 08:57:24 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0315.011; Sun, 30 Aug 2026 08:57:24 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <pjw@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Palmer
 Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, Philipp Zabel
	<p.zabel@pengutronix.de>, Bartosz Golaszewski <brgl@kernel.org>
CC: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Lianfeng
 Ouyang <lianfeng.ouyang@starfivetech.com>
Subject: Re: [PATCH v6 03/21] dt-bindings: pinctrl: Add
 starfive,jhb100-sys0-pinctrl
Thread-Topic: [PATCH v6 03/21] dt-bindings: pinctrl: Add
 starfive,jhb100-sys0-pinctrl
Thread-Index: AQHdN2ImqvaIx8mSbUaeHyzzD+v1QLa0qs+AgAEkaZCAAHWtgIAAA1cAgAABZ4CAAAK9MA==
Date: Sun, 30 Aug 2026 08:57:24 +0000
Message-ID: <ZQ4PR01MB1202123864865439817E1549F2AA2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260829025720.23915-1-changhuang.liang@starfivetech.com>
 <20260829025720.23915-4-changhuang.liang@starfivetech.com>
 <f474f659-8234-4dfb-85cc-06d2cc295107@kernel.org>
 <ZQ4PR01MB1202DDBD0436E8F580EB6575F2AA2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <ac4c6b24-02c7-4dc3-89e4-45aa335255d3@kernel.org>
 <ZQ4PR01MB120205984FB23C0776BD0D0AF2AA2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <08c6dad7-8b0d-4daf-908e-5af875306f0f@kernel.org>
In-Reply-To: <08c6dad7-8b0d-4daf-908e-5af875306f0f@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1219:EE_
x-ms-office365-filtering-correlation-id: bfdab9bb-c993-44cc-9c5c-08df0674b5cf
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|366016|1800799024|23010399003|376014|22082099003|18002099003|10067099003|56012099006|38070700021|4143699003|921020;
x-microsoft-antispam-message-info: jG72j6N3cvgQC2VVwZS0gQI5czErSPoejmcgBJMamqRpItoSa05L6vIIGpk6iG2nXn+NFhHbDQv2CoRFKxyt7tXlpmuFbS6s35wTLcrV8ccy+U0p7aOO9p1q6ex8ZMb5j8kv51x4w2pCSWpSHsB6MxRTigDOqaxhsGi2jCzJL4Aab9XcJbaGiPTcsPSte7ZzDTE3e0EMqrgV3+PSihDAa39B/YkioAikKRe5TKpoluasMCiLyPNG+/MSySLwwzECGniPuVW8kxZK7SxjuxHVNrYg4yZvg4a0QknsDR8shQIEBVGPbBI8hdavUmUJiWL5k6VQwQ9TI3PZpTwGpNV4k10EV/3zyPKR/uUskAinnGPsMcHCT44wa8nNuHoekKIhCBoebXR5NDlRe6VikrGuQgodaNJ7k45NjgtSYSZ/RL8L3T7A4HJANL8gB6dY84HSnFZd/rHX/ALi25m7tyWRJbM6hR17KniOCZeqvWuxpzTg/YXZREXFRkiqoN8QIatEmAxD2iuiDdvRD6QVo8h2Zm/H2z8XwTr601a8gPQTczjxSniCbM95TtshNbc8BfPBOM/1w8NCUnSjYmMFVOFEGw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(23010399003)(376014)(22082099003)(18002099003)(10067099003)(56012099006)(38070700021)(4143699003)(921020);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K2VyUklTbThuTE5SZVM0VzBFKzV2dWZuc0k1SGFqNlFuVkFqVGwrMm5adzNq?=
 =?utf-8?B?TXN3Z0ZndUFtYnRBNlhCVmNJYWNoTmg5MTBtSjNsdmlGeFE1S3E0ZUFGbEVx?=
 =?utf-8?B?V0lESE9qbjI5U3FTWXdtSE0rdUxRSlRMbitDZVNoK1MyMzloMXhJam9Fdnp2?=
 =?utf-8?B?ZGdHTVNDYlNIS012aGM2SW1OS0U5R0hRODlPYzZPZHpWTVhnYWxyTnQ5VVh1?=
 =?utf-8?B?bkVyZnY2U216cVhPSnhnS3ZUMzRqY2V0QW4wTE92ZnlRVytLSkRVSXVkZmRB?=
 =?utf-8?B?VkNFZVZ1dENjMTJRY2ZYSlFCUHNkeUZSNlZNYTU4V01QckFZVmdPK1JjM2Z6?=
 =?utf-8?B?bkcxTmw4T05jb0VLZEk5VnBqY1htZXdGSzZKeUhBUlBUc0d2aHVUMkxOVzl5?=
 =?utf-8?B?Z3h2K2JHN0l6WHBrTUMzU0hQYXlkcVhxbkJCL0xvNm5ObHBDdDJRNTR3WHB2?=
 =?utf-8?B?MzFkL0hRVjh6NWh6M0owYTBaRHNSTktadlZvUllVOFVHTTQwbzQ0TmNLTS9D?=
 =?utf-8?B?Yy8xbzNDcDhWSGlQaXFScy9kNVlYVVJzaFY0eXU2Q2ZHb0ptckNhUnZ1cUdl?=
 =?utf-8?B?MFFBWHR0Q0Q2TGVHeHhhSHpZRloraGpZbzBoOE1UbjVJNW82eEdzYmVHWHcw?=
 =?utf-8?B?SnFhVENwNGgxMitVRUc4RkRkUnBWR29IWjJyOVIyVmVqRkFMdHQ3VmJMeWVs?=
 =?utf-8?B?dCtCc2VZNEEzYi83Z0JrVVBMaEh5bFdhSnNISHVCaHp3S1puekNHT2hUQjB3?=
 =?utf-8?B?TXN4WFpxZWt5OHh0Y3U5R1ZPc25PcWNJeUR3YXVQcktTNFRZWmY2aDcvbjlY?=
 =?utf-8?B?b0U4cGVGQkthZy94bDUvT1pvRGNkVlFIbUxDM25qRk44d0U2dEwrWHdrOTBL?=
 =?utf-8?B?SFNtYVdIdXRYTi9xSGwxaTJSUHdTclhob0dnRWNoSXVhOGFNdG9EZFllSlc5?=
 =?utf-8?B?L2tnTjF6MExhSUlUSFV2Q3lHbzBhY3FmR0Q0MzZzRTRXaU16MEFGZnZtay9r?=
 =?utf-8?B?c1JwYnRXWkxBbGkwRUUyMzNEdkhiQXRxeVU2Q3BhTVB4YmQrekN3QmJJUEZD?=
 =?utf-8?B?aEppdFZMcUJ0cFdNT3U4b2RxZjl5Qm0yallKQTk4dUFBREduY1FHUHVQY0Y5?=
 =?utf-8?B?eFo5dXRXQU9CUzJSK0JkRW05TDZMZXZtNE5sVzBicEpjVDNQVGFFblloMlky?=
 =?utf-8?B?WmdSTnQ5T3I4ZjBWYzNrNS9wSFMvV3lSS0kxSnJDVzIwbyszbkNhdWNjS3Ey?=
 =?utf-8?B?S0hwVVRETHovK0RXb01VcVp6b1pCV3lOR3dhNzcxTnBLQWRVcUVjblJ5T1Zw?=
 =?utf-8?B?U2pPbXVJRTd6bXZaT1BmWXhkbjFySmJ1a3BZdG5qc21ZMUFLMit3QVc0NTdN?=
 =?utf-8?B?NXNZNk9IOWgzVjJ1QTRWa25PZWxWZldjVzM5UXNncENGeWhnZnlScGVQVTFv?=
 =?utf-8?B?K1pjOHg0T1BQaUNYdk5aMlBtUXlCaHYzdVVZUmdacUZGeE9sdTJYeHFoRTZi?=
 =?utf-8?B?Y2ZrSGltTGUxZGUxTTV4ZU9Rd1Z0elJFallhRlovdllwMzhqK3dwY1JCNm5W?=
 =?utf-8?B?ZXpSUU56dkp3c2svS2E4cXRuWkhaY21pdUtEaHFuVXNzN0tXYjVHYWtUQ0FB?=
 =?utf-8?B?TER2MFVtNnVKa3VIRVUyWXczaTlSRmhLMU9BWkpHSkNrK3BGdTJCM3ZFbDJu?=
 =?utf-8?B?RE5hL0JXRDlTek84a0l1N2t5d20rY2pxOXpGbnI1TWxLanhUN1UveEt0eFM2?=
 =?utf-8?B?QWpIcU4vTmx5eXdiQVgwRkg0d0YxdUszbWg4WGpRa24yTVgzdGQyVWhsbytw?=
 =?utf-8?B?SXN4ZXVJWVdLNDZ2cFpYYVUyQ3oySVR3aVpBb0pHMlFSZEFKT1NVdmhqSkI3?=
 =?utf-8?B?RjBpVSszK2RQWm9ES1ltNG4zTWUwQ3FOMkFTZjFTNUtLK3VoMWZjMk83YVM0?=
 =?utf-8?B?aGIvRFBrRExXbzJVcmxLUW9EYlN4NFQ0Rk5iN1dDbmxxU1F3bjMrQXhKYmhH?=
 =?utf-8?B?bFBJaC9aZkcxMURYWVFRbVFaZmlIY1Q1OTNZU1JNcm92QXFHQnlyYUptZ3Z5?=
 =?utf-8?B?VkZxY2x2c2liOVBRL3QycVR2cXordUJCWVVkRHpxS1ZDeC8ySWI4U0gzSmZu?=
 =?utf-8?B?M1RxREhNb0tWeHR4OStvcDdKUnBvSDRDVUtmTGx0c1ZucEtMeGtYUGg2SGI3?=
 =?utf-8?B?c2RZMTJYM1A1eDZVR2JUYjAwallid0ovTlRMeWNYOHptcHF2Skh6UnZYTDVt?=
 =?utf-8?B?ZW1seFBvWEZ6S0o4eWRJWk9RMGt5ZG9qTW1oWEQvT2o0SnFjL1lBMGRCWUlx?=
 =?utf-8?B?cXR0QXJLOXJGcjIzQUN0WTkwVEVybXZNY29QNVdvWmR2ZTRDVEJoMkx0ckdl?=
 =?utf-8?Q?Nh4jvZN6Mjy4CyDU=3D?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: bfdab9bb-c993-44cc-9c5c-08df0674b5cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2026 08:57:24.5401
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7fAgVtB8fpAytVR6v73/XPcIcFcusBBDK5Pvadgq91FfCA6IR6GTFzFQX7rMhp23dvvnx/K0XSzyajpmRlcmdtaxPf2NuPwH38kq5AQB/ykJeWW66avXw18slTVmutuq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1219
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_015757_816868_5DAEF08D 
X-CRM114-Status: GOOD (  25.62  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi, Krzysztof

Thanks for the review.

> On 30/08/2026 10:42, Changhuang Liang wrote:
> > Hi, Krzysztof
> >
> > Thanks for the review.
> >
> >> On 30/08/2026 03:29, Changhuang Liang wrote:
> >>> Hi, Krzysztof
> >>>
> >>> Thanks for the review.
> >>>
> >>>> On 29/08/2026 04:57, Changhuang Liang wrote:
> >>>>> +#ifndef __DT_BINDINGS_PINCTRL_STARFIVE_JHB100_H__
> >>>>> +#define __DT_BINDINGS_PINCTRL_STARFIVE_JHB100_H__
> >>>>> +
> >>>>> +/* sys0 pad numbers */
> >>>>> +#define PADNUM_SYS0_GPIO_A0				0
> >>>>> +#define PADNUM_SYS0_GPIO_A1				1
> >>>>> +#define PADNUM_SYS0_GPIO_A2				2
> >>>>> +#define PADNUM_SYS0_GPIO_A3				3
> >>>>
> >>>> I could not find how your driver uses these, so are you sure it's a
> >>>> binding constant for the SW?
> >>>
> >>> Yes, these are not used in the driver, but in PATCH 6/8/10/12, etc.,
> >>> some definitions for other GPIOs are still used. Therefore, I have
> >>> uniformly defined them in the binding, and they will be provided to
> >>> the
> >> device tree for use later.
> >>
> >> I am confused. The driver in these patches 6/8/10/12 does include the
> >> header but does not use them. Why do you include unused headers? Or
> >> what is exactly the use?
> >
> > I'm sorry, I missed one thing. Actually, the current patches
> 4/6/8/10/12/14/16/18/20 all use this:
> >
> > For example, in patch 4:
> >
> > static const struct jhb100_pinctrl_func_maps jhb100_func_maps_sys0[] = {
> > 	{ .func = "auxpwrgood",		.val = 1 },
> > 	{ .func = "gpio",		.val = 0,
> > 	  .max_pin =
> JHB100_FUNC_MAPS_MAX_PIN(PADNUM_SYS0_GPIO_A2) },
> > 	{ .func = "gpio",		.val = 1,
> > 	  .max_pin =
> JHB100_FUNC_MAPS_MAX_PIN(PADNUM_SYS0_GPIO_A3) },
> > 	{ .func = "hbled",		.val = 1 },
> > 	{ .func = "pe2rst_out",		.val = 0 },
> > };
> >
> > These definitions are used in `struct jhb100_pinctrl_func_maps` or `struct
> pinvref_desc`.
> 
> OK, I was looking for PADNUM_SYS0_GPIO_A0.
> 
> Why do you need unused constants? The constants in binding headers are
> interface between DTS and drivers, not hardware values. You do not need to
> store there hardware values, so what is the benefit of defining
> PADNUM_SYS0_GPIO_A0? Why can't PADNUM_SYS0_GPIO_A2 start at index
> 0?

Here, it is also provided for use by the device tree later. For example:

	auxpowergood0_pins: auxpowergood0-grp {
		auxpowergood0-pins {
			pins = <PADNUM_SYS0_GPIO_A0>;
			function = "auxpwrgood";
			input-enable;
		};
	};

	auxpowergood1_pins: auxpowergood1-grp {
		auxpowergood1-pins {
			pins = <PADNUM_SYS0_GPIO_A1>;
			function = "auxpwrgood";
			input-enable;
		};
	};

The pins property corresponds to the specific GPIO offset, so PADNUM_SYS0_GPIO_A2 cannot start at index 0.

Best Regards,
Changhuang
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
