Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26FC8E81DEC
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Oct 2023 12:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yuag/QZao8myLNpQiY5d5M/wSXRqBcMs0gt/vPb+wl8=; b=hohfvWYlwcBRZ/B3CiO1b0ERgn
	o+3l089FAgSBbDOJFRQjolkHOfOkh4rdnXrRaGIC1oOJjjuRa7Aavv2+Sv7zp//F8ZNysINtZqx/p
	yCS7SamoDoCRCgikhFbhVBisZrwP6MIHt3gZ87OBxQdlMoI8XHNKWPAttukbianI2yypnVsEMAJP1
	OuOUSbrAWhz0ugQdKqDO5QABCmqYJb4k6PZBEauILYDvi8nxB2oEbegGWZzDbq8uXW8uUnkIio1jw
	EW3+WY/SvjhbIlNfgiw5/4ZugPJgioF+W6B9DzjdoskXF1W2AkaAYVnpwfpcr7KGgkATMpL1cZ+5x
	D78rPIdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qojlc-005lBX-0u;
	Fri, 06 Oct 2023 12:17:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qojlY-005lA2-1T;
	Fri, 06 Oct 2023 12:17:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9B29361D1C;
	Fri,  6 Oct 2023 12:17:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55541C433C7;
	Fri,  6 Oct 2023 12:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696594630;
	bh=EqGDo44ijwt3PzVq3fJt0gXvMnUdPHnl13/q3Gh+IJA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D6ltmfDmvp/75b1XYAh+EJYFw/UiG6APNmLiR0Md1c9oGsu9Fiy31mMH20KZXQuYw
	 FKgRMGjTR644c3uzTx61Cm80OZQhHhsiyjqVSP+9hqVdDS0OVgHeu/G8tpH/31UT+b
	 0YUh9zl6+KPXMGMBPuckQKhdexTkruFBEKPFFXXQBC/eLNKiLVjlv2VGlAJZHHCa0p
	 lfCcMGqLD5ybTYvxe7rNBO1RZGUbORUTxeQIcTKtggoyf5KQ/ljs9Xi34jkXztew5n
	 5Tr5syleMJi8nkG5skjcn/oaxRzGS0K/pDWsXyFl+a9uj+kpWutmxRROX/rZ7FFEdK
	 fdZspU9mRq+gw==
Date: Fri, 6 Oct 2023 13:17:01 +0100
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
Message-ID: <638a7be5-6662-471d-a3ce-0de0ac768e99@sirena.org.uk>
References: <aaea542c-929c-4c9b-8caa-ca67e0eb9c1e@sirena.org.uk>
 <ZOTnL1SDJWZjHPUW@arm.com>
 <43ec219d-bf20-47b8-a5f8-32bc3b64d487@sirena.org.uk>
 <ZOXa98SqwYPwxzNP@arm.com>
 <ZOYFazB1gYjzDRdA@arm.com>
 <ZRWw7aa3C0LlMPTH@arm.com>
 <38edb5c3-367e-4ab7-8cb7-aa1a5c0e330c@sirena.org.uk>
 <ZRvUxLgMse8QYlGS@arm.com>
 <a7d2fd66-c06b-4033-bca2-4b14afc4904f@sirena.org.uk>
 <ZR7w/mr0xZbpIPc5@arm.com>
MIME-Version: 1.0
In-Reply-To: <ZR7w/mr0xZbpIPc5@arm.com>
X-Cookie: Rome wasn't burnt in a day.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231006_051712_582331_8BD24DB8 
X-CRM114-Status: GOOD (  16.60  )
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
Content-Type: multipart/mixed; boundary="===============6468770921578301968=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6468770921578301968==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fv2LrnWqf0aiVt0H"
Content-Disposition: inline


--fv2LrnWqf0aiVt0H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 05, 2023 at 06:23:10PM +0100, Catalin Marinas wrote:

> It's not just the default size that I dislike (I think the x86
> RLIMIT_STACK or clone3() stack_size is probably good enough) but the
> kernel allocating the shadow stack and inserting it into the user
> address space. The actual thread stack is managed by the user but the
> shadow stack is not (and we don't do this very often). Anyway, I don't
> have a better solution for direct uses of clone() or clone3(), other
> than running those threads with the shadow stack disabled. Not sure
> that's desirable.

Running threads with the shadow stack disabled if they don't explicitly
request it feels like it's asking for trouble - as well as the escape
route from the protection it'd provide I'd expect there to be trouble
for things that do stack pivots, potentially random issues if there's a
mix of ways threads are started.  It's going to be a tradeoff whatever
we do.

--fv2LrnWqf0aiVt0H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUf+rwACgkQJNaLcl1U
h9AHQQf7BUjbkJGRbqVL5lGyELqXE64nUXJxqNVQXzkHQ1ujZqDV/cLF9uojqJh6
yo1MngEonxyKeJjgqupcA6TzR0LGD9KvuzahtnPwSfluLAxLQG5iY2L+sA2Tdwb4
kPqoRiUS0++v1w/Oud9y0kcF6an3/im18MenqLAPGtnHPH+xE3EHipQsrYN53Fos
vsFAhXwuDhqGVonMiS+J1OxVsYZ9cRcVlStwZI0JbcCPGjS/vMUsCiE1j8ERuLYr
ZUNLyxMMQy35iW2uIdk67nRdv03mjTOw9yYr3akjxNW5eJeFrc804fBdZZ7YqrEE
Ju28oLb7xq1zQUOX3lYKlNKWsex4KA==
=iNQp
-----END PGP SIGNATURE-----

--fv2LrnWqf0aiVt0H--


--===============6468770921578301968==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6468770921578301968==--

