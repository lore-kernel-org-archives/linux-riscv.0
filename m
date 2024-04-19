Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13F45C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Apr 2024 15:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v9I6cFyL13konz2WCDYUlTZKKFcWlJ1uezTeJt3/MOM=; b=vyIkps8pwnp76jpbbvWlEap21o
	IpvEbMyLhJuLDaQr8TDsacmSdmIxYF+9g7GYFv6lWiRERHd/VbK2wcP60T9bQp3DPNQx2BHDamxQG
	+G5o+DUtGdsVtj0W2JCnW8EP2E5yaeNTUsQKfXeqcG6YJXMQpa6oTpfOrfk4aQq4U9h00ax0hKAsR
	/roQeSrtbMZSNGhFWVioPVZBMwQ8BvbUxDoQySBMm1TpcQ7ocuyYsYbLdb2FgPkOYc/xMuESUtwbY
	9fZx2wUjF5NDOYvn4EwepJAVktP054ccor775Zgjzsx3p/ZdgKVOfxRpdGaWDmjrMvtNmLT0js3DB
	KsgguOYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxpzV-000000067Qj-1j0a;
	Fri, 19 Apr 2024 15:17:29 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxpzR-000000067OV-3PjR
	for linux-riscv@lists.infradead.org;
	Fri, 19 Apr 2024 15:17:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3E1CBCE1AF9;
	Fri, 19 Apr 2024 15:17:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62C9AC072AA;
	Fri, 19 Apr 2024 15:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713539840;
	bh=SnnWaQWmaH4Y1VcI2/IotnKQLBlBuYV8WwApJhdtqlg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gnw9arBDC1Ax9q3qDwIFKZPM7ohNDDCmNKcEpQhpKM9noHzBL7xpGSlnA9IvzjkCu
	 b1GhvfQUEzuCO3tg/BHf4/nTJJHa1fNuUlwQHYNKbHwXqpN6YRztnuKt/A8gGItRGt
	 WP+kABU8cjBW3PujW3pfRqt66K4ML2tSW4bnXIkhnBQbsl1AI5by2qnTXa85cPYq+G
	 iKCHgYZBtqr+UjEJSfOoX0qxAkIwDC1klRDewFBoU2PVngUIIxJC/rTp5A88rz9KXA
	 VrWmuCDeqhuwtEl+hmbiaqy/4gHmEnUJp7cC/gJilF1cp/RWKSDUlsz/SOPKiI7Vea
	 RqJwdHIIaLuLg==
Date: Fri, 19 Apr 2024 16:17:10 +0100
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Pu Lehui <pulehui@huaweicloud.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] RISC-V: clarify what some RISCV_ISA* config options do
Message-ID: <20240419-recount-blip-29e45e4d4cec@spud>
References: <20240418-stable-railway-7cce07e1e440@spud>
 <20240419-ea2b867f6bde90e711464c95@orel>
 <20240419-excretory-dwarf-ba817cc725ea@spud>
 <20240419-b5dbe7b133a749afdc0af416@orel>
MIME-Version: 1.0
In-Reply-To: <20240419-b5dbe7b133a749afdc0af416@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_081726_247069_14DE0C57 
X-CRM114-Status: GOOD (  42.74  )
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
Content-Type: multipart/mixed; boundary="===============3990025410235372606=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3990025410235372606==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FX/POwus9dap633f"
Content-Disposition: inline


--FX/POwus9dap633f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 19, 2024 at 04:05:34PM +0200, Andrew Jones wrote:
> On Fri, Apr 19, 2024 at 12:06:59PM +0100, Conor Dooley wrote:
> > On Fri, Apr 19, 2024 at 01:01:52PM +0200, Andrew Jones wrote:
> > > > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > > > index 6d64888134ba..c3a7793b0a7c 100644
> > > > --- a/arch/riscv/Kconfig
> > > > +++ b/arch/riscv/Kconfig
> > > > @@ -503,8 +503,8 @@ config RISCV_ISA_SVNAPOT
> > > >  	depends on RISCV_ALTERNATIVE
> > > >  	default y
> > > >  	help
> > > > -	  Allow kernel to detect the Svnapot ISA-extension dynamically at=
 boot
> > > > -	  time and enable its usage.
> > > > +	  Add support for the Svnapot ISA-extension when it is detected by
> > > > +	  the kernel at boot.
> > >=20
> > > I'm not sure we need the 'by the kernel', since I guess that's implie=
d by
> > > being in a Kconfig help text, but either way is fine by me.
> >=20
> > I think we do, given some of the options are required for userspace to
> > use it and others are not. Distinguishing between them doesn't cos us
> > more than a few characters so I think it is worthwhile.
>=20
> I agree we should ensure 'support in the kernel' type of text is present,
> but here we're saying 'detected by the kernel' which I was thinking was
> implied since this is kernel code. Maybe we should just add the 'the
> kernel' text to where the support is rather than where the detection is?

Sure, that makes sense to me. We could go for "Say y here to add support
for the Foobar ISA extension for foobarisation in the kernel when it is
detected at boot" and in the cases where userspace depends on the option
too we could additionally say "When this option is disabled, neither the
kernel nor userspace may use Foobar". So Svnapot could become

	  Say y here to add support for the Svnapot (Naturally Aligned Power of
	  Two Pages) ISA extension in the kernel when it is detected at boot.

	  The Svnapot extension is used to mark contiguous PTEs as a range
	  of contiguous virtual-to-physical translations for a naturally
	  aligned power-of-2 (NAPOT) granularity larger than the base 4KB page
	  size. When HUGETLBFS is also selected this option unconditionally
	  allocates some memory for each NAPOT page size supported by the kernel.
	  When optimizing for low memory consumption and for platforms without
	  the Svnapot extension, it may be better to say N here.


And vector would be

	  Say y here to add support for the Vector extension when it is
	  detected at boot. When this option is disabled, neither the
	  kernel nor userspace may use vector.

	  If you don't know what to do here, say Y.

The other thing is the "Say y here" stuff. I find it to be a little
weird to be honest - these are all default enable I don't think "Say y"
makes sense, but writing inverted descriptions feels wrong. Maybe the
solution is just s/Say y here to a/A/, which many of these extensions
already do?

> I assumed it was left off of the 'Add support' because Svnapot is for
> S-mode.

So part of my rationale for being over-eager in re-wording is that I
know people just copy-paste these config options and it's easy to miss.

>=20
> >=20
> >=20
> > > > @@ -686,7 +687,8 @@ config FPU
> > > >  	default y
> > > >  	help
> > > >  	  Say N here if you want to disable all floating-point related pr=
ocedure
> > > > -	  in the kernel.
> > > > +	  in the kernel. Without this option enabled, neither the kernel =
nor
> > > > +	  userspace may use floating-point procedures.
> > > > =20
> > > >  	  If you don't know what to do here, say Y.
> > > >
> > >=20
> > > Zicboz could also use some clarification, right? Or is the fact that
> > > RISCV_ISA_ZICBOZ enables the use in both the kernel and userspace the
> > > reason "Enable the use of the Zicboz extension (cbo.zero instruction)
> > > when available." looks sufficient? Maybe Zicboz should follow the
> > > "Say N here if..." pattern of V and FPU?
> >=20
> > Yeah, I think I just overlooked Zicboz. If the kernel option is needed
> > for userspace to use it then yeah, it should follow the same wording as
> > V/FPU.
>=20
> Actually, never mind. I was thinking we only set the envcfg when this
> config was selected, but that's not true. We'll set it whenever the
> extension is present with or without this config. So I guess it can
> follow Zicbom's pattern.

I'm regretting trying to change these options sorta minimially -
Zicbom's
	   Add support for the Zicbom extension (Cache Block Management
	   Operations) and enable its use in the kernel when it is detected
	   at boot.
is better worded than the Svnapot one purely cos of what it looked like
before the patch. I think for v2 I'll re-write them all to look pretty
similar in terms of their opening paragraph.

--FX/POwus9dap633f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZiKK9gAKCRB4tDGHoIJi
0pKdAQCtBkg+TOzWadLEO2l5cjF4wenvVWIAKOTb3pKMsegkGAD9GPIjBrjSwOG8
cmbH1NA9NhtkHkirOf+tGRwod+W+yw0=
=Izji
-----END PGP SIGNATURE-----

--FX/POwus9dap633f--


--===============3990025410235372606==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3990025410235372606==--

