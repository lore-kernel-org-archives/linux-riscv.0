Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 666F8C5475B
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Mar 2024 10:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xHQnCPbE8ba0cEKPptrjcMgyygXQlAga8DbMQGN5mtg=; b=jj9NxRW++Uy7I7DJSZljjHS9i0
	78ZobS6OZdBb0zTFg/yv1tVrTo8d2AJ2jANBpPajrJNeMqqMfb4WnSZfzGmN5IK3SYMZEvFbDUVid
	CoGnDq/ydbwExsF7pkT+Hqspm5nhqDorZuFhpokWSSuVskTcaxpTWNgCE6ySuqzW30pwWEE97f4eH
	nEcWNAvszewkY+qNuRngiF9Efdas5+nf9A1JpEsDrNuGNOuPsA22YksyXXkbyjUTA63EjrOT+L9t6
	iFiJzPqA5sjgVHQBw5Eo4Zo6ewV4UYrPCNS31pmIyuQG3BeiTHoFSM8ZOb3lMRSaX4+mAJ3gHvPSZ
	aT4I3+4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riXtX-00000008rHg-0U7h;
	Fri, 08 Mar 2024 10:56:07 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riXtT-00000008rFb-3T3D
	for linux-riscv@lists.infradead.org;
	Fri, 08 Mar 2024 10:56:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1709895363; x=1741431363;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vXkMUwP2iGNOK6Xz2bMKT4lqKsvSco6aYYOJrkgKviU=;
  b=Z09BIoJdUdn1M+zhQ6zAe7LH1UtCrlK3Yv99RSb4sF2ICzxr8JS4eZDA
   p6I4CODjOEB9KdEa/30GKbaZ9+httVXBAbTpkgFN3KYQW+DvZMCe70jFn
   LIjLnoDMtURNW32E+Nj8yJpjyAQrs1yKjuKhLBTaI682VGL/QjRLvvnuO
   ta4wKy+kTFDrK8ZMBqx1946DswGvdLoamQpaIdUd0Pz6ErYB/YtNkJj8L
   8sZrTZtRq0AYJ0uJLDMZxxlcXvACsA3CAIQPlUV3/UtEp8NyTgPiYetZ2
   3AW7GdzBVa4Foyw7WD3CNHK/aCO8ezKuqTBH9yEO49DQWSywOVOakeIUe
   w==;
X-CSE-ConnectionGUID: PZ5niwm1Rr+UCEdoA/m20g==
X-CSE-MsgGUID: mFoPl2fYRp+cuyl44O5MCA==
X-IronPort-AV: E=Sophos;i="6.07,109,1708412400"; 
   d="asc'?scan'208";a="184667445"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 08 Mar 2024 03:55:58 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Mar 2024 03:55:28 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Fri, 8 Mar 2024 03:55:26 -0700
Date: Fri, 8 Mar 2024 10:54:41 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Subject: Re: [PATCH v8 4/4] riscv: Set unaligned access speed at compile time
Message-ID: <20240308-docile-pretense-b44c3a84d8b2@wendy>
References: <20240307-disable_misaligned_probe_config-v8-0-55d696cb398b@rivosinc.com>
 <20240307-disable_misaligned_probe_config-v8-4-55d696cb398b@rivosinc.com>
 <CAJM55Z9SYA=QMg0Wg-e0Q8nOTP6qSKkc+kxHMGOmmmWrEcVf7w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJM55Z9SYA=QMg0Wg-e0Q8nOTP6qSKkc+kxHMGOmmmWrEcVf7w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240308_025604_152092_B7327C4F 
X-CRM114-Status: GOOD (  33.69  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Charlie Jenkins <charlie@rivosinc.com>, linux-kernel@vger.kernel.org, Eric Biggers <ebiggers@kernel.org>, Evan Green <evan@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>, linux-riscv@lists.infradead.org, Charles Lohr <lohr85@gmail.com>
Content-Type: multipart/mixed; boundary="===============7007463426693133514=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7007463426693133514==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nNYYXJCx7WAmCO2a"
Content-Disposition: inline

--nNYYXJCx7WAmCO2a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 08, 2024 at 01:52:24AM -0800, Emil Renner Berthing wrote:
> Charlie Jenkins wrote:

> >  config RISCV_MISALIGNED
> > -	bool "Support misaligned load/store traps for kernel and userspace"
> > +	bool
> >  	select SYSCTL_ARCH_UNALIGN_ALLOW
> > -	default y
> >  	help
> > -	  Say Y here if you want the kernel to embed support for misaligned
> > -	  load/store for both kernel and userspace. When disable, misaligned
> > -	  accesses will generate SIGBUS in userspace and panic in kernel.
> > +	  Embed support for misaligned load/store for both kernel and userspa=
ce.
> > +	  When disabled, misaligned accesses will generate SIGBUS in userspace
> > +	  and panic in the kernel.
>=20
> Hmm.. this is *may* generate SIGBUS in userspace and panic the kernel. Th=
e CPU
> could support unaligned access natively or there might be a handler in M-=
mode,
> right?

Correct. The last sentence could become "When disabled, and there is no
support in hardware or firmware, unsigned accesses will...". That said,
this option is no longer user visible, so we could really simplify the
hell out of this option to just mention that it controls building the
in-kernel emulator.

> > +choice
> > +	prompt "Unaligned Accesses Support"
> > +	default RISCV_PROBE_UNALIGNED_ACCESS
> > +	help
> > +	  This determines the level of support for unaligned accesses. This
> > +	  information is used by the kernel to perform optimizations. It is a=
lso
> > +	  exposed to user space via the hwprobe syscall. The hardware will be
> > +	  probed at boot by default.
> > +
> > +config RISCV_PROBE_UNALIGNED_ACCESS
> > +	bool "Probe for hardware unaligned access support"
> > +	select RISCV_MISALIGNED
> > +	help
> > +	  During boot, the kernel will run a series of tests to determine the
> > +	  speed of unaligned accesses. This probing will dynamically determine
> > +	  the speed of unaligned accesses on the underlying system. If unalig=
ned
> > +	  memory accesses trap into the kernel as they are not supported by t=
he
> > +	  system, the kernel will emulate the unaligned accesses to preserve =
the
> > +	  UABI.
> > +
> > +config RISCV_EMULATED_UNALIGNED_ACCESS
> > +	bool "Emulate unaligned access where system support is missing"
> > +	select RISCV_MISALIGNED
> > +	help
> > +	  If unaligned memory accesses trap into the kernel as they are not
> > +	  supported by the system, the kernel will emulate the unaligned
> > +	  accesses to preserve the UABI. When the underlying system does supp=
ort
> > +	  unaligned accesses, the unaligned accesses are assumed to be slow.
>=20
> It's still not quite clear to me when you'd want to choose this over prob=
ing
> above. Assuming the probe measures correctly this can only result in a ke=
rnel
> that behaves the same or slower than with the option above, right?

Aye, mostly the same - some people don't want the boot-time overhead
of actually running the profiling code, so this option is for them.
Maybe that's not such a big deal anymore with the improvements to do it
in parallel, but given how bad performance on some of the systems is
when firmware does the emulation, it is definitely still noticeable.
I know we definitely have customers that care about their boot time very
strongly, so I can imagine they'd be turning this off.

> > +
> > +config RISCV_SLOW_UNALIGNED_ACCESS
> > +	bool "Assume the system supports slow unaligned memory accesses"
> > +	depends on NONPORTABLE
> > +	help
> > +	  Assume that the system supports slow unaligned memory accesses. The
> > +	  kernel and userspace programs may not be able to run at all on syst=
ems
> > +	  that do not support unaligned memory accesses.
>=20
> Again you're just explicitly saying no to the optimizations the kernel mi=
ght do
> if it detects fast unaligned access, only here you'll also crash if they'=
re not
> handled by the CPU or M-mode. Why would you want that?
>=20
> I'm probably missing something, but the only reason I can think of is if =
you
> want build a really small kernel and save the few bytes for the handler a=
nd
> probing code.

Aye, just to allow you to disable the in-kernel emulator. That's
currently a choice that is presented to people, so this option preserves
that. IMO this is by far the least useful option and is locked behind
NONPORTABLE anyway. Maybe we could delete it, and if someone really wants
it, it would not be all that much of a hassle to add back in the future?

--nNYYXJCx7WAmCO2a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZerucQAKCRB4tDGHoIJi
0mYvAQDA4Z//e444zAvLcCQ11CntZbnOPnEpaTmVf2TcOSn8FQD/bWM68sqlUJ8F
8ndc7uMmJh0Lk1xAl9DJK/ONWQOWiwU=
=4z8b
-----END PGP SIGNATURE-----

--nNYYXJCx7WAmCO2a--


--===============7007463426693133514==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7007463426693133514==--

