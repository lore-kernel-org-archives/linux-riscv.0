Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10628C47258
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jan 2024 00:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6cOptqg9HtfFKz1DvFmHZdvtUDm5ILH5K+E6Uy9MH9g=; b=UrJ6MI8NjuwFOhO/fPmxRT5wE5
	QgcwVBmw5fyJUJ2r6cJSCZ4P1GcySY4prNV38/IhOpbhi/tXyXJq+2zjWk7HNkEkKaOWpclyrJGf+
	popcwgeOO3ZT4W0oUdENSl6/Quc2IpHJ68OAmCMV++zTTr6CAslf7VZpYNKUrVWxItlyaInr930op
	k7f9MjG+GqgWS0bXUm6SnOQsiuT7ryXuTxsLvY8IIrV0UlBqIupK6NrgNmn6Mve5ksYzyr7bxw/J+
	1PnO6mjX6I3qfHmoyb52/L5yGpbxGuhHq3KgnRK9TSUxWpnU0+E4uRCyPW+IWls7TtB4TJi1m/FXU
	hxQeAA6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTAL4-00000002eLi-2Uez;
	Fri, 26 Jan 2024 00:44:58 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTAL1-00000002eL4-37Go
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jan 2024 00:44:57 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-5c66b093b86so924457a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 25 Jan 2024 16:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706229894; x=1706834694; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QtJqbwcd1aBKR50xMCAH1cHJy1bZ+E6DqnetizUbxLI=;
        b=WMbqo6EIc6iSX2pXaVIpwJtfnb1N7sv+l17bxWzhLBvDUaElc0+lCnGt+0VhvxfAy+
         rN33uPbdVOqjW8w3X4J6CbnlIYgoeikRStQwVFlzcfs0VQE6lnQnyMXW+b4aZDwppfQ0
         APlSvfJwvaV7/8vCFKej53//rvmUaalBBLbDiQaDEmpM2rtLZ3qiS7aqom43YHjJM2T+
         IyFSR0oeve6uVaxQZWP7xJv1wKvifg4TZhHn/jgcescMBKLFrqif6Z3x+jwlegGE3pFg
         pplkO3kNifaW/48dEuwyeA5Djh3lm0jzGjPPNDk47CINp4CwsHrgQY+XnmottFK1y4MJ
         obug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706229894; x=1706834694;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QtJqbwcd1aBKR50xMCAH1cHJy1bZ+E6DqnetizUbxLI=;
        b=rjzdWHGtm/xKAGiCdSmpJv/2Y4WTFKx91i6FfQgKSp8L7GNY0qg3uanSDS2rYQUUFx
         65RT0U8LffaBtTfywgkn6TicQ+TpQzri7yJVez/htuw3lMImGtGzSyK/pEq89J/c9yuQ
         ac9gqEw/o6SJg7rdu2q89RoSMai3WScbJUrXCu9zGJJqMBBU1dw/1Nc4i6VcIM1lQ/8p
         w4ms96Tr4fvYVVN2JkZRjNZKOCf/VelhYookyYZZXnheHrvWHWXX6zxULRMimfyRNFvW
         tGjIkuTlJJ0EDX2/VMQMbCheY4HDFinO/GSuySNMufX+XaRJrLokByOyY4Ca9ikSxuU1
         6ing==
X-Gm-Message-State: AOJu0YxF6/34ximZ1gU3y57G5eChxV5BKQZ8svgwR615OToDdIROEgLR
	862ebAQsmx2Ut/PyvKJ7mX8u+lDU0N55z1S7J3yMnNk0RZ86ycVPifYgd5xssQg=
X-Google-Smtp-Source: AGHT+IH+Bxa7letLB9xYoBzAsfuPFFdoXoVju5Pp59vvbK+VMz3/T3dc9A+D3CKZT1bi+po/3jE8Ug==
X-Received: by 2002:a05:6a20:12cb:b0:19c:6dc3:117e with SMTP id v11-20020a056a2012cb00b0019c6dc3117emr198322pzg.32.1706229894471;
        Thu, 25 Jan 2024 16:44:54 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id l2-20020a63f302000000b005cd8044c6fesm114817pgh.23.2024.01.25.16.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 16:44:54 -0800 (PST)
Date: Thu, 25 Jan 2024 16:44:50 -0800
From: Deepak Gupta <debug@rivosinc.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: rick.p.edgecombe@intel.com, broonie@kernel.org, Szabolcs.Nagy@arm.com,
	kito.cheng@sifive.com, keescook@chromium.org,
	ajones@ventanamicro.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, conor.dooley@microchip.com, cleger@rivosinc.com,
	atishp@atishpatra.org, alex@ghiti.fr, bjorn@rivosinc.com,
	alexghiti@rivosinc.com, corbet@lwn.net, aou@eecs.berkeley.edu,
	oleg@redhat.com, akpm@linux-foundation.org, arnd@arndb.de,
	ebiederm@xmission.com, shuah@kernel.org, brauner@kernel.org,
	guoren@kernel.org, samitolvanen@google.com, evan@rivosinc.com,
	xiao.w.wang@intel.com, apatel@ventanamicro.com,
	mchitale@ventanamicro.com, waylingii@gmail.com,
	greentime.hu@sifive.com, heiko@sntech.de, jszhang@kernel.org,
	shikemeng@huaweicloud.com, david@redhat.com,
	panqinglin2020@iscas.ac.cn, willy@infradead.org,
	vincent.chen@sifive.com, andy.chiu@sifive.com, gerg@kernel.org,
	jeeheng.sia@starfivetech.com, mason.huo@starfivetech.com,
	ancientmodern4@gmail.com, mathis.salmen@matsal.de,
	cuiyunhui@bytedance.com, bhe@redhat.com, ruscur@russell.cc,
	bgray@linux.ibm.com, alx@kernel.org, baruch@tkos.co.il,
	zhangqing@loongson.cn, catalin.marinas@arm.com, revest@chromium.org,
	josh@joshtriplett.org, joey.gouly@arm.com, shr@devkernel.io,
	omosnace@redhat.com, ojeda@kernel.org, jhubbard@nvidia.com,
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [RFC PATCH v1 15/28] riscv/mm: Implement map_shadow_stack()
 syscall
Message-ID: <ZbMAgl5RqaUEs3Dr@debug.ba.rivosinc.com>
References: <20240125062739.1339782-1-debug@rivosinc.com>
 <20240125062739.1339782-16-debug@rivosinc.com>
 <ZbLRgEVZvh7LE+k/@ghost>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZbLRgEVZvh7LE+k/@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_164455_822641_4C265AC4 
X-CRM114-Status: GOOD (  23.42  )
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

On Thu, Jan 25, 2024 at 01:24:16PM -0800, Charlie Jenkins wrote:
>On Wed, Jan 24, 2024 at 10:21:40PM -0800, debug@rivosinc.com wrote:
>> From: Deepak Gupta <debug@rivosinc.com>
>>
>> As discussed extensively in the changelog for the addition of this
>> syscall on x86 ("x86/shstk: Introduce map_shadow_stack syscall") the
>> existing mmap() and madvise() syscalls do not map entirely well onto the
>> security requirements for guarded control stacks since they lead to
>> windows where memory is allocated but not yet protected or stacks which
>> are not properly and safely initialised. Instead a new syscall
>> map_shadow_stack() has been defined which allocates and initialises a
>> shadow stack page.
>>
>> This patch implements this syscall for riscv. riscv doesn't require token
>> to be setup by kernel because user mode can do that by itself. However to
>> provide compatiblity and portability with other architectues, user mode can
>> specify token set flag.
>>
>> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
>> ---
>>  arch/riscv/kernel/Makefile      |   2 +
>>  arch/riscv/kernel/usercfi.c     | 150 ++++++++++++++++++++++++++++++++
>>  include/uapi/asm-generic/mman.h |   1 +
>>  3 files changed, 153 insertions(+)
>>  create mode 100644 arch/riscv/kernel/usercfi.c
>>
>> diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
>> index fee22a3d1b53..8c668269e886 100644
>> --- a/arch/riscv/kernel/Makefile
>> +++ b/arch/riscv/kernel/Makefile
>> @@ -102,3 +102,5 @@ obj-$(CONFIG_COMPAT)		+= compat_vdso/
>>
>>  obj-$(CONFIG_64BIT)		+= pi/
>>  obj-$(CONFIG_ACPI)		+= acpi.o
>> +
>> +obj-$(CONFIG_RISCV_USER_CFI) += usercfi.o
>> diff --git a/arch/riscv/kernel/usercfi.c b/arch/riscv/kernel/usercfi.c
>> new file mode 100644
>> index 000000000000..35ede2cbc05b
>> --- /dev/null
>> +++ b/arch/riscv/kernel/usercfi.c
>> @@ -0,0 +1,150 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (C) 2023 Rivos, Inc.
>Nit: Should be updated to 2024

noted

>> + * Deepak Gupta <debug@rivosinc.com>
>> + */
>> +
>> +#include <linux/sched.h>
>> +#include <linux/bitops.h>
>> +#include <linux/types.h>
>> +#include <linux/mm.h>
>> +#include <linux/mman.h>
>> +#include <linux/uaccess.h>
>> +#include <linux/sizes.h>
>> +#include <linux/user.h>
>> +#include <linux/syscalls.h>
>> +#include <linux/prctl.h>
>> +#include <asm/csr.h>
>> +#include <asm/usercfi.h>
>> +
>> +#define SHSTK_ENTRY_SIZE sizeof(void *)
>> +
>> +/*
>> + * Writes on shadow stack can either be `sspush` or `ssamoswap`. `sspush` can happen
>> + * implicitly on current shadow stack pointed to by CSR_SSP. `ssamoswap` takes pointer to
>> + * shadow stack. To keep it simple, we plan to use `ssamoswap` to perform writes on shadow
>> + * stack.
>> + */
>> +static noinline unsigned long amo_user_shstk(unsigned long *addr, unsigned long val)
>> +{
>> +	/*
>> +	 * In case ssamoswap faults, return -1.
>> +	 * Never expect -1 on shadow stack. Expect return addresses and zero
>> +	 */
>> +	unsigned long swap = -1;
>> +
>> +	__enable_user_access();
>> +	asm_volatile_goto(
>> +				".option push\n"
>> +				".option arch, +zicfiss\n"
>> +#ifdef CONFIG_64BIT
>> +				"1: ssamoswap.d %0, %2, %1\n"
>> +#else
>> +				"1: ssamoswap.w %0, %2, %1\n"
>
>A SSAMOSWAP macro that conditionally defines this would be cleaner

Yes I need to do that. Infact I need to gate CONFIG_RISCV_USER_CFI behind
some riscv-gnu toolchain version as well. Becuase not all toolchain versions will
recognize this.

>
>> +#endif
>> +				_ASM_EXTABLE(1b, %l[fault])
>> +				RISCV_ACQUIRE_BARRIER
>> +				".option pop\n"
>> +				: "=r" (swap), "+A" (*addr)
>
>I just ran into this on one of my patches that not every compiler
>supports output args in asm goto blocks. You need to guard this with the
>kconfig option CC_HAS_ASM_GOTO_TIED_OUTPUT. Unfortunately, that means
>that this code needs two versions, or you can choose to gate CFI behind
>this option, it's supported by recent versions of GCC/CLANG.

Thanks.
I'll gate behind CC_HAS_ASM_GOTO_TIED_OUTPUT. Earlier versions of GCC/CLANG
won't have CFI support in them anyways.

>
>For readability it is also nice to use labels for the asm variables such
>as `"=r" (swap)` can be `[swap] "=r" (swap)` and then replace %0 with
>%[swap].

noted, will do that. I copied it from gcc asm snippet `amoswap` somewhere in
kernel. Goes without saying, I am terrible with gcc asm syntax.

>
>- Charlie
>
>> +				: "r" (val)
>> +				: "memory"
>> +				: fault

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
