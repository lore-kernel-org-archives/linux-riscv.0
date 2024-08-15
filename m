Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDF02C3DA7F
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Aug 2024 15:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=emRneOHtZc84a9YQ9arKrEblDFC1Cv2T3D8Q8GaCasQ=; b=HC6sXqcv/vYtwohId1KvazGaBn
	EKcISr1Sbh73FJ7ueGrc3+gfLckJDG+thj4EitLa3+uobSXsHNhZZKE326S2W0bAzK7tMuyYNP6qG
	sNIMlvY6dPPJkHCGJOI3kBvtKk7ocnWJYApNfQ/wZ3rbL87GQPqd7uMofmbPk7doRm1/OlcHsrKOx
	+9DkxwZh+rr8OR25Va4v3T3uup79dQ3XngCfeBmbnNfUiUF+086JbDdsd++P/PeqO6r2qo8YeD4QG
	ens77MFf3BW1dquVGpj9yJkLVynWo/LHHuNu3pHG6Q8RVVrNXCpK6A63nIMG9pfpxjVdUGpyFMh6n
	JVVQc/UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1secR7-0000000AOhL-283H;
	Thu, 15 Aug 2024 15:30:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1secQT-0000000AOat-3cts;
	Thu, 15 Aug 2024 15:30:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=KfqMj/6waFo4cRS22ojTqIyojXYT4KdavqEpM33O//0=; b=dSMo7Tzm1Ddrz8jYiZ4aYRB9Oc
	v1MSgk4TWItJgfrrEzCYWRHkCUAJQDyTSOmJTnebtcDSEOWSegZO6IbClP/3mEts670e98LtKHsMJ
	V3FvAqCSUOfJgz2f/CqiJzQrlq+RDqArGZLvDY7irj4a0lZtLf97DBQKsJRa6QU2aL3h5X1l0mhtd
	KgbVLJL9IndTznmkBRXb2MPpPi7KBhSHCqsTicGeS7qMKbt1qoWnVAwwWufohcW/IsaW3N46r4VGs
	sCd1oISU5cuaMq6U+ooWsAlKAdcN/Gg0LzLXIyJwjHRmLWKrcutfGl9UdtP1mhJurcdqwVD/Gn3MH
	VdqRZAsg==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1secQP-00000008Pqt-2VFJ;
	Thu, 15 Aug 2024 15:30:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BA77E61EEC;
	Thu, 15 Aug 2024 15:30:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01F12C32786;
	Thu, 15 Aug 2024 15:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723735803;
	bh=eIyx3IBfKno0cNAgEw1iBNzp1pqq6ljpPhCQTDU9dZk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f2VOK3AIWLU8QSUcuez403jAVeUCxkGiqTwl/3vXpTISYj5ZNiaC7iRk9B1NZQLjA
	 ovS1xr5gzeXsj2qNTSBFtyK1r+NxVe1nNs7sFTPO/KORonQhYRYOL9MBdvAC1kTDUW
	 vaAvADvtMEuupWZG7KxvNlIMv37mit4/B9L6sSEm1SlLUCoOOZInyG6S0M6A8fjPBo
	 O0D6R9ho6KCsny6znOChjPwNDpYIp/Ae8NQuuWxnILZlVGI6zgwCn/Allcb9RHmYO+
	 fd68FywO/qwePHjIoRGOlchOiPZz3nc64ZdSlgTIdvCBcid+R8wy8E1G3vTTrZTKT1
	 QB/eLkqJrI0jg==
Date: Thu, 15 Aug 2024 16:29:54 +0100
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
Message-ID: <7fa96f26-5bf6-490f-8986-258033fbfe0e@sirena.org.uk>
References: <20240801-arm64-gcs-v10-0-699e2bd2190b@kernel.org>
 <20240801-arm64-gcs-v10-23-699e2bd2190b@kernel.org>
 <ZrzEfg5LqdAzgJ6+@e133380.arm.com>
 <08932f6d-01ef-40e8-97d2-08f0d2016191@sirena.org.uk>
 <Zr4EkmtUKop9o9wu@e133380.arm.com>
 <c56fa974-88f7-4c1f-83bd-8c481fe0045d@sirena.org.uk>
 <Zr4avB6+U4tLDy8E@e133380.arm.com>
MIME-Version: 1.0
In-Reply-To: <Zr4avB6+U4tLDy8E@e133380.arm.com>
X-Cookie: -- Owen Meredith
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240815_163005_977016_21313EE0 
X-CRM114-Status: GOOD (  19.27  )
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
Content-Type: multipart/mixed; boundary="===============1342333694241014274=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1342333694241014274==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YyEFoEtU1rhfM5GN"
Content-Disposition: inline


--YyEFoEtU1rhfM5GN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 15, 2024 at 04:11:56PM +0100, Dave Martin wrote:
> On Thu, Aug 15, 2024 at 03:45:45PM +0100, Mark Brown wrote:
> > On Thu, Aug 15, 2024 at 02:37:22PM +0100, Dave Martin wrote:

> > > Is there a test for taking and returning from a signal on an alternate
> > > (main) stack, when a shadow stack is in use?  Sounds like something
> > > that would be good to check if not.

> > Not specifically for any of the architectures.

> Can you see any reason why this shouldn't work?

No, it's expected to work - I'm just not specifically aware of an
explicit test for it.  Possibly some of the userspace bringup work
might've covered it?  Any libc tests for altstack support should've
exercised it for example.

> Maybe I'll hacking up a test if I get around to it, but don't take this
> as a promise!

Thanks for your firm commitment!  :P

--YyEFoEtU1rhfM5GN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAma+HvEACgkQJNaLcl1U
h9BAegf/QtK1e+T9WZ1prxPIxk18DlFBSQaVl3fAvm96vjPtE5PP3xAzEPik0b3O
Z8qDui3LXfB5xvftgIUUnEo1Yl7a5NiEUuqdU1fUUvXGk8OCVEmEQLXbBPOC6cyQ
e0jNgMzBJ0L/zIM5XPjEBw33aYk0GrwL/ib4Fyzo7SfscLaZQ926T72vSydRXaIo
TXc3QKHKWYHOaCAEMZgW2uBgmm7u97mFH7E7HJAqEiRPE0T4f6qQjluDGEcy1crb
DJfTgadShNXTjshCzNYyYtHXZgrQjyRUSbCA4Cgnwj9McpBbwQQkbx9kXH6sZdHV
Qgdiabh+uFXtADbJInyFT0RqRakHXg==
=3J6F
-----END PGP SIGNATURE-----

--YyEFoEtU1rhfM5GN--


--===============1342333694241014274==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1342333694241014274==--

