Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E9BCECAAD5
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Sep 2022 12:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lwsGj5ub3NftnYfW6y6kYreqsiLaNYrU39I4yWnVi+M=; b=BjBbOSZrl7o5Kc
	Gh326UCf2Lekbi4H23pK/HgblssAPFHX8jZ9t1/1BCRGhifI+21H7ZgKG2ZqRE9nQTmc/xW7CjQ82
	GVOSZoxTTCKrsghcN1AhCglsKoEQpX3wQHbydF5VfOOh3GobHkq9HcUPdfpDWYakm2wtg0v/4ZPJl
	StX8dVPiByl6Rd0UX3w7CBePitTyZSRB1F3u1fvzMnJ/dpQs8KEGctvzUQtCEXLrZw1fTGcKiD3u7
	f7/r6BSkodMRs6PePeGImmXiX+ptBnVcyZX0I+dZ4oGyypNBOpqXVVFiMrde7bQf8f3xQeCIAWyiv
	xY6yPc/rlhqgfm6Cf0Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVXqR-00DPAI-Kr; Tue, 06 Sep 2022 12:38:23 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVXqO-00DP7T-CO
	for linux-riscv@lists.infradead.org; Tue, 06 Sep 2022 12:38:21 +0000
Received: by mail-ed1-x52f.google.com with SMTP id q21so7314521edc.9
        for <linux-riscv@lists.infradead.org>; Tue, 06 Sep 2022 05:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=vnpdKoSlSApKDqLHIB5ayMgHY8IVdnQt9Hurf1lat4w=;
        b=IpzcerYVmtKX+K1C2o/FvSalcs2FX9XwfZsaOviFxPGpBLBTqniUfPizbHLx3fcBFZ
         REanGwsKt8ILxf0t7iMsDpjjWexokmE8HUSH61KyKcDwQzsRG6136VP3ep9p9mR754MQ
         Hw19v1TkrMfF0tLtEpvLqDlEND7QokU9fN9cVy8rJ/dYcsTRAmZMq2letttNzmXEt5kH
         L51inPbclNM5d3bdAui0nvsietB3N3gpfWCRDD0l0h7G+kF1Zu+KGy/K3dikO0KUPiIS
         onOEqI93FUOCW92h8Du1+K5QqWdJzxjbhn6kfn7TzH3dDqJsDOUz8+S5i9TDw3ESxqBc
         jB2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=vnpdKoSlSApKDqLHIB5ayMgHY8IVdnQt9Hurf1lat4w=;
        b=mukDH4mQ64cn9Gjcg/pojDDwnAM62ddQ1RP6AdoUOMCHfp6mQDqQfGzDUflqFLeRVO
         KrYuMmGpQU2VjMnISC38brWxWQ7CVL7jax+JenUnUVfujaelCYvHz72IzzMD7LKzQ4d+
         UuJeoPYLneG5QKs+JoatJM3YvORx30CK6CMHIjyvXN0mqBwSTthcq4IklUxbyxwoVsbH
         /jzZoD1pjcjAHywFOl0ZCEReiJAW8jKZGVKtPUtG63X6A7pWUXI6Q9QVQOJ48o3do3Y6
         UFC+S7NG9RDn7o8frlTjFSt70Ym7ZQ7Q7nvnO8dluceGqWC2TG0RwayJuUPaboPqLl1G
         CHeA==
X-Gm-Message-State: ACgBeo2Vc6dnTJQGxbUedGVWprgwGx2/67MlsjvDO1EyRBJI6foLQyBP
	RnKpnWuf3I7xDiyZjhAFvnOkLA==
X-Google-Smtp-Source: AA6agR4zWKwPJgnXsS9UUQ07RlalLXo0pU8K9kHKY0ConSSSvna4YqgVeR49dWya3VXYXHmx09EgOA==
X-Received: by 2002:aa7:cc97:0:b0:445:afab:2634 with SMTP id p23-20020aa7cc97000000b00445afab2634mr48455401edt.54.1662467896921;
        Tue, 06 Sep 2022 05:38:16 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id p16-20020a17090653d000b0073c10031dc9sm6426265ejo.80.2022.09.06.05.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 05:38:16 -0700 (PDT)
Date: Tue, 6 Sep 2022 14:38:14 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Yipeng Zou <zouyipeng@huawei.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu,
	Conor.Dooley@microchip.com
Subject: Re: [PATCH v3] riscv: lib: optimize memcmp with ld insn
Message-ID: <20220906123814.scgf73tdkhkitrj7@kamzik>
References: <20220906115359.173660-1-zouyipeng@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220906115359.173660-1-zouyipeng@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_053820_445028_25E9FD67 
X-CRM114-Status: GOOD (  20.02  )
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

On Tue, Sep 06, 2022 at 07:53:59PM +0800, Yipeng Zou wrote:
> Currently memcmp was implemented in c code(lib/string.c), which compare
> memory per byte.
> 
> This patch use ld insn compare memory per word to improve. From the test
> Results, this will take several times optimized.
> 
> Alloc 8,4,1KB buffer to compare, each loop 10k times:
> 
> Size(B) Min(ns) AVG(ns) //before
> 
> 8k      40800   46316
> 4k      26500   32302
> 1k      15600   17965
> 
> Size(B) Min(ns) AVG(ns) //after
> 
> 8k      16100   21281
> 4k      14200   16446
> 1k      12400   14316
> 
> Signed-off-by: Yipeng Zou <zouyipeng@huawei.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> V2: Patch test data into the commit message,and collect Reviewed-by
> Tags.
> V3: Fix some spelling mistakes. Improve register naming and coding style.
> 
>  arch/riscv/include/asm/string.h |  3 ++
>  arch/riscv/lib/Makefile         |  1 +
>  arch/riscv/lib/memcmp.S         | 58 +++++++++++++++++++++++++++++++++
>  3 files changed, 62 insertions(+)
>  create mode 100644 arch/riscv/lib/memcmp.S
> 
> diff --git a/arch/riscv/include/asm/string.h b/arch/riscv/include/asm/string.h
> index 909049366555..3337b43d3803 100644
> --- a/arch/riscv/include/asm/string.h
> +++ b/arch/riscv/include/asm/string.h
> @@ -18,6 +18,9 @@ extern asmlinkage void *__memcpy(void *, const void *, size_t);
>  #define __HAVE_ARCH_MEMMOVE
>  extern asmlinkage void *memmove(void *, const void *, size_t);
>  extern asmlinkage void *__memmove(void *, const void *, size_t);
> +#define __HAVE_ARCH_MEMCMP
> +extern int memcmp(const void *, const void *, size_t);
> +
>  /* For those files which don't want to check by kasan. */
>  #if defined(CONFIG_KASAN) && !defined(__SANITIZE_ADDRESS__)
>  #define memcpy(dst, src, len) __memcpy(dst, src, len)
> diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
> index 25d5c9664e57..70773bf0c471 100644
> --- a/arch/riscv/lib/Makefile
> +++ b/arch/riscv/lib/Makefile
> @@ -3,6 +3,7 @@ lib-y			+= delay.o
>  lib-y			+= memcpy.o
>  lib-y			+= memset.o
>  lib-y			+= memmove.o
> +lib-y			+= memcmp.o
>  lib-$(CONFIG_MMU)	+= uaccess.o
>  lib-$(CONFIG_64BIT)	+= tishift.o
>  
> diff --git a/arch/riscv/lib/memcmp.S b/arch/riscv/lib/memcmp.S
> new file mode 100644
> index 000000000000..eea5cc40e081
> --- /dev/null
> +++ b/arch/riscv/lib/memcmp.S
> @@ -0,0 +1,58 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2022 zouyipeng@huawei.com
> + */
> +#include <linux/linkage.h>
> +#include <asm-generic/export.h>
> +#include <asm/asm.h>
> +
> +/*
> + Input Arguments:
> + a0: addr0
> + a1: addr1
> + a2: buffer size
> +
> + Output:
> + a0: return value
> +*/
> +#define data0	a3
> +#define data1	a4
> +#define tmp	t3
> +#define tail	t4
> +
> +/* load and compare */
> +.macro LD_CMP op d0 d1 a0 a1 t1 offset
> +	\op	\d0, 0(\a0)
> +	\op	\d1, 0(\a1)
> +	addi	\a0, \a0, \offset
> +	addi	\a1, \a1, \offset
> +	sub	\t1, \d0, \d1
> +.endm
> +
> +ENTRY(memcmp)
> +	/* test size aligned with SZREG */
> +	andi	tmp, a2, SZREG - 1
> +	/* load tail */
> +	add	tail, a0, a2
> +	sub	tail, tail, tmp
> +	add	a2, a0, a2
> +
> +.LloopWord:
> +	sltu	tmp, a0, tail
> +	beqz	tmp, .LloopByte
> +
> +	LD_CMP	REG_L data0 data1 a0 a1 tmp SZREG
> +	beqz	tmp, .LloopWord
> +	j	.Lreturn
> +
> +.LloopByte:
> +	sltu	tmp, a0, a2
> +	beqz	tmp, .Lreturn
> +
> +	LD_CMP	lbu data0 data1 a0 a1 tmp 1
> +	beqz	tmp, .LloopByte
> +.Lreturn:
> +	mv	a0, tmp
> +	ret
> +END(memcmp)
> +EXPORT_SYMBOL(memcmp);
> -- 
> 2.17.1
>

Thanks, looks nice.

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
