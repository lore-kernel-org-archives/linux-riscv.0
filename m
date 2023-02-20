Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64A84C05027
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Feb 2023 16:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hokLsnZXQjvTbW1wQwHlkd/4HHN3v20EQYltlSgCXCY=; b=pFtqck0qMqsLqj
	1x1o4EN2z4C+LJLXEWpIh/jK1Sq5V2LHkKj1ue3m7wFDK8jhRO7iwPa46IkSEaquBvK6Ar3d/pMW8
	k5FAmCy5wy4vauaHFpdo4TgFUGWdoDpoLiraPpac3gjos5rPh44R8WvhIOiC0f6SuTHCaRqOaSHSF
	28ILVOWm4kahTp0nvmxTjoUQq3Soxm4ogds5kxEKUXffSHjzfYl8TXoUtc5nAZammTarAGzvW8t5I
	pc/gVlzc5Iaex0gXeyCcsTm0BvyhY8VCRuP7RrfWffMdvDV7K+XF5KXqHanZyDkgYUso5ox4qwzZR
	X/0TtdW4xGXTpE7AuyQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU99q-004tVS-CN; Mon, 20 Feb 2023 16:36:54 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU99m-004tUy-V3
	for linux-riscv@lists.infradead.org; Mon, 20 Feb 2023 16:36:52 +0000
Received: by mail-ed1-x52e.google.com with SMTP id h32so7128393eda.2
        for <linux-riscv@lists.infradead.org>; Mon, 20 Feb 2023 08:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Gy2k6uzXrdBZ+9LWY9d+nwMZp7xz2HlwZLFx49hNP9g=;
        b=TpHGFRHDaj6L/GsYQTeC1sF+8bGrDBEmP1R6PTWbip7w8XpEt6BwyilotGBoyY2lut
         y3EqcTrtkNFbljSKZ7UqKNeTnNPPvBvvTRZm7/xR8RLEadPHwUJg43iKqjTgSOoRWoZt
         ix7IS1hIfecpBnJLDxD9DkTQlGPFHsOS47QpEKsOyCvjiHx0/nl2BegRGVIXBDmzHXEx
         ITu0JSfsnT7i7bMGCm75UCbevPgUtB/MxBal3i2ozBLbwGrdDJEte6Ijdf5NwtGPFmVT
         HOI5zMY+5T9VrMGquUOr5CowaAC+utxVfkXJ7OwQcz2c9RMIOuOsblXtlryP2LmNscvX
         gvew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gy2k6uzXrdBZ+9LWY9d+nwMZp7xz2HlwZLFx49hNP9g=;
        b=dlXnj9t8bY1rpKE8GSkUPyQDrDPCzULmVGzOawRvYi35azwLcmmTBwhzlD78NybgJe
         RPSWjaaU0fSyGyFuANzLEL0IbgUTPji9u+kDj6qV9Ip6O00Itp/zbj6rrIHFRuClRJlz
         dpAuc9cb0Rb0H0vfX61m1mNBBlMbcKBGgoKTf53RvKJZuGu5eoARKQLg6FAUFAh7vcbn
         tmXztSyFC1bL1XCTxz7FFCk6M4t7dy1CsYwqyEwKgtjAtUhnO0YYRanCOir7ZCVIRmFM
         OT+qLuToga8Z4teuN9ZqpgJ7hpgkigzz7AmMxr3DTaoh2VaOcqobgMWJ+wIGCkdh88ji
         Yopw==
X-Gm-Message-State: AO0yUKUYyl/qL79k85rJeI/8jZejNXLRdYxKEg6Fm3R7US2fP7YxeGIg
	SO4TO7hYZT85/YhxKiGlEOu9Gg==
X-Google-Smtp-Source: AK7set8f7wLm+Jt4Gkb2dFwkWyJsdWDS+/tlXIlGXvJpVMXaMkBR3QupRPWu8McOFOzt84ByObZEyg==
X-Received: by 2002:a05:6402:202:b0:4ad:7c6c:537d with SMTP id t2-20020a056402020200b004ad7c6c537dmr1181749edv.33.1676911009276;
        Mon, 20 Feb 2023 08:36:49 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id k23-20020a508ad7000000b004af5001c7ecsm12081edk.12.2023.02.20.08.36.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 08:36:48 -0800 (PST)
Date: Mon, 20 Feb 2023 17:36:48 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Subject: Re: [PATCH V2 08/21] drivers/acpi: RISC-V: Add RHCT related code
Message-ID: <20230220163648.72bw7ujwzkx42far@orel>
References: <20230216182043.1946553-1-sunilvl@ventanamicro.com>
 <20230216182043.1946553-9-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230216182043.1946553-9-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_083651_024701_3D9A2008 
X-CRM114-Status: GOOD (  33.70  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Feb 16, 2023 at 11:50:30PM +0530, Sunil V L wrote:
> RHCT is a new table defined for RISC-V to communicate the
> features of the CPU to the OS. Create a new architecture folder
> in drivers/acpi and add RHCT parsing code.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> ---
>  arch/riscv/include/asm/acpi.h |  9 ++++
>  drivers/acpi/Makefile         |  2 +
>  drivers/acpi/riscv/Makefile   |  2 +
>  drivers/acpi/riscv/rhct.c     | 92 +++++++++++++++++++++++++++++++++++
>  4 files changed, 105 insertions(+)
>  create mode 100644 drivers/acpi/riscv/Makefile
>  create mode 100644 drivers/acpi/riscv/rhct.c
> 
> diff --git a/arch/riscv/include/asm/acpi.h b/arch/riscv/include/asm/acpi.h
> index 4a3622b38159..7bc49f65c86b 100644
> --- a/arch/riscv/include/asm/acpi.h
> +++ b/arch/riscv/include/asm/acpi.h
> @@ -58,6 +58,15 @@ static inline bool acpi_has_cpu_in_madt(void)
>  
>  static inline void arch_fix_phys_package_id(int num, u32 slot) { }
>  
> +int acpi_get_riscv_isa(struct acpi_table_header *table,
> +		       unsigned int cpu, const char **isa);
> +#else
> +static inline int acpi_get_riscv_isa(struct acpi_table_header *table,
> +				     unsigned int cpu, const char **isa)
> +{
> +	return -EINVAL;
> +}
> +
>  #endif /* CONFIG_ACPI */
>  
>  #endif /*_ASM_ACPI_H*/
> diff --git a/drivers/acpi/Makefile b/drivers/acpi/Makefile
> index feb36c0b9446..3fc5a0d54f6e 100644
> --- a/drivers/acpi/Makefile
> +++ b/drivers/acpi/Makefile
> @@ -131,3 +131,5 @@ obj-y				+= dptf/
>  obj-$(CONFIG_ARM64)		+= arm64/
>  
>  obj-$(CONFIG_ACPI_VIOT)		+= viot.o
> +
> +obj-$(CONFIG_RISCV)		+= riscv/
> diff --git a/drivers/acpi/riscv/Makefile b/drivers/acpi/riscv/Makefile
> new file mode 100644
> index 000000000000..8b3b126e0b94
> --- /dev/null
> +++ b/drivers/acpi/riscv/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +obj-y 	+= rhct.o
> diff --git a/drivers/acpi/riscv/rhct.c b/drivers/acpi/riscv/rhct.c
> new file mode 100644
> index 000000000000..5bafc236d627
> --- /dev/null
> +++ b/drivers/acpi/riscv/rhct.c
> @@ -0,0 +1,92 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2022-2023, Ventana Micro Systems Inc
> + *	Author: Sunil V L <sunilvl@ventanamicro.com>
> + *
> + */
> +
> +#define pr_fmt(fmt)	"ACPI: RHCT: " fmt
> +
> +#include <linux/acpi.h>
> +
> +static void acpi_rhct_warn_missing(void)
> +{
> +	pr_warn_once("No RHCT table found\n");
> +}
> +
> +static struct acpi_table_header *acpi_get_rhct(void)
> +{
> +	static struct acpi_table_header *rhct;
> +	acpi_status status;
> +
> +	/*
> +	 * RHCT will be used at runtime on every CPU, so we
> +	 * don't need to call acpi_put_table() to release the table mapping.
> +	 */
> +	if (!rhct) {
> +		status = acpi_get_table(ACPI_SIG_RHCT, 0, &rhct);
> +		if (ACPI_FAILURE(status))
> +			acpi_rhct_warn_missing();

Probably don't need the wrapper function for this one callsite. Also,
returning NULL here, rather than relying on acpi_get_table() to set
rhct to NULL would be a bit more robust.

> +	}
> +
> +	return rhct;
> +}
> +
> +/*
> + * During early boot, the caller should call acpi_get_table() and pass its pointer to
> + * these functions(and free up later). At run time, since this table can be used
> + * multiple times, pass NULL so that the table remains in memory

...multiple times, NULL may be passed in order to use the cached table.

> + */
> +int acpi_get_riscv_isa(struct acpi_table_header *table, unsigned int acpi_cpu_id, const char **isa)
> +{
> +	struct acpi_rhct_node_header *node, *ref_node, *end;
> +	struct acpi_table_rhct *rhct;
> +	struct acpi_rhct_hart_info *hart_info;
> +	struct acpi_rhct_isa_string *isa_node;
> +	u32 *hart_info_node_offset;
> +	int i, j;
> +	u32 size_hdr = sizeof(struct acpi_rhct_node_header);
> +	u32 size_hartinfo = sizeof(struct acpi_rhct_hart_info);
> +
> +	if (acpi_disabled) {
> +		pr_debug("%s: acpi is disabled\n", __func__);
> +		return -1;

This seems like something that should never happen and easy to catch
and fix with a BUG_ON. Is there any chance that BUG'ing here would
be a bad idea?

> +	}
> +
> +	if (!table) {
> +		rhct = (struct acpi_table_rhct *)acpi_get_rhct();
> +		if (!rhct)
> +			return -ENOENT;
> +	} else {
> +		rhct = (struct acpi_table_rhct *)table;
> +	}
> +
> +	node = ACPI_ADD_PTR(struct acpi_rhct_node_header, rhct, rhct->node_offset);
> +	end = ACPI_ADD_PTR(struct acpi_rhct_node_header, rhct, rhct->header.length);
> +
> +	for (i = 0; i < rhct->node_count; i++) {
> +		if (node >= end)
> +			break;

for (node = ACPI_ADD_PTR(struct acpi_rhct_node_header, rhct, rhct->node_offset);
     node < end;
     node = ACPI_ADD_PTR(struct acpi_rhct_node_header, node node->length))

> +		switch (node->type) {
> +		case ACPI_RHCT_NODE_TYPE_HART_INFO:

if (node->type == ACPI_RHCT_NODE_TYPE_HART_INFO)

> +			hart_info = ACPI_ADD_PTR(struct acpi_rhct_hart_info, node, size_hdr);
> +			hart_info_node_offset = ACPI_ADD_PTR(u32, hart_info, size_hartinfo);
> +			if (acpi_cpu_id != hart_info->uid)
> +				break;

With the above suggested changes, this 'break' becomes 'continue'.

> +			for (j = 0; j < hart_info->num_offsets; j++) {
> +				ref_node = ACPI_ADD_PTR(struct acpi_rhct_node_header,
> +							rhct, hart_info_node_offset[j]);
> +				if (ref_node->type == ACPI_RHCT_NODE_TYPE_ISA_STRING) {
> +					isa_node = ACPI_ADD_PTR(struct acpi_rhct_isa_string,
> +								ref_node, size_hdr);
> +					*isa = isa_node->isa;
> +					return 0;
> +				}
> +			}
> +			break;
> +		}
> +		node = ACPI_ADD_PTR(struct acpi_rhct_node_header, node, node->length);
> +	}
> +
> +	return -1;
> +}
> -- 
> 2.34.1
> 

Other than the nits,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
