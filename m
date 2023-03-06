Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BE61C61DA4
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Mar 2023 20:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+SPjBpiNYFsVP9oXdQTfcM7rkCW4/oln+nomzYY+6+A=; b=ezinVOldeu/FddEjxE2CB5O6Ya
	ABmie1VPITl3NamFyYB6NGw4petcWxup+yxHPvNmurNjmsDDgMsv/PpWCEZ7oaOm3dMamjzEp/2zK
	4RTfeFWHNPe+Q1jkT/ETLsDYbtgpicw7H92qD3eFq9ImOrGzl1dsCXotb191xTCzZpDWfMOi3jAIK
	DERiryZnA85hcAF4lIKzR2kYQFxOCbRPnNPp8LQXTN4hAIi70aIDRcuNrtWhrcPcLR8fDJjDCipyB
	Bdm76OqJoatQNkZhLJx3wkGRO0Fqyv3dw7j2SUn6UVUmZ+bJQ9og1gR/I7RcM105rgT1NyRhwxcvX
	8cZzgT4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZHD7-00Epiz-0M; Mon, 06 Mar 2023 20:13:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZH0O-00EjVn-AD
	for linux-riscv@lists.infradead.org; Mon, 06 Mar 2023 20:00:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4DC3A61150;
	Mon,  6 Mar 2023 20:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2678DC433EF;
	Mon,  6 Mar 2023 20:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678132817;
	bh=AxHvlpfLjOwTANxLd6VrRMzYOYbF6/7K0BRwAsfJ/5s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jw0+SFdAMe9+0fOo/UPDSu3Afj5VtMLemW89Xl7UltRJsH0v2o2rhJ9iQigg1SI8J
	 nlHI+pLd6JxLLQXb48+ZQVGZVwltTuIeBssLJ4YafY67UlJohp+aVElTs1i+00Pjhp
	 JjXrtjDp1dhlU0ElsgrLoCCOYIkK7afqp9bHAuzi1J9E17SP29FvYA3xKiMsEhJGmR
	 MoAD1+W+JNNPZa5BIQ56Cg91VS24ZFIaNU6u3wZfUAGM/p3HEPyctqBDYJyyOx/ltm
	 0SCTNzGGCkqAQdpHA+rKSfziJymxtuXoCdNDihvmnkRfkO7CgruKySrxUXglwx00Xh
	 DUrJT7tzmRHew==
Date: Mon, 6 Mar 2023 20:00:11 +0000
From: Conor Dooley <conor@kernel.org>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Anup Patel <apatel@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	'Conor Dooley ' <conor.dooley@microchip.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Subject: Re: [PATCH V3 06/20] RISC-V: Add support to build the ACPI core
Message-ID: <fd4999f9-a7d8-4f5e-be0f-91e1efbf21eb@spud>
References: <20230303133647.845095-1-sunilvl@ventanamicro.com>
 <20230303133647.845095-7-sunilvl@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230303133647.845095-7-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_120023_798503_89B54458 
X-CRM114-Status: GOOD (  26.00  )
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
Content-Type: multipart/mixed; boundary="===============8990783567489076465=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8990783567489076465==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9+FvKgvIq+CWCBoo"
Content-Disposition: inline


--9+FvKgvIq+CWCBoo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 03, 2023 at 07:06:33PM +0530, Sunil V L wrote:
> Enable ACPI core for RISC-V after adding architecture-specific
> interfaces and header files required to build the ACPI core.
>=20
> 1) Couple of header files are required unconditionally by the ACPI
> core. Add empty acenv.h and cpu.h header files.
>=20
> 2) If CONFIG_PCI is enabled, a few PCI related interfaces need to
> be provided by the architecture. Define dummy interfaces for now
> so that build succeeds. Actual implementation will be added when
> PCI support is added for ACPI along with external interrupt
> controller support.
>=20
> 3) A few globals and memory mapping related functions specific
> to the architecture need to be provided.
>=20
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

> diff --git a/arch/riscv/include/asm/acenv.h b/arch/riscv/include/asm/acen=
v.h
> new file mode 100644
> index 000000000000..22123c5a4883
> --- /dev/null
> +++ b/arch/riscv/include/asm/acenv.h
> @@ -0,0 +1,11 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * RISC-V specific ACPICA environments and implementation
> + */
> +
> +#ifndef _ASM_ACENV_H
> +#define _ASM_ACENV_H
> +
> +/* It is required unconditionally by ACPI core */

Think I pointed out on v1 that this comment doesn't really make any
sense. s/It/This header/.

> +
> +#endif /* _ASM_ACENV_H */
> diff --git a/arch/riscv/include/asm/acpi.h b/arch/riscv/include/asm/acpi.h
> new file mode 100644
> index 000000000000..0b52a190f71a
> --- /dev/null
> +++ b/arch/riscv/include/asm/acpi.h
> @@ -0,0 +1,61 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + *  Copyright (C) 2013-2014, Linaro Ltd.
> + *	Author: Al Stone <al.stone@linaro.org>
> + *	Author: Graeme Gregory <graeme.gregory@linaro.org>
> + *	Author: Hanjun Guo <hanjun.guo@linaro.org>
> + *
> + *  Copyright (C) 2021-2023, Ventana Micro Systems Inc.
> + *	Author: Sunil V L <sunilvl@ventanamicro.com>
> + */
> +
> +#ifndef _ASM_ACPI_H
> +#define _ASM_ACPI_H
> +
> +/* Basic configuration for ACPI */
> +#ifdef CONFIG_ACPI
> +
> +/* ACPI table mapping after acpi_permanent_mmap is set */
> +void *acpi_os_ioremap(acpi_physical_address phys, acpi_size size);
> +#define acpi_os_ioremap acpi_os_ioremap
> +
> +#define acpi_strict 1   /* No out-of-spec workarounds on RISC-V */
                        ^^^
Kinda weird whitespace here, my editor noticed and my OCD won't let it
go unsaid :/ You used a tab before similar use comments later in this
patch.

> +extern int acpi_disabled;
> +extern int acpi_noirq;
> +extern int acpi_pci_disabled;
> +
> +static inline void disable_acpi(void)
> +{
> +	acpi_disabled =3D 1;
> +	acpi_pci_disabled =3D 1;
> +	acpi_noirq =3D 1;
> +}
> +
> +static inline void enable_acpi(void)
> +{
> +	acpi_disabled =3D 0;
> +	acpi_pci_disabled =3D 0;
> +	acpi_noirq =3D 0;
> +}
> +
> +/*
> + * The ACPI processor driver for ACPI core code needs this macro
> + * to find out this cpu was already mapped (mapping from CPU hardware
                 ^
missing word "whether"

> diff --git a/arch/riscv/include/asm/cpu.h b/arch/riscv/include/asm/cpu.h
> new file mode 100644
> index 000000000000..ea1a88b3d5f2
> --- /dev/null
> +++ b/arch/riscv/include/asm/cpu.h
> @@ -0,0 +1,8 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef _ASM_CPU_H
> +#define _ASM_CPU_H
> +
> +/* It is required unconditionally by ACPI core */

Same comment here, what is "it"?

> +
> +#endif /* _ASM_CPU_H */
> diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
> index 67f542be1bea..f979dc8cf47d 100644
> --- a/arch/riscv/kernel/Makefile
> +++ b/arch/riscv/kernel/Makefile
> @@ -90,3 +90,5 @@ obj-$(CONFIG_EFI)		+=3D efi.o
>  obj-$(CONFIG_COMPAT)		+=3D compat_syscall_table.o
>  obj-$(CONFIG_COMPAT)		+=3D compat_signal.o
>  obj-$(CONFIG_COMPAT)		+=3D compat_vdso/
> +
> +obj-$(CONFIG_ACPI)              +=3D acpi.o

This file appears to be tab aligned (at least the other lines in the
diff are), so please tab align this one too.

Those are all nitpick things though, so w/ 'em fixed:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--9+FvKgvIq+CWCBoo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZAZGSwAKCRB4tDGHoIJi
0oqrAQDYd5f2BgFLmD42W5VN9nGvnggZqkeD7UtcmGSutrJRWQEAuy9U3AfHyxyR
DJXs7W6ZRRcuu4bWGRV3vwl8C6UZgws=
=xAHB
-----END PGP SIGNATURE-----

--9+FvKgvIq+CWCBoo--


--===============8990783567489076465==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8990783567489076465==--

