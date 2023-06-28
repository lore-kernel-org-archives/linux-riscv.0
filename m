Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 355CBEB64D7
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jun 2023 17:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SAmOGld/caVN8R1IpvXXVPlXOmWFaCMtzoRy/hXMGGo=; b=14iMuqaqNYMPysHinHvTQx6kQS
	QzONaGsVfOvc2+jHnZGEAbYhqcaQtl1x3w1DBpYYUJoBcE4N9xIjrMNOYAd+QDS1OrJV6yQZ/3y8j
	v5Hsb4awdrgWn59xruB0HH0AunMP8RzitheoQoLNzrex12wlk/xPP1liGwjUzXGFxS1K11vqivq7m
	DLM+gEbCQf5FpAi5lQdgEFIkPhH63sefu0gQB55oOewVxmf9q4JOrzAgPBna2GjLDl7bUKUJvHxYO
	PR9vBc1h4v8+f/rDJOZmwTCFiatYh3eb9SepBI1Zt/+mc9ngeuzLeLMYe325/lUFSc1JeB4KDl4pg
	qNjUz8Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEYuQ-00GHID-1d;
	Wed, 28 Jun 2023 17:24:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEYuO-00GHHh-00
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jun 2023 17:24:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 58FCD6129E;
	Wed, 28 Jun 2023 17:24:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 773F0C433C8;
	Wed, 28 Jun 2023 17:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687973085;
	bh=Sop1yazDMV/lbh0CwxeOMS0e7MThVMtbfcxDvIY6Dh8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dSRecRJtf1nhaszbsN0TCBX6rcEJD8lDqlCiZxK/c+rNQ5KqgAJzo/BFob79E2NCR
	 RPurYxvyLHoGAN3GKmHY/cG/kuVpKmHsgw+HB1vrajaXVNV9V3hJMhqMQe/HXNAIUT
	 0dUNCPXrc7fkEtgtMhZgAb6TE12IWDijpbqG3ShvsQP2YRjknXqaUSD/7EFuw+ulY6
	 nP9ktEvzTdO0W+IZi/fsKBuXKo5XRcB7WzBG0XK/FjJL3b04sF23QKfJFl8OeeDlLu
	 KvyqV+f21g6KzVBcwmV6xKUqPAfGze5q6t4oX0S3NHZRoVxRGW7ta6JTuVTOs5aE2K
	 8js1ra+oT9WgA==
Date: Wed, 28 Jun 2023 18:24:40 +0100
From: Conor Dooley <conor@kernel.org>
To: Evan Green <evan@rivosinc.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	"Hongren (Zenithal) Zheng" <i@zenithal.me>, linux@rivosinc.com,
	Andrew Jones <ajones@ventanamicro.com>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Anup Patel <apatel@ventanamicro.com>, linux-kernel@vger.kernel.org,
	Guo Ren <guoren@kernel.org>, Atish Patra <atishp@rivosinc.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Jiatai He <jiatai2021@iscas.ac.cn>
Subject: Re: [PATCH 1/3] RISC-V: add Bitmanip/Scalar Crypto parsing from DT
Message-ID: <20230628-dragonish-lullaby-b44d2df09d66@spud>
References: <20230627143747.1599218-1-sameo@rivosinc.com>
 <20230627143747.1599218-2-sameo@rivosinc.com>
 <CALs-HssMkVikspnEi-Ek2t=ABvFvgptAhsBjk1+aLuVjiP7P7w@mail.gmail.com>
 <20230627-debating-twelve-da2c1ed60948@spud>
 <ZJwE5wRVkoND3Z6P@vermeer>
 <20230628-unfeeling-tavern-edd4f58396fa@wendy>
 <CALs-HstZe+bw_fY--4FQXfFoA67tvMSaEjKhZ2pRstNT07xBxA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALs-HstZe+bw_fY--4FQXfFoA67tvMSaEjKhZ2pRstNT07xBxA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_102448_124324_AACA5726 
X-CRM114-Status: GOOD (  33.98  )
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
Content-Type: multipart/mixed; boundary="===============6073846976441753126=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6073846976441753126==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Nk2liGfu8KoG29TY"
Content-Disposition: inline


--Nk2liGfu8KoG29TY
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 28, 2023 at 10:18:34AM -0700, Evan Green wrote:
> On Wed, Jun 28, 2023 at 4:10=E2=80=AFAM Conor Dooley <conor.dooley@microc=
hip.com> wrote:
> >
> > On Wed, Jun 28, 2023 at 12:01:11PM +0200, Samuel Ortiz wrote:
> > > On Tue, Jun 27, 2023 at 07:48:15PM +0100, Conor Dooley wrote:
> > > > On Tue, Jun 27, 2023 at 11:14:30AM -0700, Evan Green wrote:
> > > > > On Tue, Jun 27, 2023 at 7:38=E2=80=AFAM Samuel Ortiz <sameo@rivos=
inc.com> wrote:
> >
> > > > > It would be nice to consolidate the ones together that search for=
 a
> > > > > single string and set multiple bits, though I don't have any super
> > > > > elegant ideas for how off the top of my head.
> > > >
> > > > I've got a refactor of this code in progress, dropping all of these
> > > > copy-paste in place of a loop. It certainly looks more elegant than
> > > > this, but it will fall over a bit for these "one string matches many
> > > > extensions" cases. See here:
> > > > https://patchwork.kernel.org/project/linux-riscv/patch/20230626-thi=
eving-jockstrap-d35d20b535c5@wendy/
> > > > My immediate thought is to add another element to riscv_isa_ext_dat=
a,
> > > > that contains "parent" extensions to check for. Should be fairly do=
able,
> > > > I'll whip something up on top of that...
> > >
> > > Nice, and thanks for the review.
> >
> > > Should I wait for your refactor to be merged before pushing this one?
> >
> > I don't know. I think that you should continue on with your series here,
> > and whichever goes in second gets rebased on top of the other.
> > I don't think it makes material difference to review of this patchset as
> > to whether you rebase on top of what I'm working on, so I wouldn't
> > bother until it gets merged.
> >
> > Rather hacky, had less time than expected this morning:
> > https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/commit/=
?h=3Driscv-extensions-strings-supersets
> > Clearly there's issues with looping to RISCV_ISA_MAX_SUPERSETS & I just
> > repurposed Zicsr for the sake of testing something in the time I had.
> >
> > Evan, at a high level, does that look more elegant to you, or have I ma=
de
> > things worse?
> >
>=20
> I see what you're going for at least. It's unfortunate that when
> someone bumps up RISCV_ISA_MAX_SUPERSETS it squares the whole array.
> Another way to go might be to define the elements in a separate array,
> like:
>=20
> unsigned int riscv_zks_exts[] =3D {
>        RISCV_ISA_EXT_ZBKB,
>        RISCV_ISA_EXT_ZBKC,
>        ....
> };
>=20
> then the macro entry looks like:
>=20
> SET_ISA_EXT_MAP_MULTI("zks", riscv_zks_exts),
>=20
> where the SET_ISA_EXT_MAP_MULTI() could use ARRAY_SIZE() to stash both
> the pointer to the array and the number of elements.

Yup, I like the sound of that. I like the variadic stuff as it'd not
require defining a bunch of sub-arrays of supersets. I guess if it grows
too badly, we can just dump it off into another file or w/e.

--Nk2liGfu8KoG29TY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJxs2AAKCRB4tDGHoIJi
0hyeAPoCJou4iW+SwgKBQCp5o/rvu8bFFnG2SdAC26nA3X5ifAD8Cev8fwX4Y1Qg
5T7g/LvQlXnVSz10udi5To5hLiisfQM=
=dznn
-----END PGP SIGNATURE-----

--Nk2liGfu8KoG29TY--


--===============6073846976441753126==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6073846976441753126==--

