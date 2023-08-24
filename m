Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 492D4C6FA8F
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Aug 2023 17:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=akFW/u9vumBTRKmEVCuC5WzAeljoB3y4z/7PALuRUxI=; b=rURF2AIAQo/EsGLEkNl2cHUqzy
	iRUKG1Ja9r/Py8iiLh1GS14YYmxfkGIpy2HjhFraWzyRls0XS754pGCxsnvIR3hffLdiU8AtF11u3
	Fp1QDen6uWHWgnvAAlYD34YG1Yp3QgZ3uAMkBMtvqRCF4LrCGKhduchEMTx3JKuo9LNS5qUm8ZXag
	RhaEa8fijt/MuSf4mTH1ytXRbgea622qi0REtf83Jbh8rNTI7WDJDXgU685a4TPtc4IwcANQ245Eu
	bttjGi535C/OtlAX0kR8EWQsZttRbdmldHjJITM7/pWYeLvpmsceDEaQFfP165KsOU0cVzNuk+Q9l
	YmlaVH5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZED5-003XH4-31;
	Thu, 24 Aug 2023 17:33:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZED3-003XGf-2b
	for linux-riscv@lists.infradead.org;
	Thu, 24 Aug 2023 17:33:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3F9D46463F;
	Thu, 24 Aug 2023 17:33:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EE88C433C7;
	Thu, 24 Aug 2023 17:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692898408;
	bh=ahEjFBYYn126N0UBbCJdKmoqregzZPS84OaeQ8V68E4=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=MXSsxmDumlM+ixPupdlHnUccUgS+qacYjlPhe1eE7R9NtwNhBNjCqoH/TgbgiV49j
	 YU/J1HoY8sqEeTsqWK6/MvRlDmhN/Sk1lvcv/DojsmAjGl0yw08cu187CrHNcAHhPk
	 xDnPGJuq6sLHqtKO4nv6IYKKMghUH8QIUKEGbQNCN/aJvJzozoymRHlywEYYdTknPY
	 egWgPqM8GhIo69Anz9ekGsFxsW7SYuyNEosNtbMbpil6XoucfFXVanC3iOFToDHiH9
	 hzgEHWQJaRKewpSP9QILXZQJjYScInAdz9/jW0/2djeBpixVKvferjRsfeN+ILRFyL
	 IIx8haZFMVXkw==
Date: Thu, 24 Aug 2023 18:33:23 +0100
From: Conor Dooley <conor@kernel.org>
To: Mingzheng Xing <xingmingzheng@iscas.ac.cn>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	patchwork-bot+linux-riscv@kernel.org,
	linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, nathan@kernel.org,
	ndesaulniers@google.com, trix@redhat.com, bmeng@tinylab.org,
	guoren@kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH v5] riscv: Handle zicsr/zifencei issue between gcc and
 binutils
Message-ID: <20230824-stick-neutron-839dfdfa0538@spud>
References: <20230809165648.21071-1-xingmingzheng@iscas.ac.cn>
 <169228562484.20811.14246462375671910714.git-patchwork-notify@kernel.org>
 <20230823-captive-abdomen-befd942a4a73@wendy>
 <20230823-facelift-ovary-41f2eb4d9eac@spud>
 <4677fc33-6e76-21e6-2a7f-f12670bc1ce2@iscas.ac.cn>
 <4177c0c5-4d36-75e1-84e2-c6ac82b74e50@iscas.ac.cn>
MIME-Version: 1.0
In-Reply-To: <4177c0c5-4d36-75e1-84e2-c6ac82b74e50@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_103329_951070_8E0CE1CD 
X-CRM114-Status: GOOD (  31.38  )
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
Content-Type: multipart/mixed; boundary="===============2320659666386853122=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2320659666386853122==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GzRpdPN9dHzG3R55"
Content-Disposition: inline


--GzRpdPN9dHzG3R55
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 25, 2023 at 01:30:36AM +0800, Mingzheng Xing wrote:
> On 8/24/23 19:32, Mingzheng Xing wrote:
> > On 8/23/23 21:31, Conor Dooley wrote:
> > > On Wed, Aug 23, 2023 at 12:51:13PM +0100, Conor Dooley wrote:
> > > > On Thu, Aug 17, 2023 at 03:20:24PM +0000,
> > > > patchwork-bot+linux-riscv@kernel.org wrote:
> > > > > Hello:
> > > > >=20
> > > > > This patch was applied to riscv/linux.git (fixes)
> > > > > by Palmer Dabbelt <palmer@rivosinc.com>:
> > > > >=20
> > > > > On Thu, 10 Aug 2023 00:56:48 +0800 you wrote:
> > > > > > Binutils-2.38 and GCC-12.1.0 bumped[0][1] the default
> > > > > > ISA spec to the newer
> > > > > > 20191213 version which moves some instructions from the
> > > > > > I extension to the
> > > > > > Zicsr and Zifencei extensions. So if one of the binutils
> > > > > > and GCC exceeds
> > > > > > that version, we should explicitly specifying Zicsr and
> > > > > > Zifencei via -march
> > > > > > to cope with the new changes. but this only occurs when
> > > > > > binutils >=3D 2.36
> > > > > > and GCC >=3D 11.1.0. It's a different story when binutils < 2.3=
6.
> > > > > >=20
> > > > > > [...]
> > > > > Here is the summary with links:
> > > > > =A0=A0 - [v5] riscv: Handle zicsr/zifencei issue between gcc and =
binutils
> > > > > =A0=A0=A0=A0 https://git.kernel.org/riscv/c/ca09f772ccca
> > > > *sigh* so this breaks the build for gcc-11 & binutils 2.37 w/
> > > > =A0=A0=A0=A0Assembler messages:
> > > > =A0=A0=A0=A0Error: cannot find default versions of the ISA extensio=
n `zicsr'
> > > > =A0=A0=A0=A0Error: cannot find default versions of the ISA extensio=
n `zifencei'
> > > >=20
> > > > I'll have a poke later.
> > > So uh, are we sure that this should not be:
> > > -=A0=A0=A0=A0=A0=A0 depends on (CC_IS_CLANG && CLANG_VERSION < 170000=
) ||
> > > (CC_IS_GCC && GCC_VERSION < 110100)
> > > +=A0=A0=A0=A0=A0=A0 depends on (CC_IS_CLANG && CLANG_VERSION < 170000=
) ||
> > > (CC_IS_GCC && GCC_VERSION <=3D 110100)
> > >=20
> > > My gcc-11.1 + binutils 2.37 toolchain built from riscv-gnu-toolchain
> > > doesn't have the default versions & the above diff fixes the build.
> >=20
> > I reproduced the error, the combination of gcc-11.1 and
> > binutils 2.37 does cause errors. What a surprise, since binutils
> > 2.36 and 2.38 are fine.
> >=20
> > I used git bisect to locate this commit[1] for binutils.
> > I'll test this diff in more detail later. Thanks!
> >=20
> > [1] https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommit;h=3Df0b=
ae2552db1dd4f1995608fbf6648fcee4e9e0c
> >=20
>=20
> Hi, Conor.
> The above error does originate from link[1] mentioned above, which was
> resolved in gcc-12.1.0[2], and gcc-11.3.0 made the backport[3].
> So gcc-11.2.0 combined with binutils 2.37 produces the same error.
> I think we should do the following diff to fix it:
> -=A0=A0=A0=A0=A0=A0 depends on (CC_IS_CLANG && CLANG_VERSION < 170000) ||=
 (CC_IS_GCC &&
> GCC_VERSION < 110100)
> +=A0=A0=A0=A0=A0=A0 depends on (CC_IS_CLANG && CLANG_VERSION < 170000) ||=
 (CC_IS_GCC &&
> GCC_VERSION < 110300)

That sounds good to me. Can you make that a real patch please?

Thanks for working on it :)

--GzRpdPN9dHzG3R55
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZOeUYwAKCRB4tDGHoIJi
0shAAPwPF6Ho7GmV1QqOqCxaLs5lrfrMuUqsTg0UQOkhrKmXagD/SB/pACU1o7NB
wwud4O1QrkkA0shYDsylGNjF0UCUgwo=
=y6Et
-----END PGP SIGNATURE-----

--GzRpdPN9dHzG3R55--


--===============2320659666386853122==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2320659666386853122==--

