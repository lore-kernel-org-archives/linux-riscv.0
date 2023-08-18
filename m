Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2414EE498F
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Aug 2023 19:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TTCgK2H5MOwxYkc4zkVMxEgCGcgT1bwDIalnXg1Jdxs=; b=24mkojk5z5oFT+wZD7wfr3Hg2f
	4PhceOFqk9r60w+4873J65G8DfAy7bqZGN+JAtSDNz71WtgVrHjv+7CPoyZZUUWlOLjg5FQCaPrUr
	qyjGahbm+1+bE3yzL2Emdxz3CFDQdGO4ZCdHQlO1FVU5+FEk0qDmE4lp0k+SRnuv7niRegJTj43kj
	yPAcOCQS1y3Qry3/ayZ1pCUfg7Z5EkNBfQADDDgMfIlRtGCNqUOTNUnOs+pmwYuOCeo1OGJyGjvue
	W6cPjtf1H41gKbOk5exUvBmkiGHZvOXgok4Gu33V7LVZ01V56NJ2kgB9KtP+MO0m8SHbmwmQKuInc
	oNohLKLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qX5IW-009w9R-2R;
	Fri, 18 Aug 2023 19:38:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qX5IT-009w8x-0l;
	Fri, 18 Aug 2023 19:38:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 88BA062F28;
	Fri, 18 Aug 2023 19:38:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDBE7C433C8;
	Fri, 18 Aug 2023 19:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692387492;
	bh=01Q2xEmAO2pVJWHzK9M3MZQdGCIPPOuErEoePLDfq+0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZvLDUejgDxFNb6IhI4Y0qdql5M25cqQLtbiufVm4Gb1iXmTmAB0Vv7ahIz5a06KAb
	 PUVYYrLHaNR/SZqrZU0yrVK5FDSBVeGGfofO9+Df7X5NWY2X9XcazAltA6H9EsHtv+
	 fc4AWwR9CKunnY9EpyNqH+5BjOB9QdtB0QMaWXxuq/yd9mPtqlVE1q+rF9jr+uSXsI
	 f1NsCWGQH8w59yUVRi8q2TubicSUqChyEh/LQmmTFJ4Z4wetsknCZ6enP2KXAnB49z
	 oUn0kP6MHyAsmo5BdzSFWx5eauk1ZDTV4IrU/9IN+nMSi55OIHvkUfyBmizMa3JLC6
	 ole8zbgLwOsiA==
Date: Fri, 18 Aug 2023 20:38:02 +0100
From: Mark Brown <broonie@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
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
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 03/36] arm64/gcs: Document the ABI for Guarded Control
 Stacks
Message-ID: <aaea542c-929c-4c9b-8caa-ca67e0eb9c1e@sirena.org.uk>
References: <20230807-arm64-gcs-v4-0-68cfa37f9069@kernel.org>
 <20230807-arm64-gcs-v4-3-68cfa37f9069@kernel.org>
 <ZNOhjrYleGBR6Pbs@arm.com>
 <f4cec4b3-c386-4873-aa1d-90528e062f2a@sirena.org.uk>
 <ZN+qki9EaZ6f9XNi@arm.com>
MIME-Version: 1.0
In-Reply-To: <ZN+qki9EaZ6f9XNi@arm.com>
X-Cookie: Your aim is high and to the right.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230818_123813_366101_5504FCB0 
X-CRM114-Status: GOOD (  21.16  )
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
Content-Type: multipart/mixed; boundary="===============6953334151930579043=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6953334151930579043==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LNILMu582aOVL6hM"
Content-Disposition: inline


--LNILMu582aOVL6hM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 18, 2023 at 06:29:54PM +0100, Catalin Marinas wrote:

> A related question - it may have been discussed intensively on the x86
> thread (I may read it sometime) - why not have the libc map the shadow

Your assumption that this is a single thread feels optimistic there.

> stack and pass the pointer/size to clone3()? It saves us from having to
> guess what the right size we'd need. struct clone_args is extensible.

I can't recall or locate the specific reasoning there right now, perhaps
Rick or someone else can?  I'd guess there would be compat concerns for
things that don't go via libc which would complicate the story with
identifying and marking things as GCS/SS safe, it's going to be more
robust to just supply a GCS if the process is using it.  That said
having a default doesn't preclude us using the extensibility to allow
userspace directly to control the GCS size, I would certainly be in
favour of adding support for that.

> (I plan to get back next week to this series, I'll need to read a bit
> more on the spec)

I've been making changes, mostly in response to your feedback, so there
should be a new version on Monday even if not everything is addressed
yet.

--LNILMu582aOVL6hM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTfyJkACgkQJNaLcl1U
h9Cw3Af8Cnyy0Sa1PU1lq3c1HV/d6eNcVzOoN4kECuID3B/GKxWng90W0Z7wR75z
Wl9H0WZxlDkqd/voFGHAJTEtlcEZMg6xNByq8Rhq2jw6R2EX3O8P6+Uqumjb3UQ8
wb+PJyloj3BhXcQPiMH8vFHAs6b81DyPYo9NtaCLsYbtZv4MwGjgJKRrAl8+O2ct
n/1P1Hpp/XUeTZUZvyWxrBdDUD7nLq9mQe2/+h6NxTtchrNTb98Kvgk7JrRefjrB
7kehDj9XiBJt5vVkoSO+e5aVln7wgwWor3KsjviaeNzyXglWrx+VBIc8OT6FMiJw
VIA6Wrc8ikvi1fZ/oooK9TnU+p5chw==
=RgY5
-----END PGP SIGNATURE-----

--LNILMu582aOVL6hM--


--===============6953334151930579043==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6953334151930579043==--

