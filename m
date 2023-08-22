Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D598EE4993
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Aug 2023 17:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tYzNvyNlH9L+SujR9C8cb/+gWczV1geluRtD0QHhbRg=; b=ZrQY2a+kMdIzVcgIkHTYhqms/E
	Sqvcblegqnnf1fZAtB0y+OcFC65MIABwORVJFzylDibwoY5f7mIhRS/vjdX+2HG4VbHMOScd44eEu
	TkH3tNmhweJ7YCpBtAi5dpSFIqj0kSZ74ZiedrM9fm05C1UuOvs/KszW7P7w12kFNeCA/lVkxVFaV
	6MZtjqvwVxL3hRjID6KYK0714THwO3Uln0NsMdW7jrrz5JUndSnCTdlt1eQ8EDkh9Pw8V3cRpl2yP
	vcWqm66oTPfIICTgitFRFcfOSpc+Z4QZSQEu+YUMdJkekZPwmU6fvmpXyKP3PLUjPE84fAKVx3s6K
	Fj40o7IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYUow-00GYam-1p;
	Tue, 22 Aug 2023 17:05:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYUos-00GYYq-0Z;
	Tue, 22 Aug 2023 17:05:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7AE5061F83;
	Tue, 22 Aug 2023 17:05:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C885FC433C8;
	Tue, 22 Aug 2023 17:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692723928;
	bh=+/XUXGpY2ACCPD3YzzrpK3JtSQqnOrDZMR5OCAEhgDg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G928dxMHkk1xDk/SX1dNnL+spqkcZRuq0C5Z40fu1Tb9wObRKQhtFzT0ipOQBh80X
	 M0BVrVcY8VmxczuqKrntaU8eZ0hqbR8EE1e7UAwRJz7snKD2v4GCMfQ9hgFuv0aBvc
	 38dD7dDK0lef3oOPG14kshG+9z1JoNQxNiubdga4OgfcfWS0/Ve3yY/2BVaHKd3pvN
	 cYaVOE7zu3UopoUb04Il5Y+Q0rXflj/XshyiU6vP1UN0j8lgReDw7ES6DUIaCc0AWt
	 YsDqY20pamlKghLyhjkFUTLoZ7KEg8lQf5JmsfEUOmiIbu47LoB18jET0Zcw96dt7s
	 2Z35AOyitp5nQ==
Date: Tue, 22 Aug 2023 18:05:19 +0100
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
Subject: Re: [PATCH v4 21/36] arm64/mm: Implement map_shadow_stack()
Message-ID: <007e1239-1258-4b89-b5db-a1c505e7aff5@sirena.org.uk>
References: <20230807-arm64-gcs-v4-0-68cfa37f9069@kernel.org>
 <20230807-arm64-gcs-v4-21-68cfa37f9069@kernel.org>
 <ZNZkADhSnodXuH5F@arm.com>
 <9c722954-8f30-425e-a0a4-6edad463620f@sirena.org.uk>
 <ZOTlBpAbSX6TSZzW@arm.com>
MIME-Version: 1.0
In-Reply-To: <ZOTlBpAbSX6TSZzW@arm.com>
X-Cookie: MIT:
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_100530_263967_D36A4A09 
X-CRM114-Status: GOOD (  13.93  )
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
Content-Type: multipart/mixed; boundary="===============8456130560954540842=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8456130560954540842==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="exkeVuAAvGvWqCpS"
Content-Disposition: inline


--exkeVuAAvGvWqCpS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 22, 2023 at 05:40:38PM +0100, Catalin Marinas wrote:
> On Fri, Aug 18, 2023 at 06:08:52PM +0100, Mark Brown wrote:

> > mprotect() uses arch_validate_flags() which we're already having cover
> > this so it's already covered.

> I searched the patches and there's no change to the arm64
> arch_validate_flags(). Maybe I missed it.

It's in v5, the update to arch_validate_flags() was one of your comments
=66rom another patch in the series.

--exkeVuAAvGvWqCpS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTk6s4ACgkQJNaLcl1U
h9DssAf9EW4nFH7RlADvE4EkIEjYj6kUziCf6Hh2iZGyNLK3aFRxnL1nY1u1zP6j
q/ACfgdD1+OLEnvbezfXu1bJ6avmKqmnJHnkP7zF5C/63tXoF8IUUwodZXV4d3DP
54ezvT4yQ8Yu5AxpmLPCItJkHbeLAezr41EbEpcJWSfkAnXqhT/cO7JREhVKH/3f
czlWXKNy8c+vwIXC7x7mRKOCeBcJ4mofi6i5T8JDYcL1b59ItFYO7zfcB1H/nPh7
qV10AxG61aXsJoiboml1UjyOA8+ZaiLpjgGmxZ1YEZSF3C+TVw2Ul5Z4yHtgdVdA
FQHfQawXdzOTgnqQG2uCel7CjV9LDQ==
=ME24
-----END PGP SIGNATURE-----

--exkeVuAAvGvWqCpS--


--===============8456130560954540842==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8456130560954540842==--

