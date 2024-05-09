Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99DB7C04FFE
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 02:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AAOstoIuvgkf4l1/Zvo1q2/etpJQ4OvHvfNk0HlGHwg=; b=SfKUTX3uxyhkwi
	1MVdskRn6zsSdaOaDCRs759jx2OU49JrOQYfLIzfiC8S94+qNJ+08g9p6URoMsyRnlTtCX2HYbpk0
	fnesivYaBinxCC4jjvfugEL51/gCW119u/NZhW1sySkc1YbpWM1OYGHBcmHpOmhgcT/ABkNZU3XWr
	YRz0aHUZ1Hoa9bodKPC3xizfYj7AAK4MFI3ZzwaPp0SOX0RFhWFO9iG2trUJ7C1PFAlKcSa2gd0bs
	2RpGXaA54p2Fia6y54nYyRsNcXdFt2oaXSf1DVE//BD4HJ8n2+/yUmSeIXzLjVj0y9Gov2a0hTRCQ
	FSX/u1efWY0xbQ8WlfeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4tSM-000000004yn-0tee;
	Thu, 09 May 2024 02:24:26 +0000
Received: from mail-sh0chn02on20728.outbound.protection.partner.outlook.cn ([2406:e500:4420:2::728] helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4tSK-000000004wv-0960
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 02:24:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T6NnfagripZzYJfZXAQNCcj6Nhrlwh+/cT8PuVe/16aWbLqEVfA2PROiiU4nd+Js/BXz4gMof39QQi1FwpWNNO04IXIUm0MNjC2skZGAETeXkitHdGMGV/TLwC5EuQEcPv5pM8VIGixxrZDFcKfMBNiXCrTTzfFuyvdkuLWQ8ATIgvp7RxZWukmbyThCCPuwpuwOPTkiZq//MvTs//8/arxh3hdlfZ1xGmURzJZW3/uJVU/QioZ7c/eH9er66YUsLLyuB9DLzonMm85T7n9xqEaNRh5HDj6SCSu4a5CLFqx6WqEJFVimk1XdAqkQbv+5BVBnCwpzt6E2eKWWooae1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RHOfTe2NDSm8IX70nCtwPxIKNOvsa5X47EeFmMGRxEA=;
 b=FjJ0xr9yUqI8mZ9lfuhSgH5V8rympna+TanaJoGcigWREGWrEed966CS97oyxMWhYRKzqaJfh1v2EhLRGeR2xh/NDhF3dP7GTWKIVt21/EBuKsxd9kS9mQmRS7HbJ54dHs9FNsJMTzG4ptNDMvxRpPSPxJ37FEV6tNbnbMC+41MD4U5MUbBLcvksgL4P2vLzjiiCimHHOhQ0i5S/EsgyK252gLxE+KDNUL8KgqgxwjnJ1kO8PdBKLRk2dwFx5FoCcVow/AaWqYoeqxJcGmZpekhd0BkYyRgjIRQ2lEn+eUV4L52LLS5sIPHQRX52iZNtGVcr3hlRUAAgcqe4TKed0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ0PR01MB1176.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:19::9) by ZQ0PR01MB0965.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Thu, 9 May
 2024 02:24:10 +0000
Received: from ZQ0PR01MB1176.CHNPR01.prod.partner.outlook.cn
 ([fe80::feb4:a4b4:1132:58f4]) by
 ZQ0PR01MB1176.CHNPR01.prod.partner.outlook.cn ([fe80::feb4:a4b4:1132:58f4%5])
 with mapi id 15.20.7472.044; Thu, 9 May 2024 02:24:09 +0000
From: Yuklin Soo <yuklin.soo@starfivetech.com>
To: Conor Dooley <conor@kernel.org>
CC: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>, Hal Feng <hal.feng@starfivetech.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>, Jianlong Huang
	<jianlong.huang@starfivetech.com>, Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Drew
 Fustini <drew@beagleboard.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: RE: [RFC PATCH v3 1/7] dt-bindings: pinctrl: starfive: Add JH8100
 pinctrl
Thread-Topic: [RFC PATCH v3 1/7] dt-bindings: pinctrl: starfive: Add JH8100
 pinctrl
Thread-Index: AQHanUsd82+KI3pjk0uPcQoiFxOkhLGFrVeAgAiF91A=
Date: Thu, 9 May 2024 02:24:09 +0000
Message-ID: <ZQ0PR01MB1176A591EE2AB5487D45D2F9F6E62@ZQ0PR01MB1176.CHNPR01.prod.partner.outlook.cn>
References: <20240503111436.113089-1-yuklin.soo@starfivetech.com>
 <20240503111436.113089-2-yuklin.soo@starfivetech.com>
 <20240503-undress-mantra-e5e46b2f6360@spud>
In-Reply-To: <20240503-undress-mantra-e5e46b2f6360@spud>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ0PR01MB1176:EE_|ZQ0PR01MB0965:EE_
x-ms-office365-filtering-correlation-id: 4d1aec90-cf48-413e-aaff-08dc6fcf1bff
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mHdulBqYTTxXlv6LckIUT+I0xj1miPqhHtOxJVUGGFis91Kvi7/pNhf3hA134N9uo2ElsTCCVdwnhlrnhPj9D0605rozN0jr0rvbv5IfNTOGBUknQfdFpg7tRAQZVnZgHCoWP7BfuXtOm1CV+7VaKK+SCql3L7YpvzNWJHOQKQy39Jxd1svZborKxNexDkwjBDwS6GvqfAPCRx4kSPzGRZe8mQByXGqDPNig7BrrkQK2pQD96GxiM6ATCQWrv5hGidZ8UxaXv8gfrgTE4gUG2zgRUIjs/6z+uzYXB6iI6tR2zuODq8Al7yRTqSnbHTDwgwgFD1Ukkj/I02BGCLAMP+RVBY1OVkH0ewCx3PdJNYzRfqKf5m3/WYlFJ+4sAEJKa60h2SQummco4efn2GeiWROK0RO8g6S6Pk6WBysePVed3fzFGAkQDQ+PkeQKi0MBf5vJGh2/BKYqMDq35DIT2RkX7EiCL+KoTfpZCM2b06tmxsa6u4uRiqZOGhFhOoDkT9Avlhcr5m6ABV8j4puRZw0YS7zdNxKdpEo/dNZ7OHYZyjq6EgFSsXfhkdLW2+hIk8rpf/mGoGnwM04dilHaoEPABSeguOE3DVmSmXu39ykx3DBp0Fwwemzv+DiOj+3/
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1176.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230031)(7416005)(41320700004)(366007)(1800799015)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4U0+XR0sl2A7Cg8UwNerBnWSqVqLG8hqRA0D3LtqYUN9G1B4vQsYxQTE5PHs?=
 =?us-ascii?Q?ifMeTwXyPNCbbNASRjOPGyejdsSEd+92DyFcT2yB09X/iGWXpY74kGeCLvoM?=
 =?us-ascii?Q?0NougcwsrBmvnIX9Kj5gw5oKZxWdmVYMcBFwerYffR+SfYVVk2l822naLPTl?=
 =?us-ascii?Q?tJS+7WwlFuwRk7PsusZTwtnKepph2i4EYNgPrm5Sl4X2HDIPKNfjx0hJ3YAj?=
 =?us-ascii?Q?XRrgCwmWfmy9Z9WuQqPwrtyuqVq8WBmtivAzhi/hCqhRxUFtGCiQYbEvDJiP?=
 =?us-ascii?Q?FSYMwqH9+jNWm7d7llEivwTKUDslIcwHjngD212qBO7e1l0Ajw4rUa+Nt4V9?=
 =?us-ascii?Q?Py1to9FvA6jJiyERLhMz0lkOx0BTFJtl1EyWkAEtdmkAA1ya77bDKQJ/9PU6?=
 =?us-ascii?Q?fYWH5eW5eMYvGlWt0KsFxpylcb38eUwzXmnHpMmnDSaQ316u5EoAJxjkmfx3?=
 =?us-ascii?Q?eyI3M5c3aP6D4DLzj3Oo6kT+IVtNXk/yAtqHl3x/fxELOILhS0dD8mT6/hb+?=
 =?us-ascii?Q?ChYAdQ1IGFbIXP7t1m32+kuC/7BwXnZ1/y0IcGPnSirQK8kOxWxYRO7laeoI?=
 =?us-ascii?Q?E8Iy6afgbpC5H5yt4qSdeNO4HBWeGlaLfA1lswPXJ8hdrbk4RdzST0UTjI6w?=
 =?us-ascii?Q?JkwFUlQZSUADLVW+2yVbuXtGa3J3xo+8DuHQzDaVY9nZF6EqOf6sGuckm4B7?=
 =?us-ascii?Q?/igIrPARIriT4ykRZ9LU7KmotiJ8Pou2h4ZJ3/Mp0wWOXPjiF4BOKJhBpe5E?=
 =?us-ascii?Q?JA1A4Jk6noo8OrH0zYcg22lCkIQKNoG9+l9j60O2W+durmXPQMNoxX3M+IL8?=
 =?us-ascii?Q?V785C0q8+XMLpVllRVK+D461OCT/cTxlbGpfFu2CuA0y+bqTjdoXJKg+tAvG?=
 =?us-ascii?Q?3BodpjXE4a27wuyqBMAczWeIlhI39sUQ69NAtiwNZV1vANiDywVi/7Spw2zf?=
 =?us-ascii?Q?caNwxxEIfkIWAMTwgQNRHWGovBy/wNhOWRIQBWFkC5cEPIQ7D9Kb4MfEeh0m?=
 =?us-ascii?Q?vkTvS4HhRIHo3j5vqk3GSbGSPGPwVOlyf2IuNFnGrr01VZG1Epa5EFoHzPF6?=
 =?us-ascii?Q?wdCITDHWJrD/azQyl/+jAobDlI8VLCVCiVCBQNTky1b5bnTE1fC31ZIArpQf?=
 =?us-ascii?Q?cCfKse07Dw3TyLv/ha5d0Joj3HY3dPu9/k4CIZWXLi2e8Fo0FIe38qKYJ56P?=
 =?us-ascii?Q?yIcjvsElKUfnhyjj2XrXHusgwJrpXQwJ3APGfBbzJ5V+mbjM/lOcNFCgscW+?=
 =?us-ascii?Q?sHiFX2GrGsCjWVu5Gp57TvDNiwmHJwzFpecISdUjDXqd1y0+WPpYqgyXZ4BY?=
 =?us-ascii?Q?iC6eNb3jex+bewMg1lwJDrg2UPH7rvWG6PJ+KjaIWAp9TkYGcysA85ezeTVn?=
 =?us-ascii?Q?3I54AWh0r28gMF7oBOR1KpaeoF/hu0/9Rir7CaLJSHg2HqISbAsRijUdUH7m?=
 =?us-ascii?Q?mJ/lAggoJ9iH0NXwp9UmHwY9PFzgBSZnc7lX+mBMAdeQXECA7lsXUtrO9+oE?=
 =?us-ascii?Q?XfLl2yAeZttqciLlWIepZ90CvDRv0/Lb5Y8vmBsPXcCNwate7cQsqVSgBzwI?=
 =?us-ascii?Q?Qfeb6hVeVydI+oJvUTrLSdnmz6lyBiX13FuaX2rSlK7WZpXmF7bwI0DOBW35?=
 =?us-ascii?Q?Cw=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1176.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d1aec90-cf48-413e-aaff-08dc6fcf1bff
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2024 02:24:09.8198
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D+zMvUVdEMz1aTNzFny6n/pL8qrJNFUkTWuQhmOg2gpY2cG/rMupiU8vRYFGdpjOTWKTXZSaGd+ni9/v5cr8E5xnEpVFOiM3T2f1MEUa0YA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB0965
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_192424_108211_2097D400 
X-CRM114-Status: GOOD (  21.30  )
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



> -----Original Message-----
> From: Conor Dooley <conor@kernel.org>
> Sent: Saturday, May 4, 2024 12:07 AM
> To: Yuklin Soo <yuklin.soo@starfivetech.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>; Bartosz Golaszewski
> <bartosz.golaszewski@linaro.org>; Hal Feng <hal.feng@starfivetech.com>;
> Leyfoon Tan <leyfoon.tan@starfivetech.com>; Jianlong Huang
> <jianlong.huang@starfivetech.com>; Emil Renner Berthing <kernel@esmil.dk>;
> Rob Herring <robh@kernel.org>; Krzysztof Kozlowski
> <krzysztof.kozlowski+dt@linaro.org>; Conor Dooley <conor+dt@kernel.org>;
> Drew Fustini <drew@beagleboard.org>; linux-gpio@vger.kernel.org; linux-
> kernel@vger.kernel.org; devicetree@vger.kernel.org; linux-
> riscv@lists.infradead.org; Paul Walmsley <paul.walmsley@sifive.com>; Palmer
> Dabbelt <palmer@dabbelt.com>; Albert Ou <aou@eecs.berkeley.edu>
> Subject: Re: [RFC PATCH v3 1/7] dt-bindings: pinctrl: starfive: Add JH8100 pinctrl
> 
> On Fri, May 03, 2024 at 07:14:30PM +0800, Alex Soo wrote:
> > Add documentation and header file for JH8100 pinctrl driver.
> >
> > Signed-off-by: Alex Soo <yuklin.soo@starfivetech.com>
> 
> > diff --git a/include/dt-bindings/pinctrl/starfive,jh8100-pinctrl.h
> > b/include/dt-bindings/pinctrl/starfive,jh8100-pinctrl.h
> > new file mode 100644
> > index 000000000000..153ba950c062
> > --- /dev/null
> > +++ b/include/dt-bindings/pinctrl/starfive,jh8100-pinctrl.h
> > @@ -0,0 +1,13 @@
> > +/* SPDX-License-Identifier: GPL-2.0 OR MIT */
> > +/*
> > + * Copyright (C) 2023-2024 StarFive Technology Co., Ltd.
> > + */
> > +
> > +#ifndef __DT_BINDINGS_PINCTRL_STARFIVE_JH8100_H__
> > +#define __DT_BINDINGS_PINCTRL_STARFIVE_JH8100_H__
> > +
> > +/* Pad Slew Rates */
> > +#define PAD_SLEW_RATE_FAST		1
> > +#define PAD_SLEW_RATE_SLOW		0
> 
> Should this really be in the bindings? I don't see it having a direct user in the
> driver.
> 
> Also, if this is the only header you have, I think the RFC tag could be dropped,
> since there'll not be a header we need to worry about getting into U-Boot etc
> with values that may change when the SoC moves from an FPGA etc to tape out.

I will drop the PAD_SLEW_RATE_* macros from dt-bindings header and move them
to the DTS header file. Will submit the next version (V4) without the "RFC PATCH"
subject prefix.

> 
> Cheers,
> Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
