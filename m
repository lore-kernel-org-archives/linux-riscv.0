Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E606C4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Nov 2023 08:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=II9bM9h73QNp18PO+dvt7pKom7Js3YR9vrAmVHdN6ko=; b=y/Vs5h+bGIyjCZTvzTPd+Y7ylC
	ACu/AlDLjj98OLRiI13YlPBTxFhtG+bA36QutZv5vh4o/rWw1um7rflMVgDo5eJJboel9QWjy/x83
	7ygEzkCY5TdaUHcJIkiivr8Ge03u7+iLXk7wIAb8s1LHlF+My1PYNamLUOSfbPeJPMWDoSGoPW5Tw
	v2Ttyr13rHIFL5deIotKBFGNiMlUDrqmZe1k4q0ZHx2L3m3eCdVTZoIHFqqcJVxYKauVjKv1nQ2FZ
	wgAXseigtxaftjlC8vNnODbsI5LqtapcRncniOgv01EaeAR7382JjD9xGdCyzCq19AFGcUn2s7vI+
	rlb7ZwZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qypdi-00Azhi-05;
	Fri, 03 Nov 2023 08:34:50 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qypde-00Azh1-1f
	for linux-riscv@lists.infradead.org;
	Fri, 03 Nov 2023 08:34:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id B6EE2B81DDF;
	Fri,  3 Nov 2023 08:34:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB571C433C7;
	Fri,  3 Nov 2023 08:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699000484;
	bh=sE+MpiHqWgJ5iIw/npYzRDsl6/Gv+LYVgh0WxYn1jWU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nXpshMam9XLnIcy9bgwXkkE6rGoW0x477Hcqyz2l524SMDdjizinUd1BnNDHh+nPT
	 Zd37Mk7T1KdVVXG9Q0UrCCdAZ2QlWcSpjlRTewSsqLAaf045giyTjiIfZIkyXdWYF0
	 nafF8hPZlK95LobtO+FgH5631ypn0hiZET+/GKRBwPJJQMtefPzfh1MGnPUdLxHK4g
	 GwvVRKHx3i+2Lti2fcur6Jn6PcBDPwPFIkhL+CtRX5Hm2hNZFyC2fGT0qolgmuF5sS
	 JlYTtP63IjQpkImjxAITzg/fHhXZL1IeOGgWpp34KrkfK6pGZsnO+ULdT0soxL/rDl
	 W88rmsv0i9FJQ==
Date: Fri, 3 Nov 2023 08:34:38 +0000
From: Conor Dooley <conor@kernel.org>
To: Evan Green <evan@rivosinc.com>
Subject: Re: [PATCH] RISC-V: Probe misaligned access speed in parallel
Message-ID: <20231103-uproar-rumbling-0a7a5ecb385e@spud>
References: <20230915184904.1976183-1-evan@rivosinc.com>
 <CALs-Hsu_1x2FpjWXbmioSi6x30NXdNgrQ=t=EBknB0O06DA12A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALs-Hsu_1x2FpjWXbmioSi6x30NXdNgrQ=t=EBknB0O06DA12A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231103_013446_868438_BBACA905 
X-CRM114-Status: GOOD (  24.11  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Ley Foon Tan <leyfoon.tan@starfivetech.com>, Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, David Laight <David.Laight@aculab.com>, Palmer Dabbelt <palmer@dabbelt.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Greentime Hu <greentime.hu@sifive.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: multipart/mixed; boundary="===============9057414601931590556=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============9057414601931590556==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="G1VAzj1/yjoi+Jgm"
Content-Disposition: inline


--G1VAzj1/yjoi+Jgm
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 02, 2023 at 03:41:58PM -0700, Evan Green wrote:
> On Fri, Sep 15, 2023 at 11:49=E2=80=AFAM Evan Green <evan@rivosinc.com> w=
rote:
> >
> > Probing for misaligned access speed takes about 0.06 seconds. On a
> > system with 64 cores, doing this in smp_callin() means it's done
> > serially, extending boot time by 3.8 seconds. That's a lot of boot time.
> >
> > Instead of measuring each CPU serially, let's do the measurements on
> > all CPUs in parallel. If we disable preemption on all CPUs, the
> > jiffies stop ticking, so we can do this in stages of 1) everybody
> > except core 0, then 2) core 0.
> >
> > The measurement call in smp_callin() stays around, but is now
> > conditionalized to only run if a new CPU shows up after the round of
> > in-parallel measurements has run. The goal is to have the measurement
> > call not run during boot or suspend/resume, but only on a hotplug
> > addition.
> >
> > Signed-off-by: Evan Green <evan@rivosinc.com>
>=20
> Shoot, I saw the other thread [1] where it seems like my use of
> alloc_pages() in this context is improper? I had thought I was
> alright, as Documentation/core-api/memory-allocation.rst says:
>=20
>  > If the allocation is performed from an atomic context, e.g interrupt
>  > handler, use ``GFP_NOWAIT``.
>=20
> Any tips for reproducing that splat? I have CONFIG_DEBUG_ATOMIC_SLEEP
> on (it's in the defconfig), and lockdep, and I'm on Conor's
> linux-6.6.y-rt, but so far I'm not seeing it.

It was originally produced in hardware, but I can also see these issues
in QEMU's emulation of my hardware (although as you may have seen, I get
them both with and without this patch). My qemu incantation was
something like:
	$(qemu) -M microchip-icicle-kit \
		-m 3G -smp 5 \
		-kernel vmlinux.bin \
		-dtb mpfs-icicle.dtb \
		-initrd initramfs \
		-display none -serial null \
		-serial stdio \
		-D qemu.log -d unimp

Where the kernel was built from the .config in that branch in my repo.

Cheers,
Conor.

--G1VAzj1/yjoi+Jgm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZUSwngAKCRB4tDGHoIJi
0pnVAQDoGrbuX8WYBNusBkNvYdfa6NNmwBhgyGi8nakTAO0FNwD+I6uqKJlLCnrN
Gas947oBPmncixilSkkp8KNlJBLUlAA=
=BjY9
-----END PGP SIGNATURE-----

--G1VAzj1/yjoi+Jgm--


--===============9057414601931590556==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============9057414601931590556==--

