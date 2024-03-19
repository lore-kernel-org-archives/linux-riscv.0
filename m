Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0CBDC54E71
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Mar 2024 19:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ooEQT72I/3Xbo2DlnOz07vzwtWSBCmwJtuSPtPYvN10=; b=Mf3vVS32TP7k6w
	XD7NajftnnqTVjustwM4rr9ot2fj9r5eRuxLy91Xntmfv598nkkkT91pNUd6z5wodmBD/3M1FnpiH
	g/RLppbU4pK0EEIC+/h+WY6c0MfkGZkdGXovhIxFx8IcPu96RSOa4gmXycxFB1fVTH/ZQT5u4drJM
	nMCFTcEWJ8NUZhNHzYk5GykcKa/GebXpVuWXP/DnGaQ8j+OuKnviJtv/RT25U8RY8DRPP37yXFGmV
	LyUFo7zMK1jYb5P/nP8lSKZI4SN+An1Me/oI629j6/rT8WBuske4usuePsHg58diwo/tb36Eqdj2+
	mqjOpkhNnFTCHiMTxo5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmfPm-0000000E20w-0Vr5;
	Tue, 19 Mar 2024 19:46:26 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmfPj-0000000E20X-2GAM
	for linux-riscv@lists.infradead.org;
	Tue, 19 Mar 2024 19:46:25 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-5c6bd3100fcso3690787a12.3
        for <linux-riscv@lists.infradead.org>; Tue, 19 Mar 2024 12:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1710877582; x=1711482382; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2KQUlQtO0GZQ94WgTKWt7iDIjBKiCX2QYDYayr502WQ=;
        b=zVqIkQtUEhnANl3ztAJslz4phRzpEqGzg5GMI2OGGCI5HMtNHizJPfZTtewxrCaIWi
         scNssMZXEqnepWls4jJFMvTJ2l6ilg2DsEdOlxdIi3AKhLgRDnUYE7VSYmVUX1Nvhcyj
         VRw0605lDKY6zCOt7qWzI5n585aA5E3kFwPJ+HZp+8YsQ+xRBCAXzPv66gqhNAKC2tI5
         M6vUG3ArDlVPdufNc5cQfDeXNMz5NO1SJQs56OHliXP9gjQqz+xUmqQXqGl+fQna4b0Y
         wwvgzSKvxnXB4nnq05tjEzC+qP/LTw2NhsL1NUvZh3I2wYGjhBzI4oGdksyv+JdHilNF
         S6lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710877582; x=1711482382;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2KQUlQtO0GZQ94WgTKWt7iDIjBKiCX2QYDYayr502WQ=;
        b=LNzT/luZqT7Dczhs5X8vM9Q+d559Kx9fWezjUGelOtwAl6hAQWO6eVAO7+XExWOfli
         hMZ3xAxsepj0xpixGVYsa/DTeflRt4NI2cTbP5pAqMVl2uC8HI0v2RVHGESwxuZz+Z6a
         CGQUv+ooDzFDu7jNazY++haUNZ584xK1Xe29Mz0QcpjghVvz7inaoSRRB4UDQJr2zY4L
         O4HfY2s+kgdVK/gyzPTn62Gm+BCWNaTDtvCAxb4pNJhaRAuyRUPhPrwWU8Wnn0wDHSz5
         iNinXd6iuirUcJ4HlePyfb9CJl0I3vRrJLhIELt59fSkzvAqdtP+wq/HC48JQOTXJUL2
         0WlQ==
X-Forwarded-Encrypted: i=1; AJvYcCXA7269QhYsLoxwROFoPEf0MlivMRHxf2Awz+NcEHaypCvstpkcblgiwkroOsyLMokzyaykhQtGJNzlhJW6rw2vDZIUuVXGWmP/Jc3n78dJ
X-Gm-Message-State: AOJu0YyDIS63S3qM8j+pyP5AAiWYj67ZzERSCatI4ri+oVKRes/vLfLl
	ZPugQXBj0TQJYsvFkWNbXjyubuAIXjQZeGg1IT1+vMgap3CtdM87dYXiDws1dzE=
X-Google-Smtp-Source: AGHT+IH6Fr5ZQEaEEHnSwEVcf9F4d8R5mfhqSyj3jB2/xuGnf1ofBEDsSI4KPtl9LfuHjq/4erJvMg==
X-Received: by 2002:a05:6a20:d045:b0:1a3:579f:2c5c with SMTP id hv5-20020a056a20d04500b001a3579f2c5cmr9441879pzb.53.1710877582405;
        Tue, 19 Mar 2024 12:46:22 -0700 (PDT)
Received: from ?IPV6:2601:647:4180:9630::546? ([2601:647:4180:9630::546])
        by smtp.gmail.com with ESMTPSA id v14-20020aa799ce000000b006da96503d9fsm10149006pfi.109.2024.03.19.12.46.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Mar 2024 12:46:22 -0700 (PDT)
Message-ID: <7d69fac0-4cd1-4db6-b19f-fb5a418549ab@rivosinc.com>
Date: Tue, 19 Mar 2024 12:46:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] riscv: dmi: Add SMBIOS/DMI support
Content-Language: en-US
To: Haibo Xu <haibo1.xu@intel.com>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-efi@vger.kernel.org
Cc: aou@eecs.berkeley.edu, palmer@dabbelt.com, paul.walmsley@sifive.com,
 xiaobo55x@gmail.com, ardb@kernel.org
References: <20240318020916.1299190-1-haibo1.xu@intel.com>
From: Atish Patra <atishp@rivosinc.com>
In-Reply-To: <20240318020916.1299190-1-haibo1.xu@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_124623_860393_5ECC2169 
X-CRM114-Status: GOOD (  27.91  )
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

On 3/17/24 19:09, Haibo Xu wrote:
> Enable the dmi driver for riscv which would allow access the
> SMBIOS info through some userspace file(/sys/firmware/dmi/*).
> 
> The change was based on that of arm64 and has been verified
> by dmidecode tool.
> 
> Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
> ---
> Changes since v1
>    - Change to use memremap/memunmap for dmi_(early)_remap/unmap
>      definition(suggested by Ard)
>    - Minor clean up for comments (Ard)
> ---
>   arch/riscv/Kconfig                   | 11 +++++++++++
>   arch/riscv/include/asm/dmi.h         | 24 ++++++++++++++++++++++++
>   drivers/firmware/efi/riscv-runtime.c | 13 +++++++++++++
>   3 files changed, 48 insertions(+)
>   create mode 100644 arch/riscv/include/asm/dmi.h
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 8ebafe337eac..3639151cb4ef 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -952,6 +952,17 @@ config EFI
>   	  allow the kernel to be booted as an EFI application. This
>   	  is only useful on systems that have UEFI firmware.
>   
> +config DMI
> +	bool "Enable support for SMBIOS (DMI) tables"
> +	depends on EFI
> +	default y
> +	help
> +	  This enables SMBIOS/DMI feature for systems.
> +
> +	  This option is only useful on systems that have UEFI firmware.
> +	  However, even with this option, the resultant kernel should
> +	  continue to boot on existing non-UEFI platforms.
> +
>   config CC_HAVE_STACKPROTECTOR_TLS
>   	def_bool $(cc-option,-mstack-protector-guard=tls -mstack-protector-guard-reg=tp -mstack-protector-guard-offset=0)
>   
> diff --git a/arch/riscv/include/asm/dmi.h b/arch/riscv/include/asm/dmi.h
> new file mode 100644
> index 000000000000..ca7cce557ef7
> --- /dev/null
> +++ b/arch/riscv/include/asm/dmi.h
> @@ -0,0 +1,24 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2024 Intel Corporation
> + *
> + * based on arch/arm64/include/asm/dmi.h
> + *
> + * This file is subject to the terms and conditions of the GNU General Public
> + * License.  See the file "COPYING" in the main directory of this archive
> + * for more details.
> + */
> +
> +#ifndef __ASM_DMI_H
> +#define __ASM_DMI_H
> +
> +#include <linux/io.h>
> +#include <linux/slab.h>
> +
> +#define dmi_early_remap(x, l)		memremap(x, l, MEMREMAP_WB)
> +#define dmi_early_unmap(x, l)		memunmap(x)
> +#define dmi_remap(x, l)			memremap(x, l, MEMREMAP_WB)
> +#define dmi_unmap(x)			memunmap(x)
> +#define dmi_alloc(l)			kzalloc(l, GFP_KERNEL)
> +
> +#endif
> diff --git a/drivers/firmware/efi/riscv-runtime.c b/drivers/firmware/efi/riscv-runtime.c
> index 09525fb5c240..c3bfb9e77e02 100644
> --- a/drivers/firmware/efi/riscv-runtime.c
> +++ b/drivers/firmware/efi/riscv-runtime.c
> @@ -152,3 +152,16 @@ void arch_efi_call_virt_teardown(void)
>   {
>   	efi_virtmap_unload();
>   }
> +
> +static int __init riscv_dmi_init(void)
> +{
> +	/*
> +	 * On riscv, DMI depends on UEFI, and dmi_setup() needs to
> +	 * be called early because dmi_id_init(), which is an arch_initcall
> +	 * itself, depends on dmi_scan_machine() having been called already.
> +	 */
> +	dmi_setup();
> +
> +	return 0;
> +}
> +core_initcall(riscv_dmi_init);

Reviewed-by: Atish Patra <atishp@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
