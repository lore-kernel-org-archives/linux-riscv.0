Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A653C761A6
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Mar 2023 07:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CkoQKGzKhZyKfqvNVgoONCdTlJZpzOkHDu21W540EwE=; b=Cwv+TLUpOHwvnHR9mbsw4wIdVi
	95LCKUy0gLUKDDVZQ0nTWw1cFacONj5qMeinY3EXaewUByF45dGeiBSaxUUyVPTnhPsDPr//+e7kH
	thH9cNwHhBpSZERRROmcadHol2yXjt6DKxSZul69N+oj1n2mdgJCHAvUXg/XLk+8UDQ5P/ROYeCnQ
	VLo/hn1QK41clJh0TiT5ivzOi39IU+WH4RXqgq7rneF9EQJCBNswWFNvuCDeNSqk1oGCppZRmOcYG
	iovoKoWR3bny9cDGNwjECSiK3X9i2R1yTZbk7w1mMHh3bd4CtbqfaWGW+HIw2LPXwdrozcxWszO4/
	8NzyK1Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peWjd-00BaaW-0k;
	Tue, 21 Mar 2023 07:48:45 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peWjY-00BaYT-2R
	for linux-riscv@lists.infradead.org;
	Tue, 21 Mar 2023 07:48:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1679384921; x=1710920921;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6MyBY7psL5F53ecAKmJGuXc/BjEv9wV4jEJml3TJFIk=;
  b=F9+F+h2GGrnuClEf94wVuk9OosEmYhW8i+++WywX1zwTdUHG7qLIPdht
   GAQXWf0NEzhwmHmozJbnvl7Uz+Yo09SJi5pFuN3id4xU8MYTFs8PALqQJ
   WjS1NYl/Cm3p8WuB07y/tchH2MQhwpWitU7WVMlIYR5biKX+tcTjnHXWS
   uYf9a9UeitsvzAeWD/WShBy8K+UI/ofi2BKy+hLl17413VYDcqbE/mQ3S
   GL2Q/6N5pik8/gmWhur+k4eKrEsGpnDTa81oqMdufJT+kE306C5LU4MXg
   x3mNQqr6K7oSqY2w1u021tipEbGzFp8TFTG49F8Yqyx3U14Hqvc9AEnyn
   w==;
X-IronPort-AV: E=Sophos;i="5.98,278,1673938800"; 
   d="asc'?scan'208";a="143073635"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 21 Mar 2023 00:48:33 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 21 Mar 2023 00:48:33 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Tue, 21 Mar 2023 00:48:31 -0700
Date: Tue, 21 Mar 2023 07:48:01 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Leonardo =?iso-8859-1?Q?Br=E1s?= <leobras@redhat.com>
CC: Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Guo
 Ren <guoren@kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH 0/6] Deduplicating RISCV cmpxchg.h macros
Message-ID: <18e07d0a-7e21-46d0-9166-6ee07817352a@spud>
References: <20230318080059.1109286-1-leobras@redhat.com>
 <8f698f49-135a-4263-8471-96f406919cb1@spud>
 <4f35f41c143b02b6b815e7eb527ca3acd8b4aabe.camel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <4f35f41c143b02b6b815e7eb527ca3acd8b4aabe.camel@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_004841_821169_FCEE5240 
X-CRM114-Status: GOOD (  38.12  )
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
Content-Type: multipart/mixed; boundary="===============0381235063285003208=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0381235063285003208==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="92Q1AYY2bRdVQ9dX"
Content-Disposition: inline

--92Q1AYY2bRdVQ9dX
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 21, 2023 at 03:30:35AM -0300, Leonardo Br=E1s wrote:
> Hello Conor, thanks for the feedback!
>=20
>=20
> On Sun, 2023-03-19 at 20:35 +0000, Conor Dooley wrote:
> > On Sat, Mar 18, 2023 at 05:00:54AM -0300, Leonardo Bras wrote:
> > > While studying riscv's cmpxchg.h file, I got really interested in=20
> > > understanding how RISCV asm implemented the different versions of=20
> > > {cmp,}xchg.
> > >=20
> > > When I understood the pattern, it made sense for me to remove the=20
> > > duplications and create macros to make it easier to understand what e=
xactly=20
> > > changes between the versions: Instruction sufixes & barriers.
> > >=20
> > > I split those changes in 3 levels for each cmpxchg and xchg, resultin=
g a=20
> > > total of 6 patches. I did this so it becomes easier to review and rem=
ove=20
> > > the last levels if desired, but I have no issue squashing them if it'=
s=20
> > > better.
> > >=20
> > > Please provide comments.
> > >=20
> > > Thanks!
> > > Leo
> > >=20
> > > Leonardo Bras (6):
> > >   riscv/cmpxchg: Deduplicate cmpxchg() asm functions
> > >   riscv/cmpxchg: Deduplicate cmpxchg() macros
> > >   riscv/cmpxchg: Deduplicate arch_cmpxchg() macros
> >=20
> > >   riscv/cmpxchg: Deduplicate xchg() asm functions
> >=20
> > FWIW, this patch seems to break the build pretty badly:
> > https://patchwork.kernel.org/project/linux-riscv/patch/20230318080059.1=
109286-5-leobras@redhat.com/
>=20
> Thanks for pointing out!
>=20
> It was an intermediary error:
> Sufix for amoswap on acquire version was "d.aqrl" instead of the
> correct".d.aqrl", and that caused the fail.
>=20
> I did not notice anything because the next commit made it more general, a=
nd thus
> removed this line of code. I will send a v2-RFC shortly.
>=20
> I see that patch 4/6 has 5 fails, but on each one of them I can see:
> "I: build output in /ci/workspace/[...]", or
> ""I: build output in /tmp/[...]".

I don't push the built artifacts anywhere, just the brief logs -
although the "failed to build" log isn't very helpful other than telling
you the build broke.
That seems like a bug w.r.t. where tuxmake prints its output. I'll try
to fix that.

> I could not find any reference to where this is saved, though.
> Could you point where can I find the error output, just for the sake of f=
urther
> debugging?
>=20
> >=20
> > Patches 1 & 5 also add quite a lot of sparse issues (like 1000), but I
> > think that may be more of an artifact of the testing process as opposed
> > to something caused by this patchset.
>=20
> For those I can see the build output diffs. Both added error lines to
> conchuod/build_rv64_gcc_allmodconfig.
> I tried to mimic this with [make allmodconfig + gcc build with
> CROSS_COMPILE=3Driscv64-linux-gnu- ] but I could not get any error in any=
 patch.

If you can't replicate them, it's probably because they come from
sparse. I only really mentioned it here in case you went looking at the
other patches in the series and were wondering why things were so amiss.

> For patch 1/6 it removes as much error lines (-) as it adds (+), and the =
error
> messages are mostly the same, apart for an line number.

I don't see a line number difference, but rather an increase in the
number of times the same error lines have appeared in the output.
I don't find the single-line output from sparse to really be very
helpful, I should probably have a bit of a think how to present that
information better.

> For patch 5/6 it actually adds many more lines, but tracking (some of) the
> errors gave me no idea why.

Probably just sparse being unhappy with some way the macros were
changed - but some of it ("Should it be static?" bits) look very much
like the patch causing things to be rebuilt only for the "after the
patch" build, but somehow not for the "before" build.

--92Q1AYY2bRdVQ9dX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZBlhLQAKCRB4tDGHoIJi
0hZlAP4n0duDt3EuH405TYYD+EISOJ36GeTGI8Kt1+7QKXReaAEAql7EYVrXRAF3
YdlzsFA20w5PSOvdJ5cWWZsdY2NFjgA=
=lOX4
-----END PGP SIGNATURE-----

--92Q1AYY2bRdVQ9dX--


--===============0381235063285003208==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0381235063285003208==--

