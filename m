Return-Path: <SRS0=hknt=D2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6E8AC433E7
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Oct 2020 20:41:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F21A1223EA
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Oct 2020 20:41:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wcsRjAmp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="uNbz+HXM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F21A1223EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=t8naTDhMLZyZ4H3p7iet+dRxcRcs0IrMPOHnrJ+PLto=; b=wcsRjAmpt0h34gRpj/Mhs6y5d
	n1//8hrYjyJiPdDoZGTZRNa2gAOhCoC9WYDZMteESHir/SKbSvIWtXg6b0nlsKr9TU8QDJafsiR1x
	xGnI/Bpz0MAsVjk3UUnxlpQ9ILRlFpMFluLpgtoBuMBJSY+7SLjN7cQUVz4pAOkaoY3+Y5RXaeEGR
	AjW9WIwdk4fGWFqH04oMFZTwSODTgZIHmN+oIZC56PaG4AkavqoqoBGa5Jljknqv3dFaBP6xiQa7a
	FyTGrwOqeXK6xwQ1Q80xh1h2A89Y8qRlOQgideiOdruP4wj1flQjQhw8xw0p8SjrEitCyQDBribil
	SlwgKALyg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUbyH-0005cr-Pu; Mon, 19 Oct 2020 20:41:33 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUbyD-0005cX-OG
 for linux-riscv@lists.infradead.org; Mon, 19 Oct 2020 20:41:31 +0000
Received: by mail-pl1-x641.google.com with SMTP id y1so414507plp.6
 for <linux-riscv@lists.infradead.org>; Mon, 19 Oct 2020 13:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=JV8BCOR/JvIEgfAvAo8m2P/XD4M4pARgj8lS/n0TjIk=;
 b=uNbz+HXMdeKg8jx/VsmQdREfkupFzXXiUBqaLappY65JtKYFoPb02aQCNgYKytpnRa
 M396faW0CziT/V/gWsiPlV2oxg5+TCszht6nGulgvEzuzCjXGlWD/k1xiJYF/9gEY/98
 YAv7E+lfusXSm7++KVAdBsjvONGpbfWfrOAbPzodtlkW9LQeHluOXN9T8yuRJ/bVW7+a
 guDFG/jLk1fXusgiI8hfPZ+NBM7sW/Crnqo8yLhkIjfBYMLoADYBf/VRrJPJoFhhk1E+
 baqIydOxf+DxyjCXRyAMIMj4DUJ1BLK9CzW/vBSKkRzefBcUNgysgnsUnvmUdYIkzNgL
 rB0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JV8BCOR/JvIEgfAvAo8m2P/XD4M4pARgj8lS/n0TjIk=;
 b=da1T2jyX5+oRlNYcW+zMO9lPbS0+n36Khl1xdNWvhsYToRLOxXBxmgS2T5F+0su50b
 W604GrBTDmmHTl2l4BkntA96BPIQnNnokJCiNygNG760InfmHFiKmyxS9788NO6nG4BL
 TsjE6jqSK/NkaTyoLljMBsvak0UecXMCBYz4uUKCyqOygrZ+ToH+PZOkt8xWaPP0RPD4
 qwj/J1z/tsQu8fV39yLFVSMqDoBaAXE77Ro/jlS0IrFb/Nq7Zc0rZodVegqODoXbYO9+
 69K/7U/lCKj/gXXk/RMSNfANV0fRaIob+kpVztkOT7CFBcJw7366lO3faw3PdLU7sPIE
 scpQ==
X-Gm-Message-State: AOAM532PlJkGtImZtBhS96ZFBIps9E+FT4aHBN4y1XE+GYvZOHHz4EPQ
 7+EqAXYaTA2n2+Azndw0K5qwEQ==
X-Google-Smtp-Source: ABdhPJwzigGcHkEMr7039MyLZ5jq7OIo2twqHHs2AypjQ9JDtzez1a+8+fTks+4Hc7xtn2V3terA0w==
X-Received: by 2002:a17:90a:ff92:: with SMTP id
 hf18mr1202895pjb.171.1603140084574; 
 Mon, 19 Oct 2020 13:41:24 -0700 (PDT)
Received: from google.com ([2620:15c:2ce:0:a6ae:11ff:fe11:4abb])
 by smtp.gmail.com with ESMTPSA id o4sm319396pjp.37.2020.10.19.13.41.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2020 13:41:23 -0700 (PDT)
Date: Mon, 19 Oct 2020 13:41:21 -0700
From: Fangrui Song <maskray@google.com>
To: Palmer Dabbelt <palmerdabbelt@google.com>
Subject: Re: [PATCH] RISC-V: Fix the VDSO symbol generaton for binutils-2.34+
Message-ID: <20201019204121.jaw7mqn4bkn2h6mx@google.com>
References: <20201017002500.503011-1-palmerdabbelt@google.com>
 <CAKwvOdnsRHA1WMb7OWi-jV662xLrBBBZ=zBbB1gvfpBqVFeSfQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKwvOdnsRHA1WMb7OWi-jV662xLrBBBZ=zBbB1gvfpBqVFeSfQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201019_164129_839005_ECC92660 
X-CRM114-Status: GOOD (  28.31  )
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
Cc: kernel-team <kernel-team@android.com>, linux-riscv@lists.infradead.org,
 Nick Desaulniers <ndesaulniers@google.com>, "# 3.4.x" <stable@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2020-10-19, 'Nick Desaulniers' via Clang Built Linux wrote:
>On Fri, Oct 16, 2020 at 5:44 PM 'Palmer Dabbelt' via Clang Built Linux
><clang-built-linux@googlegroups.com> wrote:
>>
>> We were relying on GNU ld's ability to re-link executable files in order
>> to extract our VDSO symbols.  This behavior was deemed a bug as of
>> binutils-2.34 (specifically the binutils-gdb commit a87e1817a4 ("Have
>> the linker fail if any attempt to link in an executable is made."),
>> which IIUC landed in 2.34), which recently installed itself on my build
>> setup.

I filed the issue https://sourceware.org/bugzilla/show_bug.cgi?id=26047
The commit is in 2.35 but not in the released 2.34 branch.

>> The previous version of this was a bit of a mess: we were linking a
>> static executable version of the VDSO, containing only a subset of the
>> input symbols, which we then linked into the kernel.  This worked, but
>> certainly wasn't a supported path through the toolchain.  Instead this
>> new version parses the textual output of nm to produce a symbol table.
>> Both rely on near-zero addresses being linkable, but as we rely on weak
>> undefined symbols being linkable elsewhere I don't view this as a major
>> issue.
>>
>> Fixes: e2c0cdfba7f6 ("RISC-V: User-facing API")
>> Cc: stable@vger.kernel.org
>> Cc: clang-built-linux@googlegroups.com
>> Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
>
>Ah, I do see a build failure to link the vdso with:
>$ riscv64-linux-gnu-ld --version
>GNU ld (GNU Binutils for Debian) 2.34.90.20200706
>
>riscv64-linux-gnu-ld: cannot use executable file
>'arch/riscv/kernel/vdso/vdso-dummy.o' as input to a link
>
>This patch fixes that for me, but there's a problem related to related
>to `nm` below.
>
>After this, there's two other things we might want to fix up related
>to the build of the vdso:
>1. it looks like $(CC) is being used to link the vdso, rather than
>$(LD).  While it's generally fine to use the compiler as the driver
>for building a linked object file, it does not respect the set $(LD).
>`-fuse-ld=` needs to be passed to invoke the linker the user
>specified.  See also:
>https://lore.kernel.org/linux-kbuild/20201013033947.2257501-1-natechancellor@gmail.com/T/#u
>(this has popped up in a few places when trying to do hermetic builds
>with LLD).
>2. I observe the warning when building with clang: `argument unused
>during compilation: '-no-pie' [-Wunused-command-line-argument]`. IIRC,
>the top level Makefile sets `-Qunused-arguments` for builds with
>clang.  `cmd_vdsold` may need that, but it's curious why it's unused
>and makes me wonder why/if `-no-pie` is necessary?  That also might be
>fixed by fixing 1.
>
>> ---
>>  arch/riscv/kernel/vdso/.gitignore |  1 +
>>  arch/riscv/kernel/vdso/Makefile   | 19 +++++++++----------
>>  arch/riscv/kernel/vdso/so2s.sh    |  7 +++++++
>>  3 files changed, 17 insertions(+), 10 deletions(-)
>>  create mode 100755 arch/riscv/kernel/vdso/so2s.sh
>>
>> diff --git a/arch/riscv/kernel/vdso/.gitignore b/arch/riscv/kernel/vdso/.gitignore
>> index 11ebee9e4c1d..3a19def868ec 100644
>> --- a/arch/riscv/kernel/vdso/.gitignore
>> +++ b/arch/riscv/kernel/vdso/.gitignore
>> @@ -1,3 +1,4 @@
>>  # SPDX-License-Identifier: GPL-2.0-only
>>  vdso.lds
>>  *.tmp
>> +vdso-syms.S
>> diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
>> index 478e7338ddc1..2e02958f6224 100644
>> --- a/arch/riscv/kernel/vdso/Makefile
>> +++ b/arch/riscv/kernel/vdso/Makefile
>> @@ -43,19 +43,14 @@ $(obj)/vdso.o: $(obj)/vdso.so
>>  SYSCFLAGS_vdso.so.dbg = $(c_flags)
>>  $(obj)/vdso.so.dbg: $(src)/vdso.lds $(obj-vdso) FORCE
>>         $(call if_changed,vdsold)
>> +SYSCFLAGS_vdso.so.dbg = -shared -s -Wl,-soname=linux-vdso.so.1 \
>> +       -Wl,--build-id -Wl,--hash-style=both
>>
>>  # We also create a special relocatable object that should mirror the symbol
>>  # table and layout of the linked DSO. With ld --just-symbols we can then
>>  # refer to these symbols in the kernel code rather than hand-coded addresses.
>> -
>> -SYSCFLAGS_vdso.so.dbg = -shared -s -Wl,-soname=linux-vdso.so.1 \
>> -       -Wl,--build-id -Wl,--hash-style=both
>> -$(obj)/vdso-dummy.o: $(src)/vdso.lds $(obj)/rt_sigreturn.o FORCE
>> -       $(call if_changed,vdsold)
>> -
>> -LDFLAGS_vdso-syms.o := -r --just-symbols
>> -$(obj)/vdso-syms.o: $(obj)/vdso-dummy.o FORCE
>> -       $(call if_changed,ld)
>> +$(obj)/vdso-syms.S: $(obj)/vdso.so FORCE
>> +       $(call if_changed,so2s)
>>
>>  # strip rule for the .so file
>>  $(obj)/%.so: OBJCOPYFLAGS := -S
>> @@ -68,11 +63,15 @@ $(obj)/%.so: $(obj)/%.so.dbg FORCE
>>  # Make sure only to export the intended __vdso_xxx symbol offsets.
>>  quiet_cmd_vdsold = VDSOLD  $@
>>        cmd_vdsold = $(CC) $(KBUILD_CFLAGS) $(call cc-option, -no-pie) -nostdlib -nostartfiles $(SYSCFLAGS_$(@F)) \
>> -                           -Wl,-T,$(filter-out FORCE,$^) -o $@.tmp && \
>> +                           -Wl,-T,$(filter-out FORCE,$^) -o $@.tmp -Wl,-Map,$@.map && \

Is -Wl,-Map,$@.map needed?

>>                     $(CROSS_COMPILE)objcopy \
>>                             $(patsubst %, -G __vdso_%, $(vdso-syms)) $@.tmp $@ && \
>>                     rm $@.tmp
>>
>> +# Extracts
>> +quiet_cmd_so2s = SO2S    $@
>> +      cmd_so2s = $(CROSS_COMPILE)nm -D $< | $(src)/so2s.sh > $@
>
>This should use `$(NM)` rather than `$(CROSS_COMPILE)nm` which
>hardcodes the use of GNU nm from GNU binutils.
>
>> +
>>  # install commands for the unstripped file
>>  quiet_cmd_vdso_install = INSTALL $@
>>        cmd_vdso_install = cp $(obj)/$@.dbg $(MODLIB)/vdso/$@
>> diff --git a/arch/riscv/kernel/vdso/so2s.sh b/arch/riscv/kernel/vdso/so2s.sh
>> new file mode 100755
>> index 000000000000..7862866b5ebb
>> --- /dev/null
>> +++ b/arch/riscv/kernel/vdso/so2s.sh
>> @@ -0,0 +1,6 @@
>> +#!/bin/sh
>> +# SPDX-License-Identifier: GPL-2.0+
>> +# Copyright 2020 Palmer Dabbelt <palmerdabbelt@google.com>
>> +
>> +sed 's!\([0-9a-f]*\) T \([a-z0-9_]*\)@@LINUX_4.15!.global \2\n.set \2,0x\1!' \
>> +| grep '^\.'
>> --
>
>-- 
>Thanks,
>~Nick Desaulniers
>
>-- 
>You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
>To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
>To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/CAKwvOdnsRHA1WMb7OWi-jV662xLrBBBZ%3DzBbB1gvfpBqVFeSfQ%40mail.gmail.com.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
