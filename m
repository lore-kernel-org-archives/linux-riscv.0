Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAE4BC43334
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jun 2022 03:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=klNh/NPikPqyvLlojVPoSW4j2MhS4Rk9DzCAeCTFJOM=; b=0DeKo9t4cfgMsAsry9WWIP28rZ
	HujKuSHnlVyh5JmblkPW/ZHxN3HDLzO5/i4sC/JNkAoGNYZOzU02AJdzk1bO/ZZuaFJcuYP24a0dx
	RtK5BeZ9p1RxlaaY+LSwkUBbztuMcSgoYVTp5wXFG3NGT4dQufZLvPEp3HXePQ58qSne81Q/NJS4S
	6YmOoLtIiK8elVbKhFYARtep/9ayos9Fl66EpyPSJYuGIPLqUtZhlJE0lvJHsXJlyA2ly7W+K2SW3
	HGVi2rS4O5xAfItrpJBVCBaJlOfsgDLAKdvcFaNgWQ2/pwb997r5EBDqcscI2WZh01jzVAJAKswdN
	nz4WQGkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwbkk-001GQr-EO; Thu, 02 Jun 2022 03:44:06 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwbkg-001GPc-Ls
	for linux-riscv@lists.infradead.org; Thu, 02 Jun 2022 03:44:05 +0000
Received: by mail-pf1-x42d.google.com with SMTP id 15so3676955pfy.3
        for <linux-riscv@lists.infradead.org>; Wed, 01 Jun 2022 20:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=41Cix8/wz/98CXmQSSNUVoc/eGMSQu30WNS71XR8dIw=;
        b=xlIUxlaBeKYzS7iUqyyVg/FYULyNn8vEmUTA5PcIHuIOtLrrU7nbkXrOKP9Lg6mqiK
         W5/9UgFSa3Alf1969E1hbz1M5DB1P5ur5GONVnGfG//sbT+TiORVPZiRTZi5KK4w7bJ+
         pZtm0lUbV42MuWDuh+RlzKGoAVZ8GKtMcfkihTJrye/Nj4Z5HAWOnfKNs7IVmk3cCWey
         ROVwkByRLmZjiOLtcjmmWDuU+1lSkucqYjL6LEafERcG9yUMdkV00JL4uO8flM/XkiLQ
         ya2K1hW0u7leuQU71+7MsxCIP2xAbwHayNxOkSNT9fSUqUwPxMYp3R0LzC5Od+CIBSzI
         ZF6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=41Cix8/wz/98CXmQSSNUVoc/eGMSQu30WNS71XR8dIw=;
        b=m8jFIVP0ll2zUaPR3eCTMNwAXDeJf9aoxlXtZTFzXi7Z56YE5UkUvQlw9doIlAP0uR
         USj6LiOEW5Preouw6ckB44fctWE8xgl13tYnmPMF5azR9TIu/wtT9lPj63GI90aXHt/q
         5C671iVlJGC+sEfMwp8N/Aav8NrnQ3cFUoONwBME0AWr7dnc2OD3M6cuH7CAxl2hvkyT
         xmHH4OvMHuLM97ZHQtxrUaK7HhNqwqAepsBOYPL+3q562WMj1uJiCgYxPejr2BtlLpHR
         2sL245C7eZBG+7v7l/DdGxnWkv39hxsFhOzMcbRuFfqiackUA5DjcAGbstnn3icge9gs
         ilkQ==
X-Gm-Message-State: AOAM5330tJ0mTB7fYkbYyrS6J2GYkdb1Qpm8W7aLP+L83I9W29Phw6N6
	zKOyHZDHEgiKEhO1nS+TiWWs+w==
X-Google-Smtp-Source: ABdhPJwj8pNW5zGNYm4XHNrU/V+RpEOW+y5QQGSkxJYkaR5O97+HdBnk7f1z0+QUbeTv16fOV5xp7A==
X-Received: by 2002:a63:6b02:0:b0:3fb:da5e:42a1 with SMTP id g2-20020a636b02000000b003fbda5e42a1mr2388919pgc.273.1654141439808;
        Wed, 01 Jun 2022 20:43:59 -0700 (PDT)
Received: from localhost ([12.3.194.138])
        by smtp.gmail.com with ESMTPSA id g2-20020aa79f02000000b005185407eda5sm2254092pfr.44.2022.06.01.20.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 20:43:59 -0700 (PDT)
Date: Wed, 01 Jun 2022 20:43:59 -0700 (PDT)
X-Google-Original-Date: Wed, 01 Jun 2022 20:40:23 PDT (-0700)
Subject: Re: [PATCH v3 00/13] Introduce sv48 support without relocatable kernel
In-Reply-To: <mhng-f386a42e-77d9-4644-914f-552a8e721f5c@palmer-ri-x1c9>
CC: corbet@lwn.net, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  zong.li@sifive.com, anup@brainfault.org, Atish.Patra@rivosinc.com, Christoph Hellwig <hch@lst.de>,
  ryabinin.a.a@gmail.com, glider@google.com, andreyknvl@gmail.com, dvyukov@google.com, ardb@kernel.org,
  Arnd Bergmann <arnd@arndb.de>, keescook@chromium.org, guoren@linux.alibaba.com,
  heinrich.schuchardt@canonical.com, mchitale@ventanamicro.com, panqinglin2020@iscas.ac.cn,
  linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
  kasan-dev@googlegroups.com, linux-efi@vger.kernel.org, linux-arch@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alexandre.ghiti@canonical.com
Message-ID: <mhng-2ff855c7-1f97-46c9-b692-84ea3735eb05@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_204403_003122_142E6434 
X-CRM114-Status: GOOD (  65.47  )
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

On Fri, 22 Apr 2022 18:50:47 PDT (-0700), Palmer Dabbelt wrote:
> On Fri, 01 Apr 2022 05:56:30 PDT (-0700), alexandre.ghiti@canonical.com wrote:
>> On Fri, Feb 18, 2022 at 11:45 AM Alexandre Ghiti
>> <alexandre.ghiti@canonical.com> wrote:
>>>
>>> Hi Palmer,
>>>
>>> On Thu, Jan 20, 2022 at 11:05 AM Alexandre Ghiti
>>> <alexandre.ghiti@canonical.com> wrote:
>>> >
>>> > On Thu, Jan 20, 2022 at 8:30 AM Alexandre Ghiti
>>> > <alexandre.ghiti@canonical.com> wrote:
>>> > >
>>> > > On Thu, Jan 20, 2022 at 5:18 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>>> > > >
>>> > > > On Mon, 06 Dec 2021 02:46:44 PST (-0800), alexandre.ghiti@canonical.com wrote:
>>> > > > > * Please note notable changes in memory layouts and kasan population *
>>> > > > >
>>> > > > > This patchset allows to have a single kernel for sv39 and sv48 without
>>> > > > > being relocatable.
>>> > > > >
>>> > > > > The idea comes from Arnd Bergmann who suggested to do the same as x86,
>>> > > > > that is mapping the kernel to the end of the address space, which allows
>>> > > > > the kernel to be linked at the same address for both sv39 and sv48 and
>>> > > > > then does not require to be relocated at runtime.
>>> > > > >
>>> > > > > This implements sv48 support at runtime. The kernel will try to
>>> > > > > boot with 4-level page table and will fallback to 3-level if the HW does not
>>> > > > > support it. Folding the 4th level into a 3-level page table has almost no
>>> > > > > cost at runtime.
>>> > > > >
>>> > > > > Note that kasan region had to be moved to the end of the address space
>>> > > > > since its location must be known at compile-time and then be valid for
>>> > > > > both sv39 and sv48 (and sv57 that is coming).
>>> > > > >
>>> > > > > Tested on:
>>> > > > >   - qemu rv64 sv39: OK
>>> > > > >   - qemu rv64 sv48: OK
>>> > > > >   - qemu rv64 sv39 + kasan: OK
>>> > > > >   - qemu rv64 sv48 + kasan: OK
>>> > > > >   - qemu rv32: OK
>>> > > > >
>>> > > > > Changes in v3:
>>> > > > >   - Fix SZ_1T, thanks to Atish
>>> > > > >   - Fix warning create_pud_mapping, thanks to Atish
>>> > > > >   - Fix k210 nommu build, thanks to Atish
>>> > > > >   - Fix wrong rebase as noted by Samuel
>>> > > > >   - * Downgrade to sv39 is only possible if !KASAN (see commit changelog) *
>>> > > > >   - * Move KASAN next to the kernel: virtual layouts changed and kasan population *
>>> > > > >
>>> > > > > Changes in v2:
>>> > > > >   - Rebase onto for-next
>>> > > > >   - Fix KASAN
>>> > > > >   - Fix stack canary
>>> > > > >   - Get completely rid of MAXPHYSMEM configs
>>> > > > >   - Add documentation
>>> > > > >
>>> > > > > Alexandre Ghiti (13):
>>> > > > >   riscv: Move KASAN mapping next to the kernel mapping
>>> > > > >   riscv: Split early kasan mapping to prepare sv48 introduction
>>> > > > >   riscv: Introduce functions to switch pt_ops
>>> > > > >   riscv: Allow to dynamically define VA_BITS
>>> > > > >   riscv: Get rid of MAXPHYSMEM configs
>>> > > > >   asm-generic: Prepare for riscv use of pud_alloc_one and pud_free
>>> > > > >   riscv: Implement sv48 support
>>> > > > >   riscv: Use pgtable_l4_enabled to output mmu_type in cpuinfo
>>> > > > >   riscv: Explicit comment about user virtual address space size
>>> > > > >   riscv: Improve virtual kernel memory layout dump
>>> > > > >   Documentation: riscv: Add sv48 description to VM layout
>>> > > > >   riscv: Initialize thread pointer before calling C functions
>>> > > > >   riscv: Allow user to downgrade to sv39 when hw supports sv48 if !KASAN
>>> > > > >
>>> > > > >  Documentation/riscv/vm-layout.rst             |  48 ++-
>>> > > > >  arch/riscv/Kconfig                            |  37 +-
>>> > > > >  arch/riscv/configs/nommu_k210_defconfig       |   1 -
>>> > > > >  .../riscv/configs/nommu_k210_sdcard_defconfig |   1 -
>>> > > > >  arch/riscv/configs/nommu_virt_defconfig       |   1 -
>>> > > > >  arch/riscv/include/asm/csr.h                  |   3 +-
>>> > > > >  arch/riscv/include/asm/fixmap.h               |   1
>>> > > > >  arch/riscv/include/asm/kasan.h                |  11 +-
>>> > > > >  arch/riscv/include/asm/page.h                 |  20 +-
>>> > > > >  arch/riscv/include/asm/pgalloc.h              |  40 ++
>>> > > > >  arch/riscv/include/asm/pgtable-64.h           | 108 ++++-
>>> > > > >  arch/riscv/include/asm/pgtable.h              |  47 +-
>>> > > > >  arch/riscv/include/asm/sparsemem.h            |   6 +-
>>> > > > >  arch/riscv/kernel/cpu.c                       |  23 +-
>>> > > > >  arch/riscv/kernel/head.S                      |   4 +-
>>> > > > >  arch/riscv/mm/context.c                       |   4 +-
>>> > > > >  arch/riscv/mm/init.c                          | 408 ++++++++++++++----
>>> > > > >  arch/riscv/mm/kasan_init.c                    | 250 ++++++++---
>>> > > > >  drivers/firmware/efi/libstub/efi-stub.c       |   2
>>> > > > >  drivers/pci/controller/pci-xgene.c            |   2 +-
>>> > > > >  include/asm-generic/pgalloc.h                 |  24 +-
>>> > > > >  include/linux/sizes.h                         |   1
>>> > > > >  22 files changed, 833 insertions(+), 209 deletions(-)
>>> > > >
>>> > > > Sorry this took a while.  This is on for-next, with a bit of juggling: a
>>> > > > handful of trivial fixes for configs that were failing to build/boot and
>>> > > > some merge issues.  I also pulled out that MAXPHYSMEM fix to the top, so
>>> > > > it'd be easier to backport.  This is bigger than something I'd normally like to
>>> > > > take late in the cycle, but given there's a lot of cleanups, likely some fixes,
>>> > > > and it looks like folks have been testing this I'm just going to go with it.
>>> > > >
>>> > >
>>> > > Yes yes yes! That's fantastic news :)
>>> > >
>>> > > > Let me know if there's any issues with the merge, it was a bit hairy.
>>> > > > Probably best to just send along a fixup patch at this point.
>>> > >
>>> > > I'm going to take a look at that now, and I'll fix anything that comes
>>> > > up quickly :)
>>> >
>>> > I see in for-next that you did not take the following patches:
>>> >
>>> >   riscv: Improve virtual kernel memory layout dump
>>> >   Documentation: riscv: Add sv48 description to VM layout
>>> >   riscv: Initialize thread pointer before calling C functions
>>> >   riscv: Allow user to downgrade to sv39 when hw supports sv48 if !KASAN
>>> >
>>> > I'm not sure this was your intention. If it was, I believe that at
>>> > least the first 2 patches are needed in this series, the 3rd one is a
>>> > useful fix and we can discuss the 4th if that's an issue for you.
>>>
>>> Can you confirm that this was intentional and maybe explain the
>>> motivation behind it? Because I see value in those patches.
>>
>> Palmer,
>>
>> I read that you were still taking patches for 5.18, so I confirm again
>> that the patches above are needed IMO.
>
> It was too late for this when it was sent (I saw it then, but just got
> around to actually doing the work to sort it out).
>
> It took me a while to figure out exactly what was going on here, but I
> think I remember now: that downgrade patch (and the follow-on I just
> sent) is broken for medlow, because mm/init.c must be built medany
> (which we're using for the mostly-PIC qualities).  I remember being in
> the middle of rebasing/debugging this a while ago, I must have forgotten
> I was in the middle of that and accidentally merged the branch as-is.
> Certainly wasn't trying to silently take half the patch set and leave
> the rest in limbo, that's the wrong way to do things.
>
> I'm not sure what the right answer is here, but I just sent a patch to
> drop support for medlow.  We'll have to talk about that, for now I
> cleaned up some other minor issues, rearranged that docs and fix to come
> first, and put this at palmer/riscv-sv48.  I think that fix is
> reasonable to take the doc and fix into fixes, then the dump improvement
> on for-next.  We'll have to see what folks think about the medany-only
> kernels, the other option would be to build FDT as medany which seems a
> bit awkward.

All but the last one are on for-next, there's some discussion on that 
last one that pointed out some better ways to do it.

>
>> Maybe even the relocatable series?
>
> Do you mind giving me a pointer?  I'm not sure why I'm so drop-prone
> with your patches, I promise I'm not doing it on purpose.
>
>>
>> Thanks,
>>
>> Alex
>>
>>>
>>> Thanks,
>>>
>>> Alex
>>>
>>> >
>>> > I tested for-next on both sv39 and sv48 successfully, I took a glance
>>> > at the code and noticed you fixed the PTRS_PER_PGD error, thanks for
>>> > that. Otherwise nothing obvious has popped.
>>> >
>>> > Thanks again,
>>> >
>>> > Alex
>>> >
>>> > >
>>> > > Thanks!
>>> > >
>>> > > Alex
>>> > >
>>> > > >
>>> > > > Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
