Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F39D9ECAAD5
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Sep 2022 15:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l32etfgVFc9Sr+oDoWFGI0+5cq51ZLlEuUJ7DnNbTUc=; b=mLvGIJ+1KnpL6l
	2QNzg1wCJaQZksJ4htkzHoCdqo/FIUS/g6qlQ246ix9C0H1ZkvfNjbISOg9EVYyfANqFrI8h3J1wz
	ZqBSkWgN/Wx3mpBGkEh6z3MkGkivhycn0WqYEQvzx+kBDOuLyofDdz7E3BMZUVXrrFV+05xKrD759
	TkRkL3srZYbkdlQbPVJCfl5QjcA5K492TJc6DWu5N8MeN7aF97N1Lqk2OnYuFKpgFojCFoRWXB0k+
	bEOp1gOeaGlLJgldAG1eaCKocRCv0MPVdCp3G6Zz0VR4qeGnlsjWGWeMFyoLbhNZSFsVLT3pZCZqZ
	FvbGH0TaJIpnq7neSPAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVDvV-005qlL-SP; Mon, 05 Sep 2022 15:22:17 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVAbp-001Zie-3Z
	for linux-riscv@lists.infradead.org; Mon, 05 Sep 2022 11:49:54 +0000
Received: by mail-wm1-x329.google.com with SMTP id i188-20020a1c3bc5000000b003a7b6ae4eb2so7647269wma.4
        for <linux-riscv@lists.infradead.org>; Mon, 05 Sep 2022 04:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=9poZGG/mVC+oN2IBXPeTsbmCKjGhBqnE2fR6eYjqlOw=;
        b=KhfaSS427zDuvq9a/fwnxRuZqeDWPZb1Eww7M3NSRGa+7GkbFZXfEibB36umRYGh2p
         oj/jp02WUX6sIpPHEspeH/XKT+oq8OKyFKm3D1/fQRf1LmE0uZ1uLyhNxq3o+m5GaSti
         CYiuS1nkjfNMNCBXoOKGMcTg0XhtGkwoXbhJBBbN9Vy+SZcsQdJZS86B+UcEaxuHFF0u
         dDsC4SzhBV6ZXvL54PL4B4G3r7odYsZ2t3NdYyiUR7zmCcI1L1nUj3B75ZPzoDG0tUkC
         ypE4lwpOaH1df4U+A91va8HruknNH2V7ol/Y745SGS4TdoT4is93Eo2EQxhKIsLetSu2
         oh6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=9poZGG/mVC+oN2IBXPeTsbmCKjGhBqnE2fR6eYjqlOw=;
        b=g70jhRd7KVLd+/JCqBikqOtZXJSYCWNcfkcZwfQSnsVYqgTf1+R6vexhNSP4hDH/SJ
         Ll500yIFKrg4zgqgvS8kn8kQZpMBarsKk1Fk/GQ91/KYPCHcnbAviBr3An0SeO5twuzb
         ojC8LkqiPS26pTghrkszE0nGObzb4sUqCEGr5AhEIbZAcxyRxNVn1potBHLm4QrVb32/
         beiPYeUj0+TjAR2gY1+anBLDUsLmalu04/ncRdAawQL+kfya5L/oGXaDPgUKYkwHRr+e
         T6h0GGiZCAOvvLTShWktILa/Wi+CP9NvCLqZkNiQrON7z4hzzoWrWku1UDRNVEX3EZoP
         +/Og==
X-Gm-Message-State: ACgBeo3p3/GCS4AqDZ7joO+qOGFaVVGYBu9/MrxbDU0uZHzpA8nvqUp4
	qGCzD0FKiCPx3NJGPd1VI9u5vQ==
X-Google-Smtp-Source: AA6agR4ejgDPH+KiUV3zOjflZ6sf+Rcd8OIqNi3V0CNN0DX8PZtT4OOXzAQZQnB5tPHu0bKprABV/w==
X-Received: by 2002:a05:600c:4ec9:b0:3a5:a567:137f with SMTP id g9-20020a05600c4ec900b003a5a567137fmr10616947wmq.46.1662378569565;
        Mon, 05 Sep 2022 04:49:29 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id j7-20020a5d6187000000b00226e5e07fe9sm8626829wru.10.2022.09.05.04.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Sep 2022 04:49:29 -0700 (PDT)
Date: Mon, 5 Sep 2022 13:49:28 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Yipeng Zou <zouyipeng@huawei.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu,
	Conor.Dooley@microchip.com, liaochang1@huawei.com,
	chris.zjh@huawei.com
Subject: Re: [PATCH v2] riscv: lib: optimize memcmp with ld insn
Message-ID: <20220905114928.4h5fjnydk2jvsxmu@kamzik>
References: <20220902110039.226016-1-zouyipeng@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220902110039.226016-1-zouyipeng@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_044952_348369_28DCDADA 
X-CRM114-Status: GOOD (  25.70  )
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

On Fri, Sep 02, 2022 at 07:00:39PM +0800, Yipeng Zou wrote:
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
> V2: Patch test data into the commit message,and collect Reviewed-by Tags.
> 
>  arch/riscv/include/asm/string.h |  3 ++
>  arch/riscv/lib/Makefile         |  1 +
>  arch/riscv/lib/memcmp.S         | 59 +++++++++++++++++++++++++++++++++
>  3 files changed, 63 insertions(+)
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
> index 000000000000..83af1c433e6f
> --- /dev/null
> +++ b/arch/riscv/lib/memcmp.S
> @@ -0,0 +1,59 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2022 zouyipeng@huawei.com
> + */
> +#include <linux/linkage.h>
> +#include <asm-generic/export.h>
> +#include <asm/asm.h>
> +
> +/* argrments:

arguments

and please use an opening wing (/*)


> +* a0: addr0
> +* a1: addr1
> +* a2: size
> +*/
> +#define addr0	a0
> +#define addr1	a1
> +#define limit	a2
> +
> +#define data0	a3
> +#define data1	a4
> +#define tmp	t3
> +#define aaddr	t4
> +#define return	a0

I don't see much value in these defines. Why is addr0 better than a0?
data0 and data1 are just temp registers. Defining 'return' seems really
unnecessary. And, while a define for "the word end address" does make
some sense, I can't figure out what the first 'a' "aaddr" is supposed to
mean such that it conveys "the word end address". In general, if we're
going to use defines let's not make them as cryptic or even more cryptic
than the assembler itself :-)

> +
> +/* load and compare */
> +.macro LD_CMP op d0 d1 a0 a1 offset
> +	\op \d0, 0(\a0)
> +	\op \d1, 0(\a1)
> +	addi \a0, \a0, \offset
> +	addi \a1, \a1, \offset
> +	sub tmp, \d0, \d1

I'd prefer not to have a side-effect on tmp. Why not take this output
register as another input to the macro?

> +.endm
> +
> +ENTRY(memcmp)
> +	/* test limit aligend with SZREG */

is aligned

> +	andi tmp, limit, SZREG - 1
> +	/* load tail */
> +	add aaddr, addr0, limit
> +	sub aaddr, aaddr, tmp
> +	add limit, addr0, limit
> +
> +.LloopWord:
> +	sltu tmp, addr0, aaddr
> +	beqz tmp, .LloopByte
> +
> +	LD_CMP REG_L data0 data1 addr0 addr1 SZREG
> +	beqz tmp, .LloopWord
> +	j .Lreturn
> +
> +.LloopByte:
> +	sltu tmp, addr0, limit
> +	beqz tmp, .Lreturn
> +
> +	LD_CMP lbu data0 data1 addr0 addr1 1
> +	beqz tmp, .LloopByte
> +.Lreturn:
> +	mv return, tmp
> +	ret
> +END(memcmp)
> +EXPORT_SYMBOL(memcmp);
> -- 
> 2.17.1
>

I'd prefer an assembly format were the operands are lined up

  op	r1, r2
  op	r1, r2

Unfortunately I don't see much consistency in how to do this among other
riscv .S files, though, so I'm not sure what to recommend if anything.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
