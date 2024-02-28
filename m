Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32FD0C5478C
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Feb 2024 15:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2kvZM6PY2YChM0yWDdlVgzl87M99+cSk6F5zXevDZYQ=; b=WLssu8Df9ZbgV4AHxFGQ6GbOVM
	EjSeM59dwzOB7jCKgOga8ssUX3MiLRQA2lqagvRjgpwN8FHfYCGDgU4YfCbHQmj2nT7cBeKqdLgmw
	gD0qcvw7ZRKg/P50FD9Ehx/LhKAFtosG49dDqb9+g9imRIFTLiNB0R1AEKM/uz+lp+EVv4CgqdVMx
	Yge7R4P27m6ZlUAp+PT2DDJac+K84fYsMzzgqgh6D1PzhkH1QhX0zAG1bmDxpLeuxrCwbRBvBFCR6
	NX5Y7shkZGcWfehl9VPx73Rrrr8szU95xtDMoQnP4ekv6K+ej3+YfN5Zj5PoSUMnexYZ79IQrhAbA
	Ph0cVo1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfM04-00000009v87-0QaI;
	Wed, 28 Feb 2024 15:37:40 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfM00-00000009v5v-2VcG
	for linux-riscv@lists.infradead.org;
	Wed, 28 Feb 2024 15:37:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D2A67CE21D0;
	Wed, 28 Feb 2024 15:37:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5628C433C7;
	Wed, 28 Feb 2024 15:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709134654;
	bh=K6qcyY7tmKWlPwGFAWfBA2nTcEkDy4NjDJTddRb/t88=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VBbUo0BSkLc1goRk+1bILw3JXxuPO45gtApjIESIr+gZ6qaqZ8e2co3Ns1HZaxItg
	 msP9WS7J1W84wjFIUkCkmn3RXwpO0QSA33aAhBHGiptNYX/zPhV4M1zTyco++lgyPO
	 YwBfySTgUpqBBcI2AidKGkwmCwWBjjOgKXmKHefN6uRsb5s/ex6wMWDoyPLxZEK/8h
	 kgM4ZMNqI7WweDxblbx9wlEfY6c5ejINnPjZTjt80BkwxpdYntbIN1rL8A9ny8tSjz
	 AE75D4NrWvCDVzPdjKWrJ6y2GEtFz7P8E3mhAu2V1qnXt67h1gJCt2dXVHBoedoZha
	 kVQqYPFjmsZvA==
Date: Wed, 28 Feb 2024 15:37:30 +0000
From: Conor Dooley <conor@kernel.org>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] riscv: Fix loading 64-bit NOMMU kernels past the
 start of RAM
Message-ID: <20240228-cavity-aground-d1e8072a2c0d@spud>
References: <20240227003630.3634533-1-samuel.holland@sifive.com>
 <20240227003630.3634533-3-samuel.holland@sifive.com>
 <20240227-unfitting-rectangle-cd0f23a4f3f1@wendy>
 <9673cbe7-41ec-4261-9be8-fc5191ade56c@sifive.com>
MIME-Version: 1.0
In-Reply-To: <9673cbe7-41ec-4261-9be8-fc5191ade56c@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_073736_893794_E03273C5 
X-CRM114-Status: GOOD (  21.40  )
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
Content-Type: multipart/mixed; boundary="===============0417227946669556817=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0417227946669556817==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="29t4/8GEDLrsNf/T"
Content-Disposition: inline


--29t4/8GEDLrsNf/T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 27, 2024 at 01:22:12PM -0600, Samuel Holland wrote:
> Hi Conor,
>=20
> On 2024-02-27 6:18 AM, Conor Dooley wrote:
> > On Mon, Feb 26, 2024 at 04:34:47PM -0800, Samuel Holland wrote:
> >> commit 3335068f8721 ("riscv: Use PUD/P4D/PGD pages for the linear
> >> mapping") added logic to allow using RAM below the kernel load address.
> >> However, this does not work for NOMMU, where PAGE_OFFSET is fixed to t=
he
> >> kernel load address. Since that range of memory corresponds to PFNs
> >> below ARCH_PFN_OFFSET, mm initialization runs off the beginning of
> >> mem_map and corrupts adjacent kernel memory. Fix this by restoring the
> >> previous behavior for NOMMU kernels.
> >>
> >> Fixes: 3335068f8721 ("riscv: Use PUD/P4D/PGD pages for the linear mapp=
ing")
> >=20
> > This commit was a year ago, why has nobody reported this as being an
> > issue before?
>=20
> I can think of a few reasons:
> 1) NOMMU users are likely to be using RV32, which is not affected.
> 2) Before patch 4 of this series, NOMMU implied M-mode, so there was noth=
ing in
> the way to prevent loading Linux at the very beginning of RAM. (U-Boot/SPL
> relocates itself to the end of RAM, so it would not cause a problem.)
> 3) Platforms where RAM does not begin at exactly 0x80000000 would be affe=
cted,
> there are several workarounds: change the start of RAM (for soft cores), =
change
> PAGE_OFFSET, or change the memory ranges in the devicetree to exclude any=
thing
> below PAGE_OFFSET.
>=20
> It's possible that nobody was affected, but it's still technically a regr=
ession
> (a hypothetical platform with RAM from 0x40000000 to 0xc0000000 would cra=
sh
> instead of only being able to use half its RAM), so I thought it still de=
served
> the Fixes: tag.

Right, thanks for explaining.

Cheers,
Conor.

--29t4/8GEDLrsNf/T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZd9TOgAKCRB4tDGHoIJi
0vk6AP0TSxofF/mXzet5PRaY+C3fUEgn0adwntRDThmt24rOkwD9Gvlsb3xwmGcN
f0hJY0qds2ScDTzQXUVTxVY6hE0krQ0=
=oZgb
-----END PGP SIGNATURE-----

--29t4/8GEDLrsNf/T--


--===============0417227946669556817==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0417227946669556817==--

