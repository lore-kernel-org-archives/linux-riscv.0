Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 159CAC3DA7F
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Aug 2024 15:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K/zLU+a09yhFNPVfh1g6XGp07pekmIWCblIQ9pVOjdU=; b=Mbh48RMqrKKWYpCQcxLQGjV3Df
	djDqZbwD6H5HprHrXyii9d03PoPI8/mPSJvyCvc3iBoWh1b9yXycwPRkv7fh3EkvOp4kC7abeAb2S
	/hDe3K2rBtmo5nwZVyMUFPkYkqkBT11VvwSF4FnTv8riTjb3F9JtgiOoLAkMdGDBFUZXFHDWV08Gl
	YDpViSxMVrKZcTKVjmm8xI/L6JgV7dEyRYTbewX/FfvGFaZF/reuOA6KL56kkvsxzXoMgyA1doj3O
	86sjU2aKGGOAQDNrn3tt7sMbm1mpmSSYes7FOYK9C/rOE8hxBCz+bUFsu2zksRFei9Nu/61x58/3q
	r+Drs1sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sechC-0000000AQgL-0qwy;
	Thu, 15 Aug 2024 15:47:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1secg3-0000000AQRQ-0zk4;
	Thu, 15 Aug 2024 15:46:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7C0A361EC0;
	Thu, 15 Aug 2024 15:46:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A925FC32786;
	Thu, 15 Aug 2024 15:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723736774;
	bh=OhahuUFfndYeeiIAqMoZWO/itLbhbmCl9Dektx2bSmw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZQHxQvc5mzqu6Xt9OdE1XNZLD70/O3dkcJiXZaxebgJDxx2JQVYIg435975yYCQQr
	 l5jUPJ9oJMKRElz7Dpy6UeqrDFRWxrZL9GgVJl4lw07+FN4VZhWpX5TJn27GiUUmzn
	 zflbVeq8Fynrs4ZZayXEmrP67CO7FB82ptXHbETuTJY707TwQqihr/CnxYOeOkK3Iq
	 Dls40SNfnnISQ4sF8cCZV+d/wVSzh4VpXAdOpq9qVv/6PVrUYatD7Il2JO1i+4JRAP
	 0bkotokage4eWgXhiPbnrXkVCVs4p5DoijU6EnNn09pzgcTeB9heRVbuopXzrzYpak
	 8cbW3fI2l2ChA==
Date: Thu, 15 Aug 2024 16:46:04 +0100
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
Message-ID: <280e4455-9cf7-40e1-9114-7bb3aa9de868@sirena.org.uk>
References: <20240801-arm64-gcs-v10-0-699e2bd2190b@kernel.org>
 <20240801-arm64-gcs-v10-24-699e2bd2190b@kernel.org>
 <ZrzIv3FWNgJizDc2@e133380.arm.com>
 <7433e3d2-996a-45a0-b917-666a340ad109@sirena.org.uk>
 <Zr4KMaBv4JXx8uBz@e133380.arm.com>
 <efe1d936-011d-49e3-a0ff-8f6276e4d782@sirena.org.uk>
 <Zr4fxZ8wf+Wcey4E@e133380.arm.com>
MIME-Version: 1.0
In-Reply-To: <Zr4fxZ8wf+Wcey4E@e133380.arm.com>
X-Cookie: -- Owen Meredith
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240815_084615_384465_FA4F110F 
X-CRM114-Status: GOOD (  25.71  )
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
Content-Type: multipart/mixed; boundary="===============3939399320208860938=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3939399320208860938==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GXfbjsfo8XCmDLMF"
Content-Disposition: inline


--GXfbjsfo8XCmDLMF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 15, 2024 at 04:33:25PM +0100, Dave Martin wrote:
> On Thu, Aug 15, 2024 at 04:05:32PM +0100, Mark Brown wrote:

> > The expectation (at least for arm64) is that the main program will only
> > have shadow stacks if everything says it can support them.  If the
> > dynamic linker turns them on during startup prior to parsing the main
> > executables this means that it should turn them off before actually
> > starting the executable, taking care to consider any locking of feature=
s.

> Hmm, so we really do get a clear "enable shadow stack" call to the
> kernel, which we can reasonaly expect won't happen for ancient software?

Yes, userspace always has to explicitly enable the GCS.

> If so, I think dumping the GCS state in the sigframe could be made
> conditional on that without problems (?)

It is - we only allocate the sigframe if the task has GCS enabled.

> > > Related question: does shadow stack work with ucontext-based coroutin=
es?
> > > Per-context stacks need to be allocated by the program for that.

> > Yes, ucontext based coroutines are the sort of thing I meant when I was
> > talking about returning to a different context? =20

> Ah, right.  Doing this asynchronously on the back of a signal (instead
> of doing a sigreturn) is the bad thing.  setcontext() officially
> doesn't work for this any more, and doing it by hacking or rebuilding
> the sigframe is extremely hairy and probably a terrible idea for the
> reasons I gave.

I see.  I tend to view this as more adventurous than I personally would
be when writing userspace code but equally I don't see a need to
actively break things.  There's no *requirement* to use libc...

> So, overall I think making ucontext coroutines with with GCS is purely
> a libc matter that is "interesting" here, but we don't need to worry
> about.

Yes, it's not our problem so long as we don't get in the way somehow.

--GXfbjsfo8XCmDLMF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAma+IrsACgkQJNaLcl1U
h9DSDwf/fvoSsWjkRUucDXlPXcS3xALg/zYnf2jri8K1FvhKbx6ExKFpnk/0g2BM
wK2PwaNUJU1aco+sWt4qWO5BpC2IehhK4SayS1RosRQNYaC++NMOh2/8HVNEHE10
XYPyfSZwI+nnf/4yS6Zz1HdzVTbuTkNBtkWyJtEO+gVukwrqd8ZroQ0fuSBvQyOu
ZmkniP6ouY5JUJvZtbLtaP0MurY44KnJyfZKbDuNyinTVw/SRukqIPVzy3RT0tTJ
rYVAnu34kZUCOei6ztPt+st1eA0IfyO0JvM2DcPAY7ZI1JHi15NFj0P2SedICD9d
gFptQBZcUxVlVAqy5L/gZ2G4JmaFVw==
=AdhV
-----END PGP SIGNATURE-----

--GXfbjsfo8XCmDLMF--


--===============3939399320208860938==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3939399320208860938==--

