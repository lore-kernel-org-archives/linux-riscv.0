Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71587EB64D7
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jun 2023 20:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h5FGc5Z4OZbPQtfRpCSI/Thp4puTOXcTKgTcEGwjYfM=; b=lokHoopyPAG6EpP5S00cIukpa3
	CLU7QpyrCl4KXj9To2qeZBsH4N1gvWYBr/Aiwfhk2nCmgsH2ZQNjbk8MR740qgAZ99Q5zC4fkJzxe
	ZSvKJPjcOszUri4TJdtDiGg0W7bImlJi2YgRvBKk5OrQJkVEgLvKayFKZMFi5M7TWbfsWcWge+RTe
	2o7minJtK+XW0c5XKoP1VRPmkt/KNwroOrgQFH5eDeS7akw3yN/BJwFEaTGAGFDqhqa46DcG2GuD3
	+oKwl7MCcuzt+x/ARqIjrnBdu4w9TaDVlt3eui8AwgPS6rdZCSTb43z0yRPPgwcse5dVH3vHfIWzQ
	unE6A6bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBhj0-00CGNw-2K;
	Tue, 20 Jun 2023 20:13:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBhix-00CGNL-38
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jun 2023 20:13:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AE713611B4;
	Tue, 20 Jun 2023 20:13:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4991C433C8;
	Tue, 20 Jun 2023 20:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687291990;
	bh=Up7OY2tx2Bu7OREXkSV0cO4hmudyAUm7ranaZzjRagc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FRhUHZZ65pqJtvqL9yGGffR5fAed0s7h9/Adr7f9XAnI6s0nvTGO2xtSL9IAQEaht
	 e0OdeMajo3Mhx6E4yZ+Rhulm/rixmS+fQenrM/3qlmVG8pNpAvgQCkxcZnitFog+dY
	 3bP8Wx2Zr57SS5IcaNEOTknP7mvaIdIeKLDJH2xWgmwioCrZxZhRP1Te/GN5IgdKnC
	 40wkS47hnmAZZGBQEwok8w94MqAUJfMTHNp2kWiR9/ggLaA7sfbeRh3OGpKCs/AojC
	 MkO4vvCFv4kl7zW8q2HDxiNcZyKFFy5HtEVzVENIuzECMDev3Iw8OZLgr032l38/A2
	 XmSKSaGRx1oxw==
Date: Tue, 20 Jun 2023 21:13:05 +0100
From: Conor Dooley <conor@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, jszhang@kernel.org,
	llvm@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>,
	aou@eecs.berkeley.edu, Arnd Bergmann <arnd@arndb.de>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, Fangrui Song <maskray@google.com>,
	Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH v2 0/4] riscv: enable HAVE_LD_DEAD_CODE_DATA_ELIMINATION
Message-ID: <20230620-gibberish-unblended-f4b50c7fe369@spud>
References: <mhng-41a06775-95dc-4747-aaab-2c5c83fd6422@palmer-ri-x1c9>
 <mhng-57559277-afaa-4a85-a3ad-b9be6dba737f@palmer-ri-x1c9>
 <CAKwvOdmsgMN5oQpDLh12D0X-CfQDtHC-EtxHcBnADkhnyitMKQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKwvOdmsgMN5oQpDLh12D0X-CfQDtHC-EtxHcBnADkhnyitMKQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230620_131312_078041_C133378C 
X-CRM114-Status: GOOD (  18.97  )
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
Content-Type: multipart/mixed; boundary="===============7988997070721923906=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7988997070721923906==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qnIKHjmO/IECDseO"
Content-Disposition: inline


--qnIKHjmO/IECDseO
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 20, 2023 at 04:05:55PM -0400, Nick Desaulniers wrote:
> On Mon, Jun 19, 2023 at 6:06=E2=80=AFPM Palmer Dabbelt <palmer@dabbelt.co=
m> wrote:
> > On Thu, 15 Jun 2023 06:54:33 PDT (-0700), Palmer Dabbelt wrote:
> > > On Wed, 14 Jun 2023 09:25:49 PDT (-0700), jszhang@kernel.org wrote:
> > >> On Wed, Jun 14, 2023 at 07:49:17AM -0700, Palmer Dabbelt wrote:
> > >>> On Tue, 23 May 2023 09:54:58 PDT (-0700), jszhang@kernel.org wrote:

> > >> Commit 3b90b09af5be ("riscv: Fix orphan section warnings caused by
> > >> kernel/pi") touches vmlinux.lds.S, so to make the merge easy, this
> > >> series is based on 6.4-rc2.
> > >
> > > Thanks.
> >
> > Sorry to be so slow here, but I think this is causing LLD to hang on
> > allmodconfig.  I'm still getting to the bottom of it, there's a few
> > other things I have in flight still.
>=20
> Confirmed with v3 on mainline (linux-next is pretty red at the moment).
> https://lore.kernel.org/linux-riscv/20230517082936.37563-1-falcon@tinylab=
=2Eorg/

Just FYI Nick, there's been some concurrent work here from different
people working on the same thing & the v3 you linked (from Zhangjin) was
superseded by this v2 (from Jisheng).

Cheers,
Conor.

--qnIKHjmO/IECDseO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJIIUQAKCRB4tDGHoIJi
0pwKAPwN0fl/0BvxzqWUorGfL8WNfDjmU0SS2DfTLOj65jF6NgD+OGR2qRbVJjsn
RR7ojSY2OsUPffu6ghob8ys0ss+XpgI=
=V3r5
-----END PGP SIGNATURE-----

--qnIKHjmO/IECDseO--


--===============7988997070721923906==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7988997070721923906==--

