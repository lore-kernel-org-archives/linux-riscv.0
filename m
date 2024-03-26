Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3833C6FD1F
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Mar 2024 18:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5RT6saNXB5idMf++ULQAM/SuUomKuAUL1tHKO3p0Vh0=; b=J35jtxkai60p0+AHudFzOXc7rE
	B1ZbYdNqA6rXTKH378KgBofcY5RPuMg366lHIuneVRsN74M3cS0s1mD8+nNLEsYyAmoEENXOMsP0j
	dri0Puk+gTQswTHZmU0YcHWYQkplwRbLPBhb0DFvF0PdL+EK0GtgVOByN3DoUhgNY6cTuBIi/eopy
	XksLdLRsXepeaaFi821KCzF0OGpkm+QMb3QN2ccwDwH8bD3XqGF0M4jygFwD69h0r8k+xdKWWcucV
	4pizvZ9w/arg1iS34mt0tndZ/X0pC7OtI48oMzixWMGJCpN3zPY4/aAA4CvFTDfeRCXJKdSbk7pCT
	qeepe+zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpBrf-00000005zvF-24Ow;
	Tue, 26 Mar 2024 18:49:39 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpBrY-00000005ztk-1B59
	for linux-riscv@lists.infradead.org;
	Tue, 26 Mar 2024 18:49:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 947C8CE1C89;
	Tue, 26 Mar 2024 18:49:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB2DBC433F1;
	Tue, 26 Mar 2024 18:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711478969;
	bh=UU2VDr3u/3TXCOqy+TTP1ocWAPAmrxpuuTkUu5erUDk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PBwJPZa5DPG76Ku/rLXmTHS2TSZtuV1OhnF2IcXykh8DO9dhbAx6Rj+MiH36XNYm0
	 z/CCvjUf/DfFy+oYzImWu29MntAO08O+h+gjiVqCXht566Q2IJeQc51ukzqV8Afn7W
	 iSzzlxZqv0ul84yT6zg3aLv8A/EvTXVbuHUvqxDE8qSzLjDN8/eLrAr70f5rDCS77Z
	 an332I9toO+IxNlKk9tevAEZKF40UGoJz4JAGRgr0r+tQjSYYFXk6+rxZliOdd28Jo
	 79OqNa0pZC85cYV/WVkq8Mt/UkAYC9EXpv2WFwfgarN4bcizLd3LUZC951mYtBwhDv
	 RMiijqOlPD0Zw==
Date: Tue, 26 Mar 2024 18:49:25 +0000
From: Conor Dooley <conor@kernel.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Kees Cook <keescook@chromium.org>, linux-riscv@lists.infradead.org,
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
	Linux Kernel Functional Testing <lkft@linaro.org>
Subject: Re: [PATCH] riscv: Mark __se_sys_* functions __used
Message-ID: <20240326-proofing-projector-0b8eef253667@spud>
References: <20240326153712.1839482-2-samitolvanen@google.com>
MIME-Version: 1.0
In-Reply-To: <20240326153712.1839482-2-samitolvanen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_114936_646404_1D580DAD 
X-CRM114-Status: GOOD (  16.44  )
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
Content-Type: multipart/mixed; boundary="===============7905312425649394131=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7905312425649394131==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UzV3RQm1Ipc55SDT"
Content-Disposition: inline


--UzV3RQm1Ipc55SDT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 26, 2024 at 03:37:13PM +0000, Sami Tolvanen wrote:
> Clang doesn't think ___se_sys_* functions used even though they are
> aliased to __se_sys_*, resulting in -Wunused-function warnings when
> building rv32. For example:
>=20
>    mm/oom_kill.c:1195:1: warning: unused function '___se_sys_process_mrel=
ease' [-Wunused-function]
>     1195 | SYSCALL_DEFINE2(process_mrelease, int, pidfd, unsigned int, fl=
ags)
>          | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
>    include/linux/syscalls.h:221:36: note: expanded from macro 'SYSCALL_DE=
FINE2'
>      221 | #define SYSCALL_DEFINE2(name, ...) SYSCALL_DEFINEx(2, _##name,=
 __VA_ARGS__)
>          |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~
>    include/linux/syscalls.h:231:2: note: expanded from macro 'SYSCALL_DEF=
INEx'
>      231 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    arch/riscv/include/asm/syscall_wrapper.h:81:2: note: expanded from mac=
ro '__SYSCALL_DEFINEx'
>       81 |         __SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)       =
                  \
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    arch/riscv/include/asm/syscall_wrapper.h:40:14: note: expanded from ma=
cro '__SYSCALL_SE_DEFINEx'
>       40 |         static long ___se_##prefix##name(__MAP(x,__SC_LONG,__V=
A_ARGS__))
>          |                     ^~~~~~~~~~~~~~~~~~~~
>    <scratch space>:30:1: note: expanded from here
>       30 | ___se_sys_process_mrelease
>          | ^~~~~~~~~~~~~~~~~~~~~~~~~~
>    1 warning generated.
>=20
> Mark the functions __used explicitly to fix the Clang warnings.
>=20
> Fixes: a9ad73295cc1 ("riscv: Fix syscall wrapper for >word-size arguments=
")
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

Oh neat, thanks. This was generating a shed load of noise in CI :)
Tested-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> ---
>  arch/riscv/include/asm/syscall_wrapper.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/riscv/include/asm/syscall_wrapper.h b/arch/riscv/includ=
e/asm/syscall_wrapper.h
> index 980094c2e976..ac80216549ff 100644
> --- a/arch/riscv/include/asm/syscall_wrapper.h
> +++ b/arch/riscv/include/asm/syscall_wrapper.h
> @@ -36,7 +36,8 @@ asmlinkage long __riscv_sys_ni_syscall(const struct pt_=
regs *);
>  					ulong)						\
>  			__attribute__((alias(__stringify(___se_##prefix##name))));	\
>  	__diag_pop();									\
> -	static long noinline ___se_##prefix##name(__MAP(x,__SC_LONG,__VA_ARGS__=
));	\
> +	static long noinline ___se_##prefix##name(__MAP(x,__SC_LONG,__VA_ARGS__=
))	\
> +			__used;								\
>  	static long ___se_##prefix##name(__MAP(x,__SC_LONG,__VA_ARGS__))
> =20
>  #define SC_RISCV_REGS_TO_ARGS(x, ...) \
>=20
> base-commit: 4cece764965020c22cff7665b18a012006359095
> --=20
> 2.44.0.396.g6e790dbe36-goog
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--UzV3RQm1Ipc55SDT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZgMYtQAKCRB4tDGHoIJi
0lpHAP9MHNkX3etDTKmHZ6qt1m7X45+uBOZZWopKhVa5d8UFvAD/YTeTIdZXASl8
l+cYdYHZwoR710Xt9ZyEhVuNCGR0Igs=
=jNoi
-----END PGP SIGNATURE-----

--UzV3RQm1Ipc55SDT--


--===============7905312425649394131==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7905312425649394131==--

