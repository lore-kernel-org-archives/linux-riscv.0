Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DF74C48BF6
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Mar 2024 19:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hd3hb+O6OlbYvyL09mSGekv+XEhhsidaNwdNVwJdPwc=; b=WbQPvQ+L7QRQWSCBX1pFKRqB7B
	3FD0fTctEUu8T90b9D4a6Ha0ND6HuHiJxs7yUe9yK/6LlpCPb4r+3pWC36nSRIGdtMh2l7Dg1/HKz
	8Rq3oCZ9D/XZ9RkwVXIk93bAe9Weh1Nl/1eTCxLlTkb0TAkTfmKjsUfoS+KSv6h2EpSWypO1bh7Bd
	w47KU96u1oy1jIfqb2M967iGm7hdFDay+vwi8mMFU/BKVtFpB3nqIEfLz6r3kx3c9+3g7tN/N1W3I
	REyoH2D9YiHMQkG3nzLZGPQH8xIdrEBFcKk4nPPeOYRFriyIUqEY45NjWLOgUMlSwQE9LqRRCEVJ6
	U/tP2edQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhDwW-0000000AR2A-1i2V;
	Mon, 04 Mar 2024 19:25:44 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhDwT-0000000AR1e-0KwP
	for linux-riscv@lists.infradead.org;
	Mon, 04 Mar 2024 19:25:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 79C9D60E9F;
	Mon,  4 Mar 2024 19:25:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49E3CC433F1;
	Mon,  4 Mar 2024 19:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709580339;
	bh=TQEI4fsDJ0e19ccZz539tCalZXKMnkbsWxcJRNdU3Og=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nDxjiYkftdBnZehm3S/nKGeBbfWTnaqhE6e3uOwnxNrq9za8z5TC48/MTo4fXtwFb
	 gn86mmJqM/tQvXZ5Uf0jPUd+5Zqbx42IdbGCFLR0PG2ClafRNNUUYwWLhiafGER0Id
	 4lLDpEkWIHMfD0Xtt/Vtsvn9DVPJUnhPqulpJ6KWGwGqmghhQEL60+tK6wNsqHrLVN
	 6sPgpRQRHShdWA904eWh2ig9+w8EuWLWuEDcMMsjXav/2wcy+dpgsDjIppMayQckt2
	 7kGvYMEGenl0PIflJwxLFYaWHn1H74bceAys/i3QXtabp+yAoipHB6aOCKJjTiZ7tC
	 +/ifj9vB+xI8w==
Date: Mon, 4 Mar 2024 19:25:33 +0000
From: Conor Dooley <conor@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrea Parri <andrea@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	Andrea Parri <parri.andrea@gmail.com>
Subject: Re: [PATCH v3 1/2] riscv: Remove superfluous smp_mb()
Message-ID: <20240304-aptly-surely-ab9ea7d82337@spud>
References: <20240229121056.203419-1-alexghiti@rivosinc.com>
 <20240229121056.203419-2-alexghiti@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240229121056.203419-2-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_112541_762193_69B1A118 
X-CRM114-Status: GOOD (  19.46  )
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
Content-Type: multipart/mixed; boundary="===============7920621534175723842=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7920621534175723842==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="73cKyHnDQwSzGFtc"
Content-Disposition: inline


--73cKyHnDQwSzGFtc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 29, 2024 at 01:10:55PM +0100, Alexandre Ghiti wrote:
> This memory barrier is not needed and not documented so simply remove
> it.

This looks like it should be patch 2 in the series, not patch 1, as it
is cleanup rather than a fix that needs backporting.

>=20
> Suggested-by: Andrea Parri <andrea@rivosinc.com>
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> Reviewed-by: Andrea Parri <parri.andrea@gmail.com>
> ---
>  arch/riscv/kernel/patch.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/arch/riscv/kernel/patch.c b/arch/riscv/kernel/patch.c
> index 37e87fdcf6a0..0b5c16dfe3f4 100644
> --- a/arch/riscv/kernel/patch.c
> +++ b/arch/riscv/kernel/patch.c
> @@ -239,7 +239,6 @@ static int patch_text_cb(void *data)
>  	} else {
>  		while (atomic_read(&patch->cpu_count) <=3D num_online_cpus())
>  			cpu_relax();
> -		smp_mb();
>  	}
> =20
>  	return ret;
> --=20
> 2.39.2
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--73cKyHnDQwSzGFtc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZeYgLQAKCRB4tDGHoIJi
0gaoAQCyP9yuVqUn4rjvYnIqJ1Xvj9PmeOgG/Al0kAgSlncR0gD9GGCx6whb1QsB
8vwe/vUWWh01dW6RJJpmg5c4rIRlvw0=
=uoct
-----END PGP SIGNATURE-----

--73cKyHnDQwSzGFtc--


--===============7920621534175723842==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7920621534175723842==--

