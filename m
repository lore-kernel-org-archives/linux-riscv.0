Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E64C8EE3682
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Feb 2026 13:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hgfv4zFzPN9lf8sfQrtcHteGxED3/fp9B2tS0/MLzEU=; b=VzRvgf2uoxmVKUlNdN6HvnJByD
	+Myr7n8wV6zOtP50LuPKEW59Er4An3oEn51i3AN96S7L7oOB5YVa9X8fWWs8KEY3+FX3nMi6TTgdh
	ebchL4jHCUK5MoTpEt5u2Yj3CQLbCxL7jXsDQv2iD/1/jQ1bqzbBvf9/yyjzPixjXXLOVci9dfj7m
	Lz9UV7a9Zn5KJvH8NIfn2tNjfwhyS34qmVPM5QhwnJDWm4MLDRC22e5SPS6B9fyaXa4uqnb4oPqF8
	v1DAoc9aHPSlCb2QPLMG9uSZYxAR885Pr7vJ3DCg7XSo/5gEz0yDy8Uoxmt8VTfGRM7HHB+pFJyZb
	SGpA1RlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqWtm-0000000296L-2I5L;
	Thu, 12 Feb 2026 13:38:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqWtk-0000000295w-2t95
	for linux-riscv@lists.infradead.org;
	Thu, 12 Feb 2026 13:38:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D5EB140AE4;
	Thu, 12 Feb 2026 13:38:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33C76C4CEF7;
	Thu, 12 Feb 2026 13:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770903503;
	bh=rllsvS5vCvLouAChQEOMtRmUwKUDPEURx2urJ+uvPlY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dkvdZmwMXBcBLaDqhrvu5KUcJ+JYQqpgg3sgFG+oGJeT7Adm+RMikI/+UKfn4xr+4
	 72u7NAh2eFOOL+ZwVSRtIL+cksx5baiKTWNH197JEW0XnKvoCpzjsV/A5uDekKqHhb
	 e2DpXAosQE5kKHUym/sNk1Y6evumdwGveIqZnJFbSPohj1fV1JxAlZvrcJtKrop9tP
	 jr3OtAwdWZ/CNfjiiDUM6dyuPfeDfOF2UXMOu3mX0qp2vrxbT9y9w4a6hgf5KdfiCe
	 6B+fKnUuMApKQk3XFo+tWM/gS8n9223P30NhMdU0H0ilMDospXdcKn3wpSkMiFPDtp
	 KnYddVCDt5rNw==
Date: Thu, 12 Feb 2026 14:38:20 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Danilo Krummrich <dakr@kernel.org>, 
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
Message-ID: <20260212-lumpy-uptight-petrel-cac725@houat>
References: <20260119-weightless-pelican-of-anger-190db0@houat>
 <DFSN4FDCYHMW.3J3237PEBV2ZP@kernel.org>
 <20260122-majestic-masterful-jaguarundi-d0abde@houat>
 <2F3D3A40-6EF9-46FC-A769-E5A3AAF67E65@collabora.com>
 <20260204-nickel-seal-of-poetry-8fdefb@houat>
 <91A92D84-1F2E-45F3-82EC-6A97D32E2A78@collabora.com>
 <20260204-angelic-vermilion-beagle-fd1507@houat>
 <20260209105047.693f2515@fedora>
 <20260211-flawless-feathered-boar-0b87ad@houat>
 <CAH5fLgiQE7mJBpAxv6xTVKKFWadg2GdVe31hRM6gNk3Vah61MA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAH5fLgiQE7mJBpAxv6xTVKKFWadg2GdVe31hRM6gNk3Vah61MA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_053824_782338_815C3221 
X-CRM114-Status: GOOD (  69.39  )
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
Content-Type: multipart/mixed; boundary="===============3779543521498485683=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3779543521498485683==
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="txoc7rlouq7hrwvr"
Content-Disposition: inline


--txoc7rlouq7hrwvr
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 1/3] rust: clk: use the type-state pattern
MIME-Version: 1.0

Hi Alice,

On Thu, Feb 12, 2026 at 09:16:51AM +0100, Alice Ryhl wrote:
> On Wed, Feb 11, 2026 at 5:37=E2=80=AFPM Maxime Ripard <mripard@kernel.org=
> wrote:
> > On Mon, Feb 09, 2026 at 10:50:47AM +0100, Boris Brezillon wrote:
> > > On Wed, 4 Feb 2026 15:34:29 +0100
> > > Maxime Ripard <mripard@kernel.org> wrote:
> > >
> > > > On Wed, Feb 04, 2026 at 09:43:55AM -0300, Daniel Almeida wrote:
> > > > > > I'm probably missing something then, but let's assume you have =
a driver
> > > > > > that wants its clock prepared and enabled in an hypothetical en=
able()
> > > > > > callback, and disabled / unprepared in a disable() callback.
> > > > > >
> > > > > > From a PM management perspective, this usecase makes total sens=
e, is a
> > > > > > valid usecase, is widely used in the kernel, and is currently s=
upported
> > > > > > by both the C and Rust clk APIs.
> > > > > >
> > > > > > The only solution to this you suggested so far (I think?) to im=
plement
> > > > > > this on top of the new clk API you propose is to have a driver =
specific
> > > > > > enum that would store each of the possible state transition.
> > > > >
> > > > > Yes, you need an enum _if_ you want to model transitions at runti=
me. IIUC you
> > > > > only need two variants to implement the pattern you described. I =
do not
> > > > > consider this  =E2=80=9Cboilerplate=E2=80=9D, but rather a small =
cost to pay.
> > > >
> > > > A maintenance cost to pay by every driver is kind of the textbook
> > > > definition of boilerplate to me.
> > > >
> > > > > I would understand if this was some elaborate pattern that had to=
 be
> > > > > implemented by all drivers, but a two-variant enum is as
> > > > > straightforward as it gets.
> > > >
> > > > And yet, that framework has dozens of helpers that do not remove
> > > > anything from drivers but a couple of lines. So surely its users mu=
st
> > > > find value in reducing that boilerplate as much as possible. And yo=
u do
> > > > implement some of them, so you must find value in that too.
> > > >
> > > > > > That's the boilerplate I'm talking about. If every driver wanti=
ng to
> > > > > > implement that pattern has to make such an enum, with all the r=
elevant
> > > > > > traits implementation that might come with it, we go from an AP=
I where
> > > > > > everything works at no-cost from a code-size perspective to a s=
ituation
> > > > > > where every driver has to develop and maintain that enum.
> > > > >
> > > > > There are no "traits that come with it". It's just an enum, with =
two
> > > > > variants.
> > > > >
> > > > > > API where everything works at no-cost
> > > > >
> > > > > The previous API was far from =E2=80=9Ceverything works=E2=80=9D.=
 It was fundamentally
> > > > > broken by design in multiple ways, i.e.:
> > > >
> > > > Out of context and not what I meant, but ok.
> > > >
> > > > > > a) It only keeps track of a count to clk_get(), which means tha=
t users have
> > > > > > to manually call disable() and unprepare(), or a variation of t=
hose, like
> > > > > > disable_unprepare().
> > > > > >
> > > > > > b) It allows repeated calls to prepare() or enable(), but it ke=
eps no track
> > > > > > of how often these were called, i.e., it's currently legal to w=
rite the
> > > > > > following:
> > > > > >
> > > > > > clk.prepare();
> > > > > > clk.prepare();
> > > > > > clk.enable();
> > > > > > clk.enable();
> > > > > >
> > > > > > And nothing gets undone on drop().
> > > > >
> > > > > IMHO, what we have here is an improvement that has been long over=
due.
> > > >
> > > > Nothing is absolute. It is indeed an improvement on the refcounting=
 side
> > > > of things and general safety of the API for the general case. I don=
't
> > > > think I ever questionned that.
> > > >
> > > > However, for the use-cases we've been discussing (and dozens of dri=
vers
> > > > implementing it), it also comes with a regression in the amount of =
code
> > > > to create and maintain. They used to be able to only deal with the =
Clk
> > > > structure, and now they can't anymore.
> > > >
> > > > You might find that neglible, you might have a plan to address that=
 in
> > > > the future, etc. and that's fine, but if you can't acknowledge that=
 it's
> > > > indeed happening, there's no point in me raising the issue and
> > > > continuing the discussion.
> > >
> > >
> > > Okay, let's see if I can sum-up the use case you'd like to support. Y=
ou
> > > have some PM hooks, which I'm assuming are (or will be) written in
> > > rust. It will probably take the form of some Device{Rpm,Pm} trait to
> > > implement for your XxxDeviceData (Xxx being the bus under which is
> > > device is) object (since I've only recently joined the R4L effort, I
> > > wouldn't be surprised if what I'm describing already exists or is
> > > currently being proposed/reviewed somewhere, so please excuse my
> > > ignorance if that's the case :-)).
> > >
> > > The way I see it, rather than having one enum per clk/regulator/xxx
> > > where we keep track of each state individually, what we could have is=
 a
> > >
> > > trait DevicePm {
> > >       type ResumedState;
> > >       type SuspendedState;
> > >
> > >       fn resume(&self, state: SuspendedState) -> Result<ResumedState,=
 Error<SuspendedState>>;
> > >       fn suspend(&self, state: SuspendedState) -> Result<SuspendedSta=
te, Error<ResumedState>>;
> > > };
> > >
> > > enum DeviceState<T: DevicePm> {
> > >       Resumed(T::ResumedState),
> > >       Suspended(T::SuspendedState),
> > > };
> > >
> > > and then in your driver:
> > >
> > > MySuspendedDeviceResources {
> > >       xxx_clk: Clk<Unprepared>,
> > > };
> > >
> > > MyResumedDeviceResources {
> > >       xxx_clk: Clk<Enabled>,
> > > };
> > >
> > > implem DevicePm for MyDevice {
> > >       type ResumedState =3D MyResumedDeviceResources;
> > >       type SuspendedState =3D MySuspendedDeviceResources;
> > >
> > >       fn resume(&self, state: SuspendedState) -> Result<ResumedState,=
 Error<SuspendedState>> {
> > >               // FIXME: error propagation not handled
> > >               let enabled_clk =3D state.xxx_clk.clone().prepare()?.en=
able()?;
> > >
> > >               Ok(ResumedState {
> > >                       xxx_clk: enabled_clk,
> > >               });
> > >       }
> > >
> > >       fn suspend(&self, state: ResumedState) -> Result<SuspendedState=
, Error<ResumedState>> {
> > >               // FIXME: error propagation not handled
> > >               let unprep_clk =3D state.xxx_clk.clone().disable().unpr=
epare();
> > >
> > >               Ok(SuspendedState {
> > >                       xxx_clk: unprep_clk,
> > >               });
> > >       }
> > > };
> >
> > I'm not sure we need to associate this with the suspend/resume state ei=
ther.
> >
> > > With this model, I don't think Daniel's refactor goes in the way of m=
ore
> > > generalization at the core level, it's just expressed differently than
> > > it would be if it was written in C. And I say that as someone who str=
uggles
> > > with his C developer bias every time I'm looking at or trying to write
> > > rust code.
> > >
> > > As others have said in this thread (Danilo and Gary), and after having
> > > played myself with both approaches in Tyr, I do see this shift from m=
anual
> > > prepare/enable to an RAII approach as an improvement, so I hope we can
> > > find a middle-ground where every one is happy.
> >
> > I do think we can find a compromise though. Miguel suggested for example
> > to make the current enable/prepare/disable/unprepare function unsafe,
> > and that's totally reasonable to me.
> >
> > Then we can implement the "managed" clock version on that unsafe API,
> > and we would end up with a "raw", unsafe, version kind of equivalent to
> > the one we have today, and where callers would have to justify why their
> > usage of the API is actually safe, or the new, managed, variant that is
> > safe and can be easily used by most drivers.
> >
> > And we can call these RawClk vs Clk, or Clk vs ManagedClk, or whatever.
> >
> > How does that sound?
>=20
> If you make the raw API unsafe, then that's okay but any use of an
> unsafe API from a driver will receive very hard scrutiny.

And that's totally fair to me. If drivers want to have a more optimal
but potentially unsafe use of the API, then it should be flagged,
documented and scrutinized.

> Yes, there are occasionally good reasons to use unsafe from drivers,
> but the entire point of this Rust exercise is to isolate unsafe code
> outside of drivers as much as possible.

So, aside from the risk of fuckups, are you concerned about something
here? Do you expect that scrutiny to be constly on the maintenance side
of things?

I guess what I'm asking is: except for the obvious "review" cost
associated with it, why would that be a probleme if we have, say, a few
dozen drivers using that unsafe API?

> If Daniel's proposal is inconvenient for some drivers, it would be far
> better to have a third API that is both safe and convenient for those
> drivers.

Yeah, I guess I was expecting that one to come after we have a few
unsafe drivers using it and we do need to consolidate / make it safe.

Anyway, thanks for your answer,
Maxime

--txoc7rlouq7hrwvr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaY3XyAAKCRAnX84Zoj2+
dlsCAX9YhXML2BwaihExT0HPvJLXsg7BkixgzooQn3BNo99C/1mpiA9oVlfe7oN6
WtWXkFUBgNp/U2OwfFwHtXpmeiv3x4zUulob7WSFkpPuLmDcuRD2SCrprKpMjAff
ouyyljoqFw==
=j/VR
-----END PGP SIGNATURE-----

--txoc7rlouq7hrwvr--


--===============3779543521498485683==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3779543521498485683==--

