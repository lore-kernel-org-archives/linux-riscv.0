Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C6C2C982CC
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2026 03:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2r9nm7BbmlQTf1vlfEkAg1+l+G70gcSz++Ij9re2IHE=; b=s9db53hNTGJEdu
	1n3c79lI+oaIhpfsmE5oODIo5z6XIupEQw3Tc3s4dQcwqiNg/TXA0Bj3hJ1mJCV1aUq7jDbbXirkC
	GlztOb52yrPPf/0it+iNLY02OZB7awOd0ssQZXIQCOTg13p7/HxRNGWgyRZg/9ZaWQdNllEU2em/7
	XP1o7FxUomFuxcje5tUnoC4aBCSydFm9fL7H0UXBLnC2X7xTEaMsVu7kJQrWWAlCjCRE7uTsd741j
	ogb9SbNYJQnDs1iDR3ASQfrlraOCzewRI2dag+QjJ1/DeDXDQ7k5GoHKXb4iyv5NrxHif3J6V6PHW
	v3DccPM6zfizIBsHyY6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x72kB-0000000AW0a-2eoL;
	Thu, 17 Sep 2026 03:25:03 +0000
Received: from mail-sh0chn02on20726.outbound.protection.partner.outlook.cn ([2406:e500:4420:2::726] helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x72k6-0000000AVzV-46jg
	for linux-riscv@lists.infradead.org;
	Thu, 17 Sep 2026 03:25:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ou/ubX20hI2gzNnGzyHvR6E9LmL5KLeg3rGUqCXCDUcZjLuV7f+KY8Cxp8qL1/i0OL52j67/vV66M+BGPxl5vxX3lPqT1LNq2C+++MiOe2xsbf+5Fe6aFpZXhgPuYQMHF5QYkmpaGbrtNbHq4DNAnhCN12ymEBR6TDjVFarXOqFwSX5Zjt49czYfu611IyIY1GGqmJHr22X+g6yNvMlDp6AgyQmcc2EHc59MH2+NL2eO7Axxp2GPF8RgjLPZFUnXQkXMt64ijonbBCEAFOeGKy5DGXMtM4y6vi1iAzhsGP9vHru2QUBXr91cMhVw0fgF+C+jqn2fNeK3lipFHrEO2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z/refKaCC6xtvm+pu+7iacmEhgN1u74BeLLhBlyWypg=;
 b=bs79uQLzSo8iTlq/0QFQUwZmzdZ/N8BPmfv1KD9UBX5tPb4g1eeqXxghS4mV1mTHh/QXXGB2eE+1o6lrHJoB113wzv+c4EenS0tIl5Mq/zMOjC1/u6xBd/O/4ETi8s5Fw+6qxauPRc2rylYn3mFaP6eYccCqm6BZNSdZipoDXci3BI7X8Rn/vBikuHn2VbBpYTu10rC/648Ki2+ATY+oA+EFEAvuFLEPpGNTik6e4fPkmeNLuFvRn0Wy520ojzgPNl4cgQoM6YvlxI9M7cD74lyxBJHEm67iSC4EG8agYyxRVqyyWCN6grwUC0AWJyPp7dSKrGrmOm5ZEDYgWCXfCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:7::10) by NT0PR01MB1037.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:6::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.12; Thu, 17 Sep
 2026 03:23:57 +0000
Received: from NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn
 ([fe80::be4a:d29e:5188:b37e]) by
 NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn ([fe80::be4a:d29e:5188:b37e%3])
 with mapi id 15.21.0428.009; Thu, 17 Sep 2026 03:23:57 +0000
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
Subject: RE: [PATCH v3 06/22] clk: starfive: Add JHB100 System-0 clock
 generator driver
Thread-Topic: [PATCH v3 06/22] clk: starfive: Add JHB100 System-0 clock
 generator driver
Thread-Index: AQHdJmAKH+uB2bFZvEWNz4Ntj/CabbbSVL3g
Date: Thu, 17 Sep 2026 03:23:57 +0000
Message-ID: <NT0PR01MB110298F21FF8FC06DB4EAE34E6B82@NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn>
References: <20260807112923.191627-1-changhuang.liang@starfivetech.com>
 <20260807112923.191627-7-changhuang.liang@starfivetech.com>
In-Reply-To: <20260807112923.191627-7-changhuang.liang@starfivetech.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: NT0PR01MB1102:EE_|NT0PR01MB1037:EE_
x-ms-office365-filtering-correlation-id: 66269a11-72b8-4f7e-5b3d-08df146b1c00
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|23010399003|921020|38070700021|22082099003|18002099003|3023799007|56012099006|4143699003|10067099003;
x-microsoft-antispam-message-info: MAfu6c0G1NEgfiUeVRQ+6RocEzjjIR4FAA558Np82eofyHqrk+myNSTktfR6vHEkYisLmcmg9trIfyrkmfin4dn5W/ZMA69GolT/OQQ7GxD0OheByXRjO3cPYFuYJmP06kY2NX4pbGDdXIGwAy8mY9cl7xFrjZVuenoTOcqV+8ZWlUIxmEPPG8q3qZqKsuyn5sw+zJb3eqk3OA9l+STukCv3FCBauWpx6QCKIE9xynYucfoTcJ0nmIKu/gFL1m/Mf3uN+hfuFKq2Ymv+fXzOmk+wjN26/N5xqsSbXlH0WsNydWxwENA+p14OR4aPhlKRmOkMgW7JwaKI22J1s2v+fUu14+holh85Xq0nqbNFrE2f/x9e0HEAId5F96Gru8as5efhVL/+DZh6kx+U+SJVJTuVZ/5JxSx56cb7AQfY0bSt21SmqUB8vx8Et6KdSfD/bK91BqBlO96/ETGJ2wRxUoP8ZMjorlvetkkrx+u+e6A5w6oDwEiHTlhh+lLqngftS8ubsBNMomUyeXuHx/DVTEZvWHW8LYbUB2Jyk4i1MwzI113M3swLsVs7Ws5qQ/GsjMC/NIpuVoLrBY/imIUIGA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(23010399003)(921020)(38070700021)(22082099003)(18002099003)(3023799007)(56012099006)(4143699003)(10067099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?vvjGzC5g+7EjO1Z9w39tdQ0qF5Cf9wQ/9QeOcyMjbCUF73382p+vwGLXPUjo?=
 =?us-ascii?Q?dLw4nuytXVp5CeP+JPZsdYb3BujegBH0Tuz19JkgXf62KsnMfulYC2i+h1xa?=
 =?us-ascii?Q?u8XB6soRzKpkGcYJMQAOy8ve2b8UsodQzdSe9K0/+eNjaJ6D4QU5fKCS0mVV?=
 =?us-ascii?Q?F6BcL0hFLcxTPB756x1Lw88OTN+xQ8lh/7MFl+e5RXtBdv12xKkPfsnBPKUi?=
 =?us-ascii?Q?iKEAhCixMw8jU7roaQO4Kl0L5himaBk3FHRxAlEaJ6PHP/vn4uBpeg3RxrQO?=
 =?us-ascii?Q?hFY/EFLQtB490rBsUUhWMxgA7Zn7XxlGcMTgApD/HFvywql3mnv09WPLSpvz?=
 =?us-ascii?Q?gZ8+28/2MlzL7DXSiOYqUX4S7fPIscFkX4uRgzdj6BXcIc7XvwAJZ9Z7cLyb?=
 =?us-ascii?Q?sNRpeHYZZhlXpVHl9AnwGINJN6u2HAjdq4VsvdtqAl9knspItDrv+1aW1LyP?=
 =?us-ascii?Q?OhzEKGtWkjyR/orOdlK8LBdK4KCZr9VQI6/OApeQPX9FjT+jt1vYOaQT1kW3?=
 =?us-ascii?Q?4jH8on/jAF0EcZl87Ib9ky8nXZ4WPSolkgQUhIbtVmR4HE/7btJkLjafSnHb?=
 =?us-ascii?Q?FbtIGneBOhHdr8MQPAUO+cGTbMlIQovVVRYu8dyFk4EN3uuS6RFcIDcoHKfY?=
 =?us-ascii?Q?z5TkoCG1y1u7F4QV1zOa+85G/4HZnMDTzA9F3Q7qy9BC2CG4ZBq9XxRTD3nh?=
 =?us-ascii?Q?D85M5T6T0MDOY3txRAAHdU15Cco+JyU5T5IA4aYLKRiExgTQpMkd3mfEOsU3?=
 =?us-ascii?Q?SHTt9uBE1pgymCmPDUYE0T1+qsOnYy7jqGsB/q5vLS41IzC75eJs1qsCVgqS?=
 =?us-ascii?Q?hBl75YIhObHu7nTn4otJlC0OPcOPK2o/PW4gcbp1PQH71lIRC/bjszm5WhFW?=
 =?us-ascii?Q?12wP7LMlWw4cbJUwjqCuSVhTE6Y4SfqaWuFQlf+gQMxSouuDGxCp250hg/x7?=
 =?us-ascii?Q?McV017QEMZvdKefuV8DXO/y7EF34+/gNs5qtHgDkuCS7FDsZJ00VYLFUuGsU?=
 =?us-ascii?Q?EZ/GjHmjLEdeCHbagDQYDQjHcsOI+UJIMiKG2TEU57cEs3mrJlS3SYXwrHUI?=
 =?us-ascii?Q?8Iv9+dRqBxEE0ZKdxjCgQzB6jqkk/2PWQIWFG0HJo/se9nq+A69/FM9Xv/PO?=
 =?us-ascii?Q?hXmiMXkbUpEDoNyZ0QpWN28miromw4Nb+sCaDbXHnpeq84UJ2LMdzJF9sM4B?=
 =?us-ascii?Q?hBeBol8ACjW4QCKpnWsIRT+wkzDckDeK240Cc94WToYWjkoADD57N4hQgHRf?=
 =?us-ascii?Q?kYarDfMMxJSqUDAmmqZ8Gs6zl+s1vFup9guP67j9cQu/FS/JYsNECkSdEFF7?=
 =?us-ascii?Q?Kf9l1ZchTm6qF/WyD+vNzHY04gLlArK3KybbjFrIGXgbY6CzrkTFqe6Z9ulL?=
 =?us-ascii?Q?QbLb1gbYeWH7SilhjVK8+aIGTnNWMEi2SSoYQ7KjktwtM0GsXzk22bxBWzuk?=
 =?us-ascii?Q?wwACc8nSl2dKic2Hys8a/fygAAGcazbDTi6bhCeoOKcqcFkdh+Qo/R9JhmtN?=
 =?us-ascii?Q?ib+uEBdLWNkdTulDv6h+dJex9fFIq7VhzGZebYC97mFn+ajKOmirKHJtKgt5?=
 =?us-ascii?Q?tkG94hdnEv++GGuY8XBeoIMIDGH5AVoY/aZDvRUwg17AY1StS2YufjPowIg0?=
 =?us-ascii?Q?o5/hHZyqXTyzfqKfsjT7Nk1doyJz+4OUbNMRaIY7biYomNuW+CKR9qQZooEa?=
 =?us-ascii?Q?l4DweZ5TGvIwwqmlU4xIry0PeQVlkW35FxdE45/P7k1wiToYF3O0Gb2kDBVb?=
 =?us-ascii?Q?rtNfhomX+g=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: NT0PR01MB1102.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 66269a11-72b8-4f7e-5b3d-08df146b1c00
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2026 03:23:57.3357
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Mnx+pKa5/jKKxRR+gTickI/rE8NVTbw0XbbdBxwTx1QeVdi4dMMfi8Z8+2bFazo2KueoFvo8ck2Ck/+kyWcO2FAr7IntFe2rwBNv3BxpH6Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NT0PR01MB1037
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_202459_164429_B214648D 
X-CRM114-Status: GOOD (  25.32  )
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
> Add support for JHB100 System-0 clock generator (SYS0CRG).
> 
> The StarFive JHB100 SoC has multiple CRGs with similar probe flows, so a
> generic starfive_crg_probe() function is introduced to facilitate the
> registration process of other CRGs in the future.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  MAINTAINERS                                   |   7 +
>  drivers/clk/starfive/Kconfig                  |  11 ++
>  drivers/clk/starfive/Makefile                 |   2 +
>  drivers/clk/starfive/clk-starfive-common.c    | 142 ++++++++++++++++-
>  drivers/clk/starfive/clk-starfive-common.h    |  12 ++
>  .../clk/starfive/clk-starfive-jhb100-sys0.c   | 150 ++++++++++++++++++
>  6 files changed, 321 insertions(+), 3 deletions(-)  create mode 100644
> drivers/clk/starfive/clk-starfive-jhb100-sys0.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ce97de46e610..c48b56d0ab94 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -26069,6 +26069,13 @@ F:
> 	Documentation/devicetree/bindings/phy/starfive,jh7110-usb-phy.yaml
>  F:	drivers/phy/starfive/phy-jh7110-pcie.c
>  F:	drivers/phy/starfive/phy-jh7110-usb.c
> 
> +STARFIVE JHB100 CLOCK DRIVERS
> +M:	Changhuang Liang <changhuang.liang@starfivetech.com>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/clock/starfive,jhb1*.yaml
> +F:	drivers/clk/starfive/clk-starfive-jhb1*
> +F:	include/dt-bindings/clock/starfive,jhb1*.h
> +
>  STARFIVE JHB100 DEVICETREES
>  M:	Changhuang Liang <changhuang.liang@starfivetech.com>
>  L:	linux-riscv@lists.infradead.org
> diff --git a/drivers/clk/starfive/Kconfig b/drivers/clk/starfive/Kconfig index
> ff8eace36e64..7926e02ccd7d 100644
> --- a/drivers/clk/starfive/Kconfig
> +++ b/drivers/clk/starfive/Kconfig
> @@ -72,3 +72,14 @@ config CLK_STARFIVE_JH7110_VOUT
>  	help
>  	  Say yes here to support the Video-Output clock controller
>  	  on the StarFive JH7110 SoC.
> +
> +config CLK_STARFIVE_JHB100_SYS0
> +	bool "StarFive JHB100 system-0 clock support"
> +	depends on ARCH_STARFIVE || COMPILE_TEST
> +	select AUXILIARY_BUS
> +	select CLK_STARFIVE_COMMON
> +	select RESET_STARFIVE_JHB100 if RESET_CONTROLLER
> +	default ARCH_STARFIVE
> +	help
> +	  Say yes here to support the system-0 clock controller on the
> +	  StarFive JHB100 SoC.
> diff --git a/drivers/clk/starfive/Makefile b/drivers/clk/starfive/Makefile index
> 012f7ee83f8e..2c5e66d1d44e 100644
> --- a/drivers/clk/starfive/Makefile
> +++ b/drivers/clk/starfive/Makefile
> @@ -10,3 +10,5 @@ obj-$(CONFIG_CLK_STARFIVE_JH7110_AON)	+=
> clk-starfive-jh7110-aon.o
>  obj-$(CONFIG_CLK_STARFIVE_JH7110_STG)	+= clk-starfive-jh7110-stg.o
>  obj-$(CONFIG_CLK_STARFIVE_JH7110_ISP)	+= clk-starfive-jh7110-isp.o
>  obj-$(CONFIG_CLK_STARFIVE_JH7110_VOUT)	+= clk-starfive-jh7110-vout.o
> +
> +obj-$(CONFIG_CLK_STARFIVE_JHB100_SYS0)		+=
> clk-starfive-jhb100-sys0.o
> diff --git a/drivers/clk/starfive/clk-starfive-common.c
> b/drivers/clk/starfive/clk-starfive-common.c
> index 9c0eb7a50d1e..1b5e56af4138 100644
> --- a/drivers/clk/starfive/clk-starfive-common.c
> +++ b/drivers/clk/starfive/clk-starfive-common.c
> @@ -9,6 +9,8 @@
>  #include <linux/debugfs.h>
>  #include <linux/device.h>
>  #include <linux/io.h>
> +#include <linux/pm_runtime.h>
> +#include <soc/starfive/reset-starfive-common.h>
> 
>  #include "clk-starfive-common.h"
> 
> @@ -331,9 +333,143 @@ struct clk_hw *starfive_clk_get(struct
> of_phandle_args *clkspec, void *data)
>  	struct starfive_clk_priv *priv = data;
>  	unsigned int idx = clkspec->args[0];
> 
> -	if (idx < priv->num_reg)
> -		return &priv->reg[idx].hw;
> +	if (idx >= priv->num_reg)
> +		return ERR_PTR(-EINVAL);
> 
> -	return ERR_PTR(-EINVAL);
> +	/* Index space is sparse: reject holes that were never registered. */
> +	if (priv->info && !priv->info->clk_data[idx].name)
> +		return ERR_PTR(-ENOENT);
> +
> +	return &priv->reg[idx].hw;
>  }
>  EXPORT_SYMBOL_GPL(starfive_clk_get);
> +
> +static void starfive_reset_unregister_adev(void *_adev) {
> +	struct auxiliary_device *adev = _adev;
> +
> +	auxiliary_device_delete(adev);
> +	auxiliary_device_uninit(adev);
> +}
> +
> +static void starfive_reset_adev_release(struct device *dev) {
> +	struct auxiliary_device *adev = to_auxiliary_dev(dev);
> +	struct starfive_reset_adev *rdev = to_starfive_reset_adev(adev);
> +
> +	kfree(rdev);
> +}
> +
> +static int starfive_reset_controller_register(struct starfive_clk_priv *priv,
> +					      const char *adev_name,
> +					      u32 adev_id)
> +{
> +	struct starfive_reset_adev *rdev;
> +	struct auxiliary_device *adev;
> +	int ret;
> +
> +	rdev = kzalloc_obj(*rdev);
> +	if (!rdev)
> +		return -ENOMEM;
> +
> +	rdev->base = priv->base;
> +
> +	adev = &rdev->adev;
> +	adev->name = adev_name;
> +	adev->dev.parent = priv->dev;
> +	adev->dev.release = starfive_reset_adev_release;
> +	adev->id = adev_id;
> +
> +	ret = auxiliary_device_init(adev);
> +	if (ret) {
> +		kfree(rdev);
> +		return ret;
> +	}
> +
> +	ret = auxiliary_device_add(adev);
> +	if (ret) {
> +		auxiliary_device_uninit(adev);
> +		return ret;
> +	}
> +
> +	return devm_add_action_or_reset(priv->dev,
> +					starfive_reset_unregister_adev, adev); }

You add starfive_reset_controller_register() but a most similiar jh7110_reset_controller_register()
remains in drivers/clk/starfive/clk-starfive-jh7110-sys.c. Can we merge them?

> +
> +int starfive_crg_probe(struct platform_device *pdev) {
 
This function name is too generic and we know not all starfive SoCs use it to probe.

> +	const struct starfive_crg_domain_info *info;
> +	struct starfive_clk_priv *priv;
> +	unsigned int idx;
> +	int ret;
> +
> +	info = of_device_get_match_data(&pdev->dev);
> +	if (!info)
> +		return -ENODEV;
> +
> +	priv = devm_kzalloc(&pdev->dev, struct_size(priv, reg, info->num_clk),
> +			    GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	spin_lock_init(&priv->rmw_lock);
> +	priv->info = info;
> +	priv->num_reg = info->num_clk;
> +	priv->dev = &pdev->dev;
> +	priv->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(priv->base))
> +		return PTR_ERR(priv->base);
> +
> +	if (info->power_domain) {
> +		ret = devm_pm_runtime_enable(priv->dev);
> +		if (ret)
> +			return dev_err_probe(priv->dev, ret,
> +					     "failed to enable runtime PM\n");
> +	}
> +
> +	for (idx = 0; idx < info->num_clk; idx++) {
> +		u32 max = info->clk_data[idx].max;
> +		struct clk_parent_data parents[4] = {};
> +		struct clk_init_data init = {
> +			.name = info->clk_data[idx].name,
> +			.ops = starfive_clk_ops(max),
> +			.parent_data = parents,
> +			.num_parents =
> +				((max & STARFIVE_CLK_MUX_MASK) >>
> STARFIVE_CLK_MUX_SHIFT) + 1,
> +			.flags = info->clk_data[idx].flags,
> +		};
> +		struct starfive_clk *clk = &priv->reg[idx];
> +		unsigned int i;
> +
> +		if (!init.name)
> +			continue;
> +
> +		for (i = 0; i < init.num_parents; i++) {
> +			unsigned int pidx = info->clk_data[idx].parents[i];
> +
> +			if (pidx < info->num_clk) {
> +				parents[i].hw = &priv->reg[pidx].hw;
> +			} else {
> +				if (pidx - info->num_clk >= info->num_ext_clk)
> +					return -EINVAL;
> +
> +				parents[i].fw_name = info->ext_clk[pidx - info->num_clk];
> +			}
> +		}
> +
> +		clk->hw.init = &init;
> +		clk->idx = idx;
> +		clk->max_div = max & STARFIVE_CLK_DIV_MASK;
> +
> +		ret = devm_clk_hw_register(&pdev->dev, &clk->hw);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret = devm_of_clk_add_hw_provider(&pdev->dev, starfive_clk_get, priv);
> +	if (ret)
> +		return ret;
> +
> +	return starfive_reset_controller_register(priv, info->rst_name, 0); }
> +EXPORT_SYMBOL_GPL(starfive_crg_probe);
> diff --git a/drivers/clk/starfive/clk-starfive-common.h
> b/drivers/clk/starfive/clk-starfive-common.h
> index a03824e9e75f..4cd4357f8366 100644
> --- a/drivers/clk/starfive/clk-starfive-common.h
> +++ b/drivers/clk/starfive/clk-starfive-common.h
> @@ -5,6 +5,7 @@
>  #include <linux/bits.h>
>  #include <linux/clk-provider.h>
>  #include <linux/device.h>
> +#include <linux/platform_device.h>
>  #include <linux/spinlock.h>
> 
>  /* register fields */
> @@ -109,6 +110,15 @@ struct starfive_clk {
>  	unsigned int max_div;
>  };
> 
> +struct starfive_crg_domain_info {
> +	const struct starfive_clk_data *clk_data;
> +	unsigned int num_clk;
> +	const char * const *ext_clk;
> +	unsigned int num_ext_clk;
> +	const char *rst_name;
> +	bool power_domain;
> +};

Is the starfive_crg_domain_info struct introduced only for JHB100? Could we also use it for JH7110?

Best regards,
Hal

> +
>  struct starfive_clk_priv {
>  	/* protect clk enable and set rate/parent from happening at the same
> time */
>  	spinlock_t rmw_lock;
> @@ -116,6 +126,7 @@ struct starfive_clk_priv {
>  	void __iomem *base;
>  	struct clk *original_clk;
>  	struct notifier_block pll_clk_nb;
> +	const struct starfive_crg_domain_info *info;
>  	struct clk_hw *pll[3];
>  	unsigned int num_reg;
>  	struct starfive_clk reg[] __counted_by(num_reg); @@ -123,5 +134,6
> @@ struct starfive_clk_priv {
> 
>  const struct clk_ops *starfive_clk_ops(u32 max);  struct clk_hw
> *starfive_clk_get(struct of_phandle_args *clkspec, void *data);
> +int starfive_crg_probe(struct platform_device *pdev);
> 
>  #endif
> diff --git a/drivers/clk/starfive/clk-starfive-jhb100-sys0.c
> b/drivers/clk/starfive/clk-starfive-jhb100-sys0.c
> new file mode 100644
> index 000000000000..eb3cd33e2309
> --- /dev/null
> +++ b/drivers/clk/starfive/clk-starfive-jhb100-sys0.c
> @@ -0,0 +1,150 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * StarFive JHB100 System-0 Clock Driver
> + *
> + * Copyright (C) 2024 StarFive Technology Co., Ltd.
> + *
> + * Author: Changhuang Liang <changhuang.liang@starfivetech.com>
> + *
> + */
> +
> +#include <dt-bindings/clock/starfive,jhb100-crg.h>
> +#include <linux/init.h>
> +#include <linux/platform_device.h>
> +
> +#include "clk-starfive-common.h"
> +
> +#define JHB100_SYS0CLK_NUM_CLKS
> 	(JHB100_SYS0CLK_GPU1_NCNOC_INIT + 1)
> +
> +/* external clocks */
> +#define JHB100_SYS0CLK_OSC			(JHB100_SYS0CLK_NUM_CLKS +
> 0)
> +#define JHB100_SYS0CLK_PLL0			(JHB100_SYS0CLK_NUM_CLKS +
> 1)
> +#define JHB100_SYS0CLK_PLL1			(JHB100_SYS0CLK_NUM_CLKS +
> 2)
> +#define JHB100_SYS0CLK_PLL2			(JHB100_SYS0CLK_NUM_CLKS +
> 3)
> +
> +static const char * const jhb100_sys0_ext_clk[] = {
> +	"osc",
> +	"pll0",
> +	"pll1",
> +	"pll2",
> +};
> +
> +static const struct starfive_clk_data jhb100_sys0crg_clk_data[] = {
> +	/* bmcpcierp */
> +	STARFIVE__DIV(JHB100_SYS0CLK_BMCPCIERP_NCNOC_MAIN,
> "bmcpcierp_ncnoc_main", 6,
> +		      JHB100_SYS0CLK_PLL0),
> +	STARFIVE__DIV(JHB100_SYS0CLK_BMCPCIERP_NCNOC_CFG,
> "bmcpcierp_ncnoc_cfg", 12,
> +		      JHB100_SYS0CLK_PLL1),
> +	STARFIVE__DIV(JHB100_SYS0CLK_PCIE_REF_CML, "pcie_ref_cml", 24,
...
> +	/* gpu1 */
> +	STARFIVE__DIV(JHB100_SYS0CLK_GPU1_NCNOC_INIT,
> "gpu1_ncnoc_init", 10,
> +		      JHB100_SYS0CLK_PLL0),
> +};
> +
> +static const struct starfive_crg_domain_info jhb100_sys0crg_info = {
> +	.clk_data	= jhb100_sys0crg_clk_data,
> +	.num_clk	= ARRAY_SIZE(jhb100_sys0crg_clk_data),
> +	.ext_clk	= jhb100_sys0_ext_clk,
> +	.num_ext_clk	= ARRAY_SIZE(jhb100_sys0_ext_clk),
> +	.rst_name	= "jhb100-r-sys0",
> +	.power_domain	= false,
> +};
> +
> +static const struct of_device_id jhb100_sys0crg_match[] = {
> +	{
> +		.compatible = "starfive,jhb100-sys0crg",
> +		.data = &jhb100_sys0crg_info,
> +	},
> +	{ /* sentinel */ }
> +};
> +
> +static struct platform_driver jhb100_sys0crg_driver = {
> +	.probe = starfive_crg_probe,
> +	.driver = {
> +		.name = "clk-starfive-jhb100-sys0",
> +		.of_match_table = jhb100_sys0crg_match,
> +		.suppress_bind_attrs = true,
> +	},
> +};
> +builtin_platform_driver(jhb100_sys0crg_driver);
> --
> 2.25.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
