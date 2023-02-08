Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEEB3C64EC4
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Feb 2023 20:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Be0OuUF4KFEf9YiUSTUH6SbvSMJLh3Kr2ybIa2Wgbd4=; b=c7awIJ9Q3dN0LUw195UFAMJRnN
	h1lrm2AjZ0wYEb9Y48d9Ncu7Mz+zbjsOkPw0/MfeOSG2oA6TaBil+fdp7GnRBUIxwtB/bQQHphhv8
	cn316LYqTjNkWk1v0LvHI5cgx5+fgxDHkzlndym3TPlnvk1Gi/ztAZ7jbxqoybrgTkvaHTfAubtrd
	zRlSwPLkpbfToBec6eg/ev9s4Q201ueYyT/zSSPCjC2B+zahzZSammfQoTXBQ/LGoTpPVNu/OYgrg
	r6jDW0k5qNXf8oNw984dbqT60KbczeEJQHwHNS8CIfuHa9RWbseZANGAvamZa8ptZFdCAd8QvX256
	EhtJGwYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPrWd-00GwWA-2O; Wed, 08 Feb 2023 20:58:43 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPrWa-00GwVa-Jn
	for linux-riscv@lists.infradead.org; Wed, 08 Feb 2023 20:58:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id EB90AB81FAC;
	Wed,  8 Feb 2023 20:58:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74079C433D2;
	Wed,  8 Feb 2023 20:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675889917;
	bh=is7gAcM4IfXeI9zTDQOH+ZBqX7CZjmQ/2MN9YP35cLs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AiFgJb1iiW27AV/2rEeQBKIERZZfGo59uOJsYnseCldl0hBawxcEl0JzXDBJPSUQq
	 N8BJmzuQKSSBsO26MRXix85nIu6BHtN5e7SAc2bXwUDqvoGBJ7onSL8D0TLFWuQchJ
	 wJ7AK1yvpMaiF3q0Ic2yILcGB740jAxOCDhP/ylZsNrJbDYhu4Le1pnTc0eu5TsXDQ
	 zZEvQRN0w0Vy0Ei15md9ntpoIakzmXZXVWI6yBe1qAI4F0e3cdaUs0VS7UzEH7xVnf
	 fTcuAIA8evElWcDloXzofUXl8Oxwx4LGNVISq2fB5RmEVy1bSyIGIslohmhjViFw5O
	 6fv3PYFOtQhaQ==
Date: Wed, 8 Feb 2023 20:58:31 +0000
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
Subject: Re: [PATCH 05/24] RISC-V: ACPI: Add basic functions to build ACPI
 core
Message-ID: <Y+QM9zQyJfSgzc7R@spud>
References: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
 <20230130182225.2471414-6-sunilvl@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230130182225.2471414-6-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_125840_961709_7585B3FA 
X-CRM114-Status: GOOD (  18.95  )
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
Content-Type: multipart/mixed; boundary="===============3209100131089130677=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3209100131089130677==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="G6iH+nsAGGTrccE5"
Content-Disposition: inline


--G6iH+nsAGGTrccE5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 30, 2023 at 11:52:06PM +0530, Sunil V L wrote:
> Introduce acpi.c and its related header files to provide
> fundamental needs of extern variables and functions for ACPI core.
> 	- asm/acpi.h for arch specific variables and functions needed by
> 	  ACPI driver core;
> 	- acpi.c - Add function to initialize ACPI tables.
> 	- acpi.c for RISC-V related ACPI implementation for ACPI driver
> 	  core;
>=20
> Code is mostly leveraged from ARM64.



> diff --git a/arch/riscv/kernel/acpi.c b/arch/riscv/kernel/acpi.c

> + * __acpi_map_table() will be called before page_init(), so early_iorema=
p()

rg "\bpage_init\("
arch/riscv/kernel/acpi.c
54: * __acpi_map_table() will be called before page_init(), so early_iorema=
p()

arch/arm64/kernel/acpi.c
86: * __acpi_map_table() will be called before page_init(), so early_iorema=
p()

This function doesn't appear to exist, perhaps what you are looking for is
paging_init()?

> + * or early_memremap() should be called here to for ACPI table mapping.
> + */
> +void __init __iomem *__acpi_map_table(unsigned long phys, unsigned long =
size)
> +{
> +	if (!size)
> +		return NULL;
> +
> +	return early_memremap(phys, size);
> +}

> +void __init acpi_boot_table_init(void)
> +{
> +	/*
> +	 * Enable ACPI instead of device tree unless
> +	 * - ACPI has been disabled explicitly (acpi=3Doff), or
> +	 * - firmware has not populated ACPI ptr in EFI system table
> +	 */
> +
> +	if (param_acpi_off || (efi.acpi20 =3D=3D EFI_INVALID_TABLE_ADDR))

There's an extraneous set of () around the second item here.

> +		goto done;
> +	/*

A small nit: a newline before opening the comment block here please!

--G6iH+nsAGGTrccE5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY+QM9wAKCRB4tDGHoIJi
0tBAAP9pCCCIuo63d+MxWCA9/GEjrIteo5FBQkb46nsK6rFoQQD9GWwpeqTDTdZZ
yn4rtKagNMNS8BXjeK5XiMvqUTfJMAY=
=cGBw
-----END PGP SIGNATURE-----

--G6iH+nsAGGTrccE5--


--===============3209100131089130677==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3209100131089130677==--

