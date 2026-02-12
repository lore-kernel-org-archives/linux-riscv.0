Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DCF5EDF04C
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Feb 2026 08:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=chrn4KMHhrxfNWawayj+u8pGVAo1nxbs/eb0ZxaJK2Q=; b=aB+QV4+T2RCZ5qxGz1IzbnyEFV
	IegKwBFRq5ZfizU233jxWuMWVvBFQpNMS+bkuiDECGp4oP+C8iRUPmpcq1iFReasVfkiAw+saUPjC
	m9kEaXoKD2OUSJ+nRJLB2ZXsn4Ym0HC3sONZabSG3Am/D0UZlOL/WcBnWTy5Jnz2l74pRLDREGc6j
	rABtA5ZkL8jQ3689A8OXZzUl6oZtqhk6o0LHlsUhna2U0Uunkv9KpqK6/HBcgQF1pk4ibwPUwa0vS
	GPBNI3Mrp/dTSGTY1n4Xw7MDv1V0TV1e2Aw7ZtzKVKXEG9xZdtLcR3Flt+bVA0jZhhSGg5ue6+okx
	GOi+sK7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqRc4-00000001jbY-1s4m;
	Thu, 12 Feb 2026 07:59:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqRc1-00000001jar-35ri
	for linux-riscv@lists.infradead.org;
	Thu, 12 Feb 2026 07:59:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D667C44298;
	Thu, 12 Feb 2026 07:59:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46A9CC4CEF7;
	Thu, 12 Feb 2026 07:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770883184;
	bh=LJheg+1Lg6iUUverc5R9e3b/E+Zn96jS/50T1K8tIOo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ttK4hrrUAk9Se4Kpm1hdtQ0fM5zBEuqymzqkEsY7MPfJlVtzyId3ENAhGqJTKxHJ9
	 qk208j5OhxM/VJh96rLEhX9/GlU/phYgceJLrZbONswdhiGwIdX5dS/TcPuYtxrizC
	 uFGBTCzuznFlBWgsHGk7zbkdKPw5a8WRpKTTgomhmDFQM4iOD4J1k3xPSEh3nlOi4W
	 Z/zqkvFTnL13LBUEX+UXQCDRAt+9R/ZWr347UbIwpgC7VDoBln2hE+534MN6bUWXd1
	 tcU5oSB09ywdfm7aSQX1nuaburzzjrUcRU9bme+LtMd2MCdx1H9NtHxE71PkIxIOvy
	 rn077zqo3xnHA==
Date: Thu, 12 Feb 2026 08:59:37 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Alice Ryhl <aliceryhl@google.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org, 
	linux-pwm@vger.kernel.org, linux-clk@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 1/3] rust: clk: use the type-state pattern
Message-ID: <20260212-obedient-faithful-koel-d8aaf6@houat>
References: <20260119-weightless-pelican-of-anger-190db0@houat>
 <DFSN4FDCYHMW.3J3237PEBV2ZP@kernel.org>
 <20260122-majestic-masterful-jaguarundi-d0abde@houat>
 <2F3D3A40-6EF9-46FC-A769-E5A3AAF67E65@collabora.com>
 <20260204-nickel-seal-of-poetry-8fdefb@houat>
 <91A92D84-1F2E-45F3-82EC-6A97D32E2A78@collabora.com>
 <20260204-angelic-vermilion-beagle-fd1507@houat>
 <20260209105047.693f2515@fedora>
 <20260211-flawless-feathered-boar-0b87ad@houat>
 <DGCAAE4YEDLO.299F5M641E90B@kernel.org>
MIME-Version: 1.0
In-Reply-To: <DGCAAE4YEDLO.299F5M641E90B@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_235945_819527_AA712E26 
X-CRM114-Status: GOOD (  23.47  )
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
Content-Type: multipart/mixed; boundary="===============4020110483466953299=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4020110483466953299==
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="33m6meqnrfzcdzlc"
Content-Disposition: inline


--33m6meqnrfzcdzlc
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 1/3] rust: clk: use the type-state pattern
MIME-Version: 1.0

On Wed, Feb 11, 2026 at 05:47:09PM +0100, Danilo Krummrich wrote:
> On Wed Feb 11, 2026 at 5:37 PM CET, Maxime Ripard wrote:
> > I do think we can find a compromise though. Miguel suggested for example
> > to make the current enable/prepare/disable/unprepare function unsafe,
> > and that's totally reasonable to me.
> >
> > Then we can implement the "managed" clock version on that unsafe API,
>=20
> What do you mean with "managed" clock? Do you mean devres managed? If so,=
 I
> don't think there is any reason to switch to the unsafe API to be able to
> implement devres managed APIs (see also [1]).
>=20
> [1] https://lore.kernel.org/all/DFVW9MS5YLON.CVJDBYQKJ0P6@kernel.org/

By that, I mean what Daniel has been proposing to achieve with this series.

> > and we would end up with a "raw", unsafe, version kind of equivalent to
> > the one we have today, and where callers would have to justify why their
> > usage of the API is actually safe, or the new, managed, variant that is
> > safe and can be easily used by most drivers.
> >
> > And we can call these RawClk vs Clk, or Clk vs ManagedClk, or whatever.
> >
> > How does that sound?
>=20
> What about we just wait until we have a user that really requires an unsa=
fe API
> for some reason? And if it never appears, even better. :)

It works *today*.

And the "oh but driver is using the API" is kind of ironic in the
context of the Rust bindings which have globally been in that situation
for years. You can't argue it both ways.

Either way, I'm not sure what the point of that submission was if you
will just dismiss diverging opinions, including attempts to compromise.

Do whatever you want, but it's really hard to root for you some times.

Maxime

--33m6meqnrfzcdzlc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaY2IZAAKCRAnX84Zoj2+
dgqqAX9ZKKvbeCpd4Vk6D0P2PgLPgXEzVbGysMUart7lUZ4iDk9GcFwLa7X8pXMl
DWKl2eEBf3hYz3Rv+1FNd/mQ9KtcUckYXXnZxYqCguLOzqUcX4VORUfxwQwckRE4
yTfjWW6Akw==
=V0pG
-----END PGP SIGNATURE-----

--33m6meqnrfzcdzlc--


--===============4020110483466953299==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4020110483466953299==--

