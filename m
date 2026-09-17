Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD5D1C982D0
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2026 06:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=urubFV+nWP8zwFl7hUQPPW0uq9NhX6kY1+82YdRCBkQ=; b=BQE9DHKyzovzKV
	qIFOQsxI+UoN1FxoI+dq9AkdR8RZDeePfp4x6E8maOsMX96se9XYvgkEHDoCi1XNFqikREMOO79uq
	4Z2K8tSVDpfnc6emFdyIab0x6xx9BJLlxaPsFxMlaU+hVvyWvcoUmt9lZjTLnRNcEgk1XsNvxxTH5
	eZJbnImSpjUGt8PUVPTM7MntM6/WStnvl7m/RCE1Hbj0YSdW9Ln+w3OgaMbyZjuvhlO1XgUvIc40/
	vSc1pde9nqDQRJ6Va4bBMyk2bTDp2ea8a1wO18KRaMy6Iho5aFgD4XeaNP6Eyiw2z4At+5Yt/6k68
	iaRhtkZaJkzXyiKjYZeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x75vA-0000000AhDX-1JP3;
	Thu, 17 Sep 2026 06:48:36 +0000
Received: from mail-bjschn02on2071c.outbound.protection.partner.outlook.cn ([2406:e500:4440:2::71c] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x75v7-0000000AhCS-2yMU
	for linux-riscv@lists.infradead.org;
	Thu, 17 Sep 2026 06:48:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W7JrE9SwdPJFbviZY/Wj3Qgr4ZANwt/9Gt5CqblkjAU20AXESR1WRfXtOuDfolZaSS/U1YPenmi72bVfjdJ+oFd3fxQTv7uHtiKwHvbwM/J32l9Q3MnbnzDzLCU20lxVWHPOW805ASnF3KyWsc552jOQg/pdPU7l6ezvcX50aQR++wqopy+YB/9OIKP4/6fIQTBa0LuOoGRCyRDrgB2sQeAOrEyUe4K1jhRn44g4Qf/Up09utF/M1+nGr0pjWH4qHHsg2Ag7fBHG1VvooXjJQQphfBtOrshkDJIh6ZeqU0hq3ebqfCnBYZ6RYqUnAjSXhqSMUIfxWTdvnWxbFM6n0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nxTfuxKOzBUycuL6ZVv4D6v+eeZnC979O1TthdnxqMw=;
 b=U9F4XHEiTybZ0GGrFaCGzC29YhwZP7nEgpcoL4gbKCXvrT9k9CGOhg9EjM4FUemj9hImnYq7TQXabrfogmjQ+Nt4KJmA+h5DgveFSaN9NJolN0gOQtPSaPpIT01VX8XoAF04AfLcFBibUveJN2EhQdOR9d2/KwPJBCQ7lzVzn9GnezxJElGNKZKcUtrV3qxFvplXea0eZ28/1WQYUUaweqX2pfL812pUspKyT28vKIgsnJ0Ih6OPgakkA5UYs5ktuvdc89gPfcv8ygSakhd1LOdEo4AN3WOu5/GNdffDPvyCcM6U2jkfkfq2NcPAIrIg2/elOTvZhoJPDnd3+ZJwtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:7::10) by NT0PR01MB1232.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:11::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.12; Thu, 17 Sep
 2026 06:48:05 +0000
Received: from NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn
 ([fe80::be4a:d29e:5188:b37e]) by
 NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn ([fe80::be4a:d29e:5188:b37e%3])
 with mapi id 15.21.0428.011; Thu, 17 Sep 2026 06:48:05 +0000
From: Hal Feng <hal.feng@starfivetech.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>, Michael Turquette
	<mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Stephen Boyd
	<sboyd@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
	<alex@ghiti.fr>, Philipp Zabel <p.zabel@pengutronix.de>, Emil Renner Berthing
	<kernel@esmil.dk>, Kees Cook <kees@kernel.org>, "Gustavo A . R . Silva"
	<gustavoars@kernel.org>, Richard Cochran <richardcochran@gmail.com>
CC: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>
Subject: RE: [PATCH v3 21/22] reset: starfive: Add StarFive JHB100 reset
 driver
Thread-Topic: [PATCH v3 21/22] reset: starfive: Add StarFive JHB100 reset
 driver
Thread-Index: AQHdJmAZtVTBvzQQZk6B6MFz6FOdgLbSjkyA
Date: Thu, 17 Sep 2026 06:48:05 +0000
Message-ID: <NT0PR01MB110298B34F8DFB2791A129FCE6B82@NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn>
References: <20260807112923.191627-1-changhuang.liang@starfivetech.com>
 <20260807112923.191627-22-changhuang.liang@starfivetech.com>
In-Reply-To: <20260807112923.191627-22-changhuang.liang@starfivetech.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: NT0PR01MB1102:EE_|NT0PR01MB1232:EE_
x-ms-office365-filtering-correlation-id: 88be15f9-1281-4e3d-1fe5-08df1487a08e
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|23010399003|921020|38070700021|22082099003|18002099003|56012099006|4143699003|10067099003;
x-microsoft-antispam-message-info: yPziQVRT0Heq39+R1QCRihgwOw8kioQm4deFHeOgHW3xnCHm+6QU3rDiWzeNewNHJRbICM9cS5W12pkSTrIz7BqNQ1WBj5zxlqY38EqK0sW127eKnlATN9l/hv8aduEg5YBmoIkEfZMJ9fjb2w1lNvakStj4caXlqA4ULKlk7ZqjR52s5fclf++MIkubVmK7Ls5JUhncWY5db9Mh5YAzJUgUBP4tvV8MOaxNqPxxM4r6yti674Q0J2p3a5e6ccbT+T7DN8OdL37q6WOQ2LJO3/fJDOrONSlJOEWF1YPSYuzMsmgUX5CBBadZItQgdM9aGLhxbG6N5v6pBkpiiovWF2qncKLRh9O5UzmvIaKQCkiRki4MtSuJbLFLF2+ft6iI2r+ZNhH3mKkiYDqdQO1oIFBG4HcpyjWLs4w4YZl6PIu0dghL22qLrgwfhrr7xU0NnETMnRSGElNZ1lXsdm1wiWpoYtcJzRenxa2lxWBeqa7QHbr5DCH3BLIPRvSPP7uMAZL7DjGEDiWKCnAqpayndgWobtbw2N8PgkOKFzm0Py7ZjVZ/w7kqrqwW1dLcz7OziJHTuMTxLRVdIV/Pd+aYLw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(23010399003)(921020)(38070700021)(22082099003)(18002099003)(56012099006)(4143699003)(10067099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Z1X0tjk51R6DjEvjPqCFWOOKTONoLRmPD65fR27LV40ybUYZfkHBP671Hzr+?=
 =?us-ascii?Q?l3Fb98gEbLpWjWdAErU9KcXqUEqP7efLovjzhoETwCBAVSgso5bOU7QtNcOa?=
 =?us-ascii?Q?VAcZ7RMmUbBCwP54/+Gi0DUQufbj0jVSnBUycHpk1xtdb3+uLXehMq9LkyCL?=
 =?us-ascii?Q?bFerDLL5wlVSugsq6o2mBly8WcLETDEQyqZLaHxzhfOvcf/Jb4b5MLiI73qr?=
 =?us-ascii?Q?UVQdyDiuErl6/oemJcpHDv3PFiKwqKAl1SWBT4oJPqb3u5xIKCWJooENy+CT?=
 =?us-ascii?Q?pxMvgM0B5A7/SzGdRqTbE2kgkXfKBUZkBI7zyAM2mL90p9QLr79nTziADuID?=
 =?us-ascii?Q?ClvaFT+Dp0X+S/OI9PT49jp43VRj85bv/H4asIEj4+QV2AKxJOrhgnhY9FYF?=
 =?us-ascii?Q?KuJV63titkwCblufgFrEjxuA2om/fQAlEhgXjumwwCS70w6nbKgQYdSMnYv1?=
 =?us-ascii?Q?p/oj62FvWiBQ5YrTBh7FG7mX3gucslgXiwhGZs267SqGjvhvUb+kA0ca/546?=
 =?us-ascii?Q?b3wH589YoElx8khleEvj674cJQgpHnYSEcig7KtqT9hC5bf+HPw8kdJ5DnbN?=
 =?us-ascii?Q?ytoCqzUOGdSJg7DqW4BF8xBexioldIsP+lUnqWvqZxkhB1mwuDUdGqF5g8xa?=
 =?us-ascii?Q?qqLWWRQbOW0H/hBvPXK2R7W/FCVMykrA3fyhIev/quyw/CLq47oLw5m4yLMY?=
 =?us-ascii?Q?z3QyAbw9uM0qd3/+d63uusF/GsvXm3pXyHGKjI+IXpbd8GMvlQcgkr4wFXU/?=
 =?us-ascii?Q?FoDQxVnne0ohZN+2snvgsk6qmcqzYrAqvz42WJThdMoFwTg9BbtDcD1EBhRB?=
 =?us-ascii?Q?TmnIwytAaGPSEeYmQkDjXgfcABXuxBt6TotVJ6WwHK5ZIh9SIIV4clX2gIQm?=
 =?us-ascii?Q?P0WkyDTCaL790kRdRasPYEMOGOJZXzQR2cd46ZKVQU+NRNvsaezBKGac5kkI?=
 =?us-ascii?Q?IfeOb3R1WJ+t5Ac2C8W1KEQOEpKIcEEkpdaJ9cTKBbsd+8YdV5XfdXLXQQQE?=
 =?us-ascii?Q?tMNPjDrGPRY8QcFafAZtFlEpvECsEzNveUEi8IM7jpPj+pmgr3sUtX9ye/UJ?=
 =?us-ascii?Q?n6m8ZFFkJnp0+dQH1+k5BsXach9DVQXdlExI2wptcGLJ5PomnHg1YzRJ/kIG?=
 =?us-ascii?Q?0KFQ+aK6hjMV/J9CvgJjVmZKebMfNPMY+mYyIkRonEdux4ecZtv+b9EJoaeE?=
 =?us-ascii?Q?CSLsrdn0chCck0Vufr7ZSpO4Vr4K9S6v9OGfLBYkwaE7Ii6BMnG7ZcE7q5Rq?=
 =?us-ascii?Q?QmJ1NKDCWFD9akc9fOL6BOHNyOO8oeWjOpB7OEeOKKhFxJBkYUsUTdxBmlCc?=
 =?us-ascii?Q?76ymbhv322a9N0AfKBQu5PB9FZtH1jsNoR5iGg4NBjaSRtsinhCXNOWFZtkF?=
 =?us-ascii?Q?N9Av3oMBwCQ9O0sFMh/DK6FZTbf9HywdR9qHRF+FmaNiHq+5AzLeljx9zvv2?=
 =?us-ascii?Q?H43pbJw49gsCF9D9YeNomH8WYHu0h4F5KakefO1E611a5XxwSrtV1OsJnML/?=
 =?us-ascii?Q?Zpd8mkDRvCGIDDx/hWcT8bjhb6ukRb1Fb/87gdLPkLi2Ksj4Dk/JD3eofLc1?=
 =?us-ascii?Q?hCBEX605ItrTFKXoNP/d893+6KkgunWkMKVRHbI6xWHXuQzH5F9cNdq8NhIm?=
 =?us-ascii?Q?4lOXF7M9BpB5ryEo9XTVvSvAdISG/1FnwcLGfJHMS3dU9HtXGwg9gLeq0fHe?=
 =?us-ascii?Q?vT4RVJwhEX2XeIp/txr+DZmq3guWfqN0W0Y0kbVTsV3bffm/avcRg3DHN7Hs?=
 =?us-ascii?Q?k8XRU8V1rQ=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 88be15f9-1281-4e3d-1fe5-08df1487a08e
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2026 06:48:05.5662
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8XaPnogvZvdWLmmz1e2fQpw7qKWMS5oZfgZ8OTuiieS965VHobTUIHjH0XW4ga+PotIX36jclrFT8iPX+19EUtGTRbhOfa+E62j7IC4P0YU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NT0PR01MB1232
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_234833_939417_CB5F44B3 
X-CRM114-Status: GOOD (  26.05  )
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

> On 26.08.07 19:29, Changhuang Liang wrote:
> Add auxiliary reset driver to support StarFive JHB100 SoC.
> The StarFive JHB100 SoC has discontiguous reset IDs. A new function
> reset_starfive_register_with_info() is introduced to support both contiguous
> and discontiguous hardware designs.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  MAINTAINERS                                   |   6 +
>  drivers/reset/starfive/Kconfig                |   9 +
>  drivers/reset/starfive/Makefile               |   1 +
>  .../reset/starfive/reset-starfive-common.c    |  99 +++++-
>  .../reset/starfive/reset-starfive-common.h    |  19 ++
>  .../reset/starfive/reset-starfive-jhb100.c    | 302 ++++++++++++++++++
>  6 files changed, 425 insertions(+), 11 deletions(-)  create mode 100644
> drivers/reset/starfive/reset-starfive-jhb100.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c48b56d0ab94..709600e80951 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -26088,6 +26088,12 @@ S:	Supported
>  F:
> 	Documentation/devicetree/bindings/interrupt-controller/starfive,jhb100
> -intc.yaml
>  F:	drivers/irqchip/irq-starfive-jhb100-intc.c
> 
> +STARFIVE JHB100 RESET CONTROLLER DRIVERS
> +M:	Changhuang Liang <changhuang.liang@starfivetech.com>
> +S:	Maintained

'Supported' is better.

> +F:	drivers/reset/starfive/reset-starfive-jhb1*
> +F:	include/dt-bindings/reset/starfive,jhb1*.h
> +
>  STATIC BRANCH/CALL
>  M:	Peter Zijlstra <peterz@infradead.org>
>  M:	Josh Poimboeuf <jpoimboe@kernel.org>
> diff --git a/drivers/reset/starfive/Kconfig b/drivers/reset/starfive/Kconfig
> index 29fbcf1a7d83..ce00495be6ad 100644
> --- a/drivers/reset/starfive/Kconfig
> +++ b/drivers/reset/starfive/Kconfig
> @@ -19,3 +19,12 @@ config RESET_STARFIVE_JH7110
>  	default ARCH_STARFIVE
>  	help
>  	  This enables the reset controller driver for the StarFive JH7110 SoC.
> +
> +config RESET_STARFIVE_JHB100
> +	bool "StarFive JHB100 Reset Driver"
> +	depends on CLK_STARFIVE_COMMON || COMPILE_TEST
> +	select AUXILIARY_BUS
> +	select RESET_STARFIVE_COMMON
> +	default ARCH_STARFIVE
> +	help
> +	  This enables the reset controller driver for the StarFive JHB100 SoC.
> diff --git a/drivers/reset/starfive/Makefile b/drivers/reset/starfive/Makefile
> index 582e4c160bd4..217002302a9f 100644
> --- a/drivers/reset/starfive/Makefile
> +++ b/drivers/reset/starfive/Makefile
> @@ -3,3 +3,4 @@ obj-$(CONFIG_RESET_STARFIVE_COMMON)		+=
> reset-starfive-common.o
> 
>  obj-$(CONFIG_RESET_STARFIVE_JH7100)		+= reset-starfive-jh7100.o
>  obj-$(CONFIG_RESET_STARFIVE_JH7110)		+= reset-starfive-jh7110.o
> +obj-$(CONFIG_RESET_STARFIVE_JHB100)		+= reset-starfive-jhb100.o
> diff --git a/drivers/reset/starfive/reset-starfive-common.c
> b/drivers/reset/starfive/reset-starfive-common.c
> index 772bdf6763d1..86dbb33bb216 100644
> --- a/drivers/reset/starfive/reset-starfive-common.c
> +++ b/drivers/reset/starfive/reset-starfive-common.c
> @@ -14,6 +14,8 @@
> 
>  #include "reset-starfive-common.h"
> 
> +#define STARFIVE_RESET_ID_INVALID	ULONG_MAX
> +
>  struct starfive_reset {
>  	struct reset_controller_dev rcdev;
>  	/* protect registers against concurrent read-modify-write */ @@ -21,6
> +23,11 @@ struct starfive_reset {
>  	void __iomem *assert;
>  	void __iomem *status;
>  	const u32 *asserted;
> +
> +	/* Only exists in reset controllers that use the
> +	 * reset_starfive_register_with_info helper.
> +	 */
> +	const struct starfive_reset_info *info;
>  };
> 
>  static inline struct starfive_reset *
> @@ -29,19 +36,40 @@ starfive_reset_from(struct reset_controller_dev
> *rcdev)
>  	return container_of(rcdev, struct starfive_reset, rcdev);  }
> 
> +static unsigned long
> +starfive_reset_id_to_hw_id(const struct starfive_reset_map *map, unsigned
> int nr_resets,
> +			   unsigned long reset_id)
> +{
> +	for (u32 i = 0; i < nr_resets; i++) {
> +		if (map[i].reset_id == reset_id)
> +			return map[i].hw_id;
> +	}
> +
> +	return STARFIVE_RESET_ID_INVALID;
> +}
> +
>  static int starfive_reset_update(struct reset_controller_dev *rcdev,
>  				 unsigned long id, bool assert)
>  {
>  	struct starfive_reset *data = starfive_reset_from(rcdev);
> -	unsigned long offset = id / 32;
> -	u32 mask = BIT(id % 32);
> -	void __iomem *reg_assert = data->assert + offset * sizeof(u32);
> -	void __iomem *reg_status = data->status + offset * sizeof(u32);
> -	u32 done = data->asserted ? data->asserted[offset] & mask : 0;
> -	u32 value;
> -	unsigned long flags;
> +	unsigned long offset, flags;
> +	void __iomem *reg_assert;
> +	void __iomem *reg_status;
> +	u32 mask, done, value;
>  	int ret;
> 
> +	if (data->info && data->info->discontiguous) {
> +		id = starfive_reset_id_to_hw_id(data->info->map,
> data->info->nr_resets, id);
> +		if (id == STARFIVE_RESET_ID_INVALID)
> +			return -EINVAL;
> +	}
> +
> +	offset = id / 32;
> +	mask = BIT(id % 32);
> +	reg_assert = data->assert + offset * sizeof(u32);
> +	reg_status = data->status + offset * sizeof(u32);
> +	done = data->asserted ? data->asserted[offset] & mask : 0;
> +
>  	if (!assert)
>  		done ^= mask;
> 
> @@ -89,10 +117,20 @@ static int starfive_reset_status(struct
> reset_controller_dev *rcdev,
>  				 unsigned long id)
>  {
>  	struct starfive_reset *data = starfive_reset_from(rcdev);
> -	unsigned long offset = id / 32;
> -	u32 mask = BIT(id % 32);
> -	void __iomem *reg_status = data->status + offset * sizeof(u32);
> -	u32 value = readl(reg_status);
> +	void __iomem *reg_status;
> +	unsigned long offset;
> +	u32 mask, value;
> +
> +	if (data->info && data->info->discontiguous) {
> +		id = starfive_reset_id_to_hw_id(data->info->map,
> data->info->nr_resets, id);
> +		if (id == STARFIVE_RESET_ID_INVALID)
> +			return -EINVAL;
> +	}
> +
> +	offset = id / 32;
> +	mask = BIT(id % 32);
> +	reg_status = data->status + offset * sizeof(u32);
> +	value = readl(reg_status);
> 
>  	if (!data->asserted)
>  		return !(value & mask);
> @@ -132,3 +170,42 @@ int reset_starfive_register(struct device *dev, struct
> device_node *of_node,
>  	return devm_reset_controller_register(dev, &data->rcdev);  }
> EXPORT_SYMBOL_GPL(reset_starfive_register);
> +
> +int reset_starfive_register_with_info(struct device *dev, struct device_node

Also, you add reset_starfive_register_with_info() but a very similar reset_starfive_register()
still remains. I think we can merge them.

Best regards,
Hal

> *of_node,
> +				      void __iomem *assert, void __iomem *status,
> +				      const u32 *asserted,
> +				      const struct starfive_reset_info *info,
> +				      struct module *owner)
> +{
> +	struct starfive_reset *data;
> +	int ret;
> +
> +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->rcdev.ops = &starfive_reset_ops;
> +	data->rcdev.owner = owner;
> +	data->rcdev.nr_resets = info->nr_resets;
> +	data->rcdev.dev = dev;
> +	data->rcdev.of_node = of_node;
> +
> +	spin_lock_init(&data->lock);
> +	data->assert = assert;
> +	data->status = status;
> +	data->asserted = asserted;
> +	data->info = info;
> +
> +	if (info->discontiguous && (!info->map || !info->nr_resets))
> +		return dev_err_probe(dev, -EINVAL,
> +				     "discontiguous controller without a valid ID
> map\n");
> +
> +	ret = devm_reset_controller_register(dev, &data->rcdev);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Failed to register reset
> +controller");
> +
> +	dev_info(dev, "Registered %u resets", data->rcdev.nr_resets);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(reset_starfive_register_with_info);
> diff --git a/drivers/reset/starfive/reset-starfive-common.h
> b/drivers/reset/starfive/reset-starfive-common.h
> index 83461b22ee55..0d4e634de58e 100644
> --- a/drivers/reset/starfive/reset-starfive-common.h
> +++ b/drivers/reset/starfive/reset-starfive-common.h
> @@ -6,9 +6,28 @@
>  #ifndef __RESET_STARFIVE_COMMON_H
>  #define __RESET_STARFIVE_COMMON_H
> 
> +struct starfive_reset_map {
> +	unsigned long reset_id;
> +	unsigned long hw_id;
> +};
> +
> +struct starfive_reset_info {
> +	unsigned int nr_resets;
> +	unsigned int assert_offset;
> +	unsigned int status_offset;
> +	bool discontiguous;
> +	const struct starfive_reset_map *map;
> +};
> +
>  int reset_starfive_register(struct device *dev, struct device_node *of_node,
>  			    void __iomem *assert, void __iomem *status,
>  			    const u32 *asserted, unsigned int nr_resets,
>  			    struct module *owner);
> 
> +int reset_starfive_register_with_info(struct device *dev, struct device_node
> *of_node,
> +				      void __iomem *assert, void __iomem *status,
> +				      const u32 *asserted,
> +				      const struct starfive_reset_info *info,
> +				      struct module *owner);
> +
>  #endif /* __RESET_STARFIVE_COMMON_H */
...

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
