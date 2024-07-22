Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94F0BC3DA59
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jul 2024 14:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jnpqf/p449eDwRW03uIG+tq5da/eT77cVjTz+6BCHIg=; b=UnWfJnwNuJ0rGSQaRau1p4wCjJ
	MSxXsY2yz7GoLptVPIR+miC36FqwWyMxrdnJPN4dOH83/pTSDxB43q5t1i2NbTCUk+v0tunkzJgiS
	aApXziMmRpmpU09V64jyWcxk7pbvDjRc4biwpIUVTEQzr9eVUSILdRUDYpK43cHbdXI8AphtA/UNh
	OXqdT0ousdeYNSz5rqeB744KxD3yMqxCjFuT4d7HHp0Rhv9Km4Nts3Csm9MFf81l0qFHdulMoDLVr
	Uv5eCw3ISAtDHIuZZmhv5PTxX5iu14TFYCYGYxZ+0o4Yvgu0Cz2811mcVeqJRbDmhgdtGLJrfXNxp
	Pr5lmgdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVu4z-00000009nUR-3gjW;
	Mon, 22 Jul 2024 14:31:57 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVu4c-00000009nLE-1B6p;
	Mon, 22 Jul 2024 14:31:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A8B0860AC1;
	Mon, 22 Jul 2024 14:31:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6A25C4AF0B;
	Mon, 22 Jul 2024 14:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721658693;
	bh=19lbAMuG8/46S2vgOQ57EZ7eAEiw5QZgfuSPqQZDrsA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rjmEXCNDKBFkXhGlJsIiF/YiOAsxKiiVQ1yy0ea0mM7am81QSF76gClDv9enAtAlY
	 k5zMblh91dP2iCOQWwD6UXBINMw2SURV0D5VkPmSTcCj+7qrLkiTc9H5X2ZXYxh7QX
	 /ztn3FxVCqDdZwqpFFWuHB/egHyBWfmfrmpKrYkCGpLDHUdnmnfjb/anl9IGvbPEnH
	 XugwdYQn62/PfBmN2Sx/MlckvPbNVxoeQqCGdrWIx9EJAnA97fRcl1FAgUYZvFPWh/
	 St8tz1MT7X7blLPvAvrsbs+/p6oIUcWDkcQJuST7wIJtoLExPii3xtAVeQFrVH08LG
	 pTi8SManLPJQA==
Date: Mon, 22 Jul 2024 15:31:24 +0100
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
	Ross Burton <ross.burton@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v9 38/39] kselftest/arm64: Add a GCS stress test
Message-ID: <19c8a2eb-1c52-43aa-a329-3dc245c966e6@sirena.org.uk>
References: <20240625-arm64-gcs-v9-0-0f634469b8f0@kernel.org>
 <20240625-arm64-gcs-v9-38-0f634469b8f0@kernel.org>
 <875xt2xojp.fsf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <875xt2xojp.fsf@linaro.org>
X-Cookie: Everything you know is wrong!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240722_073134_388169_7D19D3BA 
X-CRM114-Status: UNSURE (   9.31  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============6154067986244066556=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6154067986244066556==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fZmP/tHPENLmAEIV"
Content-Disposition: inline


--fZmP/tHPENLmAEIV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 18, 2024 at 08:34:18PM -0300, Thiago Jung Bauermann wrote:
> Mark Brown <broonie@kernel.org> writes:

> # # Waiting for 9 children
> # # Thread-4030: Failed to enable GCS
> # # Thread-4031: Failed to enable GCS

This is already fixed locally, just rebasing bitrot.

--fZmP/tHPENLmAEIV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmaebTsACgkQJNaLcl1U
h9A1BAf/U0ze5vCUOiRu38u3xvKe2wO4c/NxU38BnN6U5lriKaPwnoC8WAtlYPBJ
67+s8YadLJLRgDMtuUHW85HuikmcDmVUs5SUM7HwwVd6qMVx9FYmMls8aA9Powqn
u0Y4vFhfQwlvL0aSBnYPBF2vjCXMYzN8EVHJaJhPJlB5HsZstADQQM77apbd9U2V
BD0gJukw9LhNPPTmNyuuBnF9jXXCAUXEpEosdsWYl4f6+msBc5abKIt1agzRJhFE
yYalLzSD/wqZOZGLXf/Cx/DzdJLC8/ahN8cI5MqCUDDQFLFnhV/vS2yld0/Cu0sw
qwhjMxP9NPq+uiruBXIU7nGO40rudg==
=Kw0J
-----END PGP SIGNATURE-----

--fZmP/tHPENLmAEIV--


--===============6154067986244066556==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6154067986244066556==--

