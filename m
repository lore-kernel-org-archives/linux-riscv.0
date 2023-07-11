Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77F67EB64DC
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jul 2023 23:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uaSa26xF69gcF5ZaZ69LIFDdhwiJQGA46d47fRAEfSM=; b=V6IRoe8Ubsfc3umLPU5P4Pb75E
	WlYENAeJYekn25yGjH7zED5gJMYRxhlzFlfEvf3IAzApTW4TSv5QmaL3WDSLHJnxJeCWKT6JjYAgE
	/yF/fhZSkueHzmpTs36/uNQHI1gJcVMmc/KwPbZyfNKvtT74C+W7Pc1OZBjodftn0ynMw9u15K13s
	S14byfokqsL06BbwOYKDPm8ybrePqX0hs+GU5dR1UxppFOy2123TU06+ayXN1pzR/mMr0GCW8j3Iw
	99imbSD36W2MDsBE2NzPHUQ/qvyhcFr707CYodnPO7BVEmQL+UiV3qzCdwjZGhlPbNWNFCGktqEWh
	C7QPBT7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJMPU-00G2US-1y;
	Tue, 11 Jul 2023 23:04:44 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJMPQ-00G2Tx-2Y
	for linux-riscv@lists.infradead.org;
	Tue, 11 Jul 2023 23:04:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1A6E161601;
	Tue, 11 Jul 2023 23:04:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58044C433C8;
	Tue, 11 Jul 2023 23:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689116679;
	bh=Bq1jBfSshXUwFbu4eBoeMbW1eyOQuM4uIig67i7VuHg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nYk1tVMvtwd+0LVAkuD1RU6ymjYO96aMy8nCy4pA+lXNYJw7wDC+ViKwgoA8BPn33
	 3cyZzQoRE/Hi/exTBv94sZe5ZQQtT2eKou+nSLinQ0D55KrdNsEwNtpRLO3GU2yKLq
	 8DhFTiA4YkyZb25rdyF5YGra3JwHPN8COd68Gv8x0M/AiqlrF93yO0FCMTm/XSptSJ
	 nZqujRQ0jScBIoUlKW/Fam3Pb70ImuLdwgA04faBGuKYfbyYofrwisOmr0iuUzho3u
	 Ih0/pPBQs0TFqMuv6AhF1NXsuWwVxf0kc12n6PV8a5AE2h4ARetRSq0kDziGJ2IdoL
	 /VQV/g/NSVaiA==
Date: Wed, 12 Jul 2023 00:04:36 +0100
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [PATCH] RISC-V: Don't trust V from the riscv,isa DT property
Message-ID: <20230711-company-bleak-b425424560f2@spud>
References: <20230711223316.7961-1-palmer@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20230711223316.7961-1-palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_160440_936988_DA189B98 
X-CRM114-Status: GOOD (  39.10  )
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
Cc: linux-riscv@lists.infradead.org, Charlie Jenkins <charlie@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>
Content-Type: multipart/mixed; boundary="===============2524400425522099591=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2524400425522099591==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="l1VOpMIeXoyNoCJL"
Content-Disposition: inline


--l1VOpMIeXoyNoCJL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Palmer,

On Tue, Jul 11, 2023 at 03:33:17PM -0700, Palmer Dabbelt wrote:
> The last merge window contained both V support and the deprecation of
> the riscv,isa DT property, with the V implementation reading riscv,isa
> to determine the presence of the V extension.  At the time that was the
> only way to do it, but there's a lot of ambiguity around V in ISA
> strings.
>=20
> Rather than trying to sort that out, let's just not introduce the
> ambiguity in the first place and retroactively make the deprecation
> apply to V.  This all happened in the same merge window anyway, so this
> way we don't end up introducing a new ambiguous interface we need to
> maintain compatibility with forever (despite it having been deprecated
> in the same release).
>=20
> ACPI still trusts ISA strings, so we'll leave that alone.
>=20
> Fixes: dc6667a4e7e3 ("riscv: Extending cpufeature.c to detect V-extension=
")
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
> This came up as part of some discussions about the T-Head vector
> support.  I haven't actually tested this, but Conor and I were talking
> about options and it was easier to just implement it than describe it.
> It's kind of clunky to only parse that one property, but we're already
> in a grey area WRT having the DT bindings that we don't parse so maybe
> that's not so bad?
>=20
> The other option would be to turn off V when we detect we're on a T-Head
> system as part of the errata handling.  That's similar to what we do for
> misaligned accesses, but that's a hack that we're getting rid of.  It'd
> be less of a hack for V, but given that we've found T-Head systems
> aliasing the arch/impl IDs already we might be digging ourselves a
> bigger hole here.
> ---
>  arch/riscv/kernel/cpufeature.c | 25 ++++++++++++++++++++++++-
>  1 file changed, 24 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeatur=
e.c
> index bdcf460ea53d..8e970f55285e 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -116,7 +116,19 @@ void __init riscv_fill_hwcap(void)
>  	isa2hwcap['f' - 'a'] =3D COMPAT_HWCAP_ISA_F;
>  	isa2hwcap['d' - 'a'] =3D COMPAT_HWCAP_ISA_D;
>  	isa2hwcap['c' - 'a'] =3D COMPAT_HWCAP_ISA_C;
> -	isa2hwcap['v' - 'a'] =3D COMPAT_HWCAP_ISA_V;
> +
> +	/*
> +	 * "V" in ISA strings is a ambiguous in practice: it should
> +	 * mean just the standard V-1.0 but vendors aren't well
> +	 * behaved.  So only allow V in ISA strings that come from ACPI, as
> +	 * we've yet to build up enough histroy in ACPI land to stop trusting
> +	 * ISA strings.
> +	 *
> +	 * DT-based systems must provide the explicit V property, which is well
> +	 * defined.  That is parsed below.
> +	 */
> +	if (!acpi_disabled)
> +		isa2hwcap['v' - 'a'] =3D COMPAT_HWCAP_ISA_V;

I'm insufficiently awake at this point to review this properly & will
reply again tomorrow, but I don't think this is sufficient - won't you
still end up setting the V bit in isainfo::isa?
	if (!ext_long) {
		int nr =3D tolower(*ext) - 'a';

		if (riscv_isa_extension_check(nr)) {
			this_hwcap |=3D isa2hwcap[nr];
			set_bit(nr, isainfo->isa);
		}
	}
cpufeature.c @ L294

> =20
>  	elf_hwcap =3D 0;
> =20
> @@ -131,6 +143,8 @@ void __init riscv_fill_hwcap(void)
>  	for_each_possible_cpu(cpu) {
>  		struct riscv_isainfo *isainfo =3D &hart_isa[cpu];
>  		unsigned long this_hwcap =3D 0;
> +		struct property *p;
> +		const char *ext;
> =20
>  		if (acpi_disabled) {
>  			node =3D of_cpu_device_node_get(cpu);
> @@ -334,6 +348,15 @@ void __init riscv_fill_hwcap(void)
>  			set_bit(RISCV_ISA_EXT_ZIHPM, isainfo->isa);
>  		}
> =20
> +		/*
> +		 * Check just the V property on DT-based systems, as we don't
> +		 * trust the ISA string in DT land.
> +		 */
> +		if (acpi_disabled)
> +			of_property_for_each_string(node, "riscv,isa-extensions", p, ext)
> +				if (strcmp(ext, "v") =3D=3D 0)
> +					this_hwcap |=3D COMPAT_HWCAP_ISA_V;

I think this should be:
	if (acpi_disabled)
		if (of_property_match_string(node, "riscv,isa-extensions", "v") >=3D 0)
			this_hwcap |=3D COMPAT_HWCAP_ISA_V;

(or compressed into a single if, depending on w/e you like..)

> +
>  		/*
>  		 * All "okay" hart should have same isa. Set HWCAP based on
>  		 * common capabilities of every "okay" hart, in case they don't
> --=20
> 2.40.1
>=20

--l1VOpMIeXoyNoCJL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZK3gAwAKCRB4tDGHoIJi
0oNPAQCtW48/sneu6Ur55AOdGDwI456h660eJOV1IfWb84cEvgD/RfWgmhDUkWeR
TcjItfcW3k3ghmmo5dVV42aoLXEL+gQ=
=L4tZ
-----END PGP SIGNATURE-----

--l1VOpMIeXoyNoCJL--


--===============2524400425522099591==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2524400425522099591==--

