Return-Path: <SRS0=hknt=D2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E95C1C433DF
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Oct 2020 23:56:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1363E2098B
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Oct 2020 23:56:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hYBJMrsq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="e5RtB9Bd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1363E2098B
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=9HiXqcbE/Tqt8LAtzC1jMtjQ/6VSsvJeIiK/TlF0PIA=; b=hYBJMrsql2NGPwbXsVl0y2ci3
	0W6rk8CTbA+i25zhE7CWaCvro4PIsJVF0t0OGmzHZAF3W5bpJdFKGy0d4DwCACVrMCxYtByD9nF7u
	b+etbsZpz3dARzVo2IvixOzNALTFu241xEvXwVBDB+aweQeRsV/9xGJ0gwgfEef+MUvM4o3pXQqDE
	G5MUE54KsZOlkaBeSboFFfezlg6QPd6nJGvsjQ1jbu4EYibE3lNeOLCphJXqp+Oxy6/FHkIqWcZJh
	mdAXgRcbevjMlIp6g2mm9BCm9fmbktlGiw3wvpnqMN1M7bLwkYZpy2s+scJTBhjQ9pY3nMsMprUzz
	ms9I68CjQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUf0p-0003fV-JO; Mon, 19 Oct 2020 23:56:23 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUf0m-0003ev-56
 for linux-riscv@lists.infradead.org; Mon, 19 Oct 2020 23:56:21 +0000
Received: by mail-pg1-x542.google.com with SMTP id h6so963677pgk.4
 for <linux-riscv@lists.infradead.org>; Mon, 19 Oct 2020 16:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=ExWjl1JeGWG1HkzmziK2mHIyQpKJ6XAkOWwi0DXTdkE=;
 b=e5RtB9BdssajHTuH17FYILGZlQ9D9/gYswJHDVYQigaaeQjeMKhNotXLlRyXF0eCJw
 nsI4fqcGM41ePfmIDY+x5hdX0m5atBg/ikp7wHZ/0GbnqA31FPaeEVDzR86A7G+ifIuP
 SkfogvRH6uO7XA5L3yROvfjG2vKSf6xobwrf5Pt1/YS3e1xf9pdMSGTcICo6RSJjqwRs
 LqSWHlqg5G5SWMAYsWY4isAU8Tzus22d2YlpMk5HTyVck4XfA4RNr24er10OOzVczvug
 hVd/vXpQOQC/mYL5VbjgWJmlEYjN9CJBNLiC7ucI0rK85s5rwlukOEpGiK13hmk0UOvX
 Kk9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=ExWjl1JeGWG1HkzmziK2mHIyQpKJ6XAkOWwi0DXTdkE=;
 b=D6LNBGu1N2erzTocij9KlDfXtv3cVYDj5dSe7Idntm6hsZjEdgmJLalBu2e5pcVxon
 Q2VG1lCimiGndUf+Pqvr6cXJDQ3QZkZP9O46ZzasFTSQwNjPvidNvIQfTgCTv1VT0huI
 qnMI9fnPCgTxfbKz6llmGA7TeM4Z/wr2fi89yEubHv8IYF0Xxu1e9fOIpEyjlK2bOPdC
 MhW478SiwLjZnWRnLzo9Ci/siHnKzR5tEVHIsGoWhKpRLDK0xYTJRF9xEtBs2N7VIwPg
 Ouuu95AFtCaJnRnMXn3WJwBCSFOmbEiUtCtv/U4CSSu8hBTdZQGgZu3Y0BYaBJJ/u8jF
 +sqQ==
X-Gm-Message-State: AOAM5301jIW7FgSpv+XwFSHKuCrTxIybjbhf9v9rFULBHGW+skO8MRaH
 4oNev9kKrRGPpfa7eOUUfl90K0QuTpgFo+VA
X-Google-Smtp-Source: ABdhPJzgnYt9xdUB2h3EzXwO+8HQVxhi2/rb87kgnsBI7ZSzOcsTq6lwh2HzEyOwhcnl51VBkdOFlQ==
X-Received: by 2002:aa7:9af1:0:b029:152:6101:ad12 with SMTP id
 y17-20020aa79af10000b02901526101ad12mr22757pfp.40.1603151777364; 
 Mon, 19 Oct 2020 16:56:17 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id q8sm94896pfl.100.2020.10.19.16.56.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2020 16:56:16 -0700 (PDT)
Date: Mon, 19 Oct 2020 16:56:16 -0700 (PDT)
X-Google-Original-Date: Mon, 19 Oct 2020 16:56:15 PDT (-0700)
Subject: Re: [PATCH] RISC-V: Fix the VDSO symbol generaton for binutils-2.34+
In-Reply-To: <CAKwvOdnsRHA1WMb7OWi-jV662xLrBBBZ=zBbB1gvfpBqVFeSfQ@mail.gmail.com>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: Nick Desaulniers <ndesaulniers@google.com>
Message-ID: <mhng-d0a80ce3-f5e0-49da-b91d-0f6f6d0f2cb3@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201019_195620_250961_FB8937C0 
X-CRM114-Status: GOOD (  32.69  )
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
Cc: clang-built-linux@googlegroups.com, linux-riscv@lists.infradead.org,
 kernel-team@android.com, stable@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 19 Oct 2020 12:24:02 PDT (-0700), Nick Desaulniers wrote:
> On Fri, Oct 16, 2020 at 5:44 PM 'Palmer Dabbelt' via Clang Built Linux
> <clang-built-linux@googlegroups.com> wrote:
>>
>> We were relying on GNU ld's ability to re-link executable files in order
>> to extract our VDSO symbols.  This behavior was deemed a bug as of
>> binutils-2.34 (specifically the binutils-gdb commit a87e1817a4 ("Have
>> the linker fail if any attempt to link in an executable is made."),
>> which IIUC landed in 2.34), which recently installed itself on my build
>> setup.
>>
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
> Ah, I do see a build failure to link the vdso with:
> $ riscv64-linux-gnu-ld --version
> GNU ld (GNU Binutils for Debian) 2.34.90.20200706
>
> riscv64-linux-gnu-ld: cannot use executable file
> 'arch/riscv/kernel/vdso/vdso-dummy.o' as input to a link

Ya, looks like it was actually a backport.

> This patch fixes that for me, but there's a problem related to related
> to `nm` below.
>
> After this, there's two other things we might want to fix up related
> to the build of the vdso:
> 1. it looks like $(CC) is being used to link the vdso, rather than
> $(LD).  While it's generally fine to use the compiler as the driver
> for building a linked object file, it does not respect the set $(LD).
> `-fuse-ld=` needs to be passed to invoke the linker the user
> specified.  See also:
> https://lore.kernel.org/linux-kbuild/20201013033947.2257501-1-natechancellor@gmail.com/T/#u
> (this has popped up in a few places when trying to do hermetic builds
> with LLD).

It's probably just to make the argument handling easier -- I generally avoid
invoking the linker directly and instead just always use CC because I can never
remember the linker arguments.

> 2. I observe the warning when building with clang: `argument unused
> during compilation: '-no-pie' [-Wunused-command-line-argument]`. IIRC,
> the top level Makefile sets `-Qunused-arguments` for builds with
> clang.  `cmd_vdsold` may need that, but it's curious why it's unused
> and makes me wonder why/if `-no-pie` is necessary?  That also might be
> fixed by fixing 1.

That seems odd: vdsold is only used for a link, and -no-pie is necessary for
linking.

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
>>                     $(CROSS_COMPILE)objcopy \
>>                             $(patsubst %, -G __vdso_%, $(vdso-syms)) $@.tmp $@ && \
>>                     rm $@.tmp
>>
>> +# Extracts
>> +quiet_cmd_so2s = SO2S    $@
>> +      cmd_so2s = $(CROSS_COMPILE)nm -D $< | $(src)/so2s.sh > $@
>
> This should use `$(NM)` rather than `$(CROSS_COMPILE)nm` which
> hardcodes the use of GNU nm from GNU binutils.

Thanks, this is fixed in the v2.  Presumably we should be using $(OBJCOPY) as well?

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

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
