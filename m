Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80821C63705
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Dec 2022 20:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cUj17jG20UobU7xnmAXj0qtRklk0S25iL1ysh0oS1Go=; b=pCzKhdIedfATh1IkkjMZ3wUCKM
	t056K3oAnqM/Oj3PdnGzmixBmVhlfCcIKMUWZ9I9uO8KO/uvtwo+mcccDA/WfaUeEezT9tWfzMxBY
	tk1U5IHZcU4Zxuz7UPIme12qFnIAvEYUGeO64hcVgRkoYUIvJ8jgjdUzjOGFI1fYsz5FHheA5isEa
	1mj2XeYQJ1BvKEL/peqlupiKQTpXrFwUCfmFFdkbsv+hCY6TQ7cZo4EHn2uoFc5aHs7PpLgl8L6cD
	NCxs0umq+yeKnvh/QEVPDan13KZb4xpsKDlt4FL1wmfqKI58u5rSzSGnHpc2O7FJH4oUKaTHk3yP6
	/4fYdNrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p30hn-00BYsE-Db; Wed, 07 Dec 2022 20:07:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p30hk-00BYqY-Rs
	for linux-riscv@lists.infradead.org; Wed, 07 Dec 2022 20:07:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6421961BE9;
	Wed,  7 Dec 2022 20:07:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD21FC433B5;
	Wed,  7 Dec 2022 20:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670443663;
	bh=WH3O2I27cArQLXYb+WMrkYhbQZxXFjFWeeGceZcSPpQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lDd1lyTkZMYactJH+5l4Wh5MIw++nOKC8fID3hPyoyfaR0AJgpmxax2fYomXvDWxY
	 nGHfSrFR5wkoYiLl4FTpD68MOGpxH4p30zXPqV3i6lN6/d4x35Q7r+lXBznh8DR7TB
	 J2dlCxppBzvYM8dPRc8J4VfJ0budKx5GXf4ZKCXjOqnOSdI10Yo45PXO4sfbGO8wJ4
	 HXBEaM81yjrc1pYm8Kp5I7W8ssao+l2Gf/zNo+QhqUQtzZUT8zqa7tSWvFAjIQIt1C
	 /hz9on4koBAtlo0AK1V+Iryu9GAyyDkH5DGbsszsUBss6wVfmCZweIXBUeffsH47J0
	 pZFDPA23iXyxQ==
Date: Wed, 7 Dec 2022 20:07:39 +0000
From: Conor Dooley <conor@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	christoph.muellner@vrull.eu, prabhakar.csengg@gmail.com,
	philipp.tomsich@vrull.eu, ajones@ventanamicro.com,
	emil.renner.berthing@canonical.com, jszhang@kernel.org,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH v4 11/12] RISC-V: add helpers for handling immediates in
 U-type and I-type pairs
Message-ID: <Y5DyiwZkx3SvQVGc@spud>
References: <20221207180821.2479987-1-heiko@sntech.de>
 <20221207180821.2479987-12-heiko@sntech.de>
MIME-Version: 1.0
In-Reply-To: <20221207180821.2479987-12-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_120744_994487_983E4235 
X-CRM114-Status: GOOD (  27.00  )
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
Content-Type: multipart/mixed; boundary="===============4871234294857178778=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4871234294857178778==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uChGIxJnGnmUqEgZ"
Content-Disposition: inline


--uChGIxJnGnmUqEgZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 07, 2022 at 07:08:20PM +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
>=20
> Used together U-type and I-type instructions can for example be used to
> generate bigger jumps (i.e. in auipc+jalr pairs) by splitting the value
> into an upper immediate (i.e. auipc) and a 12bit immediate (i.e. jalr).
>=20
> Due to both immediates being considered signed this creates some corner
> cases, so add some helper to prevent this from getting duplicated in
> different places.
>=20
> Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> ---
>  arch/riscv/include/asm/insn.h | 47 +++++++++++++++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
>=20
> diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
> index 2a23890b4577..bb1e6120a560 100644
> --- a/arch/riscv/include/asm/insn.h
> +++ b/arch/riscv/include/asm/insn.h
> @@ -290,3 +290,50 @@ static __always_inline bool riscv_insn_is_branch(u32=
 code)
>  	(RVC_X(x_, RVC_B_IMM_5_OPOFF, RVC_B_IMM_5_MASK) << RVC_B_IMM_5_OFF) | \
>  	(RVC_X(x_, RVC_B_IMM_7_6_OPOFF, RVC_B_IMM_7_6_MASK) << RVC_B_IMM_7_6_OF=
F) | \
>  	(RVC_IMM_SIGN(x_) << RVC_B_IMM_SIGN_OFF); })
> +
> +/*
> + * Put together one immediate from a U-type and I-type instruction pair.
> + *
> + * The U-type contains an upper immediate, meaning bits[31:12] with [11:=
0]
> + * being zero, while the I-type contains a 12bit immediate.
> + * Combined these can encode larger 32bit values and are used for example
> + * in auipc + jalr pairs to allow larger jumps.
> + *
> + * @utype_insn: instruction containing the upper immediate
> + * @itype_insn: instruction
> + * Return: combined immediate
> + */
> +static inline s32 riscv_insn_extract_utype_itype_imm(u32 utype_insn, u32=
 itype_insn)
> +{
> +	s32 imm;
> +
> +	imm =3D RV_EXTRACT_UTYPE_IMM(utype_insn);
> +	imm +=3D RV_EXTRACT_ITYPE_IMM(itype_insn);
> +
> +	return imm;
> +}
> +
> +/*
> + * Update a set of two instructions (U-type + I-type) with an immediate =
value.
> + *
> + * Used for example in auipc+jalrs pairs the U-type instructions contains
> + * a 20bit upper immediate representing bits[31:12], while the I-type
> + * instruction contains a 12bit immediate representing bits[11:0].
> + *
> + * This also takes into account that both separate immediates are
> + * considered as signed values, so if the I-type immediate becomes
> + * negative (BIT(11) set) the U-type part gets adjusted.
> + *
> + * @insn: pointer to a set of two instructions
> + * @imm: the immediate to insert into the two instructions
> + */
> +static inline void riscv_insn_insert_utype_itype_imm(u32 *insn, s32 imm)
> +{
> +	/* drop possible old IMM values */
> +	insn[0] &=3D ~(RV_U_IMM_31_12_MASK);
> +	insn[1] &=3D ~(RV_I_IMM_11_0_MASK << RV_I_IMM_11_0_OPOFF);
> +
> +	/* add the adapted IMMs */
> +	insn[0] |=3D ((imm & RV_U_IMM_31_12_MASK) + ((imm & BIT(11)) << 1));
> +	insn[1] |=3D ((imm & RV_I_IMM_11_0_MASK) << RV_I_IMM_11_0_OPOFF);

If you send a v5, could you drop the extra ()s around some of these?
Otherwise:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
I do like the comments a lot :) Saves going off to read specs...

> +}
> --=20
> 2.35.1
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--uChGIxJnGnmUqEgZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY5DyiwAKCRB4tDGHoIJi
0haNAP9iiPdgxFz5mEmtvF3KKP3i4MbuXPg2WALThAz5KOf0fQEAwRpuRcdbpM+R
sM7/3z3ZPXtQjiz3QD9c4aeYfsQsiA0=
=DBmk
-----END PGP SIGNATURE-----

--uChGIxJnGnmUqEgZ--


--===============4871234294857178778==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4871234294857178778==--

