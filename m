Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D7A0C54E71
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Mar 2024 09:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6dqkxT7WnV7my178xwKauDjLN9Mwv4KE8CkCmhEgPeQ=; b=smEHDfkV8UlEsd
	xv6AzOZvMd6xlvaQ01oaa6EeIUal947ZB9bAuQP/e8h4ytC1hWt+IyFX8Ixb5ZumChyhqyFbay+1H
	C8avzftbueIOXLAuj/q+XNo6if4KzbkeXjfyWD1ln+o/Jq6RZWVcHsBs4tpm/xIaKCKT33DTfrrID
	a62ZsJulZbASX7hCGYTyPpt+FZNPxEIrfzkNv17Qy5yUU3N6iTlFGPyDUODFfNwe+EIddmSOOBWLq
	sNZPt/2YvEm7RRZ35in/YQmnYhHgWhyTVsvAGRX8FwZbvABzO/ExxjHvJ8Zloq9YVjf/APIghSRWH
	uUL1GNUu+h7EPccgwDiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnbK4-00000006cCe-3uDi;
	Fri, 22 Mar 2024 09:36:24 +0000
Received: from mail-sh0chn02on2072a.outbound.protection.partner.outlook.cn ([2406:e500:4420:2::72a] helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnbK2-00000006cBP-4Aye
	for linux-riscv@lists.infradead.org;
	Fri, 22 Mar 2024 09:36:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=liHMX8QkoJiCKn8YYutABNsKrxFDg6pRIV6g0uJRbMeAlEXMozL0O2sPrIWDCi+sUklH3LVS1Dt6TLWakFfq71kWBBHhOu44HpmCOUwmlDHJ3ZJUgd1zRd6QAYYeA1+Kjn0MTUK1lPyUGB8ZofnR6tmJ6KjU+8DEEe8r+vLwdvF3VRZ4YhB3FwWygRQJtSbDPUDnG9Fq7eX12PcX4S88izfgXbdb9UGHPiKO1ZppZTZiUwHr1t38pT4lzhpz8Dg837lL7gDNp5EbdwnLW+V9jvpIrOdCnbgPLQ0Zem3A0kO/UClMkZrO4WoN6O2EcMgabgx9zDRC+AUSogPrVzPU4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ItW7JvuP1szIFY0mbg3DeHs/cQRu0hDiqarr0CPSdrU=;
 b=Dvt70RXtZqyJ5IoDnhVgpGY41Ce828WgKxQjphWkDvYLl+AgmkAmLlUARO3mcCRCcX20TA8boqeJEeTbSLgnqeyM5NUY/mFAihMm3uC11JY7Fxg78xXzlLrcfF82iSuqaP7H0zvT5c7EQHTU+tm4ei8Jvqt3GnJcIKS/XaUH/hIzQrFsEDBVk5TVvVIqOS0pzuEe7+lCIiozWAMoxvPNqp2uCz84Yn2e/hHOzPilpAS9IhCyIM6VtzjR9h+Or2VL3u19CFZjLBraAVnxzoC7KWxvrCUIG1eFJrOvbxbeekicoTBkbSeuUeIbjJDex3lVyjwjQLG+vT0n11c8FxogQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:7::14) by ZQ2PR01MB1241.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:6::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.13; Fri, 22 Mar
 2024 09:36:19 +0000
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::5de:15b9:3114:4f45]) by ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::5de:15b9:3114:4f45%5]) with mapi id 15.20.7386.025; Fri, 22 Mar 2024
 09:36:19 +0000
From: Hal Feng <hal.feng@starfivetech.com>
To: JeeHeng Sia <jeeheng.sia@starfivetech.com>, "kernel@esmil.dk"
	<kernel@esmil.dk>, "conor@kernel.org" <conor@kernel.org>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "palmer@dabbelt.com"
	<palmer@dabbelt.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org"
	<sboyd@kernel.org>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"emil.renner.berthing@canonical.com" <emil.renner.berthing@canonical.com>,
	Xingyu Wu <xingyu.wu@starfivetech.com>
CC: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Leyfoon Tan
	<leyfoon.tan@starfivetech.com>
Subject: RE: [RFC v3 04/16] clk: starfive: Convert the word "jh71x0" to
 "starfive"
Thread-Topic: [RFC v3 04/16] clk: starfive: Convert the word "jh71x0" to
 "starfive"
Thread-Index: AQHaQ8liKjyIY2IllECjyvkvWy1XuLFD8LTw
Date: Fri, 22 Mar 2024 09:36:19 +0000
Message-ID: <ZQ2PR01MB1307520AC705D79ED14F24E4E631A@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
References: <20240110133128.286657-1-jeeheng.sia@starfivetech.com>
 <20240110133128.286657-5-jeeheng.sia@starfivetech.com>
In-Reply-To: <20240110133128.286657-5-jeeheng.sia@starfivetech.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ2PR01MB1307:EE_|ZQ2PR01MB1241:EE_
x-ms-office365-filtering-correlation-id: 453e67e6-29d2-4ab4-f678-08dc4a538749
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /dKK+1qJpFQMkyJMDFlTGQMxUCAkwA6iNHgWOhhSHYY167oiNV+j5nxkP1h+99pDWhiiZ+IYc17ABdtxmrdGHUeYQbc6Kez+Ld9U81+QBE1J6/8geB6V2f5r57p9yxcmWnqB584AE5TqjtR645+Henqje8Ln/mBxMefZUzVWXnD52QV7b6qiT3wypa2CxXYo1H24UpIiTUSvy0Za1xqn3Pn9qsUD8o4GBm2qiGpu5ywmC7AASmbtN8qLJzgLaW+SFTMrfohZmU+8yQT3g+pnpcIU/KqndB+CQSmbvab3PfRAU0MJOvW5dkcit7fmKoIQlxy1Vj68E9C3rQix62A1+2BempG0Ob6fdgzLIm501DSO04iIdN6M+GEQFpRgC/VBC2MdFDL5ogFP04/eRutVD5hRsLHkxsBZHkiDKrFphVl3/Q4xc0jP9XnBN7gObL61sgsGSWNLXJBTX4+KZSlP8wVYgq3PBM7UHDruPFa9fju5rbDOATHmF91dY+sjYT9oYkDhUmCART/l+e8M6M12Pw/E6TJt798K1xJDJ/50nRd0UvlIlhsIMgyxwRW7qNEt74yZ6Kt9kUZMecwP+t3XM1Br7P/12gLShwnhrwVkIj678m0Jb1EjXdFHC/ywfardEGzSV3BXwjJgDJN31ZqnLg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230031)(7416005)(1800799015)(366007)(921011)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?tLtv57/083L3Knb5MhEMPm1albIlSWm1zU2AkdHsH7/BS3HUw149lv4TbB/j?=
 =?us-ascii?Q?aivTd55WaZJ4GNX8lttaTTqwBbOpdYzUKvFx88gwfsZmCEBSB0s8aHAlK8kx?=
 =?us-ascii?Q?pVYdvrJcZCgzZ6JCcZohnlFY9+PFxA9A5tQS8fEG0lioo7CwD0YC2i/0TUY4?=
 =?us-ascii?Q?28cYIG57dfZE2g8mxg9aKFVsXeLtnjmGlywte0ULW+NKjsuNCIY1j5y3TGnH?=
 =?us-ascii?Q?ycTjkR3weXohbJXvXBL5+6jJZgFLaWXACDE+guDgG8HVc/rm54ozkFeD5GqW?=
 =?us-ascii?Q?I6c5nv9TZYlvMpBEKAV5ni1RIyPwMbJOFg5Rpp5lSTgrjeT16VDslMDn01Pm?=
 =?us-ascii?Q?QYPiMfuveXnImp7hCrNuVbMmhPiWaUY54p8VI18BPbgI44R12ayTsNHgSk+8?=
 =?us-ascii?Q?dk/o9eI3cs06KdfosA2SuGJZPL9/qlvWkZsGUhaGMGTMKpkYsBp/xUFhNBb9?=
 =?us-ascii?Q?mSp05nE5GFGGDUZULfuCBys3tB5F9WrjtOjfSFPXfJ5kN8EQAVsfXcz3MOyn?=
 =?us-ascii?Q?1SfSbMO0wR+hZbjGFzO7kU5cX6P2J/9NqIE+BPeBJ1ZHo22Hz3VKuH85BZ0m?=
 =?us-ascii?Q?4QiMDB+eq4gehazwU7/YcxY7kBljQ5akdW4TNhFZW1xmZKcOPn35BSkd96fl?=
 =?us-ascii?Q?H775cupuQksrFAvABx/UjU4+MSlvIJA9/tSXGqKQNiqghAq/2HzCAt9yciK2?=
 =?us-ascii?Q?X1/cVi/m2e9IyygrO5Uxs2xd7sm9Fc/0AQiWGOwwK0RTjyokj+0DEXdRlfy+?=
 =?us-ascii?Q?xPeULxzthr8d7n8FM8GAU8fOZG8ruAlVBEb4yr6u79zavofMpvgCm+ujHB2z?=
 =?us-ascii?Q?VWlxuPytlsBgwEf7BUXNGXr4MrNKx7iudLidDdyVVwFEn7DlcvpFPGzSdd2Z?=
 =?us-ascii?Q?uVJryl9laSbvuC2LvU6yCRB9YUqG17bYyuOI6rJSgMVSRmm5t8MyMdh+ibnp?=
 =?us-ascii?Q?7aS1LxeGceiDhH1G4hPD2s6QizNm6jyiM/S4R56OjqtjH83GQbz9v20AsFG6?=
 =?us-ascii?Q?qHGKhb15bf4gmy/Hb39zQ3AE2VHtZj2VFzNxX5+LtgFPMEeprZZevN08gTyY?=
 =?us-ascii?Q?LWKp/HxTDRcm96zkTv9YdgWDJgxG0mbhYtetIjxU9Za9OJLtk9tnifMLgi+J?=
 =?us-ascii?Q?E1v0GfjWJeSDxrxkfxTlMO+qyeqVK4GqH96IeXdHjhNQ84BKmCh/AQ9pJdmy?=
 =?us-ascii?Q?tv3rnzUTco7y0+uiKwdlLWkSG23aRHBRTX2Hhg2iCzvxHQbtZY8gDJVU/xpT?=
 =?us-ascii?Q?oPIB3RLRxH9zPtFyROL148+Q5a/LSj8dOONWwbFNy9L1NgXJYWTeADa3SQKE?=
 =?us-ascii?Q?0MMxHO0ogS26aSNTIFYegjbb9/Ak0lD6cbwcqceUwLaJs6Q4LoxMfxKRaSiM?=
 =?us-ascii?Q?1rd/liaxJw/YUTVx2Xz3F/OM3ZoeqW0qu5rqJVqsy4PV8jYamP2NzaAF97Tz?=
 =?us-ascii?Q?VAnAVBbU5zU4RjGCnIx3hanfmb5UCmYxfT6ymqRKo38guWkYRIxht5ifGCMG?=
 =?us-ascii?Q?GCRct29bYOBFtibQ6rp88o8/a8ppWnH3mswiXOFG9YzqwSFDY1i6L61RzOhe?=
 =?us-ascii?Q?gaBjJNXElZ4L0+Cgf5sNA1234Btqezw9f9Y1wNFK?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 453e67e6-29d2-4ab4-f678-08dc4a538749
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Mar 2024 09:36:19.1762
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FfYBBif0XtHZmGsBV328nAhggzGJGKApc/+rmq6phUioLV/LODHcHf+iqOAYH/iw5F9CfkoSw8N090F/o9otjhgK3W0iIknbtPTInCtEy2U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ2PR01MB1241
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240322_023623_058713_F85F4B19 
X-CRM114-Status: UNSURE (   5.09  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

> On 10.01.24 21:31, JeeHeng Sia wrote:
> 
> Function names that consist of the 'jh71x0' naming convention are
> renamed to use the 'starfive' wording.
> 
> Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
> Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

Reviewed-by: Hal Feng <hal.feng@starfivetech.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
