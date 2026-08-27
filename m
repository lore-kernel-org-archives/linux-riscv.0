Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F9DEC61DB9
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Aug 2026 21:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tgralCOttCfMtY7ZDTZ/qNKqTMj8LbDmX3l2q41URXY=; b=AnAh/rl+vhtsQkumlStrzW5WOK
	NgxR0WENJctApDedbOBBwfg0BFb663hUpzBtapbTQyRUvD96FMnW+KUnvnV+P8xsvWu3eMDQRa7bp
	6nxl5QKdpHuj6K1HkF/x/ajFRSk4g7YfPDAHwP1wiENnPwpXRC017hOwv6eAp07vH+blIMbgAOXlg
	N8kug4siSAFTe9BxAMG3Vw2tl6hg9/JNMg5cfmCD0PM6FxZVTCvaKfSb64YF8oVrOgWuu8XlCQlQ6
	gzF7iXhHUnoI2ZfTqaWV1uLz98GjFtRkITpCbvp7vH8q6IvF6fTMfjWTMECr+OXuF3HTSpUvDDLO2
	l7cbULiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzhr5-00000004pPF-2zic;
	Thu, 27 Aug 2026 21:41:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzhr3-00000004pOj-05j2;
	Thu, 27 Aug 2026 21:41:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9FCF84137B;
	Thu, 27 Aug 2026 21:41:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CF601F00A3A;
	Thu, 27 Aug 2026 21:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787866908;
	bh=+dJ2/89KzJA+YU6uGo5TNo5P0os2bn6e5V8Hm1Oz+DI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OnfQnoc334MVL1rqM4T9D31HFX7jfHs0Bilng0Pyr/1N9g76l9ZjCj1tvsb32Tvg+
	 NbZFOaPvr9c+YrBJIG1sBBMJh3fKztI/Rgaktyp2zN+w2mkG7qBlwg3d/iwwwgtJg5
	 eUOmwMLNOsfv8Zz2LrTpZMkA3Vi3vLmd+cH8MRdwvRkqxTZ3xcmMQEeHRv09vn/p3W
	 vfhdZ420Tlxqw4CZUuTdAe0KL4kMNP68JVKdAJOREBlzVjjHnUgqXcIzivwloSlrJf
	 TMy8d3IkWxZNmcaRPuqEdq8G6lw8ugX7HwrgLnmcvivIg2Z54ycAQ55Dq9H7QZIycM
	 6qmCuWqTR3UyA==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id 330E4C67629; Thu, 27 Aug 2026 22:41:45 +0100 (BST)
Date: Thu, 27 Aug 2026 22:41:45 +0100
From: Mark Brown <broonie@kernel.org>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "bill.roberts@foss.arm.com" <bill.roberts@foss.arm.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"debug@rivosinc.com" <debug@rivosinc.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>,
	"linux-api@vger.kernel.org" <linux-api@vger.kernel.org>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>
Subject: Re: Shadow Stack Locking Semantics between arch's
Message-ID: <apCvGct9U1yprAUE@sirena.org.uk>
References: <a1946d93-370e-4ca9-85d6-60b4a20ffd47@arm.com>
 <3bb672e0-7bc3-434f-904e-aa00394dd01f@foss.arm.com>
 <d20ccb74-69ed-45d7-a810-846904873588@sirena.org.uk>
 <01b0fe86d5700847f78b0e6f839119f54ac88b04.camel@intel.com>
MIME-Version: 1.0
In-Reply-To: <01b0fe86d5700847f78b0e6f839119f54ac88b04.camel@intel.com>
X-Cookie: I think, therefore I am... I think.
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
Content-Type: multipart/mixed; boundary="===============0390566853753652153=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0390566853753652153==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sz/kjGTpENLdkZcp"
Content-Disposition: inline


--sz/kjGTpENLdkZcp
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 09:27:06PM +0000, Edgecombe, Rick P wrote:
> On Thu, 2026-08-27 at 19:14 +0100, Mark Brown wrote:
> > On Thu, Aug 27, 2026 at 12:52:28PM -0500, Bill Roberts wrote:

> > > I am proposing and have questions over the following:
> > > 1. What should the behavior be if you had write locked and disable the
> > > shadow stack?
> > > =A0 - I can argue both ways here, -EPERM or success. I think I and mo=
st arches
> > > lead to failure.

> > Given that RISC-V doesn't support control of writes it's moot there
> > at the minute, and x86 currently uses arch_prctl() so will need an
> > additional API, it seems the path of least resistance is to allow it.
> > This also avoids locking writes (or pushes, for arm64) on effectively
> > also locking enable which seems neater.

> Hmm. I can't think of a reason to lock writes and not lock shadow stack t=
oo.
> Given likely no one is doing this, I wonder if we could change x86's beha=
vior to
> match the others?

> The API would makes more sense to prevent disabling shadow stack if write=
s were
> enabled. It could return an EINVAL regardless if it is locked or not? Is =
that
> the arm behavior (forgetting about locked)?

arm64 currently treats each bit independently for simplicity.  The main
use case I see for actually doing that is for preventing enabling writes
or pushes, though in practice I'd expect something doing locks to just
fully lock everything after having enabled the shadow stack.  We can compose
the features easily enough so it seemed most straightforward to just let
userspace decide what it wants, it keeps the implementation simpler.

> > It has been on my list to look at this
> > repitition at some point, it had been held up by the clone3() stuff but
> > that seems to have died a death for now.

> Oh? What was the blocker?

Basically the glibc people weren't convinced they'd ever want to reuse a
shadow stack at which point having the kernel free and reallocate each time
is just as easy.  It saves having to handle corner cases with threads that
didn't exit cleanly.

--sz/kjGTpENLdkZcp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqQrxMACgkQJNaLcl1U
h9DLvAf/aD6cLja4vh624NoCAxT31xAb2Z0qfo5lbjna4gi96N7QofiM8YSxwqzY
uERaK8TZBR93wojxkcg9W919KwU9yEHlT9nFeyl8wIwpuMKytvR06lOvwh5NRcCU
Vaa8qjM4Sgl1MHes7onoDrjNVprq7Z3ORz5k/ccIjVQue0S1qJoYciFaxw8gQLTp
NJqHqErqED4YmsnbjW94wK8jJGZzvSORNHmk/+i3HkwdmEmg9MIhj7l/uzVuY2V3
+A2aaqVAiOdvscucQ5DV/gzjM4dJc+3qBoEl1OSVF/oXPkbSTC522w2xrJ4tQGQc
cnYEBs+MNTbaDQJ/lzGwAhbr8aoKWg==
=/1d8
-----END PGP SIGNATURE-----

--sz/kjGTpENLdkZcp--


--===============0390566853753652153==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0390566853753652153==--

