Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D87EAEB64DA
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Jul 2023 10:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X/o72xFiEoOfKPfL5JglPPMM6mrrxEWNGIS54pTWCH8=; b=dNbWTegFMSorQc28/i3nADyhUL
	MZfS/KvMolaxeIxnd21Bj82oiXLyqoQXH1xnOG7s3mGvU2vxuQzGzW0jmRAWn8eOVIxOxidKJhASM
	EoGyPF/AqTdCXh5jZlFTk4AbgP7xHha4mLV1Ukj9ehwMxMTUesaV68InUPM7EYSBp9oeRzXgpNijZ
	1H198834I+SGk8ig36ldsGrSFjsN4xRk9EdrvvjS4dLCtsvgkI9yBpoQgLu5TLy/GWDUpAdDo6/sc
	esM+FagGU2qokkUSVTuQ+LJMcFkHeD2AgIngTsnNrJug+cvhJ/+FQIXQnkjXiRIs5lhCWK80Oy9in
	PAw5uTSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNAEV-00GX0c-1E;
	Sat, 22 Jul 2023 10:53:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNAER-00GWzw-2x
	for linux-riscv@lists.infradead.org;
	Sat, 22 Jul 2023 10:53:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 33CC7608C0;
	Sat, 22 Jul 2023 10:53:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECC49C433C8;
	Sat, 22 Jul 2023 10:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690023182;
	bh=tkYFbKGmmKvMccaE8BPfZ32OGo6RlaLNtYV8d2XrWd4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hj91ZX7+aK6BEFn4tj8pYIfHORSvv4ppMokwTZtVujEyevF7SlCvFy46uPDIDNYJj
	 T/asrSTHkXN6CyT9qFB7rE5nJDGTwSq7JvBK1UTzeqjbHi7hZ1CBP7CLf7WBsqXFyR
	 t7S0+2MO7yyWv9JQhmLur+ncN8O38VDCAI0xRe5p/XD9AeWPZkhO953oSTdPG9hvNV
	 53u2vYY8DyS77SCNKzMl7xKEA9LbWS+dGo4IoLAlebreL5NvrXdwIkaYVf7M5yso3y
	 Ajyd3ZhHR0XF/XIf4di6IXKi2p9orC0+NpYahh3SamjCWB5pxyRKQwO3QVEtnw6Cfh
	 zigGfe/7uTFhQ==
Date: Sat, 22 Jul 2023 11:52:59 +0100
From: Conor Dooley <conor@kernel.org>
To: Tsukasa OI <research_trasio@irq.a4lg.com>
Cc: linux-riscv@lists.infradead.org
Subject: Re: [PATCH 2/2] RISC-V: fix the comment for ISA string workaround
Message-ID: <20230722-smog-establish-ebb3eaa5e9e9@spud>
References: <cover.1690006695.git.research_trasio@irq.a4lg.com>
 <a7d3db75ba6f3bdd6185ff1574c9a71a14a95126.1690006695.git.research_trasio@irq.a4lg.com>
MIME-Version: 1.0
In-Reply-To: <a7d3db75ba6f3bdd6185ff1574c9a71a14a95126.1690006695.git.research_trasio@irq.a4lg.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230722_035304_039154_1CF2CFEC 
X-CRM114-Status: GOOD (  27.64  )
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
Content-Type: multipart/mixed; boundary="===============7064701693619146988=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7064701693619146988==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FUgJyT6Ajy2TCJ4W"
Content-Disposition: inline


--FUgJyT6Ajy2TCJ4W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 22, 2023 at 06:22:38AM +0000, Tsukasa OI wrote:
> From: Tsukasa OI <research_trasio@irq.a4lg.com>
>=20
> Extensions prefixed with "Su" won't corrupt the workaround in many
> cases.  The only exception is when the first multi-letter extension in the
> ISA string begins with "Su" and is not prefixed with an underscore.
>=20
> For instance, following ISA string can confuse this QEMU workaround.
>=20
> *   "rv64imacsuclic" (RV64I + M + A + C + "Suclic")
>=20
> However, this case is very unlikely because extensions prefixed by either
> "Z", "Sm" or "Ss" will most likely precede first.
>=20
> For instance, the "Suclic" extension (draft as of now) will be placed aft=
er
> related "Smclic" and "Ssclic" extensions.  It's also highly likely that
> other unprivileged extensions like "Zba" will precede.
>=20
> It's also possible to suppress the issue in the QEMU workaround with an
> underscore.  Following ISA string won't confuse the QEMU workaround.
>=20
> *   "rv64imac_suclic" (RV64I + M + A + C + delimited "Suclic")
>=20
> This fix is to tell kernel developers the nature of this workaround
> precisely.  There are some "Su*" extensions to be ratified but don't worry
> about this workaround too much.
>=20

> This commit comes with another minor editorial fix.

Which is what?

The new wording is fine by me though..
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
> ---
>  arch/riscv/kernel/cpufeature.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>=20
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeatur=
e.c
> index 63277cdc1ea5..91f1ef3e762c 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -170,10 +170,11 @@ void __init riscv_fill_hwcap(void)
>  			case 's':
>  			case 'S':
>  				/*
> -				 * Workaround for invalid single-letter 's' & 'u'(QEMU).
> -				 * No need to set the bit in riscv_isa as 's' & 'u' are
> -				 * not valid ISA extensions. It works until multi-letter
> -				 * extension starting with "Su" appears.
> +				 * Workaround for invalid single-letters 's' & 'u' (QEMU).
> +				 * No need to set the bits in riscv_isa as 's' and 'u' are
> +				 * not valid ISA extensions. It works unless the first multi-letter
> +				 * extension in the ISA string begins with "Su" and not prefixed
> +				 * with an underscore.
>  				 */
>  				if (ext[-1] !=3D '_' && tolower(ext[1]) =3D=3D 'u') {
>  					++isa;
> --=20
> 2.40.0
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--FUgJyT6Ajy2TCJ4W
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZLu1CwAKCRB4tDGHoIJi
0kqeAQC3iQLHbFGS1M9try32uurNaaz+i6GCYmMeToAMZzNFRgEAiutKKqrASctR
4KTUpHN8UgIdZcwA1KCIFX/BKg/oRQA=
=KDse
-----END PGP SIGNATURE-----

--FUgJyT6Ajy2TCJ4W--


--===============7064701693619146988==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7064701693619146988==--

