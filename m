Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D840C04A94
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Aug 2023 18:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kh4Azin9R1JjmK/9DY/ETAaS9W9hediI1eZ3DFSBotk=; b=B41jDJ4oDyWg/ExNjKKJeyq/g4
	Ft/3Toee5iMHJ0u3emYHuZ6QyoljtsM2CvzXW7FllZwnvT+Macf3OJnhi3Lcv+8Yui62JmnrjzBjm
	G5/IEmCZbgTzcrhKIFqUtI+8YO4LlieJ8+5h+PQ348sZHULrHqQxr4bPJ+6diYFeZwRzudZy2frDH
	ugKxBst95OY+Cvqn6iM55eAMOJYFtoqfFe9LAzx2BQAiN/QS1VXOei9UPyY1OkxiX4tKsHpd/e4q2
	4rKeyLNDxVzccHhmd2SmY4jFJbbyzoNGOly/pu5v3irA2La+WbMxZtPetWzrrqaq4LRvv2vav0I8k
	dnnQQhWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWLDx-004nNy-0j;
	Wed, 16 Aug 2023 18:26:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWLDq-004nKM-2C;
	Wed, 16 Aug 2023 18:26:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2D6DA62A20;
	Wed, 16 Aug 2023 18:26:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3A3AC433C9;
	Wed, 16 Aug 2023 18:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692210381;
	bh=3lwZH0aCkN4fuwrTeQAhsYruTaew5rtoMeyWR8imUko=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QK3Ss4gYQANpF0kfjVDMhwPaCBnN7jcXmU+ud+rNTZoFKIrBrSXEwPGVGIBxSuBVa
	 WPNXG6eJZ3FhK9KAyp3GfSYJ/zb+pE+4rCQknlaNheucXLhnJ67mh3RWIhFfKZTGL8
	 uXPBJpIcABURnESDC2XbooGsuC9LHy75ijzMgREdvGtpEQg9D9hhP7mVnrfKs6wg5o
	 GOpKTl8nyoHQ5Shobze8RiECk2mqQteHONzc9PyVM6x2gHC7QohvJDw2aydMjS7K0r
	 di+cOUZk4aPspJCVQsxXx0I5aMt2LWQ+6+xgwfkyKddkNk49YFt7sLHwaNqVbtpCJJ
	 jeHDFcRu2mgxQ==
Date: Wed, 16 Aug 2023 19:26:12 +0100
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
Subject: Re: [PATCH v4 07/36] arm64/gcs: Provide copy_to_user_gcs()
Message-ID: <60eeefc9-96db-4d4a-b0e4-751cba540471@sirena.org.uk>
References: <20230807-arm64-gcs-v4-0-68cfa37f9069@kernel.org>
 <20230807-arm64-gcs-v4-7-68cfa37f9069@kernel.org>
 <ZNZjdXTJw2p5vh7C@arm.com>
MIME-Version: 1.0
In-Reply-To: <ZNZjdXTJw2p5vh7C@arm.com>
X-Cookie: Old soldiers never die.  Young ones do.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230816_112622_809733_F9280D52 
X-CRM114-Status: GOOD (  17.96  )
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
Content-Type: multipart/mixed; boundary="===============6775709216653346247=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6775709216653346247==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tm7DmRva30JRxCzT"
Content-Disposition: inline


--tm7DmRva30JRxCzT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 11, 2023 at 05:36:05PM +0100, Catalin Marinas wrote:
> On Mon, Aug 07, 2023 at 11:00:12PM +0100, Mark Brown wrote:
> > +static inline int copy_to_user_gcs(unsigned long __user *addr,
> > +				   unsigned long *val,
> > +				   int count)

> I think it makes more sense to have a put_user_gcs() of a single
> element. I've only seen it used with 2 elements in the signal code but
> we could as well do two put_user_gcs() calls (as we do for other stuff
> that we push to the signal frame).

Right, it's just the two element array in the signals code and the one
element for the context token in map_shadow_stack().  I can refactor to
a single read/write operation, I'd originally written it that way but I
wasn't thrilled with either writing a load of fun macros to mirror the
way vanilla put_user() is written or having code that looked very
different to the other similarly named functions were done.

--tm7DmRva30JRxCzT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTdFMMACgkQJNaLcl1U
h9DYQQf+Nxve6dTX12KVeA30x+OuPZrZ9604olhrpuQpYtFjAW9Y1s1V/zuJQfpi
m2RUZwNwL8KLj0HHROEn6zCjxEWEgWDmYL0jocaZPRXfaXYATOaeKq/4ZNuZPTz0
T8WOwgOm1V+Oojr0s9tTF3eeU+TbqH2Pjn54/5nAm3/ZO3A3K/NA3aG1qVRgUg30
KC4cwnyO6b+WqMiy4HglvqDJiCFZXFEw8yTpaLuznzdX/t6qZ+XIkuiqDKn/ek2M
Gzey1zWBfgdiqCsZDxAb+7rOoEnnyLh8qxMRQWzZCCEb2y/qihOUuFcyPsimZ8mU
avhuox/i9muYxS6uDyrWVVaaN2t4bg==
=OnPi
-----END PGP SIGNATURE-----

--tm7DmRva30JRxCzT--


--===============6775709216653346247==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6775709216653346247==--

