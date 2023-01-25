Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DB82C27C76
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jan 2023 21:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DGskeRCzozs5fjmaFtPC7cljO+xZsMQiV9UfnVgYR8g=; b=p3hhglLN0yQUgwqSwj7NubCyiO
	yCCwCdtt+/7Ytz74O0c/lMXM6hNb5nsxKxYyW3iluyEXiOGq9bOge5ZyytCNhbjK8q6HMwFpRYz3G
	Ar3hLH8gIKzGabnik+AOdyT7MBcnxpyDGRCaushF06EjmSF+TAk7fzJmGUkWtHypLYDgeOlWoIyCP
	Anx6SAV443LdTr0CExjoEKQ0wGUE/P21hnAoT2Adb4zjCdxBexvfTw+9OtMoxxFvm/IVpf2bLAo9G
	48coXfzfcJUkM/q4yALKMG4M2Lq1KJ8xwqNKbE9jKg1jvGWa7xM6o6rtUnnuhaFgBlKxXUlZHz5OJ
	XdrsL0OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKn7e-008paY-PU; Wed, 25 Jan 2023 21:15:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKn7b-008pZQ-5Q; Wed, 25 Jan 2023 21:15:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5071861630;
	Wed, 25 Jan 2023 21:15:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 996CEC433D2;
	Wed, 25 Jan 2023 21:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674681353;
	bh=uXCPpInlcVIhGM5Zbz3rpQ2I6qyXx+ffowFClSGgvpQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Dlj4wuBtyHd1FXSj2RR8DXwcISoRLlxVhEB4NhVzE6D6WXyrqO5OHLfNPT5T8ZMRT
	 7KjycTQ/YePTEDqGg3pB0OmjkNUzEi9HgHN76uThpgOGsucQxwJqvVmbJkBZUoZ/7W
	 dcZRzcHTCeGy7t4wYDUQ3FMRoBL2TPM5PZ59T39yrRUPSnFn/YqS7lyQ7eOAZjAC2h
	 2McR7ucoD+x7vPnVF/NqfFT3qbyrHakE5v4fbvgOX/VfTYfUg4hX2bAQH1QoVwMmLR
	 ONX/1Y1ByGWUhp2jcQradqtPeI75TOggiGcBCGSvVHJkJseLzsRZm8tQWgarWijlko
	 iKqUO+xOCYleQ==
Date: Wed, 25 Jan 2023 21:15:48 +0000
From: Conor Dooley <conor@kernel.org>
To: Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	anup@brainfault.org, atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
	vineetg@rivosinc.com, greentime.hu@sifive.com,
	guoren@linux.alibaba.com, Guo Ren <ren_guo@c-sky.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Vincent Chen <vincent.chen@sifive.com>,
	Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [PATCH -next v13 01/19] riscv: Rename __switch_to_aux -> fpu
Message-ID: <Y9GcBGx6UrcVcK6y@spud>
References: <20230125142056.18356-1-andy.chiu@sifive.com>
 <20230125142056.18356-2-andy.chiu@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20230125142056.18356-2-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_131555_315425_C9DC5205 
X-CRM114-Status: GOOD (  19.33  )
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
Content-Type: multipart/mixed; boundary="===============6027786119418099161=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6027786119418099161==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ppdQFH89KdaPB4Y+"
Content-Disposition: inline


--ppdQFH89KdaPB4Y+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 25, 2023 at 02:20:38PM +0000, Andy Chiu wrote:
> From: Guo Ren <ren_guo@c-sky.com>
>=20
> The name of __switch_to_aux is not clear and rename it with the
> determine function: __switch_to_fpu. Next we could add other regs'
> switch.
>=20
> Signed-off-by: Guo Ren <ren_guo@c-sky.com>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>

With your SoB added here:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  arch/riscv/include/asm/switch_to.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/=
switch_to.h
> index 11463489fec6..df1aa589b7fd 100644
> --- a/arch/riscv/include/asm/switch_to.h
> +++ b/arch/riscv/include/asm/switch_to.h
> @@ -46,7 +46,7 @@ static inline void fstate_restore(struct task_struct *t=
ask,
>  	}
>  }
> =20
> -static inline void __switch_to_aux(struct task_struct *prev,
> +static inline void __switch_to_fpu(struct task_struct *prev,
>  				   struct task_struct *next)
>  {
>  	struct pt_regs *regs;
> @@ -65,7 +65,7 @@ static __always_inline bool has_fpu(void)
>  static __always_inline bool has_fpu(void) { return false; }
>  #define fstate_save(task, regs) do { } while (0)
>  #define fstate_restore(task, regs) do { } while (0)
> -#define __switch_to_aux(__prev, __next) do { } while (0)
> +#define __switch_to_fpu(__prev, __next) do { } while (0)
>  #endif
> =20
>  extern struct task_struct *__switch_to(struct task_struct *,
> @@ -76,7 +76,7 @@ do {							\
>  	struct task_struct *__prev =3D (prev);		\
>  	struct task_struct *__next =3D (next);		\
>  	if (has_fpu())					\
> -		__switch_to_aux(__prev, __next);	\
> +		__switch_to_fpu(__prev, __next);	\
>  	((last) =3D __switch_to(__prev, __next));		\
>  } while (0)
> =20
> --=20
> 2.17.1
>=20

--ppdQFH89KdaPB4Y+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY9GcBAAKCRB4tDGHoIJi
0kfuAP49b/MqYdf+9eQn9ErWfLX+NZl9L1C8IpgUe++nDq/usQD/S0DmMADE72Ts
vbNd85Fvij4E8Q+ufJaRgoyyLffaXAE=
=WV4W
-----END PGP SIGNATURE-----

--ppdQFH89KdaPB4Y+--


--===============6027786119418099161==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6027786119418099161==--

