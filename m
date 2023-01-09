Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50A21C54EBD
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Jan 2023 20:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=38s0udI1PCqlBLKyG/AqE7kUrKBDaL6mkyLYHqpTSJ4=; b=ztzpc1vrykHQyk2SkzjPGxUroW
	75MA6mcLUY7mWbZuz1z4U3YFa6+j5XVRKia9VJcg0NafhxxGXqqU1/LyzuW8m1qVgBVL9FLqPvIOQ
	D4Ju5Aeqfd0gRTbZTHl/rXxcRzy0s5RLnPgSo3Qpiz2uBJcvsLYNZpAIdmrP6X0qsk53PAKIkf0vK
	taz3nIsNdbPGX4Oi61nkbvzGuZbG/X5k0kOl1A87ZL8l+fAVedYuZYywMVv+rCGehQru6TeEKfM1a
	AFAJ4ixHAjUhsnnXh8SzDAkmgRkojZVPZZv+eQKErDqbAVnD0ywt7tioUmpE5RhQo7DY3O/lKCWFQ
	/wh4Iz1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEz9E-003zhj-KZ; Mon, 09 Jan 2023 20:53:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEz9A-003zgg-O2
	for linux-riscv@lists.infradead.org; Mon, 09 Jan 2023 20:53:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4A3FC6137B;
	Mon,  9 Jan 2023 20:53:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7F0BC433D2;
	Mon,  9 Jan 2023 20:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673297611;
	bh=f0xLx1ytpWClpqR+bmrLdXxWbWM/MZcDd8n7TAJNaUQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ltmkp7VEjTUK4OPV7dz7ru1Am/I1A0/ou1b3qRFMry1V2pbtTsUcWxlktMKILc9Oh
	 6yIGWIvWrlDLCTW4dBDoUPgD+oYW41SDKX7YN47Adg6MQ5fat10LyBki1jmr/B5rY/
	 j85C7Ypc8fT4yWithPybTuTBTS6VCHvimOjQMZDqnYzRRovcHjcozRre07jFRTHDWH
	 /93K4qmCCLjkfG0RjIknp1fEKveTdbIJ0GM16dEAFkHVbZZ0067r1jr4IKeH5+mPcs
	 feFR9+fzm6MuN20+W4aI2ZSlglyrzHj8uO7SWzZvaw3JoLIX92WRquM6rjjFi8UAOp
	 7+iaOfm4tH7uw==
Date: Mon, 9 Jan 2023 20:53:27 +0000
From: Conor Dooley <conor@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	christoph.muellner@vrull.eu, philipp.tomsich@vrull.eu,
	ajones@ventanamicro.com, jszhang@kernel.org,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH v4 1/5] RISC-V: move some stray __RISCV_INSN_FUNCS
 definitions from kprobes
Message-ID: <Y7x+x3oiig3j94Bb@spud>
References: <20230109181755.2383085-1-heiko@sntech.de>
 <20230109181755.2383085-2-heiko@sntech.de>
MIME-Version: 1.0
In-Reply-To: <20230109181755.2383085-2-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_125332_878761_5D99AFFD 
X-CRM114-Status: GOOD (  22.24  )
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
Content-Type: multipart/mixed; boundary="===============2244601656947442844=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2244601656947442844==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Kz7TMBL6uza6L1j6"
Content-Disposition: inline


--Kz7TMBL6uza6L1j6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 09, 2023 at 07:17:51PM +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
>=20
> The __RISCV_INSN_FUNCS originally declared riscv_insn_is_* functions insi=
de
> the kprobes implementation. This got moved into a central header in
> commit ec5f90877516 ("RISC-V: Move riscv_insn_is_* macros into a common h=
eader").
>=20
> Though it looks like I overlooked two of them, so fix that. FENCE itself =
is
> an instruction defined directly by its own opcode, while the created
> riscv_isn_is_system function covers all instructions defined under the SY=
STEM
> opcode.
>=20
> Fixes: ec5f90877516 ("RISC-V: Move riscv_insn_is_* macros into a common h=
eader")

Not quite sure why it needs a fixes tag, nothing was actually broken
previously, right?

Not that I really care, but Sasha is likely gonna pick it up for
backporting as a result.

Either way, looks grand.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

> Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> ---
>  arch/riscv/include/asm/insn.h            | 10 ++++++++++
>  arch/riscv/kernel/probes/simulate-insn.h |  3 ---
>  2 files changed, 10 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
> index 98453535324a..0455b4dcb0a7 100644
> --- a/arch/riscv/include/asm/insn.h
> +++ b/arch/riscv/include/asm/insn.h
> @@ -128,6 +128,7 @@
>  #define RVC_C2_RD_OPOFF		7
> =20
>  /* parts of opcode for RVG*/
> +#define RVG_OPCODE_FENCE	0x0f
>  #define RVG_OPCODE_AUIPC	0x17
>  #define RVG_OPCODE_BRANCH	0x63
>  #define RVG_OPCODE_JALR		0x67
> @@ -163,6 +164,7 @@
>  #define RVG_MATCH_AUIPC		(RVG_OPCODE_AUIPC)
>  #define RVG_MATCH_JALR		(RV_ENCODE_FUNCT3(JALR) | RVG_OPCODE_JALR)
>  #define RVG_MATCH_JAL		(RVG_OPCODE_JAL)
> +#define RVG_MATCH_FENCE		(RVG_OPCODE_FENCE)
>  #define RVG_MATCH_BEQ		(RV_ENCODE_FUNCT3(BEQ) | RVG_OPCODE_BRANCH)
>  #define RVG_MATCH_BNE		(RV_ENCODE_FUNCT3(BNE) | RVG_OPCODE_BRANCH)
>  #define RVG_MATCH_BLT		(RV_ENCODE_FUNCT3(BLT) | RVG_OPCODE_BRANCH)
> @@ -182,6 +184,7 @@
>  #define RVG_MASK_AUIPC		(RV_INSN_OPCODE_MASK)
>  #define RVG_MASK_JALR		(RV_INSN_FUNCT3_MASK | RV_INSN_OPCODE_MASK)
>  #define RVG_MASK_JAL		(RV_INSN_OPCODE_MASK)
> +#define RVG_MASK_FENCE		(RV_INSN_OPCODE_MASK)
>  #define RVC_MASK_C_JALR		(RVC_INSN_FUNCT4_MASK | RVC_INSN_J_RS2_MASK | R=
VC_INSN_OPCODE_MASK)
>  #define RVC_MASK_C_JR		(RVC_INSN_FUNCT4_MASK | RVC_INSN_J_RS2_MASK | RVC=
_INSN_OPCODE_MASK)
>  #define RVC_MASK_C_JAL		(RVC_INSN_FUNCT3_MASK | RVC_INSN_OPCODE_MASK)
> @@ -233,6 +236,13 @@ __RISCV_INSN_FUNCS(c_bnez, RVC_MASK_C_BNEZ, RVC_MATC=
H_C_BNEZ)
>  __RISCV_INSN_FUNCS(c_ebreak, RVC_MASK_C_EBREAK, RVC_MATCH_C_EBREAK)
>  __RISCV_INSN_FUNCS(ebreak, RVG_MASK_EBREAK, RVG_MATCH_EBREAK)
>  __RISCV_INSN_FUNCS(sret, RVG_MASK_SRET, RVG_MATCH_SRET)
> +__RISCV_INSN_FUNCS(fence, RVG_MASK_FENCE, RVG_MATCH_FENCE);
> +
> +/* special case to catch _any_ system instruction */
> +static __always_inline bool riscv_insn_is_system(u32 code)
> +{
> +	return (code & RV_INSN_OPCODE_MASK) =3D=3D RVG_OPCODE_SYSTEM;
> +}
> =20
>  /* special case to catch _any_ branch instruction */
>  static __always_inline bool riscv_insn_is_branch(u32 code)
> diff --git a/arch/riscv/kernel/probes/simulate-insn.h b/arch/riscv/kernel=
/probes/simulate-insn.h
> index a19aaa0feb44..61e35db31001 100644
> --- a/arch/riscv/kernel/probes/simulate-insn.h
> +++ b/arch/riscv/kernel/probes/simulate-insn.h
> @@ -12,9 +12,6 @@
>  		}							\
>  	} while (0)
> =20
> -__RISCV_INSN_FUNCS(system,	0x7f, 0x73);
> -__RISCV_INSN_FUNCS(fence,	0x7f, 0x0f);
> -
>  #define RISCV_INSN_SET_SIMULATE(name, code)				\
>  	do {								\
>  		if (riscv_insn_is_##name(code)) {			\
> --=20
> 2.35.1
>=20

--Kz7TMBL6uza6L1j6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY7x+xwAKCRB4tDGHoIJi
0rkrAQDrvpqzvZvs75G6ZdWgFkxuxGZbhKE3oznZESSMpaQi8wEAzHMhFjcNwxHN
a1HJjPAvfn+ZOREELF0ckHbrmfoZDwA=
=xSv6
-----END PGP SIGNATURE-----

--Kz7TMBL6uza6L1j6--


--===============2244601656947442844==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2244601656947442844==--

