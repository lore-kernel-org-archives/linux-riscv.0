Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87A83C3DA4A
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Aug 2024 16:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xoRXWcuuDuVbIB4dosKcmy6tYpZXE7d0Z5kw/7adtbM=; b=1VbpVCMBMXJbryqUBuBvuOzAK6
	SHGVcqlbbKypMZpyeovGa22C9xVy1hCnEulE1PP75Xt049iJ+0vy89Y8YmrSik0ZDnW5ESAeEs7hy
	0IAbFZziULjyQexcYYpRUcREmzaeOVxkKtzEGmpoRfA7zQ0JFEEcOjKYUsvrg0CyqsOSHofs1gNpu
	Fwwg7XMJHk6zB8gTApC5cXi0Hy9HnCOl1I/jr5pn3kgXOUeS/IXa4Uumzwgk/dGN1ExOkaHfvlWCx
	vqYyWuFQPS9lH0XQ8LJWUeSXoFvejbiPqP31zvI05ydNqyzv0wmZrf0NwiHjFf7tbp2AT38TfMM0Q
	8hyjwnoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seGR6-00000007Zsp-2eT3;
	Wed, 14 Aug 2024 16:01:20 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seGQO-00000007ZZi-3pPU;
	Wed, 14 Aug 2024 16:00:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1F44DCE195D;
	Wed, 14 Aug 2024 16:00:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAE22C116B1;
	Wed, 14 Aug 2024 16:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723651233;
	bh=tJ9y/t0p8CoWT3GLrKdQZ0dSWk0FZ5F+3VCb9/8rtJc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C1Qo0Zncz+RdR9DeUEI52CB7DQtewBYXVGfRUQ4A1toxpkFsbuQ6aJyDgJz7UfDuH
	 bzxXCMK2CVyRwzj4Fzsp12NcASucmaKle8j/eMgOwWVzR2lvflN7lzCLHhTyQ3ScD3
	 +3H4j8mCCyM0GSJc3pBhGBO2bXmXG5WzBuDhGy5GyWML6OrUSxKM3fVQt794iZbGN7
	 zq37MEqlxsQmv9ud3qgMIDnCP26tQt1p0hjVBhliLYp5ui4XBUgvCNn/OsKWmUZrSd
	 Krpj/jmqgiJLPoYpTX6m1uOjpJNj4kjuDK0YvvBuQWHt0Y9IyIEzIa3etR5NZwtbL6
	 zsq/MP82yJmiw==
Date: Wed, 14 Aug 2024 17:00:23 +0100
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
Subject: Re: [PATCH v10 23/40] arm64/signal: Set up and restore the GCS
 context for signal handlers
Message-ID: <08932f6d-01ef-40e8-97d2-08f0d2016191@sirena.org.uk>
References: <20240801-arm64-gcs-v10-0-699e2bd2190b@kernel.org>
 <20240801-arm64-gcs-v10-23-699e2bd2190b@kernel.org>
 <ZrzEfg5LqdAzgJ6+@e133380.arm.com>
MIME-Version: 1.0
In-Reply-To: <ZrzEfg5LqdAzgJ6+@e133380.arm.com>
X-Cookie: The second best policy is dishonesty.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_090037_304356_A0EFD48F 
X-CRM114-Status: GOOD (  23.66  )
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
Content-Type: multipart/mixed; boundary="===============0514637335676701583=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0514637335676701583==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="d9byunHM6BED1bDk"
Content-Disposition: inline


--d9byunHM6BED1bDk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 14, 2024 at 03:51:42PM +0100, Dave Martin wrote:
> On Thu, Aug 01, 2024 at 01:06:50PM +0100, Mark Brown wrote:

> > +	put_user_gcs((unsigned long)sigtramp, gcspr_el0 - 2, &ret);
> > +	put_user_gcs(GCS_SIGNAL_CAP(gcspr_el0 - 1), gcspr_el0 - 1, &ret);
> > +	if (ret != 0)
> > +		return ret;

> What happens if we went wrong here, or if the signal we are delivering
> was caused by a GCS overrun or bad GCSPR_EL0 in the first place?

> It feels like a program has no way to rescue itself from excessive
> recursion in some thread.  Is there something equivalent to
> sigaltstack()?

> Or is the shadow stack always supposed to be big enough to cope with
> recursion that exhausts the main stack and alternate signal stack (and
> if so, how is this ensured)?

There's no sigaltstack() for GCS, this is also the ABI with the existing
shadow stack on x86 and should be addressed in a cross architecture
fashion.  There have been some discussions about providing a shadow alt
stack but they've generally been circular and inconclusive, there were a
bunch of tradeoffs for corner cases and nobody had a clear sense as to
what a good solution should be.  It was a bit unclear that actively
doing anything was worthwhile.  The issues were IIRC around unwinders
and disjoint shadow stacks, compatibility with non-shadow stacks and
behaviour when we overflow the shadow stack.  I think there were also
some applications trying to be very clever with alt stacks that needed
to be interacted with and complicated everything but I could be
misremembering there.

Practically speaking since we're only storing return addresses the
default GCS should be extremely large so it's unlikely to come up
without first encountering and handling issues on the normal stack.
Users allocating their own shadow stacks should be careful.  This isn't
really satisfying but is probably fine in practice, there's certainly
not been any pressure yet from the existing x86 deployments (though at
present nobody can explicitly select their own shadow stack size,
perhaps it'll become more of an issue when the clone3() stuff is in).

--d9byunHM6BED1bDk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAma81JcACgkQJNaLcl1U
h9DStQf+MHf5MIvFUrZBpQZg07XSllBYTCVHtBIGn5XzIx/KW1GJXKIov1DxWUTX
4/a2ua/8So/yt7XHqWLjBgCUd7U4AsSNKO3kBxUGH1j85SY4YPkZtb+t8AriDoS5
aBVNq2boS8RzipYyeieLa1TUtet845IqOUX6AZ6yMIyWEcqaST5KfdYG0vmy3tKH
Rk85zpx0YvxXhmd63f+dAZYPPsOxVaJxVgUGl8/qDJzXEHHsT8nNlkLc4x6s7vja
MyVsVWQGYTa7MKQofcxfH+yB1UtWlMV9oxMRWab4Uy7GPaBO05yTKxDukJQUklbt
S47T7TUaZvxSLe1aJLMls0FHfdO5uQ==
=go3J
-----END PGP SIGNATURE-----

--d9byunHM6BED1bDk--


--===============0514637335676701583==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0514637335676701583==--

