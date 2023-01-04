Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A4C3C46467
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jan 2023 15:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i+zW5rpq26jZgNvcqhqZLLZKN1wq5jU4Iv5vQ6Mqid4=; b=TTVxuJ6T2hVl0N0Nc2ZwJirqLX
	j0mCbplvgYQortTiD9EJiXggsSAKC+BHAbnqut8DSbndflD6h9uWA1LmP2XKEyTQfIsNl9x/LHNBa
	1Ead1GkFXQQ6tAp6b9QN1sRmxJC7Dd69TipTSK66noXsL8a7FEe37z/j6+n3hcV4uoz5zvijWOyKQ
	ZVKSKLzasLjaZbnU210LTGB0XGKiki0vnTC6ZY2zMxEm2YsX5ja4qeWIdsZEu0RV0JI9aGKJc6Kbx
	ZHlckvhabhfuYYLnCOp13x1ApnPC1NrmnPF7JKJlzTaIDZR+yjvkYbf3PFKf4xxrTuOJiuybT6iTv
	B9ffw6xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD5Y6-00A3CC-1e; Wed, 04 Jan 2023 15:19:26 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD3Nm-009Bd9-Ax
	for linux-riscv@lists.infradead.org; Wed, 04 Jan 2023 13:00:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C257AB8162B;
	Wed,  4 Jan 2023 13:00:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE597C433EF;
	Wed,  4 Jan 2023 13:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672837235;
	bh=aINReqP5sO7hUDTxAOXJWJ1lezkfPWFHYacE2WLSAIM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d13CxfskSSa47ik9YFbYTqnfy5hGnxfMFm1eHx8Vy+gys0g8NN+ivnn+0YcvqqkjF
	 5aSk+zyLaBBA2wMGRh1vPFxiaNwhaO7PAwOshw5pajnl3ogH+F2CDg+RomRWToFeeY
	 eUhzKbCE8Eqlsrkqu36gBSZur6+7lQ3sILvWW93jFkLVCoyaqPUEOZCdORmyJfQuFM
	 2A1vFpAkpDDsIjKdOSsGeRD+/EmmtvFh/9sRzV0PlhbD0RoQQ4rPvrqVSyTqaXTde+
	 8sPl3pBCorhERsGhXJxVHY3NZjE8LjAKBdXyvyTlFHP+Trf2fcE50MHB3JsQ1elJjg
	 uVEKxWmyjNGmA==
Date: Wed, 4 Jan 2023 13:00:31 +0000
From: Conor Dooley <conor@kernel.org>
To: Ley Foon Tan <leyfoon.tan@starfivetech.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, Ley Foon Tan <lftan.linux@gmail.com>
Subject: Re: [PATCH] riscv: Move call to init_cpu_topology() to later
 initialization stage
Message-ID: <Y7V4byskevAWKM3G@spud>
References: <20230103035316.3841303-1-leyfoon.tan@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230103035316.3841303-1-leyfoon.tan@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_050039_048284_3D788772 
X-CRM114-Status: GOOD (  23.36  )
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
Content-Type: multipart/mixed; boundary="===============6991909195038589798=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6991909195038589798==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="upFcVDVkXP8V4qFX"
Content-Disposition: inline


--upFcVDVkXP8V4qFX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Ley Foon Tan,

Apologies for my various bits of confusion.

On Tue, Jan 03, 2023 at 11:53:16AM +0800, Ley Foon Tan wrote:
> topology_parse_cpu_capacity() is failed to allocate memory with kcalloc()
> after read "capacity-dmips-mhz" DT parameter in CPU DT nodes. This
> topology_parse_cpu_capacity() is called from init_cpu_topology(), move
> call to init_cpu_topology() to later initialization  stage (after memory
> allocation is available).
>=20
> Note, this refers to ARM64 implementation, call init_cpu_topology() in
> smp_prepare_cpus().
>=20
> Tested on Qemu platform.

I'd like to suggest a change to the commit message:
```
If "capacity-dmips-mhz" is present in a CPU DT node,
topology_parse_cpu_capacity() will fail to allocate memory.
arm64, with which this code path is shared, does not call
topology_parse_cpu_capacity() until later in boot where memory
allocation is available.
While "capacity-dmips-mhz" is not yet a valid property on RISC-V,
invalid properties should be ignored rather than cause issues.
Move init_cpu_topology(), which calls topology_parse_cpu_capacity(),
to a later initialization stage, to match arm64.

As a side effect of this change, RISC-V is "protected" from changes to
core topology code that would work on arm64 where memory allocation is
safe but on RISC-V isn't.
```

You don't need to use exactly that, but with something along those
lines:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

>=20
> Signed-off-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
>=20
> ---
>=20
> In drivers/base/arch_topology.c: topology_parse_cpu_capacity():
>=20
> 	ret =3D of_property_read_u32(cpu_node, "capacity-dmips-mhz",
> 				   &cpu_capacity);
> 	if (!ret) {
> 		if (!raw_capacity) {
> 			raw_capacity =3D kcalloc(num_possible_cpus(),
> 					       sizeof(*raw_capacity),
> 					       GFP_KERNEL);
> 			if (!raw_capacity) {
> 				cap_parsing_failed =3D true;
> 				return false;
> 			}
> ---
>  arch/riscv/kernel/smpboot.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
> index 3373df413c88..ddb2afba6d25 100644
> --- a/arch/riscv/kernel/smpboot.c
> +++ b/arch/riscv/kernel/smpboot.c
> @@ -39,7 +39,6 @@ static DECLARE_COMPLETION(cpu_running);
> =20
>  void __init smp_prepare_boot_cpu(void)
>  {
> -	init_cpu_topology();
>  }
> =20
>  void __init smp_prepare_cpus(unsigned int max_cpus)
> @@ -48,6 +47,8 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
>  	int ret;
>  	unsigned int curr_cpuid;
> =20
> +	init_cpu_topology();
> +
>  	curr_cpuid =3D smp_processor_id();
>  	store_cpu_topology(curr_cpuid);
>  	numa_store_cpu_info(curr_cpuid);
> --=20
> 2.25.1
>=20

--upFcVDVkXP8V4qFX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY7V4bwAKCRB4tDGHoIJi
0o0PAP9HD9PLqgsCZxfFPCseSIFNVy2GxrDM9AOY7oa7VqDuPgD/cAkklAAE+I71
MIeO+K6gmi6G4ENFCyIG/KlgIrjdkAU=
=kUSK
-----END PGP SIGNATURE-----

--upFcVDVkXP8V4qFX--


--===============6991909195038589798==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6991909195038589798==--

