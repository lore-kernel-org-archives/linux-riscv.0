Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9B71D29C58
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jan 2026 18:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=swp+k5FY92hx6hM60NVfaRPuZVVECO4lLg2p20SfEnY=; b=HzboOAvyYmfElHOMfxRLv1pmUn
	MUyeenB5ZWQSQqhj0xMElbxTydBQhhdADlplpq7wMp08T6FGKN/V6IvrpsDxFTzpwHPfjmKLyqk1f
	JYMOgHsyGUDNHWbdAE43YjydJFH2V/dtWcqJrLFhGstW9LQ3Ve/fsFjJ/QylL2j+DT0DaAC7qKkg+
	U1pfvx1gvUN0MaJKawU5j74HC4dBIJR/TBJvQTzTzdgM7KClU0bTJBZE5KOYXBZgn1wfMVqhX9ohD
	8dcX5XVJlz2UTHt/J7G49nRcyrRCRF8/mKWBhohZecQYfIw9QFutS4lxraez65/O5oSFA3dDfOK42
	J5NBwj4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhtoK-00000002hHi-1QoL;
	Mon, 19 Jan 2026 18:17:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhtoJ-00000002hHa-1V3d
	for linux-riscv@lists.infradead.org;
	Mon, 19 Jan 2026 18:17:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6F968600CB;
	Mon, 19 Jan 2026 18:17:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 919A2C116C6;
	Mon, 19 Jan 2026 18:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768846626;
	bh=zASyTGTQSFQPJTz6S2zuESVkideM51IYDimBNABRwqs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LRlQFESht6e4DgS3rlGx5mdBh0UUnubb9Ru922ypel3X2jJvCjB6dDJ7xbEZL82FB
	 naP4QD4KjY1U58W+f7IuM85z0+HiOD1rnnaXmuuDNi3+7eLOdSmqt/Cmd2MxnH9G0u
	 KtmFAqw3VR3HjARY3OMsCBA8fdjuomW4ILkM50ajVKIqSfJS+7KKe1a8Luoq0taKs6
	 Q+bgoEdRxk2wtAleUWaUbRam0Emir4rNGUbwomq6ucX7vza72uDgQU7s5wBcFWrU1E
	 O2WGdAlvLvbqY2/kDKq35PWwIsq8k2r7jBplgFPWJe9rXShC890nck5z5+aUJtOfFg
	 azQhMLqpI41kQ==
Date: Mon, 19 Jan 2026 19:17:03 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Tamir Duberstein <tamird@gmail.com>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Fu Wei <wefu@redhat.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Michal Wilczynski <m.wilczynski@samsung.com>
Subject: Re: [PATCH] drivers: pwm: replace `kernel::c_str!` with C-Strings
Message-ID: <w3drdr2cm65ypplvwn3h7js25isshjqjqooqqkgg5d5zfh3ium@lveyiholocqh>
References: <20251222-cstr-pwm-v1-1-e8916d976f8d@gmail.com>
 <CAJ-ks9mrpcLaeiGjBcXNqTUwo00Y2MhhHWnWauou6exU1y920Q@mail.gmail.com>
 <2wmijhs5pbrynsgxuropvlxuozsubk7euybxzwc5ox2a3izfci@v6hzmzs5pmml>
 <CANiq72mSxtO0s8xGhgYemfz9DvvwDzC0fsF2covGFspduDz5XA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANiq72mSxtO0s8xGhgYemfz9DvvwDzC0fsF2covGFspduDz5XA@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============1811752074728305440=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1811752074728305440==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="w3lb7nkuiao4zq7t"
Content-Disposition: inline


--w3lb7nkuiao4zq7t
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH] drivers: pwm: replace `kernel::c_str!` with C-Strings
MIME-Version: 1.0

Hello,

On Mon, Jan 19, 2026 at 07:01:33PM +0100, Miguel Ojeda wrote:
> (@Tamir: in the future, for patches like this, and especially since
> the patch was split from a series and was a multi-step/multi-cycle
> migration etc., it probably helps to give maintainers some context
> with Link: tags to the ones above).

And ideally also point out dependencies explicitly (also if there are
none). This gives a cosy feeling to your friendly but clueless
maintainer :-)

Best regards
Uwe

--w3lb7nkuiao4zq7t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmludRwACgkQj4D7WH0S
/k5oAgf/Ud0/7uDeUSMZsd6kQyuPiKtJSS4z9jpPGAb9PEV7iK+W4To8qZjkMuFx
Xg+PHxvy4deeONIKn13FTbrP0o0WMTXiBV8i6mm5Nw0PU6W1uDTtVEaa6YZFWaE4
3ZpofamlGM33QmyxNh0RkomtukOqIjYryaja/MCLdGEmWqUlldEVw3bM8UKO8YQI
6SPkHvpMbNmgYzhW3+3+T4baB7McdA764v8OKT5bq3j6aOHY6zOPJeA8Me0B3ydq
J3JTYrQD3o5L0uDaPh/aElS40nNLLIHUwQ193WBUjEwZlIEX/vzCFpuZwROvWHW7
AWU+14FPIoJzCoizBbcM5tOBubrcxA==
=qsY4
-----END PGP SIGNATURE-----

--w3lb7nkuiao4zq7t--


--===============1811752074728305440==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1811752074728305440==--

