Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 514C5C61DA4
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Feb 2023 21:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tBvrEyFPSpyqFxBmKO+NF6/qleu5kNNN2aACQ4KwpIo=; b=eLwxHZv0GFuvi8WUXagGS5i9qV
	BGaOpV95BzlvRYWp3MgEZwYJazwOOYW3/kSgnURj2RqrzNrxp+R10gbVXA2pW9Kj7A7z9vStVj7rX
	5yQYn5xyPYZBfIDXduLeVNh8/itLkOGx24ETxUwMHRbkVNri92Tf9Ul3i7E5c1nW2ZmvwofCRA1hV
	KqI6ERFsCe9yfuaJYpgE30pOK2XPNiWDEjpRvEh2lbsn0CXos7sh6rgqINTchI/D6cwnju5y79opR
	UeziXFTlCN/D32tqJdFeBUTU5ovKOUgadr4fSCrXxXulbVtIgfvrFB9leC9aQMXE+HglYgY5HxP2V
	A2J4PxVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQEEn-003FrK-UW; Thu, 09 Feb 2023 21:13:49 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQEEl-003Fqd-1j
	for linux-riscv@lists.infradead.org; Thu, 09 Feb 2023 21:13:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 210BD61BBE;
	Thu,  9 Feb 2023 21:13:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64891C433EF;
	Thu,  9 Feb 2023 21:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675977223;
	bh=DUiPVlHbL2i0BESbk6WD0HB3BwdUtI3zLk+jk/oecSk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R99QZlvYfFH5BdG12Odtu+dq7zA3DAXy676GePCzsshtibVimjpNyI1fuj+FQ3TC6
	 6e+t/pCXTKUGH0PE2MSqDGMIDyVyrSS/dlrK94DB4cN5MksGMut5jB5ixj7N3GoO6N
	 ktTvYmbl5NJ/bALFTKG/HDt9/V7iev1gqSu3ZxlspESouHg0ZHOv654JjRVCBQKmc3
	 W96DSJWFVEp22NFG+fpqbV4IdxLnytmsWzs8zEuS1QrAC8VlEh5hEVZjUJjfMBbUxv
	 n+0q2N5vuNyOduNVOtMnEX5Z/qNx28UviuCsEU5KFn9f12IncZxnrHKx7MKca85Y1M
	 /4DTTCuCA09Fg==
Date: Thu, 9 Feb 2023 21:13:37 +0000
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
Subject: Re: [PATCH 20/24] RISC-V: ACPI: cpu: Enable cpuinfo for ACPI systems
Message-ID: <Y+ViASnch0Fp1rju@spud>
References: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
 <20230130182225.2471414-21-sunilvl@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230130182225.2471414-21-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_131347_195012_A87EF33D 
X-CRM114-Status: GOOD (  23.93  )
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
Content-Type: multipart/mixed; boundary="===============4007085554310162944=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4007085554310162944==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lYAs3kYMw0C9GEQE"
Content-Disposition: inline


--lYAs3kYMw0C9GEQE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 30, 2023 at 11:52:21PM +0530, Sunil V L wrote:
> On ACPI based platforms, few details like ISA need to be read
> from the ACPI table. Enable cpuinfo on ACPI based systems.
>=20
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
>  arch/riscv/kernel/cpu.c | 36 +++++++++++++++++++++++++++++-------
>  1 file changed, 29 insertions(+), 7 deletions(-)
>=20
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index 1b9a5a66e55a..bd6c0fcfe4ce 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -3,6 +3,7 @@
>   * Copyright (C) 2012 Regents of the University of California
>   */
> =20
> +#include <linux/acpi.h>
>  #include <linux/cpu.h>
>  #include <linux/init.h>
>  #include <linux/seq_file.h>
> @@ -256,26 +257,47 @@ static void c_stop(struct seq_file *m, void *v)
>  {
>  }
> =20
> +#ifdef CONFIG_ACPI
> +void acpi_print_hart_info(struct seq_file *m,
> +			  unsigned long cpu)

Surely this fits on one line?

> +{
> +	const char *isa;
> +
> +	if (!acpi_get_riscv_isa(NULL, get_acpi_id_for_cpu(cpu), &isa))
> +		print_isa(m, isa);

Do you really need to guard this function? Aren't there nop'ed versions
of acpi_get_riscv_isa() and get_acpi_id_for_cpu() in acpi.h?

IMO, basically any use of ifdeffery you can cleanly remove from a c file
is a worthwhile change.

> +

Extra blank line here FYI.

> +}
> +#endif
> +
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
> +
> +	if (acpi_disabled) {
> +		node =3D of_get_cpu_node(cpu_id, NULL);
> +		if (!of_property_read_string(node, "riscv,isa", &isa))
> +			print_isa(m, isa);
> +		if (!of_property_read_string(node, "compatible", &compat)
> +		    && strcmp(compat, "riscv"))
                    ^^ this should be on the line above
TBH the whole series is in need of a checkpatch --strict run IMO,
there's a bunch of coding style issues throughout.

> +			seq_printf(m, "uarch\t\t: %s\n", compat);
> +		of_node_put(node);
> +	}
> +#ifdef CONFIG_ACPI
> +	else
> +		acpi_print_hart_info(m, cpu_id);

Delete the ifdeffery here too please :)

Cheers,
Conor.

> +#endif
> +
>  	print_mmu(m);
> -	if (!of_property_read_string(node, "compatible", &compat)
> -	    && strcmp(compat, "riscv"))
> -		seq_printf(m, "uarch\t\t: %s\n", compat);
>  	seq_printf(m, "mvendorid\t: 0x%lx\n", ci->mvendorid);
>  	seq_printf(m, "marchid\t\t: 0x%lx\n", ci->marchid);
>  	seq_printf(m, "mimpid\t\t: 0x%lx\n", ci->mimpid);
>  	seq_puts(m, "\n");
> -	of_node_put(node);
> =20
>  	return 0;
>  }
> --=20
> 2.38.0
>

--lYAs3kYMw0C9GEQE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY+ViAQAKCRB4tDGHoIJi
0vwtAPwKUcxsKZbj5EQcYSNTBdh9vOSoaePgBA+etKu/vUSzQAEAgoV/ifyiHBpa
FmQgavvEOHSnPG7rQ97kcJAAxkAmHwg=
=c/EG
-----END PGP SIGNATURE-----

--lYAs3kYMw0C9GEQE--


--===============4007085554310162944==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4007085554310162944==--

