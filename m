Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA402C433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Apr 2022 01:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=uadRrOzjeEbXduytN9+60Ats4sVghxwQ46JCvoiQww0=; b=0uBt7hViJPeEZ91SBOmyYAy8hU
	0bOmLErsdHMygMM84FutM7yRWOBs9DK8xqf17gyoBO8cWextOlsTtaaRswEGIsf9mxxusCngE0cL/
	PYZ6pyltvq+GQqz8kLh3SCGl/wPCCwY0Y6rv8SbleYE1AKMo5nOQpL1/fZB9gnprhOFJsChQSN1w7
	JQ3mZHdaes2XWrgn+08ZUQ1PQjz9Wxw/Tv/BcGeTuNLqAScEby0c9iPAeQi7GCrzhiEOfhn05OIH+
	kuH30ycweNrGehonDy4yX2l/bu/VYsFGJ1Ib5/ujxn3PIP8C5wjFXq3al/vXPkyJ91jIwghy8FMqT
	FjsAuYig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ni4vG-003Cl1-6e; Sat, 23 Apr 2022 01:50:54 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ni4vB-003Cjc-4f
 for linux-riscv@lists.infradead.org; Sat, 23 Apr 2022 01:50:51 +0000
Received: by mail-pf1-x436.google.com with SMTP id x80so9587705pfc.1
 for <linux-riscv@lists.infradead.org>; Fri, 22 Apr 2022 18:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=iuHt4Iz4FeZBvfTekgoBxhqf7wWZiBSKlKE/b+2tuYo=;
 b=goIqv8VMZbjl/c21Jd/hdMFrKYsyG7ZmdvPyMP0a/LfpPFogQ2pz0rqGGlL/AbTqAs
 9pSaiVPXATwgYFD5N5J3yDUb/pSsg0GPEKelq16yimQnW972dgloHJe65mdFFqD9Do1K
 rfbVg7wta3owfIXNgtPf9exTJ5PLWsXRn7YHotwHXiR3Lkj659kCquaRDrj310oN7KKB
 jMZM6HpvA98IESGZVPUiQud4tbPccE2u3eNVzqTqrXy3s0yTKF6yVKnJ7iGeA60/fd96
 +GWnu5/SHFOm3yjfGlSdAu7G7dd4BdX/igL9srOjG3lvbYLAaHSMkweQg27Zn7pzyHq/
 VUDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=iuHt4Iz4FeZBvfTekgoBxhqf7wWZiBSKlKE/b+2tuYo=;
 b=kgZ70Bqd8INVm4Vfk8yhErUwrKknAwjWzk5KZphyBefBjm98SzgC86FFkTHPqDrZ6T
 76GTvpEVuOPyLf/8naMqlTNM22iNr3ixrNPYyRQq62qZyTK1CRetMtZLycyPmA9Ct/uK
 2ji0tw0QYW6Q8B9E9PIRo7o3II/Xd+kewoUsupy+N63hmLKadHZX0Or9Ta3pTleqiKpF
 KmOQuLexx2NdYdlLcCLKFQd/oYIzaCdvPw9Q0l3lsFDBTWUvUe6jhCVO19dxJPgvF74V
 1D9DoQwJM2cFxXGwhyvdb+wqPWCkE/rUH2gdiiLfvX38zF2UNVxuDWahAdMwSwuBTOdf
 +Ceg==
X-Gm-Message-State: AOAM530WP2sQ3rxvll9DVgSuhIvwaBdFaMFYgOqmWX9NJc74mYEGKSfI
 /efWkJxlE9E0Ns5tAsQDS6lmLg==
X-Google-Smtp-Source: ABdhPJxJGqglrviMvw8Swe1RM63k2IYS5w00YAqVduQcH5u9WbhL2yia4TEU96zrIIxxdu1APdK0XA==
X-Received: by 2002:a63:c5:0:b0:3aa:9882:9f91 with SMTP id
 188-20020a6300c5000000b003aa98829f91mr6164187pga.574.1650678648423; 
 Fri, 22 Apr 2022 18:50:48 -0700 (PDT)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 123-20020a620681000000b004fa7c20d732sm3684931pfg.133.2022.04.22.18.50.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 18:50:47 -0700 (PDT)
Date: Fri, 22 Apr 2022 18:50:47 -0700 (PDT)
X-Google-Original-Date: Fri, 22 Apr 2022 18:50:27 PDT (-0700)
Subject: Re: [PATCH v3 00/13] Introduce sv48 support without relocatable kernel
In-Reply-To: <CA+zEjCuyEsB0cHoL=zepejcRbn9Rwg9nRXLMZCOXe_daSWbvig@mail.gmail.com>
CC: corbet@lwn.net, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, 
 zong.li@sifive.com, anup@brainfault.org, Atish.Patra@rivosinc.com,
 Christoph Hellwig <hch@lst.de>, 
 ryabinin.a.a@gmail.com, glider@google.com, andreyknvl@gmail.com,
 dvyukov@google.com, ardb@kernel.org, 
 Arnd Bergmann <arnd@arndb.de>, keescook@chromium.org, guoren@linux.alibaba.com,
 heinrich.schuchardt@canonical.com, mchitale@ventanamicro.com,
 panqinglin2020@iscas.ac.cn, 
 linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, 
 kasan-dev@googlegroups.com, linux-efi@vger.kernel.org,
 linux-arch@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alexandre.ghiti@canonical.com
Message-ID: <mhng-f386a42e-77d9-4644-914f-552a8e721f5c@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_185049_416388_2E18582C 
X-CRM114-Status: GOOD (  62.61  )
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

On Fri, 01 Apr 2022 05:56:30 PDT (-0700), alexandre.ghiti@canonical.com wrote:
> On Fri, Feb 18, 2022 at 11:45 AM Alexandre Ghiti
> <alexandre.ghiti@canonical.com> wrote:
>>
>> Hi Palmer,
>>
>> On Thu, Jan 20, 2022 at 11:05 AM Alexandre Ghiti
>> <alexandre.ghiti@canonical.com> wrote:
>> >
>> > On Thu, Jan 20, 2022 at 8:30 AM Alexandre Ghiti
>> > <alexandre.ghiti@canonical.com> wrote:
>> > >
>> > > On Thu, Jan 20, 2022 at 5:18 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>> > > >
>> > > > On Mon, 06 Dec 2021 02:46:44 PST (-0800), alexandre.ghiti@canonical.com wrote:
>> > > > > * Please note notable changes in memory layouts and kasan population *
>> > > > >
>> > > > > This patchset allows to have a single kernel for sv39 and sv48 without
>> > > > > being relocatable.
>> > > > >
>> > > > > The idea comes from Arnd Bergmann who suggested to do the same as x86,
>> > > > > that is mapping the kernel to the end of the address space, which allows
>> > > > > the kernel to be linked at the same address for both sv39 and sv48 and
>> > > > > then does not require to be relocated at runtime.
>> > > > >
>> > > > > This implements sv48 support at runtime. The kernel will try to
>> > > > > boot with 4-level page table and will fallback to 3-level if the HW does not
>> > > > > support it. Folding the 4th level into a 3-level page table has almost no
>> > > > > cost at runtime.
>> > > > >
>> > > > > Note that kasan region had to be moved to the end of the address space
>> > > > > since its location must be known at compile-time and then be valid for
>> > > > > both sv39 and sv48 (and sv57 that is coming).
>> > > > >
>> > > > > Tested on:
>> > > > >   - qemu rv64 sv39: OK
>> > > > >   - qemu rv64 sv48: OK
>> > > > >   - qemu rv64 sv39 + kasan: OK
>> > > > >   - qemu rv64 sv48 + kasan: OK
>> > > > >   - qemu rv32: OK
>> > > > >
>> > > > > Changes in v3:
>> > > > >   - Fix SZ_1T, thanks to Atish
>> > > > >   - Fix warning create_pud_mapping, thanks to Atish
>> > > > >   - Fix k210 nommu build, thanks to Atish
>> > > > >   - Fix wrong rebase as noted by Samuel
>> > > > >   - * Downgrade to sv39 is only possible if !KASAN (see commit changelog) *
>> > > > >   - * Move KASAN next to the kernel: virtual layouts changed and kasan population *
>> > > > >
>> > > > > Changes in v2:
>> > > > >   - Rebase onto for-next
>> > > > >   - Fix KASAN
>> > > > >   - Fix stack canary
>> > > > >   - Get completely rid of MAXPHYSMEM configs
>> > > > >   - Add documentation
>> > > > >
>> > > > > Alexandre Ghiti (13):
>> > > > >   riscv: Move KASAN mapping next to the kernel mapping
>> > > > >   riscv: Split early kasan mapping to prepare sv48 introduction
>> > > > >   riscv: Introduce functions to switch pt_ops
>> > > > >   riscv: Allow to dynamically define VA_BITS
>> > > > >   riscv: Get rid of MAXPHYSMEM configs
>> > > > >   asm-generic: Prepare for riscv use of pud_alloc_one and pud_free
>> > > > >   riscv: Implement sv48 support
>> > > > >   riscv: Use pgtable_l4_enabled to output mmu_type in cpuinfo
>> > > > >   riscv: Explicit comment about user virtual address space size
>> > > > >   riscv: Improve virtual kernel memory layout dump
>> > > > >   Documentation: riscv: Add sv48 description to VM layout
>> > > > >   riscv: Initialize thread pointer before calling C functions
>> > > > >   riscv: Allow user to downgrade to sv39 when hw supports sv48 if !KASAN
>> > > > >
>> > > > >  Documentation/riscv/vm-layout.rst             |  48 ++-
>> > > > >  arch/riscv/Kconfig                            |  37 +-
>> > > > >  arch/riscv/configs/nommu_k210_defconfig       |   1 -
>> > > > >  .../riscv/configs/nommu_k210_sdcard_defconfig |   1 -
>> > > > >  arch/riscv/configs/nommu_virt_defconfig       |   1 -
>> > > > >  arch/riscv/include/asm/csr.h                  |   3 +-
>> > > > >  arch/riscv/include/asm/fixmap.h               |   1
>> > > > >  arch/riscv/include/asm/kasan.h                |  11 +-
>> > > > >  arch/riscv/include/asm/page.h                 |  20 +-
>> > > > >  arch/riscv/include/asm/pgalloc.h              |  40 ++
>> > > > >  arch/riscv/include/asm/pgtable-64.h           | 108 ++++-
>> > > > >  arch/riscv/include/asm/pgtable.h              |  47 +-
>> > > > >  arch/riscv/include/asm/sparsemem.h            |   6 +-
>> > > > >  arch/riscv/kernel/cpu.c                       |  23 +-
>> > > > >  arch/riscv/kernel/head.S                      |   4 +-
>> > > > >  arch/riscv/mm/context.c                       |   4 +-
>> > > > >  arch/riscv/mm/init.c                          | 408 ++++++++++++++----
>> > > > >  arch/riscv/mm/kasan_init.c                    | 250 ++++++++---
>> > > > >  drivers/firmware/efi/libstub/efi-stub.c       |   2
>> > > > >  drivers/pci/controller/pci-xgene.c            |   2 +-
>> > > > >  include/asm-generic/pgalloc.h                 |  24 +-
>> > > > >  include/linux/sizes.h                         |   1
>> > > > >  22 files changed, 833 insertions(+), 209 deletions(-)
>> > > >
>> > > > Sorry this took a while.  This is on for-next, with a bit of juggling: a
>> > > > handful of trivial fixes for configs that were failing to build/boot and
>> > > > some merge issues.  I also pulled out that MAXPHYSMEM fix to the top, so
>> > > > it'd be easier to backport.  This is bigger than something I'd normally like to
>> > > > take late in the cycle, but given there's a lot of cleanups, likely some fixes,
>> > > > and it looks like folks have been testing this I'm just going to go with it.
>> > > >
>> > >
>> > > Yes yes yes! That's fantastic news :)
>> > >
>> > > > Let me know if there's any issues with the merge, it was a bit hairy.
>> > > > Probably best to just send along a fixup patch at this point.
>> > >
>> > > I'm going to take a look at that now, and I'll fix anything that comes
>> > > up quickly :)
>> >
>> > I see in for-next that you did not take the following patches:
>> >
>> >   riscv: Improve virtual kernel memory layout dump
>> >   Documentation: riscv: Add sv48 description to VM layout
>> >   riscv: Initialize thread pointer before calling C functions
>> >   riscv: Allow user to downgrade to sv39 when hw supports sv48 if !KASAN
>> >
>> > I'm not sure this was your intention. If it was, I believe that at
>> > least the first 2 patches are needed in this series, the 3rd one is a
>> > useful fix and we can discuss the 4th if that's an issue for you.
>>
>> Can you confirm that this was intentional and maybe explain the
>> motivation behind it? Because I see value in those patches.
>
> Palmer,
>
> I read that you were still taking patches for 5.18, so I confirm again
> that the patches above are needed IMO.

It was too late for this when it was sent (I saw it then, but just got 
around to actually doing the work to sort it out).

It took me a while to figure out exactly what was going on here, but I 
think I remember now: that downgrade patch (and the follow-on I just 
sent) is broken for medlow, because mm/init.c must be built medany 
(which we're using for the mostly-PIC qualities).  I remember being in 
the middle of rebasing/debugging this a while ago, I must have forgotten 
I was in the middle of that and accidentally merged the branch as-is.  
Certainly wasn't trying to silently take half the patch set and leave 
the rest in limbo, that's the wrong way to do things. 

I'm not sure what the right answer is here, but I just sent a patch to 
drop support for medlow.  We'll have to talk about that, for now I 
cleaned up some other minor issues, rearranged that docs and fix to come 
first, and put this at palmer/riscv-sv48.  I think that fix is 
reasonable to take the doc and fix into fixes, then the dump improvement 
on for-next.  We'll have to see what folks think about the medany-only 
kernels, the other option would be to build FDT as medany which seems a 
bit awkward.  

> Maybe even the relocatable series?

Do you mind giving me a pointer?  I'm not sure why I'm so drop-prone 
with your patches, I promise I'm not doing it on purpose.

>
> Thanks,
>
> Alex
>
>>
>> Thanks,
>>
>> Alex
>>
>> >
>> > I tested for-next on both sv39 and sv48 successfully, I took a glance
>> > at the code and noticed you fixed the PTRS_PER_PGD error, thanks for
>> > that. Otherwise nothing obvious has popped.
>> >
>> > Thanks again,
>> >
>> > Alex
>> >
>> > >
>> > > Thanks!
>> > >
>> > > Alex
>> > >
>> > > >
>> > > > Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
