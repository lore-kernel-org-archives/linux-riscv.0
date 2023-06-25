Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC8A4EB64DC
	for <linux-riscv@archiver.kernel.org>; Sun, 25 Jun 2023 12:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C5mGzFfKzAjC4910kL4CbhJe9FpRBiYetrvGgYx2Yj4=; b=QJIh4gxPs487379RYMMNy6nlE9
	A5sIktru0h9kfA/nkMvRuGht/CRXcwCj36CMwHAjhFEIG6xEsxxXArOMg5y9xZkno5RSKZixZhRNc
	YU5nV0RGCO9vWD5XZtpOY1pHoSKkRvkGAnhMJzR9zCV9Zt8Wf+PTEKEOkYT+XqDV3+LdOGciwzDXO
	tW5PnuKXeazLUOnrScjj3Xfu/1Y8+YgpXS2MaOQyMZqPETKenFnviLznHOptb+JvMkpcdozDOkP0U
	oOSVHbclwbXJKOPKTGj8UnESpbwMyroAePY4pbCQytT9RwpCnhmoaejwKOXy9KhUbLfW1DGTjzLv/
	Y/Swbl/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDP5P-0082D1-1Y;
	Sun, 25 Jun 2023 12:43:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDP5M-0082CR-0o
	for linux-riscv@lists.infradead.org;
	Sun, 25 Jun 2023 12:43:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 86CC360BAF;
	Sun, 25 Jun 2023 12:43:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFC56C433C8;
	Sun, 25 Jun 2023 12:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687696998;
	bh=uw+THhCcFwsu2QuqBbqVeEBv0iNk0Ab27RGodyuvtLs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ncFKjJEUCyQW3JK+9ueyHlu+2WwftBNfqS7BLGzYCY3LOKe+03s1rVSappC7BnKcY
	 xzHvmyRTr9HobXJHODEpqL23UGYvWkh8Xb757DExVQPvGXx2sie1373q0qacF7WA1l
	 KPYOuBcgmJDFFl7Csll9L7UZlIDNRjTGK1znm0nXZ/Y7Mxk7K0ex1nfDoQ07VKbTij
	 g3ctPgYJ7LsAh2PYjpx2Y/IK1mjycvnv6cBo42+zS6COvu/ax+DvrHjcHk4RgPM7KN
	 Dyngujvl96O9Eb9wjblTvRRuPuzCGUfmyaLnURs6hGGDH0Q5s/bovTim73wB0OdpxQ
	 Ax8zTzd/jEErQ==
Date: Sun, 25 Jun 2023 13:43:13 +0100
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, bjorn@kernel.org,
	llvm@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>,
	aou@eecs.berkeley.edu, Arnd Bergmann <arnd@arndb.de>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org
Subject: Re: [PATCH v2 0/4] riscv: enable HAVE_LD_DEAD_CODE_DATA_ELIMINATION
Message-ID: <20230625-radish-comic-b0861fb96023@spud>
References: <20230622215327.GA1135447@dev-arch.thelio-3990X>
 <mhng-6c34765c-126d-4e6c-8904-e002d49a4336@palmer-ri-x1c9a>
 <20230622231803.GA1790165@dev-arch.thelio-3990X>
 <ZJXTwqZIkXLxXaSi@google.com>
 <ZJgyGD8ZSjVmiprB@xhacker>
MIME-Version: 1.0
In-Reply-To: <ZJgyGD8ZSjVmiprB@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230625_054320_398194_A9F41CB8 
X-CRM114-Status: GOOD (  40.55  )
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
Content-Type: multipart/mixed; boundary="===============0777408834474473692=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0777408834474473692==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Cddf6K/j8n8gvZx4"
Content-Disposition: inline


--Cddf6K/j8n8gvZx4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 25, 2023 at 08:24:56PM +0800, Jisheng Zhang wrote:
> On Fri, Jun 23, 2023 at 10:17:54AM -0700, Nick Desaulniers wrote:
> > On Thu, Jun 22, 2023 at 11:18:03PM +0000, Nathan Chancellor wrote:
> > > If you wanted to restrict it to just LD_IS_BFD in arch/riscv/Kconfig,
> > > that would be fine with me too.
> > >=20
> > >   select HAVE_LD_DEAD_CODE_DATA_ELIMINATION if LD_IS_BFD
> >=20
> > Hi Jisheng, would you mind sending a v3 with the attached patch applied
> > on top / at the end of your series?
>=20
> Hi Nick, Nathan, Palmer,
>=20
> I saw the series has been applied to riscv-next, so I'm not sure which
> solution would it be, Palmer to apply Nick's patch to riscv-next or
> I to send out v3, any suggestion is appreciated.

I don't see what you are seeing w/ riscv/for-next. HEAD is currently at
4681dacadeef ("riscv: replace deprecated scall with ecall") and there
are no patches from your series in the branch:
https://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git/log/?h=3Dfo=
r-next

Cheers,
Conor.

> > > Nick said he would work on a report for the LLVM side, so as long as
> > > this issue is handled in some way to avoid regressing LLD builds until
> > > it is resolved, I don't think there is anything else for the kernel to
> > > do. We like to have breadcrumbs via issue links, not sure if the repo=
rt
> > > will be internal to Google or on LLVM's issue tracker though;
> > > regardless, we will have to touch this block to add a version check
> > > later, at which point we can add a link to the fix in LLD.
> >=20
> > https://github.com/ClangBuiltLinux/linux/issues/1881
>=20
> > From 3e5e010958ee41b9fb408cfade8fb017c2fe7169 Mon Sep 17 00:00:00 2001
> > From: Nick Desaulniers <ndesaulniers@google.com>
> > Date: Fri, 23 Jun 2023 10:06:17 -0700
> > Subject: [PATCH] riscv: disable HAVE_LD_DEAD_CODE_DATA_ELIMINATION for =
LLD
> >=20
> > Linking allyesconfig with ld.lld-17 with CONFIG_DEAD_CODE_ELIMINATION=
=3Dy
> > takes hours.  Assuming this is a performance regression that can be
> > fixed, tentatively disable this for now so that allyesconfig builds
> > don't start timing out.  If and when there's a fix to ld.lld, this can
> > be converted to a version check instead so that users of older but still
> > supported versions of ld.lld don't hurt themselves by enabling
> > CONFIG_LD_DEAD_CODE_DATA_ELIMINATION=3Dy.
> >=20
> > Link: https://github.com/ClangBuiltLinux/linux/issues/1881
> > Reported-by: Palmer Dabbelt <palmer@dabbelt.com>
> > Suggested-by: Nathan Chancellor <nathan@kernel.org>
> > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> > ---
> > Hi Jisheng, would you mind sending a v3 with this patch on top/at the
> > end of your patch series?
> >=20
> >  arch/riscv/Kconfig | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index 8effe5bb7788..0573991e9b78 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -116,7 +116,8 @@ config RISCV
> >  	select HAVE_KPROBES if !XIP_KERNEL
> >  	select HAVE_KPROBES_ON_FTRACE if !XIP_KERNEL
> >  	select HAVE_KRETPROBES if !XIP_KERNEL
> > -	select HAVE_LD_DEAD_CODE_DATA_ELIMINATION
> > +	# https://github.com/ClangBuiltLinux/linux/issues/1881
> > +	select HAVE_LD_DEAD_CODE_DATA_ELIMINATION if !LD_IS_LLD
> >  	select HAVE_MOVE_PMD
> >  	select HAVE_MOVE_PUD
> >  	select HAVE_PCI
> > --=20
> > 2.41.0.162.gfafddb0af9-goog
> >=20
>=20

--Cddf6K/j8n8gvZx4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJg2YQAKCRB4tDGHoIJi
0nAEAQD701JCrnWdXplFizS5WQslP2hoBx5xuZNxyoFFL/ExAQD+MaFPDb9nGQgJ
B4z5ajWVB8vRrPS6gu9KMtAmSWLjKgo=
=3gUZ
-----END PGP SIGNATURE-----

--Cddf6K/j8n8gvZx4--


--===============0777408834474473692==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0777408834474473692==--

