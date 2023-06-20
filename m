Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33C64EB64D7
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jun 2023 20:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FuIc6iT3Fe0GSPosj7ApQg5vcPZTiT1dN2sH8it4J3M=; b=M8rdk1lXjGagC+nJqUQQpfO5GF
	pAYxITnx6fNXXE6rjpkrQNE0eO04R1t4QiufpTbaQS7oElL6ZmqeZh064OdyTGwl8p1DdxSLS61NU
	ESj0uu+BIk5ssMJsO3ieOwQCQCQWxJtcWu75zxNb1fvDZPzwSdeAJg2E8XHKHuPSkT9q9EN00e2H0
	mVjqBte2Okm2CGNA0mRx9CxZs5jo2aSTJRD9mty+zIs5kSKjhZxooEp1DoRZo7ugfH/V8sXlnoZde
	E0ylj7UXUFUF5lhc5QKi2JGJdMYtWEMFtb9/lIY3fc7f8uvChhVcMzAHYYy6vbymj0BZdt5UraCrn
	P5Ruj9Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBhsJ-00CHbk-3D;
	Tue, 20 Jun 2023 20:22:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBhsH-00CHbD-0d
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jun 2023 20:22:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7E0E560F1D;
	Tue, 20 Jun 2023 20:22:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3B0CC433C0;
	Tue, 20 Jun 2023 20:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687292567;
	bh=w7w3SFTWbViJUJYrEq3MbkerW9/irnfhy/TKE1nu0kw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oSsD40Z3JoJI0m//pg9xtA9cadY8q9NsbFZdKWbOxhyCXNqQ97LyfrfG5Hapj+daZ
	 soq+jqW4SE0A4OnOU8ayCiYRT9oI8P4UwwPgZPr1miTu1Cq1uk+h7C0zD7sI+OagqL
	 PoSpOSoPm8KpinvP/DYK+iQoXzQ3wIqXdjsfuf9OwZ4PAAP5g5k1gGsbcqGirxN50k
	 IGbGxwO6tCboiEFolb1fgTHGvMu8z/vVSGu8THa5m4tmznWC85+ZAgB90M0bmOFc+I
	 EFElGQhLPQkRDPXRqQ5neBflewTWPc2JbmxOcN2y0YMJ+yvJCWh7JbD1FSAqRcDi4s
	 /qTQWDgjUdFtw==
Date: Tue, 20 Jun 2023 21:22:43 +0100
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: ndesaulniers@google.com, falcon@tinylab.org, guoren@kernel.org,
	linux-riscv@lists.infradead.org, npiggin@gmail.com,
	Paul Walmsley <paul.walmsley@sifive.com>, paulburton@kernel.org,
	vincent.chen@sifive.com, tim.bird@sony.com, llvm@lists.linux.dev
Subject: Re: [PATCH v3] RISC-V: Enable dead code elimination
Message-ID: <20230620-hull-boxy-63d71a9c376d@spud>
References: <ZJIIUn8Da15neIwI@google.com>
 <mhng-ae249af7-37cc-400c-be0d-c1fa6f75c8ef@palmer-ri-x1c9a>
MIME-Version: 1.0
In-Reply-To: <mhng-ae249af7-37cc-400c-be0d-c1fa6f75c8ef@palmer-ri-x1c9a>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230620_132249_279750_9D40D878 
X-CRM114-Status: GOOD (  20.40  )
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
Content-Type: multipart/mixed; boundary="===============0066587332350649841=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0066587332350649841==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9LpfEV1HEiJhq2XX"
Content-Disposition: inline


--9LpfEV1HEiJhq2XX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 20, 2023 at 01:17:26PM -0700, Palmer Dabbelt wrote:
> On Tue, 20 Jun 2023 13:13:06 PDT (-0700), ndesaulniers@google.com wrote:
> > On Wed, May 17, 2023 at 04:29:36PM +0800, Zhangjin Wu wrote:
> > > Select CONFIG_HAVE_LD_DEAD_CODE_DATA_ELIMINATION for RISC-V, allowing
> > > the user to enable dead code elimination. In order for this to work,
> > > ensure that we keep the alternative table by annotating them with KEE=
P.
> > >=20
> >=20
> > Just cross referencing the report from Palmer against v2; I see orphan
> > section warnings from the linker related to the EFI stub when building
> > allmodconfig with this patch applied.
> >=20
> > v2: thread for reference.
> > https://lore.kernel.org/linux-riscv/CAKwvOdmsgMN5oQpDLh12D0X-CfQDtHC-Et=
xHcBnADkhnyitMKQ@mail.gmail.com/
>=20
> Sorry for replying to the v2, I'm marking that as superseeded in patchwor=
k.
> IIUC it is a real issue on your end too?  I'm also not 100% sure about the
> hang, I just let LLD cook for about 10 minutes before I noticed it was st=
ill
> running and posted.

Repeating myself for the sake of the archives or w/e, two different
submitters with differing version numbers. The v2 from Jisheng is more
recent than the v3 here from Zhangjin, they agreed in this mail thread
to merge their work.

Cheers,
Conor.

--9LpfEV1HEiJhq2XX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJIKkwAKCRB4tDGHoIJi
0kisAQDhsmEvyojjUjLcr2DhngYymr7Gg4n3GQRg9wqofZJ0cgD/R6g2DroNboBz
SPcUBxBi7zt/xuIYqlNF7rvPD94k9g8=
=cihs
-----END PGP SIGNATURE-----

--9LpfEV1HEiJhq2XX--


--===============0066587332350649841==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0066587332350649841==--

