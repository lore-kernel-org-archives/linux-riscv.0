Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2441FC6FD18
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Apr 2023 18:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=feJuSrZ5H7mArCqTfu3GsmjNTjGArM3PU7WKthiiVR0=; b=n14wLUj5j59wDqwomHc8wB9qbV
	rZS2CJ2B1o3r9Zb6zfChTmXifKuAx4lRR9WVRS8aW4X0O0yIet7L0/1uDUCDQn9BgOzYoWPxib2U/
	MEvGNt3A2wiZg21HasngMN3BqaTpFXffwN5P5eDxOjSD8pwDMnhOfAy5BJFWKi3ig9qy5wMozmz9Y
	0A7GA3OB+Y3O2waXef/djIgGxRwHS/vbbEj0sz7mbPvjrelFgM0UgzhOTEDTvCs/JAP/yzvaw0arF
	2g1nCrB/gTznGH0h4KuWQNCqQ7Rl8DotpiVUrooIQ+0t9H2nW705Hkb2AJYowuoWZV0JappzDm/cR
	fwfFaf1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poqJ7-0036Xw-2m;
	Tue, 18 Apr 2023 18:44:01 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poqJ4-0036X1-2w;
	Tue, 18 Apr 2023 18:44:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3022262F19;
	Tue, 18 Apr 2023 18:43:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3055DC433EF;
	Tue, 18 Apr 2023 18:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681843436;
	bh=TXcpoAkbf5TJJJHqpDf6X89zLTJr4dtl0Jy5QNkKhYU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BS4vnHzF2WDU3f0yKG1NVmoU/z+ozyA2zrDv5bUAf/LIVGUxq59mACtpp8ei//Uxy
	 9XtiYZGXDfIaAZoNsiCv+HyRvW12tIeP0p31UvNi1zMjlaeu0y4MDrqjn+afqHdINO
	 mXpiSLKtEa7jTn+oe1+jJ/y3m3m4XfqWtzYb7zhtHRrktZLE8OGVQyGd308hQCm8fQ
	 xpa7hQ3hesRFWvBxqbSzhC4ovlMhSaR6/56YqlNS94dF3lIO01ogdDyT40LZSsJ7P+
	 81RluHLl7fAF4Ac386ujIHZimke/iikGjFBjnKGsKnqsUR93jBBO4M+CFBfvWFH8BM
	 Iwu+4o3XGQb6g==
Date: Tue, 18 Apr 2023 19:43:51 +0100
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	virtualization@lists.linux-foundation.org,
	'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Paolo Bonzini ' <pbonzini@redhat.com>,
	'Juergen Gross ' <jgross@suse.com>,
	"'Srivatsa S . Bhat '" <srivatsa@csail.mit.edu>,
	'Anup Patel ' <anup@brainfault.org>,
	'Atish Patra ' <atishp@atishpatra.org>
Subject: Re: [RFC PATCH 02/14] RISC-V: Add SBI STA extension definitions
Message-ID: <20230418-elliptic-headboard-6a18fcccdf07@spud>
References: <20230417103402.798596-1-ajones@ventanamicro.com>
 <20230417103402.798596-3-ajones@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230417103402.798596-3-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_114359_024596_786F3820 
X-CRM114-Status: GOOD (  20.73  )
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
Content-Type: multipart/mixed; boundary="===============8452173217463331222=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8452173217463331222==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NNZi1v7KiPi6LJaq"
Content-Disposition: inline


--NNZi1v7KiPi6LJaq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 17, 2023 at 12:33:50PM +0200, Andrew Jones wrote:
> The SBI STA extension enables steal-time accounting. Add the
> definitions it specifies.
>=20
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/include/asm/sbi.h | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>=20
> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> index 945b7be249c1..485b9ec20399 100644
> --- a/arch/riscv/include/asm/sbi.h
> +++ b/arch/riscv/include/asm/sbi.h
> @@ -30,6 +30,7 @@ enum sbi_ext_id {
>  	SBI_EXT_HSM =3D 0x48534D,
>  	SBI_EXT_SRST =3D 0x53525354,
>  	SBI_EXT_PMU =3D 0x504D55,
> +	SBI_EXT_STA =3D 0x535441,

What is the sort order of this? Matching the spec ordering, or just
append-at-the-end?

Unrelated, but in checking that I saw that your SUSP stuff is in
master - you planning on resending that series?

Anyways, this does match the docs - but I'm quite hesitant to leave an
R-b when it's not merged yet.

Cheers,
Conor.

> =20
>  	/* Experimentals extensions must lie within this range */
>  	SBI_EXT_EXPERIMENTAL_START =3D 0x08000000,
> @@ -236,6 +237,20 @@ enum sbi_pmu_ctr_type {
>  /* Flags defined for counter stop function */
>  #define SBI_PMU_STOP_FLAG_RESET (1 << 0)
> =20
> +/* SBI STA (steal-time accounting) extension */
> +enum sbi_ext_sta_fid {
> +	SBI_EXT_STA_SET_STEAL_TIME_SHMEM =3D 0,
> +};
> +
> +struct sbi_sta_struct {
> +	__le32 sequence;
> +	__le32 flags;
> +	__le64 steal;
> +	u8 preempted;
> +	u8 pad[47];
> +} __packed;
> +
> +/* SBI spec version fields */
>  #define SBI_SPEC_VERSION_DEFAULT	0x1
>  #define SBI_SPEC_VERSION_MAJOR_SHIFT	24
>  #define SBI_SPEC_VERSION_MAJOR_MASK	0x7f
> --=20
> 2.39.2
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--NNZi1v7KiPi6LJaq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZD7k5wAKCRB4tDGHoIJi
0p9iAPwIl2OtnjFafj6YABzVxCu9xknWGD+CeDtKAZ+SFo6T/QD/cJDOZtW64QPs
pxQah5IkimPFvgXAhz6fBzrCESywvgM=
=3O9u
-----END PGP SIGNATURE-----

--NNZi1v7KiPi6LJaq--


--===============8452173217463331222==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8452173217463331222==--

