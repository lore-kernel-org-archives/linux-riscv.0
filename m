Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B231FC5918
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Feb 2026 09:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dheaGmKw2k4+80NRfxBL93Qm4tdMdBLd5ri5audosGk=; b=i9WsrP21kD8Wc4cHzrRSJobnKq
	RyrKQGt2OYdpW4XKz5VNKdU66LFfXgOodAcgodufDNuvs4id+cqjCCX1YMk7dTC8esLC4m7dbmQSS
	kLZiBuQjHPb4v4Aqt3s7GTCgoiz7JzFukdU0NDxFXHxXveZlFWIqiP2cCSbc+RTSPhd8/IB2C/nDz
	J+CwzDYCm9kVRY/1pyxbX9N7RXlX4G2011jzxZLNNTH3iByyEKE9/lJHsvM9Pbm2G52yz/zCLscQv
	8WN6jjItF5Nra3uZog4jhWxeEyUNVxDC2anFTtPuUPspkvWZdXo+bK1TSbg2P+zGABjKR6wfGd9xh
	ou4BZOLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvXZZ-00000005mMD-2UL7;
	Thu, 26 Feb 2026 09:22:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvXZX-00000005mLh-47uH
	for linux-riscv@lists.infradead.org;
	Thu, 26 Feb 2026 09:22:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 58AE640E2C;
	Thu, 26 Feb 2026 09:22:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C027C19422;
	Thu, 26 Feb 2026 09:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772097735;
	bh=acdQFoy0Kdl9rKHItkomqTGZPPzoY5+9Isxl+P+U89Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hw6ZyjNbhB5Lm/PsjMrk5UQnwuXk5k8qVFAtqB7IuaCuEwNyUTmvOajWqpZcaReDT
	 ADel0gxeRXfAyWDq833UoLxfJVoP7QjcWzhutVeq8z47FSV/KEeFG5l35pQyoUTHMX
	 6PyJXqK7439YjNqgMzOdwWpslDfXE58mjZZSYeIfIbAilw8C8DmGkoUYh4NTmDibOI
	 GuFsCLGZ+J42kM9mtrt+pYHFgHb8MmxiExbJzXuC5TufmNsXNfPxABLYZqIEHBwkg2
	 OQZ3xawJ1XCPmWad3LKUBu/edbn3nKYvCUA+pwVS46kQBiuYXK1cf2nrSaa4Ewh/XE
	 C4Vhij7snyrgQ==
Date: Thu, 26 Feb 2026 09:22:09 +0000
From: Conor Dooley <conor@kernel.org>
To: Rui Qi <qirui.001@bytedance.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, cyrilbur@tenstorrent.com, tglx@kernel.org,
	peterz@infradead.org, debug@rivosinc.com, andybnac@gmail.com,
	charlie@rivosinc.com, geomatsi@gmail.com, thuth@redhat.com,
	bjorn@rivosinc.com, songshuaishuai@tinylab.org, martin@kaiser.cx,
	masahiroy@kernel.org, kees@kernel.org, linux-arch@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: add system error interrupt handler support
Message-ID: <20260226-comprised-untold-1f2c0d2d48d6@spud>
References: <20260226082735.56108-1-qirui.001@bytedance.com>
MIME-Version: 1.0
In-Reply-To: <20260226082735.56108-1-qirui.001@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_012216_077993_F3280A5B 
X-CRM114-Status: GOOD (  29.11  )
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
Content-Type: multipart/mixed; boundary="===============0419766925941351673=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0419766925941351673==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Bsfi16FbViwfARpn"
Content-Disposition: inline


--Bsfi16FbViwfARpn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 26, 2026 at 04:27:35PM +0800, Rui Qi wrote:
> Add a system error interrupt handler for RISC-V that panics
> the system when hardware errors are detected. The implementation includes:
>=20
> - Add IRQ_SYS_ERROR (23) interrupt definition to CSR header
> - Implement sys_error.c module with panic handler
> - Register per-CPU interrupt handler for system error interrupts
> - Add module to kernel build system
>=20
> When a system error interrupt occurs, the handler immediately panics
> the system with a descriptive message to ensure the error is properly
> captured and the system is halted safely.
>=20
> Signed-off-by: Rui Qi <qirui.001@bytedance.com>
> ---
>  arch/riscv/include/asm/csr.h  |  4 +-
>  arch/riscv/kernel/Makefile    |  1 +
>  arch/riscv/kernel/sys_error.c | 80 +++++++++++++++++++++++++++++++++++
>  include/linux/cpuhotplug.h    |  1 +
>  4 files changed, 85 insertions(+), 1 deletion(-)
>  create mode 100644 arch/riscv/kernel/sys_error.c
>=20
> diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> index 31b8988f4488..1f43c25b07ed 100644
> --- a/arch/riscv/include/asm/csr.h
> +++ b/arch/riscv/include/asm/csr.h
> @@ -99,7 +99,8 @@
>  #define IRQ_M_EXT		11
>  #define IRQ_S_GEXT		12
>  #define IRQ_PMU_OVF		13
> -#define IRQ_LOCAL_MAX		(IRQ_PMU_OVF + 1)
> +#define IRQ_SYS_ERROR		23

Hmmm, two problems I think with this. 23 is one of the interrupts that
has been reserved for use with AIA. I don't think they use it right now,
but in the future it might see use there.

The first problem is kind of moot though, because reserving 16-23 for
AIA is a retcon, and previously these interrupts were available custom
use on any platform (as you have done here), so while it might be a
system error on your platform, it could be something completely innocuous
on mine!

With that in mind, does having this in arch code make sense at all?
Can this just be a normal driver, that'll only probe on your specific
platform?

Cheers,
Conor.

> +#define IRQ_LOCAL_MAX		(IRQ_SYS_ERROR + 1)
>  #define IRQ_LOCAL_MASK		GENMASK((IRQ_LOCAL_MAX - 1), 0)
> =20
>  /* Exception causes */
> @@ -535,6 +536,7 @@
>  # define RV_IRQ_TIMER	IRQ_S_TIMER
>  # define RV_IRQ_EXT		IRQ_S_EXT
>  # define RV_IRQ_PMU	IRQ_PMU_OVF
> +# define RV_IRQ_SYS_ERROR	IRQ_SYS_ERROR
>  # define SIP_LCOFIP     (_AC(0x1, UL) << IRQ_PMU_OVF)
> =20
>  #endif /* !CONFIG_RISCV_M_MODE */
> diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
> index cabb99cadfb6..3aaf16c75d6e 100644
> --- a/arch/riscv/kernel/Makefile
> +++ b/arch/riscv/kernel/Makefile
> @@ -72,6 +72,7 @@ obj-y	+=3D vendor_extensions.o
>  obj-y	+=3D vendor_extensions/
>  obj-y	+=3D probes/
>  obj-y	+=3D tests/
> +obj-y	+=3D sys_error.o
>  obj-$(CONFIG_MMU) +=3D vdso.o vdso/
>  obj-$(CONFIG_RISCV_USER_CFI) +=3D vdso_cfi/
> =20
> diff --git a/arch/riscv/kernel/sys_error.c b/arch/riscv/kernel/sys_error.c
> new file mode 100644
> index 000000000000..5b88ff4a0e84
> --- /dev/null
> +++ b/arch/riscv/kernel/sys_error.c
> @@ -0,0 +1,80 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2026 Bytedance, Inc.
> + */
> +#define pr_fmt(fmt) "riscv-sys-error: " fmt
> +
> +#include <linux/kernel.h>
> +#include <linux/irq.h>
> +#include <linux/irqdomain.h>
> +#include <linux/interrupt.h>
> +#include <linux/percpu.h>
> +#include <linux/module.h>
> +#include <asm/irq.h>
> +#include <linux/cpuhotplug.h>
> +#include <asm/csr.h>
> +
> +static unsigned int riscv_sys_error_irq;
> +static DEFINE_PER_CPU_READ_MOSTLY(int, sys_error_dummy_dev);
> +
> +static irqreturn_t sys_error_irq_handler(int irq, void *dev)
> +{
> +	panic("RISC-V System Error Interrupt - System Error Detected");
> +	return IRQ_HANDLED;
> +}
> +
> +static int riscv_serror_starting_cpu(unsigned int cpu)
> +{
> +	csr_set(CSR_IE, BIT(RV_IRQ_SYS_ERROR));
> +	enable_percpu_irq(riscv_sys_error_irq, irq_get_trigger_type(riscv_sys_e=
rror_irq));
> +	return 0;
> +}
> +
> +static int riscv_serror_dying_cpu(unsigned int cpu)
> +{
> +	csr_clear(CSR_IE, BIT(RV_IRQ_SYS_ERROR));
> +	disable_percpu_irq(riscv_sys_error_irq);
> +	return 0;
> +}
> +
> +static int __init sys_error_init(void)
> +{
> +	int ret;
> +	struct irq_domain *domain =3D NULL;
> +
> +	domain =3D irq_find_matching_fwnode(riscv_get_intc_hwnode(),
> +					  DOMAIN_BUS_ANY);
> +	if (!domain) {
> +		pr_err("Failed to find INTC IRQ root domain\n");
> +		return -ENODEV;
> +	}
> +
> +	riscv_sys_error_irq =3D irq_create_mapping(domain, RV_IRQ_SYS_ERROR);
> +	if (!riscv_sys_error_irq) {
> +		pr_err("Failed to map PMU interrupt for node\n");
> +		return -ENODEV;
> +	}
> +
> +	ret =3D request_percpu_irq(riscv_sys_error_irq, sys_error_irq_handler,
> +				 "riscv-syserror", &sys_error_dummy_dev);
> +	if (ret) {
> +		pr_err("registering percpu irq failed [%d]\n", ret);
> +		return ret;
> +	}
> +
> +	ret =3D cpuhp_setup_state(CPUHP_AP_RISCV_SERROR_STARTING,
> +			 "riscv/sys_error:starting",
> +			 riscv_serror_starting_cpu, riscv_serror_dying_cpu);
> +	if (ret) {
> +		pr_err("cpuhp setup state failed [%d]\n", ret);
> +		goto fail_free_irq;
> +	}
> +
> +	return 0;
> +
> +fail_free_irq:
> +	free_percpu_irq(riscv_sys_error_irq, &sys_error_dummy_dev);
> +	return ret;
> +}
> +
> +arch_initcall(sys_error_init)
> diff --git a/include/linux/cpuhotplug.h b/include/linux/cpuhotplug.h
> index 62cd7b35a29c..f6d0c05f72df 100644
> --- a/include/linux/cpuhotplug.h
> +++ b/include/linux/cpuhotplug.h
> @@ -174,6 +174,7 @@ enum cpuhp_state {
>  	CPUHP_AP_REALTEK_TIMER_STARTING,
>  	CPUHP_AP_RISCV_TIMER_STARTING,
>  	CPUHP_AP_CLINT_TIMER_STARTING,
> +	CPUHP_AP_RISCV_SERROR_STARTING,
>  	CPUHP_AP_CSKY_TIMER_STARTING,
>  	CPUHP_AP_TI_GP_TIMER_STARTING,
>  	CPUHP_AP_HYPERV_TIMER_STARTING,
> --=20
> 2.20.1

--Bsfi16FbViwfARpn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaaAQwQAKCRB4tDGHoIJi
0lMFAP98ZyUiL2di7GJ3MIvqHbeoJDV/s7mOHyQ26uUtl0np8wEAvaC/oRG0NfFM
v+irTsgTIoV2qReFh0m2v83g542Tcw4=
=GHDP
-----END PGP SIGNATURE-----

--Bsfi16FbViwfARpn--


--===============0419766925941351673==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0419766925941351673==--

