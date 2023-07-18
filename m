Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E042AEB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 06:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hHn6UpjX4wj74BLwJjfsFjARUb91t7xHQ8P068fXjdU=; b=BUI/bYmSmnTcR/c2dnnXTK1rds
	woPrQcAnasZuihDXcw/BD17Y7SFFqXaR4AGBa4uRkXYPXYofd3/aTgaNcRFZ2R+opQbIDya7IJIbt
	fDGkWLBanz0A0rv2ch0pzbJj32qfz2aLei5Zy7oJ4gpkmJG04Xj4K6hJD0xVhJmhIHXx80PFpfFzq
	NKS7ZKNmdNW56g1y17Sg/lvAnhp6YbpR5SMWsrlIW88TAVtebgYDPXoM3NK1Xkz7ot5pxhmMsPKsz
	UEixstUmaH7d4VbiMJEw8+3R5d2xIkKbaXni653OWnpymflxREvMpwkXUZDYub7jYBGn2uDGTbe2M
	iyOzwZXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0SJ-005cVb-26;
	Wed, 19 Jul 2023 06:14:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0SH-005cTi-0F;
	Wed, 19 Jul 2023 06:14:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=PZl5xS2ZEgKitVAhbTziAY9yd65wr7KBf1Y7WJY8ufI=; b=hwxd6uHod1k66nSHXPaZQ8UL24
	xsKCZ8h3XNChRdYx6ZLl9Kz7OPbWfp6FjPiaHSEaPAb2WBTncSqhfPrGJj/kXAIMN2Z+yy+M7CzHI
	Z5zEb5nORoBxCaA4x+E8VvALrzryZs/09B35kG8aCPz35EwsnQI3xnhR75EzzPFjc1SOjBVHuKqPI
	D/rd8nHgCAIslYVOneUHqNp7lvfD7D5CqOYI6Fq+cRNRJYdpEQGe/ITN62GrZ9UooiKN6YcQUuAbE
	TIEOHpTVJUwoZzcZAL+VD1Ha4oknJmZ6PRhLwAU5bBUyP8pbjqV2OPI4vltyMzUf3hjdYQS9LLNW0
	XIHl6ufQ==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLlBE-00BbKO-1K;
	Tue, 18 Jul 2023 13:55:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7DCB26155F;
	Tue, 18 Jul 2023 13:55:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02EA5C433C9;
	Tue, 18 Jul 2023 13:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689688516;
	bh=5cdUcj3owivIzjkoYFboWBgivdYgnl4YnwjpKC2t3BI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PtR8XdBBq0j87nz3sJHETW4D6X3f2Tw6KWKHbxPNms4FvpYGnrt2l58e/Z8WBzFx8
	 DNt7RnrhN9stbBvq7544R7uMV9bNARXYL2LzHWsxyUCXhSUls0hei52w+8lpyVYXEF
	 oE0/i31Y4939oPjN9aTDQI4FKyPOk1ZD076TUNRcFyUcYM5C9vJhxI9IAU62Cp3ajx
	 ceAvvBb1KCSF6tMCgvYVDzGSXRKqUbLK/GHALFOskbqze63JjCHM7k7ISPAUBuKDL1
	 ubHorZl4nwKmhBbpynhLbHAcK7JRTB3Y8SwVpcNBgRMSrK1qobreFnLxfW/4nbbMkZ
	 yEL/pX8hpPQOw==
Date: Tue, 18 Jul 2023 14:55:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Szabolcs Nagy <Szabolcs.Nagy@arm.com>
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
	"H.J. Lu" <hjl.tools@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 22/35] arm64/mm: Implement map_shadow_stack()
Message-ID: <8ea03eda-e630-40c5-acc1-a63f5c5b3102@sirena.org.uk>
References: <20230716-arm64-gcs-v1-0-bf567f93bba6@kernel.org>
 <20230716-arm64-gcs-v1-22-bf567f93bba6@kernel.org>
 <ZLZW7Kvg2Rep8ySO@arm.com>
MIME-Version: 1.0
In-Reply-To: <ZLZW7Kvg2Rep8ySO@arm.com>
X-Cookie: Nothing happens.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_145557_521157_7B0636E3 
X-CRM114-Status: GOOD (  15.21  )
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
Content-Type: multipart/mixed; boundary="===============5474468945650059282=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5474468945650059282==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Y5hKtc1qLwv4bVDN"
Content-Disposition: inline


--Y5hKtc1qLwv4bVDN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 18, 2023 at 10:10:04AM +0100, Szabolcs Nagy wrote:

>   uint64_t *p = map_shadow_stack(0, N*8, 0);

> i'd expect p[N-1] to be the end token and p[N-2] to be the cap token,
> not p[PAGE_ALIGN(N*8)/8-2].

Yes, that probably would be more helpful.

> if we allow misalligned size here (and in munmap) then i think it's
> better to not page align.  size%8!=0 || size<16 can be an error.

Honestly I'd be a lot happier to just not allow misalignment but that
raises the issue with binaries randomly not working when moved to a
kernel with a different page size.  I'll have a think but possibly the
safest thing would be requiring a multiple of 4K then rounding up to our
actual page size.

--Y5hKtc1qLwv4bVDN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmS2mbsACgkQJNaLcl1U
h9AzZAf6AmpARgwgG4zNQzt85k9TDh62vFVaeaSCfpyqUZ4UEHeRf0DJ2hib8MGt
aDz/k1E7ReyhGJhez+M19TlHMBHDoj2Fkh4bdOwzcTERDFTgMTGw8FFyyDjAP3fz
TkDlo1EwKyXZnGnkqYbSFozVhOEZm6WVu6kpN62D5Q2jSEkL96f7C3WjXU0UbR3K
X4Ey8EzUPGBf7SmYnOnGaG9+1bnKutkKj7unAMb6rJVFaAP/FTMpof5WI2kW4ngD
nu5z6uyG6x2pFBgA3wTKmlDUEkhLsvfbDMtSwZTyHfDf6ayYVdMkeVkpxqvc+Nag
BDtHeJXm98VwgwHiGPA6ln6uOvDbOQ==
=EMfO
-----END PGP SIGNATURE-----

--Y5hKtc1qLwv4bVDN--


--===============5474468945650059282==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5474468945650059282==--

