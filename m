Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA33EC61DE1
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Aug 2026 08:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K9u+kySKNYuimQfOM91sBMlaKxWzgCTVSgQp8z1+jb8=; b=nQsIT7XOPUa6ym
	3Pv+Xj5SxxWMKlWx5VHIruH4YrhIM9Rp5o6MEuwrI2xMhX4hhP/cos+3Awk0O4VhGHFT5dl9bjj7d
	LsI+QVblYiVpebg/TrN4nNnblqbDAMOYfWc3mWkBV4ixvRohxDSwVM/iTDoR7jbPCbt2oXGfsuWB7
	Hj8ig6iY8VvKMvzuPOchprzeQuMrUhzJy6njK36kdWT1flbA/WR3fkBkPdqWKXr2NztPsMrVhfxli
	2PVEMnXpa9rO13Qge7ie2LRbuu3KCvCDqbwb+qIcmD06UQLngrP/kuskbMa89P7xr+mbgQG5PpO9J
	wr0yhnKvxakjVofrcimw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0b7u-00000007bVF-15Lg;
	Sun, 30 Aug 2026 08:42:54 +0000
Received: from mail-bjschn02on20730.outbound.protection.partner.outlook.cn ([2406:e500:4440:2::730] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0b7q-00000007bUr-2GsY
	for linux-riscv@lists.infradead.org;
	Sun, 30 Aug 2026 08:42:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TBd03nGo81AIFFP66zu6gB9SKnPd73VnGH3LF1th2vQQhX0ZyUB/xAxpDdYzaz7CAldOFE/p1gQXrX52/TCPEU+eBolEdA3Hehb7ezeO4mGO9HdSbUpdpUz3FZdBDlB7ozQmIz8wBlXpAJLQjka4+H49//w/Nq0usknLDUCSVVohbAOc5P2u8UsCX0NP7Id/HjLPueRi9nSOdRpg8HeLCcLOopm16sFaYZEsvWKL6CJzSCo5A3EYd+O34xdqDgpDBh26GeOjpPGcqBMxFhtwHej0gGZ+/6iztGYw8ghaH2e5mDRF3N/RJGGhV2j9PSvYooyQkIbgqsXxG+thUfP3CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WdJ1HIYzM+nzrVH7q9w8TynHhhT832P/rRinNaL4FcU=;
 b=ExbYR6OyN2lHUs0N7vNegA9Djam2Pl1Qof88yXZDcLUqG2u6nBe75ovfllmHa3AwDlHl0VOug8hwDtyMzVepzZoThkKrGyv+lwMwwcaUTLf+BYX1CEGptjUq4Rz0O34wTbr4MuwuSK6QQundu1k/cnCJnn1Qc61ky1qQbvsq+6HN/wuHnhUbjUiqe+KuPcuVLWNhCUiyC8JG/dED3Oz/+O9CUpRnhtaGBOoZJiM2DaiZsoouQNbtxCXqAL+gDUbB7iO3yjOJ+FwuC6e2JGC0HeHUo7EoHwCPu6txLWDY9IDpNdTs1Nq+nulrHTn07YUIT2NxAa+GtvZaBeOnDfKcIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1267.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Sun, 30 Aug
 2026 08:42:35 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0315.011; Sun, 30 Aug 2026 08:42:34 +0000
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
Thread-Index: AQHdN2ImqvaIx8mSbUaeHyzzD+v1QLa0qs+AgAEkaZCAAHWtgIAAA1cA
Date: Sun, 30 Aug 2026 08:42:34 +0000
Message-ID: <ZQ4PR01MB120205984FB23C0776BD0D0AF2AA2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260829025720.23915-1-changhuang.liang@starfivetech.com>
 <20260829025720.23915-4-changhuang.liang@starfivetech.com>
 <f474f659-8234-4dfb-85cc-06d2cc295107@kernel.org>
 <ZQ4PR01MB1202DDBD0436E8F580EB6575F2AA2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <ac4c6b24-02c7-4dc3-89e4-45aa335255d3@kernel.org>
In-Reply-To: <ac4c6b24-02c7-4dc3-89e4-45aa335255d3@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1267:EE_
x-ms-office365-filtering-correlation-id: cf752893-5080-4073-deb3-08df0672a363
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|23010399003|376014|1800799024|366016|4143699003|10067099003|38070700021|921020|22082099003|18002099003|56012099006;
x-microsoft-antispam-message-info: zfQisy5mqxyroxg4UtkkrBU4Dq8x0zDjx31V96LIUdjoORbiqi9UI7FQCdzc6yoc6YZlSQarNmsnOakvshF6plpJZpmOiLZsGSq+cyatUufqYCZZtgOKPZX1EyRfb/Ppidgj386LVLEDM8MxGuINScO4dFOqypH1UDADE4LTphCHQE7Q1fmqFc/CtiNbuxLjs6ula42QaIinWs9SUhX7P7iEKMfIj8s6qTjlGvXJQHbiBkcWrgSpeUvf8GH4eHFYv06/OM6XJR0NPRBiue+JzgsqA7QhHhykhjh2NhKhHy8b3UIpF3NlRQhqzMJ8PJ7mVQgng5lhhThdhp4sSAiP/lwGdgnL0fWtjydK48IMWwGCr34JhfPpvSaWTdd0EAmwBydzBnZ3Yqoykb9P+yR49o79TcGEJYfZWnpz7ucJ+30gIizIDAIRiHf9XwqBzjBwvzn6cfA0dlpGTXEPnXX7S8onFwxGOImfRy+nEpVAWzPSURtLgyOvCXyI9C8cTQY2qlpbbB0K+MPy0j84X9EDTMFFNwGUG8eOpehvctudeb4EhSvWbxWZJgd1jhTun0FG4bW5jLYUKeaaueHa7G0ZXg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(1800799024)(366016)(4143699003)(10067099003)(38070700021)(921020)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZHdiMFNwNXpjY2FjQm40Vk9SS1lBU3VDVldGRVovMXNrYTBsZTd4cExyekFQ?=
 =?utf-8?B?djFhNnFSclVHK3B1dDVlUW9MVSs4SG9wMUpZWWJpNUxFYndJZE1MaXJvbkFM?=
 =?utf-8?B?a2xBWGlzWmJtMUY2ZUk0aE9jaEV0Z0o5c1hBK2ZMTUl1QVVPVFNSeVpSWkQ0?=
 =?utf-8?B?ak56b3ViYVh5c0Q2RG00c3VqZkNBR3VLb3RoaU92WHA4RHU4Y1JZZmE1d1Vt?=
 =?utf-8?B?a0dvMXZXN29acnlmSUl5UWJ5eFFDaDBjeWlpbDQwQi9HaGdzekp3TzAvcHRr?=
 =?utf-8?B?aGY3eC9hT1Z6OEljbXlZQzRlRW1lNlVQRGxIb2YrWVQ2V2UyMWlHM0lBWVht?=
 =?utf-8?B?dWhEM0Rub2w4SERFNHdUYlhDemFkSFVNSWVmWnowVXVweFdxMjhvTVJrc0p5?=
 =?utf-8?B?SVJITWY2VzJjTmVKdXlHVFdxVlVoMW5PdTVEczE2TXNiUW1OM0JMTU1pQXdY?=
 =?utf-8?B?dXg2dElPK3hnaDJ3T1JGUTB0Q1hZM1A2bWExK3M5Zys2dEd0akZaNEt4MmZw?=
 =?utf-8?B?aklpVmNNRnJxelVMSmNJazZldjAyS1l3MnBPNk1nUE9uUnZybmxxNjE3MThK?=
 =?utf-8?B?WEZ1U0IveWRXQXg1Q1ZUWHF0YVRtVDl6T1pOaVlzc0R3cEY0MGl2UjZ5Tjhp?=
 =?utf-8?B?N2xyY2pvcmdLa29HTk42QURhSXh6cGhwek5HSStHb3JKZXVTQXRFQjRsRUFW?=
 =?utf-8?B?alE4S1FyWlJpdURzWjRBOXJOeUhweXJ6MGVuWTU0azFYSFFIeEo0OUFuTVl6?=
 =?utf-8?B?WU9KWXJVT0V5dGM4Y0twNXc3Z3luRFFIdUs5a0t2blVCMGhRZWswYXhyZ1RJ?=
 =?utf-8?B?Z1Z6ZVdHZTBSK2NEd2dPT2pxS2Vocmo4UXdFeE5xM0x3dWN1aCtWUTNCQ0x6?=
 =?utf-8?B?bWxkR0x4MDlZb3hJSk5HSWQ3b1ZGMytMSkt2eisxMnVhMnNkbGQwR0FrcVRD?=
 =?utf-8?B?WUkrRlhOK2toU2psSWlJbUxEbnNFYnBUT0lrOG1mWWpoeHJGZlRQSmhHQ0hj?=
 =?utf-8?B?NFgrZFdNWStpQURWWnJmUFhEQS9TMWRxMWxZR2x1cThVSmVoYWNudG9PaWJu?=
 =?utf-8?B?OXUxYXpRYVpYSm5jU28yRG9uSkl1RHJMY0p2R3VTYnprNUpySUFzUkQyckgy?=
 =?utf-8?B?N0lUeWxlL1hRWFI4OEVhWWd5RW9KVm9ER2FFUEdtS3ZEQmhPTEozN29UTVk3?=
 =?utf-8?B?aHpZcFVUVGphZVVQaWRLd1FXYTlCRGNLOWVXRjIxUFExa2xEb1dUZ3Rmc0dr?=
 =?utf-8?B?S0kvUCt6eFlWaGh2a1VPUU41bStkTDZHWTViSDZaOHlIV2VVdTNRckRuTTlh?=
 =?utf-8?B?OVpMTkwxNHhLTzhBTkFZd1VlcU9CUnQ3RlBnS3p4dzZ5WFVpZU42ak1UUHlS?=
 =?utf-8?B?YXpzTnd3UVViZnNZNUw1TFpWalplb0dXb1FEM1hUYk1yYkZCM08yL01Hd25I?=
 =?utf-8?B?RXc4cStxYjcyblNSalNFWmt6dWJ3aVF2MnpKQnJmSkoxV25meDVWZTZmRlIr?=
 =?utf-8?B?VW81MkFMYmZweWtYS0x3aXpHTDg0WE5FblBreTEybWlSMTVBdlNLcS9aZEd5?=
 =?utf-8?B?ZzhEU0V6b2VqbWYxVFQ2ZEgrN2ZzRWhsd0lSbXBPKythbHNRTGFRRDRMY3No?=
 =?utf-8?B?allMUmZDWjJPeGFBSXRjT2ZweUZQRUNHbGJDaXlGQWFmbU1WdmZmdm1taHBo?=
 =?utf-8?B?eExENDdZQjBPaFBqMTBDb0h6L04xT3NhM3hsTURTUGdEcEFRNXJsU1hjUy9C?=
 =?utf-8?B?cnhTQVpUdHVyQ2l0UWpUbnhLbFF3TEF4RUZGalhXYk52Q0tONmd0Y1pzVGhG?=
 =?utf-8?B?NXJRdy9QYTBidFNXWlN0c05kY0RJVWxleEpoT0ZqdWtScE44bzhqUVgremZ1?=
 =?utf-8?B?SThTWVJHbTFPR3RXU25zZFZoaGVlK2l4ZWxzVjVYVXM3WHdWaXBUY2diQ21o?=
 =?utf-8?B?WlNmYXR3YTI3ekxINVJuMTEyMlgwNGltV0xDZmJOUUhJL3p6YmVSMDZrTGRQ?=
 =?utf-8?B?bTgxME9MUGhldnpKZFJGZEZMZDJ5SnQyNnAycjhYTk5UMGhVR0d2aUs4UTl1?=
 =?utf-8?B?M3pQd0xRdGJhYWxvVWhnNkJXZmZtNFdsclZBU2NWMWh6QSsvRjJWeUViNVYz?=
 =?utf-8?B?bnRhMkdybEhQa0Rpb1MvTXNSRmpZbXRscUZwWERDb1VqRnpnd2szVGhoTzlE?=
 =?utf-8?B?VGhiWDZRWWpiY04ySWZrSWx6WWFPa0xianRvT0dtYURBWm5WQUFaZUw4T1By?=
 =?utf-8?B?MGV3cVZyUnNlMkRMT1R4RWpDdXpUNFVJNExiZDdVaytKeTEyTGZOWXlHVUlv?=
 =?utf-8?B?NWswc3RweG9Ka0l0Nk04MVRCZStIUHFYbkNTaEZiSWJ3WG5OMmtISStHUW50?=
 =?utf-8?Q?3ueyNxFIeITEGCVM=3D?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: cf752893-5080-4073-deb3-08df0672a363
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2026 08:42:34.6698
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LOFLop2djNuylBpN+j3zhRRqE/xcsAUrBdR/KVJ/zmIKdKcDPM9QFPm0ByTt1+rPtcpCjytKz41fUuP021z73WsEB61fBEmGmA7ke+8YZ9cQc0rISjNZTPkiaoEF0dY0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1267
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_014250_604378_6353F790 
X-CRM114-Status: GOOD (  19.23  )
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

> On 30/08/2026 03:29, Changhuang Liang wrote:
> > Hi, Krzysztof
> >
> > Thanks for the review.
> >
> >> On 29/08/2026 04:57, Changhuang Liang wrote:
> >>> +#ifndef __DT_BINDINGS_PINCTRL_STARFIVE_JHB100_H__
> >>> +#define __DT_BINDINGS_PINCTRL_STARFIVE_JHB100_H__
> >>> +
> >>> +/* sys0 pad numbers */
> >>> +#define PADNUM_SYS0_GPIO_A0				0
> >>> +#define PADNUM_SYS0_GPIO_A1				1
> >>> +#define PADNUM_SYS0_GPIO_A2				2
> >>> +#define PADNUM_SYS0_GPIO_A3				3
> >>
> >> I could not find how your driver uses these, so are you sure it's a
> >> binding constant for the SW?
> >
> > Yes, these are not used in the driver, but in PATCH 6/8/10/12, etc.,
> > some definitions for other GPIOs are still used. Therefore, I have
> > uniformly defined them in the binding, and they will be provided to the
> device tree for use later.
> 
> I am confused. The driver in these patches 6/8/10/12 does include the header
> but does not use them. Why do you include unused headers? Or what is
> exactly the use?

I'm sorry, I missed one thing. Actually, the current patches 4/6/8/10/12/14/16/18/20 all use this:

For example, in patch 4:

static const struct jhb100_pinctrl_func_maps jhb100_func_maps_sys0[] = {
	{ .func = "auxpwrgood",		.val = 1 },
	{ .func = "gpio",		.val = 0,
	  .max_pin = JHB100_FUNC_MAPS_MAX_PIN(PADNUM_SYS0_GPIO_A2) },
	{ .func = "gpio",		.val = 1,
	  .max_pin = JHB100_FUNC_MAPS_MAX_PIN(PADNUM_SYS0_GPIO_A3) },
	{ .func = "hbled",		.val = 1 },
	{ .func = "pe2rst_out",		.val = 0 },
};

These definitions are used in `struct jhb100_pinctrl_func_maps` or `struct pinvref_desc`.

Best Regards,
Changhuang

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
