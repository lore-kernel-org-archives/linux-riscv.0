Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBEE2C83F2F
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Aug 2023 17:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IX/I9NI3/NTEcwMh9A2HmUouM6KtGgGj6g6rpRpslp8=; b=2UktYcEi2i1Qjcc10SzMUCxQuV
	XFf5Jdd2FqEb2sFvKGmCEdk01Ha9wvwyLyfPp/QSa27d5+0d6Gk75iW7NPBex/b8EGTbIeSbkCBxx
	JZndAIJndRMifUC6CqYNQgYbjVvjmudVKLm4iquuH09XtJiigS7tg9jXWuECSIOhE22yQ5SfW9gLj
	doi1EAWgw0pNc4dygHX6KHrLdYjta3kFfX9IZzi8+h5kgIaPfpY9x7hvuPfIO/Cz2FNhskevgutMN
	rdQVZ7uKjsfYvOge2U2M+IaDwcqcCoWjyZZa7DcKChvwZ0GVvwx2cxdsLW1ye8i6JyuyGyX/0CqVT
	jqKu7JRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qblIB-00Fclq-0H;
	Thu, 31 Aug 2023 17:17:15 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qblI7-00FclK-2o
	for linux-riscv@lists.infradead.org;
	Thu, 31 Aug 2023 17:17:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 1DC2ECE20CD;
	Thu, 31 Aug 2023 17:17:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 105EEC433C7;
	Thu, 31 Aug 2023 17:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693502228;
	bh=ctnELOgyQiFdisjCzaGZrbZlVVWK6L94DyJWQq4uLSg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oXGDXcRbRklyijnB0xq0n66yj7zD1aCY5u4Dh4NJ9YVklMLzmQhhPLsmQ2dnNEdO2
	 V1nFrBwPE2qoTpdOgcBaSbQJVc7z9zI6jRE4+s0E93dI4mc4SzmrLCBM2ep+JrFJpj
	 Sel9YB+cOyO3fViQqqo1+IesSZyCZ6yORGJbbdoPi42FGWq44ug9kzoWYwya+wGm3n
	 lxk/f2X937vYErph9qfQe+m7qdc3ygxuf872mvRLVKMhTxd+uPlO36DKk42+nWPPHh
	 jxWSuYC+FYCwnKgjEEt02n90A2qXJSCwXnJ2ZjMZFFXPvcPHaiQKM2VSMYe8ncvqaK
	 h0SG/PH4GTTTA==
Date: Thu, 31 Aug 2023 18:17:01 +0100
From: Conor Dooley <conor@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Andy Chiu <andy.chiu@sifive.com>, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, greentime.hu@sifive.com,
	guoren@linux.alibaba.com,
	20230816155450.26200-4-andy.chiu@sifive.com, bjorn@kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Oleg Nesterov <oleg@redhat.com>,
	Eric Biederman <ebiederm@xmission.com>,
	Kees Cook <keescook@chromium.org>,
	Vincent Chen <vincent.chen@sifive.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Benjamin Gray <bgray@linux.ibm.com>,
	Qing Zhang <zhangqing@loongson.cn>,
	Baruch Siach <baruch@tkos.co.il>, Rolf Eike Beer <eb@emlix.com>,
	llvm@lists.linux.dev, nathan@kernel.org, regressions@leemhuis.info
Subject: Re: [v2] RISC-V: Add ptrace support for vectors
Message-ID: <20230831-resize-spherical-4f46639097b8@spud>
References: <20230825050248.32681-1-andy.chiu@sifive.com>
 <ZPDIQEVaEJHXR5IW@google.com>
MIME-Version: 1.0
In-Reply-To: <ZPDIQEVaEJHXR5IW@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230831_101712_275375_393394EC 
X-CRM114-Status: GOOD (  20.98  )
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
Content-Type: multipart/mixed; boundary="===============8041133763809828446=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8041133763809828446==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="swMVnOXyUbYix+/e"
Content-Disposition: inline


--swMVnOXyUbYix+/e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 31, 2023 at 10:05:04AM -0700, Nick Desaulniers wrote:
> On Fri, Aug 25, 2023 at 05:02:46AM +0000, Andy Chiu wrote:
> > This patch add back the ptrace support with the following fix:
> >  - Define NT_RISCV_CSR and re-number NT_RISCV_VECTOR to prevent
> >    conflicting with gdb's NT_RISCV_CSR.
> >  - Use struct __riscv_v_regset_state to handle ptrace requests
> >=20
> > Since gdb does not directly include the note description header in
> > Linux and has already defined NT_RISCV_CSR as 0x900, we decide to
> > sync with gdb and renumber NT_RISCV_VECTOR to solve and prevent future
> > conflicts.
> >=20
> > Fixes: 0c59922c769a ("riscv: Add ptrace vector support")
> > Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
>=20
> Hi Andy, this is causing an instance of -Wunused-variable. PTAL.
>=20
> Please use the following tags on the fix:
>=20
> Reported-by: "kernelci.org bot" <bot@kernelci.org>
> Closes: https://lore.kernel.org/linux-next/64f03ea1.170a0220.d3dbf.11fd@m=
x.google.com/
>=20
> Let's see if I can get the regzbot tag correct; first time trying it.
>=20
> #regzbot introduced dbe46b094026

See <20230830203754.24940-1-palmer@rivosinc.com> for the fix.

That has you gave regzbot prob won't be stable though, branch needs a
rebase to add missing SoB tags from its committer.

--swMVnOXyUbYix+/e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZPDLDQAKCRB4tDGHoIJi
0tfeAQDVIHp/ifcftmYU7QsT5+rY3ORU6jMEj3oR+KGcIj0GJwEA7mOVDivJ0S1v
JzsoPGnjIrDjrndpdzti4vZ5lHwiogc=
=TZpH
-----END PGP SIGNATURE-----

--swMVnOXyUbYix+/e--


--===============8041133763809828446==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8041133763809828446==--

