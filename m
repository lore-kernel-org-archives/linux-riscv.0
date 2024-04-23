Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E76EC4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Apr 2024 16:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ru8CC0DqwohytULZFYt95SMZlR68JD6injp4Qt4CT4Y=; b=oGzWxuE/Kg7EsC7dOud15qAu22
	ewCojaDVK89NJ8CMYF6kG1kn7SvwkaoaPlViupmjOGAhc02njz1bCiM8taaJULhIan+0E07s5vUf+
	ssxlesldXllKocy1J44/QEYuneLsBIGQ45yrQ/y/MLyjR1V9mb1I30Uvoruwylejmgy2dZmxM1xYM
	6wq2g0F4XG7HKYRdTq9IwKVNjsOHxgT5HW0qK9NNerFRaRy5nMVgnq49cwdLcjidXCQvY4HmUuKAT
	985HL+MLF6rWDOjj4DyXSWiLwzmdvYKFjLZZmEQDj6YomoezGNcNbwueQKJFLabiSFunWZBwhOA74
	rE2VNGyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzJB9-00000000mRH-2yOz;
	Tue, 23 Apr 2024 16:39:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzJB7-00000000mQB-0ZH7;
	Tue, 23 Apr 2024 16:39:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 439CC614FF;
	Tue, 23 Apr 2024 16:39:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 254EEC2BD10;
	Tue, 23 Apr 2024 16:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713890371;
	bh=fD5RMgFE9IYTbhqS2tikK8r+BZHDSJNOiDPqXgfFmyQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uuR7RjmXnnV7dwQMq1qJFthRAzaRTXxYy3JEg3KQvr4zzMi/JHojE2vmpSGNK7Uyl
	 DT4rXran619QVJV3xSMNgCgBDQvFDV7gSaRBFmhY1+tIwO8biddrF4IOEx3CuJz2CW
	 z6wzH1DMwSFVYHHUup+vkY2OLUkVJ9CKrdVEzPbvpFK/juJopAkhCbasv3v/B3Luey
	 noiZuTKVCTYtK1XEdRAqrW+ABr5CgxfI8a6QRs+9vMszwTB0mYRTcVNV2+OqRGHLkZ
	 RZM3t+XFJh2IKOOK62CfTY6iQB8EvGLJIQr2AqnKyfLUdaq4E2wiY5kCmeLTtwlViI
	 7nLiKrd2Pj6cw==
Date: Tue, 23 Apr 2024 17:39:27 +0100
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, Ved Shanbhogue <ved@rivosinc.com>
Subject: Re: [RFC PATCH 5/7] riscv: add double trap driver
Message-ID: <20240423-headsman-arrival-16a2d13342b2@spud>
References: <20240418142701.1493091-1-cleger@rivosinc.com>
 <20240418142701.1493091-6-cleger@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240418142701.1493091-6-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_093933_295853_9859646B 
X-CRM114-Status: GOOD (  32.46  )
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
Content-Type: multipart/mixed; boundary="===============1741565448028050048=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1741565448028050048==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eBwmz41Uh9YWXnLI"
Content-Disposition: inline


--eBwmz41Uh9YWXnLI
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 18, 2024 at 04:26:44PM +0200, Cl=E9ment L=E9ger wrote:
> Add a small driver to request double trap enabling as well as
> registering a SSE handler for double trap. This will also be used by KVM
> SBI FWFT extension support to detect if it is possible to enable double
> trap in VS-mode.
>=20
> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> ---
>  arch/riscv/include/asm/sbi.h    |  1 +
>  drivers/firmware/Kconfig        |  7 +++
>  drivers/firmware/Makefile       |  1 +
>  drivers/firmware/riscv_dbltrp.c | 95 +++++++++++++++++++++++++++++++++
>  include/linux/riscv_dbltrp.h    | 19 +++++++
>  5 files changed, 123 insertions(+)
>  create mode 100644 drivers/firmware/riscv_dbltrp.c
>  create mode 100644 include/linux/riscv_dbltrp.h
>=20
> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> index 744aa1796c92..9cd4ca66487c 100644
> --- a/arch/riscv/include/asm/sbi.h
> +++ b/arch/riscv/include/asm/sbi.h
> @@ -314,6 +314,7 @@ enum sbi_sse_attr_id {
>  #define SBI_SSE_ATTR_INTERRUPTED_FLAGS_SPIE	(1 << 2)
> =20
>  #define SBI_SSE_EVENT_LOCAL_RAS		0x00000000
> +#define SBI_SSE_EVENT_LOCAL_DOUBLE_TRAP	0x00000001
>  #define SBI_SSE_EVENT_GLOBAL_RAS	0x00008000
>  #define SBI_SSE_EVENT_LOCAL_PMU		0x00010000
>  #define SBI_SSE_EVENT_LOCAL_SOFTWARE	0xffff0000
> diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
> index 59f611288807..a037f6e89942 100644
> --- a/drivers/firmware/Kconfig
> +++ b/drivers/firmware/Kconfig
> @@ -197,6 +197,13 @@ config RISCV_SSE_TEST
>  	  Select if you want to enable SSE extension testing at boot time.
>  	  This will run a series of test which verifies SSE sanity.
> =20
> +config RISCV_DBLTRP
> +	bool "Enable Double trap handling"
> +	depends on RISCV_SSE && RISCV_SBI
> +	default n
> +	help
> +	  Select if you want to enable SSE double trap handler.
> +
>  config SYSFB
>  	bool
>  	select BOOT_VESA_SUPPORT
> diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile
> index fb7b0c08c56d..ad67a1738c0f 100644
> --- a/drivers/firmware/Makefile
> +++ b/drivers/firmware/Makefile
> @@ -18,6 +18,7 @@ obj-$(CONFIG_RASPBERRYPI_FIRMWARE) +=3D raspberrypi.o
>  obj-$(CONFIG_FW_CFG_SYSFS)	+=3D qemu_fw_cfg.o
>  obj-$(CONFIG_RISCV_SSE)		+=3D riscv_sse.o
>  obj-$(CONFIG_RISCV_SSE_TEST)	+=3D riscv_sse_test.o
> +obj-$(CONFIG_RISCV_DBLTRP)	+=3D riscv_dbltrp.o

As previously mentioned, I'd like to see all of these riscv specific
things in a riscv directory.

>  obj-$(CONFIG_SYSFB)		+=3D sysfb.o
>  obj-$(CONFIG_SYSFB_SIMPLEFB)	+=3D sysfb_simplefb.o
>  obj-$(CONFIG_TI_SCI_PROTOCOL)	+=3D ti_sci.o
> diff --git a/drivers/firmware/riscv_dbltrp.c b/drivers/firmware/riscv_dbl=
trp.c
> new file mode 100644
> index 000000000000..72f9a067e87a
> --- /dev/null
> +++ b/drivers/firmware/riscv_dbltrp.c
> @@ -0,0 +1,95 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2023 Rivos Inc.
> + */
> +
> +#define pr_fmt(fmt) "riscv-dbltrp: " fmt
> +
> +#include <linux/cpu.h>
> +#include <linux/init.h>
> +#include <linux/riscv_dbltrp.h>
> +#include <linux/riscv_sse.h>
> +
> +#include <asm/sbi.h>
> +
> +static bool double_trap_enabled;
> +
> +static int riscv_sse_dbltrp_handle(uint32_t evt, void *arg,
> +				   struct pt_regs *regs)
> +{
> +	__show_regs(regs);
> +	panic("Double trap !\n");
> +
> +	return 0;
> +}
> +
> +struct cpu_dbltrp_data {
> +	int error;
> +};
> +
> +static void
> +sbi_cpu_enable_double_trap(void *data)

This should easily fit on one line.

> +{
> +	struct sbiret ret;
> +	struct cpu_dbltrp_data *cdd =3D data;
> +
> +	ret =3D sbi_ecall(SBI_EXT_FWFT, SBI_EXT_FWFT_SET,
> +			SBI_FWFT_DOUBLE_TRAP_ENABLE, 1, 0, 0, 0, 0);
> +
> +	if (ret.error) {
> +		cdd->error =3D 1;

If this is a boolean, make it a boolean please. All the code in this
patch treats it as one.

> +		pr_err("Failed to enable double trap on cpu %d\n", smp_processor_id());
> +	}
> +}
> +
> +static int sbi_enable_double_trap(void)
> +{
> +	struct cpu_dbltrp_data cdd =3D {0};
> +
> +	on_each_cpu(sbi_cpu_enable_double_trap, &cdd, 1);
> +	if (cdd.error)
> +		return -1;

Can this be an errno please?

> +
> +	double_trap_enabled =3D true;
> +
> +	return 0;
> +}
> +
> +bool riscv_double_trap_enabled(void)
> +{
> +	return double_trap_enabled;
> +}
> +EXPORT_SYMBOL(riscv_double_trap_enabled);

Can we just use double_trap everywhere? dbltrp reads like sound that a
beatboxer would make and this looks a lot nicer than the other functions
in the file...

> +
> +static int __init riscv_dbltrp(void)

I think this function is missing an action work - init or probe?

> +{
> +	struct sse_event *evt;
> +
> +	if (!riscv_has_extension_unlikely(RISCV_ISA_EXT_SSDBLTRP)) {
> +		pr_err("Ssdbltrp extension not available\n");
> +		return 1;
> +	}
> +
> +	if (!sbi_probe_extension(SBI_EXT_FWFT)) {
> +		pr_err("Can not enable double trap, SBI_EXT_FWFT is not available\n");
> +		return 1;
> +	}
> +
> +	if (sbi_enable_double_trap()) {
> +		pr_err("Failed to enable double trap on all cpus\n");
> +		return 1;

Why do we return 1s here, but an errno via PTR_ERR() below?
Shouldn't all of these be returning a negative errono?
This particular one should probably propagate the error it got from
sbi_enable_double_trap().

Cheers,
Conor.

> +	}
> +
> +	evt =3D sse_event_register(SBI_SSE_EVENT_LOCAL_DOUBLE_TRAP, 0,
> +				 riscv_sse_dbltrp_handle, NULL);
> +	if (IS_ERR(evt)) {
> +		pr_err("SSE double trap register failed\n");
> +		return PTR_ERR(evt);
> +	}
> +
> +	sse_event_enable(evt);
> +	pr_info("Double trap handling registered\n");
> +
> +	return 0;
> +}
> +device_initcall(riscv_dbltrp);
> diff --git a/include/linux/riscv_dbltrp.h b/include/linux/riscv_dbltrp.h
> new file mode 100644
> index 000000000000..6de4f43fae6b
> --- /dev/null
> +++ b/include/linux/riscv_dbltrp.h
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2023 Rivos Inc.
> + */
> +
> +#ifndef __LINUX_RISCV_DBLTRP_H
> +#define __LINUX_RISCV_DBLTRP_H
> +
> +#if defined(CONFIG_RISCV_DBLTRP)
> +bool riscv_double_trap_enabled(void);
> +#else
> +
> +static inline bool riscv_double_trap_enabled(void)
> +{
> +	return false;
> +}
> +#endif
> +
> +#endif /* __LINUX_RISCV_DBLTRP_H */
> --=20
> 2.43.0
>=20

--eBwmz41Uh9YWXnLI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZifkPgAKCRB4tDGHoIJi
0veEAQCEMsQKaddsiHfFoNYh1yUhaTvMiAQRLZ5gWJnUVG44RgEAsdBPvXs6WM6q
F6tFelwPbvovDtQMFL4XBLmTu06pFgs=
=Rjup
-----END PGP SIGNATURE-----

--eBwmz41Uh9YWXnLI--


--===============1741565448028050048==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1741565448028050048==--

