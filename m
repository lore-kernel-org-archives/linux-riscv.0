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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86A36C388F2
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2020 10:01:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9495206C1
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2020 10:01:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="W0ouqrXL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rVE9K281"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9495206C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=snXgrQA6i/k/owNsYxr/ITy3v1zZXG5yzE1pFpJ1F2k=; b=W0ouqrXLCcpIalIxJGypCmf6e
	xWj/gER9g3CoyeKAyOHNdVS6cA98nwS5xQc0W0z0YR5FWCth5HYH90BVJfJq7+VlL4G28wXamOcFN
	H0fu59Bh3VnKteIHOD3ziI6Ijxxugzg30/CKGJ0Vg5pn2GjF/eP65c8BcbJVtwYOsmsUn6MoxV/FZ
	3wUvZ687p6MfElLWPUX9QPDKzyGowzaP4ashOtVPCxDXKqbgXDqYgXM6JiYq9RmH0wC8H0Kay5VVj
	Zg7giNkpbjdgnswgJkClFmmSFB7uC8+T7U2DTsRbTTU0HhxHyaF1E7KYAMkZ9vLSoYgH+iR2v2PgM
	zbfXM8OyQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kayYX-0004Aj-Pp; Fri, 06 Nov 2020 10:01:17 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kayYT-00048R-Q7
 for linux-riscv@lists.infradead.org; Fri, 06 Nov 2020 10:01:16 +0000
Received: by mail-io1-xd44.google.com with SMTP id o11so853336ioo.11
 for <linux-riscv@lists.infradead.org>; Fri, 06 Nov 2020 02:01:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=5A2u4CO44p7qRa+3N4k+11sSwOpF76zVgF+ilbeOAmY=;
 b=rVE9K281n7cVgMX3DP5BV9ICaDURvczPbV0jru6Qt5DoK/afFqSZNVPIPCncQEyvh5
 qj4FKT/DuHvpe8KKFzVq66ISVOJrT7I1TIA4NwAMXi2D+HKYaOnzIVMOhXyhl/V+O9ye
 MILAkHAMJP0crojkzn54NYKP+MVwXgWie7VFoJvnrwg3PhQ36L+GWGH6E1Rmy9LfDeJ/
 jr7IC9Oou5PVLglyxM5JEmPCsQ9FquhqX/2u9TcH1UzR6wnQMlGl0sZ78YEfn5/EpP/1
 TYokbfxlv0eDaV/Cj0TMFFsSeGjLBaT9SURkjB9w1jl+xmilS04q9mpZTwMuOWzOAFni
 pAxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5A2u4CO44p7qRa+3N4k+11sSwOpF76zVgF+ilbeOAmY=;
 b=MfsZKAydN7K2fu6kL3FWTL8QLAnlctiAnuNPyQiYhjERImzN6Nh+JYEWlfBb2/qGxa
 EeS9x00Aii/0TCRM8dgHboa/FDOXiqkfB8TUw66XcWMnLFZfp3WumSFC8JlU7zkoP/Jz
 xEySb3jH75FAa5qML/wMfMR3lje8RHflJ8eaUzsVF39A6amwprw1mIEMHAzusu1wxT0m
 9zVRtB+dt3vmFrtxDgbCviQw3Y+27WO0oM9Q5NWXzK0Tcz459z2G2eYiCyHayRUV25yJ
 7gEDZk0NmZFgOaL5V5YYjgtxDD4V8jWE0jkXZLRn1QJpOYdbdoRBf9Ek7CF3uegmcEFA
 MVsA==
X-Gm-Message-State: AOAM533givnc7Wu6z2D7i5HvpmS6n6SddLEflF6L9PRls7alI9+auxNM
 QHAaE/rkATtJQsTSdu7SjNs=
X-Google-Smtp-Source: ABdhPJwPOzmrdLefOQww7n3bSORHaiC3xoqS0+6krtATOKoCsG1qpiLUC7el88BU5gW1LvwEUNvVqw==
X-Received: by 2002:a6b:8b0d:: with SMTP id n13mr867950iod.111.1604656871705; 
 Fri, 06 Nov 2020 02:01:11 -0800 (PST)
Received: from ubuntu-m3-large-x86 ([2604:1380:45f1:1d00::1])
 by smtp.gmail.com with ESMTPSA id u18sm544150iob.53.2020.11.06.02.01.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 02:01:10 -0800 (PST)
Date: Fri, 6 Nov 2020 03:01:09 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Palmer Dabbelt <palmerdabbelt@google.com>
Subject: Re: [PATCH v3] RISC-V: Fix the VDSO symbol generaton for
 binutils-2.35+
Message-ID: <20201106100109.GA3811063@ubuntu-m3-large-x86>
References: <20201106045902.GA2585953@ubuntu-m3-large-x86>
 <mhng-e82ecf40-679a-41ed-b2b1-69c64a78f0b2@palmerdabbelt-glaptop1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-e82ecf40-679a-41ed-b2b1-69c64a78f0b2@palmerdabbelt-glaptop1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201106_050113_917398_B9BF81CA 
X-CRM114-Status: GOOD (  38.53  )
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

On Thu, Nov 05, 2020 at 09:12:25PM -0800, Palmer Dabbelt wrote:
> On Thu, 05 Nov 2020 20:59:02 PST (-0800), natechancellor@gmail.com wrote:
> > On Thu, Nov 05, 2020 at 08:42:22PM -0800, 'Palmer Dabbelt' via Clang Built Linux wrote:
> > > On Mon, 26 Oct 2020 12:48:08 PDT (-0700), Nick Desaulniers wrote:
> > > > On Fri, Oct 23, 2020 at 10:03 PM 'Palmer Dabbelt' via Clang Built
> > > > Linux <clang-built-linux@googlegroups.com> wrote:
> > > > >
> > > > > We were relying on GNU ld's ability to re-link executable files in order
> > > > > to extract our VDSO symbols.  This behavior was deemed a bug as of
> > > > > binutils-2.35 (specifically the binutils-gdb commit a87e1817a4 ("Have
> > > > > the linker fail if any attempt to link in an executable is made."), but as that
> > > > > has been backported to at least Debian's binutils-2.34 in may manifest in other
> > > > > places.
> > > > >
> > > > > The previous version of this was a bit of a mess: we were linking a
> > > > > static executable version of the VDSO, containing only a subset of the
> > > > > input symbols, which we then linked into the kernel.  This worked, but
> > > > > certainly wasn't a supported path through the toolchain.  Instead this
> > > > > new version parses the textual output of nm to produce a symbol table.
> > > > > Both rely on near-zero addresses being linkable, but as we rely on weak
> > > > > undefined symbols being linkable elsewhere I don't view this as a major
> > > > > issue.
> > > > >
> > > > > Fixes: e2c0cdfba7f6 ("RISC-V: User-facing API")
> > > > > Cc: clang-built-linux@googlegroups.com
> > > > > Cc: stable@vger.kernel.org
> > > > > Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
> > > >
> > > > Any way to improve the error message if/when this fails?
> > > > https://travis-ci.com/github/ClangBuiltLinux/continuous-integration/jobs/407165683
> > > 
> > > Probably, but I can't get that command to actually run this stuff.  I tried
> > > pulling the commands, but I'm getting some weirdness
> > > 
> > > $ rm -f arch/riscv/kernel/vdso/vdso-syms.S
> > > $ make ARCH=riscv defconfig
> > > $ make -j2 AR=llvm-ar 'CC=clang' 'HOSTCC=clang' HOSTLD=ld KCFLAGS=-Wno-implicit-fallthrough LD=riscv64-linux-gnu-ld LLVM_IAS=1 NM=llvm-nm OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump OBJSIZE=llvm-size READELF=llvm-readelf STRIP=llvm-strip ARCH=riscv Image
> > 
> > This command is simpler and reproduces it for me locally on next-20201105.
> > 
> > $ make -skj"$(nproc)" ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu- LD=riscv64-linux-gnu-ld LLVM=1 distclean defconfig Image
> > clang-12: warning: argument unused during compilation: '-no-pie' [-Wunused-command-line-argument]
> > make[4]: *** [arch/riscv/kernel/vdso/Makefile:53: arch/riscv/kernel/vdso/vdso-syms.S] Error 1
> > make[4]: *** Deleting file 'arch/riscv/kernel/vdso/vdso-syms.S'
> > make[4]: Target '__build' not remade because of errors.
> > make[3]: *** [scripts/Makefile.build:500: arch/riscv/kernel/vdso] Error 2
> > make[3]: Target '__build' not remade because of errors.
> > make[2]: *** [scripts/Makefile.build:500: arch/riscv/kernel] Error 2
> > make[2]: Target '__build' not remade because of errors.
> > make[1]: *** [Makefile:1797: arch/riscv] Error 2
> > make[1]: Target 'Image' not remade because of errors.
> > make: *** [Makefile:335: __build_one_by_one] Error 2
> > make: Target 'distclean' not remade because of errors.
> > make: Target 'defconfig' not remade because of errors.
> > make: Target 'Image' not remade because of errors.
> > 
> > <snip>
> > 
> > > diff --git a/arch/riscv/kernel/vdso/.gitignore b/arch/riscv/kernel/vdso/.gitignore
> > > index 3a19def868ec..88206dd8b472 100644
> > > --- a/arch/riscv/kernel/vdso/.gitignore
> > > +++ b/arch/riscv/kernel/vdso/.gitignore
> > > @@ -2,3 +2,4 @@
> > > vdso.lds
> > > *.tmp
> > > vdso-syms.S
> > > +vdso-syms.nm
> > > diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
> > > index a8ecf102e09b..fe5c969a6bf4 100644
> > > --- a/arch/riscv/kernel/vdso/Makefile
> > > +++ b/arch/riscv/kernel/vdso/Makefile
> > > @@ -49,8 +49,11 @@ SYSCFLAGS_vdso.so.dbg = -shared -s -Wl,-soname=linux-vdso.so.1 \
> > > # We also create a special relocatable object that should mirror the symbol
> > > # table and layout of the linked DSO. With ld --just-symbols we can then
> > > # refer to these symbols in the kernel code rather than hand-coded addresses.
> > > -$(obj)/vdso-syms.S: $(obj)/vdso.so FORCE
> > > -	$(call if_changed,so2s)
> > > +$(obj)/vdso-syms.nm: $(obj)/vdso.so
> > > +	$(call if_changed,nm_d)
> > > +
> > > +$(obj)/vdso-syms.S: $(obj)/vdso-syms.nm
> > > +	$(call if_changed,nm2s)
> > > 
> > > # strip rule for the .so file
> > > $(obj)/%.so: OBJCOPYFLAGS := -S
> > > @@ -68,9 +71,13 @@ quiet_cmd_vdsold = VDSOLD  $@
> > >                            $(patsubst %, -G __vdso_%, $(vdso-syms)) $@.tmp $@ && \
> > >                    rm $@.tmp
> > > 
> > > -# Extracts
> > > -quiet_cmd_so2s = SO2S    $@
> > > -      cmd_so2s = $(NM) -D $< | $(srctree)/$(src)/so2s.sh > $@
> > > +# Extracts symbol offsets from the VDSO, converting them into an assembly file
> > > +# that contains the same symbols at the same offsets.
> > > +quiet_cmd_nm_d = NM -D   $@
> > > +      cmd_nm_d = $(NM) -D $< > $@
> > > +
> > > +quiet_cmd_nm2s = SYMS2S  $@
> > > +      cmd_nm2s = cat $< | $(srctree)/$(src)/so2s.sh > $@
> > > 
> > > # install commands for the unstripped file
> > > quiet_cmd_vdso_install = INSTALL $@
> > > 
> > > For reference, here's the output of nmo for me:
> > > 
> > > $ cat arch/riscv/kernel/vdso/vdso-syms.nm 0000000000000000 A LINUX_4.15
> > > 00000000000009e0 T __vdso_clock_getres@@LINUX_4.15
> > > 000000000000080a T __vdso_clock_gettime@@LINUX_4.15
> > > 0000000000000a48 T __vdso_flush_icache@@LINUX_4.15
> > > 0000000000000a3c T __vdso_getcpu@@LINUX_4.15
> > > 0000000000000916 T __vdso_gettimeofday@@LINUX_4.15
> > > 0000000000000800 T __vdso_rt_sigreturn@@LINUX_4.15
> > 
> > This diff does not solve the issue for me with the above command.
> 
> It wasn't really meant to solve anything, just split the commands up a touch
> more so we could see what's going on.
> 
> I just installed Debian's toolchain, which is LLVM 9.  IIRC that's pretty
> ancient WRT RISC-V, so my guess is that it's just a long way from building
> Linux.  Looks like llvm-nm on my system doesn't put the @@LINUX_4.15 after the
> symbol names, I think this should do it?
> 
> diff --git a/arch/riscv/kernel/vdso/so2s.sh b/arch/riscv/kernel/vdso/so2s.sh
> index 3c5b43207658..e64cb6d9440e 100755
> --- a/arch/riscv/kernel/vdso/so2s.sh
> +++ b/arch/riscv/kernel/vdso/so2s.sh
> @@ -2,5 +2,5 @@
> # SPDX-License-Identifier: GPL-2.0+
> # Copyright 2020 Palmer Dabbelt <palmerdabbelt@google.com>
> 
> -sed 's!\([0-9a-f]*\) T \([a-z0-9_]*\)@@LINUX_4.15!.global \2\n.set \2,0x\1!' \
> +sed 's!\([0-9a-f]*\) T \([a-z0-9_]*\)\(@@LINUX_4.15\)*!.global \2\n.set \2,0x\1!' \
> | grep '^\.'
> 
> It works for me, at least for this specific problem.

Same here. defconfig minus CONFIG_EFI builds and boots in QEMU with that
diff (plus LLVM_IAS=1 in the make command, I forgot that earlier).

Tested-by: Nathan Chancellor <natechancellor@gmail.com>

> $ llvm-nm-9 -D arch/riscv/kernel/vdso/vdso.so |
> ./arch/riscv/kernel/vdso/so2s.sh .global __vdso_clock_getres
> .set __vdso_clock_getres,0x00000000000009e0
> .global __vdso_clock_gettime
> .set __vdso_clock_gettime,0x000000000000080a
> .global __vdso_flush_icache
> .set __vdso_flush_icache,0x0000000000000a48
> .global __vdso_getcpu
> .set __vdso_getcpu,0x0000000000000a3c
> .global __vdso_gettimeofday
> .set __vdso_gettimeofday,0x0000000000000916
> .global __vdso_rt_sigreturn
> .set __vdso_rt_sigreturn,0x0000000000000800
> $ nm -D arch/riscv/kernel/vdso/vdso.so | ./arch/riscv/kernel/vdso/so2s.sh
> .global __vdso_clock_getres
> .set __vdso_clock_getres,0x00000000000009e0
> .global __vdso_clock_gettime
> .set __vdso_clock_gettime,0x000000000000080a
> .global __vdso_flush_icache
> .set __vdso_flush_icache,0x0000000000000a48
> .global __vdso_getcpu
> .set __vdso_getcpu,0x0000000000000a3c
> .global __vdso_gettimeofday
> .set __vdso_gettimeofday,0x0000000000000916
> .global __vdso_rt_sigreturn
> .set __vdso_rt_sigreturn,0x0000000000000800
> 
> > 
> > Cheers,
> > Nathan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
