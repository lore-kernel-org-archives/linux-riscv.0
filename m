Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3FC1C52D7C
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Aug 2024 16:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3I8V5Z8qpMyslGXgnGUDYimgyu9WQu0TTXCuQIJ+w5I=; b=bDFyRIt/+Z5/hzAbzALuqukAcT
	tQU9XSStvIqkyTXb3Mv4MO05ffNdv2OMH5cJOg+V761OQZQ6vF80Sa2WBYQJxtqEm7kq1EBl2wrf/
	jRSGxwUGhQnxFtNI8oz1PIp8UJ4aHb0UbCr2V9vdI+rzIA5/rLbrO8VQpu13wD532wygfGHWSETvU
	D9+h1/NdM2R2WmRmbO3F/DYWju8VgHWpQXVbIW20mZpjk6DXpdkAQOUSlJtVF5GSnSvGmnvbplRyd
	N9DwnB4U71mgfLRig9xmxSdF3ECaqaC0rxIZsy88zpXqs2r0XV34GsjP6wgtiqHnIoiSaKeWk1FRx
	kFPkCt3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shAcs-0000000DaVL-3IAt;
	Thu, 22 Aug 2024 16:25:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shAc5-0000000DaGQ-302J;
	Thu, 22 Aug 2024 16:24:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F0522611C5;
	Thu, 22 Aug 2024 16:24:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21BE0C4AF10;
	Thu, 22 Aug 2024 16:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724343880;
	bh=+UYr1EMbxmQcwL8f+aGCf7y/v2m/OChUZcEGlURHIO8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q5mqUunkkDfgxKkhsWSbZZ4bvlykv/a1Lf0TVH7BJZZL2anFRHs6IiIw4LSR+MngM
	 UwhWBH53191BOM4l76kFFpFjR+yNjnHX5b9U60zH9p5m3yL5wTLwKAXccT7v8Xj/4m
	 GE7T5BSenuI1dBEd38ZHv0OGdnbzWIYt8/lvkd9xnedhTNcEzQIGO4vavP16xmZVoM
	 pdOP1dObNGxQh4/QJ3zP/rRFw+yAaqk3mCkPvi4wP2eYdGyZ560g7HhU+ja2mq6Iu7
	 KOJBS96PBxgSr+B9/o7wIywbdg6B5nYDnjWYDe3qZWoawc/ydUnvuuafFbZuvNvr13
	 6aiGRQw3qejfg==
Date: Thu, 22 Aug 2024 17:24:36 +0100
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
Subject: Re: [PATCH v11 21/39] arm64/gcs: Ensure that new threads have a GCS
Message-ID: <ZsdmRHinYQdbPn9p@finisterre.sirena.org.uk>
References: <20240822-arm64-gcs-v11-0-41b81947ecb5@kernel.org>
 <20240822-arm64-gcs-v11-21-41b81947ecb5@kernel.org>
 <ZsdkikRi2wgBlODX@arm.com>
MIME-Version: 1.0
In-Reply-To: <ZsdkikRi2wgBlODX@arm.com>
X-Cookie: Your love life will be... interesting.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240822_092441_905651_F7CEA15A 
X-CRM114-Status: GOOD (  16.20  )
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
Content-Type: multipart/mixed; boundary="===============0723910068996703794=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0723910068996703794==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cphCPo7ma/MLqBWq"
Content-Disposition: inline


--cphCPo7ma/MLqBWq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 22, 2024 at 05:17:14PM +0100, Catalin Marinas wrote:

> >  	/*
> > -	 * Ensure that GCS changes are observable by/from other PEs in
> > -	 * case of migration.
> > +	 * Ensure that GCS memory effects of the 'prev' thread are
> > +	 * ordered before other memory accesses with release semantics
> > +	 * (or preceded by a DMB) on the current PE. In addition, any
> > +	 * memory accesses with acquire semantics (or succeeded by a
> > +	 * DMB) are ordered before GCS memory effects of the 'next'
> > +	 * thread. This will ensure that the GCS memory effects are
> > +	 * visible to other PEs in case of migration.
> >  	 */
> > -	gcsb_dsync();
> > +	if (task_gcs_el0_enabled(current) || task_gcs_el0_enabled(next))
> > +		gcsb_dsync();

> Ah, the comment turned up in this patch. It looks fine.

Oh, sorry - I should probably just pull this hunk into the other patch.

--cphCPo7ma/MLqBWq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbHZkMACgkQJNaLcl1U
h9AXTQf6AzdK45ja4zPd6pOLOLIMS6ytyzho0mtx63LPWkg3eGQA4Jllqqgf/Kpt
lhMuC4Cc1DJw0Flz6uHop/VNpp/EqYDexQY9oKRVaMjgndRtvYUnX5FdleS0/gjd
V6Ap8KdW5YZjNzm8Z1n7LE0g0TySfxVXr7Dwlo+e9XiB+Jp502hXQoRw+W7BCmio
VpYUTnm+gt05lzMZEo9ps1iOOzTfYOmwEjiCRuq0fzFrgW2hN4AWoG+ooxmG1YJc
BWl2k7dfQSfHFv7y+1ywHglWgFzkWYN1QwQY00OatFCf9MPIYGiTj1Oml5+UTP+o
HWP0UgIWgVuH85MHHUY67CCKtRcS4w==
=N19k
-----END PGP SIGNATURE-----

--cphCPo7ma/MLqBWq--


--===============0723910068996703794==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0723910068996703794==--

