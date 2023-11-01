Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BE54C4167D
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Nov 2023 11:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sEipkQ42RnoQJUzA7gelIyWB8mz+0jB5GBrRZYssG1c=; b=ImM9OW/m1QHFDtw/Bqbgb8sRwJ
	cNWuxBGXjilw5LXqCEu49Zy6fcp+TmS+/EeuUhQ1XmA+WPcYgNxswU4qcVHvE9Uu+jSoUMpKW2VF8
	hZ1Nxudbm0hD5fAGjG6O7HlbppoComGSc2hEHCUhmjqB4LjmnmHzvCTU1w3bK77qoPhvIB/Y1L8vm
	nFGvg4yVIKb3MRnWgzaer+RUuYpZ23Bf0LCwWHspZ9DL1Ulgp6ncTCkxzJu8EKOEv0e8b5FZoWG1h
	C5Fhfk3Dxdy2FhIn6oOmb5TJqeM1zboIPtR31z2ZtUdal9dlknt5o+wbNjSOYQIAwxlgmNFqDI4Ju
	q1UdnGKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qy9kP-007IQz-05;
	Wed, 01 Nov 2023 11:50:57 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qy9kM-007IPx-0G
	for linux-riscv@lists.infradead.org;
	Wed, 01 Nov 2023 11:50:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id DFEC5B80B23;
	Wed,  1 Nov 2023 11:50:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABA00C433C9;
	Wed,  1 Nov 2023 11:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698839451;
	bh=mF6eg4XvSECsF2HMgNiQoGzvU7I5nf27Gh38oBPoW8w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=misf2IeNRgfcUPjvk9oQ48jbkYilldGVOKEo78NWgtyyiJKFDZX40Xwemwf/fBhsx
	 s2POZN2NGNfhrFnuf0liu77A/wyhqOUqQdwRs7/TeE998W8lfLrk2mb1idYIWZLR5V
	 bFqIamEMC9t+Ys+bamXQFdX03YBbtI4lXscLwfqaEJORAYa2wl4RgMmFVlnP+I3xeu
	 sZETzyTkmDMKSOCO7S4JCz205KrJaOvxSlXLeZKvWk71LUVs9jisMPiEARQjfKRwfV
	 kDOeRUW/Dd5lHMQrLEIdMdhrouhvMT+xg2ywZQb3YFddMiSdMYHZGcjQLLmMhoei7Y
	 RaSvd6gry7SCg==
Date: Wed, 1 Nov 2023 11:50:46 +0000
From: Conor Dooley <conor@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	David Laight <David.Laight@aculab.com>,
	Xiao Wang <xiao.w.wang@intel.com>, Evan Green <evan@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v9 0/5] riscv: Add fine-tuned checksum functions
Message-ID: <20231101-palace-tightly-97a1d35a4597@spud>
References: <20231031-optimize_checksum-v9-0-ea018e69b229@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20231031-optimize_checksum-v9-0-ea018e69b229@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231101_045054_282015_F08AD196 
X-CRM114-Status: GOOD (  18.34  )
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
Content-Type: multipart/mixed; boundary="===============6216012135863410788=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6216012135863410788==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LjqsyqiDGC45356u"
Content-Disposition: inline


--LjqsyqiDGC45356u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 31, 2023 at 05:18:50PM -0700, Charlie Jenkins wrote:
> Each architecture generally implements fine-tuned checksum functions to
> leverage the instruction set. This patch adds the main checksum
> functions that are used in networking.
>=20
> This patch takes heavy use of the Zbb extension using alternatives
> patching.
>=20
> To test this patch, enable the configs for KUNIT, then CHECKSUM_KUNIT
> and RISCV_CHECKSUM_KUNIT.
>=20
> I have attempted to make these functions as optimal as possible, but I
> have not ran anything on actual riscv hardware. My performance testing
> has been limited to inspecting the assembly, running the algorithms on
> x86 hardware, and running in QEMU.
>=20
> ip_fast_csum is a relatively small function so even though it is
> possible to read 64 bits at a time on compatible hardware, the
> bottleneck becomes the clean up and setup code so loading 32 bits at a
> time is actually faster.
>=20
> Relies on https://lore.kernel.org/lkml/20230920193801.3035093-1-evan@rivo=
sinc.com/

I coulda sworn I reported build issues against the v8 of this series
that are still present in this v9. For example:
https://patchwork.kernel.org/project/linux-riscv/patch/20231031-optimize_ch=
ecksum-v9-3-ea018e69b229@rivosinc.com/

Cheers,
Conor.

--LjqsyqiDGC45356u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZUI7lgAKCRB4tDGHoIJi
0h2sAP0RKjRG5Rpub/HvLIazZUE6vW1OEyWKng47PNLxPT1sUgD/Xz1kJ0si+e+m
myJ1M13eciVOu5bFSEGmDXc/0JMsxgY=
=1Fkh
-----END PGP SIGNATURE-----

--LjqsyqiDGC45356u--


--===============6216012135863410788==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6216012135863410788==--

