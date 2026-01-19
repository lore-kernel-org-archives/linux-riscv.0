Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02233D29C46
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jan 2026 16:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4seg3dvsyl8qdV4FRrRqHywLBptOc3iRuUrYpXqc90Y=; b=jDNa/2C8Ujf1/gMtoqfGbutmEj
	h5y0NkbsgJTG5eEc3cMW5RGbnZE5tdoDmVdaLefZsj+E5g5uFUkM87UqqsbaSkAyIdVStplCCS/WK
	PGBk3SeN69F8KEKGV/UHWYvy8zyBUtsEF6c5ivKttDqAK8JZMqfLJ/4i3y/OHuVlKtgJmDFqi7vnr
	ZlpMj4NitVRUeDzNOXtW745u8f7W1ygmQrVObrCtEK8bsO2k0WeXpZY3oZCcxHAANzRCEm4tLUssO
	Ew5uII3Y2WCZyBN3tE5xJlNQYV5GqzZyb8zCr2DJs6SKAuHbdUEObu3vl4u8JFKI84Wz3idtYsYM7
	MCwiX16A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsVC-00000002Yn0-1pWA;
	Mon, 19 Jan 2026 16:53:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsV7-00000002Ylg-3Rt5
	for linux-riscv@lists.infradead.org;
	Mon, 19 Jan 2026 16:53:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 44E0C42E58;
	Mon, 19 Jan 2026 16:53:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9109AC116C6;
	Mon, 19 Jan 2026 16:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768841591;
	bh=2ZkOa9bEBe+GCTApBrgpJ3K+Kz14rXJVbtoTGmBF0vU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R/GHQ5rkIxsHBLAflksNjI8LN/ZvzHFyetNHZkl2nzSxe/2OF79xF4IZJ1hOB3SDI
	 4j8i4Vd4j5D2t2q9CSqe86TgnRTYCaF8aKGrZvhno013ettWe4k2MbodN0XfZWpgMU
	 zKPyAThfTCOfgFKa0cUdPNxL/OHTukriZV4KoCiLWtAbGWy4XVeBaFSR8y5zxwR2gD
	 e6K+LDX/KhQ96uQbdVMRUGk4ee8BulbxRbhVnrmgQ5WgauYmOneDxEdt3qoW3k2qYP
	 JFs01WPCc7fOhHNrUPh4EEPQyJdP1T3iMUE6bLU5+/niaRk6LYBi7oiZ93Z0EcFW3q
	 FFxNMJqIhA4jg==
Date: Mon, 19 Jan 2026 17:53:08 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Fu Wei <wefu@redhat.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Michal Wilczynski <m.wilczynski@samsung.com>
Subject: Re: [PATCH] drivers: pwm: replace `kernel::c_str!` with C-Strings
Message-ID: <2wmijhs5pbrynsgxuropvlxuozsubk7euybxzwc5ox2a3izfci@v6hzmzs5pmml>
References: <20251222-cstr-pwm-v1-1-e8916d976f8d@gmail.com>
 <CAJ-ks9mrpcLaeiGjBcXNqTUwo00Y2MhhHWnWauou6exU1y920Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ-ks9mrpcLaeiGjBcXNqTUwo00Y2MhhHWnWauou6exU1y920Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_085314_004540_D6B50E4F 
X-CRM114-Status: GOOD (  20.10  )
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
Content-Type: multipart/mixed; boundary="===============1188137061295158259=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1188137061295158259==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ag6ssgt3jtvb55cw"
Content-Disposition: inline


--ag6ssgt3jtvb55cw
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drivers: pwm: replace `kernel::c_str!` with C-Strings
MIME-Version: 1.0

Hello,

On Sat, Jan 03, 2026 at 09:30:31PM -0500, Tamir Duberstein wrote:
> On Mon, Dec 22, 2025 at 7:24=E2=80=AFAM Tamir Duberstein <tamird@kernel.o=
rg> wrote:
> >
> > From: Tamir Duberstein <tamird@gmail.com>
> >
> > C-String literals were added in Rust 1.77. Replace instances of
> > `kernel::c_str!` with C-String literals where possible.
> >
> > Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> > ---
> >  drivers/pwm/pwm_th1520.rs | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/drivers/pwm/pwm_th1520.rs b/drivers/pwm/pwm_th1520.rs
> > index e3b7e77356fc..8ae8f852ec02 100644
> > --- a/drivers/pwm/pwm_th1520.rs
> > +++ b/drivers/pwm/pwm_th1520.rs
> > @@ -22,7 +22,6 @@
> >
> >  use core::ops::Deref;
> >  use kernel::{
> > -    c_str,
> >      clk::Clk,
> >      device::{Bound, Core, Device},
> >      devres,
> > @@ -327,7 +326,7 @@ fn drop(self: Pin<&mut Self>) {
> >      OF_TABLE,
> >      MODULE_OF_TABLE,
> >      <Th1520PwmPlatformDriver as platform::Driver>::IdInfo,
> > -    [(of::DeviceId::new(c_str!("thead,th1520-pwm")), ())]
> > +    [(of::DeviceId::new(c"thead,th1520-pwm"), ())]
> >  );
> >
> >  impl platform::Driver for Th1520PwmPlatformDriver {
> >
> > ---
> > base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> > change-id: 20251222-cstr-pwm-c9b9a4701157
> >
> > Best regards,
> > --
> > Tamir Duberstein <tamird@gmail.com>
> >
>=20
> @Uwe could you please have a look?

I did, but given I'm more or less rust illiterate I would welcome
feedback by Michal Wilczynski. I only now notice that he wasn't on Cc:
up to now.

Best regards
Uwe

--ag6ssgt3jtvb55cw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmluYXIACgkQj4D7WH0S
/k60Vwf+L9+sMF3DsYlxCUroWbaKU2YlEkePawJRhurmC6+MZsBE1EX/+eToCGGy
tqkb4TmjhbSrQdgbZXoyxMXV9XguGzCq7aq0lZ7gI556Zc9iOll2EIJVUKCqjQ7z
CklQ6HQMGB3X9oSXWuIUvfMkVgDej3YRVUIBlQ9WJVzuqoLOTMNYO5ymu0X1ll+Q
mSHDQ9p4fDB7Ef8uIq41Zk+DldPQ+nBSY9TciePw1aApJg4DXmpaOwrBARbXzQdF
8xBi1lN75cvNOvu5HEGYNNMP6QtiwLU5NuA/5SCMJsxl0eP1rXs8Yyg5XLxP8wU/
jKWyRx8IwYFLbkQHfw48pJB/6nGUdw==
=3gtg
-----END PGP SIGNATURE-----

--ag6ssgt3jtvb55cw--


--===============1188137061295158259==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1188137061295158259==--

