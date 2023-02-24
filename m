Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BA8BC6FA8E
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 21:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ffw4LHNuzODd30RHu2pitxvtNU3hO7NakQXn2mXNmDI=; b=Mv/Cy69gsvTiOr0J/8XXcNE4hT
	Yr0AsnoyDquR8VoETp8i11JzbyH8aVQo6zBcJbL4uDjg75WePXWfsiW72gJUcnJnp0lyv22v0OBMs
	kgSHlWQIuOcMZFhbZtT/kclkDS4hzYx2VwW7dl8HFyvSxImG4XmQVvZxxNBynzZSTIBinq5/l9fYv
	UrdAT1pGmMNtbxOxnC/6ao4fgX4tnIxygsMxNJAIt4S5Vn+wJ6fglgUuJmHrWclMga1fYjly70NBN
	dZc/5RuR2R7Yy5iCuiYmS0vEt4wzxh7k4aX8zJlqufpQafb6RULWEsfP7NZWqc1ZV3dxhoWdE1PNy
	w+seWNjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVfBT-003s5f-Hd; Fri, 24 Feb 2023 21:00:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVfBP-003s4k-SB
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 21:00:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9827C61977;
	Fri, 24 Feb 2023 21:00:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5688BC433D2;
	Fri, 24 Feb 2023 21:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677272445;
	bh=2hjpyvDNC/wSGd+1eQn8U57a8M+iEjURLEBCMQC9WCo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rLJpIT7pDDaWlDn2FWpGiTm0l0Hf9NkJskpSVsWOVJierGI3/z/FGex58pkoLVVCv
	 crERApewISnJR5PC5YcqPC49xNp2xSRvbVuTmo2pe6kGWjWNlgJeYsRTiJAGLL7tvm
	 SZUU4dWGVeNXXodlhfHzBVSNW+4yEdR7ZHGvek4wEemqOYTLuREcikoaV0yrmBP9Bx
	 LVEJlNGEUae0AvH8zjtmcy6fu7DtpBV4/DsMo3G6f9mRPxpUCC352meb0i4uAOQjbh
	 qOIfH+BK6ruwCTCaylDCiwKm16UxCsYebsidWL00xsFT0hdoo4DgSDqKBtEJaTRXns
	 TJMxhiffUXCVA==
Date: Fri, 24 Feb 2023 21:00:38 +0000
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
Subject: Re: [RFC 0/2] RISC-V: enable rust
Message-ID: <Y/kldmYcl7+2FBRB@spud>
References: <20230224133609.2877396-1-conor.dooley@microchip.com>
 <CANiq72=4ZhV=u2ZUr=x-iAS_iMnV8GSiq0tEn7Tj0NanO=D+xQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANiq72=4ZhV=u2ZUr=x-iAS_iMnV8GSiq0tEn7Tj0NanO=D+xQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_130048_040237_226D6B56 
X-CRM114-Status: GOOD (  29.51  )
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
Content-Type: multipart/mixed; boundary="===============5610271954614388357=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5610271954614388357==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="EzgSW8I33ytRe36y"
Content-Disposition: inline


--EzgSW8I33ytRe36y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 24, 2023 at 09:42:08PM +0100, Miguel Ojeda wrote:
> Hi Conor,
>=20
> On Fri, Feb 24, 2023 at 2:37 PM Conor Dooley <conor.dooley@microchip.com>=
 wrote:
> >
> > This is a somewhat blind (and maybe foolish) attempt at enabling Rust
> > for RISC-V. I've tested this on Icicle, and the modules seem to work.
> > I'd like to play around with Rust on RISC-V, but I'm not interested in
> > using downstream kernels, so figured I should try and see what's
> > missing...
> > I've tagged this as RFC in case I've missed some "WAaaaa you can't do
> > this" somewhere :)
>=20
> Thanks for sending this and taking the lead on RISC-V

Meh, far from it. I'm just trying to get the ball rolling if it really
is as trivial as this seems.

> I appreciate
> you put me as the author, but in this case, it was actually Gary that
> started the RISC-V port [1], and then I sent three PRs on top later
> on.

The stuff that I have lifted here all had you as the sole author in the
"rust" branch downstream, which is why I gave you authorship. Namely:
afba78eacb9b ("rust: generate target specification files on the fly")
732b3c386328 ("rust: target: remove `cpu`")

I don't see anything from [1] in these commits, so I don't think that I
made a mistake here.

> When submitting something on behalf of somebody else, I suggest being
> very careful and ideally contacting the authors beforehand. In
> particular, if there has been any modification (including to the
> commit message), then a note should be added explaining so.

It's RFC for a reason, I've had a poor track record with off-list emails
to people that do not know me so would rather do it this way :)
Probably should have noted that I wrote the ~placeholder commit messages
though, apologies. I'll sort that out for a potential v1.

> Therefore, please double-check everybody that contributed to the lines
> you are sending (e.g. via `git-blame`) and add them as

That's what I did! Unless I missed something that was non-obvious, the
only name on the commits I lifted was you. Is there somewhere else I
should have looked for that information?

> `Co-developed-by`. Also, please add a note of what you changed/wrote
> e.g. square brackets, and `Link` tags to the original PRs/discussions.

If this goes to v1, I will note that I wrote the commit messages.

Apologies,
Conor.

--EzgSW8I33ytRe36y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/kldgAKCRB4tDGHoIJi
0kRlAQCUtbv6hyB+QaKgek4dllhjR2OYkuSr5B2c1hLoO5iADAEAs0GElI0VA2QL
tfv3Ync/lLJwVaPRbeh6/nBJInV17wU=
=lKKs
-----END PGP SIGNATURE-----

--EzgSW8I33ytRe36y--


--===============5610271954614388357==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5610271954614388357==--

