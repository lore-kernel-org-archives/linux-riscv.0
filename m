Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95B10C7619A
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Apr 2023 19:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UhJzKhoIBkLPlIGmB9MzGxoKzgunmRSeCvUidU3lLIk=; b=Yr5Nwcs4LEoKMpGV/2DBdsgx8o
	ZgdQfe47dy2/CGGmy9x2PmAZb4ycnBl74SZWFCHPDrUQqCH7SpUsI5NnRTr4yi9W6zNyA68TZo/NJ
	+UGGPCT5k9liCbZEp1H7CAnD3orA2so0lwcXpqARoUb0vEQkgD6n8iCfClMntA4x7aVa+jiDUIDKT
	dAoHPvZV+GjQ+GZnsupKfVYxGGtmTW6RPhvlwII+JEKIr/YndzIelBds+FDCuDT08PxmGKE1Dz490
	/vqGCYe1k6knRI1dJk0s+lHq/E+yW5g//eLf9x08Zq3dtQoI5ISTmJH0syUygOAo96vmDlC5ITzUO
	WrQ5WTxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1plEb2-00CkJ7-20;
	Sat, 08 Apr 2023 19:51:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1plEaz-00CkIj-2y
	for linux-riscv@lists.infradead.org;
	Sat, 08 Apr 2023 19:51:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EFEB560C11;
	Sat,  8 Apr 2023 19:51:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84CF8C433D2;
	Sat,  8 Apr 2023 19:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680983491;
	bh=Bv7RVz7LueImtQc92/Ups6SR1reILOhldXUlCRu0Dl8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MvseAwnXclykcbInWdK5TyXUTfnsHYNqbL8LKkoRuUna5/9br02U6AD+vbQeC0MNZ
	 +7DCO9voBewtLEtGi6wYG/u4LJfRnfjBoQG7YlVwZwatz0RQeGtF5YrWvoa5WuqFF+
	 NmWhlsYTUCi0wQQqQt9yseXN+r7ZdOWslTl64mg63P1fekgsIG+Z92KQ5tibXYr6ww
	 8SfYXXMerajNeJ96pGywnpM/dXkM9vWfQeVGk4khfaJirO0V8fCU9sFBkcSWrTMFC8
	 Wj9QbOlAvNJiMd3YiNuR0mCPLALWuQg0OKvwY9CUKaOv+3J3MjCPeEkafqtOPpGl5k
	 AmgG2LmVGFmUQ==
Date: Sat, 8 Apr 2023 20:51:28 +0100
From: Conor Dooley <conor@kernel.org>
To: Mathis Salmen <mathis.salmen@matsal.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com
Subject: Re: [PATCH v2] riscv: add icache flush for nommu sigreturn trampoline
Message-ID: <20230408-deluxe-dwelled-1054d2764ae8@spud>
References: <20230406101130.82304-1-mathis.salmen@matsal.de>
MIME-Version: 1.0
In-Reply-To: <20230406101130.82304-1-mathis.salmen@matsal.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230408_125134_059812_A5CED83D 
X-CRM114-Status: GOOD (  22.76  )
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
Content-Type: multipart/mixed; boundary="===============1467856024394942534=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1467856024394942534==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zS1oIQ0IauSarjPf"
Content-Disposition: inline


--zS1oIQ0IauSarjPf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Mathis,

On Thu, Apr 06, 2023 at 12:11:31PM +0200, Mathis Salmen wrote:
> In a NOMMU kernel, sigreturn trampolines are generated on the user
> stack by setup_rt_frame. Currently, these trampolines are not instruction
> fenced, thus their visibility to ifetch is not guaranteed.
>=20
> This patch adds a flush_icache_range in setup_rt_frame to fix this
> problem.
>=20

I assume that this is then
Fixes: 6bd33e1ece52 ("riscv: add nommu support")
yeah?

Cheers,
Conor.

> Signed-off-by: Mathis Salmen <mathis.salmen@matsal.de>
> ---
> V1 -> V2: Added local variable for readability.
>=20
>  arch/riscv/kernel/signal.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
> index bfb2afa41..dee66c929 100644
> --- a/arch/riscv/kernel/signal.c
> +++ b/arch/riscv/kernel/signal.c
> @@ -19,6 +19,7 @@
>  #include <asm/signal32.h>
>  #include <asm/switch_to.h>
>  #include <asm/csr.h>
> +#include <asm/cacheflush.h>
> =20
>  extern u32 __user_rt_sigreturn[2];
> =20
> @@ -181,6 +182,7 @@ static int setup_rt_frame(struct ksignal *ksig, sigse=
t_t *set,
>  {
>  	struct rt_sigframe __user *frame;
>  	long err =3D 0;
> +	unsigned long __maybe_unused addr;
> =20
>  	frame =3D get_sigframe(ksig, regs, sizeof(*frame));
>  	if (!access_ok(frame, sizeof(*frame)))
> @@ -209,7 +211,12 @@ static int setup_rt_frame(struct ksignal *ksig, sigs=
et_t *set,
>  	if (copy_to_user(&frame->sigreturn_code, __user_rt_sigreturn,
>  			 sizeof(frame->sigreturn_code)))
>  		return -EFAULT;
> -	regs->ra =3D (unsigned long)&frame->sigreturn_code;
> +
> +	addr =3D (unsigned long)&frame->sigreturn_code;
> +	/* Make sure the two instructions are pushed to icache. */
> +	flush_icache_range(addr, addr + sizeof(frame->sigreturn_code));
> +
> +	regs->ra =3D addr;
>  #endif /* CONFIG_MMU */
> =20
>  	/*
> --=20
> 2.40.0
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--zS1oIQ0IauSarjPf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZDHFoQAKCRB4tDGHoIJi
0upPAQC9MSvkOrrS1Gw5Jxgo1jpp2diu0ugW1fEK3irCR6jemAD/f8K5OvNtFKne
RwjjI+i++8OS4gUWzfewdUHkch97TQk=
=Guw3
-----END PGP SIGNATURE-----

--zS1oIQ0IauSarjPf--


--===============1467856024394942534==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1467856024394942534==--

