Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B32AC25B75
	for <linux-riscv@archiver.kernel.org>; Wed, 15 May 2024 17:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=InConh2DOe1+Jns3//Bs4ySDdhRtklI3rT+vjIHszZU=; b=VdkKOMjpsmWK3ua3xfQ8T027Un
	CQmJPcrRRPEKquncRK8VGFWxnyxR944ut+gsgcenzP/ar+glb0xi/nNK1/fIDgxCs02/etFFuHLGR
	4XgK6h/LrDcmN5fJXIfd6zH+96AdpI8vHjU9MfGRk8GZaZcd3INmwct+LXuJfuVXtdEcYrKaCJ5n5
	VQlUIvIEJjqvBXqLsXc8CjAlaBY3hlsQbMgfLiLVnfcSNk8/a6SBGbuoGCh327jyoH+sLa8SdU9N4
	D9fLMWUeu12TF0gD5wgfe3q9PRpZoK4BBDG/4a5FzPU8vBpsqNRurB9KywikNkQJ/1MUN33/rxX13
	/EZ2Izjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7ISi-00000002Ppv-45c2;
	Wed, 15 May 2024 17:30:44 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7ISg-00000002PpM-0SUb
	for linux-riscv@lists.infradead.org;
	Wed, 15 May 2024 17:30:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3414ACE16B2;
	Wed, 15 May 2024 17:30:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22FACC116B1;
	Wed, 15 May 2024 17:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715794239;
	bh=OJG4bpEGGrZGuwGChGXNvkTrT4xr+O2uNSKaalzsRVI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S2zfY/ktqA30sWx3dEOarfDm+D3W5drrb2PnLQ0orVlbsqD7LXdOivxf2ZxVjGoDJ
	 AG7WPJcfjjBPxSmPeUTWegrilWmNoRtR1wPPjQJPyOsK67+UKsuXA3FSdcsrabMI99
	 vxGraPNlo9AAShAs9xKpZUxfugtcqdKr4aeZ92cUukidF6N7Nd7iWfZXlRg9d+6lsn
	 uzCZdhrF5a1yIqwrMS/XIeJ3/aGrsKSI4nruvzrj4MBGO4c9s9p7F/HPPy3eTxToHm
	 TLaBTMUDXr+DfSZnjen3z8tazbUPkdli23xcKfFR0fHg4HVgxfLlwnuQV8rZNB+PKV
	 RLF6cPJ390D/A==
Date: Wed, 15 May 2024 18:30:36 +0100
From: Conor Dooley <conor@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] RISC-V: fix Andes errata build issues
Message-ID: <20240515-bootie-patriarch-769c0ebff4b1@spud>
References: <20240515-comic-sketch-3b40e6676f55@spud>
 <ZkTnlEnoFFrQdXi2@ghost>
 <20240515-slander-stranger-683758537aee@spud>
 <ZkTuc4fxXcS/g7hC@ghost>
MIME-Version: 1.0
In-Reply-To: <ZkTuc4fxXcS/g7hC@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_103042_618127_51928A87 
X-CRM114-Status: GOOD (  36.46  )
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
Content-Type: multipart/mixed; boundary="===============5271701978554153260=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5271701978554153260==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NRZexXjAe9f94SYv"
Content-Disposition: inline


--NRZexXjAe9f94SYv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 15, 2024 at 10:18:43AM -0700, Charlie Jenkins wrote:
> On Wed, May 15, 2024 at 05:56:30PM +0100, Conor Dooley wrote:
> > On Wed, May 15, 2024 at 09:49:24AM -0700, Charlie Jenkins wrote:
> > > On Wed, May 15, 2024 at 05:09:34PM +0100, Conor Dooley wrote:
> > > > From: Conor Dooley <conor.dooley@microchip.com>
> > > >=20
> > > > Commit e47c37c24024 ("riscv: Introduce vendor variants of extension
> > > > helpers") added includes for the new vendor_extensions.h header in
> > > > the T-Head and SiFive errata handling code but didn't do so for And=
es,
> > > > resulting in allmodconfig build issues when commit 589e2fc85850
> > > > ("riscv: Convert xandespmu to use the vendor extension framework")
> > > > added a user of a macro defined there.
> > > >=20
> > > > Fixes: 589e2fc85850 ("riscv: Convert xandespmu to use the vendor ex=
tension framework")
> > > > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> >=20
> > >=20
> > > I was going to fix this in my next version but was waiting for the
> > > reviews on the thead stuff. I wasn't anticipating these patches to be
> > > able to jump the queue :)
> >=20
> > Yah, the reason for that is I asked him to take the non-vector parts of
> > the series as 6.10 material so that we'd have less stuff movin' around
> > in cpufeatures.c so that Clement's Zc* + validation changes wouldn't run
> > into a bunch of conflicts etc. Same reason that I pushed for getting
> > Andy's vector subset stuff merged today, but that mighta been before you
> > hopped in.
> >=20
> > Cheers,
> > Conor.
>=20
> Yes I was a couple minutes late to the meeting, whoops.


It's prob at like 0600 for you, so w/e.

> The subset of
> patches that was pulled into for-next is odd to me because there is some
> of the thead enablement code as part of the vendor extension enablement
> so that there was a user for it. Since the subset on Palmer's for-next
> does not have the rest of the thead code there is only a
> half-implementation of the thead code, it allows the kernel to probe for
> xtheadvector but it doesn't probe anywhere.

I dunno, I think that reporting that the extension is there constitutes a
user, it's not gonna be dead code. There's plenty of extensions for
which all we do is detect them and nothing more.

> In my opinion, a better solution would be for me to get rid of the thead
> code entirely from those patches. So that there is still a user, I can
> replace the thead code with the andes versions.

The Andes stuff is in the subset he applied though, so...
>=20
> Since Palmer already pulled in those changes maybe it's too late. There
> is not a critical problem here, but it seems like it's bad practice to
> introduce code without a user.

=2E..there is actually a "real" user in xandespmu. I did miss that
"riscv: Extend cpufeature.c to detect vendor extensions" actually
contained the xtheadvector detection though, rather than just the
infrastructure. I think it is probably harmless to have it, but
shouldn't be too hard to quickly drop the thead bits either I suppose
if you're worried about it.

Cheers,
Conor.

--NRZexXjAe9f94SYv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZkTxOwAKCRB4tDGHoIJi
0n57AP4/XQPuVo3AOMDuWOhQHlozouIYfM94T+VqEClRrVRYygEA/NOrcaa74Uan
t1niincoErkoqmkJa33oAK4rZzugGw0=
=ZNQ4
-----END PGP SIGNATURE-----

--NRZexXjAe9f94SYv--


--===============5271701978554153260==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5271701978554153260==--

