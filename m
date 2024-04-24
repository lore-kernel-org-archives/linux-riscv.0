Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C83A9C4345F
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2024 11:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HdpdiW7ICgqhxUYmbBsyaDoER+8abm6x56naaBwbmk4=; b=VwCJwFJmjhRQvvBJ2TVRaSqeOE
	Rcu2T5B8xn+0sW5u93yBLrlVG6vJOwIcWuE5TckmeNvSYdSAMV2WY4JF9iBG6pm9yf6X+Xo0s5s4b
	FdpCdbsMkZLEqCrShvLbNjnAqeblQ6LIxis1JRARCzddqnaZtfEriqY9zggT4qCrN54022Oy3YTRB
	6cOqs8z+4nZVGdwq2W5PEg0xwuoJ42hL7wt3XwsbeufgqmMODtdEmRcCIkgbYoFuKgLnDwoWcy9BW
	Y+A/zlo5QGW6SdXRYr5e3pie6+ribrKLjuObAAtGm0/M0vzLc7OfFfJXGRqo0pif8eG4wMBHD3m/N
	HZLgocTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzb77-00000003xJx-0Aqt;
	Wed, 24 Apr 2024 11:48:37 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzb73-00000003xJ9-2ZFz
	for linux-riscv@lists.infradead.org;
	Wed, 24 Apr 2024 11:48:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E18C8CE13C5;
	Wed, 24 Apr 2024 11:48:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7E7AC113CE;
	Wed, 24 Apr 2024 11:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713959311;
	bh=PO7HEtXuGC+TI0QunfomdbHElXxBffRMMrNGD/K4vzc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nPZArd9ZAY5oMK6RVkPMKw+v+1bfHu4kyQ3uM7msjAj9edGK2JFwsSXLvIjClb3Df
	 j7LvoLkaISGN329wmk6j/7FIPqf/eV17x3lWfhbL3GtdHeu4m0jcGV0+yVmEpv/LnT
	 aB0TwULU2N80V6eQ7AfXDWq2f6UlpZ/278kQ2aJP6my6hFcWcy9cmZDCAp+wTUKNHb
	 Yc/mZw/0JrnKVDM5lop926ZmG1WEwnjfJVKTOpLlPQIwtZQ9h4HnRaBYEAzkejj77k
	 Z7vVAS6ZOOyU3SjFlBn5qn1Cwy5Rm7u4ZrCeAomhwJWbC702c0Ns8niLRN5qoeAgFZ
	 xs+iasmtvTllg==
Date: Wed, 24 Apr 2024 12:48:26 +0100
From: Conor Dooley <conor@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atishp@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH riscv/for-next] riscv: cacheflush: Fix warning when
 compiled without CONFIG_SMP
Message-ID: <20240424-aspect-swinger-50d47c3d0a72@spud>
References: <20240417-fix_nosmp_icache-v1-1-921a3c07d4ce@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240417-fix_nosmp_icache-v1-1-921a3c07d4ce@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_044833_883455_545DEFB5 
X-CRM114-Status: GOOD (  18.22  )
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
Content-Type: multipart/mixed; boundary="===============0913461588426261857=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0913461588426261857==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NanvZTWuCzgHOaYO"
Content-Disposition: inline


--NanvZTWuCzgHOaYO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 17, 2024 at 04:49:48PM -0700, Charlie Jenkins wrote:
> GCC tries to compile the static function set_icache_stale_mask() even
> when there are no callers. Guard the function with #ifdef CONFIG_SMP.
>=20
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> Fixes: 383289e4b071 ("riscv: Include riscv_set_icache_flush_ctx prctl")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202404180621.qG7A9Tk0-lkp@i=
ntel.com/
> ---
> Since this is just in for-next Palmer do you want to squash this onto the
> commit that introduced this 383289e4b071?

It's not even in riscv/for-next as far as I can tell, and looks like the
squash into the staging copy has already happened. I'm gonna drop this
=66rom patchwork.

> ---
>  arch/riscv/mm/cacheflush.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
> index 3b03534e57b4..3ef666c7dfc7 100644
> --- a/arch/riscv/mm/cacheflush.c
> +++ b/arch/riscv/mm/cacheflush.c
> @@ -154,6 +154,7 @@ void __init riscv_init_cbo_blocksizes(void)
>  		riscv_cboz_block_size =3D cboz_block_size;
>  }
> =20
> +#ifdef CONFIG_SMP
>  static void set_icache_stale_mask(void)
>  {
>  	cpumask_t *mask;
> @@ -171,6 +172,7 @@ static void set_icache_stale_mask(void)
>  	cpumask_setall(mask);
>  	cpumask_assign_cpu(smp_processor_id(), mask, stale_cpu);
>  }
> +#endif
> =20
>  /**
>   * riscv_set_icache_flush_ctx() - Enable/disable icache flushing instruc=
tions in
>=20
> ---
> base-commit: a76716f0ec75b9e7ac62d30854d690044c857684
> change-id: 20240417-fix_nosmp_icache-0fc36aeafbe5
> --=20
> - Charlie
>=20
>=20

--NanvZTWuCzgHOaYO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZijxigAKCRB4tDGHoIJi
0iHSAQDMmKslb0ZNvdDMQXGxUh6Nh2yAwGICnXywnCtLSJvYBQEAh0pm2Q+fF4dA
9XYZPXj927z8xflePWNO47VSCEq9SA8=
=dZsw
-----END PGP SIGNATURE-----

--NanvZTWuCzgHOaYO--


--===============0913461588426261857==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0913461588426261857==--

