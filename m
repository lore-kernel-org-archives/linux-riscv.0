Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71CE9C47DB7
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jan 2024 19:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EIXze+3doaVOhXh42GqyGuXPOQmMrTnz0nk6qsEg130=; b=LpSIqCuc8y+mtSRGA0C0NWtAYB
	/Py1hh3lNbOZCu2XfjZqJ4UxwIqqOx7Az/sXageU04uwoDFCQehsKG5NL6Mnx3NKMhXYXlSvsY0F/
	nPB1Phtg92YjeqeYQc6xtdFtOCpYNvJuRcpgtAyCNj8MvIYa9nZwFGcfaTXzHXBgVTOzG7p22lvbm
	mvS3jTfCWhSyEkA2lJFp7ICQLoI6lXLMYWuq1NEmfVuhrBmfmoVlWW6PzcAKmETHYisNwVL99/XW5
	T0bjzFKkVQg80WCSt+XdXpy5XuD11D5E1WyayTO0Xindb7MK5NylWCQFNN2CgjkMxQrCFj6xApWUS
	yy+bzBFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQYXL-003iUt-1e;
	Thu, 18 Jan 2024 19:58:51 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQYXI-003iSn-2G;
	Thu, 18 Jan 2024 19:58:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6CFCACE1C67;
	Thu, 18 Jan 2024 19:58:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50BF7C433C7;
	Thu, 18 Jan 2024 19:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705607921;
	bh=dg8AYukbRIwcDM7XMhA2eAX0Vj/41D/3o41gR6bxNzE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kOcnPxyTNJLXDXVOtyj99VAsOk5s0Rmh83NR1a9NOgU/OF5FOi72j3zLwSt210Nus
	 Dj4P0dm5hTDZcazYWhWxYczQmqtNTEG43VEDdUXGPSaqLmzmR97NTuw8YTekBMF+OI
	 ldipeDxBaXKpzY0ZaRVwUQbY/pusnuaIPwFnT8vd0t+Q4pG8AH3CLYak4Z4vUn0Ub/
	 MDDl+enUsNxWgtsRxya+NNhRr7KdNGzGlzh7twIgvuG8k/M7SgqKtOQoy/Bk96yx28
	 VpimFp2KEjfb1RkRd3mdE37KHbO4bTVMjTmEalTGSdvHcEBV3FsSLG7BuKppdoTIIP
	 riNFJwlivNLUg==
Date: Thu, 18 Jan 2024 19:58:32 +0000
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
Subject: Re: [PATCH v7 34/39] kselftest/arm64: Add a GCS test program built
 with the system libc
Message-ID: <d5c8b071-dd68-4e5c-b0ba-10c5fdc0c730@sirena.org.uk>
References: <20231122-arm64-gcs-v7-0-201c483bd775@kernel.org>
 <20231122-arm64-gcs-v7-34-201c483bd775@kernel.org>
 <875y1089i4.fsf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <875y1089i4.fsf@linaro.org>
X-Cookie: FEELINGS are cascading over me!!!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240118_115848_934756_876A6212 
X-CRM114-Status: GOOD (  12.69  )
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
Content-Type: multipart/mixed; boundary="===============1358557154759175234=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1358557154759175234==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="J0lYyRO8meje2xTl"
Content-Disposition: inline


--J0lYyRO8meje2xTl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 14, 2023 at 11:50:11PM -0300, Thiago Jung Bauermann wrote:

> If I swap process_vm_readv() and process_vm_writev(), then the read
> succeeds but the write fails:

The writes are intended to fail, for security reasons we explicitly
block this API for GCS pages.  Given that process_vm_writev() is only
available with similar permissions to ptrace() which does not have these
restrictions this on first consideration feels like something that we
should allow but it feels out of scope for this already very large
series to do so so I'll fix the test.

--J0lYyRO8meje2xTl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmWpgucACgkQJNaLcl1U
h9CYvgf5AXvQCEOJft2rRvx77RKKR6OcqHq1nMW9gq0PedqzL0bOOJ8VUxLbblGi
ODi9eMUiTzx/e+/d8/7JXSG4dg6mZmDLRZlgKYdl0wYK+D4AL1jb8Xm3KRcZPTYj
9wXpkwLj3R/4slPoom0idK/+g7BmgwhhGKsmDPh279p1vXn4F3GdbFvta3KvvKB4
f8jmwIVrllAaAXZsmg2eIvTd/lvna7Oa6C3UrHqN8QYaiokebhB+fvyY5LIRx6oW
a0godJWG2XN83VL3A5Mgnk2v27ewHVAAQ5MeMKBJSYwLQYNyWlh1Y6J0s7jAYmhU
pQqh3jZ7jg6I1WyqsYO12yX1KYXFTw==
=FSEz
-----END PGP SIGNATURE-----

--J0lYyRO8meje2xTl--


--===============1358557154759175234==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1358557154759175234==--

