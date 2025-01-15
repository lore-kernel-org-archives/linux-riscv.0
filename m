Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 704CDC02185
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jan 2025 10:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wRj6FH2IedPvTAox3xVs3rWbcCeT7/vSOem+0m3UrQM=; b=RMnLkoVb0WPHEI
	OR03b196193gAnUYc+7UxYcExs9b+ZgxD3JFgU/+1xaw2QN1XNbbmhMemxqFjiSHDp4yzlcrshoZ3
	mSxElAzoA5Rjq1UYlucPm1PAPyiXYqZRuUxPQ4vYDKMbZvUW6tCzvXMAT0+raMHxlryLnd86qDtUU
	pDnjvvq/4qH7jx8Zq4MHxVzlMApMAPGCBXB5pQxFk3TdR9/rHcieMUDAvWkisXwgcO3NRnaSaUNXe
	APiM0ADe2+DkIZ8R1ghfc5GNT7FYtj/Df9GhFFFQwS3VIDuW0CnVBDF63YyuwELfTmF5lLva3VOCo
	ykFafZkIhXqnl8Zk/uog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY16q-0000000Baaf-1lyQ;
	Wed, 15 Jan 2025 10:58:52 +0000
Received: from mail-bjschn02on2072b.outbound.protection.partner.outlook.cn ([2406:e500:4440:2::72b] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY16m-0000000BaZo-3Pus
	for linux-riscv@lists.infradead.org;
	Wed, 15 Jan 2025 10:58:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YC3TAH/n80X/NR8+1wL6SGFtw/usd8JAbG0zSw5wAuO4CReknhMeuYwW3ziEqA0IAfXisX3WO7LyaqatGrFbtmTiSUYLiM2lUA0cy00E8LML+S1Q/2/nSkAciPLVBx2jQ1KGKEqIw28GXTGKmH9xtDcsjB1fXFFshyx7qoai4nnFJgBm2mrZq2TeSmjE5ZNJRbAdBJwIBio1MzERCt1B58ObyAFSU/1NRaY/i8uPg4RCdIJ0rKsZtRJfOI2Z8LiPyF/WZnDwS6+eQa0rg1s76LWPAhWp5aKvlJR8MteuJNRwU4SjDLLtjfcmqTRYaVo1yID6IP1dZTo+aNQRjDwypw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2FS7hYxgZD+9vtVj6TwYq6h/1Yzs6OQfusY6Om1PpCU=;
 b=dy9Umxm2Bxup54eqI67xQLb+nyQISUq/n1GPFVidZGAE8LmIWbhesb/9UgMaiBot/aDLbRkaUs12/6In+C7Gd2EYcwbh5xwyyH/IxAP3SRi69vCWYSsfAHL8AlNSIKQZAMkejQVKj++l0DYn6z1Qf1hdaXqyYeL25uiOY8ZiK5BFuQ//SkwG4wq/hzEaZYtvBFOnPJzHA83+IGGC5lmNh+FSjFuDqumYxHhE9Bugc/o/B1PLw8uihFNdZR98SbCfwJkQ9fIoJsvJ114azwXc3XzDuKD8qFgc4QcmdsNWf26Vh2WJ8/5XvPSPn7ZVk5jWf2G91vZz73Rhnx3QalJ90Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::15) by SHXPR01MB0559.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1d::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.20; Wed, 15 Jan
 2025 10:58:39 +0000
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 ([fe80::3f35:8db2:7fdf:9ffb]) by
 SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn ([fe80::3f35:8db2:7fdf:9ffb%4])
 with mapi id 15.20.8335.015; Wed, 15 Jan 2025 10:58:39 +0000
From: Minda Chen <minda.chen@starfivetech.com>
To: Conor Dooley <conor@kernel.org>
CC: E Shattow <e@freeshell.de>, Emil Renner Berthing <kernel@esmil.dk>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 1/2] riscv: dts: starfive: jh7110: pciephy0 USB 3.0
 configuration registers
Thread-Topic: [PATCH v1 1/2] riscv: dts: starfive: jh7110: pciephy0 USB 3.0
 configuration registers
Thread-Index: AQHbZessMJgcIL10+UmGw9zpa2rChbMVwlmQgADRYoCAARlKYA==
Date: Wed, 15 Jan 2025 10:58:39 +0000
Message-ID: <SHXPR01MB08631714C914911D343372ACE619A@SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn>
References: <20250102183746.411526-1-e@freeshell.de>
 <20250102183746.411526-2-e@freeshell.de>
 <20250113-mushiness-snugness-0f55574e3956@spud>
 <SHXPR01MB0863DBF85A9874C9F93ECD25E618A@SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn>
 <20250114-recollect-dictate-104e890d116e@spud>
In-Reply-To: <20250114-recollect-dictate-104e890d116e@spud>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SHXPR01MB0863:EE_|SHXPR01MB0559:EE_
x-ms-office365-filtering-correlation-id: 709b3153-f8b8-4960-30c4-08dd35539177
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|366016|41320700013|1800799024|7416014|38070700018;
x-microsoft-antispam-message-info: 9I+XUpRALPpwIBcNEwpVMkyQMUFd5RbogaRVxhZvEyPoU4p0n4ymIy+GUBCsoc6Wc5yUJvqgEma8DCm7Nfmv0UokQcTL5X94VXEw8qX0QqElWiihjJ3ZOM9xhNuAi9lSWpdaMyUTgOKrkPg06yHT3SckYshhYMGcqzaIHW5Zi5IEKfAcsUVqGiMcPZJcAEK1C6CAwJhFr7njIP9K3IyK8ibb8IEjb9nBkjHezVM/WADGYnMw+lgLN0yQ/Eq2Fap+PCma6TJ05X7OG/PEhaILOwc6AoePl8ErbDLce92Ujhya4CrTcmnEK8myl5WogcrpVliwnd8FJQ30Wr1z+Vcsr8XPTOfO0c5wwsYqnauy2YeCA1+UNjSN2z9yu+fRwMHDxmxDMHGovOqmoVBPFn/sTeUhsUbGajJkJACDt3IOzjyqhBYBSB1XpzQZP5DuYXJPPTUIN1DD94jPnPaY+hpUzFwB3kDSgxd/kmycJ6EurpV2eA1xbYDzN6U1rXlXaoga1K4QaPbvrTZnmdooMGiq4Hj32Xy2BCQrIQxdZu5qwdHWJEKO/1h39/we+o2Dml0gFIM5pZesm1CZDLWfhnxxGYRmlka6/1TCUTiNIdfeMAs=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(41320700013)(1800799024)(7416014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?skwWpqJWkX1YWeKsaoJkNsQGf0P34zddSl4XHshJH3XkhSCXDM5DtpCGIDwa?=
 =?us-ascii?Q?llMSa50MRwjdlfkkBvNF1uuSZciReQbtc2uqUvqYuwv2I2CUZkF2IAlwU/fs?=
 =?us-ascii?Q?jmQLnXAfh97NQlK9ZIFBBsOvwqg3ZR4TVCHIo7J9hkeSGsCIegQKrhNa/911?=
 =?us-ascii?Q?rdA1j4icIbobrkMNWOYY3DBcmiVgaol3e4aXoXaCNlzNrJBG5Wv34oq7qHiy?=
 =?us-ascii?Q?qhd9dJHR61ZjK1nbuWpfryTC9OFvk81P6Sh3IctU+YIp+ZgAKZSSZA/JpEfK?=
 =?us-ascii?Q?WYGjYH3TOtxu6Z7EOLTkxpfs+uywmLibWhE8vFETz9YQ2Yzk1sghUQkl1p3S?=
 =?us-ascii?Q?JIJqx2mM8m9WYf+wK3t7Frt8lBEaMJsipFnz3ew4bGxaUTzvg1ZF77OzjQrT?=
 =?us-ascii?Q?UCmHu+kyZyU6u9SZRnv330PmWBnUzC4aSP/TkE8OHTmcPOuBPMKI6gXu9RJy?=
 =?us-ascii?Q?+9DcYnJWNWYEAaeZTTpQC9LFqxIf0coMlR0QbdyxRd51aiyncwtb8i96/RGf?=
 =?us-ascii?Q?i7IeiYvCdfv4UDhG1aX7X13jcKQwFucHASIAkGkMrQTVNHgDGBBjFHgFdC9t?=
 =?us-ascii?Q?JIeE1ab910TT1oayKOzenJyjrkhxtEluYEVm5ctsyj4fYV4PReWQuOJADpoU?=
 =?us-ascii?Q?khS1Oidsp/Wm6g100g7A8l4hzzb3paK/2BigJO3kqlp+cyShc8FOsErITJn1?=
 =?us-ascii?Q?klHnKzzJ/n94qJb5BYYG6+Ubd39faRCK6RLpDUNbmyPwhfR94mvOn8T9ItKi?=
 =?us-ascii?Q?x5O6MEgOjtiIkI55THjeeuWZsWfETBWZ+SCs8t36/r/88EDxndWsf4w71wun?=
 =?us-ascii?Q?jN9e0NqvdWROSmOscYWSXk6UNSe1R/CxWx+7u8iVNTW/AR+G1aPRItltghRF?=
 =?us-ascii?Q?qei9JNHEbYTMT81d7JgdCBBpV2IjQsmH0ttJjybLglSacqH9rSGEf8uHj4/m?=
 =?us-ascii?Q?2M5+rZZJ0O7e2r+rSqdy5cKGcSfCoYRrkUn1iwIp8d/DkgxxLRt7ecmlmPpq?=
 =?us-ascii?Q?LcXrSdJ26Cd/mosy/qqQIocrW1AzB67DsdO3BsNUogE1AoONLt9h0bmNzhYI?=
 =?us-ascii?Q?0Seyb/I4j4gW1L9gY6SoO8Vnj1giGuQS9p6vpAAXwZEgAHV+0snOIIBUVBYN?=
 =?us-ascii?Q?0N7a6BSMP+c43K+kP2TQ/tmYyPdeTtragsp6BDsd3gTc6BHAVMAF38z/gzQ8?=
 =?us-ascii?Q?hODhyI+elHx3MpXsOjHJhLmvn/PbFAZB/+XzvkKKgUcgQ//TIz2ba73kRGqq?=
 =?us-ascii?Q?W8npkPUUJm+fuQ0DO6FQX8iuY8Adu9pjSVYR6rDx00A0RBUeZUX5Opym5zc9?=
 =?us-ascii?Q?LOSJJwukchrwG4Xq7Hzxg8um7WT/0uoiAH49yI0gaAv/l/NUYTgSHpipZxdH?=
 =?us-ascii?Q?7g4m7zE6jsXgnEvX7GLJLmd6RYXuBYMVEplLHxPUezZl8Najj4ogO+Yp7Y6D?=
 =?us-ascii?Q?5twnWjWkRu2Om39MlUwF5lmaBHGMpmIiRibwx09qqzifaEhqSR0izQrf1R/u?=
 =?us-ascii?Q?e+J36P7nw2iKTm0PpNlstIqTTZ4zR7XpOjtCdYkOkKlDPsq1/pHZh4K0flKg?=
 =?us-ascii?Q?X24uIRHzyXKyjJcG+f1lNDYV3u/uZJlohxpx55nlAx0HL0p3ckp78S68TG9W?=
 =?us-ascii?Q?EA=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 709b3153-f8b8-4960-30c4-08dd35539177
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2025 10:58:39.5301
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bJ9+v1osw3B9vadUaCoIf+ejb1SFRWaTaP4QSY888kzibeNcd+Rnho9g4AjpIO6QKGMprgCF2t6lvR5om7Kl7ncKIgmrRsKR5s10Tz3goEY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SHXPR01MB0559
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_025848_854302_60B8C6E4 
X-CRM114-Status: GOOD (  21.54  )
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
> On Tue, Jan 14, 2025 at 05:42:28AM +0000, Minda Chen wrote:
> >
> >
> > >
> > > On Thu, Jan 02, 2025 at 10:37:36AM -0800, E Shattow wrote:
> > > > StarFive JH7110 contains a Cadence USB2.0+USB3.0 controller IP
> > > > block that may exclusively use pciephy0 for USB3.0 connectivity.
> > > > Add the register offsets for the driver to enable/disable USB3.0 on
> pciephy0.
> > > >
> > > > Signed-off-by: E Shattow <e@freeshell.de>
> > > > ---
> > > >  arch/riscv/boot/dts/starfive/jh7110.dtsi | 2 ++
> > > >  1 file changed, 2 insertions(+)
> > > >
> > > > diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> > > > b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> > > > index 0d8339357bad..75ff07303e8b 100644
> > > > --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> > > > +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> > > > @@ -611,6 +611,8 @@ usbphy0: phy@10200000 {
> > > >  		pciephy0: phy@10210000 {
> > > >  			compatible = "starfive,jh7110-pcie-phy";
> > > >  			reg = <0x0 0x10210000 0x0 0x10000>;
> > > > +			starfive,sys-syscon = <&sys_syscon 0x18>;
> > > > +			starfive,stg-syscon = <&stg_syscon 0x148 0x1f4>;
> > >
> > > Why weren't these added in the first place? Minda, do you know?
> > >
> > The driver only require to set syscon register while the PHY attach to
> > Cadence USB.(star64 board case) The PHY default attach to PCIe0, VF2 board
> do not set any setting. So I don't set it.
> 
> Does this mean that the change should be made in files where it will only affect
> non-VF2 boards, or is it harmless if applied to the VF2 also?
Harmless. The PCIe PHY driver still set the PCIe mode syscon setting.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
