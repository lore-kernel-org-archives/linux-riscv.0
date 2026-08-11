Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2AB2C5AD55
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Aug 2026 03:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GbHECOIKbOU+Z8MkvkKHi0jnqShzabN7bDer7cMa434=; b=Zs3q/2TwR4fKdD
	iVlnTBJpvzJFekiKoNx26aR+iLjiH0X4b+trnYx6riS70yXr534Dr22ocxCYprSWoJCnZUiYevYrf
	IHqS5j7vayePiMvhHBlUCAVvus++8XmIMVzovQ8W09lUUSrwvfIGp+ZP63qvc52E+77Lfv+OXbq1G
	c3pW1TnchJ0x3kVLGWEdm0atq0+E0RTm7fKOTPpYnQM4AxRE0PXwNDwxeMDseqid6hzivWOa3xgGP
	T9g3sYuMjb8M1SUmQcImJyiT0EvEyyapPEl8gHCgxsJfQPOhhYHUqzAfAfr4LfYSsQ/3GwfFDAEqs
	D9Oqhsua69k9qq5BOPOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtcsq-0000000DCZ2-1uOE;
	Tue, 11 Aug 2026 03:10:32 +0000
Received: from mail-bjschn02on20711.outbound.protection.partner.outlook.cn ([2406:e500:4440:2::711] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtcsl-0000000DCYf-2hDn
	for linux-riscv@lists.infradead.org;
	Tue, 11 Aug 2026 03:10:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ULn8OPHF4q6LwHkZk+h8rEubekHxlPlNtBazCMSFVrLznwAVeIkZTA2MZD+Jlb3fA1+8DZY3OQwsIiS3NNuommJ/I6KyGHKe9rhKCiOnr6yciJwnGsHElJKiFHJT/Qaid9MbvoE6JJnE6/8L4Ut+Iuwk3g6Xiy5na2seO6RklphztnSJ04fiy26VqijhSvKvsgjrJBv6NY8oHk5MvdA6UxSgnNHlPJq7CkEtncw37UNFB6zWTxdX/R/CwvKsmOGa41Bw8+xvRhdimgec9noBg0S7T7SspZaM6OIfmVxabgX9I/rYqrU1Pf0bE4y4WCX10qDtf9N0eykMxKKDZzJBdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J2A2rSML9mlqVxYnjImLvw2bKOwsQpw1Gxp3qxpU5t8=;
 b=QRxniDLTTfFxkN6bmp27JzB9a0cRWYPV6/8/w67nvELB71xWaVFk7czNqn8T+arNRRpJc9XidMEDVifFgAp/6kRD8rh50o2Jf1oBXaWZuKXHQCxbPoUbi9BX4caJ4vQDz2ne77vhuQP0IhbrGVeO3eJ21L+tymPGO8ny4dMWhCkBHyDIFjpTX5a6vFFatmV8JHGl0fGY2fTqCmqXplKovGSEOdHVddwBI0zqIPVokIvBpe12RJ6RrldLY9p/zUNprbF/Luunaeg4ZkoPNenx8YaRTMgpbwdSWnzs9ViwKn8nbZPdx/zrHAwzbMkVccvuhCo21iypN1uDyoD/2AlJ8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1281.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 03:09:59 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0292.024; Tue, 11 Aug 2026 03:09:59 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Rob Herring <robh@kernel.org>
CC: Linus Walleij <linusw@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Emil
 Renner Berthing <kernel@esmil.dk>, Alexandre Ghiti <alex@ghiti.fr>, Lianfeng
 Ouyang <lianfeng.ouyang@starfivetech.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Bartosz Golaszewski <brgl@kernel.org>
Subject: Re: [PATCH v5 03/21] dt-bindings: pinctrl: Add
 starfive,jhb100-sys0-pinctrl
Thread-Topic: [PATCH v5 03/21] dt-bindings: pinctrl: Add
 starfive,jhb100-sys0-pinctrl
Thread-Index: AQHdKJKmmncLFStLcUOAd2EEccdBl7aW8JiAgAAZydCAAFDGAIAA0XrA
Date: Tue, 11 Aug 2026 03:09:58 +0000
Message-ID: <ZQ4PR01MB12020D2031C400FF805791B7F2DD2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260810063650.239303-1-changhuang.liang@starfivetech.com>
 <20260810063650.239303-4-changhuang.liang@starfivetech.com>
 <178634991918.1014951.7989635238440361454.robh@kernel.org>
 <ZQ4PR01MB120202070B9006984B8677EAF2DE2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <20260810144012.GA1574021-robh@kernel.org>
In-Reply-To: <20260810144012.GA1574021-robh@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1281:EE_
x-ms-office365-filtering-correlation-id: e1880540-da08-4aa2-7ab2-08def7560706
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|56012099006|10067099003|4143699003|6133799003|3023799007|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: lUmedexlkCwCNH8wb0pNhQbxERz7voSGpq6bf20lY8XElfvL7dXg+HoS+Y6mUX0tflSCY8lLnZlQ+jfzI64pX0fU3j/tqGANkff+ZS2aIxCdG6kR1PaNyHVAKNyUtnecGz6BbNt3/KRZnoTmTg8PAr+N9vcNIozKL0h+jBJl8i97GxrlKegH4OkEROr/KD0Zb/UEYjPk6jIP0H/mdNF9YmugodRnOEjhiLNiDoV+yvU/wSuTOv1trtiErpAucmlisqc3sA2DzHuDQdmHqgIohy4QA46c94f9K2mwrk8GHRTONYkNezOtfne+2nsh+6fX7OsGk8s1tq4pX0djeKphzjqbFvODByhQ2emzfB72DL1PMDUGhfSqB3zMf2aisgh6kINnggM9H5Sg7FrcDjuiKXRZrwPkjLtdzGKZq3rPmlT/6Bur6Ttu0yn8nwW/k8fGUxhgz9JySHrAvX2joTdDDhFhoFYL6PivY7g5r2aNrPnHOVAC52M1Y0EuGKZ5f1mjjnVNnkzY45BeTUQLjxz/xQ4MWQftHc0NhSNgrqZuOyxOFOdkgD1N1VDBnjqCClE5
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(56012099006)(10067099003)(4143699003)(6133799003)(3023799007)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?dlDwElFSLzbaBLeBiIwUtqObCoFY4PfYknICGmv864eJi/2T/r/5hFRiC3UP?=
 =?us-ascii?Q?mttfPx+WKczXN3nZhUfbKPokv408umOWRrrKNEM35U10/Fp5nlvHn2jlrgeg?=
 =?us-ascii?Q?UefXmFLJfZPBVnrCgsL4zWzk8SNlsrR83Ytj8D0Wel7WzEsN1+8757DLc0w5?=
 =?us-ascii?Q?SGf3NmGCsCPDB/hRqmRyWteFlS/KRDr/yCkp79BXLL9F2wZTm8MZcW6rMX0o?=
 =?us-ascii?Q?9RBIBNJZFpae0fCAgTdiYNvKnFVlviPsdiD0zTKbeHzaK7LyhPkNKiVCsHXk?=
 =?us-ascii?Q?TjseXbvioGm2GxaB47qhjQ7sPjynQRVPIXUjGavrVUBPAviKtj3jrvAX30S5?=
 =?us-ascii?Q?yu0Fq1x4Q1jIUJUjrXIWKkhb46dSGhUGvwJchildpsTfzFZYzdf5CoZxsjs3?=
 =?us-ascii?Q?NgQtao2yN4t9sQJzdUFtZYL8dsTtBbvmFQpQAY3GdG7SdwkDui4FAtHb/js+?=
 =?us-ascii?Q?0VOgEK2r3BMwMLC3PloylFdODhBlpa9YH44AGbpAKT1JM27IJEUBjmY1BUHq?=
 =?us-ascii?Q?/pWDNXerZl7dcvpJerah6n6P1LEJ7VtYr7SDbsbEsaPCultCOR5RTL1MX6KN?=
 =?us-ascii?Q?/AEriV4GYVC7ae3JHOEmRW9+s04HbcJNBRgKu8n82Tkop3/uWmrGRYSmuZxt?=
 =?us-ascii?Q?wAZRsCJDdg4CwQgBtH+DuSV5mf6sphafwZzjJ+uAWNMZX0VMtWK65hRFd8n8?=
 =?us-ascii?Q?OoA7xl2zf5DEcf8MGyAYFScIsKGa+IObU+mWctpmxdTgAaJ5BkhtodGhoNR+?=
 =?us-ascii?Q?CSrHzjEZhyDm3hzlNuCZViecWqrfymoHwU/WoaKWLpst7e+xfrNPjVAdKfqF?=
 =?us-ascii?Q?KxSUyd6vXPz2rX4fCsUO0OEu6ciOeNSVPW98/v5LoN18hcB5WUbbChp7f27j?=
 =?us-ascii?Q?KZc0y17lM9f6A2kAuuAhGvdXs0xfHeSXjU2X+FqJtfY+LJougSWjlIQJkg+T?=
 =?us-ascii?Q?zvq6qfX4AvbK6Q0PfpTMeV0uLEK1OXnPyEskttAykWioQDAlx9m+C56Sadx7?=
 =?us-ascii?Q?S4PRmfLI69jH73SjUEcZVb8A2T6mBRLDJQeXrfNXlisvybKlrxF77H1+xsiB?=
 =?us-ascii?Q?7FQ071Ja+CSAFnE/jeQKSppF498vSMLTnHLaMFGF4Q6YXLazW2SfkX422qtL?=
 =?us-ascii?Q?/5L0CpX30p6JowaEn0zUp3MEJ6j1JfNUC2XG1FyJBckSXTFCxUTV5t/tWx0H?=
 =?us-ascii?Q?BiKG2XqwhpNu0K+VkKwEli9i3tLmg5lPSydfmr+vnM8yDlL/IiozHNIBvIPu?=
 =?us-ascii?Q?M1E9aVAdIcJJw+ioxnmqd0IT0wNlu6/Ln5QXGIaTsZJWFf7MABRrDWwbr2/x?=
 =?us-ascii?Q?dnENwvsYnG+9q4d56VnGfJt8HLkWeyU25OkAge9fmbCFD5pK48dnW3CL833s?=
 =?us-ascii?Q?WgQ/YG5hVI6p7D8ELUMVeggMJznR0Eg0thP7QC8glHed8V2hEVEOH+uTQGe/?=
 =?us-ascii?Q?n94igEZBozYzhgrQVCJyBSU5l/sOMsxEpPbM6Qfgrrf5M8VzmlPl1E/9kHdX?=
 =?us-ascii?Q?hdQeKSM8bh03b0XXcEKlBUweys0G/bXMFu8fbtHgFXVO9apqE4lZcxqwUC7g?=
 =?us-ascii?Q?1IL+kuoDPi0AdfW74DbuLbF4QuoX8+NkH6SFEntWpxxK5UQ4yLHC0RMULNUm?=
 =?us-ascii?Q?6YmxwYLU+Ra0Lx1OWYDBFWquDh0C1/g9YS0GSFfoAtIP4DZvO5ebi63W78QM?=
 =?us-ascii?Q?zZ1A2J/A5ueH5pQ/rSuvWNc1lVNFaSm8BT+Z7+432lX/tyAEnOhWIR3SgIRt?=
 =?us-ascii?Q?gbq/p9hwBbO2cuGmCDwQM0RpEMTjm0A=3D?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: e1880540-da08-4aa2-7ab2-08def7560706
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2026 03:09:59.0061
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0ON78w8l+IKfb474araoBjCvvOAbTi8dRAbQwWXQsV/PO2UdKxgnGvtidYRWu8Ao+oAd8AM3ncrowkRKCnCzgIdHZ0ohqCdKFNsidEUnUb74quQmUgKK2/KHsEV7vyKh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1281
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_201028_415076_7F0A3B40 
X-CRM114-Status: GOOD (  27.39  )
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

HI, Rob

Thanks for the review.

> On Mon, Aug 10, 2026 at 09:51:07AM +0000, Changhuang Liang wrote:
> > Hi, Rob
> >
> > > On Sun, 09 Aug 2026 23:36:32 -0700, Changhuang Liang wrote:
> > > > Add pinctrl bindings for StarFive JHB100 SoC System-0(sys0)
> > > > pinctrl controller.
> > > >
> > > > Signed-off-by: Changhuang Liang
> > > > <changhuang.liang@starfivetech.com>
> > > > ---
> > > >  .../pinctrl/starfive,jhb100-sys0-pinctrl.yaml | 164
> ++++++++++++++++++
> > > >  .../pinctrl/starfive,jhb100-pinctrl.h         |  17 ++
> > > >  2 files changed, 181 insertions(+)  create mode 100644
> > > > Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0-pin
> > > > ctrl
> > > > .yaml  create mode 100644
> > > > include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
> > > >
> > >
> > > My bot found errors running 'make dt_binding_check' on your patch:
> > >
> > > yamllint warnings/errors:
> > >
> > > dtschema/dtc warnings/errors:
> > > Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0-pinct
> > > rl.exa
> > > mple.dtb: pinctrl@13080000 (starfive,jhb100-sys0-pinctrl):
> > > gpio-ranges:1: [4] is too short
> > > 	from schema $id: http://devicetree.org/schemas/gpio/gpio.yaml
> > >
> > > doc reference errors (make refcheckdocs):
> > >
> > > See
> > > https://patchwork.kernel.org/project/devicetree/patch/20260810063650
> > > .23 9303-4-changhuang.liang@starfivetech.com
> > >
> > > The base for the series is generally the latest rc1. A different
> > > dependency should be noted in *this* patch.
> > >
> > > If you already ran 'make dt_binding_check' and didn't see the above
> > > error(s), then make sure 'yamllint' is installed and dt-schema is up
> > > to
> > > date:
> > >
> > > pip3 install dtschema --upgrade
> > >
> > > Please check and re-submit after running the above command yourself.
> > > Note that DT_SCHEMA_FILES can be set to your schema file to speed up
> > > checking your schema. However, it must be unset to test all examples
> > > with your schema.
> >
> > Hi Rob,
> >
> > Regarding this link:
> >
> https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schema
> s
> > /gpio/gpio.yaml#L71
> >
> > It seems that the configuration to support #gpio-cells = <3>; has not been
> added here yet, is that correct?
> 
> Shrug. Based on the description, gpio-ranges doesn't depend the # of cells.
> 
> Why do you need 3 cells? You haven't described the cell content.

For the pinctrl of JHB100, every 32 GPIOs correspond to one register, so it uses 3-cell 
#gpio-cells and 4-cell gpio-ranges, which helps simplify the driver code.

I referred to this generic implementation:
https://elixir.bootlin.com/linux/v7.2-rc6/source/drivers/gpio/gpiolib-of.c#L936

So the content of gpio cells and gpio-ranges is as follows:
gpios = <&gpio [instance] offset flags>;
gpio-ranges = <&pinctrl [gpio_instance] gpio_offset pin_offset count>;

I'm not sure whether this error is caused by a mismatch with the definition in schemas/gpio/gpio.yaml:

gpio-ranges:
  $ref: /schemas/types.yaml#/definitions/phandle-array
  items:
    items:
      - description: pin controller phandle
      - description: GPIO controller offset
      - description: pin controller offset
      - description: number of pins

Do you have any suggestions for fixing this? Thank you very much.

Best Regards,
Changhuang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
