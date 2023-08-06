Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28189C00528
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Aug 2023 09:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KSL6yBdzmxv4ERHRcExe8fqJ7/AGEbiF0Uf/5iMTHi4=; b=GUhRtcf4iYPaQr
	hwiBite4wubvJ1riHw2HvniqpEbzA7arR3Ql1LHJVXTyD1+t4cQPC+nvAMoBJ4JhIF0CGmR/lPvZD
	V0DPIQe4kIXth+6A/odt+TOQSDE1X6+m759T4z+XI0LvFkyLSCX8h2ZW5pL7KmC3/xL8SFPpIUBil
	T4A1/GW7TnA5AVeXoxYLCgFvxJff0r9JPtloGz63o3T9FA02RngC3M2TtEd4lkXmkH5xwZrPnYtNe
	IJSnP5vPmyWhRHOOxysQa4w/+JEJtOYmMMBK053KG+Anu2gTE8tUKjgSqDbOg3n4DzpwiMVvswfIu
	wZLDxbAaX6OKvX/t2vbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSZfy-00F7r8-1u;
	Sun, 06 Aug 2023 09:03:50 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qSZfv-00F7q2-1N
	for linux-riscv@lists.infradead.org;
	Sun, 06 Aug 2023 09:03:49 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 011BF40002;
	Sun,  6 Aug 2023 09:03:37 +0000 (UTC)
Message-ID: <c1fca971-6993-09cc-0cf6-a60bd5fd684e@ghiti.fr>
Date: Sun, 6 Aug 2023 11:03:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFT 1/2] RISC-V: handle missing "no-map" properties for
 OpenSBI's PMP protected regions
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>, palmer@dabbelt.com
Cc: conor@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Atish Patra <atishp@rivosinc.com>, Anup Patel <apatel@ventanamicro.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>, Song Shuai <suagrfillet@gmail.com>,
 JeeHeng Sia <jeeheng.sia@starfivetech.com>,
 Petr Tesarik <petrtesarik@huaweicloud.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20230802-purse-hydrant-6f44f77364b0@wendy>
 <20230802-detention-second-82ab2b53e07a@wendy>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20230802-detention-second-82ab2b53e07a@wendy>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230806_020347_751368_A0055B00 
X-CRM114-Status: GOOD (  28.10  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Conor,

On 02/08/2023 13:12, Conor Dooley wrote:
> Add an erratum for versions [v0.8 to v1.3) of OpenSBI which fail to add
> the "no-map" property to the reserved memory nodes for the regions it
> has protected using PMPs.
>
> Our existing fix sweeping hibernation under the carpet by marking it
> NONPORTABLE is insufficient as there are other ways to generate
> accesses to these reserved memory regions, as Petr discovered [1]
> while testing crash kernels & kdump.
>
> Intercede during the boot process when the afflicted versions of OpenSBI
> are present & set the "no-map" property in all "mmode_resv" nodes before
> the kernel does its reserved memory region initialisation.
>
> Reported-by: Song Shuai <suagrfillet@gmail.com>
> Link: https://lore.kernel.org/all/CAAYs2=gQvkhTeioMmqRDVGjdtNF_vhB+vm_1dHJxPNi75YDQ_Q@mail.gmail.com/
> Reported-by: JeeHeng Sia <jeeheng.sia@starfivetech.com>
> Link: https://groups.google.com/a/groups.riscv.org/g/sw-dev/c/ITXwaKfA6z8
> Reported-by: Petr Tesarik <petrtesarik@huaweicloud.com>
> Closes: https://lore.kernel.org/linux-riscv/76ff0f51-d6c1-580d-f943-061e93073306@huaweicloud.com/ [1]
> CC: stable@vger.kernel.org
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>   arch/riscv/include/asm/sbi.h |  5 +++++
>   arch/riscv/kernel/sbi.c      | 42 +++++++++++++++++++++++++++++++++++-
>   arch/riscv/mm/init.c         |  3 +++
>   3 files changed, 49 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> index 5b4a1bf5f439..5360f3476278 100644
> --- a/arch/riscv/include/asm/sbi.h
> +++ b/arch/riscv/include/asm/sbi.h
> @@ -252,6 +252,9 @@ enum sbi_pmu_ctr_type {
>   #define SBI_ERR_ALREADY_STARTED -7
>   #define SBI_ERR_ALREADY_STOPPED -8
>   
> +/* SBI implementation IDs */
> +#define SBI_IMP_OPENSBI	1
> +
>   extern unsigned long sbi_spec_version;
>   struct sbiret {
>   	long error;
> @@ -259,6 +262,8 @@ struct sbiret {
>   };
>   
>   void sbi_init(void);
> +void sbi_apply_reserved_mem_erratum(void *dtb_va);
> +
>   struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
>   			unsigned long arg1, unsigned long arg2,
>   			unsigned long arg3, unsigned long arg4,
> diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
> index c672c8ba9a2a..aeb27263fa53 100644
> --- a/arch/riscv/kernel/sbi.c
> +++ b/arch/riscv/kernel/sbi.c
> @@ -5,8 +5,10 @@
>    * Copyright (c) 2020 Western Digital Corporation or its affiliates.
>    */
>   
> +#include <linux/acpi.h>
>   #include <linux/bits.h>
>   #include <linux/init.h>
> +#include <linux/libfdt.h>
>   #include <linux/pm.h>
>   #include <linux/reboot.h>
>   #include <asm/sbi.h>
> @@ -583,6 +585,40 @@ long sbi_get_mimpid(void)
>   }
>   EXPORT_SYMBOL_GPL(sbi_get_mimpid);
>   
> +static long sbi_firmware_id;
> +static long sbi_firmware_version;
> +
> +/*
> + * For devicetrees patched by OpenSBI a "mmode_resv" node is added to cover
> + * the region OpenSBI has protected by means of a PMP. Some versions of OpenSBI,
> + * [v0.8 to v1.3), omitted the "no-map" property, but this trips up hibernation
> + * among other things.
> + */
> +void __init sbi_apply_reserved_mem_erratum(void *dtb_pa)
> +{
> +	int child, reserved_mem;
> +
> +	if (sbi_firmware_id != SBI_IMP_OPENSBI)
> +		return;
> +
> +	if (!acpi_disabled)
> +		return;
> +
> +	if (sbi_firmware_version >= 0x10003 || sbi_firmware_version < 0x8)
> +		return;
> +
> +	reserved_mem = fdt_path_offset((void *)dtb_pa, "/reserved-memory");
> +	if (reserved_mem < 0)
> +		return;
> +
> +	fdt_for_each_subnode(child, (void *)dtb_pa, reserved_mem) {
> +		const char *name = fdt_get_name((void *)dtb_pa, child, NULL);
> +
> +		if (!strncmp(name, "mmode_resv", 10))


I would check that name != NULL before strncmp.


> +			fdt_setprop((void *)dtb_pa, child, "no-map", NULL, 0);
> +	}
> +};
> +
>   void __init sbi_init(void)
>   {
>   	int ret;
> @@ -596,8 +632,12 @@ void __init sbi_init(void)
>   		sbi_major_version(), sbi_minor_version());
>   
>   	if (!sbi_spec_is_0_1()) {
> +		sbi_firmware_id = sbi_get_firmware_id();
> +		sbi_firmware_version = sbi_get_firmware_version();
> +
>   		pr_info("SBI implementation ID=0x%lx Version=0x%lx\n",
> -			sbi_get_firmware_id(), sbi_get_firmware_version());
> +			sbi_firmware_id, sbi_firmware_version);
> +
>   		if (sbi_probe_extension(SBI_EXT_TIME)) {
>   			__sbi_set_timer = __sbi_set_timer_v02;
>   			pr_info("SBI TIME extension detected\n");
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 70fb31960b63..cb16bfdeacdb 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -29,6 +29,7 @@
>   #include <asm/tlbflush.h>
>   #include <asm/sections.h>
>   #include <asm/soc.h>
> +#include <asm/sbi.h>
>   #include <asm/io.h>
>   #include <asm/ptdump.h>
>   #include <asm/numa.h>
> @@ -253,6 +254,8 @@ static void __init setup_bootmem(void)
>   	 * in the device tree, otherwise the allocation could end up in a
>   	 * reserved region.
>   	 */
> +
> +	sbi_apply_reserved_mem_erratum(dtb_early_va);
>   	early_init_fdt_scan_reserved_mem();
>   
>   	/*


Otherwise the patch looks good to me:

You can add:

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

I just have one question though (that we discussed privately already): 
should we fix openSBI in the kernel? If yes, what makes a bug worth 
being fixed in the kernel?

Thanks,


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
