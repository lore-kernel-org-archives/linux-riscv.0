Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 635AAC47DA2
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jan 2024 11:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YeOKhHSf630td1+dJEIri+NalAUmqWvYhfrobUBh9B8=; b=t8BkZLtOiVNBdoeqtw3aSdUcwr
	ZkeTYLnYmYCZyIZNa24kZRaBbFBZPGB0/0Saxck1HTra/0/VCoBy5mNyHLP2DrZer/3LDLboVSzDu
	GCIwDM9IwuJQzft5zdy6jM5DNp0paD/uOY0HJPq/GmCBpqzz/T7Z+Bm2+4zqAYIYazxy67dFkjf2m
	I3bmTo16lXqmNkVw+2+ONXOZuNPAxPt6zfXwVa02Wv7++/gGBK6SqW8LVg4NJtLLlLrNDUcslNeSE
	wHhnu2Gjmc+MHLdcoVKRr6bcyDvcD+RBFidaFz/ghLCcDgy+7fSjNOKWsi6qom6K8oycecfiuoKxl
	D/xeooYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ48T-00FTPu-1M;
	Wed, 17 Jan 2024 11:31:09 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ48O-00FTMc-1Q
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jan 2024 11:31:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9700CCE1BFF;
	Wed, 17 Jan 2024 11:31:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F35EC433C7;
	Wed, 17 Jan 2024 11:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705491061;
	bh=W+4VwuyRcYhhV7162/K5rb8MKqw/7UZiD1PRcLyA8Fk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X3Pxe78INo0ZCxa0lyRMprtUGrriYUvVYuWXJfV4Oc+VoL0I4bLN36FsDknC7YnGX
	 +rIH5fU+7Xfk9MdPjHYyIyExjHbZGbrnE7eaGXQdwkKx77v0kRDw8Ghm02gyv/XBJr
	 KLppLKaA8MUHaFryoz9AAu6hw7Neuu4lkx5NKwdfOhjkMcd24mMNPgAOau0UhFhzYk
	 kola7qJeQyTTS8bNAsC1n+ODNhmHi0enOkVATQDzN4q92kd2X7VkA1pQ6wog4c0XO5
	 uBWCf94jaO4uJO3B9VibzFxdnxGV0WbcOWze50rPEraEgYtshEDUerZWOy6Scfs1Zx
	 8u15hC/eTFf9g==
Date: Wed, 17 Jan 2024 11:30:56 +0000
From: Conor Dooley <conor@kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
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
Subject: Re: [PATCH v1 0/2] RISC-V: enable rust
Message-ID: <20240117-swiftly-parasail-618d62972d6e@spud>
References: <20230307102441.94417-1-conor.dooley@microchip.com>
 <20230608-dispatch-sneer-aa09bd7b2eb8@wendy>
 <CANiq72nnph7LS1fLRtHz8NJ91PWXPaUnm0EuoV3wrbvK398AnA@mail.gmail.com>
 <20230608-spiritism-gonad-5f5aff4c3a24@wendy>
MIME-Version: 1.0
In-Reply-To: <20230608-spiritism-gonad-5f5aff4c3a24@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240117_033104_890237_E3CDCE48 
X-CRM114-Status: GOOD (  18.64  )
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
Content-Type: multipart/mixed; boundary="===============8660792254353963860=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8660792254353963860==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6PVvLnZRvsd/2E7w"
Content-Disposition: inline


--6PVvLnZRvsd/2E7w
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Palmer, Miguel, Nathan, etc

On Thu, Jun 08, 2023 at 01:28:06PM +0100, Conor Dooley wrote:
> On Thu, Jun 08, 2023 at 01:52:47PM +0200, Miguel Ojeda wrote:
> > On Thu, Jun 8, 2023 at 9:01=E2=80=AFAM Conor Dooley <conor.dooley@micro=
chip.com> wrote:
> > >
> > > I do intend revisting this, probably after the min. version for rust
> > > gets bumped, I've just been really busy with other work the last week=
s.
> >=20
> > Thanks Conor! That would be great. We are increasing the minimum
> > version after the merge window to Rust 1.70.0 (assuming no unexpected
> > issues).
>=20
> Right, so probably I won't resubmit anything until after v6.6 then,
> as it won't be in the RISC-V tree until then, by the sounds of your
> timeline.
> Gives me plenty of time to try and unravel the mess of libclang versions
> and what extensions are supported by each tool. Not like I am devoid of
> other things that need to be done!

6.6 came and went, and I have been busy dealing with the other
responsibilities I mentioned and have not had a chance to look here.
I rebased this today and things still work as they did when I submitted
this version, but things have gotten muddier on the LLVM side of things,
as more recent versions have added yet more extension support.

My inclination at this point is to engage in a bit of LARPing as an
ostrich, and sorta ignore these concerns initially. Specifically, I'd
like to drop the idea of having the gcc support, and restrict to LLVM=3D1.
When it comes to asymmetrical extension support between the C and Rust
toolchains, I'm think we deal with that as we do for the C toolchains,
sort issues out as-and-when they arrive rather than punt this again.

Thoughts?

--6PVvLnZRvsd/2E7w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZae6bwAKCRB4tDGHoIJi
0gSBAQDo38W6PTOrInEpd47uC6oQIYUvHH1KsraF+Ue8d+OddAD/RgFhSo1LMWe7
a3i/SbsjnIVdYUqCgcwThIIhp9U8bwA=
=271/
-----END PGP SIGNATURE-----

--6PVvLnZRvsd/2E7w--


--===============8660792254353963860==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8660792254353963860==--

