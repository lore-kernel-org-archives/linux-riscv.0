Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0D16CC6B19
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Oct 2026 03:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CRE3Ayz8KKkRS+3xHdHreuAlX9MyECCP/Ph8G6gAuds=; b=zyoJ7KLzI460aV
	2W99Wc3JmC+thNojAl2GjiB8veeBRb3cTMIdLiooPbLYP+8cvVhTUXqPLEekGSIp3nai5GauRhzdg
	huRviXaiaLW/UOwPIjzZMUx87c8De571/AfEHSd/y3uJdxwKo5m1tC/WimXxjz567MDLwzK5qymAv
	5EB+EKvthE00e/zM//BtlkKTI9scUiNUnMsvHz5wsOzgao7aqfaPpKiq7YX2AIV4Sx0ydlMAOVbd1
	ZkALae0jrt2PwjZz4yzZCvSDgHya439EBBLHG1F3h6Y5m9CRC9nDHf8fA3Z3qQbZh7eyijBJVOggV
	248UmvNrDiQjh4U5iQSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGpTp-0000000EQ8L-0JCk;
	Wed, 14 Oct 2026 03:16:37 +0000
Received: from mail-sh0chn02on2095.outbound.protection.partner.outlook.cn ([139.219.146.95] helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGpTj-0000000EQ7p-0rFI
	for linux-riscv@lists.infradead.org;
	Wed, 14 Oct 2026 03:16:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MBHKbxoZ8MKyx8t2IIPPrzZ5viCKyh2H+jtDFDY5hV7ub6JFJuKszeLtowYP3sI8buzjk9UoRpROaTtVgc86uTAP8voe7px33ugbgyZxzHcYDFE6C+eRvBZFrDZij9eB7BVVLHFz4U4Qz6Hr1nqNpKbnxjuyhQqMCksmBPxeSzVV/fyad7Bh+QjC4/Yn8tOTWtRzY0GdMUAD2V+bSARh+QKWaBQbv+vB6XE1lIOHBqprNanAcBOr85MekDtF+CQEcH7aJRlZMp7M/bdKZdxG/v9Ocrmwgfw6IZYjEpLxm7DXUnbe2vZMSnX7EDY+7Rw5q42aKAe7pWgZLx5bEtReaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L9BKYRgytyLAI6aAh4ayEyLeVwIuzKAlK9CQXkjyomo=;
 b=B77XTFBSwecAnWORYxTaTJ6eglbg5qFdyLrLrPQ+FHYnAfzf/aR/q7yyRWjFv+c9rAoC/48Xc6E4Og7XuyB3oJkTPzYfRRQMWISfXMZIpj+ErD2U6kdluhzUl0rQAUQ7QDlkcrnzOjFEU1sBX9EymZuMqswG6Nuv7nD0tGv+LapRa2RmhNG9fBYDBH0S/1nExOW/1WWuFVcWm2i0c2ca92TWnCTVyKqbT+tuOP8xGQq0J1SQDRLZwX80j7p+fovj3tj6v+rzBGJ5aB3WbP5uMCSU/kDp3Yd7dzj4TckCgyNU+C39vbe1/q5yGxDfCMIKNEUV24x7KPjWP3PLhze4VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1217.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Wed, 14 Oct
 2026 03:16:13 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0522.012; Wed, 14 Oct 2026 03:16:13 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Jerome Brunet <jbrunet@baylibre.com>
CC: Brian Masney <bmasney@redhat.com>, Jerome Brunet
	<jbrunet+clk@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Emil Renner Berthing <kernel@esmil.dk>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, Hal Feng <hal.feng@starfivetech.com>
Subject: Re: [PATCH v6 08/15] clk: starfive: Introduce idiv ops for inverted
 divider clocks
Thread-Topic: [PATCH v6 08/15] clk: starfive: Introduce idiv ops for inverted
 divider clocks
Thread-Index: AQHdVyFJ8jAQ4VCruUSgZzTm7XVqG7b5uLaAgAKtwRA=
Date: Wed, 14 Oct 2026 03:16:13 +0000
Message-ID: <ZQ4PR01MB12029910538E78B60432F9B8F29D2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20261008123338.11081-1-changhuang.liang@starfivetech.com>
 <20261008123338.11081-9-changhuang.liang@starfivetech.com>
 <179180050742.66744.154947682767663962.b4-review@b4>
In-Reply-To: <179180050742.66744.154947682767663962.b4-review@b4>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1217:EE_
x-ms-office365-filtering-correlation-id: 3dfebde8-80ec-4f78-5d85-08df29a1807c
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|23010399003|366016|1800799024|38070700021|56012099006|4143699003|261009223027099003|18002099003|10067099003|22082099003|6133799003;
x-microsoft-antispam-message-info: ylp6664lxTbyt8PbZyWW+/5Q9OdV/R2DViGDJ+cQHWfluNSOq/qG5NKF7yiINjVnsOD4B3rq1P0+2+E+b2hhKKJ29UkOEKi0MzF6umb6Z27WhpOjWJRi/uSyoSs/PNBYlZ+7uuXjPz4rqyVlyPosVaeeJBBId89K+nLY41afR/c//H4TpkdcOQTXbC3jBSyO1LKKZQzqhShVCmuwXRT/obCtKbDZcdGJ0kkcPw64JIgkyRzywcdSxFDIiuDm0F3iM6JD/SSds6lwy9Nwd9/V4/dgTITzEjR0aGZsEp+NCRWPK5yetRyQIqgWowdF/E3eRMLNPRgSHSDbDYuOwMBgpMFpKEFAkFQYGrp1KlL5yFr8lhtZV7HGBymL7DveC4RVQgKtKy9Bkilvel/0q8r0hZPseN0mQE67AptUtX0G2BIuPucgzR67b2sNJs66VhadqYc0C2NgKDlJK8aOaVS21Iz0fSweyy1hURnW2HjLG+29B2e6F6HAAVxok541n4SBrFxc8rX9rgrCPmdaKsz2jQyPQx1JuXj4rSlWXYehlDJz2WoXH2mOZ428ob4MBZ3l
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(366016)(1800799024)(38070700021)(56012099006)(4143699003)(261009223027099003)(18002099003)(10067099003)(22082099003)(6133799003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dngzc2d5TVMyTVhtSlhybmJPNW5FVHRwTVoyOTEyTlc1VUNCbnd4NGlTSVVF?=
 =?utf-8?B?ekpWRWR6ZlRBTk8yOUpGVUdGS2laeEhnODY2RVRUbXVMTXZCSXBPNTZVY3E5?=
 =?utf-8?B?YnF0UVMySWxCeExaS0VFZWYzUExUOUpRS1JWZEtWOXE2N3VLcUZFcGk3K3hK?=
 =?utf-8?B?UVJVOExBb2c0ZmtaMCt2QlY4UzAzczk4Rlk0cDF2d3RmVHhBVGFLSmFBQktM?=
 =?utf-8?B?Q2U1b2srcjVveDcwbFM5NU14NjBhQ3VxRTVSMHErUUJza0hFdk02MytVZ1ha?=
 =?utf-8?B?aFF4cVhVQVp6WmthMWcxcEc2NGhnRFJlamxzVGRyc3RzZDVwYitMODZzZHBz?=
 =?utf-8?B?TEs1VFl3M1BCa0VublRvVnFibjRza0NDZU9VYTdSNTZuY1NCMHQ4UkZTS3FY?=
 =?utf-8?B?NVZKaEVqSXpkektiOEp1eW9JbVB3SHlUWW5YbERTZHZmbDYxVmxaT0UzL01Z?=
 =?utf-8?B?QTZaZFR4U0xVaWxwRWhCYjVPK1JLQytJa1hHZUZjdFcraTYwZjYwUkQ2Wnpt?=
 =?utf-8?B?RVE1M1pMK2NYTC9vT2loRVhBbHY1MDFjRzhycG1Dc1ZCbzdvdjhpQVBIYkEv?=
 =?utf-8?B?dWtHUHdJdUpTRzY4RVNpTk9nSnliQzN5bjBmeFlDWnJuYTUzdXNVMWc0OEls?=
 =?utf-8?B?aGNYMkkvVVZkRG1ub2dobit4ZjdLSDFoakNSb3JmQm9oRVpaclFWeXUzZm1v?=
 =?utf-8?B?OXVCdzFsWFU2R1Evd2l3eFRDVUZxL1BJaHZHUGUvREhQRmhvTGpHUFk1czh0?=
 =?utf-8?B?RFVYdCttbEhRNlZtM2Vtc0VxSUFxb01kWUNxWjU3MjB0Q2tHL0RaNzJuL2JU?=
 =?utf-8?B?SktUd3ZDbUVPY01kbW8rOVVmWWEyL0psOWFoMmY2WTRzWHA2TXhTTUVPNWRO?=
 =?utf-8?B?ZzV4cjh4L09tcUVRdWNZWVc5OW14TzYreDdSNXh1bG1TY21mRlIzd2QveG5E?=
 =?utf-8?B?ajJOZW9CSEFmYVJVNVdVVUFwbEZXdTd3dGVISjFVeEZXS09neTJoTkhNTGVx?=
 =?utf-8?B?dkFORGJTM1dEV3A5Ui9RdXRCeG1qS0NZSG1EVnJHTWRKY3JaUzlNNXlIbENk?=
 =?utf-8?B?MjBsdlR6T1AyOXhuMVV4d3AzaGpzRlN0YWphcXp6OWx4ZEFTeUdOV3BKakZT?=
 =?utf-8?B?VHZaWjNzVy9CSDJXVkVXcmtwT1RvTXB4aExwV0RGSWV5WVZhN0VjNnFqYXdr?=
 =?utf-8?B?ejZWZURXYm9Ra2pWcWtQbjlod3hOZ2xlUWRIUTZ4QW5GODhTc0VqbTBkUDFv?=
 =?utf-8?B?UkFrV1VqYjdLT1VQTEs4b1FTQnJEdEMxWlM0S1BaUlNoeXpIam9MaE0yOG1X?=
 =?utf-8?B?NHFIQnlMbDZKQU5waDRHbGNXUVZwRVJMVjFuWHVKTGxHMWdWclc5VzRZSitl?=
 =?utf-8?B?aHRKSUJMMjhpV2lpRFNkSDhLME96Yzh3TDNiMmx2OUdBT0ltbmxOT1FDdXI3?=
 =?utf-8?B?eFFZTG5zeDUzRW1kT1psUTZwd3Nva1pPWFZnQ1puR3RxQnkwN29KZ01ZSlVY?=
 =?utf-8?B?R08wQWk2V21XLzJwTWdBT2NwMnpEVUx4UnFTOUE1TkFCUkVGcGViYmsxbFlC?=
 =?utf-8?B?UEs0aU1ZY0ZGbTF5ZEMwL25ub2dwVVlTaG5BUG9EMmxabmJCZUF5cW1Yb2pB?=
 =?utf-8?B?QWI4SzVPREFMR2RyUkZiVkNpT2FHSnhkUnhaaTJ2cVRxeENhYkZ3M2JaSjFP?=
 =?utf-8?B?RGpGT3RTWU5HanJRU1VzckRsRzZsdGJUSkZMb0NYci9aL2RHejRIR1ovcEJI?=
 =?utf-8?B?TlZNMDNXeFVwc2k2Y1orMUxIRDNWR2UxTjFnRk5TRUJZNVJmbTRIYTkwQVpI?=
 =?utf-8?B?anRGUGxzeFI5ZDhRclhuMTVrNTNia2hFY2VaVmxENGJVL3FvSWtoVERiUXY3?=
 =?utf-8?B?Nm1wVFVFcEN1VEs5TUpnM3UyWnd3bXJpMnFVWGd4NTA4NFpaMUFSbFZsaWlU?=
 =?utf-8?B?UzBtM1NqOXl3ZHlyNVNZMkNNYVc4aHJ1QUZ2NFZyS3pZa1lvWkpUQmdiOHNi?=
 =?utf-8?B?Zy9lZ0hsTEEvUU5abGt1Y0R5OU5hMU5wZE1jK3JLWUlGcWFxVnhUQTgzNkxP?=
 =?utf-8?B?MkNGZy9jQWdWdUN5QkpXQ1VIeTdxQjZsQ3JXVjNsU000QkcwR3dReWxMaDE5?=
 =?utf-8?B?Z0ZkNkkwUElDZDQrKy9ySWtZNFZRTTZPd3kveU8zbXVXaGxOWkpSSUpXSVRo?=
 =?utf-8?B?OVZOd0RBVnp5SlF0MUo5RFZ5VVdtM0dUbTd2UnFKMEFmYjZyakp3VTd0QVFO?=
 =?utf-8?B?M05EY3NGMDlOeE1ic0RaalY1QUwycjJYeThWSVR2NEw0eDM1VEpZZnlDTXRL?=
 =?utf-8?B?dEhHbFNwbVRtcVc1MlVocTlKSmV0dWoyZGYrYUVtSHk5a3pXTzBtNlBlRnRM?=
 =?utf-8?Q?IKP80DJrcYibO/qw=3D?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dfebde8-80ec-4f78-5d85-08df29a1807c
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2026 03:16:13.1926
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p9k/d1Yba+RVMT04WU4X/rw4GtAnftpxtaj2kfnrmb0PT8ZSC4tMy+m7E3k5NGdIKN84AjJEYVHI88ilktKloNelSDDzrd6wh1S0DQZMGK6u++kBWuwFPv7G65REubeK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1217
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_201631_384460_DD4F800C 
X-CRM114-Status: GOOD (  24.04  )
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

Hi, Jerome

> > Some StarFive clocks only advertise the divider and invert
> > capabilities (via JH71X0_CLK_INVERT, without ENABLE). Add the
> > JH71X0_IDIV() macro to declare such clocks, and jh71x0_clk_idiv_ops,
> > which combines the divider rate operations with get_phase/set_phase.
> >
> 
> Please rephrase, I don't understand what you mean
> 
> > Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> > ---
> >  drivers/clk/starfive/clk-starfive-jh71x0.c | 13 ++++++++++++-
> > drivers/clk/starfive/clk-starfive-jh71x0.h |  8 ++++++++
> >  2 files changed, 20 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/clk/starfive/clk-starfive-jh71x0.c
> > b/drivers/clk/starfive/clk-starfive-jh71x0.c
> > index c5ee82db3c92..224fcc3d08db 100644
> > --- a/drivers/clk/starfive/clk-starfive-jh71x0.c
> > +++ b/drivers/clk/starfive/clk-starfive-jh71x0.c
> > @@ -303,6 +303,15 @@ static const struct clk_ops jh71x0_clk_inv_ops = {
> >  	.debug_init = jh71x0_clk_debug_init,  };
> >
> > +static const struct clk_ops jh71x0_clk_idiv_ops = {
> > +	.get_phase = jh71x0_clk_get_phase,
> > +	.set_phase = jh71x0_clk_set_phase,
> > +	.recalc_rate = jh71x0_clk_recalc_rate,
> > +	.determine_rate = jh71x0_clk_determine_rate,
> > +	.set_rate = jh71x0_clk_set_rate,
> > +	.debug_init = jh71x0_clk_debug_init,
> 
> Instead of trying to cover all the combination that could exist, can you just
> chain 2 elements ?
> a div then an inv ?

This may require introducing quite a few new changes.

In the current code, struct clk_hw *hw is used to obtain struct jh71x0_clk *clk through hw, and then the register offset is obtained through clk->idx.

static void jh71x0_clk_reg_rmw(struct jh71x0_clk *clk, u32 mask, u32 value)
{
	struct jh71x0_clk_priv *priv = jh71x0_priv_from(clk);
	void __iomem *reg = priv->base + 4 * clk->idx;
	unsigned long flags;

	spin_lock_irqsave(&priv->rmw_lock, flags);
	value |= readl_relaxed(reg) & ~mask;
	writel_relaxed(value, reg);
	spin_unlock_irqrestore(&priv->rmw_lock, flags);
}

static int jh71x0_clk_enable(struct clk_hw *hw)
{
	struct jh71x0_clk *clk = jh71x0_clk_from(hw);

	jh71x0_clk_reg_rmw(clk, JH71X0_CLK_ENABLE, JH71X0_CLK_ENABLE);
	return 0;
}

Therefore, the existing code has one struct clk_hw corresponding to one register offset.

If it is split into a div and an inv, two struct clk_hw descriptions will be needed.
The jh71x0_crg_probe() will need to implement different branches for different clocks:

if (a div and an inv) {
    devm_clk_hw_register (div)
    devm_clk_hw_register (inv)
} else {
    devm_clk_hw_register (other)
}

Do you need me to make this part of the adjustment?

> > +};
> > +
> >  const struct clk_ops *starfive_jh71x0_clk_ops(u32 max)  {
> >  	if (max & JH71X0_CLK_DIV_MASK) {
> > @@ -313,7 +322,9 @@ const struct clk_ops *starfive_jh71x0_clk_ops(u32
> max)
> >  		}
> >  		if (max & JH71X0_CLK_ENABLE)
> >  			return &jh71x0_clk_gdiv_ops;
> > -		if (max == JH71X0_CLK_FRAC_MAX)
> > +		else if (max & JH71X0_CLK_INVERT)
> > +			return &jh71x0_clk_idiv_ops;
> > +		else if (max == JH71X0_CLK_FRAC_MAX)
> >  			return &jh71x0_clk_fdiv_ops;
> 
> Given the branches return, if was enough and you did not need to modify the
> existing path.
> 

Best Regards,
Changhuang

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
