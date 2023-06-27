Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BC21EB64DC
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jun 2023 19:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AqAQzHpnWlFdeOUXs2+0/EXwY3DB6PPoLCgfachDMxY=; b=PrZTclRSlIJqEyInvowwWFVpKt
	9RAH/kjVoOPVkVYaFz2hsVwn7KhYT+hbq3OwSGTFqRuqOjvlGIvvUBC/kfOJ2rDobKmxU/jWRTHRf
	ZRkxM7Q2LpbGHwxXx/eXXJ4JIOJflaN17McMW6KP6GiEO1kRV6d8ro4FFMzPHwOwlCosKuhdV7hj0
	6PzR6prCrs/pKY6toUlxc2nR+zm30wnHUtbAqaTYy7Tn9pLBaZhXY8LHATKRjjm0y74IQjGhLh/Yy
	3kAgUmJH2YAQ2F2ar9uuyau8YP0QLLCmgTc4E40hcC+4C6Er+TKNciHW0OpEy43CVgn/kLySywaVq
	zChQVokA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEE3y-00DuLH-2M;
	Tue, 27 Jun 2023 19:09:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEE3v-00DuKl-0Q
	for linux-riscv@lists.infradead.org;
	Tue, 27 Jun 2023 19:09:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 499996120C;
	Tue, 27 Jun 2023 19:09:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EE33C433C0;
	Tue, 27 Jun 2023 19:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687892953;
	bh=wNMX3aP5XR3S7iBMp1cCSWTrwm/mBA7zbug2fhOXtME=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uz9KYxy1OzzWgv5CzwT80Y0rZ8EIgrNifZjt+JBMj31w5RQVGG4JitEWfpjjai4uX
	 gVikuJQ9563VCX8foCUiLPPd0u7fFYJx/Edii69eOXE1oFYPRmppVAVVnTYautshTj
	 jiRPiwK72sSQ/U0cUdJDa+8Q5TiSXD3yVeteaFCQXOy9F6w7y5WP3P0OKWHXpYVUfA
	 NIgrk4t6o5LDWiV6iKKlDjdj+1dqxWKiOqJMcX8S10c0bDZlyQjAtHRavAxgAgPdXt
	 eGRzoJx+VY5pf8ype2xY+Mf+RexyT/1OBpBoO6xaM8zOAX/VkXerLOJ304Un0Ktqy4
	 VvvOpxWUFkS3w==
Date: Tue, 27 Jun 2023 20:09:08 +0100
From: Conor Dooley <conor@kernel.org>
To: Samuel Ortiz <sameo@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux@rivosinc.com, Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Anup Patel <apatel@ventanamicro.com>, linux-kernel@vger.kernel.org,
	"Hongren (Zenithal) Zheng" <i@zenithal.me>,
	Guo Ren <guoren@kernel.org>, Atish Patra <atishp@rivosinc.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Evan Green <evan@rivosinc.com>
Subject: Re: [PATCH 3/3] RISC-V: Implement archrandom when Zkr is available
Message-ID: <20230627-grinning-droop-bfbb327f6164@spud>
References: <20230627143747.1599218-1-sameo@rivosinc.com>
 <20230627143747.1599218-4-sameo@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20230627143747.1599218-4-sameo@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230627_120915_244002_2109BD79 
X-CRM114-Status: GOOD (  30.72  )
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
Content-Type: multipart/mixed; boundary="===============0055862487256940056=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0055862487256940056==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0uAcHobi8KSxnYu+"
Content-Disposition: inline


--0uAcHobi8KSxnYu+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Samuel,

On Tue, Jun 27, 2023 at 04:37:44PM +0200, Samuel Ortiz wrote:
> The Zkr extension is ratified and provides 16 bits of entropy seed when
> reading the SEED CSR.
>=20
> We can implement arch_get_random_seed_longs() by doing multiple csrrw to
> that CSR and filling an unsigned long with valid entropy bits.
>=20
> Signed-off-by: Samuel Ortiz <sameo@rivosinc.com>
> ---
>  arch/riscv/include/asm/archrandom.h | 66 +++++++++++++++++++++++++++++
>  arch/riscv/include/asm/csr.h        |  9 ++++
>  2 files changed, 75 insertions(+)
>  create mode 100644 arch/riscv/include/asm/archrandom.h
>=20
> diff --git a/arch/riscv/include/asm/archrandom.h b/arch/riscv/include/asm=
/archrandom.h
> new file mode 100644
> index 000000000000..3d01aab2800a
> --- /dev/null
> +++ b/arch/riscv/include/asm/archrandom.h
> @@ -0,0 +1,66 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Kernel interface for the RISCV arch_random_* functions
> + *
> + * Copyright (c) 2022 by Rivos Inc.
> + *
> + */
> +
> +#ifndef ASM_RISCV_ARCHRANDOM_H
> +#define ASM_RISCV_ARCHRANDOM_H
> +
> +#include <asm/csr.h>
> +
> +#define PR_PREFIX "Zkr Extension: "

Does pr_fmt() not work for you?
Also, "Zkr Extension" doesn't really seem super helpful to a punter if
they saw it in a log. Why not s/Zkr Extension/archrandom/, or similar?

> +#define SEED_RETRY_LOOPS 10
> +
> +static inline bool __must_check csr_seed_long(unsigned long *v)
> +{
> +	unsigned int retry =3D SEED_RETRY_LOOPS;
> +	unsigned int needed_seeds =3D sizeof(unsigned long) / 2, valid_seeds =
=3D 0;
> +	u16 *entropy =3D (u16 *)v;
> +
> +	do {
> +		/*
> +		 * The SEED CSR (0x015) must be accessed with a read-write
> +		 * instruction. Moreover, implementations must ignore the write
> +		 * value, its purpose is to signal polling for new seed.
> +		 */

What relevance does the second half of this comment have to the kernel?

> +		unsigned long csr_seed =3D csr_swap(CSR_SEED, 0);
> +
> +		switch (csr_seed & SEED_OPST_MASK) {
> +		case SEED_OPST_ES16:
> +			entropy[valid_seeds++] =3D csr_seed & SEED_ENTROPY_MASK;
> +			if (valid_seeds =3D=3D needed_seeds)
> +				return true;
> +			break;
> +
> +		case SEED_OPST_DEAD:
> +			pr_err_once(PR_PREFIX "Unrecoverable error\n");
> +			return false;
> +
> +		case SEED_OPST_BIST:
> +			pr_info(PR_PREFIX "On going Built-in Self Test\n");

tiny nit, "On-going"? My OCD is bother by the capitalisation otherwise.

> +			fallthrough;
> +
> +		case SEED_OPST_WAIT:
> +		default:
> +			continue;
> +		}
> +
> +	} while (--retry);
> +
> +	return false;
> +}
> +
> +static inline size_t __must_check arch_get_random_longs(unsigned long *v=
, size_t max_longs)
> +{
> +	return 0;
> +}
> +
> +static inline size_t __must_check arch_get_random_seed_longs(unsigned lo=
ng *v, size_t max_longs)
> +{
> +	return max_longs && riscv_isa_extension_available(NULL, ZKR) && csr_see=
d_long(v) ? 1 : 0;

Could you please write this in a more readable way, even if that is
going to be a lot more verbose? I know you copied it from x86, but
that's not really an excuse ;)

Also, is there a reason that you opted not to use the alternative-backed
riscv_has_extension_[un]likely() here? The ones backed by alternatives
are preferred if you are not checking on a per-cpu, or once-off basis.

Cheers,
Conor.

> +}
> +
> +#endif /* ASM_RISCV_ARCHRANDOM_H */
> diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> index b98b3b6c9da2..7d0ca9082c66 100644
> --- a/arch/riscv/include/asm/csr.h
> +++ b/arch/riscv/include/asm/csr.h
> @@ -389,6 +389,15 @@
>  #define CSR_VTYPE		0xc21
>  #define CSR_VLENB		0xc22
> =20
> +/* Scalar Crypto Extension - Entropy */
> +#define CSR_SEED		0x015
> +#define SEED_OPST_MASK		_AC(0xC0000000, UL)
> +#define SEED_OPST_BIST		_AC(0x00000000, UL)
> +#define SEED_OPST_WAIT		_AC(0x40000000, UL)
> +#define SEED_OPST_ES16		_AC(0x80000000, UL)
> +#define SEED_OPST_DEAD		_AC(0xC0000000, UL)
> +#define SEED_ENTROPY_MASK	_AC(0xFFFF, UL)
> +
>  #ifdef CONFIG_RISCV_M_MODE
>  # define CSR_STATUS	CSR_MSTATUS
>  # define CSR_IE		CSR_MIE
> --=20
> 2.41.0
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--0uAcHobi8KSxnYu+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJsz1AAKCRB4tDGHoIJi
0sxhAQDmKCMwEhoSJKUvyKnvQfNciXr+UHg5OCQ+1yvbjABEoQD9GDHrlTxqptdc
PFMLpDuthQReCZpm9B3yw/ECerIzfQA=
=LE75
-----END PGP SIGNATURE-----

--0uAcHobi8KSxnYu+--


--===============0055862487256940056==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0055862487256940056==--

