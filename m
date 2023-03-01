Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14AE9C64ED6
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Mar 2023 17:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pjYV4qeJE1mIq0e+jHQ/W6x5pDcsVPNF6ljP2xAKt6s=; b=Mh/OTB6mkcVFiLLLG+0jhadFyZ
	E3X1HGW4T3aeAPnTHRognzNWGWslxlq8MfH03JpglrOM3Zz7QV2MDoDnNf52CyDEgdsQ9vGfZE5p5
	EmBlDnkg3n8UjKnoIOr8KjdHN/UC3OfTn9pPRLAP+iUhxA90IU1cW3z/gH0e7skx3OAM7rjjeo6QV
	7RTLg7bCtDqQEPQ0Eg2vhGBsVvOQRh6tfCJ7ZX+h3+P699XH1N1zzjWrc5rDciDGZUUJL7YaVAJ2W
	NVHPF8s/u9IlKAcklYBpziGPPoBY9LrO5wwC5xSvNV1TjJN6er6sDA8GJ/MyHns4Ey5Ed/nXV6DUY
	WIAs7CGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXQhU-00H2OF-Ab; Wed, 01 Mar 2023 17:57:12 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXQhR-00H2Ko-AE; Wed, 01 Mar 2023 17:57:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 94508B810AB;
	Wed,  1 Mar 2023 17:57:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11C81C433D2;
	Wed,  1 Mar 2023 17:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677693422;
	bh=GlG9WTRvFOhd1/rVEqTp3kzsLKTNiR+U47FXnoFLqAg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UdIeclJWPodc2tetrm+Tv8ed3QOvi/LDxZ1tRYO0ie9yS0IxLS6VQShm8h822ItBx
	 SViUO5c9N39gpN40F4l0LIHJPElpZkibrb3RddBG/KxJA47qKEyBEZQY45UFMXb/qW
	 lnWltCI6n63ksXMP27OM1ZPOnm8FK9qFiI1ZtLs+QG4SgnCP2T5FVp+7WG9nZR2Gdn
	 wOj2Mpg/+TKUhgS03LqEmJAYXtON+PByco53c2kDeTpCqAQ3EAebG2XnI2lxT+U1+B
	 aFjbyBw+cCzKfhsGgzYrI/PNuQa8TK6qu4uUbiLgfgNmr1Akjb/ZK//YCRA2yJsrSk
	 +Adm+OnPBpx+g==
Date: Wed, 1 Mar 2023 17:56:56 +0000
From: Conor Dooley <conor@kernel.org>
To: Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	anup@brainfault.org, atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
	vineetg@rivosinc.com, greentime.hu@sifive.com,
	guoren@linux.alibaba.com, Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Vincent Chen <vincent.chen@sifive.com>, Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Bresticker <abrestic@rivosinc.com>
Subject: Re: [PATCH -next v14 12/19] riscv: signal: check fp-reserved words
 unconditionally
Message-ID: <Y/+R6NfBHSGGI3MX@spud>
References: <20230224170118.16766-1-andy.chiu@sifive.com>
 <20230224170118.16766-13-andy.chiu@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20230224170118.16766-13-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_095709_686078_2DB2215F 
X-CRM114-Status: GOOD (  24.09  )
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
Content-Type: multipart/mixed; boundary="===============3440825212192342542=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3440825212192342542==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nhH51729ejvc3Gu0"
Content-Disposition: inline


--nhH51729ejvc3Gu0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 24, 2023 at 05:01:11PM +0000, Andy Chiu wrote:
> In order to let kernel/user locate and identify an extension context on
> the existing sigframe, we are going to utilize reserved space of fp and
> encode the information there. And since the sigcontext has already
> preserved a space for fp context w or w/o CONFIG_FPU, we move those
> reserved words checking/setting routine back into generic code.
>=20
> This commit also undone an additional logical change carried by the
> refactor commit 007f5c3589578
> ("Refactor FPU code in signal setup/return procedures"). Originally we
> did not restore fp context if restoring of gpr have failed. And it was
> fine on the other side. In such way the kernel could keep the regfiles
> intact, and potentially react at the failing point of restore.
>=20
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> ---

> @@ -90,11 +66,29 @@ static long restore_sigcontext(struct pt_regs *regs,
>  	struct sigcontext __user *sc)
>  {
>  	long err;
> +	size_t i;
> +
>  	/* sc_regs is structured the same as the start of pt_regs */
>  	err =3D __copy_from_user(regs, &sc->sc_regs, sizeof(sc->sc_regs));
> +	if (unlikely(err))
> +		return err;
>  	/* Restore the floating-point state. */

Please preserve the newline after return from where you moved this from.

> -	if (has_fpu())
> -		err |=3D restore_fp_state(regs, &sc->sc_fpregs);
> +	if (has_fpu()) {
> +		err =3D restore_fp_state(regs, &sc->sc_fpregs);
> +		if (unlikely(err))
> +			return err;
> +	}

> @@ -145,11 +139,16 @@ static long setup_sigcontext(struct rt_sigframe __u=
ser *frame,
>  {
>  	struct sigcontext __user *sc =3D &frame->uc.uc_mcontext;
>  	long err;
> +	size_t i;
> +
>  	/* sc_regs is structured the same as the start of pt_regs */
>  	err =3D __copy_to_user(&sc->sc_regs, regs, sizeof(sc->sc_regs));
>  	/* Save the floating-point state. */
>  	if (has_fpu())
>  		err |=3D save_fp_state(regs, &sc->sc_fpregs);
> +	/* We support no other extension state at this time. */
> +	for (i =3D 0; i < ARRAY_SIZE(sc->sc_fpregs.q.reserved); i++)
> +		err |=3D __put_user(0, &sc->sc_fpregs.q.reserved[i]);
>  	return err;

And one before the return here would not go amiss. Those are nitpick
bits though, so:
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--nhH51729ejvc3Gu0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/+R6AAKCRB4tDGHoIJi
0lq/AP428d0SH5OMhQupf5wh4N6S5tKO9jWU6/2xyschVhjytAD9GcFjI+Ismiko
4y2zOe36Bd7jHxEgMFDw5wtPcx87DAU=
=yvDD
-----END PGP SIGNATURE-----

--nhH51729ejvc3Gu0--


--===============3440825212192342542==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3440825212192342542==--

