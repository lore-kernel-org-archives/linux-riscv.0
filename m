Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9947BC61DA4
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Mar 2023 19:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CpS8jVXFjKp82hzG/ithmp0TStJ280NU21TKrbASnt4=; b=L9bKa7xrwlaAVMqvySU/w3TWGS
	+Fg7c8e6G336xtKVyQEr25gIrRn7eyHYL7wwn0tLICQfrBNLKEdXX5KTtKkrW2LWSBMpBJZ9E6ES1
	tZUCFlhffETf6iQW+o6qP/P1Qk8Hx6L/cRibxgJaA3+8bV0mxZSl43HuZpVVcF4+jDWHZyb1YlX6g
	N+8m0xJhFhHVplBrg7Z20y4+QTrcTFazPij0eEVxoFUlif/6Byn0ImEYtodwWw7KxsRoKhjsQnI5s
	OIVVgJyk5/RLfGKL8a+uZj2caLD8lGymu/sJtbOo7oUCv0kpyd/PuN9u1NjeCCOuSSyRmESznflLH
	0RxUxs7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZGUI-00EaGM-FY; Mon, 06 Mar 2023 19:27:10 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZGU6-00EaBP-Gb
	for linux-riscv@lists.infradead.org; Mon, 06 Mar 2023 19:27:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 4644AB810D5;
	Mon,  6 Mar 2023 19:26:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33DB7C433D2;
	Mon,  6 Mar 2023 19:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678130815;
	bh=qJZNuK31WcsEJiNza1huRTw6AstehkIf7XEiHaxQpRc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=evMW9Jw7+rFCbiPUyIffpCsSKySfnXOeDFIjsBW5Fk3mDSZcpzqM7Gd5VTD1JjEYO
	 jX3bQa67lPhzW4mY/KQ3NLqtrwGc07oXNikGq0s9KqHrzy22vwP4FoFnCcbQpOn42/
	 oaShy5iJLKwBE8386ZPLowLJoxWAv0fvOrnxTOGJp9l8yFBCyPBdgKP35bXa5YX3Qp
	 bnHqPOIxhEzkWZCD+BYQUqNywK5c/+Vu/LNuJKH5J/GgkajAA0dXlV+Z5ZW6sw1ZwY
	 cK0wY0ExeNC2REvxMki/R6Eou/7VghZxpht18BkclAHc+4/gapoSDZ+6KuC+z4b3vn
	 vzLb7zRlegB8A==
Date: Mon, 6 Mar 2023 19:26:49 +0000
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: miguel.ojeda.sandonis@gmail.com,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, ojeda@kernel.org,
	alex.gaynor@gmail.com, wedsonaf@gmail.com, boqun.feng@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, corbet@lwn.net,
	Paul Walmsley <paul.walmsley@sifive.com>, nathan@kernel.org,
	ndesaulniers@google.com, trix@redhat.com,
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [RFC 0/2] RISC-V: enable rust
Message-ID: <719ed82b-ffe5-4f2f-a21c-f32b9b4f867b@spud>
References: <CANiq72ndkF0JM1kV=ewnO4uGirDowHDGLkhvjQgtLnuPEk_hTQ@mail.gmail.com>
 <mhng-a7ada57e-543c-434b-a4f3-4fbda9238eb0@palmer-ri-x1c9a>
MIME-Version: 1.0
In-Reply-To: <mhng-a7ada57e-543c-434b-a4f3-4fbda9238eb0@palmer-ri-x1c9a>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_112658_750094_80EC7DC0 
X-CRM114-Status: GOOD (  24.09  )
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
Content-Type: multipart/mixed; boundary="===============6149827000086836703=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6149827000086836703==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bv6pgk4XOEP22YAx"
Content-Disposition: inline


--bv6pgk4XOEP22YAx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 06, 2023 at 11:18:06AM -0800, Palmer Dabbelt wrote:
> On Sat, 25 Feb 2023 00:37:29 PST (-0800), miguel.ojeda.sandonis@gmail.com=
 wrote:
> > On Sat, Feb 25, 2023 at 12:18 AM Palmer Dabbelt <palmer@dabbelt.com> wr=
ote:
> > >=20
> > > Works for me.
> > >=20
> > > I've got a few other things in the pipeline for this merge window so
> > > this probably won't make it, but I'll dig in after that.  We've got a
> > > bunch of Rust-types floating around Rivos as well, so with any luck
> > > someone else will have some time to poke around.  Having a full cycle=
 in
> > > linux-next is probably the right way to go for this sort of thing
> > > anyway, as it's likely to shake out some long-tail issues.
> >=20
> > Thanks a lot! That would be great.
> >=20
> > At least from our side, no rush. In fact, we are letting users (or
> > arch maintainers) to request/submit the architectures themselves as
> > they need/want them.
>=20
> It's time for the next release.  IIUC there were some authorship issues
> here, did you guys want to re-spin this with those sorted out?  I can give
> it a shot if you want, but I'm probably as likely to screw it up as anyone
> else...

It's in my queue to respin, I wasn't bothered doing one until after -rc1.
I'll try to get to it tomorrow since it's simpler than anything else I
currently owe one for.
Should be able to do something that satisfies everyone, or, at least,
gives everyone the opportunity to be satisfied!

Cheers,
Conor.


--bv6pgk4XOEP22YAx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZAY+QAAKCRB4tDGHoIJi
0obrAP9X3eFi/wo3T5hY5jI6VcYOgDX5U9nhlmdJj6G1KUkFGgD9FSf22UcJPohT
atZEWK7qWW8liEdc0PizSJE8mWeNrwY=
=IHr0
-----END PGP SIGNATURE-----

--bv6pgk4XOEP22YAx--


--===============6149827000086836703==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6149827000086836703==--

