Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13219E784BE
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Oct 2023 15:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vBOgrklzhhKbQyIQ+CupfceRDewSG9Rmc0Z/qY/U7+w=; b=jR48iqmn7js7MIbC98bby+IW8x
	iXvA71NWr8hxsBT7DM251B4jNhZUKm1tcbt86EgvBeZluVxMHQkbHLqNyBVESqKRybcqLmc9zsxQE
	L4DGhvHeHyVvetVlJQTfxUDJ05aBbj6c6+04ZTT4Gjic05TTf5ZvVNdUeCNf/GJIUWbKw3hp8mFIB
	G23sOlGz32TntU2fwIOxZ6OgsNrrE0t1tD9hLI0+7WYA+mX+2ylwUC5flVIbrcbjxbqx2yK0LLvqn
	2kKl+N9mjY8B4/bEOo1gpEnXDL4Bt+O2bRjVIXYqyqFIrbniSTQiN8eBvkZYRSokxPIalYqDnNpSc
	kvk5NAWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnLBs-00D18R-1W;
	Mon, 02 Oct 2023 15:50:36 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnLBn-00D17f-0z
	for linux-riscv@lists.infradead.org;
	Mon, 02 Oct 2023 15:50:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9C3EECE118D;
	Mon,  2 Oct 2023 15:50:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6944AC433C7;
	Mon,  2 Oct 2023 15:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696261828;
	bh=O72E3ZVNiuEo0RBUJoTwRkR159xNbbJrFOP9dMKbWJA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tvRWKuVWaj8ZDjW2PP+a9TusRDq1llpPG8Nk7Nsz4ZPHQndBkZSfaUHAPBv3C8zEv
	 iNleVb7s8tlNmWvnQXBgu+ir00/xLNR8+oI+jrJAoFHUnKIxJOWYBdi18PS6GBsunw
	 t428Gpxn+T3QYlr8ELm1Gi1HpIouWSoX0gqX0lzzXm8JWomZrQT5xEVyXuKOdmFjd2
	 7XDDYGiKRpMdbuj8+/EqChEEk0rdxDTWq55vAcJR5HfSUKn/nH2TUAAfiHUUyw1VPQ
	 BewBCu+ZtGWDYUcV6muQjccMoe5iS5Ak/L6mgpei0hCPILemPrQpwxAxAlVJkaK7JE
	 yMMqQWpMCydiA==
Date: Mon, 2 Oct 2023 16:50:23 +0100
From: Conor Dooley <conor@kernel.org>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Atish Kumar Patra <atishp@rivosinc.com>
Subject: Re: [PATCH v2 -next 3/4] RISC-V: cacheflush: Initialize CBO
 variables on ACPI systems
Message-ID: <20231002-anyplace-impending-bcb62ca90f79@spud>
References: <20230927170015.295232-1-sunilvl@ventanamicro.com>
 <20230927170015.295232-4-sunilvl@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230927170015.295232-4-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_085031_699966_9203CC87 
X-CRM114-Status: GOOD (  20.58  )
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
Content-Type: multipart/mixed; boundary="===============6833789730780007544=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6833789730780007544==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="o8PPxZtlZhU/WX3V"
Content-Disposition: inline


--o8PPxZtlZhU/WX3V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 27, 2023 at 10:30:14PM +0530, Sunil V L wrote:
> Using new interface to get the CBO block size information in RHCT,
> initialize the variables on ACPI platforms.
>=20
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>

Otherwise,
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.
> ---
>  arch/riscv/mm/cacheflush.c | 37 +++++++++++++++++++++++++++++++------
>  1 file changed, 31 insertions(+), 6 deletions(-)
>=20
> diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
> index f1387272a551..8e59644e473c 100644
> --- a/arch/riscv/mm/cacheflush.c
> +++ b/arch/riscv/mm/cacheflush.c
> @@ -3,7 +3,9 @@
>   * Copyright (C) 2017 SiFive
>   */
> =20
> +#include <linux/acpi.h>
>  #include <linux/of.h>
> +#include <asm/acpi.h>
>  #include <asm/cacheflush.h>
> =20
>  #ifdef CONFIG_SMP
> @@ -124,15 +126,38 @@ void __init riscv_init_cbo_blocksizes(void)
>  	unsigned long cbom_hartid, cboz_hartid;
>  	u32 cbom_block_size =3D 0, cboz_block_size =3D 0;
>  	struct device_node *node;
> +	struct acpi_table_header *rhct;
> +	acpi_status status;
> +	unsigned int cpu;
> +
> +	if (!acpi_disabled) {
> +		status =3D acpi_get_table(ACPI_SIG_RHCT, 0, &rhct);
> +		if (ACPI_FAILURE(status))
> +			return;
> +	}
> =20
> -	for_each_of_cpu_node(node) {
> -		/* set block-size for cbom and/or cboz extension if available */
> -		cbo_get_block_size(node, "riscv,cbom-block-size",
> -				   &cbom_block_size, &cbom_hartid);
> -		cbo_get_block_size(node, "riscv,cboz-block-size",
> -				   &cboz_block_size, &cboz_hartid);
> +	for_each_possible_cpu(cpu) {
> +		if (acpi_disabled) {
> +			node =3D of_cpu_device_node_get(cpu);
> +			if (!node) {
> +				pr_warn("Unable to find cpu node\n");
> +				continue;
> +			}
> +
> +			/* set block-size for cbom and/or cboz extension if available */
> +			cbo_get_block_size(node, "riscv,cbom-block-size",
> +					   &cbom_block_size, &cbom_hartid);
> +			cbo_get_block_size(node, "riscv,cboz-block-size",
> +					   &cboz_block_size, &cboz_hartid);
> +		} else {
> +			acpi_get_cbo_block_size(rhct, cpu, &cbom_block_size,
> +						&cboz_block_size, NULL);
> +		}
>  	}
> =20
> +	if (!acpi_disabled && rhct)
> +		acpi_put_table((struct acpi_table_header *)rhct);
> +
>  	if (cbom_block_size)
>  		riscv_cbom_block_size =3D cbom_block_size;
> =20
> --=20
> 2.39.2
>=20

--o8PPxZtlZhU/WX3V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZRrmvwAKCRB4tDGHoIJi
0nf8AQCTxt4VlxBrgtIhfufLcu2yyKEOu8gbSQy5sLNEU03knAD/crKrOne+Xeiz
FzWiJRzcnFcqSj505sbzYo5m/x8tZQs=
=z/P5
-----END PGP SIGNATURE-----

--o8PPxZtlZhU/WX3V--


--===============6833789730780007544==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6833789730780007544==--

