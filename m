Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49A65C5AD55
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Aug 2026 05:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vd74L4gBJuCzZkod9fjhLoZbzLXt9sLXFFckXwZLwes=; b=p7q8SQ3cZIB3WYwxAia69eh+bp
	ydCQpWkgtESUCM8DvJ76hDkjuEzzzw1F/gGnGAfc2+QT27iNc8JHVKfR/fHbMjegtEwFT3vz6t0kv
	cJxrF5QerN3imvoNYNQPNwj+OdKfmySzc1/c+pKfeYgst2SfGpa/2YTN6e9S5yAzN8KnDQFmPOMoM
	nKJDO4QrNh6X3Zh1dxQaSDYcBQVMmlJa1zOu7yguoBp12pKN0rmmBfZaUfIQ12crEYp+1+qDVu6+8
	KpnljzJDMgDoeQTpfmkcDIu3nEpirFSkvPIc/k88CFKahXJwSdkouj+Uf4xzPd4fy0H/Iq9O07ZlC
	KsLtAxrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtegu-0000000DIpa-1CWd;
	Tue, 11 Aug 2026 05:06:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtegs-0000000DIon-2xQv
	for linux-riscv@lists.infradead.org;
	Tue, 11 Aug 2026 05:06:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id B9E1240C21;
	Tue, 11 Aug 2026 05:06:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id EE28A1F000E9;
	Tue, 11 Aug 2026 05:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786424777;
	bh=Nqy+J5LgCipC+94ySiuwoWjMwfZRvXtuneInmt6S518=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WOHWeplBFr7i8caT2T38Hz67fkTISy8BgAZrdlIPsFguZfNCN4lEgyw3mkTrwGLZj
	 mBJ8estR/x3ylZkv1CcN3fnko7gnDdLTHLIJM1VQWM7csZXYEeA/eklBZ3TquucO9I
	 VWbpwLfcmA6UKkXGxzLU+iGOHXaWFYizydOQ6+eE9ySl0gsJsF7SFxn4ddkcmDN9Vg
	 mDy/obyHwRrl+0jYcjzbxm6Ik73H8LF8fERyB5wNwA5auu7WBE3Xsy2V4AwUnnjk5u
	 QhVNa0xgQvJaen2FzPT3C0McLDz2TaXJavBnQJZybmKAeLdghOaXm7SrCzW7/ou3KF
	 PDYP6himFHGHQ==
Date: Tue, 11 Aug 2026 07:06:15 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Guru Das Srinagesh <linux@gurudas.dev>
Cc: Michal Wilczynski <m.wilczynski@samsung.com>, 
	Link Mauve <linkmauve@linkmauve.fr>, Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Fu Wei <wefu@redhat.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v2] pwm: th1520: use vertical import style
Message-ID: <anqtiNa76mzM9ZR3@monoceros>
References: <20260721-pwm-rust-vert-imp-v2-1-9f91547f5e07@gurudas.dev>
MIME-Version: 1.0
In-Reply-To: <20260721-pwm-rust-vert-imp-v2-1-9f91547f5e07@gurudas.dev>
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
Content-Type: multipart/mixed; boundary="===============3790498662279550923=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3790498662279550923==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="suvxpmiughzydh4a"
Content-Disposition: inline


--suvxpmiughzydh4a
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] pwm: th1520: use vertical import style
MIME-Version: 1.0

Hello,

On Tue, Jul 21, 2026 at 12:49:27AM -0700, Guru Das Srinagesh wrote:
> Convert `use` imports to vertical layout for better readability and
> maintainability.
>=20
> Signed-off-by: Guru Das Srinagesh <linux@gurudas.dev>

Added to

	https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for=
-next

for the 7.3 merge window.

Best regards and thanks for your contribution,
Uwe

--suvxpmiughzydh4a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmp6rcQACgkQj4D7WH0S
/k40RAf8CGH9Be1+oMoVPq6/vqGqzDyBVxFWcA3aybqtevEH+VheNYdSMMLnpuVD
EvJcp3AnfnaSZJyK7wD/ag/8F2NxYp0Ihr4QgDUVGS8meuMxTk1UbNioIJjcgdg9
aTlvKw6nxsPea5l910KUCc1xkNRjpEVy2x9F4JFJva3W7oVowM6xYlU4AVfDdWsv
FhY15YPxfpnuxJQNkdr2NC0ue5wkRxJ8JBP9m5RvnQlewkGTp7R3XNpqV/o9txXn
lu69Ka0RjGJL+QGBLCfj9RyesudoQcHLOK5tEAxS79lCl18rjmKXQaAfDdrlOl20
9ox66Oaz/D4Uw+J8zBQJs8Lwk580mw==
=CJ/r
-----END PGP SIGNATURE-----

--suvxpmiughzydh4a--


--===============3790498662279550923==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3790498662279550923==--

