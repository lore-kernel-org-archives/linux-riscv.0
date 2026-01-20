Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FD5BD2ED0F
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jan 2026 08:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0gkgZWQsT/Twouk198MWGNV8Umg2OYn43721l65i9wc=; b=FPmr3+Bu5tc8DzDYWskLxOAcqa
	8s9Ro1st9lEFz7IgJjNZttZPixUed5BcIJigSNSQre3wThfE8jereCVPN701DDpG+2AtpEkMnAkrE
	ZGZZT2t1crizX0xMw1FsJGi+g96lsJMqxGQuELS3q1o0TJaaayUPx7UuorfYfiBp4HPjRpCzFLt3w
	2HFqTaWZPi81fQWOgIKhtf0YKmrICyPySs/X1Gf8+WChyc2tKBv0ozq2NB+cWY5dp7gdkOIQR6QHr
	cC/RAflQS1kOe2Furcwb54DOtkoE1ahoVr0H4+oXe2jJaviXJJ+d2FUroygmfDb8h/HGlPrANde+y
	UD6d010w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi7Pz-00000003TxI-2fn8;
	Tue, 20 Jan 2026 08:48:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi7Px-00000003Twq-1uQr
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jan 2026 08:48:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7DFAF60008;
	Tue, 20 Jan 2026 08:48:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE962C16AAE;
	Tue, 20 Jan 2026 08:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768898932;
	bh=P2f5VRfQXjNxJlBuPknRTMHoXdQiUEDYr/NdKY8/GZ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A0xfAzWFO1LjHkQA5H5Nr/oMPHlXF4oL00eDIkgCyAtz78Mi0JXQ0IuWGsgqFifWE
	 4F1d7sT2HuwS5bbjfLR4PFMbDJeVuuZlqILz3c0dOILh4MOt3U5H+nUsabUa11Ofal
	 leEltVrKocV4WrDzgYGjNWltKE2Uf/lZTRgbtwCfFoKohR7EBiNlkLKKygIfXQombv
	 bS/uPTmMQZp2/QKU2PKfzlaFzGq24/X5p97uj4RpKmL+dqPwLovkZt0s+5uMEJpRs3
	 V9/GKE74f3gWpgz/I0ZPijttLMTf7GV2i1IXeX2NMD16FUFmQFf7uUDiU7/XKxz0UY
	 07AL/IEW7RY4w==
Date: Tue, 20 Jan 2026 09:48:48 +0100
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
Message-ID: <3cfeounnaphhezvjpz5igswml6iu3b6jhwhjn2g4ziimjdoefi@ge4ezxx6jxlr>
References: <20260113-clk-send-sync-v4-0-712bc7d94a79@google.com>
 <CGME20260113151335eucas1p157cd966c5f0f4e477fb11272810a0ae8@eucas1p1.samsung.com>
 <20260113-clk-send-sync-v4-3-712bc7d94a79@google.com>
 <90657b83-1cff-4c7d-adde-9b560c2be7c2@samsung.com>
MIME-Version: 1.0
In-Reply-To: <90657b83-1cff-4c7d-adde-9b560c2be7c2@samsung.com>
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
Content-Type: multipart/mixed; boundary="===============6501192250269392949=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6501192250269392949==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nwsg2exzzhgvomkd"
Content-Disposition: inline


--nwsg2exzzhgvomkd
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 3/3] pwm: th1520: remove impl Send/Sync for
 Th1520PwmDriverData
MIME-Version: 1.0

Hello,

On Mon, Jan 19, 2026 at 10:45:56PM +0100, Michal Wilczynski wrote:
> On 1/13/26 16:12, Alice Ryhl wrote:
> > Now that clk implements Send and Sync, we no longer need to manually
> > implement these traits for Th1520PwmDriverData. Thus remove the
> > implementations.
>=20
> I thought this was already merged :-).
>=20
> Reviewed-by: Michal Wilczynski <m.wilczynski@samsung.com>

If I understand correctly this patch 3 depends on the first patch of
this series so I cannot pick it up via the pwm tree *now*. There is
another patch pending for the th1520 PWM driver, but as of now git seems
to cope well when merging the pwm's tree for-next with this patch.  So
it's fine for me if the series is picked up for 6.20-rc1 via the clock
tree.

Acked-by: Uwe Kleine-K=F6nig <ukleinek@kernel.org>

(Nitpick: If it was me who picked up patch 3 I would have capitalized
the "remove" in the Subject for consistency.)

Best regards
Uwe

--nwsg2exzzhgvomkd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmlvQW4ACgkQj4D7WH0S
/k4CswgAqYG9PEeOEysrNpuhGW5U3OIozAveU6uV7f/WsAm8r9/z/awUrqqx9SsI
UuqhYcm/NXXK3TnrKeYfcU/03QiTBuwoZfyWVjwe2ZcJM0WRz0WcjRI65hmWgAIH
sG5NN32/KLyj1ITpCXRCSPEps5R1ucJYuzjRLTaTwrAzQDXT0OlEVd8vUVeHJjxW
DKuIm4QF/nBLtIq1JXv17rOqaU1mFQO3kZqYWu26GE50N5HwDDmJCflDeFVBmGpv
snGBFWLlwvMYCF+GnBxXeOQ8Of394Tt9EUP5YZhC6cktDl1zN5Y4H9DfhVgj26Rh
ZNbjBoDVXVZUlcwkA02YvTfmJcVzvw==
=Dmu0
-----END PGP SIGNATURE-----

--nwsg2exzzhgvomkd--


--===============6501192250269392949==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6501192250269392949==--

