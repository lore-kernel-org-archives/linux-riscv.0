Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E994C61DA4
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Feb 2023 23:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HiDWjkg+iqy4VkPW/9hTszKZXYKWTt5q3k62sfQxwhQ=; b=0dtFUdY37T1b+27IxpBGP//9D0
	lkJ3cjg1xnGiQFFje+ihtbbxkQKixSY6PZ85K6Ob6FmTB1lO5wFjdSYaowJF6APjE7NyV8e+Uqulg
	45VeBF+6Wwagcb4/PGfz/YWeWECoEFok//VqBmwlaPBApXJ675MS3Bge/yXUI4jF/kfZNopJN0ATb
	jH6tzYT8PfnLbryn02i3EL2+7aWATUHaWQR4AES2di7BZ3F/TLtdlcqzgqeNk009S3rfDKVlUV/Hv
	pNpToDOGYnCtub8U2yZqQaHQ1r6VMH/7vQ9YWEUwKCJfxWw0LgDGfzEjvnrsJGHrXeB0f0ljB1Jl5
	aRxIdlZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVKkH-000ZPp-Vq; Thu, 23 Feb 2023 23:11:25 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVKkF-000ZOb-6A
	for linux-riscv@lists.infradead.org; Thu, 23 Feb 2023 23:11:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 59B15B81B3E;
	Thu, 23 Feb 2023 23:11:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EB48C433EF;
	Thu, 23 Feb 2023 23:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677193878;
	bh=9LAjIRQgMikzP7BdR2j1RRPU7w3H+e9VxO3sbEEVOHQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=loxD86y3Bxjex8dtA8Qsv+0Vdk8/jNLKIMnhcctp3RjTeV/7dEWk9dCjuKmnz3xQx
	 eB7BF5S65hZ4Fxt3bJqUJXekwaNCCaORdqXBljNYTX23P/ocKzGtZQYzQ25XVRwob4
	 XdqdKoIiI6ZtAcrTLHVS0ypfH2Ju3RiQK00UJNZRPriqbpuJYHW5yhFrPygxDdvUZK
	 Iv6TUUZBCn7JI579yd/ovV00mRHYVipBmTq20sGZI2yJGgFAxO9pcBhWSX3q485fX2
	 KqefGNNKXsC9O/jcULrIAB6vHteCVFYuGOyyJOse4JQ+OHTI1D9f4AsRGw+9hjHB9d
	 2AuwYzk3qRoOg==
Date: Thu, 23 Feb 2023 23:11:13 +0000
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, 'Jisheng Zhang ' <jszhang@kernel.org>,
	'Heiko Stuebner ' <heiko@sntech.de>,
	'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Conor Dooley ' <conor.dooley@microchip.com>,
	'Albert Ou ' <aou@eecs.berkeley.edu>
Subject: Re: [PATCH 1/5] riscv: Rename Kconfig.erratas to Kconfig.errata
Message-ID: <Y/fykfC24Djqy+XJ@spud>
References: <20230221185603.570882-1-ajones@ventanamicro.com>
 <20230221185603.570882-2-ajones@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230221185603.570882-2-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_151123_396944_7993966E 
X-CRM114-Status: GOOD (  19.06  )
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
Content-Type: multipart/mixed; boundary="===============2878533728578052093=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2878533728578052093==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gabfo4szo8K2lcZ+"
Content-Disposition: inline


--gabfo4szo8K2lcZ+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 21, 2023 at 07:55:59PM +0100, Andrew Jones wrote:
> Errata is already plural for erratum. Rename it to make the
> grammar gooder.

I've been wanting to do that for a while, but didn't have an excuse to
do it.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

>=20
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/Kconfig                             | 2 +-
>  arch/riscv/{Kconfig.erratas =3D> Kconfig.errata} | 0
>  2 files changed, 1 insertion(+), 1 deletion(-)
>  rename arch/riscv/{Kconfig.erratas =3D> Kconfig.errata} (100%)
>=20
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 6f52d3ec93c3..736f42f572aa 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -244,7 +244,7 @@ config AS_HAS_INSN
>  	def_bool $(as-instr,.insn r 51$(comma) 0$(comma) 0$(comma) t0$(comma) t=
0$(comma) zero)
> =20
>  source "arch/riscv/Kconfig.socs"
> -source "arch/riscv/Kconfig.erratas"
> +source "arch/riscv/Kconfig.errata"
> =20
>  menu "Platform type"
> =20
> diff --git a/arch/riscv/Kconfig.erratas b/arch/riscv/Kconfig.errata
> similarity index 100%
> rename from arch/riscv/Kconfig.erratas
> rename to arch/riscv/Kconfig.errata
> --=20
> 2.39.1
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--gabfo4szo8K2lcZ+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/fykQAKCRB4tDGHoIJi
0upLAP0TNIgFKJoO/sbWZagULeXixobaIV9KeV2psGav4EBrbAEA3FTND8fL5DV/
nl/zjoD5Mv7gu/BsQoyUGCCDIc2LVwE=
=SIpn
-----END PGP SIGNATURE-----

--gabfo4szo8K2lcZ+--


--===============2878533728578052093==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2878533728578052093==--

