Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 521FEC05027
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Feb 2023 21:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3trn+s/15AaFp+yUpxjzBiP1czs7iMjlIzk5IzU0w60=; b=pam9Vx7EXJkCSiFuM0s/YDmCrw
	LGBPDLTgljl64MLDtp04WQmVszHaXdU7/oTA9Fh6JFYrsDItW79ymdLzu/+pTtS+ARSqpKXiRNSWi
	tVGm1SXxAesXilZrM+v1YfQ0pEDHGtflXo/bySvgoJbUvDNSErvZSClm5/jg1AgxqIjuTXlEEja1Y
	1YeHgFW8U/fYB6jjtDO3bzkdJAOaToXGKxs1i8R8svI0fL0rMkkG9p1zlpzZqKzrIFFWxPtb7c+YA
	wB8ztNW1+Wuc3UCDMJoMRZHxJ7W0iX01S58snXhV8d5gI80EagccpUw/s2jqsr3+1QKQBBljISkq5
	LraKiZDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPs2m-00GzU5-0j; Wed, 08 Feb 2023 21:31:56 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPs2j-00GzT8-3J
	for linux-riscv@lists.infradead.org; Wed, 08 Feb 2023 21:31:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 7C960B81F05;
	Wed,  8 Feb 2023 21:31:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CE33C433EF;
	Wed,  8 Feb 2023 21:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675891910;
	bh=rA4gQOEFjzOk984ttGkJ0iqLtjVnP14qiD/o3VUE7i8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bP0/njXkd0bPDm6/oZMgT6Ptof/Ka2NfBb9jV2a9TNUWQ27Jf9GY0XvTU1TdWJ5w9
	 IIYTVcy3pjk4y4/qZFtlpvV6Po9rkREmDAsJv2RY4M2DDPU+FYJUy4xyyk0P1sB/Pm
	 u9kBL5TLrzkcz2jM4YwjWVIwOCXAuXkKtxeaNyrS7KVnszeCqKrilI5SvDK14t+dpr
	 H1aWp06edFlxBeCjwduVWqT24ynyidxUTHQLFdNIcnDnvtN3DAWTgzmIw7W4Wcwk1m
	 w76tflcqSAABRvhoxnp3XHgTPB3+PziXWR7eiEoBub9FHZKT1F2pwSvU2BSR5hstAL
	 EPK5QfqzPi6ig==
Date: Wed, 8 Feb 2023 21:31:44 +0000
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
Subject: Re: [PATCH 07/24] RISC-V: ACPI: Enable ACPI build infrastructure
Message-ID: <Y+QUwFIIj7tvrHpM@spud>
References: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
 <20230130182225.2471414-8-sunilvl@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230130182225.2471414-8-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_133153_313858_1E7BC519 
X-CRM114-Status: GOOD (  16.46  )
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
Content-Type: multipart/mixed; boundary="===============7497540024934798740=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7497540024934798740==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UkPMmNX0YR0XBnLk"
Content-Disposition: inline


--UkPMmNX0YR0XBnLk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 30, 2023 at 11:52:08PM +0530, Sunil V L wrote:
> Enable build infrastructure to add ACPI support for
> RISC-V.
>=20
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
>  arch/riscv/Kconfig | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index d153e1cd890b..f664350679bc 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -12,6 +12,9 @@ config 32BIT
> =20
>  config RISCV
>  	def_bool y
> +	select ACPI_GENERIC_GSI if ACPI
> +	select ACPI_MCFG if (ACPI && PCI)

These brackets are not needed, right?

> +	select ACPI_REDUCED_HARDWARE_ONLY if ACPI
>  	select ARCH_CLOCKSOURCE_INIT
>  	select ARCH_ENABLE_HUGEPAGE_MIGRATION if HUGETLB_PAGE && MIGRATION
>  	select ARCH_ENABLE_SPLIT_PMD_PTLOCK if PGTABLE_LEVELS > 2
> @@ -598,6 +601,7 @@ config EFI_STUB
>  config EFI
>  	bool "UEFI runtime support"
>  	depends on OF && !XIP_KERNEL
> +	select ARCH_SUPPORTS_ACPI if 64BIT
>  	select LIBFDT
>  	select UCS2_STRING
>  	select EFI_PARAMS_FROM_FDT
> @@ -703,3 +707,4 @@ source "drivers/cpufreq/Kconfig"
>  endmenu # "CPU Power Management"
> =20
>  source "arch/riscv/kvm/Kconfig"
> +source "drivers/acpi/Kconfig"

For consistency with the rest of the file, a newline before drivers
would be in order here.


--UkPMmNX0YR0XBnLk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY+QUwAAKCRB4tDGHoIJi
0rw5AQDDR6lnLoWhrmspoMPPN+hMhDSf8VsjqYTW0h7JY6VCtgD/Wzc177tWPb2s
yKCcO2mls+ZCX4eSFUDrTp1LKrw4MwU=
=uBfZ
-----END PGP SIGNATURE-----

--UkPMmNX0YR0XBnLk--


--===============7497540024934798740==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7497540024934798740==--

