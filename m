Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A763CD37B0
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Sep 2023 00:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uqFweyUwJzgikOckZnhTBeffWtr2VYlscrj4otn5Ja0=; b=UM+tk76FyhneN1wf2J3uSlAvy5
	hRfaPhmywypEeFKMIACUPT/7nF+f6A/7jXq2WrRHlZySkT7ljq32XvJVoQzDR1op/sijqEkWelIVs
	tT5QvrC3oUVTN8x0svc2Xp2HSuQyHs/XTfujFdyu5H3t0fBlCxzcGRMrDvC1t4+84H3Nb//1j5mtH
	iEC1ZaRHPD4o8wPmeACet2tiFe7OQMk6kWFZuJbi2KRJHUI49b05fxmpjrk/+zxUgPBrbmOhrXLDi
	a4feh79V3fVkXk9nKxRbhoK5Ss0DW3vkbRWHtPrm1VdG0HXc49zLvbOh0va/nsE5HTpSWKxAVvR05
	r7SfiL5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhIzL-00BakH-0Q;
	Sat, 16 Sep 2023 00:16:43 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhIzI-00Bajh-0B
	for linux-riscv@lists.infradead.org;
	Sat, 16 Sep 2023 00:16:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 5BA0FCE203D;
	Sat, 16 Sep 2023 00:16:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EAFAC433C8;
	Sat, 16 Sep 2023 00:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694823395;
	bh=KVD5/Hzc2O0pK0uQVAxIpL/l7Ybq76eSDT1eP8jejfY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lqmFxnLZU74ovH6yS4VAqaw1t5nNnOzQ8wefTNWAY9Z9vYhrT6m4ne9oeMciU+JXh
	 ZFUPhNCldoNZ7i8LZnUuLZdeg29eROEvMDADioenGxgUnJICAtK9nmIL1GEmdC+8gU
	 lS2tdQ4UZRzDlYI7M2webMInj+8xn9QrbScJqlcNstP6/LlucruvKeW6gshaRJ0i+v
	 GDAHRULMzdY47670KU6WmBWfEmYdmFAOhqgRHnD1z82DGPRz8ACchjuVvJiQZts6H2
	 1Q7PPVAGAP3Oc4C9eXsm5IWI1jZk5n6da6TYyNLysFf7KZB5Yp7Sa7n1j7mP9I6/zS
	 E0Lz4AHgxTDzQ==
Date: Sat, 16 Sep 2023 01:16:30 +0100
From: Conor Dooley <conor@kernel.org>
To: Evan Green <evan@rivosinc.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner <heiko@sntech.de>,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	David Laight <David.Laight@aculab.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	linux-riscv@lists.infradead.org,
	Andrew Jones <ajones@ventanamicro.com>
Subject: Re: [PATCH] RISC-V: Probe misaligned access speed in parallel
Message-ID: <20230916-celtic-flavored-f6e5f49cec20@spud>
References: <20230915184904.1976183-1-evan@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20230915184904.1976183-1-evan@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_171640_435542_B5D7D6D1 
X-CRM114-Status: GOOD (  23.92  )
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
Content-Type: multipart/mixed; boundary="===============2041647592864226425=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2041647592864226425==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="EtuFmNE6fZ9CiTEz"
Content-Disposition: inline


--EtuFmNE6fZ9CiTEz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Yo Evan,

On Fri, Sep 15, 2023 at 11:49:03AM -0700, Evan Green wrote:
> Probing for misaligned access speed takes about 0.06 seconds. On a
> system with 64 cores, doing this in smp_callin() means it's done
> serially, extending boot time by 3.8 seconds. That's a lot of boot time.
>=20
> Instead of measuring each CPU serially, let's do the measurements on
> all CPUs in parallel. If we disable preemption on all CPUs, the
> jiffies stop ticking, so we can do this in stages of 1) everybody
> except core 0, then 2) core 0.
>=20
> The measurement call in smp_callin() stays around, but is now
> conditionalized to only run if a new CPU shows up after the round of
> in-parallel measurements has run. The goal is to have the measurement
> call not run during boot or suspend/resume, but only on a hotplug
> addition.
>=20
> Signed-off-by: Evan Green <evan@rivosinc.com>
>=20
> ---
>=20
> Jisheng, I didn't add your Tested-by tag since the patch evolved from
> the one you tested. Hopefully this one brings you the same result.

Ya know, I think there's scope to add Reported-by:, Closes: and Fixes:
tags to this patch, mentioning explicitly that this has regressed boot
time for many core systems, so that this can be fixes material. What do
you think?

> ---
>  arch/riscv/include/asm/cpufeature.h |  3 ++-
>  arch/riscv/kernel/cpufeature.c      | 28 +++++++++++++++++++++++-----
>  arch/riscv/kernel/smpboot.c         | 11 ++++++++++-
>  3 files changed, 35 insertions(+), 7 deletions(-)
>=20
> diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm=
/cpufeature.h
> index d0345bd659c9..19e7817eba10 100644
> --- a/arch/riscv/include/asm/cpufeature.h
> +++ b/arch/riscv/include/asm/cpufeature.h
> @@ -30,6 +30,7 @@ DECLARE_PER_CPU(long, misaligned_access_speed);
>  /* Per-cpu ISA extensions. */
>  extern struct riscv_isainfo hart_isa[NR_CPUS];
> =20
> -void check_unaligned_access(int cpu);
> +extern bool misaligned_speed_measured;
> +int check_unaligned_access(void *unused);
> =20
>  #endif
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeatur=
e.c
> index 1cfbba65d11a..8eb36e1dfb95 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -42,6 +42,9 @@ struct riscv_isainfo hart_isa[NR_CPUS];
>  /* Performance information */
>  DEFINE_PER_CPU(long, misaligned_access_speed);
> =20
> +/* Boot-time in-parallel unaligned access measurement has occurred. */
> +bool misaligned_speed_measured;

If you did something like s/measured/complete/ I think you could drop
the comment. Tis whatever though :)

Conor.

--EtuFmNE6fZ9CiTEz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQTz3gAKCRB4tDGHoIJi
0pL6APoCJx7gPKIJyKx4k4hG/Noh2gJZfE37eh09UhuU5jaYYQD8CUoYpcT0HQHB
pQLKcJ6KdLxEs3zcHVsMGIxM2Q232gY=
=gqqj
-----END PGP SIGNATURE-----

--EtuFmNE6fZ9CiTEz--


--===============2041647592864226425==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2041647592864226425==--

