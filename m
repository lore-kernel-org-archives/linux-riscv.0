Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62D70C001B0
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Aug 2023 13:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=925EITkp3Fn8En9J3eWvgy/cDIwlGd6yPCUgK55v/K0=; b=VdjKPNwtZdsB4lAQUCiPoPfsCo
	oLt7c65VUMFkZAJKCHeVX80PVeDSIgHLfSA29j6EU6Fni8VM3l80N8G3jtO4jbF98k1TuKkWbDiZC
	QvMdFTIdQubd3FV7aqGC/z1mjljhPU+NMPOlk7IN/Mw5AMW39zGGnAA86yEsIejYA4h8C+oFilbap
	XSA9Wzzffd3K4VNdTq5XEVC1rF4KUI15PeFHHIPYTd+sMzVKjq2VH5odr3XHD//n3gteG2Zpj5jv0
	s7De9WTwavt7TEfzfq3TtZTe0hIub0mTTbyfcbN1hFGYmzbxKP94HGba/YZCysx8CBWW/RLX0HOtL
	6p9Ur5PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSzr0-00HHxR-22;
	Mon, 07 Aug 2023 13:00:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qSzqx-00HHvj-2X;
	Mon, 07 Aug 2023 13:00:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 966D7619F4;
	Mon,  7 Aug 2023 13:00:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31608C433C7;
	Mon,  7 Aug 2023 13:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691413252;
	bh=VIywjKfIQjCBtdbDPXYlia2uvZPXVd/riPHCXoskQic=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rvvDU8srIyUZqSC/AZn5tENk73e6b7lcMD0bggv0OZy+kdMv1wzrdao14Ek53Iiyx
	 IRdeP2i7dHvG05GYveqesPRozZBWvPkPzVgLAPzRKehV8FG4dTBFTlwNmq6W9aAmXd
	 TOJ2NMgyqruEmA77u2ERYj64yfya3426m3ZWoUGeog++a6pvx66c8pChwY38vz523S
	 ChaYFX40JW+pa2BW1vXmOmq45J6hBtdc88n5UAJdNuTfAiy2eP80JJIFmiP356Yg99
	 NUF9YdSDWmi87A0gAAG2I/js0A4x5VYEjSB7V464D9htKF6RuocFXxnBcwe4+5gtev
	 Hkzg/2TxLfPZA==
Date: Mon, 7 Aug 2023 14:00:42 +0100
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
Subject: Re: [PATCH v3 21/36] arm64/mm: Implement map_shadow_stack()
Message-ID: <3a077ff3-8627-4337-9b4a-6a8828eda0e7@sirena.org.uk>
References: <20230731-arm64-gcs-v3-0-cddf9f980d98@kernel.org>
 <20230731-arm64-gcs-v3-21-cddf9f980d98@kernel.org>
 <ZNDFioFIM34VcsuV@arm.com>
MIME-Version: 1.0
In-Reply-To: <ZNDFioFIM34VcsuV@arm.com>
X-Cookie: idleness, n.:
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230807_060055_916533_AF0CF155 
X-CRM114-Status: GOOD (  17.59  )
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
Content-Type: multipart/mixed; boundary="===============6925723058024388286=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6925723058024388286==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zuyh0JKERt9z219h"
Content-Disposition: inline


--zuyh0JKERt9z219h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 07, 2023 at 11:20:58AM +0100, Szabolcs Nagy wrote:
> The 07/31/2023 14:43, Mark Brown wrote:
> > +SYSCALL_DEFINE3(map_shadow_stack, unsigned long, addr, unsigned long, size, unsigned int, flags)
> > +{
> > +	unsigned long alloc_size;
> > +	unsigned long __user *cap_ptr;
> > +	unsigned long cap_val;
> > +	int ret;
> > +
> > +	if (!system_supports_gcs())
> > +		return -EOPNOTSUPP;
> > +
> > +	if (flags)
> > +		return -EINVAL;
> > +
> > +	if (addr % 16)
> > +		return -EINVAL;

> mmap addr must be page aligned (and there is no align req on size).

> i'd expect similar api here.

That's not what the manual page or a quick check of the code suggest
that mmap() does, they say that the kernel just takes it as a hint and
chooses a nearby page boundary, though I didn't test.  I'm not sure why
I have that alignment check at all TBH, and to the extent it's needed I
could just be 8 - this level of code doesn't really care.

> > +	if (size == 16 || size % 16)
> > +		return -EINVAL;

> why %16 and not %8 ?

I don't think that's needed any more - there was some stuff in an
earlier version of the code but no longer.

--zuyh0JKERt9z219h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTQ6voACgkQJNaLcl1U
h9ADtwf9Hi+3Tmw6lo4OcpVr7n1Zx4xMLurjUWXhlQulr3E2yaNH/LoJepX0V/Hy
cYyeMDXfa9itHkAmxF+PWpfByFW2ak1NvN+VB1ywgbz4kJFiAK11hsjQzWuiJw+s
e1it4mLwr1FXHqL0ewxN4pWvkFHmoyVTtKmtIlYrR4K9Xq8KEWrEDi6x5LHrI6tk
HXZ6HBESzDzzrctdnfG91f3YdpxLKuvuE1l+HEVfKlh5EqEHtTxzLT1BCDHy4ebI
URGjT1qEAOxoNDbYkJaaPcVnDkFfcXuSC07xv57tktihM+MnQCtZd0b+IH9lf6Ry
E10gfnUnsEkptjykMZVkmRiHM0iWvQ==
=jbyG
-----END PGP SIGNATURE-----

--zuyh0JKERt9z219h--


--===============6925723058024388286==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6925723058024388286==--

