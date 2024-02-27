Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68158C5478C
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Feb 2024 18:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TTD73b/4zQr40R2pQz0hIcCxFPh7mHLY9XqXULGCGWE=; b=escWE12veXjOW1E0cDDRV7qmCb
	KQ/1GbOvorhkK3fNktyUpRMaenzWZVwpQLXsEtn41OI+/xnqyZCf0DTG4OTJcBlV8z1N+iYkR2QjB
	SHx4akL5ziNXe5HqQMUwcu3nBC5g2rBGQaM1Vv8j+WzyBmxd44N/67ych2im6V2IMJzLUX0hsyl/6
	DtX4tQjkKCMngVq1D1oPzxwJkaPBwK6KAt8YmuHCfaPkjdnfA5gtc8CYdnFgjHhOQkIebJRKpsd6X
	FIU+BNwCw65jzSyHJzrNl0zt7ubCmmFQIlfQDGwln9VB1oohyNSciHLp9021rfSDKUJnQXMHdjOhG
	EmWkpbeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rf2Vm-00000006Ujz-0Bia;
	Tue, 27 Feb 2024 18:49:06 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rf2Vi-00000006Uij-0o3A
	for linux-riscv@lists.infradead.org;
	Tue, 27 Feb 2024 18:49:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 487BACE1DED;
	Tue, 27 Feb 2024 18:49:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A742C433C7;
	Tue, 27 Feb 2024 18:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709059739;
	bh=3bZUA0mL+b5Ms2RdOItLD/BcXnPrmdEm8B0J9fdbpro=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tQfCeqYal5q1ALky8inZXZXX8AxgIO96wdUR0M2z3O0ev720Vtt8aoVETZ6CZS+h8
	 sxnDorXrg+c4E3Mzp2KVs8Deu6OHA0Xzzm2Vo//3oCNDovwj7NMXp5t5kDShnrb/uh
	 RomFQQ4oiW1kumVYVHVEKlgUqxkxnQ2f91bdhNbdPpS9epECSpRjZcjYvCmDKA5DOl
	 xLNQhaMDwFpx9Bd5SiQR2FRroM6jYcOQMVU6zUybdX20+qLYI0+DjfCx7ayFta6iZq
	 0CFXb/A59MtJRRLjXjq8lB08vtaSUN7khXLuneo1/efVjlzh9duveIFJtjhSxZmZ0T
	 IxbE33UdY6+cw==
Date: Tue, 27 Feb 2024 18:48:54 +0000
From: Conor Dooley <conor@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org,
	Eric Biggers <ebiggers@kernel.org>, Evan Green <evan@rivosinc.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	linux-riscv@lists.infradead.org, Charles Lohr <lohr85@gmail.com>
Subject: Re: [PATCH v4 2/2] riscv: Set unalignment speed at compile time
Message-ID: <20240227-citable-scanning-1fd48c96b758@spud>
References: <20240216-disable_misaligned_probe_config-v4-0-dc01e581c0ac@rivosinc.com>
 <20240216-disable_misaligned_probe_config-v4-2-dc01e581c0ac@rivosinc.com>
 <20240227-condone-impeach-9469dffc6b47@wendy>
 <Zd4nMa+x28omuhiF@ghost>
MIME-Version: 1.0
In-Reply-To: <Zd4nMa+x28omuhiF@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_104902_614752_6502E9E7 
X-CRM114-Status: GOOD (  39.68  )
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
Content-Type: multipart/mixed; boundary="===============8066638393129650605=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8066638393129650605==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="A7lTG7rB6ssaDl7T"
Content-Disposition: inline


--A7lTG7rB6ssaDl7T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 27, 2024 at 10:17:21AM -0800, Charlie Jenkins wrote:
> On Tue, Feb 27, 2024 at 11:39:25AM +0000, Conor Dooley wrote:
> > On Fri, Feb 16, 2024 at 12:33:19PM -0800, Charlie Jenkins wrote:

> > > +config RISCV_EMULATED_UNALIGNED_ACCESS
> > > +	bool "Assume the CPU expects emulated unaligned memory accesses"
> > > +	depends on NONPORTABLE
> >=20
> > This is portable too, right?
>=20
> I guess so? I think I would prefer to have the probing being the only
> portable option.

I dunno, I think there could be value to someone in always emulating
this in the kernel and I don't think that should relegate them to the
naughty step, given it can work everywhere.


> > > +config RISCV_SLOW_UNALIGNED_ACCESS
> > > +	bool "Assume the CPU supports slow unaligned memory accesses"
> > > +	depends on NONPORTABLE
> > > +	help
> > > +	  Assume that the CPU supports slow unaligned memory accesses. When
> > > +	  enabled, this option improves the performance of the kernel on su=
ch
> > > +	  CPUs.
> >=20
> > Does it? Are you sure that generating unaligned accesses on systems
> > where they are slow is a performance increase?
> > That said, I don't really see this option actually doing anything other
> > than setting the value for hwprobe, so I don't actually know what the
> > effect of this option actually is on the kernel's performance.
> >=20
> > Generally I would like to suggest a change from "CPU" to "system" here,
> > since the slow cases that exist are mostly because the unaligned access
> > is actually emulated in firmware.
>=20
> It would be ideal if "emulated" was used for any case of emulated
> accesses (firmware or in the kernel).  Doing emulated accesses will be
> orders of magnitude slower than a processor that "slowly" handles the
> accesses.
>=20
> So even if the processor performs a "slow" access, it could still be
> beneficial for the kernel to do the misaligned access rather than manual
> do the alignment.

Right. But, at least from a probing perspective, SLOW is what gets
selected when firmware emulates the unaligned access so to userspace
seeing slow means that the performance could be horrifically bad:

|     rzfive:
|         cpu0: Ratio of byte access time to unaligned word access is
| 1.05, unaligned accesses are fast
|=20
|     icicle:
|=20
|         cpu1: Ratio of byte access time to unaligned word access is
| 0.00, unaligned accesses are slow
|         cpu2: Ratio of byte access time to unaligned word access is
| 0.00, unaligned accesses are slow
|         cpu3: Ratio of byte access time to unaligned word access is
| 0.00, unaligned accesses are slow
|=20
|         cpu0: Ratio of byte access time to unaligned word access is
| 0.00, unaligned accesses are slow
|=20
|     k210:
|=20
|         cpu1: Ratio of byte access time to unaligned word access is
| 0.02, unaligned accesses are slow
|         cpu0: Ratio of byte access time to unaligned word access is
| 0.02, unaligned accesses are slow
|=20
|     starlight:
|=20
|         cpu1: Ratio of byte access time to unaligned word access is
| 0.01, unaligned accesses are slow
|         cpu0: Ratio of byte access time to unaligned word access is
| 0.02, unaligned accesses are slow
|=20
|     vexriscv/orangecrab:
|=20
|         cpu0: Ratio of byte access time to unaligned word access is
| 0.00, unaligned accesses are slow
 https://lore.kernel.org/all/CAMuHMdVtXGjP8VFMiv-7OMFz1XvfU1cz=3DFw4jL3fcp4=
wO1etzQ@mail.gmail.com/

> Currently there is no place that takes into account this "slow" option
> but I wanted to leave it open for future optimizations.

I don't think you can really do much optimisation if you detect that it
is slow, and since this option is analogous to detecting slow I dunno if
you can do anything here either? This option really just seems to me to
mean "don't do any optimisations for unaligned being fast but also don't
emulate it in the kernel".

> > > However, the kernel will run much more slowly, or will not be
> > > +	  able to run at all, on CPUs that do not support unaligned memory
> > > +	  accesses.
> > > +
> > >  config RISCV_EFFICIENT_UNALIGNED_ACCESS
> > >  	bool "Assume the CPU supports fast unaligned memory accesses"
> > >  	depends on NONPORTABLE
> > >  	select DCACHE_WORD_ACCESS if MMU
> > >  	select HAVE_EFFICIENT_UNALIGNED_ACCESS
> > >  	help
> > > -	  Say Y here if you want the kernel to assume that the CPU supports
> > > -	  efficient unaligned memory accesses.  When enabled, this option
> > > -	  improves the performance of the kernel on such CPUs.  However, the
> > > -	  kernel will run much more slowly, or will not be able to run at a=
ll,
> > > -	  on CPUs that do not support efficient unaligned memory accesses.
> > > +	  Assume that the CPU supports fast unaligned memory accesses. When
> > > +	  enabled, this option improves the performance of the kernel on su=
ch
> > > +	  CPUs.  However, the kernel will run much more slowly, or will not=
 be
> > > +	  able to run at all, on CPUs that do not support efficient unalign=
ed
> > > +	  memory accesses.
> > > +
> > > +config RISCV_UNSUPPORTED_UNALIGNED_ACCESS
> >=20
> > This option needs to be removed. The uabi states that unaligned access
> > is supported in userspace, if the cpu or firmware does not implement
> > unaligned access then the kernel must emulate it.
>=20
> Should it removed from hwprobe as well then?

No, I actually suggested that it be documented etc. Originally
"UNSUPPORTED" was "UNKNOWN" and nothing more than the default value but
I suggested that it be documented since that would allow a system that
did not have the same uabi problem to use all the same defines.
Technically it is possible for unaligned access to be unsupported, if
you have a kernel that does not have the emulator but does have the
hwprobe stuff supported. I think there was about a 6 month period where
this was the case, so combine that with firmware that does not do the
emulation and unaligned accesses are unsupported.

Cheers,
Conor.

--A7lTG7rB6ssaDl7T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZd4ulgAKCRB4tDGHoIJi
0kuJAP9MYXtRJnS8kVEPM3J3GBXPiW1BrtrqVqpMeqaykH3O9AEAp8BCDPdp8oIV
kh1+j1M36s5fTlWCuPBx975g86gHVwk=
=Gp5I
-----END PGP SIGNATURE-----

--A7lTG7rB6ssaDl7T--


--===============8066638393129650605==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8066638393129650605==--

