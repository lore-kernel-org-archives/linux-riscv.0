Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA015C678D5
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Mar 2023 19:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Me9LKANsh7CFQxfl/v3aJukTTD//Zhz0NFpXuvlE6PE=; b=OHsc6tfFRrD70FpIXz8PGHiu2v
	dpOHDP5JlyBBtvsNfdLKM5UxUt93qsvRFjUDazAy/wr6u6IEZQCJfkIWSfNMdkVyPkb11UEo+D3R1
	8b6LCIy2H2LYAk5bKASvgL/5WTZq0fqMRmwN5ZVaMrQ6X9WjvzJN1aHn0M+oWCi8b8LBtLMjDrB43
	Z8Syzj80miQ1atAok1jz5R8z/Xb81IRpjwwTCoZceJ/2WUA/KDSN3qVVUhhPSEA5jeiUEUkPVXJT/
	rhAUnMwp3q+/NkX1MHP+QvHRaavc5Go3lDmkvr8lrY9HdPEd0HIoo2VFsKwXgYh/5OxUry/DrPsay
	74vpShKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZcmA-002C04-2z; Tue, 07 Mar 2023 19:15:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZcm3-002ByG-Q8
	for linux-riscv@lists.infradead.org; Tue, 07 Mar 2023 19:15:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 54C5F61526;
	Tue,  7 Mar 2023 19:14:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61C17C433EF;
	Tue,  7 Mar 2023 19:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678216498;
	bh=NBoYj03m/N/5JXP/eUAG+iOaCqvhQKVMr77J4rNfHlo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QSBKIWVtDGUKvDX1KW4nuwVauqFVidsbWphhPpmSxCnd7Kx9yMTpnI7ctnrhCYJ5u
	 xph5vWf9YpUX6h60UkzXWaiieIp45uDW0Q+lHUlEECZNjTaFi1lU7GO6EW69VltYaR
	 oPmQvSs16tF9pL0sK6t0NQ1UopU7oaq4rPrRypj56XNdqnUhAl2oBiHuv1ocZ5Jk62
	 jJ70506CDO1wi+nz0yOwvZWeKaT2X8ACYlVBrKixWkJN9QliKWtC2aOCYlpV2AOf+x
	 D/LGXPLtqJZ+hgrUNm4xa7ibblavYO1OfPpLaJG34LOB1YFu7FD+V3td/XwIOLZvMs
	 MpLJvscBzTL2A==
Date: Tue, 7 Mar 2023 19:14:54 +0000
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: nathan@kernel.org, Conor Dooley <conor.dooley@microchip.com>,
	naresh.kamboju@linaro.org, linux-riscv@lists.infradead.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v1 1/2] RISC-V: move zicsr/zifencei spec version check to
 Kconfig
Message-ID: <299f2b9c-d72b-4b2c-9f42-f5b71a9d05e6@spud>
References: <Y/jtGRrBfKxO6s0c@spud>
 <mhng-5ec23642-a554-4e02-82bc-3a138a50d3ce@palmer-ri-x1c9a>
MIME-Version: 1.0
In-Reply-To: <mhng-5ec23642-a554-4e02-82bc-3a138a50d3ce@palmer-ri-x1c9a>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_111459_956444_FF825498 
X-CRM114-Status: GOOD (  27.62  )
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
Content-Type: multipart/mixed; boundary="===============0618835845305001242=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0618835845305001242==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rExin57s/Ed36ADq"
Content-Disposition: inline


--rExin57s/Ed36ADq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 06, 2023 at 03:52:27PM -0800, Palmer Dabbelt wrote:
> On Fri, 24 Feb 2023 09:00:09 PST (-0800), Conor Dooley wrote:
> > On Fri, Feb 24, 2023 at 09:37:28AM -0700, Nathan Chancellor wrote:
> > > On Thu, Feb 23, 2023 at 10:05:45PM +0000, Conor Dooley wrote:
> >=20
> > > > ---
> > > >  arch/riscv/Kconfig  | 10 ++++++++++
> > > >  arch/riscv/Makefile |  5 +----
> > > >  2 files changed, 11 insertions(+), 4 deletions(-)
> > > > > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > > > index cebf0c5f8824..4eb0ef8314b3 100644
> > > > --- a/arch/riscv/Kconfig
> > > > +++ b/arch/riscv/Kconfig
> > > > @@ -288,6 +288,16 @@ config ARCH_RV64I
> > > >  >  endchoice
> > > >  > +config TOOLCHAIN_NEEDS_SPEC_20191213
> > >=20
> > > This symbol's name is a little confusing to me, how does the toolchain
> > > need spec version 20191213. Maybe 'SPEC_20191213' should be something
> > > like 'EXPLICIT_ZICSR_ZIFENCEI'? Otherwise, maybe it should be somethi=
ng
> > > like 'TOOLCHAIN_HAS_DEFAULT_SPEC_20191213'? Sorry for the bikeshed bu=
t I
> > > think most Kconfig symbols should be self describing.
> >=20
> > Yah I can do that. I actually had this as the DEFAULT_SPEC variant
> > before and changed it - I'll switch it to the EXPLICIT one.
> > Thanks for taking a look Nathan :)
>=20
> Another option here would be to use the `-misa-spec` argument for GCC, to
> make it match LLVM's spec version.

I'm not entirely sure what you're getting at.
You're the toolchain guy, but my understanding was that gas and gcc have
that option, but not ld, which rules out my initial interpretation.=20
Are you suggesting that we always pass -misa-spec=3D<pre-zicsr_zifencei> to
gcc so that we are using the same misa-spec for both gnu and llvm
toolchain bits?

My instinctive thought was that that is kinda fragile to things
misaligning between gcc/llvm, but given I seem to end up looking at this
every month, we're really fragile to changes in either camp anyway...

I can go spin an alternative v2 of this up if I have understood you
correctly.

Thanks,
Conor.

--rExin57s/Ed36ADq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZAeNLgAKCRB4tDGHoIJi
0hO9AQD1Jmahe2QH2Ut2VER3lj6scl0TUWfEGnTwb4k5nAOAJAD/cyA0B3Nr8Zbj
eO538ug3fIfT+/1dSiMwHJCj4XRdIgw=
=qp8l
-----END PGP SIGNATURE-----

--rExin57s/Ed36ADq--


--===============0618835845305001242==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0618835845305001242==--

