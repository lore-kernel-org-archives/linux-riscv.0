Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64C66E95A8E
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 11:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g1s9ZdVSedk5CxC3JS42Sw4md9680aWP2zWGHOGLIHo=; b=g0Kq/SCp271YTT5+M5RQeUPABj
	saYKNKYUsShO7quhw2Cfy6KnJc7YdBgNBqdqxlsVyDru94bhRJ5sy0s17UXBJWh5wbQbLyYugEO/L
	Vni+EcteaZNmtnEi5Kzn+IMf1zjjtTpuk86nQB/7TxTjhS91hG647rmt4EsGWeMtaKpEPtpNsfOEv
	+WkMI0H1+co2c6Hmlffp4XhZibv5TASwTKLpycd2y6FCheN+UO26zxMB3/n8tJuI/UBB57zXkIgpd
	seDmAKpNhWjaeSA/ufAaA6jJL1t+FcseYM80oDEXUEk5rqxiSLCAj/HVO7d3CATpqQ8sA2xSaglHP
	w35296tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpoI4-00ARQN-0B;
	Mon, 09 Oct 2023 11:19:12 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpoI0-00ARP5-2w
	for linux-riscv@lists.infradead.org;
	Mon, 09 Oct 2023 11:19:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1696850348; x=1728386348;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=J9XfCfLh3uUBpLPinWOH535XxsKH9kUB5wldTFik5pY=;
  b=t8H4RC75zbWqAz65NHrOWiXniX2OENYzBR1nH+ofswZ6Z+CgLI6as3FB
   Mn7iX2BFvr/MLpO5dWe9aqzwcgL4YzNrqwN2lA39jb46lE7I37fKzFCT9
   wPh9S9jdXfNAELu5gUmf1m4/HcawipyVnMqOIWvalGhjR8o0O2mFbIVhd
   GB5/xfcFckBDfH4gYx1fHWBKJ9dGL8YwBAhmc0kMPXp5rgr6Sp+Yp9Nz+
   jeOTAEgR/gL2kXCoVMFPbKpPuDd9Ar/uqoXfXn8EVH7nh+VCcbUJ0L0l4
   U6VGZB7jUNmWY+9cVxNS7+veROQT63Q2rE0tYovlJXavPRBmpJcj2FiVI
   w==;
X-CSE-ConnectionGUID: NZ7vyGJUSvi3vJgcsAydsg==
X-CSE-MsgGUID: wK/7D4VzS0GphfD8pkrksQ==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="asc'?scan'208";a="9659116"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Oct 2023 04:16:55 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 9 Oct 2023 04:16:51 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex03.mchp-main.com (10.10.85.151)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 9 Oct 2023 04:16:48 -0700
Date: Mon, 9 Oct 2023 12:16:27 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Minda Chen <minda.chen@starfivetech.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>, Conor Dooley
	<conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof
 =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-pci@vger.kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	"Palmer Dabbelt" <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	"Philipp Zabel" <p.zabel@pengutronix.de>, Mason Huo
	<mason.huo@starfivetech.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Kevin Xie <kevin.xie@starfivetech.com>
Subject: Re: [PATCH v7 0/19] Refactoring Microchip PCIe driver and add
 StarFive PCIe
Message-ID: <20231009-matchless-confined-d0d0d3188f76@wendy>
References: <20230927100802.46620-1-minda.chen@starfivetech.com>
 <fd5b8d0f-67d0-4e0e-9a15-6f3ae53b6db2@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <fd5b8d0f-67d0-4e0e-9a15-6f3ae53b6db2@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_041908_953750_EB5AB9E2 
X-CRM114-Status: GOOD (  22.87  )
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
Content-Type: multipart/mixed; boundary="===============0459007868144423176=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0459007868144423176==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1VqoUkWDs6YiGRyl"
Content-Disposition: inline

--1VqoUkWDs6YiGRyl
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 09, 2023 at 06:58:42PM +0800, Minda Chen wrote:
>=20
>=20
> On 2023/9/27 18:07, Minda Chen wrote:
> > This patchset final purpose is add PCIe driver for StarFive JH7110 SoC.
> > JH7110 using PLDA XpressRICH PCIe IP. Microchip PolarFire Using the
> > same IP and have commit their codes, which are mixed with PLDA
> > controller codes and Microchip platform codes.
> >=20
> > For re-use the PLDA controller codes, I request refactoring microchip
> > codes, move PLDA common codes to PLDA files.
> > Desigware and Cadence is good example for refactoring codes.
> >=20
> > So first step is extract the PLDA common codes from microchip, and
> > refactoring the microchip codes.(patch1 - 16)
> > Then, add Starfive codes. (patch17 - 19)
> >=20
> > This patchset is base on v6.6-rc3
> >=20
> > patch1 is move PLDA XpressRICH PCIe host common properties dt-binding
> >        docs from microchip,pcie-host.yaml
> > patch2 is move PolarFire codes to PLDA directory.
> > patch3 is move PLDA IP register macros to plda-pcie.h
> > patch4 is rename data structure in microchip codes.
> > patch5 is rename two setup functions in microchip codes, prepare to move
> > to common file.
> > patch6 is change the arguments of plda_pcie_setup_iomems()
> > patch7 is move the two setup functions to common file pcie-plda-host.c
> > patch8 is Add PLDA event interrupt codes and IRQ domain ops.
> > patch9 is rename the IRQ related functions, prepare to move to
> > pcie-plda-host.
> > patch10 - 14 is modify the event codes, preparing for support starfive
> > and microchip two platforms.
> > patch15 is move IRQ related functions to pcie-plda-host.c
> > patch16 is set plda_event_handler to static.
> > patch17 is add StarFive JH7110 PCIe dt-binding doc.
> > patch18 is add StarFive JH7110 Soc PCIe codes.
> > patch19 is Starfive dts config
> >=20
> Hi Conor and Daire
> Have you ever test this patchset=EF=BC=9F I'm sure I am not  change logic=
 of the PolarFire PCIe driver,
> But I can not test it.
> Since this series patch is delegate to nobody and no response now. I don'=
t know when this patch set can be accepted.

I'll try to look at this series again this week. I've been AFK a bit
with holidays etc recently, and been a bit delayed in general. I was
mostly happy with it before, and had left reviewed-bys on most of the
series I think.

> I still hope the refactoring patches can be accepted first

The last patchset Daire sent has been applied:
https://lore.kernel.org/all/169149233963.79399.5232296870054239065.b4-ty@ke=
rnel.org/

> (I know you want to add the function of inbound and outbound address tran=
slation, Hope this series patch do not influence your upstream plan)

I'd expect this series to go in before the inbound/outbound translation
one, since this is a lot closer to ready & is being resent more often.

Cheers,
Conor.

--1VqoUkWDs6YiGRyl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZSPhCwAKCRB4tDGHoIJi
0maLAQDzkRvnyxGPUhY4gLfqG7RjqaP+WSm0vTPY+S4QtyzXMAD/QLl+XDX+f8iN
8iCOQE83MPGAVCqa5pRd+mCx1i/2Gw4=
=OAEx
-----END PGP SIGNATURE-----

--1VqoUkWDs6YiGRyl--


--===============0459007868144423176==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0459007868144423176==--

