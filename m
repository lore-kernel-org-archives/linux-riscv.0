Return-Path: <SRS0=64xR=EM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B8A8C2D0A3
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2020 04:59:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 445A620756
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2020 04:59:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HPH4zIhT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eaemJZsp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 445A620756
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HuLJ9coTFCNzahXfpUGv0wdjQ2A8z9vZfrmF2gqfDsI=; b=HPH4zIhThtBS17om9xBFCRzy2
	SIoJ4hrWCWwDwkb2GaV801sr+s7WWKIUJnvsmi1/WmFYKVCwcS7gjyZIn/9c4hEO7h+pt4dqzh5NA
	IywmQHDScrz9NzGw1trwEh4syKUouLfsNDZFRCOXIbe1MTMk2ZJXY3J0pdOtehMC3IMwmJSH8ll6F
	7u2OUPeiXboxb9sWWboiTjtk7hodCjIQ00rTQm+ANwts2b+fg2FoF2yTFlHHWtznlSFM/asq8627E
	8NSA3IfTDLym3kqU4i1E76HMzy2RBlCULjqq0Nn1rwE1a0YcKSqMjAqWqm/rBGQ5yncTTjS9dm1C1
	UCjb8Z0vQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1katqA-0005QS-4N; Fri, 06 Nov 2020 04:59:10 +0000
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1katq8-0005Q5-1m
 for linux-riscv@lists.infradead.org; Fri, 06 Nov 2020 04:59:09 +0000
Received: by mail-io1-xd43.google.com with SMTP id o11so182195ioo.11
 for <linux-riscv@lists.infradead.org>; Thu, 05 Nov 2020 20:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=AUTEF32bF9kjuo/eDBOdV11pkCJfqfx6fmnPbKlY8U8=;
 b=eaemJZspyt9iVfPe2FtsaUtA0y1aukxEltuXwKp3Ob+Nhk/P9u5qAB/G32obEkREsj
 F7IB2TlEBxNTpxz8LofQkSqkh6FcOc8YG2zX3z618hxmRshFRAaE1BrGo1Z+b5WauOzH
 IOFYmyufBD+IKL8DYEvee1fkF373/P7K0ECnTefAJ0ftlaTaT+j8q00+o8O42e6vNoRo
 23HzyzXdZNaUybaGIbAe7BmgqeXwSHWHNb5qR2hDDdyVuAW2NK67Wb0oEgoqv+JR65KA
 5S7ejcldFA1xSwHXT2XInoBqzTj5QAYgSadqSZFlQM6Qh9yDOKAmRygO4GL5nc6/7LME
 VT1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AUTEF32bF9kjuo/eDBOdV11pkCJfqfx6fmnPbKlY8U8=;
 b=mmZ6URlswj5WYyDzWxRKQW/03P2NxO62Oz5nHJgQQsHZhaV+q4BKtAjh80vn6R4nSx
 ZA9r8fwbDldJ41E2G0tG41iqqzsHb/8i0Ct7bzADFjyshvdmox4Zg42jMeXQkwPDH6lX
 Yl1zhMhSBfeAAjQxe8Q7RfqEKfSJVztVDTLBZsuJT7yECrGu/6jQs6QPhR0Oy9iAYY0r
 JN5XDxWtUaX3hKz9liscQCDzC8qNR/DtSd4Eth0GqIe4IvMHBe6w/mSI0agdlZQ4HgRj
 U59C265d0zTQL/Qj5x1jDqPspO2IwBFjCQ5zWU8bC98heIfZ7qq5Q1VHItJd4+EBp8jr
 Jl8w==
X-Gm-Message-State: AOAM530qJu7lspT/VIy9ksugRvPqjwuvIfxB0nm2F4U/i+6HCEqtXbd/
 kaOxORrqS1UFD4115DZrMW0=
X-Google-Smtp-Source: ABdhPJzX+New6GncNJQVgTgEljL2KAXEeo9WrC35B7BAXfZxOkRqA7LkhBXOliHQAtvYAy9SlInnHQ==
X-Received: by 2002:a02:cc84:: with SMTP id s4mr245120jap.126.1604638744568;
 Thu, 05 Nov 2020 20:59:04 -0800 (PST)
Received: from ubuntu-m3-large-x86 ([2604:1380:45f1:1d00::1])
 by smtp.gmail.com with ESMTPSA id u18sm53474iob.53.2020.11.05.20.59.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 20:59:03 -0800 (PST)
Date: Thu, 5 Nov 2020 21:59:02 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Palmer Dabbelt <palmerdabbelt@google.com>
Subject: Re: [PATCH v3] RISC-V: Fix the VDSO symbol generaton for
 binutils-2.35+
Message-ID: <20201106045902.GA2585953@ubuntu-m3-large-x86>
References: <CAKwvOdn5ib_WHpTg8YpHtqeOMLs+QDxVkzb8fuyDUL_N9BA_xw@mail.gmail.com>
 <mhng-dba8756e-d51b-4ce0-8987-51fcf9674c24@palmerdabbelt-glaptop1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-dba8756e-d51b-4ce0-8987-51fcf9674c24@palmerdabbelt-glaptop1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201105_235908_116468_C7B418D7 
X-CRM114-Status: GOOD (  31.05  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Nov 05, 2020 at 08:42:22PM -0800, 'Palmer Dabbelt' via Clang Built Linux wrote:
> On Mon, 26 Oct 2020 12:48:08 PDT (-0700), Nick Desaulniers wrote:
> > On Fri, Oct 23, 2020 at 10:03 PM 'Palmer Dabbelt' via Clang Built
> > Linux <clang-built-linux@googlegroups.com> wrote:
> > > 
> > > We were relying on GNU ld's ability to re-link executable files in order
> > > to extract our VDSO symbols.  This behavior was deemed a bug as of
> > > binutils-2.35 (specifically the binutils-gdb commit a87e1817a4 ("Have
> > > the linker fail if any attempt to link in an executable is made."), but as that
> > > has been backported to at least Debian's binutils-2.34 in may manifest in other
> > > places.
> > > 
> > > The previous version of this was a bit of a mess: we were linking a
> > > static executable version of the VDSO, containing only a subset of the
> > > input symbols, which we then linked into the kernel.  This worked, but
> > > certainly wasn't a supported path through the toolchain.  Instead this
> > > new version parses the textual output of nm to produce a symbol table.
> > > Both rely on near-zero addresses being linkable, but as we rely on weak
> > > undefined symbols being linkable elsewhere I don't view this as a major
> > > issue.
> > > 
> > > Fixes: e2c0cdfba7f6 ("RISC-V: User-facing API")
> > > Cc: clang-built-linux@googlegroups.com
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
> > 
> > Any way to improve the error message if/when this fails?
> > https://travis-ci.com/github/ClangBuiltLinux/continuous-integration/jobs/407165683
> 
> Probably, but I can't get that command to actually run this stuff.  I tried
> pulling the commands, but I'm getting some weirdness
> 
> $ rm -f arch/riscv/kernel/vdso/vdso-syms.S
> $ make ARCH=riscv defconfig
> $ make -j2 AR=llvm-ar 'CC=clang' 'HOSTCC=clang' HOSTLD=ld KCFLAGS=-Wno-implicit-fallthrough LD=riscv64-linux-gnu-ld LLVM_IAS=1 NM=llvm-nm OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump OBJSIZE=llvm-size READELF=llvm-readelf STRIP=llvm-strip ARCH=riscv Image

This command is simpler and reproduces it for me locally on next-20201105.

$ make -skj"$(nproc)" ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu- LD=riscv64-linux-gnu-ld LLVM=1 distclean defconfig Image
clang-12: warning: argument unused during compilation: '-no-pie' [-Wunused-command-line-argument]
make[4]: *** [arch/riscv/kernel/vdso/Makefile:53: arch/riscv/kernel/vdso/vdso-syms.S] Error 1
make[4]: *** Deleting file 'arch/riscv/kernel/vdso/vdso-syms.S'
make[4]: Target '__build' not remade because of errors.
make[3]: *** [scripts/Makefile.build:500: arch/riscv/kernel/vdso] Error 2
make[3]: Target '__build' not remade because of errors.
make[2]: *** [scripts/Makefile.build:500: arch/riscv/kernel] Error 2
make[2]: Target '__build' not remade because of errors.
make[1]: *** [Makefile:1797: arch/riscv] Error 2
make[1]: Target 'Image' not remade because of errors.
make: *** [Makefile:335: __build_one_by_one] Error 2
make: Target 'distclean' not remade because of errors.
make: Target 'defconfig' not remade because of errors.
make: Target 'Image' not remade because of errors.

<snip>

> diff --git a/arch/riscv/kernel/vdso/.gitignore b/arch/riscv/kernel/vdso/.gitignore
> index 3a19def868ec..88206dd8b472 100644
> --- a/arch/riscv/kernel/vdso/.gitignore
> +++ b/arch/riscv/kernel/vdso/.gitignore
> @@ -2,3 +2,4 @@
> vdso.lds
> *.tmp
> vdso-syms.S
> +vdso-syms.nm
> diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
> index a8ecf102e09b..fe5c969a6bf4 100644
> --- a/arch/riscv/kernel/vdso/Makefile
> +++ b/arch/riscv/kernel/vdso/Makefile
> @@ -49,8 +49,11 @@ SYSCFLAGS_vdso.so.dbg = -shared -s -Wl,-soname=linux-vdso.so.1 \
> # We also create a special relocatable object that should mirror the symbol
> # table and layout of the linked DSO. With ld --just-symbols we can then
> # refer to these symbols in the kernel code rather than hand-coded addresses.
> -$(obj)/vdso-syms.S: $(obj)/vdso.so FORCE
> -	$(call if_changed,so2s)
> +$(obj)/vdso-syms.nm: $(obj)/vdso.so
> +	$(call if_changed,nm_d)
> +
> +$(obj)/vdso-syms.S: $(obj)/vdso-syms.nm
> +	$(call if_changed,nm2s)
> 
> # strip rule for the .so file
> $(obj)/%.so: OBJCOPYFLAGS := -S
> @@ -68,9 +71,13 @@ quiet_cmd_vdsold = VDSOLD  $@
>                            $(patsubst %, -G __vdso_%, $(vdso-syms)) $@.tmp $@ && \
>                    rm $@.tmp
> 
> -# Extracts
> -quiet_cmd_so2s = SO2S    $@
> -      cmd_so2s = $(NM) -D $< | $(srctree)/$(src)/so2s.sh > $@
> +# Extracts symbol offsets from the VDSO, converting them into an assembly file
> +# that contains the same symbols at the same offsets.
> +quiet_cmd_nm_d = NM -D   $@
> +      cmd_nm_d = $(NM) -D $< > $@
> +
> +quiet_cmd_nm2s = SYMS2S  $@
> +      cmd_nm2s = cat $< | $(srctree)/$(src)/so2s.sh > $@
> 
> # install commands for the unstripped file
> quiet_cmd_vdso_install = INSTALL $@
> 
> For reference, here's the output of nmo for me:
> 
> $ cat arch/riscv/kernel/vdso/vdso-syms.nm 0000000000000000 A LINUX_4.15
> 00000000000009e0 T __vdso_clock_getres@@LINUX_4.15
> 000000000000080a T __vdso_clock_gettime@@LINUX_4.15
> 0000000000000a48 T __vdso_flush_icache@@LINUX_4.15
> 0000000000000a3c T __vdso_getcpu@@LINUX_4.15
> 0000000000000916 T __vdso_gettimeofday@@LINUX_4.15
> 0000000000000800 T __vdso_rt_sigreturn@@LINUX_4.15

This diff does not solve the issue for me with the above command.

Cheers,
Nathan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
