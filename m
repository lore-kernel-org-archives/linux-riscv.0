Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AA4BC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Oct 2022 03:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=V7eqVPEMCYl9SYUau/1P8EMkNSpYdB/Rc9zJjxrAiZQ=; b=HmuFB1JRToq3dff+/uXw9K0M9r
	6nYYhv8RNUIAmjJkLT7BVLKeJLt26vAkCXF2gJDjwjsBTsZh43aU9pAUR1PaG0FIUbGio8jiq7iut
	bxQxWf/rWX4xFzpgokRJ4eW6mH6CiSmtUphMjVjqYZvSJO8cUHcKmaO374EtvbFXRVXycyUmslEey
	5ELkfBUxeVvED4lHibI7tGPxlq9Tn3dRw+aMHSogGU8dcFsD1BQ3G2DjMY5soO8BFvPuogAKKQs7p
	+orqV8IT3ZBZff1WX5SQds/trI3FdiNJt02VckRtZYDeEe7NWb6wq9gXhg/IHcDO/Eg4wYu+XXrGB
	bKK5rmjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiop4-00ASb3-H3; Thu, 13 Oct 2022 03:23:50 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiooz-00ASag-K5
	for linux-riscv@lists.infradead.org; Thu, 13 Oct 2022 03:23:48 +0000
Received: by mail-pj1-x102e.google.com with SMTP id cl1so718968pjb.1
        for <linux-riscv@lists.infradead.org>; Wed, 12 Oct 2022 20:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MnyzOpC3L3nw7okJvNHQz924fvMjW/O9M+AD/hKyFNw=;
        b=pzjNWhxDoSarwmYj7aZk2QsxyxT4B+mDy5hTxYQdkV/7PKZFmAnAp3lSSY0+SL0u1k
         QZ+T1M8S7+v9dWs8O6pxD2g7btgDJ/OIRfvnhaJ+SkkXiqVsvrXHLmUfaxsDNWEp1c01
         86yzDBbRhTu0f0OmT4ZpN0NjyxgG0Nbcoh3FKJ5VZ4rqEk2c3NiDpYLmqU1ybhFN4qdP
         JJp2XI7BZnLLfuzc3aCAWS3ZU/4isA4PWspgv9hHRU9v9C4o/KLtu2Nkk98YOr0lcMWe
         b6bYjlnDIAxQ7Zp4yZ2rf6M8ExlRPn+AwIfUwQhosTedMGjxKPIVB0B7t6cVKj5J1NSt
         9rCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MnyzOpC3L3nw7okJvNHQz924fvMjW/O9M+AD/hKyFNw=;
        b=wERCs0WzHfIuejEvOvDFQHNYfar23gmzxbor7dejysqC+pXNhFNJhj8PwiCpvXPSkO
         aJHS4sismeVuLPlXDfAe63rLJq9BZCO8TcIgbqujnr+sEOwq5W1xUbW8CZYhggyMPGZM
         r8Ib09WUHbjqa5aWXohsiTlZI9Z3kNYJLasi1UjqSux5MnmjnkeEx/wd2gX7cSoYthWp
         geB0WE7zfnDYKXcSy5DVwrZljMOtFhGGNTIPhRYVYljhSkW21rfmBThdqIFr9fnqSPlJ
         YF4zjpwJQgCIJSQJx8TOVmc0LhK9iD5pE8x7nMUAbXwXfcS2UXBWtvE+NltGeJblEDc6
         sAPQ==
X-Gm-Message-State: ACrzQf3PXbq932OUKyWEKB3SFkG94pfSYEIO2iyo6QxqTnnGiDpHSA8R
	PO8LK21V6DGqt9qWbRLwxl+ACw==
X-Google-Smtp-Source: AMsMyM6SeWR9ZwAuNimzcXFR0rspHoYgGFoM+mVp3f4REmOF75Q4w3UShDp27HctH2nmF2FL6I3Tqg==
X-Received: by 2002:a17:90b:1a8b:b0:20d:4c24:af5 with SMTP id ng11-20020a17090b1a8b00b0020d4c240af5mr8820619pjb.213.1665631423408;
        Wed, 12 Oct 2022 20:23:43 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id ik7-20020a170902ab0700b0016f8e8032c4sm11272432plb.129.2022.10.12.20.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 20:23:42 -0700 (PDT)
Date: Wed, 12 Oct 2022 20:23:42 -0700 (PDT)
X-Google-Original-Date: Wed, 12 Oct 2022 18:31:09 PDT (-0700)
Subject: Re: [PATCH v3] riscv: lib: optimize memcmp with ld insn
In-Reply-To: <20220906123814.scgf73tdkhkitrj7@kamzik>
CC: zouyipeng@huawei.com, linux-riscv@lists.infradead.org,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, Conor.Dooley@microchip.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: ajones@ventanamicro.com
Message-ID: <mhng-19fd4ef3-922e-4ff9-bada-327e6915aa03@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_202345_924357_6134E2E6 
X-CRM114-Status: GOOD (  25.32  )
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

On Tue, 06 Sep 2022 05:38:14 PDT (-0700), ajones@ventanamicro.com wrote:
> On Tue, Sep 06, 2022 at 07:53:59PM +0800, Yipeng Zou wrote:
>> Currently memcmp was implemented in c code(lib/string.c), which compare
>> memory per byte.
>>
>> This patch use ld insn compare memory per word to improve. From the test
>> Results, this will take several times optimized.
>>
>> Alloc 8,4,1KB buffer to compare, each loop 10k times:
>>
>> Size(B) Min(ns) AVG(ns) //before
>>
>> 8k      40800   46316
>> 4k      26500   32302
>> 1k      15600   17965
>>
>> Size(B) Min(ns) AVG(ns) //after
>>
>> 8k      16100   21281
>> 4k      14200   16446
>> 1k      12400   14316
>>
>> Signed-off-by: Yipeng Zou <zouyipeng@huawei.com>
>> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>> ---
>> V2: Patch test data into the commit message,and collect Reviewed-by
>> Tags.
>> V3: Fix some spelling mistakes. Improve register naming and coding style.
>>
>>  arch/riscv/include/asm/string.h |  3 ++
>>  arch/riscv/lib/Makefile         |  1 +
>>  arch/riscv/lib/memcmp.S         | 58 +++++++++++++++++++++++++++++++++
>>  3 files changed, 62 insertions(+)
>>  create mode 100644 arch/riscv/lib/memcmp.S
>>
>> diff --git a/arch/riscv/include/asm/string.h b/arch/riscv/include/asm/string.h
>> index 909049366555..3337b43d3803 100644
>> --- a/arch/riscv/include/asm/string.h
>> +++ b/arch/riscv/include/asm/string.h
>> @@ -18,6 +18,9 @@ extern asmlinkage void *__memcpy(void *, const void *, size_t);
>>  #define __HAVE_ARCH_MEMMOVE
>>  extern asmlinkage void *memmove(void *, const void *, size_t);
>>  extern asmlinkage void *__memmove(void *, const void *, size_t);
>> +#define __HAVE_ARCH_MEMCMP
>> +extern int memcmp(const void *, const void *, size_t);
>> +
>>  /* For those files which don't want to check by kasan. */
>>  #if defined(CONFIG_KASAN) && !defined(__SANITIZE_ADDRESS__)
>>  #define memcpy(dst, src, len) __memcpy(dst, src, len)
>> diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
>> index 25d5c9664e57..70773bf0c471 100644
>> --- a/arch/riscv/lib/Makefile
>> +++ b/arch/riscv/lib/Makefile
>> @@ -3,6 +3,7 @@ lib-y			+= delay.o
>>  lib-y			+= memcpy.o
>>  lib-y			+= memset.o
>>  lib-y			+= memmove.o
>> +lib-y			+= memcmp.o
>>  lib-$(CONFIG_MMU)	+= uaccess.o
>>  lib-$(CONFIG_64BIT)	+= tishift.o
>>
>> diff --git a/arch/riscv/lib/memcmp.S b/arch/riscv/lib/memcmp.S
>> new file mode 100644
>> index 000000000000..eea5cc40e081
>> --- /dev/null
>> +++ b/arch/riscv/lib/memcmp.S
>> @@ -0,0 +1,58 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (C) 2022 zouyipeng@huawei.com
>> + */
>> +#include <linux/linkage.h>
>> +#include <asm-generic/export.h>
>> +#include <asm/asm.h>
>> +
>> +/*
>> + Input Arguments:
>> + a0: addr0
>> + a1: addr1
>> + a2: buffer size
>> +
>> + Output:
>> + a0: return value
>> +*/
>> +#define data0	a3
>> +#define data1	a4
>> +#define tmp	t3
>> +#define tail	t4
>> +
>> +/* load and compare */
>> +.macro LD_CMP op d0 d1 a0 a1 t1 offset
>> +	\op	\d0, 0(\a0)
>> +	\op	\d1, 0(\a1)
>> +	addi	\a0, \a0, \offset
>> +	addi	\a1, \a1, \offset
>> +	sub	\t1, \d0, \d1
>> +.endm
>> +
>> +ENTRY(memcmp)
>> +	/* test size aligned with SZREG */
>> +	andi	tmp, a2, SZREG - 1
>> +	/* load tail */
>> +	add	tail, a0, a2
>> +	sub	tail, tail, tmp
>> +	add	a2, a0, a2
>> +
>> +.LloopWord:
>> +	sltu	tmp, a0, tail
>> +	beqz	tmp, .LloopByte
>> +
>> +	LD_CMP	REG_L data0 data1 a0 a1 tmp SZREG
>> +	beqz	tmp, .LloopWord
>> +	j	.Lreturn
>> +
>> +.LloopByte:
>> +	sltu	tmp, a0, a2
>> +	beqz	tmp, .Lreturn
>> +
>> +	LD_CMP	lbu data0 data1 a0 a1 tmp 1
>> +	beqz	tmp, .LloopByte
>> +.Lreturn:
>> +	mv	a0, tmp
>> +	ret
>> +END(memcmp)
>> +EXPORT_SYMBOL(memcmp);
>> --
>> 2.17.1
>>
>
> Thanks, looks nice.

Ya, I think normally for performance improvements I'd want a bit more 
(like "what was this benchmarked on", for example).  This one seems 
straight-forward enough to just handle open-loop, though, so I think 
it's OK this time.  It's also something we could probably do in C, but 
IIUC we're meant to have arch-specific routines for these anyway and 
we're going to end up with assembly at some point so we might as well 
just start now.

It does trigger a bunch of build failures, though.  This fixes most of the
RISC-V related issues:

    diff --git a/arch/riscv/include/asm/string.h b/arch/riscv/include/asm/string.h
    index 3337b43d3803..33bd88e17469 100644
    --- a/arch/riscv/include/asm/string.h
    +++ b/arch/riscv/include/asm/string.h
    @@ -19,13 +19,15 @@ extern asmlinkage void *__memcpy(void *, const void *, size_t);
     extern asmlinkage void *memmove(void *, const void *, size_t);
     extern asmlinkage void *__memmove(void *, const void *, size_t);
     #define __HAVE_ARCH_MEMCMP
    -extern int memcmp(const void *, const void *, size_t);
    +extern asmlinkage int memcmp(const void *, const void *, size_t);
    +extern asmlinkage int __memcmp(const void *, const void *, size_t);
     
     /* For those files which don't want to check by kasan. */
     #if defined(CONFIG_KASAN) && !defined(__SANITIZE_ADDRESS__)
     #define memcpy(dst, src, len) __memcpy(dst, src, len)
     #define memset(s, c, n) __memset(s, c, n)
     #define memmove(dst, src, len) __memmove(dst, src, len)
    +#define memcmp(a, b, len) __memcmp(a, b, len)
     
     #ifndef __NO_FORTIFY
     #define __NO_FORTIFY /* FORTIFY_SOURCE uses __builtin_memcpy, etc. */
    diff --git a/arch/riscv/lib/memcmp.S b/arch/riscv/lib/memcmp.S
    index eea5cc40e081..518797cd6dda 100644
    --- a/arch/riscv/lib/memcmp.S
    +++ b/arch/riscv/lib/memcmp.S
    @@ -29,7 +29,8 @@
     	sub	\t1, \d0, \d1
     .endm
     
    -ENTRY(memcmp)
    +SYM_FUNC_START(__memcmp)
    +SYM_FUNC_START_WEAK(memcmp)
     	/* test size aligned with SZREG */
     	andi	tmp, a2, SZREG - 1
     	/* load tail */
    @@ -54,5 +55,9 @@ ENTRY(memcmp)
     .Lreturn:
     	mv	a0, tmp
     	ret
    -END(memcmp)
    -EXPORT_SYMBOL(memcmp);
    +
    +SYM_FUNC_END(memcmp)
    +SYM_FUNC_END(__memcmp)
    +
    +EXPORT_SYMBOL(memcmp)
    +EXPORT_SYMBOL(__memcmp)
    diff --git a/arch/riscv/purgatory/Makefile b/arch/riscv/purgatory/Makefile
    index dd58e1d99397..359227e392b2 100644
    --- a/arch/riscv/purgatory/Makefile
    +++ b/arch/riscv/purgatory/Makefile
    @@ -1,7 +1,7 @@
     # SPDX-License-Identifier: GPL-2.0
     OBJECT_FILES_NON_STANDARD := y
     
    -purgatory-y := purgatory.o sha256.o entry.o string.o ctype.o memcpy.o memset.o
    +purgatory-y := purgatory.o sha256.o entry.o string.o ctype.o memcpy.o memset.o memcmp.o
     
     targets += $(purgatory-y)
     PURGATORY_OBJS = $(addprefix $(obj)/,$(purgatory-y))
    @@ -18,6 +18,9 @@ $(obj)/memcpy.o: $(srctree)/arch/riscv/lib/memcpy.S FORCE
     $(obj)/memset.o: $(srctree)/arch/riscv/lib/memset.S FORCE
     	$(call if_changed_rule,as_o_S)
     
    +$(obj)/memcmp.o: $(srctree)/arch/riscv/lib/memcmp.S FORCE
    +	$(call if_changed_rule,as_o_S)
    +
     $(obj)/sha256.o: $(srctree)/lib/crypto/sha256.c FORCE
     	$(call if_changed_rule,cc_o_c)

but I'm still getting some EFI stub failures

    riscv64-unknown-linux-gnu-ld: ./drivers/firmware/efi/libstub/lib-fdt.stub.o: in function `__efistub_.L130':
    __efistub_fdt.c:(.init.text+0x686): undefined reference to `__efistub___memcmp'
    riscv64-unknown-linux-gnu-ld: ./drivers/firmware/efi/libstub/lib-fdt_ro.stub.o: in function `__efistub_.L87':
    __efistub_fdt_ro.c:(.init.text+0x554): undefined reference to `__efistub___memcmp'
    riscv64-unknown-linux-gnu-ld: ./drivers/firmware/efi/libstub/lib-fdt_ro.stub.o: in function `__efistub_.L108':
    __efistub_fdt_ro.c:(.init.text+0x6fc): undefined reference to `__efistub___memcmp'
    riscv64-unknown-linux-gnu-ld: ./drivers/firmware/efi/libstub/lib-fdt_ro.stub.o: in function `__efistub_.L263':
    __efistub_fdt_ro.c:(.init.text+0xfe0): undefined reference to `__efistub___memcmp'
    riscv64-unknown-linux-gnu-ld: ./drivers/firmware/efi/libstub/lib-fdt_ro.stub.o: in function `__efistub_.L284':
    __efistub_fdt_ro.c:(.init.text+0x10c0): undefined reference to `__efistub___memcmp'
    riscv64-unknown-linux-gnu-ld: ./drivers/firmware/efi/libstub/lib-fdt_ro.stub.o:__efistub_fdt_ro.c:(.init.text+0x11fc): more undefined references to `__efistub___memcmp' follow
    riscv64-unknown-linux-gnu-ld: .tmp_vmlinux.kallsyms1: hidden symbol `__efistub___memcmp' isn't defined
    riscv64-unknown-linux-gnu-ld: final link failed: bad value
    make[2]: *** [/scratch/merges/ko-linux-next/linux/Makefile:1240: vmlinux] Error 1
    make[2]: Leaving directory '/scratch/merges/ko-linux-next/kernel/rv64gc/allyesconfig'

so I think it's going to be too late for 6.1 for this one, sorry!

>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
