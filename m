Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 967AFC19F2A
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Aug 2022 22:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+WXgYoup71wjr0ht2lJow6z9Ymp8QqqIQHUYNeBSuzc=; b=biFEO1frghy9Yr
	RDAECizC0RLBeYzQtsDcEej08Px3QUiS+4LIogCNDq9QHJYAmUzGOMFic5wAvSEN62tsLg3WL1pw2
	2yGQo9jutlqWMq2YutADuIulRQXytJkn5524Xe4dhW6knDRLKAB/7fhN/bArd04etVu2MWsqjkgrv
	QIneCeyFftiCoWfESdB6OM7VYtoFgupaOONtwJS9zijb42QzktZ61APCs1itmtQIr+uOerlqOOQAn
	UA5UEAvbIxUfRSHKh+6sQr3Cu5UllqRByAxuThUgo/WWbaKxe7Rgu6Bbx+HUXlwdhOv0F8WOJDa2c
	FCn5AR+aNphn6ZkiTlLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKovK-003VGJ-Jq; Sun, 07 Aug 2022 22:39:06 +0000
Received: from [2601:1c0:6280:3f0::a6b3]
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKovI-003VFb-9Q; Sun, 07 Aug 2022 22:39:04 +0000
Message-ID: <3a4dad85-1102-1bab-c0af-a2c6827663b1@infradead.org>
Date: Sun, 7 Aug 2022 15:39:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] asm-generic: unistd.h: make 'compat_sys_fadvise64_64'
 conditional
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org
References: <20220807172854.12971-1-rdunlap@infradead.org>
 <CAK8P3a0FR2ySLXAMGR1ZmaAQMbVwB4MFBPvBw4py_pbgtQSfgA@mail.gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <CAK8P3a0FR2ySLXAMGR1ZmaAQMbVwB4MFBPvBw4py_pbgtQSfgA@mail.gmail.com>
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

Hi Arnd,

On 8/7/22 12:44, Arnd Bergmann wrote:
> On Sun, Aug 7, 2022 at 7:28 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>>
>> Don't require 'compat_sys_fadvise64_64' when
>> __ARCH_WANT_COMPAT_FADVISE64_64 is not set.
>>
>> Fixes this build error when CONFIG_ADVISE_SYSCALLS is not set:
>>
>> include/uapi/asm-generic/unistd.h:649:49: error: 'compat_sys_fadvise64_64' undeclared here (not in a function); did you mean 'ksys_fadvise64_64'?
>>   649 | __SC_COMP(__NR3264_fadvise64, sys_fadvise64_64, compat_sys_fadvise64_64)
>> arch/riscv/kernel/compat_syscall_table.c:12:42: note: in definition of macro '__SYSCALL'
>>    12 | #define __SYSCALL(nr, call)      [nr] = (call),
>> include/uapi/asm-generic/unistd.h:649:1: note: in expansion of macro '__SC_COMP'
>>   649 | __SC_COMP(__NR3264_fadvise64, sys_fadvise64_64, compat_sys_fadvise64_64)
>>
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>> Cc: Paul Walmsley <paul.walmsley@sifive.com>
>> Cc: Palmer Dabbelt <palmer@dabbelt.com>
>> Cc: Albert Ou <aou@eecs.berkeley.edu>
>> Cc: linux-riscv@lists.infradead.org
>> Cc: Arnd Bergmann <arnd@arndb.de>
>> Cc: linux-arch@vger.kernel.org
>> Cc: Andrew Morton <akpm@linux-foundation.org>
>> Cc: linux-mm@kvack.org
>> ---
>>  include/uapi/asm-generic/unistd.h |    2 ++
>>  1 file changed, 2 insertions(+)
>>
>> --- a/include/uapi/asm-generic/unistd.h
>> +++ b/include/uapi/asm-generic/unistd.h
>> @@ -645,8 +645,10 @@ __SC_COMP(__NR_execve, sys_execve, compa
>>  #define __NR3264_mmap 222
>>  __SC_3264(__NR3264_mmap, sys_mmap2, sys_mmap)
>>  /* mm/fadvise.c */
>> +#ifdef __ARCH_WANT_COMPAT_FADVISE64_64
>>  #define __NR3264_fadvise64 223
>>  __SC_COMP(__NR3264_fadvise64, sys_fadvise64_64, compat_sys_fadvise64_64)
>> +#endif
>>
> 
> This does not work: __ARCH_WANT_COMPAT_FADVISE64_64 is defined in
> arch/riscv/include/asm/unistd.h, which is not a UAPI header. By making the line
> conditional on this, user space no longer sees the macro definition.
> 
> It looks like you also drop the native definition on all architectures other
> than riscv here. What we probably want is to just make all the
> declarations in include/linux/compat.h unconditional and not have them
> depend on architecture specific macros. Some of these may have
> incompatible prototypes depending on the architecture, but if we run
> into those, I would suggest we just give them unique names.

Thanks for the comments.

With the other patch to kernel/sys_ni.c, this one is no longer needed,
although I can look into making more entries in <linux/compat.h>
unconditional. That would also mean adding them to kernel/sys_ni.c, right?
(if not already there)

-- 
~Randy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
