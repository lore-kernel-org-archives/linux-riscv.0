Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B636C43458
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jul 2026 14:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pcleEhbC+dTWtJEQxQVfa82QuKy95U7nQIPkrIDg3l0=; b=fNRmh3CqHOjuqu
	x5RGhdLdNjnhNfKOHLLY+N6It3aiINH/1JrCHCdt1igOKxZhQl3QR03/w5NK1c0GhObGSMl6wIX4I
	1c+zld2kVHVqyVWHDIA9YodIxoVf+lMK/dmHYT1nhRh8vU+vLcDuMy7Aa/13wAM0w2jQlfli5d8Sd
	2vyNDfRy5ReriTylJHzVm/NyGiSsTJHDQF9yvrkj5dTca3LjXCJuRYKKLGLB92SQ5jfOhfVzQmSyq
	khnvw2JR/geUv0n1lMYVmmIGGM2QUasJWKLMl6Wj3P1jTJyBgIbD88WJoiqU0lZCwptDn85kHae2J
	kOXUDSfcte5u8oHMR/IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wffEO-00000007JzK-3Oss;
	Fri, 03 Jul 2026 14:51:04 +0000
Received: from out-189.mta0.migadu.com ([91.218.175.189])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wffEM-00000007Jxl-0aFy
	for linux-riscv@lists.infradead.org;
	Fri, 03 Jul 2026 14:51:03 +0000
Message-ID: <8f75dc18-dd4c-4989-a76c-eec6cc513ccf@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783090246;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CXlZY4gPG+zU33k3H0xm4g/0VaNA0tr7HNt5303WUBg=;
	b=UDBNB8/0B1x3/BrOa/t8tH6XYsteLhqIKb6sFPxo+8voiJoXwSGbGVTm7m2V2fKjxbZfG5
	wYXqGIpNv/UsD7//6L9xKs/IvOligQC3lhghGNicG75MZUNKdc91kSBysgQAuIKoLqiQ3k
	zeQenTliY3QJ+tbtFUjK7MHFfZ7WXFo=
Date: Fri, 3 Jul 2026 22:50:29 +0800
MIME-Version: 1.0
Subject: Re: [PATCH] mm/mseal: fix mseal documentation for 32-bit kernels
To: Pedro Falcato <pfalcato@suse.de>
References: <20260703022507.187457-1-leon.hwang@linux.dev>
 <akeDk49-pPgUDek1@pedro-suse>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Leon Hwang <leon.hwang@linux.dev>
In-Reply-To: <akeDk49-pPgUDek1@pedro-suse>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_075102_340078_923321EA 
X-CRM114-Status: GOOD (  28.66  )
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
Cc: linux-doc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Gary Guo <gary@garyguo.net>, linux-riscv@lists.infradead.org, Vlastimil Babka <vbabka@kernel.org>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, Jonathan Corbet <corbet@lwn.net>, Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Jann Horn <jannh@google.com>, Nathan Chancellor <nathan@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, Lorenzo Stoakes <ljs@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Alexandre Ghiti <alex@ghiti.fr>, "Liam R . Howlett" <liam@infradead.org>, Nicolas Schier <nsc@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, Douglas Anderson <dianders@chromium.org>, Palmer Dabbelt <palmer@dabbelt.com>, Thomas Gleixner <tglx@kernel.org>, Paul Walmsley <pjw@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2026/7/3 17:44, Pedro Falcato wrote:
> On Fri, Jul 03, 2026 at 10:25:07AM +0800, Leon Hwang wrote:
>> mseal.o is built only for 64-bit kernels, so 32-bit kernels fall back
>> to sys_ni_syscall() and return -ENOSYS rather than -EPERM.
>>
>> Document the -EINTR return from mmap_write_lock_killable(), fix the
>> CONFIG_MSEAL_SYSTEM_MAPPINGS typo, and describe system mappings in
>> terms of VM_SEALED_SYSMAP.
>>
>> Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
>> ---
>>  Documentation/userspace-api/mseal.rst | 18 ++++++++++--------
>>  init/Kconfig                          |  2 +-
>>  mm/mseal.c                            |  4 ++--
>>  3 files changed, 13 insertions(+), 11 deletions(-)
>>
>> diff --git a/Documentation/userspace-api/mseal.rst b/Documentation/userspace-api/mseal.rst
>> index ea9b11a0bd89..1f1cf206670c 100644
>> --- a/Documentation/userspace-api/mseal.rst
>> +++ b/Documentation/userspace-api/mseal.rst
>> @@ -50,8 +50,10 @@ mseal syscall signature
>>           * The start address (``addr``) is not allocated.
>>           * The end address (``addr`` + ``len``) is not allocated.
>>           * A gap (unallocated memory) between start and end address.
>> -      - **-EPERM**:
>> -         * sealing is supported only on 64-bit CPUs, 32-bit is not supported.
>> +      - **-EINTR**:
>> +         * Interrupted while waiting for the mmap write lock.
>> +      - **-ENOSYS**:
>> +         * The kernel does not implement ``mseal()``.
>>  
>>     **Note about error return**:
>>        - For above error cases, users can expect the given memory range is
> 
> Honestly, this whole thing needs to be deleted. We need a proper manpage.

$ man mseal
No manual entry for mseal

When searching "mseal manual" using Google, this doc is the first entry.

So, this change is worthy.

> 
>> @@ -62,7 +64,8 @@ mseal syscall signature
>>          memory range could happen. However, those cases should be rare.
>>  
>>     **Architecture support**:
>> -      mseal only works on 64-bit CPUs, not 32-bit CPUs.
>> +      mseal is built only for 64-bit kernels. 32-bit kernels return
>> +      ``-ENOSYS``.
> 
> This LGTM.
> 
>>  
>>     **Idempotent**:
>>        users can call mseal multiple times. mseal on an already sealed memory
>> @@ -131,20 +134,19 @@ Use cases
>>  - Chrome browser: protect some security sensitive data structures.
>>  
>>  - System mappings:
>> -  The system mappings are created by the kernel and includes vdso, vvar,
>> +  The system mappings are created by the kernel and include vdso, vvar,
>>    vvar_vclock, vectors (arm compat-mode), sigpage (arm compat-mode), uprobes.
>>  
>>    Those system mappings are readonly only or execute only, memory sealing can
>> -  protect them from ever changing to writable or unmmap/remapped as different
>> +  protect them from ever changing to writable or unmapped/remapped as different
>>    attributes. This is useful to mitigate memory corruption issues where a
>>    corrupted pointer is passed to a memory management system.
> 
> Also LGTM.
> 
>>  
>>    If supported by an architecture (CONFIG_ARCH_SUPPORTS_MSEAL_SYSTEM_MAPPINGS),
>> -  the CONFIG_MSEAL_SYSTEM_MAPPINGS seals all system mappings of this
>> -  architecture.
>> +  CONFIG_MSEAL_SYSTEM_MAPPINGS seals mappings marked with VM_SEALED_SYSMAP.
> 
> VM_SEALED_SYSMAP isn't meaningful to userspace.


Got it. Will drop this change.

> 
>>  
>>    The following architectures currently support this feature: x86-64, arm64,
>> -  loongarch and s390.
>> +  loongarch, riscv, and s390.
> 
> This is also useless, every 64-bit architecture will support this.


Do you mean dropping this sentence, or this change?

> 
>>  
>>    WARNING: This feature breaks programs which rely on relocating
>>    or unmapping system mappings. Known broken software at the time
>> diff --git a/init/Kconfig b/init/Kconfig
>> index 5230d4879b1c..12bb39f637b1 100644
>> --- a/init/Kconfig
>> +++ b/init/Kconfig
>> @@ -2112,7 +2112,7 @@ config ARCH_SUPPORTS_MSEAL_SYSTEM_MAPPINGS
>>  	  from a kernel perspective.
>>  
>>  	  After the architecture enables this, a distribution can set
>> -	  CONFIG_MSEAL_SYSTEM_MAPPING to manage access to the feature.
>> +	  CONFIG_MSEAL_SYSTEM_MAPPINGS to manage access to the feature.
>>  
>>  	  For complete descriptions of memory sealing, please see
>>  	  Documentation/userspace-api/mseal.rst
>> diff --git a/mm/mseal.c b/mm/mseal.c
>> index 9781647483d1..0464c7b94ab9 100644
>> --- a/mm/mseal.c
>> +++ b/mm/mseal.c
>> @@ -132,8 +132,8 @@ static int mseal_apply(struct mm_struct *mm,
>>   *   addr is not a valid address (not allocated).
>>   *   end (start + len) is not a valid address.
>>   *   a gap (unallocated memory) between start and end.
>> - *  -EPERM:
>> - *  - In 32 bit architecture, sealing is not supported.
>> + *  -EINTR:
>> + *   interrupted while waiting for the mmap write lock.
>>   * Note:
>>   *  user can call mseal(2) multiple times, adding a seal on an
>>   *  already sealed memory is a no-action (no error).
> 
> And this whole header needs to be deleted as well. No one's looking at
> kernel code for documentation (and if they are, we did a horrendous job
> at actually documenting the thing).
> 


Just to confirm, do you mean removing the entire function comment above
do_mseal()?

Thanks,
Leon



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
