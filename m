Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D1BBD29C28
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jan 2026 14:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ycskvB+qNftQcxdaqHc0SW5pfAJ8cpasr8yptU43hqg=; b=pIEwa+MuPlL50/wyUYKvTmQ+Wp
	XdJ1ofN6u0RR6kSAQe1ajfEQdrjw+NyS13glXuCr0AERTGMn2+KpBxQDP8xMMMFvHZeU1HtlnxbnL
	FqfYb5ZghIl1ikRb0xNZfvBEReVVNf4owXVjTdq2Rc5BuFn8AuJ86Z+boOHABlHuyq7t1urzzOhrh
	q2so2QwVrMzrvgf4bTvA9OxcXy7VKPfc26ASGEXqry0djDbkKxTVbImmXxLXXKlg2x8Hypu+VR/e4
	9ZNir2y57QfCE0DMt6crEEw6ENUh4o9Uibn0v04EbNCpDyI3wj+oSxc6a7XrbtVGFG1bDeNL2AgeV
	bOhyRKXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhq5L-00000002ER5-2y0S;
	Mon, 19 Jan 2026 14:18:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhq5K-00000002EPo-07xl
	for linux-riscv@lists.infradead.org;
	Mon, 19 Jan 2026 14:18:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 003E460054;
	Mon, 19 Jan 2026 14:18:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38F2DC116C6;
	Mon, 19 Jan 2026 14:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768832304;
	bh=g6qrItnXMxcK3sBx2w2hINmGUZoc1FHx9rc2/Deh1w4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u/HzqjlFn89iTnbgsjVBbFaaAX8iA9juCrVxQTDKOk+56MYyQVWqWypq2zudCyxxF
	 xwifbk4Y9koJzFuv77q7WlbwW4pAvZYHv2ll+GUscpHdOyeaR6wKcrkbnM68X1VgeE
	 LXFw8tFWkHzmSTmpkOBx8lW02NyIos8+A/OLBWuEfg7GQv+9DOprFx7ghY48c8vp8Z
	 PM2L5fN7erxQOScsLMFvu6cTPiJSmjeHOHj5XP49Yc1YFqhlTq1Pr7Rd5M837c5Prv
	 0hsW0Ohqal/kRcivh0XAXNkgGyZzvSn3kzZGB5G/BTOYm1w2NM+CirwL7q2WfySqC0
	 Hi9u18ygS+AIA==
Date: Mon, 19 Jan 2026 15:18:22 +0100
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
Message-ID: <20260119-weightless-pelican-of-anger-190db0@houat>
References: <20260107-clk-type-state-v3-0-77d3e3ee59c2@collabora.com>
 <20260107-clk-type-state-v3-1-77d3e3ee59c2@collabora.com>
 <20260108-delectable-fennec-of-sunshine-ffca19@houat>
 <98CD0BF6-3350-40B9-B8A9-F569AE3E3220@collabora.com>
 <20260119-thundering-tested-robin-4be817@houat>
 <aW4lCfUyumOKRRJm@google.com>
 <518D8B09-B9A1-4DB4-85CD-37A2DD3D5FB1@collabora.com>
 <DFSLCI9U4NCW.2HI2UPUI7G134@kernel.org>
MIME-Version: 1.0
In-Reply-To: <DFSLCI9U4NCW.2HI2UPUI7G134@kernel.org>
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
Content-Type: multipart/mixed; boundary="===============4568145029208164303=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4568145029208164303==
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="r35gw42txiia2ftk"
Content-Disposition: inline


--r35gw42txiia2ftk
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 1/3] rust: clk: use the type-state pattern
MIME-Version: 1.0

On Mon, Jan 19, 2026 at 02:13:48PM +0100, Danilo Krummrich wrote:
> On Mon Jan 19, 2026 at 1:54 PM CET, Daniel Almeida wrote:
> >> On 19 Jan 2026, at 09:35, Alice Ryhl <aliceryhl@google.com> wrote:
> >> I think that if you still want an API where you just call enable/disab=
le
> >> directly on it with no protection against unbalanced calls, then that
> >> should be the special API. Probably called RawClk and functions marked
> >> unsafe. Unbalanced calls seem really dangerous and use should not be
> >> encouraged.
>=20
> +1; and unless there is a use-case that requires otherwise, it should not=
 even
> be possible to do this at all -- at least for driver code.

I mean, it's great, it's safe, etc. but it's also suboptimal from a PM
perspective on many platforms. It's totally fine to provide nice, safe,
ergonomic wrappers for the drivers that don't care (or can't, really),
but treating a legitimate optimisation as something we should consider
impossible to do is just weird to me.

> > I think we should discourage RawClk if at all possible. But if the cons=
ensus
> > is that we *really* need this easily-abused thing, I can provide a foll=
ow-up.
>=20
> I think we should only do this if there are use-case with no alternative,=
 so far
> there haven't been any AFAIK.

I don't really care about which alternative we come up with, but look at
devm_regmap_init_mmio_clk for example. It is a valid use-case that
already exists today, and has had for more than a decade at this point.

Maxime

--r35gw42txiia2ftk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaW49KQAKCRAnX84Zoj2+
dt7aAYDAMMq5goJ8F57+R0eeu9IhG+g9NsslhFNxDOjuXCzZBC9Ltj1x0emRNsNP
1EtPX4EBf1g1bAHKFfkK+3azvdKbnVWe1wt6p0rsd5eyTrS+H10Rm8yBv9VpeDtW
pAS+fwDmJQ==
=s+g7
-----END PGP SIGNATURE-----

--r35gw42txiia2ftk--


--===============4568145029208164303==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4568145029208164303==--

