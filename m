Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 514F8C7EE39
	for <linux-riscv@archiver.kernel.org>; Sun, 29 Jun 2025 09:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9xw97UIe+9/Ck4GEqQR8iWxGdd1W/LfbDpmWcOPLDcY=; b=rvG8cOVAFZskOkoJnzTRhvZZaL
	fTZMTO9P6xUJG7N8VwDxF+kKWXkxgUvC1X6N/gKeknT8LhsoDyo87tbodSZmdZ+EgUm6gB02pxC49
	s2F0otW8G0vtW5f49TdZXuz7g05uuNICwbl+aV+rp0+C+wtrgfflWFmNk1hfePQggHUKIuwK9lq7p
	CxOmdc6OJUVWZihm7YTOexS1cx+DCet9mQC6i7sZKl4q5uUkBMmOOgyiUBBCFkrpZolUiFRe6w0se
	k/BKZKgg36FyXIHDtgAwiEWF18Cn8CBXM705Qi64c7kkBQ9Dx4ZsucOqPN7L8UnWk33MLiZOKs9jh
	/Qv1JDWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVoG7-000000004jL-1OGW;
	Sun, 29 Jun 2025 09:23:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVoG6-000000004jF-26oR
	for linux-riscv@lists.infradead.org;
	Sun, 29 Jun 2025 09:23:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2846960EDF;
	Sun, 29 Jun 2025 09:23:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A278C4CEEB;
	Sun, 29 Jun 2025 09:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751189011;
	bh=/8XcI162B0sYbFUdY2r+KNvY47NDLVAYfZ9Vy6AeueY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=APVy3NzIX5p4apY8KRVg1ZmIvEwQEDTq6UZR/FZ9m+LtIz8/ayYGDJjMlPtPdii4L
	 egRiF6s1TG9cfHyaH10reV2s9y3JPQCugUSaXMtB9tXHwTfs89bYVWmJMNq42CjaaL
	 tRy2V2+FGgLAYiKSjzECHgOLDQS1Z5feangq6Xyt/pS8cFPpWLlE4fIJ70ox80OKWB
	 po7oweOvG21Inw7nUiV1Z8k9LipbK7CMiXC27kj1ZoDNqGvsyKWFiQiJAUf6eTScES
	 Kpd79FAj4HVzeLW98x0f1r3L3Zk9Yb6dYLguS6ctv/1iiscq1jWqgLXBQJPR3w3Wtg
	 TDnMZIzalfe8g==
Date: Sun, 29 Jun 2025 11:23:28 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
	Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Benno Lossin <lossin@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-pwm@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v5 1/9] rust: pwm: Add Kconfig and basic data structures
Message-ID: <ayp32pdwvpko3zuatgt2jgtfxgcmrmc5aujkx6twjchmyazpz7@yeo3kxgxnpda>
References: <20250623-rust-next-pwm-working-fan-for-sending-v5-0-0ca23747c23e@samsung.com>
 <CGME20250623180858eucas1p1815f6d6815b1c715baad94810cefacd5@eucas1p1.samsung.com>
 <20250623-rust-next-pwm-working-fan-for-sending-v5-1-0ca23747c23e@samsung.com>
 <q7sz7uci5vnyc24laqzs56vgt4i2jamb3ifyxkqom6qcml5kkv@642prvwxjkxc>
 <c127e368-8c1f-4299-b222-a105940ac34e@samsung.com>
MIME-Version: 1.0
In-Reply-To: <c127e368-8c1f-4299-b222-a105940ac34e@samsung.com>
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
Content-Type: multipart/mixed; boundary="===============5363967128338306280=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5363967128338306280==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="f2wvje3fvzd4cjo2"
Content-Disposition: inline


--f2wvje3fvzd4cjo2
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 1/9] rust: pwm: Add Kconfig and basic data structures
MIME-Version: 1.0

Hello Michal,

On Sat, Jun 28, 2025 at 04:38:15PM +0200, Michal Wilczynski wrote:
> On 6/27/25 17:10, Uwe Kleine-K=F6nig wrote:
> > On Mon, Jun 23, 2025 at 08:08:49PM +0200, Michal Wilczynski wrote:
> >> +/// From C: `#define WFHWSIZE 20`
> >> +pub const WFHW_MAX_SIZE: usize =3D 20;
> >=20
> > Can we somehow enforce that this doesn't diverge if the C define is
> > increased?
>=20
> You are absolutely right. The hardcoded value is a maintenance risk. The
> #define is in core.c, so bindgen cannot see it.
>=20
> I can address this by submitting a patch to move the #define WFHWSIZE to
> include/linux/pwm.h. This will make it part of the public API, allow
> bindgen to generate a binding for it, and ensure the Rust code can never
> diverge. Is this fine ?

I wonder if that is the opportunity to create a file
include/linux/pwm-provider.h. In that file we could collect all the bits
that are only relevant for drivers (pwm_ops, pwm_chip, pwmchip_parent,
pwmchip_alloc ...). (Some inline functions depend on some of these, so
some might have to stay in pwm.h)

I can address that in parallel, don't add this quest to your series. So
yes, move WFHWSIZE to include/linux/pwm.h (and rename it to PWM_WFHWSIZE
to not pollute the global namespace).
=20
> > Please don't expose these non-atomic callbacks. pwm_disable() would be
> > fine.
> >=20
> > Otherwise I'd prefer if pwm_set_waveform_might_sleep() is the API
> > exposed to/by Rust.
>=20
>=20
> OK, I'll remove all the setters from the State, while will keep the
> getters, as they would be useful in apply callbacks.

How so? They might be useful for consumers, but my preferred idiom for
them is that they know at each point in time what they want completely
and don't make that dependant on the previous setting.

> Will implement additional functions for Device i.e set_waveform,
> round_waveform and get_waveform, and the new enum to expose the result
> of the round_waveform more idiomatically.
>=20
> /// Describes the outcome of a `round_waveform` operation.
> #[derive(Debug, Clone, Copy, PartialEq, Eq)]
> pub enum RoundingOutcome {
>     /// The requested waveform was achievable exactly or by rounding valu=
es down.
>     ExactOrRoundedDown,
>=20
>     /// The requested waveform could only be achieved by rounding up.
>     RoundedUp,
> }

Sounds good. Hoever I have some doubts about the C semantic here, too.
Is it really helpful to provide that info? A user of that return value
has to check anyhow which parameter got rounded up. If you have an
opinion here, please share.
=20
Best regards
Uwe

--f2wvje3fvzd4cjo2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmhhBgsACgkQj4D7WH0S
/k4sxAf8C8i/gRngTHVBR6MQlOBH/NsBUPpJbWQypLdM2xSscvdCFQtAnbKJP5Hg
Fk/8joL6WEKb7BN0t1Rpx3P+C1P+H9VjHACvOz5hYp6QTgdMHr7Z7zYnyB+ZsmDs
f1IWj6JAgc5MO0OdhVCzS0jCCWRPkJU6yW1zSnnmPFHETHykahwz7KUHp7uqolNG
/PT8WLOAVCVQBdr9eo/QEzjQgdw9+p2Lhx7P7ereaDHKZR4eZrOpwUsTw6/1uORP
E1CyN5JrfLo6hmM0A6dbfanJJm1Nb/wyoLk5aJq77K8wXFUFjZ2TcLrC2+98udwH
IOjOEMaf5kponiXidNjXdH/Mdk6oQA==
=3eXa
-----END PGP SIGNATURE-----

--f2wvje3fvzd4cjo2--


--===============5363967128338306280==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5363967128338306280==--

