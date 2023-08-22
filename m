Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AADC1EE49AF
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Aug 2023 17:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GMdKFjIM1qLtjKL2/7j18OW1JpELS6iZGxcc61RTE+Y=; b=oIthbvOUwK/mzlwa2Ty1kRXG8S
	tgkxY3pvENK84mPBbDE+pSIgsM8wyN4OP5bJOO3200bfXWA8e/0IeJbflebbTyfrl2m3yQm698IG4
	1tBt5897a0+hUxHT9F88yfSfKGn5H94uVraQzbJRDGsO6zXmnFRJRz8aGlDMS99VcnKBPnLOXxFYT
	nbmKZy5BQuK2RXJ/wlP22oiZeD/0ygROQZ3KqsPYCYWezNMAleeHVUhmaO5vDmGrtMeNu30U9XKtY
	CH9nXmPwURjQQsHPmf4l/fM7zc2jCv1wXQa3Bncxp4/p5HkOj5Wv7NR4zIT9I+apnKQXJtZH59SIk
	ZBF4yuEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYVbP-00GbZr-1p;
	Tue, 22 Aug 2023 17:55:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYVbM-00GbYd-2S;
	Tue, 22 Aug 2023 17:55:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 563D3658EF;
	Tue, 22 Aug 2023 17:55:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02761C433C7;
	Tue, 22 Aug 2023 17:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692726934;
	bh=nRhOqPrA5BuPwRcvI7MlHlUwPN6wyHo9eKiXJKZmvt4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=myEcl1WQzsR8pyBO5c97oqf72AeVeGXqJVloLwBX8iLiTVv8X7Ia5vxoJdiPn9i+Y
	 VjQOYYmvKvjZbfOh6E8xc61ay9ODF00wOGJfXl/c1vGl0Y6OYChvzjcdwufld/IScF
	 1UGlm7KFs7gyhSRfsTyEylIum6Z+RkaBDfABGffR9V76JaIS9JY5hMmlmS0q/9LklM
	 ePT2X4GvVlJEVV0h+Oer2GtY4Hxhd4pfL+5zEq8l0XyzfybeFF7tgxUXVLmquGqvQ1
	 TZIES52DEgXIUwTk2PsKGVvUBdwYPMTgBnyG4aO6gC+pZlhQLIK4t/O11L17SOC7Vu
	 mGZAJ84Zodf5Q==
Date: Tue, 22 Aug 2023 18:55:24 +0100
From: Mark Brown <broonie@kernel.org>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "david@redhat.com" <david@redhat.com>,
	"corbet@lwn.net" <corbet@lwn.net>,
	"ardb@kernel.org" <ardb@kernel.org>,
	"maz@kernel.org" <maz@kernel.org>,
	"shuah@kernel.org" <shuah@kernel.org>,
	"Szabolcs.Nagy@arm.com" <Szabolcs.Nagy@arm.com>,
	"keescook@chromium.org" <keescook@chromium.org>,
	"james.morse@arm.com" <james.morse@arm.com>,
	"debug@rivosinc.com" <debug@rivosinc.com>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"hjl.tools@gmail.com" <hjl.tools@gmail.com>,
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"oleg@redhat.com" <oleg@redhat.com>,
	"arnd@arndb.de" <arnd@arndb.de>,
	"ebiederm@xmission.com" <ebiederm@xmission.com>,
	"will@kernel.org" <will@kernel.org>,
	"suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	"linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v5 11/37] mm: Define VM_SHADOW_STACK for arm64 when we
 support GCS
Message-ID: <c9d0881d-e26b-4680-8f8e-0d5e1c82655c@sirena.org.uk>
References: <20230822-arm64-gcs-v5-0-9ef181dd6324@kernel.org>
 <20230822-arm64-gcs-v5-11-9ef181dd6324@kernel.org>
 <8f2cf5af-cad7-a69c-e8ec-39f48deae1cb@redhat.com>
 <54b2c1e5-a99d-42c0-b686-1b5cbb849581@sirena.org.uk>
 <e10e729392c5fa421baf08b4ea7aaac6ffada0f5.camel@intel.com>
MIME-Version: 1.0
In-Reply-To: <e10e729392c5fa421baf08b4ea7aaac6ffada0f5.camel@intel.com>
X-Cookie: MIT:
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_105536_888568_A5126A16 
X-CRM114-Status: GOOD (  21.15  )
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
Content-Type: multipart/mixed; boundary="===============2623535134931975843=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2623535134931975843==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="M/5Lioh+7qcaKBw4"
Content-Disposition: inline


--M/5Lioh+7qcaKBw4
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 22, 2023 at 04:47:26PM +0000, Edgecombe, Rick P wrote:
> On Tue, 2023-08-22 at 16:41 +0100, Mark Brown wrote:

> > I can certainly update it to do that, I was just trying to fit in
> > with
> > how the code was written on the basis that there was probably a good
> > reason for it that had been discussed somewhere.=A0 I can send an
> > incremental patch for this on top of the x86 patches assuming they go
> > in
> > during the merge window.

> There was something like that on the x86 series way back, but it was
> dropped[0]. IIRC risc-v was going to try to do something other than
> VM_SHADOW_STACK, so they may conflict some day. But in the meantime,
> adding a CONFIG_HAVE_ARCH_SHADOW_STACK here in the arm series makes
> sense to me.

OK, I'll do that.

--M/5Lioh+7qcaKBw4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTk9owACgkQJNaLcl1U
h9BzkQf/R6al2pexuFT7yjh/QmDQ605ZLN9i97Je0LSd5PuT5nU6GF3W5a54fMib
6W/3nsCaMStJXsvd+VW79higHGjkzwpJF2gPeI94UCLBgKYqU8qB4MR/adY9Ff1r
1sA4RWSjuxtC8NBEoIYomxAXMpW05vpD0eruSLYjUnEnTf0NrXtxZmwZQjcVHeeS
f47zzzB9vzZ1wei7YyAcO+oju9JjWVkD2jTdQJjddCKNIuR+qB98g/qO4BvHp86+
OPVeSsY4Ko7Kqh4JKdTddAYte0KvQ0SaRh59Zmo6tcorDOv6yVJOfTOEQ8v2SdFD
daJaRcq070YEVByUMToJ3C0wq/P7+w==
=2kJA
-----END PGP SIGNATURE-----

--M/5Lioh+7qcaKBw4--


--===============2623535134931975843==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2623535134931975843==--

