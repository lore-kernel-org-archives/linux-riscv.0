Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E744C3DA4A
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Aug 2024 16:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Y/D5OU2vMslSlDVYpxf2avjJMTXvPYRXjTqwXi0ch4=; b=M/fKKJzB+ueQKznew2FdN8LnZk
	pF0vSh7+zLVYWX9ObFcgAEVRiEMdVyvqqlbRna3VOpaQ6FkZqw3iWBe0KwBWSNm8yK5lkM85kREcW
	ozYPIIFoME4WhepiIX2WNc3lhhKa2TdE5w2XNc11wIfXdPyAaInpQ8xZgCeAo3tySJSrkGfcpJ6jC
	fFbbmddOAeMWJYt1uXSaHDTWHAh6I4H9//BvDy/Ai5DvnU9iAxPTfm0u9YuUjFxuIaDy205VPCs4A
	bQaEv97ukC0H1frL4vxgrb06PibUHsWfiE03EKk/JiLSI81lybfgWseNAGhr9ktJak8EfH1cDqrwr
	mk2qwdrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg5VK-00000002DyH-3FPb;
	Mon, 19 Aug 2024 16:45:14 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg5VH-00000002DxI-0THn
	for linux-riscv@lists.infradead.org;
	Mon, 19 Aug 2024 16:45:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 34A21CE0ABE;
	Mon, 19 Aug 2024 16:45:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A5ABC32782;
	Mon, 19 Aug 2024 16:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724085908;
	bh=3pNbCoAUzrDDebWTc7DBPabwhlPFOO2MZh48diZHMQA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NlhV1lP4ZTSNfcDcXU5mcakYDCoYfyfaQYwmIMn6qQX/CnVaHekKUL6h3abTAdv0w
	 GqGtYOUkS0XLOdEkzdCKnagtNmzVChD+ZaZ9/0CPc1izn7oGOy8LmhwBTBQCZEN+dD
	 t8w182okggKMrkkesPbm3S0OeJJDasyqHAbTa/IpDkcsvuah9fOZPatdK859i/eC6+
	 3Kwnfx9f5sBLAOI6LYMK3ldtnFH/tDbBCgFRrddfX0gz9072zbfzRrb3OWGjb2Zhuu
	 Q4Jt55wCxVbmL9OSdVW2L3iOFcNm7fbC0ZXD76jGcZLdRa3HPSwzS6rhvlZbb8lJgV
	 4zxWaMsD6Gc3A==
Date: Mon, 19 Aug 2024 17:45:04 +0100
From: Conor Dooley <conor@kernel.org>
To: Anton Blanchard <antonb@tenstorrent.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH] riscv: Fix toolchain vector detection
Message-ID: <20240819-unbiased-feast-846ab1347aaf@spud>
References: <20240819001131.1738806-1-antonb@tenstorrent.com>
MIME-Version: 1.0
In-Reply-To: <20240819001131.1738806-1-antonb@tenstorrent.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240819_094511_353133_45BA7C4D 
X-CRM114-Status: GOOD (  16.14  )
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
Content-Type: multipart/mixed; boundary="===============7160100502516710330=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7160100502516710330==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3xY+Q/aPeQavJq/a"
Content-Disposition: inline


--3xY+Q/aPeQavJq/a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 19, 2024 at 12:11:31AM +0000, Anton Blanchard wrote:
> A recent change to gcc flags rv64iv as no longer valid:
>=20
>    cc1: sorry, unimplemented: Currently the 'V' implementation
>    requires the 'M' extension
>=20
> and as a result vector support is disabled. Fix this by adding m
> to our toolchain vector detection code.
>=20
> Signed-off-by: Anton Blanchard <antonb@tenstorrent.com>

This one definitely needs a cc: stable, it's required as far back as
6.6, right?

> ---
>  arch/riscv/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 0f3cd7c3a436..939ea7f6a228 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -552,8 +552,8 @@ config RISCV_ISA_SVPBMT
>  config TOOLCHAIN_HAS_V
>  	bool
>  	default y
> -	depends on !64BIT || $(cc-option,-mabi=3Dlp64 -march=3Drv64iv)
> -	depends on !32BIT || $(cc-option,-mabi=3Dilp32 -march=3Drv32iv)
> +	depends on !64BIT || $(cc-option,-mabi=3Dlp64 -march=3Drv64imv)
> +	depends on !32BIT || $(cc-option,-mabi=3Dilp32 -march=3Drv32imv)
>  	depends on LLD_VERSION >=3D 140000 || LD_VERSION >=3D 23800
>  	depends on AS_HAS_OPTION_ARCH
> =20
> --=20
> 2.34.1
>=20
>=20

--3xY+Q/aPeQavJq/a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZsN2kAAKCRB4tDGHoIJi
0mYNAQCuFMhheZiAczWfLmrWVi1D6L7EvFHtyjcWAptZgC0zNgD/WN1HL6BnW6mG
drVFk2pz7DjaJWSGXjtmDAPRxUzhEAo=
=pkXY
-----END PGP SIGNATURE-----

--3xY+Q/aPeQavJq/a--


--===============7160100502516710330==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7160100502516710330==--

