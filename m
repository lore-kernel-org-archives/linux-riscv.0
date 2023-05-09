Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCE77C77B7C
	for <linux-riscv@archiver.kernel.org>; Tue,  9 May 2023 21:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l3sj6wSVfpFOhRDFC/E5kF6WDGIAtR0bnHrJIoLYq7g=; b=LnotmTd7btsQhPfxjiYMHM0qRH
	WHa0SDi72Q/qJQDvI0LMeXbPiOb7MBhm2SXdDAt7wv7B6cgHkT28Gkeg9RC7DxDZ6O2gM6L2OA10o
	stDlrM4wDiqWaaHkRn4O5sD5UFvccIyOjuX6xBSIx6Rji/Pp4/bknNAEriAordGlqlVijPWaHzZot
	8XJIBxdfsSmgYkYx63BjiX8PN4Z//8wCMGG8qa51QSrUF84jXGKjHaFcwckaDqFforVeCy9PtKDeV
	wxivEZFECQ6l0YIVUz/bZ1hMmScOcMU1kwYHCDb6uOUlPiqfCypSp3UfxXGKzAP47FVJs5RALCWGU
	ihtOATzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwUXQ-004Gm2-2F;
	Tue, 09 May 2023 21:06:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwUXM-004GlJ-2M;
	Tue, 09 May 2023 21:06:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2A86A635D2;
	Tue,  9 May 2023 21:06:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAC50C433D2;
	Tue,  9 May 2023 21:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683666379;
	bh=7sYfkgLry7WC/8Y8/DOxEpFS/0wr5s2HgaHfNmzpg14=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b2NEeO4ZctXLGfGPwVLHFvMw0sCKX4CRVkYWea3neCy9F7UZGMVLS8AWcdSgQl60y
	 N2FuFtpQmDTHlpaXsYqVKexAHl8GP6Py2VSqDldNaEnDvUMhMsDzkHOYTlfa2hsMW8
	 +egWxGk0jU0NFGn4R16vXjjuBdN447cg2kl7PgdBt4LYtOky7rLf0ZbySQgbnMzEls
	 gw3mSehQE9c7K3oAibhjHmcIy8Ja5xC03/Vc2aYuwj/07qK8wfCVJ5ZN40IicUPL3z
	 Qf88zXhyl7Q1J3znWUXlLltp4IvETxfKtF0qEedZJXbXIJ9C1+r5oPgbfkmiHqUO8M
	 2zXjGa4pWhaPQ==
Date: Tue, 9 May 2023 22:06:14 +0100
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: andy.chiu@sifive.com, Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, anup@brainfault.org,
	atishp@atishpatra.org, kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org, Vineet Gupta <vineetg@rivosinc.com>,
	greentime.hu@sifive.com, guoren@linux.alibaba.com,
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu
Subject: Re: [PATCH -next v19 23/24] riscv: Enable Vector code to be built
Message-ID: <20230509-mayday-remold-a4421af1f9e1@spud>
References: <20230509-chitchat-elitism-bc4882a8ef8d@spud>
 <mhng-8554b236-c9d4-4590-8941-ed7ca5316d18@palmer-ri-x1c9a>
MIME-Version: 1.0
In-Reply-To: <mhng-8554b236-c9d4-4590-8941-ed7ca5316d18@palmer-ri-x1c9a>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_140620_884984_CFCBFD81 
X-CRM114-Status: GOOD (  40.35  )
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
Content-Type: multipart/mixed; boundary="===============8591465957402713614=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8591465957402713614==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6CxUoqN6izL3gIto"
Content-Disposition: inline


--6CxUoqN6izL3gIto
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 09, 2023 at 01:59:33PM -0700, Palmer Dabbelt wrote:
> On Tue, 09 May 2023 09:53:17 PDT (-0700), Conor Dooley wrote:
> > On Wed, May 10, 2023 at 12:04:12AM +0800, Andy Chiu wrote:
> > > > > +config RISCV_V_DISABLE
> > > > > +     bool "Disable userspace Vector by default"
> > > > > +     depends on RISCV_ISA_V
> > > > > +     default n
> > > > > +     help
> > > > > +       Say Y here if you want to disable default enablement stat=
e of Vector
> > > > > +       in u-mode. This way userspace has to make explicit prctl(=
) call to
> > > > > +       enable Vector, or enable it via sysctl interface.
> > > >
> > > > If we are worried about breaking userspace, why is the default for =
this
> > > > option not y? Or further,
> > > >
> > > > config RISCV_ISA_V_DEFAULT_ENABLE
> > > >         bool "Enable userspace Vector by default"
> > > >         depends on RISCV_ISA_V
> > > >         help
> > > >           Say Y here to allow use of Vector in userspace by default.
> > > >           Otherwise, userspace has to make an explicit prctl() call=
 to
> > > >           enable Vector, or enable it via the sysctl interface.
> > > >
> > > >           If you don't know what to do here, say N.
> > > >
> > >=20
> > > Yes, expressing the option, where Y means "on", is more direct. But I
> > > have a little concern if we make the default as "off". Yes, we create
> > > this option in the worries of breaking userspace. But given that the
> > > break case might be rare, is it worth making userspace Vector harder
> > > to use by doing this? I assume in an ideal world that nothing would
> > > break and programs could just use V without bothering with prctl(), or
> > > sysctl. But on the other hand, to make a program robust enough, we
> > > must check the status with the prctl() anyway. So I have no answer
> > > here.
> >=20
> > FWIW my logic was that those who know what they are doing can turn it on
> > & keep the pieces. I would expect distros and all that lark to be able =
to
> > make an educated decision here. But those that do not know what they are
> > doing should be given the "safe" option by default.
> > CONFIG_RISCV_ISA_V is default y, so will be enabled for those upgrading
> > their kernel. With your patch they would also get vector enabled by
> > default. The chance of a breakage might be small, but it seems easy to
> > avoid. I dunno...
>=20
> It's really more of a distro/user question than anything else, I'm not
> really sure there's a right answer.  I'd lean towards turning V on by
> default, though: the defconfigs are meant for kernel hackers, so defaulti=
ng
> to the option that's more likely to break something seems like the way to=
 go
> -- that way we see any possible breakages early and can go figure them ou=
t.

To get my "ackchyually" out of the way, I meant the person doing `make
olddefconfig` based on their distro's .config etc or using menuconfig
rather than someone using the in-kernel defconfig.
We can always set it to the potentially breaking mode explicitly in our
defconfigs while leaving the defaults for the aforementioned situations
as the "safe" option, no?

> Depending on the risk tolerance of their users, distributions might want =
to
> turn this off by default.  I posted on sw-dev, which is generally the best
> way to find the distro folks.

--6CxUoqN6izL3gIto
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZFq1xgAKCRB4tDGHoIJi
0onDAP4iMNMAEyDHEcVWCAxQH1cpSuxmaOfKw42e48Bn+vxW0QD/SBshmaA7DYck
7Cmq5TAKkVMA+lRlsp6nZgJfdQoNqwM=
=bIbJ
-----END PGP SIGNATURE-----

--6CxUoqN6izL3gIto--


--===============8591465957402713614==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8591465957402713614==--

