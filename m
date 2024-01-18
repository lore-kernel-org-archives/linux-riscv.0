Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B517FC47DAF
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jan 2024 21:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9zbDOVRtf8FWvDKh/WuTEq6XZgeTHTaNkhgqjhjsIRM=; b=gz+TZFodxn1vsmLoUtQ6cQpRAd
	7d9HsR1y21gju7gMFZ0FINGGjAyk3AP8MRkjwjiS5BcQweHXPuckO+OmVinLeejS/b3l9S+sd6gar
	s4RhpQhoYHCNMprO5YXee1CVBgRyyfZo0dNnWHsLNBF9RWJ5Iz+bEfY3eBkG0Fh7niLVGqkVzpslA
	wd3oS0KP//fLU+X0QwXykTzDocHM29e6Dz6/ZgPjIh4C7eWHyB5JksWPSkISV3IebuoC5Jf+gKh35
	oyCWh+jGJwRexlUIUcjwhpv9xjEyL4AeOs0B+IMUEeg8wvF/YhYJp1mVlfsqgHenKa7Kgoeqip4gI
	+lRocOWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQZf8-003rxS-2b;
	Thu, 18 Jan 2024 21:10:58 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQZf4-003rvs-2h;
	Thu, 18 Jan 2024 21:10:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 1514CB818AA;
	Thu, 18 Jan 2024 21:10:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DF08C433C7;
	Thu, 18 Jan 2024 21:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705612252;
	bh=f4pgnl8yd020hjFNUjJcTz/Gx6KZT1fbOEGiRHoWS0I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZOjcivrWeVqiQ8DXbRajgXxCSi0AX3o34/4vHt4xY0ZnhzaET53Cz7aexMT8aHn4h
	 M5ArFyBw3UfbVpaf4/Z9R5jHEzG3cMVLydldQ+Gz+dB6E/xbSzGvtvCAhWKP3jTkVs
	 NeVoUXPOeaCC1aJFFLAMZi3JyZP5FBbanivHS3DIiDvoTRmSVlVFrh9gK+zgS4JuPx
	 a2NLXYIWfKGkWvFn23pJBDYEqqiOLFyGNR2wEEAtGQdnKptgaikIvDuNwf3KNWUSCq
	 wP+zvTqLzIH15uhXn7/NUWueHheuyrpj/mKTsg6rzfFSF0P0QejjHhX6c+rmg9EklJ
	 5GQ+WBkWh5hgQ==
Date: Thu, 18 Jan 2024 21:10:43 +0000
From: Mark Brown <broonie@kernel.org>
To: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Arnd Bergmann <arnd@arndb.de>, Oleg Nesterov <oleg@redhat.com>,
	Eric Biederman <ebiederm@xmission.com>,
	Kees Cook <keescook@chromium.org>, Shuah Khan <shuah@kernel.org>,
	"Rick P. Edgecombe" <rick.p.edgecombe@intel.com>,
	Deepak Gupta <debug@rivosinc.com>, Ard Biesheuvel <ardb@kernel.org>,
	Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
	"H.J. Lu" <hjl.tools@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Florian Weimer <fweimer@redhat.com>,
	Christian Brauner <brauner@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v7 36/39] selftests/arm64: Add GCS signal tests
Message-ID: <94263c5c-817f-4dcf-8418-6c7e3c058557@sirena.org.uk>
References: <20231122-arm64-gcs-v7-0-201c483bd775@kernel.org>
 <20231122-arm64-gcs-v7-36-201c483bd775@kernel.org>
 <875y0x7f1m.fsf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <875y0x7f1m.fsf@linaro.org>
X-Cookie: FEELINGS are cascading over me!!!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240118_131055_134063_0B04F6E3 
X-CRM114-Status: GOOD (  19.15  )
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
Content-Type: multipart/mixed; boundary="===============1380078394415236548=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1380078394415236548==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="doBW+2ZTusCkWc8M"
Content-Disposition: inline


--doBW+2ZTusCkWc8M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Dec 16, 2023 at 11:12:37PM -0300, Thiago Jung Bauermann wrote:
> Mark Brown <broonie@kernel.org> writes:

> > +/* This should be includable from some standard header, but which? */
> > +#ifndef SEGV_CPERR
> > +#define SEGV_CPERR 10
> > +#endif

> One suggestion is include/uapi/asm-generic/siginfo.h. It already has
> SEGV_MTEAERR and SEGV_MTESERR, as well as si_codes specific to other
> arches.

Sadly the testsuite is being very clever with redefining siginfo_t which
means it conflicts with that header.  I'll update the comment.

> > +	if (!get_current_context(td, &context.uc, sizeof(context))) {
> > +		fprintf(stderr, "Failed getting context\n");
> > +		return 1;
> > +	}

> At this point, before any function call is made, can the test check that
> *(gcspr + 8) == 0? This would detect the issue I mentioned in
> patch 24 of gcs_restore_signal() not zeroing the location of the cap.

Sure.

> > +	if (gcs->gcspr != gcspr) {
> > +		fprintf(stderr, "Got GCSPR %llx but expected %lx\n",
> > +			gcs->gcspr, gcspr);
> > +		return 1;
> > +	}

> I suggest adding a new check here to ensure that gcs->reserved == 0.

This would mean that you couldn't use an old kselftest build to verify
a new kernel that starts using the reserved bits.  It's niche but it
does seem like something that should work.

--doBW+2ZTusCkWc8M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmWpk9IACgkQJNaLcl1U
h9D18Qf/dkanHMRcVOLBO0KY2XdPTIfY1GyOkjJY1kaVS8NrmmBXUrDbi21xRyjY
hrG/NK4XolQfikIXkTHDmzK4oPapXDow6he4iR1c9zU0DnLSMp4VoXZ7ocIMAoBi
tQ10946KiS7b3/zM+TNvOJeQcoToWb8HdVsvesPbs3kMHXTGFOCXIIGP+at5Xn+d
jm35bqd8SAcCA57Xci4zNZm6G/40We/QeI3oAQjjrGQuCHeecQQAz1qMinbc5udk
98yjraA9J1Q0v5JAuH1ssAczoXX2hM7H7ZJZFu2x/lXqoq2bvjEDsJUJHybrb4d+
R77h7JGFnnC+PGVQbXKJpz1bueqP8w==
=5ri/
-----END PGP SIGNATURE-----

--doBW+2ZTusCkWc8M--


--===============1380078394415236548==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1380078394415236548==--

