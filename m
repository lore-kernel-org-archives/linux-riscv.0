Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E91E9D3E7
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Feb 2026 14:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xmTluP67JY72I0rTYAHvqTiuDMCWw8JxmVOLVI2m2NY=; b=XPyQkzxo6lfauwDL2jD0tYirmz
	bYWfu+q5B8p2AexklBD94iqVFKE3WIBCmZq0JRBjyndYMG2/fAWr4m5KD0MMLTmjG3mryk4q3GM9p
	R2ccobzEUW1pgj9xlGlmw33VV9f//QFjYeG7etBDnYTZgq9g92a6f6p/QUIAh1cooV+XzmhuVBu0F
	2L9s3/xLchH0lgwR+CNLwL8HxcTch79LRYFAa+O+N6AgX04dER2kVIPx+NhQDPsZUqdn4j5TQdbbm
	1D7uwh+rjkWDyVmAaY8Qt3ha1o/SCuJtUtNDVaTClqjZioOv4jt+t09IIx9NEcs7mynR79pdNWJ2e
	8SodMTYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vndxi-00000008b4c-0mlk;
	Wed, 04 Feb 2026 14:34:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vndxg-00000008b47-193F
	for linux-riscv@lists.infradead.org;
	Wed, 04 Feb 2026 14:34:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 96DA440BDC;
	Wed,  4 Feb 2026 14:34:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8E2AC4CEF7;
	Wed,  4 Feb 2026 14:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770215671;
	bh=qwW0E3km7Imz+Ih8y6CvkTb1Tgc1MA3d/Qg0OSOn85k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gx/BQ7evxp6zGTeDdYoeq3cHPDxwjrQbY50Ss5ol6uWNa+m6MGxM9SEfyVAjON7T4
	 iwKsc/t0UJOg4gYwqSRE9ScZwhNIgNZZrSTVUsEwEKrpQ3tDKLF0LFaGYdKLU/mCQQ
	 ibCvVC4jzkyf+i3JTkD+wqYf33swZRh3fZWbrqJZ2nB6S9TvL8EWJlV2qDzisdv5VT
	 LRrEeWKgxTGv+UnV12pBS94uB6vmZZbEnBNazaqkB6dxHGK67rJZOfYuDOW8cOaZdb
	 JvBaq6akDKJuCavqkeSkUmbXjrUkL7aP6dDrNmkMQaSxRwqi54I9vUJBj8EpYlqyGw
	 6DdWz+yJivXRg==
Date: Wed, 4 Feb 2026 15:34:29 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
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
Message-ID: <20260204-angelic-vermilion-beagle-fd1507@houat>
References: <20260119-thundering-tested-robin-4be817@houat>
 <aW4lCfUyumOKRRJm@google.com>
 <518D8B09-B9A1-4DB4-85CD-37A2DD3D5FB1@collabora.com>
 <DFSLCI9U4NCW.2HI2UPUI7G134@kernel.org>
 <20260119-weightless-pelican-of-anger-190db0@houat>
 <DFSN4FDCYHMW.3J3237PEBV2ZP@kernel.org>
 <20260122-majestic-masterful-jaguarundi-d0abde@houat>
 <2F3D3A40-6EF9-46FC-A769-E5A3AAF67E65@collabora.com>
 <20260204-nickel-seal-of-poetry-8fdefb@houat>
 <91A92D84-1F2E-45F3-82EC-6A97D32E2A78@collabora.com>
MIME-Version: 1.0
In-Reply-To: <91A92D84-1F2E-45F3-82EC-6A97D32E2A78@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_063432_349946_A1AF77E8 
X-CRM114-Status: GOOD (  34.48  )
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
Content-Type: multipart/mixed; boundary="===============7839639567338934321=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7839639567338934321==
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="qsblwuvkhfiyygwy"
Content-Disposition: inline


--qsblwuvkhfiyygwy
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 1/3] rust: clk: use the type-state pattern
MIME-Version: 1.0

On Wed, Feb 04, 2026 at 09:43:55AM -0300, Daniel Almeida wrote:
> > I'm probably missing something then, but let's assume you have a driver
> > that wants its clock prepared and enabled in an hypothetical enable()
> > callback, and disabled / unprepared in a disable() callback.
> >=20
> > From a PM management perspective, this usecase makes total sense, is a
> > valid usecase, is widely used in the kernel, and is currently supported
> > by both the C and Rust clk APIs.
> >=20
> > The only solution to this you suggested so far (I think?) to implement
> > this on top of the new clk API you propose is to have a driver specific
> > enum that would store each of the possible state transition.
>=20
> Yes, you need an enum _if_ you want to model transitions at runtime. IIUC=
 you
> only need two variants to implement the pattern you described. I do not
> consider this  =E2=80=9Cboilerplate=E2=80=9D, but rather a small cost to =
pay.

A maintenance cost to pay by every driver is kind of the textbook
definition of boilerplate to me.

> I would understand if this was some elaborate pattern that had to be
> implemented by all drivers, but a two-variant enum is as
> straightforward as it gets.

And yet, that framework has dozens of helpers that do not remove
anything from drivers but a couple of lines. So surely its users must
find value in reducing that boilerplate as much as possible. And you do
implement some of them, so you must find value in that too.

> > That's the boilerplate I'm talking about. If every driver wanting to
> > implement that pattern has to make such an enum, with all the relevant
> > traits implementation that might come with it, we go from an API where
> > everything works at no-cost from a code-size perspective to a situation
> > where every driver has to develop and maintain that enum.
>
> There are no "traits that come with it". It's just an enum, with two
> variants.
>=20
> > API where everything works at no-cost
>=20
> The previous API was far from =E2=80=9Ceverything works=E2=80=9D. It was =
fundamentally
> broken by design in multiple ways, i.e.:

Out of context and not what I meant, but ok.

> > a) It only keeps track of a count to clk_get(), which means that users =
have
> > to manually call disable() and unprepare(), or a variation of those, li=
ke
> > disable_unprepare().
> >=20
> > b) It allows repeated calls to prepare() or enable(), but it keeps no t=
rack
> > of how often these were called, i.e., it's currently legal to write the
> > following:
> >=20
> > clk.prepare();
> > clk.prepare();
> > clk.enable();
> > clk.enable();
> >=20
> > And nothing gets undone on drop().
>=20
> IMHO, what we have here is an improvement that has been long overdue.

Nothing is absolute. It is indeed an improvement on the refcounting side
of things and general safety of the API for the general case. I don't
think I ever questionned that.

However, for the use-cases we've been discussing (and dozens of drivers
implementing it), it also comes with a regression in the amount of code
to create and maintain. They used to be able to only deal with the Clk
structure, and now they can't anymore.

You might find that neglible, you might have a plan to address that in
the future, etc. and that's fine, but if you can't acknowledge that it's
indeed happening, there's no point in me raising the issue and
continuing the discussion.

Maxime

--qsblwuvkhfiyygwy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaYNY7AAKCRAnX84Zoj2+
dse/AXsGeJch3I0bMyx52I9cEf+Sxmls2zkB6ONfE0zIrOQMV2G4Snz3Z01b1itP
KS0DtvABgNL1o1ryYS9P8eHOi2y4d6qYsbQfxCQ0B9xEbJpvTbkBm30967SOJrBI
4I9o9NicZA==
=izfb
-----END PGP SIGNATURE-----

--qsblwuvkhfiyygwy--


--===============7839639567338934321==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7839639567338934321==--

