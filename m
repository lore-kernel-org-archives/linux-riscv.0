Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F052BC48BF8
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Feb 2024 19:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lrwVQBTtHbnSyuLZ0LIVzXW4yW/8THrNwKjSF3oIUrA=; b=F+2Ro3/pnzY13VUxzoAT9Bx8PV
	m2CHIM7eYeeLFZ7hdkAgKrceZIunc+7yD9RKFEhi9OnLRdKpPZ4egkOB3LOHx2qYnmHsxHyDBC/rf
	n5fiUF9yo6oKI8bxVuahUvFbb+4meEIUOEyQqvPCvRr4kY+6LZl6x3uOYgoHWoRloU1oJ0rjdqrP5
	UFOFq0woEfXVjHs9hGoGB+5WuB355U0ypiFOWNQP4eKtZenWCrkMLSi1CA7YJPZmS8pfKd8/eBcZD
	/44qlVoXgtA0WXRKbI80//43aS8RbKzXt7iysVQ3mvFl9lYpiQTj2uE7ojIsvg+07PxsjZ2NScJGz
	Im/AgbPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdETX-00000006Gnk-3V7m;
	Thu, 22 Feb 2024 19:11:19 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdETT-00000006GkR-2v8t;
	Thu, 22 Feb 2024 19:11:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id AD93BCE281D;
	Thu, 22 Feb 2024 19:11:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0452C433C7;
	Thu, 22 Feb 2024 19:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708629073;
	bh=8nrfNIHr+Eb25TRq75f4NF1/J8WEqatyymrtaLx6QLM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qtyLjiQPSFvaJ9M7rV182imqkcwMJbcYO+r+dMGBtOYxSYpBaVnRvNZ11XJBROR9e
	 sFol8k1v+wYlFvUyUBro/7AQx2+kDhj5NNqwRD48ht2iA7YBv6eSnjKNmaHOBzNY49
	 rCeBnV+yiSRZ9mKiMtIIEvMu8x1IIfnswGl/xXqSXqac+W3bzu7M/y7q2JSc3d+Esh
	 ud72RE65wIOLdDAYaE/5y0Ovalrhl4By/n4OFtjms2QwzNoKpCgzpJBTr/WkDAs+28
	 qka5RHZp4Vb35lhxNepvftYRS6jQtzsIH6LXS5xsnjOXHpO0swqcwz1+VYW/6fI51S
	 2PJtnLCwdBOSQ==
Date: Thu, 22 Feb 2024 19:11:04 +0000
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
Message-ID: <9b899b4e-7410-4c3b-967b-7794dac742e4@sirena.org.uk>
References: <20240203-arm64-gcs-v8-0-c9fec77673ef@kernel.org>
 <20240203-arm64-gcs-v8-33-c9fec77673ef@kernel.org>
 <87sf1n7uea.fsf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <87sf1n7uea.fsf@linaro.org>
X-Cookie: I have accepted Provolone into my life!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_111116_104471_7597AB8F 
X-CRM114-Status: GOOD (  14.14  )
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
Content-Type: multipart/mixed; boundary="===============5512172303029038448=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5512172303029038448==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZHq996jFPNViQlH3"
Content-Disposition: inline


--ZHq996jFPNViQlH3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 19, 2024 at 11:15:57PM -0300, Thiago Jung Bauermann wrote:

> The only issue as can be seen above is that the can_call_function test
> is failing. The child is getting a GCS Segmentation fault when returning
> from fork().

> I tried debugging it with GDB, but I don't see what's wrong since the
> address in LR matches the first entry in GCSPR. Here is the
> debug session:

I believe based on prior discussions that you're running this using
shrinkwrap - can you confirm exactly how please, including things like
which firmware configuration you're using?  I'm using current git with

  shrinkwrap run \
        --rtvar KERNEL=arch/arm64/boot/Image \
        --rtvar ROOTFS=${ROOTFS} \
        --rtvar CMDLINE="${CMDLINE}" \
        --overlay=arch/v9.4.yaml ns-edk2.yaml

and a locally built yocto and everything seems perfectly happy.

--ZHq996jFPNViQlH3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXXnEcACgkQJNaLcl1U
h9A9hgf+IJIWILnaAT0TG0s4fwHDFwBgAEwmbr/85IsiE58YLlQn3tHAkAETsExB
EtAk73IgOoaGfvFDcKF9Zq3PjE2iQ3r+Lh1A6/nyUdQBcMaZSES4ioXx5cwwjqFX
m6lWkAiAzHxqFN++5z9gfq4lT3HjZQ3TFVE8y4Ij6vmmOeTIINFEGovAi330xkEZ
prLXALb7+ONnUB3jG7VDY7Gx7HF+jt2Qd9gAz1KNNrBCEJT2fImUVEI1P/15iww7
Xxm2Udbwd52h580B1x1sa7tMEFRi34tvmKx+2HHSgGFQ/a10LFpE4VnsW1vHUzGn
2k8W5X8LkpXaHbgoXUGBMqDMFlKkWw==
=owiX
-----END PGP SIGNATURE-----

--ZHq996jFPNViQlH3--


--===============5512172303029038448==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5512172303029038448==--

