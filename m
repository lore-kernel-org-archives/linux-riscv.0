Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E6B7C77B7A
	for <linux-riscv@archiver.kernel.org>; Fri, 26 May 2023 16:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kWq9cBoqRJNcHc+izreFoKnlxXONelZ7otNprHnYePY=; b=q0G/vI4CPRdDUYDHO2zzmHlVzl
	7MpVKCSGcfKVA6aS8XdBs7IHDbebwcNX32YydMkBa19nxx+h7/tJViM0QGQEBbfHT9oWijowtcPmz
	F62vGYOKPX7sl/YdY+9LeNTWNHnfb6L9sOwOTY6m0KqTZrCHPU579+fHkRVdJe47WtbkRQEzwcHt4
	BhNyOP2cl8BzyHEXpxK7459ocrAiXmTPuayDpQMs9yT4uIYJ/t5NvpzlDfw4s8c3DzTy7Unp5q9JT
	h2aGqeVEVHqYEkYRHJVt+eRJAT5y0lAAJk5xgVyJuEW0B5g+tbXomzvugvQGKYPfaZAPPPiPZFrbv
	M1grDmqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2aPP-0038U5-1W;
	Fri, 26 May 2023 16:35:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2aPM-0038T8-0d
	for linux-riscv@lists.infradead.org;
	Fri, 26 May 2023 16:35:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 862B564D4A;
	Fri, 26 May 2023 16:35:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B209C433EF;
	Fri, 26 May 2023 16:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685118915;
	bh=dDtcjo2khBi8ymoa90ET2UZ26pR1HJAdtcLCQJ44+f4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jqgpkTpUOTSS7G21efDm78STIdWUG7tTVfcYM5JvNx8fxyqCL0w5sqiZYWDWGP6nl
	 iX678eZOZ9o4f66IuHfni5SfYzUyIzNmcT+mWm13ZS/48DL8La86KBl+atyw1zJvzm
	 0lV15AL9AF/jS+nKH9Pob8MLWG+0YIfXbGbD42jGUljLrP/srHgwdLwPqgwKpWRNMy
	 ZYtz6pUIbyLu0OLqIib6FZJjWvoxoIIBNgsY6SCSY81tk0qM2TaP04dm5geOMJKNlY
	 1wB3fM5DZEyJSnBJFa6lNL789Yf4D4ktKmnPF0Iviepc7ao39CxG7v2ZkkbueZ4UG8
	 uf1pFaHAbEctQ==
Date: Fri, 26 May 2023 17:35:10 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andreas Schwab <schwab@linux-m68k.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -fixes] riscv: Fix relocatable kernels with early
 alternatives using -fno-pie
Message-ID: <20230526-rockfish-moody-f6d3e71f9d24@spud>
References: <20230526154630.289374-1-alexghiti@rivosinc.com>
 <20230526-clergyman-wriggly-accc659a3fad@spud>
MIME-Version: 1.0
In-Reply-To: <20230526-clergyman-wriggly-accc659a3fad@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_093516_274476_F5591905 
X-CRM114-Status: GOOD (  24.21  )
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
Content-Type: multipart/mixed; boundary="===============5104018775969823230=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5104018775969823230==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="REENGAGNHgcCpbL0"
Content-Disposition: inline


--REENGAGNHgcCpbL0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 26, 2023 at 05:24:41PM +0100, Conor Dooley wrote:
> On Fri, May 26, 2023 at 05:46:30PM +0200, Alexandre Ghiti wrote:
> > Early alternatives are called with the mmu disabled, and then should not
> > access any global symbols through the GOT since it requires relocations,
> > relocations that we do before but *virtually*. So only use medany code
> > model for this early code.
> >=20
> > Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> > ---
> >=20
> > Note that I'm not very happy with this fix, I think we need to put more
> > effort into "harmonizing" this very early code (ie before the mmu is
> > enabled) as it is spread between different locations and compiled
> > differently.
>=20
> Totally & I'll happily spend the time trying to review that work.
>=20
> > I'll work on that later, but for now, this fix does what is
> > needed to work (from my testing at least). Any Tested-by on the Unmatch=
ed
> > and T-head boards is welcome!
>=20
> On 6.4-rc1 & v6.4-rc1 + this patch, with CONFIG_RELOCATABLE added to my
> config, my Nezha fails to boot. There is no output whatsoever from the
> kernel. Turning off CONFIG_RELOCATABLE boots again.

I don't know if this is better or worse news, but same thing happens on
an icicle kit. What systems, other than QEMU, has the relocatable
eries been tested with, btw?

Cheers,
Conor.

>=20
> I didn't test on my unmatched.
>=20
> Thanks,
> Conor.



--REENGAGNHgcCpbL0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZHDfvgAKCRB4tDGHoIJi
0o5PAP4kGp6TYrXzx+SgO893FhzdwG2Eq5HmFYhREfw4DJSsfQD9GAf/u9yn78RL
UejivzEp0vJSvQvVYzpd1U7jAPQTkgc=
=Sb9T
-----END PGP SIGNATURE-----

--REENGAGNHgcCpbL0--


--===============5104018775969823230==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5104018775969823230==--

