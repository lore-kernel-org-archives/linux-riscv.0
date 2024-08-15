Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FFE5C3DA7F
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Aug 2024 15:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dAWjD/m1JF1QRooFtyFn1vAw1THIDuSwi/Mllub05zI=; b=3ozo8MClyAYPgeTRTmFMmvQ0AL
	pltABiqdeWgSq4ykRqaGmY0GFucqzh2JmO29wQUA0ezsNswsfQAXNOCUspJ2kWOk6kLx1m6MTo7TA
	rTeQl/Jj+A+IpAY6b1QhcLTeTWypnfnQccGQ51Sw1PO60slrdxDA/UgFP1/p+ckqoC8QdOS7EwUT5
	DaX1ifBZVF+/gPPNjSG//JBb3gBegx8VL6T+ywaTcqIJQZb3EtkpODYWq5VWJAwBhHpGlr1qF4uQ+
	7vVy++fZ+6HJbnpikkWjnzSaOBmK+KiUuiLuJyZauciX/RzoTdYn2ZpKgze7UAidgEctuw9Rt5I6P
	leLVW9/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sec40-0000000AJsm-3zBe;
	Thu, 15 Aug 2024 15:06:56 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sec2r-0000000AJeU-329l;
	Thu, 15 Aug 2024 15:05:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D3535CE1CB1;
	Thu, 15 Aug 2024 15:05:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56C21C4AF0D;
	Thu, 15 Aug 2024 15:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723734342;
	bh=VaZmCxGBF8KztnlsWWYHsWkxQ+nObQmzwcHV6fkRBCE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AKZYerGHcjQDpXEtvnruAGu5zXDe7awbHeen5Mm3saiTtNbcwHPI2BNFcpGWaKLl7
	 YIKg6KnEFRVGaNPCZCbWvEPBvhVlfqikdVQyxH311a84xo7K2q0lWx4/oPE4spK+Gc
	 uVkrd2SL+XZHxyR1/oBYNkBNcNnPIsk4aho61+F4Aysl+0A3Wz95fLmEsodqnvYA90
	 Y0JvpH7+0yNt6fPPLf1ogR/SXjp7qymrN/8ccZueeoHvawyYsYLYsLW2g+4m0kriSI
	 6xvFXlUgNCrp4sQx0OnVpPiV7ujihcrQde8PFl5rQyVaq2FkjbGlnZNsTfDFw1A+GF
	 wKIh9mENd/rRg==
Date: Thu, 15 Aug 2024 16:05:32 +0100
From: Mark Brown <broonie@kernel.org>
To: Dave Martin <Dave.Martin@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Arnd Bergmann <arnd@arndb.de>, Oleg Nesterov <oleg@redhat.com>,
	Eric Biederman <ebiederm@xmission.com>,
	Shuah Khan <shuah@kernel.org>,
	"Rick P. Edgecombe" <rick.p.edgecombe@intel.com>,
	Deepak Gupta <debug@rivosinc.com>, Ard Biesheuvel <ardb@kernel.org>,
	Szabolcs Nagy <Szabolcs.Nagy@arm.com>, Kees Cook <kees@kernel.org>,
	"H.J. Lu" <hjl.tools@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Florian Weimer <fweimer@redhat.com>,
	Christian Brauner <brauner@kernel.org>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	Ross Burton <ross.burton@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v10 24/40] arm64/signal: Expose GCS state in signal frames
Message-ID: <efe1d936-011d-49e3-a0ff-8f6276e4d782@sirena.org.uk>
References: <20240801-arm64-gcs-v10-0-699e2bd2190b@kernel.org>
 <20240801-arm64-gcs-v10-24-699e2bd2190b@kernel.org>
 <ZrzIv3FWNgJizDc2@e133380.arm.com>
 <7433e3d2-996a-45a0-b917-666a340ad109@sirena.org.uk>
 <Zr4KMaBv4JXx8uBz@e133380.arm.com>
MIME-Version: 1.0
In-Reply-To: <Zr4KMaBv4JXx8uBz@e133380.arm.com>
X-Cookie: -- Owen Meredith
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240815_080546_136959_195D92B0 
X-CRM114-Status: GOOD (  36.72  )
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
Content-Type: multipart/mixed; boundary="===============4714014909632042980=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4714014909632042980==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SmjZxCFLN11graeJ"
Content-Disposition: inline


--SmjZxCFLN11graeJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 15, 2024 at 03:01:21PM +0100, Dave Martin wrote:

> My thought was that if libc knows about shadow stacks, it is probably
> going to be built to use them too and so would enable shadow stack
> during startup to protect its own code.

> (Technically those would be independent decisions, but it seems a good
> idea to use a hardening feature if you know about and it is present.)

> If so, shadow stacks might always get turned on before the main program
> gets a look-in.

> Or is that not the expectation?

The expectation (at least for arm64) is that the main program will only
have shadow stacks if everything says it can support them.  If the
dynamic linker turns them on during startup prior to parsing the main
executables this means that it should turn them off before actually
starting the executable, taking care to consider any locking of features.

> > > Is there any scenario where it is legitimate for the signal handler to
> > > change the shadow stack mode or to return with an altered GCSPR_EL0?

> > If userspace can rewrite the stack pointer on return (eg, to return to a
> > different context as part of userspace threading) then it will need to

> Do we know if code that actually does that?  IIUC, trying to do this is
> totally broken on most arches nowadays; making it work requires a
> reentrant C library and/or logic to defer signals around critical
> sections in userspace.

> "Real" threading makes this pretty pointless for the most part.

> Related question: does shadow stack work with ucontext-based coroutines?
> Per-context stacks need to be allocated by the program for that.

Yes, ucontext based coroutines are the sort of thing I meant when I was
talking about returning to a different context? =20

> > be able to also update GCSPR_EL0 to something consistent otherwise
> > attempting to return from the interrupted context isn't going to go
> > well.  Changing the mode is a bit more exotic, as it is in general.
> > It's as much to provide information to the signal handler as anything
> > else.

> I'm not sure that we should always put information in the signal frame
> that the signal handler can't obtain directly.

> I guess it's harmless to include this, though.

If we don't include it then if different ucontexts have different GCS
features enabled we run into trouble on context switch.

> > > Is the guarded stack considered necessary (or at least beneficial) for
> > > backtracing, or is the regular stack sufficient?

> > It's potentially beneficial, being less vulnerable to corruption and
> > simpler to parse if all you're interested in is return addresses.
> > Profiling in particular was mentioned, grabbing a linear block of memory
> > will hopefully be less overhead than chasing down the stack.  The
> > regular stack should generally be sufficient though.

> I guess we can't really argue that the shadow stack pointer is
> redundant here though.  The whole point of shadow stacks is to make
> things more robust...

> Just kicking the tyres on the question of whether we need it here, but
> I guess it's hard to make a good case for saying "no".

Indeed.  The general model here is that we don't break userspace that
relies on parses the normal stack (so the GCS is never *necessary*) but
clearly you want to have it.

--SmjZxCFLN11graeJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAma+GTsACgkQJNaLcl1U
h9Cb8wf/XCjGckqPDQqfMA0CTLZ811XV2dX1kqvju9JAXl44DN3khpUuEAkktoKg
KbrTL623QOjWbXYNgob5OLdQY42g++1RsuH62wKmX2kr080OWTmKFnRRROJzBftx
t9l70dd63SnOG7orRLDAACk/Api5Gr9PnCVZ/wc5DvzpD8Oiu8JxTTYgBlYkE/AH
7ypTKtVlPzjfwNV95yhvqPFkoOPSsnSaQPBgZSthZf6LL6iT2IymUV01zdLYCuCL
YyeXxml1r7AkEjF2dAncCRH1A9ZwpmjpMiF/GsjJBzX4hvu2cS+LUiYodWA2fO1Q
6+/7fZ2S/ywynEbWYd2kLO2E/zQWMg==
=78We
-----END PGP SIGNATURE-----

--SmjZxCFLN11graeJ--


--===============4714014909632042980==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4714014909632042980==--

