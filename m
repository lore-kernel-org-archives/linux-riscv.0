Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02C13C5478C
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Feb 2024 17:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NbAHYiMdYV8TjS+ss/W9JV6jkXpGss8QIgk3k5z2Vmg=; b=f3ChIWq9WSK4V/QTbaDgmHApxg
	8ubEUVBFlIOe4zxYvkWEkQ6o1eEj76//13qm4l9IH4t/rhkWN9+QK2RkUa+k0Pn8a1hSA3RH4T/F/
	uj6audBei4KuedInvMPAXY9iXBH6lsdSTjG4F7VPCM3zQ8PnuHreC6ONKnPogiEPhGTTDtmj+DaXT
	eqR98f4eE98hFJO3kQOQMSsu5I/87HVwO0Nyoa99UYECyu5zfilR083ax4b6Hk2t8MYORomXtILsD
	IvrWR/4d2S/mIbRwxwknL+sdYMA/Es/Hw4fvY7AOWN2H8Bay/w6WPMb6JpSDHjx5XQ8mfUaow7LOm
	FCK9aYoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rf1Z2-00000006InY-2rhI;
	Tue, 27 Feb 2024 17:48:24 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rf1Z0-00000006Imd-1z4E
	for linux-riscv@lists.infradead.org;
	Tue, 27 Feb 2024 17:48:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5E8FCCE1AE8;
	Tue, 27 Feb 2024 17:48:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1006FC433F1;
	Tue, 27 Feb 2024 17:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709056099;
	bh=vqVV7Q6iDsLx5qklxPAuR/oFiUFjZboKbfskVrbCEvM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FZ+VsAOEHbkx5hOfvTbD//Vs8qW6bN16Q/HHv4tMM0fDkjodurawCRBW7cFonQzEs
	 IFkNXUgqBaNE2rJeh04+ts+m+MO9JVPbAGbOASIT4TbJe96Vx+qjC7lYvm3WaaA67j
	 +uZ+t80GhRYUGt5PDIT/OLk/bUMJP3xDg4QkIetzvG7XbHL+l21S2uMLivrsG3wQYn
	 hvDmGquiGDG+YA1fFY+OftJwsZxsj8xpc5Geez8EH7PtAJ1D4GAio5XcJaVNOJYYqw
	 IPFwJp2AtMxz3vvtU5fGjjsIusPWbTcwFlPuGIg/paBCSpw3FYh8owFaln8YtOvSXb
	 5YfLDv+0KKh0Q==
Date: Tue, 27 Feb 2024 17:48:13 +0000
From: Conor Dooley <conor@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v2 2/3] scripts: generate_rust_target: enable building on
 RISC-V
Message-ID: <20240227-timothy-jailbreak-01a9c29f3607@spud>
References: <20240223-leverage-walmart-5424542cd8bd@spud>
 <20240223-employee-pessimism-03ba0b58db6b@spud>
 <CANiq72ngEZskjH0f=8+cJuQsFTK227bGCxe5G0STMHuPbZYnXg@mail.gmail.com>
 <20240227-resolved-deceit-4a59a6af5b71@wendy>
 <CANiq72mwM+4Oh-H5WmRoqQ_nE1w-eJ1wn-nEwS=BR9JRwzxMMQ@mail.gmail.com>
 <20240227-glove-underwire-f562a56cf2c7@wendy>
 <CANiq72=f03_bw9B8ww8UxHkVyP2F7ZPyvC+KWCyhO3Nk1yqdaw@mail.gmail.com>
 <20240227-swarm-serpent-2010b255f68a@wendy>
 <CANiq72=69uBBhKMrw5P8K6eDHPiwAw_Oj8g1aYcywEYhhUG8OA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANiq72=69uBBhKMrw5P8K6eDHPiwAw_Oj8g1aYcywEYhhUG8OA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_094822_710822_91F91B9E 
X-CRM114-Status: GOOD (  10.97  )
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
Content-Type: multipart/mixed; boundary="===============7314516007338491459=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7314516007338491459==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HLwnto9vtQo8Qlhz"
Content-Disposition: inline


--HLwnto9vtQo8Qlhz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 27, 2024 at 03:47:29PM +0100, Miguel Ojeda wrote:

> Did you try `-Ctarget-feature=-c`? i.e. as far as I know, you can
> disable target features even if they are enabled from the built-in.

No, I didn't actually try anything. Between trying to test the kcfi
stuff on arm64 and the other work I was doing today I did not have a
chance to actually play with that yet. It comes down to you though I
suppose - would you rather have generate_rust_target enable the
compressed instructions depending on the config option or have the
Makefile disable it if compressed instructions are not enabled and use
a builtin target?

--HLwnto9vtQo8Qlhz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZd4gXQAKCRB4tDGHoIJi
0qMjAP0QH2pw1S7rVHMB//QCHRoc1Q1qUwE8y0pNpZHyVjD8OQD/ekogh4n6204O
zUuaAfehnQuM33Z8WdSbEvMGxwhNhw8=
=jIbt
-----END PGP SIGNATURE-----

--HLwnto9vtQo8Qlhz--


--===============7314516007338491459==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7314516007338491459==--

