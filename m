Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94201C54EBC
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jan 2023 22:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6EMkAwnUNSyaQVLzvmI8ZUBA3F/jXtwPRncXqdRExPs=; b=uqeiLv7EqiBQSNioIUk3kHTFl4
	uApbxID8cHPvFSqAeu3dv7tcGVfnDazhSOnmtUP0sjjM83r3pY+7uWBIfRgeBmMayT8c9rP0Qwph8
	oZ2Nm++BgmH7iVBHVkgn94AhienE5sneL4id8zuRpxDt9KxYvs+kS+zWrlgXoWHGn42P0MrMRIzGL
	gSSoQXdae6g4g58C8wCtp3UoMo7VGqG4UoNkRCKudKvbEr10FWQXwlnIjHOhC7ZDLKyykv7tfmCvr
	KUPMuhcNKt260YOBb3Vqc3xsCp7Xx7iiAQpYh7jx8e93vYBKG8I/h5lELih1TxqPtfdF14d24DkJo
	tZ03xOyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFN1R-008lMB-1W; Tue, 10 Jan 2023 22:23:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFN1N-008lKd-OJ
	for linux-riscv@lists.infradead.org; Tue, 10 Jan 2023 22:23:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 08F8B6191A;
	Tue, 10 Jan 2023 22:23:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF51FC43396;
	Tue, 10 Jan 2023 22:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673389384;
	bh=M0cogaXVZ3oi8wpvRMESXcGHX5OCa0Z6QBOqzPiMvp0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=frdxX4r2eAhoDeXklarls2PWIFCc9cWaeKa2vTTphjE8FqSazkkmwsDNAXrPGleAh
	 LRO0Pr/qlU8ZaIxk+3DDPmrk2t+Vsv8viO+u1mP9RBdpjqaPr98Y96m0dAWH52RMqb
	 Ji3iwHGsl6WCrgvaIlF6YEnfp96CAJo8kJ656M9gHJMU+1HRRPb41GATAqCH9gi1Qw
	 VBe3I49ZCgF86nAml7r0dO05IMjcLfYblCMxchS/eBTInFHiPTHIVETNxc2ho/PnoK
	 26FPbJfQZ1YYkxJUPZ28bIRJ+8VUbPlL7zmKB2UTTkXf0vYfro4KPtsbI6+GDEer62
	 AC6C9bhqXHhjA==
Date: Tue, 10 Jan 2023 22:23:00 +0000
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org,
	'Anup Patel ' <apatel@ventanamicro.com>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Sia Jee Heng ' <jeeheng.sia@starfivetech.com>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Ley Foon Tan ' <leyfoon.tan@starfivetech.com>
Subject: Re: [RFC PATCH 1/1] riscv: sbi: Introduce system suspend support
Message-ID: <Y73lRNHDstKHL3vn@spud>
References: <20230106113216.443057-1-ajones@ventanamicro.com>
 <20230106113216.443057-2-ajones@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230106113216.443057-2-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_142305_891906_A94F29DF 
X-CRM114-Status: GOOD (  30.48  )
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
Content-Type: multipart/mixed; boundary="===============2083247862354750880=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2083247862354750880==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mVkXtNLJQ05Li45D"
Content-Disposition: inline


--mVkXtNLJQ05Li45D
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Drew!

On Fri, Jan 06, 2023 at 12:32:16PM +0100, Andrew Jones wrote:
> When the SUSP SBI extension is present it implies that the standard
> "suspend to RAM" type is available. Wire it up to the generic
> platform suspend support, also applying the already present support
> for non-retentive CPU suspend. When the kernel is built with
> CONFIG_SUSPEND, one can do 'echo mem > /sys/power/state' to suspend.
> Resumption will occur when a platform-specific wake-up event arrives.
>=20
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>

First things first, anything SBI depends on !m-mode, so you've gotta add
some sort of gating unfortunately around those ECALLs. But I figure you
may have already seen the build failures on patchwork for nommu?

Also, when there's an actual spec would you mind doing a Link: spec.pdf?

> ---
>  arch/riscv/Kconfig           |  5 ++++-
>  arch/riscv/include/asm/sbi.h |  9 ++++++++
>  arch/riscv/kernel/suspend.c  | 41 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 54 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index e2b656043abf..a53d94c1953e 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -52,7 +52,7 @@ config RISCV
>  	select CLONE_BACKWARDS
>  	select CLINT_TIMER if !MMU
>  	select COMMON_CLK
> -	select CPU_PM if CPU_IDLE
> +	select CPU_PM if (SUSPEND || CPU_IDLE)
>  	select EDAC_SUPPORT
>  	select GENERIC_ARCH_TOPOLOGY
>  	select GENERIC_ATOMIC64 if !64BIT
> @@ -686,6 +686,9 @@ config PORTABLE
>  	select OF
>  	select MMU
> =20
> +config ARCH_SUSPEND_POSSIBLE
> +	def_bool y

Since the content you're adding depends on having an SBI extention,
does this need to be s/y/RISCV_SBI/?

>  menu "Power management options"
> =20
>  source "kernel/power/Kconfig"
> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> index 4ca7fbacff42..9834ba4ce3e4 100644
> --- a/arch/riscv/include/asm/sbi.h
> +++ b/arch/riscv/include/asm/sbi.h
> @@ -29,6 +29,7 @@ enum sbi_ext_id {
>  	SBI_EXT_RFENCE =3D 0x52464E43,
>  	SBI_EXT_HSM =3D 0x48534D,
>  	SBI_EXT_SRST =3D 0x53525354,
> +	SBI_EXT_SUSP =3D 0x53555350,
>  	SBI_EXT_PMU =3D 0x504D55,
> =20
>  	/* Experimentals extensions must lie within this range */
> @@ -113,6 +114,14 @@ enum sbi_srst_reset_reason {
>  	SBI_SRST_RESET_REASON_SYS_FAILURE,
>  };
> =20
> +enum sbi_ext_susp_fid {
> +	SBI_EXT_SUSP_SUSPEND =3D 0,
> +};
> +
> +enum sbi_ext_susp_sleep_type {
> +	SBI_SUSP_SLEEP_TYPE_SUSPEND =3D 0,
> +};
> +
>  enum sbi_ext_pmu_fid {
>  	SBI_EXT_PMU_NUM_COUNTERS =3D 0,
>  	SBI_EXT_PMU_COUNTER_GET_INFO,
> diff --git a/arch/riscv/kernel/suspend.c b/arch/riscv/kernel/suspend.c
> index 9ba24fb8cc93..bc26e9ae4782 100644
> --- a/arch/riscv/kernel/suspend.c
> +++ b/arch/riscv/kernel/suspend.c
> @@ -4,8 +4,12 @@
>   * Copyright (c) 2022 Ventana Micro Systems Inc.
>   */
> =20
> +#define pr_fmt(fmt) "suspend: " fmt
> +
>  #include <linux/ftrace.h>
> +#include <linux/suspend.h>
>  #include <asm/csr.h>
> +#include <asm/sbi.h>
>  #include <asm/suspend.h>
> =20
>  static void suspend_save_csrs(struct suspend_context *context)
> @@ -85,3 +89,40 @@ int cpu_suspend(unsigned long arg,
> =20
>  	return rc;
>  }

And then from here down needs to be #ifdef RISCV_SBI?

Anyways, probably stating the obvious on an RFC, but =C2=AF\_(=E3=83=84)_/=
=C2=AF

Thanks,
Conor.

> +
> +static int sbi_system_suspend(unsigned long sleep_type,
> +			      unsigned long resume_addr,
> +			      unsigned long opaque)
> +{
> +	struct sbiret ret;
> +
> +	ret =3D sbi_ecall(SBI_EXT_SUSP, SBI_EXT_SUSP_SUSPEND,
> +			sleep_type, resume_addr, opaque, 0, 0, 0);
> +	if (ret.error)
> +		return sbi_err_map_linux_errno(ret.error);
> +
> +	return ret.value;
> +}
> +
> +static int sbi_system_suspend_enter(suspend_state_t state)
> +{
> +	return cpu_suspend(SBI_SUSP_SLEEP_TYPE_SUSPEND, sbi_system_suspend);
> +}
> +
> +static const struct platform_suspend_ops sbi_system_suspend_ops =3D {
> +	.valid =3D suspend_valid_only_mem,
> +	.enter =3D sbi_system_suspend_enter,
> +};
> +
> +static int __init sbi_system_suspend_init(void)
> +{
> +	if (!sbi_spec_is_0_1() && sbi_probe_extension(SBI_EXT_SUSP) > 0) {
> +		pr_info("SBI SUSP extension detected\n");
> +		if (IS_ENABLED(CONFIG_SUSPEND))
> +			suspend_set_ops(&sbi_system_suspend_ops);
> +	}
> +
> +	return 0;
> +}
> +
> +arch_initcall(sbi_system_suspend_init);
> --=20
> 2.39.0
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
>=20

--mVkXtNLJQ05Li45D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY73lRAAKCRB4tDGHoIJi
0mxCAP9+xKzGOZMUi2oXIu17X338SAWMb4iu5iSRB+ZPPySmUwD7Bojz/fuN6h33
0redvLwEfzQ+BTJUyHFSJrxd2eY0MgQ=
=6TW4
-----END PGP SIGNATURE-----

--mVkXtNLJQ05Li45D--


--===============2083247862354750880==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2083247862354750880==--

