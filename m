Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FD11E77188
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jan 2025 05:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tpeqQok8aQqDC/dpyR/W8S/DfrSJ/KWRMcu3v43IwGg=; b=UJcBzHGea51Pgn
	0vm1UCpTy42sYZeOz+qfplZ55VXNzLx7jkNfo5mEcJ0N0Q1wXtlIP51xFCwvVW22AewKUQDuPsitC
	pjnzcrFdLzu9s/6oJBTerNQ6Gk/rMqVTK3raKdl+zEa2e7xGuURqz6/8DMoT630SQ9vRK1EYxPYPJ
	pxLD02xqRSw3bwwZVzBwa9qRNB0JF20JPeoaE7tQKadbmJyoXshttTWwdcRP4fnDS+L0xCdgXFwpi
	MMT5sVqM1nVdF5CQXlV9u7SpeEWv/3/i6shy8o+rgZ//r5+judN58kDJ/LRELknKwhDR+W1SnEz/3
	HNbd/GwVsVaEOkIhgvOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXZks-00000007XHv-2kN9;
	Tue, 14 Jan 2025 05:46:22 +0000
Received: from mail-sh0chn02on20715.outbound.protection.partner.outlook.cn ([2406:e500:4420:2::715] helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXZhr-00000007Wp9-2HWj
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jan 2025 05:43:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UVR/g5hWPKT1R/ptD5Ct0lu7gwsLmKaqfzBO2UjX3osxZS/vZaL2PzpuA1Apx+WsdVBEbtWJz1BXuKw5tiR30H0o0RvGd6ZzQEKLhowAntcfiYbZjqqzr8NrOl3tiVuKbuXwyo2nVYjW4Nmt7xLBZIC0kpNQrooCsbcDoVW+jeV12NWc17wq2ebGpKUr2JJtZVw0Qg1Rr28uJ5FyizWWWd4mUzBkzZJU5abmFvL3ORqhqgNqT6r7nzOfDUDiJ7oIaHE+y4rwka6WTHjKlHTKUujDOgqEIrxZJhyaLeo3+XpQB3GwyCx5ohLw71J0NifpQw3ciS0yFHI8kOh5Bb73Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ls2ENkVOfwgZWHRraRZvY3aX7I72wGZ0wWozbfNhiA4=;
 b=RTDqvUaBF1FBRKSDbDd2fTXpuglD14fUaxlK1anb6Itl8UTxfRBv/MSt2grx+F0wQHx0eN49IGmjvfzgGtO19wG9eVXxHujHzoweWzkWqpZKVn813rLAzixqqGc+JrVsKne7BLm1V5+O283IdVwspEavS+xVbuEH6GLzeF41VaPaK9aeF1EHG/ipf8Mif4t2DZqlY6pYVR+//BJ17dWEa/4UVN7IfGA3QZHKXirBhNubBKHK82Vy/Mj6HQQOzZ4bknHDYL2xT/2ZHDPoby7D7nPsAZWo5eHx2cpD12r55aDE8ECQnjjHx3nPTXqvQtu8AB2mZUuNlspYmfTbrlWaOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::15) by SHXPR01MB0621.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1e::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.17; Tue, 14 Jan
 2025 05:42:28 +0000
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 ([fe80::3f35:8db2:7fdf:9ffb]) by
 SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn ([fe80::3f35:8db2:7fdf:9ffb%4])
 with mapi id 15.20.8335.015; Tue, 14 Jan 2025 05:42:28 +0000
From: Minda Chen <minda.chen@starfivetech.com>
To: Conor Dooley <conor@kernel.org>, E Shattow <e@freeshell.de>
CC: Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 1/2] riscv: dts: starfive: jh7110: pciephy0 USB 3.0
 configuration registers
Thread-Topic: [PATCH v1 1/2] riscv: dts: starfive: jh7110: pciephy0 USB 3.0
 configuration registers
Thread-Index: AQHbZessMJgcIL10+UmGw9zpa2rChbMVwlmQ
Date: Tue, 14 Jan 2025 05:42:28 +0000
Message-ID: <SHXPR01MB0863DBF85A9874C9F93ECD25E618A@SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn>
References: <20250102183746.411526-1-e@freeshell.de>
 <20250102183746.411526-2-e@freeshell.de>
 <20250113-mushiness-snugness-0f55574e3956@spud>
In-Reply-To: <20250113-mushiness-snugness-0f55574e3956@spud>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SHXPR01MB0863:EE_|SHXPR01MB0621:EE_
x-ms-office365-filtering-correlation-id: fc727a82-5b91-4ee0-f2f4-08dd345e3b30
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|41320700013|366016|1800799024|7416014|38070700018;
x-microsoft-antispam-message-info: fE5XRe27CHX6KkwdlJG2dtKD3LFk4FGlUlEvoIGRa4TiJ3SrkFUw2/3FnzCKqfleDn7/l5BBMZSpJ9Fhn3swjw0dxR4RhGBGAbyR2CTxixDNXbipAXUjueGySjH4g/2iuHPfhf42TBHVI6PN1TBzySyPNZUJRkZhq452CDsi8sOiEaw4StczOVuh19Nbi1Qbp3LqEdKzcnQQMuxsl6+H6eETWQrUJlHI0yOXQHfSaOvGwdzWzj7x53nbJwW1aEjchHmZlo/8Hz2lX925n0aFdqd1kocNtFLv8kxhbZtr87ROqeDOe/exdL5yrvtT+fgCyB2qO5SpIwbBZkHVarymxtypDC2H1JHDZpzX46keAkudasPS5SDnh0DZNs/Cux5juQuI+sAF9o+wANQvkww+61lnqU7bmx1AlAEOrpuI/b2j4NqDjLDzD+dA53xsI+lRZWvCkpATlY8jxna31HWMRSUU261PTNwUit8tRE9MtACi7O+xuSIGypUvlb7DCIUrY2V5WjAuyuhCashQDzxJAbrpSOvSjZRMFNuYCdxL+YajavVGg2MiaxhTgiyAWc8ONKSqzucpuedQPeZ1UuGs+w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(41320700013)(366016)(1800799024)(7416014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?z3QVFXBgwB5p+f7l8NBY2rX0GSKZQiXdXwLZ4MRpErLZQd5B0TV/1UQHjETc?=
 =?us-ascii?Q?aipqYJIDeo4SgvqJBGTrHYyoPeuOI8GgwpluvrVKC+u1gNcGGMn18mj715j8?=
 =?us-ascii?Q?2fjEEbqJeURlXeaddeFN69SGRO6iTOf0eP8B1qyKVSSqsghsIb5IxfxIrUXq?=
 =?us-ascii?Q?5nRuI+lO/LvOGQjTnkIJ7BnOMQQPYpNrKLIoHEEGz1xcljAnkL+S6deNoelS?=
 =?us-ascii?Q?dS01fHYPnSjrtiLftR1pyANHgZWhE8tsg8QGyW/D4PnUs7wkQS5J7rxGvFG/?=
 =?us-ascii?Q?tNv4ToMDGwWvuDZv6sTuvZtlHz+/5bGKC21RWkDQNBU35FJQYj6t9IFFH/+U?=
 =?us-ascii?Q?JGQYEaOHFqby/kAVeSrQYtLO8sm8qNiSKyq9MiaRXM3/UHFLooR/v8ZFoNqG?=
 =?us-ascii?Q?00JwrOvsxAxp5ht174TkN4gqMXtGP/h/AtAZWfKjhtmcMs/I6EdCDyT1mXJv?=
 =?us-ascii?Q?isiZKwPJ1kRyFG2w/atx0zn/UsCZxk9oo+1B3YxgUUmylKxHuCXSECLbcRZJ?=
 =?us-ascii?Q?aQtrClGwWpkpPeJ+HX3UcCZjmBbsloZySM0Et6C4dSe/Lb1GxrUGj8x1dYc1?=
 =?us-ascii?Q?GWrK5YL8gU7J28Z4OOOlj5ZEeZ9gu8813n9RX8JNk6NVP4eNTgr2aYFlw8ow?=
 =?us-ascii?Q?IGPBVij5tKt8DtpUJwoJoD5nkosvmf1SAnymiOOzADlbkal3t9DdtI1KvcaV?=
 =?us-ascii?Q?iFhLXq8IiFE+MP9t1A//Mq1v5J7W971rwFXdu126lZFmt94zTds7nymjmV+u?=
 =?us-ascii?Q?NM4hwxOR+hNIz+gNvICPv8tiRciuS/OrCwO9bJKYzs0XdAs7AvCa8pKN2h2B?=
 =?us-ascii?Q?uUwhci7zzncXV3oSQOsXDzN0hSRtPcO2JpVNjgSvNC2gAwprrKiD0sgtFrLm?=
 =?us-ascii?Q?N4YMJv1Tcpn7zKZtJa5p8ziGIPXQXhTlbALQ9JizamnhibfdZ0KU/8nEdTnR?=
 =?us-ascii?Q?pFckZqwX+LT0UFtA5oPOWMco13a/axq4SUTzQ+EdXE9YoiwbAbXhsq7fHRFZ?=
 =?us-ascii?Q?Fufn/UY6Kg311uKaozP4BcshODTpZbRX3rIB3FQsBdpa2UlKuSL0E0Wah+Wt?=
 =?us-ascii?Q?lthXcHgAyFVAiJQFyDcvldx+0pWuZuOnNhd8OH8M3lJ53VhHkzLWQqJ/8cUu?=
 =?us-ascii?Q?zZATr6GSAOfdXgL6JuyOagM2JFGSNQE4UEcQSkhe5h4ON28H69vLtKxAeUZk?=
 =?us-ascii?Q?Qu1vgm68bz4FbwgzCOX3wclq0znhvOrbuprW9yhDrfDDEYCoc344XBKKNYd/?=
 =?us-ascii?Q?LzqFGc2gWlPp7YBOHRI5BvcUe8AVclLsasUCcdJqKHequmOdfkjVyvvpf6jZ?=
 =?us-ascii?Q?wCc4hT5debdY96KFBEHqNbBaLWmA1EVxXwDUSnzpX/tHFR1reqwqbgNntwH/?=
 =?us-ascii?Q?So7ApRSGXO/yOccRF6sAku4aG7X9yu+i/ss9sPlE7exCfOL+IsnVNknkiBGD?=
 =?us-ascii?Q?rQJ3jMjxPjGfBOsKjz73SY2o8AvDbLmTZCPxTmqmdEWh129vvIdo5eQvJ6PA?=
 =?us-ascii?Q?TzqT+fZ09LeSVinGUkkJ9BFfVpDVntEE5yiofou9Ki3Wy4zNmJY7TZEcNxU7?=
 =?us-ascii?Q?Nr9Rv3bX8LOWnWPzSRzoO/iczSWz9O4fHdglVKSMlYoMFJs5U6tTCr5ejYc4?=
 =?us-ascii?Q?1g=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: fc727a82-5b91-4ee0-f2f4-08dd345e3b30
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2025 05:42:28.0891
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i7pNOpd48R6zxoiUhSkff0S225EtlblaWWStLqsE3URtJS/ij7oRUm/88dR4CKmBhg7TI9bFlf++aTyx2OhmpY6l5V0mHLRIFAVA+o1CLlk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SHXPR01MB0621
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_214315_591545_6B2B9A28 
X-CRM114-Status: GOOD (  15.29  )
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



> 
> On Thu, Jan 02, 2025 at 10:37:36AM -0800, E Shattow wrote:
> > StarFive JH7110 contains a Cadence USB2.0+USB3.0 controller IP block
> > that may exclusively use pciephy0 for USB3.0 connectivity. Add the
> > register offsets for the driver to enable/disable USB3.0 on pciephy0.
> >
> > Signed-off-by: E Shattow <e@freeshell.de>
> > ---
> >  arch/riscv/boot/dts/starfive/jh7110.dtsi | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> > b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> > index 0d8339357bad..75ff07303e8b 100644
> > --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> > +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> > @@ -611,6 +611,8 @@ usbphy0: phy@10200000 {
> >  		pciephy0: phy@10210000 {
> >  			compatible = "starfive,jh7110-pcie-phy";
> >  			reg = <0x0 0x10210000 0x0 0x10000>;
> > +			starfive,sys-syscon = <&sys_syscon 0x18>;
> > +			starfive,stg-syscon = <&stg_syscon 0x148 0x1f4>;
> 
> Why weren't these added in the first place? Minda, do you know?
> 
The driver only require to set syscon register while the PHY attach to Cadence USB.(star64 board case)
The PHY default attach to PCIe0, VF2 board do not set any setting. So I don't set it.
> >  			#phy-cells = <0>;
> >  		};
> >
> > --
> > 2.45.2
> >

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
