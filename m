Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F83DC001DB
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Aug 2023 11:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EtEueGvINu3+v5mwR6T1TEOaEkrhvvsn9+ixXEExRts=; b=nsIRz4pfh17xXa7LYzOxQPZBkH
	WZkmcldP2AsNY/yROoGW0gx8T+AppEkexGn0ksr7Pfu/pp8nMfBuI5ut5bAodzX2D/it2c/b93I+I
	0toYrQLxmyHBy5ZddCzvsqq7W3e/tfqA/AQVgubJRvkPsq/MDQRQwMhRNRBMrlXQbAEFQiegyDdF6
	N4xKJb29ZUP8VVxQOjaPSiwPGiKCBW889pkWsSnm+GmY54wBqobmOP3CvReBjnqXVORlxb76dL1Q0
	WtArOzxLi2ltXXwPFogRsxyT7XasRZRYvyr1MIgZUXYW8cNUA1rvHecaYXy9jwgNIO+/KWuvhr/cq
	62ZwHJGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU42b-007ULq-2Z;
	Thu, 10 Aug 2023 11:41:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qU42Z-007UJt-0Y;
	Thu, 10 Aug 2023 11:41:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 822E56414B;
	Thu, 10 Aug 2023 11:41:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3391FC433C9;
	Thu, 10 Aug 2023 11:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691667677;
	bh=SjY6cOlS50SecqcUH+vtDGVI75FsC2Isz7CGfrRn3Vg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YBTItZUv0G89tFiv0O0B8TEhjWNjnoNEmZi8nt6DuvO/scAwoxRs7XA6BiURuHLnb
	 4Aq2cDA2bbWglZvwEXyOfnCjN38AzLwQwsZN4mG6gfoGXUaFw0f/4i09YWO4gcWvo9
	 ooMH/iYINXNk9s5xHIZ/l8yPA4RolpVcnCfTpJUEFbuMe7IwbvQa/cAOEn0/WIwLxX
	 Jma2PMvPtsFsaIMl7jjQYY0kzKwqaua6ViLBFNC+1zlvZ81ZtUeCKnh7WBGsyWT0AJ
	 0q7MPoQEpgwIXfUQ8+CODBM5Jhp17HRovOb1/sPzqGLFa82MDNsHsLUj71MptXKTqp
	 kA8rBQ2dsmgng==
Date: Thu, 10 Aug 2023 12:41:09 +0100
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
Subject: Re: [PATCH v4 03/36] arm64/gcs: Document the ABI for Guarded Control
 Stacks
Message-ID: <4e215e53-c7d1-4338-8df9-3f9bf783ced9@sirena.org.uk>
References: <20230807-arm64-gcs-v4-0-68cfa37f9069@kernel.org>
 <20230807-arm64-gcs-v4-3-68cfa37f9069@kernel.org>
 <ZNOhjrYleGBR6Pbs@arm.com>
 <f4cec4b3-c386-4873-aa1d-90528e062f2a@sirena.org.uk>
 <ZNSmFmYFHDw3NvvP@arm.com>
MIME-Version: 1.0
In-Reply-To: <ZNSmFmYFHDw3NvvP@arm.com>
X-Cookie: Reunite Gondwondaland!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_044119_300057_53F58089 
X-CRM114-Status: GOOD (  15.52  )
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
Content-Type: multipart/mixed; boundary="===============1394215633794159361=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1394215633794159361==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HX3zqelcmaABHbLq"
Content-Disposition: inline


--HX3zqelcmaABHbLq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 10, 2023 at 09:55:50AM +0100, Szabolcs Nagy wrote:
> The 08/09/2023 16:34, Mark Brown wrote:

> > It's actually based on bitrot that I'd initially chosen a smaller value
> > since it's likely that functions will push at least something as you
> > suggest, the patches now just use RLIMIT_STACK.  I'll fix.

> the pcs requires 16byte aligned stack frames, with 8byte per gcs entry
> there is no need for same gcs size as stack size in userspace.

I agree that it's going to be excessive for pretty much all
applications, I adjusted it to match x86 as part of the general effort
to avoid divergence and because I was a bit concerned about non-PCS
cases (eg, JITed code) potentially running into trouble, especially with
smaller stack limits.  It's not an issue I have super strong opinions on
though, as you can see I had implemented it both ways at various times.

--HX3zqelcmaABHbLq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTUzNQACgkQJNaLcl1U
h9CX2Af/ZivuFjFTpJA8oad5auH8pxkhXVEAIPD0ff/7T6abVR9+lSwBwNj9fu7u
QzV10fINsZecsGZed5ZdpIR3HeeSZW2rAVaF2fIu1u7L6gXy0UwG1jPkOB21G4Ca
LApqqi+p4OfTtZtySK1optntQ4+DJRFrhFESNYwt/UyKffuB9bbr5xaIB/23ghe+
ZLmOWBXMpL4NaZMPdi9Tm43gAvVlDnXsANCWTZfq0uRGZBJBggQIM7Mwrz9JwmVy
3633R9GviRxPWQm83UqZI7n51wspiOfjdhYYtsqqo7jYwawpnfb4Jj89/3j6QmJO
WdrDN78D2wpFLApdojZDDftk6sXHkg==
=m3b4
-----END PGP SIGNATURE-----

--HX3zqelcmaABHbLq--


--===============1394215633794159361==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1394215633794159361==--

