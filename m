Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6771C64ED8
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 22:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e7Yd26PNuaTLjmKcXSG6vkS9DHKrs24mQ8iOadeOQd8=; b=kqIgKE7nxBztJnlVuxFLrVCpi6
	u/WVQgBw7yTS23S9KAS6Z+3aNnhlh3uTrFT8JPu4Z7ICiegiA7lwHF2q5J4mttEgFbfYCwY94cgFS
	8eFddiNfNPsCeFIM4daFDyZx8r+UsWYaipgKN3w8BSbYpIhffxN8pZ4YJkPTrV5SQ9oKl4wQQVoAS
	7wXK9rcYBfYDjrqa1pPjcquDdMpN0HI2qCYkHtgFWID0QVCVqCnPlq1KDUEzBTkFhv+xngZbfTCGh
	0F/JnT4mZ20AmD2Ldw4ZHIHLEExWxS2PcQRB30jiJE6I0cgmVT81dFeE/BJ97n+/52zenFU/RH0eZ
	UAXWnTMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVgby-004AFq-13; Fri, 24 Feb 2023 22:32:18 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVgbv-004AEm-Hq
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 22:32:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E763AB81BEE;
	Fri, 24 Feb 2023 22:32:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBCF8C433EF;
	Fri, 24 Feb 2023 22:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677277930;
	bh=YU/s+bH/87E9Dfu8eF0TeGeix3GsbNFybjbH2XtskK4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mETyRECgSZPUhMAritaTsInlHW3NQ4KmoWnrKDW8rS8CnpxXcUUfVFtdyBTM0UsWM
	 ULYYEhVvw2B9jJvjiYxBo61zDJuK11jrTAdkWcvI+iSmmmbbZLO0Y9m9cR5d1/eJBw
	 P+hhL2hV62T8SzCEecVzG2WK105xkYVvinC4Uk67aVNJ7IVKRoVtnCsiyTIusVCxX0
	 vBKFG0G9Rus8tg8ZWgFCompCXIv5nbVFC18hZ7KDtNI4lgGthc56FoLkjYQ7GA+GsY
	 UzMeWMgs9UNdJCZ9xSSQHXhtcR//sTcfUPeEWigqUl9EupAJxazfWXjwDsFS23prUf
	 8MbqQy2knLp/w==
Date: Fri, 24 Feb 2023 22:32:04 +0000
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
Message-ID: <Y/k65INC1//tXe2U@spud>
References: <20230224133609.2877396-1-conor.dooley@microchip.com>
 <CANiq72=4ZhV=u2ZUr=x-iAS_iMnV8GSiq0tEn7Tj0NanO=D+xQ@mail.gmail.com>
 <Y/kldmYcl7+2FBRB@spud>
 <CANiq72=btcBOmrz0=ib=2eZiiV1z4_3qm1cqyw1=jUFDiJ77bg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANiq72=btcBOmrz0=ib=2eZiiV1z4_3qm1cqyw1=jUFDiJ77bg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_143215_813224_62F88436 
X-CRM114-Status: GOOD (  18.23  )
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
Content-Type: multipart/mixed; boundary="===============5613899514001941337=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5613899514001941337==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GPqby4BNY/8U4z3W"
Content-Disposition: inline


--GPqby4BNY/8U4z3W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 24, 2023 at 11:20:34PM +0100, Miguel Ojeda wrote:
> On Fri, Feb 24, 2023 at 10:00 PM Conor Dooley <conor@kernel.org> wrote:

> > That's what I did! Unless I missed something that was non-obvious, the
> > only name on the commits I lifted was you. Is there somewhere else I
> > should have looked for that information?
>=20
> I would have traced the commits back a bit more. For instance, in the
> first commit you mention above, one may see the RISC-V target files
> were removed, so that means something was already there. Checking who
> added those files leads to a few commits from Gary (and one from
> Daniel).

> And then it is about making a judgement call trying to be fair :)

It was a few hours ago that I looked properly, but, IIRC, it was a
conversion from config files to code? My understanding was that
config files were not copyrightable, hence I looked only at the
authorship of the code. I'm usually on the anal side about SoB stuff,
so it is not a matter of me not bothering!

--GPqby4BNY/8U4z3W
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/k65AAKCRB4tDGHoIJi
0iCIAQD8yWuiYHTGurcMVu0pSePa/9gxWTaY2XNdYA6jLb5JhgEA+VVYS7bt0vzO
rAr5s4NsXOudIsskOkB30k8ueF8CJwQ=
=IIrm
-----END PGP SIGNATURE-----

--GPqby4BNY/8U4z3W--


--===============5613899514001941337==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5613899514001941337==--

