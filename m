Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99ED7E7C4CE
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 15:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QpBEASF4S+Z165OWKEcIEiMTLR9FmWAUJfOOxzIUi2w=; b=xh+qi4AU8Jqm/3
	FcENrRD6awOnzs7Ja1IKQ0Q2X4487YkATymewDtOGccyjVMBhJoVFGVNiYPOleWdpBDiYj0q8P/v0
	XYnsvlDcOozjrZRpqWepMQpum5SontV8l6PmMJ2Na+VCYRs1b4nd25JpoQF6R7w3FfvzQFD/yAQSs
	u5KtjKIW294B6rY1ug4iK++ecP1jKr3B99z/UhrSIAjWnisTc/+NOyNMU8zZyIMZHKNeXR79tTBkh
	EjZIpQ7CRoD/6CF1tLMf67QvAZx7vEzxtMohi8gMKNl7loDB6NPWnT1P/1WxbwJqpvoKuNw+cGSMI
	vUMMQheCE0e1X+2hIo4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qo3gh-000Kve-1m;
	Wed, 04 Oct 2023 15:21:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qo3ge-000Kuy-22
	for linux-riscv@lists.infradead.org;
	Wed, 04 Oct 2023 15:21:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 828F261592;
	Wed,  4 Oct 2023 15:21:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EDD3C433C7;
	Wed,  4 Oct 2023 15:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696432879;
	bh=E7cZ/FlLXrub42neFGaJKxogpVkDZQoCdql2oG03Dhs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MK9P99jugfqTT2rLKg5PKvwR+LsClUy/rZn7V3D7wcvxx2LGbRO/hcO7GGdi7358G
	 qJSAVGul9GQMP89EIogrSM3x5w87pGv9vNfib+zvLmMZWb1Y55iN2Ex8DesdLHEonA
	 LFLbzu65qk9y+6Mr8n6RoKpMYcssjEJpP4RcFlS57t7bxax+/CLuTcZZl1OmhBBcxx
	 FjyG7YtZ0LaVLyuQUZOPiriSWWmD/GqDR44CJAIFgJ1Ke4WNPDCMcM8xwCkG5V30yy
	 QstugLNfTtMUZhafP8J7jb/z1Fv5Ri3K8nO6tZUaosbbOuDCE3RFTf5kEhF+Z7v3DE
	 /jFzs8J+6N22Q==
Date: Wed, 4 Oct 2023 08:21:16 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	conor@kernel.org, ndesaulniers@google.com, trix@redhat.com,
	samitolvanen@google.com, twd2.me@gmail.com,
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev,
	patches@lists.linux.dev
Subject: Re: [PATCH v3] RISC-V: build: Allow LTO to be selected
Message-ID: <20231004152116.GB2580510@dev-arch.thelio-3990X>
References: <20231003-riscv-lto-v3-1-8aca61a4ecb4@kernel.org>
 <f3e904ff-3ae1-b8ad-c400-7961f97b2b40@ghiti.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f3e904ff-3ae1-b8ad-c400-7961f97b2b40@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_082120_774267_E5BF5589 
X-CRM114-Status: GOOD (  42.56  )
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

Hi Alex,

On Wed, Oct 04, 2023 at 11:51:26AM +0200, Alexandre Ghiti wrote:
> Hi Nathan,
> 
> On 03/10/2023 21:16, Nathan Chancellor wrote:
> > From: Wende Tan <twd2.me@gmail.com>
> > 
> > Allow LTO to be selected for RISC-V, only when LLD >= 14, since there is an
> > issue [1] in prior LLD versions that prevents LLD to generate proper
> > machine code for RISC-V when writing `nop`s.
> > 
> > I have tested enabling LTO for `defconfig`. The LLD took ~2m21s and ~3GiB
> > on our Intel Xeon Gold 6140 server and produced an 18MiB Image. The image
> > can boot to shell using an archriscv rootfs on QEMU.
> > 
> > I have also tested it for `allyesconfig` without COMPILE_TEST, FTRACE,
> > KASAN, and GCOV. The LLD took ~7h03m and ~335GiB on the server,
> > successfully producing a 1.7GiB Image. Unfortunately, we cannot boot this
> > image because the `create_kernel_page_table()` -> `alloc_pmd_early()` ->
> > `BUG_ON()` logic limits the image to be < 1GiB. Maybe we can fix it in a
> > separate patch further.
> 
> 
> Yes, I see 2 solutions:
> 
> - either use PUD mappings, which is not that easy because we'd need the
> physical and virtual addresses to both be aligned on 1GB, which is very
> unlikely (the kernel is generally loaded at 0x8020_0000). We could use a
> relocatable kernel to offset the virtual kernel address though.
> 
> - or use a second early_pmd, which would make sense as we reserve 2GB for
> the kernel mapping anyway, but I'm not sure it would work without a bunch of
> modifications.
> 
> Let me know if that would help and I'll give it a try (unless you want to
> take care of that of course!).

Wende was the one who made that comment in the commit message, not me,
so I won't be looking into this further, as I have little skin in this
game :)

In my humble opinion, allyesconfig is not indicative of any real world
scenario when it comes to kernel configuration or size, so when things
don't work with it, I tend to think more along the lines of "don't do
that then". A distributor is generally either going to distribute a
kernel for one device (in which case, they may build every driver that
they need for that platform into the kernel and turn every other driver
off, which won't result in a large kernel size) or for multiple devices
(in which case, they would want to want to build with modules as much as
possible, which also won't result in a large kernel size). Neither of
those scenarios is really represented by allyesconfig.

Furthermore, I am not sure that is really an LTO specific problem, it
sounds like a generic "kernel is larger than 1GB" problem to me, which
LTO could potentially show easier due to more inlining and such.

Cheers,
Nathan

> > Disable LTO for arch/riscv/kernel/pi, as llvm-objcopy expects an ELF
> > object file when manipulating the files in that subfolder, rather than
> > LLVM bitcode.
> > 
> > [1] https://github.com/llvm/llvm-project/issues/50505, resolved by LLVM
> >      commit e63455d5e0e5 ("[MC] Use local MCSubtargetInfo in writeNops")
> > 
> > Tested-by: Wende Tan <twd2.me@gmail.com>
> > Signed-off-by: Wende Tan <twd2.me@gmail.com>
> > Co-developed-by: Nathan Chancellor <nathan@kernel.org>
> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> > ---
> > NOTE: I tested LLVM 14 through 18 with defconfig + full/thin LTO and
> > allmodconfig + thin LTO. allmodconfig + thin LTO with LLVM 15 and 16
> > shows
> > 
> >    ld.lld: error: section size decrease is too large
> > 
> > when linking vmlinux. This appears to be resolved in LLVM 17 with
> > https://github.com/llvm/llvm-project/commit/9d37ea95df1b84cca9b5e954d8964c976a5e303e
> > (I did not bisect but the commit message lines up with the issue). I
> > kept the existing version check because defconfig worked fine but we may
> > want to bump it to 17.0.0 if randconfigs trip over this.
> > 
> > Changes in v3:
> > - Disable LTO in arch/riscv/kernel/pi/Makefile, which was added to the
> >    kernel after the submission of v2. This change matches arm64.
> > - Link to v2: https://lore.kernel.org/r/20220512205545.992288-1-twd2.me@gmail.com/
> > 
> > Changes in v2:
> > - Some textual changes suggested by Nick.
> > - Drop the changes to `arch/riscv/Makefile`, since the LLVM issue is
> >    filed and resolved.
> > - Drop the unnecessary changes to `arch/riscv/kernel/vdso/Makefile`.
> > - Link to v1: https://lore.kernel.org/r/20210719205208.1023221-1-twd2.me@gmail.com/
> > ---
> >   arch/riscv/Kconfig            | 3 +++
> >   arch/riscv/kernel/pi/Makefile | 3 +++
> >   2 files changed, 6 insertions(+)
> > 
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index d607ab0f7c6d..523640f7441e 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -46,6 +46,9 @@ config RISCV
> >   	select ARCH_SUPPORTS_CFI_CLANG
> >   	select ARCH_SUPPORTS_DEBUG_PAGEALLOC if MMU
> >   	select ARCH_SUPPORTS_HUGETLBFS if MMU
> > +	# LLD >= 14: https://github.com/llvm/llvm-project/issues/50505
> > +	select ARCH_SUPPORTS_LTO_CLANG if LLD_VERSION >= 140000
> > +	select ARCH_SUPPORTS_LTO_CLANG_THIN if LLD_VERSION >= 140000
> >   	select ARCH_SUPPORTS_PAGE_TABLE_CHECK if MMU
> >   	select ARCH_SUPPORTS_PER_VMA_LOCK if MMU
> >   	select ARCH_USE_MEMTEST
> > diff --git a/arch/riscv/kernel/pi/Makefile b/arch/riscv/kernel/pi/Makefile
> > index 07915dc9279e..b75f150b923d 100644
> > --- a/arch/riscv/kernel/pi/Makefile
> > +++ b/arch/riscv/kernel/pi/Makefile
> > @@ -9,6 +9,9 @@ KBUILD_CFLAGS	:= $(subst $(CC_FLAGS_FTRACE),,$(KBUILD_CFLAGS)) -fpie \
> >   		   -fno-asynchronous-unwind-tables -fno-unwind-tables \
> >   		   $(call cc-option,-fno-addrsig)
> > +# Disable LTO
> > +KBUILD_CFLAGS	:= $(filter-out $(CC_FLAGS_LTO), $(KBUILD_CFLAGS))
> > +
> >   KBUILD_CFLAGS	+= -mcmodel=medany
> >   CFLAGS_cmdline_early.o += -D__NO_FORTIFY
> > 
> > ---
> > base-commit: 8a749fd1a8720d4619c91c8b6e7528c0a355c0aa
> > change-id: 20231003-riscv-lto-f013beed8587
> > 
> > Best regards,

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
