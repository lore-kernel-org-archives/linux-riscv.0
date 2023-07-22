Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 962B5EB64DA
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Jul 2023 10:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=39wwwPgYvkQH3gdGU+E9aHhXK3yCMf5M89IBFQQu17k=; b=njQ7/Qqo0LUL6U7nDoDhdfSueB
	CR47yZOrTS9up7+Jrd7242J/bh5lOCCFaxkKm//mgARXB398A06MPqVo/E1DoE53y1tvbLIaH9cji
	YwjRPjnj+M/+l1Z7jLm5VViyidGzens/2t6PPNKE+OCpdmw5ACIBgVTmHs8lTAif4EsN/fCZmXJc0
	sFZC43k4z+9BoBswTs8PrVkcpB0GYRWSMgjpx1cVwNS15rjs9y+KoIxFGSvxdNmdA/7Xam3S9E6np
	yDvY68eeGUIqk8O3jeLKk4mdcG8oHHzAeka+mwIewJQ+iZMlEeaC/1mzg5quD2atK7dcpVKqQn5SB
	pMXz9ubw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNABN-00GWbU-0L;
	Sat, 22 Jul 2023 10:49:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNABJ-00GWb3-31
	for linux-riscv@lists.infradead.org;
	Sat, 22 Jul 2023 10:49:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3C8C360304;
	Sat, 22 Jul 2023 10:49:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F339FC433C7;
	Sat, 22 Jul 2023 10:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690022988;
	bh=Vn0hFUAKR71EWx+HcOyfc0KRVMHLl8YtQ4kSJaS1FUY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ahp1JCZ47jAUweiIA9wYmiHkMn8FfrX1xlYYxH96ctfSB/oeJzLOBnu5By9v396JY
	 sqsFfou/wbw99Wgl9mZg5JayxfvnneHdIEqmNYQdNiYZpmB0h2tvp0cfraEcv66NLC
	 myMjaie4TBgR7hk2MfccJ1v2nDqYxzNOq3ilWmQHNxBAosnNIZFWYYQi+DQoVGnmGD
	 dQDKpgrRBLsWHmGZWkUCfHpZ4BP0KLE4E5BAKzP/iqrEP9tKAP254+87uj0DMz3Exh
	 Wlu/oM8G/HuzZ6HNYbRugvHDObRJ10kzsoH7VpSQ+mo6erajT6LRquxceqy7hCyT30
	 jvF24pZCqW3tw==
Date: Sat, 22 Jul 2023 11:49:45 +0100
From: Conor Dooley <conor@kernel.org>
To: Tsukasa OI <research_trasio@irq.a4lg.com>
Cc: linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/2] RISC-V: make ISA string workaround case-insensitive
Message-ID: <20230722-alongside-woven-ed0522ded939@spud>
References: <cover.1690006695.git.research_trasio@irq.a4lg.com>
 <74ef735a676c3f21cbd8c2ee19d4a577a920f23e.1690006695.git.research_trasio@irq.a4lg.com>
MIME-Version: 1.0
In-Reply-To: <74ef735a676c3f21cbd8c2ee19d4a577a920f23e.1690006695.git.research_trasio@irq.a4lg.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230722_034950_086452_2A0BDB56 
X-CRM114-Status: GOOD (  22.67  )
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
Content-Type: multipart/mixed; boundary="===============7364121181049930683=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7364121181049930683==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4LnIIMpdBngdoOrP"
Content-Disposition: inline


--4LnIIMpdBngdoOrP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 22, 2023 at 06:22:37AM +0000, Tsukasa OI wrote:
> From: Tsukasa OI <research_trasio@irq.a4lg.com>
>=20
> This is a follow-up for commit 255b34d799dd ("riscv: allow case-insensiti=
ve
> ISA string parsing").
>=20
> Although the QEMU workaround in the ISA string parser works well with
> lowercase-only handling ('s' followed by 'u' and not preceded by '_'),
> case-sensitive handling in the case-insensitive parser can be confusing.

> This commit makes the QEMU workaround case-insensitive and gives more
> robustness (against manually crafted Device Tree blobs) and less confusion
> to kernel developers.

If people are manually crafting their DT, they should check it for
compliance with dt-validate (or dtbs_check). The case insensitivity only
makes sense for ACPI, but by the time ACPI was supported, you'd already
removed the "su" stuff from QEMU.

Thanks,
Conor.

>=20
> Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
> ---
>  arch/riscv/kernel/cpufeature.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeatur=
e.c
> index a8f66c015229..63277cdc1ea5 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -168,19 +168,19 @@ void __init riscv_fill_hwcap(void)
> =20
>  			switch (*ext) {
>  			case 's':
> +			case 'S':
>  				/*
>  				 * Workaround for invalid single-letter 's' & 'u'(QEMU).
>  				 * No need to set the bit in riscv_isa as 's' & 'u' are
>  				 * not valid ISA extensions. It works until multi-letter
>  				 * extension starting with "Su" appears.
>  				 */
> -				if (ext[-1] !=3D '_' && ext[1] =3D=3D 'u') {
> +				if (ext[-1] !=3D '_' && tolower(ext[1]) =3D=3D 'u') {
>  					++isa;
>  					ext_err =3D true;
>  					break;
>  				}
>  				fallthrough;
> -			case 'S':
>  			case 'x':
>  			case 'X':
>  			case 'z':
> --=20
> 2.40.0
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--4LnIIMpdBngdoOrP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZLu0SQAKCRB4tDGHoIJi
0lDhAP9cjGz4FFMNZy7wOVCE8dn49XdJDbRIW+dh06FaukB8JwEAzcSusmI/+fjc
ZJ4ZQohPcEUnGsQV8HgzgcGKzzQqdA4=
=FJnZ
-----END PGP SIGNATURE-----

--4LnIIMpdBngdoOrP--


--===============7364121181049930683==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7364121181049930683==--

