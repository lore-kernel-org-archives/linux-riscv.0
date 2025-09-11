Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FF70CAC58E
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Sep 2025 13:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bLewOX3EoOihai159LUG4yqXkbeBDw8LE4hV5T9oiX4=; b=Blq6gPDkpNGR1SsVr1+XXYiW+D
	lKkzlqFxwV7Afho4OCJESw/9Pia00wyiBbZpqFY27C39Hik3FAwlhkVX+HvahAdqrsTxtXmHg7FeD
	MPlIFP2lSGDpC9XE4s4QPm/ppWwrnlAXQiON4CsNEm0MjooXUm9qXFxoNblzfaLetcSBdJrxzou9v
	NAxu99FYEWuzqwo/Edhb44m0KlpLNxBcV2M1TtQydfG9QrtGxr4ncmxgjYnusKWDiHj0aDREJKGQ6
	LjrsJI+QCrnp471B5lx/5NdNTsWVgqsbnXQ4sBbmo0OuoJvP3JNpo9iqsbP1QBKA+hhmP2bV1Q0yJ
	elmDkivw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwh8M-00000003Amw-30FK;
	Thu, 11 Sep 2025 13:14:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwh8L-00000003AmZ-3irT
	for linux-riscv@lists.infradead.org;
	Thu, 11 Sep 2025 13:14:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2A3306023B;
	Thu, 11 Sep 2025 13:14:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C8EDC4CEF8;
	Thu, 11 Sep 2025 13:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757596480;
	bh=KX7xrHa+olS2oROnPjX8J2BFoTeFIgxJ4Lv3gDXpUMk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BMNY8ka5NU+VI1MvoMs8tdN9twEhfEOt6uHnMuw/zG9gVEyVe/5lVgCJ02DWkmQLq
	 Fdl3RoRxTueqgHTHfbVxagk8VtPvmwoEyZEau6cD7wse+rO2nbfwmJmmiS553+DP2B
	 yZ2WsSAMYwSJGbjThMmq184i//iYfBog+QuW84FpNFuhkUyC2+JoPzcfaD9Ztl8I78
	 1gPLPfUZkieEE52ZtrlTwyr5e027kXiXhtJhWQuAYcNDC9WqmWB1PVx6ZfIC6jcIQd
	 XfPzPxjtqx1fJ5gagtreHl0mLS/Bz0TnTtqOcTBQYcwz+rQz/XSLpRvbtAo6AeJly1
	 9KlPyFS3bVuoQ==
Date: Thu, 11 Sep 2025 14:14:33 +0100
From: Conor Dooley <conor@kernel.org>
To: Asuna <spriteovo@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Han Gao <rabenda.cn@gmail.com>, rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kbuild@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v2] RISC-V: re-enable gcc + rust builds
Message-ID: <20250911-reprogram-conductor-f02af5f6d03e@spud>
References: <20250909-gcc-rust-v2-v2-1-35e086b1b255@gmail.com>
 <20250910-harmless-bamboo-ebc94758fdad@spud>
 <6bceca9d-44cd-4373-a456-7c2129b418e3@gmail.com>
MIME-Version: 1.0
In-Reply-To: <6bceca9d-44cd-4373-a456-7c2129b418e3@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============0438681821731052846=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0438681821731052846==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Pv6XXkkXxcuB8WU5"
Content-Disposition: inline


--Pv6XXkkXxcuB8WU5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 11, 2025 at 12:46:01PM +0800, Asuna wrote:
> On 9/10/25 10:27 PM, Conor Dooley wrote:
> > FWIW, this --- breaks git, and anything after this line (including your
> > signoff) is lost when the patch is applied.
>=20
> I used b4 command to prepare and send the cover letter and patch for v2, =
not
> sure what happened.

Dunno. Maybe while editing your commit message you omitted the signoff
somehow? I don't use b4-submit, so I don't know how it formats stuff. If
it inserted the --- and what was below it was your intended cover
letter, your patch itself might be missing the signoff?
>=20
> I see that other people's patches have a [PATCH 0/n] email as a start that
> describes their patch series, this is called a cover-letter in b4 and
> git-send-email right?

Yes it is. Not really needed if you only have one patch though.

> > The riscv patchwork CI stuff is really unhappy with this change:
> > init/Kconfig:87: syntax error
> > init/Kconfig:87: invalid statement
> > init/Kconfig:88: invalid statement
> > init/Kconfig:89:warning: ignoring unsupported character '`'
> > init/Kconfig:89:warning: ignoring unsupported character '`'
> > init/Kconfig:89:warning: ignoring unsupported character '.'
> > init/Kconfig:89: unknown statement "This"
> >=20
> > Is this bogus, or can rustc-bindgen-libclang-version return nothing
> > under some conditions where rust is not available?
> > Should this have 2 default lines like some other options in the file?
>=20
> This is because rustc-bindgen-libclang-version can't find the bindgen and
> returns nothing. Sorry I forgot to mention this, it's another reason why I
> wanted to separate the script, in a separate script we can easily fallback
> to return 0 when an error is encountered.
>=20
> Adding a second line `default 0` doesn't work, I'll try to fix it. BTW, w=
hen
> I fix it, if the diff isn't too large, do I need to open a v3 patch, or
> simply replying to the thread just fine?

Feel free to reply with the diff if you're looking to discuss the
implantation, but for the sake of the various bits of automation
(patchwork, ci bots etc) please submit a v3 when you're happy with what
you've produced.

--Pv6XXkkXxcuB8WU5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaMLLNgAKCRB4tDGHoIJi
0sTWAQDdTuuMdgIe7i+D0GfClKSNwZiGeo6RL2W+QEs7l4LftQD7BqPNj+VBOnFy
pCrKuAA/4HOvXEmHWCYJdIAAEL+4bA0=
=CuGR
-----END PGP SIGNATURE-----

--Pv6XXkkXxcuB8WU5--


--===============0438681821731052846==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0438681821731052846==--

