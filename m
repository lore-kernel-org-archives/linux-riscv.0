Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 712F4C48BC4
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Feb 2024 00:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hh/sjB1unkKwvPJliRv8onblvTjbTNWUAjRlcxjc7Yc=; b=muFctAeUbDzJobR7c0GLbyV4Yn
	mcFPjQfixJPQb7D39OaJ+Y4I+if4CnALf5iWjGq9qvFFUxLFe3BI73rrkCJa88ztPmI79oT5dh4Kw
	uAzPmPjz0l44TSt2aY+6qBK+2qbMssc4mZMB0lrpVcW0HhWbSjwUxKryEncPkSJnHcogvkup6FLWm
	GfRF+rU5cLMx8Rwc3pBf9wrzZzRoOyGMEBfQMImo6JmYGPlqlHt4q6RUG6tJjWy61cXUa3ZPaDGYU
	kELzwr26UG9ycx9Vpcy2NwaH3MzE6diZQurtEeKu0HnCDEs3LPAxJs7p03Ec1FizhgPsWzOxjO744
	KQfM1PEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcajM-0000000Gf2C-0KiD;
	Wed, 21 Feb 2024 00:45:00 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcajI-0000000Gezt-1Lnq;
	Wed, 21 Feb 2024 00:44:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C36D2CE1B33;
	Wed, 21 Feb 2024 00:44:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C393C433F1;
	Wed, 21 Feb 2024 00:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708476293;
	bh=RgYHLlEs8Obx/1+1Ex9Dia48d76DvmFNDuLMAR9oXbs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EO1AKxM9atAW5ijESg1UGQbijOEntefJ4W7hvVziFA0UrM4OUrijGVaBzcLEs6wYr
	 OjSIBHChIOgwKca7pXNbM5Cobz19+3leTFG2K/9EVjkOotzvVw0v6ez05ByOvLbcwV
	 +CEf8bXXKN6XhhDI0KQZwE7hmlaMqLtNtNfWohmrOO5PLVL5FNBfFfrfun8qdbWle6
	 BBkj3Iud3EUQQytsOc+psDxTBNOG28HZowRKkkW/VLD4pWv0zXFVJLZNdlQZAg0FeB
	 on/Je8QMYpg2sD3Y5jNv2RyOVaFeGMIIzBve14j+nne6Gk0zkfJUvj0vvAw6pPQKrV
	 0fcsjUUDb1b7Q==
Date: Wed, 21 Feb 2024 00:44:43 +0000
From: Mark Brown <broonie@kernel.org>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "dalias@libc.org" <dalias@libc.org>,
	"linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
	"suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
	"Szabolcs.Nagy@arm.com" <Szabolcs.Nagy@arm.com>,
	"musl@lists.openwall.com" <musl@lists.openwall.com>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"corbet@lwn.net" <corbet@lwn.net>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>,
	"debug@rivosinc.com" <debug@rivosinc.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"shuah@kernel.org" <shuah@kernel.org>,
	"arnd@arndb.de" <arnd@arndb.de>, "maz@kernel.org" <maz@kernel.org>,
	"oleg@redhat.com" <oleg@redhat.com>,
	"fweimer@redhat.com" <fweimer@redhat.com>,
	"keescook@chromium.org" <keescook@chromium.org>,
	"james.morse@arm.com" <james.morse@arm.com>,
	"ebiederm@xmission.com" <ebiederm@xmission.com>,
	"will@kernel.org" <will@kernel.org>,
	"brauner@kernel.org" <brauner@kernel.org>,
	"hjl.tools@gmail.com" <hjl.tools@gmail.com>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"ardb@kernel.org" <ardb@kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"thiago.bauermann@linaro.org" <thiago.bauermann@linaro.org>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"sorear@fastmail.com" <sorear@fastmail.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: [musl] Re: [PATCH v8 00/38] arm64/gcs: Provide support for GCS
 in userspace
Message-ID: <cffc9c7e-ba1c-4894-a455-8b2d687182cd@sirena.org.uk>
References: <20240203-arm64-gcs-v8-0-c9fec77673ef@kernel.org>
 <22a53b78-10d7-4a5a-a01e-b2f3a8c22e94@app.fastmail.com>
 <4c7bdf8fde9cc45174f10b9221fa58ffb450b755.camel@intel.com>
 <20240220185714.GO4163@brightrain.aerifal.cx>
 <9fc9c45ff6e14df80ad023e66ff7a978bd4ec91c.camel@intel.com>
 <20240220235415.GP4163@brightrain.aerifal.cx>
 <a57d6c7eada4b9a7c35addbc8556f5b53a0c3e6f.camel@intel.com>
MIME-Version: 1.0
In-Reply-To: <a57d6c7eada4b9a7c35addbc8556f5b53a0c3e6f.camel@intel.com>
X-Cookie: E = MC ** 2 +- 3db
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_164456_737163_F8E15749 
X-CRM114-Status: GOOD (  13.85  )
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
Content-Type: multipart/mixed; boundary="===============4579058415422023954=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4579058415422023954==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zmCyS0Odp0mOsqor"
Content-Disposition: inline


--zmCyS0Odp0mOsqor
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 21, 2024 at 12:35:48AM +0000, Edgecombe, Rick P wrote:

> doing. But those threads might be using shadow stack instructions
> (INCSSP, RSTORSSP, etc). These are a collection of instructions that
> allow limited control of the SSP. When shadow stack gets disabled,
> these suddenly turn into #UD generating instructions. So any other
> threads executing those instructions when shadow stack got disabled
> would be in for a nasty surprise.

> Glibc's permissive mode (that disables shadow stack when dlopen()ing a
> DSO that doesn't support shadow stack) is quite limited because of
> this. There was a POC for working around it, but I'll stop there for
> now, to not spam you with the details. I'm not sure of arm and risc-v
> details on this specific corner, but for x86.

We have the same issue with disabling GCS causing GCS instructions to
become undefined.

--zmCyS0Odp0mOsqor
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXVR3oACgkQJNaLcl1U
h9BO9Qf/bgPI/9ROkHiV6cP5ag9FVPBuoU4y8o043FWrLxXipYjgLbjIps3r7NYd
VLNWiX+sScsGrwtujlkAC3JYU0QAro+3+MY0cp+MjZopgqrEpOHlREM+dZO4FSB+
BH4GTQgpADdgkbaukCb71Yd8D8HkPkpjvvsEGO6Kv2Bq4kMF6w2sd5O/llI+5BPN
0v1hps6/0VWFICJibmb4hRIRPMjb91mxGQRdpF8OTCgHa0w4UXaTHLttIE3iqCd4
nyeOZPkoIxUv3fYTVZjAqm6emWXXodOaOQrOtjTM1shBFck2DtY+hJJopNkuwE2j
qeuz0TLv83oNLhiCiSUgT5gKjQrvdA==
=VhGm
-----END PGP SIGNATURE-----

--zmCyS0Odp0mOsqor--


--===============4579058415422023954==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4579058415422023954==--

