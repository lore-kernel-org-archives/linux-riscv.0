Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E44EEE36A7
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Feb 2026 16:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yTMObkAfTFXtjsLciWyMQqgtks8AbWOnvxeY+BwjaXQ=; b=zWtvhvEjbYN0cBbdkCNl90fnc6
	GhPEHXE2lMB0OTHvRaQow+3rGLOKllcBGnjGwieNBt0DkZ5F0isPnXj+gjdZ+Mh0pgD9ipW5zI1N+
	XbpYLWnZniuTeLOfL68PJ4GOdKwRC6plUIwHBY9KByLgkm6TK2wPzI5cAxzJ31W8ZMO5jYFtJpZxX
	BwQx+gLBSt3OB+ov+a12IjM0JfI4MTHdQwF5bhsUnqwOLcuT0diFgjtfWgvf9rD1RQK90u0aOw9mU
	dGxI2KtJKvdwxrRAmoJ2ZfXXFIqdcDR4Pa36Q9vBplUdpzShp6kIgBvJLIqTZT0804mAEzktjTkj1
	ptuiX7sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqZtU-00000002Ooj-3Ip3;
	Thu, 12 Feb 2026 16:50:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqZtS-00000002Onb-1q8F
	for linux-riscv@lists.infradead.org;
	Thu, 12 Feb 2026 16:50:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0EDD34418F;
	Thu, 12 Feb 2026 16:50:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B66FC4CEF7;
	Thu, 12 Feb 2026 16:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770915017;
	bh=6/L3qcDz13lCIx9mHbD9dGJB0TmFBixrjcOzhn9oAHw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XFLa3Oj9PqL9cz3jw6Wo+dftv5fsqlrlMjW8+KMHeWJOyculKI2Ccdr+L8ODeCO8c
	 aKcjlwFCZL/rwCaNRxCJR7r14DZ9Q1HGJOWyO5W5oGiWZEq+jInCIlC5rW9zVVIc/C
	 1kRbOlQ1/QTJI6SnTBgg+GLFJSMI3hP0dWQhATKK+4sWgDf+Cy+OQwFv8zT2kloIGW
	 FQCZfVbA1JNvxlDQP/eBwO9HXvR3vEU0B9JcqWPyniJUSbCzV+3nydO4YsEB1QvK7r
	 vPTKASg8d2D4Hr6HYmsjfQ8BuVrXVQ8GBfxx4az66OZR+BP/qRwtE287jArd/19VMU
	 HlCkl7ht4vidw==
Date: Thu, 12 Feb 2026 17:50:15 +0100
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
Message-ID: <20260212-married-cuscus-of-purring-d981df@houat>
References: <2F3D3A40-6EF9-46FC-A769-E5A3AAF67E65@collabora.com>
 <20260204-nickel-seal-of-poetry-8fdefb@houat>
 <91A92D84-1F2E-45F3-82EC-6A97D32E2A78@collabora.com>
 <20260204-angelic-vermilion-beagle-fd1507@houat>
 <20260209105047.693f2515@fedora>
 <20260211-flawless-feathered-boar-0b87ad@houat>
 <DGCAAE4YEDLO.299F5M641E90B@kernel.org>
 <20260212-obedient-faithful-koel-d8aaf6@houat>
 <DGCVH2B2OSFR.1C912TO7G7DGL@kernel.org>
 <DGD1E42JOSQ3.28RPL84IP5R9I@kernel.org>
MIME-Version: 1.0
In-Reply-To: <DGD1E42JOSQ3.28RPL84IP5R9I@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_085018_520261_880668E8 
X-CRM114-Status: GOOD (  15.74  )
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
Content-Type: multipart/mixed; boundary="===============5393904083822611143=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5393904083822611143==
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="mdnefkmb6s5e2wir"
Content-Disposition: inline


--mdnefkmb6s5e2wir
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 1/3] rust: clk: use the type-state pattern
MIME-Version: 1.0

On Thu, Feb 12, 2026 at 03:01:31PM +0100, Danilo Krummrich wrote:
> On Thu Feb 12, 2026 at 10:23 AM CET, Danilo Krummrich wrote:
> > In particular, I don't think we need an unsafe API until we see a concr=
ete
> > example where the proposed safe API does not work (and no other safe AP=
I would
> > work either).
>=20
> One additional note for clarification, I'm not saying that I'm against an=
 unsafe
> API if it is necessary.
>=20
> In fact, I have added an unsafe API for drivers myself with the dma::Devi=
ce
> trait [1]. This was not an easy decision and I discussed this back and fo=
rth
> with a lot of people and, unfortunately, we had to come to the conclusion=
 that
> any attempt to make this safe from the Rust side of things would cause
> unreasonable overhead and can't be considered an overall improvement.
>=20
> But as I said, I am convinced that need clear evidence that an unsafe API=
 is
> actually needed and that there is no reasonable alternative.
>=20
> [1] https://rust.docs.kernel.org/kernel/dma/trait.Device.html

Ok, it works for me then.

Maxime

--mdnefkmb6s5e2wir
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaY4ExgAKCRAnX84Zoj2+
dqhKAX93rIM2qpVkVlwviOQI6S+T7Ts6iHOS+UqsVha/4UcNl5FYG/A6dAI0eZoR
lADDMTcBgIJWnQpTYiIe9pJBJvuvlLDabMuss9c/GAY08Fj167fMF9+GQXhc0PUG
eqTQtmHvrA==
=U1en
-----END PGP SIGNATURE-----

--mdnefkmb6s5e2wir--


--===============5393904083822611143==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5393904083822611143==--

