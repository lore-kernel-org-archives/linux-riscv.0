Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0F23C5479D
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Jan 2023 22:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4/twBI0ZYFyoP0dOHXzxp+NTQO5Wbht0YE62m60qe2o=; b=wFu05GDCzJGvnEFG4zEHXY32i3
	fPFXclau/7cH6V91pztDO6pAzrPRP+0XMKRzVDrzaNc5LvxqteB8WuycJWilm3bPLmL1DRSY0zPfJ
	gIlO6N3R2I/QOGoieePLnOrmeXTwl/yTWu0tEgJcShDoWHxFB6K0Uf92RBnE5eEL2zP6VkgQKCAS8
	QHAPfSj/dNq/phk8nV0tiV9bp75CEUIdOQkkBJu+jwCp/+iRjJIBE5L/yGvg0UkBXaa10lAJwCmxD
	zFFgPYmn/fMm4XWduxs2cegOphk5xXgwtfz9/TEsgp80BrzUNjZ3Z2GZ678rlUX2FRh9/wZpjKqqu
	awyLXbJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pF0Xc-004U13-Q8; Mon, 09 Jan 2023 22:22:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pF0Xa-004U0a-KP
	for linux-riscv@lists.infradead.org; Mon, 09 Jan 2023 22:22:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EF51F6146B;
	Mon,  9 Jan 2023 22:22:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D03AC433D2;
	Mon,  9 Jan 2023 22:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673302969;
	bh=HZd04f8uzWwchTHptm4/OFbaLcriy3wzt3n1bCTjiVs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z2NHlh/EuiLez/PiXiecAgGNVp2PomicCFYDFFPN/rycMXRCoYVr7UJpP1f7mzolL
	 VkDS9hOLFoRNSD0RDcQE5X2SAgKVu528XmaSgGmYZY8LUo9J2z3GnatRwTq/ivt2BH
	 4/TQlUxL02gheyGYkmznjDNLlBuPAoErAGOq5PlsQZNraVlIO/iT2ljzbHgT3JVfi2
	 jhYKPEUjJczDVQkEpib90E8S/MI1qdevGMiUhqrQyy0CI5ajKdI8gFfQX8kwnMx7sb
	 2brq3z591S6xLk3S3cjp3Irn82J9ibLaZB51v9IruZtzxO78yvovUHrrfF/foU7W9E
	 tR5cpKBdqkeNA==
Date: Mon, 9 Jan 2023 22:22:45 +0000
From: Conor Dooley <conor@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	christoph.muellner@vrull.eu, philipp.tomsich@vrull.eu,
	ajones@ventanamicro.com, jszhang@kernel.org,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH v4 2/5] RISC-V: add helpers for J-type immediate handling
Message-ID: <Y7yTtZOwzNBEIz5i@spud>
References: <20230109181755.2383085-1-heiko@sntech.de>
 <20230109181755.2383085-3-heiko@sntech.de>
MIME-Version: 1.0
In-Reply-To: <20230109181755.2383085-3-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_142250_785783_81C03229 
X-CRM114-Status: GOOD (  23.00  )
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
Content-Type: multipart/mixed; boundary="===============6583260601009654390=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6583260601009654390==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hD5pnsYc6vXYn95y"
Content-Disposition: inline


--hD5pnsYc6vXYn95y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 09, 2023 at 07:17:52PM +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
>=20
> Similar to the helper for the u-type + i-type imm handling, add helper-
> functions for j-type immediates.
>=20
> While it also would be possible to open-code that bit of imm wiggling
> using the macros already provided in insn.h, it's way better to have
> consistency on how we handle this across all function encoding/decoding.
>=20
> Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> ---
>  arch/riscv/include/asm/insn.h | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>=20
> diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
> index 0455b4dcb0a7..9eea61a3028f 100644
> --- a/arch/riscv/include/asm/insn.h
> +++ b/arch/riscv/include/asm/insn.h
> @@ -301,6 +301,32 @@ static __always_inline bool riscv_insn_is_branch(u32=
 code)
>  	(RVC_X(x_, RVC_B_IMM_7_6_OPOFF, RVC_B_IMM_7_6_MASK) << RVC_B_IMM_7_6_OF=
F) | \
>  	(RVC_IMM_SIGN(x_) << RVC_B_IMM_SIGN_OFF); })
> =20
> +/*
> + * Get the immediate from a J-type instruction.
> + *
> + * @insn: instruction to process
> + * Return: immediate
> + */
> +static inline s32 riscv_insn_extract_jtype_imm(u32 insn)
> +{
> +	return RV_EXTRACT_JTYPE_IMM(insn);
> +}
> +
> +/*
> + * Update a J-type instruction with an immediate value.
> + *
> + * @insn: pointer to the jtype instruction
> + * @imm: the immediate to insert into the instruction
> + */
> +static inline void riscv_insn_insert_jtype_imm(u32 *insn, s32 imm)
> +{
> +	*insn &=3D ~GENMASK(31, 12);
> +	*insn |=3D (((imm & (RV_J_IMM_10_1_MASK << RV_J_IMM_10_1_OFF)) << RV_I_=
IMM_11_0_OPOFF) |
                                                                           ^
RV_I? That should be RV_J_IMM_10_1_OPOFF, no?

> +		  ((imm & (RV_J_IMM_11_MASK << RV_J_IMM_11_OFF)) << RV_J_IMM_11_OPOFF)=
 |
> +		  ((imm & (RV_J_IMM_19_12_OPOFF << RV_J_IMM_19_12_OFF)) << RV_J_IMM_19=
_12_OPOFF) |
> +		  ((imm & (1 << RV_J_IMM_SIGN_OFF)) << RV_J_IMM_SIGN_OPOFF));
> +}

Otherwise, seems fine?

> +
>  /*
>   * Put together one immediate from a U-type and I-type instruction pair.
>   *
> --=20
> 2.35.1
>=20

--hD5pnsYc6vXYn95y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY7yTtAAKCRB4tDGHoIJi
0oN2AP4kPuQxvVebwjO7fgLXpZqiYQ7sfdfU/1atqpB/4C7aAwEAp2u4Pc7ICsmu
sfjMO7/K2hoM+S6zpCZwPOqdtrfwbQk=
=v9db
-----END PGP SIGNATURE-----

--hD5pnsYc6vXYn95y--


--===============6583260601009654390==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6583260601009654390==--

