Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0450C0218D
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jan 2025 16:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8jI2ECQVpLqvkPEyrctXlrc8MUalWEX+SzyhMOCR4JY=; b=bGnKIYI4eaUDX0S4zT52gHFoiA
	2JP82TyvKfW6HKBr0Le6e3iuDfAZG1AX20M9HEVUD3+9cbMASFkPcficWgY0jUZ0Q8k9b0DY2+18s
	f6m562wsxFfishSbguCRbSUuD/KXVaUf73lH/Uu9DHnkq6x0mZ73fsNy8Hl1+U4W3E5TDVm8ehsuy
	sqomn240lbYXN3wzoumbuM2gNmmz6gh523mukMaLGftErhaNqXnHW0n4815bqkO72s5Vgqvl0uzI0
	SaOhn2uKIyAxwKAvZDh0ZTkOZdt9r1PrskxC+KmHTRl9hXJJIKHnTM5HrY00h4ZxemYcAR3B9H99c
	1Um7PWew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdAo8-00000007NDp-3EzA;
	Wed, 29 Jan 2025 16:20:52 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdAnL-00000007N1z-3zEw
	for linux-riscv@lists.infradead.org;
	Wed, 29 Jan 2025 16:20:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5E63BA41AA0;
	Wed, 29 Jan 2025 16:18:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D4B0C4CED1;
	Wed, 29 Jan 2025 16:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738167602;
	bh=/xr+O0nuPR2GbK+yqEfII6MLsaJ1DD5+2fiy11H5sCc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Urw3YPkZjPPT5WidYxkLObM+dPfv7nk/ZDwg8dYZ2EK6zofbejxnCq7ojL7TY+/6w
	 PqJzOgXpNy66YGhsy5oRPiURW3XJRkkBZCzp0HwzfJDdyGLVRptk6edRYsxBPazN5t
	 u6+MDG1WwbrD6nqRehRLcnWOcHUBpjgtzPEo3w9oRUnRLhdlyWQdF5rCMKldFK1tnB
	 IXE+oZy5J3eWqIApDeGCWcRO47iQfOO3Aa1fP9xv2qa8rxL3zVLULWD6cssheO9i4t
	 QfSVIjuesoLvBpQQTaichU3DLt3UZlbokEsDqB4rybpeZRfE72jQ3VTrIPPOKOEVDB
	 j2AGdmpFHc4xQ==
Date: Wed, 29 Jan 2025 16:19:58 +0000
From: Conor Dooley <conor@kernel.org>
To: Aleksandar Rikalo <arikalo@gmail.com>
Cc: linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Jones <ajones@ventanamicro.com>,
	Christoph =?iso-8859-1?Q?M=FCllner?= <christoph.muellner@vrull.eu>,
	linux-kernel@vger.kernel.org,
	Djordje Todorovic <djordje.todorovic@htecgroup.com>
Subject: Re: [PATCH v3] riscv: Fix the PAUSE Opcode for MIPS P8700.
Message-ID: <20250129-museum-slider-3bb634d124de@spud>
References: <20250129131703.733098-1-arikalo@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20250129131703.733098-1-arikalo@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_082004_118031_45A5F33C 
X-CRM114-Status: GOOD (  18.71  )
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
Content-Type: multipart/mixed; boundary="===============4979880311609930495=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4979880311609930495==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eMHOSPIWF9cimNJf"
Content-Disposition: inline


--eMHOSPIWF9cimNJf
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 29, 2025 at 02:17:03PM +0100, Aleksandar Rikalo wrote:
> From: Djordje Todorovic <djordje.todorovic@htecgroup.com>
>=20
> The riscv MIPS P8700 uses a different opcode for PAUSE.
> It is a =E2=80=98hint=E2=80=99 encoding of the SLLI instruction, with rd=
=3D0, rs1=3D0 and
> imm=3D5. It will behave as a NOP instruction if no additional behavior
> beyond that of SLLI is implemented.

You say p8700, but the erratum will be applied on all systems that are
identified as using a mips cpu. Why's that?

> +void mips_errata_patch_func(struct alt_entry *begin,
> +					     struct alt_entry *end,
> +					     unsigned long archid,
> +					     unsigned long impid,
> +					     unsigned int stage)
> +{
> +	struct alt_entry *alt;
> +
> +	BUILD_BUG_ON(ERRATA_MIPS_NUMBER >=3D RISCV_VENDOR_EXT_ALTERNATIVES_BASE=
);
> +
> +	if (stage =3D=3D RISCV_ALTERNATIVES_EARLY_BOOT)
> +		return;
> +
> +	for (alt =3D begin; alt < end; alt++) {
> +		if (alt->vendor_id !=3D MIPS_VENDOR_ID)
> +			continue;
> +
> +		if (alt->patch_id >=3D ERRATA_MIPS_NUMBER) {
> +			WARN(1, "MIPS errata id:%d not in kernel errata list\n",
> +			     alt->patch_id);
> +			continue;
> +		}
> +
> +		mutex_lock(&text_mutex);
> +		patch_text_nosync(ALT_OLD_PTR(alt), ALT_ALT_PTR(alt), alt->alt_len);
> +		mutex_unlock(&text_mutex);
> +	}
> +}

> diff --git a/tools/arch/riscv/include/asm/vdso/processor.h b/tools/arch/r=
iscv/include/asm/vdso/processor.h
> index 662aca039848..880f26a24f69 100644
> --- a/tools/arch/riscv/include/asm/vdso/processor.h
> +++ b/tools/arch/riscv/include/asm/vdso/processor.h
> @@ -14,7 +14,10 @@ static inline void cpu_relax(void)
>  	__asm__ __volatile__ ("div %0, %0, zero" : "=3Dr" (dummy));
>  #endif
> =20
> -#ifdef CONFIG_TOOLCHAIN_HAS_ZIHINTPAUSE
> +#ifdef CONFIG_ERRATA_MIPS_P8700_PAUSE_OPCODE
> +    /* MIPS P8700 pause opcode */
> +    __asm__ __volatile__ (".4byte 0x00501013");
> +#elif CONFIG_TOOLCHAIN_HAS_ZIHINTPAUSE
>  	/*
>  	 * Reduce instruction retirement.
>  	 * This assumes the PC changes.

What about when the erratum is enabled and the toolchain supports
Zihintpause? Why don't you use the same implementation as the !tools
copy of the header? (I'm not sure why they're different in the first
place).

--eMHOSPIWF9cimNJf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ5pVLgAKCRB4tDGHoIJi
0jzsAPwPO2TbzV0CLmLLBBF2VSrcHtpUJGHN1svBVFjInp45sgEAu9U57bs56soB
2YnL7XfSl9TVJ6uqSY1eBiGZuTmexgE=
=kZev
-----END PGP SIGNATURE-----

--eMHOSPIWF9cimNJf--


--===============4979880311609930495==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4979880311609930495==--

