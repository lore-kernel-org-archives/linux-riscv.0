Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1367FC54798
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Feb 2024 16:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d7PaaQ7fm11syzLb7fcR4morO5yH8ipSVsVy4ICmPhc=; b=t0xw1KfeSkaHwnpWFTrMTwlapa
	1JcxZsYLmvB0z0MMAv3HWIGaxu4Px5aCP+3cuVR5hXd0hRRMPBmcVDk/tAJnkSx3wiOGyMkkW9MZP
	vITL7995X+T2MCbnwctE36yLML+dKP3hzIixXXeFEpheceSmyDcDCEHXbMLf4rd2jnk6koB1EjTLR
	XS7n+4qIZ6oDXnWD2w9bjOc2RSBGzdjog0tBlX0+9I5oDwzQ8KXrziMt9+2J0tN62BlMbUGEEkU2Z
	Ory9SO1BAbkvhDcD/ib0W/UoVJ7wahcCfjbMvyz+AEyCFRdTcKNcTXqrDc3kwXiitC0KmRQ4b3m8T
	jqJJXi8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rf06G-00000005vmx-3rq4;
	Tue, 27 Feb 2024 16:14:36 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rf06D-00000005vkn-29EI;
	Tue, 27 Feb 2024 16:14:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4DA14CE1776;
	Tue, 27 Feb 2024 16:14:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88E15C433C7;
	Tue, 27 Feb 2024 16:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709050469;
	bh=Z0zdHdGOC4SxL9F4fOxTZqBNKee6nTHQxhkxmuHIUy0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bu6/7a9p0+arHtaKXxCctuJK9G25JMzbW0pwbRP43HOmbuMNqCWXbIHivT+3SBYMZ
	 9Z4ouUH+AyfxbDMLHdHU7+7mkkDnVNyGnBHUcB+ZwwNRmRP51FhkAYq5CKL3UTbmoE
	 DB+xHeddLTXOtf9IKAqE0dvA/4PIWfU3ueNrn5DlO8HzLcOUtj8WjCcyUj6BNlb/xU
	 QbrcoC9cCuJ2bgEi1WNIcoMF7bSZ/e2/IG9KnSFMFnxBa2xeCX2bgrZGyUBPqxS/BC
	 mTscCuzUtLrJRJPe3S4yN50sSOYiYXLMTnAeH9A8fHrDV4npTQ3Xx1CJbJABG24CJK
	 KMCdpzNDk0URw==
Date: Tue, 27 Feb 2024 16:14:20 +0000
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
Subject: Re: [PATCH v8 33/38] kselftest/arm64: Add a GCS test program built
 with the system libc
Message-ID: <4adb0c7e-34a1-4c50-b011-6e31ef8813a7@sirena.org.uk>
References: <20240203-arm64-gcs-v8-0-c9fec77673ef@kernel.org>
 <20240203-arm64-gcs-v8-33-c9fec77673ef@kernel.org>
 <87sf1n7uea.fsf@linaro.org>
 <9b899b4e-7410-4c3b-967b-7794dac742e4@sirena.org.uk>
 <87ttlzsyro.fsf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <87ttlzsyro.fsf@linaro.org>
X-Cookie: Please go away.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_081434_012277_40AA275C 
X-CRM114-Status: GOOD (  12.22  )
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
Content-Type: multipart/mixed; boundary="===============6733681840124202984=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6733681840124202984==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4XK/IPqd7iEUtIhJ"
Content-Disposition: inline


--4XK/IPqd7iEUtIhJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 22, 2024 at 11:24:59PM -0300, Thiago Jung Bauermann wrote:
> Mark Brown <broonie@kernel.org> writes:

> My rootfs is Ubuntu 22.04.3. In case it's useful, my kernel config is
> here:

> https://people.linaro.org/~thiago.bauermann/gcs/config-v6.8.0-rc2

Does using defconfig make a difference for you?

> Here are some firmware versions from early boot:

These are (as you'd expect) the same.

> It looks like our main differences are the kernel config and the distro.

Indeed.

--4XK/IPqd7iEUtIhJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXeClsACgkQJNaLcl1U
h9BabAf/cpgfEVM3rUB3E+ztSqzGFbC8vSFUf7Y8lhyyC2yCzJVvWROYle2Au1N4
JRDVph/nZGsbGjyJOWDudsQ8IfPw6m95s+21HkGPq7WI+97Y7gxQtf93zeMPr7Pd
HWCr3QDaCFB+Fi6cdhukIJ+Q0HmaQExEt5Enpg5/ntl1oqafk6GiF5f2Ltzno+UG
dWc07BNatMpKKSMict51j5K1n0Penjgc4B99WpRG3Vj5ErhBDRKjmTwTNW7qfRdE
zxAHyE1N+Q4QSsXeQUXtsLMPP1ieXKLPbf5FwcaKIZMuOS03xP5kKJZ3jmn/DOVq
V4ZcQAzA+dxVvH8SWCA8MFdxHym1mQ==
=vAyG
-----END PGP SIGNATURE-----

--4XK/IPqd7iEUtIhJ--


--===============6733681840124202984==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6733681840124202984==--

