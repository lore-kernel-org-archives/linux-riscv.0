Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 434B3C79FB9
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2026 04:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HwRIXR+gVCQf7qB1wWQvZoKCWhKlosKy8p1J4krt1zE=; b=PwAo6NEv6ZxDlD
	zsQYPGBfiOsYlpL8i2MIw+QCiwxhHOOAcxFx6+xseyMfc0cPxdXZbtQ6uJpF6kP2MPzC84BDtPZaw
	oMqwnOBsXj34yRG5nk6hWjRL+vwY3VI3lHr5Lz3FQkhStc5ETkZdCWB9hMh5c3Lb9/JEAhMKS67b3
	lmUEqypjJCUlDzWNTvxHCATi1eNP69da7LaAj8VOjEb+H2ln0p+x96v1evTOpeCdc50pWU5HQ0Mt5
	LcF+s9AarWDtEnRt7liiyH0aNtNplIavWaiuVDnSY6/NcwPWDZ64RKoMyUrOqr+N7/9ov/82e1YbA
	LZHnWAaHUoHRBC30rRoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4WH3-0000000DLtl-0CxL;
	Thu, 10 Sep 2026 04:20:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4WH1-0000000DLst-0dD1;
	Thu, 10 Sep 2026 04:20:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3EC80601EF;
	Thu, 10 Sep 2026 04:20:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98BD31F00893;
	Thu, 10 Sep 2026 04:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789014029;
	bh=VKklRIsIxfcoqhL1bLbYjXtyVgG12YsgMkjcgJHF19w=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=ZWgIgGMpyJn8Q23MKsmUyrNiPnuYsuNq5Ku3nu7xOfiGaIP/fA/vz3QWqfKaDkgJ7
	 6HuSxa38Cnsby5LJui4B1xPYy8/rn6EGaTgai9SPpMEVHvn6ee2YTCsUVqQmN6bc86
	 ZPjRgz5a3k3wmx1cqiVM8fG/YHegIBIZnjil2lsQpb/nzBGoVnvf9xv08TkLxLUHgC
	 Ttci1rqJUVBFT6aAGuNRyIQJ3uKuKyISYAbIJXV5B5pHGHyBEM2Mql04RPifUAZNCH
	 IHXSesZbThqRTT8Fh7hVHk5QQMpOGHhk1vBBZ/xHZy4p8FKLPMcGjwLmDyM2UBQaXv
	 IdzkSKQ0Jd3jw==
MIME-Version: 1.0
Subject: Re: [PATCH 06/23] kbuild: only emit vmlinux relocations when
 required
From: Nathan Chancellor <nathan@kernel.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Masahiro Yamada <masahiroy@kernel.org>, Alexey Gladkov <legion@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Ard Biesheuvel <ardb@kernel.org>, 
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
 Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-riscv@lists.infradead.org, 
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-doc@vger.kernel.org, Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20260908-build-speedup-v1-6-5dc1ac01672d@kernel.org>
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
 <20260908-build-speedup-v1-6-5dc1ac01672d@kernel.org>
Date: Wed, 09 Sep 2026 21:19:12 -0700
Message-Id: <178901395291.3971858.16666031836463650276.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3738; i=nathan@kernel.org;
 h=from:subject:message-id; bh=1LFSzvqpCVNNJ9TQXhcT9L2wj+5Vsf0qujUp2w7rHOI=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFmL9I83l26TUGp7eTXM6JyC2iTRNbqhVz+eVzdjnHf+2
 O3fh9PqOkpZGMS4GGTFFFmqH6seNzScc5bxxqlJMHNYmUCGMHBxCsBEEvMZ/il/Pq+9/aDFQnsJ
 2SnLJn1+MP3wvNVbOWz2pOzhOJQTtO02w38v5XOfk6x2C7PslDO5JXYr9VP6nyuaxQqL9k/5vzQ
 nV4kZAA==
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
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

> A kernel build consists of more than one linking pass on vmlinux.o and
> vmlinux, at minimum two, and with CONFIG_KALLSYMS and BTF enabled on x86-64
> for example there are 5 such stages.
> 
> For architectures that build their own relocation tables (x86, riscv, mips,
> s390), vmlinux is linked with the --emit-relocs parameter specified.
> 
> However, this is only required on the final vmlinux link.
> 
> Symbol tables of trial links preceding it don't need it because they
> already check that System.map matches kallsyms symbols on each build.
> 
> GNU ld is slow at emitting relocation tables, so this results in a
> reduction in build time.
> 
> Whole build, 128-thread Threadripper 9980X, best of N runs:
> 
>                                          before   after     delta
>                                          -------------------------------
>   x86 defconfig, touch mm/vma.c, gcc        9.8s     9.4s    -0.43s (-4%)
>   x86 defconfig, clean, gcc                28.6s    28.1s    -0.47s (-2%)
>   x86 allmodconfig, touch mm/vma.c, gcc    44.0s    42.7s     -1.3s (-3%)
> 
> Note that this has little impact on LLVM ld which performs this operation
> more efficiently.
> 
> Assisted-by: LLM
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
>
> diff --git a/Makefile b/Makefile
> index 9bd226726358..de095b11e20a 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1266,8 +1266,10 @@ LDFLAGS_vmlinux += --orphan-handling=$(CONFIG_LD_ORPHAN_WARN_LEVEL)
>  endif
>  
>  ifneq ($(CONFIG_ARCH_VMLINUX_NEEDS_RELOCS),)
> -LDFLAGS_vmlinux	+= --emit-relocs --discard-none
> +LDFLAGS_vmlinux	+= --discard-none
> +LDFLAGS_vmlinux_relocs := --emit-relocs
>  endif
> +export LDFLAGS_vmlinux_relocs
>  
>  # Align the architecture of userspace programs with the kernel
>  USERFLAGS_FROM_KERNEL := --target=%
> diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
> index fcae1e432d9a..4b54aaeca65d 100644
> --- a/scripts/Makefile.vmlinux
> +++ b/scripts/Makefile.vmlinux
> @@ -64,7 +64,8 @@ ARCH_POSTLINK := $(wildcard $(srctree)/arch/$(SRCARCH)/Makefile.postlink)
>  
>  # Final link of vmlinux with optional arch pass after final link
>  cmd_link_vmlinux =							\
> -	$< "$(LD)" "$(KBUILD_LDFLAGS)" "$(LDFLAGS_vmlinux)" "$@";	\
> +	$< "$(LD)" "$(KBUILD_LDFLAGS)" "$(LDFLAGS_vmlinux)" "$@"	\
> +	   "$(LDFLAGS_vmlinux_relocs)";					\
>  	$(if $(ARCH_POSTLINK), $(MAKE) -f $(ARCH_POSTLINK) $@, true)
>  
>  targets += vmlinux.unstripped .vmlinux.export.o
> diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
> index 970ca10f8fa9..09c5222ccb94 100755
> --- a/scripts/link-vmlinux.sh
> +++ b/scripts/link-vmlinux.sh
> @@ -32,6 +32,7 @@ LD="$1"
>  KBUILD_LDFLAGS="$2"
>  LDFLAGS_vmlinux="$3"
>  VMLINUX="$4"
> +LDFLAGS_vmlinux_relocs="$5"
>  
>  is_enabled() {
>  	grep -q "^$1=y" include/config/auto.conf
> @@ -96,6 +97,11 @@ vmlinux_link()
>  		ldflags="${ldflags} ${wl}--strip-debug"
>  	fi
>  
> +	# Only the final link actually requires the relocations.
> +	if [ "${output}" = "${VMLINUX}" ] && [ -n "${LDFLAGS_vmlinux_relocs}" ]; then
> +		ldflags="${ldflags} ${wl}${LDFLAGS_vmlinux_relocs}"
> +	fi
> +

We don't use LDFLAGS_vmlinux_relocs anywhere else, so do we even need
this whole dance to just end up with the equivalent of

  if [ "${output}" = "${VMLINUX}" ] && is_enabled CONFIG_ARCH_VMLINUX_NEEDS_RELOCS; then
    ldflags="${ldflags} ${wl}--emit-relocs"
  fi

which would make this diff much simpler?

That being said, Sashiko makes a comment that may be relevant, have not
verified though:

  https://sashiko.dev/#/message/20260908-build-speedup-v1-6-5dc1ac01672d@kernel.org

-- 
Cheers,
Nathan


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
