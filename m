Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D0C9C00140
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Aug 2022 18:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0q8v0CzUi+wkAxyxwhM/pFiThIU/Yrxchpmg4e/ugGo=; b=vLetsRvssOHoOQ
	JYp0KkvBR0+jMQof7exkQfJc8q9wmTg9zydXBYs4pVoVN+bcPKbemqHK0WP1JcPSBKVd3FKe5Luhe
	zBkwpM/943C3oYg/zNm059IIwamZ3lrZQkQ/LxU5cxUuDFh/zJdoboVActJc5ajMXH1VpZIvVoBHW
	1LTfL7XA979NTJLhjAq4+RCoWVyKD89qXSs0C5BeCG5Zpc3fMr3uHmV18hrkz9kZPclizIJq6Hmho
	xjKjC3nmz92RW+j4Cdf1HFV2z5uNu4Yzr9p4BtpEd+Ln08y+HCDv+MCgqixhrGoLo63Sld8KSqP69
	2HGuYOwGj0Gxp2nwhDkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNeYP-002v2H-FP; Mon, 15 Aug 2022 18:11:09 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNe0h-002OMv-3O
	for linux-riscv@lists.infradead.org; Mon, 15 Aug 2022 17:36:21 +0000
Received: by mail-wr1-x42e.google.com with SMTP id v3so9882628wrp.0
        for <linux-riscv@lists.infradead.org>; Mon, 15 Aug 2022 10:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc;
        bh=GU6bIP3nsEFby3qLdR/RD/LAl50i8EFeZ8VJCVMJsI8=;
        b=SdEWuOX3QQSskKpvzezs97C+HVkBQqqNIEt65UYK0ymu6kafK1lrICRLosMkwBVMhz
         dID9SjeBYlSOJKL0bg8YjIgly3gnKabIZu/45vAPIyB0SqjjbIEP0UYw+1xI4CFNjqfn
         2SnhuZmYVIVS54q/62Lx/ycOjaZMMgVvqD0jOa7Xbz3GfGHBgLjfaKc4J3neJbEU/Kbx
         UR/N4vuPzjQJPCCztsGDFtILs5T2bohKXBh+BVQzQJT7t+6PVpl0W4N8buRxm9JZoj3E
         lCZUFb7+028vBy0eBMCZT090gwhuAQXMZRNnPHv8Bngv962yyadjgn/GzkEJCVPvqcuE
         QNKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc;
        bh=GU6bIP3nsEFby3qLdR/RD/LAl50i8EFeZ8VJCVMJsI8=;
        b=PF4F+r1UUdFH8wYfVb+1zxZD+ABANktz16sKMONpxo6BKNSE5xnu9AH/2dmFB3zEHB
         J9vvKlM4Guz8Cbgb4NBWQmWH8bfjHXSNsGdFwCIpi7SU6GUwjMtnd07LBNUlDRxAJ+Ki
         ThZJ4cCgV8eSmjKo8nf6H/juP7hav60/DBdARAvFenXK2mD2AHfCoGEswwmuRI93bY8a
         lIOrVvg4ljv/bc3wPfxqdUGHqWHEDKiCpBp/VpfQAJ10T+ou2+L2swypQzS3MUkcD8Nb
         89NIbFHL5OfRqWDm6xDMs6KwM7TQ2ZwSDiSvM3BCEpiqe4bjb2kaGrd1t8PJ+kWFbjnb
         n7Dw==
X-Gm-Message-State: ACgBeo3dJLfswf6Av+XVRu8RJ7t5w/LfZ22lDXfuGqnStzUXVh/uzLfJ
	nflrtnuiALpuOBum3eVBYefTKQ==
X-Google-Smtp-Source: AA6agR6XteiWMQweGtI8WN8QzHCG/oRngwe9cRcyo01QcCbZL5ZG+bYWgMKSCpvNQMsNLjfHiHhMYg==
X-Received: by 2002:a5d:4983:0:b0:220:5fee:1d79 with SMTP id r3-20020a5d4983000000b002205fee1d79mr9620215wrq.62.1660584975922;
        Mon, 15 Aug 2022 10:36:15 -0700 (PDT)
Received: from smtpclient.apple (global-5-141.n-2.net.cam.ac.uk. [131.111.5.141])
        by smtp.gmail.com with ESMTPSA id c16-20020a056000105000b0021eb309c97dsm7993868wrx.25.2022.08.15.10.36.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 15 Aug 2022 10:36:14 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [PATCH v2] RISC-V: Clean up the Zicbom block size probing
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <Yvpo96wal40ROTsX@dev-arch.thelio-3990X>
Date: Mon, 15 Aug 2022 18:36:14 +0100
Cc: Palmer Dabbelt <palmer@rivosinc.com>,
 linux-riscv@lists.infradead.org,
 anup@brainfault.org,
 kernel test robot <lkp@intel.com>
Message-Id: <3FF0EBB2-E2D1-440E-83B9-F48308C8CEDB@jrtc27.com>
References: <20220812154010.18280-1-palmer@rivosinc.com>
 <Yvpo96wal40ROTsX@dev-arch.thelio-3990X>
To: Nathan Chancellor <nathan@kernel.org>
X-Mailer: Apple Mail (2.3696.80.82.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220815_103619_625591_6A18BB4B 
X-CRM114-Status: GOOD (  30.64  )
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

> On 15 Aug 2022, at 16:40, Nathan Chancellor <nathan@kernel.org> wrote:
> 
> Hi Palmer,
> 
> On Fri, Aug 12, 2022 at 08:40:10AM -0700, Palmer Dabbelt wrote:
>> This fixes two issues: I truncated the warning's hart ID when porting to
>> the 64-bit hart ID code, and the original code's warning handling could
>> fire on an uninitialized hart ID.
>> 
>> The biggest change here is that riscv_cbom_block_size is no longer
>> initialized, as IMO the default isn't sane: there's nothing in the ISA
>> that mandates any specific cache block size, so falling back to one will
>> just silently produce the wrong answer on some systems.  This also
>> changes the probing order so the cache block size is known before
>> enabling Zicbom support.
>> 
>> Fixes: 3aefb2ee5bdd ("riscv: implement Zicbom-based CMO instructions + the t-head variant")
>> Fixes: 1631ba1259d6 ("riscv: Add support for non-coherent devices using zicbom extension")
>> Reported-by: kernel test robot <lkp@intel.com>
>> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
>> 
>> ---
>> 
>> Changes since v1 <https://lore.kernel.org/all/20220812142400.7186-1-palmer@rivosinc.com/>:
>> 
>> * Everything but the unsigned long cbom_hartid.
>> ---
>> arch/riscv/kernel/setup.c       |  2 +-
>> arch/riscv/mm/dma-noncoherent.c | 22 ++++++++++++----------
>> 2 files changed, 13 insertions(+), 11 deletions(-)
>> 
>> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
>> index 95ef6e2bf45c..2dfc463b86bb 100644
>> --- a/arch/riscv/kernel/setup.c
>> +++ b/arch/riscv/kernel/setup.c
>> @@ -296,8 +296,8 @@ void __init setup_arch(char **cmdline_p)
>> 	setup_smp();
>> #endif
>> 
>> -	riscv_fill_hwcap();
>> 	riscv_init_cbom_blocksize();
>> +	riscv_fill_hwcap();
>> 	apply_boot_alternatives();
>> }
>> 
>> diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoherent.c
>> index cd2225304c82..3aa3572715d6 100644
>> --- a/arch/riscv/mm/dma-noncoherent.c
>> +++ b/arch/riscv/mm/dma-noncoherent.c
>> @@ -12,7 +12,7 @@
>> #include <linux/of_device.h>
>> #include <asm/cacheflush.h>
>> 
>> -static unsigned int riscv_cbom_block_size = L1_CACHE_BYTES;
>> +static unsigned int riscv_cbom_block_size;
>> static bool noncoherent_supported;
>> 
>> void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
>> @@ -80,37 +80,39 @@ void riscv_init_cbom_blocksize(void)
>> {
>> 	struct device_node *node;
>> 	int ret;
>> -	u32 val;
>> +	u32 val, probed_block_size;
>> 
>> +	probed_block_size = 0;
>> 	for_each_of_cpu_node(node) {
>> -		unsigned long hartid;
>> -		int cbom_hartid;
>> +		unsigned long hartid, cbom_hartid;
>> 
>> 		ret = riscv_of_processor_hartid(node, &hartid);
>> 		if (ret)
>> 			continue;
>> 
>> -		if (hartid < 0)
>> -			continue;
>> -
>> 		/* set block-size for cbom extension if available */
>> 		ret = of_property_read_u32(node, "riscv,cbom-block-size", &val);
>> 		if (ret)
>> 			continue;
>> 
>> -		if (!riscv_cbom_block_size) {
>> -			riscv_cbom_block_size = val;
>> +		if (!probed_block_size) {
>> +			probed_block_size = val;
>> 			cbom_hartid = hartid;
>> 		} else {
>> -			if (riscv_cbom_block_size != val)
>> +			if (probed_block_size != val)
>> 				pr_warn("cbom-block-size mismatched between harts %d and %lu\n",
> 
>                                                                  ^ %lu?
> 
>> 					cbom_hartid, hartid);
>> 		}
>> 	}
>> +
>> +	if (probed_block_size)
>> +		riscv_cbom_block_size = probed_block_size;
>> }
>> #endif
>> 
>> void riscv_noncoherent_supported(void)
>> {
>> +	WARN_ON(!riscv_cbom_block_size,
>> +	        "Non-coherent DMA support enabled without a block size\n");
>> 	noncoherent_supported = true;
>> }
>> -- 
>> 2.34.1
> 
> For what it's worth, while this should address the uninitialized
> cbom_hartid at runtime (from the quick glance I gave it), it doesn't
> address the compile time warning. I am not sure how to make it clear to
> clang that the if statement will be executed during the first loop
> iteration because probed_block_size is initialized to zero...

The warnings are correct; the variables are declared inside the body,
as I pointed out on IRC when people were discussing the function.

Jess

> Additionally, it appears that WARN() is the right macro, not WARN_ON()
> and an '#include <asm/bug.h>' is needed.
> 
>  arch/riscv/mm/dma-noncoherent.c:104:6: error: variable 'cbom_hartid' is uninitialized when used here [-Werror,-Wuninitialized]
>                                          cbom_hartid, hartid);
>                                          ^~~~~~~~~~~
>  include/linux/printk.h:517:37: note: expanded from macro 'pr_warn'
>          printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
>                                             ^~~~~~~~~~~
>  include/linux/printk.h:464:60: note: expanded from macro 'printk'
>  #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
>                                                             ^~~~~~~~~~~
>  include/linux/printk.h:436:19: note: expanded from macro 'printk_index_wrap'
>                  _p_func(_fmt, ##__VA_ARGS__);                           \
>                                  ^~~~~~~~~~~
>  arch/riscv/mm/dma-noncoherent.c:87:36: note: initialize the variable 'cbom_hartid' to silence this warning
>                  unsigned long hartid, cbom_hartid;
>                                                   ^
>                                                    = 0
>  arch/riscv/mm/dma-noncoherent.c:116:10: error: too many arguments provided to function-like macro invocation
>                  "Non-coherent DMA support enabled without a block size\n");
>                  ^
>  include/asm-generic/bug.h:121:9: note: macro 'WARN_ON' defined here
>  #define WARN_ON(condition) ({                                           \
>          ^
>  arch/riscv/mm/dma-noncoherent.c:115:2: error: use of undeclared identifier 'WARN_ON'
>          WARN_ON(!riscv_cbom_block_size,
>          ^
>  3 errors generated.
> 
> Cheers,
> Nathan
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
