Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 670A0D1CDC6
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Dec 2025 15:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/+C6PuOSPvT9SLV+g/7Yu6c8Rrb+kgbvQ/1qDPXnPFg=; b=XxHuFyecJ705jl+qnF2fxcEiZo
	QSFWDpnkw8yhAITX+q1RiYRRDImEmpvqo+Pc7MTiIC1me4HsYOmUFl3OHEM2HRu0n7yyX5vjmTEbA
	ASaFGDCk6rKrTw7YzqdHIfhcUefzkpxttsvl7TnbbZbacDaivakUIb/s+fMvBZpSZTzpevGYIgBkq
	c0u5QkiS86MXdNUy0ofJQxge3dh3p9XsZ1LoXpwu2F7wCPo+tbutVBoW7rhftJ+5EJjtKPO4tJm/S
	K8YQ55kQclcjGsO4h5GVJ7xH7CHqsHpUvjUP1gEzCPCIrhVaMiidgkfOVnFeMrh2SIZ+kvrOa2ui8
	nlzPFp6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSzCv-0000000EQla-17CP;
	Tue, 09 Dec 2025 15:00:53 +0000
Received: from mout02.posteo.de ([185.67.36.66])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSzCq-0000000EQl4-2DIa
	for linux-riscv@lists.infradead.org;
	Tue, 09 Dec 2025 15:00:52 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id A900D240101
	for <linux-riscv@lists.infradead.org>; Tue,  9 Dec 2025 16:00:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1765292445; bh=tvb7rItouogstTWsPzKXtOqwxKwfUVT4nIECDW5F+cE=;
	h=Message-ID:Subject:From:To:Cc:Date:Autocrypt:Content-Type:
	 MIME-Version:OpenPGP:From;
	b=CYHa6v5DQObRlLXXQYjHnVlO22Q6PL6HbyxGStDjxI4j1NUaAKKVPFU+J60sIBpIS
	 U3xniGYnmxuicug6uCDfYHg0gTm9KoMk8kCb3j2XixREEjCTJis2IKTHglCM2zRCI2
	 d94CdOyxrUup9dhM7eqn6M9xBkBB4N2cGqaaiGTkPXBZ01C6GixLPMHr0PR+SEu5Gr
	 ksVdqIjyNfeVAloZlF+XeY1QCLntGn7UDyn2TdxKI4AKbbAamqZsJEDRYkEk+Zyab1
	 P6lDCLRdLSdGY2/s4vQNM5UrE8XrrDn/Vxv7ANeIY0/IV2d5sxpgflNQ3kop5utEST
	 RBkjm5/NHq3JQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4dQhqZ450tz9rwn;
	Tue,  9 Dec 2025 16:00:42 +0100 (CET)
Message-ID: <3fd85a37a09bb4636affbec1ce282ec843d59103.camel@posteo.de>
Subject: Re: [PATCH v2] rust: pwm: Add UnregisteredChip wrapper around Chip
From: Markus Probst <markus.probst@posteo.de>
To: Michal Wilczynski <m.wilczynski@samsung.com>, Uwe
 =?ISO-8859-1?Q?Kleine-K=F6nig?=
	 <ukleinek@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, Drew Fustini	
 <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei
 <wefu@redhat.com>,  Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor
 <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,  Gary Guo
 <gary@garyguo.net>, =?ISO-8859-1?Q?Bj=F6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Date: Tue, 09 Dec 2025 15:00:44 +0000
In-Reply-To: <5a742181-dff6-4073-ada0-342298da63b6@samsung.com>
References: <CGME20251202181800eucas1p18be878cb74d14444f2df8bdcd7a718ee@eucas1p1.samsung.com>
		<20251202-pwm_safe_register-v2-1-7a2e0d1e287f@posteo.de>
		<a3f4e795-e56d-4de0-8b46-5c8ff96d5f77@samsung.com>
		<zdwto7ahccckl2r3qoculu52lsus3dey2lcur2l3ltrxp5nrcf@djusgl5cdfu3>
		<a66b337528d700ae92d7940a04c59206e06a8495.camel@posteo.de>
	 <5a742181-dff6-4073-ada0-342298da63b6@samsung.com>
Autocrypt: addr=markus.probst@posteo.de; prefer-encrypt=mutual;
 keydata=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
 66sLA9g==
MIME-Version: 1.0
OpenPGP: url=https://posteo.de/keys/markus.probst@posteo.de.asc; preference=encrypt
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_070049_289409_247275B7 
X-CRM114-Status: GOOD (  22.11  )
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
Content-Type: multipart/mixed; boundary="===============0636161312447730176=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0636161312447730176==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-aPNxVAyZOO5XAtovTjhN"


--=-aPNxVAyZOO5XAtovTjhN
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2025-12-09 at 14:41 +0100, Michal Wilczynski wrote:
>=20
> On 12/9/25 13:26, Markus Probst wrote:
> > On Tue, 2025-12-09 at 09:08 +0100, Uwe Kleine-K=C3=B6nig wrote:
> > > On Sun, Dec 07, 2025 at 11:16:59PM +0100, Michal Wilczynski wrote:
> > > > On 12/2/25 19:17, Markus Probst wrote:
> > > What does "not able to successfully compile drivers/pwm/pwm_th1520.rs=
"
> > > mean? You were unable to find a .config that included CONFIG_PWM_TH15=
20,
> > > or you got a compiler error? If it's the latter, ...
> > >=20
> > > > I suspect your kernel configuration is missing CONFIG_COMMON_CLK.
> > >=20
> > > ... are we missing a dependency for the driver?
> > I got a compiler error. Enabling CONFIG_COMMON_CLK indeed fixes it.
> >=20
> > Without it:
> >   CLIPPY     drivers/pwm/pwm_th1520.o
> > error[E0432]: unresolved import `kernel::clk::Clk`
> >   --> drivers/pwm/pwm_th1520.rs:26:5
> >    |
> > 26 |     clk::Clk,
> >    |     ^^^^^^^^ no `Clk` in `clk`
> >=20
> > error: aborting due to 1 previous error
> >=20
> > For more information about this error, try `rustc --explain E0432`.
> > make[4]: *** [scripts/Makefile.build:354: drivers/pwm/pwm_th1520.o]
> > Error 1
> > make[3]: *** [scripts/Makefile.build:556: drivers/pwm] Error 2
> > make[2]: *** [scripts/Makefile.build:556: drivers] Error 2
> > make[1]: *** [/home/markustieger/build/synology/linux-
> > upstream/Makefile:2010: .] Error 2
> > make: *** [Makefile:248: __sub-make] Error 2
> >=20
> > A simple fix would be to add "depends on COMMON_CLK" in
> > drivers/pwm/Kconfig for PWM_TH1520.
> =09
> While at it I think we should also add dependency on ARCH_THEAD |
> COMPILE_TEST as well as HAS_IOMEM in my opinion. I think some of those
> dependencies were lost when we were iterating on the patchset for some
> reason, can't recall when exactly.
>=20
> If you plan to send a patch include those as well. Otherwise let me know
> and I send a patch.
No, I am currently busy writing the serial device bus rust abstractions
(include/linux/serdev.h) for a driver.

Thanks
- Markus Probst

>=20
> >=20
> > Thanks
> > - Markus Probst
> Best regards,

--=-aPNxVAyZOO5XAtovTjhN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEgnQYxPSsWOdyMMRzNHYf+OetQ9IFAmk4OY4ACgkQNHYf+Oet
Q9JqMQ//TcrTZhIXkMSY5d+8hTE+/b96ALeD35aVgmOmBv+2Ju1zmJ+ewF6kvBw8
mmszSUq5xh/orRiK+LlCGGH70IlgpPwk4vLauUDpuirCHg+kf3ycGoH0YlprRh9S
h9QzjiphWJHv84FHe0MmmJvCvovXw4w33qw5P7kgtc13OEVhR9DYDwlkqGbC89JA
A4LLb42vzunXaXcJGtPuVFxKakPTKnFvC0P+u9CMzRyZH4u9mNPY5FfKAgEIlW5j
XtKqCkSYbyClrKKM9n1ydHER+c79b/K/XKk9ASS0bD29rbcT0Y64s+7tWyNGsDPS
YhIbQa/gfDU5cx6bdZESK9sSrqBmR7/lLhTsYD5c3JjNJ/UHccKOmf3sf6/VeCXC
P6K2JTWy1X2UGHVmj9qljiI1tv1nwvfG3fGG9arUns4racgsZU4NnAXwjJ5HWei3
8XqjbLwfdzCao0DM6upbxMu8m9wzz1DXc5qAyjSd4zBU/6qMmeFeY6XS4qkGiuon
KXFcaiYjCcvjPimpt22jG5/B76RQTLnSu1RyCt2M1d51db11s2+NrCHkRkUibEd4
HBBC4l/wMtLD8HZnGw9X4YDRy/RgeT44Mc/CPdrlYzcX6NMVe4+K+cyQUeuG1BSG
kt7hPnUzParVQoSPD9IY51Qxs4m4T2s9aQ2L1r13/LlgnopONPs=
=65Ny
-----END PGP SIGNATURE-----

--=-aPNxVAyZOO5XAtovTjhN--


--===============0636161312447730176==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0636161312447730176==--

