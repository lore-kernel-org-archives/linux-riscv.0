Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BB61CD37AF
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Sep 2023 00:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gZm2LKzwsq1ib4A8Nvkq1HsjFbTua0w6lk8GPD9p8/I=; b=2/xAEQL4blhDbHOTGJPTovUvH1
	9yyBozTISD1cyNHS/J9YOK5SQxR5zholOZ+fgtIoNIP6+IUnT0W8gE67FuOOe9M4Lo/bOL423cDcw
	KcTQlE7c4XWZlhLSf89GtHXJaDoicQPOGQjEdmbSrD5lquJST/rHM1bo5jLG9i23UH8VTRvrAOa6W
	X9/R+5lwmgjYrAYBNKhCF7hUhCPPX/W0dPOJWOgl9Fgfw6M0oishg8gkTVe7nYc3icM0shu6IL1fL
	M+qKabsjnbnwxi2xLuYkDEcus+cCqN8+Ozrnz7FWXQ/c7bUxtqshpDVZZ3P9QTIXT63CLj1rpVcC6
	zR0dCtdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhIsd-00Ba2a-1u;
	Sat, 16 Sep 2023 00:09:47 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhIsb-00Ba26-0p
	for linux-riscv@lists.infradead.org;
	Sat, 16 Sep 2023 00:09:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A2394B80CA1;
	Sat, 16 Sep 2023 00:09:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A33CAC433C7;
	Sat, 16 Sep 2023 00:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694822982;
	bh=ZoBnjs9K4t4sU4nW2jM9PguihlFyIuTEMrrHlL6xBtY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hd4xkszN0ncBWhPDIpdiCbg7cwGlpAbnnO38MkwjYvJNh8njdZFfhVqIZ3MHWV9ps
	 aeLJIenGm5ALpHps7UHEE/IRLd0AUN8vH9FA6YPtW9RcA2t/6IstNGonupkyOJiDFh
	 Dud7rTH82mbaepl4hqsIivECBYQyxwDxgZoqgEe1I8vJw+SdYoH2SDOjfRIZWPPMB9
	 9RnNFGRB/sCkiWCfcP7C7W7X5IZIApqV10DnMCIy4pMNpDfwayiafeyQItGtu3/WmF
	 3G24RPecrOhcoevOAGYaFw+6NkVCLrvjKkjcixTlbK/0kwlpQR9pD67uMAOaF3/GkQ
	 iNHKIBHXwidag==
Date: Sat, 16 Sep 2023 01:09:36 +0100
From: Conor Dooley <conor@kernel.org>
To: Minda Chen <minda.chen@starfivetech.com>
Cc: Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-pci@vger.kernel.org,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mason Huo <mason.huo@starfivetech.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Kevin Xie <kevin.xie@starfivetech.com>
Subject: Re: [PATCH v6 02/19] PCI: microchip: Move pcie-microchip-host.c to
 plda directory
Message-ID: <20230916-outcome-obedient-fda7043bcca7@spud>
References: <20230915102243.59775-1-minda.chen@starfivetech.com>
 <20230915102243.59775-3-minda.chen@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230915102243.59775-3-minda.chen@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_170945_593039_E857BD5D 
X-CRM114-Status: GOOD (  16.15  )
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
Content-Type: multipart/mixed; boundary="===============7436994854353242686=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7436994854353242686==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+qLWHmCvTp7PqhnE"
Content-Disposition: inline


--+qLWHmCvTp7PqhnE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 15, 2023 at 06:22:26PM +0800, Minda Chen wrote:
> For Microchip Polarfire PCIe host is PLDA XpressRich IP,
> move to plda directory. Prepare for refactor the codes.
>=20
> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  MAINTAINERS                                        |  2 +-
>  drivers/pci/controller/Kconfig                     |  9 +--------
>  drivers/pci/controller/Makefile                    |  2 +-
>  drivers/pci/controller/plda/Kconfig                | 14 ++++++++++++++
>  drivers/pci/controller/plda/Makefile               |  2 ++
>  .../controller/{ =3D> plda}/pcie-microchip-host.c    |  2 +-
>  6 files changed, 20 insertions(+), 11 deletions(-)
>  create mode 100644 drivers/pci/controller/plda/Kconfig
>  create mode 100644 drivers/pci/controller/plda/Makefile
>  rename drivers/pci/controller/{ =3D> plda}/pcie-microchip-host.c (99%)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 90f13281d297..b1050804e6d2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16647,7 +16647,7 @@ M:	Daire McNamara <daire.mcnamara@microchip.com>
>  L:	linux-pci@vger.kernel.org
>  S:	Supported
>  F:	Documentation/devicetree/bindings/pci/microchip*
> -F:	drivers/pci/controller/*microchip*
> +F:	drivers/pci/controller/plda/*microchip*

The riscv patchwork automation is complaining that you have added
maintainers pattern errors with this patch. If you run
=2E/scripts/get_maintainer.pl --self-test=3Dpatterns
it'll tell you what the bad pattern is. Not sure why I never actually
dumped the output of that test into the failure report, so I can't
immediately tell you what is wrong.

--+qLWHmCvTp7PqhnE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQTyQAAKCRB4tDGHoIJi
0lw1AQDzd1Qn+mtJ1Bjy/O6gztN51A8g7jbDXInA6DY6wknZcgEAq7WU6P4FmYOm
0Q5J/MB4RAOAgpV7Ji9Qd9wkqGV22g0=
=cAFa
-----END PGP SIGNATURE-----

--+qLWHmCvTp7PqhnE--


--===============7436994854353242686==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7436994854353242686==--

