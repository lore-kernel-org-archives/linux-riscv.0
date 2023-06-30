Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D8E1EB64D7
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jun 2023 19:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=29rBxAgGT4NN+Lkdqhn40Y7mqGMfwlWcQM25VpiLlWs=; b=dEBupA3M0DZYptXUWD5b6jWCmG
	reejM8s12BbFBvye/syFYEIfFFmOVkx/Z03ykGEaeFeNFPwWT97dKEP/bl+MxUS+Vpk7VVkNpjZV+
	ZlxIf0frrmu5JMXl25nme0RgKxgqNRsqFZ6h1AmFepLc9Mbwv63sI3qBc+0dPQegrUOKKV9trvsJy
	mwQwVdddpnnssWgm3Teyi+FWdMhrhuT7k2eYKoOdgzDJ8Z92RGiVXtGOJafWdsKWm2HwsX1PzAyQu
	9SHK1YWJ9rGNBIO7R9/pMDVXnyJ083G7gOo3yiujWNs0t6D7tkT9IkksTk3DNXOqZQxlE5KsBh2zT
	Jtk9HrDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFJOz-004NQh-04;
	Fri, 30 Jun 2023 19:03:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFJOw-004NQG-0a
	for linux-riscv@lists.infradead.org;
	Fri, 30 Jun 2023 19:03:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A031E617E9;
	Fri, 30 Jun 2023 19:03:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06AEBC433C0;
	Fri, 30 Jun 2023 19:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688151805;
	bh=V5IBn/evDQRFoADoP9GjVWUyd4RyxJcnLBcMQx5mzo0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oGWh90/19eaYQN9pgIkTZCQCl4pcbTwwaFzTnSoQo6bNF6+4kY10d9OdV08B2IAYX
	 QjO9BwlyNzzHvkEnddAZJO8mIrCDIBMvmjz+dXRyrr8DLorU0BmMnf9ksTQtkQEp+L
	 t8AKrR+CWrmeURGwKrDdlZRyER7vKOudccklPMvh2GGVSA9E00A7u/ChwJDZwBye68
	 BYzbBWOKqz3I432VFzWmihSrNqPxYieKRwFkV6qTN9++NUwsfIRIeYg9IiocaX3BPR
	 Q+Gcrdg8tEVY2zhI9QR6wxYVmTGU2pmwGMi914tq1+z6M7NsmTttPAi2X/OZM8jUyd
	 rBR2XqCdaMD7g==
Date: Fri, 30 Jun 2023 20:03:20 +0100
From: Conor Dooley <conor@kernel.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Kees Cook <keescook@chromium.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/6] riscv: Add CFI error handling
Message-ID: <20230630-utopia-drizzle-df8c14558696@spud>
References: <20230629234244.1752366-8-samitolvanen@google.com>
 <20230629234244.1752366-12-samitolvanen@google.com>
MIME-Version: 1.0
In-Reply-To: <20230629234244.1752366-12-samitolvanen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230630_120326_328677_2904E26D 
X-CRM114-Status: GOOD (  15.44  )
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
Content-Type: multipart/mixed; boundary="===============2222248895173322786=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2222248895173322786==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2hnuImplXuBy7/70"
Content-Disposition: inline


--2hnuImplXuBy7/70
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Sami,

On Thu, Jun 29, 2023 at 11:42:49PM +0000, Sami Tolvanen wrote:

> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index b54a830eb5c6..20a40927175e 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -44,6 +44,7 @@ config RISCV
>  	select ARCH_SUPPORTS_DEBUG_PAGEALLOC if MMU
>  	select ARCH_SUPPORTS_HUGETLBFS if MMU
>  	select ARCH_SUPPORTS_PAGE_TABLE_CHECK if MMU
> +	select ARCH_USES_CFI_TRAPS if CFI_CLANG

Could you please add new entries in alphanumerical order?

>  	select ARCH_USE_MEMTEST
>  	select ARCH_USE_QUEUED_RWLOCKS
>  	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU

> diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
> index 8d5c84f2d5ef..45bc485fcf3f 100644
> --- a/arch/riscv/include/asm/insn.h
> +++ b/arch/riscv/include/asm/insn.h
> @@ -63,6 +63,7 @@
>  #define RVG_RS1_OPOFF		15
>  #define RVG_RS2_OPOFF		20
>  #define RVG_RD_OPOFF		7
> +#define RVG_RS1_MASK		GENMASK(4, 0)
>  #define RVG_RD_MASK		GENMASK(4, 0)
> =20
>  /* The bit field of immediate value in RVC J instruction */
> @@ -129,6 +130,7 @@
>  #define RVC_C2_RS1_OPOFF	7
>  #define RVC_C2_RS2_OPOFF	2
>  #define RVC_C2_RD_OPOFF		7
> +#define RVC_C2_RS1_MASK		GENMASK(4, 0)
> =20
>  /* parts of opcode for RVG*/
>  #define RVG_OPCODE_FENCE	0x0f
> @@ -258,6 +260,10 @@ static __always_inline bool riscv_insn_is_branch(u32=
 code)
>  #define RV_X(X, s, mask)  (((X) >> (s)) & (mask))
>  #define RVC_X(X, s, mask) RV_X(X, s, mask)
> =20
> +#define RV_EXTRACT_RS1_REG(x) \
> +	({typeof(x) x_ =3D (x); \
> +	(RV_X(x_, RVG_RS1_OPOFF, RVG_RS1_MASK)); })
> +
>  #define RV_EXTRACT_RD_REG(x) \
>  	({typeof(x) x_ =3D (x); \
>  	(RV_X(x_, RVG_RD_OPOFF, RVG_RD_MASK)); })
> @@ -285,6 +291,10 @@ static __always_inline bool riscv_insn_is_branch(u32=
 code)
>  	(RV_X(x_, RV_B_IMM_11_OPOFF, RV_B_IMM_11_MASK) << RV_B_IMM_11_OFF) | \
>  	(RV_IMM_SIGN(x_) << RV_B_IMM_SIGN_OFF); })
> =20
> +#define RVC_EXTRACT_C2_RS1_REG(x) \
> +	({typeof(x) x_ =3D (x); \
> +	(RV_X(x_, RVC_C2_RS1_OPOFF, RVC_C2_RS1_MASK)); })
> +
>  #define RVC_EXTRACT_JTYPE_IMM(x) \
>  	({typeof(x) x_ =3D (x); \
>  	(RVC_X(x_, RVC_J_IMM_3_1_OPOFF, RVC_J_IMM_3_1_MASK) << RVC_J_IMM_3_1_OF=
F) | \

I was surprised that we didn't have these bits before, had to go
looking. Think the optprobes series had handrolled copies of these,
which is probably the source of my surprise.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com> # ISA bits

--2hnuImplXuBy7/70
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJ8m+AAKCRB4tDGHoIJi
0jBUAP0UMMzoYNXY5nsJHuteXP1BsQTrz11CKX9PQUFp3nlqBgEA6PNVMrlF90jy
yn449Glx4Y4AQdasyKf/P30AlWM9hgo=
=Vt5W
-----END PGP SIGNATURE-----

--2hnuImplXuBy7/70--


--===============2222248895173322786==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2222248895173322786==--

