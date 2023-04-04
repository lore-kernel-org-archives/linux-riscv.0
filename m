Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3C55C6FD1D
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Apr 2023 21:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qm3rJM4T0n3Iuikf2gvR0jm4CScBe9MNzVlBbFfNrNk=; b=JtY937q6Hz2/sZx7VfMUcXmbUQ
	xELaKxy13j67zFGr5LmfAvMcwhWCI8z5up4vORjQEtoKBW7BhN7Z8gq2PjY0IGEMa9Qn7c0e7eDsI
	4YsweyjjtF7vBL1dSm/2WLAx4pZeeO9Gmk/oODOMSYDCl3QAvcycbPgOQMooRjPAUnFIB06X8B1EX
	aQDLWy+RGW9WflEvvzx1jFIZmiNdB/YIuF655xY8u8Y1ZcTXHxBgXv9DA/4SS41XSA8KYHe6cQLgB
	Vss0DObZxQmMrjlxkmxAnMW3GqIin3Hgm0A73cZbkKqsY7ER+0BioQ2NCnnY9jBPJkNFPQd0dCw8f
	hRsK05LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjnpz-002s2g-0p;
	Tue, 04 Apr 2023 21:05:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjnpw-002s2K-30
	for linux-riscv@lists.infradead.org;
	Tue, 04 Apr 2023 21:05:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 722D9638B6;
	Tue,  4 Apr 2023 21:05:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7703CC433D2;
	Tue,  4 Apr 2023 21:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680642303;
	bh=K+YWB6gtDBp8CY/sw1YdMADMAZus/ze/KCovhnmTEck=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uvZL46gPl/xyjGjJ3q1IGZT3hEDWU5Z1qRvJ34K5e+P+rh4U8Dulcd+kZdpBk/2fg
	 EoDwLVwBfOvewMhUzO+qQ230d3TvGufRgNY7oJnYMFhMfGw5L0D0mCgXlYMgOHKi0J
	 PuzMDNMxBK9E1lgGuog9v2Hsiyk740+qVIN+PaQsIacLtF79eZe4/mXsw7v2311Cv0
	 vGVRMg689a/17buOafoebW1qYaNZhjqjV6Sni6lBzj8PimtBFJiosrY2ynzKiLUUWR
	 GydYoC8hx9jgsCvNiEmeZ/E9TqX3I0P43gNjmi/7iwuSR1RKuyy9XwomTJEvPrGQJR
	 TiSqGmVICEIfw==
Date: Tue, 4 Apr 2023 22:04:56 +0100
From: Conor Dooley <conor@kernel.org>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
	linux-crypto@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	llvm@lists.linux.dev,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>, Tom Rix <trix@redhat.com>,
	Weili Qian <qianweili@huawei.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Mark Gross <markgross@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Zhou Wang <wangzhou1@hisilicon.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Len Brown <lenb@kernel.org>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	"David S . Miller" <davem@davemloft.net>
Subject: Re: [PATCH V4 14/23] RISC-V: cpu: Enable cpuinfo for ACPI systems
Message-ID: <20230404-overlaid-flatterer-22731133a75f@spud>
References: <20230404182037.863533-1-sunilvl@ventanamicro.com>
 <20230404182037.863533-15-sunilvl@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230404182037.863533-15-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_140505_050039_AE630000 
X-CRM114-Status: GOOD (  24.99  )
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
Content-Type: multipart/mixed; boundary="===============5867554999278299551=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5867554999278299551==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zg/bxp6Ef08iSfBi"
Content-Disposition: inline


--zg/bxp6Ef08iSfBi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 04, 2023 at 11:50:28PM +0530, Sunil V L wrote:
> On ACPI based platforms, few details like ISA need to be read
> from the ACPI table. Enable cpuinfo on ACPI based systems.
>=20
> ACPI has nothing similar to DT compatible property for each CPU.

> SBI calls must be used to get vendor/arch/imp ID for any errata.

ecalls are used on DT systems for this too FYI, vendorid/archid/impid
are not contained in the DT.
Otherwise,
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Should probably have given that conditionally last time, sorry about
that.
Thanks,
Conor.

>=20
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/kernel/cpu.c | 30 ++++++++++++++++++++++--------
>  1 file changed, 22 insertions(+), 8 deletions(-)
>=20
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index 8400f0cc9704..ace4752516d8 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -3,10 +3,12 @@
>   * Copyright (C) 2012 Regents of the University of California
>   */
> =20
> +#include <linux/acpi.h>
>  #include <linux/cpu.h>
>  #include <linux/init.h>
>  #include <linux/seq_file.h>
>  #include <linux/of.h>
> +#include <asm/acpi.h>
>  #include <asm/csr.h>
>  #include <asm/hwcap.h>
>  #include <asm/sbi.h>
> @@ -283,23 +285,35 @@ static void c_stop(struct seq_file *m, void *v)
>  static int c_show(struct seq_file *m, void *v)
>  {
>  	unsigned long cpu_id =3D (unsigned long)v - 1;
> -	struct device_node *node =3D of_get_cpu_node(cpu_id, NULL);
>  	struct riscv_cpuinfo *ci =3D per_cpu_ptr(&riscv_cpuinfo, cpu_id);
> +	struct device_node *node;
>  	const char *compat, *isa;
> =20
>  	seq_printf(m, "processor\t: %lu\n", cpu_id);
>  	seq_printf(m, "hart\t\t: %lu\n", cpuid_to_hartid_map(cpu_id));
> -	if (!of_property_read_string(node, "riscv,isa", &isa))
> -		print_isa(m, isa);
> -	print_mmu(m);
> -	if (!of_property_read_string(node, "compatible", &compat)
> -	    && strcmp(compat, "riscv"))
> -		seq_printf(m, "uarch\t\t: %s\n", compat);
> +
> +	if (acpi_disabled) {
> +		node =3D of_get_cpu_node(cpu_id, NULL);
> +		if (!of_property_read_string(node, "riscv,isa", &isa))
> +			print_isa(m, isa);
> +
> +		print_mmu(m);
> +		if (!of_property_read_string(node, "compatible", &compat) &&
> +		    strcmp(compat, "riscv"))
> +			seq_printf(m, "uarch\t\t: %s\n", compat);
> +
> +		of_node_put(node);
> +	} else {
> +		if (!acpi_get_riscv_isa(NULL, cpu_id, &isa))
> +			print_isa(m, isa);
> +
> +		print_mmu(m);
> +	}
> +
>  	seq_printf(m, "mvendorid\t: 0x%lx\n", ci->mvendorid);
>  	seq_printf(m, "marchid\t\t: 0x%lx\n", ci->marchid);
>  	seq_printf(m, "mimpid\t\t: 0x%lx\n", ci->mimpid);
>  	seq_puts(m, "\n");
> -	of_node_put(node);
> =20
>  	return 0;
>  }
> --=20
> 2.34.1
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--zg/bxp6Ef08iSfBi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZCyQ9wAKCRB4tDGHoIJi
0v51AQD/Jdo80g5XJuPuPzzfpYoAjR065ytz0121HJC/oU1PNgD7BeY4NQ7krey7
9Ah5lMqJDV5Ogs1mM3sF3tJs7eMPagQ=
=zA1D
-----END PGP SIGNATURE-----

--zg/bxp6Ef08iSfBi--


--===============5867554999278299551==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5867554999278299551==--

