Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64814C53210
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Jan 2023 17:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W5AQvuptTFlO+jUKgZ33rxm2sGK1tzQHL6jQYzSz2CI=; b=4Uyx4JglLKlnROmuj0fzToSOry
	RK0rfbBqRI6eAX8xpWKClApu4/We77VRwS3/FUc2XUCUU4kLUcmAR6iKTGV8cSXMVXdmHSK4AGBM4
	o0EMyQz6fLEWLFsK0iet9yD3CRTjJ636Cbbelsrs4j/My8xx8Nz1NXDwTZliWcDSnEblOoLztsXkx
	sPKJ0o0/g5CUWuOG3sZ3YIs8k3Z0BaPdBBgB/BjjQaXlHy1S3N1HZOamutqeFqww2WS06xHj3g2uC
	Px3yGTQy3Qo2c/oOro/bd5F91oHjkp/B1Z6BQCOSIjuZogDpW4Y1VQG0C2g9T5FP1TIyDNsUg+Qxd
	6tEU57lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEZHN-00EVmT-Fc; Sun, 08 Jan 2023 17:16:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEZHA-00EVhr-9M; Sun, 08 Jan 2023 17:16:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5BC3C60C88;
	Sun,  8 Jan 2023 17:16:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B7F4C433EF;
	Sun,  8 Jan 2023 17:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673198162;
	bh=fzAgiRFGHR3+GZQIA6FSB7Y5pqtCmssmPkzfvI9PDik=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ugSoSfG8YK4MiPNvmgHKQd2u6R4hYWSQLpNXxOlfys/IgPDiESDl9ClGuf7f5HnwX
	 oKT6HIzSPf2QaYW7AWi6o2YyMSU+Tn+0cndHgC+c2ZUvp569FJkmm8ZJ4v1WVLnN/g
	 vJc1njobRAXmHxjvEd0uMJqGhBLEx4srmrk0neSSo45BUDzYBNj478/Ct66UhElPee
	 zDSpsuuwxgDujKFt51c8olpbMG2jhMuq0ziBhA9E0/wm45RZkYlb8XvEguUQlaOP/2
	 5ZympTpJVqbXSk26pGg0H9KR6fjluZ0CDyYJH6cQsY3bJYgDF+AO06iy4c2KdnS5mn
	 z4l7KJR12SL+w==
Date: Sun, 8 Jan 2023 17:15:56 +0000
From: Conor Dooley <conor@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH 1/4] dts: add riscv include prefix link
Message-ID: <Y7r6TLTm1r+IlrYj@spud>
References: <20230106010155.26868-1-andre.przywara@arm.com>
 <20230106010155.26868-2-andre.przywara@arm.com>
MIME-Version: 1.0
In-Reply-To: <20230106010155.26868-2-andre.przywara@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230108_091604_388971_2D8A66A0 
X-CRM114-Status: GOOD (  16.88  )
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
Cc: devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Samuel Holland <samuel@sholland.org>, Fabien Poussin <fabien.poussin@gmail.com>, linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Frank Rowand <frowand.list@gmail.com>, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, =?iso-8859-1?Q?Andr=E1s_Szemz=F6?= <szemzo.andras@gmail.com>
Content-Type: multipart/mixed; boundary="===============1705987708395605168=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1705987708395605168==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0sHedhGUJCjd0u9E"
Content-Disposition: inline


--0sHedhGUJCjd0u9E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 06, 2023 at 01:01:52AM +0000, Andre Przywara wrote:
> The Allwinner D1/D1s SoCs (with a RISC-V core) use an (almost?) identical
> die as their R528/T113-s siblings with ARM Cortex-A7 cores.
>=20
> To allow sharing the basic SoC .dtsi files across those two
> architectures as well, introduce a symlink to the RISC-V DT directory.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  scripts/dtc/include-prefixes/riscv | 1 +
>  1 file changed, 1 insertion(+)
>  create mode 120000 scripts/dtc/include-prefixes/riscv
>=20
> diff --git a/scripts/dtc/include-prefixes/riscv b/scripts/dtc/include-pre=
fixes/riscv
> new file mode 120000
> index 0000000000000..2025094189380
> --- /dev/null
> +++ b/scripts/dtc/include-prefixes/riscv
> @@ -0,0 +1 @@
> +../../../arch/riscv/boot/dts
> \ No newline at end of file
> --=20
> 2.35.5
>=20
>=20

--0sHedhGUJCjd0u9E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY7r6TAAKCRB4tDGHoIJi
0svYAQDfXmAfIvPLwZWb79WQkRX17ndbEOGiAWczgPvcsZVEYQD9Gh9E4PYzuC6e
4QRB0vH6i/fo3SyEvyVctlyGY+JOpwE=
=5fRf
-----END PGP SIGNATURE-----

--0sHedhGUJCjd0u9E--


--===============1705987708395605168==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1705987708395605168==--

