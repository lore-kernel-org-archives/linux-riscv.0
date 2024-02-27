Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BF02C54798
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Feb 2024 18:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ynWlWPw8yRO+i8NLySadAH4y68E/ociHVGrSYp1Vo5g=; b=AapC3CRrQru0P5eRamKIRJkrsj
	qThvl9lJbZrIlUmoycjUnRDtDjcbJwgoh4akOcXvDXjUnJP8V36rLcA6C9+ba2FzgHXxh1Tv7hNXj
	LYQPzH4uVadnv3/EHv6EU0gc66n+inb+UrIrkrEwbRhfrfhLX5WKTNOzltFfn7JNCOW4QKBFbXxWl
	ietf+sLqZniVF1ZrZt5M1GyyqL7bI22iPHUKfauWZql+UtyEW3e1hDUTwEkIwt/tFbK5NVGvbxsdd
	Vu8jCu/XIJvl4OBkoRbeVT2T//gpVSCoVt+7m0W91Ud44j6UgeBQAzQc+wYlM0yJzYG/QCxd5J0kY
	lrjx0CWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rf27l-00000006QvI-2Guv;
	Tue, 27 Feb 2024 18:24:17 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rf27i-00000006Quo-2vs1
	for linux-riscv@lists.infradead.org;
	Tue, 27 Feb 2024 18:24:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 03A35CE08D5;
	Tue, 27 Feb 2024 18:24:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DB4AC433C7;
	Tue, 27 Feb 2024 18:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709058252;
	bh=cDF3mXGEW5pin9U2a6M5esBI1SUIsMfuCrh97q573Lk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bA1hRpnBJ3qCAhZXhUlSgF8QuX7KuxIqPL/kQnsGozEYJ3SfUi3/yApOT+QLPA9za
	 TfYOGP9Y5Tdu6SlJ2yCBjSfLsFjYjme/PQZZWNfQL4Ftut0SpK2HDdBMKzEy/whZa3
	 PDuoNZxsv34B9Z3u49bMxr8csHUfS4SqVGjk+EIbSwWHUUSV+usGwyALtb7SV1jh15
	 IUspdokrAhaTrbwRawkGlPhjLjv/t2/LxG5tO3WdDSJZytnWzupKbQ62WzUPDh8R4Q
	 W9med3/S8RjdcL5uAJc3GyqPEtV/XmdMn5xZmVah/XRnwckx/iIUNTvyVa14sK0/9H
	 QIQp6amHKLdMQ==
Date: Tue, 27 Feb 2024 18:24:06 +0000
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
Message-ID: <20240227-aside-limeade-497fb182a5bd@spud>
References: <20240223-employee-pessimism-03ba0b58db6b@spud>
 <CANiq72ngEZskjH0f=8+cJuQsFTK227bGCxe5G0STMHuPbZYnXg@mail.gmail.com>
 <20240227-resolved-deceit-4a59a6af5b71@wendy>
 <CANiq72mwM+4Oh-H5WmRoqQ_nE1w-eJ1wn-nEwS=BR9JRwzxMMQ@mail.gmail.com>
 <20240227-glove-underwire-f562a56cf2c7@wendy>
 <CANiq72=f03_bw9B8ww8UxHkVyP2F7ZPyvC+KWCyhO3Nk1yqdaw@mail.gmail.com>
 <20240227-swarm-serpent-2010b255f68a@wendy>
 <CANiq72=69uBBhKMrw5P8K6eDHPiwAw_Oj8g1aYcywEYhhUG8OA@mail.gmail.com>
 <20240227-timothy-jailbreak-01a9c29f3607@spud>
 <CANiq72kQ8===wFLQNCR-XAo9KdtPr44UKvyi2074J88vh3kvyg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANiq72kQ8===wFLQNCR-XAo9KdtPr44UKvyi2074J88vh3kvyg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_102415_113360_1EC36305 
X-CRM114-Status: GOOD (  17.38  )
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
Content-Type: multipart/mixed; boundary="===============8555929545361458110=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8555929545361458110==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="D1EopDYvcEeT6CSG"
Content-Disposition: inline


--D1EopDYvcEeT6CSG
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 27, 2024 at 07:11:17PM +0100, Miguel Ojeda wrote:
> On Tue, Feb 27, 2024 at 6:48=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:

> For instance, to disable the compressed instructions, from what I can
> tell, the flag I mentioned seems to work, so that is fine.

To me, using flags is a good fit given that's what we do elsewhere,
and there won't be a mix of stuff that is done conditionally in a
script and conditionally in a Makefile.

> However,
> for something like tweaking the data layout for `n64` instead of
> `n32:64`, I am not aware of a way to do so via a flag (but I see newer
> LLVM uses `n32:64`, so that may be the better one anyway:
> https://godbolt.org/z/Eh4cfdeMr).

Yeah, I had looked at the blame for the targets earlier today and
noticed that it had been changed. Sadly rustc's commit is lacking
any justification whatsoever for the change, so I was not going to
really comment on that until I had looked.

> So it all depends on whether you are happy with what the flags
> approach already give you.
>=20
> I hope that clarifies a bit!

Ye, thanks. I'll give it a go when I have a bit of time this week.

--D1EopDYvcEeT6CSG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZd4oxgAKCRB4tDGHoIJi
0tm5AQDR5I+m1Asy6DGQhAa4NBVf8TGEm4mWhvmKqUunPVp7UAD/Uv/pYmT+0Zzr
j8fw2SaUOY4F5yKafkbQHmmA9iYdZQQ=
=qBac
-----END PGP SIGNATURE-----

--D1EopDYvcEeT6CSG--


--===============8555929545361458110==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8555929545361458110==--

