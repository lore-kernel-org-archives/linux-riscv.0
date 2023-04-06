Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EE17C76196
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Apr 2023 11:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FAWEqZjyoTRkIqieyhXcTs6GCLwCT77PG5p65h/vmyg=; b=f/pwE8KI6T+ZRjDvFYUPPAbTDi
	JGnSyhwmpmAmuuv59l48Nu2GWFOXV48jPvfj2P2kPymDaBivso/Ro45iA2mwjiU2YUZ/4KJkYXT56
	CUaWAA2x3ubKyjzjQe/HKlY5V/GULzX/m5pYf7UrLkj35PAlBY7Fk6vx4ym0ouR3+9aCqVJlbZpg9
	7Y8nGQhyAI5t+OLOHAJyxaR4jhLuQJZhgbopbhBezGsAEbL1MANGI7DSvlPq4uc0NO/MY3JxatTGy
	2KozPZgFXBiQqyP5hZL/Fq2cHSl+qpkJoW6TUXoPnp44LrKh6m9RSyJ4gI8KPZ4cF9IAD5W+cUGp/
	KTYci04Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkOCT-007E1T-0i;
	Thu, 06 Apr 2023 11:54:45 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkOCR-007E0i-01
	for linux-riscv@lists.infradead.org;
	Thu, 06 Apr 2023 11:54:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1680782083; x=1712318083;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VIF3RAwyUACMZc/6Udu1lMbe/9hsVoCd5YuEoegFWzg=;
  b=AldA8j/yrym659CPayoSiVK704i1iM2qimR+G6orRR7P5pJqzTq+yxPR
   i/PpwPrdvP+SlQgptUaet/VpxUP+mXz0gz2gMJCclG4HWE2q2o+zJH+1B
   IS0kOfHyXRkmlzVpuvlE7RClcMNzkoS7zLKZr78NIjSjIk0fbY6n11fO+
   mapG6z+cyoZrEhizk9ovmP+jRhyNiR5rtbfDWV7yVp4voCriDXpJPO6nQ
   ZYg+yLckArz9xdRZvdD+cZa6qdlStkWzPays3UlFJaXvcuBYZlywXUSzI
   X+XzhE/rxdawbiZBNonM9oC9TICx+TvNMJdC6RHbuq+0lKzg0NUDA8pyh
   w==;
X-IronPort-AV: E=Sophos;i="5.98,323,1673938800"; 
   d="asc'?scan'208";a="208441740"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 06 Apr 2023 04:54:42 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 6 Apr 2023 04:54:41 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 6 Apr 2023 04:54:38 -0700
Date: Thu, 6 Apr 2023 12:54:23 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Minda Chen <minda.chen@starfivetech.com>
CC: Emil Renner Berthing <emil.renner.berthing@canonical.com>, Conor Dooley
	<conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, Bjorn Helgaas
	<bhelgaas@google.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Lorenzo Pieralisi
	<lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?=
	<kw@linux.com>, <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-pci@vger.kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>, Mason Huo
	<mason.huo@starfivetech.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Kevin Xie <kevin.xie@starfivetech.com>, <daire.mcnamara@microchip.com>
Subject: Re: [PATCH v1 0/3] Add JH7110 PCIe driver support
Message-ID: <20230406-coming-stuffed-26f89610959c@wendy>
References: <20230406111142.74410-1-minda.chen@starfivetech.com>
 <20230406-quench-unharmed-2c11b2617e9f@wendy>
MIME-Version: 1.0
In-Reply-To: <20230406-quench-unharmed-2c11b2617e9f@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_045443_046389_C2BD73A2 
X-CRM114-Status: GOOD (  21.65  )
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
Content-Type: multipart/mixed; boundary="===============4131016059898403509=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4131016059898403509==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6DiB+R8lixX5OYkj"
Content-Disposition: inline

--6DiB+R8lixX5OYkj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Gah, I never actually CCed Daire. Apologies for the additional email.

On Thu, Apr 06, 2023 at 12:47:41PM +0100, Conor Dooley wrote:
> +CC Daire
>=20
> Hey Minda,
>=20
> On Thu, Apr 06, 2023 at 07:11:39PM +0800, Minda Chen wrote:
> > This patchset adds PCIe driver for the StarFive JH7110 SoC.
> > The patch has been tested on the VisionFive 2 board. The test
> > devices include M.2 NVMe SSD and Realtek 8169 Ethernet adapter.
>=20
> I was talking with Daire last week about some changes he's working on
> for the microchip driver, and we seemed to recall an off-list email
> sent to Daire & Bjorn about extracting the common PLDA bits from the
> pcie-microchip-host driver to be used with an (at that point)
> unreleased SoC. Perhaps Bjorn has this in his mailbox somewhere still,
> our corporate mail policy scrubs things from over a year ago & I could
> not find it.
>=20
> I realised that that may actually have been StarFive, and the driver on
> your GitHub [1] certainly felt very familiar to Daire (he said it was
> very similar to his earlier revisions of his driver).
>=20
> I've not looked at a diff between this and the version you ship on
> GitHub, but first a quick inspection it mostly just looks like you
> did s/plda/sifive/ on the file.
>=20
> I'm obviously not a PCI maintainer, but if there are common bits between
> the two drivers, extracting common bits seems like a good idea to me...
>=20
> https://github.com/starfive-tech/linux/blob/JH7110_VisionFive2_devel/driv=
ers/pci/controller/pcie-plda.c
> >=20
> > This patchset should be applied after the patchset [1], [2], [3] and[4]:
> > [1] https://patchwork.kernel.org/project/linux-riscv/cover/202303141244=
04.117592-1-xingyu.wu@starfivetech.com/
> > [2] https://lore.kernel.org/all/20230315055813.94740-1-william.qiu@star=
fivetech.com/
> > [3] https://patchwork.kernel.org/project/linux-phy/cover/20230315100421=
=2E133428-1-changhuang.liang@starfivetech.com/
> > [4] https://patchwork.kernel.org/project/linux-usb/cover/20230406015216=
=2E27034-1-minda.chen@starfivetech.com/
>=20
> How many of the dependencies here are compiletime for the driver & how
> many of them are just for the dts patch?
>=20
> Cheers,
> Conor.



--6DiB+R8lixX5OYkj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZC6y7wAKCRB4tDGHoIJi
0gN3AQCtoXaVDJRLbEBtu9kNuP3j5MOEWWrcn+EJ7QXQ61DrzgEAmV93dIZ7fkyt
SbO/ObfnUTym32MCPLClZQbRxcez2Qc=
=l66h
-----END PGP SIGNATURE-----

--6DiB+R8lixX5OYkj--


--===============4131016059898403509==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4131016059898403509==--

