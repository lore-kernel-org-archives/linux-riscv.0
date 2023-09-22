Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E01B7CD4F57
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Sep 2023 10:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V50zin2/+ZOj1dTfuxEfSxwlTMw78wlQeGgRjD8Clas=; b=uIGfJCWGlBdheE
	Ia7pZksxozL8X0nTcp3740y/kyx7Qrb1p4y9Oziq5IwwBr1FbjY1lw2wxtVtcFjDe3QG3vNq2xG4+
	qqkHDTN7Q/ayF84pW4Y/JP1KVj3JBvPox98q5afO7mIrFCEWw09xnSftnFjJUk3NRGsPXbTzc6uVK
	awyjFqKc91Dadp03MMGb3Ipzqw6bPEDmEbX4tTfcHywmkyS+XjJGIxq2X3gvARNStOnodrJnZ4cXm
	BRuFxo91jK5vNceH5ljLEYGCvZF0lH/va/aVmr8aUxFajLK0p//xe+vNh3xXivkHf1jlEPk4IwpKX
	/WB0M4iFmTr8vcadyYZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjdc2-008see-11;
	Fri, 22 Sep 2023 10:42:18 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjdbz-008seA-30
	for linux-riscv@lists.infradead.org;
	Fri, 22 Sep 2023 10:42:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1695379335; x=1726915335;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Skmvq4EvWXL87+FF9uLYG2tys4L/CrLkgb6J9LhrcpA=;
  b=wEOz275a6o949Mkn3qRIOEDV3LxuC2NdD7ILx7rIb/a3ZJZBRtbRbhQf
   alArf+Ub6IpWUh/TtXQ032yyfKyV9rNb4TqQYaJWAFYaeU/61ZZtklYP6
   hUmndejriaCVnpcPB6ypJZRMDXT2lma9Je6flKsdomSGn+PhrTL+Stwp+
   iNedN1ltQNJpbR1/GO5nOloSp7hPbWikECCX52WmopB8oruFs0r5A7/z6
   ljdyYaCMoZH86fW8IE7TbLJrQx8SUD2m+WVOPPUlhgq9+aXybCSy7IQI4
   79JDxBo5OQRZyJh4nDrkmgTkcM9W195QOAa8uJPbDiaAKDA635XedkM4C
   Q==;
X-CSE-ConnectionGUID: eTk6ojRfT5Kyok6eEXCjLA==
X-CSE-MsgGUID: e0tLUat5SVm/YuXhiBkmGA==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="173054212"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 22 Sep 2023 03:42:12 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 22 Sep 2023 03:42:12 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Fri, 22 Sep 2023 03:42:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=So5fnyTHFDKPzsDmVeKXoBOAa47h20he6R4/rA3Da799cBGe3XbFBd5V81djZG5o66c1TIUeyfb8YZIxlEdTQzeSwwO0rtAz4XO2SzkwJUGs/IEKDUcv9CmiNZkdfVU0xwZXQ0zxkalDDIc/WwxkXmUs6LCh5JqSe+MfewbKpFONWc5+lP1feyq/ClFsLIN2YiivPfP27dzHoJkXCLewY1GSBlBH2ughYrJtPBykfZ/bggDWjdLUmgKuE07/oXCX0j7s/phuLKuQEoqZbIyzBT4QyQFCq8jTW6c11xRZyvMfUAgAyaF9cyjR2oNGjgOsXG4mygVc9fWHDqnxXoaVVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JqvkMIvOhpACTy998KEueMJbp9IoJXWOXzOtHMEFd+w=;
 b=lgSYXc6kO4QOMJoS10wVhs5GbryYDbaQlhYsc1PplkqIGBMLf/Lml4rrWntnnQLjblOLI0IC24W9+vdiZUKV/lPExYiX870SdDLPwvrMIFgpo58b2Dvh6VI8fVZTXuRp7KIVjRElfTTjpPoz0lh0Qs3hOnrw2WBsq1a3HxpkfBzedWiEydGODTG/rBUNBqt12rJzSSzYDELBX0pUQPuUZwar4FPDWz2vxz9EJBFki7n2RvXjs0DJI/lrB1ddDQIDpujYfC92VlVTIRd3GmHCbdwuHKnTJFDNFiyiS9XSwneqPaH0z81dYiuQdiXlEzHuUrVW2Eyz1cF8DVmuZbaiGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JqvkMIvOhpACTy998KEueMJbp9IoJXWOXzOtHMEFd+w=;
 b=V1jd2Y3xkzPFv52ZJIHdv9DlWZBBvA90IlAPWzYwmZOplxswP0iAEcr4A/OCbHFwXHi3W6fHEcgTf9jr9q/mX2A0CcpePWj8ymkF5Bvspoa9tCyyaU/VN3p5jNAud+JXjqYhLvryHISKoKwWPHFpGL/IjWPX6WeceEUcv2x6NRI=
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by CH0PR11MB5410.namprd11.prod.outlook.com (2603:10b6:610:d1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.23; Fri, 22 Sep
 2023 10:42:08 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::1133:b6c0:3f07:84bc]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::1133:b6c0:3f07:84bc%7]) with mapi id 15.20.6813.017; Fri, 22 Sep 2023
 10:42:08 +0000
From: <Shravan.Chippa@microchip.com>
To: <conor@kernel.org>
CC: <green.wan@sifive.com>, <vkoul@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>, <conor+dt@kernel.org>, <palmer@sifive.com>,
	<dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Nagasuresh.Relli@microchip.com>, <Praveen.Kumar@microchip.com>
Subject: RE: [PATCH v1 0/3] dma: sf-pdma: various sf-pdma updates for the mpfs
 platform
Thread-Topic: [PATCH v1 0/3] dma: sf-pdma: various sf-pdma updates for the
 mpfs platform
Thread-Index: AQHZ7ToqblFPtXWav0WJTyzRxHSXzbAmn3sAgAAI7pA=
Date: Fri, 22 Sep 2023 10:42:08 +0000
Message-ID: <PH0PR11MB5611817FABBC6C3A6B6C185081FFA@PH0PR11MB5611.namprd11.prod.outlook.com>
References: <20230922095039.74878-1-shravan.chippa@microchip.com>
 <20230922-uninstall-catchy-0986e5b03ae5@spud>
In-Reply-To: <20230922-uninstall-catchy-0986e5b03ae5@spud>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5611:EE_|CH0PR11MB5410:EE_
x-ms-office365-filtering-correlation-id: 2694538a-dc8a-4fcb-b97b-08dbbb589242
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: T55JuMwHnDjVHza0vXb/pgVM+Tqk3IqzKWKSVdS/h+LMSRP+Q1ZOKKK++oQ6zPxOcNBSneLVRTKqOHJ1Crj7XNiD5I7llNSHxkOcRhwB7IFWeL7DjEjYSfPLFl2nFmbl99+rDjas2gJZ5DbdtxGYF/c0zZK/+XigCea4pHehsWJv08+cpjvd9BXJ68Px/TmJn+Ze+8PLGRH2jsb2UjOnKWCcG6BAVLPZ+7ISrLltNXfPPo92OczVIzqP73DtJo10Dw4b3OlP1PDOpvlZea5WWAgm+y2/gJxgMMTotkUWZD3f6o5aLXlC8oYDliqfwBz5ZhZgVCzVV60LKKoL58b1fCj7RR0YvGMwJlMPJAFmnzO88f8MpiIdJWPEITfL7HKOyl9linfslg3Kg6RiOYZQ3BkJTGOjaF3d/E03txtMjq6Gr+fTUN3vTlzmCftD+tJXLzrm66eRjWM4lwfcNFcddIGWq86GcbJrjpwopPG+aLtqSZk9zc7M4XEbGBfufseeP+XHEQGW4mTdkaSqLgBzlDTkx9VqSZxc2jgTQiQ6cNRz8lEAM57W4TdSBiT4QPLZF4uIieaHZ7yqp3/5VxtEfRWyQwBpOSuzsuIwkvmRrF6RzqAo3JT+PATbm3xNU3Mv
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(1800799009)(186009)(451199024)(26005)(107886003)(38070700005)(38100700002)(7696005)(6506007)(53546011)(33656002)(55016003)(9686003)(86362001)(83380400001)(122000001)(6916009)(316002)(54906003)(64756008)(66476007)(66446008)(66556008)(52536014)(8936002)(8676002)(4326008)(5660300002)(66946007)(76116006)(15650500001)(7416002)(2906002)(508600001)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?rdH8l5pOqlxIHYo5iepSrI6k/2jwYZZcLENw6klxtg98CBujvoFUCg9bBzAM?=
 =?us-ascii?Q?b04mfsmWyEas0d+Hneakxlteq2aauHC93+Nc+QOGfmJ2zIwn0c3MupvcLPGZ?=
 =?us-ascii?Q?XnzF5ZFUnyNbZTlY1SBZoHp4mqpUYvmX3HdeoCrXQMQrGpZ9XfPYeNZqm77l?=
 =?us-ascii?Q?qSpcrJ2QRqObpaBya+n5bTK4FWxRjagUewJPcTmx3BE5ZBYbr8A4a7Xw2a2W?=
 =?us-ascii?Q?OzHv/zzi1O/FlPlL2Afq+/fVkl3PRZsmbvSb8JaHBAb7V3drdJSNuCy2tHDw?=
 =?us-ascii?Q?oYi1csn8w3h0qxxP/W5EZOs4KXB8o6R+SORQzK1pPE9guvFCiCFlrVyNApFJ?=
 =?us-ascii?Q?idzdS+5tFyiF933OLQsq3rPe9MfGu2cZyHZ5O43tQvTGQ7WOd+cE9OeyPXQn?=
 =?us-ascii?Q?a/sp3Ri7xgNeQ75jvRognOkxOS/mtN/fmA3qOyelExvhVPhGI7jeADHlnAUp?=
 =?us-ascii?Q?pxjjRgHiHgrg8O8zmxrMdavYBJCZLNJN3+WDryLpOI3foIGUy4UbY6DqdaCK?=
 =?us-ascii?Q?j5OBX4JyqLry9VLH7py/FzppGvU4GcI+OYF5n2MimirhSOiMP6A5CZfPHzvT?=
 =?us-ascii?Q?Ywn2x7gJisOP/CkPszgdXRsefl0HvXAS2w7VC0p86/Kuhh+pETWDZuJRx6S/?=
 =?us-ascii?Q?MjKelZVYjFv94y0Z8SbQe7nQkXzEm2l2EeexvSH/7qncDFv1ZS5EfF9vZF/x?=
 =?us-ascii?Q?ekP3qvDWrOJFxPC+xVb0K4Uuqgm4UA3eKssyBvcHgzrKRLFqO1dPsltY+NJ3?=
 =?us-ascii?Q?OGJXesI2NzrHXMwOZRqHkx9/8zqonqSzvk4Fy4jM3uYe2A6qVIm6xHODxcDN?=
 =?us-ascii?Q?W6qpL2AsW6Bo7zzqIxCjayT5tI8eo3imhSGJo5C6QQVe4T8k2m4as42ePUSm?=
 =?us-ascii?Q?ba3GjgQRz8ouGEu4x3X6fCgG3yARpp4F+n6AMvg09Bxv6KthJVRtdsU6O78G?=
 =?us-ascii?Q?mQZGkPL5vAhaK5IOEhPx1IjCfrfZwtnP161SAjPFXwlBBWji6L236Ls8aLF0?=
 =?us-ascii?Q?FHc/2tAc6Zk7Lk4r2sW3+5ZFunnYVt1cr8dLKq++KAXNmQ0ytB8iXDDuzdA2?=
 =?us-ascii?Q?Z3E7YE2uTfetgdyag44edkqNlt7rVRESUqhsZHG7kdDZ78peyZszSnK/mH6E?=
 =?us-ascii?Q?2iCX6MFwqXwnIHaREYEwkLneLxLnn4qL4y6eucYSMT9mHf9pX/fngJIG5y/c?=
 =?us-ascii?Q?XJuX5Y8gvnwA5F5J1uEwiVGYdh7rdGSU+dnHOxqfKXS8FgVYVleMsO+DvGQL?=
 =?us-ascii?Q?VLAnj3aOHC6DdWf4VnCi9B6mBP6Hcw/1H/g4+7o5UDg8bIOQENOdhPzLIwfJ?=
 =?us-ascii?Q?WXU0DY3dK6CfH9eXpl9Cpzd4dV2n2E5EHCO2MJW6IXUJoQLuGN/ccOqYPXj1?=
 =?us-ascii?Q?/DUvn34xSvNROoopTJosHj5m65TWA0thpR/Kba2STGm3WvCOe7rmnaZ8+P17?=
 =?us-ascii?Q?VvqnbHbf+xl/082bVdOqgSsQy+OQWuZjq9KpCrnszNU1YkapaE8FXqGcisAh?=
 =?us-ascii?Q?j1H5fCYo93ouHt8fljMC8xTDMg3fc4cCoBbXHEZSt4DD/FIFrhwZLhB7VWS3?=
 =?us-ascii?Q?Mw3tU5nC9Uv4tQJxA3IZQ7MNUMmy9gkU6WJhMr7hTmUKGJt+jqzvOw9cu+Ob?=
 =?us-ascii?Q?vA=3D=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2694538a-dc8a-4fcb-b97b-08dbbb589242
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2023 10:42:08.8067
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S7KSKy9XzwVbO3shg5yX6pARKF9ZgOp45exAU4aUdWbBfvxI1Jg+jg0DeQv6OLY4lPWzE60+5p4Y+AMx0JfBJMoTI3IMl3rflonfG9k9pUw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5410
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_034216_161880_EF530AE5 
X-CRM114-Status: GOOD (  17.45  )
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
> Sent: Friday, September 22, 2023 3:40 PM
> To: shravan Chippa - I35088 <Shravan.Chippa@microchip.com>
> Cc: green.wan@sifive.com; vkoul@kernel.org; robh+dt@kernel.org;
> krzysztof.kozlowski+dt@linaro.org; palmer@dabbelt.com;
> paul.walmsley@sifive.com; conor+dt@kernel.org; palmer@sifive.com;
> dmaengine@vger.kernel.org; devicetree@vger.kernel.org; linux-
> riscv@lists.infradead.org; linux-kernel@vger.kernel.org; Nagasuresh Relli -
> I67208 <Nagasuresh.Relli@microchip.com>; Praveen Kumar - I30718
> <Praveen.Kumar@microchip.com>
> Subject: Re: [PATCH v1 0/3] dma: sf-pdma: various sf-pdma updates for the
> mpfs platform
> 
> Hey,
> 
> On Fri, Sep 22, 2023 at 03:20:36PM +0530, shravan chippa wrote:
> > From: Shravan Chippa <shravan.chippa@microchip.com>
> >
> > This series does the following
> > 1. Adds a PolarFire SoC specific compatible and code to support for
> > out-of-order dma transfers
> >
> > 2. Adds generic device tree bindings support by using
> > of_dma_controller_register()
> >
> > Shravan Chippa (3):
> >   dmaengine: sf-pdma: Support of_dma_controller_register()
> >   dt-bindings: dma: sf-pdma: add new compatible name
> >   dmaengine: sf-pdma: add mpfs-pdma compatible name
> 
> It looks like you're missing a patch here that adds this new set of compatibles
> to the devicetree?

I will add a new patch for this.

Thanks,
Shravan

> 
> Thanks,
> Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
