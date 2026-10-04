Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB962CA5FE4
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Oct 2026 04:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9krCjCI5tla2LGMZxqosd97ERhHiFbUa8dxAvU9OOzg=; b=snJE4UDNH1zGQf
	jRImuxxEwPZapd3yA1JkqEDuxUzCJWCadRY5i/jLHIWy3XpfxM/TKMZzo00g9Z9d++FAgXutUjWyd
	2I1NRY1Ck4SkSpTQfJcYOLBMuk5rryj+RLYmOCDSbxz7QAVa/fiOG54LRrG7mKCLO7GzrXn64aYot
	9SPJPwvmJYFBVI9N1oY1sYptg6MIk3QvGdxw2R8qSc7qDzSnCbww0gfwiBO7f4LiajYXKKm8+NqYR
	nFUzb3JLQIhIWRa8CrUpf1sLG63T3+8pIbLzJLienQGGznKoqkYj6hmp66ywhsyUiI8gSYBwHjq7f
	nOP1+q5rU6TvE7HLzxLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDDY2-0000000EKIj-0oCg;
	Sun, 04 Oct 2026 04:10:02 +0000
Received: from mail-sh0chn02on2136.outbound.protection.partner.outlook.cn ([139.219.146.136] helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDDXy-0000000EKHw-0B8k
	for linux-riscv@lists.infradead.org;
	Sun, 04 Oct 2026 04:10:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q4usiuyccACsFhU57wizHDnGQtd35oLHzPcuL7ys7g0ngN6kdhxzYqHzULbozICEjVuIdpVYuYtSlD1CLtT/BjCQFwT1qZOB64m3LIPxvtxbqFavMgqyDzj09T1IVrZDtSmveV4LcuspG08/c88z4sFr8oSuy7Rifz0DjobP0/A9ih5lHFUJeES5doByCmUFSDSMkryzi8U+JMakfVu7fs/gAz6tbBDWRTBOxA/otq0tohE8suZ4TuVemKf5k/43JYO9DoKJ5aLFOjvYUyHabZp+MmORY7Vg1Jm5gpBA8jGF6V/G7+8QBCLK2HBjd5JhOW17clZ3iLQl7Ka8udPstw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dDx260ByFWlF+0C6uIEXZmUiTZI2QDT3nQFK6SLVHOg=;
 b=Pk5EkwrfjxdBUAvihamStthJLKU5F2j7Tqy0TeaEN28ppbfoQtDud5Nx2mNwHXjNio6BxS1IATvRVlPtsdtGk2ToWbEblUI7X+LRzTx+2E/7Cfw4qCIfqv8/l3Km1Q9Wn3N5/apULVvVA5qajQE6uJjV1NtiDMwm8RFzcaYkDxkqYnoNrGJqjaGcvc0VSJnky7hVJ8OuAaNiM5s126PRsii+DFksFfcJGIidLjKBYLowlDpKeOGaKJlmPGJZkvZjyLUPk2h0KMGbAemUe/g/9ab2Sf9de6/iVFSPpUYeCMZMci+YQFU+NWf3yZpX3c66mZs9C5QNo1KO6PpmZuSibg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1155.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Sun, 4 Oct
 2026 04:09:36 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0472.016; Sun, 4 Oct 2026 04:09:36 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Brian Masney <bmasney@redhat.com>
CC: Michael Turquette <mturquette@baylibre.com>, Jerome Brunet
	<jbrunet+clk@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley
	<pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Emil Renner
 Berthing <kernel@esmil.dk>, Kees Cook <kees@kernel.org>, "Gustavo A . R .
 Silva" <gustavoars@kernel.org>, Richard Cochran <richardcochran@gmail.com>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>, Hal Feng
	<hal.feng@starfivetech.com>
Subject: Re: [PATCH v5 10/23] clk: starfive: Add JHB100 System-2 clock
 generator driver
Thread-Topic: [PATCH v5 10/23] clk: starfive: Add JHB100 System-2 clock
 generator driver
Thread-Index: AQHdUNlXLmh95bym/0m9TiTYdcb04bbqrOAAgAIdwuA=
Date: Sun, 4 Oct 2026 04:09:36 +0000
Message-ID: <ZQ4PR01MB120205E933ED1F874645F35DF2972@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260930124317.5648-1-changhuang.liang@starfivetech.com>
 <20260930124317.5648-11-changhuang.liang@starfivetech.com>
 <asALCsosWkutrwUK@redhat.com>
In-Reply-To: <asALCsosWkutrwUK@redhat.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1155:EE_
x-ms-office365-filtering-correlation-id: d76536f5-b40b-4e31-9e1a-08df21cd4dad
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|23010399003|376014|38070700021|56012099006|10067099003|4143699003|22082099003|18002099003;
x-microsoft-antispam-message-info: 5/pFXrQGql3q359qYvs6MNXAX+1oAbUkvOr0A+L46nTUEBIocV/ONd4GkGVgmhUMzDNpRqkNZm9TWIUr6r6ZvLxYXJAq14OhUSYOAswmzPA3dyv90Vd3d/Zh1ZzQa7lFqByJChcJ0ifx9QzxSZcUzWd9UM3EfEM1ntWqAwpntXUnRm0U2jC5wpq81mpiSUxGnkd8DlkyAOjWy6Xn2IYz5UW/samCeJSsdNNJ4/ehM1dEGGA+vqBzhzc1r0uebiVUTO32I+cH0vuIzRmVxn7C1cTO3z1DgWiA10Ek27k3QXWWuOlWgUDfClxlBq5YOdrWKrpbc3zc86WsR9wCdF6EPW2wXcWP92/IHDMoXb22bGun2UpZjjCbLni1Ad0q+lrsDLVZe10IIpz9/Qgk20hMYV3Wt11sgx28oWWBVH085+/+Qd30u/Dwk11IV+5fEYPlM2Z71jb4ME016J/ihBbEWlEv7xfa+QXAoX7FXw2JFGXa17//fyis2R/8uMBldokivu4e/3v7vSUpVwWcUzB3b2mf62yp3S1+7O4A4JyR6hwAS0dJxf510Z7XWeZbx8pQ
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(23010399003)(376014)(38070700021)(56012099006)(10067099003)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ePO9JzroDLPkNqm4hLGFDV8gzGV7mEowD0LIzBn+41Yz4mA7lSDO89MA0Ijt?=
 =?us-ascii?Q?v6sH21JjfnDW5ocEJwY+pKDoGAaqT4t/1C/E9IREot9jwYjjaBgRfyzSG2bz?=
 =?us-ascii?Q?zVeczjqUTFMEJn7/KbtIQHcLCs46XnLrsFkzuZoYlwYWYyox3YqdYuvVtkVI?=
 =?us-ascii?Q?vqzmbwh0n7LblDATpGS/E9KJf3GOUdnQal10127HW+wZ347jYxL3T5f8tqVQ?=
 =?us-ascii?Q?zTyznsreRMXxmD5N5iJnw0Vv5ojALcxav3SOduuslR5hKu5aCcIFKkluND7t?=
 =?us-ascii?Q?/wvI6Ap+u9ljsoVQa2ZlbgwyLYDLC31H48kZ44eE0+V/qRozbtvlOpwP9eFb?=
 =?us-ascii?Q?v9AcHh5ndkqsPAHTW9yaU4EkbkvbsoOOuhLcbb7dFHpj85TjFW7AA7svj2Vf?=
 =?us-ascii?Q?cAXY3PZnSVNbN5IbzD8xUp6V0yO2nUmnh4P8Y3raH2+64C0KiYwdMZKNNoll?=
 =?us-ascii?Q?imxbB9i9VUShNKqDjjOjBw2lvHYadrGNjZjZes0w8LqyYlfd5mEzo2gElBqu?=
 =?us-ascii?Q?k+GBkDExhz/8A8ij/ilyy+etMo711kxJVlZo4jU4vuL5RTdJ8+BX2W27Mxv+?=
 =?us-ascii?Q?o9/YQfaNWta/RukCHXvYPjm2D7In+H4JZVrwPUCFYBdMt9X2oZSo3K6pIYUZ?=
 =?us-ascii?Q?VBqr/b2r+F5ad8oRk31720OEb2fTD9tnvAbg5GtoCe5H72n8/jyky3XWw91A?=
 =?us-ascii?Q?8jeAvU+5TMrjAyJU6+gQGaQy/6BF4RUVM68n76hLGbyBvW6jURiijfPMMdlE?=
 =?us-ascii?Q?cxHoaxivbqhJ5yg+VgAksVdnMMUGE9+yIhPYz4xqzyeMw0Eo2EEgM69+Ki2a?=
 =?us-ascii?Q?jWRlRprT501leDvjL1O59k+MYXRU4DpoCybznFrRnWY7ESAkmoFdwENyhlFL?=
 =?us-ascii?Q?c3XbTRepZmriLh5W/NKWF7XxTk9cEcw17Dg1QsKBcLQnlfG7zyQeZP6XbWFT?=
 =?us-ascii?Q?lUZOrTe+qqVazw57mI5jwCFvBICAoiO8C/iInFK/JuO6zHqiqUV4X/kRPD7g?=
 =?us-ascii?Q?G+tfPX7F4yoSTU7gpjDsNmqrI6EeguGDyQ9D+1/cdlcm+kta3xkeV5kc5WZS?=
 =?us-ascii?Q?p//RmYwtk+95YTpX0JebMOqLt6Ks5jQGKaX5rje2hkqYzmFXOJqhKz3Brs71?=
 =?us-ascii?Q?gIPQukeQc64Am1d2SZav2d5di9394oKUnNNVSYMoQV8r2z6TaT0aDHa3+Zy1?=
 =?us-ascii?Q?1X8u3YCfs4QbRRqMAMQVWB269dTEHOAf6CuEeSSFdmETL40omouhjZ9zU3+H?=
 =?us-ascii?Q?VmgHFsehs1lioLIePRNfRaiHISP+ct4iamW5DIgPc46x6yZ3yHnChZ1Nqwgq?=
 =?us-ascii?Q?EM5PRkaxfQYq0h7R1od7nwqXbT4EZZr/Yq4E7U6Pp+p/IcDWR0qKZT3Cuobb?=
 =?us-ascii?Q?7QZc+Yh0NJC4zBAVIbijhSpoo0N3P+9RulNJVsmgG+cMqDgLlMVjXsZqN885?=
 =?us-ascii?Q?L94HHwWbocv6PsYn5xjiiXQG9wh0vTOvGyYLqQVeVdeHtH6ERAGWzJEwJWs3?=
 =?us-ascii?Q?gIfbLzA8550LbtxwxCslNW0b++a4HYhsWK/HgJv1rCxGf2lPZwHBdcI2V96s?=
 =?us-ascii?Q?bU3fOxn1GTQRkAMOCIZmiIH0rsaX2JqCjRfx9EdSsEcOip3kUOR/X5gL8SEJ?=
 =?us-ascii?Q?ux3/uH3GZN5utbBZ4LzGHKZrSakSlb7+/azwC2GXKn1CRW5gocvAWcyf6Y0c?=
 =?us-ascii?Q?5MDEl94ncDcAbFSvjxAGDiMu+aRXHaHMFu9OA4quNPIXYnkaZUTB2v1hFny9?=
 =?us-ascii?Q?60v/CRfS3fKsRluXtToWG+WwVI+0GN8=3D?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: d76536f5-b40b-4e31-9e1a-08df21cd4dad
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2026 04:09:36.4925
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YTNm6XUIMMxj8N0hTwIos2yu43jnvY23xANhRnAqAIWN2xnT/PahdahRNIq8jwYJctD5HTZ4iHPEr3ereHdL7ONdMhFNmEsRhQGGHZKINI/RjVXAAkr75A28yov+Ov5g
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_210958_520538_4580BE6B 
X-CRM114-Status: GOOD (  27.62  )
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

Hi, Brain

Thanks for the review.

> Hi Changhuang,
> 
> On Wed, Sep 30, 2026 at 05:43:04AM -0700, Changhuang Liang wrote:
> > Add support for JHB100 System-2 clock generator (SYS2CRG).
> >
> > Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> > ---
> >  drivers/clk/starfive/Kconfig                  |  10 ++
> >  drivers/clk/starfive/Makefile                 |   1 +
> >  .../clk/starfive/clk-starfive-jhb100-sys2.c   | 129 ++++++++++++++++++
> >  3 files changed, 140 insertions(+)
> >  create mode 100644 drivers/clk/starfive/clk-starfive-jhb100-sys2.c
> >
> > diff --git a/drivers/clk/starfive/Kconfig
> > b/drivers/clk/starfive/Kconfig index 11da8bcc4046..cfaac934a8e0 100644
> > --- a/drivers/clk/starfive/Kconfig
> > +++ b/drivers/clk/starfive/Kconfig
> > @@ -92,3 +92,13 @@ config CLK_STARFIVE_JHB100_SYS1
> >  	help
> >  	  Say yes here to support the system-1 clock controller on the
> >  	  StarFive JHB100 SoC.
> > +
> > +config CLK_STARFIVE_JHB100_SYS2
> > +	bool "StarFive JHB100 system-2 clock support"
> > +	depends on ARCH_STARFIVE || COMPILE_TEST
> > +	select CLK_STARFIVE_JH71X0
> > +	select RESET_STARFIVE_JHB100 if RESET_CONTROLLER
> > +	default ARCH_STARFIVE
> > +	help
> > +	  Say yes here to support the system-2 clock controller on the
> > +	  StarFive JHB100 SoC.
> > diff --git a/drivers/clk/starfive/Makefile
> > b/drivers/clk/starfive/Makefile index 0061550e0f7e..29cdef20575e
> > 100644
> > --- a/drivers/clk/starfive/Makefile
> > +++ b/drivers/clk/starfive/Makefile
> > @@ -13,3 +13,4 @@ obj-$(CONFIG_CLK_STARFIVE_JH7110_VOUT)	+=
> clk-starfive-jh7110-vout.o
> >
> >  obj-$(CONFIG_CLK_STARFIVE_JHB100_SYS0)		+=
> clk-starfive-jhb100-sys0.o
> >  obj-$(CONFIG_CLK_STARFIVE_JHB100_SYS1)		+=
> clk-starfive-jhb100-sys1.o
> > +obj-$(CONFIG_CLK_STARFIVE_JHB100_SYS2)		+=
> clk-starfive-jhb100-sys2.o
> > diff --git a/drivers/clk/starfive/clk-starfive-jhb100-sys2.c
> > b/drivers/clk/starfive/clk-starfive-jhb100-sys2.c
> > new file mode 100644
> > index 000000000000..a2c7e8eba9b6
> > --- /dev/null
> > +++ b/drivers/clk/starfive/clk-starfive-jhb100-sys2.c
> > @@ -0,0 +1,129 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * StarFive JHB100 System-2 Clock Driver
> > + *
> > + * Copyright (C) 2024 StarFive Technology Co., Ltd.
> > + *
> > + * Author: Changhuang Liang <changhuang.liang@starfivetech.com>
> > + *
> > + */
> > +
> > +#include <dt-bindings/clock/starfive,jhb100-crg.h>
> > +#include <linux/init.h>
> > +#include <linux/platform_device.h>
> > +
> > +#include "clk-starfive-jh71x0.h"
> > +
> > +#define JHB100_SYS2CLK_NUM_CLKS
> 	(JHB100_SYS2CLK_MAIN_ICG_EN_JTAG1 + 1)
> > +
> > +/* external clocks */
> > +#define JHB100_SYS2CLK_OSC
> 	(JHB100_SYS2CLK_NUM_CLKS + 0)
> > +#define JHB100_SYS2CLK_PLL1
> 	(JHB100_SYS2CLK_NUM_CLKS + 1)
> > +#define JHB100_SYS2CLK_GPU0_NCNOC_INIT
> 	(JHB100_SYS2CLK_NUM_CLKS + 2)
> > +#define JHB100_SYS2CLK_GPU1_NCNOC_INIT
> 	(JHB100_SYS2CLK_NUM_CLKS + 3)
> > +
> > +static const char * const jhb100_sys2_ext_clk[] = {
> > +	"osc",
> > +	"pll1",
> > +	"gpu0_ncnoc_init",
> > +	"gpu1_ncnoc_init",
> > +};
> > +
> > +static const struct jh71x0_clk_data jhb100_sys2crg_clk_data[] = {
> > +	/* jtag mst*/
> > +	JH71X0__DIV(JHB100_SYS2CLK_JTAGM0_HCLK, "jtagm0_hclk", 6,
> > +		    JHB100_SYS2CLK_PLL1),
> > +	JH71X0__DIV(JHB100_SYS2CLK_JTAGM1_HCLK, "jtagm1_hclk", 6,
> > +		    JHB100_SYS2CLK_PLL1),
> > +	JH71X0__DIV(JHB100_SYS2CLK_JTAGM0_ATPG, "jtagm0_ATPG", 12,
> > +		    JHB100_SYS2CLK_PLL1),
> > +	JH71X0__DIV(JHB100_SYS2CLK_JTAGM1_ATPG, "jtagm1_ATPG", 12,
> > +		    JHB100_SYS2CLK_PLL1),
> > +	JH71X0__DIV(JHB100_SYS2CLK_JTAGM0_ATPG_TCLOCK,
> "jtagm0_atpg_tclock", 2,
> > +		    JHB100_SYS2CLK_JTAGM0_ATPG),
> > +	JH71X0__DIV(JHB100_SYS2CLK_JTAGM1_ATPG_TCLOCK,
> "jtagm1_atpg_tclock", 2,
> > +		    JHB100_SYS2CLK_JTAGM1_ATPG),
> > +	JH71X0_GATE(JHB100_SYS2CLK_JTAG0_MST_WRAP_HCLK,
> "jtag0_mst_wrap_hclk",
> > +		    CLK_IGNORE_UNUSED, JHB100_SYS2CLK_JTAGM0_HCLK),
> 
> Can you leave a comment somewhere about why CLK_IGNORE_UNUSED is
> on some of these clocks? We may be able to deprecate this flag once some
> variation of the clk sync_state support lands:
> 
> https://lore.kernel.org/linux-clk/20260626-clk-sync-state-v1-0-4156d8196dc
> 8@redhat.com/
> 
> 

There are some clocks that we do not consume through a driver. Currently, 
CLK_IGNORE_UNUSED can keep them in their hardware default state (always on). 
If there is an intention to deprecate this flag, in the next version I may need to 
replace it with CLK_IS_CRITICAL.

> > +	JH71X0_GATE(JHB100_SYS2CLK_JTAG0_MST_WRAP_CLK_JTAG,
> "jtag0_mst_wrap_clk_jtag",
> > +		    CLK_IGNORE_UNUSED, JHB100_SYS2CLK_JTAGM0_HCLK),
> > +	JH71X0_GATE(JHB100_SYS2CLK_JTAG0_MST_WRAP_APB_PCLK,
> "jtag0_mst_wrap_apb_pclk",
> > +		    CLK_IGNORE_UNUSED, JHB100_SYS2CLK_JTAGM0_ATPG),
> > +	JH71X0_GATE(JHB100_SYS2CLK_JTAG0_MST_WRAP_ATPG_TCLOCK,
> "jtag0_mst_wrap_atpg_tclock",
> > +		    CLK_IGNORE_UNUSED, JHB100_SYS2CLK_JTAGM0_ATPG),
> > +	JH71X0_GATE(JHB100_SYS2CLK_JTAG1_MST_WRAP_HCLK,
> "jtag1_mst_wrap_hclk",
> > +		    CLK_IGNORE_UNUSED, JHB100_SYS2CLK_JTAGM1_HCLK),
> > +	JH71X0_GATE(JHB100_SYS2CLK_JTAG1_MST_WRAP_CLK_JTAG,
> "jtag1_mst_wrap_clk_jtag",
> > +		    CLK_IGNORE_UNUSED, JHB100_SYS2CLK_JTAGM1_HCLK),
> > +	JH71X0_GATE(JHB100_SYS2CLK_JTAG1_MST_WRAP_APB_PCLK,
> "jtag1_mst_wrap_apb_pclk",
> > +		    CLK_IGNORE_UNUSED, JHB100_SYS2CLK_JTAGM1_ATPG),
> > +	JH71X0_GATE(JHB100_SYS2CLK_JTAG1_MST_WRAP_ATPG_TCLOCK,
> "jtag1_mst_wrap_atpg_tclock",
> > +		    CLK_IGNORE_UNUSED, JHB100_SYS2CLK_JTAGM1_ATPG),
> > +	/* hostusbcmn */
> > +	JH71X0__DIV(JHB100_SYS2CLK_HOSTUSB_NCNOC_TARG,
> "hostusb_ncnoc_targ", 12,
> > +		    JHB100_SYS2CLK_PLL1),
> > +	JH71X0__DIV(JHB100_SYS2CLK_HOSTUSBCMN_CFG_500,
> "hostusbcmn_cfg_500", 4,
> > +		    JHB100_SYS2CLK_PLL1),
> > +	/* bmcperiph1 */
> > +	JH71X0__DIV(JHB100_SYS2CLK_BMCPER1_NCNOC_TARG,
> "bmcper1_ncnoc_targ", 6,
> > +		    JHB100_SYS2CLK_PLL1),
> > +	JH71X0__DIV(JHB100_SYS2CLK_BMCPER1_CFG_250,
> "bmcper1_cfg_250", 5,
> > +		    JHB100_SYS2CLK_PLL1),
> > +	JH71X0__DIV(JHB100_SYS2CLK_BMCPER1_CFG_143_DFT,
> "bmcper1_cfg_143_dft", 8,
> > +		    JHB100_SYS2CLK_PLL1),
> > +	JH71X0_GATE(JHB100_SYS2CLK_BMCPER1_CFG_143,
> "bmcper1_cfg_143",
> > +CLK_IS_CRITICAL,
> 
> Also please leave a comment why CLK_IS_CRITICAL is needed as well for
> these particular clocks.

OK.

Best Regards,
Changhuang

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
