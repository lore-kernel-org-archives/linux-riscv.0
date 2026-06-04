Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE4ECCD6E57
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jun 2026 01:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zudd9Ppm3MJaoR+tGW6kaiTd4kO+JyhoqKk6yxKUGuA=; b=t6pNfeUvL0Fojc
	V1qp5SMv71rBW+PpYHfURFkKEF1QL78t5M9seW51b8AcVcz/Vq2MB7H3KhTKDhakSVWoTRZmkb7mE
	vr+diaGuJ/mlXZbXKGsrP+4uoPmeY3/1nF2iFeaYSudtePqIvAlAcpSo4zOpya3BRiIq31QzfNwA1
	xKjdJkwDM40L9xtTmOk6trD252Ew1yviuCKoIGmTEeAqtT+F5oT1rlwt9gBdy/AaqFAM8Yj0Ao64g
	FUw1l0uNckt/X6iBGKrJ99jc6/kVrAARCLscVERubsg7Agy/cFs3exfJAqaynpEl6WIt7vAvjCNH3
	mE2PizuKNOs02Pha9WMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUx1R-0000000G0Kh-3uqa;
	Thu, 04 Jun 2026 01:37:25 +0000
Received: from mail-sh0chn02on20700.outbound.protection.partner.outlook.cn ([2406:e500:4420:2::700] helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUx1N-0000000G0KF-3pS6
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jun 2026 01:37:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=etYmupaaIGWkV0uGDZXkFht2DKVSnfItVFdbaP+50QU+jayxJd/1AGM6/IlCdT9u2/8og+BpLd2ojjHbWCdm/Zsn9bwRAOb7G47QZPCLLiZ92TU4fyhGKO0S3YJ9VmiTG2EVwzUPAum6/c6qrJygwFQVWEeqYoR0yk9sp4Up1qjkmxnYfoHMhANTJH9cXmcBrurJnCPyDEVXhApBg6c6sdPS9hFf7P0Q6aZUfpKWa3r5lbbDGJblZVp24Jl5iu/CM4+eAcRIk1LF4q4W9b3zx+oV7F+p+l0FFs4E8y/PK9ZO7x5PkEglbQiiypnLfGJKJoNQL62EbpRjBcP4BJZGFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1SwlBrsDshKVkGkQpFT5G8DbmmYXdviiRXqzU4btQyg=;
 b=LQ8aOrVpl0VXevkM6r7c00fDQ0aBf432cCHziPVP6apObOKYXcUcSQ3TZiZ2UVadMCuAbKBzVzmiIs+vtFfVc03BRu/TUy+NI+ZN0Qq+l9chEV/FhkmJhJ2+4Limx9gE4ck4vY2JBvFT9XZn1jiWXOqTxb9rZh/YfPsALqTzUNYR2Lm+5d8SpBfAK8eSQzqT54bN+lP8J8FoEoAJ/9GlzYcHoQyScCj2EazkensKmWoMr7B14YLKUVXVkYVtSuf5HO6Arn1CihXnGD5+vyzK/QTpeslmfcr0Bj+13NxuuDtwKtD3XrHzPshHOll1muQY0EpNdr1YcFa4/Tfn8dlZaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1267.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Thu, 4 Jun 2026
 01:37:00 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.21.0092.006; Thu, 4 Jun 2026 01:37:00 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Conor Dooley <conor@kernel.org>
CC: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>, Paul Walmsley <pjw@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Philipp Zabel <p.zabel@pengutronix.de>,
	Bartosz Golaszewski <brgl@kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, Lianfeng Ouyang
	<lianfeng.ouyang@starfivetech.com>
Subject: Re: [PATCH v3 03/21] dt-bindings: pinctrl: Add
 starfive,jhb100-sys0-pinctrl
Thread-Topic: [PATCH v3 03/21] dt-bindings: pinctrl: Add
 starfive,jhb100-sys0-pinctrl
Thread-Index: AQHc8x1i0QxsrZUKB0iH+Mtg4VCWKbYtCeWAgACVJWA=
Date: Thu, 4 Jun 2026 01:37:00 +0000
Message-ID: <ZQ4PR01MB12022B5C460A34260ABFCE9FF2102@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260603055347.66845-1-changhuang.liang@starfivetech.com>
 <20260603055347.66845-4-changhuang.liang@starfivetech.com>
 <20260603-groin-valid-a1d4445f7a6b@spud>
In-Reply-To: <20260603-groin-valid-a1d4445f7a6b@spud>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1267:EE_
x-ms-office365-filtering-correlation-id: b5833999-4197-4d14-0719-08dec1d9c5f5
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700021|56012099006|4143699003|18002099003|22082099003;
x-microsoft-antispam-message-info: bVTVwPdnHI9RuFD3pWO8mNfNa6H8oy9wal/W8ZFt1zHJqu9tTbbyiotJdm79vqDOunPbsNj7xw8NxHO41MCkh4cGseuW7FTWpIbZaffo/8bQRrLMT5DnEqJmbTLflbtAMOeMGTR/yWa88970UGCNFF7KGtL23wknHsPoa+QuzVCZ8Y9GmkgKF5RcncDzVqL1nHJJN67wTQwj9lkVDGsI+nILT24QhhTJ+CmEmyeI700dSxSPBlJAs5Kr7uD1JcD4nlBo22++N2LnHZGmERUhdzhpPloECYX6qb9bAr2nqZN4BBFEU/xp8iua6TQwl7jkvLaLzg4PnYha9/prkU9XP6XFb9ONpuXKxmdxorkBRP6ALRRWenMDm/JJoNvilimvxMBzGLo6+F+j6a5w2+q/hgJdaqqinKKL2U+tXXB2GaFTgB6hTeiaDAxrBD+fdgvS63MCtV0LLL8Q8pNeQELnrkw7t94JOzVp1F5AU9xCbxur3M+smkG7Reldcemw2dueBtY0dPuDCI2oq+UM+1IUI6KUZcLLDHhf4y2pbawhafk+tWX41yx0A3SYvWEb6RsY
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700021)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?BB9m94dKs7aZIHhP7fOWCGjAm4jTHjofM//Jfl4oAz5oWc6HX2aZgOEOghXJ?=
 =?us-ascii?Q?jbkIYwQ/E9TPpBleFNgQamxizy46/djLmZ/lwt5uSd5FbALLtyEzzWBI91so?=
 =?us-ascii?Q?4MF0cJcXJdO0MOwAB8yCLgkMxM4Tdtwm2sngAj1V1pGyN3E/BSP6Y+RuZ9ev?=
 =?us-ascii?Q?iSE1ClWIYmTJ7NkY59An++rbY50wCKUQordGsDMrZW5iOPd8a2d3cjyij8y1?=
 =?us-ascii?Q?aofe1ULRDrpChB3QT0Ujx6lyomWGOab3sKX/P9YK5XU3kIDL6Wg7Rjs2OqMr?=
 =?us-ascii?Q?sXp6yrVbTQFjec1P34MWNWQr1egbjI5nEuGP35kmAt9L1zDpNpuJk1ZR0LXH?=
 =?us-ascii?Q?DlEo3Yc6iPrdMtw1fRTEqQxmmZZ9wfB4/ORu2bxmMUDdhF3Ko29HxpmumFZa?=
 =?us-ascii?Q?PiORcMEQa1ivOcz3QTx4odS+JMav4O09X8fykXrYL+oB/YkrF3K0A1GC0OHx?=
 =?us-ascii?Q?pQxVsLbW6BYlP06D2TNfQdWLH4pk2KkyyhEvPKXVpC44tXZRk3LINGbcKcKf?=
 =?us-ascii?Q?1HHpMwP1qwZT5FrQZ8bX0+TotNom1z2oT1F5BcYAlLmE1bjZ8CBU3ijHGgrf?=
 =?us-ascii?Q?ivLY7AsSi93x5mv11QWtvibBvEczA1KVlWlRjeCyeSerAp1ozY2Ui6YWUHOC?=
 =?us-ascii?Q?ndh0lOmZjxSkCkJ80W8Ilq1ykMX8k0TrSwsInbrNg+MK27q4tAhHSxUdTfIT?=
 =?us-ascii?Q?F+Pp8g6F9WmsG+dkYryOWkuRJSvn5ellV6DJUJEkxT0tDJfXh1d8/VEkdQs5?=
 =?us-ascii?Q?Iwp2Vm9xRdN7WsGujZxZ/SAjPcDmTbpyFatSU08YF9+Ush35MXnlMnJCckDq?=
 =?us-ascii?Q?9/l2cHR0QeQqgGI2mn59PidKQryFL9avKg0zJmFj5SLlp4+9GGHLDY8Prl0y?=
 =?us-ascii?Q?nZs9IFLHwtwwcnULmVnkDEq/3uxnKwDh2i7xenB4YHLqFItjg7txPFGUx4Al?=
 =?us-ascii?Q?nyKKTxatEa7NdzVT0Dyqln9L3qAVTMBEOiaNPI67aE/LsGoLjmhnjIzVQrJ6?=
 =?us-ascii?Q?T+zQEHZ2LrjueGcpo+vaZBzorkDDD8Df784s+WQPTo/a+NqYRKfhTEhmoWe9?=
 =?us-ascii?Q?X892XGG+8hjn1dhGwWk9526bFg87oSJFhEMsLXyVOnIwqaOKsB6/NyjjEVYF?=
 =?us-ascii?Q?7WZ3rjdsYXE2vx24qROOJubtBEeKjh/2/4w3BGNAEvxucSyjObEzp8jipaH1?=
 =?us-ascii?Q?g5xINK95kByx+yqaIqRHe5YU4Jp41KO3X8EF/rWpPxwTkTGVtNiqT/TasqHv?=
 =?us-ascii?Q?FN1jZRlwwn+zlpqjXOQOWyrjX4/Gt8/Dd31Si/BGRk7o+rPsyiXN8WpDXdZG?=
 =?us-ascii?Q?EWXCKNBfa3v1rJIYxaunwpXO5YULleqXU3jfSI9hF+TtgBIsvCQfD/mlxw1t?=
 =?us-ascii?Q?WNX/XdoXFpXODSziGTUm19GlyFGfDt9VMuBQ+G7PXQSvt/+dWSKLGNcXdtel?=
 =?us-ascii?Q?srdhUYWVxpJE6OEJ7Q9trKhRw6mfUOp8k4nDqP7htSmrVGxvRWdG8EZswiY0?=
 =?us-ascii?Q?dpge/mJDMBhbA5t6ww3Yk1RgdLIKHG+Ufffh4Gv98d4w7SYDPVAgAnJrqgdv?=
 =?us-ascii?Q?mrhxsuqcbr9LFWlr7asXC0Uaz0nlg3p9rYzRfLwax3cbuweU5qxDCdG1xcZU?=
 =?us-ascii?Q?gmt3fvC8nNUtNe2N90As/AMVB9eFYR5SEJdQop1yCjzML4j8d9rDSJpUkyL1?=
 =?us-ascii?Q?Dfa4rf9eHQx8IoM+ooww94voqMZTonXDJUYktg3IHnKjJbLU2+8eO/N3R4Zy?=
 =?us-ascii?Q?BLF11ZRSH6SfhRxXbaoxy4H6vMaLXMo=3D?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: b5833999-4197-4d14-0719-08dec1d9c5f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2026 01:37:00.6059
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I3sXz8f9m47fmKQoV6Ia2WR1o3ClW2xoUrMVsNaqn/nHtAPN78IEsh9a294WUNhOrjoaYiYoN+2U3LFYnVIfm/IdaPpuMZTySZE4rcrrVqI+RphCJ28NWU9iA5MIDuH7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1267
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_183721_957124_FC0B5ED2 
X-CRM114-Status: GOOD (  11.72  )
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

Hi, Conor

Thanks for the review.

> On Tue, Jun 02, 2026 at 10:53:29PM -0700, Changhuang Liang wrote:
> 
> > +          slew-rate:
> > +            enum: [ 0, 1 ]
> > +            default: 0
> > +            description: |
> > +                0: slow (half frequency)
> 
> Half frequency? Slew rates are usually measured in volts per second, not hertz.
> Do you know what the slew rates actually are and could put them in here as
> the real units? Or is it just "slow" and "fast" in your docs with no precise
> numbers?

Yes, there are no precise numbers in our documentation. I will remove "(half frequency)" in the next version.

> I've got no questions other than this, so once this question is sorted, I'll be
> happy to ack all the bindings provided they're effectively the same.
> 
> > +                1: fast

Best Regards,
Changhuang

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
