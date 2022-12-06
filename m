Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEB29C3A5A7
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Dec 2022 22:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CpYo9o6Oi7qEjqHaWABHBBeEr9iMPMfELd0yA+FDnHc=; b=Esb9bKBhPHZeOZHdlbqYI7MfUx
	KPXhjkejAAbAERccf8YtI9aSBITcDDPF8+L2JmlXj6F9M12VuZZ8Lqib5IhmnRb9++QnH7jaQ5UPy
	RLmZpw0a5zsbRzCXZ2rLDI6PH+wnsE3RwbYsEFHK0nj4wsBM5Nst073syacTcRRRUooY+q1A3lXTz
	mEWFYXZC2Xet+IfizMZ6DYZ/mh+ApFgjqcgDL3fw2QRbQudelujTg/jT2Yi6CQQIyFa0D4g8qnHob
	1Y8iLYrX76KtgiAnpojQsVZU53qzG+W1ZolFoVAioEJWSqY1u6I1draLDb+BmW1BJTMaNFCK/p+qD
	XY7TkFaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2gFB-003v0u-Ci; Tue, 06 Dec 2022 22:16:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2gF8-003uwa-J5; Tue, 06 Dec 2022 22:16:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D6C6261825;
	Tue,  6 Dec 2022 22:16:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D74F7C433C1;
	Tue,  6 Dec 2022 22:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670365009;
	bh=SCKvjdFkoWahyssNW3KR7YKwBEXw4uCbZYWyEgkyLT0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SQKugXn3vGaePN6d/lLbeRZ4+CUOM9i9yLk5xenA5/v+crzh6ZbCdEZbOssJCmFwu
	 c3RlurGYiN4v+e5uGk5nGgMyWfuQ5SHSgf6YkyWJu85POCRtIc1vKuKDjv2Aso8aRn
	 qpWK6KldgvQ6Eg9H+SWl5e+WztPTZ2vDx5AXtaZGDXhl/5+mstpP6iBkgtceFkl/39
	 jG35/riADRnIfsPxuDbBXFxfwmG4yI29GXFSgkGCPdJecRawqN6DnZglz0APIcKFYD
	 0VBwsYeHTcgrsCJPmNflHnPpcubPZMmN5Xy8rsUT1jji6aJVV/NL/sNgU0vzG6PeFf
	 NEjN1PTpMmnCw==
Date: Tue, 6 Dec 2022 22:16:44 +0000
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v2 13/13] riscv: remove riscv_isa_ext_keys[] array and
 related usage
Message-ID: <Y4+/TPEfueQqahgb@spud>
References: <20221204174632.3677-1-jszhang@kernel.org>
 <20221204174632.3677-14-jszhang@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20221204174632.3677-14-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_141650_731694_D9AD37E9 
X-CRM114-Status: GOOD (  21.04  )
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
Content-Type: multipart/mixed; boundary="===============2528559480635961135=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2528559480635961135==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="X6tcYWkrEqthglcL"
Content-Disposition: inline


--X6tcYWkrEqthglcL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 05, 2022 at 01:46:32AM +0800, Jisheng Zhang wrote:
> All users have switched to riscv_has_extension_*, removed unused

minor nit: remove

> definitions, vars and related setting code.
>=20
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>

May as well join the R-b club here, the removal of 2 places where
extensions need to be kept ordered is especially appreciated!

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks!

> ---
>  arch/riscv/include/asm/hwcap.h | 30 ------------------------------
>  arch/riscv/kernel/cpufeature.c |  9 ---------
>  2 files changed, 39 deletions(-)
>=20
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwca=
p.h
> index e2d3f6df7701..be00a4337578 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -60,18 +60,6 @@ enum {
> =20
>  extern unsigned long elf_hwcap;
> =20
> -/*
> - * This enum represents the logical ID for each RISC-V ISA extension sta=
tic
> - * keys. We can use static key to optimize code path if some ISA extensi=
ons
> - * are available.
> - */
> -enum riscv_isa_ext_key {
> -	RISCV_ISA_EXT_KEY_FPU,		/* For 'F' and 'D' */
> -	RISCV_ISA_EXT_KEY_ZIHINTPAUSE,
> -	RISCV_ISA_EXT_KEY_SVINVAL,
> -	RISCV_ISA_EXT_KEY_MAX,
> -};
> -
>  struct riscv_isa_ext_data {
>  	/* Name of the extension displayed to userspace via /proc/cpuinfo */
>  	char uprop[RISCV_ISA_EXT_NAME_LEN_MAX];
> @@ -79,24 +67,6 @@ struct riscv_isa_ext_data {
>  	unsigned int isa_ext_id;
>  };
> =20
> -extern struct static_key_false riscv_isa_ext_keys[RISCV_ISA_EXT_KEY_MAX];
> -
> -static __always_inline int riscv_isa_ext2key(int num)
> -{
> -	switch (num) {
> -	case RISCV_ISA_EXT_f:
> -		return RISCV_ISA_EXT_KEY_FPU;
> -	case RISCV_ISA_EXT_d:
> -		return RISCV_ISA_EXT_KEY_FPU;
> -	case RISCV_ISA_EXT_ZIHINTPAUSE:
> -		return RISCV_ISA_EXT_KEY_ZIHINTPAUSE;
> -	case RISCV_ISA_EXT_SVINVAL:
> -		return RISCV_ISA_EXT_KEY_SVINVAL;
> -	default:
> -		return -EINVAL;
> -	}
> -}
> -
>  static __always_inline bool
>  riscv_has_extension_likely(const unsigned long ext)
>  {
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeatur=
e.c
> index adeac90b1d8e..3240a2915bf1 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -28,9 +28,6 @@ unsigned long elf_hwcap __read_mostly;
>  /* Host ISA bitmap */
>  static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
> =20
> -DEFINE_STATIC_KEY_ARRAY_FALSE(riscv_isa_ext_keys, RISCV_ISA_EXT_KEY_MAX);
> -EXPORT_SYMBOL(riscv_isa_ext_keys);
> -
>  /**
>   * riscv_isa_extension_base() - Get base extension word
>   *
> @@ -243,12 +240,6 @@ void __init riscv_fill_hwcap(void)
>  		if (elf_hwcap & BIT_MASK(i))
>  			print_str[j++] =3D (char)('a' + i);
>  	pr_info("riscv: ELF capabilities %s\n", print_str);
> -
> -	for_each_set_bit(i, riscv_isa, RISCV_ISA_EXT_MAX) {
> -		j =3D riscv_isa_ext2key(i);
> -		if (j >=3D 0)
> -			static_branch_enable(&riscv_isa_ext_keys[j]);
> -	}
>  }
> =20
>  #ifdef CONFIG_RISCV_ALTERNATIVE
> --=20
> 2.37.2
>=20

--X6tcYWkrEqthglcL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY4+/TAAKCRB4tDGHoIJi
0hI3AQCqj2tIrACOrGzynokG2RuMrrgWBEZybArbnX4L2Pe92gEAlBwKkfA8OArZ
tlTBLAt1k8b8ouzqGGFaJd9xQY4ltQ4=
=IvYj
-----END PGP SIGNATURE-----

--X6tcYWkrEqthglcL--


--===============2528559480635961135==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2528559480635961135==--

