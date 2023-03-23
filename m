Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B0BFC74A5B
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Mar 2023 15:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6vCvvNGcqiSH6iM0sXPIUremQuz+J+865v7+xCKbX8E=; b=YV1GxGBrn2hDdDX2L4tPJWp1gq
	oA5jslwBl8pI8PHppZDdscozxyVetFjc1g6V15oKTxtEZukai8a0R/b/7pUhWg3Vg++vL8zw7h9Y3
	Xhigqw/k09sS+q2dJp99FnP4yKw55wLKPp1qpVZQcVrM4X0mnMRAfTgiVgGnxwA/UR3KwjFwb4q9q
	H7cVMjHBQorWFlHpKvXbrZ28WoWGIPDmFFbju6M7+j+srbDK/jRwyNfDUxqtPcm1HL81lE2RzOheJ
	8LIAIEmDpwHZlDxbziqBmf+sSkXq+QVZiu2KnwhmkFltF77c5hdXl3DH1Ifvmf+ZbaSzoSgKScefV
	HkI2susg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfMpy-002LZx-1b;
	Thu, 23 Mar 2023 15:26:46 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfMpv-002LZ6-1C;
	Thu, 23 Mar 2023 15:26:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1679585203; x=1711121203;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=86yrhXo0wuZkXMT9LRZ/k4xl+d7WKjf/eV20kO0UvSc=;
  b=KlujklTzKHy3fMT1LYXGjOt+QI/mutl521KB911icZ5Lw6eZd3LWac/3
   INXXzrT6SL5hbZYdpKkuTmwbwKC30Dj6i7g5Sb5FoEviOFiXuQtQZi9Bp
   pC+jQdZqhIuI3GhWyCUFo7/Ojl3v49XTMIZqXxZ9WjuOL9uNusrX+PhN8
   mT5k2Se+v6orgOD2P81q01i/oW/pemqhw4SGGDi2nyglyp8shbeCVAQw4
   3ZNwF20jJzxIo6Dk0epI8gSeZe9HzyFKqYFmoQLYtiKXM/0HaZ2l435zE
   psQaZs8/YMntvXI/TUSOXea7Ba75PKC65f6+QRpePkxpJ1D+d8EnDO5TB
   g==;
X-IronPort-AV: E=Sophos;i="5.98,285,1673938800"; 
   d="asc'?scan'208";a="203103645"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 23 Mar 2023 08:26:39 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 23 Mar 2023 08:26:35 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 23 Mar 2023 08:26:32 -0700
Date: Thu, 23 Mar 2023 15:26:14 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Andy Chiu <andy.chiu@sifive.com>
CC: <linux-riscv@lists.infradead.org>, <palmer@dabbelt.com>,
	<anup@brainfault.org>, <atishp@atishpatra.org>,
	<kvm-riscv@lists.infradead.org>, <kvm@vger.kernel.org>,
	<vineetg@rivosinc.com>, <greentime.hu@sifive.com>,
	<guoren@linux.alibaba.com>, Paul Walmsley <paul.walmsley@sifive.com>, Albert
 Ou <aou@eecs.berkeley.edu>, Nathan Chancellor <nathan@kernel.org>, Nick
 Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>
Subject: Re: [PATCH -next v16 19/20] riscv: detect assembler support for
 .option arch
Message-ID: <04cc3420-26a7-4263-b120-677c758eabea@spud>
References: <20230323145924.4194-1-andy.chiu@sifive.com>
 <20230323145924.4194-20-andy.chiu@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20230323145924.4194-20-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_082643_475085_638169CF 
X-CRM114-Status: GOOD (  19.58  )
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
Content-Type: multipart/mixed; boundary="===============6282296989922827305=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6282296989922827305==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Yj+/LCxZH129o5eE"
Content-Disposition: inline

--Yj+/LCxZH129o5eE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 23, 2023 at 02:59:23PM +0000, Andy Chiu wrote:
> Some extensions use .option arch directive to selectively enable certain
> extensions in parts of its assembly code. For example, Zbb uses it to
> inform assmebler to emit bit manipulation instructions. However,
> supporting of this directive only exist on GNU assembler and has not
> landed on clang at the moment, making TOOLCHAIN_HAS_ZBB depend on
> AS_IS_GNU.
>=20
> While it is still under review at https://reviews.llvm.org/D123515, the
> upcoming Vector patch also requires this feature in assembler. Thus,
> provide Kconfig AS_HAS_OPTION_ARCH to detect such feature. Then
> TOOLCHAIN_HAS_XXX will be turned on automatically when the feature land.
>=20
> Suggested-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> ---
>  arch/riscv/Kconfig | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 36a5b6fed0d3..4f8fd4002f1d 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -244,6 +244,12 @@ config RISCV_DMA_NONCOHERENT
>  config AS_HAS_INSN
>  	def_bool $(as-instr,.insn r 51$(comma) 0$(comma) 0$(comma) t0$(comma) t=
0$(comma) zero)
> =20
> +config AS_HAS_OPTION_ARCH
> +	# https://reviews.llvm.org/D123515
> +	def_bool y
> +	depends on $(as-instr, .option arch$(comma) +m)
> +	depends on !$(as-instr, .option arch$(comma) -i)

Oh cool, I didn't expect this to work given what Nathan said in his
mail, but I gave it a whirl and it does seem to.
I suppose:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

I'd rather it be this way so that it is "hands off", as opposed to the
version check that would need updating in the future. And I guess it
means that support for V & IAS will automatically turn on for stable
kernels too once the LLVM change lands, which is nice ;)

Thanks Andy!

> +
>  source "arch/riscv/Kconfig.socs"
>  source "arch/riscv/Kconfig.errata"
> =20
> @@ -442,7 +448,7 @@ config TOOLCHAIN_HAS_ZBB
>  	depends on !64BIT || $(cc-option,-mabi=3Dlp64 -march=3Drv64ima_zbb)
>  	depends on !32BIT || $(cc-option,-mabi=3Dilp32 -march=3Drv32ima_zbb)
>  	depends on LLD_VERSION >=3D 150000 || LD_VERSION >=3D 23900
> -	depends on AS_IS_GNU
> +	depends on AS_HAS_OPTION_ARCH
> =20
>  config RISCV_ISA_ZBB
>  	bool "Zbb extension support for bit manipulation instructions"
> --=20
> 2.17.1
>=20
>=20

--Yj+/LCxZH129o5eE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZBxvlgAKCRB4tDGHoIJi
0uljAP0QSmWLx9NqoMEEU7pnQbE6zzkqpFQ5YjbqmKh316V3zwD/enaTKpjMwAaq
HMvtUIntHRWG0phcQM9GLmnilJBSlQk=
=byEg
-----END PGP SIGNATURE-----

--Yj+/LCxZH129o5eE--


--===============6282296989922827305==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6282296989922827305==--

