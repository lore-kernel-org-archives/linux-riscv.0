Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1D4FC6FD1F
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Mar 2024 17:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R2/IWop6WHHSQ1RNx5Ig3NME4/HV1n7Umw0uXdgJQE0=; b=XTFF8zxoX7e+7Q
	+iEmLWVUgybTLaRotlveITcUb4PucNkF0IHwCiuxBllbQsaiWtpCWaKUCNYVo1SAqnzas63FNrtpX
	/25aA3PCKFQK1VOT4ud5rwwAU4nzIOnZo4/l92HxeDlYNrY8ugLQ6gDdfFET+b0cYAbmPjeF8/jEB
	LPT1EKeBqLzL6bp2Cy0GbdWG148eRByDXdSMz5vBfA1jwqAcm5al7fv9zybJ8fZA/1y1yg+NRIAJZ
	0iYPNYPBeuyYKGmwH5QSpfjkJ1eoyB1T4cGj6LyJ4jeTjrt0TsP1U4WayjyEkzX1nQ7uHaEywTzDK
	gJGgHdikRwxnAim06J+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmd2u-0000000DYnm-2U8B;
	Tue, 19 Mar 2024 17:14:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmd2r-0000000DYmv-3L8W
	for linux-riscv@lists.infradead.org;
	Tue, 19 Mar 2024 17:14:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7D41260F2A
	for <linux-riscv@lists.infradead.org>; Tue, 19 Mar 2024 17:14:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A3A3C433A6
	for <linux-riscv@lists.infradead.org>; Tue, 19 Mar 2024 17:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710868476;
	bh=k/GfgwRI/ijf/uVg7xWos3W1r9MkqyAZbqmhnCW/Ze0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=H8uGJ0HiJrClx6+giK7xETCTfdfIs1lhiGAu8IYK6EkWDgJkDJT/ydBAhl5L9u/Kq
	 uaN94tScqQYSegWgwm8XKrg8TTqyYkg+jfp2utHf/rPAIKMd78TQbCOQADWMYnxcut
	 +KPMXKbQCFpY5jpcvW05SKB1KpmBmrlJoFB5y6UlmC3wl7Vi4av5KPt1WlF7WX+rWI
	 5k7u7aJXyyiiHYn9iCcO86maZUxarp0xHp0ACD4G8+NPbFrTSrASjPCkGthpPzO/Le
	 yjq46To9zprEnNJXVOSCWIMz7byabwmYQcvJ4fUnCA635ZzwxlB4s98BFizdnchpSE
	 eBuVbjmIk7+Sg==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2d27184197cso76945031fa.1
        for <linux-riscv@lists.infradead.org>; Tue, 19 Mar 2024 10:14:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX3eMO6vAsJNdh3WtAG6LxX3y20PtL+oGDKsBxVjiQZS0BoL/CAOmOQ7RsDvOKH+JxxB4uk2Nn0sPzs6k/vTRxFDnoHUvqODKJzskuUFVXQ
X-Gm-Message-State: AOJu0YyYPv1WHeW8jjMGqv5hgGs6WFv/8wVK8cjP6mFKwZ+2Pw49osWV
	XHkMceLR1ITzbHtwKJ3QCzV/QYlm3GQkIVrD1NDmYOs47UqzlVor7X6NNv9ku+A8OzH9AVYN2tq
	3PEj0ITZKsvUl0Sty0fMBgbHkEU8=
X-Google-Smtp-Source: AGHT+IE2/6PMvryTfamN52aeDVNlffaly/Fn9IiQOIf0JucEaMGEOMlPO5PEM+e3k5q/g7FBsZx272U/H8lbFbyol/Q=
X-Received: by 2002:a05:651c:387:b0:2d4:22a6:cb15 with SMTP id
 e7-20020a05651c038700b002d422a6cb15mr1982908ljp.25.1710868474544; Tue, 19 Mar
 2024 10:14:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240318020916.1299190-1-haibo1.xu@intel.com>
In-Reply-To: <20240318020916.1299190-1-haibo1.xu@intel.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 19 Mar 2024 18:14:23 +0100
X-Gmail-Original-Message-ID: <CAMj1kXFgohP_dOCxbmem_5ZWiFs5KmYFOPkj3uAZWhumBfOWFQ@mail.gmail.com>
Message-ID: <CAMj1kXFgohP_dOCxbmem_5ZWiFs5KmYFOPkj3uAZWhumBfOWFQ@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: dmi: Add SMBIOS/DMI support
To: Haibo Xu <haibo1.xu@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_101438_041251_6D705F1D 
X-CRM114-Status: GOOD (  29.57  )
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
Cc: linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org, aou@eecs.berkeley.edu, palmer@dabbelt.com, paul.walmsley@sifive.com, linux-riscv@lists.infradead.org, xiaobo55x@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 18 Mar 2024 at 02:55, Haibo Xu <haibo1.xu@intel.com> wrote:
>
> Enable the dmi driver for riscv which would allow access the
> SMBIOS info through some userspace file(/sys/firmware/dmi/*).
>
> The change was based on that of arm64 and has been verified
> by dmidecode tool.
>
> Signed-off-by: Haibo Xu <haibo1.xu@intel.com>

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>


> ---
> Changes since v1
>   - Change to use memremap/memunmap for dmi_(early)_remap/unmap
>     definition(suggested by Ard)
>   - Minor clean up for comments (Ard)
> ---
>  arch/riscv/Kconfig                   | 11 +++++++++++
>  arch/riscv/include/asm/dmi.h         | 24 ++++++++++++++++++++++++
>  drivers/firmware/efi/riscv-runtime.c | 13 +++++++++++++
>  3 files changed, 48 insertions(+)
>  create mode 100644 arch/riscv/include/asm/dmi.h
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 8ebafe337eac..3639151cb4ef 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -952,6 +952,17 @@ config EFI
>           allow the kernel to be booted as an EFI application. This
>           is only useful on systems that have UEFI firmware.
>
> +config DMI
> +       bool "Enable support for SMBIOS (DMI) tables"
> +       depends on EFI
> +       default y
> +       help
> +         This enables SMBIOS/DMI feature for systems.
> +
> +         This option is only useful on systems that have UEFI firmware.
> +         However, even with this option, the resultant kernel should
> +         continue to boot on existing non-UEFI platforms.
> +
>  config CC_HAVE_STACKPROTECTOR_TLS
>         def_bool $(cc-option,-mstack-protector-guard=tls -mstack-protector-guard-reg=tp -mstack-protector-guard-offset=0)
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
> +#define dmi_early_remap(x, l)          memremap(x, l, MEMREMAP_WB)
> +#define dmi_early_unmap(x, l)          memunmap(x)
> +#define dmi_remap(x, l)                        memremap(x, l, MEMREMAP_WB)
> +#define dmi_unmap(x)                   memunmap(x)
> +#define dmi_alloc(l)                   kzalloc(l, GFP_KERNEL)
> +
> +#endif
> diff --git a/drivers/firmware/efi/riscv-runtime.c b/drivers/firmware/efi/riscv-runtime.c
> index 09525fb5c240..c3bfb9e77e02 100644
> --- a/drivers/firmware/efi/riscv-runtime.c
> +++ b/drivers/firmware/efi/riscv-runtime.c
> @@ -152,3 +152,16 @@ void arch_efi_call_virt_teardown(void)
>  {
>         efi_virtmap_unload();
>  }
> +
> +static int __init riscv_dmi_init(void)
> +{
> +       /*
> +        * On riscv, DMI depends on UEFI, and dmi_setup() needs to
> +        * be called early because dmi_id_init(), which is an arch_initcall
> +        * itself, depends on dmi_scan_machine() having been called already.
> +        */
> +       dmi_setup();
> +
> +       return 0;
> +}
> +core_initcall(riscv_dmi_init);
> --
> 2.34.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
