Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62DD4C54E5D
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Mar 2024 11:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HC5gNyrj9oq9M4bq7aNEz/eQRfIyJyH/U0E+1YgMKaQ=; b=V9nDCZ9WPOmdloQy0U4bF+uZ4R
	tsOxg3/95EMCGqB/d6ajUi5LvsN9a84AgfYh+bQokk0kxj6pvaGlQchSOqO+I0KTJxbLSgvv0y06d
	FtkfNCqu656JtYWt6wfZrGVhCcIncQVYtJe8gfbaMg8OzZTCi4jTIrt+cO39NSfr01HgNDORxlnVm
	gwCCgHjkOQa+QlQtgnxvsvypCah3LHL0VWIXMMmyQcpsufHCdOboiZln5FVRG2MSgSt0ujhLiLh59
	1BCbI02FFs+UfWUBvw0OLCDiMxQ60Tw3VILTmNjyMGbQ/Ugenmc8sR4BA7mu/sk4Qi8zJtlKUTEuu
	8F1m5DjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmBOv-00000008Q6N-33cb;
	Mon, 18 Mar 2024 11:43:33 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmBOp-00000008Q3j-2sgS;
	Mon, 18 Mar 2024 11:43:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 80122CE0A21;
	Mon, 18 Mar 2024 11:43:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4D0AC433C7;
	Mon, 18 Mar 2024 11:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710762204;
	bh=ZsO4ooKDwdPE4ERQ9+2PIQXx/LGHduxb5TJ1B/MU2Qw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P7tD8aBkYmkcn98syHRmR19xYz7HgMnNXj6Wj0l3OjZxygxoK6vOMexw8lBZnOy9G
	 G62JnltORFDDjIAF/ZoV58cK+eBnuZ72MBJVghHAiCQ7PEcrgUmjJtlRLPPOxqWa+v
	 7YNDbgRelu4td3ixtpOyO2Q4cbxMToVU+0RRpXeHEunSEutUYT7M4FgJpzhbEA3Lz2
	 OjYwAjbG7XVCcQA0fjJHyBuvhDuV+djliciXr+ESTEYd/Ijt6C+on947a7IhHdWhN+
	 CqKC8MRnqrd/HdPtEmIPzqvXjd3NuaY4Crg9Pse+bH8qrdrbYNNFp3afN95UfvpDIq
	 FdK2BX/aVeZjg==
Date: Mon, 18 Mar 2024 11:43:19 +0000
From: Conor Dooley <conor@kernel.org>
To: Qingfang Deng <dqfext@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Heiko Stuebner <heiko@sntech.de>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Qingfang Deng <qingfang.deng@siflower.com.cn>
Subject: Re: [PATCH v2] perf: RISC-V: fix IRQ detection on T-Head C908
Message-ID: <20240318-spoilage-drastic-d58a16c8b9f3@spud>
References: <20240318100241.267857-1-dqfext@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20240318100241.267857-1-dqfext@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_044328_132745_615A4A3B 
X-CRM114-Status: GOOD (  21.00  )
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
Content-Type: multipart/mixed; boundary="===============4823669437846514860=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4823669437846514860==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ji7VlNa0+B9+NsUi"
Content-Disposition: inline


--ji7VlNa0+B9+NsUi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 18, 2024 at 06:02:40PM +0800, Qingfang Deng wrote:
> From: Qingfang Deng <qingfang.deng@siflower.com.cn>
>=20
> T-Head C908 has the same IRQ num and CSR as previous C9xx cores, but
> reports non-zero marchid and mimpid. Add the check for C908 ID.
>=20
> Fixes: 65e9fb081877 ("drivers/perf: riscv_pmu_sbi: add support for PMU va=
riant on T-Head C9xx cores")
> Signed-off-by: Qingfang Deng <qingfang.deng@siflower.com.cn>
> ---
> v2: add C908 ID check

If you read the replies to v1 in full, you would see I objected there to
this approach and made suggestions as to how I would like it done:
https://lore.kernel.org/linux-riscv/IA1PR20MB4953CEBE4CB6AC7238849353BB282@=
IA1PR20MB4953.namprd20.prod.outlook.com/

I don't want to see an expansion of these ID checks.

Thanks,
Conor.
>=20
>  arch/riscv/errata/thead/errata.c       | 5 +++--
>  arch/riscv/include/asm/vendorid_list.h | 2 ++
>  drivers/perf/riscv_pmu_sbi.c           | 6 ++++--
>  3 files changed, 9 insertions(+), 4 deletions(-)
>=20
> diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead/e=
rrata.c
> index b1c410bbc1ae..da3b34866d8f 100644
> --- a/arch/riscv/errata/thead/errata.c
> +++ b/arch/riscv/errata/thead/errata.c
> @@ -125,8 +125,9 @@ static bool errata_probe_pmu(unsigned int stage,
>  	if (!IS_ENABLED(CONFIG_ERRATA_THEAD_PMU))
>  		return false;
> =20
> -	/* target-c9xx cores report arch_id and impid as 0 */
> -	if (arch_id !=3D 0 || impid !=3D 0)
> +	/* Early c9xx cores report arch_id and impid as 0 */
> +	if (!((arch_id =3D=3D 0 && impid =3D=3D 0) ||
> +	      (arch_id =3D=3D THEAD_C908_ARCH_ID && impid =3D=3D THEAD_C908_IMP=
_ID)))
>  		return false;
> =20
>  	if (stage =3D=3D RISCV_ALTERNATIVES_EARLY_BOOT)
> diff --git a/arch/riscv/include/asm/vendorid_list.h b/arch/riscv/include/=
asm/vendorid_list.h
> index 2f2bb0c84f9a..57b3de510d38 100644
> --- a/arch/riscv/include/asm/vendorid_list.h
> +++ b/arch/riscv/include/asm/vendorid_list.h
> @@ -8,5 +8,7 @@
>  #define ANDES_VENDOR_ID		0x31e
>  #define SIFIVE_VENDOR_ID	0x489
>  #define THEAD_VENDOR_ID		0x5b7
> +#define  THEAD_C908_ARCH_ID	0x8000000009140d00
> +#define  THEAD_C908_IMP_ID	0x8a000
> =20
>  #endif
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index bbd6fe021b3a..34d8689982de 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -833,8 +833,10 @@ static int pmu_sbi_setup_irqs(struct riscv_pmu *pmu,=
 struct platform_device *pde
>  		riscv_pmu_use_irq =3D true;
>  	} else if (IS_ENABLED(CONFIG_ERRATA_THEAD_PMU) &&
>  		   riscv_cached_mvendorid(0) =3D=3D THEAD_VENDOR_ID &&
> -		   riscv_cached_marchid(0) =3D=3D 0 &&
> -		   riscv_cached_mimpid(0) =3D=3D 0) {
> +		   ((riscv_cached_marchid(0) =3D=3D 0 &&
> +		     riscv_cached_mimpid(0) =3D=3D 0) ||
> +		    (riscv_cached_marchid(0) =3D=3D THEAD_C908_ARCH_ID &&
> +		     riscv_cached_mimpid(0) =3D=3D THEAD_C908_IMP_ID))) {
>  		riscv_pmu_irq_num =3D THEAD_C9XX_RV_IRQ_PMU;
>  		riscv_pmu_use_irq =3D true;
>  	} else if (riscv_isa_extension_available(NULL, XANDESPMU) &&
> --=20
> 2.34.1
>=20
>=20

--ji7VlNa0+B9+NsUi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZfgo1wAKCRB4tDGHoIJi
0rEaAQDKUky9LX6dqR7EomEioJbyQIe8qlZhpz+Ik+MYkuLzvwD/cjp4nP0ALNBb
riWgQLQSodPaZRnnTJtbjk2WoMH6Igw=
=LZNq
-----END PGP SIGNATURE-----

--ji7VlNa0+B9+NsUi--


--===============4823669437846514860==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4823669437846514860==--

