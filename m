Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40A02C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Apr 2022 13:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o4NOaGGhh2MLeLoucn621yQiSdX//+Svy7zAwkgiMjY=; b=UOY2QVGs64eoMW
	En9iVd/hRh94swXbgacIm4vgmpOnmwOPRTzif1k0J3PaJjU2QnJhyeaGmc2Yt+PmOvtfIaoY6jsYn
	Bvba8JkntrYrfdinZ2Z//TgMz1jQir6MwfBJfQG9H589drwaVjffWfdL2mfi4nwiuOzG4HMV2O4Cx
	N6rDqAxgxQp4HIe1wt3GSoWabLxUaPxfNP5S8oWcv8o3frjhlN+IjqxE0Vz7/7xpKOCYDBf5GagMj
	kXavu4MZjN23aJ4vMALQq8QxnFbVzyQjuDDrT7bqaLuz9iqn4G1r1SbUOhFKG/nQfVCHUzSuS51GJ
	XuNRj22/aa6kNbzwyOLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbips-0012Zr-2A; Tue, 05 Apr 2022 13:03:04 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbipo-0012ZW-8p
 for linux-riscv@lists.infradead.org; Tue, 05 Apr 2022 13:03:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1649163778; x=1680699778;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=DNzZfC9NU4Ifcqv1S7wMUk/tw179Mi18EK3uDf6xags=;
 b=nLVofboxAOkGBjLaA8rLn4fi68G5qJ6X5QwpTtJKOG+hSz4nBdmwex63
 i0xbjt3DkSZiOoCPVG62dZoBBGKMpVozgK/GR3zDTomAXvk5UQv7ISka8
 eb3/1UrhOHih3Rvg21u2pb/9bSnbOYMgsFvrO/uhyKjcQyryocFqGRR1M
 S6SkTWuqn25lU3FnvPk/mkFM6l/iRdz08Doc5NxWZT3cCy5UDr5f3KA3d
 uNngisa68rUe0RgjrdZ2qhMsVkabXcbLXhDhZFZ51q9ac49MzuH4lthKQ
 oMxurqHyj5F9Xx7z7NbcMpYGcBQkjRk5CUaTL7k1Gl3+I4WfU7pOVq9h/ g==;
X-IronPort-AV: E=Sophos;i="5.90,236,1643644800"; d="scan'208";a="197139574"
Received: from mail-bn7nam10lp2106.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.106])
 by ob1.hgst.iphmx.com with ESMTP; 05 Apr 2022 21:02:52 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tf3A2qsj3C7zjLCj8b1nh6MomNNSKiTsS0sJebrLmfzBYHhh6f+lM/DRs+FqXQwpCIXHK2KNdi33jExVIa1S/7UCS+CQLB5PMqQzNO7FoSR6Jed9DwG6k/xPADZeRF7izQO0/gENJNHQOdLUY39VDPBxtFGNJmXXmDx2fcw1WVfxJpLpW+MpA1gMpaG+zhouYQyyQHn7FavUoIvjC9+PkeQ9832yR/V2geOuVkcJZZCYbGF5jeAZbugSS0WvICG/fbT2TVGSBUMvUNQ4jnDj6pAGa/ChXThoooHIyPM/5Sau7rxSAj9ZHd4wSxmlGyXotnMhU0qzedcAaoToX8hwYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NlfHGxJ0tToA7elxpIXAc0OxKuiqvcbpVtvi7+YXZeo=;
 b=Sy3atBa6jhLLO3jiE2XaquslQONGsSpC6+N+/u9A69yX/1t7EX6TF2vEGFB2dAO/O5ZbNhbTQ0Z3Nfc5coK0gzfiCMTlhvpvvOCUyzHuO6Q1JgMSvrrqEytH4o+ESLqyiNbPLHQ5l9IBIrq3Je948RazIKfmgAstIygpKt/lspHQFzfZ6pU1epndag9os73nms4LhQuVl6r+BQKsehDh0i2TsvKosA0MPDJH7MF3CO81sdEt4f6v29jYQL5aWqBLOKs1uLOhJTbRHRVpUmwOj3k6WlmNZTDBubPWMe9b/ThF9wA8ng5bCtpfh4WJorCs51nCaAiACOSdaipCOstdsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NlfHGxJ0tToA7elxpIXAc0OxKuiqvcbpVtvi7+YXZeo=;
 b=LjdCjWHMA0+NSH/fMnilxIHTSGITrL8LaCurMTyxX3F7Ss/m6UIUtPkt/puB3h/Ao3B7c+6Fm5HXTqdEoyA1066xT0xhMFDVhdU8DR7FHzFM2ZBmcRdcueKVoDNKfTBxAMJCbJ3w7qRUZ1OHmX4jISA0e4hiexbF5ya53xr4RP8=
Received: from PH0PR04MB7158.namprd04.prod.outlook.com (2603:10b6:510:8::18)
 by MWHPR04MB0846.namprd04.prod.outlook.com (2603:10b6:300:f9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Tue, 5 Apr
 2022 13:02:52 +0000
Received: from PH0PR04MB7158.namprd04.prod.outlook.com
 ([fe80::995b:363e:8d1c:49af]) by PH0PR04MB7158.namprd04.prod.outlook.com
 ([fe80::995b:363e:8d1c:49af%8]) with mapi id 15.20.5123.031; Tue, 5 Apr 2022
 13:02:52 +0000
From: Niklas Cassel <Niklas.Cassel@wdc.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Rob Herring <robh+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>,
 Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2] riscv: dts: canaan: Fix SPI3 bus width
Thread-Topic: [PATCH v2] riscv: dts: canaan: Fix SPI3 bus width
Thread-Index: AQHYSOhuFV3VWYd5AEiJlbzlm2Re1KzhSRiA
Date: Tue, 5 Apr 2022 13:02:52 +0000
Message-ID: <Ykw9+03YFl2Yd982@x1-carbon>
References: <20220308132806.96095-1-Niklas.Cassel@wdc.com>
 <CAMuHMdW4BKSxucwgZS0TUAKd26kmrWbpsMbDmDYSs9yo5tWH=A@mail.gmail.com>
In-Reply-To: <CAMuHMdW4BKSxucwgZS0TUAKd26kmrWbpsMbDmDYSs9yo5tWH=A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: be9476c7-a2d0-459b-b266-08da170497e6
x-ms-traffictypediagnostic: MWHPR04MB0846:EE_
x-microsoft-antispam-prvs: <MWHPR04MB0846C99815F54F44AA560F8EF2E49@MWHPR04MB0846.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tfljvLdIMf3Isjcn8YG3uXGN4gu+ks7rFSm+Xj29Ug3+HMR3juzRvS8rOaIrSMpOXDew3fXqLo9NVCBSxVE74idXIr6sqrKmfACB2hNhW0Y+CA3n9Fynm7uh4PdBpnRu9SSC+VLuoe0F/S15ZJBNjC2xmsntXytDz4mYaKiZ2xT/nndifhfeZyXd2davIDGu0aCWqfSnAtaK6qlerUXnm7nmmaXF+eyb079hTP/1EyTwaCb27Ch2nY8gRxmsaAKHbDvy4LjBS0ppOg8/tSIkJ2wlL+eTWGY0DIdecxmS2gvpbSUG3bBcjhHryBbSJ+7UqBNF2CxtL7FjryGLs2cITyQk6Zhc1EthQR+izU0EdKa/9cSfgveRWh65XuBQ8wYxrA14uRVrQOGUpbE3TvCMB02t6FIPg1Itjb71wmIFuKKKrVyKyq0KlBdlUyatQ7dtAVDWaop7aJvA+x6EX3keaoQUuU+1lrvC8omSjqpGlQIqcwLXfUsPNdG2eeY4+VRkgqfPLeRRpOi7CnngtwPEIvNLExs3NH6UyeVzmaH0jqAcCi8iwsqE6CfmN7xcs3df4bpoUD0RBcmvgEIKbu5mM1e8jTOskvIvFTJR8cqjfOhm58wh4329cKrTjQY9A+SjSglSqjM6DLtlm+PnroWTMU7NaLIi1ufcCH9gQt3GtpCe6Hv+Z4M9RPvGJO9TVZjVktifpP/v9hUzOF2OO+2tG5UBndepDYela+4V5nhvZLh7DXugMtIqxvQV0uEiJZmqK/sPqlCrZPmuFwJzEEMtJWv9JDtFzWGzqghXTPI/0NGRLJVYeMIDGx1Ch9L2m556XZKFejRPVfbyLmBCxzZPWw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR04MB7158.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(4636009)(366004)(26005)(91956017)(186003)(5660300002)(38100700002)(8936002)(38070700005)(82960400001)(76116006)(2906002)(66556008)(6486002)(6506007)(6512007)(8676002)(66946007)(966005)(508600001)(33716001)(66476007)(4326008)(9686003)(316002)(86362001)(54906003)(53546011)(83380400001)(71200400001)(122000001)(6916009)(64756008)(66446008)(67856001)(15398625002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?uGiCUSzp5iLiAzYomO+NYajgxAYqmqe8lRtwHlnAJl1qhLmyRt8UMjc1jPRP?=
 =?us-ascii?Q?ehPwxlWu5CAXnoD4w4pcnk6K5aKQMFbWwFPExA+BjrpJaY+TltJZ0TO1SJXY?=
 =?us-ascii?Q?AYDqAw/f1sqDLeXQrG708/KC4QK/LAfWt/hNvVmX+yqHHprDWbPEEGAG6eyq?=
 =?us-ascii?Q?z3CxkbJvl109emo6MlfdwISK62VB9yVgUom8p1SdIouZbbagQFm6pwH0Roqj?=
 =?us-ascii?Q?ggD0o84GgDC0zm7u7VC7L1XnPYjj0QwUd0izJzuXwquu+omZx0lNXHrbT8Je?=
 =?us-ascii?Q?zAqBYeFXIJ5HrgpiaXhhFmnSRLkigE6JWIen7hRPdWfgT7nMYYRH6hYa10Gm?=
 =?us-ascii?Q?IOf6kV/EzvPMhm5Udn8iS2gGI8hDk8HHmcSqiLDp7pReoS0T0un1Ql+StcsN?=
 =?us-ascii?Q?dQLrq/zzGvmEFIqBeIA0NR4yYPQekMgVVI+1A/ghVRxlF8YfRxrlyGXGSR4W?=
 =?us-ascii?Q?sLkQQKgfgOPmHxoCJ2/zIW6bKtwejYP3aA68XbAzHpFr5zB4TLztK7Wvx9Zv?=
 =?us-ascii?Q?15ByrUkIYdNDsQx3DNvTLH/W4KiMKFRSU9XlUuu67wmE6ESeTYXmQlEGr+Bq?=
 =?us-ascii?Q?UTa1kTRnVeBxXjwER1869QCpQxVXd/2o0dJOwdCw5ORRV4lyqLN2F2jxAZG/?=
 =?us-ascii?Q?WNnZppbN6rWyU2roWfK2WItXgK/2lCYLtNtTCJCB5Bjw8sLNSaLtFlNGDA9W?=
 =?us-ascii?Q?cr3+hsTEqA3M1oW89HcCN/vaSEAWRupPbFfTqa9c/0Gx4vk4mR55VSwSWseo?=
 =?us-ascii?Q?9pFX7sNz693dTjJFpWOchN+TEhOIVdrTQnS17s0+W8QjIVwhv0lytHq7V1sp?=
 =?us-ascii?Q?VYlp0JdahER4GQTFg3EbRd0soajXv0fpBZm6cuYI1vYkA25C3d97VBkoUpWx?=
 =?us-ascii?Q?sJDu7CsK3xJjGW8wUUhIvHBzwKGcO0t5F5BpyWM6RyB/zBG1l/FjB27OVFT6?=
 =?us-ascii?Q?4S5/pfyyMEgN0K9YjY+5D3+9rciPtUlSuiB+m/H0G00JYsS4pNLXLhClEv9+?=
 =?us-ascii?Q?Nxd2nxh6rrSCApY1WhLmYn03acBtXOckte7QDrkQnTrwn9br/loOgV8kogmJ?=
 =?us-ascii?Q?+bT4S91Zt05S4ps3X7WSWqriPiGjKmxtt84kzjPjSqtAmbQ6wMecea0Diu3l?=
 =?us-ascii?Q?vqnQPpPpPFP3aKSHecfvGCg6JOfIEkJXAfGh4GS0kjTT7vXBh68VRiHE8SJN?=
 =?us-ascii?Q?P6f3KOhGGpxaLmvO4Lc7GzsUWks5Iv4+G/4I/DBGzYswu0Bzil4WEo6e4Osd?=
 =?us-ascii?Q?9Wm3z0FpzknIgSn4KegjwJ4H8JoabF3fWOKnTti8r+er+RYfOtt3gRTHviJm?=
 =?us-ascii?Q?8PlZd1FsvP196Vzcs/IOZyRVKsYMqQnUOHwVx3KolKt/RxOwNtWep4zUJRmM?=
 =?us-ascii?Q?oxlWGxC9SjY+pxeR0NQh1D611UEExEq3JIVNKN/53jdS423Oe0G648IIspIs?=
 =?us-ascii?Q?yDPI3e6KrxaRcYOPrgAajuzYvFRl98bb4Wpdyp9XD2ET8Wb4lPWsP81c1dfa?=
 =?us-ascii?Q?CXwyNAEocg/RAsA/QffFsl/9AEvzOHjnIm6nYQrkTtfWCcn2PxsA4cIeYVuI?=
 =?us-ascii?Q?hQw629y12L91KGChZZHboUDnhglKg5U7eo7eyGbavNOmy51Ya3RMPYpFEW/F?=
 =?us-ascii?Q?hgl5PneTZyMS3Pyx7MbqPoLdy2qtRjEfJEQU5Y8S4Eu2z87Zzdjyp8YE5Cd6?=
 =?us-ascii?Q?t73o0mU/MAmFr++bnOxDLRByG0kNNu3PYEIbXKtH+aaPvzmNMFAnKzvCfc1r?=
 =?us-ascii?Q?p0MgtmOjkZkzMeQFNZQHXqVX3loFDRc=3D?=
Content-ID: <950D3433BB814C489B841088860B0797@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR04MB7158.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be9476c7-a2d0-459b-b266-08da170497e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Apr 2022 13:02:52.0570 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g+FVMyLAf7Kej3TdfxFiYHyCYrgSpWaavFUAJlWqcYtzub2/ANgg579V0lmiVzB242w4YhvMETkH3bUYar61kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0846
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220405_060300_575313_991F08E1 
X-CRM114-Status: GOOD (  28.46  )
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

On Tue, Apr 05, 2022 at 02:26:53PM +0200, Geert Uytterhoeven wrote:
> Hi Niklas,
> 
> On Tue, Mar 8, 2022 at 2:30 PM Niklas Cassel <Niklas.Cassel@wdc.com> wrote:
> > From: Niklas Cassel <niklas.cassel@wdc.com>
> > According to the K210 Standalone SDK Programming guide:
> > https://canaan-creative.com/wp-content/uploads/2020/03/kendryte_standalone_programming_guide_20190311144158_en.pdf
> >
> > Section 15.4.3.3:
> > SPI0 and SPI1 supports: standard, dual, quad and octal transfers.
> > SPI3 supports: standard, dual and quad transfers (octal is not supported).
> >
> > In order to support quad transfers (Quad SPI), SPI3 must have four IO wires
> > connected to the SPI flash.
> >
> > Update the device tree to specify the correct bus width.
> >
> > Tested on maix bit, maix dock and maixduino, which all have the same
> > SPI flash (gd25lq128d) connected to SPI3. maix go is untested, but it
> > would not make sense for this k210 board to be designed differently.
> >
> > Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
> > ---
> > Changes since v1:
> > -Add the new properties directly after spi-max-frequency for all DT board
> >  files.
> 
> Thanks for your patch, which is now commit 6846d656106add3a ("riscv:
> dts: canaan: Fix SPI3 bus width") in v5.18-rc1.
> 
> > --- a/arch/riscv/boot/dts/canaan/sipeed_maix_bit.dts
> > +++ b/arch/riscv/boot/dts/canaan/sipeed_maix_bit.dts
> > @@ -203,6 +203,8 @@ flash@0 {
> >                 compatible = "jedec,spi-nor";
> >                 reg = <0>;
> >                 spi-max-frequency = <50000000>;
> > +               spi-tx-bus-width = <4>;
> > +               spi-rx-bus-width = <4>;
> >                 m25p,fast-read;
> >                 broken-flash-reset;
> >         };
> 
> On MAiX BiT, I get:
> 
>     +spi spi1.0: setup: ignoring unsupported mode bits a00
>      spi-nor spi1.0: gd25lq128d (16384 Kbytes)

Hello Geert,

The device tree is supposed to describe the hardware.

The Synopsys SPI controller and the Gigadevice SPI flash both support quad
transfers.

It would be incorrect to adapt the device tree based on current limitations
of the drivers/spi/spi-dw-core.c driver.

Likewise, we shouldn't need to update the device tree if the dwc driver
ever adds support for quad transfers.

However, I do agree that it is a bit weird that the kernel outputs a
warning for this case.

I understand that the warning is supposed to be there to warn that a
controller does not support a mode required by the driver, but if it
is the driver and not the controller that lacks support, is a warning
really warranted? I'm not so sure.

Adding Mark Brown to hopefully hear his opinion.


Kind regards,
Niklas

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
