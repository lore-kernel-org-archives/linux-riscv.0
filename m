Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3401606A335
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Oct 2026 13:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WQiuouI7;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kDqzQ90E
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=76D2dogA4nfB+WC8QtPB2v5mcqszMbhDM8kksurEoCc=; b=WQiuouI7oZkzAh3qAVZ774UR4t
	8cGtuuKuLiWMl65Yv6J8XuVDB9YZpGMq4OfhmqbmtIg1+W7BVLd0YhDLF8nwyzR03Q3TEHDRq2wZx
	TnMnpsgNPUKS7Gwyupeo3Z/IMAav6BVNGTjeaUGoZyZEh02gTxErD877kT4eWXzCeLuDa8AzX0Rc6
	LpLmjJF7PvtjB4E99xGOUsejRv+PrPekINMGg7U4WcdBL7hO0RY6w/bFjXzuJOnMgp70w+KvraZnt
	ulwgwu2h+EgZBnhcDNPey+cBmGHDyb5w9q4bf9swReyH/q4mX25hM3owdl4O6hYQ73HbPEVZpPFYj
	arHgvUkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ9Ra-00000009jFQ-2Rub;
	Tue, 20 Oct 2026 12:59:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ9RZ-00000009jFE-1PR3
	for linux-riscv@lists.infradead.org;
	Tue, 20 Oct 2026 12:59:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id C737D41368;
	Tue, 20 Oct 2026 12:59:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 1CCBC1F000C4;
	Tue, 20 Oct 2026 12:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792501192;
	bh=k0+4gEKlMvz76fZS5IB16e4OUeVhhk9lshGuR0b8QYw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kDqzQ90E/2qjc/LA3bApPh8dVKMVfASrKa9PJMx9YGKFySr4hzgPpjrpQokFF4qHL
	 138dOc+99/D/l8ttbTE/vIbIbB+Fkn4wPl1RUtfvRir2zuGTqdcBnLbIByWFpsDJiy
	 KMmEGcPGRh2+brvL4UdzD0d7EhrEHTs7jgKDxbxGZL5TaSB1IYtEwM4JNdWnloH2/+
	 IGDKgZVp0AMZTrGUkMmTDDAjT2UEM6R+rKGk6m4jP0ltp1MuODqfmN6tibAElPAi23
	 IsWF0zqfl6FFjoA3cZtuGnGLDtKO27KCInu289v0qHAwhv5ejxnpEmi8BrX60t3uzd
	 mrNxfDGRu4mDg==
Date: Tue, 20 Oct 2026 14:59:50 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Maurice Hieronymus <mhi@mailbox.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Fu Wei <wefu@redhat.com>, Michal Wilczynski <m.wilczynski@samsung.com>, 
	Brian Masney <bmasney@redhat.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	linux-clk@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org
Subject: Re: [PATCH v4 0/2] rust: clk: Add ExclusiveClk and use it in
 pwm-th1520
Message-ID: <atdlfNRiza3gA1iD@monoceros>
References: <20260711-rate-exclusive-get-th1520-v4-0-8244a0666a71@mailbox.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260711-rate-exclusive-get-th1520-v4-0-8244a0666a71@mailbox.org>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============8145159911847435241=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--===============8145159911847435241==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ltyb7jaz4sulinat"
Content-Disposition: inline


--ltyb7jaz4sulinat
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 0/2] rust: clk: Add ExclusiveClk and use it in
 pwm-th1520
MIME-Version: 1.0

Hello,

On Sat, Jul 11, 2026 at 12:16:28PM +0200, Maurice Hieronymus wrote:
> Add a Rust binding for clk_rate_exclusive_get() / clk_rate_exclusive_put()
> and use it in pwm-th1520, which previously carried a TODO noting the
> missing binding.
>=20
> Signed-off-by: Maurice Hieronymus <mhi@mailbox.org>
> ---
> [...]
> ---
> Maurice Hieronymus (2):
>       rust: clk: Add `ExclusiveClk` wrapper for `clk_rate_exclusive_get`
>       pwm: th1520: Lock clock rate with clk_rate_exclusive_get
>=20
>  drivers/pwm/pwm_th1520.rs | 18 ++++++++-----
>  rust/kernel/clk.rs        | 67 +++++++++++++++++++++++++++++++++++++++++=
++++++
>  2 files changed, 79 insertions(+), 6 deletions(-)
> ---
> base-commit: 92010229c4b38897f1319d260162d2f96925ed17
> change-id: 20260526-rate-exclusive-get-th1520-764a949de18e
> prerequisite-change-id: 20250909-clk-type-state-c01aa7dd551d:v5
> prerequisite-patch-id: 2d3dc45c241d9062a0d2546ec649eec7970fa50a
> prerequisite-patch-id: 67ad535fe110207ebc79045ba022ebb7137b0309
> prerequisite-patch-id: 3d1d8ee5c2a4957edd0807b7a5cb65dabab345b5
> prerequisite-patch-id: e2659037b8aaf51831da099cc568ad5b3c24a4dd

I didn't track these dependencies, but the change looks fine for me. Who
is supposed to merge it? I can take it via pwm, but I guess a rust tree
is more appropriate?!

Best regards
Uwe

--ltyb7jaz4sulinat
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrXZcIACgkQj4D7WH0S
/k6GSAf/ZIk24DH451oQFcpRIj2PkQd/0y19KVGyJRbxLE9LvsxPZ0+1eE3hJEJo
jlYTi8hVShMbt8y719+jAapn7t4jiDMFdqZjNf6SJk6UMY7/OQQnN1lx2EVzBr77
VzzIbCXZvEKKeRWz2YXsjkKOf8q0ZKeXvpE/dePtg3/LM288hLmX5vpAO3Ckpkv+
xRoPRzUPd3SEd1pvacn8Eul3YMz59OjeI2kgSiQvEli8bC2CColR1kjbIpIOAyIa
JUBb3v5uGhp4E9dTEZMfuuOoTyauToZwVNTZLd1jLLwO/fL3Zdfr0N3srk/NZmrW
3WQkqT8ZE03oOjmuXTUZG8+Sc4oIMw==
=n9X5
-----END PGP SIGNATURE-----

--ltyb7jaz4sulinat--


--===============8145159911847435241==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8145159911847435241==--

