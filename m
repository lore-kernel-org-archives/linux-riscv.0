Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 783E8C001DF
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Jul 2023 17:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+QNVEQpJSWzWsOmC7QMrhIhTUMvF0kj92vvd+4w8ltQ=; b=Xk1CDDQ8jF1xv3oPb85sTiU0BL
	xLEUloKTJs+b9W4aO59t6ZVBPiOX/52dCmZOOBPm88RLq1ddB9fTLotta7fre0P8sNyQ8Dxc+Wn32
	raY279s/X3RSJDIr4q6rEki2e9ADmjcMRuTXqqw5Bi+sW3dxk0a6anHJSUccwvvMTDgGBOmzwVG8E
	TuxWQB0WqmEer3pK3ITwyKfTUsZkyH8PwJf65KExjibiB740DKAzmqBxLrEVM/nwyLXM3/yWE/nS+
	diBLIYgNJ0vzRmshFHqA4YZcJGb61CqUIPnhwQgqoPBeXrwDu8XoF6BV64NqmnmVSbDK32M4tf63L
	afSL2qJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPo32-008HrU-1p;
	Sat, 29 Jul 2023 17:48:12 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPo2z-008HqU-2h
	for linux-riscv@lists.infradead.org;
	Sat, 29 Jul 2023 17:48:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A389D601FE;
	Sat, 29 Jul 2023 17:48:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79462C433C9;
	Sat, 29 Jul 2023 17:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690652888;
	bh=426Plr62YIRVVd7idefnHiN/75xOXxFwgyitLpzWikI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ml2RZxAenphY2R+EU5yWpJOcmOG/MVc8GX8AsiALO21yS2ff9XnOMpyryixIJWHVS
	 MFE3y5fS98ByWyiqZlo5rdb3HDVXKG7ed3QtCn3reyw7PXw8+dXgkt62Nud0yjEuzN
	 m6khptTa5+EAxubkvi3qxNJvSeD+isKPNA4UPtMXS2ixLCQdKmlE0ayHB8arnSJR6u
	 cjGQoEih8NH3fp2vmddZnN/PsRS+hPsOXXhhLAgK53ZsdBdVDteB76HVaW8enar4bY
	 Gjv06JgSGVnYJC1Np1a0BHANcKfcvzk7pqPruEzHPy/rLP3iKDJuRqQptUyXOzNn6u
	 EIz9DX3ZGnXHg==
Date: Sat, 29 Jul 2023 18:48:03 +0100
From: Conor Dooley <conor@kernel.org>
To: Mingzheng Xing <xingmingzheng@iscas.ac.cn>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, Bin Meng <bmeng@tinylab.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, stable@vger.kernel.org,
	Guo Ren <guoren@kernel.org>
Subject: Re: [PATCH v2] riscv: Handle zicsr/zifencei issue between gcc and
 binutils
Message-ID: <20230729-chaps-coauthor-95557d86b189@spud>
References: <20230726174524.340952-1-xingmingzheng@iscas.ac.cn>
 <20230726-outclass-parade-2ccea9f6688a@spud>
 <10231b81-ea42-26d0-4c11-92851229e658@iscas.ac.cn>
 <20230726-armchair-evasive-427dd245a9fe@spud>
 <20230727-briskness-sappy-e2d9e4c1ef36@spud>
 <d75ef570-c0ad-cea4-687a-d02b560aa676@iscas.ac.cn>
MIME-Version: 1.0
In-Reply-To: <d75ef570-c0ad-cea4-687a-d02b560aa676@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230729_104809_987501_80B38282 
X-CRM114-Status: GOOD (  17.46  )
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
Content-Type: multipart/mixed; boundary="===============5861541664647075689=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5861541664647075689==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/xQjWBbnHuYsLKM8"
Content-Disposition: inline


--/xQjWBbnHuYsLKM8
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 30, 2023 at 01:36:49AM +0800, Mingzheng Xing wrote:

> I reproduced the error with gcc-12.2.0 and binutils-2.35. I tried a
> different solution, which I think makes the logic easier. Showing
> the new patch code:

It is indeed simpler, neat.

> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 4c07b9189c86..a6fa1eed895c 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -569,25 +569,24 @@ config TOOLCHAIN_HAS_ZIHINTPAUSE
>=20
> =A0config TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI
> =A0=A0=A0=A0=A0=A0=A0 def_bool y
> -=A0=A0=A0=A0=A0=A0 # https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=
=3Dcommit;h=3Daed44286efa8ae8717a77d94b51ac3614e2ca6dc
> -=A0=A0=A0=A0=A0=A0 depends on AS_IS_GNU && AS_VERSION >=3D 23800
> +=A0=A0=A0=A0=A0=A0 depends on AS_IS_GNU && AS_VERSION >=3D 23600
> =A0=A0=A0=A0=A0=A0=A0 help
> -=A0=A0=A0=A0=A0=A0=A0=A0 Newer binutils versions default to ISA spec ver=
sion 20191213 which
> -=A0=A0=A0=A0=A0=A0=A0=A0 moves some instructions from the I extension to=
 the Zicsr and Zifencei
> -=A0=A0=A0=A0=A0=A0=A0=A0 extensions.
> +=A0=A0=A0=A0=A0=A0=A0=A0 Binutils has supported zicsr and zifencei exten=
sions since version 2.36,
> +=A0=A0=A0=A0=A0=A0=A0=A0 try to adapt to the changes by using explicit z=
icsr and zifencei via
> +=A0=A0=A0=A0=A0=A0=A0=A0 -march.

This sentence no longer makes sense to me, the motivation for why we are
doing this is lost. Please preserve the link & explanation about the
20191213 version of the spec, adding to it the commentary about how we
can relax the check to 2.36, since that makes our lives easier.

The rest of this looks fine to me, if you resubmit I'll look at it
further on Monday.

--/xQjWBbnHuYsLKM8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZMVQ0wAKCRB4tDGHoIJi
0hSNAQC4nTdM3esMZyV0dCcSxV4Vouv1QrjdKIehT8d0Ekj1FgEAzV4i7k7xFRWu
eCpwfwzJaU7gFR6zdpfx0+KDSo2Cugc=
=UWMZ
-----END PGP SIGNATURE-----

--/xQjWBbnHuYsLKM8--


--===============5861541664647075689==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5861541664647075689==--

