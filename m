Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B0B6ECD6C1
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Feb 2026 16:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gzwmI4Tprr3eJp1xHVFeG/tWY5T4b1QvmcoXuadRhww=; b=UaqE54U0G/3MjCilMBKvyqLAba
	h36b/lbtJ/RXsH7Mp6XDj0pY7oaq9i2+ZN7iXZFSdm3BflaJQxCh226SJahLnDZHf16H9MP0W/dar
	31kpUACCWkCqVPmhwA0M70grJqMvLW9ljYwL3fvA9OPObrz2ucbElT5L3yj2m5z0EcqHD9vYlzRsU
	tPuP29m2BoThl9bvRBfQpmn48fckRAnckPnPatEF7KUWgfK+HbU++20P3HvDxoCfvsAh5doXAjg5x
	KjtS7ROk9F5uoTcMTWt9juSipHJCm9mhzNOrEQ30GrEBKiXg3ebcyfZeHDh+BmxQjRtdjtqjkCmoL
	XTXPBInw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqDDz-00000000qoR-35xk;
	Wed, 11 Feb 2026 16:37:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqDDw-00000000qo0-3T8J
	for linux-riscv@lists.infradead.org;
	Wed, 11 Feb 2026 16:37:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2B1C5443A6;
	Wed, 11 Feb 2026 16:37:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F105C4CEF7;
	Wed, 11 Feb 2026 16:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770827875;
	bh=N4BFmuWQ/WPOUmQeIFOT/JQw3aZcuNZ5Ic0+qE7JO5A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YTrP6Ifgrg5QMICHMqBxdHlpO2tyOdVv6eoq2NRvoIBL5ZJg5/FGwIJGuQ6hTShf6
	 QyNyhheDUm/u4Y+R2nhlRVH6fOB69LV3xfGaMcnc56Kgk1Dnx14hl9aZNNWVcPVkwS
	 bElLBxZT1KuRNO1Y3tDFHWr+618kqWCvcsdmfotCjre41jFdSYgNAdYjbTHchFzeqe
	 xBpgNs7DeR2zQn5CLt86nzEM1gqZrls2adrD0thGMYE1ex2V9/eqyIc83/sVgeNYJ7
	 xAWYlp5he/08r44o/x1f4S39Pu4vU2kcTop7JcuQhtOHUwsD/Wr1BqfPMITELR+UV2
	 bAGpo6qi4PWIw==
Date: Wed, 11 Feb 2026 17:37:52 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, 
	Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
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
Message-ID: <20260211-flawless-feathered-boar-0b87ad@houat>
References: <518D8B09-B9A1-4DB4-85CD-37A2DD3D5FB1@collabora.com>
 <DFSLCI9U4NCW.2HI2UPUI7G134@kernel.org>
 <20260119-weightless-pelican-of-anger-190db0@houat>
 <DFSN4FDCYHMW.3J3237PEBV2ZP@kernel.org>
 <20260122-majestic-masterful-jaguarundi-d0abde@houat>
 <2F3D3A40-6EF9-46FC-A769-E5A3AAF67E65@collabora.com>
 <20260204-nickel-seal-of-poetry-8fdefb@houat>
 <91A92D84-1F2E-45F3-82EC-6A97D32E2A78@collabora.com>
 <20260204-angelic-vermilion-beagle-fd1507@houat>
 <20260209105047.693f2515@fedora>
MIME-Version: 1.0
In-Reply-To: <20260209105047.693f2515@fedora>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_083756_909048_9BB70E94 
X-CRM114-Status: GOOD (  56.68  )
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
Content-Type: multipart/mixed; boundary="===============5936849245097639452=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5936849245097639452==
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="va37xmuzn6sqyd6c"
Content-Disposition: inline


--va37xmuzn6sqyd6c
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 1/3] rust: clk: use the type-state pattern
MIME-Version: 1.0

On Mon, Feb 09, 2026 at 10:50:47AM +0100, Boris Brezillon wrote:
> Hi Maxime,
>=20
> On Wed, 4 Feb 2026 15:34:29 +0100
> Maxime Ripard <mripard@kernel.org> wrote:
>=20
> > On Wed, Feb 04, 2026 at 09:43:55AM -0300, Daniel Almeida wrote:
> > > > I'm probably missing something then, but let's assume you have a dr=
iver
> > > > that wants its clock prepared and enabled in an hypothetical enable=
()
> > > > callback, and disabled / unprepared in a disable() callback.
> > > >=20
> > > > From a PM management perspective, this usecase makes total sense, i=
s a
> > > > valid usecase, is widely used in the kernel, and is currently suppo=
rted
> > > > by both the C and Rust clk APIs.
> > > >=20
> > > > The only solution to this you suggested so far (I think?) to implem=
ent
> > > > this on top of the new clk API you propose is to have a driver spec=
ific
> > > > enum that would store each of the possible state transition. =20
> > >=20
> > > Yes, you need an enum _if_ you want to model transitions at runtime. =
IIUC you
> > > only need two variants to implement the pattern you described. I do n=
ot
> > > consider this  =E2=80=9Cboilerplate=E2=80=9D, but rather a small cost=
 to pay. =20
> >=20
> > A maintenance cost to pay by every driver is kind of the textbook
> > definition of boilerplate to me.
> >=20
> > > I would understand if this was some elaborate pattern that had to be
> > > implemented by all drivers, but a two-variant enum is as
> > > straightforward as it gets. =20
> >=20
> > And yet, that framework has dozens of helpers that do not remove
> > anything from drivers but a couple of lines. So surely its users must
> > find value in reducing that boilerplate as much as possible. And you do
> > implement some of them, so you must find value in that too.
> >=20
> > > > That's the boilerplate I'm talking about. If every driver wanting to
> > > > implement that pattern has to make such an enum, with all the relev=
ant
> > > > traits implementation that might come with it, we go from an API wh=
ere
> > > > everything works at no-cost from a code-size perspective to a situa=
tion
> > > > where every driver has to develop and maintain that enum. =20
> > >
> > > There are no "traits that come with it". It's just an enum, with two
> > > variants.
> > >  =20
> > > > API where everything works at no-cost =20
> > >=20
> > > The previous API was far from =E2=80=9Ceverything works=E2=80=9D. It =
was fundamentally
> > > broken by design in multiple ways, i.e.: =20
> >=20
> > Out of context and not what I meant, but ok.
> >=20
> > > > a) It only keeps track of a count to clk_get(), which means that us=
ers have
> > > > to manually call disable() and unprepare(), or a variation of those=
, like
> > > > disable_unprepare().
> > > >=20
> > > > b) It allows repeated calls to prepare() or enable(), but it keeps =
no track
> > > > of how often these were called, i.e., it's currently legal to write=
 the
> > > > following:
> > > >=20
> > > > clk.prepare();
> > > > clk.prepare();
> > > > clk.enable();
> > > > clk.enable();
> > > >=20
> > > > And nothing gets undone on drop(). =20
> > >=20
> > > IMHO, what we have here is an improvement that has been long overdue.=
 =20
> >=20
> > Nothing is absolute. It is indeed an improvement on the refcounting side
> > of things and general safety of the API for the general case. I don't
> > think I ever questionned that.
> >=20
> > However, for the use-cases we've been discussing (and dozens of drivers
> > implementing it), it also comes with a regression in the amount of code
> > to create and maintain. They used to be able to only deal with the Clk
> > structure, and now they can't anymore.
> >=20
> > You might find that neglible, you might have a plan to address that in
> > the future, etc. and that's fine, but if you can't acknowledge that it's
> > indeed happening, there's no point in me raising the issue and
> > continuing the discussion.
>=20
>=20
> Okay, let's see if I can sum-up the use case you'd like to support. You
> have some PM hooks, which I'm assuming are (or will be) written in
> rust. It will probably take the form of some Device{Rpm,Pm} trait to
> implement for your XxxDeviceData (Xxx being the bus under which is
> device is) object (since I've only recently joined the R4L effort, I
> wouldn't be surprised if what I'm describing already exists or is
> currently being proposed/reviewed somewhere, so please excuse my
> ignorance if that's the case :-)).
>=20
> The way I see it, rather than having one enum per clk/regulator/xxx
> where we keep track of each state individually, what we could have is a
>=20
> trait DevicePm {
> 	type ResumedState;
> 	type SuspendedState;
>=20
> 	fn resume(&self, state: SuspendedState) -> Result<ResumedState, Error<Su=
spendedState>>;
> 	fn suspend(&self, state: SuspendedState) -> Result<SuspendedState, Error=
<ResumedState>>;
> };
>=20
> enum DeviceState<T: DevicePm> {
> 	Resumed(T::ResumedState),
> 	Suspended(T::SuspendedState),
> };
>=20
> and then in your driver:
>=20
> MySuspendedDeviceResources {
> 	xxx_clk: Clk<Unprepared>,
> };
>=20
> MyResumedDeviceResources {
> 	xxx_clk: Clk<Enabled>,
> };
>=20
> implem DevicePm for MyDevice {
> 	type ResumedState =3D MyResumedDeviceResources;
> 	type SuspendedState =3D MySuspendedDeviceResources;
>=20
> 	fn resume(&self, state: SuspendedState) -> Result<ResumedState, Error<Su=
spendedState>> {
> 		// FIXME: error propagation not handled
> 		let enabled_clk =3D state.xxx_clk.clone().prepare()?.enable()?;
>=20
> 		Ok(ResumedState {
> 			xxx_clk: enabled_clk,
> 		});
> 	}
>=20
> 	fn suspend(&self, state: ResumedState) -> Result<SuspendedState, Error<R=
esumedState>> {
> 		// FIXME: error propagation not handled
> 		let unprep_clk =3D state.xxx_clk.clone().disable().unprepare();
>=20
> 		Ok(SuspendedState {
> 			xxx_clk: unprep_clk,
> 		});
> 	}
> };

I'm not sure we need to associate this with the suspend/resume state either.

> With this model, I don't think Daniel's refactor goes in the way of more
> generalization at the core level, it's just expressed differently than
> it would be if it was written in C. And I say that as someone who struggl=
es
> with his C developer bias every time I'm looking at or trying to write
> rust code.
>
> As others have said in this thread (Danilo and Gary), and after having
> played myself with both approaches in Tyr, I do see this shift from manual
> prepare/enable to an RAII approach as an improvement, so I hope we can
> find a middle-ground where every one is happy.

I do think we can find a compromise though. Miguel suggested for example
to make the current enable/prepare/disable/unprepare function unsafe,
and that's totally reasonable to me.

Then we can implement the "managed" clock version on that unsafe API,
and we would end up with a "raw", unsafe, version kind of equivalent to
the one we have today, and where callers would have to justify why their
usage of the API is actually safe, or the new, managed, variant that is
safe and can be easily used by most drivers.

And we can call these RawClk vs Clk, or Clk vs ManagedClk, or whatever.

How does that sound?

Maxime

--va37xmuzn6sqyd6c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaYywWgAKCRAnX84Zoj2+
diFgAX9NbiTV8lVrQ44u9f4DSVUDq686eOaj7uci6rHY5OPcA0wNpSJTAhKA8TuV
919XgiwBgM5+jjSrFFfXQ56tF54ch32+uMVDYbpBRp2fx+0+OfxMqCuAQkASAYrZ
mfHt8q7GSg==
=MEar
-----END PGP SIGNATURE-----

--va37xmuzn6sqyd6c--


--===============5936849245097639452==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5936849245097639452==--

