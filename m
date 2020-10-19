Return-Path: <SRS0=hknt=D2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D612C433DF
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Oct 2020 23:38:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89E0E2222F
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Oct 2020 23:38:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3ADIOLZf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="fTz46wi0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89E0E2222F
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=uemW4FNZopKvx/RBR2qq0+dMVnYCrjxrBKGH9mdlg9U=; b=3ADIOLZfholviJTmcw3mKHG+2
	LWpCODl92/1llVza4rlQv60AT5PwqyrMbu+sc7KSWoQ/4RvZitO6cwcYjyqRbV3tn9RRR4L4SpgJy
	xj/1RqF4ixWNvC5/as8E+lhsFr6BjKD4l8X6f6X0JSnZAj4X/8JR+Lw/3cQ3yPespiZQAwOX0NHxh
	ebUdBWfAvf7TXQYVNW4p8kXHhpuodq/erj0/0YVhEi7EjbpnKS+Aj+opsMeu1UEVUCcav+hWJzPgF
	TcsiBmEHq1fiRQlFn4BC6d5YPzI1SaG/Aa6C7VbPFbDL3p7A1/k3PKV5hRuSIE1s8N+++Uy8Xs2yz
	gcsz2ydCA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUejO-0002vq-9D; Mon, 19 Oct 2020 23:38:22 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUejJ-0002v9-Vl
 for linux-riscv@lists.infradead.org; Mon, 19 Oct 2020 23:38:20 +0000
Received: by mail-pj1-x1041.google.com with SMTP id gm14so85873pjb.2
 for <linux-riscv@lists.infradead.org>; Mon, 19 Oct 2020 16:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=mMyOOTA+qM4WB3OIOjM+vOGGfCTR7HflUyF9on66ERI=;
 b=fTz46wi0hX/hafe9fY6bnj1wzDQHVKz304OWwp70trJuXtEsq3NBE+VvS9fswx2ySk
 VmGgf/AxESiP8Q5Re25xBTZ0nzC0eTowKo/vjW5NuOcifnG/DI5ihsNfISQ3bvqa1qnn
 ykkKlTnZ8QItkQFSyP8ymmukcQb4hB5mlFkKlCOrXXYie1LCh8qUnRpbZwCdgeXKZW0C
 2SQrPBcAI7bOWvB1sRAl79jPONoQhjoa0oXhYsVY8XK3TOZPB4/avdMXxAix4vEY0++3
 NH27kP4pYE+SG8e3vuYHX8GdmP6TGIXm7iOHZXihONRVVaQLgbu2s1VtvfLdcadUyZOA
 WSrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=mMyOOTA+qM4WB3OIOjM+vOGGfCTR7HflUyF9on66ERI=;
 b=nyXHb9ZiBMraXYXjMCT0WCRo0fCtwTjf/hcM0d4e2K7I7+FduZCiWs8LvosjxxI88V
 Ig3J6vbjU43wn9lzebVmmUtL/zSN8om6TvsZl7YSDfPh+oI4osuXjbJJRVgxf1n3BeqY
 j4llO7m3kBy9nPC8ZEq39M/PX5DFmwiXVb7iX84xtY5+iBqex0RtKe2brztJtvL0o/EZ
 ykk1l5yTHK6IyO/8W2KNP5BIYVjprPU+FQrtXCN49JOqjY5wiQ12U5r6vOYA5EVKAiID
 ccTqWrHeK97w3S88mmjvxSiMy5mfPZHbUCKdOhr1SlwsDlNq3V0p5mvR+2LH2/86GWAm
 bObQ==
X-Gm-Message-State: AOAM531XgcBCFaxa/VJaG+G8hD/Fqmqo6tfprBN57qfB6zNslXJX8bfa
 QdGjV+7oM/AJnUNkwspuFbWIEhhuSPP/1Av5
X-Google-Smtp-Source: ABdhPJwjCCG6LX/pjQJTuF7rncGuieqnBd8IEbtSRb49e4/4aqM4+E9+1mnzLK8gWK4uTDqgL4N0AQ==
X-Received: by 2002:a17:902:9681:b029:d5:cdbd:c38c with SMTP id
 n1-20020a1709029681b02900d5cdbdc38cmr86753plp.85.1603150693662; 
 Mon, 19 Oct 2020 16:38:13 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id t5sm582639pgs.74.2020.10.19.16.38.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2020 16:38:12 -0700 (PDT)
Date: Mon, 19 Oct 2020 16:38:12 -0700 (PDT)
X-Google-Original-Date: Mon, 19 Oct 2020 16:37:21 PDT (-0700)
Subject: Re: [PATCH] RISC-V: Fix the VDSO symbol generaton for binutils-2.34+
In-Reply-To: <20201019204121.jaw7mqn4bkn2h6mx@google.com>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: maskray@google.com
Message-ID: <mhng-68644eee-bf80-46ee-aecd-466157800f59@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201019_193818_050250_C43296EB 
X-CRM114-Status: GOOD (  27.73  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: kernel-team@android.com, linux-riscv@lists.infradead.org,
 Nick Desaulniers <ndesaulniers@google.com>, stable@vger.kernel.org,
 clang-built-linux@googlegroups.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 19 Oct 2020 13:41:21 PDT (-0700), maskray@google.com wrote:
> On 2020-10-19, 'Nick Desaulniers' via Clang Built Linux wrote:
>>On Fri, Oct 16, 2020 at 5:44 PM 'Palmer Dabbelt' via Clang Built Linux
>><clang-built-linux@googlegroups.com> wrote:
>>>
>>> We were relying on GNU ld's ability to re-link executable files in order
>>> to extract our VDSO symbols.  This behavior was deemed a bug as of
>>> binutils-2.34 (specifically the binutils-gdb commit a87e1817a4 ("Have
>>> the linker fail if any attempt to link in an executable is made."),
>>> which IIUC landed in 2.34), which recently installed itself on my build
>>> setup.
>
> I filed the issue https://sourceware.org/bugzilla/show_bug.cgi?id=26047
> The commit is in 2.35 but not in the released 2.34 branch.

Thanks.  Looks like it was backported to the Debian 2.34, I guess I was off by
a release when looking.  Regardless, I think the fix in binutils is reasonable
and that we just shouldn't be doing this sort of thing.

>>> The previous version of this was a bit of a mess: we were linking a
>>> static executable version of the VDSO, containing only a subset of the
>>> input symbols, which we then linked into the kernel.  This worked, but
>>> certainly wasn't a supported path through the toolchain.  Instead this
>>> new version parses the textual output of nm to produce a symbol table.
>>> Both rely on near-zero addresses being linkable, but as we rely on weak
>>> undefined symbols being linkable elsewhere I don't view this as a major
>>> issue.
>>>
>>> Fixes: e2c0cdfba7f6 ("RISC-V: User-facing API")
>>> Cc: stable@vger.kernel.org
>>> Cc: clang-built-linux@googlegroups.com
>>> Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
>>
>>Ah, I do see a build failure to link the vdso with:
>>$ riscv64-linux-gnu-ld --version
>>GNU ld (GNU Binutils for Debian) 2.34.90.20200706
>>
>>riscv64-linux-gnu-ld: cannot use executable file
>>'arch/riscv/kernel/vdso/vdso-dummy.o' as input to a link
>>
>>This patch fixes that for me, but there's a problem related to related
>>to `nm` below.
>>
>>After this, there's two other things we might want to fix up related
>>to the build of the vdso:
>>1. it looks like $(CC) is being used to link the vdso, rather than
>>$(LD).  While it's generally fine to use the compiler as the driver
>>for building a linked object file, it does not respect the set $(LD).
>>`-fuse-ld=` needs to be passed to invoke the linker the user
>>specified.  See also:
>>https://lore.kernel.org/linux-kbuild/20201013033947.2257501-1-natechancellor@gmail.com/T/#u
>>(this has popped up in a few places when trying to do hermetic builds
>>with LLD).
>>2. I observe the warning when building with clang: `argument unused
>>during compilation: '-no-pie' [-Wunused-command-line-argument]`. IIRC,
>>the top level Makefile sets `-Qunused-arguments` for builds with
>>clang.  `cmd_vdsold` may need that, but it's curious why it's unused
>>and makes me wonder why/if `-no-pie` is necessary?  That also might be
>>fixed by fixing 1.
>>
>>> ---
>>>  arch/riscv/kernel/vdso/.gitignore |  1 +
>>>  arch/riscv/kernel/vdso/Makefile   | 19 +++++++++----------
>>>  arch/riscv/kernel/vdso/so2s.sh    |  7 +++++++
>>>  3 files changed, 17 insertions(+), 10 deletions(-)
>>>  create mode 100755 arch/riscv/kernel/vdso/so2s.sh
>>>
>>> diff --git a/arch/riscv/kernel/vdso/.gitignore b/arch/riscv/kernel/vdso/.gitignore
>>> index 11ebee9e4c1d..3a19def868ec 100644
>>> --- a/arch/riscv/kernel/vdso/.gitignore
>>> +++ b/arch/riscv/kernel/vdso/.gitignore
>>> @@ -1,3 +1,4 @@
>>>  # SPDX-License-Identifier: GPL-2.0-only
>>>  vdso.lds
>>>  *.tmp
>>> +vdso-syms.S
>>> diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
>>> index 478e7338ddc1..2e02958f6224 100644
>>> --- a/arch/riscv/kernel/vdso/Makefile
>>> +++ b/arch/riscv/kernel/vdso/Makefile
>>> @@ -43,19 +43,14 @@ $(obj)/vdso.o: $(obj)/vdso.so
>>>  SYSCFLAGS_vdso.so.dbg = $(c_flags)
>>>  $(obj)/vdso.so.dbg: $(src)/vdso.lds $(obj-vdso) FORCE
>>>         $(call if_changed,vdsold)
>>> +SYSCFLAGS_vdso.so.dbg = -shared -s -Wl,-soname=linux-vdso.so.1 \
>>> +       -Wl,--build-id -Wl,--hash-style=both
>>>
>>>  # We also create a special relocatable object that should mirror the symbol
>>>  # table and layout of the linked DSO. With ld --just-symbols we can then
>>>  # refer to these symbols in the kernel code rather than hand-coded addresses.
>>> -
>>> -SYSCFLAGS_vdso.so.dbg = -shared -s -Wl,-soname=linux-vdso.so.1 \
>>> -       -Wl,--build-id -Wl,--hash-style=both
>>> -$(obj)/vdso-dummy.o: $(src)/vdso.lds $(obj)/rt_sigreturn.o FORCE
>>> -       $(call if_changed,vdsold)
>>> -
>>> -LDFLAGS_vdso-syms.o := -r --just-symbols
>>> -$(obj)/vdso-syms.o: $(obj)/vdso-dummy.o FORCE
>>> -       $(call if_changed,ld)
>>> +$(obj)/vdso-syms.S: $(obj)/vdso.so FORCE
>>> +       $(call if_changed,so2s)
>>>
>>>  # strip rule for the .so file
>>>  $(obj)/%.so: OBJCOPYFLAGS := -S
>>> @@ -68,11 +63,15 @@ $(obj)/%.so: $(obj)/%.so.dbg FORCE
>>>  # Make sure only to export the intended __vdso_xxx symbol offsets.
>>>  quiet_cmd_vdsold = VDSOLD  $@
>>>        cmd_vdsold = $(CC) $(KBUILD_CFLAGS) $(call cc-option, -no-pie) -nostdlib -nostartfiles $(SYSCFLAGS_$(@F)) \
>>> -                           -Wl,-T,$(filter-out FORCE,$^) -o $@.tmp && \
>>> +                           -Wl,-T,$(filter-out FORCE,$^) -o $@.tmp -Wl,-Map,$@.map && \
>
> Is -Wl,-Map,$@.map needed?

Nope, that's there be accident.  I've fixed it for the v2.

Thanks!

>
>>>                     $(CROSS_COMPILE)objcopy \
>>>                             $(patsubst %, -G __vdso_%, $(vdso-syms)) $@.tmp $@ && \
>>>                     rm $@.tmp
>>>
>>> +# Extracts
>>> +quiet_cmd_so2s = SO2S    $@
>>> +      cmd_so2s = $(CROSS_COMPILE)nm -D $< | $(src)/so2s.sh > $@
>>
>>This should use `$(NM)` rather than `$(CROSS_COMPILE)nm` which
>>hardcodes the use of GNU nm from GNU binutils.
>>
>>> +
>>>  # install commands for the unstripped file
>>>  quiet_cmd_vdso_install = INSTALL $@
>>>        cmd_vdso_install = cp $(obj)/$@.dbg $(MODLIB)/vdso/$@
>>> diff --git a/arch/riscv/kernel/vdso/so2s.sh b/arch/riscv/kernel/vdso/so2s.sh
>>> new file mode 100755
>>> index 000000000000..7862866b5ebb
>>> --- /dev/null
>>> +++ b/arch/riscv/kernel/vdso/so2s.sh
>>> @@ -0,0 +1,6 @@
>>> +#!/bin/sh
>>> +# SPDX-License-Identifier: GPL-2.0+
>>> +# Copyright 2020 Palmer Dabbelt <palmerdabbelt@google.com>
>>> +
>>> +sed 's!\([0-9a-f]*\) T \([a-z0-9_]*\)@@LINUX_4.15!.global \2\n.set \2,0x\1!' \
>>> +| grep '^\.'
>>> --
>>
>>--
>>Thanks,
>>~Nick Desaulniers
>>
>>--
>>You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
>>To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
>>To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/CAKwvOdnsRHA1WMb7OWi-jV662xLrBBBZ%3DzBbB1gvfpBqVFeSfQ%40mail.gmail.com.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
