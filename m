Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45F3FC77B76
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Apr 2023 19:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Iyyht3JAkDVfh3rw9xjMrcWpW+etuysqs2m7A/YKoPQ=; b=nlvwfvzvOiahTc4t4+wG9C5Jxr
	NGXJ8edCtEKoIuPEFbhKxmV5oChc2tNgI6mdqwdqgJbcLqJtyiSpDRmIYTLcMYz409XF2H2QzE5GP
	8cIUabkN9MKIB74ivb7bj+2Kws+G2k69DHzFvWswBj6KSY3CXD6/kGGwfAFtDYz/PFQSTY7zKnbR8
	MIimoMZBVEajKXiy/RIirxILmRipKVXGorS8CNo5Vxp2CuHY2C97z/0HhaeYmzPmWcQovjkGvNfWM
	J76Ofew91RWQp1RO7qnUY34e65yGWFhHGt8zCxGBFShWtIHENEpWR6Mn1feYll/C4fPmPS5OLZdu3
	zywBy4ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppwNY-00BjAq-2h;
	Fri, 21 Apr 2023 19:25:08 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppwNV-00BjA4-0u
	for linux-riscv@lists.infradead.org;
	Fri, 21 Apr 2023 19:25:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A572F60C88;
	Fri, 21 Apr 2023 19:25:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98362C433EF;
	Fri, 21 Apr 2023 19:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682105103;
	bh=W7uWtRhn74gI5DdykMl9Ygbat47KEyixL2s+R7CXf4Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P1uQO+lQn46h8sPkUIDTeuuuaqYEuXAC5XrVOBAwjT+6B4j8NizF8+Bhcmg/SbXDx
	 R35KPmFskBNMwE2hWOlTsNitogRtztEI5E/BMcoea1Ygr0ah4ez9K+IKV/JXLH8xg+
	 2hSscDX7Y8/QQfQ0dNAJrbGWNpjH3G26G1l8YL3wv2N927leM1laIByU2Nknx0W5Lh
	 9qUiz7pT6ig8062P2j0qb4E+8nVCmlLsP5ZWFcalVG/T7mul1u92MUMzR6U/UeaO7S
	 IR77iLd+n3LXOoNWDfycqXuLnHTaBxVfi9wkSaVNIx9yoRUXcGRCx1vUEBj83/9xev
	 DJZslEGbLEeSw==
Date: Fri, 21 Apr 2023 20:24:58 +0100
From: Conor Dooley <conor@kernel.org>
To: Konstantin Ryabitsev <konstantin.ryabitsev@linux.dev>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, alexghiti@rivosinc.com,
	aou@eecs.berkeley.edu, linux-kbuild@vger.kernel.org,
	ndesaulniers@google.com, linux-kernel@vger.kernel.org,
	bjorn@kernel.org, npiggin@gmail.com,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v9 0/6] Introduce 64b relocatable kernel
Message-ID: <20230421-uneaten-obvious-250d95c86560@spud>
References: <mhng-bb70f74f-2b5b-4880-b7bf-975e67dc554e@palmer-ri-x1c9>
 <ba235aa677a561ceb2dc776414403dc0@linux.dev>
MIME-Version: 1.0
In-Reply-To: <ba235aa677a561ceb2dc776414403dc0@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_122505_381246_B0E54E39 
X-CRM114-Status: GOOD (  16.56  )
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
Content-Type: multipart/mixed; boundary="===============8872459555407530817=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8872459555407530817==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cYLCWmWMPROB1qtr"
Content-Disposition: inline


--cYLCWmWMPROB1qtr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 21, 2023 at 07:10:14PM +0000, Konstantin Ryabitsev wrote:
> April 21, 2023 2:59 PM, "Palmer Dabbelt" <palmer@dabbelt.com> wrote:
> >> riscv: Use PUD/P4D/PGD pages for the linear mapping
> >> (https://patchwork.kernel.org/project/linux-riscv/list/?series=3D73360=
3)
> >> base-commit-tag: v6.3-rc1
> >=20
> > The QEMU CI has some way to say "this depends on an un-merged patch set=
 sent as $MESSAGE_ID", not
> > sure if that's a b4-ism but it's a bit less confusing.
>=20
> I think it's patchwork-ism, actually. B4 will eventually learn to be
> able to include dependent series info and automatically retrieve/apply
> them in the proper order on "shazam", but it can't do that yet.

A patchwork-ism or a patchew-ism? Drew Jones was my source for this, but
he had said the thing to do in QEMU-land was put a:
Based-on: $message-id
in your cover letter for each thing that you depend on. I'm not entirely
sure if that meant each series or each patch. I think patchew picks that
up and dumps in it on a patchew github account that the CI might pick up
on. From the QEMU docs:
<quote>
It is also okay to base patches on top of other on-going work that is
not yet part of the git master branch. To aid continuous integration
tools, such as `patchew <http://patchew.org/QEMU/>`__, you should `add a
tag <https://lists.gnu.org/archive/html/qemu-devel/2017-08/msg01288.html>`__
line ``Based-on: $MESSAGE_ID`` to your cover letter to make the series
dependency obvious.
<\quote>

FWIW, my vote is for something with a message-id, rather than those
patchwork series links that you can't dump into b4!

--cYLCWmWMPROB1qtr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZELjCgAKCRB4tDGHoIJi
0s1yAP9XTAhQrJD/xmNk2JTUsPIU6e0uJxU1rNaDElF8T2ioggD/RuvGZYpDeAT8
rVM1QBn5DNrHVZWw5EILFxMXOgo1hA4=
=0mnA
-----END PGP SIGNATURE-----

--cYLCWmWMPROB1qtr--


--===============8872459555407530817==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8872459555407530817==--

