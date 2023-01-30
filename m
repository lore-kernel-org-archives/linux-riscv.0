Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E20DDC61DA4
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jan 2023 23:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8ggrCDH2TMXR/BO4VjQEq/M8sxttafxnAIZuCJxJPrw=; b=SbQgWluB6wwMAgKEbKYcfiqkdz
	GuNXkvasoKdkz4y8Ic3C+b/TVwaMf7st0+VYEJTh1qxYVpLQ6JBGRN1s/TF2/WG1gHZlWmvRCVBiA
	8WgE7FSLR9FNYogkC0IdPcAv3LaQl7pecE/6dYEbKrXSiWYJx7c+OftExBO5Hh/SvO87rJtltI16j
	puv2ktOh/6LzaGe+5wccj7pGakVu2ISPTyR8r4ZrDFgWDrsTeATMYQCVHxCAj4B06Eatt0PwkJjRy
	FX8NNLgF8JGzRnt8kOR5tHm9dY8sKIhGRt2S5kuD4I4sb0XHcbU3nhCovLoFVi8mN8fUouEg4GMN9
	Ob0zfrWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMdsJ-005oeA-PZ; Mon, 30 Jan 2023 23:47:47 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMdsG-005ocy-Lm
	for linux-riscv@lists.infradead.org; Mon, 30 Jan 2023 23:47:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id E1A1ECE1AD6;
	Mon, 30 Jan 2023 23:47:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33320C433EF;
	Mon, 30 Jan 2023 23:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675122461;
	bh=WoJeIgf/JQZhJHXDszCWgkHNzPbweY0aWYQ3iEPGhBI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QULFyBjTeeC1392caZNLBFUYEO05aNmt2qcr6HCpbQfJG2gU2FkCDLwIgYUjz18Q8
	 uChNcDCAt0lr57gFu+1jkgxml6xL7DE7LuDBWkog8j9Ivc837sGCjv0UpTOD5Snbp0
	 d8cxiAZHD24140/A9KBZxYbySlCqpCOnpFU+MgQbb1/Hfd02VQ1hxYoZ164EuA5e5E
	 1Tp/4WdqExpa5XLCnjzmcjtOSaA5WERxcbf1ShyECo1MsVWtSlNJMVpVRagSxdlT1h
	 7AQVsg2bu2pbk9IVx2gu4xU1FPlwj1iYAS/8j5MckNHeBucgBCo0GJ8Q4JoCNDywGU
	 ffrSlyJINLfRQ==
Date: Mon, 30 Jan 2023 23:47:35 +0000
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
Subject: Re: [PATCH 22/24] RISC-V: ACPI: Enable ACPI in defconfig
Message-ID: <Y9hXF8RpNawkuTEN@spud>
References: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
 <20230130182225.2471414-23-sunilvl@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230130182225.2471414-23-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_154744_911291_AC9FC6CC 
X-CRM114-Status: GOOD (  17.67  )
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
Content-Type: multipart/mixed; boundary="===============1360026330614230997=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1360026330614230997==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zg0/95MUBwMtXXq2"
Content-Disposition: inline


--zg0/95MUBwMtXXq2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Sunil,

Two quick comments while I think of them..

On Mon, Jan 30, 2023 at 11:52:23PM +0530, Sunil V L wrote:
> RISC-V: ACPI: Enable ACPI in defconfig

btw, about half of this series redundantly puts "ACPI:" or "RISC-V:
ACPI:" into $subject. None of commits that mention ACPI after the last :
should mention ACPI in the prefix IMO, it's just noise.

For example, this one should be something like:
RISC-V: enable ACPI in defconfig

> Add support to build ACPI subsystem in defconfig.
>=20
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
>  arch/riscv/configs/defconfig | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index 128dcf4c0814..8ce06fb0dde8 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -218,3 +218,7 @@ CONFIG_RCU_EQS_DEBUG=3Dy
>  # CONFIG_FTRACE is not set
>  # CONFIG_RUNTIME_TESTING_MENU is not set
>  CONFIG_MEMTEST=3Dy
> +CONFIG_ARCH_SUPPORTS_ACPI=3Dy

This needs to go into the arch Kconfig file, where it will be selected.
Check what arm64 does if you are not sure what I mean.

Hopefully I'll get a chance to look at the rest of this this week
sometime,
Conor.


--zg0/95MUBwMtXXq2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY9hXFwAKCRB4tDGHoIJi
0jz5AP9T0B2MgLSmPbYSg1QODDZGfojq049zs7BQd+8I5h0xMQEAg7Tq0HANXXSF
/wo06urL3IrFIJh1toI0j0c616zj5Q8=
=lM2h
-----END PGP SIGNATURE-----

--zg0/95MUBwMtXXq2--


--===============1360026330614230997==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1360026330614230997==--

