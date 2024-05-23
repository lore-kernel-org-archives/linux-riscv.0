Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E2B7C25B75
	for <linux-riscv@archiver.kernel.org>; Thu, 23 May 2024 09:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R2aqtFNfR02mk+pxk+joMVL+TAS1szksK3skFyKhiQY=; b=1C34+t1nzOaaYZ
	k6pvtO0Gnph1qX90NtTjjZLe1XqrjAuhwztS59Fh+tUwOlQkvK1lGICl+8avYEqCu+aA9z5ly6bI5
	vNnB4lqRi9BHXn98Gz3ebqc3bkAAAEFwGgcQCnyf8XqNlkQ4lbz89JmzneQJTIc5OC/E1f8e/SbGP
	mGws7RwB2nGzJ9oVz42iScWhYP7hlMNbP1Gk43D9HVLboIQKuAV5NxLw5GrNHZ4wZZrMnh2Qbnp1X
	NmpvoaoSz6T2ajtHDtC/cIu7JjERB4q5hQGlhe4YMhX4jnBH4fOGrflrUsFL5FtqfDpnn0DYWz0Gb
	AVy42UgN9yBQqECdaoQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA4eS-00000005fZ5-3NfF;
	Thu, 23 May 2024 09:22:20 +0000
Received: from mail-sh0chn02on2070f.outbound.protection.partner.outlook.cn ([2406:e500:4420:2::70f] helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA4eN-00000005fTi-3Oop
	for linux-riscv@lists.infradead.org;
	Thu, 23 May 2024 09:22:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MR91Ed9tZ/3Xa4Pt3uZOJUKowIjqazvC9TgtKp6oy3Jm+N1biFCQ+P4WXQR/LHyjF0+51GVCDmk61yslIi1UUpQVwGDNpFkRfk612QcTj9Mm89qYT9YpkxieO34wcgOmyPdgHc4wrWf4r9iM6MwkejyIkj9htgrg0X5tNeFOlBIVzTu5HiTyDmk6SaMizM17CJ/cTmPI5d2mwM1hAiaA7XbMf2c8BKTVHxgjUlpzSDEdDzfzh1Nb+VFT9HLwEJiqlIvPADEr2lG03uvBIhAhX0A8zEp93M7a0T7yUeWEbWqqsvS/Sr/0p9tTKzXxlIocP2mzeG6ZxdHU1foPbmoQvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+czhaeOqLL41rzappT2dmFnTHWRhb37Eo+B4UnWDewQ=;
 b=KW//4sDqIm6zQIGNDgVbnmSf1aJGuwqOnYMaEft8REHC8qBLNDleuGgQWIPVRoxEfwMz2a63FvCcUNa7tdqPj/K3op1vOE6tsNy7yBPLuq75dEwKtpi2fsuSvsBW4ViOqacVgzef+smjhcA5IY/lH4CkW95Au/NJhbOqL2INw3Fik2YYO+bDdyaKO0AL9f1Q5DovJ9I8I3bs8oGNtDf++MS5LFtHZ8op94Kmo9LY5nYLPi/OOA719eV6+uE0BjWrj3A3dHILuX7v8UbNOLskp0YQCqBKSsINMYTy6cZlo+cMQ26UDtmWSY0o2FXYWxu5EdtlgaZ09Us0EJ8Q4u8Zig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::15) by SHXPR01MB0878.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1e::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.37; Thu, 23 May
 2024 09:22:02 +0000
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 ([fe80::358e:d57d:439f:4e8a]) by
 SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn ([fe80::358e:d57d:439f:4e8a%7])
 with mapi id 15.20.7587.035; Thu, 23 May 2024 09:22:02 +0000
From: Minda Chen <minda.chen@starfivetech.com>
To: Bjorn Helgaas <helgaas@kernel.org>
CC: Lorenzo Pieralisi <lpieralisi@kernel.org>, Conor Dooley
	<conor@kernel.org>, =?iso-8859-2?Q?Krzysztof_Wilczy=F1ski?= <kw@linux.com>,
	Rob Herring <robh+dt@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Thomas
 Gleixner <tglx@linutronix.de>, Daire McNamara <daire.mcnamara@microchip.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Philipp
 Zabel <p.zabel@pengutronix.de>, Mason Huo <mason.huo@starfivetech.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>, Kevin Xie
	<kevin.xie@starfivetech.com>
Subject: Re: [PATCH v16 08/22] PCI: microchip: Change the argument of
 plda_pcie_setup_iomems()
Thread-Topic: [PATCH v16 08/22] PCI: microchip: Change the argument of
 plda_pcie_setup_iomems()
Thread-Index: AQHarK3uyefc+SM1B0in6DqZmUwbsLGkGnyAgABxfVA=
Date: Thu, 23 May 2024 09:22:01 +0000
Message-ID: <SHXPR01MB08637281B32AEE455F030081E6F42@SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn>
References: <SHXPR01MB086345C911E227889E3A4211E6F42@SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn>
 <20240523023549.GA105928@bhelgaas>
In-Reply-To: <20240523023549.GA105928@bhelgaas>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SHXPR01MB0863:EE_|SHXPR01MB0878:EE_
x-ms-office365-filtering-correlation-id: fb9e2045-4517-47f1-d722-08dc7b09cdf3
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230031|41320700004|1800799015|7416005|366007|38070700009;
x-microsoft-antispam-message-info: u3XERaeYc1o8E5dgmXPYoMl+tWocZb0sLzPXqJ7y8c2y5hsyPmiURkwbNzWYVpgkUsYFQqlN0O42UGqEQ0HNgdAH3ca2A6TNpAufUXS7DBk4s9gJ22SK23g3ft8d9hZQYBwU7yv3cqNJhseD3jzNy+yEF2FtASzKAEBGOb45s3ctIxQy9YnkQa50CqgWe38mpD3tNyWG3oINqPx8yYijN+k1i3Yiqe+5RIkmq95l+936PgrZBdHz0vn+ZfecBhBBqudlVKj5UwOn1GG9icO+kSBxf4GkidpNulZGTXOmpP6Na+ChWeepss1v9ayj2t/J1LSoOOAQGe0R+lWzofY5v0YLboG6H62FIqjEeDbwPRyBmpD5cTbuvBz2t74o0tv4j80vKrHJG/31dtUZrK45Y2GDycLrenFBa6R6XDvi62vw2a4d5wH0y3vBFOuY+GHTGIrQX+UBpMJqUuUYNT5l799lsaBOk/Yry9iGZkjIYh3/PtB2fRZGbVcNQxGXI9Dz7thOYRvgBTRRvWLB67AE0wSdFORXC7GeLWb3pNhzKb9X8Qi5rE9zm7ckAb0bvX7i9Oz2YzC5Rm+6tBnyviWqspkVWiq4uBv+w5S0DbYkzpzN1LahGBpLEpF/rta9jTHe
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230031)(41320700004)(1800799015)(7416005)(366007)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?DyxLPI6S+Hfl1x284rvlXQiMdNn05Nq0hh9BGusm6+HRvoXiTBXv4yuD/W?=
 =?iso-8859-2?Q?sJ0bNJx10llWwCUqHxDJXHDJBNGRObm3soyV/SShMooZ9TA0DcxKXmQZ0D?=
 =?iso-8859-2?Q?W1Oc/26GhVeUICBjkkwEsqWcfx6iU87OxP4eMidH8L6V6vO5FWYzDr4epj?=
 =?iso-8859-2?Q?/OWDvGDmisbFpEKpSda+Q1AHf7RPIupAlA2R3KzG+TCf6B1Ou+Py2RTHbh?=
 =?iso-8859-2?Q?ICc/rfSdn0658rBs4yiV2j1vd+ISD9zRdT+o1zclMa+MR9ya+DeTERzMNn?=
 =?iso-8859-2?Q?gahYrW4O8Lfe1gyCSirejCq+FPM8hXzQ+pXd1jO1bY5a+dZE519xoUnATS?=
 =?iso-8859-2?Q?1bn1zRGLv8Jryz+PcAhsq6TAWRKMwD+Q9K7V6rYJi5J6oxNtjd4rDJE6mW?=
 =?iso-8859-2?Q?m9LAI5XfRdnzR0CZN8Gl+N9ABHguGALh5yhvQFdK83CLnTpScogKuH9ojK?=
 =?iso-8859-2?Q?sB8bvEqEntbtPvBD9TgQzlCaaNHG1xcaS8fqZ9dS3xKWxm0ZfKt9EL3oWC?=
 =?iso-8859-2?Q?3jm2jg+ngBaFlFDR3kp80wAEYCmRoWVrWg4Y8AdQNIA9Vy7A3PxxCHvxnc?=
 =?iso-8859-2?Q?wiZBRAmb8QBH7WzVhMKnP8catQl9/0SG71UnfsAVZQjJgiu4C8y4+Z8bY7?=
 =?iso-8859-2?Q?T5cjvicg+6m/76ZjP++KLDHEU5T+W2TZOO4C8ElaH1v0L1H3tEcOY07M8P?=
 =?iso-8859-2?Q?JnnZLmtSSoF6qMIYBZ3id68Jy4/++IAB2Zy+kR3U4wrWeLK71FES9tohbK?=
 =?iso-8859-2?Q?b71U/npTlnx9zxLcep84yTs+65Xq32kqTLCLWe3L4y2yCRsyMxYVyeawxF?=
 =?iso-8859-2?Q?qd0AWQQ4aloNsDf8pTRo0y50msNJtnCsWep19faMCxAjwz2xpCeYThucsT?=
 =?iso-8859-2?Q?Tp5fzKDiivPOBem7AA5zzeKK5jw8/todsZzkWEsbz7NB68FuqOtPnP428t?=
 =?iso-8859-2?Q?/3d3U6GW4auLK59iYoAVm/bezdN/UVnfqeaE+2BoA0tP41vboMDrUfJo4q?=
 =?iso-8859-2?Q?cfpqOHkHBHLQmqq9YR4V2HnLpFFZXzvNNXOConIT3+3/BzEYD4/vA+jrYH?=
 =?iso-8859-2?Q?08tuYED9KwhA8Pyg62A7rsNTrRh5fcFtMdF4EgH5WMG0SO0i2ghfbb6h3+?=
 =?iso-8859-2?Q?nKcoM9Ru1Vho8eDL43vTwLnWuAv3V5LldEyi+bNuof8+NciVE5SCx4cQ/F?=
 =?iso-8859-2?Q?icPsb6iolEdjsL559XIt2HjcQbOLc3qrzpYKvf8XhNoUBUye5XjuNSLYVp?=
 =?iso-8859-2?Q?RTSe3iepVP3MPOzuVv1GxFnbur9HVRi/ct2NgD0ehmrck6E/zU/wv0AqCa?=
 =?iso-8859-2?Q?qp1IvDGMp7JwDZUuMuqHIEd+cc5ZArIPvy9Fyik/It+YTuqg1wvUEFv1dx?=
 =?iso-8859-2?Q?6fr4Gg+bNPONP2FHd+tRHtkjoXSMcTF4bRZCMmkpNoQa3RxWuZY8iNaoOc?=
 =?iso-8859-2?Q?Uk8QB/ytnJrONZedkyHpvX4u+wtwZTO6b9nEO7KxtwfHlDvRLxfY+NJZwQ?=
 =?iso-8859-2?Q?evvJwNfsNtcqsiBw7uxzEgffpv9fvxeJ9maz56KlRtHb5x6wuRfG45kFLz?=
 =?iso-8859-2?Q?doiPpjQsIXw/aO8CTboEAiFnYTkCkf3D2rRDGnXyIGcrRIgwEFHhsAB4y0?=
 =?iso-8859-2?Q?9VtMq0XVxP2ddJeYfcz5ddAMcxHxd+0TMcfUhKgjw4tYi/xaFRrpASIQ?=
 =?iso-8859-2?Q?=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: fb9e2045-4517-47f1-d722-08dc7b09cdf3
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2024 09:22:01.9941
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ca3koo2UIrASq0azkKHdn3dt7eiaaWMgRZUNqa0zcuQpkowl5FBk+98QgRW8ZVkKvU9ALNelEA3tdmIG74I179vkj4GwRcLoyQQ/18S2D8M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SHXPR01MB0878
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240523_022216_035246_80A807F3 
X-CRM114-Status: GOOD (  43.49  )
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
> On Thu, May 23, 2024 at 01:09:58AM +0000, Minda Chen wrote:
> > > On Wed, May 22, 2024 at 01:50:57AM +0000, Minda Chen wrote:
> > > > > The patch is OK, but the subject line is not very informative.
> > > > > It should be useful all by itself even without the commit log.
> > > > > "Change the argument of X" doesn't say anything about why we
> > > > > would want to do that.
> > > > >
> > > > > On Thu, Mar 28, 2024 at 05:18:21PM +0800, Minda Chen wrote:
> > > > > > If other vendor do not select PCI_HOST_COMMON, the driver data
> > > > > > is not struct pci_host_bridge.
> > > > >
> > > > > Also, I don't think this is the real problem.  Your
> > > > > PCIE_MICROCHIP_HOST Kconfig selects PCI_HOST_COMMON, and the
> > > driver
> > > > > calls pci_host_common_probe(), so the driver wouldn't even build
> > > > > without PCI_HOST_COMMON.
> > > > >
> > > > > This patch is already applied and ready to go, but if you can
> > > > > tell us what's really going on here, I'd like to update the commit log.
> > > > >
> > > > It is modified for Starfive code. Starfive JH7110 PCIe do not
> > > > select PCI_HOST_COMMON
> > > > plda_pcie_setup_iomems() will be changed to common plda code.
> > > >
> > > > I think I can modify the title and commit log like this.
> > > >
> > > > Title:
> > > > PCI: microchip: Get struct pci_host_bridge pointer from platform
> > > > code
> > > >
> > > > Since plda_pcie_setup_iomems() will be a common PLDA core driver
> > > > function, but the argument0 is a struct platform_device pointer.
> > > > plda_pcie_setup_iomems() actually using struct pci_host_bridge
> > > > pointer other than platform_device pointer. Further more if a new
> > > > PLDA core PCIe driver do not select PCI_HOST_COMMON, the platform
> > > > driver data is not struct pci_host_bridge pointer. So get struct
> > > > pci_host_bridge pointer from platform code function
> > > > mc_platform_init() and make it to be an argument of
> > > > plda_pcie_setup_iomems().
> > >
> > > OK, I see what you're doing.  This actually has nothing to do with
> > > whether PCI_HOST_COMMON is *enabled*.  It has to do with whether
> > > drivers use pci_host_common_probe().  Here's what I propose:
> > >
> > >   PCI: plda: Pass pci_host_bridge to plda_pcie_setup_iomems()
> > >
> > >   plda_pcie_setup_iomems() needs the bridge->windows list from struct
> > >   pci_host_bridge and is currently used only by pcie-microchip-host.c.
> This
> > >   driver uses pci_host_common_probe(), which sets a pci_host_bridge as
> the
> > >   drvdata, so plda_pcie_setup_iomems() used platform_get_drvdata() to
> find
> > >   the pci_host_bridge.
> > >
> > >   But we also want to use plda_pcie_setup_iomems() in the new
> pcie-starfive.c
> > >   driver, which does not use pci_host_common_probe() and will have struct
> > >   starfive_jh7110_pcie as its drvdata, so pass the pci_host_bridge directly
> > >   to plda_pcie_setup_iomems() so it doesn't need platform_get_drvdata()
> to
> > >   find it.
> > >
> > OK, Thanks.
> >
> > I see PCIe 6.10 changed have been merged to main line.
> > Should I resend this patch set base on 6.10-rc1?
> 
> No need, I rebased it to f0bae243b2bc ("Merge tag 'pci-v6.10-changes'
> of git://git.kernel.org/pub/scm/linux/kernel/git/pci/pci") already and it will be a
> trivial rebase to v6.10-rc1 next week.
> 
> The current pci/controller/microchip branch is at:
> https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/log/?h=ed261441e22
> 4
> Let me know if anything is missing from there.  I can't merge it into linux-next
> until v6.10-rc1 is tagged, but as soon as it is, I'll put it in linux-next.
> 
I have checked the code and tested it with Starfive VisionFive v2 board, PCIe can work.
All are Okay. Thanks for correct the commit message. It is more elegant.

This is precious experience of developing refactor code. Thank all!

Hi Conor
   Thanks for help us for this patch set !
   I see mars dts have been merged to mainline, this version dts patch can not be merged
   I will resend the dts patch on v6.10-rc1.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
