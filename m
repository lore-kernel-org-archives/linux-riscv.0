Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A965EEF316
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Mar 2026 08:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DXZdQGpEd4ry1eoJwJ6oGeEyNx75vEA5fgCM4tzoUuo=; b=owMhdxgdp8a0zSAqxbXhDss5/s
	8PGEFHlHE1ZQ247odyWTe1+mxEQsSxWi9y7v3VPYoppOrx5QGrBoIA11HUAB+1IPhcyKRAUA3/e0H
	kW33kArjZWTtOc5vqtHXL38aqyMFhdG/Ykh/EwKDHqNLK6CYGDJT6ykQpwS3AICAjN11uaKPKGB2T
	SoFb9ANZ25jWpJr6pCa6aUgpDK0MNfBIh+Si7z4qYoT3RAjAEmWfiW8HDBNBHFRyqOeFqmO4ia/5W
	DpIl1AILZFHt8NevYYT2DsMrM8KOBasSskRKARtGqf1x/PUlXOoQZyzScKjlmaLLS13Xe7L5/fqrG
	KHS/nldw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy40e-00000001Bc8-3WZd;
	Thu, 05 Mar 2026 08:24:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy40c-00000001BbA-0sSD
	for linux-riscv@lists.infradead.org;
	Thu, 05 Mar 2026 08:24:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B81B344330;
	Thu,  5 Mar 2026 08:24:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AFFBC2BC9E;
	Thu,  5 Mar 2026 08:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772699076;
	bh=v9aqov2TRju92BUkePwYkzbYjnrsweKBt5HjUS1ipP0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Esq7gGZU0KXs35RQU+pRlI1hgRQdxYIiLM86nXyEIyCQU01GYI19QdoSxNiwazxtb
	 amix2JoNVwSw4sHwRX3GaRsSGHP3oMYdlKSU2WBjkb5dY8S+Z/qMrUI0igGiit/ebl
	 EpQYoux7iIB/RdepnrDkfAXKEPEl9C1XqqRL/UnEIROc9kL4kuSOGfrCE3T61m8xtC
	 mhfz6afBq6fQwsKYcva3+3WIGl4XWrNfxbUL32wxY79TmAi1f0EQl3VDDWv+huynVD
	 r/g0D1cAC8Lggqh/H7lVjcJ/nM4kvBuAHF13ttzcQ5ww/I1MaSPwikStFIfZh/4Xg0
	 MGUlxzUri/dKA==
Date: Thu, 5 Mar 2026 09:24:33 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>, 
	Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Alice Ryhl <aliceryhl@google.com>, 
	Michael Turquette <mturquette@baylibre.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Fu Wei <wefu@redhat.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	linux-clk@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 3/3] pwm: th1520: remove impl Send/Sync for
 Th1520PwmDriverData
Message-ID: <aak9ZBJenK1DSCEt@monoceros>
References: <20260113-clk-send-sync-v4-0-712bc7d94a79@google.com>
 <CGME20260113151335eucas1p157cd966c5f0f4e477fb11272810a0ae8@eucas1p1.samsung.com>
 <20260113-clk-send-sync-v4-3-712bc7d94a79@google.com>
 <90657b83-1cff-4c7d-adde-9b560c2be7c2@samsung.com>
 <3cfeounnaphhezvjpz5igswml6iu3b6jhwhjn2g4ziimjdoefi@ge4ezxx6jxlr>
MIME-Version: 1.0
In-Reply-To: <3cfeounnaphhezvjpz5igswml6iu3b6jhwhjn2g4ziimjdoefi@ge4ezxx6jxlr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_002438_428885_167721E7 
X-CRM114-Status: GOOD (  18.25  )
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
Content-Type: multipart/mixed; boundary="===============6086066458972413432=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6086066458972413432==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ygr7vi7eyprc7gqk"
Content-Disposition: inline


--ygr7vi7eyprc7gqk
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 3/3] pwm: th1520: remove impl Send/Sync for
 Th1520PwmDriverData
MIME-Version: 1.0

Hello,

On Tue, Jan 20, 2026 at 09:48:48AM +0100, Uwe Kleine-K=F6nig wrote:
> On Mon, Jan 19, 2026 at 10:45:56PM +0100, Michal Wilczynski wrote:
> > On 1/13/26 16:12, Alice Ryhl wrote:
> > > Now that clk implements Send and Sync, we no longer need to manually
> > > implement these traits for Th1520PwmDriverData. Thus remove the
> > > implementations.
> >=20
> > I thought this was already merged :-).
> >=20
> > Reviewed-by: Michal Wilczynski <m.wilczynski@samsung.com>
>=20
> If I understand correctly this patch 3 depends on the first patch of
> this series so I cannot pick it up via the pwm tree *now*. There is
> another patch pending for the th1520 PWM driver, but as of now git seems
> to cope well when merging the pwm's tree for-next with this patch.  So
> it's fine for me if the series is picked up for 6.20-rc1 via the clock
> tree.

That didn't happen (with s/6.20/7.0/), so this patch is still open in my
todo list. Is the first patch still considered for the clk subsystem?
What is the plan for the pwm patch?

Best regards
Uwe

--ygr7vi7eyprc7gqk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmmpPb4ACgkQj4D7WH0S
/k6AYgf+IFbJpwiUp9P8Rmry4DJdrF6HeXt7L7+0cSOAtSjz8246LrMcqOZN03RB
YAi8NxU8tZw4Ib54H+GNZUp+gf4jryjO+ry/HXrbC9giXxYVAPBzNhRLgpLUXsm/
dIJFq7MwB5s7zFnJ6F/u2kD/cCvzCgokFftc831AAAOI7oFD0yZx6nHS/FT60M9B
eK4cNPn/MEB3vgaxHub02lpr0ctEd+s9sPzbmUobR5KI4yqf60VKycdMGfZtu/m6
h/nZTyq/u+CEZP92L59gx7GPKTnJZ2XcHKXJSw5wgPiNCYRWn4s1EbKXA6uvKQV5
r6wXppJz8sU18n8EljYkeht9uPMW0g==
=NxJx
-----END PGP SIGNATURE-----

--ygr7vi7eyprc7gqk--


--===============6086066458972413432==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6086066458972413432==--

