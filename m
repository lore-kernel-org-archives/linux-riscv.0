Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99002D3EE67
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 13:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1da0zLp1/xdMVajFhpaM0CaAe/wqbTGbvItiS79SEUA=; b=Y0pgqr1cKEX3gcVi32EKIN2J5W
	ayBBEjXxBebBZYa/7k+bbUejIc4ZnRY8H10H/xxEsgu++fQ/jDifJozjVkPXXQgBj6VBfL090eItz
	mfzYI+WeVHFHqQ7uEqNxb1G0ZJUYlpwkIpwyPw6IkvxNEM74wi+fTxdQ2aiSjG5HNteNd3cJVXWtj
	A3h7HQfYiNFmI1VOr1A655PlxyBowgrIJBMCEmniA8SnoVrGnnTVB4TIvH5V8CNebyuTBl9Sy+OD7
	QcZl/wHxd1b+iYE7E7HiBg49x7LFZ5P/x7StXkImcNSYlLprsTpKr2QMXbaXUTnTPZqAY52RV7YTC
	nxXSi/+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viuzZ-00000007AdM-0Csx;
	Thu, 22 Jan 2026 13:44:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viuzW-00000007Ad1-3BFi
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 13:44:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 106B141A3D;
	Thu, 22 Jan 2026 13:44:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C125C116C6;
	Thu, 22 Jan 2026 13:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769089491;
	bh=j8JEqlvIFnXt9gGEm0Oheoh75nKbbz8Bdg2iudx4Y8w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MiijZP2PgQ7cWwM/BrL4/aHqDuWgWt7buVDitzOLLgQdCeGQbRri9VRoWsknB6BOs
	 MW4NXW6W74RdY0fAsK6Bdd8gp3rRRx5EUSq74/zd+Y3DQk3JDvoomz7nvfQXW4sYLt
	 5NK4v3hzZ1ozM6HXvxIyYNRKjNtql6nEd8fORfMN3aJ57Fm0fNPpqIpF07lBZJNEqe
	 bh1lrnUZrr3xfZB+VMQmhgzNd1DvOX4XxCozUKLJsUOQjxjF4TFLjOaa5sReHLH4/Q
	 rdTHw5qscsZCtb4v7dlQUXKGr6CN30WBw/AIPOWvt9r6gzUfBUhamrC89amGEuE/MZ
	 erbPngC11saWw==
Date: Thu, 22 Jan 2026 14:44:49 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, 
	Alice Ryhl <aliceryhl@google.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Fu Wei <wefu@redhat.com>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org, 
	linux-pwm@vger.kernel.org, linux-clk@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 1/3] rust: clk: use the type-state pattern
Message-ID: <20260122-majestic-masterful-jaguarundi-d0abde@houat>
References: <20260107-clk-type-state-v3-0-77d3e3ee59c2@collabora.com>
 <20260107-clk-type-state-v3-1-77d3e3ee59c2@collabora.com>
 <20260108-delectable-fennec-of-sunshine-ffca19@houat>
 <98CD0BF6-3350-40B9-B8A9-F569AE3E3220@collabora.com>
 <20260119-thundering-tested-robin-4be817@houat>
 <aW4lCfUyumOKRRJm@google.com>
 <518D8B09-B9A1-4DB4-85CD-37A2DD3D5FB1@collabora.com>
 <DFSLCI9U4NCW.2HI2UPUI7G134@kernel.org>
 <20260119-weightless-pelican-of-anger-190db0@houat>
 <DFSN4FDCYHMW.3J3237PEBV2ZP@kernel.org>
MIME-Version: 1.0
In-Reply-To: <DFSN4FDCYHMW.3J3237PEBV2ZP@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_054454_835468_09D317B7 
X-CRM114-Status: GOOD (  32.14  )
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
Content-Type: multipart/mixed; boundary="===============1230977376438340371=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1230977376438340371==
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="zgoq7kx6iu4jzgjw"
Content-Disposition: inline


--zgoq7kx6iu4jzgjw
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 1/3] rust: clk: use the type-state pattern
MIME-Version: 1.0

On Mon, Jan 19, 2026 at 03:37:17PM +0100, Danilo Krummrich wrote:
> On Mon Jan 19, 2026 at 3:18 PM CET, Maxime Ripard wrote:
> > On Mon, Jan 19, 2026 at 02:13:48PM +0100, Danilo Krummrich wrote:
> >> On Mon Jan 19, 2026 at 1:54 PM CET, Daniel Almeida wrote:
> >> >> On 19 Jan 2026, at 09:35, Alice Ryhl <aliceryhl@google.com> wrote:
> >> >> I think that if you still want an API where you just call enable/di=
sable
> >> >> directly on it with no protection against unbalanced calls, then th=
at
> >> >> should be the special API. Probably called RawClk and functions mar=
ked
> >> >> unsafe. Unbalanced calls seem really dangerous and use should not be
> >> >> encouraged.
> >>=20
> >> +1; and unless there is a use-case that requires otherwise, it should =
not even
> >> be possible to do this at all -- at least for driver code.
> >
> > I mean, it's great, it's safe, etc. but it's also suboptimal from a PM
> > perspective on many platforms. It's totally fine to provide nice, safe,
> > ergonomic wrappers for the drivers that don't care (or can't, really),
> > but treating a legitimate optimisation as something we should consider
> > impossible to do is just weird to me.
>=20
> I said that an unsafe API with potentially unbalanced calls is something =
we
> should clearly avoid for drivers. This is *not* equivalent to "treating a
> legitimate optimisation as something we should consider impossible".
>=20
> If we discover use-cases where the current API doesn't work well, we can
> invenstigate further.

I'm not sure I'm following what you're saying, sorry. I've pointed out
such a use-case already.

> >> > I think we should discourage RawClk if at all possible. But if the c=
onsensus
> >> > is that we *really* need this easily-abused thing, I can provide a f=
ollow-up.
> >>=20
> >> I think we should only do this if there are use-case with no alternati=
ve, so far
> >> there haven't been any AFAIK.
> >
> > I don't really care about which alternative we come up with, but look at
> > devm_regmap_init_mmio_clk for example. It is a valid use-case that
> > already exists today, and has had for more than a decade at this point.
>=20
> I don't see the issue with devm_regmap_init_mmio_clk()? It takes a refere=
nce
> count of the clock and prepares it when called and unprepares the clk in =
drops
> its reference in regmap_mmio_free_context() called from the devres callba=
ck.
>=20
> That something we can easily do with the current API, no?

The current one, yes. Doing that in the API suggested here would involve
some boilerplate in all those drivers they don't have right now.

Maxime

--zgoq7kx6iu4jzgjw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaXIp0AAKCRAnX84Zoj2+
dv/rAX9htC+v4VP6TU5rtpJ5yxn/5pIK0gwosc19iO/daFXAUH7fxYosU1HBuveb
KxjMgb8BgMuQtaOp2idk6EzXwAecWf/CAQ08Ci5MNA2QR6rNT2nYPbr8TNKaiLWq
nIzGXz2HvQ==
=cTWW
-----END PGP SIGNATURE-----

--zgoq7kx6iu4jzgjw--


--===============1230977376438340371==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1230977376438340371==--

