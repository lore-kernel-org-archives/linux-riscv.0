Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84DA3C3DA7F
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Aug 2024 14:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=os2xSno0TxLEL3L/o9ai2X5M229s3IADTexYgCv1bOs=; b=2EQM3kjPv1Orf9hATiMdKZs2i4
	x6+UXUsmbosRmAG2xlWN++DsQCErIJrCNQmSYTBbkUMABes3mYFGwjjJU3/g8doQYcIefurhPUuAp
	8cj5Culhdgceqcpdc3x/DQjhVlG8R9uBL8vaY5zNTGBDnXbOWmdLp0Hky80MWUNSvM1SuGLK0iwJY
	m9CNWTuy7Z2rRVOoOq+11sVg07lugmX9JWMtxYL9Go/EF03x01aK7RuQT/5KWuDGM7KsAGPy8MydU
	WSFSe9Ape4T7vKJWjaeW7cVIw54imiomowNVS8jeH4BhYzDEj2cgXLGN2wpql/XUXkrULfd0M184f
	Ghg3ocCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sebkT-0000000AGaP-3yAB;
	Thu, 15 Aug 2024 14:46:45 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sebjl-0000000AGNk-0Xv3;
	Thu, 15 Aug 2024 14:46:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id AC665CE16CF;
	Thu, 15 Aug 2024 14:45:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3FD2C32786;
	Thu, 15 Aug 2024 14:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723733156;
	bh=2cDt1K6+J5wSrcJZUtuu3LeNVSJEFjKPwrWj5SaKiNA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dkyWvQ4Eab0Mev50PZAJYqogMNDU85sEM8xyDLyMBRLPYfSyYMs4Toxeeac3zKKzR
	 SVYiz0K3D/g5+QdJDJf6nnD7Qy5wegctjwv3PhgGuZQY25B70KrgmCZZodWN80rYG4
	 xgyBL4JRJP0blqHfxeXBdOINIMqtjMPIDiU3EAy528V5A/8EzPPoOqwoWNxSLeqZJ8
	 aTicr1XYnwKnEUqDF1Xrp1mjm2FxzbK2B+hfsEryf1OceDTaZvHybOAYJGaTnae+Hx
	 m3AiyIQyKKbVQsZ8w/6axwsvY9uG8nz5g12owbbscNwaEsUNFWsKTMjQMF5DEvyvSR
	 epH5YoGP75B5A==
Date: Thu, 15 Aug 2024 15:45:45 +0100
From: Mark Brown <broonie@kernel.org>
To: Dave Martin <Dave.Martin@arm.com>
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
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	Ross Burton <ross.burton@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v10 23/40] arm64/signal: Set up and restore the GCS
 context for signal handlers
Message-ID: <c56fa974-88f7-4c1f-83bd-8c481fe0045d@sirena.org.uk>
References: <20240801-arm64-gcs-v10-0-699e2bd2190b@kernel.org>
 <20240801-arm64-gcs-v10-23-699e2bd2190b@kernel.org>
 <ZrzEfg5LqdAzgJ6+@e133380.arm.com>
 <08932f6d-01ef-40e8-97d2-08f0d2016191@sirena.org.uk>
 <Zr4EkmtUKop9o9wu@e133380.arm.com>
MIME-Version: 1.0
In-Reply-To: <Zr4EkmtUKop9o9wu@e133380.arm.com>
X-Cookie: -- Owen Meredith
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240815_074601_374505_F5F8C7E7 
X-CRM114-Status: GOOD (  13.34  )
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
Content-Type: multipart/mixed; boundary="===============2655679648324584888=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2655679648324584888==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3MLeToVkjySp9DbY"
Content-Disposition: inline


--3MLeToVkjySp9DbY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 15, 2024 at 02:37:22PM +0100, Dave Martin wrote:

> Is there a test for taking and returning from a signal on an alternate
> (main) stack, when a shadow stack is in use?  Sounds like something
> that would be good to check if not.

Not specifically for any of the architectures.

--3MLeToVkjySp9DbY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAma+FJkACgkQJNaLcl1U
h9AtQgf9EWahd20jQzZ5Dsh45BuaYqYLMeZdINXFGKq0fNzYErgx+xiHkpfbAaW/
b5F5wBNruWnW5d9ggUOMRlIRUCnVyNAc0dxH2QcmuYYHWZiHecjqNy0YjqvjQSrP
pQtbL9E5+BYHBHUWoMYk6VG/CyhqdfprAA2A3isd9pJwETxQ4ivAstUIL7IkWnSj
pJRVZrtPKkrMzPWhawrH/9/4KYx+6Pvt+MbX3074EcxifcRBuDuD2wvP6Zyp8NpI
/3JNJeUDARpgaYF8ZVZyqqldrLekwUHNqVqSfL8JEkLjkX7j77gzxw+k+WJLFg7f
mjLH7VvkpTbNVNlX4LER8RNMYYNNjg==
=bD/v
-----END PGP SIGNATURE-----

--3MLeToVkjySp9DbY--


--===============2655679648324584888==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2655679648324584888==--

