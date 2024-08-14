Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36434C3DA4A
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Aug 2024 16:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SB7rq0EE+G/UfhnXJkgugwrUB/B2FI/3tPxO4I4FThc=; b=swc9ICdSeIr0bz9l6ODHf6hhLO
	iRKK/8nsClS9ONj61sYsFYDTOT8U3I4/pc0t7BRnCaAgzGwYq8qhIars30KNOOl0hrgQY3Qofa/qv
	JnJwdY9WAdStLVn5G9UJ1UU0I2Vn/zMc5gVRBu47Kl7VgK52O7k/FvOij18bjFuMBIWRucrAHDp4J
	WYy2cK4GRlv5dJ21lxDYic4BIMYMj0XPpFgpcGePOfway5JULyy1WojFohWpueh4SKdjnVXS2W+YZ
	jRfIc5kOOJGu/aqQNHfVDpxki/btBJPn66MJvTcp/YC7RGKYv86nFYbQKt6y//jT/HiddGPYtRAGC
	tCqYWtkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seGli-00000007eG3-0Zp5;
	Wed, 14 Aug 2024 16:22:38 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seGl4-00000007e7m-0HBV;
	Wed, 14 Aug 2024 16:21:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6AF23CE1A43;
	Wed, 14 Aug 2024 16:21:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F5CBC4AF09;
	Wed, 14 Aug 2024 16:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723652513;
	bh=y8gPBkTOEvl5zKXterrWvlJucqFgWO/8eWjzKQnvzD4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q4rPNJ6ZS8/YTjHc/9HkxRU27ouAY0yibwaXXAm+1vcSBPqrepnOKEU4AR3KEhnOt
	 s58dD84l+9v/yfPZN6YN2ee+5/Ym6lay4t2aiB6H3CiXfg445fDVhup1StlDclBTyN
	 d6Tf9ZIXcKqcM2L3sfgF+ddNkeVAxqDhU5qIjR7ZPgaAoUWw/E0xVSN5pIIVghvJgH
	 ao3pIeIoMl3CcpagSZ9IYoUJzDC0aICQgPiBRlV88oVgdcBIHluUExu1ctrkOZWkoE
	 9l/H09OLwebwQfZ3EaETR7W2P/kahXmTAg0E5aVvsQbbYfL+9JItY7NLBOg8IGqomK
	 WAZ23R2KyrVjw==
Date: Wed, 14 Aug 2024 17:21:44 +0100
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
Message-ID: <7433e3d2-996a-45a0-b917-666a340ad109@sirena.org.uk>
References: <20240801-arm64-gcs-v10-0-699e2bd2190b@kernel.org>
 <20240801-arm64-gcs-v10-24-699e2bd2190b@kernel.org>
 <ZrzIv3FWNgJizDc2@e133380.arm.com>
MIME-Version: 1.0
In-Reply-To: <ZrzIv3FWNgJizDc2@e133380.arm.com>
X-Cookie: The second best policy is dishonesty.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_092158_471703_82B94033 
X-CRM114-Status: GOOD (  21.99  )
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
Content-Type: multipart/mixed; boundary="===============5958125776816830818=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5958125776816830818==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="m4k347TUK5jMfMto"
Content-Disposition: inline


--m4k347TUK5jMfMto
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 14, 2024 at 04:09:51PM +0100, Dave Martin wrote:
> On Thu, Aug 01, 2024 at 01:06:51PM +0100, Mark Brown wrote:

> > +	if (add_all || task_gcs_el0_enabled(current)) {
> > +		err = sigframe_alloc(user, &user->gcs_offset,
> > +				     sizeof(struct gcs_context));
> > +		if (err)
> > +			return err;
> > +	}

> Who turns on GCS?  I have a concern that if libc is new enough to be
> built for GCS then the libc startup code will to turn it on, even if
> the binary stack running on top of libc is old.

It should normally be the dynamic linker which should be looking for
annotatations in the binaries it's loading before it decides if it's
going to turn on GCS (and libc doing something similar if it's going to
dlopen() things in a process with GCS enabled).

> Is there any scenario where it is legitimate for the signal handler to
> change the shadow stack mode or to return with an altered GCSPR_EL0?

If userspace can rewrite the stack pointer on return (eg, to return to a
different context as part of userspace threading) then it will need to
be able to also update GCSPR_EL0 to something consistent otherwise
attempting to return from the interrupted context isn't going to go
well.  Changing the mode is a bit more exotic, as it is in general.
It's as much to provide information to the signal handler as anything
else.

> Is the guarded stack considered necessary (or at least beneficial) for
> backtracing, or is the regular stack sufficient?

It's potentially beneficial, being less vulnerable to corruption and
simpler to parse if all you're interested in is return addresses.
Profiling in particular was mentioned, grabbing a linear block of memory
will hopefully be less overhead than chasing down the stack.  The
regular stack should generally be sufficient though.

--m4k347TUK5jMfMto
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAma82ZcACgkQJNaLcl1U
h9Dw8Af/XElMBO/KVokIR07KfaB7sgnHeJUwP31NSZhm66aDj1xZVgyEok6vrQOQ
UAQRifPV98myi1QmsusRk+fCC2OGUG2eLWctGHDghxBwYs5hOCl5kebcUIKzzjNH
8aqD3GZNX1JLH8PLbzDMVhdLpM4uyKOvZFammGDrnoXjhZaBVSKS0PibtS54TY+R
HA7tSTIm/+xG4rXkAPJ/vo9YZf+cF1bTp1ccC47oQGzsPJIlPfulipp25A71VIiQ
9enlRUbkSEEZhQH+UZ2Rkpk1+sMCKUv5uT/m2vNWx1gRkngD8YkNUG2TnE9FQqSE
01uJahLacQ3yCSaWsm6UnjpUxI3Qng==
=9afo
-----END PGP SIGNATURE-----

--m4k347TUK5jMfMto--


--===============5958125776816830818==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5958125776816830818==--

