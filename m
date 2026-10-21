Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22BD5606A31A
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Oct 2026 09:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=156O3mhR;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ghQjnlW2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1JmFif5NX8Q3UwxUjy/JTc9gkUj6ZmJ0d1LMQjSNbq4=; b=156O3mhRFiLbBwiRwkyDkRXtDZ
	1m9dUdEMgicS/sSBqQXTUGmmapW+47dBVRB5AVgihmTtf7cHwzFyHw/mAxlLpTpSrY7ZRoABica/m
	sET2iL3ilscYU0XX74evigkbBefI5shh59d7ceHy+ZvrpJMpw2Ef/+lT/wgNOsymvTgWkm1NNDbj2
	+4mZsDzCyetixSkuAebxYuPgE6GlLGQF7PYojB4nFiQQi03WtJNy9u6o8fI5KhfibsYucJWdBSqms
	C27i6oLQMAELtbz6VWZbJsy3a1Vdg6kbthKkrs//FtGjwhcO5MDn2arFK/A4NwgQ+YPtY117LRfu5
	VIbhMlZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJSNy-0000000BSez-1R65;
	Wed, 21 Oct 2026 09:13:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJSNw-0000000BSd5-2SS6
	for linux-riscv@lists.infradead.org;
	Wed, 21 Oct 2026 09:13:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A469760229;
	Wed, 21 Oct 2026 09:13:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ED5E1F000C9;
	Wed, 21 Oct 2026 09:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792574003;
	bh=ibFHvFi24VZLXp5k+/QO09VG0su+4GpbQN0fTL3vDus=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ghQjnlW23UzTWYDPndfk/wQJ4pfFwQWR4rRQGvZcBiXidQ2FOKXQhHaSRpFXwM7uh
	 aDxdjifvMQENW4gy3TYaxyNjacBoQBRg/iN2xUD4A1knzFCIqt0l3iFS21nieXsf/N
	 xYeTWyem1b+bw3hNX4rbDUyxXLQ27vwacuikYLtAf8HjJMGzq948/zAiLFOj5Pkxml
	 vnep2VtePEe87EsWHGTHX2r09ox+pyzgun2IhuYKye/2GBMsGVfb/JpuyzHK7DdZej
	 miF5vvCwyTHSgFi1xS7Q9XjDHEQPrx5VaOIIX6VlEBqrYb8aeadtAAE8EfmCSQ8mOh
	 bBlJH+xi2ZiPg==
Date: Wed, 21 Oct 2026 10:13:18 +0100
From: Conor Dooley <conor@kernel.org>
To: Chen Pei <cp0613@linux.alibaba.com>
Cc: sudeep.holla@kernel.org, alex@ghiti.fr, aou@eecs.berkeley.edu,
	atishp@rivosinc.com, conor.dooley@microchip.com, guoren@kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, pjw@kernel.org
Subject: Re: [PATCH] riscv: Populate boot CPU topology on UP kernels
Message-ID: <20261021-dilute-arrive-f7633eed8556@spud>
References: <20261012131034.1026-1-cp0613@linux.alibaba.com>
 <20261020-unsent-commuting-91739a882031@spud>
 <20261020-frisky-jovial-echidna-2d003c@sudeepholla>
 <20261020142630.1680-1-cp0613@linux.alibaba.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261020142630.1680-1-cp0613@linux.alibaba.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1804828503041478413=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============1804828503041478413==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uIe2oQA0ozxBslji"
Content-Disposition: inline

--uIe2oQA0ozxBslji
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 10:26:26PM +0800, Chen Pei wrote:
> On Tue, Oct 20, 2026 at 01:24:00PM +0100, Sudeep Holla wrote:
> > Commit 4b3dc9679cf7 ("arm64: force CONFIG_SMP=3Dy and remove redundant =
#ifdefs")
> > removed UP support and made SMP default enabled.

Ah yes, I forgot about this..

> Thanks. RISC-V still allows UP: CONFIG_SMP is a plain bool with no
> default, yet arch/riscv/Kconfig selects GENERIC_ARCH_TOPOLOGY
> unconditionally while the only callers of init_cpu_topology() and
> store_cpu_topology() sit in smpboot.c, which is built only for
> CONFIG_SMP. That mismatch is what this patch closes.
>=20
> Gating that select on SMP instead does not work. UP would then fall back
> to the cpumask_of(cpu) defaults in include/linux/topology.h and report
> the same sysfs, but vmlinux no longer links: arch_freq_scale,
> capacity_freq_ref, topology_scale_freq_tick and topology_set_freq_scale
> all become undefined references.
>=20
> arch/riscv/include/asm/topology.h binds the arch_scale_freq_* and
> arch_set_freq_scale hooks to symbols that only drivers/base/arch_topology=
=2Ec
> provides, and those defines suppress the generic fallbacks in
> kernel/sched/sched.h and include/linux/sched/topology.h. Making the
> gating work needs extra conditionals at several Kconfig and Makefile
> gates, and gives up freq and capacity invariance on UP, which is a much
> larger change than the twelve lines here.
>=20
> Conor, and RISC-V maintainers: would you rather force CONFIG_SMP=3Dy on
> RISC-V as well and drop UP altogether, or keep UP buildable and take
> this fix? I would keep the current approach unless you prefer the
> former.

I think we probably should drop CONFIG_SMP=3DN, but this patch would be
needed as a fix regardless since making SMP mandatory would be for 7.5
or later whereas fixing this is 7.4-rc content and should probably be
backported to stable.

FWIW, the patch looks reasonable to me, I was just wondering why arm64
didn't need it.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--uIe2oQA0ozxBslji
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCatiCLgAKCRB4tDGHoIJi
0vBBAQCHzwMkQlJ8bBWTCZpOlZkwVgGCC1bBopmcuYSd1KwgdQD/VjIT/ComB9c3
A4RchBLZWXhBIjHQ092F3Ox/Pd9ERAM=
=jKs+
-----END PGP SIGNATURE-----

--uIe2oQA0ozxBslji--


--===============1804828503041478413==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1804828503041478413==--

