Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4810CC001B0
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Aug 2023 23:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ND544ck6o4L6FmpCnv4Eqb5nVqy2ceLOyHiPm3JfxVI=; b=QwdGuvrP1V1UT6DOeQRrTO5JWf
	ooKjdxLRH0aaoK52EeiLfjskkBoc0fsvVSl0m6FPftPkKFehFBYvbyNYD48ieJOkV+HYG8+Nf8Tr3
	mUJgEiHFzoeCBqvq1nO8ndxV0U17dO+JRLaD0JRG0weLKFcALLfZWKxxExUmkj7QtN2yBUcaaIbSQ
	IrdDV8+wajvqZ/bgAreIO/BO/2rrszA5hJ1tupVWgcuBkUy57+C7mZkWThoG01hx7DAE/aD2fSwbb
	P24ZaPgfUhlpQLwfgh65YSHCqn3chduBtyzijVD1CFQj8wLD8yIgOG6J8V3ttND2fpLIIrD2bQ33N
	uusQhgYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qW3Ma-002nQp-2n;
	Tue, 15 Aug 2023 23:22:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qW3MO-002nOg-0Z;
	Tue, 15 Aug 2023 23:22:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A9453618CD;
	Tue, 15 Aug 2023 23:21:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10725C433C7;
	Tue, 15 Aug 2023 23:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692141719;
	bh=reNBqXvvCRZMEH5t3EgVMW5ozRlNJXzgVYKKybLu7+g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tgYMWvchg/ZUqerIoW+zuO2xrgHp1FjGhIDZf0F7H37BKlHJkiszeodbSFqj3PnGp
	 f2uzSQKMyEbBKULD8jUYoWdw+ho2gUgqSPoCpiRRthF97i2hw0AwvOvxRHsnoMNSWD
	 gttYLq9bj0BRRJjSljAXyHOfxgy/c0FWZkAugtCSLC0HoJVzRQ6itwmObiMg7S3MLp
	 eLTfOBH3K1elFZpgkk9Fi0gRg+xjIRhvBg9Be+iT1N4YlVOZfGuGiWElQwXi9Y4FXf
	 FmuAbbOC05PmLzx2GVJ9olOkny6MKI0EpIV4w8sjVE8FBzZs45FzNtmCLwuIp0+0j3
	 XjZluhZGnyksA==
Date: Wed, 16 Aug 2023 00:21:49 +0100
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
Subject: Re: [PATCH v4 09/36] arm64/mm: Allocate PIE slots for EL0 guarded
 control stack
Message-ID: <74cb7458-cdf9-4e7d-972a-3dc81e92ec22@sirena.org.uk>
References: <20230807-arm64-gcs-v4-0-68cfa37f9069@kernel.org>
 <20230807-arm64-gcs-v4-9-68cfa37f9069@kernel.org>
 <ZNZEUEqJuHrdEa/c@arm.com>
MIME-Version: 1.0
In-Reply-To: <ZNZEUEqJuHrdEa/c@arm.com>
X-Cookie: Darth Vader sleeps with a Teddywookie.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230815_162200_316668_B4E8E283 
X-CRM114-Status: GOOD (  20.68  )
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
Content-Type: multipart/mixed; boundary="===============6530768468391111691=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6530768468391111691==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RanKLfAULhx4GKnc"
Content-Disposition: inline


--RanKLfAULhx4GKnc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 11, 2023 at 03:23:12PM +0100, Catalin Marinas wrote:

> >  #define PIE_E1	( \
> > +	PIRx_ELx_PERM(pte_pi_index(_PAGE_GCS),           PIE_RW)      | \
> > +	PIRx_ELx_PERM(pte_pi_index(_PAGE_GCS_RO),        PIE_R)      | \

> Had some thoughts on this. Why do we need the EL1 GCS attributes to map
> to RW? The instructions we'd use to write the shadow stack are the GCS
> 'T' variants that run as user already.

> The only instructions we have in the kernel that would run as EL1 on a
> user address are the exclusives (futex code or the old deprecated
> emulation but we don't care about them in this context). So I wonder
> whether the kernel PIE entry could simply be PIE_NONE_O. Would this be
> too restrictive for future uses? Given the coherency between a GCS
> access and a standard data access, we may want to restrict it now until
> we have a use-case.

Good point.  I remember I originally wrote that before I checked into
how things like copying pages for ptrace worked but they don't keep
the GCSness of the page so they're fine.

I don't think we need to worry about future uses since these are slots
reserved for GCS use, if we need a different value later

--RanKLfAULhx4GKnc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTcCI0ACgkQJNaLcl1U
h9DbgQf/R35NwygifYB/vR8xKnzjHMpwxWKaHX9I5Hinl2E99odV20pM/bgJZbux
VbIehF+i+Q/QY+dvRrVAvp4oVfOY4ZFJQRtPrLjGoak9Au980nkR6mlKggF6qd4W
EGfizM1nkmqrTmfm8vHfn/gEDGJ/ZRB9mOzZmvW8U41g6naodsr9S/0ChKLV1ppq
IEwo7oiwLNc9Uz1lklKsyq5852jWL3B07QwDzubwM7CJC2UNLQywl8SMW7We551y
ZtE6twEw91+iq9dcBOKkFi+Oay55UKC4eSrci/08sbb1b4lH5Ta9YoiSEDaCqxXm
cB6WkJJkkCL7RY0qBvEEDSWx1WqolQ==
=XTlC
-----END PGP SIGNATURE-----

--RanKLfAULhx4GKnc--


--===============6530768468391111691==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6530768468391111691==--

