Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45737C2BD09
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jul 2024 12:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T3Fph7ROlDtCaUItV6Drlx25e3y9YUOdT29kfsKWZvA=; b=N2lWzuc7An9kNg0T8IKwMarELW
	dE+z07irOT4NZ918M+Rs4s6M3r43fWpEkRjwEFsAcKqoQlnZyTyvNXWHdPvHTmuojgCfyMLcbVfvy
	BlSBsPYdFoGQCgEnN/hYOMOM9Qa+mz7vfu/I00xuDsf1eJNjHB/ojbZjvOP+MV33mbHVNGxNK3jUy
	/fJT7gZJAJ3n7NPZhsLgcWb7PwCDzHIbSHnJXPaCn520pszapNRnrAzuWbybmjOySF68jydDEDOA7
	8MuHOX1M+Lya4QeitYDpUJpfhiwc9+TZgDBYd0Bm6+dsVhm5Ma5XVHXoJgzD2/iBpCKSop25nOWlv
	fJDTk7TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOGHn-00000003H0D-0go1;
	Mon, 01 Jul 2024 12:37:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOG6O-00000003B4O-2ATf
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jul 2024 12:25:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A09DC612A8;
	Mon,  1 Jul 2024 12:25:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F02EC2BD10;
	Mon,  1 Jul 2024 12:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719836747;
	bh=qde1oJVpemXAs9VLKdKSyfrUTKpxHHBTcoNVyrzgcFs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZGzDkZkYkMctQkF16w4/cFgGieXThI1XLKOeF8wrtDw/vdborkn5Od7PGrbPXP9MQ
	 8dorpJLPaSHD2FbdkGEUHZvRfKKLw44E/nZYdVunGu2+XyQdyeOP+kN80mzwni8c0Q
	 XY3/O/qBq1fnVRngWTGHfISUUUKgXy6l8kg+S0MknDYFj3FDPtztVMSNGfnaphXEs7
	 ZDDqgQVw+V+3LdGxYVvyKyYNEoo73iQGtMhLUV5yz2UgHYEWYjQHNqDIOlWWOPMv61
	 tDs8SQEUbb1H2x3BjKSR97RiyNdPqRI3Yv7/kCJC+7bujOjjebCUc46QPQ+5Piv5jy
	 5zY9I3NYcdlvQ==
Date: Mon, 1 Jul 2024 13:25:41 +0100
From: Conor Dooley <conor@kernel.org>
To: Yixun Lan <dlan@gentoo.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org, Inochi Amaoto <inochiama@outlook.com>,
	Meng Zhang <zhangmeng.kevin@spacemit.com>,
	Yangyu Chen <cyy@cyyself.name>
Subject: Re: [PATCH v2 07/10] riscv: add SpacemiT SOC family Kconfig support
Message-ID: <20240701-brilliant-accuracy-9bc4effff9e1@spud>
References: <20240627-k1-01-basic-dt-v2-0-cc06c7555f07@gentoo.org>
 <20240627-k1-01-basic-dt-v2-7-cc06c7555f07@gentoo.org>
MIME-Version: 1.0
In-Reply-To: <20240627-k1-01-basic-dt-v2-7-cc06c7555f07@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_052548_644234_03352411 
X-CRM114-Status: GOOD (  15.82  )
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
Content-Type: multipart/mixed; boundary="===============3281912292100939939=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3281912292100939939==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="12R8+aDawiuRLv5y"
Content-Disposition: inline


--12R8+aDawiuRLv5y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 27, 2024 at 03:31:21PM +0000, Yixun Lan wrote:
> From: Yangyu Chen <cyy@cyyself.name>
>=20
> The first SoC in the SpacemiT series is K1, which contains 8 RISC-V
> cores with RISC-V Vector v1.0 support.
>=20
> Link: https://www.spacemit.com/en/spacemit-key-stone-2/
>=20

Remove the blank line please.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> Signed-off-by: Yangyu Chen <cyy@cyyself.name>
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>  arch/riscv/Kconfig.socs | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> index f51bb24bc84c6..1916cf7ba450e 100644
> --- a/arch/riscv/Kconfig.socs
> +++ b/arch/riscv/Kconfig.socs
> @@ -24,6 +24,11 @@ config ARCH_SOPHGO
>  	help
>  	  This enables support for Sophgo SoC platform hardware.
> =20
> +config ARCH_SPACEMIT
> +	bool "SpacemiT SoCs"
> +	help
> +	  This enables support for SpacemiT SoC platform hardware.
> +
>  config ARCH_STARFIVE
>  	def_bool SOC_STARFIVE
> =20
>=20
> --=20
> 2.45.2
>=20

--12R8+aDawiuRLv5y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZoKgRQAKCRB4tDGHoIJi
0p9iAQC6whE/bHeDyJ/S98q/OVqAyxeKWcEecg7ABkELD8ToKQD+Ocn7yyKVtHz5
poXOBPvWSuMmvDEKjND0F5EvN8pviwA=
=bdgu
-----END PGP SIGNATURE-----

--12R8+aDawiuRLv5y--


--===============3281912292100939939==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3281912292100939939==--

