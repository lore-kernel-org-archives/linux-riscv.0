Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF336CD13CF
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 22:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7zmFZuC4kx7RE1cap5uKholqts6vjhIGtcXXHqJQUvg=; b=FL9TbFW4wO3ecZuGS5rfnwOEnA
	2tg0wOQ2PQx31rjigJh4JeGePxjvWOnAz9Nwl7rtiRSFGZw4HGCO1APWpXylHpwKeNko3fI0Rg6Os
	ltchW7RKXE9XndrfN7jhwBi50XZS0my2Bme3tKgF4r/Htc7xwfZ0tETpMciQ2YB7kv0S7jmlhBMGu
	ZBzZA0bIDbGg6NE3o/u2dW1ZoWEw6st9lfNuMvITUvubLHF/2W3AEit7LeLvK3k9SVj5iYXVG//rH
	XrS/39eGX7oNnIzEd31N1gXFx9w/DQBoVW6F2+131246u5VgGkhy1Xp/N8Sn4qfnyP/Lk3RqhOf/W
	ea1ayXvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qj5dI-004MQT-2b;
	Wed, 20 Sep 2023 22:25:20 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qj5dF-004MOX-31
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 22:25:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 8542BCE1CEC;
	Wed, 20 Sep 2023 22:25:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B94DEC433CB;
	Wed, 20 Sep 2023 22:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695248707;
	bh=1hAloOg1XEAD5sA3NdMjJDFHNgWUZuNJi8NkzQ+xdjM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X/2KPRd2tXwhiYuAlPNMWxsUNRs/wpf1+Sac1UGySMFHFfVKeYXKyYqACvf59kvO+
	 tFIhvgM4ukD7ZJFFF/zxvBQyjN/KG1w0oeJ4TnWUEQIvBwaBzbtd5uXBh7gW1HbCcN
	 SMtsSNNAHvlrCvG5ZuXNTwx82nwSIZkNVIlJWicqkXOAko1hOFR1U1t24679AB0Tml
	 Fpj0jipmupESYNFGQJlwvke3ufTWUxr3NNttgDgL0rkKud5+gJbWq61w0Dua7SOVOP
	 l+wjfDFk69iWDYwAp/STa/+UgMmDy2cpABeKiapA9cmU/N+e415mg82CvPXyC5m9nQ
	 gg3iuZ74L+AFQ==
Date: Wed, 20 Sep 2023 23:25:02 +0100
From: Conor Dooley <conor@kernel.org>
To: Evan Green <evan@rivosinc.com>
Cc: Atish Patra <atishp@atishpatra.org>,
	Anup Patel <apatel@ventanamicro.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner <heiko@sntech.de>,
	Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	David Laight <David.Laight@aculab.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	linux-riscv@lists.infradead.org,
	Andrew Jones <ajones@ventanamicro.com>
Subject: Re: [PATCH v2] RISC-V: Probe misaligned access speed in parallel
Message-ID: <20230920-0e2bce9821557cce8d022157@fedora>
References: <20230920193801.3035093-1-evan@rivosinc.com>
 <20230920-98a392b40f88c69e852e2c88@fedora>
 <CAOnJCUK7KTO0n_8wDYDxh2ULtEvMWF-re2dEX6nng_tX1AGgPw@mail.gmail.com>
 <CALs-HsuurXBZ2p=jYKvPq6ZMScugm5rBchttD6Wv9Mtupfx3NQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALs-HsuurXBZ2p=jYKvPq6ZMScugm5rBchttD6Wv9Mtupfx3NQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_152518_327534_EFE8685B 
X-CRM114-Status: GOOD (  35.87  )
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
Content-Type: multipart/mixed; boundary="===============7893731233816830542=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7893731233816830542==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nhi9TlVMSb87TbQQ"
Content-Disposition: inline


--nhi9TlVMSb87TbQQ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 20, 2023 at 03:06:45PM -0700, Evan Green wrote:
> On Wed, Sep 20, 2023 at 2:27=E2=80=AFPM Atish Patra <atishp@atishpatra.or=
g> wrote:
> >
> > On Wed, Sep 20, 2023 at 2:04=E2=80=AFPM Conor Dooley <conor@kernel.org>=
 wrote:
> > >
> > > Yo,
> > >
> > > On Wed, Sep 20, 2023 at 12:38:01PM -0700, Evan Green wrote:
> > > > Probing for misaligned access speed takes about 0.06 seconds. On a
> > > > system with 64 cores, doing this in smp_callin() means it's done
> > > > serially, extending boot time by 3.8 seconds. That's a lot of boot =
time.
> > > >
> > > > Instead of measuring each CPU serially, let's do the measurements on
> > > > all CPUs in parallel. If we disable preemption on all CPUs, the
> > > > jiffies stop ticking, so we can do this in stages of 1) everybody
> > > > except core 0, then 2) core 0.
> > > >
> > > > The measurement call in smp_callin() stays around, but is now
> > > > conditionalized to only run if a new CPU shows up after the round of
> > > > in-parallel measurements has run. The goal is to have the measureme=
nt
> > > > call not run during boot or suspend/resume, but only on a hotplug
> > > > addition.
> > > >
> > > > Reported-by: Jisheng Zhang <jszhang@kernel.org>
> > > > Closes: https://lore.kernel.org/all/mhng-9359993d-6872-4134-83ce-c9=
7debe1cf9a@palmer-ri-x1c9/T/#mae9b8f40016f9df428829d33360144dc5026bcbf
> > > > Fixes: 584ea6564bca ("RISC-V: Probe for unaligned access speed")
> > > > Signed-off-by: Evan Green <evan@rivosinc.com>
> > > > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> > > > Tested-by: Andrew Jones <ajones@ventanamicro.com>
> > > >
> > > > ---
> > > >
> > > > Changes in v2:
> > > >  - Removed new global, used system_state =3D=3D SYSTEM_RUNNING inst=
ead
> > > >    (Jisheng)
> > > >  - Added tags
> > > >
> > > >  arch/riscv/include/asm/cpufeature.h |  2 +-
> > > >  arch/riscv/kernel/cpufeature.c      | 22 +++++++++++++++++-----
> > > >  arch/riscv/kernel/smpboot.c         | 11 ++++++++++-
> > > >  3 files changed, 28 insertions(+), 7 deletions(-)
> > > >
> > > > diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/inclu=
de/asm/cpufeature.h
> > > > index d0345bd659c9..b139796392d0 100644
> > > > --- a/arch/riscv/include/asm/cpufeature.h
> > > > +++ b/arch/riscv/include/asm/cpufeature.h
> > > > @@ -30,6 +30,6 @@ DECLARE_PER_CPU(long, misaligned_access_speed);
> > > >  /* Per-cpu ISA extensions. */
> > > >  extern struct riscv_isainfo hart_isa[NR_CPUS];
> > > >
> > > > -void check_unaligned_access(int cpu);
> > > > +int check_unaligned_access(void *unused);
> > > >
> > > >  #endif
> > > > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpu=
feature.c
> > > > index 1cfbba65d11a..40bb854fcb96 100644
> > > > --- a/arch/riscv/kernel/cpufeature.c
> > > > +++ b/arch/riscv/kernel/cpufeature.c
> > > > @@ -556,8 +556,9 @@ unsigned long riscv_get_elf_hwcap(void)
> > > >       return hwcap;
> > > >  }
> > > >
> > > > -void check_unaligned_access(int cpu)
> > > > +int check_unaligned_access(void *unused)
> > > >  {
> > > > +     int cpu =3D smp_processor_id();
> > > >       u64 start_cycles, end_cycles;
> > > >       u64 word_cycles;
> > > >       u64 byte_cycles;
> > > > @@ -571,7 +572,7 @@ void check_unaligned_access(int cpu)
> > > >       page =3D alloc_pages(GFP_NOWAIT, get_order(MISALIGNED_BUFFER_=
SIZE));
> > > >       if (!page) {
> > > >               pr_warn("Can't alloc pages to measure memcpy performa=
nce");
> > > > -             return;
> > > > +             return 0;
> > >
> > > Dumb question maybe, but I am limited setup wise at the moment due to
> > > a hardware failure which makes checking stuff hard, why the signature
> > > change? Requirement for on_each_cpu()?
> > >
> >
> > Requirement for smp_call_on_cpu.
>=20
> Right.
>=20
> >
> > > >       }
> > > >
> > > >       /* Make an unaligned destination buffer. */
> > > > @@ -643,15 +644,26 @@ void check_unaligned_access(int cpu)
> > > >
> > > >  out:
> > > >       __free_pages(page, get_order(MISALIGNED_BUFFER_SIZE));
> > > > +     return 0;
> > > > +}
> > > > +
> > > > +static void check_unaligned_access_nonboot_cpu(void *param)
> > > > +{
> > > > +     if (smp_processor_id() !=3D 0)
> > > > +             check_unaligned_access(param);
> > > >  }
> > > >
> > > > -static int check_unaligned_access_boot_cpu(void)
> > > > +static int check_unaligned_access_all_cpus(void)
> > > >  {
> > > > -     check_unaligned_access(0);
> > > > +     /* Check everybody except 0, who stays behind to tend jiffies=
=2E */
> > > > +     on_each_cpu(check_unaligned_access_nonboot_cpu, NULL, 1);
> > > > +
> > > > +     /* Check core 0. */
> > > > +     smp_call_on_cpu(0, check_unaligned_access, NULL, true);
> > > >       return 0;
> > >
> > > Why does this function return an int if it can only return 0?
> > >
>=20
> This is a requirement on the initcall_t function pointer type.

Ahh great, thanks for the explanations!


--nhi9TlVMSb87TbQQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQtxOQAKCRB4tDGHoIJi
0gsAAP4oRm6nyjbOWvN0vK15n5APUUbx9gPnLXg16eOjQf84QwD+NsZutNpl565C
z1nB04KBD87Lss8Ip4tkKtxkvOSdogA=
=dkma
-----END PGP SIGNATURE-----

--nhi9TlVMSb87TbQQ--


--===============7893731233816830542==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7893731233816830542==--

