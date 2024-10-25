Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C036BD3A66B
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Oct 2024 15:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gFVMx2+H8PEHfa9aMVKrXx8CNwhSwXx8q8sTDylrfI4=; b=G+NwYIjf3R0Ime
	5FxFcAqKPHzXIoFjQ8QQ/n9+Alj4vcUvQZEUlpvCABFBLqpKwSB7inZcjT1gKRvQuHhPIyTl47HA+
	/HkhogEbPIKql40976EJa7WZocjR8a8SUROjfZZ2e/RMuUOrno6s8ixm/PK/ryN5Dh3q6uj+GOL+J
	CJnbpUIgXMUqPGhHCFZvkNZ6FCuTURIsNVVvSjnkQvnSBalLtEinvZlb5UkD1hHy2PRQy4+lW/ME1
	qd2d1a7UFX5AT2g0CLKq475mgCKuMdscrt+zku7buSps21uEdPbdlkWuHO2iQoMXRfoYiCp1ZUj9W
	vKd39u4UAwy0rSn+hYrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5oPg-0000000EyVy-20i1;
	Tue, 29 Oct 2024 15:45:44 +0000
Received: from mail-sh0chn02on20702.outbound.protection.partner.outlook.cn ([2406:e500:4420:2::702] helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Adh-00000002L6g-0QZL
	for linux-riscv@lists.infradead.org;
	Fri, 25 Oct 2024 03:05:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rp4H9IpFXBykD67kRBY2iNjmuJRZWYagUXwZ5vYk8O5lTGniCCqj5GKs4cVOPF1ng2pSAyCLwrZ/EOBRcLRkSdyO1u9Ng06JCnp5wT9IqUysoax1i4KpjwlrSPG7p2BDY9TQAceNGT/TJiNErTbDhWvAlz5e4QpFFm3XmoFcfx7rW/0mwHMkKCMZUKbvaiJ8THEox4C1YO8fzHM4eKcIAePCY3EVKXjTQTr9gok9Ah2sKIxC0H93hf/ztZCZvDYF/R8DUzvQadDnhiGKPsHGBKakBNW5CL4ZNMhwoof+XdGL1ci/t1+GqzpofRCskfVYDAXex6diIvFS+TyPqmg3wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g/vEHRxD93rRF7qjE4b4pNIJ6Izn3vWf9kfsaFHcIwI=;
 b=gRotO5f9oZ00BgiD0eTJ7KrT6siglEQ3ge6vgnO4MHOBJrrHQE7ghnSMq5EO7stvZHpUFrlgC8KJRdS4m1yJRBn1WR8jtYdkm+7A7NKt9gT2AbXKMjx0BxfPAJPrP+9oOnDIGEHQmbMJzLpbiKnfaLa/33QyrSFi4/ZeeVlMAwuH0VwmSNheQKBHNfl0QtnAAEcYHI7zuGbXlTff+8mMJ8A1mMMRnhMAqyrjTQ5kEG8Xbjjx9z4QnH5ocABCN32U+jEhhPm93JNoc/o7gVUSTpTXOt5h50euHe5FW/4cRnIylN6nzPLVm9pCPs0XkzgBCD5SoX/gCYH1pb0C2EhhVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:7::14) by ZQ2PR01MB1290.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:11::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.33; Fri, 25 Oct
 2024 03:05:23 +0000
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::2595:ef4d:fae:37d7]) by ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::2595:ef4d:fae:37d7%4]) with mapi id 15.20.8069.031; Fri, 25 Oct 2024
 03:05:23 +0000
From: Hal Feng <hal.feng@starfivetech.com>
To: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>, Vincent
 Mailhol <mailhol.vincent@wanadoo.fr>, "David S . Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Emil Renner
 Berthing <emil.renner.berthing@canonical.com>, William Qiu
	<william.qiu@starfivetech.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-can@vger.kernel.org"
	<linux-can@vger.kernel.org>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 2/4] dt-bindings: can: Add CAST CAN Bus Controller
Thread-Index: AQHbDP77AOdoHkNgsEibhjh7mfCIQLJnX44AgC+YfWA=
Date: Fri, 25 Oct 2024 03:05:23 +0000
Message-ID: <ZQ2PR01MB1307FBED11492760312357D1E64F2@ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ2PR01MB1307:EE_|ZQ2PR01MB1290:EE_
x-ms-office365-filtering-correlation-id: 6a7ec8ca-00b3-407f-833c-08dcf4a1de2e
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|41320700013|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: BiIDDLdqw3aEovNbsF+Fxj79ziYNy1MDudDSVegEFmgUKqy6tFXEJCdaGkbnvoTUwA/LIaJ4TGLednmW4hafO51p99MLup4WdjVaUzi0sT+tboawODrcSdMIjg5CxhOEHfwaFjqft9dPVXzUCSXhl915vh0chB0Pe6gy8h2LhIcskCClKwrQeAYij3TMs145l7OZyAlr6lqMhQNk+KChWuPz0QhDQ+QLu2qIQjn55/BHx9VlbRHlcNipZ0qAAsbQwbVN0XLvfqveMz1v5RNRXFQnG7T+hzgij9nK5oifLFAXJPwuK9hKywwZ6ZCQjQwPkiCYnAhztpNmMLQKUBNQC7pacfric6hJn0cRNg4BqaGIUaGLW/sbwG/BK02dJGHkK5E0RHuXK8GvUa9B/+AAi/tx93KrizCYPAfoGvcdQza+sKmBlshQlrjhwQk+2rhygiDxxN0/ZYN4iV2Q9tNZXFeVf5PsUNFoVzrABmf8q660GS2Ts0yOvqnWAonZFk68TyVYRHYnrgxNLjgDHP83RRtY1InPluBYtuxpTXM/vQHD8I0IAtedCvMD9+yi/hbCzdVIHKyHNbkKBwn+OrqhkjOhVhp40ElBK2Tq2n8GjFISSplM9e2E9BCdrilREO6T
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(41320700013)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?kwTu5pwUF3GWKoER9bfrJvJXKOYY0kfF5/E8qW8n/jnTn1zimBCSXvc3Xp8V?=
 =?us-ascii?Q?RgP9iO0hO7KX2hfTxQqfuIGeqI9HbFbgLU+w8ZG9q9zSgmp1OnMvWCNeBTyo?=
 =?us-ascii?Q?3ntloATSGi18RZKNJPPLF3mWOwauBzYykFuu6/u3o3M4U+DUnjVP3js6HkWO?=
 =?us-ascii?Q?YM6CJK5vhUufS5A4hTfJxpzQJ9ZAIfu/QCGSBtfD++wHeUKjYUiClY+v2jlK?=
 =?us-ascii?Q?G8E47ubLZvh+tmZiZAvIedKVyQCYp2FHVH8b51OFdRGeXoiaTDr4oajquNDT?=
 =?us-ascii?Q?LXBDQ2fsGJeXD/vq7ksS17wl8El4JNQElbHZhXyTRAz2EM0RtvR+xBlO5wWc?=
 =?us-ascii?Q?KsRgxISA4yjB3ERqQuW/h/v6AIjfFJ+dF70vrWVn1pBK2hv2D5BumW/k1I2W?=
 =?us-ascii?Q?Q2lyRfKA981yXspFdY/wyKpYYTMj4E81VxfXZIn1aUPWpLL/GU3KIeTh6A5m?=
 =?us-ascii?Q?nnR1UW+Yu34MFMAF4DYRqcPPLgZRCgxnOa/aCUPRBTW1Jgh2IrV1LsTJxJ5g?=
 =?us-ascii?Q?6xSTFX3V1lMXw8BNSFoqnBNu2Ftw1GiNjW0QtrNzLtHjooK/VGcLgJtkMzMG?=
 =?us-ascii?Q?ydYh/flZtyJzZesA8Se+ij7IqPyanMbsudwMUUcO3NpgGtx7kirbo1j1E3Uy?=
 =?us-ascii?Q?ovjLWZ80O/YuO3hdhTx5GDtsmPbG0C2Jc44dvKyyP+6N196616POiYM9tPRJ?=
 =?us-ascii?Q?zcXSurzURii6qOchiGaF8kBIg07HRrDSAqOHy747AICuArg0cGN/GfUEfUx2?=
 =?us-ascii?Q?mTUligki7LF2zZ18ZbTpPtNI1Q0jF71Fpp9Rxkj8B/4WQN9P4JKThk22UEl6?=
 =?us-ascii?Q?b4NPv5zXSORImKDfLysr/Sv1MUzjjHK0ILd0n7c/iI9fkLRM2WDFl2DTPUXa?=
 =?us-ascii?Q?DMuLrg8eVTmBcioJWnb9Q7kbbU5Xm0eSDlIKEkRySCZ9/WXQvfyCukwizmJr?=
 =?us-ascii?Q?Ea5VoRI6EZtelE+4oAL6KLldF5SjrRnwjvjLykwDp0ac67hsxT72luzolbqf?=
 =?us-ascii?Q?DmPsSb5gFK5WWYCGm7dPowgP6VqVU3U1txP+8yHzechLr/VuHWp1eumSuA3H?=
 =?us-ascii?Q?G9QeydLNVB7nC13eCgt8iK1HQDJ8BBrWUHoMjBUiUNlCohhLlBqQwJzD0dJa?=
 =?us-ascii?Q?GpDhi7+tvu3eQyBvg02OzDkqy+HuJyQxEZUrvyJjYvGJWJtCVwHh1LzIkn+Q?=
 =?us-ascii?Q?m1gzcmsqablpfHaTvPpeRpYCQ9W2P3CxeWSoalFHBQJMdkyxnEWmUv4RqVLc?=
 =?us-ascii?Q?SLJUAcLpgXyG18LnbfomAH838jkZTTIh7WfphhwisIhLTbPzQAeS41cg3eNf?=
 =?us-ascii?Q?b/V/j9ND8QpVJpDDDKPCeVyl6KlJnatYCGY6jxw10l/xagNU/pmFkVqjI39f?=
 =?us-ascii?Q?ophBvGOm2I1j8BmdtYEH8dM5vFXa/6+YYlMDZ0xtwKynWrUihYNJtbFbnCie?=
 =?us-ascii?Q?PDyt4bI0GyllMyZOgg/+WC8wqsmFw5O9M0jeJnoo1jQUwaSiaE2qM3/qjYPM?=
 =?us-ascii?Q?BTPOQ2uoCkU1V3n+I1cK5VdZCc34uXWQC4+Cw40ZrQjkcmaqv6hOWjnjRCGe?=
 =?us-ascii?Q?w2f4fefkEjPl6Ldg9gzjfHZN36+z0jp/RwbmiknJ?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a7ec8ca-00b3-407f-833c-08dcf4a1de2e
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2024 03:05:23.3789
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3SdSh72naatA2Zhq911dXylsorjQYoBQEFtcR6k60qyJSMIZych13g3BTttz0B5zNWzXeU5myRpSRQHGVoGk0DM5g9XRX9BJoMibmL5L3K4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ2PR01MB1290
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_200525_168645_8F3F6467 
X-CRM114-Status: GOOD (  19.95  )
X-Mailman-Approved-At: Tue, 29 Oct 2024 08:37:08 -0700
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

> On 25.9.24 04:03, Rob Herring wrote:
> On Sun, Sep 22, 2024 at 10:51:48PM +0800, Hal Feng wrote:
> > From: William Qiu <william.qiu@starfivetech.com>
> >
> > Add bindings for CAST CAN Bus Controller.
> >
> > Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> > Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> > ---
> >  .../bindings/net/can/cast,can-ctrl.yaml       | 106 ++++++++++++++++++
> >  1 file changed, 106 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/net/can/cast,can-ctrl.yaml
> >
> > diff --git
> > a/Documentation/devicetree/bindings/net/can/cast,can-ctrl.yaml
> > b/Documentation/devicetree/bindings/net/can/cast,can-ctrl.yaml
> > new file mode 100644
> > index 000000000000..2870cff80164
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/net/can/cast,can-ctrl.yaml
> > @@ -0,0 +1,106 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/net/can/cast,can-ctrl.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: CAST CAN Bus Controller
> > +
> > +description:
> > +  This CAN Bus Controller, also called CAN-CTRL, implements a highly
> > +  featured and reliable CAN bus controller that performs serial
> > +  communication according to the CAN protocol.
> > +
> > +  The CAN-CTRL comes in three variants, they are CC, FD, and XL.
> > +  The CC variant supports only Classical CAN, the FD variant adds
> > + support  for CAN FD, and the XL variant supports the Classical CAN,
> > + CAN FD, and  CAN XL standards.
> > +
> > +maintainers:
> > +  - William Qiu <william.qiu@starfivetech.com>
> > +  - Hal Feng <hal.feng@starfivetech.com>
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +        - starfive,jh7110-can
> > +      - const: cast,can-ctrl-fd-7x10N00S00
> 
> What's the 7x10...? Perhaps some explanation on it.

7x10N00S00 is the CAN IP product version.

> 
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    minItems: 3
> > +
> > +  clock-names:
> > +    items:
> > +      - const: apb
> > +      - const: timer
> > +      - const: core
> > +
> > +  resets:
> > +    minItems: 3
> > +
> > +  reset-names:
> > +    items:
> > +      - const: apb
> > +      - const: timer
> > +      - const: core
> > +
> > +  starfive,syscon:
> > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > +    items:
> > +      - items:
> > +          - description: phandle to System Register Controller syscon node
> > +          - description: offset of SYS_SYSCONSAIF__SYSCFG register for CAN
> controller
> > +          - description: shift of SYS_SYSCONSAIF__SYSCFG register for CAN
> controller
> > +          - description: mask of SYS_SYSCONSAIF__SYSCFG register for CAN
> controller
> > +    description:
> > +      Should be four parameters, the phandle to System Register Controller
> > +      syscon node and the offset/shift/mask of SYS_SYSCONSAIF__SYSCFG
> register
> > +      for CAN controller.
> 
> This just repeats what the schema says. More useful would be what you need
> to access/control in this register.

OK, will improve the description here. Thanks.

Best regards,
Hal

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
