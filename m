Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82378C531DC
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Aug 2024 04:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cisv0cfjFAhvXxoFeJTtBYeUevhamxjd8vtih7b9Kfw=; b=Z0V/kIQT5sz1Sj
	F7h5niN3VuQG3DPTyps+WgQ6t2X9ifcwl8FO31Dh0JIB/pvisyWRZj7quVhxhHqh9CN9bAP0Qt6N6
	HV18w82niONkAfJBp5ZQp/reEPtOd/Bek/wSxnhnQdVUQlr5g7meXQgS5a0nwvFnd0l3OQDV1wvXX
	+hgVwMAMoCNsYvvBYyIt2UU0P4l8tgK196gvFFpHXHIPNwI9I8t7zZ+cgAMOyphtG+LCvRABKT20T
	O3mPE4IY5cuxid1PgeyTPo53ZdWSYCHnZ80vFBnCY5nVnHbs0+6K7Sv7mWgIJO85v7W/oFEX9BJ36
	2ZftypYfbyK9FF/g8Nlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shM5K-0000000FDDd-3NpI;
	Fri, 23 Aug 2024 04:39:38 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shM5H-0000000FDD2-2OxB
	for linux-riscv@lists.infradead.org;
	Fri, 23 Aug 2024 04:39:37 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2025031eb60so13070715ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 22 Aug 2024 21:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724387974; x=1724992774; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Gqe+urx6ldbmD1E7Rwksh8MtsfggHXXnzovx5alouE4=;
        b=y83j0ZpttJuavf7BwaKI7RYsbUnn4+L3O+MoIgTeyULWXxzwRpqEElaAmcx74e00FK
         oC5cFNL2vrjv6Te2ODK6CeTTJktlXJe050343j+lL/84GB/XIy+J8PiC8a6ySujAV0MP
         1KCbYQKXvYNOdXTlUsUci7W0Dts81TkD/UZYuzbjxg5QHVWo50eiLt6mI66zb+l+LFWw
         +286R1Gmx/Bo5KGCUQ8iteIzGntUUWLmcs0k9CXSuI3CR0UmDo4VudxOIauH024OenoB
         s2znY2GPoZ17kDuylOEvyA1sxi8SlKTlkY34bJkZ87glnvrjSuBhRy/DbbXCR9RrhYVN
         hpdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724387974; x=1724992774;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gqe+urx6ldbmD1E7Rwksh8MtsfggHXXnzovx5alouE4=;
        b=NOyyCAfmKVZc4gnQGKQmTci8sHJEPtHQT1VfTjK6U9aofStiw3y08YhMsiagf+z/VL
         +y8MrgQ3KvLD6U3pxIjy0TM8WZbzZjPt6nmK2RopfdHyire+9+I210HLfaLXh3WJ38MF
         u0Z5xtjgdaBnF4jcichozzJ/4/RW/aKKI90mjAFgTjiMAeVzI7tGukQTzxx5B5tODNEp
         PzcjWHfYhPWLoZmRug5OaIvNrEKW4Ywc+Ufd/bUdN//4kpjCOYwFlvezSP7xTcSB32Fe
         O1cRd2/PEvGv7Ri6+ZCxab45bwfaieXWDiB94p0kgIgxQ3lXtYk+0GW2pRPN5kICm9u1
         DZmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPy+ra4MuvGsAER5JAjeQxhfNPirAXI+4i3L2EgRpel8tDL2Q9M08in173gNNWDkPZ5kISv80iFMai5g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzTrS/wI34zhFcnctmVc9WRhTMykXeE8p7YVXb+dHm60lWYBi4X
	PN4xp0kbwQJsUDwTaPOJMAzHQBD6k28NLtCk9NbejUuZvrHxZc6bd0YOC2APG84=
X-Google-Smtp-Source: AGHT+IH/UWpbUoEWUXINMMcxrhHXa2MBrr4xkWKB8wrSXqKqHIV+/deQG0lreoJzFG5C0rNXKr1HzA==
X-Received: by 2002:a17:902:da81:b0:1fd:a7a7:20b7 with SMTP id d9443c01a7336-2039e494f51mr12105595ad.30.1724387974123;
        Thu, 22 Aug 2024 21:39:34 -0700 (PDT)
Received: from ghost ([2601:647:6700:64d0:32df:35ec:8dbd:978c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-203855860a7sm20312825ad.110.2024.08.22.21.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 21:39:33 -0700 (PDT)
Date: Thu, 22 Aug 2024 21:39:30 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Yangyu Chen <cyy@cyyself.name>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, rsworktech@outlook.com,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-api@vger.kernel.org
Subject: Re: [PATCH v3 1/3] riscv: mm: Use hint address in mmap if available
Message-ID: <ZsgSgm0zEE2t/9tK@ghost>
References: <mhng-7d9e2b27-a53d-4579-b78e-0aec038290fb@palmer-ri-x1c9>
 <tencent_86551D71707162B243861AC9F8EC0573B409@qq.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <tencent_86551D71707162B243861AC9F8EC0573B409@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240822_213935_653176_31F6BFAE 
X-CRM114-Status: GOOD (  61.85  )
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

On Thu, Aug 22, 2024 at 10:51:54AM +0800, Yangyu Chen wrote:
> 
> 
> > On Aug 22, 2024, at 06:17, Palmer Dabbelt <palmer@dabbelt.com> wrote:
> > 
> > On Mon, 19 Aug 2024 18:58:18 PDT (-0700), rsworktech@outlook.com wrote:
> >> On 2024-08-20 01:00, Charlie Jenkins wrote:
> >>> On Mon, Aug 19, 2024 at 01:55:57PM +0800, Levi Zim wrote:
> >>>> On 2024-03-22 22:06, Palmer Dabbelt wrote:
> >>>>> On Thu, 01 Feb 2024 18:28:06 PST (-0800), Charlie Jenkins wrote:
> >>>>>> On Wed, Jan 31, 2024 at 11:59:43PM +0800, Yangyu Chen wrote:
> >>>>>>> On Wed, 2024-01-31 at 22:41 +0800, Yangyu Chen wrote:
> >>>>>>>> On Tue, 2024-01-30 at 17:07 -0800, Charlie Jenkins wrote:
> >>>>>>>>> On riscv it is guaranteed that the address returned by mmap is less
> >>>>>>>>> than
> >>>>>>>>> the hint address. Allow mmap to return an address all the way up to
> >>>>>>>>> addr, if provided, rather than just up to the lower address space.
> >>>>>>>>>>> This provides a performance benefit as well, allowing
> >>>>>>> mmap to exit
> >>>>>>>>> after
> >>>>>>>>> checking that the address is in range rather than searching for a
> >>>>>>>>> valid
> >>>>>>>>> address.
> >>>>>>>>>>> It is possible to provide an address that uses at most the same
> >>>>>>>>> number
> >>>>>>>>> of bits, however it is significantly more computationally expensive
> >>>>>>>>> to
> >>>>>>>>> provide that number rather than setting the max to be the hint
> >>>>>>>>> address.
> >>>>>>>>> There is the instruction clz/clzw in Zbb that returns the highest
> >>>>>>>>> set
> >>>>>>>>> bit
> >>>>>>>>> which could be used to performantly implement this, but it would
> >>>>>>>>> still
> >>>>>>>>> be slower than the current implementation. At worst case, half of
> >>>>>>>>> the
> >>>>>>>>> address would not be able to be allocated when a hint address is
> >>>>>>>>> provided.
> >>>>>>>>>>> Signed-off-by: Charlie Jenkins<charlie@rivosinc.com>
> >>>>>>>>> ---
> >>>>>>>>>  arch/riscv/include/asm/processor.h | 27 +++++++++++---------------
> >>>>>>>>> -
> >>>>>>>>>  1 file changed, 11 insertions(+), 16 deletions(-)
> >>>>>>>>>>> diff --git a/arch/riscv/include/asm/processor.h
> >>>>>>>>> b/arch/riscv/include/asm/processor.h
> >>>>>>>>> index f19f861cda54..8ece7a8f0e18 100644
> >>>>>>>>> --- a/arch/riscv/include/asm/processor.h
> >>>>>>>>> +++ b/arch/riscv/include/asm/processor.h
> >>>>>>>>> @@ -14,22 +14,16 @@
> >>>>>>>>> 
> >>>>>>>>>  #include <asm/ptrace.h>
> >>>>>>>>> 
> >>>>>>>>> -#ifdef CONFIG_64BIT
> >>>>>>>>> -#define DEFAULT_MAP_WINDOW    (UL(1) << (MMAP_VA_BITS - 1))
> >>>>>>>>> -#define STACK_TOP_MAX        TASK_SIZE_64
> >>>>>>>>> -
> >>>>>>>>>  #define arch_get_mmap_end(addr, len, flags)            \
> >>>>>>>>>  ({                                \
> >>>>>>>>>      unsigned long
> >>>>>>>>> mmap_end;                    \
> >>>>>>>>>      typeof(addr) _addr = (addr);                \
> >>>>>>>>> -    if ((_addr) == 0 || (IS_ENABLED(CONFIG_COMPAT) &&
> >>>>>>>>> is_compat_task())) \
> >>>>>>>>> +    if ((_addr) == 0 ||                    \
> >>>>>>>>> +        (IS_ENABLED(CONFIG_COMPAT) && is_compat_task()) ||    \
> >>>>>>>>> +        ((_addr + len) > BIT(VA_BITS -
> >>>>>>>>> 1)))            \
> >>>>>>>>>          mmap_end = STACK_TOP_MAX;            \
> >>>>>>>>> -    else if ((_addr) >= VA_USER_SV57) \
> >>>>>>>>> -        mmap_end = STACK_TOP_MAX;            \
> >>>>>>>>> -    else if ((((_addr) >= VA_USER_SV48)) && (VA_BITS >=
> >>>>>>>>> VA_BITS_SV48)) \
> >>>>>>>>> -        mmap_end = VA_USER_SV48;            \
> >>>>>>>>>      else                            \
> >>>>>>>>> -        mmap_end = VA_USER_SV39;            \
> >>>>>>>>> +        mmap_end = (_addr + len);            \
> >>>>>>>>>      mmap_end;                        \
> >>>>>>>>>  })
> >>>>>>>>> 
> >>>>>>>>> @@ -39,17 +33,18 @@
> >>>>>>>>>      typeof(addr) _addr = (addr);                \
> >>>>>>>>>      typeof(base) _base = (base);                \
> >>>>>>>>>      unsigned long rnd_gap = DEFAULT_MAP_WINDOW - (_base);    \
> >>>>>>>>> -    if ((_addr) == 0 || (IS_ENABLED(CONFIG_COMPAT) &&
> >>>>>>>>> is_compat_task())) \
> >>>>>>>>> +    if ((_addr) == 0 ||                    \
> >>>>>>>>> +        (IS_ENABLED(CONFIG_COMPAT) && is_compat_task()) ||    \
> >>>>>>>>> +        ((_addr + len) > BIT(VA_BITS -
> >>>>>>>>> 1)))            \
> >>>>>>>>>          mmap_base = (_base);                \
> >>>>>>>>> -    else if (((_addr) >= VA_USER_SV57) && (VA_BITS >=
> >>>>>>>>> VA_BITS_SV57)) \
> >>>>>>>>> -        mmap_base = VA_USER_SV57 - rnd_gap; \
> >>>>>>>>> -    else if ((((_addr) >= VA_USER_SV48)) && (VA_BITS >=
> >>>>>>>>> VA_BITS_SV48)) \
> >>>>>>>>> -        mmap_base = VA_USER_SV48 - rnd_gap; \
> >>>>>>>>>      else                            \
> >>>>>>>>> -        mmap_base = VA_USER_SV39 - rnd_gap; \
> >>>>>>>>> +        mmap_base = (_addr + len) - rnd_gap; \
> >>>>>>>>>      mmap_base;                        \
> >>>>>>>>>  })
> >>>>>>>>> 
> >>>>>>>>> +#ifdef CONFIG_64BIT
> >>>>>>>>> +#define DEFAULT_MAP_WINDOW    (UL(1) << (MMAP_VA_BITS - 1))
> >>>>>>>>> +#define STACK_TOP_MAX        TASK_SIZE_64
> >>>>>>>>>  #else
> >>>>>>>>>  #define DEFAULT_MAP_WINDOW    TASK_SIZE
> >>>>>>>>>  #define STACK_TOP_MAX        TASK_SIZE
> >>>>>>>>>>> I have carefully tested your patch on qemu with sv57. A
> >>>>>>> bug that
> >>>>>>>> needs
> >>>>>>>> to be solved is that mmap with the same hint address without
> >>>>>>>> MAP_FIXED
> >>>>>>>> set will fail the second time.
> >>>>>>>>> Userspace code to reproduce the bug:
> >>>>>>>>> #include <sys/mman.h>
> >>>>>>>> #include <stdio.h>
> >>>>>>>> #include <stdint.h>
> >>>>>>>>> void test(char *addr) {
> >>>>>>>>     char *res = mmap(addr, 4096, PROT_READ | PROT_WRITE,
> >>>>>>>> MAP_ANONYMOUS
> >>>>>>>>> MAP_PRIVATE, -1, 0);
> >>>>>>>>     printf("hint %p got %p.\n", addr, res);
> >>>>>>>> }
> >>>>>>>>> int main (void) {
> >>>>>>>>     test(1<<30);
> >>>>>>>>     test(1<<30);
> >>>>>>>>     test(1<<30);
> >>>>>>>>     return 0;
> >>>>>>>> }
> >>>>>>>>> output:
> >>>>>>>>> hint 0x40000000 got 0x40000000.
> >>>>>>>> hint 0x40000000 got 0xffffffffffffffff.
> >>>>>>>> hint 0x40000000 got 0xffffffffffffffff.
> >>>>>>>>> output on x86:
> >>>>>>>>> hint 0x40000000 got 0x40000000.
> >>>>>>>> hint 0x40000000 got 0x7f9171363000.
> >>>>>>>> hint 0x40000000 got 0x7f9171362000.
> >>>>>>>>> It may need to implement a special arch_get_unmapped_area and
> >>>>>>>> arch_get_unmapped_area_topdown function.
> >>>>>>>> 
> >>>>>>> This is because hint address < rnd_gap. I have tried to let mmap_base =
> >>>>>>> min((_addr + len), (base) + TASK_SIZE - DEFAULT_MAP_WINDOW). However it
> >>>>>>> does not work for bottom-up while ulimit -s is unlimited. You said this
> >>>>>>> behavior is expected from patch v2 review. However it brings a new
> >>>>>>> regression even on sv39 systems.
> >>>>>>> 
> >>>>>>> I still don't know the reason why use addr+len as the upper-bound. I
> >>>>>>> think solution like x86/arm64/powerpc provide two address space switch
> >>>>>>> based on whether hint address above the default map window is enough.
> >>>>>>> 
> >>>>>> Yep this is expected. It is up to the maintainers to decide.
> >>>>> Sorry I forgot to reply to this, I had a buffer sitting around somewhere
> >>>>> but I must have lost it.
> >>>>> 
> >>>>> I think Charlie's approach is the right way to go.  Putting my userspace
> >>>>> hat on, I'd much rather have my allocations fail rather than silently
> >>>>> ignore the hint when there's memory pressure.
> >>>>> 
> >>>>> If there's some real use case that needs these low hints to be silently
> >>>>> ignored under VA pressure then we can try and figure something out that
> >>>>> makes those applications work.
> >>>> I could confirm that this patch has broken chromium's partition allocator on
> >>>> riscv64. The minimal reproduction I use is chromium-mmap.c:
> >>>> 
> >>>> #include <stdio.h>
> >>>> #include <sys/mman.h>
> >>>> 
> >>>> int main() {
> >>>>     void* expected = (void*)0x400000000;
> >>>>     void* addr = mmap(expected, 17179869184, PROT_NONE,
> >>>> MAP_PRIVATE|MAP_ANONYMOUS, -1, 0);
> >>>>     if (addr != expected) {
> >>> It is not valid to assume that the address returned by mmap will be the
> >>> hint address. If the hint address is not available, mmap will return a
> >>> different address.
> >> 
> >> Oh, sorry I didn't make it clear what is the expected behavior.
> >> The printf here is solely for debugging purpose and I don't mean that
> >> chromium expect it will get the hint address. The expected behavior is
> >> that both the two mmap calls will succeed.
> >> 
> >>>>         printf("Not expected address: %p != %p\n", addr, expected);
> >>>>     }
> >>>>     expected = (void*)0x3fffff000;
> >>>>     addr = mmap(expected, 17179873280, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS,
> >>>> -1, 0);
> >>>>     if (addr != expected) {
> >>>>         printf("Not expected address: %p != %p\n", addr, expected);
> >>>>     }
> >>>>     return 0;
> >>>> }
> >>>> 
> >>>> The second mmap fails with ENOMEM. Manually reverting this commit fixes the
> >>>> issue for me. So I think it's clearly a regression and breaks userspace.
> >>>> 
> >>> The issue here is that overlapping memory is being requested. This
> >>> second mmap will never be able to provide an address at 0x3fffff000 with
> >>> a size of 0x400001000 since mmap just provided an address at 0x400000000
> >>> with a size of 0x400000000.
> >>> 
> >>> Before this patch, this request causes mmap to return a completely
> >>> arbitrary value. There is no reason to use a hint address in this manner
> >>> because the hint can never be respected. Since an arbitrary address is
> >>> desired, a hint of zero should be used.
> >>> 
> >>> This patch causes the behavior to be more deterministic. Instead of
> >>> providing an arbitrary address, it causes the address to be less than or
> >>> equal to the hint address. This allows for applications to make
> >>> assumptions about the returned address.
> >> 
> >> About the overlap, of course the partition allocator's request for
> >> overlapped vma seems unreasonable.
> >> 
> >> But I still don't quite understand why mmap cannot use an address higher
> >> than the hint address.
> >> The hint address, after all, is a hint, not a requirement.
> >> 
> >> Quoting the man page:
> >> 
> >>>   If another mapping already exists there, the kernel picks
> >>>        a new address that may or may not depend on the hint.  The
> >>>        address of the new mapping is returned as the result of the call.
> >> 
> >> So for casual programmers that only reads man page but not architecture
> >> specific kernel documentation, the current behavior of mmap on riscv64
> >> failing on overlapped address ranges are quite surprising IMO.
> >> 
> >> And quoting the man page again about the errno:
> >> 
> >>>       ENOMEM No memory is available.
> >>> 
> >>>       ENOMEM The process's maximum number of mappings would have been
> >>>              exceeded.  This error can also occur for munmap(), when
> >>>              unmapping a region in the middle of an existing mapping,
> >>>              since this results in two smaller mappings on either side
> >>>              of the region being unmapped.
> >>> 
> >>>       ENOMEM (since Linux 4.7) The process's RLIMIT_DATA limit,
> >>>              described in getrlimit(2), would have been exceeded.
> >>> 
> >>>       ENOMEM We don't like addr, because it exceeds the virtual address
> >>>              space of the CPU.
> >>> 
> >> 
> >> There's no matching description for the ENOMEM returned here.
> >> I would suggest removing "because it exceeds the virtual address
> >> space of the CPU." from the last item if the ENOMEM behavior here
> >> is expected.
> >> 
> >>> This code is unfortunately relying on the previously mostly undefined
> >>> behavior of the hint address in mmap.
> >> 
> >> Although I haven't read the code of chromium's partition allocator to
> >> judge whether it should
> >> be improved or fixed for riscv64, I do know that the kernel "don't break
> >> userspace" and "never EVER blame the user programs".
> > 
> > Ya, sorry for breaking stuff.
> > 
> > The goal here was to move to the mmap flag behavor similar to what arm64 and x86 have, as that was done in a way that didn't appear to break userspace -- or at least any real userspace programs.  IIRC that first test was pretty broken (it actually depended on the hint address), but sounds like that's not the case.
> > 
> > I think maybe this is just luck: we didn't chunk the address space up, we're just hinting on every bit, so we're just more likely to hit the exhaustion.  Doesn't really matter, though, as if it's breaking stuff so we've got to deal with it.
> > 
> > Charlie and I are just talking, and best we can come up with is to move to the behavior where we fall back to larger allocation regions when there's no space in the smaller allocation region.  
> 
> 
> For this solution, the only difference from the mmap behavior of
> x86 and aarch64 is that we will first try to allocate some memory
> from an address less or equal to the request address + size. But
> for most cases, I think there is no need to do that, especially for
> those addresses < BIT(47), as most program works fine on x86-64,
> which has 47bit available userspace address space to use. And for
> that program that wants an address < BIT(32), we already have
> MAP_32BIT now.
> 
> I think we can just fix like that patch:
> https://lore.kernel.org/lkml/tencent_B2D0435BC011135736262764B511994F4805@qq.com/

This patch does not satisfy the requirement of having the ability to guarantee
that mmap returns an address that is less than the hint address. This
patch only allows an address to be less than the DEFAULT_MAP_WINDOW
which is 32 bits on sv32, 39 bits on sv39, and 48 bits on sv48 or sv57.

This patch also again falls into the trap of using the hint address to
forcefully restrict the address space. I agree with Levi that it is not
very good behavior to have a "hint" cause mmap to fail if conforming to
the hint isn't possible. Instead, I believe it to be more logical to try
to allocate at the hint address, otherwise give a random address.

The current behavior can then be maintained through the flag
MAP_BELOW_HINT. This way the user explicitly selects that they want mmap
to fail if an address could not be found within the hint address
constraints.

- Charlie

> 
> > Charlie's going to try and throw together a patch for that, hopefully it'll sort things out.
> > 
> >>> The goal of this patch is to help
> >>> developers have more consistent mmap behavior, but maybe it is necessary
> >>> to hide this behavior behind an mmap flag.
> >> 
> >> Thank you for helping to shape a more consistent mmap behavior.
> >> I think this should be fixed ASAP either by allowing the hint address to
> >> be ignored
> >> (as suggested by the Linux man page), or hide this behavior behind an
> >> mmap flag as you said.
> >> 
> >>> - Charlie
> >>> 
> >>>> See alsohttps://github.com/riscv-forks/electron/issues/4
> >>>> 
> >>>>>> - Charlie
> >>>> Sincerely,
> >>>> Levi
> >>>> 
> >> 
> >> I accidentally introduced some HTML into this reply so this reply is
> >> resent as plain text.
> >> 
> >> Sincerely,
> >> Levi
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
