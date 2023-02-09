Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD615C61DA4
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Feb 2023 21:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YHqrOT67IK/SmOcYg1i9VOGH6yJW3DNbkp1RaJlZUXg=; b=a6TytnCN4H67f4T50NZM6vnE7c
	wsjOHo5abms5Xg6MrpiJaAvyjLq+wu1fjEVdMur4K0zDuaEysFKJ7zQ1LUIqJQIoJtMuVVIip/8h7
	yYCtretr1AW/z90of3Zu7SAeQFxBNeGbJxQc3yHM1jWyFD6LpN8LtxwuKG0qUeZJIOq53kP3N6/1f
	4YPBXP1JVi6C0moBfsmXVSlTFb1ESG0oW6KC6th42w+TlsSToLipHQ4WDLWJwttRF8yIMyzkNoTBC
	P7Bsju3egRB3Am1i9YPzsU4LH5V72ldUbs+0yBs/BKpzJH4y4eyb68L7rgJnuqvizyUIfvK93CbLv
	S9NWKuIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQElw-003JkF-CA; Thu, 09 Feb 2023 21:48:04 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQElt-003JjR-2X
	for linux-riscv@lists.infradead.org; Thu, 09 Feb 2023 21:48:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 53810B816DD;
	Thu,  9 Feb 2023 21:47:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9696C433D2;
	Thu,  9 Feb 2023 21:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675979278;
	bh=mErqtIQBoeSkdSxOuenf0IjrrVZ2mXhZeJP7FHByKv4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SstulZTHFiZBnb+Ul+dLXXuM1lUa2z/NHAz4mWnpHEkkZIo7xZly4ps8MY0PzEBdn
	 /NKR5KfxakdDN2OKlemJEHGbf/gFlbNtwuBTgEhH2LH8YvjqA7g3QsaPrpSumHxuLB
	 2rYVFPq/09Yd5pp24WCwdIBxRoAIaLK242olaedynGus+O/mEDrDYwnIaY6ApUAXn/
	 Fr+UZ7Z7NqoChGYZnS+yM0T7PxBpCwvLrzOtbI49e9aaBAjzXOZvmCH7KrNMxQw1bQ
	 zkm4gfeV7i2BrXXZhZ7rpEC/S6HRFHxWpQnvS4TVXLPOp10xAnC7etmwSA7oMW16w9
	 w29t8/39fOSjA==
Date: Thu, 9 Feb 2023 21:47:52 +0000
From: Conor Dooley <conor@kernel.org>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Anup Patel <apatel@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH 19/24] RISC-V: ACPI: cpufeature: Add ACPI support in
 riscv_fill_hwcap()
Message-ID: <Y+VqCLVETZBRn6iX@spud>
References: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
 <20230130182225.2471414-20-sunilvl@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230130182225.2471414-20-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_134801_453964_EF481F35 
X-CRM114-Status: GOOD (  25.21  )
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
Content-Type: multipart/mixed; boundary="===============8466934024341614067=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8466934024341614067==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tx9qe1Dbq1j6lMq2"
Content-Disposition: inline


--tx9qe1Dbq1j6lMq2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 30, 2023 at 11:52:20PM +0530, Sunil V L wrote:
> On ACPI based systems, the information about the hart
> like ISA, extesions supported are defined in RISC-V Hart
> Capabilities Table (RHCT). Enable filling up hwcap structure
> based on the information in RHCT.
>=20
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
>  arch/riscv/kernel/cpufeature.c | 45 ++++++++++++++++++++++++++++------
>  1 file changed, 38 insertions(+), 7 deletions(-)
>=20
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeatur=
e.c
> index 93e45560af30..c10177c608f8 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -6,12 +6,14 @@
>   * Copyright (C) 2017 SiFive
>   */
> =20
> +#include <linux/acpi.h>
>  #include <linux/bitmap.h>
>  #include <linux/ctype.h>
>  #include <linux/libfdt.h>
>  #include <linux/log2.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> +#include <asm/acpi.h>
>  #include <asm/alternative.h>
>  #include <asm/cacheflush.h>
>  #include <asm/errata_list.h>
> @@ -21,6 +23,7 @@
>  #include <asm/processor.h>
>  #include <asm/smp.h>
>  #include <asm/switch_to.h>
> +#include <linux/of_device.h>

Is there a reason this header is not added with the other linux ones?

> =20
>  #define NUM_ALPHA_EXTS ('z' - 'a' + 1)
> =20
> @@ -93,7 +96,10 @@ void __init riscv_fill_hwcap(void)
>  	char print_str[NUM_ALPHA_EXTS + 1];
>  	int i, j, rc;
>  	unsigned long isa2hwcap[26] =3D {0};
> +	struct acpi_table_header *rhct;
> +	acpi_status status;
>  	unsigned long hartid;
> +	unsigned int cpu;
> =20
>  	isa2hwcap['i' - 'a'] =3D COMPAT_HWCAP_ISA_I;
>  	isa2hwcap['m' - 'a'] =3D COMPAT_HWCAP_ISA_M;
> @@ -106,18 +112,38 @@ void __init riscv_fill_hwcap(void)
> =20
>  	bitmap_zero(riscv_isa, RISCV_ISA_EXT_MAX);
> =20
> -	for_each_of_cpu_node(node) {
> +	if (!acpi_disabled) {
> +

Extraneous blank line.

> +		status =3D acpi_get_table(ACPI_SIG_RHCT, 0, &rhct);
> +		if (ACPI_FAILURE(status))
> +			return;
> +	}
> +
> +	for_each_possible_cpu(cpu) {
>  		unsigned long this_hwcap =3D 0;
>  		DECLARE_BITMAP(this_isa, RISCV_ISA_EXT_MAX);
>  		const char *temp;
> =20
> -		rc =3D riscv_of_processor_hartid(node, &hartid);
> -		if (rc < 0)
> -			continue;
> +		if (acpi_disabled) {
> +			node =3D of_cpu_device_node_get(cpu);
> +			if (node) {
> +				rc =3D riscv_of_processor_hartid(node, &hartid);
> +				if (rc < 0)
> +					continue;
> =20
> -		if (of_property_read_string(node, "riscv,isa", &isa)) {
> -			pr_warn("Unable to find \"riscv,isa\" devicetree entry\n");
> -			continue;
> +				if (of_property_read_string(node, "riscv,isa", &isa)) {
> +					pr_warn("Unable to find \"riscv,isa\" devicetree entry\n");
> +					continue;
> +				}
> +				of_node_put(node);
> +			}
> +		} else {
> +			rc =3D acpi_get_riscv_isa(rhct, get_acpi_id_for_cpu(cpu), &isa);
> +			if (rc < 0) {
> +				pr_warn("Unable to get ISA for the hart - %d\n",
> +						cpu);

The alignment here is wrong, but the whole thing fits on a single line.

> +				continue;
> +			}
>  		}
> =20
>  		temp =3D isa;
> @@ -248,6 +274,11 @@ void __init riscv_fill_hwcap(void)
>  			bitmap_and(riscv_isa, riscv_isa, this_isa, RISCV_ISA_EXT_MAX);
>  	}
> =20
> +#ifdef CONFIG_ACPI

Is this guard actually needed, or is acpi_put_table() always available?

Cheers,
Conor.

> +	if (!acpi_disabled)
> +		acpi_put_table((struct acpi_table_header *)rhct);
> +#endif
> +
>  	/* We don't support systems with F but without D, so mask those out
>  	 * here. */
>  	if ((elf_hwcap & COMPAT_HWCAP_ISA_F) && !(elf_hwcap & COMPAT_HWCAP_ISA_=
D)) {
> --=20
> 2.38.0
>=20

--tx9qe1Dbq1j6lMq2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY+VqCAAKCRB4tDGHoIJi
0m5QAPwMDmitQMHMHgWtvl8vIeneoI4WB6elm/3BD+sWuPP5KAEA6kzrjw0V+tgt
KGBDasSPck7Ye/6hmVuYcnvm5llFhg0=
=F1+4
-----END PGP SIGNATURE-----

--tx9qe1Dbq1j6lMq2--


--===============8466934024341614067==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8466934024341614067==--

