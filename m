Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE952C001DE
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Aug 2023 00:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/pYNgVzn2bxgZ9Y7wjhndIqZ5JVAx0AhvU5UA9wH7Rc=; b=xdAguubTpwcj1m
	qDxQW2w3Ae0e8G9X7yPsE93DzJoYLXeRPXzubyG0VOZHN3CnIO8VPd9lsq6jHEMEmUuixphxD0fpv
	Iwy+9kuA+KIJuU6U/v2VfVT1ZerTueyEDOaAvCGG8e/D9qiMev+p5jIwaGuqQylrmTTihw1UXWrMc
	JvtWP1AtdvKpWteys2Qbo5b9r7hSURMwHK/wbuiH2fk6I6DaRRrcykTMZ1YJ/6jA7ncVcgHQJGEkL
	NVHIuA7BqQNWhTqJBqG15VM3VBuq9G5JVXLpEl8HVUkX2krdlcm9VeBBV6FrV+taQhU5kYEI7YTRt
	EduDgJzHhkUTKRyfYWtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSoMh-00FwYn-1Q;
	Mon, 07 Aug 2023 00:44:55 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSoMd-00FwYL-0s
	for linux-riscv@lists.infradead.org;
	Mon, 07 Aug 2023 00:44:54 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 3E50B24E28D;
	Mon,  7 Aug 2023 08:44:08 +0800 (CST)
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 7 Aug
 2023 08:44:08 +0800
Received: from EXMBX066.cuchost.com (172.16.7.66) by EXMBX068.cuchost.com
 (172.16.6.68) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 7 Aug
 2023 08:44:07 +0800
Received: from EXMBX066.cuchost.com ([fe80::5947:9245:907e:339f]) by
 EXMBX066.cuchost.com ([fe80::5947:9245:907e:339f%17]) with mapi id
 15.00.1497.044; Mon, 7 Aug 2023 08:44:07 +0800
From: JeeHeng Sia <jeeheng.sia@starfivetech.com>
To: Conor Dooley <conor.dooley@microchip.com>, "palmer@dabbelt.com"
	<palmer@dabbelt.com>
CC: "conor@kernel.org" <conor@kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Atish Patra <atishp@rivosinc.com>, Anup Patel
	<apatel@ventanamicro.com>, Alexandre Ghiti <alexghiti@rivosinc.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>, Song Shuai
	<suagrfillet@gmail.com>, Petr Tesarik <petrtesarik@huaweicloud.com>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: RE: [RFT 1/2] RISC-V: handle missing "no-map" properties for
 OpenSBI's PMP protected regions
Thread-Topic: [RFT 1/2] RISC-V: handle missing "no-map" properties for
 OpenSBI's PMP protected regions
Thread-Index: AQHZxTKPVELaCqW/WUK93+UXGxBdOK/eAqwg
Date: Mon, 7 Aug 2023 00:44:07 +0000
Message-ID: <3e066032031e4552b4b7903755deb669@EXMBX066.cuchost.com>
References: <20230802-purse-hydrant-6f44f77364b0@wendy>
 <20230802-detention-second-82ab2b53e07a@wendy>
In-Reply-To: <20230802-detention-second-82ab2b53e07a@wendy>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [202.188.176.82]
x-yovoleruleagent: yovoleflag
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230806_174451_611653_BB368319 
X-CRM114-Status: GOOD (  27.22  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



> -----Original Message-----
> From: Conor Dooley <conor.dooley@microchip.com>
> Sent: Wednesday, August 2, 2023 7:13 PM
> To: palmer@dabbelt.com
> Cc: conor@kernel.org; conor.dooley@microchip.com; Paul Walmsley <paul.wal=
msley@sifive.com>; Atish Patra
> <atishp@rivosinc.com>; Anup Patel <apatel@ventanamicro.com>; Alexandre Gh=
iti <alexghiti@rivosinc.com>; Bj=F6rn T=F6pel
> <bjorn@rivosinc.com>; Song Shuai <suagrfillet@gmail.com>; JeeHeng Sia <je=
eheng.sia@starfivetech.com>; Petr Tesarik
> <petrtesarik@huaweicloud.com>; linux-riscv@lists.infradead.org; linux-ker=
nel@vger.kernel.org; stable@vger.kernel.org
> Subject: [RFT 1/2] RISC-V: handle missing "no-map" properties for OpenSBI=
's PMP protected regions
> =

> Add an erratum for versions [v0.8 to v1.3) of OpenSBI which fail to add
> the "no-map" property to the reserved memory nodes for the regions it
> has protected using PMPs.
> =

> Our existing fix sweeping hibernation under the carpet by marking it
> NONPORTABLE is insufficient as there are other ways to generate
> accesses to these reserved memory regions, as Petr discovered [1]
> while testing crash kernels & kdump.
> =

> Intercede during the boot process when the afflicted versions of OpenSBI
> are present & set the "no-map" property in all "mmode_resv" nodes before
> the kernel does its reserved memory region initialisation.
> =

> Reported-by: Song Shuai <suagrfillet@gmail.com>
> Link: https://lore.kernel.org/all/CAAYs2=3DgQvkhTeioMmqRDVGjdtNF_vhB+vm_1=
dHJxPNi75YDQ_Q@mail.gmail.com/
> Reported-by: JeeHeng Sia <jeeheng.sia@starfivetech.com>
> Link: https://groups.google.com/a/groups.riscv.org/g/sw-dev/c/ITXwaKfA6z8
> Reported-by: Petr Tesarik <petrtesarik@huaweicloud.com>
> Closes: https://lore.kernel.org/linux-riscv/76ff0f51-d6c1-580d-f943-061e9=
3073306@huaweicloud.com/ [1]
> CC: stable@vger.kernel.org
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/include/asm/sbi.h |  5 +++++
>  arch/riscv/kernel/sbi.c      | 42 +++++++++++++++++++++++++++++++++++-
>  arch/riscv/mm/init.c         |  3 +++
>  3 files changed, 49 insertions(+), 1 deletion(-)
> =

> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> index 5b4a1bf5f439..5360f3476278 100644
> --- a/arch/riscv/include/asm/sbi.h
> +++ b/arch/riscv/include/asm/sbi.h
> @@ -252,6 +252,9 @@ enum sbi_pmu_ctr_type {
>  #define SBI_ERR_ALREADY_STARTED -7
>  #define SBI_ERR_ALREADY_STOPPED -8
> =

> +/* SBI implementation IDs */
> +#define SBI_IMP_OPENSBI	1
I would suggest to create an enum struct for the SBI Imp ID in the sbi.h fi=
le. What do you think?
> +
>  extern unsigned long sbi_spec_version;
>  struct sbiret {
>  	long error;
> @@ -259,6 +262,8 @@ struct sbiret {
>  };
> =

>  void sbi_init(void);
> +void sbi_apply_reserved_mem_erratum(void *dtb_va);
> +
>  struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
>  			unsigned long arg1, unsigned long arg2,
>  			unsigned long arg3, unsigned long arg4,
> diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
> index c672c8ba9a2a..aeb27263fa53 100644
> --- a/arch/riscv/kernel/sbi.c
> +++ b/arch/riscv/kernel/sbi.c
> @@ -5,8 +5,10 @@
>   * Copyright (c) 2020 Western Digital Corporation or its affiliates.
>   */
> =

> +#include <linux/acpi.h>
>  #include <linux/bits.h>
>  #include <linux/init.h>
> +#include <linux/libfdt.h>
>  #include <linux/pm.h>
>  #include <linux/reboot.h>
>  #include <asm/sbi.h>
> @@ -583,6 +585,40 @@ long sbi_get_mimpid(void)
>  }
>  EXPORT_SYMBOL_GPL(sbi_get_mimpid);
> =

> +static long sbi_firmware_id;
> +static long sbi_firmware_version;
> +
> +/*
> + * For devicetrees patched by OpenSBI a "mmode_resv" node is added to co=
ver
> + * the region OpenSBI has protected by means of a PMP. Some versions of =
OpenSBI,
> + * [v0.8 to v1.3), omitted the "no-map" property, but this trips up hibe=
rnation
> + * among other things.
> + */
> +void __init sbi_apply_reserved_mem_erratum(void *dtb_pa)
> +{
> +	int child, reserved_mem;
> +
> +	if (sbi_firmware_id !=3D SBI_IMP_OPENSBI)
> +		return;
> +
> +	if (!acpi_disabled)
> +		return;
> +
> +	if (sbi_firmware_version >=3D 0x10003 || sbi_firmware_version < 0x8)
> +		return;
> +
> +	reserved_mem =3D fdt_path_offset((void *)dtb_pa, "/reserved-memory");
> +	if (reserved_mem < 0)
> +		return;
> +
> +	fdt_for_each_subnode(child, (void *)dtb_pa, reserved_mem) {
> +		const char *name =3D fdt_get_name((void *)dtb_pa, child, NULL);
> +
> +		if (!strncmp(name, "mmode_resv", 10))
> +			fdt_setprop((void *)dtb_pa, child, "no-map", NULL, 0);
> +	}
> +};
> +
>  void __init sbi_init(void)
>  {
>  	int ret;
> @@ -596,8 +632,12 @@ void __init sbi_init(void)
>  		sbi_major_version(), sbi_minor_version());
> =

>  	if (!sbi_spec_is_0_1()) {
> +		sbi_firmware_id =3D sbi_get_firmware_id();
> +		sbi_firmware_version =3D sbi_get_firmware_version();
> +
>  		pr_info("SBI implementation ID=3D0x%lx Version=3D0x%lx\n",
> -			sbi_get_firmware_id(), sbi_get_firmware_version());
> +			sbi_firmware_id, sbi_firmware_version);
> +
>  		if (sbi_probe_extension(SBI_EXT_TIME)) {
>  			__sbi_set_timer =3D __sbi_set_timer_v02;
>  			pr_info("SBI TIME extension detected\n");
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 70fb31960b63..cb16bfdeacdb 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -29,6 +29,7 @@
>  #include <asm/tlbflush.h>
>  #include <asm/sections.h>
>  #include <asm/soc.h>
> +#include <asm/sbi.h>
>  #include <asm/io.h>
>  #include <asm/ptdump.h>
>  #include <asm/numa.h>
> @@ -253,6 +254,8 @@ static void __init setup_bootmem(void)
>  	 * in the device tree, otherwise the allocation could end up in a
>  	 * reserved region.
>  	 */
> +
> +	sbi_apply_reserved_mem_erratum(dtb_early_va);
>  	early_init_fdt_scan_reserved_mem();
> =

>  	/*
> --
> 2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
