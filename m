Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC5CFEE36A7
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Feb 2026 16:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WNBci2w9lpUP4w2VqTaZnF3zs0RsF0E7mrcfX3XTz+g=; b=XdmM5gDS2uI8c5RW6BasVidBxL
	TVGqxngWwuVC4NHSBGzeo3UO5Hfb1vdwVMOSe/7ncVgjL+7a/KJ42jbfbFtmYdCU8P5WK95TVvnUp
	4oJwDid5Mq7IJl9kayQeMcuPC086tbCIGEchULyHQWwvOqld8SaCGWEIt3NXU1LkEiZCZ5fWLguLJ
	ZL09isShS+xtFIRkrXjCcciNwMZ9iqggWeilvno7h6ablow9sbqccNpCbvUfDCP6gKEJ5JJ1EoGaK
	D4iyyFwItpjGqVFf3wG7FZpVc/L480RhlSUFjCPo+8M6Rj/f0aDydqi+rHfIreWj07b+v3e2Dqrfe
	cNed7kcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqZra-00000002OD8-1tSR;
	Thu, 12 Feb 2026 16:48:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqZrY-00000002OBI-0Gu0
	for linux-riscv@lists.infradead.org;
	Thu, 12 Feb 2026 16:48:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C178A43681;
	Thu, 12 Feb 2026 16:48:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DF50C16AAE;
	Thu, 12 Feb 2026 16:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770914898;
	bh=q+f22IKM+7oDgPx1p+U0JbLKWr29fM3HhKvzV2Lrh0E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ddDQr9Ov0wdCXnzhvnV0xDVdak4L008itDoDOF4wszDGI7EVLjGSWkzMuheE2dvfl
	 dTA9quEB8HyEz9bOHYRgYdVv8yIVUErYv+rtMhUJeV3LcKjZUev+IipEfyyFaZwq4S
	 SZFAr9DslzjIYxe4j9F/uLOJd0txJ/rotJs0JMPc510WLWkQI4128TONMIaCW1ZxM9
	 MBF9IA1Pz8DGZUzMxnfnz5dQot4Ca/mZn/2krB3noNNAxS2DB5VFBqTpGtz/HVu6KC
	 /0ETr+/y5WBOA4vFNthnUZ1sP0xEiHO77jBaqW9Hc7U2Sfnbaf3NJ4UP1LTGZoqLBS
	 eDVXQNTFyH41g==
Date: Thu, 12 Feb 2026 17:48:15 +0100
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
Message-ID: <20260212-tangible-cormorant-of-art-4cccc1@houat>
References: <20260122-majestic-masterful-jaguarundi-d0abde@houat>
 <2F3D3A40-6EF9-46FC-A769-E5A3AAF67E65@collabora.com>
 <20260204-nickel-seal-of-poetry-8fdefb@houat>
 <91A92D84-1F2E-45F3-82EC-6A97D32E2A78@collabora.com>
 <20260204-angelic-vermilion-beagle-fd1507@houat>
 <20260209105047.693f2515@fedora>
 <20260211-flawless-feathered-boar-0b87ad@houat>
 <CAH5fLgiQE7mJBpAxv6xTVKKFWadg2GdVe31hRM6gNk3Vah61MA@mail.gmail.com>
 <20260212-lumpy-uptight-petrel-cac725@houat>
 <CAH5fLghyg-QzT11gehvwTb2ii4FA-dkse=QtYD0Tc5MT5Dhd7A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAH5fLghyg-QzT11gehvwTb2ii4FA-dkse=QtYD0Tc5MT5Dhd7A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_084820_139642_87A0FA79 
X-CRM114-Status: GOOD (  17.83  )
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
Content-Type: multipart/mixed; boundary="===============7280361194593176241=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7280361194593176241==
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="dbdpntgsivj6czxx"
Content-Disposition: inline


--dbdpntgsivj6czxx
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 1/3] rust: clk: use the type-state pattern
MIME-Version: 1.0

On Thu, Feb 12, 2026 at 03:02:09PM +0100, Alice Ryhl wrote:
> On Thu, Feb 12, 2026 at 2:38=E2=80=AFPM Maxime Ripard <mripard@kernel.org=
> wrote:
> > > If Daniel's proposal is inconvenient for some drivers, it would be far
> > > better to have a third API that is both safe and convenient for those
> > > drivers.
> >
> > Yeah, I guess I was expecting that one to come after we have a few
> > unsafe drivers using it and we do need to consolidate / make it safe.
>=20
> For most things, we implemented and used the safe API from the very
> start. I'm not going to say there are never exceptions to that because
> there *are* exceptions. But I don't really see why clk should be one
> of them.

Ack. As long as we keep the door open for such an API, I'm ok with it then.

Maxime

--dbdpntgsivj6czxx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaY4ESwAKCRAnX84Zoj2+
dgMGAYDwVhpcVy2I/4At/4AEhe8kCxuQ+xhKgZNEU8NDV2gD3fruRA3uVDT/oLFc
w7Hr2JQBf3j9aeMFs5MIgwYTmWIdKIEKAoAdpfPF2hrWVPdhIpmKgffsPCQiOzu7
lF/MDm8OZw==
=DOmR
-----END PGP SIGNATURE-----

--dbdpntgsivj6czxx--


--===============7280361194593176241==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7280361194593176241==--

