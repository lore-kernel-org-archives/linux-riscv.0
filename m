Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B14EEC52D6F
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Aug 2024 18:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b0BicK9J2C2RwKBLRwkZVgae7tFs3Lf/ArVSK8rGh28=; b=v/0OE1PYlfPEGPTvwD/JkDiHJg
	K7s+M4EQW8gQTxF/F1V4XOwIHvHOX5IAvcjhao8aaLQ0dzr2Ulpp9ZwvQHBcYpCcQfbwbfEsObrs3
	u8k+pGFwcceK/mtJ1Ja5YIlzAA2NTbWB/iwYF8qzNjUugg7JLJpqILwnGl6HW7DCTOkCoFDG1Ybmy
	o9WAo/f/25chwGrnslulnCAV4OLj0gVtrAfkJjF/O7/Ead6wjs+cEqQJPWFtQkDQ6wmJbLZByF1wZ
	CnVdPHDAh8YFPt8E2LbkvVPObTKXMFF3PcVZLiZKzIO7ieMWBbH271H2VEfnv9iMexYSZCkpYOELQ
	oe1QFGGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgqHb-0000000A5UI-2LFU;
	Wed, 21 Aug 2024 18:42:11 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgqGs-0000000A5Lt-0tIi;
	Wed, 21 Aug 2024 18:41:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7D192CE0EA2;
	Wed, 21 Aug 2024 18:41:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 160FEC32781;
	Wed, 21 Aug 2024 18:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724265682;
	bh=E8dXxpdarfv5CApG/ySDW3eYs88clE31dyTXCgdIj+o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P1Z5wNq7V+GasD5vLMXFUN5I8quGoeaPeU/IOn49bO8otYh4m4+pEPuD02+LjkIpu
	 1InGS8UBGdn07hLYwr9lczN0PpJKUZda3+PUnVYGPIHPz37YiW/rlBT39Wu3Z6waXl
	 yFHS8eRfeRov6xX2PfirQ7yEoiX+M7qPnRSKDkpLB7DgHumi3WXwPKLN/zebkWiSh5
	 BVgWHhEMq7jh8WLHQBofBwINPODDw2R/uDRfRihMjYS5SRen4JvJhmC1N9DkEtYC28
	 UbCdbUMMqjuH/078spkgiUnjLrN7q0REvfVwOvY+hgphHs8YYEHun383qhkKCWENa0
	 +x6JMwgsjOsOA==
Date: Wed, 21 Aug 2024 19:41:12 +0100
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
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v10 25/40] arm64/ptrace: Expose GCS via ptrace and core
 files
Message-ID: <79d5dad9-3194-45dd-8c2e-663cea2e5f4f@sirena.org.uk>
References: <20240801-arm64-gcs-v10-0-699e2bd2190b@kernel.org>
 <20240801-arm64-gcs-v10-25-699e2bd2190b@kernel.org>
 <ZsYqfJ3V_-ljqlwq@arm.com>
 <58ee01de-88a6-4d0c-845a-3d5bebc0c55c@sirena.org.uk>
MIME-Version: 1.0
In-Reply-To: <58ee01de-88a6-4d0c-845a-3d5bebc0c55c@sirena.org.uk>
X-Cookie: Are you a turtle?
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_114126_430826_16782D43 
X-CRM114-Status: GOOD (  13.06  )
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
Content-Type: multipart/mixed; boundary="===============1090765575296234887=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1090765575296234887==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BMJnA8eFDlPmLXSS"
Content-Disposition: inline


--BMJnA8eFDlPmLXSS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 21, 2024 at 07:28:08PM +0100, Mark Brown wrote:

> part of an otherwise invalid write.  The validation is checking for
> unknown features and enables.  With clone3() we could relax the enable
> check, but I've just pulled that out of the series for the time being.

Actually thinking about it some more I'll just remove the check for
enable, the support for threads with GCS enabled and no kernel allocated
GCS is already there and I didn't pull that bit out.

--BMJnA8eFDlPmLXSS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbGNMgACgkQJNaLcl1U
h9Cs9gf/faFn4ZIWAD0ObkgYSu2MFgvuc0/TxhjIvIwyaRcVoqWhCLuxFx6tDyf7
R003D+EGEn6M1h6zfEPXV/PKOBUV1KMnZcpTgESMJyUVa4HSREWmw7nMQZmiifDl
xICPAzUBzqlPsIcc5S1eQlR7ecwt80Hs0WM5cWjh4YmQikjGU4LZse2eCrrVQ+8E
hrLM84hndTamAlUtO9oREDCdZ8BZc+wxpQSRpRuufSMIdD/Ujv26ikmoRDOvGSbW
h8v2pgOb1hekEEesgevZoE1YbJ76Z5GfQO4HdJKSh/iB4vz5mbmj324y6K0oL4Ej
dsCLfFizij3MQaU6gmwwgHzolx6UWg==
=MjH1
-----END PGP SIGNATURE-----

--BMJnA8eFDlPmLXSS--


--===============1090765575296234887==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1090765575296234887==--

