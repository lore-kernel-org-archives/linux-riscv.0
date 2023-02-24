Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F154AC7EE2F
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 21:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l9vG+QCE1RyixVPP9W1tDWgY0OE0HxgzGm/Dctwp9zA=; b=gNmJgiCilNGuSgT/OR3pDqq61k
	7l5ot03oESMbXzfoFXdc76bJUwf5cM+4uU5xtmS2d3hn7j9ZPmPGvUBQgecbNs6pogRSdqR3/MBkG
	R7IZ4jv3wKcoNOToNL68qvl73ooLPKC2QHEF33evff2rhJRCc+ajL/7BZRoz16SZIm6hR9OKD7lAt
	ioIdNxkqpxkcOF3JrSoz7q9/iPmW46vWxwT7qgJ4UIq0Y5oH5HIwRPISGBPGR2cabjW1/TC39AQIs
	sFKc97f83k/70EcFUp+ptXxZ117mMO0IobKm30dcHwuvIHE0Zxt9WYX3VWyBNNtesR7I3nOuyyU1S
	WKO5h9Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVfDv-003sRV-OP; Fri, 24 Feb 2023 21:03:23 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVfDs-003sQS-Hs
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 21:03:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 7EEA7B81D06;
	Fri, 24 Feb 2023 21:03:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97FD6C433EF;
	Fri, 24 Feb 2023 21:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677272595;
	bh=GOPRgmEm/tLlo164VtO08+QtLf9+r2oLkH7o65afRmY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qt82xGw08+pWQPYenM8GbR0Qn4nQY7XCUDyzCsd556SIZ/mqaZKCxmuMq43nL5sM2
	 YfIhiPwNX+MqauE34NbgOcdxgCE1VDhPmNmRe7Gw5I5NMbJcUjPVWG0rjzsUpEbFZu
	 5wQVKGJY41UTW8GI/u19czDbFT9Hzx9F21e7LadYjUkzgvDjG/o4GMtd1JkoDsPlXE
	 /TNvh8GXartMwOlt9911MkoCWLO1VmPnIe2TazBqh5zPwerPtSXHPlUO9vGvxTYkFw
	 FSCDzkXMYBQXStWUeFQO6sufgUyGj5wxPA+E/iOmye4S57Zdix2f0paxXAu4DwWiaU
	 aTuqaHZpN9kaQ==
Date: Fri, 24 Feb 2023 21:03:09 +0000
From: Conor Dooley <conor@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [RFC RESEND 2/2] RISC-V: enable building the 64-bit kernels with
 rust support
Message-ID: <Y/kmDcMBcZ2PzcKR@spud>
References: <20230224135044.2882109-1-conor.dooley@microchip.com>
 <20230224135044.2882109-3-conor.dooley@microchip.com>
 <CANiq72m1bnHZEd1n+tzaTXYqk8kU83CEPSFO7TBMX44J3poKOw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANiq72m1bnHZEd1n+tzaTXYqk8kU83CEPSFO7TBMX44J3poKOw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_130320_909534_49CEA7F0 
X-CRM114-Status: GOOD (  13.92  )
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
Content-Type: multipart/mixed; boundary="===============8645408109383143459=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8645408109383143459==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="WdAygoFJPXezUehP"
Content-Disposition: inline


--WdAygoFJPXezUehP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 24, 2023 at 09:45:05PM +0100, Miguel Ojeda wrote:
> On Fri, Feb 24, 2023 at 2:51 PM Conor Dooley <conor.dooley@microchip.com>=
 wrote:

> > diff --git a/Documentation/rust/arch-support.rst b/Documentation/rust/a=
rch-support.rst
> > index 6982b63775da..197919158596 100644
> > --- a/Documentation/rust/arch-support.rst
> > +++ b/Documentation/rust/arch-support.rst
> > @@ -15,5 +15,7 @@ support corresponds to ``S`` values in the ``MAINTAIN=
ERS`` file.
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> >  Architecture  Level of support  Constraints
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> > +``riscv``     Maintained        ``rv64`` only.
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> >  ``x86``       Maintained        ``x86_64`` only.
>=20
> I think this separator between rows should not be here (it is not in
> `rust-for-linux/rust`). Please see
> https://docutils.sourceforge.io/docs/ref/rst/restructuredtext.html#simple=
-tables.

That's what the "let the automation tell me if I messed up rst" approach
gets you ;)


--WdAygoFJPXezUehP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/kmDQAKCRB4tDGHoIJi
0nPaAP4scKJyUoodTh1VeLDzWnq6wVMqx2ag5tPkur6OL8OPSwD+J4ShZHdTHo7f
F5jmK7nrKyOomF7iNe21+bCUkCg/qAs=
=fdgN
-----END PGP SIGNATURE-----

--WdAygoFJPXezUehP--


--===============8645408109383143459==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8645408109383143459==--

