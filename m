Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 901B5CC6B12
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Oct 2026 22:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+pPrOrv3Z5yQ181BUk3SysUEaFf1SQOmEIraFoE6UjU=; b=MgQ12sasx0PipVBUX/YPVOYqNM
	Xsg8pVasRctVGenGDVWkT2JDOw+YcyxRd5niGOwN/tFXETNLO42YFsUTMA56pnomGQT03sXbowlUj
	ReJd74QPP1D/ruBv64MhKc/WRYW+mhxUQH7wBu9AC2co2Zv1SF9HPdruldmIzMqMIEpMpzLwtM0ij
	v3FjDevj1RacFI9+2PVgABycJ/dncR+KmLVVQtsdKYkJQ5XT6V6zWSZ0tOZVj2v2Fy6FOCMioJgkt
	BFd0qEgqwfcHZ4Kvy1kKVwggVFFK9aRcsgjY1IsKRVuqf19uGZA6j9D1YkWCmNwg4eqqozdCdX/W1
	bOBZMnNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGl9i-0000000E9Ji-3xW4;
	Tue, 13 Oct 2026 22:39:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGl9h-0000000E9Jb-2akB
	for linux-riscv@lists.infradead.org;
	Tue, 13 Oct 2026 22:39:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BFFA0601DB;
	Tue, 13 Oct 2026 22:39:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C2F81F000FF;
	Tue, 13 Oct 2026 22:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791931172;
	bh=6TGi7nBnZz1eos9NfebL8co0kLsIUfiBo2SXeSOJfJA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aQAXPAlgBniVmy1nGVjgKoM17iR4YIxZvtuQzXHIRsEALS2++MLC9f3CaaFdrui9+
	 rLuhcGnMQmBt+IdYTbp1wjVhbGGjrAmclmlw4fkSXJQsyyoqq5l2MDrONZDVeKvdIO
	 XZmgWn4catHTKCP8ySDwUdjDp6pksnG6RuyayQDnyheoZzQodQcpqkstz3sdtRoG90
	 WOogyUXwDpht9dEFbTeIBUSeqtCLKTRFBS2ymXQMjirizOIw9WxMpGkTuFhltpGbF0
	 1Zmwo7qU7k7xYRYBv3u8/dpQlTUgNeQfWz1KOtv+m1lOZS5GKeBe8oU50lQkTBA1ve
	 yz7YoSjjqF7Cg==
Date: Tue, 13 Oct 2026 23:39:29 +0100
From: Conor Dooley <conor@kernel.org>
To: Avi Weiss <thnkslprpt@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cache: sifive_ccache: propagate IRQ count errors
Message-ID: <20261013-causation-cadet-4e2643a4f6e1@spud>
References: <20261013095756.1084568-1-thnkslprpt@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20261013095756.1084568-1-thnkslprpt@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============6669583663767571233=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6669583663767571233==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3Pi5zXAT+DdfpQWd"
Content-Disposition: inline

--3Pi5zXAT+DdfpQWd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 12:57:56PM +0300, Avi Weiss wrote:
> platform_irq_count() returns -EPROBE_DEFER when the
> interrupt provider is not ready, but
> sifive_ccache_probe() only checks for a zero count.
>=20
> -EPROBE_DEFER seems to be the only negative return
> code possible here (currently).
>=20
> A negative count skips the IRQ registration loop and
> allows the probe to return success without requesting
> a deferred retry.
>=20
> Return negative IRQ counts so the driver is reprobed
> when the interrupt provider becomes available.
>=20
> Fixes: c90847bcbfb6 ("cache: sifive_ccache: Partially convert to a platfo=
rm driver")
> Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
> ---
>  drivers/cache/sifive_ccache.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/cache/sifive_ccache.c b/drivers/cache/sifive_ccache.c
> index 2acb8bdf06d52..b4033110f34e5 100644
> --- a/drivers/cache/sifive_ccache.c
> +++ b/drivers/cache/sifive_ccache.c
> @@ -262,6 +262,9 @@ static int sifive_ccache_probe(struct platform_device=
 *pdev)
>  	quirks =3D (unsigned long)device_get_match_data(dev);
> =20
>  	intr_num =3D platform_irq_count(pdev);
> +	if (intr_num < 0)
> +		return dev_err_probe(dev, intr_num,
> +				     "Failed to count interrupts\n");
>  	if (!intr_num)
>  		return dev_err_probe(dev, -ENODEV, "No interrupts property\n");

I normally hate putting ternary operators in things, but I really don't
like how this looks, especially since the new dev_err_probe() will never
actually ever emit that warning given the behaviour of
platform_irq_count().

Can we do

if (intr_num <=3D 0)
	return dev_err_probe(dev, ret ?: -ENODEV, "No interrupts property\n");

instead?

Cheers,
Conor.

> =20
>=20
> base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
> --=20
> 2.43.0
>=20

--3Pi5zXAT+DdfpQWd
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCas6zIQAKCRB4tDGHoIJi
0leyAQD+PvVV7gZ53rns7Y7pJzVcDXMRJ40NmTvhLRQ95esGbgD/XzD91oyGhRVT
BUhbVVSJgW6yVAOgymzJ0VP9uDmbDgM=
=ewhJ
-----END PGP SIGNATURE-----

--3Pi5zXAT+DdfpQWd--


--===============6669583663767571233==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6669583663767571233==--

