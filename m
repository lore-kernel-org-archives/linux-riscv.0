Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D50F5C54E58
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2024 12:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2wZL6GWgIjoAkqUGIJxjnuLLLvvptCtyuEQX0OXj9bQ=; b=jTZNTYVGnucoX5HqJCJtFDmUsj
	MOMpXlin264gaHEsuDYsRjg2T3kPFq2sApPdDHwFeYHfF+4nI7yR75rnJ7HPAq3vW7h4G8VDS9dbO
	vJb77SbUC2HWczJpfK0zndS9Dc3Oztx/HiO6/84YA+yUs6is6GuDWIt0iTAJQBXQ5RPeDI4WhmQO+
	Ut05d/h2M7Q4FO6SE1V5QDlQMoYxIIQ5n8xptVh1zwclxjB+gvGtA6dbuEy8nM8xJpbCdFnvVVmPP
	OlHOw+T9DxS1Ie6l4slHR4ULfWZVofqM6cESfReQTxDupOJ2hdRONqW8dkJZUi7VaHMznqyx1dzH8
	TUtM1Qtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk1iu-00000005qY0-0Sy5;
	Tue, 12 Mar 2024 12:59:16 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk1ip-00000005qWp-0TNS
	for linux-riscv@lists.infradead.org;
	Tue, 12 Mar 2024 12:59:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 80F04CE1717;
	Tue, 12 Mar 2024 12:59:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD466C43394;
	Tue, 12 Mar 2024 12:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710248347;
	bh=2f5EMrw4hsUSYV8hkLA/ihi1maSB5fZq6ZVjgNLbtWU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ghPHo0rkbpZXsrzeBwSxgskt2xwciuQ2mV7kuAD4PVgjX1rqIS9Nbs8w7kypCYtC0
	 oW/QGBcnUBVcfpWGfatseZwa1IyawkMRZCLZtT5q1pL814NTwMEjwmbFdKgkUtf5th
	 d1cWXN1twqKspLMiWHixiOOc8/WSrLQO3Tv6zycBWFcCKTe00ioYpkcmaWxCHBe0uP
	 ZkId6E7WbHdMEkFZCOHJkAkey9Tjp8tmZaQ1HNCNErizMawKcELm6nlV4fmUdSzOt2
	 tU5T9AUsZs++hqYU/SgARFOX+oXKlWK3gVsVPb8ylwPDcOe88iZ8EzrGdOACZbz8FK
	 JTbl70UTEkvxQ==
Date: Tue, 12 Mar 2024 12:59:01 +0000
From: Conor Dooley <conor@kernel.org>
To: Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	Anup Patel <apatel@ventanamicro.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	guoren@linux.alibaba.com, Heiko Stuebner <heiko@sntech.de>,
	Yang Li <yang.lee@linux.alibaba.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Nam Cao <namcaov@gmail.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Vincent Chen <vincent.chen@sifive.com>, bjorn@kernel.org,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Evan Green <evan@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Frederik Haxel <haxel@fzi.de>, greentime.hu@sifive.com,
	Sami Tolvanen <samitolvanen@google.com>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: Re: [v1, 2/6] riscv: smp: fail booting up smp if inconsistent vlen
 is detected
Message-ID: <20240312-hardened-filled-01e6cafc9c5b@spud>
References: <20240312123627.9285-1-andy.chiu@sifive.com>
 <20240312123627.9285-3-andy.chiu@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20240312123627.9285-3-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_055912_642832_2DB5AE47 
X-CRM114-Status: GOOD (  20.70  )
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
Content-Type: multipart/mixed; boundary="===============3168049609441147043=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3168049609441147043==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tuBAUai+mcf9b+Q8"
Content-Disposition: inline


--tuBAUai+mcf9b+Q8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 12, 2024 at 08:36:23PM +0800, Andy Chiu wrote:
> Currently we only support Vector for SMP platforms, that is, all SMP
> cores have the same vlenb. If we happen to detect a mismatching vlen, it
> is better to just fail bootting it up to prevent further race/scheduling
> issues.
>=20
> Fixes: 7017858eb2d7 ("riscv: Introduce riscv_v_vsize to record size of Ve=
ctor context")
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>

Reported-by: Conor Dooley <conor.dooley@microchip.com>
Closes: https://lore.kernel.org/linux-riscv/20240228-vicinity-cornstalk-4b8=
eb5fe5730@spud/
cc: stable@vger.kernel.org

I actually thought I had sent a patch for this, but I don't seem to
have. I did write one, so I guess I just did not send it.

> ---
>  arch/riscv/kernel/head.S    | 14 +++++++-------
>  arch/riscv/kernel/smpboot.c | 14 +++++++++-----
>  2 files changed, 16 insertions(+), 12 deletions(-)
>=20
> diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
> index 4236a69c35cb..a158fa9f2656 100644
> --- a/arch/riscv/kernel/head.S
> +++ b/arch/riscv/kernel/head.S
> @@ -165,9 +165,15 @@ secondary_start_sbi:
>  #endif
>  	call .Lsetup_trap_vector
>  	scs_load_current
> -	tail smp_callin
> +	call smp_callin
>  #endif /* CONFIG_SMP */
> =20
> +.align 2
> +.Lsecondary_park:
> +	/* We lack SMP support or have too many harts, so park this hart */
> +	wfi
> +	j .Lsecondary_park
> +
>  .align 2
>  .Lsetup_trap_vector:
>  	/* Set trap vector to exception handler */
> @@ -181,12 +187,6 @@ secondary_start_sbi:
>  	csrw CSR_SCRATCH, zero
>  	ret
> =20
> -.align 2
> -.Lsecondary_park:
> -	/* We lack SMP support or have too many harts, so park this hart */
> -	wfi
> -	j .Lsecondary_park
> -
>  SYM_CODE_END(_start)
> =20
>  SYM_CODE_START(_start_kernel)

Why does this change? There's no mention of why in the commit message.

Thanks,
Conor.

--tuBAUai+mcf9b+Q8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZfBRlQAKCRB4tDGHoIJi
0nQSAP9819ARUMIKYYrfBCWXqCLfU2cQWBxwN+sXFT/OFpoF4gEAsJ6yGiY19GOX
nwB1ezGYiz8Y3RtbD/vVUa/4zh8bLQY=
=NxgH
-----END PGP SIGNATURE-----

--tuBAUai+mcf9b+Q8--


--===============3168049609441147043==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3168049609441147043==--

