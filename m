Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C0E5CCF2E3
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jan 2026 10:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vQhTX2C2MgMR9VtbeIWZI46jKpS95uFQChwAYI+dh2Q=; b=aMBKIblu1qrsF7EeOewWn13PMr
	gJa2ykaQvuJwKUc3jjhBr6Y9uxkvxgRsYsDAO+zD6m4NxFYl0ykEhbuoTKnAfRogQgLBdWBKo5i35
	CnjeM1UL6rERGT4/U/vOskGL5hD/Dwr/v2qPSmw7HZrtsKleHa4W1M7M+ynS4oW85t5hFV7wjbCzX
	9bH/1ZqAHfrlFevz57BTVStDHRBG2D8ZqiMxH8mby4TIzX8O2n4c1Ee/jTCt9DJfKeUXFRKNNhHnk
	p37eS6DLrR8JOeJrTslDz97N2QzL1qWZLqm0EXfPrNSojsW6a3kTk5a7P+lzNwK1cirhaLACnaSPW
	gOygwu3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmlw-00000001oMA-0Hw2;
	Mon, 19 Jan 2026 10:46:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmll-00000001oLS-0vQt
	for linux-riscv@lists.infradead.org;
	Mon, 19 Jan 2026 10:46:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4BF7B6014E;
	Mon, 19 Jan 2026 10:46:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77CB5C116C6;
	Mon, 19 Jan 2026 10:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768819560;
	bh=rkpu5Kvdq4UjpgR+E/cyIKMWzAhUNtRYXVnLJ7du0CY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AC/jLJl+k4VzXeZjIYCjP7hmA5yOAwefAhLFkpRm4OEWHZFtQe/EnP4XOe7qYmfe9
	 uvH93sd58BoTMx+bkl0xL91VjFXSMY9LAxDMPbk/nmkiDNdtlQHb14dv2o22jGGJRv
	 iyyRzQFouO3cFZ2V4zZZ31Yn4nKyfAUlmUEd+6KlP4GqzVp9X/5WK032EJ6ESCVpyj
	 qyB2QBROYwRKy8//DkjcBIL1QXVbgNCbRlGP12hfWS8G4MuJPyr+Ja6x2lMs3MjYo5
	 /pG9J6BKQ/nTeS22hYFdhc/XIIK7rkkgAtw/jxHOMbhnqbKr6aZIqWLp9+7mrh4iKK
	 1yX8JUcNL9nRQ==
Date: Mon, 19 Jan 2026 11:45:57 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Danilo Krummrich <dakr@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
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
Message-ID: <20260119-thundering-tested-robin-4be817@houat>
References: <20260107-clk-type-state-v3-0-77d3e3ee59c2@collabora.com>
 <20260107-clk-type-state-v3-1-77d3e3ee59c2@collabora.com>
 <20260108-delectable-fennec-of-sunshine-ffca19@houat>
 <98CD0BF6-3350-40B9-B8A9-F569AE3E3220@collabora.com>
MIME-Version: 1.0
In-Reply-To: <98CD0BF6-3350-40B9-B8A9-F569AE3E3220@collabora.com>
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
Content-Type: multipart/mixed; boundary="===============1711063723241602944=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1711063723241602944==
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="3exjby5pwbo6o3lx"
Content-Disposition: inline


--3exjby5pwbo6o3lx
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 1/3] rust: clk: use the type-state pattern
MIME-Version: 1.0

On Thu, Jan 08, 2026 at 11:14:37AM -0300, Daniel Almeida wrote:
> Hi Maxime :)
>=20
> >=20
> > I don't know the typestate pattern that well, but I wonder if we don't
> > paint ourselves into a corner by introducing it.
> >=20
> > While it's pretty common to get your clock from the get go into a state,
> > and then don't modify it (like what devm_clk_get_enabled provides for
> > example), and the typestate pattern indeed works great for those, we
>=20
> Minor correction, devm_clk_get_enabled is not handled by the typestate
> pattern. The next patch does include this function for convenience, but
> you get a Result<()>. The typestate pattern is used when you want more
> control.
>
> > also have a significant number of drivers that will have a finer-grained
> > control over the clock enablement for PM.
> >=20
> > For example, it's quite typical to have (at least) one clock for the bus
> > interface that drives the register, and one that drives the main
> > component logic. The former needs to be enabled only when you're
> > accessing the registers (and can be abstracted with
> > regmap_mmio_attach_clk for example), and the latter needs to be enabled
> > only when the device actually starts operating.
> >=20
> > You have a similar thing for the prepare vs enable thing. The difference
> > between the two is that enable can be called into atomic context but
> > prepare can't.
> >=20
> > So for drivers that would care about this, you would create your device
> > with an unprepared clock, and then at various times during the driver
> > lifetime, you would mutate that state.
> >=20
> > AFAIU, encoding the state of the clock into the Clk type (and thus
> > forcing the structure that holds it) prevents that mutation. If not, we
> > should make it clearer (by expanding the doc maybe?) how such a pattern
> > can be supported.
> >=20
> > Maxime
>=20
> IIUC, your main point seems to be about mutating the state at runtime? Th=
is is
> possible with this code. You can just have an enum, for example:
>=20
> enum MyClocks {
> 	Unprepared(Clk<Unprepared>),
>         Prepared(Clk<Prepared>),
> 	Enabled(Clk<Enabled>),=20
> }
>=20
> In fact, I specifically wanted to ensure that this was possible when writ=
ing
> these patches, as it=E2=80=99s needed by drivers. If you want to, I can c=
over that in
> the examples, no worries.

Yes, that would be great. I do wonder though if it wouldn't make sense
to turn it the other way around. It creates a fair share of boilerplate
for a number of drivers. Can't we keep Clk the way it is as a
lower-level type, and crate a ManagedClk (or whatever name you prefer)
that drivers can use, and would be returned by higher-level helpers, if
they so choose?

That way, we do have the typestate API for whoever wants to, without
creating too much boilerplate for everybody else.

Maxime

--3exjby5pwbo6o3lx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaW4LYAAKCRAnX84Zoj2+
dnZsAX9nFpCf4rHo08JAKymz1W+q/77It0LDePnr7Z4FcKcAaOFxzUQGcpfN+CD1
J+nBTwsBfRDR1L+GOUsrfRdzMmZlqPL4YaO+ZfgoF503ccIvPNhgVoyA+Vmf3hAc
YZBwZl6Ufw==
=sXrk
-----END PGP SIGNATURE-----

--3exjby5pwbo6o3lx--


--===============1711063723241602944==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1711063723241602944==--

