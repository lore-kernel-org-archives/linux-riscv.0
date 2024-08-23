Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2F84C531DC
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Aug 2024 05:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DbPP8E270r/HD87KgJlftruXdCi+YIcuGbtb4t4gOZw=; b=g6D7S2wbx6cvL6
	b+hapN4dGnlgoXBaj5HnmRDHA9IAuZmYPKaeSMhi//S0TnByJzdOH0wLhstPJdWpM4IUpC20d25js
	8P5HRkfprS6ZVxGycXGz9z23aibWmnOLMs7f10tmYUIaf+4VrsAGHCATbE9jnJifgJDwj7hfqWDt1
	OGOkRM9g3qNTon1TFauOCw/CyVgse/rr1CP9c68TbsN6vW1mg+I63GbJh+VIavDMmU7GpJBQZtydq
	0wlo32Hcmy78O1K4nUkIgWP+VEgcuFAXD3FI/VRVAJb1dTxhxckO4YqsznxKX4IuS7E1YaegcPx+T
	4XmPHxvOuSCAwtML/eBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shNIX-0000000FNoL-2xpR;
	Fri, 23 Aug 2024 05:57:21 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shNIT-0000000FNnS-2Agi
	for linux-riscv@lists.infradead.org;
	Fri, 23 Aug 2024 05:57:20 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-2d3dc25b1b5so1149484a91.2
        for <linux-riscv@lists.infradead.org>; Thu, 22 Aug 2024 22:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724392636; x=1724997436; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B2JNYeuyllRPoSIRsU2AqZAQtPgOIzgDgHNYGOF4FQ0=;
        b=iy3ddWNeWXQuCx0S5n72X1Chzo/oU3Ln51ZI/a8bfmVRCvvTLhl6Zz8GbHRd/K4xou
         J6eKysilTYEv8S7H3fY+WevJzqmicGTb/9+mdv0f262dRWOaBft5oUxxkCsByeXHFYUq
         F0B/OXFDPa8jCPYr/TPXhhfoUjKdJ0ZdUZohSYp++C7RxdfK33SPaI/nTf2UF4N+OxAX
         y2dJ8ik8o4NV/lMTMKDZi86aI1cEYKrEKeKJ3bW3ndOcu0hHek2lNbUMzJeZ0F+5exsN
         EVs8zub9+4iKtJTIwPcq2HO/sy4byccq8HoLLZdnQxVmarH8IC9D2af94lF/2h3DukpX
         7LfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724392636; x=1724997436;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B2JNYeuyllRPoSIRsU2AqZAQtPgOIzgDgHNYGOF4FQ0=;
        b=VJEW5UKIw2tiA4UYFUOYGbQm2SrZPQE1HfHxEgAUL5j0BZXhy/vG6DBeXEZTNYDjEt
         xrI82yHuvOUGvCbBq4VDTTlncX8KshxDhehMU7h0n0wlUU+f5FikQTt0wmaC5fSVqGGK
         dGJcW5cTb/SZP+Hof9JaQ6lhKhVgPRtyP5VbcaWAYyJ7+rbzoOVOeolnKz5jFn2NIC1G
         utsPYqvhPDWTy1H5NsSuW/lDdNc1+vRN9udm2wJWnxP5z1p9Vrpnf7UQ8wdAa55NYUYT
         kQsOdNY9gG4JP+RSwLGaYA/X/JAVuolFruFvrsegX3Ima5AoQ9PIqMGBrXVOJWgh/tLy
         yg5A==
X-Forwarded-Encrypted: i=1; AJvYcCXtXznaWacX/u3mTIWFzs9mJK8w0twFo4/6H89qanyh+V01ZwlnfHZUbr1Fqc7PIfWlkiPSTuJHOUWosg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzgi7ElqU2eqWWTcOhoSUhyn1POPb9agkD3CS1m/j1yg489x3D4
	CIlnRAV+jjsRrvhikaJGHgx5dZHSo9F/Y2SBG+B4D6YoX41k2EoX6XJBGFlZ3zY=
X-Google-Smtp-Source: AGHT+IFhAROETxX2TthfeT2Mhztm1JSkms/8ZDmt9phs4NUMtjlR+WSgKXUQhpFYiG+pAi3qOKfquw==
X-Received: by 2002:a17:90a:12c2:b0:2c9:69cc:3a6f with SMTP id 98e67ed59e1d1-2d646d0c2f3mr1093506a91.31.1724392636070;
        Thu, 22 Aug 2024 22:57:16 -0700 (PDT)
Received: from ghost ([2601:647:6700:64d0:32df:35ec:8dbd:978c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d5eba23d78sm5318174a91.29.2024.08.22.22.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 22:57:15 -0700 (PDT)
Date: Thu, 22 Aug 2024 22:57:12 -0700
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
Message-ID: <ZsgkuO5qbnC+79H1@ghost>
References: <mhng-7d9e2b27-a53d-4579-b78e-0aec038290fb@palmer-ri-x1c9>
 <tencent_86551D71707162B243861AC9F8EC0573B409@qq.com>
 <ZsgSgm0zEE2t/9tK@ghost>
 <tencent_B65111F737A62A64BBD1900F5F1040DBC805@qq.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <tencent_B65111F737A62A64BBD1900F5F1040DBC805@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240822_225717_851052_5A578F6F 
X-CRM114-Status: GOOD (  56.72  )
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

On Fri, Aug 23, 2024 at 01:28:18PM +0800, Yangyu Chen wrote:
> 
> 
> > On Aug 23, 2024, at 12:39, Charlie Jenkins <charlie@rivosinc.com> wrote:
> > 
> > On Thu, Aug 22, 2024 at 10:51:54AM +0800, Yangyu Chen wrote:
> >> 
> >> 
> >>> On Aug 22, 2024, at 06:17, Palmer Dabbelt <palmer@dabbelt.com> wrote:
> >>> 
> >>> On Mon, 19 Aug 2024 18:58:18 PDT (-0700), rsworktech@outlook.com wrote:
> >>>> On 2024-08-20 01:00, Charlie Jenkins wrote:
> >>>>> On Mon, Aug 19, 2024 at 01:55:57PM +0800, Levi Zim wrote:
> >>>>>> On 2024-03-22 22:06, Palmer Dabbelt wrote:
> >>>>>>> On Thu, 01 Feb 2024 18:28:06 PST (-0800), Charlie Jenkins wrote:
> >>>>>>>> On Wed, Jan 31, 2024 at 11:59:43PM +0800, Yangyu Chen wrote:
> >>>>>>>>> On Wed, 2024-01-31 at 22:41 +0800, Yangyu Chen wrote:
> >>>>>>>>>> On Tue, 2024-01-30 at 17:07 -0800, Charlie Jenkins wrote:
> >>>>>>>>>>> On riscv it is guaranteed that the address returned by mmap is less
> >>>>>>>>>>> than
> >>>>>>>>>>> the hint address. Allow mmap to return an address all the way up to
> >>>>>>>>>>> addr, if provided, rather than just up to the lower address space.
> >>>>>>>>>>>>> This provides a performance benefit as well, allowing
> >>>>>>>>> mmap to exit
> >>>>>>>>>>> after
> >>>>>>>>>>> checking that the address is in range rather than searching for a
> >>>>>>>>>>> valid
> >>>>>>>>>>> address.
> >>>>>>>>>>>>> It is possible to provide an address that uses at most the same
> >>>>>>>>>>> number
> >>>>>>>>>>> of bits, however it is significantly more computationally expensive
> >>>>>>>>>>> to
> >>>>>>>>>>> provide that number rather than setting the max to be the hint
> >>>>>>>>>>> address.
> >>>>>>>>>>> There is the instruction clz/clzw in Zbb that returns the highest
> >>>>>>>>>>> set
> >>>>>>>>>>> bit
> >>>>>>>>>>> which could be used to performantly implement this, but it would
> >>>>>>>>>>> still
> >>>>>>>>>>> be slower than the current implementation. At worst case, half of
> >>>>>>>>>>> the
> >>>>>>>>>>> address would not be able to be allocated when a hint address is
> >>>>>>>>>>> provided.
> >>>>>>>>>>>>> Signed-off-by: Charlie Jenkins<charlie@rivosinc.com>
> >>>>>>>>>>> ---
> >>>>>>>>>>> arch/riscv/include/asm/processor.h | 27 +++++++++++---------------
> >>>>>>>>>>> -
> >>>>>>>>>>> 1 file changed, 11 insertions(+), 16 deletions(-)
> >>>>>>>>>>>>> diff --git a/arch/riscv/include/asm/processor.h
> >>>>>>>>>>> b/arch/riscv/include/asm/processor.h
> >>>>>>>>>>> index f19f861cda54..8ece7a8f0e18 100644
> >>>>>>>>>>> --- a/arch/riscv/include/asm/processor.h
> >>>>>>>>>>> +++ b/arch/riscv/include/asm/processor.h
> >>>>>>>>>>> @@ -14,22 +14,16 @@
> >>>>>>>>>>> 
> >>>>>>>>>>> #include <asm/ptrace.h>
> >>>>>>>>>>> 
> >>>>>>>>>>> -#ifdef CONFIG_64BIT
> >>>>>>>>>>> -#define DEFAULT_MAP_WINDOW    (UL(1) << (MMAP_VA_BITS - 1))
> >>>>>>>>>>> -#define STACK_TOP_MAX        TASK_SIZE_64
> >>>>>>>>>>> -
> >>>>>>>>>>> #define arch_get_mmap_end(addr, len, flags)            \
> >>>>>>>>>>> ({                                \
> >>>>>>>>>>>     unsigned long
> >>>>>>>>>>> mmap_end;                    \
> >>>>>>>>>>>     typeof(addr) _addr = (addr);                \
> >>>>>>>>>>> -    if ((_addr) == 0 || (IS_ENABLED(CONFIG_COMPAT) &&
> >>>>>>>>>>> is_compat_task())) \
> >>>>>>>>>>> +    if ((_addr) == 0 ||                    \
> >>>>>>>>>>> +        (IS_ENABLED(CONFIG_COMPAT) && is_compat_task()) ||    \
> >>>>>>>>>>> +        ((_addr + len) > BIT(VA_BITS -
> >>>>>>>>>>> 1)))            \
> >>>>>>>>>>>         mmap_end = STACK_TOP_MAX;            \
> >>>>>>>>>>> -    else if ((_addr) >= VA_USER_SV57) \
> >>>>>>>>>>> -        mmap_end = STACK_TOP_MAX;            \
> >>>>>>>>>>> -    else if ((((_addr) >= VA_USER_SV48)) && (VA_BITS >=
> >>>>>>>>>>> VA_BITS_SV48)) \
> >>>>>>>>>>> -        mmap_end = VA_USER_SV48;            \
> >>>>>>>>>>>     else                            \
> >>>>>>>>>>> -        mmap_end = VA_USER_SV39;            \
> >>>>>>>>>>> +        mmap_end = (_addr + len);            \
> >>>>>>>>>>>     mmap_end;                        \
> >>>>>>>>>>> })
> >>>>>>>>>>> 
> >>>>>>>>>>> @@ -39,17 +33,18 @@
> >>>>>>>>>>>     typeof(addr) _addr = (addr);                \
> >>>>>>>>>>>     typeof(base) _base = (base);                \
> >>>>>>>>>>>     unsigned long rnd_gap = DEFAULT_MAP_WINDOW - (_base);    \
> >>>>>>>>>>> -    if ((_addr) == 0 || (IS_ENABLED(CONFIG_COMPAT) &&
> >>>>>>>>>>> is_compat_task())) \
> >>>>>>>>>>> +    if ((_addr) == 0 ||                    \
> >>>>>>>>>>> +        (IS_ENABLED(CONFIG_COMPAT) && is_compat_task()) ||    \
> >>>>>>>>>>> +        ((_addr + len) > BIT(VA_BITS -
> >>>>>>>>>>> 1)))            \
> >>>>>>>>>>>         mmap_base = (_base);                \
> >>>>>>>>>>> -    else if (((_addr) >= VA_USER_SV57) && (VA_BITS >=
> >>>>>>>>>>> VA_BITS_SV57)) \
> >>>>>>>>>>> -        mmap_base = VA_USER_SV57 - rnd_gap; \
> >>>>>>>>>>> -    else if ((((_addr) >= VA_USER_SV48)) && (VA_BITS >=
> >>>>>>>>>>> VA_BITS_SV48)) \
> >>>>>>>>>>> -        mmap_base = VA_USER_SV48 - rnd_gap; \
> >>>>>>>>>>>     else                            \
> >>>>>>>>>>> -        mmap_base = VA_USER_SV39 - rnd_gap; \
> >>>>>>>>>>> +        mmap_base = (_addr + len) - rnd_gap; \
> >>>>>>>>>>>     mmap_base;                        \
> >>>>>>>>>>> })
> >>>>>>>>>>> 
> >>>>>>>>>>> +#ifdef CONFIG_64BIT
> >>>>>>>>>>> +#define DEFAULT_MAP_WINDOW    (UL(1) << (MMAP_VA_BITS - 1))
> >>>>>>>>>>> +#define STACK_TOP_MAX        TASK_SIZE_64
> >>>>>>>>>>> #else
> >>>>>>>>>>> #define DEFAULT_MAP_WINDOW    TASK_SIZE
> >>>>>>>>>>> #define STACK_TOP_MAX        TASK_SIZE
> >>>>>>>>>>>>> I have carefully tested your patch on qemu with sv57. A
> >>>>>>>>> bug that
> >>>>>>>>>> needs
> >>>>>>>>>> to be solved is that mmap with the same hint address without
> >>>>>>>>>> MAP_FIXED
> >>>>>>>>>> set will fail the second time.
> >>>>>>>>>>> Userspace code to reproduce the bug:
> >>>>>>>>>>> #include <sys/mman.h>
> >>>>>>>>>> #include <stdio.h>
> >>>>>>>>>> #include <stdint.h>
> >>>>>>>>>>> void test(char *addr) {
> >>>>>>>>>>    char *res = mmap(addr, 4096, PROT_READ | PROT_WRITE,
> >>>>>>>>>> MAP_ANONYMOUS
> >>>>>>>>>>> MAP_PRIVATE, -1, 0);
> >>>>>>>>>>    printf("hint %p got %p.\n", addr, res);
> >>>>>>>>>> }
> >>>>>>>>>>> int main (void) {
> >>>>>>>>>>    test(1<<30);
> >>>>>>>>>>    test(1<<30);
> >>>>>>>>>>    test(1<<30);
> >>>>>>>>>>    return 0;
> >>>>>>>>>> }
> >>>>>>>>>>> output:
> >>>>>>>>>>> hint 0x40000000 got 0x40000000.
> >>>>>>>>>> hint 0x40000000 got 0xffffffffffffffff.
> >>>>>>>>>> hint 0x40000000 got 0xffffffffffffffff.
> >>>>>>>>>>> output on x86:
> >>>>>>>>>>> hint 0x40000000 got 0x40000000.
> >>>>>>>>>> hint 0x40000000 got 0x7f9171363000.
> >>>>>>>>>> hint 0x40000000 got 0x7f9171362000.
> >>>>>>>>>>> It may need to implement a special arch_get_unmapped_area and
> >>>>>>>>>> arch_get_unmapped_area_topdown function.
> >>>>>>>>>> 
> >>>>>>>>> This is because hint address < rnd_gap. I have tried to let mmap_base =
> >>>>>>>>> min((_addr + len), (base) + TASK_SIZE - DEFAULT_MAP_WINDOW). However it
> >>>>>>>>> does not work for bottom-up while ulimit -s is unlimited. You said this
> >>>>>>>>> behavior is expected from patch v2 review. However it brings a new
> >>>>>>>>> regression even on sv39 systems.
> >>>>>>>>> 
> >>>>>>>>> I still don't know the reason why use addr+len as the upper-bound. I
> >>>>>>>>> think solution like x86/arm64/powerpc provide two address space switch
> >>>>>>>>> based on whether hint address above the default map window is enough.
> >>>>>>>>> 
> >>>>>>>> Yep this is expected. It is up to the maintainers to decide.
> >>>>>>> Sorry I forgot to reply to this, I had a buffer sitting around somewhere
> >>>>>>> but I must have lost it.
> >>>>>>> 
> >>>>>>> I think Charlie's approach is the right way to go.  Putting my userspace
> >>>>>>> hat on, I'd much rather have my allocations fail rather than silently
> >>>>>>> ignore the hint when there's memory pressure.
> >>>>>>> 
> >>>>>>> If there's some real use case that needs these low hints to be silently
> >>>>>>> ignored under VA pressure then we can try and figure something out that
> >>>>>>> makes those applications work.
> >>>>>> I could confirm that this patch has broken chromium's partition allocator on
> >>>>>> riscv64. The minimal reproduction I use is chromium-mmap.c:
> >>>>>> 
> >>>>>> #include <stdio.h>
> >>>>>> #include <sys/mman.h>
> >>>>>> 
> >>>>>> int main() {
> >>>>>>    void* expected = (void*)0x400000000;
> >>>>>>    void* addr = mmap(expected, 17179869184, PROT_NONE,
> >>>>>> MAP_PRIVATE|MAP_ANONYMOUS, -1, 0);
> >>>>>>    if (addr != expected) {
> >>>>> It is not valid to assume that the address returned by mmap will be the
> >>>>> hint address. If the hint address is not available, mmap will return a
> >>>>> different address.
> >>>> 
> >>>> Oh, sorry I didn't make it clear what is the expected behavior.
> >>>> The printf here is solely for debugging purpose and I don't mean that
> >>>> chromium expect it will get the hint address. The expected behavior is
> >>>> that both the two mmap calls will succeed.
> >>>> 
> >>>>>>        printf("Not expected address: %p != %p\n", addr, expected);
> >>>>>>    }
> >>>>>>    expected = (void*)0x3fffff000;
> >>>>>>    addr = mmap(expected, 17179873280, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS,
> >>>>>> -1, 0);
> >>>>>>    if (addr != expected) {
> >>>>>>        printf("Not expected address: %p != %p\n", addr, expected);
> >>>>>>    }
> >>>>>>    return 0;
> >>>>>> }
> >>>>>> 
> >>>>>> The second mmap fails with ENOMEM. Manually reverting this commit fixes the
> >>>>>> issue for me. So I think it's clearly a regression and breaks userspace.
> >>>>>> 
> >>>>> The issue here is that overlapping memory is being requested. This
> >>>>> second mmap will never be able to provide an address at 0x3fffff000 with
> >>>>> a size of 0x400001000 since mmap just provided an address at 0x400000000
> >>>>> with a size of 0x400000000.
> >>>>> 
> >>>>> Before this patch, this request causes mmap to return a completely
> >>>>> arbitrary value. There is no reason to use a hint address in this manner
> >>>>> because the hint can never be respected. Since an arbitrary address is
> >>>>> desired, a hint of zero should be used.
> >>>>> 
> >>>>> This patch causes the behavior to be more deterministic. Instead of
> >>>>> providing an arbitrary address, it causes the address to be less than or
> >>>>> equal to the hint address. This allows for applications to make
> >>>>> assumptions about the returned address.
> >>>> 
> >>>> About the overlap, of course the partition allocator's request for
> >>>> overlapped vma seems unreasonable.
> >>>> 
> >>>> But I still don't quite understand why mmap cannot use an address higher
> >>>> than the hint address.
> >>>> The hint address, after all, is a hint, not a requirement.
> >>>> 
> >>>> Quoting the man page:
> >>>> 
> >>>>>  If another mapping already exists there, the kernel picks
> >>>>>       a new address that may or may not depend on the hint.  The
> >>>>>       address of the new mapping is returned as the result of the call.
> >>>> 
> >>>> So for casual programmers that only reads man page but not architecture
> >>>> specific kernel documentation, the current behavior of mmap on riscv64
> >>>> failing on overlapped address ranges are quite surprising IMO.
> >>>> 
> >>>> And quoting the man page again about the errno:
> >>>> 
> >>>>>      ENOMEM No memory is available.
> >>>>> 
> >>>>>      ENOMEM The process's maximum number of mappings would have been
> >>>>>             exceeded.  This error can also occur for munmap(), when
> >>>>>             unmapping a region in the middle of an existing mapping,
> >>>>>             since this results in two smaller mappings on either side
> >>>>>             of the region being unmapped.
> >>>>> 
> >>>>>      ENOMEM (since Linux 4.7) The process's RLIMIT_DATA limit,
> >>>>>             described in getrlimit(2), would have been exceeded.
> >>>>> 
> >>>>>      ENOMEM We don't like addr, because it exceeds the virtual address
> >>>>>             space of the CPU.
> >>>>> 
> >>>> 
> >>>> There's no matching description for the ENOMEM returned here.
> >>>> I would suggest removing "because it exceeds the virtual address
> >>>> space of the CPU." from the last item if the ENOMEM behavior here
> >>>> is expected.
> >>>> 
> >>>>> This code is unfortunately relying on the previously mostly undefined
> >>>>> behavior of the hint address in mmap.
> >>>> 
> >>>> Although I haven't read the code of chromium's partition allocator to
> >>>> judge whether it should
> >>>> be improved or fixed for riscv64, I do know that the kernel "don't break
> >>>> userspace" and "never EVER blame the user programs".
> >>> 
> >>> Ya, sorry for breaking stuff.
> >>> 
> >>> The goal here was to move to the mmap flag behavor similar to what arm64 and x86 have, as that was done in a way that didn't appear to break userspace -- or at least any real userspace programs.  IIRC that first test was pretty broken (it actually depended on the hint address), but sounds like that's not the case.
> >>> 
> >>> I think maybe this is just luck: we didn't chunk the address space up, we're just hinting on every bit, so we're just more likely to hit the exhaustion.  Doesn't really matter, though, as if it's breaking stuff so we've got to deal with it.
> >>> 
> >>> Charlie and I are just talking, and best we can come up with is to move to the behavior where we fall back to larger allocation regions when there's no space in the smaller allocation region. 
> >> 
> >> 
> >> For this solution, the only difference from the mmap behavior of
> >> x86 and aarch64 is that we will first try to allocate some memory
> >> from an address less or equal to the request address + size. But
> >> for most cases, I think there is no need to do that, especially for
> >> those addresses < BIT(47), as most program works fine on x86-64,
> >> which has 47bit available userspace address space to use. And for
> >> that program that wants an address < BIT(32), we already have
> >> MAP_32BIT now.
> >> 
> >> I think we can just fix like that patch:
> >> https://lore.kernel.org/lkml/tencent_B2D0435BC011135736262764B511994F4805@qq.com/
> > 
> > This patch does not satisfy the requirement of having the ability to guarantee
> > that mmap returns an address that is less than the hint address.
> 
> Indeed. My intuition is to remove it and align it with x86 and aarch64.
> 
> > This
> > patch only allows an address to be less than the DEFAULT_MAP_WINDOW
> > which is 32 bits on sv32, 39 bits on sv39, and 48 bits on sv48 or sv57.
> > 
> > This patch also again falls into the trap of using the hint address to
> > forcefully restrict the address space.
> 
> Indeed. However, x86 and aarch64 also use this behavior to restrict
> va >= BIT(47) by default unless we have the hint address larger
> than BIT(47).
> 
> > I agree with Levi that it is not
> > very good behavior to have a "hint" cause mmap to fail if conforming to
> > the hint isn't possible. Instead, I believe it to be more logical to try
> > to allocate at the hint address, otherwise give a random address.
> > 
> 
> I also agree with this.
> 
> > The current behavior can then be maintained through the flag
> > MAP_BELOW_HINT. This way the user explicitly selects that they want mmap
> > to fail if an address could not be found within the hint address
> > constraints.
> > 
> 
> I think restricting the addresses with the MAP_BELOW_HINT flag
> would be the best choice. However, it remains a problem: What should
> the behavior be when there is no MAP_BELOW_HINT? I think we can
> fallback to Sv48 on the Sv57 machine by default to align with x86
> and aarch64.

Although that is the behavior on other architectures, I am hesitant to
follow it because it is a somewhat arbitrary restriction. With a generic
flag that can force mmap to provide exactly the number of bits that an
application needs, there is no need for this restriction on riscv. It
may cause problems for applications running on sv57 hardware, however:

1. sv57 hardware does not exist yet

2. A hint address would still be required if following the same behavior
as other architectures.
	a. It would aid in the porting of an application to sv57
	hardware, but I am not sure that forcing this restriction is
	worth having this one piece of parity. Applications using the
	proposed generic flag would work as expected on all
	architectures as well.

> 
> > - Charlie
> > 
> >> 
> >>> Charlie's going to try and throw together a patch for that, hopefully it'll sort things out.
> >>> 
> >>>>> The goal of this patch is to help
> >>>>> developers have more consistent mmap behavior, but maybe it is necessary
> >>>>> to hide this behavior behind an mmap flag.
> >>>> 
> >>>> Thank you for helping to shape a more consistent mmap behavior.
> >>>> I think this should be fixed ASAP either by allowing the hint address to
> >>>> be ignored
> >>>> (as suggested by the Linux man page), or hide this behavior behind an
> >>>> mmap flag as you said.
> >>>> 
> >>>>> - Charlie
> >>>>> 
> >>>>>> See alsohttps://github.com/riscv-forks/electron/issues/4
> >>>>>> 
> >>>>>>>> - Charlie
> >>>>>> Sincerely,
> >>>>>> Levi
> >>>>>> 
> >>>> 
> >>>> I accidentally introduced some HTML into this reply so this reply is
> >>>> resent as plain text.
> >>>> 
> >>>> Sincerely,
> >>>> Levi
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
