Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2918EC54E41
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Feb 2024 14:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pMUqME6wt1XcMj6a8e1htAKyzXbXO7zd97iQMeUrGXA=; b=sfnlL5GJj81HevmyNPIT3fccqi
	ez+ZgQvWjpu0bGcZ9jhwNT1UYTAkp1Z9qgzKJNLMsSHD/ktR5wk64Wqw6HSNQlpc4sUsbBVehJPwB
	MjGb39UMOQNU+Z61Y2jfcnJTuax6kwjgcBiE6L4L/fDxgNCSX0+gHyLCuX9hYO++uW7vgWEG9965T
	Z8DatT7DMw7rO/O+jE7BNsm8lmcMWuoM+3th9I9dYdcFGm1y8IKtHn4eu4kB7VbzQDLEJBX6fU18j
	YTl+HidLvnpUCIqqWa+UbrWbU3NiiPqSX8Vjc/nSGDLowQLaf4ndF4WWzEXw7qJXv48pQXFT1QAgD
	hJf1h44w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfhhO-0000000DvMb-3D3w;
	Thu, 29 Feb 2024 14:47:50 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfhhM-0000000DvM9-0InZ
	for linux-riscv@lists.infradead.org;
	Thu, 29 Feb 2024 14:47:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7F1D3CE1A4E;
	Thu, 29 Feb 2024 14:47:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BC8AC433F1;
	Thu, 29 Feb 2024 14:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709218064;
	bh=jh4m+J4zq3Gu+gnq/+2As4uXbPdMVPKk+9KMHCLN9zQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j6fF6HksNrTtgooDxky8LzQyR6jZlbe/EdbD3aH6D6I7XV4bb9Sv9zPhTPjka6vof
	 CiSLDXBq8dHl/RLR5o6+My7r9cPIOSt7GcwEUwHRCgWgjLzueBEuUc3dd18Q5Xbtap
	 xGNPlkm3HUApv9sz/yFFZ43TU/yVrivoLd+vqZnFdEY9twKJg6iMeJyqMvkJgy/6Ag
	 T9yK+Q2XHTE+zaC8RL7jPf1qREopuyGsQa9am6UesgWWx7oi+fyUFo1NVgAAkBm5j2
	 jHO/CoVTJ/ZhAi1jxEymKIW94KRytmGa3p4POWy77HnxQg7SEwImA+VSW6ICsUXYIl
	 DJ0EDqQK5rGCQ==
Date: Thu, 29 Feb 2024 14:47:39 +0000
From: Conor Dooley <conor@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Subject: Re: [PATCH v5 2/2] riscv: Set unaligned access speed at compile time
Message-ID: <20240229-ship-frail-52cd06745fc2@spud>
References: <20240227-disable_misaligned_probe_config-v5-0-b6853846e27a@rivosinc.com>
 <20240227-disable_misaligned_probe_config-v5-2-b6853846e27a@rivosinc.com>
 <20240228-denote-subscribe-9832cddbd307@spud>
MIME-Version: 1.0
In-Reply-To: <20240228-denote-subscribe-9832cddbd307@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_064748_589296_19EEC2B4 
X-CRM114-Status: GOOD (  21.66  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, Eric Biggers <ebiggers@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>, linux-riscv@lists.infradead.org, Charles Lohr <lohr85@gmail.com>
Content-Type: multipart/mixed; boundary="===============5712852449383194717=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5712852449383194717==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="g9ScbAqWRYzLUy4l"
Content-Disposition: inline


--g9ScbAqWRYzLUy4l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Clement,

On Wed, Feb 28, 2024 at 10:43:20AM +0000, Conor Dooley wrote:
> > @@ -413,7 +411,9 @@ int handle_misaligned_load(struct pt_regs *regs)
> > =20
> >  	perf_sw_event(PERF_COUNT_SW_ALIGNMENT_FAULTS, 1, regs, addr);
> > =20
> > +#ifdef CONFIG_RISCV_PROBE_UNALIGNED_ACCESS
>=20
> if (IS_ENABLED()), no?
> But perhaps more interestingly - why is this being set here at all?
> My understanding of the emulated stuff was that if the in-kernel
> emulation was enabled, it would be used unless the CPU itself supported
> fast accesses.

> I would expect this to be advertised to userspace once
> the system has booted, not set the first time that a cpu emulates an
> access,
> I feel like I need to take a look at how this has been implemented, I
> never really looked too closely at it and how it is enabled does not
> match my expectations.

I did look at this more closely and I understand why this is being done.
In the vast majority of situations I think it is going to work perfectly
fine, since that first access is going to be during the boot time
probing.
=2E
> >  	*this_cpu_ptr(&misaligned_access_speed) =3D RISCV_HWPROBE_MISALIGNED_=
EMULATED;
> > +#endif
> > =20
> >  	if (!unaligned_enabled)
> >  		return -1;

This is in the diff, so I am commenting here. Firstly, why does this
return -1 and not a regular negative errno?

Secondly, this looks pretty suspect to me - if the sysctl is used to
disable the emulation things like hwprobe will still report that access
is emulated if during boot it was enabled.
I think that if this condition is hit, we actually need to change the
per-cpu variable to set the alignment to unsupported, given the
emulation will (at present & if my understanding is correct) only be
enabled when there's not underlying support for unaligned accesses.

Thoughts?

Cheers,
Conor.

--g9ScbAqWRYzLUy4l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZeCY9QAKCRB4tDGHoIJi
0iavAQCKIPyb10Y8b3+7ZYXeg6e+2o/56nXBEM1MzBoN3u1bqgEAgblW8u6KNYrj
CdDilNguaeoiA2W9aHSsGlJRULWc7Qg=
=V4Ha
-----END PGP SIGNATURE-----

--g9ScbAqWRYzLUy4l--


--===============5712852449383194717==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5712852449383194717==--

