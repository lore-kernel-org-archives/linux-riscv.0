Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 035A9CF6D3B
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Oct 2024 17:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=j4PM36V3rrWgnCewpiJljHHHvOKU8Z6Q6tjkY6gClug=; b=DRPX9Y6fBmz/G6tJu50kadHdL/
	//PNbjPVD4HDsvop1NZ1KujQKG1CiBvB/VNpRoBYS6jTOShilQnLI7Vqmc7DwsPZmwdMU5VQF5YVp
	omGS2mgqKRH/8LBQqJkk8Km/9wRfASDQ/2k45q176nceGc6FzHHyCxM1QsIdJtcQoVTvaeV+RNhBX
	sfq1t7y4QV+T4qVG4Bia/tu1bxvdpRaBmtG+9+rK8ylCBo5EOYFszgIDAVCfqvL7YJeyI+14t3E0f
	FTWOP8YUVOrKbBMHraWiw3B0wZPq4BrHoQKxaELXmIHGt63pYO8YQfdc8GUv1PkFomzFUpoyYgBai
	apxrvrgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sw2id-0000000701A-43WK;
	Wed, 02 Oct 2024 17:00:55 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sw2hP-00000006zgX-3yeY
	for linux-riscv@lists.infradead.org;
	Wed, 02 Oct 2024 16:59:42 +0000
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E41D040615
	for <linux-riscv@lists.infradead.org>; Wed,  2 Oct 2024 16:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1727888373;
	bh=jOHh59GRXNfOUGegaYQL6JngKA1K1v1abGrefUApkfM=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=iNRkmySF7hC/LEdTd/BwobgChPYGM7d/Jk3571q3IxGZI2Yxbnl2g8so+a1mmOdKB
	 aOukgc0m85e+dbd7QDhBjtZBQU01c+cIC1YxEkS+JQhhB8awOwP/vBGoLF+6ufGfP4
	 OdKSC5XUtLNu0LNeYb6mF1HzZ25L1cEg53SYzfjTa4hrUV2x+u6j8SFUp7C5ZYM4dH
	 ISFZlPMxxc7cBkKrL1cH+XrXUOZIw9AGnTEjHAVZz6Z8/BRrU82cAFzilpTXManAzB
	 qt69IavNkQPDcG7EQIolgkTnqWNcaNkkh1dey0tsgyR21pnZZLx4UqG4RwufaFW3IN
	 90Ml0DqS94N4A==
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-2872f9c02ccso69000fac.0
        for <linux-riscv@lists.infradead.org>; Wed, 02 Oct 2024 09:59:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727888372; x=1728493172;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jOHh59GRXNfOUGegaYQL6JngKA1K1v1abGrefUApkfM=;
        b=OCLM+mAtxklHI72PeCakwHBgxPlCoKWUEJK/gTWRs/uAv74ef9h4FQ/YYXsC2Gkqoc
         9dCPZ/SlD+mDUnR6+/fIRC0nCu7nP47eOrtBOAPXa447p4Df72VEsj+vnQZuO24vpyB5
         bFDZQGCFe4NYRqtefG55uYEPAhjqfoXWqaWf9gPhzxZEemTea6LE1DczkJykKoQL8cR7
         E4wKlEW293kM9ffWPl7seN0Ai978bfdihCUHbATZw7lfjAuM1XScjRSdcDKFIlDhQcB+
         7sgByrcaTSQ3Yor4nKDTwtFkZDdKZfW4i5zqPKVFz4kdsg5eJBSON39g21N/1YrY50M1
         +JBQ==
X-Gm-Message-State: AOJu0YxeaVYNtHHv5KIUYEYECC7mvfFF8zF9AbX5pMFO1KBey/hTw1MW
	UAFdooAp+W2yh4a6Txnlusr6yYp+gU9IMnhevqUYrBsuXKni0VO+TYhT6jsBb4K7wNdifV/8AbK
	EOzc53/Ste6L08zlprneKD9x9MyrNT5/35ND5cORKt5YLzK0nTRhV1vgq8p2tT6k+/6ZNiEj2yK
	bF4JU3ZPYSgz1tjThTmUJrpHkOnxnGXJJ5ERnuqEfUmfLB/yQ4UWX5P0PB43js/hH1
X-Received: by 2002:a05:6871:a6aa:b0:287:541:c60 with SMTP id 586e51a60fabf-287889aa2b0mr2470197fac.1.1727888372573;
        Wed, 02 Oct 2024 09:59:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqcxKIhFuRh+HBH4VGMynHVutdUUyzDUM77wrN93IMmYcomKUkacOGnkCdDFPa2rdTrgDyhXCZk9+ZWOlwbms=
X-Received: by 2002:a05:6871:a6aa:b0:287:541:c60 with SMTP id
 586e51a60fabf-287889aa2b0mr2470156fac.1.1727888372149; Wed, 02 Oct 2024
 09:59:32 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 2 Oct 2024 09:59:31 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20240911-xtheadvector-v10-10-8d3930091246@rivosinc.com>
References: <20240911-xtheadvector-v10-0-8d3930091246@rivosinc.com> <20240911-xtheadvector-v10-10-8d3930091246@rivosinc.com>
Mime-Version: 1.0
Date: Wed, 2 Oct 2024 09:59:31 -0700
Message-ID: <CAJM55Z95=ga=2qPirda4XjLRX1OWbXRzWwbi9eXYeow_K_ZoQQ@mail.gmail.com>
Subject: Re: [PATCH v10 10/14] riscv: hwprobe: Add thead vendor extension probing
To: Charlie Jenkins <charlie@rivosinc.com>, Conor Dooley <conor@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Samuel Holland <samuel.holland@sifive.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <shuah@kernel.org>, Guo Ren <guoren@kernel.org>, Evan Green <evan@rivosinc.com>, 
	Andy Chiu <andy.chiu@sifive.com>, Jessica Clarke <jrtc27@jrtc27.com>, 
	Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_095940_400243_0356E8A7 
X-CRM114-Status: GOOD (  31.26  )
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

Charlie Jenkins wrote:
> Add a new hwprobe key "RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0" which
> allows userspace to probe for the new RISCV_ISA_VENDOR_EXT_XTHEADVECTOR
> vendor extension.
>
> This new key will allow userspace code to probe for which thead vendor
> extensions are supported. This API is modeled to be consistent with
> RISCV_HWPROBE_KEY_IMA_EXT_0. The bitmask returned will have each bit
> corresponding to a supported thead vendor extension of the cpumask set.
> Just like RISCV_HWPROBE_KEY_IMA_EXT_0, this allows a userspace program
> to determine all of the supported thead vendor extensions in one call.
>
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> Reviewed-by: Evan Green <evan@rivosinc.com>
> ---
>  arch/riscv/include/asm/hwprobe.h                   |  3 +-
>  .../include/asm/vendor_extensions/thead_hwprobe.h  | 19 +++++++++++
>  .../include/asm/vendor_extensions/vendor_hwprobe.h | 37 ++++++++++++++++++++++
>  arch/riscv/include/uapi/asm/hwprobe.h              |  3 +-
>  arch/riscv/include/uapi/asm/vendor/thead.h         |  3 ++
>  arch/riscv/kernel/sys_hwprobe.c                    |  5 +++
>  arch/riscv/kernel/vendor_extensions/Makefile       |  1 +
>  .../riscv/kernel/vendor_extensions/thead_hwprobe.c | 19 +++++++++++
>  8 files changed, 88 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
> index ef01c182af2b..6148e1eab64c 100644
> --- a/arch/riscv/include/asm/hwprobe.h
> +++ b/arch/riscv/include/asm/hwprobe.h
> @@ -1,6 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
>  /*
> - * Copyright 2023 Rivos, Inc
> + * Copyright 2023-2024 Rivos, Inc
>   */
>
>  #ifndef _ASM_HWPROBE_H
> @@ -21,6 +21,7 @@ static inline bool hwprobe_key_is_bitmask(__s64 key)
>  	case RISCV_HWPROBE_KEY_BASE_BEHAVIOR:
>  	case RISCV_HWPROBE_KEY_IMA_EXT_0:
>  	case RISCV_HWPROBE_KEY_CPUPERF_0:
> +	case RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0:
>  		return true;
>  	}
>
> diff --git a/arch/riscv/include/asm/vendor_extensions/thead_hwprobe.h b/arch/riscv/include/asm/vendor_extensions/thead_hwprobe.h
> new file mode 100644
> index 000000000000..65a9c5612466
> --- /dev/null
> +++ b/arch/riscv/include/asm/vendor_extensions/thead_hwprobe.h
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ASM_RISCV_VENDOR_EXTENSIONS_THEAD_HWPROBE_H
> +#define _ASM_RISCV_VENDOR_EXTENSIONS_THEAD_HWPROBE_H
> +
> +#include <linux/cpumask.h>
> +
> +#include <uapi/asm/hwprobe.h>
> +
> +#ifdef CONFIG_RISCV_ISA_VENDOR_EXT_THEAD
> +void hwprobe_isa_vendor_ext_thead_0(struct riscv_hwprobe *pair, const struct cpumask *cpus);
> +#else
> +static inline void hwprobe_isa_vendor_ext_thead_0(struct riscv_hwprobe *pair,
> +						  const struct cpumask *cpus)
> +{
> +	pair->value = 0;
> +}
> +#endif
> +
> +#endif
> diff --git a/arch/riscv/include/asm/vendor_extensions/vendor_hwprobe.h b/arch/riscv/include/asm/vendor_extensions/vendor_hwprobe.h
> new file mode 100644
> index 000000000000..6b9293e984a9
> --- /dev/null
> +++ b/arch/riscv/include/asm/vendor_extensions/vendor_hwprobe.h
> @@ -0,0 +1,37 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright 2024 Rivos, Inc
> + */
> +
> +#ifndef _ASM_RISCV_SYS_HWPROBE_H
> +#define _ASM_RISCV_SYS_HWPROBE_H
> +
> +#include <asm/cpufeature.h>
> +
> +#define VENDOR_EXT_KEY(ext)								\
> +	do {										\
> +		if (__riscv_isa_extension_available(isainfo->isa, RISCV_ISA_VENDOR_EXT_##ext)) \
> +			pair->value |= RISCV_HWPROBE_VENDOR_EXT_##ext;			\
> +		else									\
> +			missing |= RISCV_HWPROBE_VENDOR_EXT_##ext;			\
> +	} while (false)
> +
> +/*
> + * Loop through and record extensions that 1) anyone has, and 2) anyone
> + * doesn't have.
> + *
> + * _extension_checks is an arbitrary C block to set the values of pair->value
> + * and missing. It should be filled with VENDOR_EXT_KEY expressions.
> + */
> +#define VENDOR_EXTENSION_SUPPORTED(pair, cpus, per_hart_vendor_bitmap, _extension_checks)	\
> +	do {											\
> +		int cpu;									\
> +		u64 missing = 0;								\
> +		for_each_cpu(cpu, (cpus)) {							\
> +			struct riscv_isavendorinfo *isainfo = &(per_hart_vendor_bitmap)[cpu];	\
> +			_extension_checks							\
> +		}										\
> +		(pair)->value &= ~missing;							\
> +	} while (false)										\
> +
> +#endif /* _ASM_RISCV_SYS_HWPROBE_H */
> diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
> index b706c8e47b02..452d0b84f17f 100644
> --- a/arch/riscv/include/uapi/asm/hwprobe.h
> +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> @@ -1,6 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
>  /*
> - * Copyright 2023 Rivos, Inc
> + * Copyright 2023-2024 Rivos, Inc
>   */
>
>  #ifndef _UAPI_ASM_HWPROBE_H
> @@ -82,6 +82,7 @@ struct riscv_hwprobe {
>  #define RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE	6
>  #define RISCV_HWPROBE_KEY_HIGHEST_VIRT_ADDRESS	7
>  #define RISCV_HWPROBE_KEY_TIME_CSR_FREQ	8
> +#define RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0	9
>  /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */

I wanted to try this patchset on my Nezha board, but rebasing on v6.11
this conflicts with

  c42e2f076769 ("RISC-V: hwprobe: Add MISALIGNED_PERF key")

While fixing it up I bumped the RISCV_HWPROBE_MAX_KEY as the comment above told
me to do, but now I notice you don't do that in this patch. Is that a bug or am
I misunderstanding something?

/Emil

>
>  /* Flags */
> diff --git a/arch/riscv/include/uapi/asm/vendor/thead.h b/arch/riscv/include/uapi/asm/vendor/thead.h
> new file mode 100644
> index 000000000000..43790ebe5faf
> --- /dev/null
> +++ b/arch/riscv/include/uapi/asm/vendor/thead.h
> @@ -0,0 +1,3 @@
> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> +
> +#define		RISCV_HWPROBE_VENDOR_EXT_XTHEADVECTOR	(1 << 0)
> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
> index 8d1b5c35d2a7..5a3dc8e66c85 100644
> --- a/arch/riscv/kernel/sys_hwprobe.c
> +++ b/arch/riscv/kernel/sys_hwprobe.c
> @@ -15,6 +15,7 @@
>  #include <asm/uaccess.h>
>  #include <asm/unistd.h>
>  #include <asm/vector.h>
> +#include <asm/vendor_extensions/thead_hwprobe.h>
>  #include <vdso/vsyscall.h>
>
>
> @@ -241,6 +242,10 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
>  		pair->value = riscv_timebase;
>  		break;
>
> +	case RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0:
> +		hwprobe_isa_vendor_ext_thead_0(pair, cpus);
> +		break;
> +
>  	/*
>  	 * For forward compatibility, unknown keys don't fail the whole
>  	 * call, but get their element key set to -1 and value set to 0
> diff --git a/arch/riscv/kernel/vendor_extensions/Makefile b/arch/riscv/kernel/vendor_extensions/Makefile
> index 353522cb3bf0..866414c81a9f 100644
> --- a/arch/riscv/kernel/vendor_extensions/Makefile
> +++ b/arch/riscv/kernel/vendor_extensions/Makefile
> @@ -2,3 +2,4 @@
>
>  obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_ANDES)	+= andes.o
>  obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_THEAD)	+= thead.o
> +obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_THEAD)	+= thead_hwprobe.o
> diff --git a/arch/riscv/kernel/vendor_extensions/thead_hwprobe.c b/arch/riscv/kernel/vendor_extensions/thead_hwprobe.c
> new file mode 100644
> index 000000000000..2eba34011786
> --- /dev/null
> +++ b/arch/riscv/kernel/vendor_extensions/thead_hwprobe.c
> @@ -0,0 +1,19 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +#include <asm/vendor_extensions/thead.h>
> +#include <asm/vendor_extensions/thead_hwprobe.h>
> +#include <asm/vendor_extensions/vendor_hwprobe.h>
> +
> +#include <linux/cpumask.h>
> +#include <linux/types.h>
> +
> +#include <uapi/asm/hwprobe.h>
> +#include <uapi/asm/vendor/thead.h>
> +
> +void hwprobe_isa_vendor_ext_thead_0(struct riscv_hwprobe *pair, const struct cpumask *cpus)
> +{
> +	VENDOR_EXTENSION_SUPPORTED(pair, cpus,
> +				   riscv_isa_vendor_ext_list_thead.per_hart_isa_bitmap, {
> +		VENDOR_EXT_KEY(XTHEADVECTOR);
> +	});
> +}
>
> --
> 2.45.0
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
