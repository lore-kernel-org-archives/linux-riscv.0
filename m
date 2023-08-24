Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70429C6FA8F
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Aug 2023 17:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5aRiogFKvQceaUC3k9BAuDQ4dBW2APYvH5MBVnGClWU=; b=kLtZqDNp5fvvQc96A94SyciNr4
	ZC+/A1QrPhyre9GdnM0FlAxLXwd0PbmmO6s+1eOzA1t58pGS7zayecL/iUf++1CIq1GBa368nrCMc
	dOsgsQ5k92Q9yGEvbyrKqfbr7u8FhhY+XE0Fkin8RBiffJpOt0RVzKTXelGL9IhFPt+szqENbMTAL
	aQ+xASN9YuF5nLpgynljzEdYSpLfMwkUgWus/n7WigClqbnqkhRO6YAWJT1jnp7hSYAEPw2TF8GsE
	5Xhah9OnkIiS9bhk7+DonlWPEUWNV7a8PywQtonKWJFXJIiMbefHRpogodvmcUGXNJdCHQ/p69/Dk
	jnyoMPAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZEHh-003XVz-1M;
	Thu, 24 Aug 2023 17:38:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZEHe-003XVX-1U;
	Thu, 24 Aug 2023 17:38:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 09E7464672;
	Thu, 24 Aug 2023 17:38:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E96AC433C8;
	Thu, 24 Aug 2023 17:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692898692;
	bh=U5Ix9ciY5zbF8VwoY15Xy5FGw2K8jCp22zgnZb9yn1s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nRAf83wpRSrvvYRPjONqLVZzwBYmDLrH/GH1ltQcXP7W3rjLVJZ/rbQnnpP21RlTy
	 5KGjtMJZipbDFqU5ETzp7GJ73tNtF5dpUnwDDr93+DtvZb1jyLeSl+LmE0BY19DfG0
	 uPlvnfS6yIMSrxs7lb43NF/UkwEC8ZmgXZgoYupKjMkqQCJK1NAHDv0zxo/7o/ajIN
	 CJ4lU3O5C10vTHb2rCfGlpE4YUHksa4/+mNGWqC5ATCYJhHg+b7spIRVwe9uCdGewY
	 1zpdUkfatB50xUtoUYaupimxaODWpNmJKwGlIdZFKqfVQ56ebQsHXIQR2BFnB9oovK
	 2AzqDCkwAPsKA==
Date: Thu, 24 Aug 2023 18:38:02 +0100
From: Mark Brown <broonie@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Szabolcs Nagy <Szabolcs.Nagy@arm.com>, Will Deacon <will@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
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
	"H.J. Lu" <hjl.tools@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 03/36] arm64/gcs: Document the ABI for Guarded Control
 Stacks
Message-ID: <ZOeVeujEVmoJ1eOR@finisterre.sirena.org.uk>
References: <ZN+qki9EaZ6f9XNi@arm.com>
 <aaea542c-929c-4c9b-8caa-ca67e0eb9c1e@sirena.org.uk>
 <ZOTnL1SDJWZjHPUW@arm.com>
 <43ec219d-bf20-47b8-a5f8-32bc3b64d487@sirena.org.uk>
 <ZOXa98SqwYPwxzNP@arm.com>
 <227e6552-353c-40a9-86c1-280587a40e3c@sirena.org.uk>
 <ZOY3lz+Zyhd5ZyQ9@arm.com>
 <ZOZEmO6WGyVAcOqK@arm.com>
 <ef7272d2-d807-428f-9915-6fc9febadb5c@sirena.org.uk>
 <ZOd6lzj29VksAp7L@arm.com>
MIME-Version: 1.0
In-Reply-To: <ZOd6lzj29VksAp7L@arm.com>
X-Cookie: Give him an evasive answer.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_103814_610822_5E269155 
X-CRM114-Status: GOOD (  13.40  )
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
Content-Type: multipart/mixed; boundary="===============8030939440239929737=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8030939440239929737==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cR3/e0in3CDt790L"
Content-Disposition: inline


--cR3/e0in3CDt790L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 24, 2023 at 04:43:19PM +0100, Catalin Marinas wrote:

> If we go for extending clone3, I wonder whether we should also introduce
> a sigaltstack2/3 ;). I haven't checked what the current patches do and
> won't have time until early September (on holiday from the end of today).

The current patches (and the x86 stuff that's in -next) punt on
sigaltstack for now, the discussions around that are unresolved.  My
hope is that whatever we come up with there can be cross platform.

--cR3/e0in3CDt790L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTnlXkACgkQJNaLcl1U
h9BzXwf+PogdlHq+hcG6MNbhOXLdqIdv9ZRGclIgCMqiPry95Dchnj/AqAm6c1KW
hIYF7JwBhdQ+4zYjGG9gBcEs8zpbQepJziTh8cVrno1O9hL573b/rHrspYwVR+7K
SPEa3v+HfOhG2JG1jeX9p7IHLIxR8XjbRTOIjnH0y2H5Mi5GRIdblDl0MFwss65Q
yy4A9M+MErwOLa61qAJVBAXHrPefexcp6OJDaExkFCKA4AUkAEMkx8ewKfn7zep+
8cVT/fpy8yqtFSE9W2tJEp4Cm7tuoUGCvj6wuO8nUTnCRhu7L91iFnXr6jI2NXjq
4lpRD2wGj+qk2c/2UpLnuyaJZC11dg==
=4Dj+
-----END PGP SIGNATURE-----

--cR3/e0in3CDt790L--


--===============8030939440239929737==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8030939440239929737==--

