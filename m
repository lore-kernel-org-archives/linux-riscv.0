Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AE65C5479D
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jan 2023 18:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PoApr8JaD66V/lbBxev71tmwtzogs+IlJhGiUc/b7xU=; b=E5PpIOJKYwigElTOBfJAnvEh7t
	HpqrYC4/y58nDnFERQuTLtHS9mm9sFg5Ir1tGZHerph06Zj2sN7qfNhNoLQKIH6ncOT58s3I7ZiPo
	IC+AL03/kdVlOtnTglxBwBYvaJCzAlXt/g545Ujo8M2v0goKZNg5NopZhhp7smpw3TWYGlRQTc7pi
	BU5yQln/8ZvQqUYHY2BCLxB2abM7544iBeeWxqLqSOGcksyfqKYp4AZkEpsecP1fpFrbmHaMMQJoc
	y7HPbv1YDUGhoHUos+3jdSVkDNLJFKR4who3s8tcTVgACEchxW9A//FHT6Eg1g8x8SItw6kTrwO5L
	U7nuzTTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFfhu-00CaTD-Ft; Wed, 11 Jan 2023 18:20:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFfhs-00CaSJ-5W
	for linux-riscv@lists.infradead.org; Wed, 11 Jan 2023 18:20:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B7C1461CAD;
	Wed, 11 Jan 2023 18:20:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 681F6C433EF;
	Wed, 11 Jan 2023 18:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673461211;
	bh=Y6YMceRehLG1qPa4PtJGKgaNebi1JEkzGDnTEex8054=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hK8kUGE30A92eCeDkWBOnb6cSX69Kf5wzWhIhkW3Yr/jsaZVZrVHWMXyf1+3nLxUv
	 JWUZ4vogqxHIuZcDWzgB1l43iP8XfYHnv2KpXuNJYQDDpoTFellfqcwY3pZMVFMiWK
	 gGoGWVzko9H3a5TbE+1gHwLE3zw7z5mk89W35Le9UMP+0CYj8QqwKY9dL7aK6X2ps/
	 OipJt8uhpzPiKKLMoECvwWwRRQsVDi7oMYZHnXL7193XxaxFysc/fhJUx/iPAolz8R
	 /a6SrHT2fG+NXNETdaFOGfRAZMcsQY/JboBKRvVSff50RUHelC0X/38f2eAnj65ILA
	 Q7kRTA4p1hbgQ==
Date: Wed, 11 Jan 2023 18:20:05 +0000
From: Conor Dooley <conor@kernel.org>
To: daire.mcnamara@microchip.com
Cc: conor.dooley@microchip.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, lpieralisi@kernel.org,
	kw@linux.com, bhelgaas@google.com, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v3 03/11] PCI: microchip: enable building this driver as
 a module
Message-ID: <Y7791U349F7224sN@spud>
References: <20230111125323.1911373-1-daire.mcnamara@microchip.com>
 <20230111125323.1911373-4-daire.mcnamara@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20230111125323.1911373-4-daire.mcnamara@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_102012_309301_FCE0F08B 
X-CRM114-Status: GOOD (  21.66  )
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
Content-Type: multipart/mixed; boundary="===============2042637244297304377=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2042637244297304377==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8NGtDQC1ywbBiJk6"
Content-Disposition: inline


--8NGtDQC1ywbBiJk6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 11, 2023 at 12:53:15PM +0000, daire.mcnamara@microchip.com wrot=
e:
> From: Daire McNamara <daire.mcnamara@microchip.com>
>=20
> Enable building this driver as a module. The expected use case is the
> driver is built as a module, is installed when needed, and cannot be
> removed once installed.
>=20
> The remove() callback is not implemented as removing a driver with
> INTx and MSI interrupt handling is inherently unsafe.
>=20
> Link: https://lore.kernel.org/linux-pci/87y1wgbah8.wl-maz@kernel.org/
> Suggested-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>

Perhaps, if nothing else crops up, Uwe's comment about the commit
message can be addressed on application?

Either way,
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks!

> ---
>  drivers/pci/controller/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/pci/controller/Kconfig b/drivers/pci/controller/Kcon=
fig
> index 76806dc52d1b..fd005b3f8a24 100644
> --- a/drivers/pci/controller/Kconfig
> +++ b/drivers/pci/controller/Kconfig
> @@ -291,7 +291,7 @@ config PCI_LOONGSON
>  	  Loongson systems.
> =20
>  config PCIE_MICROCHIP_HOST
> -	bool "Microchip AXI PCIe host bridge support"
> +	tristate "Microchip AXI PCIe host bridge support"
>  	depends on PCI_MSI
>  	select PCI_MSI_IRQ_DOMAIN
>  	select GENERIC_MSI_IRQ_DOMAIN
> --=20
> 2.25.1
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--8NGtDQC1ywbBiJk6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY7791QAKCRB4tDGHoIJi
0m/nAPwMHmifmKrAzgKpdjIRcCv4E8BlmGiCuvAFmegDA/5WDAD/YyEuq1GCkply
zzfRq/a8eQqNqX91PC/83+EXxXKRPQo=
=rtFX
-----END PGP SIGNATURE-----

--8NGtDQC1ywbBiJk6--


--===============2042637244297304377==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2042637244297304377==--

