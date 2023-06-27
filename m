Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6898AEB64D9
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jun 2023 22:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9wHMshOe0SR+pjUhtc6VjC1hVEoPjWZqD5DySEVztSE=; b=ZO4pnr37UC4AvxfeJJUrC5knrm
	JGoBHcZCeetgN6fEOM+S1isJoa1H0rLR65J26tPqEZEkVGpwM8BIzrp3vdvEvZ8BTsqyW0Xk4KQzy
	59QQOsB55JwW7pJMCo5KRku7ORCk7zpJr5ZFNtiBVcsnjm51VGp0RTPtrT+47WUdrHDvZBbU4ud9+
	kEiKpATjUNcwfQul/bMHtiS8xw1uSu0Xz8vpMl/jiz/H/SqBI0zvGNoopEYIHWkCFDRORr5iWhQ74
	4om2bVJcsqncDSVlaipsDSJqe/YyDH9SLSjuV2yby1k2E2eMLD4CpfpU0tNVTumGEBnzLEyNqZdbw
	NM5Og0Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEH6n-00EIVA-2g;
	Tue, 27 Jun 2023 22:24:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEH6k-00EIUe-2o
	for linux-riscv@lists.infradead.org;
	Tue, 27 Jun 2023 22:24:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5FB63611D3;
	Tue, 27 Jun 2023 22:24:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8698CC433C0;
	Tue, 27 Jun 2023 22:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687904661;
	bh=3odM338dUGma/kFF5jIXrsS8B9IsfdnyrXHenPeDEyg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k7XLaTnTtJm8j6XkYl0ugQxtbjLGInEpaOCRHFwzqEMz+yjOb8+dLJRIAorHRFgRT
	 t4geRWyXsi4L4SsuTnevJueT+ik/oP+u7BUjESFavYUWjZYYmLYX4J6XuVhxUcsrWY
	 IzVZooDbTC2IzQ6NJ227NTwAlRHfvvLAqb1jpqlsHpUlY1D2Ki2qq241pQQbk/FTv2
	 RPVulaRao9V+18aNa/R2Atfjf1cLMD5sG378zI6Vf/PBus2VwE3IJYbX401WHky64A
	 JDL0P3wddbu9edDO3YGKOVAfU1GVO9K6pkY+gfHTPjYdSEMtlDA2HvlOCivOtb2qRb
	 Xas9Z4eHkdL2A==
Date: Tue, 27 Jun 2023 23:24:17 +0100
From: Conor Dooley <conor@kernel.org>
To: Atish Kumar Patra <atishp@rivosinc.com>
Cc: Charles Jenkins <charlie@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Anup Patel <anup@brainfault.org>, Evan Green <evan@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: Re: [PATCH 0/2] Restrict address space for sv39,sv48,sv57
Message-ID: <20230627-species-snowbound-2b831c383f46@spud>
References: <20230626183611.40479-1-charlie@rivosinc.com>
 <20230627-eternity-mulberry-e1f4babf06a1@spud>
 <CA+7dDtKARX35pcgdKopuM6c8oj+TKLRhXcF0+d4MZE51V7Bifg@mail.gmail.com>
 <20230627-john-spree-0f82769618c5@spud>
 <20230627-paddle-chatter-257a9885722a@spud>
 <CAHBxVyFXQj+rYdevoVHWj_LzHxV3hcE6zLJ3xfVkLajDpvXmBQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHBxVyFXQj+rYdevoVHWj_LzHxV3hcE6zLJ3xfVkLajDpvXmBQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230627_152422_997328_545C16EC 
X-CRM114-Status: GOOD (  43.01  )
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
Content-Type: multipart/mixed; boundary="===============2938398182053815147=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2938398182053815147==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="b3reO2r843ZbS9e1"
Content-Disposition: inline


--b3reO2r843ZbS9e1
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 27, 2023 at 02:51:51PM -0700, Atish Kumar Patra wrote:
> On Tue, Jun 27, 2023 at 2:12=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:
>=20
> > On Tue, Jun 27, 2023 at 10:10:06PM +0100, Conor Dooley wrote:
> > > On Tue, Jun 27, 2023 at 01:44:18PM -0700, Charles Jenkins wrote:
> > >
> > > - all the random CCs
> >
> > And without ballsing up Konstantin's address....
> >
> > >
> > > > On Tue, Jun 27, 2023 at 11:24=E2=80=AFAM Conor Dooley <conor@kernel=
=2Eorg>
> > wrote:
> > > > > On Mon, Jun 26, 2023 at 11:36:02AM -0700, Charlie Jenkins wrote:
> > > > > > Make sv39 the default address space for mmap as some applicatio=
ns
> > > > > > currently depend on this assumption. The RISC-V specification
> > enforces
> > > > > > that bits outside of the virtual address range are not used, so
> > > > > > restricting the size of the default address space as such shoul=
d be
> > > > > > temporary. A hint address passed to mmap will cause the largest
> > address
> > > > > > space that fits entirely into the hint to be used. If the hint =
is
> > less
> > > > > > than or equal to 1<<38, a 39-bit address will be used. After an
> > address
> > > > > > space is completely full, the next smallest address space will =
be
> > used.
> > > > > >
> > > > > > Documentation is also added to the RISC-V virtual memory section
> > to  explain
> > > > > > these changes.
> > > > >
> > > > > I don't know what went wrong here, but this never ended up in
> > patchwork
> > > > > for some reason, although it has appeared on lore. That seems to =
be
> > via
> > > > > the docs mailing list, rather than linux-riscv. Could you speak to
> > Atish
> > > > > and see if he knows what went wrong?
> > >
> > > > I talked to Atish, he's not sure what's going on here either. I am
> > going
> > > > to add him to the CC list.
> > >
> > > Atish is the one with admin for the list, I figured he'd be able to t=
ell
> > > if it got bounced properly. If it got bounced correctly, but didn't
> > > arrive in patchwork then I don't know.
> > >
>=20
>=20
> That's the first thing I checked while talking to charlie. It did not
> bounce either.
> I checked the admin portal and no pending messages either. I guess gmail
> just dropped it randomly!
> It is a known fact that gmail doesn't like linux mailing lists much. I ju=
st
> discovered few of linux-riscv emails
> landed up in the spam!

Usually that seems to be on the incoming side, I know my work emails end
up in gmail spam boxes. I opted to just mark all mail with a list in CC
as non-spam in my filters, I'll eat the random emails in Polish we get
every now and then, in exchange for not missing stuff.
The outgoing side is usually more reliable, so surprised if that's the
problem.

> @Charlie Jenkins <charlie@rivosinc.com> : Try to resend the series with a
> reduced cc list hoping that it would end up in linux-riscv this time :)

Yeah, maybe that would help. Too big a CC list is often problematic, I
think 1024 or so characters might be the limit for infradead, and the
strategy of doing "To: Charlie, Cc: all maintainers & lists" seems to
have produced a list well in excess of 1024. That seems like a likely
culprit!
There's a bunch of people CCed on that that probably don't care one
iota for what we are doing on RISC-V, RMK is probably a good example of
that, who don't need to be CCed.

> > > Usually when a bunch of lists are CCed, multiple entries show up on
> > > lore, afair. In this case, a bunch of lists were CCed, but only the o=
ne
> > > via linux-doc appeared on lore.
> > >
> > > Konstantin, any ideas?
> > >
> > > Cheers,
> > > Conor.
> > >
> >
> >
> >
> > > _______________________________________________
> > > linux-riscv mailing list
> > > linux-riscv@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/linux-riscv
> >
> >

--b3reO2r843ZbS9e1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJthkQAKCRB4tDGHoIJi
0rWNAQDWRDHs1I1vSpYrJCqbQj44Q39wgx4B6k93dm6KS68tNgEA92td68+dwEu+
9olQyFS22zdp8SFxrXwOPSl+xaW/QAo=
=Wn2L
-----END PGP SIGNATURE-----

--b3reO2r843ZbS9e1--


--===============2938398182053815147==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2938398182053815147==--

