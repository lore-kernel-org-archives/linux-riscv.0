Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16FC5C05027
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Feb 2023 21:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F+bSFW0CrKDOc7gLbRCZYyWjv3IWaZlfpm4Pf2T2oFQ=; b=G4qVubZCdiQZS9gp7ORqf+b24m
	ePOlFFyvb0u1OKosQ87tw/DT09t4BEGmCOqR9gEIYA79HUF+Nl4hBd354kbpbyPWKCdfQdVOZ//PT
	MkO7nLh/3kBSibI8eCQ6vD1iJriGRW30OQ09J9g3Kw3HLhdLEPevjmHAntm5If5Rn3WXvCsdLbmHB
	zPsX8RnPHhC/fv+JXlPCRgX5Tpqn7RbySek8QCBML17RBmy9qd9cNLfRxFOzSOB9q06OMfF2vhkFL
	Ku91zNx98a62c9clDQjL7sMy1yP6a9E0ATAqJTSrxnQFUtRc1NQgHuNdErCx+I+oGeV1r5Hdi4UII
	M/MYKs6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQErp-003KR9-9E; Thu, 09 Feb 2023 21:54:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQErm-003KQ9-H2
	for linux-riscv@lists.infradead.org; Thu, 09 Feb 2023 21:54:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4F29B61BE7;
	Thu,  9 Feb 2023 21:54:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 005C7C433D2;
	Thu,  9 Feb 2023 21:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675979645;
	bh=vQHM1OmRYQezs1QT58/QKDPYGkARYmj/V8EfqvpU9KA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s/CbRAFl/FjApouvB+esmVUq7gObd6qZ/xcLA4A6i65tY6b0Gxojs/OtF/+nB98KN
	 xUpYxlVxQ+qPH2ANzPmkQ87lBdTAzhrrj5L5QMsAKcooENRKVUG4W2GKsk1gtbNDlH
	 OG4qjl/tHwwyhj1fpba0ZbdLRCjGnxHOhAOa8O49mJL8f15k1iKQk/hp3AZbbd6LTm
	 gzA0rBN8vVyi7vtNr+BFQFc+mrSsgr2ROd2mFt24+LJOSOMFxpv+alvXaNTgHMgnn3
	 J5C1e3xM9bJcOSwoIG+EcGz6YTC6hdcCGLgKdzReC44y2XXR9R09AYoggMy3r7xWUI
	 nLfI1o9XZ1Ldw==
Date: Thu, 9 Feb 2023 21:53:59 +0000
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
Subject: Re: [PATCH 21/24] RISC-V: ACPI: Add ACPI initialization in
 setup_arch()
Message-ID: <Y+Vrd88ShoaDc0Pv@spud>
References: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
 <20230130182225.2471414-22-sunilvl@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230130182225.2471414-22-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_135406_665078_5D4662F8 
X-CRM114-Status: GOOD (  20.22  )
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
Content-Type: multipart/mixed; boundary="===============6993373538269746996=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6993373538269746996==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ult5KqiXxhzSQt3L"
Content-Disposition: inline


--ult5KqiXxhzSQt3L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 30, 2023 at 11:52:22PM +0530, Sunil V L wrote:
> Initialize ACPI tables for RISC-V during boot.
>=20
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
>  arch/riscv/kernel/setup.c | 19 ++++++++++++++-----
>  1 file changed, 14 insertions(+), 5 deletions(-)
>=20
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index 4335f08ffaf2..5b4ad1baf664 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -8,6 +8,7 @@
>   *  Nick Kossifidis <mick@ics.forth.gr>
>   */
> =20
> +#include <linux/acpi.h>
>  #include <linux/init.h>
>  #include <linux/mm.h>
>  #include <linux/memblock.h>
> @@ -276,14 +277,22 @@ void __init setup_arch(char **cmdline_p)
> =20
>  	efi_init();
>  	paging_init();
> +
> +	/* Parse the ACPI tables for possible boot-time configuration */
> +	acpi_boot_table_init();
> +	if (acpi_disabled) {
>  #if IS_ENABLED(CONFIG_BUILTIN_DTB)

I only poked it with a stick, but I think this `#if IS_ENABLED()` can
be changed to a normal `if (IS_ENABLED())` while you're already
modifying this code.

> -	unflatten_and_copy_device_tree();
> +		unflatten_and_copy_device_tree();
>  #else
> -	if (early_init_dt_verify(__va(XIP_FIXUP(dtb_early_pa))))
> -		unflatten_device_tree();
> -	else
> -		pr_err("No DTB found in kernel mappings\n");
> +		if (early_init_dt_verify(__va(XIP_FIXUP(dtb_early_pa))))
> +			unflatten_device_tree();
> +		else
> +			pr_err("No DTB found in kernel mappings\n");
>  #endif
> +	} else {
> +		early_init_dt_verify(__va(XIP_FIXUP(dtb_early_pa)));
> +	}
> +
>  	early_init_fdt_scan_reserved_mem();
>  	misc_mem_init();
> =20
> --=20
> 2.38.0
>=20

--ult5KqiXxhzSQt3L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY+VrdwAKCRB4tDGHoIJi
0qvyAP0cVO26J79g8D/az7U6nEgBc35prUqYssgqN0BxemUAWQD/Q+WSgRCcQlie
1kN+R1JSC4Db+QOviUFUJJ8F20DlTA8=
=0d4o
-----END PGP SIGNATURE-----

--ult5KqiXxhzSQt3L--


--===============6993373538269746996==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6993373538269746996==--

