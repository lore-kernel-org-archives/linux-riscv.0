Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72333C6FD1D
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Mar 2023 18:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xheR1Id687X/u+pxAqpmFkXxQgH3gixo7ED1c8lPxAI=; b=v6f66gSSryYTBek/qGi/WTpNZS
	S3hwf11Gn20jBzzh/2NhHdNYIGdiH2m2BcBFOd7qM5GnMNz04FDEBwRUqGsLUFuvqI/SkiKnonr7d
	TfygY8qhBqxS4W4IUmwmllOTzFE714rLZ9SAiTc2j5U15mUF9NXRGghms4xf4a4oM5onVTIoOfhr+
	xUMlFsxX3hGSYc7fTJ7uTeK77/zc8MU3LJicpIduh+HAse3njOynzusit7WYtwbiO2pATrC9+radJ
	yPi3L5DMAVvVpmS6fEYaQ7fiZJbUwo+OSPmSlCdt32xz8gzV3Ls7G7f/wrBg8PfFmg5cpWaB/oe7e
	pRVCNJEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcVPv-00ECP7-3C;
	Wed, 15 Mar 2023 18:00:03 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcVPt-00ECOP-1i
	for linux-riscv@lists.infradead.org;
	Wed, 15 Mar 2023 18:00:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 40EBB61DB4;
	Wed, 15 Mar 2023 18:00:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F5FEC433EF;
	Wed, 15 Mar 2023 17:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678903199;
	bh=PSttNc6w/mKtHV5D1XaitgEFAhnPrAUkkifCk8iGO4w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AdBV017y2/fk2NDEMtjbyfZ6C8bt2Ik/OyybYbGjLGmUbekGVKzKGzV445ka5mEXt
	 Y1Pd/aI5Cw6wKcD3QRu6tEf+zJxN5i8SHAGP9sEb0fXeXBvGlNncX/p68figDA1pjJ
	 OaTYXuIoLfFDOcjCkmdvAdQJuv0wOi33cEMrmJDhxuZnOLLdJwFDlSi0HUNZaPf4T2
	 53KbZJGyC7pVGzzfCl9GUbw50BkMTOBO+cecBSzmmADirUFrSMHD9hGaoFXj7j9q5j
	 qgQanyDMxJ8qe1of8CjO8aDFR6JXW5oXvKXH39Ro/1nvsHleoHTEfSOVY0gVb5Sqb4
	 doR8N6+uH30Lg==
Date: Wed, 15 Mar 2023 17:59:55 +0000
From: Conor Dooley <conor@kernel.org>
To: Song Shuai <suagrfillet@gmail.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: Kconfig: enable SCHED_MC kconfig
Message-ID: <d8cb0d9e-6b73-4f44-9165-ee66c2835906@spud>
References: <20230310110336.970985-1-suagrfillet@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20230310110336.970985-1-suagrfillet@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_110001_635849_500EE8E2 
X-CRM114-Status: GOOD (  18.58  )
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
Content-Type: multipart/mixed; boundary="===============8101606868583149237=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8101606868583149237==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OWpXPeGNXXDj5/uS"
Content-Disposition: inline


--OWpXPeGNXXDj5/uS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 10, 2023 at 07:03:36PM +0800, Song Shuai wrote:
> RISC-V now builds the sched domain based on the simple possible map.
>=20
> Enable SCHED_MC to make the building based on cpu_coregroup_mask()
> which also takes care of the NUMA and cores with LLC.
>=20
> Signed-off-by: Song Shuai <suagrfillet@gmail.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> ---
>  arch/riscv/Kconfig | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index c5e42cc37604..5b9fdc1a619a 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -320,6 +320,14 @@ config SMP
> =20
>  	  If you don't know what to do here, say N.
> =20
> +config SCHED_MC
> +	bool "Multi-core scheduler support"
> +	depends on SMP
> +	help
> +	  Multi-core scheduler support improves the CPU scheduler's decision
> +	  making when dealing with multi-core CPU chips at a cost of slightly
> +	  increased overhead in some places. If unsure say N here.
> +
>  config NR_CPUS
>  	int "Maximum number of CPUs (2-512)"
>  	depends on SMP
> --=20
> 2.20.1
>=20

--OWpXPeGNXXDj5/uS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZBIHmwAKCRB4tDGHoIJi
0u3TAP4p7X1bFKHYWqXvJF9w0POBVQsE9vMmHTim/pXkpvfhswD/eudv8JIfFjAE
ObulOfSDaYtba9N8J3sKD68ezsbIIAY=
=Jj/C
-----END PGP SIGNATURE-----

--OWpXPeGNXXDj5/uS--


--===============8101606868583149237==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8101606868583149237==--

