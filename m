Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E54AC3DA4A
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Aug 2024 16:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oQnWvSnSQWzTX0QuR4jdgluVNGsg9jgooncnBvEPCck=; b=q1i0AgqaeG16eA8USNBrt0BbII
	10f0oHKWOU9gHlhvjeWz7mse7WPp0HwDFBDOZeZXuCfFFSasAFOHsfUm8xwhSan882f+p1gamJB6p
	rDjmLBf0ZBLLS0nesNwMONj0TKIbtfGbAYXZAyNrz8qRCzqCMK6zuz+8Fr8hGR93yT/89y73V0fN3
	CLAxYkCH/iwlBaTurhmGyqGQodNOBv+gwbuyDWjXea9PhSBumPoCLDHoXTMCQrSeX7sgR5Vn3Y6c7
	XweuwOllVZM7L/dfYHbTmiqdK3+Lc5KAUnlPOxcTKFkyUKNiVN+ynx2wgTH4/GNelOxJay0bxK51k
	9q8A3yJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shAjN-0000000Dbx2-2EwC;
	Thu, 22 Aug 2024 16:32:13 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shAic-0000000DblR-0Pic;
	Thu, 22 Aug 2024 16:31:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 08F14CE1009;
	Thu, 22 Aug 2024 16:31:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE19BC32782;
	Thu, 22 Aug 2024 16:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724344281;
	bh=VUg12QjX/BWOxsree9EbeHZn9D5q4/HlKniQvKwsUbU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F2sb31TT5g+PjzoVukTl5h2JEC2kDVdeg7nBVbMScaaOxvPYuZaHoYkcfKlUrUN6P
	 AsOCA9l6P8infkmm70iBiMvW5dIOERWTQ8DWgNjEJ1ThbqA6Fv7I1JwDLV62zQTukR
	 uIUy7TwBZwgBqDx4i5WNaOdUnD5Ns5bWM3tkoJsQxPJn+hwFrG1SCONKmCCEv46TzE
	 fs6z5etBnMVissxaHq0/baQA6bOcLp3UsqAnuPSFdRIY8bItuV+mwfw3Wdd9CpGsq2
	 yFY4RK6kS2DDKBKyuZ2JhCcjro00ziexgiXQX3Afzbgxj66BCLhebdtOhVlwV3XTrI
	 yyU+GaGQKLbuQ==
Date: Thu, 22 Aug 2024 17:31:17 +0100
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
	Shuah Khan <shuah@kernel.org>,
	"Rick P. Edgecombe" <rick.p.edgecombe@intel.com>,
	Deepak Gupta <debug@rivosinc.com>, Ard Biesheuvel <ardb@kernel.org>,
	Szabolcs Nagy <Szabolcs.Nagy@arm.com>, Kees Cook <kees@kernel.org>,
	"H.J. Lu" <hjl.tools@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Florian Weimer <fweimer@redhat.com>,
	Christian Brauner <brauner@kernel.org>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	Ross Burton <ross.burton@arm.com>,
	Yury Khrustalev <yury.khrustalev@arm.com>,
	Wilco Dijkstra <wilco.dijkstra@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v11 18/39] arm64/traps: Handle GCS exceptions
Message-ID: <Zsdn1SC_Ajrc3-GJ@finisterre.sirena.org.uk>
References: <20240822-arm64-gcs-v11-0-41b81947ecb5@kernel.org>
 <20240822-arm64-gcs-v11-18-41b81947ecb5@kernel.org>
 <ZsdczGTaMgZnEaDy@arm.com>
MIME-Version: 1.0
In-Reply-To: <ZsdczGTaMgZnEaDy@arm.com>
X-Cookie: Your love life will be... interesting.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240822_093126_494792_B44AFCD1 
X-CRM114-Status: GOOD (  13.05  )
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
Content-Type: multipart/mixed; boundary="===============3244973446691542270=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3244973446691542270==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ewesK6QkmZD/wpzC"
Content-Disposition: inline


--ewesK6QkmZD/wpzC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 22, 2024 at 04:44:12PM +0100, Catalin Marinas wrote:
> On Thu, Aug 22, 2024 at 02:15:21AM +0100, Mark Brown wrote:

> > +void do_el0_gcs(struct pt_regs *regs, unsigned long esr)
> > +{
> > +	force_signal_inject(SIGSEGV, SEGV_CPERR, regs->pc, 0);
> > +}

> Just double checking: a GCSPOPM (for example, it can be a RET) from a
> non-GCS page would generate a classic permission fault with ISS2.GCS set
> rather than a GCS exception. That's my reading from the Arm ARM
> pseudocode, the text isn't clear to me.

Yes, we only generate GCS exceptions on checking values that have
successfully been loaded from memory or other GCS logic errors - memory
accesses generate data aborts.

--ewesK6QkmZD/wpzC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbHZ9UACgkQJNaLcl1U
h9D9lQf/RHcsNQy/AveAnVZZzgRTxMTttaUD1tUEFeexMusqT2Ar0MqopzgIKpam
lu4zjPI6W5uKaH9xBTV9Rpx//q9HIzraNH4NL9kJNl4NiY+04Y2QMew5hXyC4Qlb
bRkNLFpOdr3kWhYEizRFaoZoT/A3mk/Hml4UOB8SVQmGkXmizkEPy+z48sUlWHfQ
VsDqfKBBnFOkIz5rYVMZP9g/Q6uYE5meFpo/sTWSP9X8S9XUL4GOLpassoZA6vPq
quUdPJfme+jeZI0gN9Rpuktzc6etbvVb5I/pf71dk+Zqr/hbgAaa+gmdQQsOpYdU
K9DAZ5xndPmiuX7YI36ktz2o2+0STQ==
=iVqg
-----END PGP SIGNATURE-----

--ewesK6QkmZD/wpzC--


--===============3244973446691542270==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3244973446691542270==--

