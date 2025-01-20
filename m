Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A212FC02182
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jan 2025 18:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p2ZhKnKWx67TfSqtAy0UoVyClacqGzirsyJqLv8GCI4=; b=qy9HpWpjesv1jUVbcQEksctbkm
	3LCB4xYyLAL9cJknR92f2iQHx1ie2KcTcrTiDXhjmp1TW+J8no0aTMpuHveaF+aLJSqx/sVPfeP4C
	e7nOIktE37Pb9ub/V6dCZDKtJ2ZBNDnro/yXVledrwJv+GiYYQlPGkZtz7mnZ8XVJsmT4u0PK7Lmi
	cf5RATOYjtfzG3se0nlOGrvzfjYkseUHnN5GeaKtPUMP7S4U8nnd5rI7OIh8faa2e4p+Z4stKIBvP
	oqcfZA2J+wlE8p9DzmfTKfWTA/k5oAj21bB2HJxU5anVBO199PdpCyXGKEyl71B6VpWWyb+rZUQrI
	Vmmse4wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZwrP-00000006Gyx-36mO;
	Mon, 20 Jan 2025 18:50:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZwpR-00000006GhB-4ARN
	for linux-riscv@lists.infradead.org;
	Mon, 20 Jan 2025 18:48:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BADFC5C5DD2;
	Mon, 20 Jan 2025 18:48:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAEA1C4CEDD;
	Mon, 20 Jan 2025 18:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737398933;
	bh=GZutBfscRYJGhhKNcd1tZMGNtgevFdUbAYAC9mCXcP8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qs/Gp87UqlKgFENHwy8ZwjdbksdB1sxjMCFh6fnFyH/i8Ldy+xZGDnDXr8EjLpDKV
	 dElp0VYiHmAUjK59QXtle/IaN2F/h7cBe8xFK2JB0gbTXdsKo156atPmEoYLegMOLM
	 MaJ+Ryz4a7cuchKUiwwQMt3W7MYLctopJrsAydjgrg/Ia+zliKkQaDyOA6CpO53xWq
	 +btd9aDYPoNdwYkm94xXjcwYqIenjSxjSK2eNuUKYbK2aOFICP6hIfIiYx/xUwREoq
	 zH1W+O42FrkhUNfAGATudtD5PIVOiZxHO3/HDW4gZZbwxy5tICTc9tyJodRf0feiZg
	 rkQhFhXQAdGdA==
Date: Mon, 20 Jan 2025 18:48:49 +0000
From: Conor Dooley <conor@kernel.org>
To: Chuanhong Guo <gch981213@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] riscv: add Siflower RISC-V SoC family Kconfig support
Message-ID: <20250120-skyrocket-fiftieth-5fd770df030f@spud>
References: <20250120022359.125952-1-gch981213@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20250120022359.125952-1-gch981213@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_104854_079517_37F8107E 
X-CRM114-Status: GOOD (  16.30  )
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
Content-Type: multipart/mixed; boundary="===============8374709144449109429=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8374709144449109429==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pIa+gMzMc7XUDoG8"
Content-Disposition: inline


--pIa+gMzMc7XUDoG8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 20, 2025 at 10:23:58AM +0800, Chuanhong Guo wrote:
> Siflower RISC-V SoCs, including SF21A6826, SF21H8898 and some other
> upcomping chips, are RISC-V chips with T-Head C908 cores for home
> routers and gateways. Add a Kconfig entry named ARCH_SIFLOWER for
> them.
> Notably these chips uses ARM PL011 for UART. ARM_AMBA is selected
> for its driver.
>=20
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>

This needs to be in a series with the user (your dts)

> ---
>=20
> Changes since v1:
>  * removed deprecated SOC_ symbol
>=20
>  arch/riscv/Kconfig.socs | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> index 1916cf7ba450..64a49e7ea03e 100644
> --- a/arch/riscv/Kconfig.socs
> +++ b/arch/riscv/Kconfig.socs
> @@ -19,6 +19,12 @@ config ARCH_SIFIVE
>  	help
>  	  This enables support for SiFive SoC platform hardware.
> =20
> +config ARCH_SIFLOWER
> +	bool "Siflower RISC-V SoCs"
> +	select ARM_AMBA if TTY
> +	help
> +	  This enables support for Siflower RISC-V SoC platform hardware.
> +
>  config ARCH_SOPHGO
>  	bool "Sophgo SoCs"
>  	help
> --=20
> 2.48.1
>=20
>=20

--pIa+gMzMc7XUDoG8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ46akQAKCRB4tDGHoIJi
0nG3AP4zsiYNNmP5blQZEhPkfZOhDmkjXFoPLcE5bqvnG2xLyQD/bugvud8R+xnf
gwC24Eobl/z/VdgHs3hBGyUXX6wRNAY=
=HySm
-----END PGP SIGNATURE-----

--pIa+gMzMc7XUDoG8--


--===============8374709144449109429==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8374709144449109429==--

