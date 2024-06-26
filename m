Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00C8EC27C4F
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jun 2024 22:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=er9NM34qM1BP2NLqxm1nhtUBB1q1mY14ySaZm4OP0/8=; b=EC8DNX0F8vSxaCr0FYzWzs1755
	PxrLBcuUjO1Eb+HWfPVSGxLbY+zTwMhnoLAXnbV7m40dHsTiPJ4kJKL98/1dIFKjNFFOO9IZMPVw6
	Q79Y3RewV8AzwNGsalBFeBpDajTkK+RcC2VIYul9yv/BUjltsK/dMHRGSzFrTgBpA8Ipz2QzA4iBO
	UuaReQFgP1qU7VtkvGk0VMPS7hklmbNanmVOadKsYOg5kMpVngZfHZqExKwtrDrfo3euEE4zLaPBo
	u3VNsslaBmzsT75UE2AW2vZlRxM0vvxkLt3ykYzi6e2JpfRBa9Yg3WdcqOJMigLDh8pzMG3Mqc4rR
	xOg7Howg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMasC-00000008T8Y-0G9p;
	Wed, 26 Jun 2024 22:12:16 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMary-00000008T53-3c3a;
	Wed, 26 Jun 2024 22:12:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7FE97CE2CCB;
	Wed, 26 Jun 2024 22:12:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90A02C116B1;
	Wed, 26 Jun 2024 22:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719439919;
	bh=hpQdIVXXgJ8IuDlSJFC93BuJvLDRkunHWFns0BW8VHU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NftDNO2yLuZesOV4fuw7HaphDFd3R1jqrmBELfKDVHpmS3AicuoQr7Khztp9tHq1V
	 DKDR6Qa4k7n9nHovDaVcQbceZDGq+mccl9vDe7nAVuUZXNU8xA49F6ioAv3kqYKx/M
	 ZMRq3VPtdVzUft0nWQ6HGgEmbPasr2iIdK9TP2TspmMnS9/9Mpm7n9MqRZsM7gie1y
	 3eC5iaQiA+dJFce3DULYRMgwWFxUzczuFD9O5jD2sUflhr3CIfFdXZ9nJnA4iEISZF
	 QW9ohg1ayRBBz3X6aCnjhuElpCF7vcS+lLQFJWM5BFLLYgy45eaArm8fDg8UJ5g9zV
	 UgkvQilcgMujw==
Date: Wed, 26 Jun 2024 23:11:54 +0100
From: Conor Dooley <conor@kernel.org>
To: Atish Kumar Patra <atishp@rivosinc.com>
Cc: Samuel Holland <samuel.holland@sifive.com>,
	linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
	Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Subject: Re: [PATCH v3 2/3] drivers/perf: riscv: Reset the counter to
 hpmevent mapping while starting cpus
Message-ID: <20240626-pedigree-retype-dd7f1e54ac2b@spud>
References: <20240626-misc_perf_fixes-v3-0-de3f8ed88dab@rivosinc.com>
 <20240626-misc_perf_fixes-v3-2-de3f8ed88dab@rivosinc.com>
 <96ff4dd2-db66-4653-80e9-97d4f1381581@sifive.com>
 <CAHBxVyHx9hTRPosizV_yn6DUZi-MTNTrAbJdkV3049D-qsDHcw@mail.gmail.com>
 <20240626-eraser-unselect-99e68a1f5a3e@spud>
 <20240626-spyglass-clutter-4ff4d7b26dd4@spud>
 <CAHBxVyEg2uKKdikXib77JDmCKs8qDGJHvj3stsFgCgO0U9omRg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHBxVyEg2uKKdikXib77JDmCKs8qDGJHvj3stsFgCgO0U9omRg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_151203_124248_C6EC0089 
X-CRM114-Status: GOOD (  13.53  )
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
Content-Type: multipart/mixed; boundary="===============1649035297530537352=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1649035297530537352==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Qn8GLMXXMKWShJFF"
Content-Disposition: inline


--Qn8GLMXXMKWShJFF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 26, 2024 at 01:40:52PM -0700, Atish Kumar Patra wrote:

> > > > @Palmer Dabbelt : Can you add that while picking up
> > > > the patch or should I respin a v4 ?
> > >
> > > b4 should pick the signoff up though. "perf: RISC-V: Check standard
> > > event availability" seems to be missing your signoff though...
> >
> > Huh, this doesn't really make sense. I meant:
> >         b4 should pick the signoff up, though "perf: RISC-V: Check stan=
dard
> >         event availability" seems to be missing your signoff...
>=20
> Strange. I modified and sent the patch using b4 as well. It's missing
> my sign off too.

`b4 shazam` should pick up trailers provided on the list, signoffs
included. `b4 shazam -s` will add yours. TBH, I am not sure why that is
not the default behaviour.

Cheers,
Conor.

--Qn8GLMXXMKWShJFF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnySKgAKCRB4tDGHoIJi
0ggpAQDI5svZclXsiiw/tBho5jBjNBUOz2wHe+OAFRr/Tp5zRgEA0WA8ZFlqoud+
fKQ/MbZq8OBTmsy2Kb9vdKxThGGg8QA=
=D/2H
-----END PGP SIGNATURE-----

--Qn8GLMXXMKWShJFF--


--===============1649035297530537352==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1649035297530537352==--

