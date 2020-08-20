Return-Path: <SRS0=ioKI=B6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 156F0C433E1
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Aug 2020 20:45:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB2E82076E
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Aug 2020 20:45:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1qTtRPVE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="SAFahshs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB2E82076E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=Fuou0NofAUXTeASBCCwsPSdcNeQncjm1uKDrGXtHcBY=; b=1qTtRPVEIMDBlsZKvD/aWlL9T
	MG2oVpWuWVZr487ooaSm9GATQd9Uxj8U9rMCe22ppa2s8fUoUp0MCul2PZyjKYq19Qf/T+8ghCOmm
	yc7iVSqdeMMArLZl7d64vdhiIG38dOxkaYee0RVJ9r1HP1cCFWQN0EWEaeWP5tKHIAre+JtAOLQsW
	GYcytl5X+DqaJ5W/O8I/CJrGzxQPpCTrD3SFm6nnY7PqBBOZ7wx86tQqhF9DYWyI9h8kGWryKS8LD
	J/S3+0jbSlkGMstNkRjwvaY+xWoKwUWSBaV26aWa2pDaIJTzcbGNBlSZ37SZpaxRC7fjnLAIz3nTu
	qgoMZ+yow==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8rQn-0001UQ-Tn; Thu, 20 Aug 2020 20:45:06 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8rQj-0001Ry-Np
 for linux-riscv@lists.infradead.org; Thu, 20 Aug 2020 20:45:03 +0000
Received: by mail-pj1-x1042.google.com with SMTP id kr4so1491365pjb.2
 for <linux-riscv@lists.infradead.org>; Thu, 20 Aug 2020 13:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=Sfg9PlPqpzSttQj2qjkOKfxj0w4fdfsckZ9fgydryZo=;
 b=SAFahshsfFcs8fb/b075RRH+4iW0ZbwS2W/BoXJyGPIxcl19f4ddfqrwtU/Db2ynFY
 /pXW1LOJ5y37w6gu6645WCyV7d+/JPgrgI9uBuv6gui1hbvWpW5p96Q74xRclz4Pp1N6
 C69WqIlNTpWE1uF/tBwCNrbvWCL77hn+3dOgrLJUBJ+zHwKkTE1HH4iUsWKJpziRmfbf
 mEJMk2AT1MyTFfCrtyQnAo7ZzSxY+/ptUHCQiypWUpJVutulCaYvdrgtulwXWPdRy5JL
 6QzlcHSWZtNwYJgr6Ct9uMf7wTqYjG4DMmVYdFYBNrWy8Ixx8YFw0BqAV1Q9IqIlzC2A
 hfUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=Sfg9PlPqpzSttQj2qjkOKfxj0w4fdfsckZ9fgydryZo=;
 b=sBpLYA0fdIg9jod/mjW7H6ODhMUyoa/v9NUs9xb4BHYSr5D81MtmoKkhqZ0XZC5aEk
 45EmgF/BVjUB4k0ThusJLACojV396ksbvfazJuQvLJcHG0YpE9/Agv4bi/jZG4ldvLic
 YBQC3XNKSpoQ4CZGfrhS7C5Fm9m/IgE5k80Jlqi/pMlWK21psO9yc0E9671fRDUMZ9xB
 OwyRbokFK4UkjLriMbxtUxz/Fct2v28RkeKDAOKTKmlE1WKuAE+qj7aHBvqY56b9pQbw
 Ej6kjUG+FGgztolG1TcWDWY5d8WLAZDyG8JcxItAwxn043nVkRCCQpVC8DakoNtkhylB
 3jQQ==
X-Gm-Message-State: AOAM533xdqzYkQnWQkMhIaa9WVuoXN5rupbq36xTXgT2LrYXzNoWUiTE
 rLdzbLloZdWQMI5cHQcdS0Z2wQ==
X-Google-Smtp-Source: ABdhPJxmW3nmPwzJ0K3beOFI2kflSpsGyHgrI8AYCHRSMjcjaJfYYpODukCbL5GhmQ3vYyDNSxD2ww==
X-Received: by 2002:a17:90b:1287:: with SMTP id
 fw7mr64950pjb.218.1597956299419; 
 Thu, 20 Aug 2020 13:44:59 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id 8sm3015207pjx.14.2020.08.20.13.44.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2020 13:44:58 -0700 (PDT)
Date: Thu, 20 Aug 2020 13:44:58 -0700 (PDT)
X-Google-Original-Date: Thu, 20 Aug 2020 13:44:14 PDT (-0700)
Subject: Re: [PATCH 3/3] riscv: Add cache information in AUX vector
In-Reply-To: <aa7675dda78d3d595617d8d56b7fdd7f279a884f.1593766028.git.zong.li@sifive.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: zong.li@sifive.com
Message-ID: <mhng-de0c1096-4f7f-45eb-b956-2d28188576e2@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_164501_890579_B71F9F48 
X-CRM114-Status: GOOD (  32.17  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 zong.li@sifive.com, Paul Walmsley <paul.walmsley@sifive.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 03 Jul 2020 01:57:55 PDT (-0700), zong.li@sifive.com wrote:
> There are no standard CSR registers to provide cache information, the
> way for RISC-V is to get this information from DT. Currently, AT_L1I_X,
> AT_L1D_X and AT_L2_X are present in glibc header, and sysconf syscall
> could use them to get information of cache through AUX vector.
>
> The result of 'getconf -a' as follows:
> LEVEL1_ICACHE_SIZE                 32768
> LEVEL1_ICACHE_ASSOC                8
> LEVEL1_ICACHE_LINESIZE             64
> LEVEL1_DCACHE_SIZE                 32768
> LEVEL1_DCACHE_ASSOC                8
> LEVEL1_DCACHE_LINESIZE             64
> LEVEL2_CACHE_SIZE                  2097152
> LEVEL2_CACHE_ASSOC                 32
> LEVEL2_CACHE_LINESIZE              64
>
> Signed-off-by: Zong Li <zong.li@sifive.com>
> ---
>  arch/riscv/include/asm/cacheinfo.h   | 14 ++++++++++++
>  arch/riscv/include/asm/elf.h         | 13 +++++++++++
>  arch/riscv/include/uapi/asm/auxvec.h | 23 ++++++++++++++++++-
>  arch/riscv/kernel/cacheinfo.c        | 33 +++++++++++++++++++++++++++-
>  4 files changed, 81 insertions(+), 2 deletions(-)
>  create mode 100644 arch/riscv/include/asm/cacheinfo.h
>
> diff --git a/arch/riscv/include/asm/cacheinfo.h b/arch/riscv/include/asm/cacheinfo.h
> new file mode 100644
> index 000000000000..ba179cd198b9
> --- /dev/null
> +++ b/arch/riscv/include/asm/cacheinfo.h
> @@ -0,0 +1,14 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2020 SiFive
> + */
> +
> +#ifndef _ASM_RISCV_CACHEINFO_H
> +#define _ASM_RISCV_CACHEINFO_H
> +
> +#include <linux/cacheinfo.h>
> +
> +uintptr_t get_cache_size(u32 level, enum cache_type type);
> +uintptr_t get_cache_geometry(u32 level, enum cache_type type);
> +
> +#endif /* _ASM_RISCV_CACHEINFO_H */
> diff --git a/arch/riscv/include/asm/elf.h b/arch/riscv/include/asm/elf.h
> index d83a4efd052b..5c725e1df58b 100644
> --- a/arch/riscv/include/asm/elf.h
> +++ b/arch/riscv/include/asm/elf.h
> @@ -11,6 +11,7 @@
>  #include <uapi/asm/elf.h>
>  #include <asm/auxvec.h>
>  #include <asm/byteorder.h>
> +#include <asm/cacheinfo.h>
>
>  /*
>   * These are used to set parameters in the core dumps.
> @@ -61,6 +62,18 @@ extern unsigned long elf_hwcap;
>  do {								\
>  	NEW_AUX_ENT(AT_SYSINFO_EHDR,				\
>  		(elf_addr_t)current->mm->context.vdso);		\
> +	NEW_AUX_ENT(AT_L1I_CACHESIZE,				\
> +		get_cache_size(1, CACHE_TYPE_INST));		\
> +	NEW_AUX_ENT(AT_L1I_CACHEGEOMETRY,			\
> +		get_cache_geometry(1, CACHE_TYPE_INST));	\
> +	NEW_AUX_ENT(AT_L1D_CACHESIZE,				\
> +		get_cache_size(1, CACHE_TYPE_DATA));		\
> +	NEW_AUX_ENT(AT_L1D_CACHEGEOMETRY,			\
> +		get_cache_geometry(1, CACHE_TYPE_DATA));	\
> +	NEW_AUX_ENT(AT_L2_CACHESIZE,				\
> +		get_cache_size(2, CACHE_TYPE_UNIFIED));		\
> +	NEW_AUX_ENT(AT_L2_CACHEGEOMETRY,			\
> +		get_cache_geometry(2, CACHE_TYPE_UNIFIED));	\
>  } while (0)
>  #define ARCH_HAS_SETUP_ADDITIONAL_PAGES
>  struct linux_binprm;
> diff --git a/arch/riscv/include/uapi/asm/auxvec.h b/arch/riscv/include/uapi/asm/auxvec.h
> index 22e0ae888406..32c73ba1d531 100644
> --- a/arch/riscv/include/uapi/asm/auxvec.h
> +++ b/arch/riscv/include/uapi/asm/auxvec.h
> @@ -10,7 +10,28 @@
>  /* vDSO location */
>  #define AT_SYSINFO_EHDR 33
>
> +/*
> + * The set of entries below represent more extensive information
> + * about the caches, in the form of two entry per cache type,
> + * one entry containing the cache size in bytes, and the other
> + * containing the cache line size in bytes in the bottom 16 bits
> + * and the cache associativity in the next 16 bits.
> + *
> + * The associativity is such that if N is the 16-bit value, the
> + * cache is N way set associative. A value if 0xffff means fully
> + * associative, a value of 1 means directly mapped.
> + *
> + * For all these fields, a value of 0 means that the information
> + * is not known.
> + */
> +#define AT_L1I_CACHESIZE	40
> +#define AT_L1I_CACHEGEOMETRY	41
> +#define AT_L1D_CACHESIZE	42
> +#define AT_L1D_CACHEGEOMETRY	43
> +#define AT_L2_CACHESIZE		44
> +#define AT_L2_CACHEGEOMETRY	45
> +
>  /* entries in ARCH_DLINFO */
> -#define AT_VECTOR_SIZE_ARCH	1
> +#define AT_VECTOR_SIZE_ARCH	7
>
>  #endif /* _UAPI_ASM_RISCV_AUXVEC_H */
> diff --git a/arch/riscv/kernel/cacheinfo.c b/arch/riscv/kernel/cacheinfo.c
> index cdd35e53fd98..263335def44b 100644
> --- a/arch/riscv/kernel/cacheinfo.c
> +++ b/arch/riscv/kernel/cacheinfo.c
> @@ -3,10 +3,41 @@
>   * Copyright (C) 2017 SiFive
>   */
>
> -#include <linux/cacheinfo.h>
>  #include <linux/cpu.h>
>  #include <linux/of.h>
>  #include <linux/of_device.h>
> +#include <asm/cacheinfo.h>
> +
> +static struct cacheinfo *get_cacheinfo(u32 level, enum cache_type type)
> +{
> +	struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(smp_processor_id());
> +	struct cacheinfo *this_leaf;
> +	int index;
> +
> +	for (index = 0; index < this_cpu_ci->num_leaves; index++) {
> +		this_leaf = this_cpu_ci->info_list + index;
> +		if (this_leaf->level == level && this_leaf->type == type)
> +			return this_leaf;
> +	}
> +
> +	return 0;
> +}
> +
> +uintptr_t get_cache_size(u32 level, enum cache_type type)
> +{
> +	struct cacheinfo *this_leaf = get_cacheinfo(level, type);
> +
> +	return this_leaf ? this_leaf->size : 0;
> +}
> +
> +uintptr_t get_cache_geometry(u32 level, enum cache_type type)
> +{
> +	struct cacheinfo *this_leaf = get_cacheinfo(level, type);
> +	uintptr_t ret = (this_leaf->ways_of_associativity << 16 |
> +			 this_leaf->coherency_line_size);
> +
> +	return this_leaf ? ret : 0;
> +}
>
>  static void ci_leaf_init(struct cacheinfo *this_leaf, enum cache_type type,
>  			 unsigned int level, unsigned int size,

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
